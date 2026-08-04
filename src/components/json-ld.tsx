/**
 * Renders a schema.org object as an application/ld+json script. Data is
 * always serialized with JSON.stringify (never raw string interpolation), and
 * `<` is escaped so CMS-sourced text can't break out of the script tag.
 */
export function JsonLd({ data }: { data: Record<string, unknown> }) {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(data).replace(/</g, "\\u003c") }}
    />
  );
}
