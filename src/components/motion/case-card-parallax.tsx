"use client";

import { useEffect, useRef } from "react";
import { gsap, EASE_ENTRANCE, MOTION_LEVEL, prefersReducedMotion } from "@/lib/motion";

/**
 * Homepage case-study card motion (workstream 08 A3 / report §3): the card
 * rises 24px → 0 and its cover image settles from scale 1.06 → 1.0, both
 * scrub-linked to scroll. The image tween targets the `[data-parallax-img]`
 * wrapper inside CaseStudyCard so the CSS hover zoom on the <img> itself
 * keeps working.
 *
 * "lite" degrades to a one-shot entrance; "off"/reduced-motion stay static.
 */
export function CaseCardParallax({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (MOTION_LEVEL === "off" || prefersReducedMotion()) return;
    const el = ref.current;
    if (!el) return;

    const ctx = gsap.context(() => {
      if (MOTION_LEVEL === "full") {
        gsap.fromTo(
          el,
          { y: 24 },
          {
            y: 0,
            ease: "none",
            scrollTrigger: { trigger: el, start: "top 95%", end: "top 55%", scrub: 0.8 },
          },
        );
        const img = el.querySelector("[data-parallax-img]");
        if (img) {
          gsap.fromTo(
            img,
            { scale: 1.06 },
            {
              scale: 1,
              ease: "none",
              scrollTrigger: { trigger: el, start: "top 95%", end: "top 40%", scrub: 0.8 },
            },
          );
        }
        return;
      }

      // "lite": simple time-based reveal on first view, no scrub.
      gsap.from(el, {
        autoAlpha: 0,
        y: 20,
        duration: 0.5,
        ease: EASE_ENTRANCE,
        scrollTrigger: { trigger: el, start: "top 90%", once: true },
      });
    }, ref);

    return () => ctx.revert();
  }, []);

  return (
    <div ref={ref} className={className}>
      {children}
    </div>
  );
}
