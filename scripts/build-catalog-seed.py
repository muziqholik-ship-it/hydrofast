# -*- coding: utf-8 -*-
"""
Merges the per-agent catalog extractions in assets-src/catalogs/extracted/*.json
into one dataset and emits docs/sql/004_product_catalog_seed.sql for the
Supabase SQL editor.

- manufacturers merged by slug (first non-empty field wins)
- categories merged by slug; specSchema unioned by key
- products deduped by slug (the richer record wins; OLELOWEB2 detail beats
  the OLELOWEB1 overview when both describe the same series)
- spec keys missing from the category schema are appended as text fields so
  they render and get indexed
- search_text built exactly like src/lib/search.ts buildSearchText()
"""
import json, glob, os, re, sys, unicodedata

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXTRACTED = os.path.join(ROOT, "assets-src", "catalogs", "extracted")
OUT_SQL = os.path.join(ROOT, "docs", "sql", "004_product_catalog_seed.sql")
OUT_MERGED = os.path.join(EXTRACTED, "_merged_dataset.json")

# category consolidation: near-duplicate categories from different agents
# (key is merged into value; products are re-pointed, spec schemas unioned)
CONSOLIDATE = {
    "oleoweb-accessories-and-components": "oleoweb-accessories",
    "oleoweb-pilot-operated-check-valves": "oleoweb-pilot-check-valves",
    "oleoweb-overcenter-valves": "oleoweb-balancing-valves",
    "oleoweb-flow-regulators": "oleoweb-flow-control-valves",
    "oleoweb-solenoid-flow-diverters": "oleoweb-flow-diverters",
    "oleoweb-solenoid-cartridge-valves": "oleoweb-solenoid-valves",
    "oleoweb-pressure-limiting-valves": "oleoweb-pressure-valves",
    "oleoweb-bases-and-manifolds": "oleoweb-manifolds",
    "oleoweb-reservoirs": "oleoweb-tanks",
    "water-hydraulics-valves": "water-hydraulics-check-valves",
}

# product slugs superseded by a more detailed record under a different slug
# (e.g. the OLELOWEB1 overview's LE row vs the general catalogue's LE103A page)
DROP_SLUGS = {"oleoweb-le"}

# manufacturer slug -> business area slug (must already exist in DB)
BUSINESS_AREA = {
    "euroswitch": "hydraulic-engineering",
    "gemels": "hydraulic-engineering",
    "oleoweb": "hydraulic-engineering",
    "moveco": "hydraulic-engineering",
    "webtec": "hydraulic-engineering",
    "dynaset": "hydraulic-engineering",
    "water-hydraulics": "fluid-gas",
    "technofast": "bolting-torque",
}

def load_files():
    files = sorted(glob.glob(os.path.join(EXTRACTED, "*.json")))
    files = [f for f in files if not os.path.basename(f).startswith("_")]
    datasets = []
    for f in files:
        with open(f, encoding="utf-8") as fh:
            try:
                datasets.append((os.path.basename(f), json.load(fh)))
            except Exception as e:
                print(f"!! {f}: JSON parse error: {e}")
                sys.exit(1)
    return datasets

def slugify(s):
    s = unicodedata.normalize("NFKD", s).encode("ascii", "ignore").decode()
    s = re.sub(r"[^a-z0-9]+", "-", s.lower()).strip("-")
    return s

def merge_manufacturers(datasets):
    out = {}
    for fname, d in datasets:
        for m in [d.get("manufacturer")] + d.get("extraManufacturers", []):
            if not m:
                continue
            slug = m["slug"]
            cur = out.setdefault(slug, {})
            for k, v in m.items():
                if v and not cur.get(k):
                    cur[k] = v
    return out

def humanize(key):
    return key.replace("_", " ").title()

