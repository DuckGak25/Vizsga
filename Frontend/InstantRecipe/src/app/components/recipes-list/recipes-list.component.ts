import { ChangeDetectorRef, Component } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Recipe } from '../../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../../models/ingredient.model';
import { RawEditorOptions } from 'tinymce';
import { RecipeIngredient } from '../../models/recipe-ingredient.model';

@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrl: './recipes-list.component.css'
})
export class RecipesListComponent {
  ingredients: Ingredient[] = [];
  editButton = "";
  deleteButton = "";
  saveButton = "";
  recipes: Recipe[] = [];
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};

  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: ''
  }
  recipeIngredient: RecipeIngredient = {
    id: 0,
    recipe_id: 0,
    ingredient_id: 0,
    quantity: ''
  };

  selectedRecipeId: number = 0;
  searchTerm: string = '';

  isVisible: boolean = false;
  modalTitle = '';
  modalContent = '';

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

  constructor(private config: ConfigService, private recipeService: RecipeService, private cdr: ChangeDetectorRef){
    this.getIngredientsList();
    this.getRecipes();
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
  
  

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.editButton = content.editButton
      this.deleteButton = content.deleteButton
      this.saveButton = content.saveButton

    });
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }


  getIngredientsList() {
    this.recipeService.getIngredients().subscribe((ingredients: Ingredient[]) => {
      this.ingredients = ingredients;
      this.categorizeIngredients();
    });

  }

  editRecipe(recipe: Recipe) {
    this.selectedRecipeId = recipe.id;
    this.selectedIngredients.clear();
    this.recipeIngredient.recipe_id = recipe.id;
    
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
    this.recipeService.deleteRecipe(recipe.id).subscribe(() => {
      this.recipes = this.recipes.filter((r) => r.id !== recipe.id);
      this.modalContent = `Sikeresen törölted a receptet: ${recipe.title}`;
    }, (error) => {
      console.error('Hiba a recept törlése közben', error);
    });
  }

  // Modális ablak bezárása
  close() {
    AOS.init({
          once: true
        });
    this.isVisible = false;
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
      this.getIngredientsList();
      
      await this.getRecipes();
    } catch (error) {
      console.error('Error adding ingredient', error);
    }
  }

  getRecipes() {
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.recipes = data;
      console.log(this.recipes);
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
  
    // Az összes checkbox alapállapotba állítása
    const checkboxes = document.querySelectorAll<HTMLInputElement>('input[type="checkbox"]');
    checkboxes.forEach(checkbox => checkbox.checked = false);
  
    this.cdr.detectChanges(); // ChangeDetectorRef frissítés
  }
  

  saveRecipe(recipe: Recipe) {
      this.recipeService.modifyRecipe(recipe).subscribe(() => {
        this.modalContent = `Sikeresen mentetted a receptet: ${recipe.title}`;
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
      
      alert('Sikeresen hozzáadtad a receptet!');
      this.getRecipes();
      this.selectedIngredients.clear();
    }

  deleteIngredientFromRecipe(ingredient: Ingredient) {
    this.recipeIngredient.ingredient_id = ingredient.id;
    this.recipeService.deleteIngredientFromRecipe(this.recipeIngredient).subscribe(() => {
      console.log(`Sikeresen törölted a hozzávalót: ${ingredient.name}`);
      this.getRecipes();
      
    });
    this.recipeService.getIngredients().subscribe((ingredients: Ingredient[]) => {
      this.ingredients = [...ingredients]; 
      this.cdr.detectChanges();
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
        this.getRecipes();},
      (error) => {
        console.error(error);
      })
      
    };
}

  
  
  
  
  

