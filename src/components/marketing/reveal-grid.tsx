"use client";

import { motion, type Variants } from "framer-motion";
import { MOTION_LEVEL } from "@/lib/motion";

const container: Variants = {
  hidden: {},
  show: { transition: { staggerChildren: 0.08 } },
};

const item: Variants = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0, transition: { duration: 0.5, ease: [0.16, 1, 0.3, 1] as const } },
};

/** Staggered card-cascade reveal used for grids across the site (business areas, products, partners). */
export function RevealGrid({
  children,
  className = "",
}: {
  children: React.ReactNode;
  className?: string;
}) {
  // Without an animating parent the items' variants never activate, so the
  // grid renders fully static — the MOTION_LEVEL=off contract.
  if (MOTION_LEVEL === "off") {
    return <div className={className}>{children}</div>;
  }
  return (
    <motion.div
      variants={container}
      initial="hidden"
      whileInView="show"
      viewport={{ once: true, margin: "-10%" }}
      className={className}
    >
      {children}
    </motion.div>
  );
}

export function RevealGridItem({ children, className = "" }: { children: React.ReactNode; className?: string }) {
  return <motion.div variants={item} className={className}>{children}</motion.div>;
}
