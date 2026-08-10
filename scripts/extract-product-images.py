# -*- coding: utf-8 -*-
"""
Crops a product photo out of the source catalog PDFs for every product in
assets-src/catalogs/extracted/_merged_dataset.json, and writes them as webp to
assets-src/product-images/ together with a manifest the uploader script reads.

Why this works: the catalogs embed their product photos as ordinary rasters, so
we never have to re-render and guess at a crop box — PyMuPDF hands us each
image plus the rectangle it occupies on the page. The hard part is *picking*
the right one when a page carries several (photo, dimension drawing, brand
mark, a neighbouring product's shot), which is what score_candidate() does:

  - boilerplate (a raster repeated on >= BOILERPLATE_PAGES pages) is dropped
    outright — that kills logos, headers and footers in one shot
  - remaining candidates are ranked by how close they sit to an occurrence of
    the product's model number on the page, then by size/squareness/inkiness
  - a candidate already claimed by an earlier (higher-scoring) product is
    penalised, so two products sharing a page don't both grab the same shot

Nothing here is trusted blindly: every choice lands in the manifest with its
score and its runners-up, and review.html renders the lot as a contact sheet
for a human pass before anything is uploaded.

Usage:
    python scripts/extract-product-images.py            # all manufacturers
    python scripts/extract-product-images.py --only webtec,dynaset
    python scripts/extract-product-images.py --limit 40 # quick sample
"""
import argparse
import collections
import hashlib
import io
import json
import os
import re
import sys

import fitz  # PyMuPDF
from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CATALOGS = os.path.join(ROOT, "assets-src", "catalogs")
EXTRACTED = os.path.join(CATALOGS, "extracted")
OUT_DIR = os.path.join(ROOT, "assets-src", "product-images")
MANIFEST = os.path.join(OUT_DIR, "manifest.json")

# Which PDF each extraction file was read out of. sourcePages in those files are
# 1-based *PDF* page indices (verified by matching model numbers against the
# text layer at offsets -2..+4 — offset 0 wins on every catalog).
PDF_FOR = {
    "dynaset.json": "하이드로훼스트_다이나셋_최종.pdf",
    "euroswitch-level.json": "Euroswitch_catalogo_2026.pdf",
    "euroswitch-pressure.json": "Euroswitch_catalogo_2026.pdf",
    "euroswitch-temperature.json": "Euroswitch_catalogo_2026.pdf",
    "gemels-ball-valves.json": "GEMELS.pdf",
    "gemels-other.json": "GEMELS.pdf",
    "gemels-quick-couplings.json": "GEMELS.pdf",
    "gemels-supplement.json": "GEMELS.pdf",
    "moveco.json": "Moveco-Rotary-Actuator-Range-Technical-catalogue.pdf",
    "oleoweb1.json": "OLELOWEB1.pdf",
    "oleoweb2-part1.json": "OLELOWEB2.pdf",
    "oleoweb2-part2.json": "OLELOWEB2.pdf",
    "oleoweb2-part3.json": "OLELOWEB2.pdf",
    "oleoweb2-supplement.json": "OLELOWEB2.pdf",
    "water-hydraulics-part1.json": "Water Hydraulic catalog-하이드로훼스트.pdf",
    "water-hydraulics-part2.json": "Water Hydraulic catalog-하이드로훼스트.pdf",
    "webtec.json": "WEBTEC.pdf",
}

MANUFACTURER_FOR = {f: f.split("-part")[0].split(".json")[0].replace("-supplement", "")
                    for f in PDF_FOR}
