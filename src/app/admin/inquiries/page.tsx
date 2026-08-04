import Link from "next/link";
import { db } from "@/db/client";
import { inquiries } from "@/db/schema";
import { desc } from "drizzle-orm";
import { DeleteButton } from "@/components/admin/delete-button";
import { markInquiryRead, deleteInquiry } from "./actions";

const FILTERS = [
  { key: "all", label: "전체" },
  { key: "unread", label: "미확인" },
  { key: "read", label: "확인 완료" },
] as const;
type FilterKey = (typeof FILTERS)[number]["key"];

export default async function InquiriesPage({
  searchParams,
}: {
  searchParams: Promise<{ filter?: string }>;
}) {
  const { filter: rawFilter } = await searchParams;
  const filter: FilterKey = rawFilter === "unread" || rawFilter === "read" ? rawFilter : "all";

  const allRows = await db.select().from(inquiries).orderBy(desc(inquiries.createdAt));
  const unreadCount = allRows.filter((r) => !r.isRead).length;
  const counts: Record<FilterKey, number> = {
    all: allRows.length,
    unread: unreadCount,
    read: allRows.length - unreadCount,
  };
  const rows =
    filter === "all" ? allRows : allRows.filter((r) => (filter === "unread" ? !r.isRead : r.isRead));

  return (
    <div>
      <h1 className="mb-4 text-xl font-bold">문의 내역 ({counts.all})</h1>

      <div className="mb-6 flex gap-2 border-b border-[var(--color-border)]">
        {FILTERS.map((f) => (
          <Link
            key={f.key}
            href={f.key === "all" ? "/admin/inquiries" : `/admin/inquiries?filter=${f.key}`}
            className={`-mb-px border-b-2 px-3 py-2 text-sm ${
              filter === f.key
                ? "border-[var(--color-safety-orange)] font-semibold text-[var(--color-ink)]"
                : "border-transparent text-[var(--color-ink-soft)] hover:text-[var(--color-ink)]"
            }`}
          >
            {f.label} ({counts[f.key]})
          </Link>
        ))}
      </div>

      <div className="flex flex-col gap-3">
        {rows.length === 0 && <p className="text-sm text-[var(--color-ink-soft)]">문의 내역이 없습니다.</p>}
        {rows.map((row) => (
          <div
            key={row.id}
            className={`rounded-[var(--radius-card)] border p-4 ${
              row.isRead
                ? "border-[var(--color-border)] bg-[var(--color-surface)]"
                : "border-[var(--color-safety-orange)] bg-[var(--color-surface)]"
            }`}
          >
            <div className="mb-2 flex items-center justify-between">
              <div className="text-sm font-semibold">
                {row.name} {row.company && <span className="text-[var(--color-ink-soft)]">· {row.company}</span>}
              </div>
              <div className="text-xs text-[var(--color-ink-soft)]">
                {new Date(row.createdAt).toLocaleString("ko-KR")}
              </div>
            </div>
            <div className="mb-2 text-xs text-[var(--color-ink-soft)]">
              {row.email}
              {row.phone && ` · ${row.phone}`}
              {row.businessAreaInterest && ` · 관심분야: ${row.businessAreaInterest}`}
              {row.privacyConsentAt &&
                ` · 개인정보 동의: ${new Date(row.privacyConsentAt).toLocaleString("ko-KR")}`}
            </div>
            <p className="mb-3 whitespace-pre-wrap text-sm">{row.message}</p>
            <div className="flex gap-3 text-sm">
              <form action={markInquiryRead.bind(null, row.id, !row.isRead)}>
                <button type="submit" className="text-[var(--color-steel-light)]">
                  {row.isRead ? "미확인으로 표시" : "확인 완료로 표시"}
                </button>
              </form>
              <DeleteButton id={row.id} onDelete={deleteInquiry} />
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
