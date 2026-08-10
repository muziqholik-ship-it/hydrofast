import { db } from "@/db/client";
import { caseStudyImages } from "@/db/schema";
import { asc, inArray } from "drizzle-orm";

/**
 * Ordered gallery paths per case study, keyed by case-study id.
 * Returns {} when the case_study_images table doesn't exist yet
 * (docs/sql/003 pending) so public pages fall back to the cover image
 * instead of failing.
 */
export async function getCaseStudyGalleries(ids: string[]): Promise<Record<string, string[]>> {
  if (ids.length === 0) return {};
  try {
    const rows = await db
      .select({ caseStudyId: caseStudyImages.caseStudyId, imagePath: caseStudyImages.imagePath })
      .from(caseStudyImages)
      .where(inArray(caseStudyImages.caseStudyId, ids))
      .orderBy(asc(caseStudyImages.sortOrder));
    const byCase: Record<string, string[]> = {};
    for (const row of rows) (byCase[row.caseStudyId] ??= []).push(row.imagePath);
    return byCase;
  } catch {
    return {};
  }
}

/**
 * Every photo of one project, in gallery order — the merge script folded the
 * duplicate one-photo rows into a gallery, and the public pages give each of
 * those photos its own tile rather than hiding them behind a "+N" badge.
 *
 * The cover normally *is* the gallery's first row, so it isn't prepended
 * twice. Rows predating the migration (and any run where the gallery table is
 * unreachable) have no gallery at all, and the cover carries alone.
 */
export function caseStudyPhotoPaths(cover: string | null, gallery: string[] = []): string[] {
  return cover && !gallery.includes(cover) ? [cover, ...gallery] : gallery;
}
