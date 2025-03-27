import { ChangeDetectorRef, Component, ViewChild } from '@angular/core';

import { Recipe } from '../../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../../models/ingredient.model';
import { RawEditorOptions } from 'tinymce';
import { RecipeIngredient } from '../../models/recipe-ingredient.model';
import { Pipe, PipeTransform } from '@angular/core';
import { ViewportScroller } from '@angular/common';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { ConfigService } from '../../services/config.service';
import { RecipeService } from '../../services/recipe.service';


@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrl: './recipes-list.component.css'
})
export class RecipesListComponent {
  @ViewChild('content') content: any;
  searchTermRecipes: string = ''; 
  searchTerm: string = ''; 
  ingredients: Ingredient[] = [];
  editButton = "";
  deleteButton = "";
  saveButton = "";
  waitingForApprove = "";
  approve = "";
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
  searchTitle = ""
  imageLink = "";
  ingredientsTitle = "";
  createRecipeTitle = "";
  recipesHeaderTitle = "";
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

  recipes: Recipe[] = [];
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};
  pendingRecipes: any[] = [];
  filterPending: boolean = false;
  filterLanguage: string = '';
  showModal: boolean = false;
  modalTitle = '';
  modalContent = '';
  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: '',
    language: '',
  }
  recipeIngredient: RecipeIngredient = {
    id: 0,
    recipe_id: 0,
    ingredient_id: 0,
    quantity: ''
  };
  selectedRecipeId: number = 0;

  actLang = "Magyar";
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


  constructor(private config: ConfigService, private recipeService: RecipeService, private vps:ViewportScroller, private modalService: NgbModal) {
    this.getIngredientsList();
    
    this.langSign = config.langSign
  }
  
  ngOnInit() {
    this.loadContent();
    this.getRecipes();

  }
  openModal() {
    this.modalService.open(this.content, { centered: true });
  }

  closeRecipe() {
    this.selectedRecipeId = 0
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
      this.recipesHeaderTitle = content.recipesHeaderTitle || '';
      this.ingredientName = content.ingredientName || '';
      this.addIngredient = content.addIngredient || '';
      this.operations = content.operations || '';
      this.preview = content.preview || '';
      this.addButton = content.addButton || '';
      this.everyRecipe = content.everyRecipe || '';
      this.searchForRecipes = content.searchForRecipes || '';
      this.closeButton = content.closeButton || '';
      this.pendingRecipesTitle = content.pendingRecipes || '';
      this.searchTitle = content.searchTitle || '';

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
    } else if (this.selectedRecipeId !== recipe.id) {
      this.selectedRecipeId = recipe.id;
    } else {
      this.selectedRecipeId = 0;
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
    this.recipeService.deleteRecipe(recipe.id).subscribe({
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

  getRecipes() {
    if (this.filterPending || this.searchTermRecipes != '') {
      this.filterRecipes();
    } else if (this.filterLanguage === 'hu') {
      this.recipeService.getHungarianRecipes().subscribe((data: Recipe[]) => {
        this.recipes = data;
      });
    } else if (this.filterLanguage === 'en') {
      this.recipeService.getEnglishRecipes().subscribe((data: Recipe[]) => {
        this.recipes = data;
      });
    } else {
      this.recipeService.getAllRecipes().subscribe((data: Recipe[]) => {
        this.recipes = data;
        console.log(this.recipes);
      });
    }
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
      this.recipeService.modifyRecipe(recipe).subscribe(() => {
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
      quantity: this.ingredientQuantities[ingredient.id]
    }));
  
    ingredientDataArray.forEach((ingredientData, index) => {
      this.recipeService.addIngredients(ingredientData).subscribe(
        (response) => {
          console.log(`Hozzávaló ${index + 1} sikeresen hozzáadva`, response);
          this.ingredientQuantities[ingredientData.ingredient_id] = '';
          this.searchTerm = '';
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



  toggleFeatured(recipe: Recipe) {
    recipe.featured = !recipe.featured;
    this.recipeService.toggleFeaturedRecipe(recipe).subscribe(
      (response) => { 
        console.log(response);
        this.getRecipes();
      },
      (error) => {
        console.error(error);
      })
      
    };
  
  approveRecipe(recipe: Recipe) {
    this.recipeService.approveRecipe(recipe).subscribe(
      (response) => {
        console.log(response);
        if (this.langSign === 'hu') {
          this.modalContent = 'Sikeresen elfogadtad a receptet! ('+ recipe.title + ')';
        } else if (this.langSign === 'en') {
          this.modalContent = 'Successfully approved the recipe!';
        }
        this.openModal();
        this.getRecipes();
      },
      (error) => {
        console.error(error);
      }
    );
  }

  filterPendingRecipes() {
    this.recipeService.getPendingRecipes().subscribe(
      (recipes) => {
        this.pendingRecipes = recipes;
      },
      (error) => {
        console.error('Hiba a recept betöltésénél:', error);
      }
    );
  }

  toggleFilter() {
    this.filterPending = !this.filterPending;
    this.getRecipes();
  }
  filterRecipes() {
    this.recipeService.getAllRecipes().subscribe((data: Recipe[]) => {
      let filteredRecipes = data;
      if (this.filterPending) {
        filteredRecipes = filteredRecipes.filter(recipe => !recipe.approved);
      }
      if (this.searchTermRecipes) {
        const lowerCaseSearchTerm = this.searchTermRecipes.toLowerCase();
        filteredRecipes = filteredRecipes.filter(recipe =>
          recipe.title.toLowerCase().includes(lowerCaseSearchTerm)
        );
      }
      if (this.filterLanguage === 'hu') {
        filteredRecipes = filteredRecipes.filter(recipe => recipe.language === 'hu');
      } else if (this.filterLanguage === 'en') {
        filteredRecipes = filteredRecipes.filter(recipe => recipe.language === 'en');
      }
  
      this.recipes = filteredRecipes;
    });
  }
}