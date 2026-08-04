import { getTranslations, setRequestLocale } from "next-intl/server";
import { db } from "@/db/client";
import { caseStudies, certifications, clientLogos, manufacturers } from "@/db/schema";
import type { CaseStudy } from "@/db/schema";
import { asc, desc, eq } from "drizzle-orm";
import { getNumericSettings } from "@/lib/settings";
import { getCaseStudyImageCounts } from "@/lib/case-study-images";
import { publicImageUrl } from "@/lib/image-url";
import { HomeHero } from "@/components/marketing/home-hero";
import { SectionHeading } from "@/components/marketing/section-heading";
import { AreaCard } from "@/components/marketing/area-card";
import { getAllAreas } from "@/lib/areas";
import { CaseStudyCard } from "@/components/marketing/case-study-card";
import { CertificationStrip } from "@/components/marketing/certification-strip";
import { ClosingCta } from "@/components/marketing/closing-cta";
import { LogoMarquee } from "@/components/marketing/logo-marquee";
import { StatCounter } from "@/components/marketing/stat-counter";
import { ScrollRevealGrid, ScrollRevealItem } from "@/components/motion/scroll-reveal-grid";
import { CaseCardParallax } from "@/components/motion/case-card-parallax";
import { Link } from "@/i18n/navigation";
import type { Locale } from "@/i18n/routing";

/**
 * Multiple photos of one project exist as separate caseStudies rows, so a
 * blind `limit 6` shows the same project several times. Keep the newest row
 * per (clientName, titleKo) until the data model holds many images per
 * project (see TODO.md).
 */
function dedupeCaseStudies(rows: CaseStudy[], limit: number): CaseStudy[] {
  const seen = new Set<string>();
  const unique: CaseStudy[] = [];
  for (const row of rows) {
    const key = `${row.clientName} ${row.titleKo}`;
    if (seen.has(key)) continue;
    seen.add(key);
    unique.push(row);
    if (unique.length === limit) break;
  }
  return unique;
}

/**
 * Hero photo: the 한화오션 propeller-installation build's cover in Storage —
 * a real ETO project with a worker in frame (chosen over the other studio
 * shots for scale and human context). If the object is ever removed the hero
 * falls back to its blueprint-grid panel, so this is safe to leave pinned;
 * swap the path here to feature a different build.
 */
const HERO_IMAGE_PATH = "d0f231d3-d759-4fbe-8cd8-1a4ad6f550b1/card.webp";

/*
 * Marketing-page caching decision (applies to /, /about, /cases, /partners):
 * time-based ISR via `export const revalidate = 300` was chosen over calling
 * revalidatePath()/revalidateTag() from the admin mutations. Admin edits are
 * infrequent and a ≤5-minute delay before they appear on the public site is
 * acceptable, while the time-based approach keeps the many admin actions
 * untouched and can't miss a mutation path. `setRequestLocale` (here and in
 * the [locale] layout) is required for this to work — without it next-intl
 * reads the locale from request headers, which forces dynamic rendering and
 * silently turns `revalidate` into a no-op. /products stays force-dynamic
 * because it powers live search via searchParams.
 */
export const revalidate = 300;

