# HYDROFAST website — architecture

How this codebase is put together and why. Written against the tree as it stands
(Next.js 16.2.10 / React 19.2.4), not against an earlier plan — if the code and
this document disagree, the code wins.

For task-level TODOs see [TODO.md](TODO.md). For the audit that drove most of the
recent work see [docs/improvement-plan/](docs/improvement-plan/). For agent-facing
context rules see [AGENTS.md](AGENTS.md).

---

## 1. What this is

A bilingual (KO/EN) corporate site for HYDROFAST (주식회사 하이드로훼스트), an Incheon
hydraulic-equipment distributor and integrator, plus a bespoke admin CMS that the
company runs itself. One Next.js App Router project serves both.

The public site is marketing: five headline business areas, a ~613-product catalog
sourced from seven manufacturers' PDF catalogs, case studies, partner brands,
certifications, company history. The admin at `/admin` is full CRUD over all of it.

Two things distinguish it from a generic Next.js + Supabase build, and both explain
most of the design decisions below:

- **The catalog is large and its data came out of PDFs.** 613 products with
  per-category spec schemas, and product photography that had to be machine-cropped
  out of scanned catalogs and then human-reviewed. That's why there's a Python
  pipeline in [scripts/](scripts/) that has nothing to do with the running app.
- **Korean is the source of truth, and Postgres has no Korean stemmer.** That rules
  out `tsvector` full-text search and drives the trigram approach in
  [src/lib/search.ts](src/lib/search.ts).

---

## 2. Stack

| Layer | Choice | Notes |
|---|---|---|
| Framework | Next.js 16.2.10, App Router | Middleware file is `src/proxy.ts` — Next 16 renamed it |
| UI | React 19.2.4, Tailwind CSS v4 | Tokens in [src/app/globals.css](src/app/globals.css), no config file |
| i18n | next-intl 4.13 | `ko` default (unprefixed), `en` under `/en` |
| DB | Supabase Postgres via Drizzle ORM 0.45 + postgres.js | Transaction pooler |
| Auth | Supabase Auth (`@supabase/ssr`) | Admin only; public site is anonymous |
| Storage | Supabase Storage, 5 public buckets | Product/case-study/client-logo/partner-logo/site-media |
| Motion | GSAP 3.15 (+ ScrollTrigger, SplitText), Lenis, framer-motion | Central module: [src/lib/motion.ts](src/lib/motion.ts) |
| Font | Pretendard variable, self-hosted from `node_modules` | Via `next/font/local` |
| Hosting | Vercel | Supabase is in `ap-southeast-1` |

**Two dependencies are used in source but not declared in
[package.json](package.json)** — `sharp` (resolves transitively through `next`) and
`zod` (through `eslint-config-next` → `eslint-plugin-react-hooks`, i.e. a *dev*
dependency). Builds work because Vercel installs devDependencies and bundles what it
finds, but both are one upstream version bump away from breaking. `sharp` is imported
by [src/lib/image-upload.ts](src/lib/image-upload.ts) and `zod` by
[src/lib/spec-schema.ts](src/lib/spec-schema.ts). Adding them as explicit
dependencies is a safe, unglamorous fix.

`resend` is declared and entirely unused — the contact form it served was removed on
2026-08-05 (see [TODO.md](TODO.md)); `/contact` is now phone/email plus a guide. It
can be dropped.

---

## 3. Route map

One Next app, two independent trees, each with **its own root layout**:

```
src/app/
├── [locale]/          public marketing site — next-intl, Pretendard, motion system
│   ├── page.tsx                       /            home
│   ├── about/                         /about
│   ├── business/                      /business
│   │   └── [areaSlug]/                            5 headline areas
│   │       └── [projectSlug]/                     custom projects
│   ├── products/                      /products   search + filter + paging
│   │   └── [slug]/                                spec-table detail page
│   ├── partners/[slug]/               manufacturer brand pages
│   ├── affiliates/[slug]/             동신소재 / EF하이드로
│   ├── cases/                         case-study collage
│   ├── contact/  privacy/             static-ish
│   ├── [...rest]/                     catch-all → notFound()
│   ├── opengraph-image.tsx            generated OG artwork
│   └── layout.tsx, error.tsx, not-found.tsx
├── admin/             CMS — Korean-only chrome, no next-intl, force-dynamic
│   ├── login/                         Supabase Auth sign-in
│   ├── products/ categories/ manufacturers/ business-areas/
│   ├── case-studies/ client-logos/ certifications/ history/
│   ├── affiliates/[id]/sections/      nested content sections
│   ├── settings/                      site_settings key/value editor
│   └── api/upload/route.ts            the one REST endpoint in the project
├── sitemap.ts  robots.ts  global-error.tsx
```

