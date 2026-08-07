# 08 · Workstream: Scroll Motion & 3D (implements the "Under Pressure" concept)

**Prerequisite:** Workstreams 02–06 merged. Read `07-design-motion-report.md` first — it defines the concept, motion grammar, and budgets this workstream implements. Global constraints from `00-README.md` still apply (tokens only, ko/en parity, don't break /admin).

**New dependencies (add in Session A):**
```
npm i gsap lenis
npm i three @react-three/fiber@^9 @react-three/drei
npm i -D @types/three
```
GSAP incl. ScrollTrigger/SplitText is free for commercial use (post-2025 license). R3F **must** be v9 (v8 is incompatible with React 19). Add `transpilePackages: ["three"]` to `next.config.ts` if build errors demand it.

---

## SESSION A — Motion foundation (no 3D yet)

### A1. Lenis + ScrollTrigger infrastructure
- New `src/components/motion/smooth-scroll.tsx` (client): Lenis instance driving `ScrollTrigger.update` via `lenis.on('scroll', ...)` + gsap ticker raf sync (use the official recipe from the Lenis README). Mount it in `[locale]/layout.tsx` around `<main>`. Disable Lenis entirely when `prefers-reduced-motion` or `NEXT_PUBLIC_MOTION_LEVEL !== "full"`.
- New `src/lib/motion.ts`: exports `MOTION_LEVEL` (env-driven: `full | lite | off`), shared eases (`power2.inOut`), and a `useScrollTriggerCleanup` helper that kills triggers on route change (next-intl navigation).
- Add `NEXT_PUBLIC_MOTION_LEVEL=full` to `.env.example` with a comment explaining the three levels.

### A2. Hero text choreography
- In `home-hero.tsx`: replace the framer stagger with GSAP SplitText line-reveal (masked lines rising, 0.6 s, stagger 0.08). Keep the component client-side; keep existing copy/i18n.
- The stat counters (fixed in Task 2.2) get scroll-scrub enhancement: tie the count-up progress to a ScrollTrigger scrub instead of time, `lite` level keeps the time-based version, `off` renders static targets. Do not regress the SSR-shows-real-numbers behavior.

### A3. Section reveal system
- Replace `RevealGrid`'s framer in-view reveals on the homepage with a ScrollTrigger batch equivalent (`gsap.utils.toArray` + `ScrollTrigger.batch`), same visual result but consistent with the new engine. Keep the framer version for non-homepage pages (don't churn every page this session).
- Case-study cards: add scrub-linked parallax (image `scale 1.06 → 1.0`, card `y` drift 24px → 0) per the report's motion grammar.

### A4. Closing CTA gauge
- Build the pressure-gauge SVG (inline, tokens only: steel dial, safety-orange needle) in the closing CTA section from Workstream 04; DrawSVG/rotation tween sweeps the needle 0→max as the section enters (`scrub: 0.8`). Reduced-motion: needle rendered at max.

**Acceptance A:** homepage scrolls smoothly (Lenis); hero text animates in with SplitText; stats scrub with scroll; cards parallax; gauge sweeps; `MOTION_LEVEL=off` renders a fully static, correct page; `npm run lint && npm run build` pass; no ScrollTrigger leaks on locale switch (navigate ko↔en repeatedly and check console).

---

## SESSION B — 3D hero (procedural model first)

### B1. Canvas infrastructure
- New `src/components/three/hero-canvas.tsx` (client) exporting a `<Canvas>` with `frameloop="demand"`, `dpr={[1, 1.75]}`, alpha background. Dynamically import it in the hero with `next/dynamic` `{ ssr: false }`, mounted only after LCP (`requestIdleCallback` or `useEffect`+`setTimeout(0)` gate) and only when `MOTION_LEVEL === "full"` and `(prefers-reduced-motion: no-preference)`.
- Pause rendering when the hero scrolls out of view (IntersectionObserver → `invalidate()`-driven demand loop).

### B2. Procedural hydraulic cylinder (Route C from the report)
- New `src/components/three/hydraulic-cylinder.tsx`: stylized assembly from primitives — barrel (CylinderGeometry, brushed-metal PBR: `metalness 0.9, roughness 0.35`, steel-blue tint from tokens), piston rod (chrome: `roughness 0.08`), end caps, 2 port fittings (small cylinders + tori), subtle safety-orange accent ring. Group hierarchy: `<group name="assembly"><group name="barrel">…</group><group name="piston">…</group></group>` — **the piston group must be independently translatable** (this is the animated stroke).
- Lighting: drei `Environment preset="warehouse"` (or "city") + one directional key light; no shadows (perf).
- Idle motion: slow y-rotation (0.05 rad/s) via `useFrame`, only while in view.

### B3. Scroll choreography
- Pin the hero for ~150vh (ScrollTrigger `pin: true, scrub: 0.8`). Timeline: camera orbits ~35°, piston group extends along its axis (stroke ≈ 40% of barrel length), and a mono-font pressure readout (`0 → 6,900 bar`, DOM element, not canvas text) counts in sync with the same scrub progress. Reuse the existing stat formatting.
- Exit state: assembly settles, headline remains readable throughout (text layered above canvas, canvas `pointer-events: none`).

