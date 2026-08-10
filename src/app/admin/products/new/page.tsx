import { db } from "@/db/client";
import { productCategories, manufacturers, businessAreas } from "@/db/schema";
import { asc } from "drizzle-orm";
import { ProductForm } from "@/components/admin/product-form";
import { createProduct } from "../actions";

export default async function NewProductPage() {
  const [categories, manufacturersList, businessAreasList] = await Promise.all([
    db.select().from(productCategories).orderBy(asc(productCategories.sortOrder)),
    db.select().from(manufacturers).orderBy(asc(manufacturers.sortOrder)),
    db.select().from(businessAreas).orderBy(asc(businessAreas.sortOrder)),
  ]);

  return (
    <div>
      <h1 className="mb-6 text-xl font-bold">제품 추가</h1>
      <ProductForm
        action={createProduct}
        categories={categories}
        manufacturersList={manufacturersList}
        businessAreas={businessAreasList}
      />
    </div>
  );
}
