"use client";

import { useEffect, useMemo, useRef } from "react";
import { useFrame } from "@react-three/fiber";
import { useGLTF } from "@react-three/drei";
import { Box3, Vector3, type Group, type Object3D } from "three";
import type { HeroProgress } from "@/lib/hero-progress";

/**
 * Swap seam for real CAD (Route A): drop a Draco-compressed GLB exported per
 * scripts/convert-step-to-glb.md and set NEXT_PUBLIC_HERO_MODEL_URL. The file
 * must follow the same node contract as the procedural model: a node named
 * "piston" that extends along its local +Y axis, and (optionally) "barrel"
 * used to derive the stroke length (40% of the barrel's Y extent).
 */
export function GlbCylinder({
  url,
  progress,
  idle,
}: {
  url: string;
  progress: HeroProgress;
  idle: { current: boolean };
}) {
  const { scene } = useGLTF(url, true); // true = Draco decoder enabled
  const root = useRef<Group>(null);

  // Clone so repeated mounts (locale switches) never mutate the GLTF cache.
  const model = useMemo(() => scene.clone(true), [scene]);

  // Node lookups live in refs: useFrame mutates the piston's transform every
  // frame, and render-scoped (memoized) values must stay immutable.
  const piston = useRef<Object3D | null>(null);
  const pistonBaseY = useRef(0);
  const stroke = useRef(1);

  useEffect(() => {
    piston.current = model.getObjectByName("piston") ?? null;
    pistonBaseY.current = piston.current?.position.y ?? 0;
    const barrel = model.getObjectByName("barrel");
    stroke.current = barrel
      ? new Box3().setFromObject(barrel).getSize(new Vector3()).y * 0.4
      : 1;
    if (!piston.current) {
      console.warn(`[hero] GLB at ${url} has no node named "piston" — stroke animation disabled.`);
    }
  }, [model, url]);

  useFrame((_, delta) => {
    if (idle.current && root.current) {
      root.current.rotation.y += delta * 0.05;
    }
    if (piston.current) {
      const t = Math.min(Math.max((progress.value - 0.1) / 0.8, 0), 1);
      const eased = t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
      piston.current.position.y = pistonBaseY.current + eased * stroke.current;
    }
  });

  return (
    <group rotation={[0.12, 0, 0.9]} position={[0.2, -0.55, 0]}>
      <group ref={root}>
        <primitive object={model} />
      </group>
    </group>
  );
}