export default async function HomePage({ params }: { params: Promise<{ locale: string }> }) {
  const { locale: rawLocale } = await params;
  setRequestLocale(rawLocale);
  const locale = rawLocale as Locale;
  const [tHero, tBiz, tCerts, tCases, tClients, tPartners, tCta, tCommon] = await Promise.all([
    getTranslations("hero"),
    getTranslations("businessAreas"),
    getTranslations("certifications"),
    getTranslations("cases"),
    getTranslations("clients"),
    getTranslations("partners"),
    getTranslations("closingCta"),
    getTranslations("common"),
  ]);

  const [areas, recentCases, certRows, logos, partnerBrands, stats] = await Promise.all([
    getAllAreas(),
    db
      .select()
      .from(caseStudies)
      .where(eq(caseStudies.isPublished, true))
      .orderBy(desc(caseStudies.createdAt))
      .limit(18),
    db.select().from(certifications).orderBy(asc(certifications.sortOrder)),
    db.select().from(clientLogos).where(eq(clientLogos.isPublished, true)).orderBy(asc(clientLogos.sortOrder)),
    db.select().from(manufacturers).where(eq(manufacturers.isActive, true)).orderBy(asc(manufacturers.sortOrder)),
    getNumericSettings(),
  ]);

  const highlightCases = dedupeCaseStudies(recentCases, 6);
  const caseImageCounts = await getCaseStudyImageCounts(highlightCases.map((c) => c.id));
  const yearsInBusiness = new Date().getFullYear() - stats.founded_year;
  // Patents stay on /about; the homepage band shows certifications/qualifications only.
  const homepageCerts = certRows.filter((c) => c.category !== "patent");

  const heroSpecs = [
    { label: tHero("specPressureLabel"), value: `${stats.max_pressure_bar.toLocaleString("en-US")} bar` },
    { label: tHero("specCalLabel"), value: tHero("specCalValue") },
    { label: tHero("specNuclearLabel"), value: tHero("specNuclearValue") },
    { label: tHero("specSinceLabel"), value: String(stats.founded_year) },
  ];

  return (
    <>
      <HomeHero
        kicker={tHero("kicker")}
        title={tHero("title")}
        desc={tHero("desc")}
        ctaProducts={tHero("ctaProducts")}
        ctaContact={tHero("ctaContact")}
        specs={heroSpecs}
        imageUrl={publicImageUrl("case-study-images", HERO_IMAGE_PATH)}
        imageAlt={tHero("imageAlt")}
        pressureBar={stats.max_pressure_bar}
        readoutLabel={tHero("specPressureLabel")}
      />

      <section className="border-y border-[var(--color-border)] bg-[var(--color-surface-alt)] py-10">
        <div className="mx-auto grid max-w-[1400px] grid-cols-1 gap-6 px-6 sm:grid-cols-3 sm:gap-8">
          <StatCounter target={yearsInBusiness} suffix="+" label={tHero("statYears")} />
          <StatCounter target={stats.max_pressure_bar} suffix=" bar" label={tHero("statPressure")} />
          <StatCounter target={partnerBrands.length} suffix="+" label={tHero("statPartners")} />
        </div>
      </section>

      <section className="mx-auto max-w-[1400px] px-6 py-20">
        <SectionHeading title={tBiz("sectionTitle")} />
        <ScrollRevealGrid className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5">
          {areas.map((area) => (
            <ScrollRevealItem key={area.slug}>
              <AreaCard area={area} locale={locale} />
            </ScrollRevealItem>
          ))}
        </ScrollRevealGrid>
      </section>

      {homepageCerts.length > 0 && (
        <CertificationStrip
          certs={homepageCerts}
          locale={locale}
          title={tCerts("sectionTitle")}
          linkLabel={tCommon("viewDetail")}
        />
      )}

      {highlightCases.length > 0 && (
        <section className="mx-auto max-w-[1400px] px-6 py-20">
          <SectionHeading title={tCases("sectionTitle")} sub={tCases("sectionSub")} />
          {/* Rise + image-settle is scrub-linked per card (report §3), so no
              batch reveal here — the parallax IS the entrance. */}
          <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
            {highlightCases.map((cs) => (
              <CaseCardParallax key={cs.id}>
                <CaseStudyCard
                  caseStudy={cs}
                  title={locale === "ko" ? cs.titleKo : cs.titleEn ?? cs.titleKo}
                  description={locale === "ko" ? cs.descriptionKo : cs.descriptionEn ?? cs.descriptionKo}
                  imageCount={caseImageCounts[cs.id] ?? 0}
                  href={`/cases#case-${cs.id}`}
                />
              </CaseCardParallax>
            ))}
          </div>
          <div className="mt-8 text-center">
            <Link href="/cases" className="text-sm font-semibold text-[var(--color-steel-light)]">
              {tCommon("viewAll")} →
            </Link>
          </div>
        </section>
      )}

      {partnerBrands.length > 0 && (
        <section className="border-y border-[var(--color-border)] bg-[var(--color-surface-alt)] py-16">
          <div className="mx-auto max-w-[1400px] px-6">
            <h2 className="mb-6 text-center text-sm font-semibold uppercase tracking-wide text-[var(--color-ink-soft)]">
              {tPartners("sectionTitle")}
            </h2>
          </div>
          <LogoMarquee logos={partnerBrands.filter((m) => m.logoPath).map((m) => ({ id: m.id, name: m.name, logoPath: m.logoPath! }))} bucket="partner-logos" />
        </section>
      )}

      {logos.length > 0 && (
        <section className="py-16">
          <div className="mx-auto max-w-[1400px] px-6">
            <h2 className="mb-6 text-center text-sm font-semibold uppercase tracking-wide text-[var(--color-ink-soft)]">
              {tClients("sectionTitle")}
            </h2>
          </div>
          <LogoMarquee logos={logos.map((l) => ({ id: l.id, name: l.name, logoPath: l.logoPath }))} bucket="client-logos" />
        </section>
      )}

      <ClosingCta
        title={tCta("title")}
        sub={tCta("sub")}
        primaryLabel={tCta("primary")}
        secondaryLabel={tCta("secondary")}
      />
    </>
  );
}
