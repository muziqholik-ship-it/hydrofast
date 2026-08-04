import { notFound } from "next/navigation";
import { db } from "@/db/client";
import { caseStudies, caseStudyImages, businessAreas } from "@/db/schema";
import type { CaseStudyImage } from "@/db/schema";
import { eq, asc } from "drizzle-orm";
import { CaseStudyForm } from "@/components/admin/case-study-form";
import { updateCaseStudy } from "../../actions";

// Tolerates the table not existing yet (docs/sql/003 pending) — the form then
// falls back to the single legacy imagePath.
async function getGallery(caseStudyId: string): Promise<CaseStudyImage[]> {
  try {
    return await db
      .select()
      .from(caseStudyImages)
      .where(eq(caseStudyImages.caseStudyId, caseStudyId))
      .orderBy(asc(caseStudyImages.sortOrder));
  } catch {
    return [];
  }
}

export default async function EditCaseStudyPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const [[row], areas, images] = await Promise.all([
    db.select().from(caseStudies).where(eq(caseStudies.id, id)),
    db.select().from(businessAreas).orderBy(asc(businessAreas.sortOrder)),
    getGallery(id),
  ]);
  if (!row) notFound();

  return (
    <div>
      <h1 className="mb-6 text-xl font-bold">제작 사례 수정</h1>
      <CaseStudyForm action={updateCaseStudy.bind(null, id)} initial={row} initialImages={images} businessAreas={areas} />
    </div>
  );
}
