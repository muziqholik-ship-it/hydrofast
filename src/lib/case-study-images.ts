import { db } from "@/db/client";
import { caseStudyImages } from "@/db/schema";
import { count, inArray } from "drizzle-orm";

/**
 * Gallery-size lookup for case-study cards (the "+N more photos" badge).
 * Returns {} when the case_study_images table doesn't exist yet
 * (docs/sql/003 pending) so public pages render without badges instead of
 * failing.
 */
export async function getCaseStudyImageCounts(ids: string[]): Promise<Record<string, number>> {
  if (ids.length === 0) return {};
  try {
    const rows = await db
      .select({ caseStudyId: caseStudyImages.caseStudyId, imageCount: count() })
      .from(caseStudyImages)
      .where(inArray(caseStudyImages.caseStudyId, ids))
      .groupBy(caseStudyImages.caseStudyId);
    return Object.fromEntries(rows.map((r) => [r.caseStudyId, Number(r.imageCount)]));
  } catch {
    return {};
  }
}
