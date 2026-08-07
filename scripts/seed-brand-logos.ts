/**
 * Seeds partner (manufacturer) and customer logos from the originals dropped in
 * public/content/more_images into Supabase Storage, then points the DB rows at
 * them. Conversion to webp + the thumb/card/detail variants is done by
 * uploadImageVariants, exactly as the admin upload path does, so seeded logos
 * are indistinguishable from admin-uploaded ones.
 *
 * Safe to re-run: a row that already has a logo is skipped. Pass FORCE=1 to
 * re-upload and replace existing logos.
 *
 * Note the split — manufacturers are the brands we distribute (shown on
 * /partners); client logos are the OEMs we supply (shown in the homepage
 * customer strip). KFI is a certifying body, not either, so its mark stays a
 * static asset under public/content/fire.
 */
import { config } from "dotenv";
config({ path: ".env.local" });
import { readFile } from "fs/promises";
import path from "path";
import { db } from "../src/db/client";
import { manufacturers, clientLogos } from "../src/db/schema";
import { uploadImageVariants } from "../src/lib/image-upload";
import { eq } from "drizzle-orm";

const SRC = path.join(process.cwd(), "public", "content", "more_images");
const FORCE = process.env.FORCE === "1";

/** manufacturer slug (see scripts/seed-starter-data.ts) → logo file */
const PARTNER_LOGOS: Record<string, string> = {
  alco: "ALCO_logo.png",
  "big-fire-ventilation": "BIG_logo.png",
  dynaset: "DYNASET_logo.png",
  "elkhart-brass": "ELKHARTBRASS_logo.png",
  euroswitch: "EUROSWITCH_logo.jpg",
  gemels: "GEMELS_logo.jfif",
  godiva: "GODIVA_logo.png",
  hale: "HALE_logo.png",
  hydraforce: "HYDRAFORCE_logo.png",
  moveco: "MOVECO_logo.png",
  oleoweb: "OLEOWEB_logo.png",
  rehobot: "REHOBOT_logo.webp",
  rexroth: "REXROTH_logo.webp",
  "smart-sensor": "SMARTSENSOR_logo.png",
  "water-hydraulics": "THE_WATER_HYDRAULICS_logo.png",
  webtec: "WEBTEC_logo.png",
  wlp: "WLP_logo.png",
};

/** Fire-truck OEM customers named in the fire-safety content. */
const CLIENT_LOGOS: { name: string; file: string; sortOrder: number }[] = [
  { name: "현대에버다임", file: "HYUNDAI_EVERDIGM_logo.png", sortOrder: 10 },
  { name: "현대로템", file: "HYUNDAI_ROTEM_logo.png", sortOrder: 11 },
  { name: "우리특장", file: "Woori_특장_logo.png", sortOrder: 12 },
  { name: "한서정공", file: "한서정공_logo.png", sortOrder: 13 },
  { name: "진우SMC", file: "진우SMC_logo.png", sortOrder: 14 },
];

async function uploadLogo(bucket: "partner-logos" | "client-logos", file: string) {
  const buffer = await readFile(path.join(SRC, file));
  const { cardPath } = await uploadImageVariants(bucket, new File([buffer], file));
  return cardPath;
}

async function main() {
  console.log(`Seeding brand logos from ${SRC}${FORCE ? " (FORCE: replacing existing)" : ""}`);

  console.log("\nPartner logos → /partners");
  for (const [slug, file] of Object.entries(PARTNER_LOGOS)) {
    const [row] = await db.select().from(manufacturers).where(eq(manufacturers.slug, slug));
    if (!row) {
      console.log(`  ! ${slug} — no manufacturer row, skipped (run db:seed first)`);
      continue;
    }
    if (row.logoPath && !FORCE) {
      console.log(`  = ${slug} — already has a logo, skipped`);
      continue;
    }
    const logoPath = await uploadLogo("partner-logos", file);
    await db.update(manufacturers).set({ logoPath, updatedAt: new Date() }).where(eq(manufacturers.id, row.id));
    console.log(`  + ${slug} ← ${file}`);
  }

  console.log("\nCustomer logos → homepage client strip");
  for (const { name, file, sortOrder } of CLIENT_LOGOS) {
    const [row] = await db.select().from(clientLogos).where(eq(clientLogos.name, name));
    if (row && !FORCE) {
      console.log(`  = ${name} — already present, skipped`);
      continue;
    }
    const logoPath = await uploadLogo("client-logos", file);
    if (row) {
      await db.update(clientLogos).set({ logoPath }).where(eq(clientLogos.id, row.id));
      console.log(`  ~ ${name} ← ${file}`);
    } else {
      await db.insert(clientLogos).values({ name, logoPath, sortOrder });
      console.log(`  + ${name} ← ${file}`);
    }
  }

  console.log("\nDone.");
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
