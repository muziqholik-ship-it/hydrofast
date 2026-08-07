# 09 · Workstream: Real Video + Fluid Typography (supersedes 3D)

**Client decision (2026-08):** the 3D hydraulic cylinder and the static hero image are cancelled — too generic. The new direction is (1) **real industry footage** — heavy lifting, precision torque, special bolting, hydraulic robotics — and (2) **professional text motion graphics where type fills and drains like hydraulic oil**, driven by load and scroll.

**Status of earlier files:**
- `08-workstream-motion-3d.md` — Sessions **B and C are CANCELLED**. Session **A remains valid and required** (Lenis + ScrollTrigger + motion-level infrastructure is the engine this workstream runs on). If B/C were already implemented, Session F below removes them.
- Workstream 04's static hero image (Task 4.1) is **removed** by this workstream. The spec strip, certifications, closing CTA, and /business page from 04 all stay.
- Global constraints from `00-README.md` still apply, with **one amendment**: this workstream adds exactly one token — `--color-fluid` (hydraulic-oil amber) — because the oil metaphor cannot be expressed in steel-blue or safety-orange. No other new colors.

---

## 1. Design direction — "Fluid Power, On Film"

The homepage becomes a film-first page. Four capability reels carry the story; typography behaves like the medium itself — oil under pressure.

```
┌─────────────────────────────────────────────────────┐
│ HERO — full-bleed muted video loop (dark gradient    │
│ overlay ~55%). Headline renders as OIL-FILL type:    │
│ on load, amber fluid rises inside the letterforms    │
│ with a moving wave surface (0 → 100% in ~1.6s),      │
│ then settles with a slow slosh. Below: capability    │
│ ticker (HEAVY LIFTING · PRECISION TORQUE ·           │
│ SPECIAL BOLTING · HYDRAULIC ROBOTICS) — the hero     │
│ video crossfades to match the active ticker item     │
│ every ~7s, and clicking a term jumps the video.      │
├─────────────────────────────────────────────────────┤
│ SPEC STRIP + stats (kept; stats scrub from 08-A)     │
├─────────────────────────────────────────────────────┤
│ 사업 분야 — pinned horizontal scroller (desktop),      │
│ each panel backed by its own short video loop with   │
│ dark wash + area accent. Panel headings use the      │
│ oil-fill treatment SCRUBBED BY SCROLL: fluid level   │
│ rises as the panel centers, drains as it leaves —    │
│ literally "filling up and down" with scroll.         │
│ Mobile: vertical cards with video posters.           │
├─────────────────────────────────────────────────────┤
│ 제작 사례 — parallax cards (kept from 08-A)           │
├─────────────────────────────────────────────────────┤
│ 인증 / partners / clients (kept)                      │
├─────────────────────────────────────────────────────┤
│ CLOSING CTA — gauge (kept from 08-A) over a slow,    │
│ desaturated wide-shot loop (shipyard / plant)        │
└─────────────────────────────────────────────────────┘
```

**Oil-fill typography — how it's built (no plugins needed beyond GSAP):**
SVG `<text>` (or SplitText-derived outlines) used as a `<clipPath>`/mask over a "fluid" rect topped by a sine-wave `<path>`. GSAP animates the wave path horizontally (continuous, ~3s loop, gives the liquid surface) while a second tween translates the fluid group vertically (the fill level). Fill level is driven two ways: **time-based** on hero load (0→100%), **scrub-based** in scroll sections (ScrollTrigger `scrub` maps section progress → level, so scrolling down fills and scrolling up drains). Fluid uses a vertical gradient of `--color-fluid` (suggested `#e8b04b → #9a6a14`, amber hydraulic oil) with a faint darker meniscus line at the surface. Unfilled letterform: 1px stroke in `--color-border` on dark, so text is always legible mid-animation. Reduced-motion / `MOTION_LEVEL=off`: text renders fully filled, static.

**Motion grammar update:** fluid motion is allowed to be organic (sine ease on the wave) — everything else keeps the mechanical eases from report 07 §3.

## 2. Footage sourcing — three routes

| Route | What | License notes |
|---|---|---|
| **A. Own footage (best, pursue now)** | HYDROFAST installs at 효성, 한화오션, 해군 etc. — site videos of tensioning jobs, robot docking systems, lifts almost certainly exist on phones/drives. Even rough 1080p phone footage grades well once darkened + desaturated under overlay. | Owned. Confirm client-site permission before publishing recognizable facilities. |
| **B. Free stock (ships day one)** | Pexels and Mixkit allow commercial use with no attribution and no sign-up; Pixabay similar; Coverr allows commercial use but its license page is currently self-contradictory on attribution — if a Coverr clip is used, include a credit to be safe. Caveat that applies to all free stock: the license doesn't clear visible logos, private property, or recognizable people — prefer generic shots without readable branding. | Free, commercial OK (see caveats) |
| **C. Paid stock (upgrade path)** | Artgrid, Envato Elements, Storyblocks, iStock — deeper industrial catalogs (real bolting/torque close-ups are scarce in free libraries) and documented releases. | Per-clip/subscription |

