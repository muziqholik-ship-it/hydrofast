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
import { contentImageUrl } from "@/lib/image-url";

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
export function BusinessContent({ area, locale }: { area: BusinessAreaContent; locale: Locale }) {
  return <ContentSections sections={area.sections} accent={area.accent} locale={locale} />;
}

/** Standalone section renderer — also used by pages (e.g. custom-project details) that aren't a full business area. */
export function ContentSections({
  sections,
  accent,
  locale,
}: {
  sections: ContentSection[];
  accent: string;
  locale: Locale;
}) {
  const t = useT(locale);

  return (
    <div className="flex flex-col">
      {sections.map((section, i) => (
        <Section key={i} section={section} accent={accent} t={t} shaded={i % 2 === 1} />
      ))}
    </div>
  );
}

function Section({
  section,
  accent,
  t,
  shaded,
}: {
  section: ContentSection;
  accent: string;
  t: (l?: Loc) => string;
  shaded: boolean;
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
              <Block block={block} accent={accent} t={t} />
            </motion.div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}

/* ── Uncropped image layout ────────────────────────────────────────────────
 *
 * Content ratios here run from a 6.4:1 product strip to a 1:2.3 rebar shot, so
 * no fixed frame can hold them: `object-cover` amputated the ends of the wide
 * ones and the top and bottom of the tall ones. Nothing below crops. Instead
 * each figure hugs its photo, and the *layout* adapts to the photo's shape —
 * uprights stand beside the copy, landscapes flow in a masonry band under it,
 * and panoramas take the full width of that band.
 */

/** Under this ratio an image reads as upright and belongs beside the copy. */
const UPRIGHT_MAX = 1.15;
/** At or over this an image is a panorama; it spans every column of its band. */
const PANORAMA_MIN = 2.2;
/** Ceiling on an upright image, so a 1:2.3 photo can't take over the section. */
const UPRIGHT_CAP = "clamp(220px, 48vh, 520px)";

type ImageSize = { aspect: number; height: number };

/**
 * Intrinsic sizes for a block's images, by `src`.
 *
 * Measured off a detached `Image()` at low fetch priority rather than the
 * rendered `<img>`: the layout has to know the shape *before* a lazy image
 * scrolls into view, or the block would visibly re-flow under the reader. The
 * warm cache means the real `<img>` then paints instantly. Until a size lands
 * the image is treated as landscape, which is the uncropped fallback anyway.
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

/**
 * Upright images standing side by side. Each figure is given the photo's own
 * ratio and a height of `min(cap, natural)` — so it is exactly the shape of its
 * contents (no letterbox), never crops, and never upscales a small source past
 * its real pixels.
 */
function UprightRow({
  images,
  t,
  sizes,
}: {
  images: ContentImage[];
  t: (l?: Loc) => string;
  sizes: Record<string, ImageSize>;
}) {
  return (
    <div className="flex flex-wrap items-center justify-center gap-3">
      {images.map((im, i) => {
        const size = sizes[im.src];
        return (
          <Img
            key={i}
            image={im}
            t={t}
            className="max-w-full"
            style={
              size ? { height: `min(${UPRIGHT_CAP}, ${size.height}px)`, aspectRatio: size.aspect } : undefined
            }
            // `contain` inside a frame that already has the image's ratio is a
            // no-op; it only engages if `max-w-full` clamps a very wide frame on
            // a narrow screen, where a hairline letterbox beats a distorted photo.
            imgClassName="h-full w-full object-contain"
          />
        );
      })}
    </div>
  );
}

/** Ceiling on panorama height to prevent extreme aspect ratios from towering. */
const PANORAMA_MAX_H = 420;

interface RowLayout {
  images: ContentImage[];
  height: number;
  isPanorama: boolean;
}

/**
 * Pack landscape images into justified rows. Each row's height is solved so
 * all images on it resolve to the same height, proportional to their aspect
 * ratios. Panoramas (aspect >= PANORAMA_MIN) break out to their own centered
 * row. Returns an array of row descriptors.
 */
function placeRows(images: ContentImage[], sizes: Record<string, ImageSize>, hint?: number): RowLayout[] {
  const IDEAL_H = 300;
  const MIN_H = 150;
  const MAX_H = 400;

  const marked = images.map((im) => {
    const s = sizes[im.src];
    const aspect = s?.aspect ?? 1.6;
    const isPanorama = aspect >= PANORAMA_MIN;
    return { image: im, aspect, isPanorama };
  });

  const rows: RowLayout[] = [];
  let i = 0;

  while (i < marked.length) {
    const panos = marked.slice(i).filter((m) => m.isPanorama);
    if (panos.length > 0) {
      rows.push({
        images: [panos[0].image],
        height: Math.min(panos[0].aspect * 160, PANORAMA_MAX_H),
        isPanorama: true,
      });
      i = marked.findIndex((m, idx) => idx >= i && m.image === panos[0].image) + 1;
      continue;
    }

    let row: typeof marked = [];
    let sumAspect = 0;
    let rowStart = i;

    while (i < marked.length && !marked[i].isPanorama) {
      const item = marked[i];
      sumAspect += item.aspect;
      row.push(item);
      const w = 1200;
      const h = w / sumAspect;
      if (h < MIN_H && row.length > 1) {
        row.pop();
        sumAspect -= item.aspect;
        break;
      }
      if (h > MAX_H) break;
      i++;
    }

    if (row.length === 0 && i < marked.length) {
      row.push(marked[i]);
      sumAspect = marked[i].aspect;
      i++;
    }

    const w = 1200;
    const h = Math.max(MIN_H, Math.min(MAX_H, w / sumAspect));
    rows.push({ images: row.map((m) => m.image), height: h, isPanorama: false });
  }

  return rows;
}

/**
 * Landscape images in justified rows: images on each row are resized so they
 * all reach the same height, proportional to their aspect ratios. Panoramas
 * break out to their own centred line. Every image is uncropped and never
 * upscaled.
 */
function ImageBand({
  images,
  t,
  sizes,
  columns,
}: {
  images: ContentImage[];
  t: (l?: Loc) => string;
  sizes: Record<string, ImageSize>;
  columns?: number;
}) {
  const rows = useMemo(() => placeRows(images, sizes, columns), [images, sizes, columns]);

  if (images.length === 1) {
    return (
      <div className="mx-auto max-w-4xl">
        <Img key={0} image={images[0]} t={t} imgClassName="h-auto w-full" />
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-3">
      {rows.map((row, ri) => (
        <div
          key={ri}
          className={row.isPanorama ? "flex justify-center" : "flex gap-3"}
          style={row.isPanorama ? {} : { height: `${row.height}px` }}
        >
          {row.images.map((im, ii) => {
            const s = sizes[im.src];
            const aspect = s?.aspect ?? 1.6;
            return (
              <Img
                key={ii}
                image={im}
                t={t}
                style={
                  row.isPanorama
                    ? { width: "auto", height: `${row.height}px`, maxWidth: "100%" }
                    : { flexGrow: aspect, flexBasis: 0, aspectRatio: aspect }
                }
                imgClassName={row.isPanorama ? "h-full w-auto object-contain" : "h-full w-full object-cover"}
              />
            );
          })}
        </div>
      ))}
    </div>
  );
}

/** Every image a block renders, so their ratios can be probed up front. */
function blockImageSrcs(block: ContentBlock): string[] {
  if (block.kind === "feature") return (block.images ?? []).map((im) => im.src);
  if (block.kind === "gallery") return block.images.map((im) => im.src);
  return [];
}

function Block({ block, accent, t }: { block: ContentBlock; accent: string; t: (l?: Loc) => string }) {
  const srcs = useMemo(() => blockImageSrcs(block), [block]);
  const sizes = useImageSizes(srcs);

  switch (block.kind) {
    case "feature": {
      const images = block.images ?? [];
      // Unmeasured images default to the band, which is uncropped either way.
      const upright = images.filter((im) => (sizes[im.src]?.aspect ?? Infinity) < UPRIGHT_MAX);
      const band = images.filter((im) => (sizes[im.src]?.aspect ?? Infinity) >= UPRIGHT_MAX);
      const split = upright.length > 0;
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
                <UprightRow images={upright} t={t} sizes={sizes} />
              </div>
            )}
          </div>
          {/* Landscapes drop below the copy, where they get the full column width
              instead of being squeezed into the half beside it. */}
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
