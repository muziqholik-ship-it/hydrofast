import type { MetadataRoute } from "next";
import { db } from "@/db/client";
import { products, manufacturers, businessAreas } from "@/db/schema";
import { eq } from "drizzle-orm";
import { localeUrl } from "@/lib/seo";
import { routing } from "@/i18n/routing";

const STATIC_PATHS = [
  "",
  "/business",
  "/products",
  "/partners",
  "/cases",
  "/about",
  "/affiliates",
  "/contact",
  "/privacy",
];

type EntryOptions = {
  lastModified: Date;
  changeFrequency: NonNullable<MetadataRoute.Sitemap[number]["changeFrequency"]>;
};

/**
 * One sitemap entry per locale for a logical page, each carrying hreflang
 * alternates. ko is the default locale and is emitted WITHOUT a /ko prefix
 * (localePrefix: "as-needed").
 */
function localizedEntries(path: string, { lastModified, changeFrequency }: EntryOptions): MetadataRoute.Sitemap {
  const languages = {
    ko: localeUrl("ko", path || "/"),
    en: localeUrl("en", path || "/"),
    "x-default": localeUrl("ko", path || "/"),
  };
  return routing.locales.map((locale) => ({
    url: localeUrl(locale, path || "/"),
    lastModified,
    changeFrequency,
    alternates: { languages },
  }));
}

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const buildTime = new Date();
  const entries: MetadataRoute.Sitemap = [];

  for (const p of STATIC_PATHS) {
    entries.push(...localizedEntries(p, { lastModified: buildTime, changeFrequency: "weekly" }));
  }

  try {
    const [areaRows, productRows, manufacturerRows] = await Promise.all([
      db.select({ slug: businessAreas.slug, updatedAt: businessAreas.updatedAt }).from(businessAreas),
      db
        .select({ slug: products.slug, updatedAt: products.updatedAt })
        .from(products)
        .where(eq(products.isPublished, true)),
      db
        .select({ slug: manufacturers.slug, updatedAt: manufacturers.updatedAt })
        .from(manufacturers)
        .where(eq(manufacturers.isActive, true)),
    ]);

    for (const area of areaRows) {
      entries.push(
        ...localizedEntries(`/business/${area.slug}`, {
          lastModified: area.updatedAt ?? buildTime,
          changeFrequency: "monthly",
        })
      );
    }
    for (const product of productRows) {
      entries.push(
        ...localizedEntries(`/products/${product.slug}`, {
          lastModified: product.updatedAt ?? buildTime,
          changeFrequency: "weekly",
        })
      );
    }
    for (const manufacturer of manufacturerRows) {
      entries.push(
        ...localizedEntries(`/partners/${manufacturer.slug}`, {
          lastModified: manufacturer.updatedAt ?? buildTime,
          changeFrequency: "monthly",
        })
      );
    }
  } catch {
    // DB not reachable at build/request time (e.g. DATABASE_URL not yet configured) —
    // fall back to the static paths above rather than failing the whole sitemap.
  }

  return entries;
}
