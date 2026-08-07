# 01 · Consolidated Audit Findings

All findings verified against live https://hydrofast.co.kr and source on 2026-08-04. Severity: **P0** = broken/embarrassing/legal, **P1** = clearly hurting results, **P2** = polish.

## A. What is already good (do not regress)

- Clean token-based design system with dark mode (`globals.css`), deliberate "industrial spec-sheet" direction documented in code comments.
- Proper i18n architecture (next-intl, `localePrefix: "as-needed"`, ko/en message parity is currently 100%).
- `sitemap.ts` + `robots.ts` exist and pull dynamic slugs from DB with graceful DB-failure fallback.
- Product detail pages already have `generateMetadata`.
- CSS-only logo marquee with `prefers-reduced-motion` handling; `MotionProvider` respects reduced motion globally.
- Trigram search (`similarity()`) on products; structured spec-schema per category is genuinely sophisticated.
- Images resized server-side at upload (documented tradeoff vs. Vercel image cap).

## B. Findings by subagent

### B1. Content/Data — P0
1. **Homepage renders visibly duplicated case studies.** Live homepage shows "CGIS도킹시스템 로봇" (효성) **three times** and "탈선 복구장비" (해군) **twice**. Cause: `src/app/[locale]/page.tsx` takes latest 6 rows from `caseStudies` with no dedupe; multiple photos of one project were uploaded as separate case-study rows. This is the single most damaging thing on the site — it reads as broken to a procurement engineer.
2. **Stats section renders `0+ / 0 bar / 0+` for crawlers, no-JS, and first paint.** `useCountUp` starts at `0` and only animates client-side; the server-rendered HTML (confirmed in live fetch) literally shows zeros for "업력", "최대 취급 압력", "해외 파트너사".
3. **Stats are hardcoded** in `page.tsx` (`target={28}`, `target={6900}`) — company facts living in JSX instead of the CMS/settings that already exist.

### B2. SEO — P1 (high value for B2B lead gen)
4. Root metadata (`[locale]/layout.tsx`) is **English-only and static** — Korean pages ship an English title/description; no per-locale `generateMetadata`.
5. **No `metadataBase`, no canonical, no `alternates.languages` (hreflang)** anywhere. ko/en duplicates are undifferentiated to Google.
6. **No Open Graph / Twitter card metadata and no OG image** — links shared in KakaoTalk/email (the #1 B2B sharing channels in Korea) render bare.
7. **No structured data at all**: no `Organization`/`LocalBusiness` JSON-LD (address/phone are in the footer already), no `Product`, no `BreadcrumbList`.
8. List pages (`/products`, `/cases`, `/partners`, `/about`, `/contact`, `/business/[areaSlug]`) have **no per-page metadata** except product detail.
9. `sitemap.ts` lacks `lastModified` and hreflang alternates; also emits `/business/...` for areas but business-area pages have no `generateMetadata`.
10. Not registered concern in code but worth doing: Naver Search Advisor / Google Search Console verification meta tags have no slot (site is Korean industrial — **Naver matters as much as Google**).

### B3. UX/Visual — P1
11. **Text-only hero.** For a company selling 6,900-bar hardware to shipyards and nuclear plants, the hero has no photo/product/facility imagery — just a gradient. Trust in this sector is visual (equipment, certifications, sites).
12. **Certifications exist in the CMS (`certifications` table + admin UI) but never appear on the homepage.** "원자력 A등급", ISO certs etc. are the strongest trust signals available and are unused above the fold.
13. Homepage has **no closing CTA section** — after logo marquees the page just ends at the footer.
14. "사업 분야" dropdown is hover-based desktop-only pattern; there is **no `/business` overview landing page** if a user clicks the label.
15. Case-study cards on the homepage don't link anywhere (cards are `<div>`s, only the "전체 보기" link navigates).
16. Overseas Partners section heading is hardcoded English `"Overseas Partners"` in `page.tsx` even on the Korean page (inconsistent with everything else being translated).

### B4. Accessibility — P1
17. Business dropdown: mouse `onMouseEnter/Leave` + click, **no `aria-expanded`, no `aria-haspopup`, no Escape-to-close, no focus management**; keyboard users can open it but hover-close logic fights them.
18. Marquee `<img>`s and case-study `<img>`s have **no `width`/`height`** (CLS) and **no `loading="lazy"`** — the homepage loads ~72 marquee logo images eagerly (36 logos × 2 for the loop).
19. Hero `<h1>` uses `dangerouslySetInnerHTML` from translation files — works, but any future CMS-sourced title becomes an XSS vector; also screen readers read `<br/>`-split lines fine but this should be flagged and contained.
20. Language switcher is a bare "EN" — needs `aria-label`/`lang` semantics.
21. No visible skip-to-content link.

### B5. Performance — P2
22. Duplicate marquee list = double image requests; combined with `unoptimized`, homepage image weight is unbounded as logos grow. Lazy-loading below-fold images is the cheap fix consistent with the no-optimizer decision.
23. `/products` is `force-dynamic` (fine for search) but the homepage runs 4 DB queries per request with no caching directives — consider `revalidate` for marketing pages.

### B6. Compliance/Forms — P0 (legal) / P1
24. **Contact form collects name/email/phone/company with no privacy consent checkbox and the site has no 개인정보처리방침 (privacy policy) page.** Korean PIPA requires consent + a published policy when collecting personal information. Footer has no policy link.
25. **Inquiries only go to the DB** (`contact/actions.ts` inserts into `inquiries`); nobody is emailed. Leads die silently unless someone checks `/admin/inquiries`.
26. **No spam protection** on the server action: no honeypot, no rate limit, no length caps — an open insert endpoint into your DB.
27. Server-side validation error message is Korean-only even on `/en/contact`.
28. No custom `not-found.tsx` under `[locale]` — 404s fall through to the default Next screen.

## C. Priority map → workstreams

| Findings | Workstream |
|---|---|
| 1, 2, 3, 16, 28 | `02-workstream-quick-wins.md` |
| 4–10 | `03-workstream-seo.md` |
| 11–15 | `04-workstream-design-ux.md` |
| 17–23 | `05-workstream-a11y-performance.md` |
| 24–27 + CMS data hygiene | `06-workstream-content-data-compliance.md` |
