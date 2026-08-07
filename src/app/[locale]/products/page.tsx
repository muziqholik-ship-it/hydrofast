import { getLocale, getTranslations } from "next-intl/server";
import { db } from "@/db/client";
import { products, manufacturers, productCategories, businessAreas } from "@/db/schema";
import type { SpecFieldDef } from "@/db/schema/product-categories";
import { eq, and, asc, sql, type SQL } from "drizzle-orm";
import { ProductCard } from "@/components/marketing/product-card";
import { ProductListItem, type ProductListItemData } from "@/components/marketing/product-list-item";
import { RevealGrid, RevealGridItem } from "@/components/marketing/reveal-grid";
import { SectionHeading } from "@/components/marketing/section-heading";
import { Link } from "@/i18n/navigation";
import type { Locale } from "@/i18n/routing";
import type { Metadata } from "next";
import { pageMetadata } from "@/lib/seo";

export const dynamic = "force-dynamic";

const PAGE_SIZE = 24;

export async function generateMetadata(): Promise<Metadata> {
  const locale = (await getLocale()) as Locale;
  const t = await getTranslations("meta.products");
  return pageMetadata({ locale, path: "/products", title: t("title"), description: t("description") });
}

function buildTeaser(specSchema: SpecFieldDef[], specs: Record<string, unknown>, locale: Locale) {
  const teaserFields = specSchema.filter((f) => f.showInCardTeaser);
  const parts = teaserFields.map((f) => {
    const value = specs[f.key];
    if (value === undefined || value === null || value === "") return null;
    const label = locale === "ko" ? f.labelKo : f.labelEn ?? f.labelKo;
    if (f.dataType === "select") {
      const opt = f.options?.find((o) => o.value === String(value));
      const optLabel = opt ? (locale === "ko" ? opt.labelKo : opt.labelEn ?? opt.labelKo) : value;
      return `${label}: ${optLabel}`;
    }
    const unit = f.unit ? ` ${f.unit}` : "";
    return `${label}: ${value}${unit}`;
  });
  return parts.filter(Boolean).join(" · ") || null;
}

function buildHref(params: Record<string, string | undefined>) {
  const sp = new URLSearchParams();
  for (const [key, value] of Object.entries(params)) {
    if (value) sp.set(key, value);
  }
  const qs = sp.toString();
  return qs ? `/products?${qs}` : "/products";
}

/** Page numbers to render: first, last, and a window around the current page, with gaps. */
function pageNumbers(current: number, total: number): (number | "gap")[] {
  const wanted = new Set([1, total, current - 1, current, current + 1]);
  const sorted = [...wanted].filter((p) => p >= 1 && p <= total).sort((a, b) => a - b);
  const out: (number | "gap")[] = [];
  let prev = 0;
  for (const p of sorted) {
    if (prev && p - prev > 1) out.push("gap");
    out.push(p);
    prev = p;
  }
  return out;
}

