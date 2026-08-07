# 07 · Design Report: Scroll Animation & 3D Motion Direction

**Prepared after client feedback on the v1 plan:** the previous workstreams fixed correctness and trust but delivered only a static hero image as the visible "design improvement." That was too conservative. This report redefines the visual direction around **scroll-driven storytelling and moving 3D hydraulic assets**, based on fresh research into what is production-viable in this exact stack (Next.js 16 / React 19 / Tailwind 4) as of Aug 2026.

---

## 1. Honest retrospective — why v1 under-delivered on design

- The v1 plan anchored on the repo's own documented aesthetic ("engineered spec-sheet, restrained") and on B2B risk-aversion, so effort went to bugs, SEO, and compliance first and visual ambition last.
- "Restrained" was interpreted as "static." That was the mistake: restraint and motion are not opposites. Apple-style product pages are extremely restrained *and* extremely animated. The correct target for HYDROFAST is **precision motion** — machinery that moves the way the real product moves — not decorative animation.
- Nothing from v1 is wasted: the fixes in workstreams 02–06 (SSR stats, SEO, a11y, compliance) are exactly the clean base a heavy-motion site needs. This report is additive.

## 2. Research findings — the toolchain (verified Aug 2026)

### 2.1 Scroll animation: GSAP + ScrollTrigger (now fully free)
GSAP became 100% free including all formerly-paid Club plugins (ScrollTrigger, ScrollSmoother, SplitText, MorphSVG, DrawSVG) in April 2025, after Webflow acquired GreenSock — commercial use explicitly covered under the standard license. This removes the historical licensing reason to avoid it. ScrollTrigger is the industry reference for scroll-scrubbed narrative sections (pinning, scrub timelines, per-section triggers) and is framework-agnostic, so it coexists with the framer-motion already in the repo.

**Decision:** GSAP ScrollTrigger becomes the scroll engine for the marketing pages. framer-motion stays for micro-interactions (header, cards) — no rewrite.

### 2.2 Smooth scroll: Lenis
`lenis` (darkroomengineering) is the de-facto smooth-scroll layer used on most award-level sites; it syncs cleanly with ScrollTrigger via its raf loop. Lightweight, MIT. Alternative: GSAP's own ScrollSmoother (also free now) — either is acceptable; Lenis preferred for its smaller footprint and non-invasive DOM handling.

### 2.3 Live 3D: React Three Fiber v9 + drei
- `@react-three/fiber` v9 explicitly pairs with React 19 (v8 does not) — the repo runs React 19.2.4, so **v9 is required and compatible**. Current release line ~9.7.x on npm.
- Pattern for App Router: the `<Canvas>` lives in a client component, dynamically imported with `ssr: false`; `three` added to `transpilePackages` in `next.config.ts` if untranspiled add-ons are used.
- `@react-three/drei` supplies `useGLTF`, `Environment`, `ScrollControls`, `Stage`, `MeshTransmissionMaterial` etc.
- Reference architecture: the official `pmndrs/react-three-next` starter (persistent canvas, 3D views portal-ed into any DOM node, Lighthouse-100 achievable, ~79 kb first-load JS for the base) — we borrow its patterns, not the whole template.
- Asset pipeline: **glTF/GLB + Draco or meshopt compression**, converted to typed JSX components via `gltfjsx`. Budget: hero model ≤ 1.5 MB compressed, lazy-loaded after LCP.

### 2.4 3D asset sourcing — three routes, in order of preference

| Route | Quality | License | Effort |
|---|---|---|---|
| **A. Company's own CAD** — HYDROFAST sells "2D·3D 시스템 설계·제작"; STEP/IGES files of its own tensioners, cylinders, manifolds almost certainly exist. Convert STEP → Blender → decimate → bake PBR → GLB. | Highest, and *authentic* — it's your actual product | Owned outright | Medium (one-time Blender pass per model; can be done by Claude Code + Blender CLI scripts or a freelancer) |
| **B. Sketchfab CC-licensed models** — multiple free hydraulic-cylinder GLBs exist under CC Attribution (some with built-in extend/retract animations, e.g. animated hydraulic cylinder assemblies published 2022–2026) | Good | CC-BY → requires visible attribution (footer credit acceptable) | Low |
| **C. Procedural in-code** — a stylized cylinder/manifold built from Three.js primitives (CylinderGeometry, tubes, metallic PBR materials) | Stylized, fully controllable, tiny payload | None | Low-medium |

