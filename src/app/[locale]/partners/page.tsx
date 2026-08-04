import { getTranslations, setRequestLocale } from "next-intl/server";
import { db } from "@/db/client";
import { manufacturers } from "@/db/schema";
import { asc, eq } from "drizzle-orm";
import { SectionHeading } from "@/components/marketing/section-heading";
import { PartnerCard } from "@/components/marketing/partner-card";
import { RevealGrid, RevealGridItem } from "@/components/marketing/reveal-grid";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

// Time-based ISR — see the caching-decision comment in src/app/[locale]/page.tsx.
export const revalidate = 300;

type PageProps = { params: Promise<{ locale: string }> };

export async function generateMetadata({ params }: PageProps): Promise<Metadata> {
  const locale = (await params).locale as Locale;
  const t = await getTranslations({ locale, namespace: "meta.partners" });
  return pageMetadata({ locale, path: "/partners", title: t("title"), description: t("description") });
}

export default async function PartnersPage({ params }: PageProps) {
  setRequestLocale((await params).locale);
  const t = await getTranslations("partners");
  const rows = await db.select().from(manufacturers).where(eq(manufacturers.isActive, true)).orderBy(asc(manufacturers.sortOrder));

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={t("sectionTitle")} sub={t("sectionSub")} as="h1" />
      <RevealGrid className="grid grid-cols-2 gap-5 sm:grid-cols-3 lg:grid-cols-5">
        {rows.map((m) => (
          <RevealGridItem key={m.id}>
            <PartnerCard manufacturer={m} />
          </RevealGridItem>
        ))}
      </RevealGrid>
    </div>
  );
}
