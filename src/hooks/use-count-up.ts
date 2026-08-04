"use client";

import { useEffect, useRef, useState } from "react";
import { gsap, MOTION_LEVEL, prefersReducedMotion } from "@/lib/motion";

/**
 * Animated stat counter (workstream 08 A2).
 *
 * Server/initial markup always shows the final value so crawlers, link
 * previews, and no-JS visitors never see a 0 — do not regress this.
 *
 * After mount the behavior depends on the motion level:
 *  - "full": the count is scrubbed — progress is tied to a ScrollTrigger as
 *    the element travels up the viewport (scrolling back rewinds it).
 *  - "lite": the original time-based count-up, once, when scrolled into view.
 *  - "off" / prefers-reduced-motion: stays static at `target`.
 */
export function useCountUp(target: number, durationMs = 1400) {
  const ref = useRef<HTMLElement>(null);
  const [value, setValue] = useState(target);

  useEffect(() => {
    const el = ref.current;
    if (!el || MOTION_LEVEL === "off" || prefersReducedMotion()) return;

    if (MOTION_LEVEL === "full") {
      const state = { progress: 0 };
      const tween = gsap.to(state, {
        progress: 1,
        ease: "none",
        onUpdate: () => setValue(Math.round(state.progress * target)),
        scrollTrigger: {
          trigger: el,
          start: "top 92%",
          end: "top 55%",
          scrub: 0.6,
        },
      });
      return () => {
        tween.scrollTrigger?.kill();
        tween.kill();
      };
    }

    // "lite": count up over durationMs the first time the element is in view.
    let raf = 0;
    let started = false;
    const observer = new IntersectionObserver(
      (entries) => {
        if (started || !entries.some((e) => e.isIntersecting)) return;
        started = true;
        observer.disconnect();
        const startTime = performance.now();
        const tick = (now: number) => {
          const progress = Math.min((now - startTime) / durationMs, 1);
          const eased = 1 - Math.pow(1 - progress, 3);
          setValue(Math.round(eased * target));
          if (progress < 1) raf = requestAnimationFrame(tick);
        };
        setValue(0);
        raf = requestAnimationFrame(tick);
      },
      { rootMargin: "-10% 0px" },
    );
    observer.observe(el);
    return () => {
      observer.disconnect();
      cancelAnimationFrame(raf);
    };
  }, [target, durationMs]);

  return { ref, value };
}