The split is deliberate. `/admin` sits **outside** `[locale]` because there is one
admin, they speak Korean, and running the CMS through locale negotiation would buy
nothing and cost a prefix on every URL. [src/proxy.ts](src/proxy.ts) branches on the
path: `/admin/*` goes to Supabase session handling, everything else to the next-intl
middleware.

Consequence worth knowing: `/admin` has its own `<html>` element and re-declares the
Pretendard font. Changes to site chrome need making twice.

---

## 4. Rendering and caching

Deliberately mixed, page by page:

| Pages | Mode | Why |
|---|---|---|
| `/`, `/about`, `/business`, `/cases`, `/partners` | ISR, `revalidate = 300` | Admin edits are infrequent; ≤5 min staleness is fine |
| `/products`, `/products/[slug]` | `force-dynamic` | Live search reads `searchParams` |
| `/business/[areaSlug]`, `/partners/[slug]`, `/affiliates/*` | `force-dynamic` | Detail pages off DB rows, no static params generated |
| `/admin/**` | `force-dynamic` (set once on the admin layout, cascades) | Session-gated, and it must never run DB queries at build time |

Time-based ISR was chosen over calling `revalidatePath()` from the ~15 admin mutation
files. The reasoning is written out at the top of
[src/app/[locale]/page.tsx](src/app/[locale]/page.tsx#L41-L52): a revalidation call
you forget to add is a bug you find weeks later; a 5-minute clock can't miss a
mutation path.

**The load-bearing detail:** `setRequestLocale(locale)` must be called in both the
`[locale]` layout and every page that wants ISR. Without it next-intl reads the locale
from request headers, which forces dynamic rendering and silently turns `revalidate`
into a no-op. Nothing errors — the page just gets slow.

---

## 5. Data layer

### Client

[src/db/client.ts](src/db/client.ts) exports `db` as a **Proxy** around a lazily
constructed Drizzle instance. Route modules can then be evaluated at build time
(to read segment config) before `DATABASE_URL` exists; the real connection is deferred
until a Server Component actually issues a query.

`prepare: false` is mandatory against Supabase's transaction-mode pooler (pgbouncer
doesn't do prepared statements).

**Do not tune the connection pool.** There's a long comment in that file recording a
measured failure: narrowing to `max: 3` with an `idle_timeout` returned one query's
rows to a *different* caller — `getAllAreas()` came back with 18 rows from a 5-row
table. Idle reaping races queries queued behind a narrow pool. Fix query pile-ups at
the call site instead.

The call-site fix that matters is in [src/lib/areas.ts](src/lib/areas.ts): the site
header renders the business-area nav on every page, so an uncached read fired ~20
identical queries within a second during prerender, all contending for the pooler.
`getAllAreas()` now memoizes the in-flight promise per process with a 5-minute TTL
matching the ISR contract, and deliberately never retains a rejected promise.

### Schema

Drizzle table definitions live one-per-file under
[src/db/schema/](src/db/schema/), composed in
[index.ts](src/db/schema/index.ts) along with all `relations()`.

```
business_areas ──┬── product_categories ──┐
                 │                        ├── products ── product_images
                 ├── manufacturers ───────┘
                 │      └── manufacturer_business_areas  (M:N join)
                 ├── case_studies ── case_study_images
                 └──
affiliates ── affiliate_sections
client_logos   history_events   certifications   site_settings
```

Every content table follows the same bilingual convention: `*_ko` is `notNull`, `*_en`
is nullable and falls back to `ko` in the renderer. Ordering is an explicit
`sort_order` integer everywhere, editable from the admin.

Two tables carry JSONB documents that make the CMS more capable than the column set
suggests:

- **`product_categories.spec_schema`** — an admin-authored `SpecFieldDef[]`. It drives
  the product form's dynamic fields, Zod validation
  ([src/lib/spec-schema.ts](src/lib/spec-schema.ts)), the detail page's spec table, and
  which specs appear as card teasers. A product's `specs` JSONB is keyed against it.
  Spec *fields* are data, but validation of them is real, not cosmetic — the same Zod
  schema runs client-side in react-hook-form and again inside the Server Action.
- **`business_areas.content_json`** — a `ContentSection[]` document (feature / gallery /
  specTable / compare / bullets / certs / brands / figure blocks) authored in
  [block-editor.tsx](src/components/admin/block-editor.tsx) and rendered by
  [business-content.tsx](src/components/marketing/business-content.tsx). This is what
  lets brochure-shaped pages be CMS-managed without over-fitting the SQL schema. The
  block union is defined at the top of
  [src/content/business-areas.ts](src/content/business-areas.ts).

### Migrations — applied by hand, on purpose

[drizzle.config.ts](drizzle.config.ts) is used **only** for `drizzle-kit generate` and
`drizzle-kit studio`. Nothing auto-pushes. The convention is:

1. Edit the schema files.
2. `npm run db:generate` → SQL lands in [drizzle/](drizzle/).
3. Copy it into a new numbered `docs/sql/00X_*.md` with prose explaining the change.
4. Paste and run it in the Supabase SQL Editor.

[docs/sql/](docs/sql/) is therefore the authoritative migration log, not `drizzle/`.
It also carries things Drizzle can't express — the `pg_trgm` GIN index on
`products.search_text` has no first-class builder, so it exists only in
`001_initial_schema.md`, alongside the Storage bucket creation and RLS policies.

`004_product_catalog_seed.sql` is the 613-product bulk load (1.9 MB, split into five
parts because the SQL Editor chokes on the whole thing).

### Search

Korean has no Postgres stemmer, so [src/lib/search.ts](src/lib/search.ts) denormalizes
a `products.search_text` column on every write: bilingual name and description,
manufacturer, category, model number, and the flattened **values** of `specs`
(including select-option labels, so a query for `6900` or a Korean option label
matches). Trigram GIN index does the matching. `search_text` is maintained in the same
Server Action as the write — there is no trigger, so a new write path must remember to
call `buildSearchText`.

---

## 6. Auth and access control

**Access control is the middleware, not RLS.** This is the single most important
security fact about this codebase.

[src/lib/supabase/middleware.ts](src/lib/supabase/middleware.ts) runs on every
`/admin/*` request: it refreshes the Supabase session cookie, then redirects to
`/admin/login` unless there's a user whose email equals `ADMIN_EMAIL`.

RLS policies exist in `001_initial_schema.md`, but Drizzle talks to Postgres directly
over the pooler as the database role — it goes around PostgREST and therefore around
RLS entirely. So the RLS policies protect the PostgREST surface, and the middleware
protects the app. Anything that bypasses the middleware bypasses authorization.

Three Supabase clients, each with a specific job:

| File | Role | Used for |
|---|---|---|
| [supabase/client.ts](src/lib/supabase/client.ts) | Browser, publishable key | Sign-in on `/admin/login`, nothing else |
| [supabase/server.ts](src/lib/supabase/server.ts) | Server, request cookies | Reading the logged-in session |
| [supabase/service-role.ts](src/lib/supabase/service-role.ts) | Service role, bypasses RLS | Storage uploads/deletes only |

The service-role client is split into its own file precisely because it must not
import `next/headers` — that's what lets standalone `tsx` scripts reuse the exact same
upload path as the admin.

`/admin/api/upload/route.ts` is the only route handler in the project. It is protected
solely by the middleware matcher, and it allowlists buckets (`site-media`,
`case-study-images`) and checks the MIME type. One thing to note: if `ADMIN_EMAIL` is
unset, `isAuthorized` degrades to "any authenticated user". That's tolerable only
because signups are disabled in the Supabase dashboard — it's a silent failure mode,
not a designed fallback.

---

## 7. Images

### Upload path

[src/lib/image-upload.ts](src/lib/image-upload.ts) is the one implementation:
`sharp` resizes each upload to three widths — `thumb` 400 / `card` 800 / `detail` 1600 —
encodes WebP at quality 82, and writes them to `<uuid>/<variant>.webp` in the target
bucket. DB rows store the *card* path; the variant is swapped by string manipulation.

The module deliberately avoids `import "server-only"` so scripts can call it.
[src/lib/images.ts](src/lib/images.ts) is a five-line re-export that *adds* the
server-only guard for app code, and [src/lib/image-url.ts](src/lib/image-url.ts) holds
the client-safe URL helpers so admin form components can render previews without
dragging `sharp` into the client bundle. That three-file split looks redundant and
isn't.

### Serving

`next/image` is configured `unoptimized: true` in [next.config.ts](next.config.ts).
Because we already resize at upload time, the on-demand optimizer would add nothing
while counting against Vercel Hobby's 1,000-images/month cap — a real risk with a
613-product catalog. Do not re-enable it.

`contentImageUrl()` resolves the three shapes an image reference can take in
business-area content: an absolute `/content/…` path (brochure assets committed under
[public/content/](public/content/)), an `http…` URL, or a bare Supabase Storage path
from an admin upload.

---

## 8. Internationalization

`ko` is the default locale and is **not** prefixed; `en` lives under `/en`
(`localePrefix: "as-needed"` in [src/i18n/routing.ts](src/i18n/routing.ts)). That
asymmetry leaks into SEO, so [src/lib/seo.ts](src/lib/seo.ts) centralizes it:
`localePath()`, `localeUrl()`, `alternatesFor()` and `pageMetadata()` all encode the
no-`/ko`-prefix rule once.

Two Metadata API sharp edges are handled there and are easy to reintroduce:
a page defining `openGraph` **replaces** the layout's block wholesale (so `siteName`,
`type`, `locale` must be repeated), and it also loses the `opengraph-image.tsx` file
convention (so `pageMetadata` points images back at `/opengraph-image` explicitly).

