import { Component, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { ConfigService } from '../config.service';

@Component({
  selector: 'app-pantry',
  templateUrl: './pantry.component.html',
  styleUrls: ['./pantry.component.css']
})
export class PantryComponent implements OnInit {
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<string> } = {};
  selectedIngredients: Set<string> = new Set();
  allRecipes: Recipe[] = [];
  filteredRecipes: Recipe[] = [];
  searchTerm: string = '';

  defaultIngredients: Ingredient[] = []

  pantryHeaderTitle = "";
  pantryHeaderText = "";

  constructor(private recipeService: RecipeService, private config: ConfigService) {}

  ngOnInit(): void {
    this.loadContent();
    this.recipeService.getIngredients().subscribe((data: Ingredient[]) => {
      this.ingredients = data;
      this.categorizeIngredients();
      this.restoreSelectedIngredients(); // Visszaállítjuk a kiválasztott összetevőket
    });

    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.allRecipes = data;
      this.filteredRecipes = this.allRecipes; // Kezdetben az összes receptet megjelenítjük
    });
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {

      this.pantryHeaderTitle = content.pantryHeaderTitle || '';
      this.pantryHeaderText = content.pantryHeaderText || '';

    });
  }

  categorizeIngredients(): void {
    this.ingredients.forEach(ingredient => {
      const category = ingredient.category || 'Uncategorized';
  
      if (category === 'alapvető') {
        this.defaultIngredients.push(ingredient);
        return;
      }
  
      if (!this.categorizedIngredients[category]) {
        this.categorizedIngredients[category] = new Set();
      }
      this.categorizedIngredients[category].add(ingredient.name);
    });
  }
  

  // filterIngredients(ingredient: Ingredient) {
  //    if (ingredient.category === "Alapvető") {
  //        this.ingredients.
  //      }
  //  }

  onIngredientChange(event: Event, ingredient: string) {
    const checkbox = event.target as HTMLInputElement;

    if (checkbox.checked) {
      this.selectedIngredients.add(ingredient);
    } else {
      this.selectedIngredients.delete(ingredient);
    }

    this.filterRecipes(); // Frissíti a szűrt recepteket
    this.saveSelectedIngredients(); // Mentjük a kiválasztott összetevőket a localStorage-ba
  }

  filterRecipes() {
    if (this.selectedIngredients.size === 0) {
      this.filteredRecipes = this.allRecipes; // Ha nincs kiválasztva összetevő, akkor az összes recept
    } else {
      // Kiválasztott összetevők alapján szűrjük a recepteket
      this.filteredRecipes = this.allRecipes.filter(recipe =>
        Array.from(this.selectedIngredients).some(ingredient =>
          recipe.ingredients.some(i => i.name === ingredient)
        )
      );
    }
  }

  filterIngredients(ingredients: Set<string>): string[] {
    if (!this.searchTerm) {
      return Array.from(ingredients);
    }
    const lowerCaseSearchTerm = this.searchTerm.toLowerCase();
    return Array.from(ingredients).filter(ingredient => ingredient.toLowerCase().includes(lowerCaseSearchTerm));
  }

  clearSelectedIngredients() {
    this.selectedIngredients.clear(); // Kiválasztott összetevők törlése
    localStorage.removeItem('selectedIngredients'); // Töröljük a tárolt állapotot
    this.filteredRecipes = this.allRecipes; // Az összes recept megjelenítése
  }

  restoreSelectedIngredients() {
    // Az előzőleg kiválasztott összetevők visszaállítása
    const savedIngredients = localStorage.getItem('selectedIngredients');
    if (savedIngredients) {
      const ingredientsArray = JSON.parse(savedIngredients);
      ingredientsArray.forEach((ingredient: string) => this.selectedIngredients.add(ingredient));
      this.filterRecipes(); // Szűrjük a recepteket a visszaállított összetevők alapján
    }
  }

  saveSelectedIngredients() {
    // Kiválasztott összetevők mentése a localStorage-ba
    localStorage.setItem('selectedIngredients', JSON.stringify(Array.from(this.selectedIngredients)));
  }
}
