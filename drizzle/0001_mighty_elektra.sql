CREATE TABLE "case_study_images" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"case_study_id" uuid NOT NULL,
	"image_path" text NOT NULL,
	"sort_order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
ALTER TABLE "inquiries" ADD COLUMN "privacy_consent_at" timestamp with time zone;--> statement-breakpoint
ALTER TABLE "case_study_images" ADD CONSTRAINT "case_study_images_case_study_id_case_studies_id_fk" FOREIGN KEY ("case_study_id") REFERENCES "public"."case_studies"("id") ON DELETE cascade ON UPDATE no action;