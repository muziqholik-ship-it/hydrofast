import "server-only";

import { stat } from "node:fs/promises";
import path from "node:path";
import sharp from "sharp";

/**
 * Intrinsic aspect ratio of a brochure asset served from `public/`, resolved on
 * the server so a layout can branch on the image's shape without a first-paint
 * reflow. Only local `/content/...` style paths are readable; uploaded assets
 * live in Supabase Storage and return undefined, which callers treat as "assume
 * landscape".
 *
 * `sharp().metadata()` only reads the header, and results are memoised for the
 * life of the process — these files are immutable build assets.
 */
const cache = new Map<string, { width: number; height: number } | undefined>();

export async function localImageSize(
  src: string | null | undefined,
): Promise<{ width: number; height: number } | undefined> {
  if (!src || !src.startsWith("/") || src.startsWith("//")) return undefined;
  if (cache.has(src)) return cache.get(src);

  let size: { width: number; height: number } | undefined;
  try {
    // Reject anything that escapes public/ before touching the filesystem.
    const file = path.join(process.cwd(), "public", path.normalize(src));
    const root = path.join(process.cwd(), "public");
    if (!file.startsWith(root + path.sep)) throw new Error("outside public/");
    await stat(file);
    const { width, height } = await sharp(file).metadata();
    if (width && height) size = { width, height };
  } catch {
    size = undefined;
  }

  cache.set(src, size);
  return size;
}

export async function localImageAspect(src: string | null | undefined): Promise<number | undefined> {
  const size = await localImageSize(src);
  return size ? size.width / size.height : undefined;
}
