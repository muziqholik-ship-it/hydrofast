"use client";

import { useEffect, useRef, useState } from "react";
import { Link } from "@/i18n/navigation";
import { gsap, SplitText, EASE_ENTRANCE, motionEnabled } from "@/lib/motion";
import { VideoLoop } from "@/components/media/video-loop";
import type { VideoRendition } from "@/lib/videos";

export type HeroSpec = { label: string; value: string };
export type HeroTickerSlot = { key: string; label: string; video: VideoRendition | null };

/** How long each capability clip holds before crossfading to the next. */
const ROTATE_MS = 7000;

/*
 * Empty-slot backdrop: dark steel gradient + faint blueprint grid, so the
 * film-first hero still looks intentional with zero clips present. The rgba
 * literals are the existing steel-light/white values already used for
 * gradients elsewhere in the marketing pages — no new colors.
 */
const slotFallback = (
  <div className="absolute inset-0">
    <div className="absolute inset-0 bg-[radial-gradient(circle_at_28%_18%,rgba(55,92,251,0.28),transparent_60%)]" />
    <div className="absolute inset-0 opacity-[0.12] [background-image:linear-gradient(rgba(255,255,255,0.4)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.4)_1px,transparent_1px)] [background-size:36px_36px]" />
  </div>
);

/**
 * Film-first hero (workstream 09 §1): full-bleed muted video loop under a
 * ~55% dark gradient, headline on top, and the 4-item capability ticker —
 * the active clip crossfades every ~7s and on ticker click. Slots come from
 * src/content/videos.json via the page, so clips swap without code changes.
 */
