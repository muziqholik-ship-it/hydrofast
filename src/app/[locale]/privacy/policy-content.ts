import { COMPANY } from "@/lib/company";
import type { Locale } from "@/i18n/routing";

/**
 * PIPA privacy-policy draft (Task 6.1, docs/improvement-plan/06). Long-form
 * legal prose lives here as structured sections rather than in messages/*.json
 * (explicitly allowed by the workstream brief); both locales are maintained
 * side by side so bilingual parity still holds.
 *
 * ⚠️ This is a compliant-STRUCTURED draft, not legal advice. The
 * {{PRIVACY_OFFICER_NAME}} / {{PRIVACY_OFFICER_TITLE}} placeholders must be
 * filled in by the company and the full text reviewed before launch — see
 * TODO.md.
 */

export interface PolicySection {
  heading: string;
  paragraphs?: string[];
  list?: string[];
  afterList?: string[];
}

export interface PolicyContent {
  intro: string;
  sections: PolicySection[];
  effectiveDate: string;
  reviewNote: string;
}

export const PRIVACY_POLICY: Record<Locale, PolicyContent> = {
  ko: {
    intro:
      `${COMPANY.legalNameKo}(이하 "회사")는 「개인정보 보호법」 등 관계 법령을 준수하며, ` +
      "홈페이지 견적·상담 문의를 통해 수집되는 개인정보를 다음과 같이 처리합니다.",
    sections: [
      {
        heading: "1. 수집하는 개인정보의 항목 및 수집 방법",
        list: [
          "필수 항목: 이름, 이메일, 문의 내용",
          "선택 항목: 회사명, 연락처, 관심 분야",
          "수집 방법: 홈페이지 견적·상담 문의 폼",
        ],
      },
      {
        heading: "2. 개인정보의 수집 및 이용 목적",
        list: [
          "견적·상담 문의에 대한 응대 및 처리 결과 회신",
          "문의 이력 관리를 통한 응대 품질 개선",
        ],
      },
      {
        heading: "3. 개인정보의 보유 및 이용 기간",
        list: [
          "수집 목적 달성(문의 응대 완료) 후 3년간 보관 후 파기",
          "정보주체가 삭제를 요청하는 경우 지체 없이 파기",
        ],
      },
      {
        heading: "4. 개인정보 처리의 위탁 및 국외 이전",
        paragraphs: [
          "회사는 홈페이지 운영을 위해 아래 업체에 개인정보 처리를 위탁하고 있으며, 수탁사의 서버가 국외에 위치하여 수집된 개인정보가 국외로 이전·보관됩니다.",
        ],
        list: [
          "Vercel Inc. (미국) — 홈페이지 호스팅 및 운영",
          "Supabase, Inc. (미국) — 데이터베이스 및 파일 저장",
        ],
        afterList: [
          "이전되는 항목은 제1항의 수집 항목과 같으며, 보유 기간은 제3항을 따릅니다.",
        ],
      },
      {
        heading: "5. 정보주체의 권리·의무 및 행사 방법",
        paragraphs: [
          "정보주체는 언제든지 자신의 개인정보에 대한 열람, 정정, 삭제, 처리정지를 요구할 수 있습니다. " +
            `권리 행사는 아래 개인정보 보호책임자에게 전화(${COMPANY.phone}) 또는 이메일(${COMPANY.email})로 요청하실 수 있으며, 회사는 지체 없이 필요한 조치를 합니다.`,
        ],
      },
      {
        heading: "6. 개인정보의 파기 절차 및 방법",
        list: [
          "보유 기간이 경과하거나 처리 목적이 달성된 개인정보는 지체 없이 파기합니다.",
          "전자적 파일 형태의 정보는 복구할 수 없는 방법으로 삭제하고, 그 밖의 기록물은 분쇄하거나 소각합니다.",
        ],
      },
      {
        heading: "7. 개인정보 보호책임자",
        list: [
          "성명: {{PRIVACY_OFFICER_NAME}}",
          "직책: {{PRIVACY_OFFICER_TITLE}}",
          `연락처: ${COMPANY.phone} / ${COMPANY.email}`,
        ],
      },
      {
        heading: "8. 개인정보 처리방침의 변경",
        paragraphs: [
          "이 개인정보처리방침의 내용이 추가, 삭제 또는 수정되는 경우 시행 7일 전부터 홈페이지를 통해 고지합니다.",
        ],
      },
    ],
    effectiveDate: "시행일: 2026년 8월 4일",
    reviewNote:
      "※ 본 개인정보처리방침은 시행 전 회사 내부 및 법률 검토를 거쳐 확정됩니다.",
  },
  en: {
    intro:
      `${COMPANY.legalNameEn} (the "Company") complies with the Personal Information Protection Act (PIPA) of Korea ` +
      "and other applicable laws, and processes personal information collected through the website inquiry form as follows.",
    sections: [
      {
        heading: "1. Items Collected and Collection Method",
        list: [
          "Required: name, email, message",
          "Optional: company name, phone number, area of interest",
          "Collection method: the quote/consultation inquiry form on this website",
        ],
      },
      {
        heading: "2. Purpose of Collection and Use",
        list: [
          "Responding to quote and consultation inquiries and replying with results",
          "Managing inquiry history to improve response quality",
        ],
      },
      {
        heading: "3. Retention and Use Period",
        list: [
          "Retained for 3 years after the purpose is fulfilled (inquiry handled), then destroyed",
          "Destroyed without delay upon the data subject's deletion request",
        ],
      },
      {
        heading: "4. Outsourcing and Overseas Transfer",
        paragraphs: [
          "The Company entrusts personal-information processing to the providers below to operate this website. Their servers are located overseas, so collected personal information is transferred to and stored abroad.",
        ],
        list: [
          "Vercel Inc. (USA) — website hosting and operation",
          "Supabase, Inc. (USA) — database and file storage",
        ],
        afterList: [
          "The transferred items are those listed in Section 1, and the retention period follows Section 3.",
        ],
      },
      {
        heading: "5. Rights of Data Subjects and How to Exercise Them",
        paragraphs: [
          "Data subjects may at any time request access to, correction of, deletion of, or suspension of processing of their personal information. " +
            `Requests may be made to the privacy officer below by phone (${COMPANY.phoneIntl}) or email (${COMPANY.email}), and the Company will act without delay.`,
        ],
      },
      {
        heading: "6. Destruction Procedure and Method",
        list: [
          "Personal information is destroyed without delay once the retention period expires or the processing purpose is fulfilled.",
          "Electronic files are deleted irrecoverably; other records are shredded or incinerated.",
        ],
      },
      {
        heading: "7. Privacy Officer",
        list: [
          "Name: {{PRIVACY_OFFICER_NAME}}",
          "Title: {{PRIVACY_OFFICER_TITLE}}",
          `Contact: ${COMPANY.phoneIntl} / ${COMPANY.email}`,
        ],
      },
      {
        heading: "8. Changes to This Policy",
        paragraphs: [
          "If this policy is amended, added to, or removed, notice will be given on this website at least 7 days before the change takes effect.",
        ],
      },
    ],
    effectiveDate: "Effective date: August 4, 2026",
    reviewNote:
      "※ This privacy policy draft is to be finalized after internal and legal review by the Company.",
  },
};