**Search-term shopping list** (use on Pexels → Mixkit → Pixabay, grab 4K where offered):
- Heavy lifting: `crane heavy lift`, `shipyard crane`, `gantry crane load`, `hydraulic jack lifting`, `heavy transport plant`
- Precision torque: `torque wrench industrial`, `bolt tightening worker`, `mechanic torque close up`, `flange bolts`
- Special bolting: `wind turbine bolts`, `steel structure bolting`, `pipeline flange`, `nut runner`
- Hydraulic robotics: `industrial robot arm factory`, `robotic manufacturing line`, `automated factory 4k`
- CTA wide shot: `shipyard aerial`, `power plant dusk`, `steel factory wide`

**Division of labor:** curating clips is a human/taste task — the owner (or Claude Code with browser access, if available) downloads candidates into `assets-src/video/{lifting|torque|bolting|robotics|cta}/`. The workstream builds everything to run from a manifest, so clips are swappable without code changes, and ships with any provisional clips available (or poster-only slots) if folders are empty.

## 3. Video engineering standard (applies to every clip)

- Per clip, two renditions produced by an ffmpeg script (Session D writes it): **desktop** 1920×1080 H.264 CRF 23–26, audio stripped, 6–12s seamless loop, target ≤ 4 MB; **mobile** 960×540 ≤ 1.5 MB. Optional WebM/AV1 second source where encode time allows. Poster frame WebP extracted per clip.
- Markup: `<video autoplay muted loop playsinline preload="metadata" poster=…>` with `<source>` per rendition via media queries / JS pick. Never any audio.
- Lazy discipline: only the hero video loads eagerly; all section videos mount their `src` via IntersectionObserver (~200px margin) and **pause when off-screen**. LCP stays the headline; poster shows until video is ready (no flash).
- Respect: `prefers-reduced-motion` → posters only, no autoplay; `Save-Data` header / `navigator.connection.saveData` → posters only; `MOTION_LEVEL=lite` → hero video only, sections use posters; `off` → posters everywhere.
- Hosting: a new Supabase Storage bucket `site-videos` (public), consistent with existing image infra; manifest `src/content/videos.json` maps slot → paths + poster + ko/en label. (Admin UI for this is a future item — file in TODO.md.)

## 4. Sessions

### SESSION D — Video infrastructure + hero
1. **Removal first:** delete the static hero image and any 3D remnants if present (`src/components/three/*`, hero canvas import, poster); uninstall `three @react-three/fiber @react-three/drei @types/three` if installed; remove `transpilePackages: ["three"]` if added. Keep everything from 08 Session A.
2. `scripts/encode-videos.mjs` — ffmpeg pipeline (source folder → renditions + posters → optional upload to Supabase via service key env), plus `docs/VIDEO-PIPELINE.md` explaining usage and the shopping list from §2.
3. `src/components/media/video-loop.tsx` — the standard-compliant video component (§3): renditions, poster, IO lazy/pause, reduced-motion/Save-Data/MOTION_LEVEL fallbacks.
4. Hero rebuild: full-bleed `VideoLoop` + gradient overlay tokens, capability ticker (4 items, ko/en) that crossfades the hero clip every ~7s and on click; if a slot has no clip yet, its poster (or a dark gradient) renders and the ticker still works. Manifest-driven.
5. CTA background loop slot (desaturated via CSS filter, very low prominence — the gauge stays the focal point).

**Acceptance D:** hero plays a muted loop with working ticker crossfade; zero layout shift (poster sized identically); all fallback modes verified; lint+build pass; LCP unchanged or better vs. pre-video.

