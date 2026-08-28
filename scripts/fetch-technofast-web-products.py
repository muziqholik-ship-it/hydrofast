"""Rebuild the Technofast dataset and image manifest from its official product pages."""
from __future__ import annotations

import html
import io
import json
import re
import urllib.request
from pathlib import Path

from bs4 import BeautifulSoup
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
DATASET = ROOT / "assets-src/catalogs/extracted/technofast.json"
IMAGE_ROOT = ROOT / "assets-src/product-images"
WEB_ROOT = IMAGE_ROOT / "web/technofast"
MANIFEST = IMAGE_ROOT / "manifest.json"
UA = "Hydrofast catalog importer/1.0 (+https://hydrofast.co.kr)"

# Official /products/ order. `old` preserves the already translated Korean copy
# and the dimensional ranges transcribed from the current 2026 brochure.
PRODUCTS = [
    ("b2-ezijac-bolt-tensioner", "technofast-ezijac-b2", "technofast-ezijac-b2", "technofast-bolt-tensioners"),
    ("b3m-ezijac-bolt-tensioner", "technofast-ezijac-b3m", None, "technofast-bolt-tensioners"),
    ("b3s-ezijac-bolt-tensioner", "technofast-ezijac-b3s", "technofast-ezijac-b3s", "technofast-bolt-tensioners"),
    ("blue-rhino-electric-tensioner-pumps", "technofast-blue-rhino-electric-tensioner-pumps", None, "technofast-hydraulic-pumps"),
    ("camnut", "technofast-camnut", "technofast-camnut", "technofast-hydraulic-nuts"),
    ("clamp-nut", "technofast-ezitite-hydraulic-clamp-nut", "technofast-ezitite-hydraulic-clamp-nut", "technofast-hydraulic-nuts"),
    ("bearing-setter", "technofast-ezitite-bearing-setter", "technofast-ezitite-bearing-setter", "technofast-hydraulic-nuts"),
    ("ezitite-hydraulic-bolts", "technofast-ezitite-hydraulic-bolt", "technofast-ezitite-hydraulic-bolt", "technofast-hydraulic-nuts"),
    ("ezitite-head-nut", "technofast-ezitite-hydraulic-head-nut", "technofast-ezitite-hydraulic-head-nut", "technofast-hydraulic-nuts"),
    ("ezitite-hydraulic-nuts", "technofast-ezitite-hydraulic-nut", "technofast-ezitite-hydraulic-nut", "technofast-hydraulic-nuts"),
    ("ezitite-tr-hydraulic-nut", "technofast-ezitite-tr-high-temperature-nut", "technofast-ezitite-tr-high-temperature-nut", "technofast-hydraulic-nuts"),
    ("ezitite-washer", "technofast-ezitite-hydraulic-washer", None, "technofast-hydraulic-nuts"),
    ("fastajac", "technofast-fastajac", "technofast-fastajac", "technofast-bolt-tensioners"),
    ("fittings", "technofast-high-pressure-fittings", None, "technofast-hoses-ancillaries"),
    ("high-pressure-air-hydraulic-pumps", "technofast-high-pressure-air-hydraulic-pumps", "technofast-high-pressure-hydraulic-pumps", "technofast-hydraulic-pumps"),
    ("hoses", "technofast-preassembled-hydraulic-hoses", "technofast-preassembled-hydraulic-hoses", "technofast-hoses-ancillaries"),
    ("liftajac", "technofast-liftajac", "technofast-liftajac", "technofast-lifting"),
    ("lightweight-hand-pumps", "technofast-lightweight-hand-pump", "technofast-lightweight-hand-pump", "technofast-hydraulic-pumps"),
    ("ancillary-items", "technofast-spanners", None, "technofast-hoses-ancillaries"),
    ("y2-x2-2-stage-tensioning", "technofast-ezijac-x2-y2", "technofast-ezijac-x2-y2", "technofast-bolt-tensioners"),
]