### B4. Fallbacks
- `lite` level or mobile (< 768px) initially: render `public/hero-poster.webp` — generate it by screenshotting the composed 3D scene (add a small dev-only "capture" button or use a headless render; document how it was produced). The scroll pin still runs with the pressure readout so mobile isn't motionless.
- Add the swap seam for real CAD: the canvas accepts a `modelUrl?: string` prop; when provided, load via drei `useGLTF` (Draco-enabled loader) instead of the procedural component, expecting the same `barrel`/`piston` node names. Create `scripts/convert-step-to-glb.md` documenting the Blender CLI pipeline (import STEP via Blender's importer or FreeCAD intermediate → decimate to ≤ 150k tris → name nodes `barrel`/`piston` → export GLB with Draco) and reference `assets-src/` as the drop folder. Add `pmndrs/gltfjsx` usage note for typed components.

**Acceptance B:** desktop full-motion: 3D cylinder idles, then orbits + extends on scroll with synced bar readout; JS for `/` before idle-load unchanged vs Session A (Three chunk is lazy); Lighthouse mobile Perf ≥ 85 (mobile gets poster path); `MOTION_LEVEL=lite/off` and reduced-motion all render correct static/2D versions; build passes.

---

## SESSION C — Scroll narrative sections

### C1. 사업 분야 horizontal scroll
- Homepage business-areas section becomes a pinned horizontal scroller (ScrollTrigger `pin` + `xPercent` tween across 5 full-height panels). Each panel: area index in huge mono type, name ko/en, summary, accent-color wash at 8% opacity, `자세히 보기 →` link. Desktop only — below `lg`, keep the existing vertical card grid (do not ship janky mobile horizontal pinning).
- Keyboard/a11y: panels remain in DOM order; links tabbable; pinning must not trap keyboard scroll (test PageDown/space through the section).

### C2. Exploded-view section
- New pinned section after 사업 분야 (or replacing part of it — choose based on page rhythm and say why): the Session B assembly separates on scrub — barrel −x, piston +x, fittings ±y — with SVG/DOM callout lines + labels (ko/en) fading in per part ("실린더 배럴", "피스톤 로드", "고압 피팅", …). Reassembles as the user scrolls past. `lite`: a static labeled diagram (export one frame as webp with absolutely-positioned DOM labels).
- Reuse the same canvas instance if feasible (drei `View` portals per react-three-next pattern) rather than a second WebGL context; if two contexts are unavoidable, ensure only one renders at a time (visibility-gated demand loops).

### C3. Polish pass
- Sweep every new animation against the motion grammar (mechanical eases, 0.4–0.8 s, scrub 0.5–1). Remove any easing bounce/overshoot that crept in.
- Verify all three MOTION_LEVELs on `/`, `/en`, mobile viewport 375px, and with reduced-motion emulated.
- Update `TODO.md`: (1) owner to supply STEP/CAD exports in `assets-src/` for Route A; (2) if any Sketchfab CC-BY model gets used instead, add the required attribution line to the footer; (3) consider generating the Apple-style frame sequence from Blender once real CAD lands.

**Acceptance C:** full homepage plays as the storyboard in `07-design-motion-report.md` section 3; no console errors; scroll never locks; Lighthouse targets from the report met; lint+build pass.

---

## Copy-paste session prompts

**Session A**
```
Read docs/improvement-plan/00-README.md ("Global constraints"), docs/improvement-plan/07-design-motion-report.md (the concept and motion grammar), then docs/improvement-plan/08-workstream-motion-3d.md and implement SESSION A only (tasks A1–A4). Install gsap and lenis. Follow the Lenis README's official ScrollTrigger sync recipe. Hard rules: NEXT_PUBLIC_MOTION_LEVEL=off and prefers-reduced-motion must both yield a fully static, correct page; do not regress the SSR real-number stats; kill all ScrollTriggers on locale navigation. When done run `npm run lint` and `npm run build`, then tell me how to manually verify each of A1–A4 and confirm no ScrollTrigger leaks when switching ko↔en. Commit: "motion: lenis + scrolltrigger foundation, hero splittext, scrub stats, cta gauge".
```

**Session B**
```
Read docs/improvement-plan/07-design-motion-report.md and docs/improvement-plan/08-workstream-motion-3d.md, then implement SESSION B only (tasks B1–B4). Install three, @react-three/fiber@^9 (v9 is mandatory — v8 breaks on React 19), @react-three/drei, @types/three. The Canvas is a client component dynamically imported with ssr:false, mounted after LCP, frameloop="demand", paused off-screen. Build the procedural hydraulic cylinder with independently named "barrel" and "piston" groups, then the pinned scroll choreography with the synced 6,900-bar readout. Implement the poster fallback for mobile/lite and the modelUrl GLB swap seam with the STEP→GLB conversion doc. When done run `npm run lint` and `npm run build`, report the lazy-loaded Three chunk size and Lighthouse mobile numbers, and list exactly what I'll see at each MOTION_LEVEL. Commit: "3d hero: r3f v9 procedural cylinder, pinned scrub choreography, fallbacks + glb seam".
```

**Session C**
```
Read docs/improvement-plan/07-design-motion-report.md and docs/improvement-plan/08-workstream-motion-3d.md, then implement SESSION C only (tasks C1–C3). The horizontal 사업 분야 scroller is desktop-only — mobile keeps the vertical grid. For the exploded view, prefer drei View portals over a second WebGL context and state which approach you used and why. Keyboard scroll must never get trapped in pinned sections. Finish with the polish pass across all three MOTION_LEVELs at desktop and 375px, and update TODO.md with the three follow-up items listed in C3. When done run `npm run lint` and `npm run build` and give me a section-by-section description of the final homepage scroll experience so I can compare it against the storyboard in the report. Commit: "scroll narrative: horizontal business areas, exploded 3d view, motion polish".
```
