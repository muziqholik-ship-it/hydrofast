"use client";

import { useCallback, useEffect, useRef, useState, useSyncExternalStore } from "react";
import { MOTION_LEVEL, useMediaQuery } from "@/lib/motion";
import type { VideoRendition } from "@/lib/videos";

/*
 * Save-Data preference (workstream 09 §3): posters only when the user asked
 * to save data. Read via useSyncExternalStore so SSR/hydration render without
 * video markup and the client upgrades after mount.
 */
type NetworkInformationLike = { saveData?: boolean; addEventListener?: (t: string, l: () => void) => void; removeEventListener?: (t: string, l: () => void) => void };

function subscribeSaveData(onChange: () => void) {
  const conn = (navigator as Navigator & { connection?: NetworkInformationLike }).connection;
  conn?.addEventListener?.("change", onChange);
  return () => conn?.removeEventListener?.("change", onChange);
}

function useSaveData(): boolean {
  return useSyncExternalStore(
    subscribeSaveData,
    () => (navigator as Navigator & { connection?: NetworkInformationLike }).connection?.saveData === true,
    () => true, // server snapshot: assume save-data until the client proves otherwise
  );
}

/**
 * The standard-compliant background video loop (workstream 09 §3).
 *
 * Fallback matrix — the <video> element is rendered only when ALL hold:
 *  - a rendition exists for the slot
 *  - no prefers-reduced-motion, no Save-Data
 *  - MOTION_LEVEL is "full", or "lite" with `eager` (hero video only at lite)
 * Otherwise the poster shows; with no poster either, the `fallback` node
 * (an intentional gradient) renders — the site works with zero clips.
 *
 * Loading discipline: `eager` (hero) attaches src immediately; everything
 * else waits for an IntersectionObserver (~200px margin). Playback pauses
 * whenever the element is off-screen or `active` is false (hero crossfade).
 * The poster paints first and the video fades over it once actually playing,
 * so there is no flash and zero CLS. Always decorative: aria-hidden, muted.
 */
export function VideoLoop({
  video,
  eager = false,
  active = true,
  className = "",
  fallback = null,
}: {
  video: VideoRendition | null;
  eager?: boolean;
  active?: boolean;
  className?: string;
  fallback?: React.ReactNode;
}) {
  const wrapper = useRef<HTMLDivElement>(null);
  const videoEl = useRef<HTMLVideoElement>(null);
  const reducedMotion = useMediaQuery("(prefers-reduced-motion: reduce)");
  const desktop = useMediaQuery("(min-width: 768px)");
  const saveData = useSaveData();
  const [inView, setInView] = useState(false);
  const [playing, setPlaying] = useState(false);

  const levelAllows = MOTION_LEVEL === "full" || (MOTION_LEVEL === "lite" && eager);
  // saveData's server snapshot is `true`, which conveniently keeps the
  // <video> out of SSR markup entirely — no autoplay before hydration checks.
  const videoAllowed = video !== null && levelAllows && !reducedMotion && !saveData;
  const attachSrc = videoAllowed && (eager || inView);

  useEffect(() => {
    const el = wrapper.current;
    if (!el) return;
    const observer = new IntersectionObserver(
      ([entry]) => setInView(entry.isIntersecting),
      { rootMargin: "200px 0px" },
    );
    observer.observe(el);
    return () => observer.disconnect();
  }, []);

  // Play/pause discipline — off-screen or crossfaded-out videos never burn
  // decode time. Imperative on purpose; no re-render per state of playback.
  useEffect(() => {
    const el = videoEl.current;
    if (!el) return;
    if (attachSrc && active && inView) {
      el.play().catch(() => {
        /* autoplay veto (e.g. power saving) — poster remains, by design */
      });
    } else {
      el.pause();
    }
  }, [attachSrc, active, inView]);

  const onPlaying = useCallback(() => setPlaying(true), []);

  const src = video ? (desktop ? video.desktop : (video.mobile ?? video.desktop)) : null;

  return (
    <div ref={wrapper} aria-hidden className={`pointer-events-none overflow-hidden ${className}`}>
      {video?.poster ? (
        // eslint-disable-next-line @next/next/no-img-element
        <img
          src={video.poster}
          alt=""
          loading={eager ? "eager" : "lazy"}
          decoding="async"
          className="absolute inset-0 h-full w-full object-cover"
        />
      ) : (
        fallback
      )}
      {attachSrc && src && (
        // No autoPlay attribute on purpose (F1 playback discipline): the
        // play/pause effect is the only driver, so inactive/off-screen
        // videos never buffer beyond preload="metadata".
        <video
          ref={videoEl}
          muted
          loop
          playsInline
          preload="metadata"
          poster={video?.poster ?? undefined}
          onPlaying={onPlaying}
          className={`absolute inset-0 h-full w-full object-cover transition-opacity duration-700 ${playing ? "opacity-100" : "opacity-0"}`}
        >
          <source src={src} type="video/mp4" />
        </video>
      )}
    </div>
  );
}