export function HomeHero({
  kicker,
  title,
  desc,
  ctaProducts,
  ctaContact,
  specs,
  slots,
}: {
  kicker: string;
  title: string;
  desc: string;
  ctaProducts: string;
  ctaContact: string;
  /** Datasheet-style "spec strip" — the one signature element; hero-only. */
  specs: HeroSpec[];
  /** Capability ticker slots (heavy lifting / torque / bolting / robotics). */
  slots: HeroTickerSlot[];
}) {
  const scope = useRef<HTMLElement>(null);
  const [activeIdx, setActiveIdx] = useState(0);

  /*
   * Entrance choreography (kept from 08 Session A): SplitText masked
   * line-reveal on the headline, staggered rises for the rest. SSR markup is
   * fully visible — MOTION_LEVEL=off / reduced motion never run this, and
   * the headline stays the LCP element.
   */
  useEffect(() => {
    if (!motionEnabled()) return;
    const root = scope.current;
    if (!root) return;

    let cancelled = false;
    let split: SplitText | null = null;
    const ctx = gsap.context(() => {}, root);

    // Split only after webfonts settle, otherwise line boxes are measured
    // against the fallback font and the masks wrap the wrong words.
    document.fonts.ready.then(() => {
      if (cancelled) return;
      ctx.add(() => {
        const h1 = root.querySelector("h1");
        if (!h1) return;

        const tl = gsap.timeline({ defaults: { ease: EASE_ENTRANCE } });

        tl.from('[data-hero="kicker"]', { autoAlpha: 0, y: 16, duration: 0.4 }, 0);

        split = SplitText.create(h1, { type: "lines", mask: "lines" });
        tl.from(
          split.lines,
          {
            yPercent: 110,
            duration: 0.6,
            stagger: 0.08,
            // Restore the original markup after the reveal so window resizes
            // reflow the headline naturally.
            onComplete: () => split?.revert(),
          },
          0.1,
        );

        tl.from('[data-hero="desc"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.4);
        tl.from('[data-hero="ctas"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.5);
        tl.from('[data-hero="ticker"]', { autoAlpha: 0, y: 16, duration: 0.5 }, 0.6);
        tl.from('[data-hero="specs"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.7);
      });
    });

    return () => {
      cancelled = true;
      split?.revert();
      ctx.revert();
    };
  }, []);

  /*
   * Auto-rotation. Recreated whenever activeIdx changes, so a manual ticker
   * click also resets the 7s clock. Fully static modes (off/reduced) never
   * rotate — the ticker then only responds to clicks.
   */
  useEffect(() => {
    if (slots.length < 2 || !motionEnabled()) return;
    const id = window.setInterval(() => {
      if (document.hidden) return;
      setActiveIdx((i) => (i + 1) % slots.length);
    }, ROTATE_MS);
    return () => window.clearInterval(id);
  }, [slots.length, activeIdx]);

  return (
    <section ref={scope} className="relative isolate overflow-hidden bg-[var(--color-ink)]">
      {/* Video stack: all slots mounted for the crossfade, only the active
          one plays (VideoLoop pauses inactive/off-screen ones). */}
      <div aria-hidden className="absolute inset-0">
        {slots.map((slot, i) => (
          <VideoLoop
            key={slot.key}
            video={slot.video}
            eager
            active={i === activeIdx}
            fallback={slotFallback}
            className={`absolute inset-0 transition-opacity duration-1000 ${i === activeIdx ? "opacity-100" : "opacity-0"}`}
          />
        ))}
        {/* ~55% dark wash so white type always clears the footage */}
        <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/50 to-black/35" />
      </div>

      <div className="relative mx-auto flex min-h-[86svh] max-w-[1400px] flex-col justify-end px-6 pb-12 pt-32 md:pt-40">
        <p
          data-hero="kicker"
          className="mb-4 text-xs font-semibold tracking-[0.2em] text-[var(--color-safety-orange)] uppercase"
        >
          {kicker}
        </p>
        <h1 className="max-w-3xl text-4xl md:text-6xl font-bold leading-tight tracking-tight text-white">
          {/* The translated title uses "\n" for its intentional line break. */}
          {title.split("\n").map((part, i) => (
            <span key={i}>
              {i > 0 && <br />}
              {part}
            </span>
          ))}
        </h1>
        <p data-hero="desc" className="mt-6 max-w-xl text-lg text-white/80">
          {desc}
        </p>
        <div data-hero="ctas" className="mt-10 flex flex-wrap gap-4">
          <Link
            href="/products"
            className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] px-6 py-3 text-sm font-semibold text-white transition-transform hover:-translate-y-0.5"
          >
            {ctaProducts}
          </Link>
          <Link
            href="/contact"
            className="rounded-[var(--radius-card)] border border-white/40 px-6 py-3 text-sm font-semibold text-white transition-transform hover:-translate-y-0.5"
          >
            {ctaContact}
          </Link>
        </div>

        {/* Capability ticker — real buttons: click jumps the hero clip. */}
        {slots.length > 0 && (
          <div data-hero="ticker" className="mt-10 flex flex-wrap items-center gap-x-6 gap-y-2">
            {slots.map((slot, i) => (
              <button
                key={slot.key}
                type="button"
                onClick={() => setActiveIdx(i)}
                aria-pressed={i === activeIdx}
                className={`border-b-2 pb-1 font-mono text-[11px] font-semibold uppercase tracking-[0.18em] transition-colors ${
                  i === activeIdx
                    ? "border-[var(--color-safety-orange)] text-white"
                    : "border-transparent text-white/55 hover:text-white/85"
                }`}
              >
                {slot.label}
              </button>
            ))}
          </div>
        )}

        {/* Spec strip — 1px dividers via gap-px over a border-colored backing. */}
        <dl
          data-hero="specs"
          className="mt-12 grid max-w-xl grid-cols-2 gap-px border border-[var(--color-border)] border-t-2 border-t-[var(--color-safety-orange)] bg-[var(--color-border)] font-mono sm:grid-cols-4"
        >
          {specs.map((spec) => (
            <div key={spec.label} className="bg-[var(--color-surface)] px-3 py-2.5">
              <dt className="text-[10px] font-semibold uppercase tracking-[0.15em] text-[var(--color-ink-soft)]">
                {spec.label}
              </dt>
              <dd className="mt-0.5 text-xs font-bold uppercase tracking-wide text-[var(--color-ink)]">
                {spec.value}
              </dd>
            </div>
          ))}
        </dl>
      </div>
    </section>
  );
}
