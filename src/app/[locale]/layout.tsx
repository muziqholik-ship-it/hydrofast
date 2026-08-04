import type { Metadata } from "next";
import localFont from "next/font/local";
import { NextIntlClientProvider, hasLocale } from "next-intl";
import { getTranslations } from "next-intl/server";
import { notFound } from "next/navigation";
import { routing, type Locale } from "@/i18n/routing";
import { SiteHeader } from "@/components/marketing/site-header";
import { SiteFooter } from "@/components/marketing/site-footer";
import { MotionProvider } from "@/components/motion-provider";
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
    <html lang={locale} className={`${pretendard.variable} h-full antialiased`}>
      <body className="min-h-full flex flex-col bg-[var(--color-surface)] text-[var(--color-ink)]">
        <JsonLd data={organizationJsonLd} />
        <NextIntlClientProvider>
          <MotionProvider>
            <SiteHeader areas={navAreas} />
            <main className="flex-1">{children}</main>
            <SiteFooter />
          </MotionProvider>
        </NextIntlClientProvider>
      </body>
    </html>
  );
}
