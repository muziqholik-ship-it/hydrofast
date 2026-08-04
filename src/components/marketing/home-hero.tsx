"use client";

import { motion, type Variants } from "framer-motion";
import { Link } from "@/i18n/navigation";

const container: Variants = {
  hidden: {},
  show: {
    transition: { staggerChildren: 0.12, delayChildren: 0.1 },
  },
};

const line: Variants = {
  hidden: { opacity: 0, y: 24 },
  show: {
    opacity: 1,
    y: 0,
    transition: { duration: 0.6, ease: [0.16, 1, 0.3, 1] as const },
  },
};

export type HeroSpec = { label: string; value: string };

export function HomeHero({
  kicker,
  title,
  desc,
  ctaProducts,
  ctaContact,
  specs,
  imageUrl,
  imageAlt,
}: {
  kicker: string;
  title: string;
  desc: string;
  ctaProducts: string;
  ctaContact: string;
  /** Datasheet-style "spec strip" — the one signature element; hero-only. */
  specs: HeroSpec[];
  imageUrl: string | null;
  imageAlt: string;
}) {
  return (
    <section className="relative overflow-hidden bg-[var(--color-surface)]">
      <div className="absolute inset-0 -z-10 bg-[radial-gradient(circle_at_top_right,rgba(55,92,251,0.08),transparent_60%)]" />
      <div className="mx-auto grid max-w-[1400px] grid-cols-1 items-stretch gap-10 px-6 pb-14 pt-16 md:pt-24 lg:grid-cols-[1.15fr_1fr] lg:gap-14 lg:pb-24">
        <motion.div variants={container} initial="hidden" animate="show" className="lg:py-12">
          <motion.p
            variants={line}
            className="mb-4 text-xs font-semibold tracking-[0.2em] text-[var(--color-safety-orange)] uppercase"
          >
            {kicker}
          </motion.p>
          <motion.h1
            variants={line}
            className="max-w-3xl text-4xl md:text-6xl font-bold leading-tight tracking-tight text-[var(--color-ink)]"
          >
            {/* The translated title uses "\n" for its intentional line break. */}
            {title.split("\n").map((part, i) => (
              <span key={i}>
                {i > 0 && <br />}
                {part}
              </span>
            ))}
          </motion.h1>
          <motion.p variants={line} className="mt-6 max-w-xl text-lg text-[var(--color-ink-soft)]">
            {desc}
          </motion.p>
          <motion.div variants={line} className="mt-10 flex flex-wrap gap-4">
            <Link
              href="/products"
              className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] px-6 py-3 text-sm font-semibold text-white transition-transform hover:-translate-y-0.5"
            >
              {ctaProducts}
            </Link>
            <Link
              href="/contact"
              className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-6 py-3 text-sm font-semibold text-[var(--color-ink)] transition-transform hover:-translate-y-0.5"
            >
              {ctaContact}
            </Link>
          </motion.div>

          {/* Spec strip — 1px dividers via gap-px over a border-colored backing. */}
          <motion.dl
            variants={line}
            className="mt-12 grid max-w-xl grid-cols-2 gap-px border border-[var(--color-border)] border-t-2 border-t-[var(--color-safety-orange)] bg-[var(--color-border)] font-mono sm:grid-cols-4"
          >
            {specs.map((spec) => (
              <div key={spec.label} className="bg-[var(--color-surface)] px-3 py-2.5">
                <dt className="text-[10px] font-semibold uppercase tracking-[0.15em] text-[var(--color-ink-soft)]">
                  {spec.label}
                </dt>
                <dd className="mt-0.5 text-xs font-bold uppercase tracking-wide text-[var(--color-ink)]">
                  {spec.value}
                </dd>
              </div>
            ))}
          </motion.dl>
        </motion.div>

        {/* Photo panel: real ETO build, desaturated with a steel duotone overlay
            so brand colors stay dominant. Falls back to a blueprint-grid panel
            when no image URL could be resolved. */}
        <motion.div
          initial={{ opacity: 0, scale: 1.03 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.8, ease: [0.16, 1, 0.3, 1] as const }}
          className="relative min-h-56 w-full overflow-hidden rounded-[var(--radius-card)] border border-[var(--color-border)] sm:min-h-72 lg:min-h-0"
        >
          {imageUrl ? (
            <>
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={imageUrl}
                alt={imageAlt}
                fetchPriority="high"
                decoding="async"
                className="absolute inset-0 h-full w-full object-cover saturate-[0.4]"
              />
              <div aria-hidden className="absolute inset-0 bg-[var(--color-steel)] opacity-40 mix-blend-multiply" />
              <div
                aria-hidden
                className="absolute inset-0 bg-gradient-to-t from-[var(--color-steel)]/40 to-transparent mix-blend-multiply"
              />
            </>
          ) : (
            <div
              aria-hidden
              className="absolute inset-0 bg-[var(--color-surface-alt)] opacity-60 [background-image:linear-gradient(var(--color-border)_1px,transparent_1px),linear-gradient(90deg,var(--color-border)_1px,transparent_1px)] [background-size:32px_32px]"
            />
          )}
        </motion.div>
      </div>
    </section>
  );
}
