"use client";

import { useState, useTransition } from "react";
import { publicImageUrl } from "@/lib/image-url";
import { ProductSpecFields } from "./product-spec-fields";
import type { Product, ProductCategory, Manufacturer, ProductImage, BusinessArea } from "@/db/schema";
import type { SpecFieldDef } from "@/db/schema/product-categories";
import {
  deleteGalleryImage,
  quickCreateCategory,
  quickCreateManufacturer,
  quickAddSpecField,
} from "@/app/admin/products/actions";

const FIELD_CLASS =
  "w-full rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-2 text-sm";

const SMALL_FIELD_CLASS =
  "w-full rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] px-2 py-1.5 text-sm";

// A bare <input type="file"> renders as unstyled text on most browsers — the
// file: variants turn the OS-drawn picker into a real-looking button inside a
// bordered field, matching the other inputs on this form.
const FILE_INPUT_CLASS =
  "block w-full cursor-pointer rounded-[var(--radius-card)] border border-[var(--color-border)] bg-[var(--color-surface)] p-1.5 text-sm text-[var(--color-ink-soft)] " +
  "file:mr-3 file:cursor-pointer file:rounded-[var(--radius-card)] file:border-0 file:bg-[var(--color-steel-light)] file:px-4 file:py-2 file:text-sm file:font-semibold file:text-white " +
  "hover:file:bg-[var(--color-steel)]";

