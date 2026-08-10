/**
 * Slug helpers for the admin's inline "add new" flows (product form quick-add),
 * where the admin names a category/manufacturer but is not asked for a slug.
 * Korean input slugifies to an empty string by design — callers pass a fallback
 * so the row still gets a stable, URL-safe slug.
 */
export function slugify(input: string): string {
  return input
    .normalize("NFKD")
    .replace(/\p{M}/gu, "")
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

/** Same as `slugify` but for spec_schema keys, which are snake_case JSONB keys. */
export function keyify(input: string): string {
  return slugify(input).replace(/-/g, "_");
}

/** Appends a numeric suffix until the value is free among `taken`. */
export function uniqueSlug(desired: string, fallback: string, taken: string[], separator = "-"): string {
  const base = desired || fallback;
  if (!taken.includes(base)) return base;
  let n = 2;
  while (taken.includes(`${base}${separator}${n}`)) n++;
  return `${base}${separator}${n}`;
}