MANUFACTURER_FOR.update({
    "euroswitch-level.json": "euroswitch",
    "euroswitch-pressure.json": "euroswitch",
    "euroswitch-temperature.json": "euroswitch",
    "gemels-ball-valves.json": "gemels",
    "gemels-other.json": "gemels",
    "gemels-quick-couplings.json": "gemels",
    "gemels-supplement.json": "gemels",
    "oleoweb1.json": "oleoweb",
    "oleoweb2-part1.json": "oleoweb",
    "oleoweb2-part2.json": "oleoweb",
    "oleoweb2-part3.json": "oleoweb",
    "oleoweb2-supplement.json": "oleoweb",
    "water-hydraulics-part1.json": "water-hydraulics",
    "water-hydraulics-part2.json": "water-hydraulics",
})

# The DYNASET brochure is a scan: each page is one full-bleed raster, so there
# is no per-product image to pull out. Its layout is uniform though (product
# shot in the top-left quadrant, spec panel below), so a fixed fractional crop
# of the rendered page does the job. Fractions are (x0, y0, x1, y1) of the page.
FULLPAGE_CROP = {
    "하이드로훼스트_다이나셋_최종.pdf": (0.02, 0.06, 0.46, 0.315),
}
FULLPAGE_AREA = 0.6        # candidate covering this much of the page == a page scan
FULLPAGE_DPI = 220

BOILERPLATE_PAGES = 4      # a raster on this many pages is furniture, not a product
MIN_PT = 45                # rendered size on the page, in points
MIN_PX = 90                # source resolution — below this a card crop looks mushy
MAX_PAGES_PER_PRODUCT = 12  # some sourcePages span a whole 40-page section
OUT_SIZE = 1200            # long edge of the emitted webp


def parse_pages(raw):
    """'91-94, 98, 100-101' -> [91,92,93,94,98,100,101]. Ranges wider than 40
    pages are section references, not product pages — keep only their ends."""
    out = []
    for part in re.sub(r"[^0-9,\-]", " ", str(raw)).split(","):
        part = part.strip()
        m = re.match(r"^(\d+)\s*-\s*(\d+)$", part)
        if m:
            a, b = int(m.group(1)), int(m.group(2))
            out += list(range(a, b + 1)) if b - a < 40 else [a, b]
        elif part.isdigit():
            out.append(int(part))
    seen, uniq = set(), []
    for p in out:
        if p not in seen:
            seen.add(p)
            uniq.append(p)
    return uniq


class Catalog:
    """One PDF, with its rasters inventoried once up front."""

    def __init__(self, name):
        self.name = name
        self.doc = fitz.open(os.path.join(CATALOGS, name))
        self.per_page = {}
        self.digest_pages = collections.defaultdict(set)
        self._scan()

    def _scan(self):
        for pno in range(1, self.doc.page_count + 1):
            page = self.doc[pno - 1]
            items = []
            for info in page.get_images(full=True):
                xref = info[0]
                try:
                    rects = page.get_image_rects(xref)
                    raw = self.doc.extract_image(xref)
                except Exception:
                    continue
                if not rects:
                    continue
                digest = hashlib.md5(raw["image"]).hexdigest()
                for r in rects:
                    items.append({
                        "xref": xref, "digest": digest, "page": pno,
                        "px_w": raw["width"], "px_h": raw["height"],
                        "rect": (r.x0, r.y0, r.x1, r.y1),
                        "pt_w": r.width, "pt_h": r.height,
                    })
                    self.digest_pages[digest].add(pno)
            self.per_page[pno] = items

    def page_size(self, pno):
        r = self.doc[pno - 1].rect
        return r.width, r.height

    def model_boxes(self, pno, model):
        """Rects of every occurrence of the model number on the page."""
        if not model or len(model) < 2:
            return []
        try:
            return self.doc[pno - 1].search_for(model, quads=False)
        except Exception:
            return []

    def image_bytes(self, xref):
        return self.doc.extract_image(xref)["image"]

    def render_crop(self, pno, frac):
        """Render a page and cut a fractional box out of it. Used when the page
        is a scan and the 'candidate' is the whole page."""
        page = self.doc[pno - 1]
        r = page.rect
        clip = fitz.Rect(r.x0 + frac[0] * r.width, r.y0 + frac[1] * r.height,
                         r.x0 + frac[2] * r.width, r.y0 + frac[3] * r.height)
        pix = page.get_pixmap(dpi=FULLPAGE_DPI, clip=clip)
        return Image.open(io.BytesIO(pix.tobytes("png")))

    def is_fullpage(self, cand):
        pw, ph = self.page_size(cand["page"])
        return cand["pt_w"] * cand["pt_h"] > pw * ph * FULLPAGE_AREA


