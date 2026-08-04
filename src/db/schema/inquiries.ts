import { pgTable, uuid, text, boolean, timestamp } from "drizzle-orm/pg-core";

export const inquiries = pgTable("inquiries", {
  id: uuid("id").defaultRandom().primaryKey(),
  name: text("name").notNull(),
  company: text("company"),
  email: text("email").notNull(),
  phone: text("phone"),
  businessAreaInterest: text("business_area_interest"),
  message: text("message").notNull(),
  createdAt: timestamp("created_at", { withTimezone: true }).notNull().defaultNow(),
  isRead: boolean("is_read").notNull().default(false),
  // PIPA consent: when the submitter checked 개인정보 수집·이용 동의. Nullable because
  // rows predating the consent checkbox have no recorded consent time.
  privacyConsentAt: timestamp("privacy_consent_at", { withTimezone: true }),
});

export type Inquiry = typeof inquiries.$inferSelect;
export type NewInquiry = typeof inquiries.$inferInsert;
