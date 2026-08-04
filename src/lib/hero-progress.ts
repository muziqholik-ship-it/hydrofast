"use client";

/**
 * Tiny mutable bridge between the hero's ScrollTrigger (DOM world, main
 * bundle) and the lazily-loaded R3F scene (three chunk). Deliberately free of
 * any three/fiber imports so home-hero.tsx never drags the 3D chunk into the
 * first-load JS — the canvas subscribes when (and only if) it mounts.
 */
export type HeroProgress = {
  /** Scrub progress 0→1 of the pinned hero timeline. */
  readonly value: number;
  set(v: number): void;
  subscribe(listener: (v: number) => void): () => void;
};

export function createHeroProgress(): HeroProgress {
  let value = 0;
  const listeners = new Set<(v: number) => void>();
  return {
    get value() {
      return value;
    },
    set(v: number) {
      value = v;
      listeners.forEach((l) => l(v));
    },
    subscribe(listener: (v: number) => void) {
      listeners.add(listener);
      return () => listeners.delete(listener);
    },
  };
}
