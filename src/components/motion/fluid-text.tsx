"use client";

import { Fragment, useEffect, useId, useRef, useState, useSyncExternalStore } from "react";
import { gsap, ScrollTrigger, MOTION_LEVEL, useMediaQuery } from "@/lib/motion";

/*
 * Oil-fill typography (workstream 09 §1).
 *
 * The heading is REAL HTML text at all times — it does the layout, stays
 * selectable, and is what SSR / no-JS / reduced-motion / MOTION_LEVEL=off
 * render (fully filled via the .fluid-text-static gradient, so there is no
 * CLS and no JS requirement for a correct page). When motion is allowed, an
 * absolutely-positioned SVG overlay is measured against the rendered line
 * boxes: the same glyphs become a <clipPath> over a "fluid" body topped by a
 * sine-wave surface. GSAP drifts the wave horizontally (~3s loop, organic
 * ease allowed per the 09 motion-grammar amendment) while the fill level
 * translates the fluid vertically:
 *   - mode="load":  0 → ~100% in ~1.6s on mount, then a slow slosh settle
 *   - mode="scrub": ScrollTrigger scrub — fills as the heading approaches,
 *                   holds, then drains as it leaves the viewport top
 * The overlay hides the HTML glyphs (color: transparent) and draws its own
 * 1px --color-border outline, so text stays legible at any fill level.
 * Korean and English take the identical path: the SVG <text> inherits the
 * heading's font (Pretendard) and is aligned per measured line box. If a
 * marked line soft-wraps (very narrow viewport), we bail to the static
 * filled state rather than misalign the mask.
 */

export type FluidTextMode = "load" | "scrub";

type LineBox = { x: number; cy: number; text: string };
type Layout = { w: number; h: number; fontSize: number; lines: LineBox[] };

const noopSubscribe = () => () => {};
/** SSR-safe "has hydrated" signal (lint-clean: no setState-in-effect). */
function useHydrated() {
  return useSyncExternalStore(
    noopSubscribe,
    () => true,
    () => false,
  );
}

function measure(wrapper: HTMLElement): Layout | null {
  const rect = wrapper.getBoundingClientRect();
  if (rect.width === 0 || rect.height === 0) return null;
  const fontSize = parseFloat(getComputedStyle(wrapper).fontSize);
  const lines: LineBox[] = [];
  for (const span of wrapper.querySelectorAll<HTMLElement>("[data-fluid-line]")) {
    // A soft-wrapped line means one SVG <text> can't mirror the glyph
    // positions — degrade to the static filled state instead of misaligning.
    if (span.getClientRects().length > 1) return null;
    const r = span.getBoundingClientRect();
    lines.push({
      x: r.left - rect.left,
      cy: r.top - rect.top + r.height / 2,
      text: span.textContent ?? "",
    });
  }
  return { w: rect.width, h: rect.height, fontSize, lines };
}

/** Periodic sine surface from -2λ to w+2λ (quad midpoint = amp), closed down to `depth`. */
function fluidBodyPath(w: number, lambda: number, amp: number, depth: number): string {
  const x0 = -2 * lambda;
  const x1 = w + 2 * lambda;
  let d = `M ${x0} 0`;
  for (let x = x0; x < x1; x += lambda) {
    d += ` q ${lambda / 4} ${-2 * amp} ${lambda / 2} 0 q ${lambda / 4} ${2 * amp} ${lambda / 2} 0`;
  }
  d += ` L ${x1} ${depth} L ${x0} ${depth} Z`;
  return d;
}

/** The open sine curve alone — stroked as the darker meniscus surface line. */
function meniscusPath(w: number, lambda: number, amp: number): string {
  const x0 = -2 * lambda;
  const x1 = w + 2 * lambda;
  let d = `M ${x0} 0`;
  for (let x = x0; x < x1; x += lambda) {
    d += ` q ${lambda / 4} ${-2 * amp} ${lambda / 2} 0 q ${lambda / 4} ${2 * amp} ${lambda / 2} 0`;
  }
  return d;
}

