import { Component, ViewChild } from '@angular/core';
import { ConfigService } from '../config.service';
import { Router } from '@angular/router';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { RawEditorOptions } from 'tinymce';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ViewportScroller } from '@angular/common';
import { RecipeIngredient } from '../models/recipe-ingredient.model';

@Component({
  selector: 'app-user-recipes',
  templateUrl: './user-recipes.component.html',
  styleUrl: './user-recipes.component.css'
})
export class UserRecipesComponent {
  recipes: any[] = [];
  @ViewChild('content') content: any;
  searchTermRecipes: string = ''; 
  searchTerm: string = ''; 
  ingredients: Ingredient[] = [];
  editButton = "";
  deleteButton = "";
  saveButton = "";
  waitingForApprove = "";
  approve = "";
  recipe_id = 0;
  recipeName = "";
  preview = "";
  closeButton = ""
  descriptionTitle = "";
  requirementTitle = "";
  categoryTitle = "";
  selectedIngredientsTitle = "";
  deleteSelected = "";
  searchForIngredients = "";
  searchForRecipes = "";
  imageLink = "";
  ingredientsTitle = "";
  createRecipeTitle = "";
  userRecipesHeaderTitle = "";
  ingredientName = "";
  addIngredient = "";
  operations = "";
  remove = "";
  addButton = "";
  quantity = "";
  language = "";
  everyRecipe = "";
  langSign = ""
  pendingRecipesTitle=""
  modalContent = "";
  selectedRecipeId = 0;
  filteredRecipes: Recipe[] = [];
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};
  pendingRecipes: any[] = [];
  filterLanguage: string = '';
  showModal: boolean = false;
  actLang = "Magyar";
    recipeIngredient: RecipeIngredient = {
      id: 0,
      recipe_id: 0,
      ingredient_id: 0,
      quantity: ''
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

  constructor(private config: ConfigService, private router: Router, private recipeService: RecipeService, private modalService: NgbModal, private vps:ViewportScroller) {
    this.getRecipes();
    this.getIngredientsList();
    this.filterRecipes()
    this.langSign = config.langSign
  }
  ngOnInit() {
    this.loadContent();

  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.editButton = content.editButton
      this.deleteButton = content.deleteButton
      this.saveButton = content.saveButton
      this.waitingForApprove = content.waitingForApprove
      this.approve = content.approve
      this.recipeName = content.recipeName || '';
      this.descriptionTitle = content.descriptionTitle || '';
      this.requirementTitle = content.requirementTitle || '';
      this.categoryTitle = content.categoryTitle || '';
      this.selectedIngredientsTitle = content.selectedIngredientsTitle || '';
      this.deleteSelected = content.deleteSelected || '';
      this.searchForIngredients = content.searchForIngredients || '';
      this.imageLink = content.imageLink || '';
      this.ingredientsTitle = content.ingredientsHeaderTitle || '';
      this.createRecipeTitle = content.createRecipeTitle || '';
      this.remove = content.remove || '';
      this.quantity = content.quantity || '';
      this.userRecipesHeaderTitle = content.userRecipesHeaderTitle || '';
      this.ingredientName = content.ingredientName || '';
      this.addIngredient = content.addIngredient || '';
      this.operations = content.operations || '';
      this.preview = content.preview || '';
      this.addButton = content.addButton || '';
      this.everyRecipe = content.everyRecipe || '';
      this.searchForRecipes = content.searchForRecipes || '';
      this.closeButton = content.closeButton || '';
      this.pendingRecipesTitle = content.pendingRecipes || '';


    });
  }

  getRecipes() {
    this.recipeService.getUserRecipes().subscribe((recipes) => {
      this.recipes = recipes;
    });
  }

  openModal() {
    this.modalService.open(this.content, { centered: true });
  }

  closeRecipe() {
    this.selectedRecipeId = 0
  }
    filterRecipes() {
      this.recipeService.getUserRecipes().subscribe((data: Recipe[]) => {
        let filteredRecipes = data;

        if (this.searchTermRecipes) {
          const lowerCaseSearchTerm = this.searchTermRecipes.toLowerCase();
          filteredRecipes = filteredRecipes.filter(recipe =>
            recipe.title.toLowerCase().includes(lowerCaseSearchTerm)
          );
        }
        this.recipes = filteredRecipes;
      });
    }

  
    langChange(lang: any) {
      this.actLang = lang.text;
      this.config.changeLanguage(lang.sign);
    }

    getIngredientsList() {
      this.recipeService.getIngredients().subscribe(ingredients => {
        this.ingredients = ingredients
        this.categorizeIngredients();
      })
    }
  
    editRecipe(recipe: Recipe) {
      if (!this.selectedRecipeId) {
        this.selectedRecipeId = recipe.id;
        this.selectedIngredients.clear();
        this.recipeIngredient.recipe_id = recipe.id;
      }
      else if (this.selectedRecipeId === recipe.id) {
        this.selectedRecipeId = 0;
      } else {
        this.selectedRecipeId = 0
      }
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

    deleteRecipe(recipe: Recipe) {
      this.recipeService.deleteUserRecipe(recipe.id).subscribe({
        next: (response) => {
          console.log('Recipe deleted successfully', response);
          this.recipes = this.recipes.filter((r) => r.id !== recipe.id);
          if (this.langSign === "hu") {
            this.modalContent = `Sikeresen törölted a receptet: ${recipe.title}`;
            this.openModal();
          } else if (this.langSign === "en") {
            this.modalContent = `Successfully deleted the recipe: ${recipe.title}`;
            this.openModal();
          }
        },
        error: (error) => {
          this.modalContent = 'Hiba a recept törlésekor';
  
          console.error('Hiba a recept törlése közben', error);
          this.openModal();
        }
      });
    }
    
    removeIngredient(ingredient: Ingredient) {
      const checkbox = document.getElementById(`ingredient-${ingredient.id}`) as HTMLInputElement;
      checkbox.checked = false;
      this.selectedIngredients.delete(ingredient);
      this.ingredientQuantities[ingredient.id] = '';
      this.getRecipes();
    }
  
    getIngredients(ingredient: Ingredient): string[] {
      return Object.keys(this.ingredients);
    }
  
    updateIngredientQuantity(ingredientId: number, quantity: string) {
      this.ingredientQuantities[ingredientId] = quantity;
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
      const checkboxes = document.querySelectorAll<HTMLInputElement>('input[type="checkbox"] class="ingredient"');
      checkboxes.forEach(checkbox => checkbox.checked = false);
    }
    
  
    saveRecipe(recipe: Recipe) {
        this.recipeService.modifyUserRecipe(recipe).subscribe(() => {
          if (this.langSign === 'hu') {
            this.modalContent = `Sikeresen mentetted a receptet: ${recipe.title}`;
          } else if (this.langSign === 'en') {
            this.modalContent = `Successfully saved the recipe: ${recipe.title}`;
          }
          this.openModal();
          this.closeRecipe();
          this.vps.scrollToPosition([0,0]);
        });
        this.addIngredients();
        this.getRecipes();
    }
  
    addIngredients() {
      const ingredientDataArray = Array.from(this.selectedIngredients).map(ingredient => ({
        recipe_id: this.selectedRecipeId,
        ingredient_id: ingredient.id,
        quantity: this.ingredientQuantities[ingredient.id] || ''
      }));
      ingredientDataArray.forEach((ingredientData, index) => {
        this.recipeService.addIngredients(ingredientData).subscribe(
          (response) => {
            console.log(`Hozzávaló ${index + 1} sikeresen hozzáadva`, response);
            if (index === ingredientDataArray.length - 1) {
              this.getIngredientsList();
            }
          },
          (error) => {
            console.error(`Hiba a hozzávaló ${index + 1} hozzáadásakor`, error);
          }
        );
      });
      this.showModal = true;
      this.modalContent = 'Sikeresen hozzáadtad a hozzávalókat!';
      this.selectedIngredients.clear();
    }
    
    deleteIngredientFromRecipe(ingredient: Ingredient) {
      this.recipeIngredient.ingredient_id = ingredient.id;
    
      this.recipeService.deleteIngredientFromRecipe(this.recipeIngredient).subscribe({
        next: (response) => {
          if (this.langSign === "hu") { 
            console.log(`Sikeresen törölted a hozzávalót: ${ingredient.name}`);
          } else {
          console.log('Ingredient deleted successfully', response, ingredient);
          }
          this.getRecipes();
        },
        error: (error) => {
          if (this.langSign === "hu") {
            this.modalContent = `Hiba a hozzávaló törlésekor: ${ingredient.name}`;
          } else {
            this.modalContent = `Problem while deleting the ingredient: ${ingredient.name}`;
          }
          this.openModal()
          console.error('Hiba a hozzávaló törlése közben', error);
        }
      });
    }  
}