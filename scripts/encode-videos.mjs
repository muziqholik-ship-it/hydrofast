#!/usr/bin/env node
/**
 * Video encode pipeline (workstream 09 §3 — full docs in docs/VIDEO-PIPELINE.md).
 *
 * Reads source footage from assets-src/video/<slot>/ (first file, sorted), and
 * per clip produces in public/videos/:
 *   <slot>.mp4         1920×1080 H.264, CRF-stepped until ≤ 4 MB, ≤ 12 s, no audio
 *   <slot>-mobile.mp4   960×540, same treatment, ≤ 1.5 MB
 *   <slot>-poster.webp  first-frame poster
 * then updates the `video` entry for that slot in src/content/videos.json.
 *
 * Usage:
 *   node scripts/encode-videos.mjs               # all slots with footage
 *   node scripts/encode-videos.mjs lifting cta   # specific slots
 *   node scripts/encode-videos.mjs --upload      # also push to Supabase
 *                                                # `site-videos` bucket and
 *                                                # write storage URLs instead
 *
 * Requires ffmpeg on PATH. --upload needs NEXT_PUBLIC_SUPABASE_URL and
 * SUPABASE_SECRET_KEY in .env.local, and the public `site-videos` bucket to
 * exist (Supabase Dashboard → Storage → New bucket → public).
 */

import { spawnSync } from "node:child_process";
import { existsSync, mkdirSync, readdirSync, readFileSync, statSync, writeFileSync } from "node:fs";
import path from "node:path";
import process from "node:process";

const ROOT = path.resolve(path.dirname(new URL(import.meta.url).pathname.replace(/^\/([A-Za-z]:)/, "$1")), "..");
const SRC_DIR = path.join(ROOT, "assets-src", "video");
const OUT_DIR = path.join(ROOT, "public", "videos");
const MANIFEST = path.join(ROOT, "src", "content", "videos.json");

const MAX_SECONDS = 12;
const DESKTOP = { w: 1920, h: 1080, startCrf: 24, maxBytes: 4 * 1024 * 1024 };
const MOBILE = { w: 960, h: 540, startCrf: 27, maxBytes: 1.5 * 1024 * 1024 };
const SOURCE_EXTS = new Set([".mp4", ".mov", ".webm", ".mkv", ".avi", ".m4v"]);

const args = process.argv.slice(2);
const upload = args.includes("--upload");
const requestedSlots = args.filter((a) => !a.startsWith("--"));

function run(cmd, argv) {
  const r = spawnSync(cmd, argv, { stdio: ["ignore", "pipe", "pipe"] });
  if (r.error) throw r.error;
  if (r.status !== 0) {
    throw new Error(`${cmd} ${argv.join(" ")}\n${r.stderr?.toString().slice(-1500)}`);
  }
}

function ffmpegAvailable() {
  return spawnSync("ffmpeg", ["-version"], { stdio: "ignore" }).status === 0;
}

/** Encode one rendition, stepping CRF up (max +6) until under the size cap. */
function encodeRendition(input, output, { w, h, startCrf, maxBytes }) {
  for (let crf = startCrf; crf <= startCrf + 6; crf += 2) {
    run("ffmpeg", [
      "-y",
      "-i", input,
      "-t", String(MAX_SECONDS),
      "-an",
      "-vf", `scale=${w}:${h}:force_original_aspect_ratio=increase,crop=${w}:${h},fps=30`,
      "-c:v", "libx264",
      "-crf", String(crf),
      "-preset", "slow",
      "-pix_fmt", "yuv420p",
      "-movflags", "+faststart",
      output,
    ]);
    const size = statSync(output).size;
    if (size <= maxBytes) return { crf, size };
    console.log(`    ${path.basename(output)} is ${(size / 1e6).toFixed(1)} MB at CRF ${crf} — retrying at ${crf + 2}`);
  }
  const size = statSync(output).size;
  console.warn(`    WARNING: ${path.basename(output)} still ${(size / 1e6).toFixed(1)} MB over budget — trim the source or pick a calmer clip.`);
  return { crf: null, size };
}

function extractPoster(desktopMp4, output) {
  run("ffmpeg", ["-y", "-i", desktopMp4, "-frames:v", "1", "-c:v", "libwebp", "-quality", "82", output]);
}