### SESSION E — Oil-fill typography system
1. `src/components/motion/fluid-text.tsx` — the SVG mask/wave system from §1. Props: `text`, `mode: "load" | "scrub"`, `level` override, size/level of detail. Must handle Korean glyphs (Pretendard) — use SVG `<text>` with the loaded webfont, verify mask renders identically ko/en, test long lines wrapping to `<tspan>`s.
2. Apply: hero headline (`mode="load"`, replacing the 08-A SplitText reveal — SplitText stays available for other headings), business-area panel headings (`mode="scrub"` — fill on approach, drain on exit), and one more tasteful placement max (e.g. closing CTA heading, `mode="scrub"`). Nowhere else — this is the signature; overuse kills it.
3. Add `--color-fluid` (+ dark-mode variant) to `globals.css` with a comment justifying the amendment; gradient + meniscus defined once in the component.
4. Fallbacks: reduced-motion/`off` → fully-filled static text; ensure the SVG text is real, selectable, and accessible (`role="heading"`/aria-label as appropriate, no aria-hidden duplication traps).

**Acceptance E:** hero headline visibly "fills with oil" on load; area headings fill/drain with scroll direction; ko and en both render perfectly; static fallback correct; no CLS; lint+build pass.

### SESSION F — Video narrative sections + cleanup
1. 사업 분야 horizontal scroller (desktop, from cancelled 08-C1 but video-backed): pinned panels, each with its own `VideoLoop` background (dark wash + 8% area-accent), fluid heading, summary, link. **Only the active ±1 panel's video plays**; others pause. Mobile: existing vertical grid, cards gain poster thumbnails.
2. Keyboard/a11y for pinning (no scroll traps), consistent with the 05 workstream standards.
3. Full sweep: confirm no 3D deps in `package.json`/lockfile, no dead imports, no orphaned hero-image assets; all MOTION_LEVELs × reduced-motion × Save-Data verified at desktop and 375px; total media transferred on first viewport load reported (target ≤ 5 MB desktop full-motion).
4. `TODO.md`: (1) owner to collect/approve real site footage (Route A) + client-site publication permission; (2) admin UI for the `site-videos` bucket + manifest; (3) upgrade shortlist of paid clips (Route C) for torque/bolting close-ups; (4) if any Coverr clip shipped, footer credit added.

**Acceptance F:** homepage matches the §1 storyboard end-to-end with whatever clips exist (graceful poster slots otherwise); performance and fallback matrix verified; lint+build pass.

---

## 5. Copy-paste session prompts

**Session D**
```
Read docs/improvement-plan/00-README.md ("Global constraints"), docs/improvement-plan/09-workstream-video-motion.md fully (it supersedes the 3D plan), then implement SESSION D only. Start with the removal task: strip the static hero image and every 3D remnant (components, imports, three/@react-three/* deps, transpilePackages entry) — keep all of 08 Session A's Lenis/ScrollTrigger work. Then build the ffmpeg encode script + VIDEO-PIPELINE.md, the VideoLoop component with the full fallback matrix (reduced-motion, Save-Data, MOTION_LEVEL), and the manifest-driven video hero with the 4-item capability ticker and crossfade. Empty video slots must degrade gracefully to posters/gradients — the site must look intentional with zero clips present. Run `npm run lint` and `npm run build`, then tell me exactly which folders to drop stock clips into and the command to encode them. Commit: "video hero: remove 3d/static hero, encode pipeline, VideoLoop, capability ticker".
```

**Session E**
```
Read docs/improvement-plan/09-workstream-video-motion.md and implement SESSION E only — the oil-fill typography system. Build fluid-text.tsx exactly as specified in section 1: SVG text mask over an animated sine-wave fluid with load mode (rise 0→100% then settle) and scrub mode (ScrollTrigger-driven fill/drain). Add the single --color-fluid token with a justifying comment. Apply it to the hero headline, business-area headings (scrub), and at most one more heading — nowhere else. It must render Korean (Pretendard) and English identically, remain selectable/accessible real text, show fully-filled static text under reduced-motion or MOTION_LEVEL=off, and cause zero CLS. Run `npm run lint` and `npm run build`, then describe how to visually verify the fill/drain behavior scrolling down vs up. Commit: "fluid type: oil-fill svg typography, load + scroll-scrub modes".
```

**Session F**
```
Read docs/improvement-plan/09-workstream-video-motion.md and implement SESSION F only. Build the desktop-pinned horizontal 사업 분야 scroller with per-panel VideoLoop backgrounds (only active ±1 panels play), fluid scrub headings, and the mobile vertical fallback with posters. Then the cleanup sweep: verify no 3D packages remain anywhere, all MOTION_LEVEL × reduced-motion × Save-Data combinations at desktop and 375px, keyboard scroll never traps in pinned sections, and report total first-viewport media weight (target ≤ 5 MB desktop full-motion). Update TODO.md with the four items in task F4. Run `npm run lint` and `npm run build` and give me the final section-by-section scroll walkthrough against the section-1 storyboard. Commit: "video narrative: horizontal area panels, playback discipline, cleanup + fallback matrix".
```