def merge_categories(datasets):
    out = {}
    for fname, d in datasets:
        for c in d.get("categories", []):
            slug = c["slug"]
            if slug not in out:
                c = dict(c)
                c["specSchema"] = list(c.get("specSchema") or [])
                out[slug] = c
            else:
                cur = out[slug]
                for k, v in c.items():
                    if k == "specSchema":
                        continue
                    if v and not cur.get(k):
                        cur[k] = v
                have = {f["key"] for f in cur["specSchema"]}
                for f in c.get("specSchema") or []:
                    if f["key"] not in have:
                        cur["specSchema"].append(f)
                        have.add(f["key"])
    # normalize sortOrder + required flags
    for c in out.values():
        for i, f in enumerate(c["specSchema"], 1):
            f["sortOrder"] = i
            f.setdefault("required", False)
            f.setdefault("showInCardTeaser", False)
    return out

def richness(p):
    return (
        len(p.get("specs") or {}),
        len(p.get("descriptionKo") or "") + len(p.get("descriptionEn") or ""),
    )

def merge_products(datasets, categories):
    out = {}
    dupes = []
    for fname, d in datasets:
        for p in d.get("products", []):
            p = dict(p)
            p["_src"] = fname
            slug = p["slug"]
            if slug in DROP_SLUGS:
                continue
            if slug in out:
                keep, drop = out[slug], p
                # detail catalogs beat the OLELOWEB1 overview
                if ("oleoweb1" in keep["_src"]) != ("oleoweb1" in drop["_src"]):
                    if "oleoweb1" in keep["_src"]:
                        keep, drop = drop, keep
                elif richness(p) > richness(out[slug]):
                    keep, drop = p, out[slug]
                dupes.append((slug, keep["_src"], drop["_src"]))
                out[slug] = keep
            else:
                out[slug] = p
    # ensure every product's category exists; ensure spec keys covered
    for p in out.values():
        cat = categories.get(p.get("categorySlug"))
        if cat is None:
            print(f"!! product {p['slug']} references missing category {p.get('categorySlug')} (src {p['_src']})")
            continue
        have = {f["key"] for f in cat["specSchema"]}
        for k, v in (p.get("specs") or {}).items():
            if k not in have:
                cat["specSchema"].append({
                    "key": k, "labelKo": humanize(k), "labelEn": humanize(k),
                    "dataType": "number" if isinstance(v, (int, float)) and not isinstance(v, bool) else "text",
                    "required": False, "sortOrder": len(cat["specSchema"]) + 1,
                    "showInCardTeaser": False,
                })
                have.add(k)
    return out, dupes

def build_search_text(p, manufacturer_name, cat):
    spec_schema = cat["specSchema"] if cat else []
    specs = p.get("specs") or {}
    vals = []
    for f in spec_schema:
        v = specs.get(f["key"])
        if v is None or v == "":
            continue
        if f.get("dataType") == "select":
            opt = next((o for o in f.get("options") or [] if str(o.get("value")) == str(v)), None)
            parts = [str(v)]
            if opt:
                parts += [x for x in (opt.get("labelKo"), opt.get("labelEn")) if x]
            vals.append(" ".join(parts))
        else:
            vals.append(str(v).lower() if isinstance(v, bool) else str(v))
    fields = [
        p.get("nameKo"), p.get("nameEn"),
        p.get("shortDescriptionKo"), p.get("shortDescriptionEn"),
        p.get("modelNo"), manufacturer_name,
        cat.get("nameKo") if cat else None, cat.get("nameEn") if cat else None,
        *vals,
    ]
    return " ".join(str(x) for x in fields if x).lower()

def q(s):
    if s is None:
        return "null"
    if isinstance(s, bool):
        return "true" if s else "false"
    if isinstance(s, (int, float)):
        return str(s)
    return "'" + str(s).replace("'", "''") + "'"

def jsonb(obj):
    return "'" + json.dumps(obj, ensure_ascii=False).replace("'", "''") + "'::jsonb"

def consolidate_categories(cats, prods):
    for src, dst in CONSOLIDATE.items():
        if src not in cats:
            continue
        if dst not in cats:
            cats[dst] = cats.pop(src)
            cats[dst]["slug"] = dst
            for p in prods.values():
                if p.get("categorySlug") == src:
                    p["categorySlug"] = dst
            continue
        have = {f["key"] for f in cats[dst]["specSchema"]}
        for f in cats[src]["specSchema"]:
            if f["key"] not in have:
                cats[dst]["specSchema"].append(f)
                have.add(f["key"])
        del cats[src]
        for p in prods.values():
            if p.get("categorySlug") == src:
                p["categorySlug"] = dst
    # drop categories that ended up with no products
    used = {p.get("categorySlug") for p in prods.values()}
    for slug in [s for s in cats if s not in used]:
        print(f"   dropping empty category {slug}")
        del cats[slug]
    for c in cats.values():
        for i, f in enumerate(c["specSchema"], 1):
            f["sortOrder"] = i

