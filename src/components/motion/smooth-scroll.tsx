"use client";

import { useEffect, useSyncExternalStore } from "react";
import Lenis from "lenis";
import "lenis/dist/lenis.css";
import { gsap, ScrollTrigger, MOTION_LEVEL, useScrollTriggerCleanup } from "@/lib/motion";

const REDUCED_MOTION_QUERY = "(prefers-reduced-motion: reduce)";

function subscribeReducedMotion(onChange: () => void) {
  const mql = window.matchMedia(REDUCED_MOTION_QUERY);
  mql.addEventListener("change", onChange);
  return () => mql.removeEventListener("change", onChange);
}

/**
 * Site-wide Lenis smooth scroll, synced with ScrollTrigger via the official
 * recipe from the Lenis README (scroll → ScrollTrigger.update, raf driven by
 * the gsap ticker, lagSmoothing off). Renders nothing itself — Lenis wraps the
 * window's native scroll, so sticky positioning, anchors (#main skip link,
 * /cases#case-id) and keyboard scrolling keep working.
 *
 * Disabled entirely (native scroll) when MOTION_LEVEL !== "full" or the OS
 * asks for reduced motion — including mid-session preference changes.
 */
export function SmoothScroll({ children }: { children: React.ReactNode }) {
  useScrollTriggerCleanup();

  const reducedMotion = useSyncExternalStore(
    subscribeReducedMotion,
    () => window.matchMedia(REDUCED_MOTION_QUERY).matches,
    () => false, // server snapshot; Lenis only ever starts client-side
  );

  useEffect(() => {
    if (MOTION_LEVEL !== "full" || reducedMotion) return;

    const lenis = new Lenis({ anchors: true });

    lenis.on("scroll", ScrollTrigger.update);

    const tick = (time: number) => {
      lenis.raf(time * 1000); // gsap ticker time is in seconds
    };
    gsap.ticker.add(tick);
    gsap.ticker.lagSmoothing(0);

    return () => {
      gsap.ticker.remove(tick);
      lenis.destroy();
    };
  }, [reducedMotion]);

  return <>{children}</>;
}
