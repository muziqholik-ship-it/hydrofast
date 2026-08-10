# TODO

## Privacy policy — owner must fill in before launch (Task 6.1, workstream 06)

- [x] Replace the `{{PRIVACY_OFFICER_NAME}}` and `{{PRIVACY_OFFICER_TITLE}}` placeholders in `src/app/[locale]/privacy/policy-content.ts` (both the ko and en blocks) with the actual 개인정보 보호책임자. **Do not launch with placeholders visible.**
- [x] Have the company/legal review the full `/privacy` text — it is a compliant-structured draft, not legal advice. Confirm the 3-year retention period and the 시행일 (currently 2026-08-04) match company policy.

## Contact page simplified to email/phone (2026-08-05)

- The inquiry form, email notification pipeline (Resend), spam hardening, and `/admin/inquiries` were removed — `/contact` now shows phone/email plus an inquiry-preparation guide. `RESEND_API_KEY` / `NOTIFY_FROM` env vars are no longer read (remove from Vercel if set).
- [ ] The `inquiries` table still exists in Supabase (existing submissions preserved, nothing writes to it anymore). Export anything needed, then drop it in the Supabase SQL Editor when convenient: `drop table if exists inquiries;`
- [ ] Have legal re-check `/privacy` sections 1 and 4 — collection method now reads "email/phone inquiries" instead of the website form, but the overseas-transfer wording (Vercel/Supabase) was written for form submissions stored in Supabase.

## Case-study data model (Task 6.6, workstream 06) — code shipped, DB steps pending

- [x] `case_study_images` child table + admin multi-upload + `+N` card badge (shipped; see `docs/sql/003_compliance_and_case_study_images.md`).
- [x] Apply `docs/sql/003_compliance_and_case_study_images.md` in the Supabase SQL Editor.
- [x] Then run `npm run db:merge-case-studies` once to merge duplicate one-photo-per-row projects into single rows with galleries. (Ran 2026-08-10: 6 projects merged, 7 duplicate rows removed, 17 `case_study_images` rows across 10 projects.)
- [ ] After verifying `/cases`, the `dedupeCaseStudies()` workaround in `src/app/[locale]/page.tsx` can be removed (harmless to keep).

## Product images (shipped 2026-08-10) — 602 of 613 live, quality gaps remain

Pipeline is `npm run images:extract` → `images:fetch-web` → `images:review` → `images:apply-review` → `images:upload`; each script's docstring explains what it does and what it cannot do. `assets-src/product-images/image-provenance.tsv` records where every live image came from.

- [ ] **11 products still have no image** (they had no usable candidate on any source page): `euroswitch-570`, `euroswitch-i930-i935`, `euroswitch-imk`, `euroswitch-imk2`, `euroswitch-p005`, `euroswitch-p006`, `oleoweb-efd25a`, `oleoweb-efd25b`, `oleoweb-valve-bodies`, `water-hydraulics-136-bspp-filter`, `water-hydraulics-136hp-bspp-filter`. They render the "No Image" placeholder.
- [ ] **Water Hydraulics is the weak set** — its catalog is a scan, so extraction picks up flow curves, CAD drawings and ordering-code tables as readily as product shots. 15 of 78 were corrected in review; the rest are worth another pass. Its public site only covers 11 of our 78 model numbers, so scraping cannot close this.
- [ ] **GEMELS application photography** — the catalog decorates section pages with excavator/oil-rig/timber shots that beat the real product renders on every automatic signal. 64 were corrected by hand in review. gemels.com returns 403 to non-browser clients, so scraping is not an option; ask the supplier for an image pack instead.
- [ ] Re-running the uploader with `FORCE=1` replaces existing images (it deletes the old blobs first). Note that a retry after a storage timeout can leave one or two unreferenced blobs in the bucket — see the comment on `withRetry` in `scripts/upload-product-images.ts`.

## Video homepage (workstream 09, Sessions D–F)

- [ ] Drop stock/own clips into `assets-src/video/{lifting,torque,bolting,robotics,cta}/` (and `area-<slug>/` for the 사업 분야 panels) and run `node scripts/encode-videos.mjs` — see `docs/VIDEO-PIPELINE.md` for the shopping list and licensing caveats. Until then all slots show their intentional dark-gradient fallbacks.
- [ ] **Route A footage:** owner to collect real site footage from HYDROFAST installs (tensioning jobs, robot docking, lifts at 효성/한화오션/해군 etc.) and confirm client-site publication permission for any recognizable facility before a clip ships.
- [ ] **Admin UI:** manage the `site-videos` Supabase Storage bucket + `src/content/videos.json` manifest from `/admin` (upload, assign slot, swap posters) instead of the CLI script.
- [ ] **Paid-clip shortlist (Route C):** real bolting/torque close-ups are scarce in free libraries — shortlist candidates on Artgrid/Envato/Storyblocks/iStock for the `torque` and `bolting` slots.
- [ ] **Coverr credit:** if any Coverr clip ends up shipping, add the footer credit (its license is self-contradictory on attribution — credit to be safe). Currently: no Coverr clips in use.

## Search-engine registration checklist (from docs/improvement-plan/03-workstream-seo.md, Task 3.6 — human tasks, not code)

- [ ] Register the site at **Google Search Console** and **Naver Search Advisor** (searchadvisor.naver.com). Copy each service's HTML-tag verification value into the `GOOGLE_SITE_VERIFICATION` / `NAVER_SITE_VERIFICATION` env vars (see `.env.example`) on Vercel, then redeploy.
- [ ] Submit `https://www.hydrofast.co.kr/sitemap.xml` to both Google Search Console and Naver Search Advisor.
- [ ] Create a **Naver 스마트플레이스** listing and a **Google Business Profile** with the Bupyeong address (인천광역시 부평구 부평대로 283, 우림라이온스밸리 C동 610호).
- [ ] After deploy, validate link previews with the Kakao link debugger (https://developers.kakao.com/tool/debugger/sharing) and structured data with the Google Rich Results test (https://search.google.com/test/rich-results) — check `/`, `/en`, one product detail page, and one `/business/[areaSlug]` page.
