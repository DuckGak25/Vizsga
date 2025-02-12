import { Component, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { RawEditorOptions } from 'tinymce';
import { CheckboxControlValueAccessor } from '@angular/forms';

@Component({
  selector: 'app-add-recipe',
  templateUrl: './add-recipe.component.html',
  styleUrls: ['./add-recipe.component.css'],
})
export class AddRecipeComponent implements OnInit {
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  allRecipes: Recipe[] = [];
  filteredRecipes: Recipe[] = [];
  searchTerm: string = '';
  createdRecipeId: number | null = null;
  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: ''
  }

  newRecipe: Recipe = {
    id: 0,
    title: '',
    description: '',
    categories: '',
    ingredients: [],
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

    this.getRecipes()
  }

  categorizeIngredients(): void {
    this.ingredients.forEach(ingredient => {
      const category = ingredient.category || 'Uncategorized';
      if (!this.categorizedIngredients[category]) {
        this.categorizedIngredients[category] = new Set();
      }
      this.categorizedIngredients[category].add(ingredient);
    });
  }


  onIngredientChange(event: Event, ingredient: Ingredient) {
    const checkbox = event.target as HTMLInputElement;
    if (checkbox.checked) {
      this.selectedIngredients.add(ingredient);
      

      if (!this.ingredientQuantities[ingredient.id]) {
        this.ingredientQuantities[ingredient.id] = '';
      }
    } else {
      this.selectedIngredients.delete(ingredient);
      delete this.ingredientQuantities[ingredient.id];
    }
    this.filterRecipes();
    this.saveSelectedIngredients();
  }

  removeIngredient(ingredient: Ingredient) {
    const checkbox = document.getElementById(`ingredient-${ingredient.id}`) as HTMLInputElement;
    checkbox.checked = false;
    this.selectedIngredients.delete(ingredient);
    this.filterRecipes();
    this.saveSelectedIngredients();
    this.ingredientQuantities[ingredient.id] = '';
  }
  


  filterRecipes() {
    if (this.selectedIngredients.size === 0) {
      this.filteredRecipes = this.allRecipes;
    } else {
      this.filteredRecipes = this.allRecipes.filter(recipe =>
        Array.from(this.selectedIngredients).some(ingredient =>
          recipe.ingredients.some(i => i.id === ingredient.id)
        )
      );
    }
  }


  filterIngredients(ingredients: Set<Ingredient>): Ingredient[] {
    if (!this.searchTerm) {
      return Array.from(ingredients);
    }
    const lowerCaseSearchTerm = this.searchTerm.toLowerCase();
    return Array.from(ingredients).filter(ingredient =>
      ingredient.name.toLowerCase().includes(lowerCaseSearchTerm)
    );
  }


  clearSelectedIngredients() {
    this.selectedIngredients.clear();
    localStorage.removeItem('selectedIngredients');
    this.filteredRecipes = this.allRecipes;
  }


  restoreSelectedIngredients() {

    const savedIngredients = localStorage.getItem('selectedIngredients');
    if (savedIngredients) {
      const ingredientsArray: Ingredient[] = JSON.parse(savedIngredients);
      ingredientsArray.forEach(ingredient => this.selectedIngredients.add(ingredient));
      this.filterRecipes();
    }
  }


  saveSelectedIngredients() {
    localStorage.setItem('selectedIngredients', JSON.stringify(Array.from(this.selectedIngredients)));
  }

  updateDescription(event: any): void {
    this.newRecipe.description = event.level.content;
  }

  updateIngredientQuantity(ingredientId: number, quantity: string) {
    this.ingredientQuantities[ingredientId] = quantity;
  }
  
  

  resetForm() {
    this.newRecipe = { id: 0, title: '', description: '', categories: '', ingredients: [] };
    this.selectedIngredients.clear();
  }

  createRecipe() {
    const recipeData: Recipe = {
      id: this.newRecipe.id,
      title: this.newRecipe.title,
      description: this.newRecipe.description,
      categories: this.newRecipe.categories,
      ingredients: [],
    };

    this.recipeService.createRecipe(recipeData).subscribe(
      (response: any) => {
        console.log('Recipe created successfully', response);
        this.createdRecipeId = response.id;
        this.addIngredients();
      },
      (error) => {
        console.error('Error creating recipe', error);
      }
    );

  }

  addIngredients() {
    if (!this.createdRecipeId) {
      console.error('No recipe ID found');
      return;
    }
  
    const ingredientData = {
      recipe_id: this.createdRecipeId,
      ingredients: Array.from(this.selectedIngredients).map(ingredient => ({
        ingredient_id: ingredient.id,
        quantity: this.ingredientQuantities[ingredient.id] || ''
      }))
    };
  
    this.recipeService.addIngredients(ingredientData).subscribe(
      (response) => {
        console.log('Ingredients added successfully', response);
        this.selectedIngredients.clear();
      },
      (error) => {
        console.error('Error adding ingredients', error);
      }
    )


  }

  async postIngredient(ingredient: Ingredient) {
    try {
      const response = await this.recipeService.postIngredients(ingredient).toPromise();
      console.log('Ingredient added successfully', response);
      
      await this.getRecipes();
    } catch (error) {
      console.error('Error adding ingredient', error);
    }
  }

  getRecipes() {
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.allRecipes = data;
      this.filteredRecipes = this.allRecipes;
    });
  }
  
}