**Decision:** ship **C immediately** (guaranteed, zero-license, on-brand stylization), pursue **A in parallel** as the end-state, keep B as fallback. The scroll choreography is identical regardless of which model is loaded — models are swappable GLBs.

### 2.5 Fallback technique: scroll-scrubbed image sequence
The Apple-style alternative: render the 3D model to ~100 WebP frames (turntable / piston-stroke), scrub frames on a `<canvas>` tied to ScrollTrigger. Pros: no WebGL cost, works on weak mobiles, deterministic quality. This is the designated **mobile / low-power / reduced-data fallback** for the hero scene, generated from the same Blender file as Route A/C.

## 3. The new design concept — "Under Pressure"

One narrative spine for the homepage: **pressure, applied precisely.** The page is a single scroll story where the signature 3D object works as you scroll.

```
┌────────────────────────────────────────────────┐
│ HERO (pinned ~150vh)                           │
│  3D hydraulic tensioner/cylinder, floating,    │
│  slow idle rotation. Headline splits in        │
│  (SplitText). Scroll → camera orbits + piston  │
│  BEGINS TO EXTEND, pressure readout counts     │
│  0 → 6,900 bar in mono font, synced to scroll. │
├────────────────────────────────────────────────┤
│ SPEC STRIP — datasheet motif (kept from v1)    │
├────────────────────────────────────────────────┤
│ 사업 분야 (pinned horizontal scroll)             │
│  5 area panels slide horizontally as user      │
│  scrolls vertically; area index 01→05 ticks    │
│  like a gauge. Each panel: accent color wash.  │
├────────────────────────────────────────────────┤
│ EXPLODED VIEW SECTION (pinned)                 │
│  The 3D assembly separates into parts on       │
│  scroll (barrel / piston / seals / fittings),  │
│  callout lines label each part — visual proof  │
│  of "설계부터 제작까지". Reassembles on exit.      │
├────────────────────────────────────────────────┤
│ 제작 사례 — cards rise with scrub-linked        │
│  parallax; images scale from 1.06 → 1.0        │
├────────────────────────────────────────────────┤
│ 인증 / partners / clients (marquees kept)       │
├────────────────────────────────────────────────┤
│ CLOSING CTA — background pressure-gauge SVG    │
│  needle sweeps to max as section enters        │
└────────────────────────────────────────────────┘
```

Motion grammar (applies everywhere): eases are mechanical (`power2.inOut`, no bounce), durations 0.4–0.8 s, scrubbed sections use `scrub: 0.5–1`, everything honors `prefers-reduced-motion` by rendering final states statically, and the 3D scene degrades to the image-sequence then to a static render.

## 4. Performance & quality budget

- First-load JS for `/` stays under ~180 kb gz (Three.js chunk lazy-loaded post-LCP via dynamic import + `requestIdleCallback`).
- Hero GLB ≤ 1.5 MB (Draco/meshopt); image-sequence fallback ≤ 2.5 MB total WebP.
- LCP element remains the headline text, never the canvas. CLS 0. Canvas gets `frameloop="demand"`/pause when off-screen.
- Lighthouse mobile targets: Perf ≥ 80 with WebGL hero, ≥ 90 with sequence fallback; A11y ≥ 95 (unchanged from v1 work).
- Kill-switch: a `NEXT_PUBLIC_MOTION_LEVEL` env (full / lite / off) so the owner can demote to lite instantly if analytics show mobile pain.

## 5. Sources & references for implementation

- GSAP ScrollTrigger docs + free-license announcement (gsap.com/scroll, webflow.com/updates/gsap-becomes-free)
- `darkroomengineering/lenis` (GitHub) — smooth scroll + ScrollTrigger sync recipe in its README
- `pmndrs/react-three-fiber` (v9 ↔ React 19 pairing stated in README/FAQ), `pmndrs/drei`, `pmndrs/react-three-next` starter, `pmndrs/gltfjsx`
- Sketchfab free CC-BY hydraulic cylinder models (several, incl. animated assemblies) for Route B
- Blender CLI for STEP→GLB conversion + frame-sequence rendering (Route A and the fallback)

## 6. What happens next

Implementation is specified as a Claude Code workstream in `08-workstream-motion-3d.md`, split into 3 sessions (motion foundation → 3D hero → scroll narrative sections), each with acceptance criteria and copy-paste prompts. Route A (your own CAD files) needs one input from you: **any STEP/IGES/SolidWorks export of a representative product** dropped into the repo under `assets-src/` — the workstream includes the conversion script either way.
