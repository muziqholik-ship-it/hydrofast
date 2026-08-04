CREATE TABLE "business_areas" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"slug" text NOT NULL,
	"name_ko" text NOT NULL,
	"name_en" text,
	"summary_ko" text,
	"summary_en" text,
	"description_ko" text,
	"description_en" text,
	"tagline_ko" text,
	"tagline_en" text,
	"accent" text,
	"area_index" text,
	"hero_image_path" text,
	"card_image_path" text,
	"content_json" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"icon_key" text,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "business_areas_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "product_categories" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"business_area_id" uuid,
	"slug" text NOT NULL,
	"name_ko" text NOT NULL,
	"name_en" text,
	"description_ko" text,
	"description_en" text,
	"icon_key" text,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"spec_schema" jsonb DEFAULT '[]'::jsonb NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "product_categories_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "manufacturer_business_areas" (
	"manufacturer_id" uuid NOT NULL,
	"business_area_id" uuid NOT NULL,
	CONSTRAINT "manufacturer_business_areas_manufacturer_id_business_area_id_pk" PRIMARY KEY("manufacturer_id","business_area_id")
);
--> statement-breakpoint
CREATE TABLE "manufacturers" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"slug" text NOT NULL,
	"name" text NOT NULL,
	"country" text,
	"logo_path" text,
	"website_url" text,
	"description_ko" text,
	"description_en" text,
	"is_active" boolean DEFAULT true NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "manufacturers_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "product_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"product_id" uuid NOT NULL,
	"storage_path" text NOT NULL,
	"alt_ko" text,
	"alt_en" text,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"is_primary" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
CREATE TABLE "products" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"slug" text NOT NULL,
	"model_no" text,
	"manufacturer_id" uuid,
	"category_id" uuid,
	"business_area_id" uuid,
	"name_ko" text NOT NULL,
	"name_en" text,
	"short_description_ko" text,
	"short_description_en" text,
	"description_ko" text,
	"description_en" text,
	"specs" jsonb DEFAULT '{}'::jsonb NOT NULL,
	"primary_image_path" text,
	"is_published" boolean DEFAULT false NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"search_text" text DEFAULT '' NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"updated_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "products_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "case_studies" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"client_name" text NOT NULL,
	"title_ko" text NOT NULL,
	"title_en" text,
	"description_ko" text,
	"description_en" text,
	"image_path" text,
	"aspect_ratio" text DEFAULT '21-9' NOT NULL,
	"business_area_id" uuid,
	"is_published" boolean DEFAULT true NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "client_logos" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"logo_path" text NOT NULL,
	"is_published" boolean DEFAULT true NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "history_events" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"year" integer NOT NULL,
	"month" integer,
	"title_ko" text NOT NULL,
	"title_en" text,
	"description_ko" text,
	"description_en" text,
	"is_highlight" boolean DEFAULT false NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "certifications" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"title_ko" text NOT NULL,
	"title_en" text,
	"issuing_body_ko" text,
	"issuing_body_en" text,
	"cert_number" text,
	"issue_date" date,
	"image_path" text,
	"category" text DEFAULT 'certification' NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "affiliate_sections" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"affiliate_id" uuid NOT NULL,
	"section_key" text NOT NULL,
	"heading_ko" text,
	"heading_en" text,
	"body_ko" text,
	"body_en" text,
	"image_path" text,
	"layout_variant" text,
	"sort_order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "affiliates" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"slug" text NOT NULL,
	"name_ko" text NOT NULL,
	"name_en" text,
	"tagline_ko" text,
	"tagline_en" text,
	"logo_path" text,
	"hero_image_path" text,
	"sort_order" integer DEFAULT 0 NOT NULL,
	CONSTRAINT "affiliates_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "site_settings" (
	"setting_key" text PRIMARY KEY NOT NULL,
	"value_ko" text,
	"value_en" text,
	"value_json" jsonb
);
--> statement-breakpoint
CREATE TABLE "inquiries" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL,
	"company" text,
	"email" text NOT NULL,
	"phone" text,
	"business_area_interest" text,
	"message" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	"is_read" boolean DEFAULT false NOT NULL
);
--> statement-breakpoint
ALTER TABLE "product_categories" ADD CONSTRAINT "product_categories_business_area_id_business_areas_id_fk" FOREIGN KEY ("business_area_id") REFERENCES "public"."business_areas"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "manufacturer_business_areas" ADD CONSTRAINT "manufacturer_business_areas_manufacturer_id_manufacturers_id_fk" FOREIGN KEY ("manufacturer_id") REFERENCES "public"."manufacturers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "manufacturer_business_areas" ADD CONSTRAINT "manufacturer_business_areas_business_area_id_business_areas_id_fk" FOREIGN KEY ("business_area_id") REFERENCES "public"."business_areas"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_product_id_products_id_fk" FOREIGN KEY ("product_id") REFERENCES "public"."products"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "products" ADD CONSTRAINT "products_manufacturer_id_manufacturers_id_fk" FOREIGN KEY ("manufacturer_id") REFERENCES "public"."manufacturers"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "products" ADD CONSTRAINT "products_category_id_product_categories_id_fk" FOREIGN KEY ("category_id") REFERENCES "public"."product_categories"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "products" ADD CONSTRAINT "products_business_area_id_business_areas_id_fk" FOREIGN KEY ("business_area_id") REFERENCES "public"."business_areas"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "case_studies" ADD CONSTRAINT "case_studies_business_area_id_business_areas_id_fk" FOREIGN KEY ("business_area_id") REFERENCES "public"."business_areas"("id") ON DELETE set null ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "affiliate_sections" ADD CONSTRAINT "affiliate_sections_affiliate_id_affiliates_id_fk" FOREIGN KEY ("affiliate_id") REFERENCES "public"."affiliates"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "products_category_idx" ON "products" USING btree ("category_id");--> statement-breakpoint
CREATE INDEX "products_manufacturer_idx" ON "products" USING btree ("manufacturer_id");--> statement-breakpoint
CREATE INDEX "products_business_area_idx" ON "products" USING btree ("business_area_id");