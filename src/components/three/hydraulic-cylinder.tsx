"use client";

import { useRef } from "react";
import { useFrame } from "@react-three/fiber";
import type { Group } from "three";
import type { HeroProgress } from "@/lib/hero-progress";

/*
 * Procedural hydraulic cylinder — Route C from the design report §2.4: a
 * stylized assembly built from three.js primitives so we ship a signature 3D
 * object with zero licensing and a tiny payload, while real CAD (Route A) is
 * converted (see scripts/convert-step-to-glb.md).
 *
 * WebGL materials can't read CSS custom properties, so the brand tokens from
 * globals.css are mirrored here as the only allowed hardcoded colors:
 *   STEEL  = --color-steel  (#1f3a63)   ORANGE = --color-safety-orange (#d03302)
 */
const STEEL = "#1f3a63";
const STEEL_BRIGHT = "#2c4a7c"; // barrel tube: STEEL lifted for PBR shading
const CHROME = "#e8ecf2";
const ORANGE = "#d03302";

export const BARREL_LENGTH = 2.4;
/** Piston travel — 40% of the barrel length, per workstream 08 B3. */
export const PISTON_STROKE = BARREL_LENGTH * 0.4;

/** Mechanical ease (power2.inOut) applied to the piston stroke. */
function easeInOutQuad(t: number) {
  return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
}

/**
 * Group hierarchy contract (shared with the GLB swap seam — see
 * glb-cylinder.tsx): `assembly` > `barrel` + `piston`, where `piston` is
 * independently translatable along local +Y (the extension axis).
 */
export function HydraulicCylinder({
  progress,
  idle,
}: {
  progress: HeroProgress;
  /** Ref-like flag: idle rotation only advances while the hero is in view. */
  idle: { current: boolean };
}) {
  const assembly = useRef<Group>(null);
  const piston = useRef<Group>(null);

  useFrame((_, delta) => {
    // Idle motion (report B2): slow y-rotation at 0.05 rad/s while in view.
    if (idle.current && assembly.current) {
      assembly.current.rotation.y += delta * 0.05;
    }
    // Scroll-driven stroke: extend over the 0.1–0.9 band of the hero scrub.
    if (piston.current) {
      const t = Math.min(Math.max((progress.value - 0.1) / 0.8, 0), 1);
      piston.current.position.y = easeInOutQuad(t) * PISTON_STROKE;
    }
  });

  return (
    // Diagonal presentation pose; the inner assembly owns the idle spin.
    <group rotation={[0.12, 0, 0.9]} position={[0.2, -0.55, 0]}>
      <group name="assembly" ref={assembly}>
        <group name="barrel">
          {/* barrel tube — brushed steel */}
          <mesh>
            <cylinderGeometry args={[0.5, 0.5, BARREL_LENGTH, 48]} />
            <meshStandardMaterial color={STEEL_BRIGHT} metalness={0.9} roughness={0.35} />
          </mesh>
          {/* end caps */}
          {[-BARREL_LENGTH / 2, BARREL_LENGTH / 2].map((y) => (
            <mesh key={y} position={[0, y, 0]}>
              <cylinderGeometry args={[0.56, 0.56, 0.18, 48]} />
              <meshStandardMaterial color={STEEL} metalness={0.85} roughness={0.45} />
            </mesh>
          ))}
          {/* safety-orange accent ring under the rod-end cap */}
          <mesh position={[0, BARREL_LENGTH / 2 - 0.16, 0]} rotation={[Math.PI / 2, 0, 0]}>
            <torusGeometry args={[0.53, 0.035, 16, 64]} />
            <meshStandardMaterial color={ORANGE} metalness={0.6} roughness={0.4} />
          </mesh>
          {/* two port fittings (cylinder + torus collar) on the -x flank */}
          {[-0.85, -0.35].map((y) => (
            <group key={y} position={[0.55, y, 0]} rotation={[0, 0, Math.PI / 2]}>
              <mesh position={[0, 0.12, 0]}>
                <cylinderGeometry args={[0.09, 0.09, 0.28, 24]} />
                <meshStandardMaterial color={STEEL} metalness={0.9} roughness={0.3} />
              </mesh>
              <mesh position={[0, 0.2, 0]} rotation={[Math.PI / 2, 0, 0]}>
                <torusGeometry args={[0.1, 0.028, 12, 32]} />
                <meshStandardMaterial color={CHROME} metalness={0.95} roughness={0.2} />
              </mesh>
            </group>
          ))}
        </group>

        <group name="piston" ref={piston}>
          {/* piston rod — chrome */}
          <mesh position={[0, 1.5, 0]}>
            <cylinderGeometry args={[0.16, 0.16, 1.6, 32]} />
            <meshStandardMaterial color={CHROME} metalness={1} roughness={0.08} />
          </mesh>
          {/* rod-end eye */}
          <mesh position={[0, 2.42, 0]}>
            <torusGeometry args={[0.17, 0.07, 16, 40]} />
            <meshStandardMaterial color={STEEL} metalness={0.85} roughness={0.4} />
          </mesh>
        </group>
      </group>
    </group>
  );
}
