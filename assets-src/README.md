# assets-src/

Source-footage drop folders for the video homepage (workstream 09 — see
`docs/VIDEO-PIPELINE.md` for the full pipeline, search-term shopping list, and
licensing caveats). Files here are **not** served; `scripts/encode-videos.mjs`
encodes them into `public/videos/` and updates `src/content/videos.json`.

```
assets-src/video/
  lifting/    heavy lifting        (crane heavy lift, shipyard crane, hydraulic jack …)
  torque/     precision torque     (torque wrench industrial, bolt tightening …)
  bolting/    special bolting      (wind turbine bolts, pipeline flange …)
  robotics/   hydraulic robotics   (industrial robot arm factory, automated line …)
  cta/        closing wide shot    (shipyard aerial, power plant dusk …)
```

For the 사업 분야 horizontal panels, add `area-<slug>/` folders (slug = the
area's URL slug) — the encode script registers those slots automatically.

Put ONE clip per folder (the script takes the alphabetically first file if
there are several). 6–12 s, 4K or 1080p, no audio needed — it is stripped.
