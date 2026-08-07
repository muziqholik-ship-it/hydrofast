<!-- BEGIN:nextjs-agent-rules -->
# This is NOT the Next.js you know

This version has breaking changes — APIs, conventions, and file structure may all differ from your training data. Read the relevant guide in `node_modules/next/dist/docs/` before writing any code. Heed deprecation notices.
<!-- END:nextjs-agent-rules -->

# Context discipline (known context hogs in this repo)

- Do NOT Read image files (catalog page renders, `public/content/**` photos) unless the task truly requires seeing them — each visual read costs 30–240k chars. When many images must be inspected, delegate to a subagent and get back a text summary.
- `src/content/business-areas.ts` is ~55KB. Never read it whole — Grep for the relevant area slug, then Read with offset/limit.
- `docs/improvement-plan/` is ~140KB across 10 files. Read only the one workstream file relevant to the task.
- Catalog text extracts under `assets-src/catalogs/extracted/` are huge — slice with grep/sed by page marker, never full-file Read.
