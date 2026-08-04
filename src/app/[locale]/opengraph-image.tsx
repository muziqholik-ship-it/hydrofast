import { ImageResponse } from "next/og";
import { routing } from "@/i18n/routing";

// Default share image for every marketing page (KakaoTalk, Slack, socials).
// Deliberately static — no DB or storage calls — so it can never fail at
// build/request time. Hex values mirror the brand tokens in globals.css
// (--color-ink dark surface, --color-steel-light, --color-safety-orange);
// ImageResponse renders off-DOM, so CSS variables are unavailable here.
export const alt = "HYDROFAST — Precision & Power in Hydraulic";
export const size = { width: 1200, height: 630 };
export const contentType = "image/png";

export function generateStaticParams() {
  return routing.locales.map((locale) => ({ locale }));
}

export default function OpenGraphImage() {
  return new ImageResponse(
    (
      <div
        style={{
          width: "100%",
          height: "100%",
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          backgroundColor: "#0f1115",
          backgroundImage:
            "linear-gradient(135deg, rgba(55, 92, 251, 0.18) 0%, rgba(15, 17, 21, 0) 45%), linear-gradient(315deg, rgba(235, 58, 3, 0.14) 0%, rgba(15, 17, 21, 0) 40%)",
        }}
      >
        <div
          style={{
            display: "flex",
            alignItems: "baseline",
            fontSize: 132,
            fontWeight: 800,
            letterSpacing: "-0.03em",
          }}
        >
          <span style={{ color: "#7d95ff" }}>HYDRO</span>
          <span style={{ color: "#eb3a03" }}>FAST</span>
        </div>
        <div
          style={{
            marginTop: 28,
            fontSize: 38,
            fontWeight: 500,
            letterSpacing: "0.08em",
            color: "#a3aab3",
            textTransform: "uppercase",
          }}
        >
          Precision &amp; Power in Hydraulic
        </div>
        <div
          style={{
            position: "absolute",
            bottom: 0,
            left: 0,
            width: "100%",
            height: 14,
            display: "flex",
          }}
        >
          <div style={{ width: "70%", backgroundColor: "#375cfb" }} />
          <div style={{ width: "30%", backgroundColor: "#eb3a03" }} />
        </div>
      </div>
    ),
    size
  );
}
