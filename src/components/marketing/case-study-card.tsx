import { Link } from "@/i18n/navigation";
import { publicImageUrl } from "@/lib/image-url";
import type { CaseStudy } from "@/db/schema";

const CARD_CLASS =
  "group relative block overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)]";

export function CaseStudyCard({
  caseStudy,
  title,
  description,
  imageCount = 0,
  href,
}: {
  caseStudy: CaseStudy;
  title: string;
  description: string | null;
  /** Total gallery size; a "+N" badge appears when the project has more photos than the cover. */
  imageCount?: number;
  /** When set the whole card becomes a link (e.g. "/cases#case-<id>" from the homepage). */
  href?: string;
}) {
  const aspect = caseStudy.aspectRatio.replace("-", "/");
  const imageUrl = caseStudy.imagePath ? publicImageUrl("case-study-images", caseStudy.imagePath) : null;

  const inner = (
    <div className="relative w-full overflow-hidden bg-[var(--color-surface-alt)]" style={{ aspectRatio: aspect }}>
      {imageCount > 1 && (
        <span className="absolute right-2 top-2 z-10 rounded-[var(--radius-card)] bg-black/60 px-1.5 py-0.5 text-xs font-semibold text-white">
          +{imageCount - 1}
        </span>
      )}
      {imageUrl && (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={imageUrl}
          alt={title}
          loading="lazy"
          decoding="async"
          className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
        />
      )}
      <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/10 to-transparent" />
      <div className="absolute inset-x-0 bottom-0 p-4 text-white">
        <div className="text-xs font-semibold uppercase tracking-wide text-white/80">{caseStudy.clientName}</div>
        <div className="mt-1 text-sm font-bold leading-snug">{title}</div>
        {description && <p className="mt-1 text-xs text-white/80">{description}</p>}
      </div>
    </div>
  );

  if (href) {
    return (
      <Link
        href={href}
        className={`${CARD_CLASS} focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[var(--color-steel-light)]`}
      >
        {inner}
      </Link>
    );
  }

  return <div className={CARD_CLASS}>{inner}</div>;
}
