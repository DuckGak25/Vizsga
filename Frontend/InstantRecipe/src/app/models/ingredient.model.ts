// ingredient.model.ts

export interface Ingredient {
  id: number;
  name: string;
  category: string;
  pivot?: {
    quantity: string;
  };
}