def ink_stats(img):
    """Fraction of non-white pixels and mean colour saturation. Line drawings
    are sparse and grey; photos are denser and (usually) coloured."""
    small = img.convert("RGB").resize((64, 64))
    px = list(small.getdata())
    non_white = sum(1 for r, g, b in px if r < 240 or g < 240 or b < 240)
    sat = sum(max(r, g, b) - min(r, g, b) for r, g, b in px) / len(px)
    return non_white / len(px), sat / 255.0


def photo_likeness(img):
    """0..1 — is this a photograph/render of a part, or a chart or a CAD drawing?

    The catalogs put performance graphs, dimension drawings and ordering-code
    tables on the same pages as the product shots, and by size and position
    those are indistinguishable from the real thing. What separates them is the
    pixels: a photo is mostly mid-tones over hundreds of distinct colours,
    while a chart or a line drawing is white paper with a few thin strokes on
    it. Measured over known-good sets (WEBTEC, GEMELS) against known-bad ones
    (the Water Hydraulics flow curves): photos sit at mid≈0.30-0.40 /
    uniq≈400-500, charts at mid≈0.14 / uniq≈220.
    """
    small = img.convert("RGB").resize((96, 96))
    px = list(small.getdata())
    n = len(px)
    mid = sum(1 for r, g, b in px if 30 < (r + g + b) / 3 < 225) / n
    uniq = len({(r >> 3, g >> 3, b >> 3) for r, g, b in px})
    return 0.6 * min(1.0, mid / 0.28) + 0.4 * min(1.0, uniq / 400)


def score_candidate(cat, cand, model, claimed, photo_cache):
    """Higher is better. Returns (score, reasons) — reasons land in the manifest
    so a surprising pick can be explained without re-running anything."""
    page = cat.doc[cand["page"] - 1].rect
    pw, ph = page.width, page.height
    x0, y0, x1, y1 = cand["rect"]
    reasons = {}

    # size: a product hero shot is a decent fraction of the page
    size = min(1.0, (cand["pt_w"] * cand["pt_h"]) / (pw * ph) * 12)
    reasons["size"] = round(size, 3)

    # squareness: banners and thin strips are almost never the product
    ar = cand["pt_w"] / cand["pt_h"] if cand["pt_h"] else 9
    square = max(0.0, 1 - abs(__import__("math").log(ar)) / 1.4)
    reasons["square"] = round(square, 3)

    # proximity to the model number printed on the page
    boxes = cat.model_boxes(cand["page"], model)
    if boxes:
        cx, cy = (x0 + x1) / 2, (y0 + y1) / 2
        d = min(((cx - (b.x0 + b.x1) / 2) ** 2 + (cy - (b.y0 + b.y1) / 2) ** 2) ** 0.5
                for b in boxes)
        near = max(0.0, 1 - d / (ph * 0.6))
    else:
        near = 0.0
    reasons["near_model"] = round(near, 3)

    # is it a product shot at all, or a flow curve / dimension drawing?
    dg = cand["digest"]
    if dg not in photo_cache:
        try:
            photo_cache[dg] = photo_likeness(
                Image.open(io.BytesIO(cat.image_bytes(cand["xref"]))))
        except Exception:
            photo_cache[dg] = 0.0
    photo = photo_cache[dg]
    reasons["photo"] = round(photo, 3)

    # Page furniture vs. product shot. The catalogs decorate section pages with
    # full-bleed application photography — an excavator, a forklift, a yacht —
    # and those are *more* photographic than the product renders they sit next
    # to, so photo_likeness alone promotes exactly the wrong image. What gives
    # them away is geometry: a decoration runs to the trim edge (Moveco's
    # application strips bleed left+top+bottom), while a product shot is placed
    # inside the text block with margins on every side.
    edges = sum([x0 - page.x0 < 3, page.x1 - x1 < 3,
                 y0 - page.y0 < 3, page.y1 - y1 < 3])
    reasons["bleed_edges"] = edges
    bleed = 2.2 if edges >= 2 else 0.0

    reasons["claimed"] = claimed
    penalty = 0.45 * claimed

    score = 1.5 * near + 1.0 * size + 0.6 * square + 0.8 * photo - penalty - bleed
    return score, reasons


