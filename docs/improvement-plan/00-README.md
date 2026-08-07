# HYDROFAST Website Improvement Plan

**Target:** https://hydrofast.co.kr · repo `hydrofast9411/homepage`
**Stack (verified):** Next.js 16.2 (App Router, `[locale]` routing via next-intl, ko default / en), React 19, Tailwind CSS v4 (tokens in `src/app/globals.css`), Drizzle ORM + Supabase (Postgres + Storage), framer-motion, Pretendard, custom admin CMS at `/admin`.
**Audit date:** 2026-08-04 (live site + full source review)

## How this plan was produced

A "website designer agent team" review, with one lead and five specialist passes over the same codebase:

| Agent | Scope | Report |
|---|---|---|
| Design Director (lead) | Synthesis, priorities, visual direction | this file + `01` |
| SEO subagent | Metadata, hreflang, structured data, sitemap | `03` |
| UX/Visual subagent | Homepage narrative, hero, trust signals | `04` |
| A11y + Performance subagent | Keyboard/ARIA, images, motion | `05` |
| Content/Data subagent | CMS data quality, duplicate cards, hardcoded stats | `06` |
| Compliance/Forms subagent | Contact form, PIPA consent, spam, notifications | `06` |

Consolidated findings are in `01-audit-findings.md`. Work is split into 5 workstream files, each written as a self-contained brief for Claude Code.

## How to use with Claude Code

1. Copy this folder into the repo root (e.g. `docs/improvement-plan/`).
2. Run workstreams in order — each is one session-sized chunk:

```
claude "Read docs/improvement-plan/00-README.md and docs/improvement-plan/02-workstream-quick-wins.md, then implement every task in 02. Follow the acceptance criteria exactly. Run `npm run lint` and `npm run build` before finishing."
```

3. Repeat for `03` → `06`. Each file lists its own tasks, exact file paths, and acceptance criteria.
4. `06` includes a schema migration (privacy consent column) — review the generated Drizzle migration before applying.

## Execution order & rationale

| Order | File | Theme | Effort | Why this order |
|---|---|---|---|---|
| 1 | `02-workstream-quick-wins.md` | P0 fixes visible today (0-stats bug, duplicate cards, footer/legal gaps) | ~½ day | Highest visible impact, zero design risk |
| 2 | `03-workstream-seo.md` | Metadata, hreflang, OG, JSON-LD, sitemap | ~1 day | B2B lead gen depends on search; purely additive |
| 3 | `06-workstream-content-data-compliance.md` | Contact form compliance (PIPA), email notification, CMS data hygiene | ~1 day | Legal exposure; touches DB schema |
| 4 | `05-workstream-a11y-performance.md` | Keyboard nav, image loading, CLS | ~1 day | Quality floor before visual redesign |
| 5 | `04-workstream-design-ux.md` | Hero, trust/certification strip, homepage narrative | 1–2 days | Biggest change, do last on a clean base |

## Global constraints (apply to every workstream)

- **Do not break `/admin`.** All changes are marketing-site scoped unless a task says otherwise.
- **Bilingual parity:** any new user-facing string goes into both `messages/ko.json` and `messages/en.json`. ko is the source of truth; en must never fall back to raw keys.
- **Design tokens only:** use the CSS variables in `globals.css` (`--color-steel`, `--color-safety-orange`, `--radius-card`, etc.). No new hardcoded hex values outside the token block.
- **Keep the existing aesthetic intent** (documented in `globals.css`): "engineered spec-sheet", tight radii (4–8px), restrained palette. Improvements sharpen this direction; they do not replace it with a generic SaaS look.
- **Images:** `next/image` is intentionally `unoptimized` (Vercel Hobby cap — see comment in `next.config.ts`). Do not re-enable the optimizer; improve `<img>` usage instead (lazy, dimensions, `sizes` where applicable).
- **Verification:** `npm run lint` + `npm run build` must pass after every workstream. Test both `/` (ko) and `/en` routes.
