"use client";

import { motion } from "framer-motion";
import { Link } from "@/i18n/navigation";

/** Final full-width CTA band — button styles mirror the header/hero CTAs. */
export function ClosingCta({
  title,
  sub,
  primaryLabel,
  secondaryLabel,
}: {
  title: string;
  sub: string;
  primaryLabel: string;
  secondaryLabel: string;
}) {
  return (
    <section className="border-t border-[var(--color-border)] bg-[var(--color-surface-alt)]">
      <motion.div
        initial={{ opacity: 0, y: 16 }}
        whileInView={{ opacity: 1, y: 0 }}
        viewport={{ once: true, margin: "-10%" }}
        transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] as const }}
        className="mx-auto max-w-[1400px] px-6 py-16 text-center md:py-20"
      >
        <h2 className="text-2xl font-bold tracking-tight md:text-3xl">{title}</h2>
        <p className="mx-auto mt-3 max-w-2xl text-[var(--color-ink-soft)]">{sub}</p>
        <div className="mt-8 flex flex-wrap justify-center gap-4">
          <Link
            href="/contact"
            className="rounded-[var(--radius-card)] bg-[var(--color-safety-orange)] px-6 py-3 text-sm font-semibold text-[var(--color-safety-orange-contrast)] transition-transform hover:-translate-y-0.5"
          >
            {primaryLabel}
          </Link>
          <Link
            href="/products"
            className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-6 py-3 text-sm font-semibold text-[var(--color-ink)] transition-transform hover:-translate-y-0.5"
          >
            {secondaryLabel}
          </Link>
        </div>
      </motion.div>
    </section>
  );
}
