import { Component, OnInit, ViewChild } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { RawEditorOptions } from 'tinymce';
import { CheckboxControlValueAccessor } from '@angular/forms';
import { AuthService } from '../services/auth.service';
import { ConfigService } from '../config.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-add-recipe',
  templateUrl: './add-recipe.component.html',
  styleUrls: ['./add-recipe.component.css'],
})
export class AddRecipeComponent {
  @ViewChild('content') content: any;
  addRecipe = "";
  recipeName = ""
  descriptionTitle = ""
  requirementTitle = ""
  categoryTitle = ""
  selectedIngredientsTitle = ""
  deleteSelected = ""
  searchForIngredients = ""
  imageLink = ""
  ingredientsTitle = ""
  createRecipeTitle = ""
  remove = ""
  quantity = ""
  actLang = "Magyar"
  langSign = ""
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<Ingredient> } = {};
  selectedIngredients: Set<Ingredient> = new Set();
  ingredientQuantities: { [key: number]: string } = {};
  allRecipes: Recipe[] = [];
  filteredRecipes: Recipe[] = [];
  searchTerm: string = '';
  createdRecipeId: number = 0;
  user: any = JSON.parse(localStorage.getItem('user') || '{}');
  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: '',
    language: '',
  }

  newRecipe: Recipe = {
    id: 0,
    title: '',
    description: '',
    categories: '',
    imagelink: '',
    featured: false,
    user_id: 0,
    approved: false,
    language: this.langSign,
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

  modalTitle = '';
  modalContent = '';
  
  constructor(private recipeService: RecipeService, private config: ConfigService, private modalService: NgbModal) {
    this.getIngredients()
    this.loadContent()
    this.newRecipe.language = config.langSign
    this.newIngredient.language = config.langSign
  }
  openModal() {
    this.modalService.open(this.content, { centered: true });
  }

  getIngredients() {
    this.recipeService.getIngredients().subscribe((data: Ingredient[]) => {
      this.ingredients = [];
      this.ingredients = data.filter(ingredient => ingredient.language === this.langSign);
      this.categorizeIngredients();
    });
  }

  ngOnInit(): void {
    this.langSign = this.config.langSign

  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.addRecipe = content.addRecipe || '';
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
    });
  }



  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
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
    const lowerCaseSearchTerm = this.searchTerm.toLowerCase();
    return Array.from(ingredients).filter(ingredient =>
      ingredient.name.toLowerCase().includes(lowerCaseSearchTerm)
    );
  }


  clearSelectedIngredients() {
    this.selectedIngredients.clear();
    localStorage.removeItem('selectedIngredientsAddRecipes');
    this.filteredRecipes = this.allRecipes;
  }

  saveSelectedIngredients() {
    localStorage.setItem('selectedIngredientsAddRecipes', JSON.stringify(Array.from(this.selectedIngredients)));
  }

  updateDescription(event: any): void {
    this.newRecipe.description = event.level.content;
  }

  updateIngredientQuantity(ingredientId: number, quantity: string) {
    this.ingredientQuantities[ingredientId] = quantity;
  }

  resetForm() {
    this.newRecipe = { id: 0, title: '', description: '', categories: '', imagelink: '', featured: false, user_id: 0, approved: false, language: this.langSign, ingredients: [] };
    this.selectedIngredients.clear();
  }

  createRecipe() {
    const recipeData: Recipe = {
      id: this.newRecipe.id,
      title: this.newRecipe.title,
      description: this.newRecipe.description,
      categories: this.newRecipe.categories,
      imagelink: this.newRecipe.imagelink,
      featured: this.newRecipe.featured,
      language: this.newRecipe.language,
      user_id: this.user.id,
      approved: false,
      ingredients: [],
    };
    this.recipeService.createRecipe(recipeData).subscribe(
      (response: any) => {
        this.openModal();
        if(this.langSign === 'hu'){
          this.modalContent = 'Sikeresen hozzáadtad a receptet!';
        }
        else if (this.langSign === 'en') {
          this.modalContent = 'Successfully added the recipe!';
        }
        console.log('Recipe created successfully', response);
        this.createdRecipeId = response.data.id;
        this.addIngredients();

      },
      (error) => {
        this.openModal();
        if (this.langSign === 'hu') { this.modalContent = 'Hiba a recept mentésekor';}
        else if (this.langSign === 'en') { this.modalContent = 'Error creating recipe';}
        console.error('Error creating recipe', error);
      }
    );
  }

  addIngredients() {
    if (!this.createdRecipeId) {
      console.error('A recept nem található!');
      return;
    }
  
      const ingredientDataArray = Array.from(this.selectedIngredients).map(ingredient => ({
        recipe_id: this.createdRecipeId,
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
    
  
  

    postIngredient(ingredient: Ingredient) {
      this.recipeService.postIngredients(ingredient).subscribe({
        next: (response) => console.log('Ingredient added successfully', response),
        error: (error) => console.error('Error adding ingredient', error)
      });
    }

  disableButton() {
    if (this.newRecipe.title === '' || this.newRecipe.description === '' || 
      this.newRecipe.categories === '' || this.newRecipe.imagelink === '' || 
      this.selectedIngredients.size === 0 || this.newIngredient.pivot?.quantity === '') 
      {
      return true;
    }
    return false;
  }

  
}
