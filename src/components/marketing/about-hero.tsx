"use client";

import { useCallback, useEffect, useState, useSyncExternalStore } from "react";
import { motion } from "framer-motion";
import { MOTION_LEVEL, motionEnabled } from "@/lib/motion";

const ease = [0.16, 1, 0.3, 1] as const;

/** How long each background image holds before crossfading to the next. */
const ROTATE_MS = 3500;

/** Fisher–Yates. */
function shuffle(length: number) {
  const order = Array.from({ length }, (_, i) => i);
  for (let i = length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [order[i], order[j]] = [order[j], order[i]];
  }
  return order;
}

/** The order never changes after it's drawn, so there is nothing to subscribe to. */
const noopSubscribe = () => () => {};

// Snapshot caches. `useSyncExternalStore` calls its getters on every render
// and compares by reference, so each side has to hand back the *same* array
// every time — drawing a fresh shuffle per call would loop forever.
let clientOrder: number[] = [];
let serverOrder: number[] = [];

/**
 * The order the backdrop cycles through: identity on the server and for the
 * hydration pass, then one random draw per page load.
 *
 * It has to arrive as an external store rather than a `useState` seed — the
 * server would draw a different order than the client and hydration would
 * mismatch — and drawing it in an effect instead trips
 * react-hooks/set-state-in-effect.
 *
 * At MOTION_LEVEL=off the draw is skipped: the hero has to stay on the frame
 * the server rendered, or the kill switch would still produce one crossfade.
 */
function useRotationOrder(length: number) {
  const getSnapshot = useCallback(() => {
    if (clientOrder.length !== length) {
      clientOrder = MOTION_LEVEL === "off" ? Array.from({ length }, (_, i) => i) : shuffle(length);
    }
    return clientOrder;
  }, [length]);
  const getServerSnapshot = useCallback(() => {
    if (serverOrder.length !== length) serverOrder = Array.from({ length }, (_, i) => i);
    return serverOrder;
  }, [length]);
  return useSyncExternalStore(noopSubscribe, getSnapshot, getServerSnapshot);
}

export function AboutHero({
  kicker,
  title,
  tagline,
  bgImages,
}: {
  kicker: string;
  title: string;
  tagline: string;
  /** Rotating backdrop images; the first one is the SSR/static frame. */
  bgImages: string[];
}) {
  const order = useRotationOrder(bgImages.length);
  const [step, setStep] = useState(0);
  const activeIdx = order[step % order.length] ?? 0;

  // Auto-rotation — skipped entirely under MOTION_LEVEL=off / reduced motion,
  // and paused while the tab is hidden (same discipline as the home hero).
  useEffect(() => {
    if (bgImages.length < 2 || !motionEnabled()) return;
    const id = window.setInterval(() => {
      if (document.hidden) return;
      setStep((s) => s + 1);
    }, ROTATE_MS);
    return () => window.clearInterval(id);
  }, [bgImages.length]);

  return (
    <section className="relative overflow-hidden border-b border-[var(--color-border)] bg-[var(--color-steel)]">
      {/* All frames stay mounted for the crossfade; only opacity changes. */}
      <div aria-hidden className="absolute inset-0">
        {bgImages.map((src, i) => (
          /* eslint-disable-next-line @next/next/no-img-element */
          <img
            key={src}
            src={src}
            alt=""
            loading={i === 0 ? "eager" : "lazy"}
            decoding="async"
            className={`absolute inset-0 h-full w-full object-cover transition-opacity duration-1000 motion-reduce:transition-none ${
              i === activeIdx ? "opacity-100" : "opacity-0"
            }`}
          />
        ))}
        {/* Brand-gradient mask: dark only on the left where the type sits,
            fading to near-transparent so the imagery stays clearly visible. */}
        <div
          className="absolute inset-0"
          style={{ background: "linear-gradient(120deg, rgba(31,58,99,0.88) 0%, rgba(31,58,99,0.55) 45%, rgba(31,58,99,0.12) 100%)" }}
        />
      </div>
      <div className="relative mx-auto max-w-[1400px] px-6 py-28 md:py-36 text-white">
        <motion.p
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5, ease }}
          className="text-xs font-semibold uppercase tracking-[0.3em] text-[var(--color-safety-orange)]"
        >
          {kicker}
        </motion.p>
        <motion.h1
          initial={{ opacity: 0, y: 24 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease, delay: 0.1 }}
          className="mt-4 max-w-3xl text-3xl md:text-5xl font-bold tracking-tight"
        >
          {title}
        </motion.h1>
        <motion.p
          initial={{ opacity: 0, y: 24 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, ease, delay: 0.2 }}
          className="mt-4 text-lg font-medium tracking-wide opacity-90"
        >
          {tagline}
        </motion.p>
      </div>
    </section>
  );
}
