"use client";

import { useEffect, useRef, useState } from "react";
import { useLocale, useTranslations } from "next-intl";
import { AnimatePresence, motion } from "framer-motion";
import { Link, usePathname, useRouter } from "@/i18n/navigation";
import type { Locale } from "@/i18n/routing";

export type NavArea = { slug: string; nameKo: string; nameEn: string; accent: string; index: string };

const NAV_LINKS = [
  { href: "/products", key: "products" },
  { href: "/partners", key: "partners" },
  { href: "/cases", key: "cases" },
  { href: "/about", key: "about" },
] as const;

const BIZ_MENU_ID = "business-areas-menu";
const MOBILE_MENU_ID = "mobile-menu";

export function SiteHeader({ areas }: { areas: NavArea[] }) {
  const tNav = useTranslations("nav");
  const locale = useLocale() as Locale;
  const pathname = usePathname();
  const [scrolled, setScrolled] = useState(false);
  const [menuOpen, setMenuOpen] = useState(false);
  const [bizOpen, setBizOpen] = useState(false);
  const bizRef = useRef<HTMLDivElement>(null);
  const bizButtonRef = useRef<HTMLButtonElement>(null);
  const menuButtonRef = useRef<HTMLButtonElement>(null);

  const areaName = (a: NavArea) => (locale === "ko" ? a.nameKo : a.nameEn);

  useEffect(() => {
    const onScroll = () => setScrolled(window.scrollY > 8);
    onScroll();
    window.addEventListener("scroll", onScroll, { passive: true });
    return () => window.removeEventListener("scroll", onScroll);
  }, []);

  // Close the mobile menu on navigation, adjusting state during render
  // instead of in an effect (react-hooks/set-state-in-effect).
  const [prevPathname, setPrevPathname] = useState(pathname);
  if (prevPathname !== pathname) {
    setPrevPathname(pathname);
    setMenuOpen(false);
    setBizOpen(false);
  }

  // Clicking/tapping outside the dropdown closes it.
  useEffect(() => {
    if (!bizOpen) return;
    const onPointerDown = (e: PointerEvent) => {
      if (bizRef.current && !bizRef.current.contains(e.target as Node)) setBizOpen(false);
    };
    document.addEventListener("pointerdown", onPointerDown);
    return () => document.removeEventListener("pointerdown", onPointerDown);
  }, [bizOpen]);

  // Body scroll lock while the mobile menu is open.
  useEffect(() => {
    if (!menuOpen) return;
    const prev = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    return () => {
      document.body.style.overflow = prev;
    };
  }, [menuOpen]);

  const onHeaderKeyDown = (e: React.KeyboardEvent) => {
    if (e.key !== "Escape") return;
    if (bizOpen) {
      setBizOpen(false);
      bizButtonRef.current?.focus();
    }
    if (menuOpen) {
      setMenuOpen(false);
      menuButtonRef.current?.focus();
    }
  };

  return (
    <motion.header
      initial={{ y: -76, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] as const }}
      onKeyDown={onHeaderKeyDown}
      className={`sticky top-0 z-50 border-b transition-colors duration-300 ${
        scrolled
          ? "bg-[var(--color-surface)]/95 backdrop-blur border-[var(--color-border)]"
          : "bg-transparent border-transparent"
      }`}
      style={{ height: "var(--nav-height)" }}
    >
      <div className="mx-auto flex h-full max-w-[1400px] items-center justify-between px-6">
        <Link href="/" className="flex items-center gap-2 font-bold tracking-tight text-lg">
          <span className="text-[var(--color-steel-light)]">HYDRO</span>
          <span className="text-[var(--color-safety-orange)]">FAST</span>
        </Link>

        <nav className="hidden lg:flex items-center gap-8 text-sm font-medium">
          <div
            ref={bizRef}
            className="relative"
            onMouseEnter={() => setBizOpen(true)}
            onMouseLeave={() => {
              // Keep the panel open while keyboard focus is inside it.
              if (!bizRef.current?.contains(document.activeElement)) setBizOpen(false);
            }}
            onBlur={(e) => {
              if (!e.currentTarget.contains(e.relatedTarget as Node)) setBizOpen(false);
            }}
          >
            {/* Label navigates to the /business overview; the caret (and hover) toggles the dropdown. */}
            <div className="flex items-center gap-0.5">
              <Link
                href="/business"
                className="text-[var(--color-ink-soft)] hover:text-[var(--color-ink)] transition-colors"
              >
                {tNav("businessAreas")}
              </Link>
              <button
                ref={bizButtonRef}
                type="button"
                aria-expanded={bizOpen}
                aria-haspopup="menu"
                aria-controls={BIZ_MENU_ID}
                aria-label={tNav("businessAreasMenu")}
                onClick={() => setBizOpen((v) => !v)}
                className="p-1 text-[var(--color-ink-soft)] hover:text-[var(--color-ink)] transition-colors"
              >
                <svg
                  aria-hidden="true"
                  viewBox="0 0 10 6"
                  className={`h-1.5 w-2.5 transition-transform ${bizOpen ? "rotate-180" : ""}`}
                >
                  <path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                </svg>
              </button>
            </div>
            <AnimatePresence>
              {bizOpen && (
                <motion.div
                  id={BIZ_MENU_ID}
                  initial={{ opacity: 0, y: 8 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: 8 }}
                  transition={{ duration: 0.18 }}
                  className="absolute left-0 top-full w-80 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-2 shadow-xl"
                >
                  {areas.map((a) => (
                    <Link
                      key={a.slug}
                      href={`/business/${a.slug}`}
                      className="flex items-center gap-3 rounded-[var(--radius-card)] px-3 py-2.5 hover:bg-[var(--color-surface-alt)] focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[var(--color-steel-light)]"
                    >
                      <span
                        className="flex h-7 w-7 shrink-0 items-center justify-center rounded-[var(--radius-card)] text-xs font-black text-white"
                        style={{ backgroundColor: a.accent }}
                      >
                        {a.index}
                      </span>
                      <span className="text-sm font-semibold text-[var(--color-ink)]">{areaName(a)}</span>
                    </Link>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </div>
          {NAV_LINKS.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="text-[var(--color-ink-soft)] hover:text-[var(--color-ink)] transition-colors"
            >
              {tNav(item.key)}
            </Link>
          ))}
        </nav>

        <div className="hidden lg:flex items-center gap-4">
          <LocaleSwitcher />
          <Link
            href="/contact"
            className="rounded-[var(--radius-card)] bg-[var(--color-safety-orange)] px-4 py-2 text-sm font-semibold text-[var(--color-safety-orange-contrast)] transition-transform hover:-translate-y-0.5"
          >
            {tNav("contact")}
          </Link>
        </div>

        <button
          ref={menuButtonRef}
          aria-label={tNav("menu")}
          aria-expanded={menuOpen}
          aria-controls={MOBILE_MENU_ID}
          className="lg:hidden flex flex-col gap-1.5 p-2"
          onClick={() => setMenuOpen((v) => !v)}
        >
          <span
            className={`block h-0.5 w-6 bg-[var(--color-ink)] transition-transform ${
              menuOpen ? "translate-y-1.5 rotate-45" : ""
            }`}
          />
          <span
            className={`block h-0.5 w-6 bg-[var(--color-ink)] transition-opacity ${
              menuOpen ? "opacity-0" : ""
            }`}
          />
          <span
            className={`block h-0.5 w-6 bg-[var(--color-ink)] transition-transform ${
              menuOpen ? "-translate-y-1.5 -rotate-45" : ""
            }`}
          />
        </button>
      </div>

      {menuOpen && (
        <motion.nav
          id={MOBILE_MENU_ID}
          initial={{ opacity: 0, height: 0 }}
          animate={{ opacity: 1, height: "auto" }}
          exit={{ opacity: 0, height: 0 }}
          className="lg:hidden border-t border-[var(--color-border)] bg-[var(--color-surface)] px-6 py-4 flex flex-col gap-4"
        >
          <div className="flex flex-col gap-1">
            <Link
              href="/business"
              className="text-xs font-semibold uppercase tracking-wide text-[var(--color-ink-soft)]"
            >
              {tNav("businessAreas")}
            </Link>
            {areas.map((a) => (
              <Link key={a.slug} href={`/business/${a.slug}`} className="flex items-center gap-2 py-1 text-sm font-medium">
                <span className="text-xs font-black" style={{ color: a.accent }}>
                  {a.index}
                </span>
                {areaName(a)}
              </Link>
            ))}
          </div>
          {NAV_LINKS.map((item) => (
            <Link key={item.href} href={item.href} className="text-sm font-medium">
              {tNav(item.key)}
            </Link>
          ))}
          <Link href="/contact" className="text-sm font-semibold text-[var(--color-safety-orange)]">
            {tNav("contact")}
          </Link>
          <LocaleSwitcher />
        </motion.nav>
      )}
    </motion.header>
  );
}

function LocaleSwitcher() {
  const t = useTranslations("nav");
  const pathname = usePathname();
  const router = useRouter();
  const locale = useLocale();
  const nextLocale = locale === "ko" ? "en" : "ko";

  return (
    <button
      type="button"
      aria-label={t("langSwitchLabel")}
      onClick={() => router.replace(pathname, { locale: nextLocale })}
      className="text-sm font-semibold text-[var(--color-ink-soft)] hover:text-[var(--color-ink)]"
    >
      <span lang={nextLocale}>{t("langToggle")}</span>
    </button>
  );
}
