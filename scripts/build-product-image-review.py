# -*- coding: utf-8 -*-
"""
Human review gate between extract-product-images.py and upload-product-images.ts.

Auto-picking a product photo off a catalog page is right most of the time but
not all of the time, and a wrong photo on a spec page is worse than no photo.
So nothing gets uploaded until someone has looked at it.

    python scripts/build-product-image-review.py
        -> assets-src/product-images/review.html   (open it in a browser)

In the page: click a thumbnail to promote that alternate, click the big image to
reject the product outright. Decisions live in localStorage; hit "Download
decisions" and drop the file next to the manifest, then:

    python scripts/build-product-image-review.py --apply
        -> promoted alternates become <slug>.webp, rejects get flagged in
           manifest.json, and the uploader skips them.
"""
import argparse
import json
import os
import shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT_DIR = os.path.join(ROOT, "assets-src", "product-images")
MANIFEST = os.path.join(OUT_DIR, "manifest.json")
DECISIONS = os.path.join(OUT_DIR, "review-decisions.json")
REVIEW = os.path.join(OUT_DIR, "review.html")

PAGE = """<!doctype html>
<meta charset="utf-8">
<title>Product image review — %(n)d products</title>
<style>
 body{font:13px/1.4 system-ui,sans-serif;margin:0;background:#eef0f3;color:#12161c}
 header{position:sticky;top:0;z-index:9;background:#fff;border-bottom:1px solid #ccd;
        padding:10px 16px;display:flex;gap:16px;align-items:center;flex-wrap:wrap}
 header b{font-size:15px} button{font:inherit;padding:6px 12px;border-radius:6px;
        border:1px solid #99a;background:#fff;cursor:pointer}
 button.primary{background:#12325c;color:#fff;border-color:#12325c}
 select{font:inherit;padding:5px}
 .grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(210px,1fr));gap:12px;padding:16px}
 .card{background:#fff;border:1px solid #d7dbe2;border-radius:8px;padding:8px;
       display:flex;flex-direction:column;gap:6px}
 .card.rejected{opacity:.4;border-color:#c33;background:#fff3f3}
 .card.changed{border-color:#0a7;box-shadow:0 0 0 2px #0a72}
 .hero{width:100%%;aspect-ratio:1;object-fit:contain;background:#fff;cursor:pointer;
       border:1px solid #eee;border-radius:4px}
 .meta{font-size:11px;color:#5a6270;word-break:break-all}
 .meta b{color:#12161c;font-size:12px}
 .alts{display:flex;gap:4px;flex-wrap:wrap}
 .alts img{width:44px;height:44px;object-fit:contain;border:1px solid #ccd;
           border-radius:4px;cursor:pointer;background:#fff}
 .alts img:hover{border-color:#12325c}
 .badge{font-size:10px;padding:1px 5px;border-radius:99px;background:#e6ebf2;color:#3a4250}
 .lowscore{background:#fde9c8}
</style>
<header>
  <b>Product image review</b>
  <span id="count"></span>
  <select id="filter">
    <option value="">all manufacturers</option>
    %(options)s
  </select>
  <label title="Ordering hint only — it misses application photos entirely. Scan the full grid.">
    <input type="checkbox" id="onlyrisky"> only flagged (partial — see tooltip)</label>
  <button id="download" class="primary">Download decisions</button>
  <button id="reset">Reset</button>
</header>
<div class="grid" id="grid"></div>
<script>
const DATA = %(data)s;
const KEY = "hydrofast-image-review";
let dec = JSON.parse(localStorage.getItem(KEY) || "{}");
const save = () => localStorage.setItem(KEY, JSON.stringify(dec));

function render() {
  const man = document.getElementById("filter").value;
  const risky = document.getElementById("onlyrisky").checked;
  const grid = document.getElementById("grid");
  grid.innerHTML = "";
  let shown = 0;
  for (const p of DATA) {
    if (man && p.manufacturer !== man) continue;
    if (risky && p.risk < 0.3) continue;
    shown++;
    const d = dec[p.slug] || {};
    const card = document.createElement("div");
    card.className = "card" + (d.rejected ? " rejected" : "") + (d.file ? " changed" : "");
    const src = d.file || p.file;
    card.innerHTML = `
      ${src ? `<img class="hero" src="${src}" loading="lazy">`
            : `<div class="hero" style="display:grid;place-items:center;color:#b00">no candidate</div>`}
      <div class="meta"><b>${p.slug}</b><br>${p.nameKo || ""}<br>
        <span class="badge${p.risk >= 0.3 ? " lowscore" : ""}">risk ${p.risk}</span>
        <span class="badge">p${p.page ?? "?"}</span>
        <span class="badge">${p.source || ""}</span>
        ${p.note ? `<span class="badge lowscore">${p.note}</span>` : ""}</div>
      <div class="alts">${p.alternates.map(a =>
        `<img src="${a.file}" title="score ${a.score} · p${a.page}" data-file="${a.file}" loading="lazy">`).join("")}</div>`;
    const hero = card.querySelector(".hero");
    if (hero) hero.onclick = () => { dec[p.slug] = {...d, rejected: !d.rejected}; save(); render(); };
    card.querySelectorAll(".alts img").forEach(img => {
      img.onclick = () => { dec[p.slug] = {...d, file: img.dataset.file, rejected: false}; save(); render(); };
    });
    grid.appendChild(card);
  }
  const changed = Object.values(dec).filter(d => d.file).length;
  const rejected = Object.values(dec).filter(d => d.rejected).length;
  document.getElementById("count").textContent =
    `${shown} shown · ${changed} swapped · ${rejected} rejected`;
}
document.getElementById("filter").onchange = render;
document.getElementById("onlyrisky").onchange = render;
document.getElementById("reset").onclick = () => { dec = {}; save(); render(); };
document.getElementById("download").onclick = () => {
  const blob = new Blob([JSON.stringify(dec, null, 1)], {type: "application/json"});
  const a = document.createElement("a");
  a.href = URL.createObjectURL(blob);
  a.download = "review-decisions.json";
  a.click();
};
render();
</script>
"""


