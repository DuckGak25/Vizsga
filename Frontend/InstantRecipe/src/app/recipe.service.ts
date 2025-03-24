import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { map, Observable } from 'rxjs';
import { Recipe } from '../app/models/recipe.model';
import { Ingredient } from '../app/models/ingredient.model';
import { RecipeIngredient } from './models/recipe-ingredient.model';
import { ConfigService } from './config.service';

@Injectable({
  providedIn: 'root'
})
export class RecipeService {
  searchRecipe(searchRecipeTerm: any) {
    throw new Error('Method not implemented.');
  }
  private apiUrl = 'http://localhost:8000/api';

  constructor(private http: HttpClient, private config: ConfigService) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('auth_token');
    let headers = new HttpHeaders().set('Content-Type', 'application/json');
    if (token) {
      headers = headers.set('Authorization', `Bearer ${token}`);
    }
    return headers;
  }

  getRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/recipes`, { headers: this.getHeaders() }).pipe(
      map((recipes: Recipe[]) => recipes.filter(recipe => recipe.language === this.config.langSign))
    );
  }

  getAllRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/allrecipes`, { headers: this.getHeaders() });
  }

  getPendingRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/pendingrecipes`, { headers: this.getHeaders() });
  }

  getEnglishRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/englishrecipes`, { headers: this.getHeaders() });
  }

  getHungarianRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/hungarianrecipes`, { headers: this.getHeaders() });
  }

  getUserRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/userrecipes`, { headers: this.getHeaders() })
  }
  
  getRecipeWithIngredients(id: number): Observable<Recipe> {
    return this.http.get<Recipe>(`${this.apiUrl}/recipes/${id}`, { headers: this.getHeaders() });
  }

  getFeaturedRecipes(): Observable<Recipe[]> {
    return this.http.get<Recipe[]>(`${this.apiUrl}/recipes/featured`);
  }

  getIngredients(): Observable<Ingredient[]> {
    return this.http.get<Ingredient[]>(`${this.apiUrl}/ingredients`, { headers: this.getHeaders() });
  }

  createRecipe(recipe: Recipe): Observable<Recipe> {
    if (!recipe.language) {
      recipe.language = this.config.langSign;
    }
    console.log("Recept: ", recipe)
    return this.http.post<Recipe>(`${this.apiUrl}/postrecipe`, recipe, { headers: this.getHeaders() });
  }

  addIngredients(ingredientData: RecipeIngredient): Observable<any> {
    return this.http.post<any>(`${this.apiUrl}/recipe-ingredients`, ingredientData, { headers: this.getHeaders() });
  }

  deleteRecipe(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/deleterecipe/${id}`, { headers: this.getHeaders() });
  }

  deleteUserRecipe(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/deleteuserrecipe/${id}`, { headers: this.getHeaders() });
  }

  postIngredients(ingredient: Ingredient): Observable<Ingredient> {
    return this.http.post<Ingredient>(`${this.apiUrl}/addingredient`, ingredient, { headers: this.getHeaders() });
  }

  modifyIngredient(ingredient: Ingredient): Observable<Ingredient> {
    return this.http.put<Ingredient>(`${this.apiUrl}/modifyingredient`, ingredient, { headers: this.getHeaders() });
  }

  destroyIngredient(ingredient: Ingredient): Observable<any> {
    return this.http.delete(`${this.apiUrl}/destroyingredient/${ingredient.id}`, { headers: this.getHeaders() });
  }

  modifyRecipe(recipe: Recipe): Observable<Recipe> {
    return this.http.put<Recipe>(`${this.apiUrl}/modifyrecipe`, recipe, { headers: this.getHeaders() });
  }
  modifyUserRecipe(recipe: Recipe): Observable<Recipe> {
    return this.http.put<Recipe>(`${this.apiUrl}/modifyuserrecipe`, recipe, { headers: this.getHeaders() });
  }

  deleteIngredientFromRecipe(recipeIngredient: RecipeIngredient): Observable<any> {
    const params = new HttpParams()
      .set('recipe_id', recipeIngredient.recipe_id.toString())
      .set('ingredient_id', recipeIngredient.ingredient_id.toString());
    return this.http.delete(`${this.apiUrl}/deleteingredients`, { headers: this.getHeaders(), params });
  }

  toggleFeaturedRecipe(recipe: Recipe): Observable<Recipe> {
    return this.http.put<Recipe>(`${this.apiUrl}/toggle-featured`, recipe, { headers: this.getHeaders() });
  }

  approveRecipe(recipe: Recipe): Observable<Recipe> {
    return this.http.put<Recipe>(`${this.apiUrl}/approve-recipe`, recipe, { headers: this.getHeaders() });
  }
}