NEW_COPY = {
    "technofast-ezijac-b3m": {
        "modelNo": "EziJac B3M Series", "nameKo": "EziJac B3M 모듈식 볼트 텐셔너",
        "shortDescriptionKo": "교체식 어댑터 키트와 수동 복귀 구조를 갖춘 모듈식 유압 볼트 텐셔너입니다.",
        "descriptionKo": "B3M은 하나의 로드 셀에 여러 교체식 어댑터를 결합하여 다양한 나사 크기에 대응합니다. 긴 스트로크, 스트로크 표시기, 저마찰 씰 및 선택형 두 번째 포트로 정확한 다점 동시 체결을 지원합니다.",
        "specs": {"thread_range": "M20-M100 / 3/4-4 in", "max_pressure_bar": 1500, "stroke_mm": "15", "return_type": "Manual return", "configuration": "Modular interchangeable adaptor kits"},
    },
    "technofast-blue-rhino-electric-tensioner-pumps": {
        "modelNo": "Blue Rhino", "nameKo": "Blue Rhino 전동 유압 텐셔너 펌프",
        "shortDescriptionKo": "가혹한 현장과 높은 듀티 사이클을 위해 설계된 고유량 전동 유압 텐셔너 펌프입니다.",
        "descriptionKo": "Blue Rhino는 산업용 전동 모터, 비상 정지 기능이 있는 저전압 핸드 펜던트, 보호 프레임과 고급 여과 시스템을 갖춥니다. 오일 쿨러, 디지털 게이지, 대용량 탱크와 수글리콜 호환 옵션을 선택할 수 있습니다.",
        "specs": {"drive_type": "Industrial electric motor", "pressure_range_bar": "Up to 2068 (30,000 psi option)", "reservoir_capacity_l": "Configurable", "flow_rate_lpm": "High-flow configuration available", "weight_range_kg": "Compact portable frame"},
    },
    "technofast-ezitite-hydraulic-washer": {
        "modelNo": "EW-330-436-000", "nameKo": "EziTite 유압 와셔",
        "shortDescriptionKo": "평행한 두 면 사이에 정밀한 축력을 가하는 비나사식 유압 와셔입니다.",
        "descriptionKo": "EziTite 유압 와셔는 나사식 몸체 대신 비나사 보어를 사용해 공구 상·하면으로 하중을 전달합니다. 대구경 볼트 또는 두 평행면 사이의 매우 정확한 텐셔닝이 필요한 용도에 적합합니다.",
        "specs": {"thread_range": "330 mm bore", "max_force_kn": 10014.7, "stroke_mm": "10", "material": "Non-threaded hydraulic washer; OD 436 mm; height 69 mm; weight 33.7 kg"},
    },
    "technofast-high-pressure-fittings": {
        "modelNo": "HNCP Series", "nameKo": "Technofast 고압 유압 피팅",
        "shortDescriptionKo": "CEJN Series 116 커플러, 어댑터, T-블록과 5방향 매니폴드 제품군입니다.",
        "descriptionKo": "Technofast 고압 피팅 제품군은 니플, 스냅 커플러, 연장 어댑터, 스위블, T-블록 및 5방향 매니폴드를 포함합니다. 1/8인치 및 1/4인치 BSP 연결과 CEJN Series 116 시스템을 지원합니다.",
        "shortDescriptionEn": "High-pressure CEJN Series 116 couplings, adaptors, T-blocks and five-way manifolds.",
        "descriptionEn": "Technofast's hydraulic fitting range includes Series 116 nipples and snap couplers, extension adaptors, BSP plugs, swivel couplers, T-blocks and five-way manifolds for connecting high-pressure bolt-tensioning systems.",
        "specs": {"product_type": "Couplings, adaptors, swivels, T-blocks and manifolds", "max_pressure_bar": 1500, "connection": "CEJN Series 116; 1/8 and 1/4 in BSP"},
    },
    "technofast-spanners": {
        "modelNo": "Walter / TB Series", "nameKo": "C-스패너 및 핀 스패너",
        "shortDescriptionKo": "유압 너트와 텐셔너 설치용 고강도 C-스패너 및 핀 스패너 제품군입니다.",
        "descriptionKo": "C-스패너는 직경 68~220 mm의 원형 너트와 실린더 회전에 사용합니다. 경화강 핀 스패너는 직경 6~14 mm 구멍에 대응하며 EziJac 너트 로테이터와 유압 너트 설치를 지원합니다.",
        "specs": {"product_type": "C-spanners and hardened-steel pin spanners", "connection": "C-spanner diameter 68-220 mm; pin diameter 6-14 mm"},
    },
}


