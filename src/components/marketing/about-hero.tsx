"use client";

import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { motionEnabled } from "@/lib/motion";

const ease = [0.16, 1, 0.3, 1] as const;

/** How long each background image holds before crossfading to the next. */
const ROTATE_MS = 6000;

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
  const [activeIdx, setActiveIdx] = useState(0);

  // Auto-rotation — skipped entirely under MOTION_LEVEL=off / reduced motion,
  // and paused while the tab is hidden (same discipline as the home hero).
  useEffect(() => {
    if (bgImages.length < 2 || !motionEnabled()) return;
    const id = window.setInterval(() => {
      if (document.hidden) return;
      setActiveIdx((i) => (i + 1) % bgImages.length);
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
            className={`absolute inset-0 h-full w-full object-cover transition-opacity duration-1000 ${
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
