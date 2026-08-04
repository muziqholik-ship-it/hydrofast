# TODO

## Privacy policy — owner must fill in before launch (Task 6.1, workstream 06)

- [ ] Replace the `{{PRIVACY_OFFICER_NAME}}` and `{{PRIVACY_OFFICER_TITLE}}` placeholders in `src/app/[locale]/privacy/policy-content.ts` (both the ko and en blocks) with the actual 개인정보 보호책임자. **Do not launch with placeholders visible.**
- [ ] Have the company/legal review the full `/privacy` text — it is a compliant-structured draft, not legal advice. Confirm the 3-year retention period and the 시행일 (currently 2026-08-04) match company policy.

## Inquiry email notification setup (Task 6.5, workstream 06)

- [ ] Create a Resend account (resend.com), add and verify the `hydrofast.co.kr` domain (Domains → Add Domain → add the DKIM/SPF DNS records at the registrar).
- [ ] Create an API key and set `RESEND_API_KEY` and `NOTIFY_FROM` (e.g. `HYDROFAST 홈페이지 <no-reply@hydrofast.co.kr>`) on Vercel, then redeploy. Until then, inquiries still land in `/admin/inquiries` and the server logs a warning instead of emailing.
- [ ] Future: confirmation email to the submitter (deliberately skipped in this pass to avoid sender-reputation issues on an unwarmed domain).

## Contact-form spam — future hardening (Task 6.3, workstream 06)

- [ ] Current rate limit is per-email (max 3 inquiries / 10 min, counted from the `inquiries` table). IP-based limiting would need middleware + a store like Upstash Redis — revisit if spam volume grows.

## Case-study data model (Task 6.6, workstream 06) — code shipped, DB steps pending

- [x] `case_study_images` child table + admin multi-upload + `+N` card badge (shipped; see `docs/sql/003_compliance_and_case_study_images.md`).
- [ ] Apply `docs/sql/003_compliance_and_case_study_images.md` in the Supabase SQL Editor.
- [ ] Then run `npm run db:merge-case-studies` once to merge duplicate one-photo-per-row projects into single rows with galleries.
- [ ] After verifying `/cases`, the `dedupeCaseStudies()` workaround in `src/app/[locale]/page.tsx` can be removed (harmless to keep).

## Video hero (workstream 09, Session D)

- [ ] Drop stock/own clips into `assets-src/video/{lifting,torque,bolting,robotics,cta}/` and run `node scripts/encode-videos.mjs` — see `docs/VIDEO-PIPELINE.md` for the shopping list and licensing caveats. Until then the hero shows its intentional dark-gradient fallback.

## Search-engine registration checklist (from docs/improvement-plan/03-workstream-seo.md, Task 3.6 — human tasks, not code)

- [ ] Register the site at **Google Search Console** and **Naver Search Advisor** (searchadvisor.naver.com). Copy each service's HTML-tag verification value into the `GOOGLE_SITE_VERIFICATION` / `NAVER_SITE_VERIFICATION` env vars (see `.env.example`) on Vercel, then redeploy.
- [ ] Submit `https://www.hydrofast.co.kr/sitemap.xml` to both Google Search Console and Naver Search Advisor.
- [ ] Create a **Naver 스마트플레이스** listing and a **Google Business Profile** with the Bupyeong address (인천광역시 부평구 부평대로 283, 우림라이온스밸리 C동 610호).
- [ ] After deploy, validate link previews with the Kakao link debugger (https://developers.kakao.com/tool/debugger/sharing) and structured data with the Google Rich Results test (https://search.google.com/test/rich-results) — check `/`, `/en`, one product detail page, and one `/business/[areaSlug]` page.
