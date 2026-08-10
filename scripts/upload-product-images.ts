/**
 * Uploads the catalog-cropped product photos in assets-src/product-images/ to
 * the product-images bucket and points the DB rows at them.
 *
 * Pipeline: scripts/extract-product-images.py crops the webps and writes
 * manifest.json → scripts/build-product-image-review.py renders a contact sheet
 * for a human pass → this script ships whatever survived that review.
 *
 * Conversion to the thumb/card/detail variants goes through uploadImageVariants,
 * exactly as the admin upload path does, so seeded photos are indistinguishable
 * from admin-uploaded ones. Each product also gets a product_images row marked
 * primary, matching what the admin form writes.
 *
 * Safe to re-run: a product that already has primaryImagePath is skipped.
 *   npx tsx scripts/upload-product-images.ts --dry-run
 *   npx tsx scripts/upload-product-images.ts --only webtec,dynaset
 *   npx tsx scripts/upload-product-images.ts            # everything pending
 *   FORCE=1 npx tsx scripts/upload-product-images.ts    # replace existing
 */
import { config } from "dotenv";
config({ path: ".env.local" });
import { readFile } from "fs/promises";
import path from "path";
import { db } from "../src/db/client";
import { products, productImages } from "../src/db/schema";
import { uploadImageVariants, deleteImageVariants } from "../src/lib/image-upload";
import { eq } from "drizzle-orm";

const SRC = path.join(process.cwd(), "assets-src", "product-images");
const FORCE = process.env.FORCE === "1";

const argv = process.argv.slice(2);
const DRY_RUN = argv.includes("--dry-run");
const onlyArg = argv.find((a) => a.startsWith("--only"));
const ONLY = onlyArg
  ? new Set((onlyArg.split("=")[1] ?? argv[argv.indexOf(onlyArg) + 1] ?? "").split(",").filter(Boolean))
  : null;

/**
 * Storage occasionally answers a 504 mid-run. Without this a single timeout
 * aborts the whole remaining queue — the first run died at 496 of 602 that way.
 *
 * The retry restarts uploadImageVariants from the top, and that call allocates
 * a fresh UUID prefix each time, so an attempt that failed on its 2nd or 3rd
 * variant leaves the earlier blobs orphaned under the abandoned prefix. They
 * are unreferenced and harmless; run FORCE=1 only if you want them cleaned up
 * along with a full replace.
 */
async function withRetry<T>(label: string, fn: () => Promise<T>, attempts = 4): Promise<T> {
  for (let i = 1; ; i++) {
    try {
      return await fn();
    } catch (err) {
      if (i >= attempts) throw err;
      const wait = 1000 * 2 ** (i - 1);
      console.log(`  ~ ${label} failed (attempt ${i}/${attempts}), retrying in ${wait}ms — ${err}`);
      await new Promise((r) => setTimeout(r, wait));
    }
  }
}

interface ManifestEntry {
  slug: string;
  manufacturer: string;
  modelNo: string | null;
  nameKo?: string | null;
  nameEn?: string | null;
  file: string | null;
  status: string;
  /** set by build-product-image-review.py when a reviewer rejects the crop */
  rejected?: boolean;
}

async function main() {
  const manifest: ManifestEntry[] = JSON.parse(
    await readFile(path.join(SRC, "manifest.json"), "utf8")
  );

  const pending = manifest.filter(
    (m) => m.file && !m.rejected && (!ONLY || ONLY.has(m.manufacturer))
  );
  console.log(
    `${pending.length} of ${manifest.length} manifest entries have a reviewed crop` +
      `${ONLY ? ` (filtered to ${[...ONLY].join(", ")})` : ""}` +
      `${DRY_RUN ? " — DRY RUN, nothing will be written" : ""}` +
      `${FORCE ? " — FORCE: replacing existing images" : ""}`
  );

  let uploaded = 0;
  let skipped = 0;
  let missing = 0;

  for (const entry of pending) {
    const [row] = await db.select().from(products).where(eq(products.slug, entry.slug));
    if (!row) {
      console.log(`  ! ${entry.slug} — no product row, skipped`);
      missing += 1;
      continue;
    }
    if (row.primaryImagePath && !FORCE) {
      skipped += 1;
      continue;
    }
    if (DRY_RUN) {
      console.log(`  · ${entry.slug} ← ${entry.file}`);
      uploaded += 1;
      continue;
    }

    const buffer = await readFile(path.join(SRC, entry.file!));
    const { cardPath } = await withRetry(entry.slug, () =>
      uploadImageVariants(
        "product-images",
        new File([buffer], path.basename(entry.file!), { type: "image/webp" })
      )
    );

    // Replacing: drop the old blobs and the old rows so we don't leak storage
    // or leave two primaries behind.
    if (row.primaryImagePath && FORCE) {
      const previous = await db
        .select()
        .from(productImages)
        .where(eq(productImages.productId, row.id));
      for (const old of previous) {
        await deleteImageVariants("product-images", old.storagePath);
      }
      await db.delete(productImages).where(eq(productImages.productId, row.id));
    }

    await db.insert(productImages).values({
      productId: row.id,
      storagePath: cardPath,
      altKo: entry.nameKo ?? row.nameKo,
      altEn: entry.nameEn ?? row.nameEn,
      sortOrder: 0,
      isPrimary: true,
    });
    await db
      .update(products)
      .set({ primaryImagePath: cardPath, updatedAt: new Date() })
      .where(eq(products.id, row.id));

    uploaded += 1;
    if (uploaded % 25 === 0) console.log(`  … ${uploaded} uploaded`);
  }

  console.log(
    `\nDone. uploaded=${uploaded} already-had-image=${skipped} no-product-row=${missing}`
  );
}

main()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error(err);
    process.exit(1);
  });
