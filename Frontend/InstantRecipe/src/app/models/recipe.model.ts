import { Ingredient } from "./ingredient.model";

export interface Recipe {
  id: number;
  title: string;
  description: string;
  categories: string;
  ingredients: Ingredient[];
}

