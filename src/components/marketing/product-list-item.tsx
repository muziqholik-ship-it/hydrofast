import { Link } from "@/i18n/navigation";
import { publicImageUrl } from "@/lib/image-url";
import type { ProductCardData } from "@/components/marketing/product-card";

export interface ProductListItemData extends ProductCardData {
  modelNo: string | null;
}

export function ProductListItem({ product }: { product: ProductListItemData }) {
  const imageUrl = product.primaryImagePath ? publicImageUrl("product-images", product.primaryImagePath) : null;
  return (
    <Link
      href={`/products/${product.slug}`}
      className="group flex items-center gap-4 rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-3 transition-all hover:border-[var(--color-steel-light)] hover:shadow-md sm:gap-5 sm:p-4"
    >
      <div className="relative flex h-16 w-16 shrink-0 items-center justify-center overflow-hidden rounded-md bg-[var(--color-surface-alt)] sm:h-20 sm:w-20">
        {imageUrl ? (
          // contain, not cover: catalog crops are the product centred on white, so
          // cropping to fill would eat the ends of a long valve body
          // eslint-disable-next-line @next/next/no-img-element
          <img
            src={imageUrl}
            alt={product.name}
            loading="lazy"
            decoding="async"
            className="h-full w-full bg-white object-contain transition-transform duration-500 group-hover:scale-105"
          />
        ) : (
          <span className="text-[10px] text-[var(--color-ink-soft)]">No Image</span>
        )}
      </div>
      <div className="min-w-0 flex-1">
        <div className="flex flex-wrap items-baseline gap-x-2">
          {product.manufacturerName && (
            <span className="text-xs font-semibold uppercase tracking-wide text-[var(--color-steel-light)]">
              {product.manufacturerName}
            </span>
          )}
          {product.modelNo && (
            <span className="text-xs text-[var(--color-ink-soft)]">{product.modelNo}</span>
          )}
        </div>
        <h3 className="mt-0.5 truncate text-sm font-bold leading-snug sm:text-base">{product.name}</h3>
        {product.teaser && (
          <p className="mt-1 line-clamp-2 text-xs text-[var(--color-ink-soft)] sm:line-clamp-1">{product.teaser}</p>
        )}
      </div>
      <span
        aria-hidden
        className="shrink-0 text-[var(--color-ink-soft)] transition-transform group-hover:translate-x-1 group-hover:text-[var(--color-steel-light)]"
      >
        →
      </span>
    </Link>
  );
}