export function FluidText({
  text,
  mode,
  level,
}: {
  /** Heading copy; "\n" marks intentional line breaks (as in the hero title). */
  text: string;
  mode: FluidTextMode;
  /** Optional fixed fill level 0–1 (overrides the mode-driven animation). */
  level?: number;
}) {
  const id = useId().replace(/[^a-zA-Z0-9]/g, "");
  const ref = useRef<HTMLSpanElement>(null);
  const [layout, setLayout] = useState<Layout | null>(null);
  const hydrated = useHydrated();
  const reducedMotion = useMediaQuery("(prefers-reduced-motion: reduce)");

  // "lite" keeps the time-based load fill but skips scroll-scrubbing (same
  // policy as the stats in 08-A); "off"/reduced are fully static.
  const animate =
    hydrated &&
    !reducedMotion &&
    (MOTION_LEVEL === "full" || (MOTION_LEVEL === "lite" && mode === "load"));

  const lines = text.split("\n");

  // Measure line boxes once webfonts settle (wrong-font metrics would place
  // the mask off the glyphs), and re-measure whenever the heading resizes.
  useEffect(() => {
    if (!animate) return;
    const wrapper = ref.current;
    if (!wrapper) return;
    let cancelled = false;
    const doMeasure = () => {
      if (!cancelled) setLayout(measure(wrapper));
    };
    document.fonts.ready.then(doMeasure);
    const ro = new ResizeObserver(doMeasure);
    ro.observe(wrapper);
    return () => {
      cancelled = true;
      ro.disconnect();
    };
  }, [animate, text]);

  // Animation wiring. Lives entirely in a gsap.context so unmount/re-measure
  // reverts cleanly (ScrollTriggers included — no leaks across navigations).
  useEffect(() => {
    if (!animate || !layout) return;
    const wrapper = ref.current;
    if (!wrapper) return;

    const amp = Math.min(Math.max(layout.fontSize * 0.08, 3), 9);
    const lambda = Math.max(layout.fontSize * 2.2, 56);
    // Fill level L → y of the wave baseline: L=0 just below the block,
    // L≥1 the surface clears the top (letters completely full).
    const surfaceY = (l: number) => layout.h + amp - l * (layout.h + 2 * amp);

    const ctx = gsap.context(() => {
      const drift = gsap.to("[data-fluid-wave]", {
        x: -lambda,
        duration: 3,
        ease: "none",
        repeat: -1,
      });
      // The wave loop is the only perpetual tween on the page — never let it
      // tick while the heading is off-screen.
      ScrollTrigger.create({
        trigger: wrapper,
        start: "top bottom",
        end: "bottom top",
        onToggle: (self) => (self.isActive ? drift.play() : drift.pause()),
      });

      const state = { l: 0 };
      const apply = () => gsap.set("[data-fluid-level]", { y: surfaceY(state.l) });
      apply();

      if (level !== undefined) {
        state.l = level;
        apply();
      } else if (mode === "load") {
        // Rise 0→100% in ~1.6s, then settle with a slow slosh.
        gsap
          .timeline({ delay: 0.15, defaults: { onUpdate: apply } })
          .to(state, { l: 0.96, duration: 1.6, ease: "power2.inOut" })
          .to(state, { l: 0.9, duration: 0.5, ease: "sine.inOut" })
          .to(state, { l: 0.98, duration: 0.5, ease: "sine.inOut" })
          .to(state, { l: 1.08, duration: 0.6, ease: "sine.out" });
      } else {
        // Scrub: fill on approach, hold while centered, drain toward exit.
        // If the page ends before the drain segment (e.g. the closing CTA),
        // the heading simply stays full.
        gsap
          .timeline({
            defaults: { onUpdate: apply, ease: "none" },
            scrollTrigger: { trigger: wrapper, start: "top 95%", end: "top -20%", scrub: 0.6 },
          })
          .to(state, { l: 1.08, duration: 0.4 })
          .to(state, { l: 1.08, duration: 0.35 })
          .to(state, { l: 0, duration: 0.25 });
      }
    }, wrapper);

    return () => ctx.revert();
  }, [animate, layout, mode, level]);

  const animating = animate && layout !== null;
  const bodyDepth = layout ? layout.h + 2 * Math.max(layout.fontSize * 0.08, 3) : 0;
  const amp = layout ? Math.min(Math.max(layout.fontSize * 0.08, 3), 9) : 0;
  const lambda = layout ? Math.max(layout.fontSize * 2.2, 56) : 0;

  return (
    <span
      ref={ref}
      className={`relative inline-block ${animating ? "fluid-text-animating" : "fluid-text-static"}`}
    >
      {lines.map((line, i) => (
        <Fragment key={i}>
          {i > 0 && <br />}
          <span data-fluid-line>{line}</span>
        </Fragment>
      ))}

      {animating && layout && (
        <svg
          aria-hidden
          className="pointer-events-none absolute inset-0 h-full w-full overflow-visible"
          viewBox={`0 0 ${layout.w} ${layout.h}`}
          preserveAspectRatio="none"
        >
          <defs>
            <linearGradient
              id={`${id}g`}
              gradientUnits="userSpaceOnUse"
              x1="0"
              y1="0"
              x2="0"
              y2={layout.h}
            >
              <stop offset="0" style={{ stopColor: "var(--color-fluid)" }} />
              <stop
                offset="1"
                style={{ stopColor: "color-mix(in srgb, var(--color-fluid) 55%, black)" }}
              />
            </linearGradient>
            {/* The letterforms, reused as the clip for the fluid. SVG <text>
                inherits the heading's font/size/weight/tracking, so ko and en
                render through the identical path. */}
            <clipPath id={`${id}c`}>
              {layout.lines.map((l, i) => (
                <text key={i} x={l.x} y={l.cy} dominantBaseline="central">
                  {l.text}
                </text>
              ))}
            </clipPath>
          </defs>

          {/* 1px outline hint so unfilled letters stay legible mid-animation */}
          {layout.lines.map((l, i) => (
            <text key={i} x={l.x} y={l.cy} dominantBaseline="central" className="fluid-text-outline">
              {l.text}
            </text>
          ))}

          <g clipPath={`url(#${id}c)`}>
            <g data-fluid-level>
              <g data-fluid-wave>
                <path d={fluidBodyPath(layout.w, lambda, amp, bodyDepth)} fill={`url(#${id}g)`} />
                <path d={meniscusPath(layout.w, lambda, amp)} className="fluid-text-meniscus" />
              </g>
            </g>
          </g>
        </svg>
      )}
    </span>
  );
}
