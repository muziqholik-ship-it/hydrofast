import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { getLocale } from "next-intl/server";
import { Link } from "@/i18n/navigation";
import { getAreaContent } from "@/lib/areas";
import { getCustomProject, getAreaProjects } from "@/content/custom-projects";
import { ContentSections } from "@/components/marketing/business-content";
import { measureSectionImages } from "@/lib/content-images";
import { JsonLd } from "@/components/json-ld";
import { pageMetadata, localeUrl } from "@/lib/seo";
import type { Locale } from "@/i18n/routing";

// The parent area (name/accent shown in the hero) is CMS-managed, so render
// per-request like /business/[areaSlug] — the project content itself is the
// hand-authored src/content/custom-projects.ts module.
export const dynamic = "force-dynamic";

export async function generateMetadata({
  params,
}: {
  params: Promise<{ areaSlug: string; projectSlug: string }>;
}): Promise<Metadata> {
  const { areaSlug, projectSlug } = await params;
  const project = getCustomProject(areaSlug, projectSlug);
  if (!project) return {};
  const locale = (await getLocale()) as Locale;
  const name = locale === "ko" ? project.name.ko : project.name.en ?? project.name.ko;
  const description = locale === "ko" ? project.summary.ko : project.summary.en ?? project.summary.ko;
  return pageMetadata({
    locale,
    path: `/business/${areaSlug}/${projectSlug}`,
    title: name,
    description,
    images: project.cardImage ? [project.cardImage] : undefined,
  });
}

export default async function CustomProjectPage({
  params,
}: {
  params: Promise<{ areaSlug: string; projectSlug: string }>;
}) {
  const { areaSlug, projectSlug } = await params;
  const project = getCustomProject(areaSlug, projectSlug);
  if (!project) notFound();

  const locale = (await getLocale()) as Locale;
  // Measured server-side so each image band is justified on first paint.
  const [area, imageSizes] = await Promise.all([
    getAreaContent(areaSlug),
    measureSectionImages(project.sections),
  ]);
  if (!area) notFound();

  const L = (l: { ko: string; en?: string }) => (locale === "ko" ? l.ko : l.en ?? l.ko);
  const siblings = getAreaProjects(areaSlug).filter((p) => p.slug !== project.slug);

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
      {
        "@type": "ListItem",
        position: 2,
        name: L(area.name),
        item: localeUrl(locale, `/business/${areaSlug}`),
      },
      { "@type": "ListItem", position: 3, name: L(project.name) },
    ],
  };

  return (
    <div>
      <JsonLd data={breadcrumbJsonLd} />
      {/* Hero */}
      <section className="relative overflow-hidden border-b border-[var(--color-border)]">
        {project.heroImage && (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={project.heroImage} alt={L(project.name)} className="absolute inset-0 h-full w-full object-cover" />
        )}
        <div
          className="absolute inset-0"
          style={{ background: `linear-gradient(90deg, ${area.accent}f2 0%, ${area.accent}cc 45%, ${area.accent}66 100%)` }}
        />
        <div className="relative mx-auto max-w-[1400px] px-6 py-20 md:py-28 text-white">
          <Link
            href={`/business/${areaSlug}`}
            className="inline-flex items-center gap-1 text-sm font-semibold opacity-90 transition-opacity hover:opacity-100"
          >
            ← {L(area.name)}
          </Link>
          <div className="mt-4 flex items-center gap-3">
            <span className="text-sm font-semibold uppercase tracking-[0.2em] opacity-90">{project.nameEn}</span>
          </div>
          <h1 className="mt-2 max-w-3xl text-3xl md:text-5xl font-bold tracking-tight">{L(project.name)}</h1>
          {L(project.tagline) && (
            <p className="mt-4 max-w-2xl text-base md:text-lg font-medium opacity-95">{L(project.tagline)}</p>
          )}
          <div className="mt-8 flex flex-wrap gap-3">
            {project.keySpecs.map((spec, i) => (
              <div key={i} className="rounded-[var(--radius-card)] bg-white/15 px-4 py-2.5 backdrop-blur-sm">
                <p className="text-[11px] font-semibold uppercase tracking-wider opacity-80">{L(spec.label)}</p>
                <p className="mt-0.5 text-sm md:text-base font-bold">{L(spec.value)}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Rich content */}
      <ContentSections
        sections={project.sections}
        accent={area.accent}
        locale={locale}
        imageSizes={imageSizes}
      />

      {/* Other custom projects in this area */}
      {siblings.length > 0 && (
        <section className="border-t border-[var(--color-border)] bg-[var(--color-surface-alt)]">
          <div className="mx-auto max-w-[1400px] px-6 py-16">
            <h2 className="mb-8 text-center text-sm font-semibold uppercase tracking-[0.2em] text-[var(--color-ink-soft)]">
              {locale === "ko" ? "다른 맞춤 제작 사례" : "Other Custom Builds"}
            </h2>
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3">
              {siblings.map((p) => (
                <Link
                  key={p.slug}
                  href={`/business/${areaSlug}/${p.slug}`}
                  className="group overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] transition-all hover:-translate-y-1 hover:shadow-lg"
                  style={{ borderTop: `3px solid ${area.accent}` }}
                >
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={p.cardImage} alt={L(p.name)} loading="lazy" className="aspect-[16/9] w-full object-cover" />
                  <div className="p-5">
                    <h3 className="font-bold leading-snug">{L(p.name)}</h3>
                    <p className="mt-1 line-clamp-2 text-sm text-[var(--color-ink-soft)]">{L(p.tagline)}</p>
                    <span className="mt-3 inline-block text-sm font-semibold" style={{ color: area.accent }}>
                      {locale === "ko" ? "자세히 보기 →" : "Learn more →"}
                    </span>
                  </div>
                </Link>
              ))}
            </div>
          </div>
        </section>
      )}
    </div>
  );
}