def enforce_types(cats, prods):
    """Make the data pass buildSpecZodSchema: number/unit_value fields must be
    numeric for every product; select values must exist in options."""
    by_cat = {}
    for p in prods.values():
        by_cat.setdefault(p.get("categorySlug"), []).append(p)
    demoted, added_opts = 0, 0
    for slug, c in cats.items():
        plist = by_cat.get(slug, [])
        for f in c["specSchema"]:
            vals = [(p, p.get("specs", {}).get(f["key"])) for p in plist]
            vals = [(p, v) for p, v in vals if v is not None and v != ""]
            if f.get("dataType") in ("number", "unit_value"):
                if any(not isinstance(v, (int, float)) or isinstance(v, bool) for _, v in vals):
                    f["dataType"] = "text"
                    f.pop("unit", None)
                    demoted += 1
                    for p, v in vals:
                        p["specs"][f["key"]] = str(v)
            elif f.get("dataType") == "select":
                opts = f.setdefault("options", [])
                known = {str(o["value"]) for o in opts}
                for _, v in vals:
                    if str(v) not in known:
                        opts.append({"value": str(v), "labelKo": str(v), "labelEn": str(v)})
                        known.add(str(v))
                        added_opts += 1
            elif f.get("dataType") == "boolean":
                for p, v in vals:
                    if not isinstance(v, bool):
                        p["specs"][f["key"]] = str(v).strip().lower() in ("true", "yes", "y", "1", "예", "지원")
    print(f"   type pass: {demoted} number fields demoted to text, {added_opts} select options added")

