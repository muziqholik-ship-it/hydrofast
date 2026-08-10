# -*- coding: utf-8 -*-
"""
Pulls product photos from the manufacturers' own websites, where they are
cleaner than anything croppable out of a catalog page — shot on white, no
callout arrows, no dimension lines, no neighbouring product in frame.

This is the fallback for the products extract-product-images.py gets wrong. It
does not replace it: only two of the seven manufacturers publish something
machine-readable.

    oleoweb           WooCommerce Store API, 204 products, every one with a
                      photo. Matches 156 of our 200 (78%). The real win here.
    water-hydraulics  WordPress, but the public site is category-level: only 11
                      of our 78 model numbers have a page at all. Low yield,
                      still worth taking since it is the catalog that extraction
                      does worst on.
    gemels            Returns 403 to anything without a browser fingerprint.
                      That is a deliberate block and this script honours it.
    euroswitch        No REST API — every wp-json path serves the homepage.
    moveco, webtec    No product API. WEBTEC does not need one: extraction is
                      already 45/45 on that catalog.

Usage:
    python scripts/fetch-manufacturer-images.py --dry-run   # report match rates
    python scripts/fetch-manufacturer-images.py             # fetch + rewrite manifest
    python scripts/fetch-manufacturer-images.py --no-promote  # keep catalog crops as hero

Fetched photos become the hero image in manifest.json and the catalog crop is
pushed into that product's alternates, so review.html shows both and the
reviewer can swap back with one click.
"""
import argparse
import importlib.util
import io
import json
import os
import re
import time
import urllib.error
import urllib.request

from PIL import Image

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXTRACTED = os.path.join(ROOT, "assets-src", "catalogs", "extracted")
OUT_DIR = os.path.join(ROOT, "assets-src", "product-images")
WEB_DIR = os.path.join(OUT_DIR, "web")
MANIFEST = os.path.join(OUT_DIR, "manifest.json")

UA = "Mozilla/5.0 (compatible; hydrofast-catalog/1.0; +https://hydrofast.co.kr)"
DELAY = 1.0        # seconds between requests — these are small company servers

# reuse the crop/pad so web photos and catalog crops come out identically framed
_spec = importlib.util.spec_from_file_location(
    "_extract", os.path.join(ROOT, "scripts", "extract-product-images.py"))
_extract = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(_extract)
trim_and_pad = _extract.trim_and_pad


def red_fraction(img):
    """Oleoweb overlays discontinued lines with a red 'PHASED OUT — contact our
    Sales Dpt.' placard, and stamps superseded ones with a smaller red 'NEW
    CODE' badge. The placard replaces the photo entirely and must not ship; the
    badge sits on top of a perfectly good photo. Measured over the 156 fetched:
    the placard covers 36% of the frame, the badges 22%."""
    small = img.convert("RGB").resize((64, 64))
    px = list(small.getdata())
    return sum(1 for r, g, b in px if r > 120 and r - g > 50 and r - b > 50) / len(px)


def get(url, as_json=True):
    req = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(req, timeout=40) as r:
        raw = r.read()
    time.sleep(DELAY)
    return json.loads(raw) if as_json else raw


def norm(s):
    return re.sub(r"[^a-z0-9]", "", (s or "").lower())


def model_keys(product, prefix):
    """modelNo holds things like 'VRSE - VRSD - VRP' or 'P600 (PB160-625WMS)'."""
    keys = [norm(x) for x in re.split(r"[/,()]| - ", product.get("modelNo") or "")]
    keys.append(norm(product["slug"].replace(prefix + "-", "")))
    return [k for k in keys if k]


# --------------------------------------------------------------------------
# sources: each returns [{key, label, image, page}]
# --------------------------------------------------------------------------

def source_oleoweb():
    items, page = [], 1
    while True:
        batch = get(f"https://www.oleoweb.com/wp-json/wc/store/products"
                    f"?per_page=100&page={page}")
        if not batch:
            break
        for x in batch:
            imgs = x.get("images") or []
            if not imgs:
                continue
            items.append({"key": norm(x.get("sku") or x.get("slug")),
                          "label": x.get("sku") or x.get("name"),
                          "image": imgs[0]["src"], "page": x.get("permalink")})
        if len(batch) < 100:
            break
        page += 1
    return items


