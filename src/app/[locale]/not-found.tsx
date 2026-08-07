import { getTranslations } from "next-intl/server";
import { Link } from "@/i18n/navigation";

export default async function NotFound() {
  const t = await getTranslations("notFound");

  return (
    <section className="mx-auto flex max-w-[1400px] flex-col items-center px-6 py-32 text-center">
      <div className="font-mono text-7xl font-bold tracking-tight text-[var(--color-steel-light)] md:text-8xl">
        404
      </div>
      <p className="mt-4 text-base text-[var(--color-ink-soft)]">{t("message")}</p>
      <div className="mt-10 flex flex-wrap justify-center gap-4">
        <Link
          href="/"
          className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] px-6 py-3 text-sm font-semibold text-white transition-transform hover:-translate-y-0.5"
        >
          {t("backHome")}
        </Link>
        <Link
          href="/products"
          className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-6 py-3 text-sm font-semibold text-[var(--color-ink)] transition-transform hover:-translate-y-0.5"
        >
          {t("searchProducts")}
        </Link>
      </div>
    </section>
  );
}
