import { Component, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';

@Component({
  selector: 'app-add-recipe',
  templateUrl: './add-recipe.component.html',
  styleUrls: ['./add-recipe.component.css']
})
export class AddRecipeComponent implements OnInit {
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<string> } = {};
  selectedIngredients: Set<string> = new Set();
  allRecipes: Recipe[] = [];
  filteredRecipes: Recipe[] = [];
  searchTerm: string = '';

  newRecipe: Recipe = {
    id: 0,
    title: '',
    description: '',
    categories: '',
    ingredients: []
  };

  constructor(private recipeService: RecipeService) {}

  ngOnInit(): void {
    // Összetevők betöltése
    this.recipeService.getIngredients().subscribe((data: Ingredient[]) => {
      this.ingredients = data;
      this.categorizeIngredients();
    });

    // Receptek betöltése
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.allRecipes = data;
      this.filteredRecipes = this.allRecipes;
    });
  }

  // Összetevők kategorizálása
  categorizeIngredients(): void {
    this.ingredients.forEach(ingredient => {
      const category = ingredient.category || 'Uncategorized';
      if (!this.categorizedIngredients[category]) {
        this.categorizedIngredients[category] = new Set();
      }
      this.categorizedIngredients[category].add(ingredient.name);
    });
  }



  // Összetevők szűrése a keresési kifejezés alapján
  filterIngredients(ingredients: Set<string>): string[] {
    if (!this.searchTerm) {
      return Array.from(ingredients);
    }
    const lowerCaseSearchTerm = this.searchTerm.toLowerCase();
    return Array.from(ingredients).filter(ingredient =>
      ingredient.toLowerCase().includes(lowerCaseSearchTerm)
    );
  }

  // Kiválasztott összetevők törlése
  clearSelectedIngredients() {
    this.selectedIngredients.clear();
    localStorage.removeItem('selectedIngredients');
    this.filteredRecipes = this.allRecipes;
  }

 

  // Kiválasztott összetevők mentése
  saveSelectedIngredients() {
    localStorage.setItem('selectedIngredients', JSON.stringify(Array.from(this.selectedIngredients)));
  }

  // Új recept létrehozása
  createRecipe() {
    this.recipeService.createRecipe(this.newRecipe).subscribe(response => {
      console.log('Recipe created successfully', response);
      this.resetForm();
    }, error => {
      console.error('Error creating recipe', error);
    });
  }

  // Űrlap törlése
  resetForm() {
    this.newRecipe = { id: 0, title: '', description: '', categories: '', ingredients: [] };
  }
}