def main():
    datasets = load_files()
    print(f"Loaded {len(datasets)} extraction files")
    mans = merge_manufacturers(datasets)
    cats = merge_categories(datasets)
    prods, dupes = merge_products(datasets, cats)
    consolidate_categories(cats, prods)
    enforce_types(cats, prods)
    if dupes:
        print(f"-- {len(dupes)} duplicate slugs resolved:")
        for s, k, d in dupes:
            print(f"   {s}: kept {k}, dropped {d}")

    # category -> manufacturer (by slug prefix) for business area + sanity
    def man_for_cat(cslug):
        for mslug in mans:
            if cslug.startswith(mslug + "-"):
                return mslug
        return None

    with open(OUT_MERGED, "w", encoding="utf-8") as fh:
        json.dump({"manufacturers": mans, "categories": cats,
                   "products": {k: {kk: vv for kk, vv in v.items() if kk != "_src"} for k, v in prods.items()}},
                  fh, ensure_ascii=False, indent=1)

    L = []
    L.append("-- 004 — Product catalog seed (auto-generated by scripts/build-catalog-seed.py)")
    L.append("-- Run in Supabase SQL Editor. Idempotent: re-running updates by slug.")
    L.append("begin;")
    L.append("")
    L.append("-- Manufacturers ------------------------------------------------------")
    for i, (slug, m) in enumerate(sorted(mans.items()), 1):
        L.append(
            "insert into manufacturers (slug, name, country, website_url, description_ko, description_en, is_active, sort_order)\n"
            f"values ({q(slug)}, {q(m.get('name'))}, {q(m.get('country'))}, {q(m.get('websiteUrl'))}, {q(m.get('descriptionKo'))}, {q(m.get('descriptionEn'))}, true, {i * 10})\n"
            "on conflict (slug) do update set name = excluded.name, country = excluded.country, website_url = excluded.website_url,\n"
            "  description_ko = excluded.description_ko, description_en = excluded.description_en, updated_at = now();"
        )
    L.append("")
    L.append("-- Manufacturer ↔ business area links ---------------------------------")
    for slug in sorted(mans):
        ba = BUSINESS_AREA.get(slug)
        if not ba:
            continue
        L.append(
            "insert into manufacturer_business_areas (manufacturer_id, business_area_id)\n"
            f"select m.id, b.id from manufacturers m, business_areas b where m.slug = {q(slug)} and b.slug = {q(ba)}\n"
            "on conflict do nothing;"
        )
    L.append("")
    L.append("-- Categories ----------------------------------------------------------")
    for i, (slug, c) in enumerate(sorted(cats.items()), 1):
        mslug = man_for_cat(slug)
        ba = BUSINESS_AREA.get(mslug) if mslug else None
        ba_sql = f"(select id from business_areas where slug = {q(ba)})" if ba else "null"
        L.append(
            "insert into product_categories (slug, name_ko, name_en, description_ko, description_en, business_area_id, sort_order, spec_schema)\n"
            f"values ({q(slug)}, {q(c.get('nameKo'))}, {q(c.get('nameEn'))}, {q(c.get('descriptionKo'))}, {q(c.get('descriptionEn'))}, {ba_sql}, {i * 10}, {jsonb(c['specSchema'])})\n"
            "on conflict (slug) do update set name_ko = excluded.name_ko, name_en = excluded.name_en,\n"
            "  description_ko = excluded.description_ko, description_en = excluded.description_en,\n"
            "  business_area_id = excluded.business_area_id, spec_schema = excluded.spec_schema, updated_at = now();"
        )
    L.append("")
    L.append("-- Products ------------------------------------------------------------")
    n = 0
    for slug, p in sorted(prods.items()):
        cat = cats.get(p.get("categorySlug"))
        mslug = man_for_cat(p.get("categorySlug") or "") or next(
            (ms for ms in mans if slug.startswith(ms + "-")), None)
        man = mans.get(mslug) or {}
        ba = BUSINESS_AREA.get(mslug) if mslug else None
        st = build_search_text(p, man.get("name"), cat)
        n += 10
        ba_sql = f"(select id from business_areas where slug = {q(ba)})" if ba else "null"
        cat_sql = f"(select id from product_categories where slug = {q(p.get('categorySlug'))})" if cat else "null"
        man_sql = f"(select id from manufacturers where slug = {q(mslug)})" if mslug else "null"
        L.append(
            "insert into products (slug, model_no, manufacturer_id, category_id, business_area_id,\n"
            "  name_ko, name_en, short_description_ko, short_description_en, description_ko, description_en,\n"
            "  specs, is_published, sort_order, search_text)\n"
            f"values ({q(slug)}, {q(p.get('modelNo'))}, {man_sql}, {cat_sql}, {ba_sql},\n"
            f"  {q(p.get('nameKo'))}, {q(p.get('nameEn'))}, {q(p.get('shortDescriptionKo'))}, {q(p.get('shortDescriptionEn'))}, {q(p.get('descriptionKo'))}, {q(p.get('descriptionEn'))},\n"
            f"  {jsonb(p.get('specs') or {})}, true, {n}, {q(st)})\n"
            "on conflict (slug) do update set model_no = excluded.model_no, manufacturer_id = excluded.manufacturer_id,\n"
            "  category_id = excluded.category_id, business_area_id = excluded.business_area_id,\n"
            "  name_ko = excluded.name_ko, name_en = excluded.name_en,\n"
            "  short_description_ko = excluded.short_description_ko, short_description_en = excluded.short_description_en,\n"
            "  description_ko = excluded.description_ko, description_en = excluded.description_en,\n"
            "  specs = excluded.specs, search_text = excluded.search_text, updated_at = now();"
        )
    L.append("")
    L.append("commit;")

    os.makedirs(os.path.dirname(OUT_SQL), exist_ok=True)
    with open(OUT_SQL, "w", encoding="utf-8") as fh:
        fh.write("\n\n".join(L) + "\n")

    print(f"manufacturers: {len(mans)}, categories: {len(cats)}, products: {len(prods)}")
    print(f"wrote {OUT_SQL}")
    print(f"wrote {OUT_MERGED}")

if __name__ == "__main__":
    main()
