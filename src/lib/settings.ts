import { db } from "@/db/client";
import { siteSettings } from "@/db/schema";
import { inArray } from "drizzle-orm";

/**
 * Seed defaults for numeric site settings. Used when the admin hasn't set a
 * value in /admin/settings yet — a saved value there always wins.
 */
export const NUMERIC_SETTING_DEFAULTS = {
  founded_year: 1998,
  max_pressure_bar: 6900,
} as const;

export type NumericSettingKey = keyof typeof NUMERIC_SETTING_DEFAULTS;

/** Reads numeric settings from site_settings, falling back to seed defaults. */
export async function getNumericSettings(): Promise<Record<NumericSettingKey, number>> {
  const keys = Object.keys(NUMERIC_SETTING_DEFAULTS) as NumericSettingKey[];
  const rows = await db
    .select()
    .from(siteSettings)
    .where(inArray(siteSettings.settingKey, keys));

  const result = { ...NUMERIC_SETTING_DEFAULTS } as Record<NumericSettingKey, number>;
  for (const row of rows) {
    const raw = row.valueKo ?? row.valueEn;
    const parsed = raw ? Number.parseInt(raw.replace(/[^\d-]/g, ""), 10) : Number.NaN;
    if (!Number.isNaN(parsed)) result[row.settingKey as NumericSettingKey] = parsed;
  }
  return result;
}
