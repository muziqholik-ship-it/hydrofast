import "server-only";
import { Resend } from "resend";
import { COMPANY } from "@/lib/company";

const ADMIN_INQUIRIES_URL = "https://www.hydrofast.co.kr/admin/inquiries";

export interface InquiryNotification {
  id: string;
  name: string;
  email: string;
  company: string | null;
  phone: string | null;
  businessAreaInterest: string | null;
  message: string;
}

/**
 * Emails new-inquiry details to the company inbox via Resend (Task 6.5).
 *
 * Deliberately NEVER throws: the inquiry row is already inserted by the time
 * this runs, and a lead must never be lost because the email pipeline is down
 * or unconfigured. Without RESEND_API_KEY / NOTIFY_FROM it logs a warning and
 * returns — the lead still lands in /admin/inquiries.
 */
export async function sendInquiryNotification(inquiry: InquiryNotification): Promise<void> {
  const apiKey = process.env.RESEND_API_KEY;
  const from = process.env.NOTIFY_FROM;

  if (!apiKey || !from) {
    console.warn(
      `Inquiry ${inquiry.id} stored, but notification email was NOT sent: ` +
        `${!apiKey ? "RESEND_API_KEY" : "NOTIFY_FROM"} is not set (see .env.example / TODO.md).`
    );
    return;
  }

  const lines = [
    `이름: ${inquiry.name}`,
    `이메일: ${inquiry.email}`,
    `회사명: ${inquiry.company ?? "-"}`,
    `연락처: ${inquiry.phone ?? "-"}`,
    `관심 분야: ${inquiry.businessAreaInterest ?? "-"}`,
    "",
    "문의 내용:",
    inquiry.message,
    "",
    `관리자 페이지에서 확인: ${ADMIN_INQUIRIES_URL}`,
  ];

  try {
    const resend = new Resend(apiKey);
    const { error } = await resend.emails.send({
      from,
      to: COMPANY.email,
      replyTo: inquiry.email,
      subject: `[홈페이지 문의] ${inquiry.name}${inquiry.company ? ` · ${inquiry.company}` : ""}`,
      text: lines.join("\n"),
    });
    if (error) {
      console.warn(`Inquiry ${inquiry.id} stored, but Resend rejected the notification:`, error);
    }
  } catch (err) {
    console.warn(`Inquiry ${inquiry.id} stored, but sending the notification email failed:`, err);
  }
}
