# Video pipeline — homepage footage (workstream 09)

The homepage runs on short muted video loops defined in the manifest
`src/content/videos.json`. Clips are swappable **without code changes**: drop
footage → run one script → the manifest updates → components pick it up.
Slots with no clip degrade gracefully (poster if one exists, otherwise an
intentional dark gradient), so the site is always shippable.

## 1. The five slots

| Slot | Used by | Content |
|---|---|---|
| `lifting` | hero (ticker item 1) | heavy lifting — cranes, jacks, heavy transport |
| `torque` | hero (ticker item 2) | precision torque — torque wrenches, bolt tightening close-ups |
| `bolting` | hero (ticker item 3) | special bolting — wind-turbine/flange/steel-structure bolts |
| `robotics` | hero (ticker item 4) | hydraulic robotics — robot arms, automated lines |
| `cta` | closing CTA background | slow desaturated wide shot — shipyard/plant |

## 2. Getting clips (footage sourcing, 09 §2)

**Route A — own footage (best):** site videos from HYDROFAST installs
(tensioning jobs, robot docking, lifts). Rough 1080p phone footage grades
fine once darkened under the overlay. Confirm client-site permission before
publishing recognizable facilities.

**Route B — free stock (ships today):** Pexels and Mixkit allow commercial
use, no attribution, no sign-up; Pixabay similar. Coverr's license is
self-contradictory on attribution — if you use a Coverr clip, add a footer
credit to be safe. Free-stock caveat: the license does not clear visible
logos, private property, or recognizable people — prefer generic shots
without readable branding.

Search terms (Pexels → Mixkit → Pixabay, take 4K where offered):

- `lifting/`: crane heavy lift · shipyard crane · gantry crane load · hydraulic jack lifting · heavy transport plant
- `torque/`: torque wrench industrial · bolt tightening worker · mechanic torque close up · flange bolts
- `bolting/`: wind turbine bolts · steel structure bolting · pipeline flange · nut runner
- `robotics/`: industrial robot arm factory · robotic manufacturing line · automated factory 4k
- `cta/`: shipyard aerial · power plant dusk · steel factory wide

**Route C — paid upgrade:** Artgrid / Envato Elements / Storyblocks / iStock
for real bolting & torque close-ups (scarce in free libraries) with
documented releases.

Pick 6–12 second shots with steady motion — they loop best.

## 3. Encode

1. Drop **one clip per folder** into `assets-src/video/{lifting,torque,bolting,robotics,cta}/`
   (several files → the alphabetically first wins).
2. Install ffmpeg if needed: `winget install Gyan.FFmpeg` (restart terminal).
3. Run:

   ```bash
   node scripts/encode-videos.mjs            # all slots that have footage
   node scripts/encode-videos.mjs lifting    # just one slot
   ```

   Per clip this produces in `public/videos/` (09 §3 standard):
   - `<slot>.mp4` — 1920×1080 H.264, ≤ 12 s, audio stripped, CRF stepped 24→30 until **≤ 4 MB**
   - `<slot>-mobile.mp4` — 960×540, **≤ 1.5 MB**
   - `<slot>-poster.webp` — first-frame poster (also the reduced-motion fallback)

   and writes the paths into `src/content/videos.json`.

4. `npm run dev` / rebuild — hero ticker and CTA pick the clips up.

## 4. Hosting on Supabase (optional, recommended for production)

Local `/videos/*` files deploy with the app and work fine, but keep large
media out of the repo/deploy by hosting in Storage instead:

1. Supabase Dashboard → Storage → **New bucket** → name `site-videos`,
   **public** — consistent with the existing image buckets.
2. `node scripts/encode-videos.mjs --upload` — encodes, uploads with 1-year
   cache headers, and writes the public URLs into the manifest instead of
   `/videos/` paths. (Needs `NEXT_PUBLIC_SUPABASE_URL` + `SUPABASE_SECRET_KEY`
   in `.env.local`.)

Admin UI for this bucket/manifest is a future item (see TODO.md).

## 5. Behavior contract (implemented by `src/components/media/video-loop.tsx`)

- `<video autoplay muted loop playsinline preload="metadata" poster=…>`, never any audio.
- Only the hero loads eagerly; section videos attach their `src` via
  IntersectionObserver (~200 px margin) and pause off-screen.
- `prefers-reduced-motion` → posters only. `Save-Data` → posters only.
  `NEXT_PUBLIC_MOTION_LEVEL=lite` → hero video only; `off` → posters everywhere.
- Poster renders first, video fades over it once playing — no flash, zero CLS.
- LCP stays the headline, never the video.
