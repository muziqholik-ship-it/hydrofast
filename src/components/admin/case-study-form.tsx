"use client";

import { useState } from "react";
import { publicImageUrl } from "@/lib/image-url";
import type { CaseStudy, CaseStudyImage, BusinessArea } from "@/db/schema";

const ASPECT_RATIOS = ["21-9", "16-10", "4-3", "9-16", "1-1"];

export function CaseStudyForm({
  action,
  initial,
  initialImages = [],
  businessAreas,
}: {
  action: (formData: FormData) => Promise<void>;
  initial?: CaseStudy;
  initialImages?: CaseStudyImage[];
  businessAreas: BusinessArea[];
}) {
  // Ordered gallery paths; first = cover. Rows created before the
  // case_study_images migration only have the single imagePath.
  const [images, setImages] = useState<string[]>(() => {
    if (initialImages.length > 0) return initialImages.map((img) => img.imagePath);
    return initial?.imagePath ? [initial.imagePath] : [];
  });
  const [uploading, setUploading] = useState(false);
  const [uploadError, setUploadError] = useState<string | null>(null);

  async function handleFiles(files: FileList | null) {
    if (!files || files.length === 0) return;
    setUploading(true);
    setUploadError(null);
    try {
      const uploaded: string[] = [];
      for (const file of Array.from(files)) {
        const fd = new FormData();
        fd.append("file", file);
        fd.append("bucket", "case-study-images");
        const res = await fetch("/admin/api/upload", { method: "POST", body: fd });
        const json = await res.json();
        if (!res.ok) throw new Error(json.error ?? "업로드에 실패했습니다.");
        uploaded.push(json.path);
      }
      setImages((prev) => [...prev, ...uploaded]);
    } catch (err) {
      setUploadError(err instanceof Error ? err.message : "업로드에 실패했습니다.");
    } finally {
      setUploading(false);
    }
  }

  function removeImage(index: number) {
    setImages((prev) => prev.filter((_, i) => i !== index));
  }

  function moveImage(index: number, delta: -1 | 1) {
    setImages((prev) => {
      const next = [...prev];
      const target = index + delta;
      if (target < 0 || target >= next.length) return prev;
      [next[index], next[target]] = [next[target], next[index]];
      return next;
    });
  }

  return (
    <form action={action} className="flex max-w-2xl flex-col gap-4">
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">고객사명</label>
          <input
            name="clientName"
            defaultValue={initial?.clientName}
            required
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">사업 분야</label>
          <select
            name="businessAreaId"
            defaultValue={initial?.businessAreaId ?? ""}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          >
            <option value="">선택 안함</option>
            {businessAreas.map((ba) => (
              <option key={ba.id} value={ba.id}>
                {ba.nameKo}
              </option>
            ))}
          </select>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">제목 (한글)</label>
          <input
            name="titleKo"
            defaultValue={initial?.titleKo}
            required
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">제목 (영문)</label>
          <input
            name="titleEn"
            defaultValue={initial?.titleEn ?? ""}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">설명 (한글)</label>
          <textarea
            name="descriptionKo"
            defaultValue={initial?.descriptionKo ?? ""}
            rows={3}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">설명 (영문)</label>
          <textarea
            name="descriptionEn"
            defaultValue={initial?.descriptionEn ?? ""}
            rows={3}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
      </div>

      <div>
        <label className="mb-1 block text-sm font-medium">이미지 (여러 장 선택 가능, 첫 번째가 대표 이미지)</label>
        <input
          type="file"
          accept="image/*"
          multiple
          onChange={(e) => {
            void handleFiles(e.target.files);
            e.target.value = "";
          }}
          className="w-full text-sm"
        />
        {uploading && <p className="mt-1 text-xs text-[var(--color-ink-soft)]">업로드 중...</p>}
        {uploadError && <p className="mt-1 text-xs text-[var(--color-safety-orange)]">{uploadError}</p>}
        {images.length > 0 && (
          <ul className="mt-2 grid grid-cols-3 gap-3">
            {images.map((path, index) => (
              <li key={path} className="rounded border border-[var(--color-border)] p-1.5">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={publicImageUrl("case-study-images", path) ?? undefined}
                  alt={`이미지 ${index + 1}`}
                  className="h-24 w-full rounded object-cover"
                />
                <div className="mt-1 flex items-center justify-between text-xs">
                  <span className="text-[var(--color-ink-soft)]">{index === 0 ? "대표" : `#${index + 1}`}</span>
                  <span className="flex gap-1.5">
                    <button type="button" onClick={() => moveImage(index, -1)} disabled={index === 0} className="disabled:opacity-30">
                      ←
                    </button>
                    <button
                      type="button"
                      onClick={() => moveImage(index, 1)}
                      disabled={index === images.length - 1}
                      className="disabled:opacity-30"
                    >
                      →
                    </button>
                    <button type="button" onClick={() => removeImage(index)} className="text-[var(--color-safety-orange)]">
                      삭제
                    </button>
                  </span>
                </div>
              </li>
            ))}
          </ul>
        )}
        <input type="hidden" name="imagePaths" value={JSON.stringify(images)} />
      </div>

      <div className="grid grid-cols-3 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">이미지 비율</label>
          <select
            name="aspectRatio"
            defaultValue={initial?.aspectRatio ?? "21-9"}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          >
            {ASPECT_RATIOS.map((r) => (
              <option key={r} value={r}>
                {r}
              </option>
            ))}
          </select>
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">정렬 순서</label>
          <input
            type="number"
            name="sortOrder"
            defaultValue={initial?.sortOrder ?? 0}
            className="w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm"
          />
        </div>
        <label className="flex items-center gap-2 self-end pb-2 text-sm">
          <input type="checkbox" name="isPublished" defaultChecked={initial?.isPublished ?? true} />
          게시하기
        </label>
      </div>

      <button
        type="submit"
        disabled={uploading}
        className="mt-2 rounded-[var(--radius-card)] bg-[var(--color-steel-light)] py-2 text-sm font-semibold text-white disabled:opacity-60"
      >
        저장
      </button>
    </form>
  );
}
