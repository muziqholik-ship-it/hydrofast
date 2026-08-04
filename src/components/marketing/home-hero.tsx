"use client";

import { useEffect, useRef, useState } from "react";
import dynamic from "next/dynamic";
import { Link } from "@/i18n/navigation";
import {
  gsap,
  SplitText,
  EASE_ENTRANCE,
  MOTION_LEVEL,
  motionEnabled,
  prefersReducedMotion,
  useMediaQuery,
} from "@/lib/motion";
import { createHeroProgress } from "@/lib/hero-progress";

/*
 * The WebGL scene ships as its own lazy chunk: home-hero must never import
 * three/fiber/drei statically or the ~1 MB Three chunk lands in first-load JS.
 */
const HeroCanvas = dynamic(
  () => import("@/components/three/hero-canvas").then((m) => m.HeroCanvas),
  { ssr: false },
);

/** Optional real-CAD GLB (Route A swap seam — scripts/convert-step-to-glb.md). */
const HERO_MODEL_URL = process.env.NEXT_PUBLIC_HERO_MODEL_URL || null;

const POSTER_URL = "/hero-poster.webp";

export type HeroSpec = { label: string; value: string };

export function HomeHero({
  kicker,
  title,
  desc,
  ctaProducts,
  ctaContact,
  specs,
  imageUrl,
  imageAlt,
  pressureBar,
  readoutLabel,
}: {
  kicker: string;
  title: string;
  desc: string;
  ctaProducts: string;
  ctaContact: string;
  /** Datasheet-style "spec strip" — the one signature element; hero-only. */
  specs: HeroSpec[];
  imageUrl: string | null;
  imageAlt: string;
  /** Max working pressure from admin settings — drives the scrubbed readout. */
  pressureBar: number;
  readoutLabel: string;
}) {
  const scope = useRef<HTMLElement>(null);
  const [heroProgress] = useState(createHeroProgress);
  const desktop = useMediaQuery("(min-width: 768px)");
  const reducedMotion = useMediaQuery("(prefers-reduced-motion: reduce)");
  const [afterLcp, setAfterLcp] = useState(false);

  /*
   * Scene panel mode (workstream 08 B1/B4):
   *  - "canvas": full level, ≥768px, mounted only after LCP settles
   *  - "poster": lite (any width) or full on mobile — static webp of the scene
   *  - "static": off / reduced motion / SSR — the v1 photo panel
   */
  const sceneMode =
    MOTION_LEVEL === "off" || reducedMotion
      ? "static"
      : MOTION_LEVEL === "full"
        ? desktop
          ? afterLcp
            ? "canvas"
            : "static"
          : "poster"
        : "poster";

  useEffect(() => {
    if (MOTION_LEVEL !== "full") return;
    const show = () => setAfterLcp(true);
    let idleId: number | undefined;
    let timeoutId: number | undefined;
    if (typeof window.requestIdleCallback === "function") {
      idleId = window.requestIdleCallback(show, { timeout: 2500 });
    } else {
      timeoutId = window.setTimeout(show, 400);
    }
    return () => {
      if (idleId !== undefined) window.cancelIdleCallback(idleId);
      if (timeoutId !== undefined) window.clearTimeout(timeoutId);
    };
  }, []);

  /*
   * Entrance choreography (GSAP SplitText line-reveal per workstream 08 A2).
   * SSR markup is fully visible — with MOTION_LEVEL=off or reduced motion this
   * effect bails and the static page IS the final state; it also keeps the
   * headline as the LCP element for crawlers/no-JS.
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
            // Splitting leaves wrapped line boxes in the DOM; once the reveal
            // is done, restore the original markup so window resizes reflow
            // the headline naturally.
            onComplete: () => split?.revert(),
          },
          0.1,
        );

        tl.from('[data-hero="desc"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.4);
        tl.from('[data-hero="ctas"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.5);
        tl.from('[data-hero="specs"]', { autoAlpha: 0, y: 24, duration: 0.5 }, 0.6);
        tl.from('[data-hero="image"]', { autoAlpha: 0, scale: 1.03, duration: 0.8 }, 0.15);
      });
    });

    return () => {
      cancelled = true;
      split?.revert();
      ctx.revert();
    };
  }, []);

  /*
   * Pinned scroll choreography (workstream 08 B3): the hero pins for an extra
   * 150vh while one scrubbed tween drives (a) the 0→max bar readout(s) and
   * (b) the 3D scene via heroProgress (camera orbit + piston stroke — the
   * canvas subscribes if/when it mounts, so this also runs against the poster
   * on mobile: the readout keeps mobile from being motionless).
   * SSR/off/reduced show the readout at max — never regress that.
   */
  useEffect(() => {
    if (MOTION_LEVEL !== "full" || prefersReducedMotion()) return;
    const root = scope.current;
    if (!root) return;

    const readouts = root.querySelectorAll<HTMLElement>("[data-hero-readout]");
    const ctx = gsap.context(() => {
      const state = { p: 0 };
      gsap.to(state, {
        p: 1,
        ease: "none",
        scrollTrigger: {
          trigger: root,
          start: "top top",
          end: "+=150%",
          pin: true,
          scrub: 0.8,
          anticipatePin: 1,
        },
        onUpdate() {
          const text = Math.round(state.p * pressureBar).toLocaleString("en-US");
          readouts.forEach((el) => {
            el.textContent = text;
          });
          heroProgress.set(state.p);
        },
      });
    }, root);

    return () => ctx.revert();
  }, [pressureBar, heroProgress]);

  const readoutChip = (extraClass: string) => (
    // Decorative duplicate of the spec-strip pressure figure (hence
    // aria-hidden) — screen readers keep the stable value in the <dl>.
    <div
      aria-hidden
      className={`pointer-events-none border border-[var(--color-border)] border-t-2 border-t-[var(--color-safety-orange)] bg-[var(--color-surface)]/90 px-3 py-2 font-mono backdrop-blur-sm ${extraClass}`}
    >
      <div className="text-[10px] font-semibold uppercase tracking-[0.15em] text-[var(--color-ink-soft)]">
        {readoutLabel}
      </div>
      <div className="text-xl font-bold tracking-tight text-[var(--color-ink)]">
        <span data-hero-readout>{pressureBar.toLocaleString("en-US")}</span>
        <span className="ml-1 text-sm">bar</span>
      </div>
    </div>
  );

  /* Photo panel: real ETO build, desaturated with a steel duotone overlay so
     brand colors stay dominant. The static baseline (off / reduced / SSR) and
     the underlay while the WebGL chunk loads; falls back to a blueprint-grid
     panel when no image URL could be resolved. */
  const photoPanel = imageUrl ? (
    <>
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img
        src={imageUrl}
        alt={imageAlt}
        fetchPriority="high"
        decoding="async"
        className="absolute inset-0 h-full w-full object-cover saturate-[0.4]"
      />
      <div aria-hidden className="absolute inset-0 bg-[var(--color-steel)] opacity-40 mix-blend-multiply" />
      <div
        aria-hidden
        className="absolute inset-0 bg-gradient-to-t from-[var(--color-steel)]/40 to-transparent mix-blend-multiply"
      />
    </>
  ) : (
    <div
      aria-hidden
      className="absolute inset-0 bg-[var(--color-surface-alt)] opacity-60 [background-image:linear-gradient(var(--color-border)_1px,transparent_1px),linear-gradient(90deg,var(--color-border)_1px,transparent_1px)] [background-size:32px_32px]"
    />
  );

  return (
    <section ref={scope} className="relative overflow-hidden bg-[var(--color-surface)]">
      <div className="absolute inset-0 -z-10 bg-[radial-gradient(circle_at_top_right,rgba(55,92,251,0.08),transparent_60%)]" />
      <div className="mx-auto grid max-w-[1400px] grid-cols-1 items-stretch gap-10 px-6 pb-14 pt-16 md:pt-24 lg:grid-cols-[1.15fr_1fr] lg:gap-14 lg:pb-24">
        <div className="lg:py-12">
          <p
            data-hero="kicker"
            className="mb-4 text-xs font-semibold tracking-[0.2em] text-[var(--color-safety-orange)] uppercase"
          >
            {kicker}
          </p>
          <h1 className="max-w-3xl text-4xl md:text-6xl font-bold leading-tight tracking-tight text-[var(--color-ink)]">
            {/* The translated title uses "\n" for its intentional line break. */}
            {title.split("\n").map((part, i) => (
              <span key={i}>
                {i > 0 && <br />}
                {part}
              </span>
            ))}
          </h1>
          <p data-hero="desc" className="mt-6 max-w-xl text-lg text-[var(--color-ink-soft)]">
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
              className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-6 py-3 text-sm font-semibold text-[var(--color-ink)] transition-transform hover:-translate-y-0.5"
            >
              {ctaContact}
            </Link>
          </div>

          {/* Mobile readout: during the pinned scrub the scene panel sits
              below the fold, so the counting element lives up here (<md). */}
          <div className="mt-8 md:hidden">{readoutChip("inline-block")}</div>

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

        {/* Scene panel: WebGL cylinder at full/desktop, poster on mobile/lite,
            v1 photo when static. The photo stays as the underlay in canvas
            mode so nothing flashes while the Three chunk streams in — the
            canvas wrapper brings its own opaque backdrop and fades over it. */}
        <div
          data-hero="image"
          className="relative min-h-56 w-full overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] sm:min-h-72 lg:min-h-0"
        >
          {sceneMode === "poster" ? (
            <HeroPoster fallback={photoPanel} imageAlt={imageAlt} />
          ) : (
            photoPanel
          )}
          {sceneMode === "canvas" && <HeroCanvas progress={heroProgress} modelUrl={HERO_MODEL_URL} />}
          <div className="absolute bottom-4 left-4 z-10 hidden md:block">{readoutChip("")}</div>
        </div>
      </div>
    </section>
  );
}

/** Poster of the composed 3D scene; falls back to the photo panel until the
    owner captures one (dev: /?capture=1 — see scripts/convert-step-to-glb.md). */
function HeroPoster({ fallback, imageAlt }: { fallback: React.ReactNode; imageAlt: string }) {
  const [failed, setFailed] = useState(false);
  if (failed) return <>{fallback}</>;
  return (
    // eslint-disable-next-line @next/next/no-img-element
    <img
      src={POSTER_URL}
      alt={imageAlt}
      decoding="async"
      onError={() => setFailed(true)}
      className="absolute inset-0 h-full w-full object-cover"
    />
  );
}
