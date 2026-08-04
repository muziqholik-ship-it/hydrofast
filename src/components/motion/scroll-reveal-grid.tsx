"use client";

import { useEffect, useRef } from "react";
import { gsap, ScrollTrigger, EASE_ENTRANCE, motionEnabled } from "@/lib/motion";

/**
 * ScrollTrigger.batch equivalent of the framer `RevealGrid` — same staggered
 * card-cascade, but driven by the GSAP scroll engine. Homepage only for now;
 * other pages keep the framer version (workstream 08 A3).
 *
 * SSR markup is fully visible; items are only hidden client-side right before
 * the batch reveals them, so MOTION_LEVEL=off / reduced motion / no-JS all
 * render the static grid.
 */
export function ScrollRevealGrid({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!motionEnabled()) return;
    const root = ref.current;
    if (!root) return;

    const items = gsap.utils.toArray<HTMLElement>("[data-reveal-item]", root);
    if (items.length === 0) return;

    gsap.set(items, { autoAlpha: 0, y: 20 });
    const triggers = ScrollTrigger.batch(items, {
      start: "top 90%",
      once: true,
      onEnter: (batch) =>
        gsap.to(batch, { autoAlpha: 1, y: 0, duration: 0.5, ease: EASE_ENTRANCE, stagger: 0.08 }),
    });

    return () => {
      triggers.forEach((t) => t.kill());
      gsap.set(items, { clearProps: "opacity,visibility,transform" });
    };
  }, []);

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  );
}

export function ScrollRevealItem({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  return (
    <div data-reveal-item className={className}>
      {children}
    </div>
  );
}
