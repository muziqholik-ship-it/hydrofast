"use server";

import { db } from "@/db/client";
import { inquiries } from "@/db/schema";
import { and, count, eq, gte } from "drizzle-orm";
import { sendInquiryNotification } from "@/lib/notify";

/**
 * Error codes translated client-side via contactPage.errors in messages/*.json
 * (Task 6.4) — the action must stay locale-agnostic.
 */
export type InquiryErrorCode =
  | "missing_fields"
  | "consent_required"
  | "invalid_email"
  | "too_long"
  | "too_fast"
  | "rate_limited"
  | "server_error";

export interface SubmitInquiryResult {
  success: boolean;
  errorCode?: InquiryErrorCode;
}

const MAX_LENGTHS = { name: 100, email: 254, company: 100, phone: 100, message: 5000 } as const;
const EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const MIN_FILL_MS = 3_000;
const RATE_LIMIT_WINDOW_MS = 10 * 60 * 1000;
const RATE_LIMIT_MAX = 3;

export async function submitInquiry(formData: FormData): Promise<SubmitInquiryResult> {
  // Honeypot (Task 6.3): humans never see the `website` field. Pretend success
  // so bots get no signal, insert nothing.
  if (String(formData.get("website") ?? "").trim() !== "") {
    return { success: true };
  }

  const name = String(formData.get("name") ?? "").trim();
  const email = String(formData.get("email") ?? "").trim();
  const company = String(formData.get("company") ?? "").trim();
  const phone = String(formData.get("phone") ?? "").trim();
  const businessAreaInterest = String(formData.get("businessAreaInterest") ?? "").trim();
  const message = String(formData.get("message") ?? "").trim();

  if (!name || !email || !message) {
    return { success: false, errorCode: "missing_fields" };
  }
  // Never trust the client-side `required` on the checkbox alone (Task 6.2).
  if (formData.get("privacyConsent") !== "on") {
    return { success: false, errorCode: "consent_required" };
  }
  if (
    name.length > MAX_LENGTHS.name ||
    email.length > MAX_LENGTHS.email ||
    company.length > MAX_LENGTHS.company ||
    phone.length > MAX_LENGTHS.phone ||
    message.length > MAX_LENGTHS.message
  ) {
    return { success: false, errorCode: "too_long" };
  }
  if (!EMAIL_RE.test(email)) {
    return { success: false, errorCode: "invalid_email" };
  }

  // Time-gate (Task 6.3): the form stamps a render-time epoch. A missing/garbled
  // stamp means the form was never rendered (bot POST) — swallow like the honeypot.
  const renderedAt = Number(formData.get("renderedAt"));
  if (!Number.isFinite(renderedAt) || renderedAt <= 0) {
    return { success: true };
  }
  if (Date.now() - renderedAt < MIN_FILL_MS) {
    return { success: false, errorCode: "too_fast" };
  }

  let inserted: { id: string };
  try {
    // Durable rate limit without new infra (Task 6.3): count recent rows from
    // the same email. IP-based limiting would need middleware/Upstash — TODO.md.
    const since = new Date(Date.now() - RATE_LIMIT_WINDOW_MS);
    const [recent] = await db
      .select({ value: count() })
      .from(inquiries)
      .where(and(eq(inquiries.email, email), gte(inquiries.createdAt, since)));
    if ((recent?.value ?? 0) >= RATE_LIMIT_MAX) {
      return { success: false, errorCode: "rate_limited" };
    }

    [inserted] = await db
      .insert(inquiries)
      .values({
        name,
        email,
        company: company || null,
        phone: phone || null,
        businessAreaInterest: businessAreaInterest || null,
        message,
        privacyConsentAt: new Date(),
      })
      .returning({ id: inquiries.id });
  } catch (err) {
    console.error("Failed to store inquiry:", err);
    return { success: false, errorCode: "server_error" };
  }

  // Fire-and-forget AFTER the insert — a broken email pipeline must never lose
  // a lead (Task 6.5). sendInquiryNotification never throws.
  await sendInquiryNotification({
    id: inserted.id,
    name,
    email,
    company: company || null,
    phone: phone || null,
    businessAreaInterest: businessAreaInterest || null,
    message,
  });

  return { success: true };
}