export function ProductForm({
  action,
  initial,
  categories,
  manufacturersList,
  businessAreas = [],
  galleryImages = [],
}: {
  action: (formData: FormData) => Promise<void>;
  initial?: Product;
  categories: ProductCategory[];
  manufacturersList: Manufacturer[];
  businessAreas?: BusinessArea[];
  galleryImages?: ProductImage[];
}) {
  // Seeded from props, then extended in place by the quick-add panels so a
  // newly created category/manufacturer can be selected without a page reload.
  const [categoryOptions, setCategoryOptions] = useState(categories);
  const [manufacturerOptions, setManufacturerOptions] = useState(manufacturersList);
  const [categoryId, setCategoryId] = useState(initial?.categoryId ?? "");
  const [manufacturerId, setManufacturerId] = useState(initial?.manufacturerId ?? "");
  // Defaults for the spec inputs. Quick-added specs land here so the value the
  // admin typed in the panel shows up pre-filled in the newly rendered field.
  const [specDefaults, setSpecDefaults] = useState<Record<string, string | number | boolean>>(
    (initial?.specs as Record<string, string | number | boolean>) ?? {}
  );
  const [primaryPreview, setPrimaryPreview] = useState<string | null>(
    initial?.primaryImagePath ? publicImageUrl("product-images", initial.primaryImagePath) : null
  );

  const selectedCategory = categoryOptions.find((c) => c.id === categoryId);

  function applyNewSpecSchema(specSchema: SpecFieldDef[]) {
    setCategoryOptions((prev) => prev.map((c) => (c.id === categoryId ? { ...c, specSchema } : c)));
  }

  return (
    <form action={action} className="flex max-w-3xl flex-col gap-4">
      <div className="grid grid-cols-3 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">슬러그 (URL용, 영문)</label>
          <input name="slug" defaultValue={initial?.slug} required className={FIELD_CLASS} />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">모델명</label>
          <input name="modelNo" defaultValue={initial?.modelNo ?? ""} className={FIELD_CLASS} />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">정렬 순서</label>
          <input
            type="number"
            name="sortOrder"
            defaultValue={initial?.sortOrder ?? 0}
            className={FIELD_CLASS}
          />
          <p className="mt-1 text-xs leading-relaxed text-[var(--color-ink-soft)]">
            제품 목록에 표시되는 순서입니다. 숫자가 작을수록 앞에 나옵니다 (0이 가장 먼저).
            검색어 없이 목록을 볼 때 적용되며, 검색 시에는 검색어와의 일치도 순으로 정렬됩니다.
          </p>
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <CategoryField
          categoryId={categoryId}
          onChange={setCategoryId}
          options={categoryOptions}
          businessAreas={businessAreas}
          onCreated={(created) => {
            setCategoryOptions((prev) => [...prev, created]);
            setCategoryId(created.id);
          }}
        />
        <ManufacturerField
          manufacturerId={manufacturerId}
          onChange={setManufacturerId}
          options={manufacturerOptions}
          onCreated={(created) => {
            setManufacturerOptions((prev) => [...prev, created]);
            setManufacturerId(created.id);
          }}
        />
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">제품명 (한글)</label>
          <input name="nameKo" defaultValue={initial?.nameKo} required className={FIELD_CLASS} />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">제품명 (영문)</label>
          <input name="nameEn" defaultValue={initial?.nameEn ?? ""} className={FIELD_CLASS} />
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">카드 요약 (한글, 검색결과에 표시)</label>
          <input
            name="shortDescriptionKo"
            defaultValue={initial?.shortDescriptionKo ?? ""}
            className={FIELD_CLASS}
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">카드 요약 (영문)</label>
          <input
            name="shortDescriptionEn"
            defaultValue={initial?.shortDescriptionEn ?? ""}
            className={FIELD_CLASS}
          />
        </div>
      </div>

      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="mb-1 block text-sm font-medium">상세 설명 (한글)</label>
          <textarea
            name="descriptionKo"
            defaultValue={initial?.descriptionKo ?? ""}
            rows={5}
            className={FIELD_CLASS}
          />
        </div>
        <div>
          <label className="mb-1 block text-sm font-medium">상세 설명 (영문)</label>
          <textarea
            name="descriptionEn"
            defaultValue={initial?.descriptionEn ?? ""}
            rows={5}
            className={FIELD_CLASS}
          />
        </div>
      </div>

      <div className="border-t border-[var(--color-border)] pt-4">
        <SpecSection
          category={selectedCategory}
          specDefaults={specDefaults}
          onFieldAdded={(specSchema, seedValue) => {
            applyNewSpecSchema(specSchema);
            const added = specSchema[specSchema.length - 1];
            if (seedValue !== "") {
              setSpecDefaults((prev) => ({ ...prev, [added.key]: seedValue }));
            }
          }}
        />
      </div>

      <div className="border-t border-[var(--color-border)] pt-4">
        <label className="mb-1 block text-sm font-medium">
          대표 이미지{initial ? " (변경 시에만 업로드)" : ""}
        </label>
        <input
          type="file"
          name="primaryImage"
          accept="image/*"
          onChange={(e) => {
            const file = e.target.files?.[0];
            if (file) setPrimaryPreview(URL.createObjectURL(file));
          }}
          className={FILE_INPUT_CLASS}
        />
        {primaryPreview && (
          // eslint-disable-next-line @next/next/no-img-element
          <img src={primaryPreview} alt="preview" className="mt-2 h-32 w-32 rounded object-cover" />
        )}
      </div>

      <div>
        <label className="mb-1 block text-sm font-medium">갤러리 이미지 추가</label>
        <input type="file" name="galleryImages" accept="image/*" multiple className={FILE_INPUT_CLASS} />

        {galleryImages.length > 0 && (
          <div className="mt-3 flex flex-wrap gap-3">
            {galleryImages.map((img) => (
              <div key={img.id} className="relative">
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={publicImageUrl("product-images", img.storagePath) ?? undefined}
                  alt=""
                  className="h-20 w-20 rounded object-cover"
                />
                {initial && (
                  <button
                    type="button"
                    onClick={() => deleteGalleryImage(img.id, initial.id)}
                    className="absolute -right-1 -top-1 rounded-full bg-[var(--color-safety-orange)] px-1.5 text-xs text-[var(--color-safety-orange-contrast)]"
                  >
                    ×
                  </button>
                )}
              </div>
            ))}
          </div>
        )}
      </div>

      <label className="flex items-center gap-2 text-sm">
        <input type="checkbox" name="isPublished" defaultChecked={initial?.isPublished ?? false} />
        게시하기 (체크 해제 시 사이트에 표시되지 않음)
      </label>

      <button
        type="submit"
        className="mt-2 rounded-[var(--radius-card)] bg-[var(--color-steel-light)] py-2 text-sm font-semibold text-white"
      >
        저장
      </button>
    </form>
  );
}

