import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Recipe } from '../app/models/recipe.model';
import { Ingredient } from '../app/models/ingredient.model';

@Injectable({
  providedIn: 'root'
})
export class RecipeService {
  private apiUrl = 'http://localhost:8000';

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
    return this.http.post<Recipe>(`${this.apiUrl}/api/postrecipe`, recipe);
  }

  addIngredients(ingredientData: any): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/api/recipe-ingredients`, ingredientData);
  }


  deleteRecipe(id: number) {
    return this.http.delete(`http://localhost:8000/api/deleterecipe/${id}`);
  }

  postIngredients(ingredient: Ingredient) {
    return this.http.post<Ingredient>(`${this.apiUrl}/api/addingredient`, ingredient);
  }

  modifyIngredient(ingredient: Ingredient) {
    return this.http.put<Ingredient>(`${this.apiUrl}/api/modifyingredient`, ingredient);
  }

  destroyIngredient(ingredient: Ingredient) {
    return this.http.delete<Ingredient>(`${this.apiUrl}/api/destroyingredient/${ingredient.id}`);
  }
  
  
  
  

  
}
