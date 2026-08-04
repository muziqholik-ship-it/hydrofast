import { NextResponse } from "next/server";
import { uploadImageVariants } from "@/lib/images";
import type { ImageBucket } from "@/lib/image-url";

// Admin-only image upload used by the BlockEditor (business-area content
// blocks, site-media bucket) and the case-study multi-image form
// (case-study-images bucket). Access is gated by the /admin middleware
// (src/proxy.ts → updateSession), which redirects unauthenticated requests to
// /admin/login before this handler runs. Returns the card-size variant path.
const ALLOWED_BUCKETS = ["site-media", "case-study-images"] as const satisfies readonly ImageBucket[];
type AllowedBucket = (typeof ALLOWED_BUCKETS)[number];

export async function POST(request: Request) {
  const formData = await request.formData();
  const file = formData.get("file");
  const bucket = String(formData.get("bucket") ?? "site-media");

  if (!(file instanceof File) || file.size === 0) {
    return NextResponse.json({ error: "No file provided" }, { status: 400 });
  }
  if (!file.type.startsWith("image/")) {
    return NextResponse.json({ error: "Only image files are allowed" }, { status: 400 });
  }
  if (!ALLOWED_BUCKETS.includes(bucket as AllowedBucket)) {
    return NextResponse.json({ error: "Invalid bucket" }, { status: 400 });
  }

  try {
    const { cardPath } = await uploadImageVariants(bucket as AllowedBucket, file);
    return NextResponse.json({ path: cardPath });
  } catch (err) {
    const message = err instanceof Error ? err.message : "Upload failed";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
