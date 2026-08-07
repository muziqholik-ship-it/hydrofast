# 02 · Workstream: Quick Wins (P0)

**Goal:** fix everything a visitor can see is broken today, without touching the design language. All tasks are safe, small, and independent.

## Task 2.1 — Fix duplicate case studies on the homepage

**Files:** `src/app/[locale]/page.tsx`, optionally `src/db/schema` (case studies)

Live homepage shows the same project 3× ("CGIS도킹시스템 로봇") and another 2× ("탈선 복구장비") because multiple photos of one project exist as separate `caseStudies` rows and the homepage takes `desc(createdAt) limit 6` blindly.

Implement **both** layers:

1. **Code-level dedupe (immediate):** in `HomePage`, after fetching, dedupe by `(clientName, titleKo)` keeping the newest row, *then* take 6. Fetch `limit(18)` before dedupe so 6 unique projects survive.
2. **Data-model fix (right solution):** add a `caseStudyImages` child table (or `imagePaths: jsonb` array on `caseStudies`) so one project holds many photos; update `admin/case-studies` forms and `/cases` page to render one card per project with an image count badge or first image. If this is too large for this session, create the dedupe only and copy this item verbatim into a `TODO.md` at repo root.

**Acceptance:** homepage never shows two cards with identical client+title; `/cases` unaffected or improved; build passes.

## Task 2.2 — Stats must render real numbers server-side

**Files:** `src/components/marketing/stat-counter.tsx`, `src/hooks/use-count-up.ts`

Server HTML currently ships `0+`, `0 bar`, `0+` (verified via live fetch). Crawlers, link previews, JS-disabled users, and everyone's first paint see zeros.

- Render the **final value** in the server/initial markup. Pattern: `useCountUp` returns `target` until the component is mounted *and* in view, then animates from 0 → target (or from target with a `useEffect`-gated animation). Simplest robust version:
  - `const [value, setValue] = useState(target)` (SSR shows target),
  - on first in-view, set to 0 and animate up.
- Respect `prefers-reduced-motion`: skip the animation entirely (show target statically).

**Acceptance:** `curl https://localhost:3000 | grep "bar"` (or view-source) shows `6,900 bar`, not `0 bar`; animation still plays on scroll in a normal browser.

## Task 2.3 — Move hardcoded stats into settings

**Files:** `src/app/[locale]/page.tsx`, `src/app/admin/settings/*` (settings infra already exists)

`target={28}` (업력) and `target={6900}` (bar) are hardcoded in JSX. 업력 also silently goes stale every January.

- Add `foundedYear` (compute years as `currentYear - foundedYear`) and `maxPressureBar` to site settings with admin fields; read them in `HomePage`. Partner count already derives from `manufacturers` — keep that.
- Seed defaults matching current values (founded ≈ 1998 given "28+", pressure 6900).

**Acceptance:** changing the value in `/admin/settings` changes the homepage; no hardcoded stat numbers remain in `page.tsx`.

## Task 2.4 — Translate the "Overseas Partners" heading

**Files:** `src/app/[locale]/page.tsx`, `messages/ko.json`, `messages/en.json`

The heading is a hardcoded English string inside the Korean page. Add `partners.sectionTitle` (ko: `해외 파트너사`, en: `Overseas Partners`) and use `getTranslations`. Keep both message files in parity.

## Task 2.5 — Add a branded 404 page

**Files:** new `src/app/[locale]/not-found.tsx`, `messages/*.json`

Currently missing → default Next 404. Build a minimal page using existing tokens: big `404` in mono font, one-line message, two links (홈으로 / 제품 검색). Bilingual strings. Reuse header/footer via the locale layout (it wraps `not-found` automatically).

## Task 2.6 — Footer legal/link hygiene (prep for Workstream 06)

**Files:** `src/components/marketing/site-footer.tsx`, `messages/*.json`

- Add a footer slot for a `개인정보처리방침` link pointing to `/privacy` (page itself is built in Workstream 06 — link can land on a stub page created here with a "준비 중" placeholder, or gate this task to after 06 if preferred; state which you did).
- Make phone (`tel:032-623-5015`) and email (`mailto:`) clickable if they aren't already.

## Verification for the whole workstream

```
npm run lint && npm run build
```
Then manually check `/`, `/en`, `/nonexistent-url`, and view-source of `/` for the stats.
