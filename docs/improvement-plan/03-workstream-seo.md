# 03 · Workstream: SEO & Discoverability

**Goal:** make every page correctly described, localized, shareable (KakaoTalk/email previews), and machine-readable for Google **and Naver**. Everything here is additive — no visual changes.

## Task 3.1 — metadataBase + per-locale root metadata

**Files:** `src/app/[locale]/layout.tsx`, `messages/ko.json`, `messages/en.json`

Replace the static English-only `export const metadata` with `generateMetadata({ params })`:

- `metadataBase: new URL(process.env.NEXT_PUBLIC_SITE_URL ?? "https://www.hydrofast.co.kr")`
- Localized `title.default` / `title.template` / `description` from a new `meta` namespace in the message files. Korean description should target real queries: 유압 텐셔닝, 초고압 밸브/피팅, 토크렌치 교정, 유압 시스템 설계·제작, 소방 펌프 등 — write natural sentences, not keyword stuffing.
- `alternates`: canonical for the current locale + `languages: { ko: <path>, en: /en<path>, "x-default": <ko path> }`. Note `localePrefix: "as-needed"` → ko has **no** `/ko` prefix.
- `openGraph`: `siteName`, `type: "website"`, `locale: ko_KR / en_US`, and a default OG image (Task 3.2). Add `twitter: { card: "summary_large_image" }`.
- Add `verification` slots reading env vars: `GOOGLE_SITE_VERIFICATION`, `NAVER_SITE_VERIFICATION` (Naver uses `<meta name="naver-site-verification">` — use `other` field). Document both env vars in `.env.example`.

## Task 3.2 — Default OG image

**Files:** new `src/app/[locale]/opengraph-image.tsx` (or static `public/og-default.png`)

Generate with `next/og` `ImageResponse`: dark steel background (`#0f1115`), HYDRO(FAST) wordmark in brand blue/orange, tagline "Precision & Power in Hydraulic", 1200×630. Keep it static-friendly (no DB calls).

## Task 3.3 — Per-page metadata for every marketing route

**Files:** each `src/app/[locale]/{products,cases,partners,about,contact,affiliates}/page.tsx`, `src/app/[locale]/business/[areaSlug]/page.tsx`, `src/app/[locale]/partners/[slug]/page.tsx`, `src/app/[locale]/affiliates/[slug]/page.tsx`

- Static-ish pages: `generateMetadata` with localized title/description from messages (e.g. `제품 검색 | HYDROFAST`, description summarizing the catalog).
- `business/[areaSlug]`: title from the area's ko/en name, description from its summary — data is already loaded via `getAllAreas()` / DB.
- `partners/[slug]`: manufacturer name + one-liner.
- Product detail already has `generateMetadata` — **extend it** with `openGraph.images` using the product's first image via `publicImageUrl(...)`, plus canonical + hreflang alternates.

**Acceptance:** every route in the sitemap returns a unique, localized `<title>` and `<meta name="description">`; product detail pages show the product photo in an OG debugger.

## Task 3.4 — JSON-LD structured data

**Files:** `src/app/[locale]/layout.tsx` (site-wide), product detail page, business/case pages as noted

1. **Organization + LocalBusiness** (site-wide, one `<script type="application/ld+json">`): name HYDROFAST Co., Ltd. / (주)하이드로화스트, url, logo (OG image ok), `address` (인천광역시 부평구 부평대로 283, 우림라이온스밸리 C동 610호), `telephone: +82-32-623-5015`, `email`, `openingHours: Mo-Fr 09:00-18:00`. Values already exist in `site-footer.tsx` — single-source them (settings or a `src/lib/company.ts` constant) so footer and JSON-LD can't drift.
2. **Product** JSON-LD on `products/[slug]`: name, image, brand (manufacturer), description. Omit price/offers (quote-based B2B) — use only fields you have.
3. **BreadcrumbList** on product detail and business area pages (Home → 제품 검색 → product name).

Render via a small `JsonLd` server component that `JSON.stringify`s a typed object — no `dangerouslySetInnerHTML` of user-editable strings without stringify.

## Task 3.5 — Sitemap upgrades

**Files:** `src/app/sitemap.ts`

- Add `lastModified` (use `updatedAt` columns where the schema has them; fall back to build time).
- Add per-entry `alternates.languages` mirroring Task 3.1 so hreflang appears in the sitemap too.
- Confirm ko URLs are emitted without `/ko` prefix (current code is correct — keep it).

## Task 3.6 — Search-engine registration checklist (human tasks, not code)

Append to repo `TODO.md`:
- Register at Google Search Console + **Naver Search Advisor** (site verification env vars from 3.1), submit `sitemap.xml` to both.
- Create a Naver 스마트플레이스 / Google Business Profile with the Bupyeong address.
- After deploy, validate with Kakao link debugger (`developers.kakao.com/tool/debugger/sharing`) and Google Rich Results test.

## Verification

`npm run build`; view-source of `/`, `/en`, one product, one business area → check title/description/canonical/hreflang/OG/JSON-LD blocks all present and locale-correct.
