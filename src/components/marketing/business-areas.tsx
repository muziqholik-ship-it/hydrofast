"use client";

import { useRef, useState } from "react";
import { Link } from "@/i18n/navigation";
import type { BusinessAreaContent } from "@/content/business-areas";
import type { Locale } from "@/i18n/routing";
import type { VideoRendition } from "@/lib/videos";
import { gsap, MOTION_LEVEL, useHydrated, useIsomorphicLayoutEffect, useMediaQuery } from "@/lib/motion";
import type { ScrollTrigger } from "@/lib/motion";
import { FluidText, type FluidLevelSource } from "@/components/motion/fluid-text";
import { VideoLoop } from "@/components/media/video-loop";
import { SectionHeading } from "@/components/marketing/section-heading";
import { ScrollRevealGrid, ScrollRevealItem } from "@/components/motion/scroll-reveal-grid";
import { AreaCard } from "@/components/marketing/area-card";

type LevelEmitter = FluidLevelSource & { set(v: number): void };

function createLevelEmitter(): LevelEmitter {
  const listeners = new Set<(v: number) => void>();
  return {
    subscribe(listener) {
      listeners.add(listener);
      return () => listeners.delete(listener);
    },
    set(v) {
      listeners.forEach((l) => l(v));
    },
  };
}

/**
 * 사업 분야 section (workstream 09 §1 / F1).
 *
 * Desktop (≥lg) at MOTION_LEVEL=full without reduced-motion: a pinned
 * horizontal scroller — vertical scroll slides five full-height panels, each
 * backed by its own VideoLoop (dark wash + 8% area-accent wash), a huge mono
 * area index, and an oil-fill heading whose level is driven by the panel's
 * distance from center (fills approaching, drains leaving — bidirectional
 * with the scrub). Only the active ±1 panels' videos play.
 *
 * Everything else (mobile, lite/off, reduced motion, SSR/no-JS) renders the
 * existing vertical card grid — cards pick up video posters as thumbnails
 * where clips exist.
 */
