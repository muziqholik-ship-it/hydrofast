import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { getLocale } from "next-intl/server";
import { Link } from "@/i18n/navigation";
import { getAllAreas, getAreaContent } from "@/lib/areas";
import { BusinessContent } from "@/components/marketing/business-content";
import { JsonLd } from "@/components/json-ld";
import { pageMetadata, localeUrl } from "@/lib/seo";
import { localImageAspect } from "@/lib/image-size";
import { measureSectionImages } from "@/lib/content-images";
import type { Locale } from "@/i18n/routing";

// Content is CMS-managed (business_areas.content_json), so render per-request
// rather than prerendering — admin edits show up immediately.
export const dynamic = "force-dynamic";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ areaSlug: string }>;
}): Promise<Metadata> {
  const { areaSlug } = await params;
  const locale = (await getLocale()) as Locale;
  const area = await getAreaContent(areaSlug);
  if (!area) return {};
  const name = locale === "ko" ? area.name.ko : area.name.en ?? area.name.ko;
  const description = locale === "ko" ? area.summary.ko : area.summary.en ?? area.summary.ko;
  const image = area.cardImage || area.heroImage || undefined;
  return pageMetadata({
    locale,
    path: `/business/${areaSlug}`,
    title: name,
    description: description || undefined,
    images: image ? [image] : undefined,
  });
}

export default async function BusinessAreaPage({
  params,
}: {
  params: Promise<{ areaSlug: string }>;
}) {
  const { areaSlug } = await params;
  const locale = (await getLocale()) as Locale;
  const [area, all] = await Promise.all([getAreaContent(areaSlug), getAllAreas()]);
  if (!area) notFound();

  const L = (l: { ko: string; en?: string }) => (locale === "ko" ? l.ko : l.en ?? l.ko);
  const others = all.filter((a) => a.slug !== area.slug);

  // Resolved server-side so the hero and every content band pick their layout
  // before first paint. Unknown (uploaded) images fall back to the landscape
  // backdrop treatment, and the client re-measures them for the content bands.
  const [heroAspect, imageSizes] = await Promise.all([
    localImageAspect(area.heroImage),
    measureSectionImages(area.sections),
  ]);
  const uprightHero = Boolean(area.heroImage) && heroAspect !== undefined && heroAspect < 1.15;

  const breadcrumbJsonLd = {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      {
        "@type": "ListItem",
        position: 1,
        name: locale === "ko" ? "홈" : "Home",
        item: localeUrl(locale, "/"),
      },
      { "@type": "ListItem", position: 2, name: L(area.name) },
    ],
  };

  return (
    <div>
      <JsonLd data={breadcrumbJsonLd} />
      {/* Hero — a landscape photo works as a full-bleed backdrop, but stretching
          an upright one across a wide banner would show a thin slice of its
          middle. Those stand beside the copy at their own ratio instead. */}
      <section className="relative overflow-hidden border-b border-[var(--color-border)]">
        {area.heroImage && !uprightHero && (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={area.heroImage} alt={L(area.name)} className="absolute inset-0 h-full w-full object-cover" />
        )}
        <div className="absolute inset-0" style={{ background: `linear-gradient(90deg, ${area.accent}f2 0%, ${area.accent}cc 45%, ${area.accent}66 100%)` }} />
        <div className="relative mx-auto flex max-w-[1400px] flex-col gap-10 px-6 py-24 md:py-32 text-white lg:flex-row lg:items-center lg:justify-between">
          <div>
            <div className="flex items-center gap-3">
              <span className="text-5xl font-black opacity-70">{area.index}</span>
              <span className="text-sm font-semibold uppercase tracking-[0.2em] opacity-90">{area.nameEn}</span>
            </div>
            <h1 className="mt-4 max-w-3xl text-3xl md:text-5xl font-bold tracking-tight">{L(area.name)}</h1>
            {L(area.tagline) && <p className="mt-4 max-w-2xl text-base md:text-lg font-medium opacity-95">{L(area.tagline)}</p>}
            {L(area.summary) && <p className="mt-3 max-w-2xl text-sm leading-relaxed opacity-90">{L(area.summary)}</p>}
          </div>
          {uprightHero && (
            // eslint-disable-next-line @next/next/no-img-element
            <img
              src={area.heroImage}
              alt={L(area.name)}
              className="h-[clamp(240px,44vh,420px)] w-auto max-w-full shrink-0 self-start rounded-[var(--radius-card)] object-contain shadow-2xl ring-1 ring-white/25 lg:self-center"
            />
          )}
        </div>
      </section>

      {/* Rich content */}
      <BusinessContent area={area} locale={locale} imageSizes={imageSizes} />

      {/* Cross-links to other areas */}
      {others.length > 0 && (
        <section className="border-t border-[var(--color-border)] bg-[var(--color-surface-alt)]">
          <div className="mx-auto max-w-[1400px] px-6 py-16">
            <h2 className="mb-8 text-center text-sm font-semibold uppercase tracking-[0.2em] text-[var(--color-ink-soft)]">
              {locale === "ko" ? "다른 사업 분야" : "Other Business Areas"}
            </h2>
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
              {others.map((o) => (
                <Link
                  key={o.slug}
                  href={`/business/${o.slug}`}
                  className="group rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-5 transition-all hover:-translate-y-1 hover:shadow-lg"
                  style={{ borderTop: `3px solid ${o.accent}` }}
                >
                  <span className="text-xs font-black opacity-40">{o.index}</span>
                  <h3 className="mt-1 font-bold leading-snug">{L(o.name)}</h3>
                  <span className="mt-3 inline-block text-sm font-semibold" style={{ color: o.accent }}>
                    {locale === "ko" ? "자세히 보기 →" : "Learn more →"}
                  </span>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}
    </div>
  );
}
