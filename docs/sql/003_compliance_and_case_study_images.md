# 003 — PIPA consent timestamp + case-study image gallery

Two changes from `docs/improvement-plan/06-workstream-content-data-compliance.md`:

1. `inquiries.privacy_consent_at` — records when the submitter checked the
   required 개인정보 수집·이용 동의 checkbox (Task 6.2). Nullable: rows that
   predate the checkbox have no consent time.
2. `case_study_images` — one project = one `case_studies` row with many photos
   (Task 6.6). `case_studies.image_path` stays as the cover (first image);
   this child table holds the full ordered gallery.

Apply in the Supabase SQL Editor (idempotent — safe to re-run). Drizzle-kit
equivalent lives in `drizzle/0001_mighty_elektra.sql`.

After applying, merge the duplicated one-photo-per-row case studies with:

```
npm run db:merge-case-studies
```

```sql
ALTER TABLE inquiries ADD COLUMN IF NOT EXISTS privacy_consent_at timestamptz;

CREATE TABLE IF NOT EXISTS case_study_images (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  case_study_id uuid NOT NULL REFERENCES case_studies(id) ON DELETE CASCADE,
  image_path text NOT NULL,
  sort_order integer NOT NULL DEFAULT 0
);
```