def fetch_json(url: str):
    request = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(request) as response:
        return json.load(response)


def fetch_bytes(url: str) -> bytes:
    request = urllib.request.Request(url, headers={"User-Agent": UA})
    with urllib.request.urlopen(request) as response:
        return response.read()


def clean_html(value: str) -> str:
    soup = BeautifulSoup(value or "", "html.parser")
    for node in soup(["table", "script", "style"]):
        node.decompose()
    return re.sub(r"\s+", " ", html.unescape(soup.get_text(" ", strip=True))).strip()


def sentence_summary(text: str, limit: int = 280) -> str:
    if len(text) <= limit:
        return text
    end = text.rfind(". ", 0, limit)
    return text[: end + 1 if end > 100 else limit].strip()


def main():
    existing = json.loads(DATASET.read_text(encoding="utf-8"))
    old_by_slug = {item["slug"]: item for item in existing["products"]}
    WEB_ROOT.mkdir(parents=True, exist_ok=True)
    rebuilt = []
    manifest = []

    for page_slug, product_slug, old_slug, category_slug in PRODUCTS:
        page = fetch_json(f"https://www.technofast.com/wp-json/wp/v2/product?slug={page_slug}")[0]
        media = fetch_json(f"https://www.technofast.com/wp-json/wp/v2/media/{page['featured_media']}")
        title = html.unescape(page["title"]["rendered"]).replace("&#038;", "&").replace("&#8211;", "–")
        content = clean_html(page["content"]["rendered"])
        sections = []
        for label, key in (("Features", "product_features"), ("Benefits", "product_benefits"), ("Ideal applications", "products_ideal")):
            value = clean_html(str(page.get("acf", {}).get(key) or ""))
            if value:
                sections.append(f"{label}: {value}")
        description_en = " ".join(part for part in [content, *sections] if part)

        if old_slug:
            product = dict(old_by_slug.get(old_slug) or old_by_slug[product_slug])
        else:
            product = {"slug": product_slug, **NEW_COPY[product_slug]}
        if len(description_en) < 200:
            description_en = product.get("descriptionEn", description_en)
            content = product.get("shortDescriptionEn", content)
        product.update({
            "slug": product_slug,
            "categorySlug": category_slug,
            "nameEn": title,
            "shortDescriptionEn": sentence_summary(content or description_en),
            "descriptionEn": description_en,
            "sourceUrl": page["link"],
            "sourceImageUrl": media["source_url"],
            "sourceImageWidth": media.get("media_details", {}).get("width"),
            "sourceImageHeight": media.get("media_details", {}).get("height"),
        })
        product.pop("sourcePages", None)
        rebuilt.append(product)

        image = Image.open(io.BytesIO(fetch_bytes(media["source_url"]))).convert("RGB")
        relative = f"web/technofast/{product_slug}.webp"
        image.save(IMAGE_ROOT / relative, "WEBP", quality=92, method=6)
        manifest.append({
            "slug": product_slug, "manufacturer": "technofast",
            "modelNo": product.get("modelNo"), "nameKo": product.get("nameKo"),
            "nameEn": title, "file": relative, "status": "official-web-image",
            "rejected": False, "sourceUrl": media["source_url"],
        })
        print(f"{product_slug}: {image.width}x{image.height}")

    existing["products"] = rebuilt
    existing["sourceWebsite"] = "https://www.technofast.com/products/"
    existing["notes"] = "Current official Technofast product range, descriptions and original featured media; technical ranges cross-checked against the 2026 brochure."
    existing["extractedAt"] = "2026-08-28"
    DATASET.write_text(json.dumps(existing, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    MANIFEST.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {len(rebuilt)} products and {len(manifest)} official images")


if __name__ == "__main__":
    main()
