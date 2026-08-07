import { notFound } from "next/navigation";

/**
 * Catch-all for URLs that match no route inside the locale segment. Calling
 * notFound() here renders [locale]/not-found.tsx inside the locale layout
 * (header/footer included) instead of the bare default 404.
 */
export default function CatchAllPage() {
  notFound();
}
