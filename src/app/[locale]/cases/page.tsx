import { getTranslations, setRequestLocale } from "next-intl/server";
import { db } from "@/db/client";
import { caseStudies } from "@/db/schema";
import { eq, asc } from "drizzle-orm";
import { SectionHeading } from "@/components/marketing/section-heading";
import { CaseCollage } from "@/components/marketing/case-collage";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";
import { publicImageUrl } from "@/lib/image-url";
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

  // The collage sizes an expanded tile to its photo's true ratio, read off the
  // decoded file. The editorial "21-9"-style value only covers the gap before
  // that first decode.
  const parseAspect = (value: string) => {
    const [w, h] = value.split("-").map(Number);
    return w > 0 && h > 0 ? w / h : undefined;
  };

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={t("sectionTitle")} sub={t("sectionSub")} as="h1" />
      <CaseCollage
        items={rows.map((cs) => ({
          id: cs.id,
          clientName: cs.clientName,
          title: locale === "ko" ? cs.titleKo : cs.titleEn ?? cs.titleKo,
          description: locale === "ko" ? cs.descriptionKo : cs.descriptionEn ?? cs.descriptionKo,
          imageUrl: publicImageUrl("case-study-images", cs.imagePath),
          aspect: parseAspect(cs.aspectRatio),
          imageCount: imageCounts[cs.id] ?? 0,
        }))}
      />
    </div>
  );
}
