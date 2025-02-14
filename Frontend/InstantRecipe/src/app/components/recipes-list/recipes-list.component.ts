import { Component } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Recipe } from '../../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../../models/ingredient.model';
import { RawEditorOptions } from 'tinymce';

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
  selectedRecipeId: number | null = null;
  searchTerm: string = '';

  isVisible: boolean = false;

  modalTitle = '';
  modalContent = '';

  actLang = "Magyar";

  recipeIngredientsMap: { [key: number]: Ingredient[] } = {};




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

  constructor(private config: ConfigService, private recipeService: RecipeService){}

  // open() {

  //   this.isVisible = true;
  //   AOS.init({
  //     once: true
  //   });
  // }


  ngOnInit() {
    this.loadContent();
    
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.recipes = data;
      console.log('Receptek betöltve:', this.recipes);
  
      this.recipeService.getIngredients().subscribe((ingredients: Ingredient[]) => {
        this.ingredients = ingredients;
        this.categorizeIngredients();
      });
  
      this.recipeService.getRecipes().subscribe((recipes: Recipe[]) => {
        this.recipes = recipes;
      });
    });
  
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

  editRecipe(recipe: Recipe) {
    this.selectedRecipeId = recipe.id;
    this.selectedIngredients.clear();
    this.selectedIngredients = new Set(recipe.ingredients);
    // this.open();
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

  getRecipeWithIngredients(recipeId: number) {
    this.recipeService.getRecipeWithIngredients(recipeId).subscribe((recipe) => {
      this.recipeIngredientsMap[recipe.id] = recipe.ingredients;
      console.log(this.recipeIngredientsMap);
    })
  }
  

  removeIngredient(ingredient: Ingredient) {
    const checkbox = document.getElementById(`ingredient-${ingredient.id}`) as HTMLInputElement;
    checkbox.checked = false;
    this.selectedIngredients.delete(ingredient);
    this.ingredientQuantities[ingredient.id] = '';
  }

  updateIngredientQuantity(ingredientId: number, quantity: string) {
    this.ingredientQuantities[ingredientId] = quantity;
  }

  getIngredientQuantity(ingredient: Ingredient): string {
    return this.ingredientQuantities[ingredient.id] || ingredient.pivot?.quantity || 'N/A';
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
      this.recipes = data;
      console.log(this.recipes); // Ellenőrzés a konzolon
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
  }



  }
  
  
  