function CategoryField({
  categoryId,
  onChange,
  options,
  businessAreas,
  onCreated,
}: {
  categoryId: string;
  onChange: (id: string) => void;
  options: ProductCategory[];
  businessAreas: BusinessArea[];
  onCreated: (created: ProductCategory) => void;
}) {
  const [open, setOpen] = useState(false);
  const [nameKo, setNameKo] = useState("");
  const [nameEn, setNameEn] = useState("");
  const [businessAreaId, setBusinessAreaId] = useState("");

  return (
    <div>
      <FieldHeader label="제품 분류" open={open} onToggle={() => setOpen((v) => !v)} addLabel="+ 새 분류" />
      <select
        name="categoryId"
        value={categoryId}
        onChange={(e) => onChange(e.target.value)}
        required
        className={FIELD_CLASS}
      >
        <option value="">선택</option>
        {options.map((c) => (
          <option key={c.id} value={c.id}>
            {c.nameKo}
          </option>
        ))}
      </select>

      {open && (
        <QuickAddPanel
          note="새 분류를 만들고 바로 선택합니다. 슬러그는 자동 생성되며, 설명·스펙 양식은 분류 관리에서 추가할 수 있습니다."
          submitLabel="분류 추가"
          disabled={!nameKo.trim()}
          onCancel={() => setOpen(false)}
          onSubmit={async () => {
            const created = await quickCreateCategory({ nameKo, nameEn, businessAreaId });
            onCreated(created);
            setNameKo("");
            setNameEn("");
            setBusinessAreaId("");
            setOpen(false);
          }}
        >
          <QuickAddInput label="분류명 (한글)" value={nameKo} onChange={setNameKo} placeholder="유압 텐셔너" />
          <QuickAddInput
            label="분류명 (영문)"
            value={nameEn}
            onChange={setNameEn}
            placeholder="Hydraulic Tensioners"
          />
          <div>
            <label className="mb-1 block text-xs font-medium">사업 분야</label>
            <select
              value={businessAreaId}
              onChange={(e) => setBusinessAreaId(e.target.value)}
              className={SMALL_FIELD_CLASS}
            >
              <option value="">선택 안함</option>
              {businessAreas.map((ba) => (
                <option key={ba.id} value={ba.id}>
                  {ba.nameKo}
                </option>
              ))}
            </select>
          </div>
        </QuickAddPanel>
      )}
    </div>
  );
}

function ManufacturerField({
  manufacturerId,
  onChange,
  options,
  onCreated,
}: {
  manufacturerId: string;
  onChange: (id: string) => void;
  options: Manufacturer[];
  onCreated: (created: Manufacturer) => void;
}) {
  const [open, setOpen] = useState(false);
  const [name, setName] = useState("");
  const [country, setCountry] = useState("");

  return (
    <div>
      <FieldHeader label="제조사" open={open} onToggle={() => setOpen((v) => !v)} addLabel="+ 새 제조사" />
      <select
        name="manufacturerId"
        value={manufacturerId}
        onChange={(e) => onChange(e.target.value)}
        required
        className={FIELD_CLASS}
      >
        <option value="">선택</option>
        {options.map((m) => (
          <option key={m.id} value={m.id}>
            {m.name}
          </option>
        ))}
      </select>

      {open && (
        <QuickAddPanel
          note="새 제조사를 만들고 바로 선택합니다. 로고·소개글은 제조사 관리에서 추가할 수 있습니다."
          submitLabel="제조사 추가"
          disabled={!name.trim()}
          onCancel={() => setOpen(false)}
          onSubmit={async () => {
            const created = await quickCreateManufacturer({ name, country });
            onCreated(created);
            setName("");
            setCountry("");
            setOpen(false);
          }}
        >
          <QuickAddInput label="제조사명" value={name} onChange={setName} placeholder="DYNASET" />
          <QuickAddInput label="국가" value={country} onChange={setCountry} placeholder="핀란드" />
        </QuickAddPanel>
      )}
    </div>
  );
}

function SpecSection({
  category,
  specDefaults,
  onFieldAdded,
}: {
  category?: ProductCategory;
  specDefaults: Record<string, string | number | boolean>;
  onFieldAdded: (specSchema: SpecFieldDef[], seedValue: string) => void;
}) {
  const [open, setOpen] = useState(false);
  const [labelKo, setLabelKo] = useState("");
  const [labelEn, setLabelEn] = useState("");
  const [dataType, setDataType] = useState<"text" | "number">("text");
  const [unit, setUnit] = useState("");
  const [value, setValue] = useState("");

  return (
    <div>
      <div className="mb-1 flex items-center justify-between">
        <h2 className="text-sm font-bold">제품 사양</h2>
        {category && (
          <button
            type="button"
            onClick={() => setOpen((v) => !v)}
            className="text-xs font-medium text-[var(--color-steel-light)] hover:underline"
          >
            {open ? "취소" : "+ 새 사양 항목"}
          </button>
        )}
      </div>
      <p className="mb-3 text-xs text-[var(--color-ink-soft)]">
        사양 항목은 제품 분류마다 정해집니다. 여기서 추가한 항목은{" "}
        {category ? `"${category.nameKo}"` : "선택한"} 분류의 모든 제품에 나타납니다.
      </p>

      {open && category && (
        <div className="mb-4">
          <QuickAddPanel
            note="항목을 먼저 만들고 이 제품의 값을 입력합니다. 값은 아래 저장 버튼을 눌러야 제품에 저장됩니다."
            submitLabel="사양 항목 추가"
            disabled={!labelKo.trim()}
            onCancel={() => setOpen(false)}
            onSubmit={async () => {
              const specSchema = await quickAddSpecField(category.id, {
                labelKo,
                labelEn,
                dataType,
                unit: dataType === "number" ? unit : "",
              });
              onFieldAdded(specSchema, value.trim());
              setLabelKo("");
              setLabelEn("");
              setDataType("text");
              setUnit("");
              setValue("");
              setOpen(false);
            }}
          >
            <QuickAddInput label="항목명 (한글)" value={labelKo} onChange={setLabelKo} placeholder="정격압력" />
            <QuickAddInput
              label="항목명 (영문)"
              value={labelEn}
              onChange={setLabelEn}
              placeholder="Pressure Rating"
            />
            <div>
              <label className="mb-1 block text-xs font-medium">값 형식</label>
              <select
                value={dataType}
                onChange={(e) => setDataType(e.target.value as "text" | "number")}
                className={SMALL_FIELD_CLASS}
              >
                <option value="text">텍스트</option>
                <option value="number">숫자</option>
              </select>
            </div>
            {dataType === "number" && (
              <QuickAddInput label="단위 (선택)" value={unit} onChange={setUnit} placeholder="bar" />
            )}
            <QuickAddInput
              label="이 제품의 값"
              value={value}
              onChange={setValue}
              type={dataType === "number" ? "number" : "text"}
              placeholder={dataType === "number" ? "6900" : "스테인리스"}
            />
          </QuickAddPanel>
        </div>
      )}

      <ProductSpecFields fields={category?.specSchema ?? []} initialSpecs={specDefaults} />
    </div>
  );
}

