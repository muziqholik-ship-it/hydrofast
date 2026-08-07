# 04 · Workstream: Design & UX (Homepage Narrative)

**Goal:** turn the homepage from "clean but empty" into a trust-building sales page for procurement engineers, **while keeping the existing "engineered spec-sheet" identity** (tight radii, steel-blue + safety-orange, mono accents). This is refinement, not a redesign. Do this workstream last.

## Design direction (from the lead)

The site's own token comments say it: this should read like an engineering document, not a SaaS template. The audience is 구매/설비 담당자 at shipyards, plants, and public agencies. They decide on: proof of capability (photos of real installs), proof of qualification (certifications, 원자력 A등급), proof of scale (clients, partners), and a fast path to 견적 문의. Every homepage change below serves one of those four.

**Signature element to introduce:** a thin "spec strip" motif — mono-font, uppercase, bordered rows like a datasheet (e.g. `MAX PRESSURE — 6,900 bar · CAL. CERT — ISO/IEC 17025 · NUCLEAR — CLASS A`). Use it in the hero and reuse nowhere else at full strength. This is the one deliberate risk; keep everything else quiet.

## Task 4.1 — Hero with imagery

**Files:** `src/components/marketing/home-hero.tsx`, `src/app/[locale]/page.tsx`, admin settings for hero image (optional)

Current hero is text + faint radial gradient. Upgrade options, in order of preference:

1. **Split hero:** text left (unchanged copy/motion), right side a real photo — a case-study image already in Supabase Storage works (e.g. an ETO build). Desaturate slightly + steel-blue duotone overlay so brand colors stay dominant. On mobile, image drops below text at reduced height.
2. If no suitable photo, a full-bleed dark technical background: subtle blueprint-grid CSS pattern using `--color-border` at low opacity — no stock photos, no generic 3D renders.

Add the **spec strip** (signature element) directly under the hero CTAs, replacing nothing — the stat counters section below stays.

**Rules:** no new hex values; motion via existing framer variants; `prefers-reduced-motion` yields a static hero.

## Task 4.2 — Certifications trust section

**Files:** `src/app/[locale]/page.tsx`, new `src/components/marketing/certification-strip.tsx`, reads `certifications` table

The CMS already manages certifications but the homepage never shows them. Add a compact section between the business-areas grid and case studies: heading `인증 및 자격` / `Certifications`, horizontal row of certification entries (logo/badge image if present, else name in a bordered mono chip). Link the section to `/about` (where certs presumably render in detail — verify; if not, add them to `/about` too). Only published/active rows, ordered by `sortOrder`.

## Task 4.3 — Case-study cards must be links

**Files:** `src/components/marketing/case-study-card.tsx`, `src/app/[locale]/cases/page.tsx`

Cards are inert `<div>`s. Wrap each card in a `Link` to `/cases` (or to a per-case anchor/detail if one exists — check; if `/cases` has no per-item anchors, add `id` anchors there). Preserve hover zoom; add visible keyboard focus ring using `--color-steel-light`.

## Task 4.4 — Closing CTA section

**Files:** `src/app/[locale]/page.tsx`, new component, `messages/*.json`

The page currently ends at a logo marquee. Add a final full-width CTA band on `--color-surface-alt` (or inverted steel background): one line — ko: `현장에 맞는 유압 솔루션이 필요하신가요?` / en equivalent — sub-line mentioning 상담부터 시공·FMS 관리까지, and two buttons: `견적 문의` (primary, safety-orange or steel per existing button styles) and `제품 검색` (secondary). Reuse hero button styles exactly.

## Task 4.5 — `/business` overview page + nav behavior

**Files:** new `src/app/[locale]/business/page.tsx`, `src/components/marketing/site-header.tsx`

Clicking "사업 분야" currently only toggles a dropdown; there's no destination. Create `/business` listing all 5 areas as full-width rows (reuse `AreaCard` content in a larger layout: index number, ko+en name, summary, `자세히 보기 →`). In the header, make the label itself a `Link` to `/business` while the caret still toggles the dropdown (or keep hover dropdown on desktop and link on click — either is fine, state which). Add the route to `sitemap.ts` STATIC_PATHS and give it metadata per Workstream 03 conventions.

## Task 4.6 — Mobile pass

**Files:** components touched above

After 4.1–4.5, review at 375px: hero type scale, spec strip wraps to 2 rows max, certification strip becomes horizontal scroll with edge fade, stat grid (currently `grid-cols-3` at all sizes in `page.tsx` — allow it to stay 3-up only if numbers don't clip; otherwise stack). Fix anything that clips or overflows.

## Acceptance

- Homepage tells the full story top-to-bottom: hero+proof strip → stats → 사업 분야 → 인증 → 제작 사례 (clickable) → partners → clients → closing CTA.
- No new colors/fonts outside `globals.css` tokens; ko/en both complete; `npm run build` passes; reduced-motion renders everything statically.
