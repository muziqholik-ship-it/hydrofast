"use client";

import { useEffect, useRef, useSyncExternalStore } from "react";
import Lenis from "lenis";
import "lenis/dist/lenis.css";
import { usePathname } from "@/i18n/navigation";
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

  const pathname = usePathname();
  const lenisRef = useRef<Lenis | null>(null);

  const reducedMotion = useSyncExternalStore(
    subscribeReducedMotion,
    () => window.matchMedia(REDUCED_MOTION_QUERY).matches,
    () => false, // server snapshot; Lenis only ever starts client-side
  );

  useEffect(() => {
    if (MOTION_LEVEL !== "full" || reducedMotion) return;

    const lenis = new Lenis({ anchors: true });
    lenisRef.current = lenis;

    lenis.on("scroll", ScrollTrigger.update);

    const tick = (time: number) => {
      lenis.raf(time * 1000); // gsap ticker time is in seconds
    };
    gsap.ticker.add(tick);
    gsap.ticker.lagSmoothing(0);

    return () => {
      gsap.ticker.remove(tick);
      lenis.destroy();
      lenisRef.current = null;
    };
  }, [reducedMotion]);

  /*
   * Land new routes at the top.
   *
   * This component lives in the layout, so Lenis survives navigation and keeps
   * the scroll offset it held on the previous page. Next does reset the window
   * on a route change, but Lenis re-applies its own retained offset on the next
   * rAF and wins — so following a link from the foot of a long page dropped the
   * reader partway down the new one (measured: /about opened 4,694px in).
   *
   * A link that carries a hash goes to its target instead. Lenis's `anchors`
   * option only intercepts clicks within the current page, so arriving at
   * /cases#case-<id> from the homepage card previously landed wherever the
   * reader happened to be. Falling back to the top when the id isn't on the
   * page beats stranding them at a stale offset.
   *
   * The #main skip link doesn't come through here — it changes the hash without
   * changing the pathname, so Lenis keeps handling it.
   */
  useEffect(() => {
    const lenis = lenisRef.current;
    if (!lenis) return;

    const hash = window.location.hash;
    const target = hash ? document.getElementById(decodeURIComponent(hash.slice(1))) : null;

    if (target) lenis.scrollTo(target, { immediate: true });
    else lenis.scrollTo(0, { immediate: true, force: true });
  }, [pathname]);

  return <>{children}</>;
}
