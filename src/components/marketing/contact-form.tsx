"use client";

import { useState, useTransition } from "react";
import { useTranslations } from "next-intl";
import { Link } from "@/i18n/navigation";
import { submitInquiry, type SubmitInquiryResult } from "@/app/[locale]/contact/actions";
import type { BusinessArea } from "@/db/schema";

export function ContactForm({ businessAreas }: { businessAreas: BusinessArea[] }) {
  const t = useTranslations("contactPage");
  const tErrors = useTranslations("contactPage.errors");
  const [isPending, startTransition] = useTransition();
  const [result, setResult] = useState<SubmitInquiryResult | null>(null);
  // Time-gate stamp (spam hardening): submissions under 3s after render are rejected server-side.
  const [renderedAt] = useState(() => Date.now());

  function handleSubmit(formData: FormData) {
    startTransition(async () => {
      const res = await submitInquiry(formData);
      setResult(res);
    });
  }

  if (result?.success) {
    return (
      <p className="rounded-[var(--radius-card)] border border-[var(--color-steel-light)] bg-[var(--color-surface)] p-6 text-center text-sm">
        {t("formSuccess")}
      </p>
    );
  }

  return (
    <form action={handleSubmit} className="relative flex flex-col gap-4">
      <div className="grid grid-cols-2 gap-4">
        <input name="name" required placeholder={t("formName")} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm" />
        <input name="company" placeholder={t("formCompany")} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm" />
      </div>
      <div className="grid grid-cols-2 gap-4">
        <input type="email" name="email" required placeholder={t("formEmail")} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm" />
        <input name="phone" placeholder={t("formPhone")} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm" />
      </div>
      <select name="businessAreaInterest" className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm">
        <option value="">{t("formBusinessArea")}</option>
        {businessAreas.map((ba) => (
          <option key={ba.id} value={ba.nameKo}>
            {ba.nameKo}
          </option>
        ))}
      </select>
      <textarea name="message" required rows={5} placeholder={t("formMessage")} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2.5 text-sm" />

      {/* Honeypot — visually hidden, ignored by humans, filled by naive bots. */}
      <div aria-hidden="true" className="absolute -left-[9999px] h-px w-px overflow-hidden">
        <label>
          Website
          <input type="text" name="website" tabIndex={-1} autoComplete="off" />
        </label>
      </div>
      <input type="hidden" name="renderedAt" value={renderedAt} />

      <label className="flex items-start gap-2 text-sm">
        <input type="checkbox" name="privacyConsent" required className="mt-0.5 accent-[var(--color-steel-light)]" />
        <span>
          {t.rich("formConsent", {
            link: (chunks) => (
              <Link href="/privacy" target="_blank" className="font-semibold underline underline-offset-2">
                {chunks}
              </Link>
            ),
          })}
        </span>
      </label>

      {result?.success === false && (
        <p className="text-sm text-[var(--color-safety-orange)]">
          {result.errorCode ? tErrors(result.errorCode) : t("formError")}
        </p>
      )}

      <button
        type="submit"
        disabled={isPending}
        className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] py-3 text-sm font-semibold text-white disabled:opacity-60"
      >
        {isPending ? "..." : t("formSubmit")}
      </button>
    </form>
  );
}
