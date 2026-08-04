import { Link } from "@/i18n/navigation";
import { publicImageUrl } from "@/lib/image-url";
import type { Manufacturer } from "@/db/schema";

export function PartnerCard({ manufacturer }: { manufacturer: Manufacturer }) {
  const logoUrl = manufacturer.logoPath ? publicImageUrl("partner-logos", manufacturer.logoPath) : null;
  return (
    <Link
      href={`/partners/${manufacturer.slug}`}
      className="group flex flex-col items-center gap-3 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-6 text-center transition-all hover:-translate-y-1 hover:border-[var(--color-steel-light)] hover:shadow-lg"
    >
      <div className="flex h-16 w-full items-center justify-center">
        {logoUrl ? (
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={logoUrl}
            alt={manufacturer.name}
            width={128}
            height={56}
            loading="lazy"
            decoding="async"
            className="max-h-14 w-auto object-contain"
          />
        ) : (
          <span className="text-sm font-bold">{manufacturer.name}</span>
        )}
      </div>
      <div>
        <div className="text-sm font-semibold">{manufacturer.name}</div>
        {manufacturer.country && <div className="text-xs text-[var(--color-ink-soft)]">{manufacturer.country}</div>}
      </div>
    </Link>
  );
}
