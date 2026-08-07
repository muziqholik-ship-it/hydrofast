"use client";

import { useEffect, useMemo, useState } from "react";
import { motion, type Variants } from "framer-motion";
import { Link } from "@/i18n/navigation";
import type {
  BusinessAreaContent,
  ContentBlock,
  ContentImage,
  ContentSection,
  Loc,
} from "@/content/business-areas";
import type { Locale } from "@/i18n/routing";
import { contentImageUrl, type ContentImageSize, type ContentImageSizes } from "@/lib/image-url";

const ease = [0.16, 1, 0.3, 1] as const;

const container: Variants = {
  hidden: {},
  show: { transition: { staggerChildren: 0.06 } },
};
const item: Variants = {
  hidden: { opacity: 0, y: 24 },
  show: { opacity: 1, y: 0, transition: { duration: 0.55, ease } },
};

function useT(locale: Locale) {
  return (l?: Loc) => (l ? (locale === "ko" ? l.ko : l.en ?? l.ko) : "");
}

/* eslint-disable @next/next/no-img-element */
export function BusinessContent({
  area,
  locale,
  imageSizes,
}: {
  area: BusinessAreaContent;
  locale: Locale;
  imageSizes?: ContentImageSizes;
}) {
  return (
    <ContentSections sections={area.sections} accent={area.accent} locale={locale} imageSizes={imageSizes} />
  );
}

/** Standalone section renderer — also used by pages (e.g. custom-project details) that aren't a full business area. */
export function ContentSections({
  sections,
  accent,
  locale,
  imageSizes,
}: {
  sections: ContentSection[];
  accent: string;
  locale: Locale;
  /** Server-measured intrinsic sizes, so blocks lay out correctly on first paint. */
  imageSizes?: ContentImageSizes;
}) {
  const t = useT(locale);

  return (
    <div className="flex flex-col">
      {sections.map((section, i) => (
        <Section
          key={i}
          section={section}
          accent={accent}
          t={t}
          shaded={i % 2 === 1}
          imageSizes={imageSizes}
        />
      ))}
    </div>
  );
}