async function uploadFile(supabase, localPath, remoteName) {
  const contentType = remoteName.endsWith(".webp") ? "image/webp" : "video/mp4";
  const { error } = await supabase.storage
    .from("site-videos")
    .upload(remoteName, readFileSync(localPath), { contentType, upsert: true, cacheControl: "31536000" });
  if (error) throw new Error(`upload ${remoteName}: ${error.message}`);
  const { data } = supabase.storage.from("site-videos").getPublicUrl(remoteName);
  return data.publicUrl;
}

async function main() {
  if (!ffmpegAvailable()) {
    console.error("ffmpeg not found on PATH. Install it (e.g. `winget install Gyan.FFmpeg`) and retry.");
    process.exit(1);
  }

  const manifest = JSON.parse(readFileSync(MANIFEST, "utf8"));

  // Auto-register slots for any extra source folders — this is how business
  // areas get loops: create assets-src/video/area-<slug>/ and the slot
  // appears (fix its ko/en labels in the manifest afterwards if it will ever
  // be user-visible; area panels label themselves from the DB).
  if (existsSync(SRC_DIR)) {
    for (const entry of readdirSync(SRC_DIR, { withFileTypes: true })) {
      if (entry.isDirectory() && !manifest.slots[entry.name]) {
        manifest.slots[entry.name] = { labelKo: entry.name, labelEn: entry.name, video: null };
        console.log(`- registered new slot "${entry.name}" from source folder`);
      }
    }
  }

  const slotNames = requestedSlots.length > 0 ? requestedSlots : Object.keys(manifest.slots);
  mkdirSync(OUT_DIR, { recursive: true });

  let supabase = null;
  if (upload) {
    const { config } = await import("dotenv");
    config({ path: path.join(ROOT, ".env.local") });
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
    const key = process.env.SUPABASE_SECRET_KEY;
    if (!url || !key) {
      console.error("--upload needs NEXT_PUBLIC_SUPABASE_URL and SUPABASE_SECRET_KEY in .env.local");
      process.exit(1);
    }
    const { createClient } = await import("@supabase/supabase-js");
    supabase = createClient(url, key);
  }

  let encoded = 0;
  for (const slot of slotNames) {
    if (!manifest.slots[slot]) {
      console.warn(`- ${slot}: not in manifest, skipping`);
      continue;
    }
    const dir = path.join(SRC_DIR, slot);
    const source = existsSync(dir)
      ? readdirSync(dir).filter((f) => SOURCE_EXTS.has(path.extname(f).toLowerCase())).sort()[0]
      : undefined;
    if (!source) {
      console.log(`- ${slot}: no footage in assets-src/video/${slot}/ — slot stays ${manifest.slots[slot].video ? "as-is" : "empty"}`);
      continue;
    }

    console.log(`- ${slot}: encoding ${source}`);
    const input = path.join(dir, source);
    const desktopOut = path.join(OUT_DIR, `${slot}.mp4`);
    const mobileOut = path.join(OUT_DIR, `${slot}-mobile.mp4`);
    const posterOut = path.join(OUT_DIR, `${slot}-poster.webp`);

    const d = encodeRendition(input, desktopOut, DESKTOP);
    const m = encodeRendition(input, mobileOut, MOBILE);
    extractPoster(desktopOut, posterOut);
    console.log(`    desktop ${(d.size / 1e6).toFixed(1)} MB · mobile ${(m.size / 1e6).toFixed(1)} MB · poster ok`);

    let video = {
      desktop: `/videos/${slot}.mp4`,
      mobile: `/videos/${slot}-mobile.mp4`,
      poster: `/videos/${slot}-poster.webp`,
    };
    if (supabase) {
      video = {
        desktop: await uploadFile(supabase, desktopOut, `${slot}.mp4`),
        mobile: await uploadFile(supabase, mobileOut, `${slot}-mobile.mp4`),
        poster: await uploadFile(supabase, posterOut, `${slot}-poster.webp`),
      };
      console.log("    uploaded to site-videos bucket");
    }
    manifest.slots[slot].video = video;
    encoded += 1;
  }

  writeFileSync(MANIFEST, `${JSON.stringify(manifest, null, 2)}\n`);
  console.log(`\nDone: ${encoded} slot(s) encoded. Manifest updated — restart/rebuild to see them.`);
}

main().catch((err) => {
  console.error(err.message ?? err);
  process.exit(1);
});
