import { ChangeDetectorRef, Component } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Recipe } from '../../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../../models/ingredient.model';
import { RawEditorOptions } from 'tinymce';
import { RecipeIngredient } from '../../models/recipe-ingredient.model';
import { Pipe, PipeTransform } from '@angular/core';
import { ViewportScroller } from '@angular/common';


@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrl: './recipes-list.component.css'
})
export class RecipesListComponent {
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
  descriptionTitle = "";
  requirementTitle = "";
  categoryTitle = "";
  selectedIngredientsTitle = "";
  deleteSelected = "";
  searchForIngredients = "";
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
  recipes: Recipe[] = [];
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};
  pendingRecipes: any[] = [];
  filterPending: boolean = false;
  filterLanguage: string = '';
  showModal = false
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
  recipeOpened = false



  actLang = "Magyar";
  // recipeIngredientsMap: { [key: number]: Ingredient[] } = {};






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
  recipeIngredientsMap: any;

  constructor(private config: ConfigService, private recipeService: RecipeService, private vps:ViewportScroller) {
    this.getIngredientsList();
    this.getRecipes();
    this.filterPendingRecipes();
    this.filterRecipes()
    this.langSign = config.langSign
  }

  // open() {

  //   this.isVisible = true;
  //   AOS.init({
  //     once: true
  //   });
  // }


  ngOnInit() {
    this.loadContent();

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
      

    });
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }


  // getIngredientsList() {
  //   this.recipeService.getIngredients().subscribe((ingredients: Ingredient[]) => {
  //     this.ingredients = ingredients;
  //     this.categorizeIngredients();
  //   });

  // }
  private ingredientsLoaded = false;

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
        this.modalContent = `Sikeresen törölted a receptet: ${recipe.title}`;
        this.showModal = true;
      },
      error: (error) => {
        this.modalContent = 'Hiba a recept törlésekor';
        this.showModal = true;
        console.error('Hiba a recept törlése közben', error);
      }
    });
  }
  

  // Modális ablak bezárása
  close() {
    AOS.init({
          once: true
        });
    this.showModal = false;
  }

  // getRecipeWithIngredients(recipeId: number) {
  //   this.recipeService.getRecipeWithIngredients(recipeId).subscribe((recipe) => {
  //     this.recipeIngredientsMap[recipe.id] = recipe.ingredients;
  //     console.log(this.recipeIngredientsMap);
  //   })
  // }
  

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

  async postIngredient(ingredient: Ingredient) {
    try {
      const response = await this.recipeService.postIngredients(ingredient).toPromise();
      console.log('Ingredient added successfully', response);
      if (this.langSign === "hu") {
        this.showModal = true;
        this.modalContent = "Sikeresen hozzáadtad a hozzávalót!"
      } else {
        this.showModal = true;
        this.modalContent = "Successfully added the ingredient!"
      }
  
      this.updateIngredientsList();
  
    } catch (error) {
      if (this.langSign === "hu") {
        this.showModal = true;
        this.modalContent = "Hozzávaló hozzáadása sikertelen!"
      } else {
        this.showModal = true;
        this.modalContent = "Unable to add the ingredient!"
      }
      console.error('Error adding ingredient', error);
    }
  }
  

  getRecipes() {
    if (this.filterPending || this.searchTermRecipes != '') {
      this.filterRecipes();
    } else if (this.filterLanguage === 'hu') {
      this.recipeService.getHungarianRecipes().subscribe((data: Recipe[]) => {
        this.recipes = data;
        console.log(this.recipes);
      })
    } else if (this.filterLanguage === 'en') {
      this.recipeService.getEnglishRecipes().subscribe((data: Recipe[]) => {
        this.recipes = data;
        console.log(this.recipes);
      })}
    // else if (!this.searchTermRecipes) {
    //   this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
    //     this.recipes = data;
    //     console.log(this.recipes);
    //   });
    // }
    else {
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
        this.modalContent = `Sikeresen mentetted a receptet: ${recipe.title}`;
        this.showModal = true;
        this.closeRecipe();
        this.vps.scrollToPosition([0,0]);
      });
      this.addIngredients();
      this.getRecipes();

  }

  // addIngredients() {
  //     const ingredientDataArray = Array.from(this.selectedIngredients).map(ingredient => ({
  //       recipe_id: this.selectedRecipeId,
  //       ingredient_id: ingredient.id,
  //       quantity: this.ingredientQuantities[ingredient.id] || ''
  //     }));
    
  //     for (let i = 0; i < ingredientDataArray.length; i++) {
  //       const ingredientData = ingredientDataArray[i];
  //       this.recipeService.addIngredients(ingredientData).subscribe(
  //         (response) => {
  //           console.log(`Hozzávaló ${i + 1} sikeresn hozzáadva`, response);
  //         },
  //         (error) => {
  //           console.error(`Hiba a hozzávaló ${i + 1} hozzáadásakor`, error);
  //           if (error.error && error.error.errors) {
  //             console.error('Validációs hiba:', error.error.errors);
  //           }
  //         }
  //       );
  //     }
      
  //     alert('Sikeresen hozzáadtad a receptet!');
  //     this.getRecipes();
  //     this.selectedIngredients.clear();
  //   }

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
            this.getIngredientsList(); // Csak az utolsó elem hozzáadása után frissít
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
        console.log('Ingredient deleted successfully', response, ingredient);
        console.log(`Sikeresen törölted a hozzávalót: ${ingredient.name}`);
        this.getRecipes();
        this.updateIngredientsList();
      },
      error: (error) => {
        this.showModal = true;
        this.modalContent = `Hiba a hozzávaló törlésekor: ${ingredient.name}`;
        console.error('Hiba a hozzávaló törlése közben', error);
      }
    });
  }
  
  // updateIngredientsList() {
  //   this.recipeService.getIngredients().subscribe({
  //     next: (ingredients: Ingredient[]) => {
  //       this.ingredients = [...ingredients]; 
  //       this.cdr.detectChanges();
  //     },
  //     error: (error) => {
  //       console.error('Hiba az összetevők frissítése közben', error);
  //     }
  //   });
  //}
  updateIngredientsList() {
    this.recipeService.getIngredients().subscribe({
      next: (ingredients: Ingredient[]) => {
        this.ingredients = [...ingredients]; 
      },
      error: (error) => {
        this.showModal = true;
        this.modalContent = 'Hiba az összetevők frissítésekor';
        console.error('Hiba az összetevők frissítése közben', error);
      }
    });
  }
  

  saveIngredient() {
    const ingredientDataArray = Array.from(this.selectedIngredients).map(ingredient => ({
      recipe_id: this.selectedRecipeId,
      ingredient_id: ingredient.id,
      quantity: this.ingredientQuantities[ingredient.id] || ''
    }));
  
    for (let i = 0; i < ingredientDataArray.length; i++) {
      const ingredientData = ingredientDataArray[i];
      this.recipeService.addIngredients(ingredientData).subscribe(
        (response) => {
          console.log(`Hozzávaló ${i + 1} sikeresn hozzáadva`, response);
        },
        (error) => {
          console.error(`Hiba a hozzávaló ${i + 1} hozzáadásakor`, error);
          if (error.error && error.error.errors) {
            console.error('Validációs hiba:', error.error.errors);
          }
        }
      );
    }
  
    this.selectedIngredients.clear();
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
        console.log(this.pendingRecipes);
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







  
  
  
  
  

