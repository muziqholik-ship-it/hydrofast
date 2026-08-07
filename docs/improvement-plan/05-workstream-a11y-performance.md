# 05 · Workstream: Accessibility & Performance

**Goal:** WCAG-solid keyboard/screen-reader behavior and a lighter, layout-stable homepage — without re-enabling the (deliberately disabled) Next image optimizer.

## Task 5.1 — Business-areas dropdown a11y

**Files:** `src/components/marketing/site-header.tsx`

Current: hover open/close + click toggle, no ARIA, no Escape. Fix:

- Button gets `aria-expanded={bizOpen}`, `aria-haspopup="menu"`, `aria-controls` on the panel.
- `Escape` closes and returns focus to the button; clicking outside closes (add a `pointerdown` outside listener or `onBlur` within a focus-trap-lite).
- Keep hover-open on desktop, but do **not** close on `mouseleave` while focus is inside the panel (check `document.activeElement`/`focus-within`).
- Panel links: standard `Link`s, visible focus ring via `--color-steel-light`; arrow-key navigation is optional (nice-to-have, note if skipped).
- Replace the text caret `▾` with an inline SVG marked `aria-hidden="true"`.

Same treatment for the mobile menu button (`aria-expanded`, `aria-controls`; verify body-scroll lock while open — add if missing).

## Task 5.2 — Skip link + landmarks

**Files:** `src/app/[locale]/layout.tsx`

- Add a visually-hidden-until-focused "본문 바로가기 / Skip to content" link as the first element in `<body>`, target `<main id="main">`.
- Confirm exactly one `<h1>` per page (hero on `/`; check `/products`, `/cases` etc. — `SectionHeading` may emit `<h2>`s only, so add page `<h1>`s where missing, visually styled as the existing headings).

## Task 5.3 — Language switcher semantics

**Files:** `src/components/marketing/site-header.tsx`

The "EN" control should expose what it does: `aria-label` ("Switch to English" / "한국어로 전환"), and `hrefLang`/`lang` attributes on rendered links if it's link-based. Show the *target* language label (on ko pages show "EN", on en pages show "KO") — verify current behavior does this and it's not a raw toggle with unclear state.

## Task 5.4 — Image loading & CLS

**Files:** `src/components/marketing/logo-marquee.tsx`, `case-study-card.tsx`, `product-card.tsx`, `partner-card.tsx`, plus any other marketing `<img>`

Keeping raw `<img>` (per `next.config.ts` decision):

- Add `loading="lazy"` + `decoding="async"` to every below-the-fold `<img>` (all marquee logos, case/product cards). Hero image (Workstream 04) stays eager with `fetchpriority="high"`.
- Add explicit `width`/`height` (or keep the existing `aspect-ratio` container for case cards — that already prevents CLS there; marquee items have fixed `h-12 w-32` boxes, so add `width`/`height` attributes matching the resized upload dimensions from `src/lib/images.ts` — read that file to get the real widths).
- Marquee duplication (2× DOM) is required for the CSS loop — fine, but mark the **second** copy's wrapper `aria-hidden="true"` so screen readers don't hear 36 company names twice.
- Add `onError` fallback or conditional render so a missing logo path never renders a broken-image icon (currently `src={... ?? undefined}` can yield `<img>` with no src).

## Task 5.5 — Contain `dangerouslySetInnerHTML` in the hero

**Files:** `src/components/marketing/home-hero.tsx`, `messages/*.json`

The `<h1>` injects HTML from translations (used for a `<br/>`). Replace with a safe pattern: store the title as two strings (`titleLine1`, `titleLine2`) or split on `\n` and render `<br />` in JSX. Remove `dangerouslySetInnerHTML`. Update both message files.

## Task 5.6 — Color-contrast check

**Files:** `src/app/globals.css` (only if failures found)

Verify with a contrast tool: `--color-ink-soft` (#4b5158) on `--color-surface-alt` (#f4f5f7); safety-orange (#eb3a03) text on white at small sizes; white text over case-card gradient overlays; dark-mode variants. Fix only failing pairs by darkening the token, and note before/after values in the commit message.

## Task 5.7 — Marketing-page caching

**Files:** `src/app/[locale]/page.tsx`, `about`, `cases`, `partners` pages

Homepage runs 4 DB queries per request. Add `export const revalidate = 300` (5 min) to marketing pages that don't read `searchParams`. Leave `/products` `force-dynamic` (it powers live search). Confirm admin mutations still surface within the revalidate window is acceptable; if instant updates are wanted, add `revalidatePath("/")` calls in the relevant admin actions instead — choose one approach and document it in the code.

## Verification

- Keyboard-only walkthrough: Tab through header → dropdown → hero CTAs → cards → footer on `/` and `/en`.
- Lighthouse (mobile) on `/`: Accessibility ≥ 95, no CLS from logos/cards, below-fold images lazy.
- `npm run lint && npm run build`.
