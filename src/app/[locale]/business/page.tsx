import { getTranslations, setRequestLocale } from "next-intl/server";
import { SectionHeading } from "@/components/marketing/section-heading";
import { RevealGrid, RevealGridItem } from "@/components/marketing/reveal-grid";
import { Link } from "@/i18n/navigation";
import { getAllAreas } from "@/lib/areas";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

// Time-based ISR — see the caching-decision comment in src/app/[locale]/page.tsx.
export const revalidate = 300;

type PageProps = { params: Promise<{ locale: string }> };

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const locale = (await params).locale as Locale;
  const t = await getTranslations({ locale, namespace: "meta.business" });
  return pageMetadata({ locale, path: "/business", title: t("title"), description: t("description") });
}

export default async function BusinessOverviewPage({ params }: PageProps) {
  const { locale: rawLocale } = await params;
  setRequestLocale(rawLocale);
  const locale = rawLocale as Locale;
  const [tBiz, tCommon, areas] = await Promise.all([
    getTranslations("businessAreas"),
    getTranslations("common"),
    getAllAreas(),
  ]);

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={tBiz("sectionTitle")} as="h1" />
      <RevealGrid className="divide-y divide-[var(--color-border)] border-y border-[var(--color-border)]">
        {areas.map((area) => {
          const name = locale === "ko" ? area.name.ko : area.name.en ?? area.name.ko;
          const summary = locale === "ko" ? area.summary.ko : area.summary.en ?? area.summary.ko;
          return (
            <RevealGridItem key={area.slug}>
              <Link
                href={`/business/${area.slug}`}
                className="group grid grid-cols-1 gap-6 px-2 py-8 transition-colors hover:bg-[var(--color-surface-alt)] sm:px-4 md:grid-cols-[72px_1fr_300px] md:items-center md:gap-10 md:py-10"
              >
                <span className="font-mono text-3xl font-black md:text-4xl" style={{ color: area.accent }}>
                  {area.index}
                </span>
                <div>
                  <p className="text-[11px] font-semibold uppercase tracking-[0.15em]" style={{ color: area.accent }}>
                    {area.nameEn}
                  </p>
                  <h2 className="mt-1 text-xl font-bold leading-snug md:text-2xl">{name}</h2>
                  {summary && <p className="mt-2 max-w-2xl text-sm text-[var(--color-ink-soft)]">{summary}</p>}
                  <span className="mt-4 inline-block text-sm font-semibold" style={{ color: area.accent }}>
                    {tCommon("viewDetail")} →
                  </span>
                </div>
                {area.cardImage && (
                  <div className="relative order-first h-44 w-full overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface-alt)] md:order-none md:h-36">
                    {/* eslint-disable-next-line @next/next/no-img-element */}
                    <img
                      src={area.cardImage}
                      alt={name}
                      loading="lazy"
                      decoding="async"
                      className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
                    />
                  </div>
                )}
              </Link>
            </RevealGridItem>
          );
        })}
      </RevealGrid>
    </div>
  );
}
