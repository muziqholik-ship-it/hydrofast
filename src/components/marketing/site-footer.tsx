import { useLocale, useTranslations } from "next-intl";
import { Link } from "@/i18n/navigation";
import { COMPANY } from "@/lib/company";

export function SiteFooter() {
  const t = useTranslations("footer");
  const tNav = useTranslations("nav");
  const locale = useLocale();
  const ko = locale === "ko";

  return (
    <footer className="border-t border-[var(--color-border)] bg-[var(--color-surface-alt)]">
      <div className="mx-auto max-w-[1400px] px-6 py-14 grid gap-10 md:grid-cols-[1.2fr_1fr_1fr]">
        <div>
          <div className="flex items-center gap-2 font-bold tracking-tight text-lg mb-4">
            <span className="text-[var(--color-steel-light)]">HYDRO</span>
            <span className="text-[var(--color-safety-orange)]">FAST</span>
          </div>
          <p className="text-sm text-[var(--color-ink-soft)] leading-relaxed">
            {t("ceo", { value: ko ? COMPANY.ceoKo : COMPANY.ceoEn })}
            <br />
            {t("registration", { value: COMPANY.registrationNumber })}
            <br />
            {t("address", { value: ko ? COMPANY.addressKo : COMPANY.addressEn })}
          </p>
        </div>

        <div className="text-sm text-[var(--color-ink-soft)] leading-relaxed">
          <p>
            <a href={`tel:${COMPANY.phone}`} className="hover:text-[var(--color-ink)]">
              {t("phone", { value: COMPANY.phone })}
            </a>
          </p>
          <p>{t("fax", { value: COMPANY.fax })}</p>
          <p>
            <a href={`mailto:${COMPANY.email}`} className="hover:text-[var(--color-ink)]">
              {t("email", { value: COMPANY.email })}
            </a>
          </p>
          <p className="mt-2">{t("businessHours")}</p>
        </div>

        <nav className="flex flex-col gap-2 text-sm">
          <Link href="/about" className="hover:text-[var(--color-ink)] text-[var(--color-ink-soft)]">
            {tNav("about")}
          </Link>
          <Link href="/partners" className="hover:text-[var(--color-ink)] text-[var(--color-ink-soft)]">
            {tNav("partners")}
          </Link>
          <Link href="/products" className="hover:text-[var(--color-ink)] text-[var(--color-ink-soft)]">
            {tNav("products")}
          </Link>
          <Link href="/contact" className="hover:text-[var(--color-ink)] text-[var(--color-ink-soft)]">
            {tNav("contact")}
          </Link>
          <Link href="/privacy" className="hover:text-[var(--color-ink)] text-[var(--color-ink-soft)]">
            {t("privacy")}
          </Link>
        </nav>
      </div>
      <div className="border-t border-[var(--color-border)] py-4 text-center text-xs text-[var(--color-ink-soft)]">
        {t("copyright")}
      </div>
    </footer>
  );
}