export default async function ProductsPage({
  searchParams,
}: {
  searchParams: Promise<{ q?: string; category?: string; manufacturer?: string; area?: string; view?: string; page?: string }>;
}) {
  const { q, category, manufacturer, area, view, page } = await searchParams;
  const locale = (await getLocale()) as Locale;
  const tCommon = await getTranslations("common");

  const viewMode = view === "list" ? "list" : "card";

  const [categories, manufacturersList, areas] = await Promise.all([
    db.select().from(productCategories).orderBy(asc(productCategories.sortOrder)),
    db.select().from(manufacturers).orderBy(asc(manufacturers.sortOrder)),
    db.select().from(businessAreas).orderBy(asc(businessAreas.sortOrder)),
  ]);

  const conditions: SQL[] = [eq(products.isPublished, true)];

  const categoryRow = category ? categories.find((c) => c.slug === category) : undefined;
  if (categoryRow) conditions.push(eq(products.categoryId, categoryRow.id));

  const manufacturerRow = manufacturer ? manufacturersList.find((m) => m.slug === manufacturer) : undefined;
  if (manufacturerRow) conditions.push(eq(products.manufacturerId, manufacturerRow.id));

  const areaRow = area ? areas.find((a) => a.slug === area) : undefined;
  if (areaRow) conditions.push(eq(products.businessAreaId, areaRow.id));

  const qLower = q?.trim().toLowerCase();
  if (qLower) {
    conditions.push(
      sql`(${products.searchText} ILIKE ${"%" + qLower + "%"} OR similarity(${products.searchText}, ${qLower}) > 0.15)`
    );
  }

  const [{ total }] = await db
    .select({ total: sql<number>`count(*)::int` })
    .from(products)
    .where(and(...conditions));

  const totalPages = Math.max(1, Math.ceil(total / PAGE_SIZE));
  const parsedPage = Number.parseInt(page ?? "1", 10);
  const currentPage = Math.min(Math.max(Number.isNaN(parsedPage) ? 1 : parsedPage, 1), totalPages);

  const rows = await db
    .select({
      id: products.id,
      slug: products.slug,
      nameKo: products.nameKo,
      nameEn: products.nameEn,
      modelNo: products.modelNo,
      primaryImagePath: products.primaryImagePath,
      specs: products.specs,
      manufacturerName: manufacturers.name,
      categorySpecSchema: productCategories.specSchema,
    })
    .from(products)
    .leftJoin(manufacturers, eq(products.manufacturerId, manufacturers.id))
    .leftJoin(productCategories, eq(products.categoryId, productCategories.id))
    .where(and(...conditions))
    .orderBy(qLower ? sql`similarity(${products.searchText}, ${qLower}) DESC` : asc(products.sortOrder))
    .limit(PAGE_SIZE)
    .offset((currentPage - 1) * PAGE_SIZE);

  const items: ProductListItemData[] = rows.map((row) => ({
    id: row.id,
    slug: row.slug,
    name: locale === "ko" ? row.nameKo : row.nameEn ?? row.nameKo,
    modelNo: row.modelNo,
    manufacturerName: row.manufacturerName,
    primaryImagePath: row.primaryImagePath,
    teaser: buildTeaser(row.categorySpecSchema ?? [], row.specs, locale),
  }));

  // Shared query state for view-toggle / pagination links; page resets when the view changes.
  const baseQuery = { q, category, manufacturer, area };
  const pageHref = (p: number) =>
    buildHref({ ...baseQuery, view: viewMode === "list" ? "list" : undefined, page: p > 1 ? String(p) : undefined });

  const toggleBtnBase =
    "inline-flex items-center gap-1.5 rounded-md px-3 py-2 text-xs font-semibold transition-colors";
  const toggleActive = "bg-[var(--color-steel-light)] text-white";
  const toggleInactive = "text-[var(--color-ink-soft)] hover:text-[var(--color-ink)]";

  return (
    <div className="mx-auto max-w-[1400px] px-6 py-16">
      <SectionHeading title={tCommon("search")} as="h1" />

      <form action="/products" className="mb-6 flex flex-wrap gap-3">
        {viewMode === "list" && <input type="hidden" name="view" value="list" />}
        <input
          type="text"
          name="q"
          defaultValue={q ?? ""}
          placeholder={tCommon("searchPlaceholder")}
          className="min-w-[16rem] flex-1 rounded-[var(--radius-card)] border border-[var(--color-border)] px-4 py-3 text-sm"
        />
        <select name="category" defaultValue={category ?? ""} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-3 text-sm">
          <option value="">{tCommon("filterByCategory")}</option>
          {categories.map((c) => (
            <option key={c.id} value={c.slug}>
              {locale === "ko" ? c.nameKo : c.nameEn ?? c.nameKo}
            </option>
          ))}
        </select>
        <select name="manufacturer" defaultValue={manufacturer ?? ""} className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-3 text-sm">
          <option value="">{tCommon("filterByManufacturer")}</option>
          {manufacturersList.map((m) => (
            <option key={m.id} value={m.slug}>
              {m.name}
            </option>
          ))}
        </select>
        <button type="submit" className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] px-6 py-3 text-sm font-semibold text-white">
          {tCommon("search")}
        </button>
      </form>

      <div className="mb-6 flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-[var(--color-ink-soft)]">{tCommon("resultsCount", { count: total })}</p>
        <div className="flex items-center gap-1 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-1">
          <Link
            href={buildHref(baseQuery)}
            aria-current={viewMode === "card" ? "true" : undefined}
            className={`${toggleBtnBase} ${viewMode === "card" ? toggleActive : toggleInactive}`}
          >
            <svg width="14" height="14" viewBox="0 0 14 14" fill="currentColor" aria-hidden>
              <rect x="0" y="0" width="6" height="6" rx="1" />
              <rect x="8" y="0" width="6" height="6" rx="1" />
              <rect x="0" y="8" width="6" height="6" rx="1" />
              <rect x="8" y="8" width="6" height="6" rx="1" />
            </svg>
            {tCommon("cardView")}
          </Link>
          <Link
            href={buildHref({ ...baseQuery, view: "list" })}
            aria-current={viewMode === "list" ? "true" : undefined}
            className={`${toggleBtnBase} ${viewMode === "list" ? toggleActive : toggleInactive}`}
          >
            <svg width="14" height="14" viewBox="0 0 14 14" fill="currentColor" aria-hidden>
              <rect x="0" y="1" width="14" height="2.5" rx="1" />
              <rect x="0" y="5.75" width="14" height="2.5" rx="1" />
              <rect x="0" y="10.5" width="14" height="2.5" rx="1" />
            </svg>
            {tCommon("listView")}
          </Link>
        </div>
      </div>

      {items.length === 0 ? (
        <p className="py-16 text-center text-[var(--color-ink-soft)]">{tCommon("noResults")}</p>
      ) : viewMode === "list" ? (
        <RevealGrid className="flex flex-col gap-3">
          {items.map((product) => (
            <RevealGridItem key={product.id}>
              <ProductListItem product={product} />
            </RevealGridItem>
          ))}
        </RevealGrid>
      ) : (
        <RevealGrid className="grid grid-cols-2 gap-5 sm:grid-cols-3 lg:grid-cols-4">
          {items.map((product) => (
            <RevealGridItem key={product.id}>
              <ProductCard product={product} />
            </RevealGridItem>
          ))}
        </RevealGrid>
      )}

      {totalPages > 1 && (
        <nav aria-label="Pagination" className="mt-10 flex items-center justify-center gap-1.5">
          {currentPage > 1 ? (
            <Link
              href={pageHref(currentPage - 1)}
              className="rounded-md border border-[var(--color-border)] px-3 py-2 text-sm text-[var(--color-ink-soft)] transition-colors hover:border-[var(--color-steel-light)] hover:text-[var(--color-ink)]"
            >
              ←
            </Link>
          ) : (
            <span className="rounded-md border border-[var(--color-border)] px-3 py-2 text-sm text-[var(--color-border)]">←</span>
          )}
          {pageNumbers(currentPage, totalPages).map((p, i) =>
            p === "gap" ? (
              <span key={`gap-${i}`} className="px-1 text-sm text-[var(--color-ink-soft)]">
                …
              </span>
            ) : p === currentPage ? (
              <span
                key={p}
                aria-current="page"
                className="rounded-md bg-[var(--color-steel-light)] px-3.5 py-2 text-sm font-semibold text-white"
              >
                {p}
              </span>
            ) : (
              <Link
                key={p}
                href={pageHref(p)}
                className="rounded-md border border-[var(--color-border)] px-3.5 py-2 text-sm text-[var(--color-ink-soft)] transition-colors hover:border-[var(--color-steel-light)] hover:text-[var(--color-ink)]"
              >
                {p}
              </Link>
            )
          )}
          {currentPage < totalPages ? (
            <Link
              href={pageHref(currentPage + 1)}
              className="rounded-md border border-[var(--color-border)] px-3 py-2 text-sm text-[var(--color-ink-soft)] transition-colors hover:border-[var(--color-steel-light)] hover:text-[var(--color-ink)]"
            >
              →
            </Link>
          ) : (
            <span className="rounded-md border border-[var(--color-border)] px-3 py-2 text-sm text-[var(--color-border)]">→</span>
          )}
        </nav>
      )}

      <p className="mt-8 text-center text-xs text-[var(--color-ink-soft)]">
        <Link href="/partners">{tCommon("filterByManufacturer")} →</Link>
      </p>
    </div>
  );
}
