// ingredient.model.ts

export interface Ingredient {
  id: number;
  name: string;
  category: string;
  language: string;
  pivot?: {
    quantity: string;
  };
}