export function BusinessAreas({
  title,
  locale,
  areas,
  videos,
}: {
  title: string;
  locale: Locale;
  areas: BusinessAreaContent[];
  videos: Record<string, VideoRendition | null>;
}) {
  const hydrated = useHydrated();
  const lgViewport = useMediaQuery("(min-width: 1024px)");
  const reducedMotion = useMediaQuery("(prefers-reduced-motion: reduce)");
  const horizontal =
    hydrated && lgViewport && !reducedMotion && MOTION_LEVEL === "full" && areas.length > 1;

  const sectionRef = useRef<HTMLDivElement>(null);
  const trackRef = useRef<HTMLDivElement>(null);
  const stRef = useRef<ScrollTrigger | null>(null);
  const [activeIdx, setActiveIdx] = useState(0);
  const [levelSources] = useState<LevelEmitter[]>(() =>
    Array.from({ length: areas.length }, createLevelEmitter),
  );

  // MUST be a layout effect: the pin re-parents the section into a
  // pin-spacer, and only layout-effect cleanups run early enough for
  // ctx.revert() to unwrap it before React removes the nodes (otherwise:
  // NotFoundError removeChild on unmount/HMR/viewport flips).
  useIsomorphicLayoutEffect(() => {
    if (!horizontal) return;
    const section = sectionRef.current;
    const track = trackRef.current;
    if (!section || !track) return;
    const n = areas.length;

    const ctx = gsap.context(() => {
      const tween = gsap.to(track, {
        xPercent: (-100 * (n - 1)) / n,
        ease: "none",
        scrollTrigger: {
          trigger: section,
          pin: true,
          scrub: 0.6,
          start: "top top",
          end: `+=${(n - 1) * 100}%`,
          anticipatePin: 1,
          onUpdate(self) {
            const pos = self.progress * (n - 1);
            // Oil level per panel: pours in during the slide that reveals
            // the panel and is completely full by ~40% into the reveal
            // (|Δ| ≤ 0.6), staying full the whole time its image is on
            // screen, draining symmetrically as it slides away — scrubbing
            // back refills it. Each heading fills at its own card, in order.
            levelSources.forEach((source, i) =>
              source.set(Math.min(Math.max((1 - Math.abs(pos - i)) * 2.7, 0), 1.08)),
            );
            const idx = Math.round(pos);
            setActiveIdx((prev) => (prev === idx ? prev : idx));
          },
        },
      });
      stRef.current = tween.scrollTrigger ?? null;
    }, section);

    return () => {
      stRef.current = null;
      ctx.revert();
    };
  }, [horizontal, areas.length, levelSources]);

  /*
   * Keyboard a11y (F2): panels stay in DOM order and their links are
   * tabbable, but a focused link inside the translated track could sit
   * off-screen — so focus jumps the window scroll to that panel's position
   * in the scrub. Native scroll is never hijacked, so PageDown/space/arrows
   * keep scrolling the page straight through the pin.
   */
  const focusPanel = (i: number) => {
    const st = stRef.current;
    if (!st || areas.length < 2) return;
    const y = st.start + ((st.end - st.start) * i) / (areas.length - 1);
    window.scrollTo({ top: y, behavior: "auto" });
  };

  const label = (area: BusinessAreaContent) =>
    locale === "ko" ? area.name.ko : (area.name.en ?? area.name.ko);
  const summary = (area: BusinessAreaContent) =>
    locale === "ko" ? area.summary.ko : (area.summary.en ?? area.summary.ko);

  if (!horizontal) {
    return (
      <section className="mx-auto max-w-[1400px] px-6 py-20">
        <SectionHeading title={title} fluid />
        <ScrollRevealGrid className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5">
          {areas.map((area) => (
            <ScrollRevealItem key={area.slug}>
              <AreaCard area={area} locale={locale} poster={videos[area.slug]?.poster ?? null} />
            </ScrollRevealItem>
          ))}
        </ScrollRevealGrid>
      </section>
    );
  }

  return (
    <section className="py-20">
      <div className="mx-auto max-w-[1400px] px-6">
        <SectionHeading title={title} fluid />
      </div>
      <div ref={sectionRef} className="relative overflow-hidden bg-[var(--color-ink)]">
        <div ref={trackRef} className="flex h-screen w-max">
          {areas.map((area, i) => (
            <article
              key={area.slug}
              className="relative flex h-full w-screen shrink-0 items-end overflow-hidden"
            >
              {/* Per-panel loop: lazy, and only the active ±1 panels play.
                  Until a clip (or its poster) exists, the panel keeps the
                  area's own CMS imagery — the washes above it handle
                  legibility; the gradient is only a last resort for areas
                  with no image at all. */}
              <VideoLoop
                video={videos[area.slug] ?? null}
                active={Math.abs(i - activeIdx) <= 1}
                className="absolute inset-0"
                fallback={
                  area.heroImage || area.cardImage ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img
                      src={area.heroImage || area.cardImage}
                      alt=""
                      loading="lazy"
                      decoding="async"
                      className="absolute inset-0 h-full w-full object-cover saturate-[0.7]"
                    />
                  ) : (
                    <div className="absolute inset-0">
                      <div
                        className="absolute inset-0"
                        style={{
                          background: `radial-gradient(circle at 30% 25%, ${area.accent}40, transparent 60%)`,
                        }}
                      />
                      <div className="absolute inset-0 opacity-[0.1] [background-image:linear-gradient(rgba(255,255,255,0.4)_1px,transparent_1px),linear-gradient(90deg,rgba(255,255,255,0.4)_1px,transparent_1px)] [background-size:36px_36px]" />
                    </div>
                  )
                }
              />
              {/* dark wash + 8% area-accent wash (09 F1) */}
              <div aria-hidden className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/55 to-black/40" />
              <div aria-hidden className="absolute inset-0" style={{ backgroundColor: area.accent, opacity: 0.08 }} />

              <div className="relative z-10 mx-auto flex h-full w-full max-w-[1400px] flex-col justify-end px-6 pb-20 pt-28">
                <div aria-hidden className="pointer-events-none select-none font-mono text-8xl font-black leading-none text-white/10 xl:text-9xl">
                  {area.index}
                </div>
                <h3 className="mt-6 max-w-2xl text-3xl font-bold tracking-tight xl:text-4xl">
                  {/* Each area fills with its own accent color, not the shared amber. */}
                  <FluidText
                    text={label(area)}
                    mode="scrub"
                    levelSource={levelSources[i]}
                    color={area.accent}
                  />
                </h3>
                <p className="mt-2 font-mono text-[11px] font-semibold uppercase tracking-[0.18em] text-white/55">
                  {area.nameEn}
                </p>
                <p className="mt-4 max-w-xl text-white/75">{summary(area)}</p>
                <Link
                  href={`/business/${area.slug}`}
                  onFocus={() => focusPanel(i)}
                  className="mt-6 inline-block text-sm font-semibold text-white underline-offset-4 hover:underline"
                  style={{ textDecorationColor: area.accent }}
                >
                  {locale === "ko" ? "자세히 보기 →" : "Learn more →"}
                </Link>
              </div>
            </article>
          ))}
        </div>
      </div>
    </section>
  );
}
