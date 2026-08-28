/**
 * Upserts only the Technofast catalog extracted from the 2026 brochure.
 * Existing products from every other manufacturer are left untouched.
 */
import { config } from "dotenv";
config({ path: ".env.local" });

import { readFile } from "fs/promises";
import path from "path";
import { eq } from "drizzle-orm";
import { db } from "../src/db/client";
import {
  businessAreas,
  manufacturerBusinessAreas,
  manufacturers,
  productCategories,
  productImages,
  products,
} from "../src/db/schema";
import type { SpecFieldDef } from "../src/db/schema/product-categories";
import { buildSearchText } from "../src/lib/search";
import { deleteImageVariants } from "../src/lib/image-upload";

interface CatalogCategory {
  slug: string;
  nameKo: string;
  nameEn?: string;
  descriptionKo?: string;
  descriptionEn?: string;
  specSchema: SpecFieldDef[];
}

interface CatalogProduct {
  slug: string;
  modelNo?: string;
  categorySlug: string;
  nameKo: string;
  nameEn?: string;
  shortDescriptionKo?: string;
  shortDescriptionEn?: string;
  descriptionKo?: string;
  descriptionEn?: string;
  specs: Record<string, string | number | boolean>;
}

interface TechnofastCatalog {
  manufacturer: {
    slug: "technofast";
    name: string;
    country?: string;
    websiteUrl?: string;
    descriptionKo?: string;
    descriptionEn?: string;
  };
  categories: CatalogCategory[];
  products: CatalogProduct[];
}

async function main() {
  const source = path.join(
    process.cwd(),
    "assets-src",
    "catalogs",
    "extracted",
    "technofast.json"
  );
  const catalog = JSON.parse(await readFile(source, "utf8")) as TechnofastCatalog;

  if (catalog.manufacturer.slug !== "technofast") {
    throw new Error("Refusing to seed a non-Technofast catalog");
  }
  if (catalog.products.length !== 20) {
    throw new Error(`Expected 20 Technofast products, found ${catalog.products.length}`);
  }

  const [area] = await db
    .select()
    .from(businessAreas)
    .where(eq(businessAreas.slug, "bolting-torque"));
  if (!area) throw new Error('Business area "bolting-torque" does not exist');

  const now = new Date();
  const [manufacturer] = await db
    .insert(manufacturers)
    .values({
      ...catalog.manufacturer,
      isActive: true,
      sortOrder: 10,
    })
    .onConflictDoUpdate({
      target: manufacturers.slug,
      set: {
        name: catalog.manufacturer.name,
        country: catalog.manufacturer.country,
        websiteUrl: catalog.manufacturer.websiteUrl,
        descriptionKo: catalog.manufacturer.descriptionKo,
        descriptionEn: catalog.manufacturer.descriptionEn,
        isActive: true,
        updatedAt: now,
      },
    })
    .returning();

  await db
    .insert(manufacturerBusinessAreas)
    .values({ manufacturerId: manufacturer.id, businessAreaId: area.id })
    .onConflictDoNothing();

  const currentSlugs = new Set(catalog.products.map((product) => product.slug));
  const previousProducts = await db
    .select()
    .from(products)
    .where(eq(products.manufacturerId, manufacturer.id));
  for (const previous of previousProducts) {
    if (currentSlugs.has(previous.slug)) continue;
    const previousImages = await db
      .select()
      .from(productImages)
      .where(eq(productImages.productId, previous.id));
    for (const image of previousImages) {
      await deleteImageVariants("product-images", image.storagePath);
    }
    await db.delete(products).where(eq(products.id, previous.id));
    console.log(`Removed obsolete Technofast product: ${previous.slug}`);
  }

  const categoriesBySlug = new Map<string, typeof productCategories.$inferSelect>();
  for (const [index, category] of catalog.categories.entries()) {
    const [row] = await db
      .insert(productCategories)
      .values({
        ...category,
        businessAreaId: area.id,
        sortOrder: 100 + index,
      })
      .onConflictDoUpdate({
        target: productCategories.slug,
        set: {
          businessAreaId: area.id,
          nameKo: category.nameKo,
          nameEn: category.nameEn,
          descriptionKo: category.descriptionKo,
          descriptionEn: category.descriptionEn,
          specSchema: category.specSchema,
          sortOrder: 100 + index,
          updatedAt: now,
        },
      })
      .returning();
    categoriesBySlug.set(row.slug, row);
  }

  for (const [index, product] of catalog.products.entries()) {
    const category = categoriesBySlug.get(product.categorySlug);
    if (!category) throw new Error(`Unknown category ${product.categorySlug}`);

    const values = {
      slug: product.slug,
      modelNo: product.modelNo,
      manufacturerId: manufacturer.id,
      categoryId: category.id,
      businessAreaId: area.id,
      nameKo: product.nameKo,
      nameEn: product.nameEn,
      shortDescriptionKo: product.shortDescriptionKo,
      shortDescriptionEn: product.shortDescriptionEn,
      descriptionKo: product.descriptionKo,
      descriptionEn: product.descriptionEn,
      specs: product.specs,
      isPublished: true,
      sortOrder: index,
      searchText: buildSearchText({
        ...product,
        manufacturerName: manufacturer.name,
        categoryNameKo: category.nameKo,
        categoryNameEn: category.nameEn,
        specSchema: category.specSchema,
      }),
    };

    await db
      .insert(products)
      .values(values)
      .onConflictDoUpdate({
        target: products.slug,
        set: { ...values, updatedAt: now },
      });
  }

  const seededProducts = await db
    .select()
    .from(products)
    .where(eq(products.manufacturerId, manufacturer.id));
  const seededImages = await db
    .select({ id: productImages.id })
    .from(productImages)
    .innerJoin(products, eq(productImages.productId, products.id))
    .where(eq(products.manufacturerId, manufacturer.id));

  console.log(
    `Technofast catalog seeded: 1 manufacturer, ${catalog.categories.length} categories, ` +
      `${seededProducts.length} products, ` +
      `${seededProducts.filter((product) => product.primaryImagePath).length} primary images, ` +
      `${seededImages.length} image rows.`
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
