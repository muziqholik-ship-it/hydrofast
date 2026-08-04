"use client";

import { MotionConfig } from "framer-motion";
import { MOTION_LEVEL } from "@/lib/motion";

/**
 * Wraps the whole app once so every Framer Motion animation respects
 * prefers-reduced-motion automatically, without per-component checks.
 * MOTION_LEVEL=off forces reduced mode for all framer micro-interactions
 * (the GSAP scroll system checks the level itself — see lib/motion.ts).
 */
export function MotionProvider({ children }: { children: React.ReactNode }) {
  return (
    <MotionConfig reducedMotion={MOTION_LEVEL === "off" ? "always" : "user"}>{children}</MotionConfig>
  );
}
