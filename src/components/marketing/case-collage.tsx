"use client";

import { useCallback, useEffect, useRef, useState, useSyncExternalStore } from "react";
import { motion } from "framer-motion";
import { MOTION_LEVEL, useHydrated, useMediaQuery } from "@/lib/motion";

/** One photo of one project — a project with a gallery contributes several. */
export type CollageItem = {
  id: string;
  clientName: string;
  title: string;
  description: string | null;
  imageUrl: string | null;
  /** Editorial ratio from the DB — the estimate used until the file reports its own. */
  aspect?: number;
};

/** Gap between tiles, in px. Mirrors the `gap-2` class used pre-hydration. */
const GAP = 8;
/** Tile shape at rest — also the `aspect-[4/3]` fallback used pre-hydration. */
const TILE_ASPECT = 4 / 3;
/** Floor on how far a neighbouring track may be squeezed, as a share of its resting size. */
const MIN_TRACK = 0.55;
/** The expanded photo never exceeds this share of the viewport height, so it
 *  stays readable in one look without scrolling. */
const MAX_VIEWPORT = 0.62;
const DURATION = 620;
/** Mechanical ease (report §3: no bounce/overshoot) — CSS twin of power2.inOut. */
const EASE = "cubic-bezier(0.65, 0, 0.35, 1)";

/**
 * `grid-template-*` string where the focused track takes `activeShare` of the
 * content box and the rest split what's left, so the total is always 1 — the
 * frame's own size never changes.
 */
function tracks(count: number, activeIdx: number | null, activeShare: number) {
  if (count <= 1) return "1fr";
  if (activeIdx === null) return `repeat(${count}, 1fr)`;
  const rest = (1 - activeShare) / (count - 1);
  return Array.from({ length: count }, (_, i) => `${(i === activeIdx ? activeShare : rest).toFixed(5)}fr`).join(" ");
}

/** Viewport height as an external store (lint-clean: no setState in an effect). */
function useViewportHeight() {
  const subscribe = useCallback((onChange: () => void) => {
    window.addEventListener("resize", onChange);
    return () => window.removeEventListener("resize", onChange);
  }, []);
  return useSyncExternalStore(subscribe, () => window.innerHeight, () => 0);
}

/**
 * Solves the focused cell's box: as close to the photo's own aspect ratio as
 * the frame and the viewport allow.
 *
 * Because the cell ends up shaped like the photo, plain `object-cover` lands on
 * the complete image — the crop opens continuously as the cell animates, and
 * there are never letterbox bars. Which way it opens falls out of the ratio: a
 * wide photo spends its growth on width and shoves its neighbours sideways; a
 * tall one spends it on height and squeezes the rows above and below.
 */
function solveCell(aspect: number, cols: number, rows: number, contentW: number, contentH: number, viewportH: number) {
  // A lone row or column spans the whole frame and can't be reshaped.
  const shapeW = cols > 1;
  const shapeH = rows > 1;

  // Biggest box on offer: what's left once every neighbour has been squeezed to
  // its floor, and — vertically — never more than the viewport can show at once.
  let w = shapeW ? contentW - (cols - 1) * (contentW / cols) * MIN_TRACK : contentW;
  let h = shapeH
    ? Math.min(contentH - (rows - 1) * (contentH / rows) * MIN_TRACK, viewportH * MAX_VIEWPORT)
    : contentH;

  // Give back whichever dimension has slack until the box is the photo's shape.
  // Only when neither side can move does `object-cover` fall back to cropping —
  // which still beats dead space above and below the image.
  if (w / h > aspect) {
    if (shapeW) w = h * aspect;
  } else if (w / h < aspect) {
    if (shapeH) h = w / aspect;
    else if (shapeW) w = h * aspect;
  }

  return { colShare: w / contentW, rowShare: h / contentH };
}

/**
 * Hover-expanding case-study collage.
 *
 * Focusing a tile animates the grid's column AND row templates: the focused
 * cell grows into the photo's own shape while its neighbours shrink and slide
 * aside inside the same frame. Track totals stay at 1, so nothing outside the
 * collage reflows.
 *
 * Pre-hydration (and at MOTION_LEVEL=off) it renders as a plain responsive
 * grid of 4:3 tiles. The JS row height is derived from that same aspect, so
 * taking over on hydration is pixel-identical — no jump.
 */
