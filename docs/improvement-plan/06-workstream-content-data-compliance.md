# 06 · Workstream: Forms, Compliance & Data Hygiene

**Goal:** make the contact pipeline legally compliant (Korean PIPA), spam-resistant, and impossible to miss a lead from. Includes one DB migration.

> ⚠️ Contains a schema migration. Generate with `npm run db:generate`, review the SQL, and coordinate applying it to the Supabase database.

## Task 6.1 — Privacy policy page (개인정보처리방침)

**Files:** new `src/app/[locale]/privacy/page.tsx`, `messages/*.json`, `src/components/marketing/site-footer.tsx`, `src/app/sitemap.ts`

The site collects name/email/phone/company via `/contact` but publishes no privacy policy — required under PIPA for personal-data collection.

- Create a `/privacy` page with a standard 개인정보처리방침 covering: 수집 항목 (이름, 이메일, 회사명, 연락처, 문의 내용), 수집 목적 (견적/상담 문의 응대), 보유·이용 기간 (e.g. 목적 달성 후 3년 또는 삭제 요청 시), 처리 위탁 (호스팅: Vercel / DB·스토리지: Supabase — 국외 이전 고지 포함), 정보주체의 권리, 개인정보 보호책임자 (name/contact — use placeholders `{{PRIVACY_OFFICER_NAME}}` and flag them in `TODO.md` for the owner to fill; do not invent a person).
- Render as prose from the message files (or a dedicated content component with structured sections); provide an English version on `/en/privacy`.
- Footer: link `개인정보처리방침` (bold per Korean convention). Add `/privacy` to `sitemap.ts`.
- Add a note in the page and `TODO.md`: the final text should be reviewed by the company/legal before launch — this implementation is a compliant-structured draft, not legal advice.

## Task 6.2 — Consent checkbox on the contact form

**Files:** `src/components/marketing/contact-form.tsx`, `src/app/[locale]/contact/actions.ts`, schema `inquiries`

- Add a required checkbox: `[필수] 개인정보 수집 및 이용에 동의합니다` with an inline link to `/privacy` (opens new tab). English equivalent on `/en`.
- Server action must **reject** submissions without consent (never trust client-side `required` alone).
- Migration: add `privacyConsentAt: timestamp` to `inquiries`; store the consent time on insert.

## Task 6.3 — Spam & abuse hardening

**Files:** `src/app/[locale]/contact/actions.ts`, `contact-form.tsx`

- Honeypot: hidden `website` field (CSS-hidden, `tabIndex={-1}`, `autoComplete="off"`); non-empty → return `{success:true}` silently without inserting.
- Length caps server-side: name ≤ 100, email ≤ 254 + format check, company/phone ≤ 100, message ≤ 5,000. Trim + reject over-length with a localized error.
- Time-gate: include a hidden `renderedAt` timestamp (signed or just epoch); reject submissions < 3 s after render.
- Basic rate limit: simplest durable option — count `inquiries` rows from the same email in the last 10 minutes, reject over 3. (No new infra; note the limitation that IP-based limiting would need middleware/upstash and log that as a future item in `TODO.md`.)

## Task 6.4 — Localize server-side form errors

**Files:** `src/app/[locale]/contact/actions.ts`, `contact-form.tsx`, `messages/*.json`

Errors are hardcoded Korean (`"필수 항목을 모두 입력해주세요."`) even on `/en`. Return error **codes** (`missing_fields`, `consent_required`, `too_long`, `rate_limited`) from the action and translate them client-side via `useTranslations("contact.errors")`. Add all codes to both message files.

## Task 6.5 — Email notification for new inquiries

**Files:** `src/app/[locale]/contact/actions.ts`, new `src/lib/notify.ts`, `.env.example`

Leads currently land only in the DB. After successful insert, send a notification email to `hydrofast@hydrofast.co.kr`:

- Use **Resend** (`resend` npm package) behind a `RESEND_API_KEY` env var; if the key is absent, log a server warning and continue (submission must never fail because email failed — wrap in try/catch, fire after the insert).
- Email body: all form fields + link to `https://www.hydrofast.co.kr/admin/inquiries`. From address via env `NOTIFY_FROM` (needs a verified domain in Resend — add setup steps to `TODO.md`).
- Do NOT send a confirmation email to the submitter in this pass (avoids sender-reputation setup); note as future item.

## Task 6.6 — CMS data hygiene (case studies)

**Files:** admin, DB — coordinate with Task 2.1

If Task 2.1's data-model fix (multi-image case studies) was deferred, do it here: `caseStudyImages` child table (id, caseStudyId FK, imagePath, sortOrder), migrate existing duplicate rows (same clientName+titleKo) into one row with multiple images via a one-off script in `scripts/`, update admin case-study form (multi-upload using existing `admin/api/upload` route) and public `/cases` + homepage cards (show first image; optional `+N` badge).

**This is the largest task in the plan — if it exceeds the session, ship the migration + script first and stub the admin multi-upload with a follow-up note.**

## Task 6.7 — Admin inquiry workflow niceties (small)

**Files:** `src/app/admin/inquiries/*`

- Add a read/unread or `status` field usage if the schema has one (check; if not, add `status: text default 'new'` in the same migration as 6.2) and a filter tab in the admin list, so the team can triage.

## Verification

- Submit the form on `/contact` and `/en/contact`: without consent → localized error; with consent → row inserted with `privacyConsentAt`, email received (or warning logged without key).
- Honeypot-filled submission inserts nothing.
- `/privacy` renders in both locales, linked from footer and the consent label.
- `npm run lint && npm run build`; migration SQL reviewed before apply.
