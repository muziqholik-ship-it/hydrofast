# STEP/IGES → GLB pipeline for the 3D hero (Route A)

The homepage hero renders a **procedural** hydraulic cylinder today
(`src/components/three/hydraulic-cylinder.tsx`). To swap in a real HYDROFAST
product model, drop a CAD export into `assets-src/` and follow this pipeline,
then point `NEXT_PUBLIC_HERO_MODEL_URL` at the resulting GLB (e.g. put it at
`public/models/hero.glb` and set the env to `/models/hero.glb`). The scroll
choreography is identical for both models — they are swappable
(`src/components/three/glb-cylinder.tsx`).

## Node contract (required)

The GLB must contain, anywhere in its hierarchy:

| Node name | Meaning |
|---|---|
| `barrel` | The static cylinder body. Its bounding-box **Y extent** defines the stroke: the piston extends 40% of it. |
| `piston` | The rod assembly. It is translated along its **local +Y axis** on scroll — model it retracted, with +Y pointing out of the barrel. |

Everything else (fittings, brackets) can be named freely and stays static.

## Pipeline (Blender ≥ 4.x, CLI-friendly)

1. **Import STEP.** Blender has no native STEP importer; either use the
   STEPper add-on, or convert first with FreeCAD:
   ```bash
   # FreeCAD headless: STEP -> glTF-ready mesh
   freecadcmd -c "import Part, Mesh, ImportGui; \
     doc=ImportGui.insert('assets-src/tensioner.step', 'conv'); \
     import exportGltf"  # or export to .obj/.stl as intermediate
   ```
   In practice the quickest manual route: FreeCAD GUI → open STEP →
   File → Export → `.glb`/`.obj`, then continue in Blender.
2. **Decimate to ≤ 150k tris.** In Blender: select meshes → Decimate modifier
   (Collapse) until `Statistics` shows ≤ 150k. CAD tessellation is usually
   10–50× denser than needed for a hero shot.
3. **Restructure + rename.** Parent meshes into two empties/collections named
   exactly `barrel` and `piston`, piston modeled retracted, +Y = extension
   axis (rotate the whole assembly rather than the piston if the CAD came in
   Z-up).
4. **Materials.** Simple PBR: barrel metalness 0.9 / roughness 0.35, rod
   metalness 1.0 / roughness 0.08 (mirrors the procedural model). No textures
   needed — the scene lights with an HDRI environment.
5. **Export GLB with Draco**, headless:
   ```bash
   blender -b assets-src/tensioner.blend --python-expr "import bpy; \
     bpy.ops.export_scene.gltf(filepath='public/models/hero.glb', \
     export_format='GLB', export_draco_mesh_compression_enable=True, \
     export_draco_mesh_compression_level=6, export_yup=True)"
   ```
6. **Budget check:** the GLB must be **≤ 1.5 MB** (report §4). If over,
   decimate harder or raise Draco compression.
7. Set `NEXT_PUBLIC_HERO_MODEL_URL=/models/hero.glb` and verify: idle spin,
   scroll → piston extends 40% of barrel length, no console warnings about
   missing `piston` node.

### Typed components (optional, for Session C exploded view)

`npx gltfjsx public/models/hero.glb --transform --types` generates a typed
React component per node — useful when individual parts need refs (exploded
view). Not required for the `modelUrl` seam, which finds nodes by name.

## Hero poster (`public/hero-poster.webp`)

The mobile/lite fallback expects a poster render of the composed scene
(until it exists, those paths gracefully fall back to the v1 hero photo).
To produce it:

1. `npm run dev`, open `http://localhost:3000/?capture=1` on a desktop
   viewport (capture button only exists in development builds).
2. Scroll a little so the piston is mid-stroke, then click **capture poster**
   (bottom-right of the hero panel) — downloads `hero-poster.png` at canvas
   resolution.
3. Convert to WebP ≤ 200 KB and drop it in `public/`:
   ```bash
   npx sharp-cli --input hero-poster.png --output public/hero-poster.webp --format webp --quality 82
   # or: cwebp -q 82 hero-poster.png -o public/hero-poster.webp
   ```

Once real CAD lands, re-capture the poster and (report §2.5) consider the
Blender-rendered WebP frame sequence as the richer scrub fallback.