function FieldHeader({
  label,
  open,
  onToggle,
  addLabel,
}: {
  label: string;
  open: boolean;
  onToggle: () => void;
  addLabel: string;
}) {
  return (
    <div className="mb-1 flex items-center justify-between">
      <label className="text-sm font-medium">{label}</label>
      <button
        type="button"
        onClick={onToggle}
        className="text-xs font-medium text-[var(--color-steel-light)] hover:underline"
      >
        {open ? "취소" : addLabel}
      </button>
    </div>
  );
}

function QuickAddInput({
  label,
  value,
  onChange,
  placeholder,
  type = "text",
}: {
  label: string;
  value: string;
  onChange: (value: string) => void;
  placeholder?: string;
  type?: "text" | "number";
}) {
  return (
    <div>
      <label className="mb-1 block text-xs font-medium">{label}</label>
      <input
        type={type}
        step={type === "number" ? "any" : undefined}
        value={value}
        onChange={(e) => onChange(e.target.value)}
        placeholder={placeholder}
        className={SMALL_FIELD_CLASS}
      />
    </div>
  );
}

/**
 * Inline create panel. Lives inside the product <form> — so it uses plain
 * buttons and unnamed inputs (nothing here is submitted with the product) and
 * swallows Enter, which would otherwise submit the half-filled product form.
 */
function QuickAddPanel({
  note,
  submitLabel,
  disabled,
  onCancel,
  onSubmit,
  children,
}: {
  note: string;
  submitLabel: string;
  disabled: boolean;
  onCancel: () => void;
  onSubmit: () => Promise<void>;
  children: React.ReactNode;
}) {
  const [pending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);

  function submit() {
    if (disabled || pending) return;
    setError(null);
    startTransition(async () => {
      try {
        await onSubmit();
      } catch (e) {
        setError(e instanceof Error ? e.message : "추가하지 못했습니다. 다시 시도해주세요.");
      }
    });
  }

  return (
    <div
      onKeyDown={(e) => {
        if (e.key === "Enter") {
          e.preventDefault();
          submit();
        }
      }}
      className="mt-2 rounded-[var(--radius-card)] border border-dashed border-[var(--color-border)] bg-[var(--color-surface-alt)] p-3"
    >
      <div className="grid grid-cols-2 gap-3">{children}</div>
      <p className="mt-2 text-xs leading-relaxed text-[var(--color-ink-soft)]">{note}</p>
      {error && <p className="mt-2 text-xs text-[var(--color-safety-orange)]">{error}</p>}
      <div className="mt-3 flex gap-2">
        <button
          type="button"
          onClick={submit}
          disabled={disabled || pending}
          className="rounded-[var(--radius-card)] bg-[var(--color-steel-light)] px-3 py-1.5 text-xs font-semibold text-white disabled:opacity-50"
        >
          {pending ? "추가 중…" : submitLabel}
        </button>
        <button
          type="button"
          onClick={onCancel}
          className="rounded-[var(--radius-card)] border border-[var(--color-border)] px-3 py-1.5 text-xs font-medium text-[var(--color-ink-soft)]"
        >
          취소
        </button>
      </div>
    </div>
  );
}
