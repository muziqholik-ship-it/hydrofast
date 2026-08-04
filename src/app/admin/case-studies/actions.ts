"use server";

import { db } from "@/db/client";
import { caseStudies, caseStudyImages } from "@/db/schema";
import { eq } from "drizzle-orm";
import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { deleteImageVariants } from "@/lib/images";

function parseCommon(formData: FormData) {
  const businessAreaId = String(formData.get("businessAreaId") ?? "");
  return {
    clientName: String(formData.get("clientName") ?? "").trim(),
    titleKo: String(formData.get("titleKo") ?? "").trim(),
    titleEn: String(formData.get("titleEn") ?? "").trim() || null,
    descriptionKo: String(formData.get("descriptionKo") ?? "").trim() || null,
    descriptionEn: String(formData.get("descriptionEn") ?? "").trim() || null,
    aspectRatio: String(formData.get("aspectRatio") ?? "21-9"),
    businessAreaId: businessAreaId || null,
    isPublished: formData.get("isPublished") === "on",
    sortOrder: Number(formData.get("sortOrder") ?? 0),
  };
}

// Ordered storage paths from the form's hidden field; files were already
// uploaded client-side via /admin/api/upload. First path = cover image.
function parseImagePaths(formData: FormData): string[] {
  try {
    const parsed: unknown = JSON.parse(String(formData.get("imagePaths") ?? "[]"));
    if (!Array.isArray(parsed)) return [];
    return parsed.filter((p): p is string => typeof p === "string" && p.length > 0);
  } catch {
    return [];
  }
}

// Rewrites the gallery child rows for one case study. Tolerates the
// case_study_images table not existing yet (docs/sql/003 pending) — the cover
// imagePath on the main row still saves, so the admin stays usable.
async function replaceGalleryRows(caseStudyId: string, paths: string[]) {
  try {
    await db.delete(caseStudyImages).where(eq(caseStudyImages.caseStudyId, caseStudyId));
    if (paths.length > 0) {
      await db
        .insert(caseStudyImages)
        .values(paths.map((imagePath, index) => ({ caseStudyId, imagePath, sortOrder: index })));
    }
  } catch (err) {
    console.warn(
      "case_study_images sync failed (has docs/sql/003_compliance_and_case_study_images.md been applied?):",
      err
    );
  }
}

async function galleryPaths(caseStudyId: string): Promise<string[]> {
  try {
    const rows = await db.select().from(caseStudyImages).where(eq(caseStudyImages.caseStudyId, caseStudyId));
    return rows.map((r) => r.imagePath);
  } catch {
    return [];
  }
}

export async function createCaseStudy(formData: FormData) {
  const parsed = parseCommon(formData);
  if (!parsed.clientName || !parsed.titleKo) {
    throw new Error("고객사명과 제목(한글)을 입력해주세요.");
  }

  const paths = parseImagePaths(formData);
  const [inserted] = await db
    .insert(caseStudies)
    .values({ ...parsed, imagePath: paths[0] ?? null })
    .returning({ id: caseStudies.id });
  await replaceGalleryRows(inserted.id, paths);

  revalidatePath("/admin/case-studies");
  redirect("/admin/case-studies");
}

export async function updateCaseStudy(id: string, formData: FormData) {
  const parsed = parseCommon(formData);
  if (!parsed.clientName || !parsed.titleKo) {
    throw new Error("고객사명과 제목(한글)을 입력해주세요.");
  }

  const paths = parseImagePaths(formData);
  const [existing] = await db.select().from(caseStudies).where(eq(caseStudies.id, id));
  const previousPaths = new Set([...(await galleryPaths(id)), ...(existing?.imagePath ? [existing.imagePath] : [])]);

  await db.update(caseStudies).set({ ...parsed, imagePath: paths[0] ?? null }).where(eq(caseStudies.id, id));
  await replaceGalleryRows(id, paths);

  // Storage cleanup for images dropped from the gallery.
  const kept = new Set(paths);
  for (const path of previousPaths) {
    if (!kept.has(path)) {
      await deleteImageVariants("case-study-images", path);
    }
  }

  revalidatePath("/admin/case-studies");
  redirect("/admin/case-studies");
}

export async function deleteCaseStudy(id: string) {
  const [existing] = await db.select().from(caseStudies).where(eq(caseStudies.id, id));
  const allPaths = new Set([...(await galleryPaths(id)), ...(existing?.imagePath ? [existing.imagePath] : [])]);
  for (const path of allPaths) {
    await deleteImageVariants("case-study-images", path);
  }
  // case_study_images rows go with the parent via ON DELETE CASCADE.
  await db.delete(caseStudies).where(eq(caseStudies.id, id));
  revalidatePath("/admin/case-studies");
}
