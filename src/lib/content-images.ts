import "server-only";

import { localImageSize } from "@/lib/image-size";
import type { ContentSection } from "@/content/business-areas";
import type { ContentImageSizes } from "@/lib/image-url";

/** Every image src a section document will render through the justified layout. */
function sectionImageSrcs(sections: ContentSection[]): string[] {
  const srcs = new Set<string>();
  for (const section of sections) {
    for (const block of section.blocks) {
      if (block.kind === "feature") (block.images ?? []).forEach((im) => srcs.add(im.src));
      else if (block.kind === "gallery") block.images.forEach((im) => srcs.add(im.src));
    }
  }
  return [...srcs];
}

/**
 * Measures the brochure assets a page is about to render so the row layout can
 * be sized on the server. The client can measure these itself, but only after
 * the images load — which meant every block visibly re-flowed once its photos
 * arrived. Uploaded assets live in Supabase Storage and stay unmeasured here;
 * the client probe in `business-content.tsx` still covers those.
 */
export async function measureSectionImages(sections: ContentSection[]): Promise<ContentImageSizes> {
  const measured = await Promise.all(
    sectionImageSrcs(sections).map(async (src) => {
      const size = await localImageSize(src);
      return size ? ([src, { aspect: size.width / size.height, height: size.height }] as const) : null;
    }),
  );
  return Object.fromEntries(measured.filter((entry) => entry !== null));
}
