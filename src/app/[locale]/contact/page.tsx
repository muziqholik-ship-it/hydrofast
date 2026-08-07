import { getLocale, getTranslations } from "next-intl/server";
import { COMPANY } from "@/lib/company";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

export async function generateMetadata(): Promise<Metadata> {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("meta.contact");
  return pageMetadata({ locale, path: "/contact", title: t("title"), description: t("description") });
}

const GUIDE_KEYS = ["1", "2", "3", "4", "5"] as const;

export default async function ContactPage() {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("contactPage");
  const tFooter = await getTranslations("footer");
  const ko = locale === "ko";

  return (
    <div className="mx-auto max-w-3xl px-6 py-16">
      <h1 className="text-3xl md:text-4xl font-bold tracking-tight" dangerouslySetInnerHTML={{ __html: t("title") }} />
      <p className="mt-3 text-[var(--color-ink-soft)]">{t("sub")}</p>

      <div className="mt-10 grid gap-4 sm:grid-cols-2">
        <a
          href={`tel:${COMPANY.phone}`}
          className="rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-6 transition-colors hover:border-[var(--color-steel-light)]"
        >
          <div className="text-sm font-semibold text-[var(--color-ink-soft)]">{t("phoneTitle")}</div>
          <div className="mt-2 text-2xl font-bold tracking-tight text-[var(--color-steel-light)]">{COMPANY.phone}</div>
          <div className="mt-2 text-xs text-[var(--color-ink-soft)]">{t("phoneNote")}</div>
        </a>
        <a
          href={`mailto:${COMPANY.email}`}
          className="rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-6 transition-colors hover:border-[var(--color-steel-light)]"
        >
          <div className="text-sm font-semibold text-[var(--color-ink-soft)]">{t("emailTitle")}</div>
          <div className="mt-2 text-xl font-bold tracking-tight text-[var(--color-steel-light)] break-all">
            {COMPANY.email}
          </div>
          <div className="mt-2 text-xs text-[var(--color-ink-soft)]">{t("emailNote")}</div>
        </a>
      </div>

      <section className="mt-12">
        <h2 className="text-xl font-bold tracking-tight">{t("guideTitle")}</h2>
        <p className="mt-2 text-sm text-[var(--color-ink-soft)]">{t("guideSub")}</p>
        <ol className="mt-6 flex flex-col gap-3">
          {GUIDE_KEYS.map((n) => (
            <li
              key={n}
              className="flex gap-4 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-4"
            >
              <span className="mt-0.5 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-[var(--color-steel-light)] text-xs font-bold text-white">
                {n}
              </span>
              <div>
                <div className="text-sm font-semibold">{t(`guide${n}Title`)}</div>
                <div className="mt-1 text-sm text-[var(--color-ink-soft)]">{t(`guide${n}Desc`)}</div>
              </div>
            </li>
          ))}
        </ol>
      </section>

      <section className="mt-12 border-t border-[var(--color-border)] pt-6">
        <h2 className="text-sm font-semibold">{t("visitTitle")}</h2>
        <div className="mt-3 text-sm text-[var(--color-ink-soft)] leading-relaxed">
          <p>{tFooter("address", { value: ko ? COMPANY.addressKo : COMPANY.addressEn })}</p>
          <p>{tFooter("fax", { value: COMPANY.fax })}</p>
          <p className="mt-2">{tFooter("businessHours")}</p>
        </div>
      </section>
    </div>
  );
}
