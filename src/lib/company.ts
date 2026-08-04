/**
 * Single source of truth for company facts (name, address, contacts).
 * Consumed by the footer, the About page and the site-wide JSON-LD so the
 * values can never drift apart. Labels stay in messages/*.json; only the
 * values live here.
 */
export const COMPANY = {
  brand: "HYDROFAST",
  legalNameKo: "(주)하이드로훼스트",
  legalNameEn: "HYDROFAST Co., Ltd.",
  ceoKo: "최수성",
  ceoEn: "Choi Su-Seong",
  registrationNumber: "122-86-10520",
  foundingDate: "1998-05",
  addressKo: "인천광역시 부평구 부평대로 283, 우림라이온스밸리 C동 610호",
  addressEn: "C-610, Woolim Lions Valley, 283 Bupyeong-daero, Bupyeong-gu, Incheon, South Korea",
  // Structured pieces for schema.org PostalAddress
  streetAddressKo: "부평대로 283, 우림라이온스밸리 C동 610호",
  addressLocalityKo: "부평구",
  addressRegionKo: "인천광역시",
  addressCountry: "KR",
  phone: "032-623-5015",
  phoneIntl: "+82-32-623-5015",
  fax: "032-623-5017",
  email: "hydrofast@hydrofast.co.kr",
  /** schema.org openingHours format */
  openingHours: "Mo-Fr 09:00-18:00",
} as const;
