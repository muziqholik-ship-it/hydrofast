import { getLocale, getTranslations } from "next-intl/server";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

export async function generateMetadata(): Promise<Metadata> {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("meta.privacy");
  return pageMetadata({ locale, path: "/privacy", title: t("title"), description: t("description") });
}

/**
 * Stub page so the footer 개인정보처리방침 link has somewhere to land.
 * The full PIPA privacy policy content is written in Workstream 06.
 */
export default async function PrivacyPage() {
  const t = await getTranslations("privacyPage");

  return (
    <section className="mx-auto max-w-[1400px] px-6 py-24">
      <h1 className="text-2xl font-bold tracking-tight md:text-3xl">{t("title")}</h1>
      <p className="mt-4 text-sm text-[var(--color-ink-soft)]">{t("preparing")}</p>
    </section>
  );
}