# Catalogs where the page is a scan, so every raster on it — flow curve,
# dimension drawing, ordering-code table — looks as photographic as the product.
SCANNED = {"water-hydraulics"}


def risk_of(entry):
    """0..1 estimate that this crop is the wrong picture, used to order the
    review queue. Tuned against a hand-checked random sample of 96: the misses
    are application photography (GEMELS section pages), charts and CAD drawings
    (Water Hydraulics, Moveco), and one series shot reused across variants
    (Oleoweb).

    Treat this as an ordering hint, not a filter you can trust to be complete:
    checked against 13 hand-identified bad crops it caught 3. The GEMELS
    scenery shots in particular are large, central, sit right next to the model
    number and are highly photographic — they beat the real product renders on
    every signal available here, and the only thing that separates them is
    knowing what a ball valve looks like. That is what the contact sheet is
    for. Scan the whole grid; the flag will not find them for you."""
    if not entry.get("file"):
        return 1.0
    why = entry.get("why") or {}
    risk = 0.0
    # the model number never appeared on the page we took the image from
    if not why.get("near_model"):
        risk += 0.35
    # the same raster was already handed to another product
    if why.get("claimed"):
        risk += 0.3
    # wide landscape rasters are usually a banner, a chart or a scenery shot
    px = entry.get("source_px") or [1, 1]
    if px[1] and px[0] / px[1] > 1.5:
        risk += 0.25
    if entry.get("manufacturer") in SCANNED:
        risk += 0.3
    if entry.get("score", 9) < 1.0:
        risk += 0.2
    return min(1.0, round(risk, 2))


def build():
    manifest = json.load(open(MANIFEST, encoding="utf-8"))
    for entry in manifest:
        # fetch-manufacturer-images.py sets risk itself on the photos it pulls
        # (0 for a clean product shot, 1 for a "phased out" placard); its
        # judgement is better than anything inferable from the catalog crop.
        if "risk" not in entry:
            entry["risk"] = risk_of(entry)
    # highest-risk first, so a partial review pass still catches the worst
    manifest.sort(key=lambda e: -e["risk"])
    mans = sorted({m["manufacturer"] for m in manifest})
    options = "\n    ".join(f'<option value="{m}">{m}</option>' for m in mans)
    html = PAGE % {
        "n": len(manifest),
        "options": options,
        "data": json.dumps(manifest, ensure_ascii=False),
    }
    with open(REVIEW, "w", encoding="utf-8") as fh:
        fh.write(html)
    print(f"{REVIEW}\n  {len(manifest)} products, {len(mans)} manufacturers")
    print("  open it in a browser, review, then --apply the downloaded decisions")


def apply():
    if not os.path.exists(DECISIONS):
        raise SystemExit(f"no decisions file at {DECISIONS} — download it from review.html first")
    manifest = json.load(open(MANIFEST, encoding="utf-8"))
    decisions = json.load(open(DECISIONS, encoding="utf-8"))
    swapped = rejected = 0
    for entry in manifest:
        d = decisions.get(entry["slug"])
        if not d:
            entry.pop("rejected", None)
            continue
        if d.get("rejected"):
            entry["rejected"] = True
            rejected += 1
            continue
        entry.pop("rejected", None)
        if d.get("file"):
            src = os.path.join(OUT_DIR, d["file"])
            dst = os.path.join(OUT_DIR, f"{entry['slug']}.webp")
            shutil.copyfile(src, dst)
            entry["file"] = f"{entry['slug']}.webp"
            entry["reviewed_swap"] = d["file"]
            swapped += 1
    json.dump(manifest, open(MANIFEST, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"applied: {swapped} swapped, {rejected} rejected -> {MANIFEST}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--apply", action="store_true", help="apply review-decisions.json")
    a = ap.parse_args()
    apply() if a.apply else build()
