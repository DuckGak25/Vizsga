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
      this.restoreSelectedIngredients();
    });

    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.allRecipes = data;
      this.filteredRecipes = this.allRecipes;
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

    this.filterRecipes();
    this.saveSelectedIngredients();
  }

  filterRecipes() {
    if (this.selectedIngredients.size === 0) {
      this.filteredRecipes = this.allRecipes;
    } else {
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
    this.selectedIngredients.clear();
    localStorage.removeItem('selectedIngredients');
    this.filteredRecipes = this.allRecipes;
  }

  restoreSelectedIngredients() {
    const savedIngredients = localStorage.getItem('selectedIngredients');
    if (savedIngredients) {
      const ingredientsArray = JSON.parse(savedIngredients);
      ingredientsArray.forEach((ingredient: string) => this.selectedIngredients.add(ingredient));
      this.filterRecipes();
    }
  }

  saveSelectedIngredients() {
    localStorage.setItem('selectedIngredients', JSON.stringify(Array.from(this.selectedIngredients)));
  }
}
