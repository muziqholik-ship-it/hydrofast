import { Link } from "@/i18n/navigation";
import { publicImageUrl } from "@/lib/image-url";
import type { Certification } from "@/db/schema";
import type { Locale } from "@/i18n/routing";

/**
 * Compact homepage trust band: certification/qualification entries as quiet
 * mono chips (badge image when one exists). Deliberately static — this sits
 * between two animated sections and should read like a datasheet footnote,
 * not compete with the hero's spec strip. Scrolls horizontally on mobile with
 * edge fades; details live at /about#certifications.
 */
export function CertificationStrip({
  certs,
  locale,
  title,
  linkLabel,
}: {
  certs: Certification[];
  locale: Locale;
  title: string;
  linkLabel: string;
}) {
  return (
    <section className="border-y border-[var(--color-border)] bg-[var(--color-surface-alt)] py-12">
      <div className="mx-auto max-w-[1400px] px-6">
        <div className="flex items-baseline justify-between gap-4">
          <h2 className="text-sm font-semibold uppercase tracking-wide text-[var(--color-ink-soft)]">{title}</h2>
          <Link
            href="/about#certifications"
            className="shrink-0 text-sm font-semibold text-[var(--color-steel-light)]"
          >
            {linkLabel} →
          </Link>
        </div>
        <div className="relative mt-6">
          <div
            aria-hidden
            className="pointer-events-none absolute inset-y-0 left-0 z-10 w-8 bg-gradient-to-r from-[var(--color-surface-alt)] to-transparent"
          />
          <div
            aria-hidden
            className="pointer-events-none absolute inset-y-0 right-0 z-10 w-8 bg-gradient-to-l from-[var(--color-surface-alt)] to-transparent"
          />
          <ul className="flex gap-3 overflow-x-auto pb-1 [-ms-overflow-style:none] [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
            {certs.map((cert) => {
              const name = locale === "ko" ? cert.titleKo : cert.titleEn ?? cert.titleKo;
              const badge = cert.imagePath ? publicImageUrl("site-media", cert.imagePath) : null;
              return (
                <li
                  key={cert.id}
                  className="flex shrink-0 items-center gap-2 whitespace-nowrap rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] px-4 py-2 font-mono text-xs font-semibold uppercase tracking-wide text-[var(--color-ink)]"
                >
                  {badge && (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img src={badge} alt="" loading="lazy" decoding="async" className="h-8 w-auto object-contain" />
                  )}
                  {name}
                </li>
              );
            })}
          </ul>
        </div>
      </div>
    </section>
  );
}