function Section({
  section,
  accent,
  t,
  shaded,
  imageSizes,
}: {
  section: ContentSection;
  accent: string;
  t: (l?: Loc) => string;
  shaded: boolean;
  imageSizes?: ContentImageSizes;
}) {
  return (
    <section className={shaded ? "bg-[var(--color-surface-alt)]" : ""}>
      <div className="mx-auto max-w-[1400px] px-6 py-16 md:py-20">
        {(section.kicker || section.heading) && (
          <motion.div
            initial={{ opacity: 0, y: 16 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, margin: "-10%" }}
            transition={{ duration: 0.5, ease }}
            className="mb-10"
          >
            {section.kicker && (
              <p className="mb-2 text-xs font-semibold uppercase tracking-[0.2em]" style={{ color: accent }}>
                {t(section.kicker)}
              </p>
            )}
            {section.heading && (
              <h2 className="text-2xl md:text-3xl font-bold tracking-tight">
                <span className="border-l-4 pl-4" style={{ borderColor: accent }}>
                  {t(section.heading)}
                </span>
              </h2>
            )}
          </motion.div>
        )}

        <motion.div
          variants={container}
          initial="hidden"
          whileInView="show"
          viewport={{ once: true, margin: "-8%" }}
          className="flex flex-col gap-14"
        >
          {section.blocks.map((block, i) => (
            <motion.div key={i} variants={item}>
              <Block block={block} accent={accent} t={t} imageSizes={imageSizes} />
            </motion.div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}

/* ── Justified, uncropped image layout ─────────────────────────────────────
 *
 * Content ratios here run from a 6.4:1 product strip to a 1:2.3 rebar shot, and
 * resolutions from a 126px brochure crop to a 1920px photo, so no fixed frame
 * can hold them: `object-cover` amputates the ends of the wide ones, and giving
 * every image its natural height leaves ragged rows of mismatched thumbnails.
 *
 * Nothing below crops and nothing is forced to a common shape. Instead each
 * *row* is justified: figures on one line share a single height, and their
 * widths come out proportional to their own aspect ratios. Wide photos get more
 * width, tall ones less, edges line up top and bottom. The row height itself is
 * derived per block from how many images it holds, the `columns` the author
 * asked for, and — critically — how many real pixels the smallest source has,
 * so a group of tiny cut-outs settles at its own modest scale instead of being
 * blown up to match a group of full-bleed photos elsewhere on the page.
 */

/** Under this ratio an image reads as upright and can stand beside the copy. */
const UPRIGHT_MAX = 1.15;
/**
 * At or over this an image is a panorama and takes a line of its own. Set above
 * the merely-wide 2:1 photos — those still sit happily in a row beside a 4:3,
 * and breaking every one of them out would leave the page a stack of bands.
 */
const PANORAMA_MIN = 2.6;
/** Assumed shape for an image whose size isn't known yet (uploaded assets). */
const FALLBACK_ASPECT = 1.5;

/** `gap-3`, in px — the row maths has to agree with the class on the container. */
const GAP = 12;
/** Content width of a section at the `max-w-[1400px] px-6` container. */
const FULL_W = 1352;
/** One half of the two-column feature split (`lg:grid-cols-2 gap-8`). */
const SIDE_W = 660;

/** Row height a band aims for before the per-block adjustments below. */
const IDEAL_H = { full: 300, side: 330 };
/** Hard bounds, so one image can neither vanish nor take over the viewport. */
const MIN_H = 150;
const MAX_H = { full: 400, side: 440 };
/** How far past the computed height a short final row may grow before it caps. */
const GROW = 1.15;
/** Slightly under-declaring the basis lets flex pack the intended row count. */
const BASIS = 0.9;
/** Upscaling past this much of a source's own pixels reads as blur. */
const UPSCALE = 1.7;
/** …but a group of genuinely tiny cut-outs still needs a usable minimum. */
const UPSCALE_FLOOR = 200;
/** Panoramas sit on their own line, so they get their own upscale allowance. */
const PANO_UPSCALE = 1.4;
/**
 * …and their own height ceiling. Left to the full section width, the shallowest
 * panorama (a 2.6:1 photo) would stand half again as tall as the justified row
 * above it and read as the point of the section, which it rarely is.
 */
const PANO_MAX_H = 420;

type ImageSize = ContentImageSize;

/**
 * Intrinsic sizes for a block's images, by `src`.
 *
 * Measured off a detached `Image()` at low fetch priority rather than the
 * rendered `<img>`: the layout has to know the shape *before* a lazy image
 * scrolls into view, or the block would visibly re-flow under the reader. The
 * warm cache means the real `<img>` then paints instantly. Brochure assets are
 * already measured server-side and skip this entirely — only uploaded images,
 * which live in Storage and can't be `stat`ed at render time, land here.
 */
function useImageSizes(srcs: string[]): Record<string, ImageSize> {
  const [sizes, setSizes] = useState<Record<string, ImageSize>>({});

  useEffect(() => {
    if (srcs.length === 0) return;
    let live = true;
    const probes = srcs.map((src) => {
      const url = contentImageUrl(src);
      if (!url) return null;
      const probe = new Image();
      probe.fetchPriority = "low";
      probe.onload = () => {
        const { naturalWidth: w, naturalHeight: h } = probe;
        if (!live || !w || !h) return;
        setSizes((prev) => (prev[src] ? prev : { ...prev, [src]: { aspect: w / h, height: h } }));
      };
      probe.src = url;
      return probe;
    });
    return () => {
      live = false;
      probes.forEach((p) => p && (p.onload = null));
    };
  }, [srcs]);

  return sizes;
}

function Img({
  image,
  t,
  className = "",
  imgClassName = "",
  style,
}: {
  image: ContentImage;
  t: (l?: Loc) => string;
  className?: string;
  imgClassName?: string;
  style?: React.CSSProperties;
}) {
  const caption = t(image.caption);
  return (
    <figure
      // The hover affordance is a lift, not a zoom — a zoom inside a frame that
      // hugs its image would clip the very edges this rewrite exists to save.
      className={`group relative overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] transition-shadow duration-300 hover:shadow-lg ${className}`}
      style={style}
    >
      <img
        src={contentImageUrl(image.src)}
        alt={caption || ""}
        loading="lazy"
        decoding="async"
        className={`block ${imgClassName}`}
      />
      {caption && (
        <figcaption className="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/80 to-transparent px-3 py-2 text-xs font-medium text-white">
          {caption}
          {image.href && <span aria-hidden> →</span>}
        </figcaption>
      )}
      {image.href && <Link href={image.href} aria-label={caption || image.href} className="absolute inset-0" />}
    </figure>
  );
}

type Placed = {
  image: ContentImage;
  aspect: number;
  /** Intrinsic height in px, when known — the upscale guard needs real pixels. */
  height?: number;
  panorama: boolean;
};

function place(images: ContentImage[], sizes: Record<string, ImageSize>): Placed[] {
  return images.map((image) => {
    const size = sizes[image.src];
    const aspect = size?.aspect ?? FALLBACK_ASPECT;
    return { image, aspect, height: size?.height, panorama: aspect >= PANORAMA_MIN };
  });
}

/**
 * The row height a band of images should settle at.
 *
 * Picks the number of rows that lands closest to the ideal height for the
 * container, then solves for the height that justifies exactly that many rows —
 * so three 16:9 photos fill one line, twelve 3:2 thumbnails fall into three
 * clean rows of four, and a lone portrait doesn't stretch to the viewport.
 * `columns` (set by the content author on gallery blocks) steers the ideal, and
 * the source resolution caps the result.
 */
function rowHeight(flow: Placed[], columns: number | undefined, side: boolean) {
  const n = flow.length;
  if (n === 0) return { target: 0, cap: 0 };

  const width = side ? SIDE_W : FULL_W;
  const sum = flow.reduce((acc, p) => acc + p.aspect, 0);
  // A four-column hint on a two-image gallery would ask for quarter-width
  // figures with nothing to fill the rest of the line.
  const cols = columns ? Math.min(columns, n) : undefined;
  const ideal = cols
    ? (width - GAP * (cols - 1)) / cols / (sum / n)
    : IDEAL_H[side ? "side" : "full"];

  const rows = Math.max(1, Math.round((sum * ideal) / width));
  // width * rows of usable line length, less one gap for every image that isn't
  // the first on its row.
  let target = (width * rows - GAP * (n - rows)) / sum;
  target = Math.min(Math.max(target, MIN_H), MAX_H[side ? "side" : "full"]);

  const measured = flow.map((p) => p.height).filter((h): h is number => h !== undefined);
  if (measured.length > 0) {
    target = Math.min(target, Math.max(UPSCALE_FLOOR, Math.min(...measured) * UPSCALE));
  }
  return { target, cap: target * GROW };
}

/**
 * A band of images laid out in justified rows.
 *
 * Every figure carries its own `aspect-ratio` and a `flex-grow` equal to that
 * ratio, so flex hands each one width in proportion to how wide it is — which
 * makes every figure on a line resolve to the same height without a single one
 * being cropped or stretched. `flex-shrink: 0` plus a `max-width` of `100%`
 * keeps a wide image from squeezing its neighbour on a phone: it drops to a line
 * of its own instead. The same `max-width` caps how far a short trailing row can
 * grow, so two leftovers don't balloon to twice the height of the rows above.
 */
function ImageBand({
  images,
  t,
  sizes,
  columns,
  side = false,
}: {
  images: ContentImage[];
  t: (l?: Loc) => string;
  sizes: Record<string, ImageSize>;
  columns?: number;
  side?: boolean;
}) {
  const placed = place(images, sizes);
  const { target, cap } = rowHeight(
    placed.filter((p) => !p.panorama),
    columns,
    side,
  );

  return (
    <div className="flex flex-wrap items-center justify-center gap-3">
      {placed.map((p, i) =>
        p.panorama ? (
          // A 6:1 strip sharing a row would shrink its neighbours to stamps, so
          // it gets a line to itself — centred and held to whichever comes
          // first: the section width, its own pixels, or the height ceiling.
          <div key={i} className="w-full basis-full">
            <Img
              image={p.image}
              t={t}
              className="mx-auto"
              style={{
                aspectRatio: p.aspect,
                maxWidth: `min(100%, ${Math.round(
                  Math.min(
                    p.aspect * PANO_MAX_H,
                    p.height ? p.aspect * p.height * PANO_UPSCALE : Infinity,
                  ),
                )}px)`,
              }}
              imgClassName="h-full w-full object-contain"
            />
          </div>
        ) : (
          <Img
            key={i}
            image={p.image}
            t={t}
            style={{
              flexGrow: p.aspect,
              flexShrink: 0,
              flexBasis: `${Math.round(p.aspect * target * BASIS)}px`,
              aspectRatio: p.aspect,
              maxWidth: `min(100%, ${Math.round(p.aspect * cap)}px)`,
            }}
            // `contain` inside a frame that already has the image's ratio is a
            // no-op; it only engages when `max-width: 100%` clamps a wide frame
            // on a narrow screen, where a hairline letterbox beats distortion.
            imgClassName="h-full w-full object-contain"
          />
        ),
      )}
    </div>
  );
}

/** Every image a block renders, so their ratios can be probed up front. */
function blockImageSrcs(block: ContentBlock): string[] {
  if (block.kind === "feature") return (block.images ?? []).map((im) => im.src);
  if (block.kind === "gallery") return block.images.map((im) => im.src);
  return [];
}

function Block({
  block,
  accent,
  t,
  imageSizes,
}: {
  block: ContentBlock;
  accent: string;
  t: (l?: Loc) => string;
  imageSizes?: ContentImageSizes;
}) {
  // Only chase what the server couldn't measure — brochure assets arrive sized.
  const unmeasured = useMemo(
    () => blockImageSrcs(block).filter((src) => !imageSizes?.[src]),
    [block, imageSizes],
  );
  const probed = useImageSizes(unmeasured);
  const sizes = useMemo(() => ({ ...imageSizes, ...probed }), [imageSizes, probed]);

  switch (block.kind) {
    case "feature": {
      const images = block.images ?? [];
      const placed = place(images, sizes);
      const flow = placed.filter((p) => !p.panorama);
      // A pair of uprights reads well flanking the copy. Anything else — a
      // landscape, a third image, a panorama on its own — wants the full width
      // of the band below, where the copy isn't competing for the same line.
      const split = flow.length > 0 && flow.length <= 2 && flow.every((p) => p.aspect < UPRIGHT_MAX);
      const beside = split ? flow.map((p) => p.image) : [];
      const band = split ? placed.filter((p) => p.panorama).map((p) => p.image) : images;
      return (
        <div className="flex flex-col gap-8">
          <div className={`grid gap-8 ${split ? "lg:grid-cols-2 lg:items-center" : ""}`}>
            <div className={split && block.reverse ? "lg:order-2" : ""}>
              {block.badge && (
                <span
                  className="mb-3 inline-block rounded-[var(--radius-pill)] px-3 py-1 text-xs font-bold text-white"
                  style={{ backgroundColor: accent }}
                >
                  {t(block.badge)}
                </span>
              )}
              <h3 className="text-xl md:text-2xl font-bold tracking-tight">{t(block.title)}</h3>
              {block.body && (
                <p className="mt-3 leading-relaxed text-[var(--color-ink-soft)]">{t(block.body)}</p>
              )}
              {block.pills && (
                <div className="mt-4 flex flex-wrap gap-2">
                  {block.pills.map((p, i) => (
                    <span
                      key={i}
                      className="rounded-[var(--radius-card)] border px-3 py-1 text-sm font-semibold"
                      style={{ borderColor: accent, color: accent }}
                    >
                      {t(p)}
                    </span>
                  ))}
                </div>
              )}
            </div>
            {split && (
              <div className={block.reverse ? "lg:order-1" : ""}>
                <ImageBand images={beside} t={t} sizes={sizes} side />
              </div>
            )}
          </div>
          {/* Whatever didn't stand beside the copy drops below it, where it gets
              the full section width instead of the half column. */}
          {band.length > 0 && <ImageBand images={band} t={t} sizes={sizes} />}
        </div>
      );
    }

    case "gallery": {
      return (
        <div>
          {(block.title || block.subtitle) && (
            <div className="mb-5">
              {block.title && (
                <h3 className="text-lg font-bold">
                  <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                    {t(block.title)}
                  </span>
                </h3>
              )}
              {block.subtitle && <p className="mt-2 text-sm text-[var(--color-ink-soft)]">{t(block.subtitle)}</p>}
            </div>
          )}
          <ImageBand images={block.images} t={t} sizes={sizes} columns={block.columns ?? 3} />
        </div>
      );
    }

    case "specTable":
      return (
        <div>
          {block.title && (
            <h3 className="mb-4 text-lg font-bold">
              <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                {t(block.title)}
              </span>
            </h3>
          )}
          <div className="overflow-x-auto rounded-[var(--radius-card)] border border-[var(--color-border)]">
            <table className="w-full border-collapse text-sm">
              <thead>
                <tr style={{ backgroundColor: accent }}>
                  {block.headers.map((h, i) => (
                    <th key={i} className="px-4 py-3 text-left font-bold text-white">
                      {t(h)}
                    </th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {block.rows.map((row, ri) => (
                  <tr
                    key={ri}
                    className={ri % 2 ? "bg-[var(--color-surface-alt)]" : "bg-[var(--color-surface)]"}
                  >
                    {row.map((cell, ci) => (
                      <td
                        key={ci}
                        className={`border-t border-[var(--color-border)] px-4 py-3 ${
                          ci === 0 ? "font-semibold" : "text-[var(--color-ink-soft)]"
                        }`}
                      >
                        {t(cell)}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      );

    case "compare":
      return (
        <div>
          {block.title && (
            <h3 className="mb-2 text-lg font-bold">
              <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                {t(block.title)}
              </span>
            </h3>
          )}
          {block.note && <p className="mb-5 text-sm text-[var(--color-ink-soft)]">{t(block.note)}</p>}
          <div className="flex flex-col gap-4 md:flex-row md:items-stretch">
            <CompareCol col={block.left} accent={accent} t={t} />
            <div className="hidden items-center text-xl font-black text-[var(--color-ink-soft)] md:flex">VS</div>
            <CompareCol col={block.right} highlight={block.right.highlight} accent={accent} t={t} />
          </div>
        </div>
      );

    case "bullets":
      return (
        <div>
          {block.title && (
            <h3 className="mb-4 text-lg font-bold">
              <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                {t(block.title)}
              </span>
            </h3>
          )}
          <ul className="grid gap-2 sm:grid-cols-2">
            {block.items.map((it, i) => (
              <li key={i} className="flex gap-3 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-3">
                <span className="mt-0.5 h-2 w-2 shrink-0 rounded-full" style={{ backgroundColor: accent }} />
                <span className="text-sm leading-relaxed">{t(it)}</span>
              </li>
            ))}
          </ul>
        </div>
      );

    case "certs":
      return (
        <div>
          {(block.title || block.subtitle || block.issuerLogo) && (
            <div className="mb-5 flex flex-wrap items-end justify-between gap-4">
              <div>
                {block.title && (
                  <h3 className="text-lg font-bold">
                    <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                      {t(block.title)}
                    </span>
                  </h3>
                )}
                {block.subtitle && <p className="mt-2 text-sm text-[var(--color-ink-soft)]">{t(block.subtitle)}</p>}
              </div>
              {block.issuerLogo && (
                <img
                  src={contentImageUrl(block.issuerLogo)}
                  alt=""
                  loading="lazy"
                  decoding="async"
                  className="h-8 w-auto object-contain"
                />
              )}
            </div>
          )}
          <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
            {block.items.map((cert, i) => (
              <figure
                key={i}
                className="group flex flex-col overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)]"
              >
                <div className="bg-white p-3">
                  <img
                    src={contentImageUrl(cert.src)}
                    alt={t(cert.title)}
                    loading="lazy"
                    decoding="async"
                    className="mx-auto aspect-[5/7] w-full object-contain transition-transform duration-500 group-hover:scale-[1.03]"
                  />
                </div>
                <figcaption className="border-t border-[var(--color-border)] px-3 py-3">
                  <div className="text-sm font-semibold leading-snug">{t(cert.title)}</div>
                  {cert.note && <div className="mt-1 text-xs text-[var(--color-ink-soft)]">{t(cert.note)}</div>}
                </figcaption>
              </figure>
            ))}
          </div>
        </div>
      );

    case "brands":
      return (
        <div>
          {block.title && (
            <h3 className="mb-4 text-lg font-bold">
              <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                {t(block.title)}
              </span>
            </h3>
          )}
          <div className="flex flex-wrap gap-3">
            {block.items.map((brand, i) => (
              <span
                key={i}
                className="inline-flex items-center gap-2 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] px-4 py-2 text-sm font-semibold"
              >
                {brand.country && <span aria-hidden>{brand.country}</span>}
                {brand.name}
              </span>
            ))}
          </div>
        </div>
      );

    case "figure":
      return (
        <div>
          {block.title && (
            <h3 className="mb-4 text-lg font-bold">
              <span className="border-l-4 pl-3" style={{ borderColor: accent }}>
                {t(block.title)}
              </span>
            </h3>
          )}
          <figure className="overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)]">
            <img src={contentImageUrl(block.src)} alt={t(block.caption) || t(block.title)} loading="lazy" decoding="async" className="mx-auto w-full max-w-3xl" />
            {block.caption && (
              <figcaption className="border-t border-[var(--color-border)] px-4 py-3 text-center text-sm text-[var(--color-ink-soft)]">
                {t(block.caption)}
              </figcaption>
            )}
          </figure>
        </div>
      );

    default:
      return null;
  }
}

function CompareCol({
  col,
  highlight,
  accent,
  t,
}: {
  col: { title: Loc; rows: { label: Loc; value: Loc }[] };
  highlight?: boolean;
  accent: string;
  t: (l?: Loc) => string;
}) {
  return (
    <div
      className="flex-1 overflow-hidden rounded-[var(--radius-card)] border"
      style={highlight ? { borderColor: accent } : { borderColor: "var(--color-border)" }}
    >
      <div
        className="px-5 py-3 text-center text-lg font-bold"
        style={highlight ? { backgroundColor: accent, color: "#fff" } : { backgroundColor: "var(--color-surface-alt)" }}
      >
        {t(col.title)}
      </div>
      <div className="divide-y divide-[var(--color-border)]">
        {col.rows.map((r, i) => (
          <div key={i} className="flex items-center justify-between gap-4 px-5 py-3">
            <span className="text-sm text-[var(--color-ink-soft)]">{t(r.label)}</span>
            <span className="text-right font-bold" style={highlight ? { color: accent } : undefined}>
              {t(r.value)}
            </span>
          </div>
        ))}
      </div>
    </div>
  );
}
