import { publicImageUrl, type ImageBucket } from "@/lib/image-url";

export function LogoMarquee({
  logos,
  bucket,
}: {
  logos: { id: string; name: string; logoPath: string }[];
  bucket: ImageBucket;
}) {
  const resolved = logos
    .map((logo) => ({ ...logo, url: publicImageUrl(bucket, logo.logoPath) }))
    .filter((logo): logo is typeof logo & { url: string } => logo.url !== null);

  if (resolved.length === 0) return null;

  // Duplicate the list so the CSS marquee (translateX -50%) loops seamlessly.
  const doubled = [...resolved, ...resolved];

  return (
    <div className="overflow-hidden">
      <div className="marquee-track gap-16 py-4">
        {doubled.map((logo, i) => (
          <div
            key={`${logo.id}-${i}`}
            // The second copy exists only for the CSS loop — hide it from
            // screen readers so company names aren't announced twice.
            aria-hidden={i >= resolved.length || undefined}
            className="flex h-12 w-32 shrink-0 items-center justify-center"
          >
            {/* Uploads only pin the width (400/800/1600px variants, height free),
                so use this fixed 128×48 layout box as the intrinsic-size hint. */}
            {/* eslint-disable-next-line @next/next/no-img-element */}
            <img
              src={logo.url}
              alt={logo.name}
              width={128}
              height={48}
              loading="lazy"
              decoding="async"
              className="max-h-10 w-auto object-contain opacity-70 grayscale transition-opacity hover:opacity-100 hover:grayscale-0"
            />
          </div>
        ))}
      </div>
    </div>
  );
}