export function CaseCollage({ items }: { items: CollageItem[] }) {
  const hydrated = useHydrated();
  const isLg = useMediaQuery("(min-width: 1024px)");
  const isSm = useMediaQuery("(min-width: 640px)");
  const canHover = useMediaQuery("(hover: hover)", true);
  const reduced = useMediaQuery("(prefers-reduced-motion: reduce)");
  const viewportH = useViewportHeight();
  const frameRef = useRef<HTMLDivElement>(null);
  const [width, setWidth] = useState(0);
  const [active, setActive] = useState<number | null>(null);
  /** True ratios, read off each file once it decodes. */
  const [measured, setMeasured] = useState<Record<string, number>>({});

  useEffect(() => {
    const el = frameRef.current;
    if (!el) return;
    const ro = new ResizeObserver((entries) => setWidth(entries[0].contentRect.width));
    ro.observe(el);
    return () => ro.disconnect();
  }, []);

  const onMeasure = useCallback((id: string, aspect: number) => {
    setMeasured((prev) => (prev[id] ? prev : { ...prev, [id]: aspect }));
  }, []);

  const cols = isLg ? 3 : isSm ? 2 : 1;
  const rows = Math.max(1, Math.ceil(items.length / cols));
  const rowH = (width - GAP * (cols - 1)) / cols / TILE_ASPECT;
  const frameH = rows * rowH + (rows - 1) * GAP;

  // Static contract at MOTION_LEVEL=off; otherwise the JS layout takes over
  // once we know the frame width. Reduced-motion still expands (the full photo
  // is content, not decoration) — it just snaps instead of easing.
  const interactive = hydrated && width > 0 && viewportH > 0 && MOTION_LEVEL !== "off";
  const animate = interactive && !reduced;
  const current = interactive ? active : null;

  const item = current === null ? null : items[current];
  const aspect = item ? measured[item.id] ?? item.aspect ?? TILE_ASPECT : TILE_ASPECT;
  const cell =
    item === null
      ? null
      : solveCell(aspect, cols, rows, width - GAP * (cols - 1), rows * rowH, viewportH);

  const clear = () => setActive(null);

  return (
    <div
      ref={frameRef}
      onMouseLeave={canHover ? clear : undefined}
      onBlur={(e) => {
        if (!e.currentTarget.contains(e.relatedTarget as Node | null)) clear();
      }}
      className={`grid gap-2 ${interactive ? "" : "grid-cols-1 sm:grid-cols-2 lg:grid-cols-3"}`}
      style={
        interactive
          ? {
              height: frameH,
              gridTemplateColumns: tracks(cols, current === null ? null : current % cols, cell?.colShare ?? 0),
              gridTemplateRows: tracks(rows, current === null ? null : Math.floor(current / cols), cell?.rowShare ?? 0),
              transition: animate
                ? `grid-template-columns ${DURATION}ms ${EASE}, grid-template-rows ${DURATION}ms ${EASE}`
                : undefined,
            }
          : undefined
      }
    >
      {items.map((it, i) => (
        <Tile
          key={it.id}
          item={it}
          index={i}
          isActive={current === i}
          isDimmed={current !== null && current !== i}
          fillsCell={interactive}
          animate={animate}
          canHover={canHover}
          onMeasure={onMeasure}
          onActivate={() => setActive(i)}
          onToggle={() => setActive((prev) => (prev === i ? null : i))}
        />
      ))}
    </div>
  );
}

function Tile({
  item,
  index,
  isActive,
  isDimmed,
  fillsCell,
  animate,
  canHover,
  onMeasure,
  onActivate,
  onToggle,
}: {
  item: CollageItem;
  index: number;
  isActive: boolean;
  isDimmed: boolean;
  fillsCell: boolean;
  animate: boolean;
  canHover: boolean;
  onMeasure: (id: string, aspect: number) => void;
  onActivate: () => void;
  onToggle: () => void;
}) {
  const fade = animate ? `opacity ${DURATION}ms ${EASE}` : "none";

  const body = (
    <button
      type="button"
      aria-pressed={isActive}
      onMouseEnter={canHover ? onActivate : undefined}
      // Keyboard focus reveals; the focus a tap/click leaves behind must not,
      // or it would fight the click handler below and cancel the reveal.
      onFocus={(e) => {
        if (e.currentTarget.matches(":focus-visible")) onActivate();
      }}
      onClick={canHover ? onActivate : onToggle}
      className="group relative block h-full w-full cursor-pointer overflow-hidden bg-[var(--color-surface-alt)] text-left focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[var(--color-steel-light)]"
    >
      {item.imageUrl && (
        /* One layer, always object-cover: the cell is animated into the photo's
           shape, so the crop resolves to the whole image with no bars. */
        /* eslint-disable-next-line @next/next/no-img-element */
        <img
          src={item.imageUrl}
          alt={item.title}
          loading="lazy"
          decoding="async"
          onLoad={(e) => {
            const { naturalWidth, naturalHeight } = e.currentTarget;
            if (naturalWidth > 0 && naturalHeight > 0) onMeasure(item.id, naturalWidth / naturalHeight);
          }}
          className="absolute inset-0 h-full w-full object-cover"
        />
      )}

      {/* Neighbours recede so the focused photo carries the frame. */}
      <span
        className="pointer-events-none absolute inset-0 bg-black/50"
        style={{ opacity: isDimmed ? 1 : 0, transition: fade }}
      />
      <span className="pointer-events-none absolute inset-0 bg-gradient-to-t from-black/75 via-black/10 to-transparent" />

      <span
        className="pointer-events-none absolute inset-x-0 bottom-0 block p-4 text-white"
        style={{ opacity: isDimmed ? 0 : 1, transition: fade }}
      >
        <span className="block text-xs font-semibold uppercase tracking-wide text-white/80">{item.clientName}</span>
        <span className="mt-1 block text-sm font-bold leading-snug">{item.title}</span>
        {item.description && (
          <span
            className="mt-1 block overflow-hidden text-xs leading-relaxed text-white/80"
            style={{
              maxHeight: isActive ? "6rem" : "0rem",
              transition: animate ? `max-height ${DURATION}ms ${EASE}` : "none",
            }}
          >
            {item.description}
          </span>
        )}
      </span>
    </button>
  );

  const className = [
    // Anchor target for homepage card links (/cases#case-<id>); offset clears the sticky nav.
    "scroll-mt-24 relative min-h-0 min-w-0 overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)]",
    fillsCell ? "" : "aspect-[4/3]",
    isActive ? "z-10" : "",
  ]
    .filter(Boolean)
    .join(" ");

  if (MOTION_LEVEL === "off") {
    return (
      <div id={`case-${item.id}`} className={className}>
        {body}
      </div>
    );
  }

  return (
    <motion.div
      id={`case-${item.id}`}
      className={className}
      initial={{ opacity: 0, y: 20 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: "-10%" }}
      transition={{ duration: 0.5, delay: Math.min(index, 8) * 0.06, ease: [0.16, 1, 0.3, 1] }}
    >
      {body}
    </motion.div>
  );
}
