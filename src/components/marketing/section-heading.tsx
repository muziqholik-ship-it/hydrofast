"use client";

import { motion } from "framer-motion";
import { FluidText } from "@/components/motion/fluid-text";

export function SectionHeading({
  kicker,
  title,
  sub,
  align = "left",
  as: Heading = "h2",
  fluid = false,
}: {
  kicker?: string;
  title: string;
  sub?: string;
  align?: "left" | "center";
  /** Pass "h1" when this is the page's top-level heading (each page needs exactly one h1). */
  as?: "h1" | "h2";
  /** Oil-fill scrub treatment (workstream 09) — signature use only: the
      homepage 사업 분야 heading. Do not sprinkle elsewhere. */
  fluid?: boolean;
}) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 16 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true, margin: "-10%" }}
      transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
      className={`mb-10 ${align === "center" ? "text-center" : ""}`}
    >
      {kicker && (
        <p className="mb-2 text-xs font-semibold uppercase tracking-[0.2em] text-[var(--color-safety-orange)]">
          {kicker}
        </p>
      )}
      <Heading className="text-2xl md:text-3xl font-bold tracking-tight">
        {fluid ? <FluidText text={title} mode="scrub" /> : title}
      </Heading>
      {sub && <p className="mt-3 max-w-2xl text-[var(--color-ink-soft)]">{sub}</p>}
    </motion.div>
  );
}