UI strings live in [messages/ko.json](messages/ko.json) and
[messages/en.json](messages/en.json) — 15 namespaces each, kept in parity. Content
strings live in the DB with `*_ko` / `*_en` columns. Company facts live in
[src/lib/company.ts](src/lib/company.ts), single-sourced so the footer, About page and
JSON-LD can't drift.

---

## 9. Three sources of content — know which one you're editing

This trips people up, so it's worth stating plainly:

1. **Database (via `/admin`)** — products, categories, manufacturers, case studies,
   logos, certifications, history, affiliates, site settings, and the business-area
   `content_json` documents. This is where the company edits.
2. **[src/content/business-areas.ts](src/content/business-areas.ts)** (~60 KB) — the
   original brochure-derived content for the five headline areas, with images under
   `public/content/**`. It seeded the DB via `npm run db:seed-content`; the type
   definitions at the top of the file are still the live contract for
   `content_json`. **Never read this file whole** — grep for the slug, then read with
   offset/limit.
3. **[src/content/custom-projects.ts](src/content/custom-projects.ts)** (~20 KB) — the
   `/business/[areaSlug]/[projectSlug]` pages, still code-resident.
   [src/content/videos.json](src/content/videos.json) is the video slot manifest,
   written by the encode script.

---

## 10. Motion system

