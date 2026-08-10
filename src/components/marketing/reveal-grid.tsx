"use client";

import { Children, isValidElement, type ReactNode } from "react";
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

/**
 * Identity of the current child set.
 *
 * `whileInView` fires once and then stops observing, and framer-motion hands
 * the resulting "show" variant only to the children that were mounted when it
 * fired. A client-side navigation that swaps the children *without* remounting
 * this component leaves the new ones sitting on the inherited "hidden" variant
 * — laid out, hoverable, and fully transparent — with no gesture left to
 * release them. That is every query-only navigation on /products: pagination,
 * a new search, a filter change, the card/list toggle.
 *
 * Keying the motion element on the child list remounts the reveal, so a new
 * set of cards animates in exactly as it does on a fresh page load. Identical
 * children keep the same key and never remount.
 */
function childSetKey(children: ReactNode) {
  return Children.toArray(children)
    .map((child) => (isValidElement(child) ? String(child.key) : ""))
    .join("|");
}

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
      key={childSetKey(children)}
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
