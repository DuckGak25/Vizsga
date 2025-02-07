import { Component, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { EditorComponent } from '@tinymce/tinymce-angular';
import { RawEditorOptions } from 'tinymce';

@Component({
  selector: 'app-add-recipe',
  templateUrl: './add-recipe.component.html',
  styleUrls: ['./add-recipe.component.css'],

})
export class AddRecipeComponent implements OnInit {
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<string> } = {};
  selectedIngredients: Set<string> = new Set();
  ingredientQuantities: { [key: string]: string } = {};
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

  editorConfig: any = {
    height: 450,
    menubar: false,
    directionality: 'ltr',
    plugins: `
      advlist autolink link image lists charmap preview anchor 
      searchreplace visualblocks code fullscreen insertdatetime wordcount
    `, 
    toolbar: 'undo redo | bold italic underline | formatselect |  bullist numlist  | removeformat',

  };
  
  constructor(private recipeService: RecipeService) {}

  ngOnInit(): void {
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

  categorizeIngredients(): void {
    this.ingredients.forEach(ingredient => {
      const category = ingredient.category || 'Uncategorized';
      if (!this.categorizedIngredients[category]) {
        this.categorizedIngredients[category] = new Set();
      }
      this.categorizedIngredients[category].add(ingredient.name);
    });
  }

  // Összetevők kiválasztása
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

  // Receptek szűrése
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

  // Kiválasztott összetevők visszaállítása
  restoreSelectedIngredients() {
    const savedIngredients = localStorage.getItem('selectedIngredients');
    if (savedIngredients) {
      const ingredientsArray = JSON.parse(savedIngredients);
      ingredientsArray.forEach((ingredient: string) => this.selectedIngredients.add(ingredient));
      this.filterRecipes();
    }
  }

  // Kiválasztott összetevők mentése
  saveSelectedIngredients() {
    localStorage.setItem('selectedIngredients', JSON.stringify(Array.from(this.selectedIngredients)));
  }

  createRecipe(): void {
    console.log('Küldött recept adatok:', this.newRecipe);
    this.recipeService.createRecipe(this.newRecipe).subscribe(response => {
      console.log('Recipe created successfully', response);
      this.resetForm();
    }, error => {
      console.error('Error creating recipe', error);
    });
  }

  updateDescription(event: any): void {
    this.newRecipe.description = event.level.content;
  }
  

  // Űrlap törlése
  resetForm() {
    this.newRecipe = { id: 0, title: '', description: '', categories: '', ingredients: [] };
  }
}
