/**
 * Regenerates src/app/favicon.ico — a blue "H" + red "F" monogram.
 *
 *   node scripts/make-favicon.mjs
 *
 * The glyphs are drawn as plain rectangles rather than SVG <text>, so the
 * output doesn't depend on which fonts happen to be installed on the machine
 * that runs this (librsvg silently substitutes, and CI has no Korean/Latin
 * display fonts to substitute *with*).
 *
 * The white plate is deliberate: browser tab strips are near-white in light
 * mode and near-black in dark mode, and #1f3a63 on black is unreadable.
 */
import { writeFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";
import sharp from "sharp";

const STEEL = "#1f3a63"; // --color-steel
const RED = "#d03302"; // --color-safety-orange

// 64-unit canvas: two 24-wide glyphs with a 7-unit stroke, 6 units of margin.
const SVG = `<svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 64 64">
  <rect width="64" height="64" rx="12" fill="#ffffff"/>
  <g fill="${STEEL}">
    <rect x="6" y="14" width="7" height="36"/>
    <rect x="23" y="14" width="7" height="36"/>
    <rect x="6" y="28.5" width="24" height="7"/>
  </g>
  <g fill="${RED}">
    <rect x="34" y="14" width="7" height="36"/>
    <rect x="34" y="14" width="22" height="7"/>
    <rect x="34" y="28.5" width="17" height="7"/>
  </g>
</svg>`;

/**
 * Packs PNGs into an .ico. Every browser since IE11 reads PNG-compressed
 * icon entries, and they stay far smaller than the equivalent BMP+mask.
 */
function buildIco(images) {
  const header = Buffer.alloc(6);
  header.writeUInt16LE(0, 0); // reserved
  header.writeUInt16LE(1, 2); // 1 = icon
  header.writeUInt16LE(images.length, 4);

  let offset = 6 + images.length * 16;
  const entries = images.map(({ size, data }) => {
    const entry = Buffer.alloc(16);
    entry.writeUInt8(size === 256 ? 0 : size, 0); // 0 means 256
    entry.writeUInt8(size === 256 ? 0 : size, 1);
    entry.writeUInt8(0, 2); // palette size — 0 for truecolour
    entry.writeUInt8(0, 3); // reserved
    entry.writeUInt16LE(1, 4); // colour planes
    entry.writeUInt16LE(32, 6); // bits per pixel
    entry.writeUInt32LE(data.length, 8);
    entry.writeUInt32LE(offset, 12);
    offset += data.length;
    return entry;
  });

  return Buffer.concat([header, ...entries, ...images.map((i) => i.data)]);
}

const SIZES = [16, 32, 48, 64];
const images = await Promise.all(
  SIZES.map(async (size) => ({
    size,
    data: await sharp(Buffer.from(SVG)).resize(size, size).png({ compressionLevel: 9 }).toBuffer(),
  }))
);

const out = path.join(path.dirname(fileURLToPath(import.meta.url)), "..", "src", "app", "favicon.ico");
writeFileSync(out, buildIco(images));
console.log(`wrote ${out} (${SIZES.join("/")}px)`);
