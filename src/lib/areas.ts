import { db } from "@/db/client";
import { businessAreas, type BusinessArea } from "@/db/schema";
import { asc, eq } from "drizzle-orm";
import { contentImageUrl } from "@/lib/image-url";
import type { BusinessAreaContent } from "@/content/business-areas";

const DEFAULT_ACCENT = "#375cfb";

/**
 * Maps a persisted business_areas row into the `BusinessAreaContent` shape the
 * marketing components already consume, resolving stored image references to
 * public URLs. This is the single seam between the CMS/DB and the public UI.
 */
export function rowToAreaContent(row: BusinessArea): BusinessAreaContent {
  return {
    slug: row.slug,
    order: row.sortOrder,
    accent: row.accent || DEFAULT_ACCENT,
    index: row.areaIndex || "",
    name: { ko: row.nameKo, en: row.nameEn ?? undefined },
    nameEn: row.nameEn ?? "",
    tagline: { ko: row.taglineKo ?? "", en: row.taglineEn ?? undefined },
    summary: { ko: row.summaryKo ?? "", en: row.summaryEn ?? undefined },
    heroImage: contentImageUrl(row.heroImagePath) ?? "",
    cardImage: contentImageUrl(row.cardImagePath) ?? "",
    sections: row.contentJson ?? [],
  };
}

/**
 * The [locale] layout renders the area nav on every page, so an uncached read
 * fires this once per page — during a build that was 20 identical queries for
 * the same 5 rows, launched within a second of each other and all contending
 * for Supabase's transaction pooler. Individually the query takes ~90ms, but
 * under that pile-up prerenders were intermittently left waiting past Next's
 * per-page budget, failing the deploy on whichever page drew the short straw.
 *
 * Concurrent callers now share one in-flight query per process. The 5-minute
 * TTL is the `revalidate = 300` ISR contract these marketing pages already
 * advertise, so nothing reads staler than it did before. Admin screens don't
 * call this, so CMS edits keep their existing publish latency.
 */
const AREAS_TTL_MS = 300_000;
let areasMemo: { at: number; promise: Promise<BusinessAreaContent[]> } | null = null;

export function getAllAreas(): Promise<BusinessAreaContent[]> {
  const now = Date.now();
  if (areasMemo && now - areasMemo.at < AREAS_TTL_MS) return areasMemo.promise;

  const promise = db
    .select()
    .from(businessAreas)
    .orderBy(asc(businessAreas.sortOrder))
    .then((rows) => rows.map(rowToAreaContent));

  // Never retain a failure — otherwise one blip would poison every page this
  // process renders for the next five minutes.
  promise.catch(() => {
    if (areasMemo?.promise === promise) areasMemo = null;
  });

  areasMemo = { at: now, promise };
  return promise;
}

export async function getAreaContent(slug: string): Promise<BusinessAreaContent | undefined> {
  const [row] = await db.select().from(businessAreas).where(eq(businessAreas.slug, slug));
  return row ? rowToAreaContent(row) : undefined;
}
