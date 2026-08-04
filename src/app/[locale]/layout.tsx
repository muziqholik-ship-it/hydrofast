import type { Metadata } from "next";
import localFont from "next/font/local";
import { NextIntlClientProvider, hasLocale } from "next-intl";
import { getTranslations, setRequestLocale } from "next-intl/server";
import { notFound } from "next/navigation";
import { routing, type Locale } from "@/i18n/routing";
import { SiteHeader } from "@/components/marketing/site-header";
import { SiteFooter } from "@/components/marketing/site-footer";
import { MotionProvider } from "@/components/motion-provider";
import { SmoothScroll } from "@/components/motion/smooth-scroll";
import { JsonLd } from "@/components/json-ld";
import { getAllAreas } from "@/lib/areas";
import { COMPANY } from "@/lib/company";
import { SITE_URL, alternatesFor, ogLocale } from "@/lib/seo";
import "../globals.css";

const pretendard = localFont({
  src: "../../../node_modules/pretendard/dist/web/variable/woff2/PretendardVariable.woff2",
  variable: "--font-pretendard",
  weight: "45 920",
  display: "swap",
});

export async function generateMetadata({
  params,
}: {
  params: Promise<{ locale: string }>;
}): Promise<Metadata> {
  const { locale: rawLocale } = await params;
  if (!hasLocale(routing.locales, rawLocale)) return {};
  const locale = rawLocale as Locale;
  const t = await getTranslations({ locale, namespace: "meta" });

  const verification: NonNullable<Metadata["verification"]> = {};
  if (process.env.GOOGLE_SITE_VERIFICATION) {
    verification.google = process.env.GOOGLE_SITE_VERIFICATION;
  }
  if (process.env.NAVER_SITE_VERIFICATION) {
    // Naver Search Advisor expects <meta name="naver-site-verification">,
    // which the Metadata API only supports via the catch-all `other` field.
    verification.other = { "naver-site-verification": process.env.NAVER_SITE_VERIFICATION };
  }

  return {
    metadataBase: new URL(SITE_URL),
    title: {
      default: t("titleDefault"),
      template: t("titleTemplate"),
    },
    description: t("description"),
    alternates: alternatesFor(locale, "/"),
    openGraph: {
      title: t("titleDefault"),
      description: t("description"),
      siteName: "HYDROFAST",
      type: "website",
      locale: ogLocale(locale),
      url: locale === routing.defaultLocale ? "/" : `/${locale}`,
    },
    twitter: {
      card: "summary_large_image",
    },
    verification,
  };
}

export function generateStaticParams() {
  return routing.locales.map((locale) => ({ locale }));
}

export default async function LocaleLayout({
  children,
  params,
}: {
  children: React.ReactNode;
  params: Promise<{ locale: string }>;
}) {
  const { locale } = await params;
  if (!hasLocale(routing.locales, locale)) {
    notFound();
  }
  // Mirrors MOTION_LEVEL from src/lib/motion.ts (client-only module, so the
  // value is recomputed here): lets CSS-driven motion (logo marquees) go
  // static when the owner sets NEXT_PUBLIC_MOTION_LEVEL=off.
  const rawMotion = process.env.NEXT_PUBLIC_MOTION_LEVEL;
  const motionLevel = rawMotion === "off" || rawMotion === "lite" ? rawMotion : "full";
  // Enables static rendering / ISR for pages under this layout (next-intl
  // otherwise reads the locale from request headers, forcing dynamic).
  setRequestLocale(locale);

  const tNav = await getTranslations({ locale, namespace: "nav" });
  const areas = await getAllAreas();
  const navAreas = areas.map((a) => ({ slug: a.slug, nameKo: a.name.ko, nameEn: a.name.en ?? a.name.ko, accent: a.accent, index: a.index }));

  const organizationJsonLd = {
    "@context": "https://schema.org",
    "@type": ["Organization", "LocalBusiness"],
    "@id": `${SITE_URL}/#organization`,
    name: locale === "ko" ? COMPANY.legalNameKo : COMPANY.legalNameEn,
    alternateName: locale === "ko" ? COMPANY.legalNameEn : COMPANY.legalNameKo,
    url: SITE_URL,
    logo: `${SITE_URL}/opengraph-image`,
    address: {
      "@type": "PostalAddress",
      streetAddress: COMPANY.streetAddressKo,
      addressLocality: COMPANY.addressLocalityKo,
      addressRegion: COMPANY.addressRegionKo,
      addressCountry: COMPANY.addressCountry,
    },
    telephone: COMPANY.phoneIntl,
    faxNumber: COMPANY.fax,
    email: COMPANY.email,
    openingHours: COMPANY.openingHours,
    foundingDate: COMPANY.foundingDate,
  };

  return (
    <html lang={locale} data-motion={motionLevel} className={`${pretendard.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col bg-[var(--color-surface)] text-[var(--color-ink)]">
        <a
          href="#main"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[100] focus:rounded-[var(--radius-card)] focus:bg-[var(--color-steel-light)] focus:px-4 focus:py-2 focus:text-sm focus:font-semibold focus:text-white"
        >
          {tNav("skipToContent")}
        </a>
        <JsonLd data={organizationJsonLd} />
        <NextIntlClientProvider>
          <MotionProvider>
            <SiteHeader areas={navAreas} />
            <SmoothScroll>
              <main id="main" className="flex-1">{children}</main>
            </SmoothScroll>
            <SiteFooter />
          </MotionProvider>
        </NextIntlClientProvider>
      </body>
    </html>
  );
}
