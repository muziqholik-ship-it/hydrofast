"use client";

/**
 * Central motion module for the GSAP/Lenis scroll system (see
 * docs/improvement-plan/07-design-motion-report.md). Everything animation-
 * related imports gsap from HERE so plugin registration happens exactly once.
 *
 * Client-only: constants like MOTION_LEVEL must not be imported from server
 * components (pages decide nothing server-side; motion is a client concern).
 */

import { useEffect } from "react";
import { useLocale } from "next-intl";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
import { SplitText } from "gsap/SplitText";
import { usePathname } from "@/i18n/navigation";

if (typeof window !== "undefined") {
  gsap.registerPlugin(ScrollTrigger, SplitText);
}

export { gsap, ScrollTrigger, SplitText };

export type MotionLevel = "full" | "lite" | "off";

/**
 * Owner kill-switch (NEXT_PUBLIC_MOTION_LEVEL, see .env.example):
 *  - "full": Lenis smooth scroll + scrubbed ScrollTrigger choreography
 *  - "lite": no smooth scroll / no scrub; cheap time-based entrances only
 *  - "off":  fully static page, no JS-driven motion at all
 * Unset/unknown values mean "full".
 */
const raw = process.env.NEXT_PUBLIC_MOTION_LEVEL;
export const MOTION_LEVEL: MotionLevel = raw === "off" || raw === "lite" ? raw : "full";

/** Motion grammar (report §3): mechanical eases only — no bounce/overshoot. */
export const EASE_MECHANICAL = "power2.inOut";
export const EASE_ENTRANCE = "power2.out";

/** Read at effect time (never during render) so SSR/hydration stay untouched. */
export function prefersReducedMotion(): boolean {
  return typeof window !== "undefined" && window.matchMedia("(prefers-reduced-motion: reduce)").matches;
}

/** True when JS-driven motion may run at all ("full" or "lite", no OS override). */
export function motionEnabled(): boolean {
  return MOTION_LEVEL !== "off" && !prefersReducedMotion();
}

/**
 * Safety net against ScrollTrigger leaks across next-intl navigations.
 *
 * Components own their triggers and kill them on unmount, so this only sweeps
 * strays: after each route/locale change it kills any trigger whose element
 * has left the DOM. It deliberately does NOT killAll() — parent effects run
 * after child effects, so a blanket kill here would destroy the triggers the
 * incoming page just created. A refresh follows because the new page has a
 * different height and pin/scrub positions must be recomputed.
 */
export function useScrollTriggerCleanup() {
  const pathname = usePathname();
  const locale = useLocale();

  useEffect(() => {
    ScrollTrigger.getAll().forEach((st) => {
      const el = st.trigger;
      if (el instanceof Element && !el.isConnected) st.kill();
    });
    ScrollTrigger.refresh();
  }, [pathname, locale]);
}