def trim_and_pad(img, size=OUT_SIZE):
    """Crop the white margin the catalog laid around the shot, then letterbox
    to a square on white so every card in the grid lines up."""
    rgb = img.convert("RGB")
    gray = rgb.convert("L")
    # bbox of everything darker than near-white
    mask = gray.point(lambda v: 255 if v < 245 else 0)
    box = mask.getbbox()
    if box:
        pad = int(max(rgb.width, rgb.height) * 0.02)
        box = (max(0, box[0] - pad), max(0, box[1] - pad),
               min(rgb.width, box[2] + pad), min(rgb.height, box[3] + pad))
        if box[2] - box[0] > 20 and box[3] - box[1] > 20:
            rgb = rgb.crop(box)
    side = max(rgb.width, rgb.height)
    canvas = Image.new("RGB", (side, side), (255, 255, 255))
    canvas.paste(rgb, ((side - rgb.width) // 2, (side - rgb.height) // 2))
    if side > size:
        canvas = canvas.resize((size, size), Image.LANCZOS)
    return canvas


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", help="comma-separated manufacturer slugs")
    ap.add_argument("--limit", type=int, help="stop after N products (sampling)")
    args = ap.parse_args()
    only = set(args.only.split(",")) if args.only else None

    os.makedirs(OUT_DIR, exist_ok=True)
    merged = json.load(open(os.path.join(EXTRACTED, "_merged_dataset.json"), encoding="utf-8"))
    live_slugs = set(merged["products"])   # the 613 that actually made it into the DB seed

    catalogs = {}
    # slug -> the winning scoring pass. 51 of the 613 slugs appear in two
    # extraction files (the OLELOWEB1 overview row and the OLELOWEB2 detail page
    # describe the same series, and build-catalog-seed.py merges them into one
    # product), so scoring is a separate pass from writing: whichever source
    # page yields the better-scoring crop wins, instead of file iteration order
    # silently deciding it.
    best_for = {}
    # digest -> how many products already took it, so later products prefer a different shot
    claims = collections.Counter()
    photo_cache = {}   # digest -> photo_likeness, so a shared raster decodes once
    stats = collections.Counter()

    for fname, pdf in PDF_FOR.items():
        man = MANUFACTURER_FOR[fname]
        if only and man not in only:
            continue
        data = json.load(open(os.path.join(EXTRACTED, fname), encoding="utf-8"))
        products = data.get("products") or []
        if not products:
            continue
        if pdf not in catalogs:
            print(f"  scanning {pdf} …", file=sys.stderr)
            catalogs[pdf] = Catalog(pdf)
        cat = catalogs[pdf]

        for prod in products:
            slug = prod["slug"]
            if slug not in live_slugs:
                stats["not_in_dataset"] += 1
                continue
            if args.limit and len(best_for) >= args.limit:
                break

            model = (prod.get("modelNo") or "").strip()
            pages = parse_pages(prod.get("sourcePages"))[:MAX_PAGES_PER_PRODUCT]
            cands = []
            for pno in pages:
                for c in cat.per_page.get(pno, []):
                    if c["pt_w"] < MIN_PT or c["pt_h"] < MIN_PT:
                        continue
                    if c["px_w"] < MIN_PX or c["px_h"] < MIN_PX:
                        continue
                    if len(cat.digest_pages[c["digest"]]) >= BOILERPLATE_PAGES:
                        continue
                    ar = c["pt_w"] / c["pt_h"] if c["pt_h"] else 9
                    if ar < 0.25 or ar > 4:
                        continue
                    cands.append(c)

            base = {"slug": slug, "manufacturer": man, "pdf": pdf, "modelNo": model,
                    "nameKo": prod.get("nameKo"), "nameEn": prod.get("nameEn"),
                    "pages": pages}

            if not cands:
                best_for.setdefault(slug, dict(base, file=None, score=-99,
                                               status="no_candidate", alternates=[],
                                               _scored=[], _pdf=pdf))
                continue

            scored = []
            for c in cands:
                s, why = score_candidate(cat, c, model, claims[c["digest"]], photo_cache)
                scored.append((s, why, c))
            scored.sort(key=lambda t: -t[0])

            prev = best_for.get(slug)
            if prev and prev["score"] >= scored[0][0]:
                continue          # the other extraction file already had a better shot
            if prev:
                claims[prev["_best"]["digest"]] -= 1
            claims[scored[0][2]["digest"]] += 1
            best_for[slug] = dict(base, score=scored[0][0], status="ok",
                                  _scored=scored, _best=scored[0][2], _pdf=pdf)

    # --- write pass: only the winning crop per slug reaches the disk
    os.makedirs(os.path.join(OUT_DIR, "alt"), exist_ok=True)
    manifest = []
    for slug, entry in best_for.items():
        pdf = entry.pop("_pdf")
        scored = entry.pop("_scored")
        if entry["status"] == "no_candidate":
            stats["no_candidate"] += 1
            manifest.append(entry)
            continue

        cat = catalogs[pdf]
        best = entry.pop("_best")
        best_score, best_why = entry.pop("score"), scored[0][1]

        source = "raster"
        try:
            if cat.is_fullpage(best) and pdf in FULLPAGE_CROP:
                img = cat.render_crop(best["page"], FULLPAGE_CROP[pdf])
                source = "page_crop"
            else:
                img = Image.open(io.BytesIO(cat.image_bytes(best["xref"])))
            out = trim_and_pad(img)
            coverage, sat = ink_stats(out)
        except Exception as e:  # corrupt/unsupported raster — keep going
            stats["decode_failed"] += 1
            manifest.append(dict(entry, file=None, alternates=[],
                                 status=f"decode_failed: {e}"))
            continue

        rel = f"{slug}.webp"
        out.save(os.path.join(OUT_DIR, rel), "WEBP", quality=88, method=5)
        stats["ok"] += 1

        # everything else on those pages, so review.html can offer a swap
        alternates = []
        for s, why, c in scored[1:6]:
            arel = f"alt/{slug}--p{c['page']}-x{c['xref']}.webp"
            try:
                aimg = trim_and_pad(Image.open(io.BytesIO(cat.image_bytes(c["xref"]))))
            except Exception:
                continue
            aimg.save(os.path.join(OUT_DIR, arel), "WEBP", quality=80, method=4)
            alternates.append({"file": arel, "score": round(s, 3),
                               "page": c["page"], "why": why})

        manifest.append(dict(
            entry, file=rel, source=source, score=round(best_score, 3),
            page=best["page"], why=best_why, ink_coverage=round(coverage, 3),
            saturation=round(sat, 3), source_px=[best["px_w"], best["px_h"]],
            alternates=alternates,
        ))

    for c in catalogs.values():
        c.doc.close()

    json.dump(manifest, open(MANIFEST, "w", encoding="utf-8"),
              ensure_ascii=False, indent=1)
    print(f"\n{len(manifest)} products processed -> {MANIFEST}")
    for k, v in stats.most_common():
        print(f"  {k:16} {v}")


if __name__ == "__main__":
    main()
