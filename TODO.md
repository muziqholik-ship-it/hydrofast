# TODO

## Case studies data-model fix (from docs/improvement-plan/02-workstream-quick-wins.md, Task 2.1)

> **Data-model fix (right solution):** add a `caseStudyImages` child table (or `imagePaths: jsonb` array on `caseStudies`) so one project holds many photos; update `admin/case-studies` forms and `/cases` page to render one card per project with an image count badge or first image. If this is too large for this session, create the dedupe only and copy this item verbatim into a `TODO.md` at repo root.

Status: the code-level dedupe is in place in `src/app/[locale]/page.tsx` (`dedupeCaseStudies`); this data-model migration is still outstanding.

## Search-engine registration checklist (from docs/improvement-plan/03-workstream-seo.md, Task 3.6 — human tasks, not code)

- [ ] Register the site at **Google Search Console** and **Naver Search Advisor** (searchadvisor.naver.com). Copy each service's HTML-tag verification value into the `GOOGLE_SITE_VERIFICATION` / `NAVER_SITE_VERIFICATION` env vars (see `.env.example`) on Vercel, then redeploy.
- [ ] Submit `https://www.hydrofast.co.kr/sitemap.xml` to both Google Search Console and Naver Search Advisor.
- [ ] Create a **Naver 스마트플레이스** listing and a **Google Business Profile** with the Bupyeong address (인천광역시 부평구 부평대로 283, 우림라이온스밸리 C동 610호).
- [ ] After deploy, validate link previews with the Kakao link debugger (https://developers.kakao.com/tool/debugger/sharing) and structured data with the Google Rich Results test (https://search.google.com/test/rich-results) — check `/`, `/en`, one product detail page, and one `/business/[areaSlug]` page.
