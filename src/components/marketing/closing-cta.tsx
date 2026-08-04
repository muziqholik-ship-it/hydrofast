"use client";

import { useEffect, useRef } from "react";
import { Link } from "@/i18n/navigation";
import { gsap, EASE_ENTRANCE, EASE_MECHANICAL, MOTION_LEVEL, prefersReducedMotion } from "@/lib/motion";

/*
 * Pressure-gauge geometry (workstream 08 A4). The dial spans 270°, from
 * -135° (bottom-left) to +135° (bottom-right), 0° pointing up. The arcs use
 * pathLength=100 so a 270° sweep is exactly 75 dash units; the needle's
 * static markup points at MAX (+135°) — that IS the reduced-motion /
 * MOTION_LEVEL=off state, and GSAP only rewinds it when motion is allowed.
 */
const GAUGE_SWEEP = 135; // degrees each side of 12 o'clock
const ARC_DASH = 75; // 270° of a pathLength-100 circle

function tickPoints(angleDeg: number, r1: number, r2: number) {
  const rad = (angleDeg * Math.PI) / 180;
  return {
    x1: 100 + r1 * Math.sin(rad),
    y1: 100 - r1 * Math.cos(rad),
    x2: 100 + r2 * Math.sin(rad),
    y2: 100 - r2 * Math.cos(rad),
  };
}

const TICKS = Array.from({ length: 11 }, (_, i) => {
  const angle = -GAUGE_SWEEP + (i * (2 * GAUGE_SWEEP)) / 10;
  const major = i % 2 === 0;
  return { ...tickPoints(angle, major ? 62 : 66, 72), major, angle };
});

/** Final full-width CTA band — button styles mirror the header/hero CTAs. */
export function ClosingCta({
  title,
  sub,
  primaryLabel,
  secondaryLabel,
}: {
  title: string;
  sub: string;
  primaryLabel: string;
  secondaryLabel: string;
}) {
  const sectionRef = useRef<HTMLElement>(null);

  useEffect(() => {
    if (MOTION_LEVEL === "off" || prefersReducedMotion()) return;
    const section = sectionRef.current;
    if (!section) return;

    const ctx = gsap.context(() => {
      gsap.from('[data-cta="content"]', {
        autoAlpha: 0,
        y: 16,
        duration: 0.5,
        ease: EASE_ENTRANCE,
        scrollTrigger: { trigger: section, start: "top 85%", once: true },
      });

      const needle = section.querySelector('[data-cta="needle"]');
      const arc = section.querySelector('[data-cta="arc"]');
      if (!needle || !arc) return;

      if (MOTION_LEVEL === "full") {
        // Scrubbed sweep: the needle reaches max exactly when the page is
        // scrolled out (this is the last section, so end at bottom-bottom).
        const tl = gsap.timeline({
          scrollTrigger: { trigger: section, start: "top 90%", end: "bottom bottom", scrub: 0.8 },
        });
        tl.fromTo(
          needle,
          { rotation: -GAUGE_SWEEP, svgOrigin: "100 100" },
          { rotation: GAUGE_SWEEP, ease: EASE_MECHANICAL, duration: 1 },
          0,
        ).fromTo(
          arc,
          { strokeDashoffset: ARC_DASH },
          { strokeDashoffset: 0, ease: EASE_MECHANICAL, duration: 1 },
          0,
        );
      } else {
        // "lite": one time-based sweep when the section enters.
        const tl = gsap.timeline({
          scrollTrigger: { trigger: section, start: "top 80%", once: true },
        });
        tl.fromTo(
          needle,
          { rotation: -GAUGE_SWEEP, svgOrigin: "100 100" },
          { rotation: GAUGE_SWEEP, ease: EASE_MECHANICAL, duration: 0.8 },
          0,
        ).fromTo(
          arc,
          { strokeDashoffset: ARC_DASH },
          { strokeDashoffset: 0, ease: EASE_MECHANICAL, duration: 0.8 },
          0,
        );
      }
    }, section);

    return () => ctx.revert();
  }, []);

  return (
    <section
      ref={sectionRef}
      className="relative overflow-hidden border-t border-[var(--color-border)] bg-[var(--color-surface-alt)]"
    >
      {/* Background pressure gauge — decorative, tokens only. */}
      <svg
        aria-hidden
        viewBox="0 0 200 200"
        className="pointer-events-none absolute -right-10 top-1/2 hidden h-[340px] w-[340px] -translate-y-1/2 opacity-[0.14] md:block"
      >
        {/* dial track (270°) — circle stroke starts at 3 o'clock, so rotate
            135° to put the arc start at the gauge's bottom-left */}
        <circle
          cx="100"
          cy="100"
          r="78"
          fill="none"
          pathLength="100"
          stroke="var(--color-border)"
          strokeWidth="5"
          strokeDasharray="75 25"
          transform="rotate(135 100 100)"
        />
        {/* pressure arc — dash 75 / gap 100 never repeats, so offset 75→0
            draws the sweep; static offset 0 = max pressure */}
        <circle
          data-cta="arc"
          cx="100"
          cy="100"
          r="78"
          fill="none"
          pathLength="100"
          stroke="var(--color-safety-orange)"
          strokeWidth="5"
          strokeDasharray="75 100"
          strokeDashoffset="0"
          transform="rotate(135 100 100)"
        />
        {TICKS.map((t) => (
          <line
            key={t.angle}
            x1={t.x1}
            y1={t.y1}
            x2={t.x2}
            y2={t.y2}
            stroke="var(--color-steel)"
            strokeWidth={t.major ? 3 : 1.5}
          />
        ))}
        {/* needle at max (+135°) by default */}
        <g data-cta="needle" transform="rotate(135 100 100)">
          <polygon points="100,36 95.5,104 104.5,104" fill="var(--color-safety-orange)" />
        </g>
        <circle cx="100" cy="100" r="7" fill="var(--color-steel)" />
      </svg>

      <div data-cta="content" className="relative mx-auto max-w-[1400px] px-6 py-16 text-center md:py-20">
        <h2 className="text-2xl font-bold tracking-tight md:text-3xl">{title}</h2>
        <p className="mx-auto mt-3 max-w-2xl text-[var(--color-ink-soft)]">{sub}</p>
        <div className="mt-8 flex flex-wrap justify-center gap-4">
          <Link
            href="/contact"
            className="rounded-[var(--radius-card)] bg-[var(--color-safety-orange)] px-6 py-3 text-sm font-semibold text-[var(--color-safety-orange-contrast)] transition-transform hover:-translate-y-0.5"
          >
            {primaryLabel}
          </Link>
          <Link
            href="/products"
            className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-6 py-3 text-sm font-semibold text-[var(--color-ink)] transition-transform hover:-translate-y-0.5"
          >
            {secondaryLabel}
          </Link>
        </div>
      </div>
    </section>
  );
}
