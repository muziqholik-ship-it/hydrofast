"use client";

import { Suspense, useEffect, useRef, useState } from "react";
import { Canvas, invalidate, useFrame, useThree } from "@react-three/fiber";
import { Environment } from "@react-three/drei";
import { HydraulicCylinder } from "./hydraulic-cylinder";
import { GlbCylinder } from "./glb-cylinder";
import type { HeroProgress } from "@/lib/hero-progress";

const ORBIT_RAD = (35 * Math.PI) / 180; // camera orbit across the hero scrub
const BASE_AZIMUTH = 0.16;
const CAMERA_RADIUS = 6.4;

/** Camera orbits ~35° and rises slightly as the pinned hero scrub advances. */
function CameraRig({ progress }: { progress: HeroProgress }) {
  const camera = useThree((s) => s.camera);

  useFrame(() => {
    const az = BASE_AZIMUTH + progress.value * ORBIT_RAD;
    camera.position.set(
      Math.sin(az) * CAMERA_RADIUS,
      0.5 + progress.value * 0.4,
      Math.cos(az) * CAMERA_RADIUS,
    );
    camera.lookAt(0, 0.1, 0);
  });

  return null;
}

/**
 * Hero WebGL scene (workstream 08 B1). Client-only — home-hero.tsx imports it
 * via next/dynamic({ ssr: false }) after LCP, and only at MOTION_LEVEL=full on
 * ≥768px viewports with no reduced-motion preference.
 *
 * frameloop="demand": frames render only when something changes. The scroll
 * scrub invalidates via the progress subscription; the idle rotation runs its
 * own raf that stops whenever the hero leaves the viewport or the tab hides.
 */
export function HeroCanvas({
  progress,
  modelUrl,
}: {
  progress: HeroProgress;
  modelUrl?: string | null;
}) {
  const wrapper = useRef<HTMLDivElement>(null);
  const idle = useRef(false);
  const [ready, setReady] = useState(false);
  // Safe to read location during render: this component is ssr:false-only.
  const [captureMode] = useState(
    () =>
      process.env.NODE_ENV === "development" &&
      typeof window !== "undefined" &&
      new URLSearchParams(window.location.search).has("capture"),
  );

  // Render one frame per scrub tick; ScrollTrigger drives the cadence.
  useEffect(() => progress.subscribe(() => invalidate()), [progress]);

  // Idle-rotation driver, paused off-screen (IntersectionObserver) and on tab
  // hide — with it stopped, the demand loop renders nothing at all.
  useEffect(() => {
    const el = wrapper.current;
    if (!el) return;

    let inView = false;
    let raf = 0;

    const loop = () => {
      idle.current = inView && !document.hidden;
      if (idle.current) invalidate();
      raf = requestAnimationFrame(loop);
    };

    const observer = new IntersectionObserver(([entry]) => {
      inView = entry.isIntersecting;
    });
    observer.observe(el);
    raf = requestAnimationFrame(loop);

    return () => {
      observer.disconnect();
      cancelAnimationFrame(raf);
      idle.current = false;
    };
  }, []);

  const downloadCapture = () => {
    const canvas = wrapper.current?.querySelector("canvas");
    if (!canvas) return;
    const a = document.createElement("a");
    a.download = "hero-poster.png";
    a.href = canvas.toDataURL("image/png");
    a.click();
  };

  return (
    // Opaque blueprint-grid backdrop + fade-in: the panel keeps showing the
    // photo underlay until the first WebGL frame exists, then covers it.
    <div
      ref={wrapper}
      className={`absolute inset-0 bg-[var(--color-surface)] transition-opacity duration-700 ${ready ? "opacity-100" : "opacity-0"}`}
    >
      <div
        aria-hidden
        className="absolute inset-0 opacity-60 [background-image:linear-gradient(var(--color-border)_1px,transparent_1px),linear-gradient(90deg,var(--color-border)_1px,transparent_1px)] [background-size:32px_32px]"
      />
      <Canvas
        frameloop="demand"
        dpr={[1, 1.75]}
        camera={{ position: [1, 0.5, 6.3], fov: 38 }}
        gl={{ alpha: true, antialias: true, preserveDrawingBuffer: captureMode }}
        onCreated={() => setReady(true)}
        className="pointer-events-none"
      >
        <CameraRig progress={progress} />
        <ambientLight intensity={0.35} />
        <directionalLight position={[4, 6, 3]} intensity={1.1} />
        <Suspense fallback={null}>
          {/* No shadows anywhere (perf budget, report §4). */}
          <Environment preset="warehouse" />
          {modelUrl ? (
            <GlbCylinder url={modelUrl} progress={progress} idle={idle} />
          ) : (
            <HydraulicCylinder progress={progress} idle={idle} />
          )}
        </Suspense>
      </Canvas>
      {captureMode && (
        // Dev-only poster capture (visit /?capture=1 — see scripts/convert-step-to-glb.md).
        <button
          type="button"
          onClick={downloadCapture}
          className="absolute bottom-2 right-2 z-20 rounded-[var(--radius-card)] bg-[var(--color-ink)] px-3 py-1.5 text-xs font-semibold text-white"
        >
          capture poster
        </button>
      )}
    </div>
  );
}