def source_water_hydraulics():
    """No featured_media on any page, so the photo has to come out of the page
    HTML — first wp-content image that isn't a logo or an icon.

    That first-match rule is crude and gets it wrong when a page leads with a
    performance curve instead of the product (1 of the 11 matches did). Picking
    the most photo-like of several candidates would need a download per
    candidate, which triples the request count against a small server for one
    extra product — not worth it. review.html catches these instead."""
    items, page = [], 1
    pages = []
    while True:
        batch = get("https://www.waterhydraulics.co.uk/wp-json/wp/v2/pages"
                    f"?per_page=100&page={page}&_fields=slug,link")
        if not batch:
            break
        pages += batch
        if len(batch) < 100:
            break
        page += 1
    for p in pages:
        try:
            html = get(p["link"], as_json=False).decode("utf-8", "ignore")
        except Exception:
            continue
        for m in re.finditer(r'src="(https://[^"]*wp-content/uploads/[^"]+\.(?:jpg|jpeg|png|webp))"',
                             html, re.I):
            src = m.group(1)
            if re.search(r"logo|icon|favicon|banner|flag|cookie", src, re.I):
                continue
            items.append({"key": norm(p["slug"]), "label": p["slug"],
                          "image": src, "page": p["link"]})
            break
    return items


SOURCES = {
    "oleoweb": source_oleoweb,
    "water-hydraulics": source_water_hydraulics,
}


def match(candidates, keys, prefix_min=3):
    for k in keys:
        for c in candidates:
            if c["key"] == k:
                return c, "exact"
    for k in keys:
        if len(k) < prefix_min:
            continue
        for c in candidates:
            if c["key"].startswith(k) or (k.startswith(c["key"]) and len(c["key"]) >= prefix_min):
                return c, "prefix"
    return None, None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", help="comma-separated manufacturer slugs")
    ap.add_argument("--dry-run", action="store_true",
                    help="report match rates, download nothing")
    ap.add_argument("--no-promote", action="store_true",
                    help="record the web photo but leave the catalog crop as hero")
    args = ap.parse_args()
    only = set(args.only.split(",")) if args.only else set(SOURCES)

    merged = json.load(open(os.path.join(EXTRACTED, "_merged_dataset.json"),
                            encoding="utf-8"))["products"]
    manifest = json.load(open(MANIFEST, encoding="utf-8"))
    by_slug = {e["slug"]: e for e in manifest}

    os.makedirs(WEB_DIR, exist_ok=True)
    totals = {"matched": 0, "fetched": 0, "failed": 0, "placards": 0}

    for name in SOURCES:
        if name not in only:
            continue
        print(f"\n{name}: listing products …")
        try:
            candidates = SOURCES[name]()
        except Exception as e:
            print(f"  ! listing failed: {e}")
            continue
        print(f"  {len(candidates)} products with a photo on site")

        ours = {s: p for s, p in merged.items() if s.startswith(name)}
        hits = 0
        for slug, product in ours.items():
            found, how = match(candidates, model_keys(product, name))
            if not found:
                continue
            hits += 1
            totals["matched"] += 1
            entry = by_slug.get(slug)
            if entry is None or args.dry_run:
                continue
            try:
                img = Image.open(io.BytesIO(get(found["image"], as_json=False)))
                out = trim_and_pad(img)
            except (urllib.error.URLError, OSError, ValueError) as e:
                print(f"  ! {slug} — {found['image']}: {e}")
                totals["failed"] += 1
                continue
            rel = f"web/{slug}.webp"
            out.save(os.path.join(OUT_DIR, rel), "WEBP", quality=88, method=5)
            totals["fetched"] += 1

            entry["web"] = {"file": rel, "matched_by": how,
                            "source": found["page"], "image": found["image"]}
            if not args.no_promote:
                # keep the catalog crop reachable in review.html
                if entry.get("file"):
                    entry.setdefault("alternates", []).insert(
                        0, {"file": entry["file"], "score": entry.get("score", 0),
                            "page": entry.get("page"), "why": {"note": "catalog crop"}})
                entry["file"] = rel
                entry["source"] = f"manufacturer_site ({how})"
                red = red_fraction(out)
                entry["risk"] = 1.0 if red > 0.30 else 0.0
                if red > 0.30:
                    entry["note"] = "looks like a PHASED OUT placard, not a product"
                    totals["placards"] += 1
        print(f"  matched {hits}/{len(ours)} of our products ({hits * 100 // max(1, len(ours))}%)")

    if not args.dry_run:
        json.dump(manifest, open(MANIFEST, "w", encoding="utf-8"),
                  ensure_ascii=False, indent=1)
        print(f"\nmanifest updated -> {MANIFEST}")
    print(f"matched={totals['matched']} fetched={totals['fetched']} "
          f"failed={totals['failed']} placards={totals['placards']}")
    if not args.dry_run:
        print("re-run `npm run images:review` to rebuild the contact sheet")


if __name__ == "__main__":
    main()
