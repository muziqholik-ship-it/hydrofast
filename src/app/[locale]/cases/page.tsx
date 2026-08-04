import { getTranslations, setRequestLocale } from "next-intl/server";
import { db } from "@/db/client";
import { caseStudies } from "@/db/schema";
import { eq, asc } from "drizzle-orm";
import { SectionHeading } from "@/components/marketing/section-heading";
import { CaseStudyCard } from "@/components/marketing/case-study-card";
import { RevealGrid, RevealGridItem } from "@/components/marketing/reveal-grid";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";
import { getCaseStudyImageCounts } from "@/lib/case-study-images";

// Time-based ISR — see the caching-decision comment in src/app/[locale]/page.tsx.
export const revalidate = 300;

type PageProps = { params: Promise<{ locale: string }> };

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const locale = (await params).locale as Locale;
  const t = await getTranslations({ locale, namespace: "meta.cases" });
  return pageMetadata({ locale, path: "/cases", title: t("title"), description: t("description") });
}

export default async function CasesPage({ params }: PageProps) {
  const { locale: rawLocale } = await params;
  setRequestLocale(rawLocale);
  const locale = rawLocale as Locale;
  const t = await getTranslations("cases");

  const rows = await db.select().from(caseStudies).where(eq(caseStudies.isPublished, true)).orderBy(asc(caseStudies.sortOrder));
  const imageCounts = await getCaseStudyImageCounts(rows.map((r) => r.id));

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={t("sectionTitle")} sub={t("sectionSub")} as="h1" />
      <RevealGrid className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {rows.map((cs) => (
          <RevealGridItem key={cs.id}>
            {/* Anchor target for homepage card links (/cases#case-<id>); offset clears the sticky nav. */}
            <div id={`case-${cs.id}`} className="scroll-mt-24" />
            <CaseStudyCard
              caseStudy={cs}
              title={locale === "ko" ? cs.titleKo : cs.titleEn ?? cs.titleKo}
              description={locale === "ko" ? cs.descriptionKo : cs.descriptionEn ?? cs.descriptionKo}
              imageCount={imageCounts[cs.id] ?? 0}
            />
          </RevealGridItem>
        ))}
      </RevealGrid>
    </div>
  );
}
