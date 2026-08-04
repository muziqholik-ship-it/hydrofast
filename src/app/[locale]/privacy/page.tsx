import { getLocale, getTranslations } from "next-intl/server";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";
import { PRIVACY_POLICY } from "./policy-content";

export async function generateMetadata(): Promise<Metadata> {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("meta.privacy");
  return pageMetadata({ locale, path: "/privacy", title: t("title"), description: t("description") });
}

export default async function PrivacyPage() {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("privacyPage");
  const policy = PRIVACY_POLICY[locale];

  return (
    <div className="mx-auto max-w-3xl px-6 py-16">
      <h1 className="text-2xl font-bold tracking-tight md:text-3xl">{t("title")}</h1>
      <p className="mt-6 text-sm leading-relaxed text-[var(--color-ink-soft)]">{policy.intro}</p>

      {policy.sections.map((section) => (
        <section key={section.heading} className="mt-8">
          <h2 className="text-base font-bold">{section.heading}</h2>
          {section.paragraphs?.map((p) => (
            <p key={p} className="mt-2 text-sm leading-relaxed text-[var(--color-ink-soft)]">
              {p}
            </p>
          ))}
          {section.list && (
            <ul className="mt-2 list-disc space-y-1 pl-5 text-sm leading-relaxed text-[var(--color-ink-soft)]">
              {section.list.map((item) => (
                <li key={item}>{item}</li>
              ))}
            </ul>
          )}
          {section.afterList?.map((p) => (
            <p key={p} className="mt-2 text-sm leading-relaxed text-[var(--color-ink-soft)]">
              {p}
            </p>
          ))}
        </section>
      ))}

      <p className="mt-10 text-sm font-semibold">{policy.effectiveDate}</p>
      <p className="mt-6 border-t border-[var(--color-border)] pt-4 text-xs text-[var(--color-ink-soft)]">
        {policy.reviewNote}
      </p>
    </div>
  );
}
