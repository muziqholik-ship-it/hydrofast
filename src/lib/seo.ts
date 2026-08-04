import type { Metadata } from "next";
import { routing, type Locale } from "@/i18n/routing";

export const SITE_URL = process.env.NEXT_PUBLIC_SITE_URL ?? "https://www.hydrofast.co.kr";

/**
 * Path for a locale honouring `localePrefix: "as-needed"` — Korean (the
 * default locale) has NO /ko prefix, English is under /en.
 */
export function localePath(locale: string, path: string): string {
  const suffix = path === "/" ? "" : path;
  if (locale === routing.defaultLocale) return suffix || "/";
  return `/${locale}${suffix}`;
}

/** Absolute URL for a locale + path (for sitemap / JSON-LD). */
export function localeUrl(locale: string, path: string): string {
  const p = localePath(locale, path);
  return p === "/" ? SITE_URL : `${SITE_URL}${p}`;
}

/**
 * Canonical + hreflang alternates for one logical page. Paths are relative;
 * they resolve against `metadataBase` set in the [locale] layout.
 */
export function alternatesFor(locale: Locale, path: string): Metadata["alternates"] {
  return {
    canonical: localePath(locale, path),
    languages: {
      ko: localePath("ko", path),
      en: localePath("en", path),
      "x-default": localePath("ko", path),
    },
  };
}

export function ogLocale(locale: Locale): string {
  return locale === "ko" ? "ko_KR" : "en_US";
}

/**
 * Standard per-page metadata: title/description, canonical + hreflang and a
 * fully-populated openGraph block (pages replace the layout's `openGraph`
 * wholesale on merge, so siteName/type/locale must be repeated here).
 *
 * Pages that define `openGraph` also lose the [locale]/opengraph-image.tsx
 * file-convention image, so when a page has no image of its own we point back
 * at that route explicitly (the ko URL serves both locales — same artwork).
 */
export function pageMetadata({
  locale,
  path,
  title,
  description,
  images,
}: {
  locale: Locale;
  path: string;
  title: string;
  description?: string;
  images?: string[];
}): Metadata {
  return {
    title,
    description,
    alternates: alternatesFor(locale, path),
    openGraph: {
      title,
      description,
      siteName: "HYDROFAST",
      type: "website",
      locale: ogLocale(locale),
      url: localePath(locale, path),
      images: images && images.length > 0 ? images : ["/opengraph-image"],
    },
  };
}
