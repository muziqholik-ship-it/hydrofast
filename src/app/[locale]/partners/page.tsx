import { getLocale, getTranslations } from "next-intl/server";
import { db } from "@/db/client";
import { manufacturers } from "@/db/schema";
import { asc, eq } from "drizzle-orm";
import { SectionHeading } from "@/components/marketing/section-heading";
import { PartnerCard } from "@/components/marketing/partner-card";
import { RevealGrid, RevealGridItem } from "@/components/marketing/reveal-grid";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

export const dynamic = "force-dynamic";

export async function generateMetadata(): Promise<Metadata> {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("meta.partners");
  return pageMetadata({ locale, path: "/partners", title: t("title"), description: t("description") });
}

export default async function PartnersPage() {
  const t = await getTranslations("partners");
  const rows = await db.select().from(manufacturers).where(eq(manufacturers.isActive, true)).orderBy(asc(manufacturers.sortOrder));

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={t("sectionTitle")} sub={t("sectionSub")} />
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
