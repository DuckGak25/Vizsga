import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { forkJoin, Observable } from 'rxjs';
import { Recipe } from '../app/models/recipe.model';
import { Ingredient } from '../app/models/ingredient.model';
import { RecipeIngredient } from './models/recipe-ingredient.model';

@Injectable({
  providedIn: 'root'
})
export class RecipeService {
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient) {}


  getRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/recipes`);
  }

  getRecipeById(id: number): Observable<Recipe> {
    return this.http.get<Recipe>(`${this.apiUrl}/recipes/${id}`);
  }
  getRecipeWithIngredients(id: number): Observable<Recipe> {
  return this.http.get<Recipe>(`${this.apiUrl}/recipes/${id}`);
  }

  getIngredients(): Observable<Ingredient[]> {
    return this.http.get<Ingredient[]>(`${this.apiUrl}/ingredients`);
  }

  createRecipe(recipe: Recipe): Observable<Recipe> {
    console.log(recipe)
    return this.http.post<Recipe>(`${this.apiUrl}/postrecipe`, recipe);
  }

  addIngredients(ingredientData: { recipe_id: number; ingredient_id: number; quantity: string  }): Observable<any> {
    console.log(ingredientData);
    return this.http.post<any>(`${this.apiUrl}/recipe-ingredients`, ingredientData);
  }
  
  
  


  deleteRecipe(id: number) {
    return this.http.delete(`${this.apiUrl}/deleterecipe/${id}`);
  }

  postIngredients(ingredient: Ingredient) {
    return this.http.post<Ingredient>(`${this.apiUrl}/addingredient`, ingredient);
  }

  modifyIngredient(ingredient: Ingredient) {
    return this.http.put<Ingredient>(`${this.apiUrl}/modifyingredient`, ingredient);
  }

  destroyIngredient(ingredient: Ingredient) {
    return this.http.delete<Ingredient>(`${this.apiUrl}/destroyingredient/${ingredient.id}`);
  }

  modifyRecipe(recipe: Recipe) {
    return this.http.put<Recipe>(`${this.apiUrl}/modifyrecipe`, recipe);
  }

  deleteIngredientFromRecipe(recipeIngredient: RecipeIngredient) {
    const params = new HttpParams()
      .set('recipe_id', recipeIngredient.recipe_id.toString())
      .set('ingredient_id', recipeIngredient.ingredient_id.toString());
    return this.http.delete<RecipeIngredient>(`${this.apiUrl}/deleteingredients`, { params });
  }
  
  
  
  

  
}
