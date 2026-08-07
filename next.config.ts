import type { NextConfig } from "next";
import createNextIntlPlugin from "next-intl/plugin";

const withNextIntl = createNextIntlPlugin("./src/i18n/request.ts");

const nextConfig: NextConfig = {
  // The Supabase instance lives in ap-southeast-1 while Vercel builds elsewhere, so
  // every prerender query pays cross-region latency on top of pooler scheduling. The
  // 60s default left no margin, turning a slow moment into a failed deploy. Headroom
  // only — the actual fix was cutting the query pile-up (see src/lib/areas.ts); the
  // whole prerender pass now finishes in ~10s.
  staticPageGenerationTimeout: 120,

  images: {
    // We resize to fixed widths server-side at upload time (see lib/images.ts) and
    // serve the exact Supabase Storage URL directly, so Next's on-demand optimizer
    // is disabled — this avoids the Vercel Hobby 1,000-images/month optimization cap
    // as the product catalog grows. remotePatterns is kept for safety/typing only.
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "wmxfomqysadfmbxequsx.supabase.co",
        pathname: "/storage/v1/object/public/**",
      },
    ],
  },
};

export default withNextIntl(nextConfig);