Everything animation-related imports GSAP from
[src/lib/motion.ts](src/lib/motion.ts) so plugin registration happens exactly once.
The module is `"use client"` — server components must not import from it.

There's an owner-facing kill switch, `NEXT_PUBLIC_MOTION_LEVEL`:

- `full` — Lenis smooth scroll + scroll-scrubbed ScrollTrigger choreography
- `lite` — native scroll, cheap time-based entrances only
- `off` — fully static, no JS-driven motion

The level is also mirrored onto `<html data-motion>` in the locale layout (recomputed
there, since the client module can't be imported server-side) so CSS-driven motion like
the logo marquee can go static too. `prefers-reduced-motion` is honored on top of all
three, including mid-session changes.

Two hard-won rules are documented in that file and worth repeating:

- **ScrollTrigger `pin` must be created from `useIsomorphicLayoutEffect`, never
  `useEffect`.** Pinning wraps the trigger in a pin-spacer div; React runs layout-effect
  cleanups *before* removing DOM nodes but passive cleanups *after*, so a pin created in
  `useEffect` makes React call `removeChild` on a node GSAP re-parented → `NotFoundError`.
- **`useScrollTriggerCleanup` sweeps strays, it does not `killAll()`.** Parent effects
  run after child effects, so a blanket kill on navigation would destroy the triggers the
  incoming page just created.

The showpiece is [fluid-text.tsx](src/components/motion/fluid-text.tsx) — "oil-fill"
typography where headings fill with hydraulic-amber fluid. The heading stays real HTML
text at all times (it does the layout, stays selectable, renders correctly with no JS);
an SVG overlay measured against the rendered line boxes provides the effect. That's why
there's no CLS and no JS requirement for a correct page.

[video-loop.tsx](src/components/media/video-loop.tsx) respects the `Save-Data` header
and assumes save-data on the server snapshot until the client proves otherwise.

---

## 11. Offline pipelines

Nothing here runs in production. All of it exists because the source data was PDFs.

**Seeding** (`tsx` scripts, run once against the live DB):

```
npm run db:seed            # business areas, affiliates, brands, category spec schemas
npm run db:seed-content    # business_areas.content_json from src/content/business-areas.ts
npm run db:seed-logos      # partner brand logos
npm run db:migrate-legacy  # legacy static site's case studies + client logos (reads legacy-content/, gitignored)
npm run db:merge-case-studies  # one-time dedupe into galleries (ran 2026-08-10)
```

**Product images** — a five-stage pipeline, each stage's docstring explaining what it
can and can't do:

```
npm run images:extract        # PyMuPDF crops photos out of the catalog PDFs
npm run images:fetch-web      # scrapes manufacturer sites where they publish an API
npm run images:review         # builds a contact-sheet review.html
npm run images:apply-review   # applies the human decisions
npm run images:upload         # ships survivors through the same uploadImageVariants path as /admin
```

The interesting part is stage 1's `score_candidate()`: catalogs embed photos as ordinary
rasters, so PyMuPDF hands over each image *and* the rectangle it occupies. The hard
problem is picking the right one on a page carrying several. It drops boilerplate (any
raster repeated across many pages, which kills logos/headers in one shot), ranks by
proximity to an occurrence of the product's model number, then by size/squareness/
inkiness, and penalizes candidates already claimed by a higher-scoring product.

Nothing is trusted blindly — every choice lands in the manifest with its score and
runners-up, and `review.html` puts a human in the loop before upload. Current state:
602 of 613 products have images; Water Hydraulics (a scan) and GEMELS (application
photography that outscores real product renders) are the weak sets. See
[TODO.md](TODO.md).

**Video** — `node scripts/encode-videos.mjs` (needs ffmpeg) CRF-steps each clip down to
≤4 MB desktop / ≤1.5 MB mobile, generates a WebP poster, and rewrites
`src/content/videos.json`. Full docs in [docs/VIDEO-PIPELINE.md](docs/VIDEO-PIPELINE.md).
No footage has shipped yet — every slot currently renders its intentional dark-gradient
fallback.

Build artefacts under `assets-src/product-images/` are gitignored but exist on disk
after a run and are enormous. What *is* committed is `review-decisions.json` (the human
review, not regenerable) and `image-provenance.tsv` (46 KB, one greppable line per
product recording where its live image came from).

---

## 12. Environment

From [.env.example](.env.example):

| Variable | Required | Purpose |
|---|---|---|
| `NEXT_PUBLIC_SUPABASE_URL` | yes | Also builds every public Storage URL |
| `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_KEY` | yes | Browser + server auth clients |
| `SUPABASE_SECRET_KEY` | yes | Service-role client, Storage writes |
| `DATABASE_URL` | yes | **Transaction pooler** URI, not the direct connection |
| `ADMIN_EMAIL` | yes in prod | The single admin's email; unset = any authenticated user |
| `NEXT_PUBLIC_SITE_URL` | yes in prod | `metadataBase`, sitemap, robots, JSON-LD |
| `NEXT_PUBLIC_MOTION_LEVEL` | no | `full` \| `lite` \| `off` |
| `GOOGLE_SITE_VERIFICATION` / `NAVER_SITE_VERIFICATION` | no | Search Console / Naver Search Advisor |

`RESEND_API_KEY` and `NOTIFY_FROM` are no longer read — remove them from Vercel if set.

---

## 13. Gotchas, in one place

Things that will cost an afternoon if you don't know them:

1. **Middleware is `src/proxy.ts`.** Next 16 renamed it. Several code comments still
   say "see middleware.ts"; they mean `proxy.ts`.
2. **Don't tune the postgres.js pool.** Narrowing it returns rows to the wrong caller.
   See [src/db/client.ts](src/db/client.ts).
3. **`setRequestLocale` is required for ISR.** Omit it and `revalidate` becomes a
   silent no-op.
4. **RLS is not your access control.** Drizzle bypasses PostgREST. The middleware is
   the gate.
5. **Never re-enable `next/image` optimization.** Vercel Hobby caps at 1,000 images/month.
6. **Migrations are applied by hand** in the Supabase SQL Editor from `docs/sql/`.
   `drizzle-kit` only generates.
7. **`search_text` has no trigger.** Any new product write path must call
   `buildSearchText`.
8. **A page that defines `openGraph` replaces the layout's block entirely** and loses
   the file-convention OG image. Use `pageMetadata()`.
9. **Pin ScrollTriggers from `useIsomorphicLayoutEffect`**, never `useEffect`.
10. **Context hogs.** `src/content/business-areas.ts` (60 KB),
    `docs/improvement-plan/` (140 KB), the catalog extracts under
    `assets-src/catalogs/extracted/`, and the image build artefacts. Grep and slice;
    don't read whole. See [AGENTS.md](AGENTS.md).

---

## 14. Known soft spots

Not bugs, but the places where the design is currently thinnest:

- **`sharp` and `zod` are undeclared dependencies** (§2). Cheapest real fix in the repo.
- **`case_study_images` writes are wrapped in try/catch** that swallows failures with a
  `console.warn`, a leftover from when migration 003 was pending. Migration 003 has been
  applied (2026-08-10), so the tolerance now just hides genuine errors — see
  [src/app/admin/case-studies/actions.ts](src/app/admin/case-studies/actions.ts).
- **`dedupeCaseStudies()` on the home page** is a workaround for the pre-gallery data
  model and is now redundant. [TODO.md](TODO.md) has it queued for removal.
- **Storage cleanup is best-effort.** A retry after a Storage timeout can leave
  unreferenced blobs in a bucket; nothing reconciles them.
- **The `inquiries` table still exists** in Supabase with historical submissions, and
  nothing writes to it. It needs exporting then dropping.
- **`/admin` duplicates site chrome** (own `<html>`, own font declaration) as the price
  of living outside `[locale]`.

---

## 15. Where to look

| Question | File |
|---|---|
| How does a request get routed? | [src/proxy.ts](src/proxy.ts) |
| What's in the database? | [src/db/schema/index.ts](src/db/schema/index.ts) |
| What SQL has been applied? | [docs/sql/](docs/sql/) |
| How is the admin gated? | [src/lib/supabase/middleware.ts](src/lib/supabase/middleware.ts) |
| How do images get uploaded? | [src/lib/image-upload.ts](src/lib/image-upload.ts) |
| How do product specs work? | [src/db/schema/product-categories.ts](src/db/schema/product-categories.ts), [src/lib/spec-schema.ts](src/lib/spec-schema.ts) |
| How does search work? | [src/lib/search.ts](src/lib/search.ts) |
| Why is this page slow / stale? | [src/lib/areas.ts](src/lib/areas.ts), [src/app/[locale]/page.tsx](src/app/[locale]/page.tsx) |
| What are the design tokens? | [src/app/globals.css](src/app/globals.css) |
| How does the motion system work? | [src/lib/motion.ts](src/lib/motion.ts) |
| Where did a product photo come from? | `assets-src/product-images/image-provenance.tsv` (grep it) |
| What's left to do? | [TODO.md](TODO.md) |
