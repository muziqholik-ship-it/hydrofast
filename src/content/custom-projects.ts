/**
 * Hand-authored detail content for the ETO(맞춤 설계·제작) reference projects
 * showcased inside a business area. Like src/content/business-areas.ts these
 * pages are brochure-style marketing content: Korean is the source of truth,
 * `en` falls back to `ko` in the renderer, and images live under
 * /public/content/** so there is no CMS/DB dependency.
 *
 * Rendered at /business/[areaSlug]/[projectSlug] and cross-linked from the
 * parent area's 맞춤 설계·제작 gallery (via ContentImage.href).
 */

import type { ContentSection, Loc } from "./business-areas";

export interface CustomProject {
  slug: string;
  /** Parent business area — the detail route 404s when the URL pair doesn't match. */
  areaSlug: string;
  name: Loc;
  nameEn: string;
  tagline: Loc;
  summary: Loc;
  heroImage: string;
  cardImage: string;
  /** Headline specs shown as chips in the hero. */
  keySpecs: { label: Loc; value: Loc }[];
  sections: ContentSection[];
}

export const CUSTOM_PROJECTS: CustomProject[] = [
  // ─────────────────────────────────────────── 회전링크 테스트 벤치
  {
    slug: "rotary-link-test-bench",
    areaSlug: "hydraulic-engineering",
    name: { ko: "회전링크 테스트 벤치", en: "Rotary Link Test Bench" },
    nameEn: "Rotary Link Test Bench",
    tagline: {
      ko: "메인·서브 2계통 유압으로 회전링크 부착물의 실부하 조건을 재현하는 전용 시험 설비",
      en: "A dedicated test rig reproducing real load conditions for rotary-link attachments on dual main/sub hydraulic circuits",
    },
    summary: {
      ko: "350bar·95LPM 메인 회로와 210bar·49LPM 서브 회로를 독립 제어하고, 오일 칠링 시스템으로 장시간 연속 시험에서도 유온을 안정적으로 유지합니다.",
      en: "Independently controlled 350 bar × 95 LPM main and 210 bar × 49 LPM sub circuits, with an oil chilling system that holds oil temperature steady through extended test runs.",
    },
    heroImage: "/content/hydraulic/system_application1.jpg",
    cardImage: "/content/hydraulic/system_application1.jpg",
    keySpecs: [
      { label: { ko: "Main Hydraulic" }, value: { ko: "350bar × 95LPM" } },
      { label: { ko: "Sub Hydraulic" }, value: { ko: "210bar × 49LPM" } },
      { label: { ko: "냉각", en: "Cooling" }, value: { ko: "Oil Chilling System" } },
    ],
    sections: [
      {
        blocks: [
          {
            kind: "feature",
            badge: { ko: "맞춤 설계·제작 (ETO)", en: "Engineered to Order" },
            title: {
              ko: "2계통 독립 제어와 유온 관리로 신뢰성 있는 내구·성능 시험",
              en: "Reliable endurance & performance testing with dual independent circuits and oil-temperature management",
            },
            body: {
              ko: "고객 시험 사양에 맞춰 설계·제작한 회전링크 부착물 전용 테스트 벤치입니다. 350bar 메인 회로와 210bar 서브 회로를 터치스크린 HMI에서 자동 운전하며, 비례 유량·압력 제어와 오일 칠링 시스템으로 장시간 시험에서도 조건을 일정하게 유지합니다.",
              en: "A rotary-link attachment test bench engineered to the customer's test specification. The 350 bar main and 210 bar sub circuits run automatically from a touchscreen HMI, with proportional flow/pressure control and oil chilling keeping conditions constant over long test runs.",
            },
            pills: [
              { ko: "자동 운전", en: "Automated operation" },
              { ko: "비례 유량·압력 제어", en: "Proportional flow & pressure control" },
              { ko: "시험 데이터 기록", en: "Test-data logging" },
            ],
            images: [b("/content/hydraulic/system_application1.jpg", { ko: "회전링크 테스트 벤치 전경", en: "Rotary link test bench" })],
            imageLayout: "single",
          },
          {
            kind: "specTable",
            title: { ko: "주요 사양", en: "Key specifications" },
            headers: [
              { ko: "구분", en: "Item" },
              { ko: "사양", en: "Specification" },
            ],
            rows: [
              [{ ko: "Main Hydraulic" }, { ko: "350bar × 95LPM" }],
              [{ ko: "Sub Hydraulic" }, { ko: "210bar × 49LPM" }],
              [{ ko: "냉각 시스템", en: "Cooling system" }, { ko: "Oil Chilling System (유온 안정화)", en: "Oil chilling system (oil-temperature stabilization)" }],
              [{ ko: "운전 방식", en: "Operation" }, { ko: "터치스크린 HMI 수동/자동 운전", en: "Touchscreen HMI, manual/automatic" }],
            ],
          },
          {
            kind: "gallery",
            title: { ko: "제어 시스템", en: "Control system" },
            columns: 4,
            images: [
              b("/content/hydraulic/rotary_link_test_bench2.jpg", {
                ko: "자동운전 화면 — 350bar·210bar 2계통 동시 모니터링",
                en: "Auto-run screen — simultaneous 350/210 bar monitoring",
              }),
              b("/content/hydraulic/rotary_link_test_bench3.png", {
                ko: "비례 유량·압력 제어 화면",
                en: "Proportional flow & pressure control screen",
              }),
              b("/content/hydraulic/rotary_link_test_bench4.jpg", {
                ko: "시험 모델 등록",
                en: "Test-model registration",
              }),
              b("/content/hydraulic/rotary_link_test_bench5.jpg", {
                ko: "시험 데이터 트렌드 — SD카드 저장",
                en: "Test-data trend — SD-card logging",
              }),
            ],
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────── EPPR 밸브 테스트 벤치
  {
    slug: "eppr-valve-test-bench",
    areaSlug: "hydraulic-engineering",
    name: { ko: "EPPR 밸브 테스트 벤치", en: "EPPR Valve Test Bench" },
    nameEn: "EPPR Valve Test Bench",
    tagline: {
      ko: "8연 스테이션에서 5종 밸브를 자동 시험하는 EPPR(전자비례감압) 밸브 전용 테스트 벤치",
      en: "An EPPR (electro-hydraulic proportional pressure-reducing) valve bench running automated tests on 5 valve types across 8 stations",
    },
    summary: {
      ko: "50bar·100LPM 유압 공급, 8연 5종 자동 시험, 오일 팬 쿨링 시스템으로 연속 시험 시 유온을 관리합니다.",
      en: "50 bar × 100 LPM hydraulic supply, automated 8-station / 5-type testing, and oil fan cooling for continuous-duty temperature control.",
    },
    heroImage: "/content/hydraulic/system_application2.jpg",
    cardImage: "/content/hydraulic/system_application2.jpg",
    keySpecs: [
      { label: { ko: "Main Hydraulic" }, value: { ko: "50bar × 100LPM" } },
      { label: { ko: "시험 구성", en: "Test setup" }, value: { ko: "8연 5종 Test · 자동 Test", en: "8-station · 5-type · automated" } },
      { label: { ko: "냉각", en: "Cooling" }, value: { ko: "Oil Fan Cooling System" } },
    ],
    sections: [
      {
        blocks: [
          {
            kind: "feature",
            badge: { ko: "맞춤 설계·제작 (ETO)", en: "Engineered to Order" },
            title: {
              ko: "8연 동시 장착·자동 시퀀스로 시험 생산성 극대화",
              en: "Maximum test throughput with 8 simultaneous stations and automated sequencing",
            },
            body: {
              ko: "건설기계 유압 제어의 핵심 부품인 EPPR 밸브의 특성을 검증하는 테스트 벤치입니다. 8개 스테이션에 5종 밸브를 동시 장착해 자동 시퀀스로 시험하며, 전용 소프트웨어가 밸브별 특성 곡선을 계측·기록합니다. 오일 팬 쿨링 시스템으로 연속 시험에서도 유온을 관리합니다.",
              en: "A bench for verifying EPPR valves — the core control element in construction-machinery hydraulics. Five valve types mount across eight stations for automated sequential testing, with dedicated software measuring and recording each valve's characteristic curves. Oil fan cooling manages temperature through continuous runs.",
            },
            pills: [
              { ko: "8연 스테이션", en: "8 stations" },
              { ko: "5종 밸브 대응", en: "5 valve types" },
              { ko: "전자동 시험", en: "Fully automated" },
            ],
            images: [b("/content/hydraulic/system_application2.jpg", { ko: "EPPR 밸브 테스트 벤치 전경", en: "EPPR valve test bench" })],
            imageLayout: "single",
          },
          {
            kind: "specTable",
            title: { ko: "주요 사양", en: "Key specifications" },
            headers: [
              { ko: "구분", en: "Item" },
              { ko: "사양", en: "Specification" },
            ],
            rows: [
              [{ ko: "Main Hydraulic" }, { ko: "50bar × 100LPM" }],
              [{ ko: "시험 구성", en: "Test setup" }, { ko: "8연 5종 Test / 자동 Test", en: "8-station, 5-type / automated test" }],
              [{ ko: "냉각 시스템", en: "Cooling system" }, { ko: "Oil Fan Cooling System" }],
            ],
          },
          {
            kind: "gallery",
            title: { ko: "계측 & 자동 시험", en: "Instrumentation & automated testing" },
            columns: 2,
            images: [
              b("/content/hydraulic/eppr_valve_test_bench2.jpg", {
                ko: "8연 스테이션 압력 계측부",
                en: "8-station pressure instrumentation",
              }),
              b("/content/hydraulic/eppr_valve_test_bench3.jpg", {
                ko: "자동 시험 소프트웨어 — 밸브 특성 곡선 분석",
                en: "Automated test software — valve characteristic curves",
              }),
            ],
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────── 트랙터 커넥트 테스트 유니트
  {
    slug: "tractor-connect-test-unit",
    areaSlug: "hydraulic-engineering",
    name: { ko: "트랙터 커넥트 테스트 유니트", en: "Tractor Connect Test Unit" },
    nameEn: "Tractor Connect Test Unit",
    tagline: {
      ko: "230bar 메인·서브 2계통과 석션 유량 제어로 트랙터 TM 커넥트를 시험하는 유니트",
      en: "A test unit exercising tractor TM connect assemblies on dual 230 bar circuits with suction flow control",
    },
    summary: {
      ko: "230bar·80LPM 메인, 230bar·50LPM 서브 2계통 유압 공급과 석션 유량 제어 시스템(Suction Flow Control)으로 다양한 부하 조건을 재현합니다.",
      en: "Dual hydraulic supply — 230 bar × 80 LPM main and 230 bar × 50 LPM sub — plus a suction flow control system reproduce a wide range of load conditions.",
    },
    heroImage: "/content/hydraulic/system_application3.jpg",
    cardImage: "/content/hydraulic/system_application3.jpg",
    keySpecs: [
      { label: { ko: "Main Hydraulic" }, value: { ko: "230bar × 80LPM" } },
      { label: { ko: "Sub Hydraulic" }, value: { ko: "230bar × 50LPM" } },
      { label: { ko: "유량 제어", en: "Flow control" }, value: { ko: "Suction Flow Control System" } },
    ],
    sections: [
      {
        blocks: [
          {
            kind: "feature",
            badge: { ko: "맞춤 설계·제작 (ETO)", en: "Engineered to Order" },
            title: {
              ko: "동급 압력 2계통 공급으로 실차 조건의 부하 재현",
              en: "Real-vehicle load reproduction on two equal-pressure supply circuits",
            },
            body: {
              ko: "트랙터 TM(트랜스미션) 커넥트의 작동 성능을 검증하는 테스트 유니트입니다. 230bar 동급 압력의 메인·서브 2계통을 독립 공급하고, 석션 유량 제어 시스템으로 흡입측 유량까지 정밀하게 관리해 실차에 가까운 시험 조건을 구현합니다.",
              en: "A unit verifying the operation of tractor TM (transmission) connect assemblies. Independent main and sub circuits at an equal 230 bar, with suction-side flow precisely managed by the suction flow control system, bring test conditions close to the real vehicle.",
            },
            pills: [
              { ko: "2계통 독립 공급", en: "Dual independent supply" },
              { ko: "석션 유량 제어", en: "Suction flow control" },
            ],
            images: [b("/content/hydraulic/system_application3.jpg", { ko: "트랙터 커넥트 테스트 유니트 전경", en: "Tractor connect test unit" })],
            imageLayout: "single",
          },
          {
            kind: "specTable",
            title: { ko: "주요 사양", en: "Key specifications" },
            headers: [
              { ko: "구분", en: "Item" },
              { ko: "사양", en: "Specification" },
            ],
            rows: [
              [{ ko: "Main Hydraulic" }, { ko: "230bar × 80LPM" }],
              [{ ko: "Sub Hydraulic" }, { ko: "230bar × 50LPM" }],
              [{ ko: "유량 제어", en: "Flow control" }, { ko: "Suction Flow Control System" }],
            ],
          },
          {
            kind: "gallery",
            title: { ko: "파워 유니트 & 제어반", en: "Power unit & control panel" },
            columns: 4,
            images: [
              b("/content/hydraulic/tractor_connect_test_unit2.jpg", {
                ko: "메인·서브 2계통 유압 파워 유니트",
                en: "Main + sub hydraulic power unit",
              }),
              b("/content/hydraulic/tractor_connect_test_unit3.jpg", {
                ko: "펌프·모터 구동부",
                en: "Pump & motor drive",
              }),
              b("/content/hydraulic/tractor_connect_test_unit4.jpg", {
                ko: "배관·계측 라인",
                en: "Piping & instrumentation",
              }),
              b("/content/hydraulic/tractor_connect_test_unit5.jpg", {
                ko: "30kW·22kW 컨트롤 패널",
                en: "30 kW / 22 kW control panel",
              }),
            ],
          },
        ],
      },
    ],
  },

  // ─────────────────────────────────────────── 드론용 클러치 테스트 벤치
  {
    slug: "drone-clutch-test-bench",
    areaSlug: "hydraulic-engineering",
    name: { ko: "드론용 클러치 테스트 벤치", en: "Drone Clutch Test Bench" },
    nameEn: "Drone Clutch Test Bench",
    tagline: {
      ko: "rpm 제어형 팬 쿨링과 오일 석션 컨트롤을 갖춘 저압·저유량 정밀 시험 벤치",
      en: "A low-pressure, low-flow precision bench with rpm-controlled fan cooling and oil suction control",
    },
    summary: {
      ko: "20bar·30LPM의 저압·저유량 조건에서 드론 구동계 클러치를 시험합니다. rpm 제어형 오일 팬 쿨링과 오일 석션 컨트롤로 정밀한 시험 환경을 제공합니다.",
      en: "Tests drone drivetrain clutches at a gentle 20 bar × 30 LPM. RPM-controlled oil fan cooling and oil suction control provide a precisely managed test environment.",
    },
    heroImage: "/content/hydraulic/system_application4.jpg",
    cardImage: "/content/hydraulic/system_application4.jpg",
    keySpecs: [
      { label: { ko: "Main Hydraulic" }, value: { ko: "20bar × 30LPM" } },
      { label: { ko: "냉각", en: "Cooling" }, value: { ko: "Oil Fan Cooling (rpm 제어)", en: "Oil fan cooling (rpm control)" } },
      { label: { ko: "유량 제어", en: "Flow control" }, value: { ko: "Oil Suction Control" } },
    ],
    sections: [
      {
        blocks: [
          {
            kind: "feature",
            badge: { ko: "맞춤 설계·제작 (ETO)", en: "Engineered to Order" },
            title: {
              ko: "저압·저유량 영역까지 정밀하게 — 캐비닛 일체형 컴팩트 벤치",
              en: "Precision down to low pressure & flow — a compact all-in-one cabinet bench",
            },
            body: {
              ko: "드론 구동계 클러치의 성능·내구 시험을 위한 테스트 벤치입니다. 20bar·30LPM의 저압·저유량 조건을 안정적으로 공급하며, 회전수(rpm) 제어형 오일 팬 쿨링과 오일 석션 컨트롤로 유온과 흡입 유량을 정밀하게 관리합니다. 파워 유니트·냉각·제어를 하나의 캐비닛에 통합한 컴팩트 구성입니다.",
              en: "A bench for performance and endurance testing of drone drivetrain clutches. It supplies a stable 20 bar × 30 LPM, while rpm-controlled oil fan cooling and oil suction control precisely manage temperature and intake flow — all integrated into a single compact cabinet.",
            },
            pills: [
              { ko: "rpm 제어 쿨링", en: "RPM-controlled cooling" },
              { ko: "오일 석션 컨트롤", en: "Oil suction control" },
              { ko: "캐비닛 일체형", en: "Integrated cabinet" },
            ],
            images: [b("/content/hydraulic/system_application4.jpg", { ko: "드론용 클러치 테스트 벤치 전경", en: "Drone clutch test bench" })],
            imageLayout: "single",
          },
          {
            kind: "specTable",
            title: { ko: "주요 사양", en: "Key specifications" },
            headers: [
              { ko: "구분", en: "Item" },
              { ko: "사양", en: "Specification" },
            ],
            rows: [
              [{ ko: "Main Hydraulic" }, { ko: "20bar × 30LPM" }],
              [{ ko: "냉각 시스템", en: "Cooling system" }, { ko: "Oil Fan Cooling System (rpm 제어)", en: "Oil fan cooling system (rpm control)" }],
              [{ ko: "유량 제어", en: "Flow control" }, { ko: "Oil Suction Control" }],
            ],
          },
          {
            kind: "gallery",
            title: { ko: "구성부 갤러리", en: "Component gallery" },
            columns: 4,
            images: [
              b("/content/hydraulic/drone_clutch_test_bench2.jpg", {
                ko: "내장형 펌프 유니트",
                en: "Built-in pump unit",
              }),
              b("/content/hydraulic/drone_clutch_test_bench3.jpg", {
                ko: "탱크 상부 — 주유구·센서·밸브",
                en: "Tank top — filler, sensors and valves",
              }),
              b("/content/hydraulic/drone_clutch_test_bench4.jpg", {
                ko: "rpm 제어형 오일 팬 쿨러 · 석션 컨트롤 밸브",
                en: "RPM-controlled oil fan cooler · suction control valves",
              }),
              b("/content/hydraulic/drone_clutch_test_bench5.jpg", {
                ko: "일체형 캐비닛 구성",
                en: "Integrated cabinet enclosure",
              }),
            ],
          },
        ],
      },
    ],
  },
];

function b(src: string, caption?: Loc) {
  return { src, caption };
}

export function getCustomProject(areaSlug: string, projectSlug: string): CustomProject | undefined {
  return CUSTOM_PROJECTS.find((p) => p.areaSlug === areaSlug && p.slug === projectSlug);
}

export function getAreaProjects(areaSlug: string): CustomProject[] {
  return CUSTOM_PROJECTS.filter((p) => p.areaSlug === areaSlug);
}
