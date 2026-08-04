import manifest from "@/content/videos.json";

/**
 * Typed access to the video slot manifest (src/content/videos.json — see
 * docs/VIDEO-PIPELINE.md). Server-safe: pages read slots here and pass plain
 * props to the client `VideoLoop`.
 */
export type VideoRendition = {
  /** 1920×1080 H.264 loop (≤ 4 MB). */
  desktop: string;
  /** 960×540 rendition (≤ 1.5 MB); falls back to desktop when null. */
  mobile: string | null;
  /** WebP poster frame — also the reduced-motion/Save-Data/off fallback. */
  poster: string | null;
};

export type VideoSlot = {
  labelKo: string;
  labelEn: string;
  video: VideoRendition | null;
};

const slots = manifest.slots as Record<string, VideoSlot>;

export function getVideoSlot(key: string): VideoSlot | null {
  return slots[key] ?? null;
}

/** Hero capability slots, in ticker order. */
export function getHeroSlots(): Array<VideoSlot & { key: string }> {
  return (manifest.hero as string[])
    .map((key) => (slots[key] ? { key, ...slots[key] } : null))
    .filter((s): s is VideoSlot & { key: string } => s !== null);
}
