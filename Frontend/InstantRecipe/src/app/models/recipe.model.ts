import { Ingredient } from "./ingredient.model";
import { RecipeIngredient } from "./recipe-ingredient.model";

export interface Recipe {
  id: number;
  title: string;
  description: string;
  categories: string;
  imagelink: string;
  language: string;
  featured: boolean;
  user_id: number;
  approved: boolean;
  recipe_ingredients?: RecipeIngredient[];
  ingredients: Ingredient[];
}

