import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Ingredient } from '../models/ingredient.model';
import { Recipe } from '../models/recipe.model';
import { ConfigService } from '../config.service';
import { ViewportScroller } from '@angular/common';

@Component({
  selector: 'app-pantry',
  templateUrl: './pantry.component.html',
  styleUrls: ['./pantry.component.css']
})
export class PantryComponent {
  ingredients: Ingredient[] = [];
  categorizedIngredients: { [key: string]: Set<string> } = {};
  selectedIngredients: Set<string> = new Set();
  allRecipes: Recipe[] = [];
  filteredRecipes: Recipe[] = [];
  searchTerm: string = '';
  defaultIngredients: Ingredient[] = []
  pantryHeaderTitle = "";
  pantryHeaderText = "";
  ingredientsHeaderTitle = "";
  showrecipe = "";
  showingredients = "";
  selectedIngredientsTitle = ""
  searchForIngredients = ""
  deleteSelected = ""
  langSign = ""

  showRecipes = true;
  show = this.showrecipe;
  andIncluded = false;
  orIncluded = true;
  AND = "";
  OR = "";

  constructor(private recipeService: RecipeService, private config: ConfigService, private vps:ViewportScroller, private cdRef: ChangeDetectorRef) {
    this.langSign = config.langSign
    this.toggleRecipes();
    this.recipeService.getIngredients().subscribe((data: Ingredient[]) => {
      this.ingredients = data.filter(ingredient => ingredient.language === this.langSign);
      this.categorizeIngredients();
      this.restoreSelectedIngredients();
    });

    
    this.loadContent();
  }

  ngOnInit() {
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
      this.allRecipes = data.filter(recipe => recipe.language === this.langSign);
      this.filteredRecipes = this.allRecipes;
      this.cdRef.detectChanges(); 
    });

    
  }
  
  navigateTo(url: string) {
    window.location.href = url;
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.pantryHeaderTitle = content.pantryHeaderTitle || '';
      this.pantryHeaderText = content.pantryHeaderText || '';
      this.ingredientsHeaderTitle = content.ingredientsHeaderTitle || '';
      this.AND = content.AND || '';
      this.OR = content.OR || '';
      this.showrecipe = content.showrecipe || '';
      this.showingredients = content.showingredients || '';
      this.show = this.showrecipe;
      this.selectedIngredientsTitle = content.selectedIngredientsTitle || '';
      this.searchForIngredients = content.searchForIngredients || '';
      this.deleteSelected = content.deleteSelected || '';
    });
  }


  filterRecipes() {
    if (this.selectedIngredients.size === 0) {
      this.filteredRecipes = this.allRecipes;
      return;
    }
    if (this.andIncluded) {
      this.filteredRecipes = this.allRecipes.filter(recipe =>
        Array.from(this.selectedIngredients).every(ingredient =>
          recipe.ingredients.some(i => i.name === ingredient)
        )
      );
    } else if (this.orIncluded) {
      this.filteredRecipes = this.allRecipes.filter(recipe =>
        Array.from(this.selectedIngredients).some(ingredient =>
          recipe.ingredients.some(i => i.name === ingredient)
        )
      );
    }
  }
  

  onIngredientChange(event: Event, ingredient: string) {
    const checkbox = event.target as HTMLInputElement;
    if (checkbox.checked) {
      this.selectedIngredients.add(ingredient);
    } else {
      this.selectedIngredients.delete(ingredient);
      checkbox.checked = false;
    }
    this.filterRecipes();
    this.saveSelectedIngredients();
  }

  categorizeIngredients(): void {
    this.ingredients.forEach(ingredient => {
      const category = ingredient.category || 'Uncategorized';
  
      if (category === 'alapvető' || category === 'basic') {
        this.defaultIngredients.push(ingredient);
        return;
      }
  
      if (!this.categorizedIngredients[category]) {
        this.categorizedIngredients[category] = new Set();
      }
      this.categorizedIngredients[category].add(ingredient.name);
    });
  }

  filterIngredients(ingredients: Set<string>): string[] {
    if (!this.searchTerm) {
      this.filterRecipes();
      return Array.from(ingredients);
    }
    const lowerCaseSearchTerm = this.searchTerm.toLowerCase();
    return Array.from(ingredients).filter(ingredient => ingredient.toLowerCase().includes(lowerCaseSearchTerm));
  }

  clearSelectedIngredients() {
    if (this.langSign==="hu") {
      this.selectedIngredients.clear();
      localStorage.removeItem('selectedIngredientsHu');
    } if (this.langSign==="en") {
      this.selectedIngredients.clear();
      localStorage.removeItem('selectedIngredientsEn');
    }

    this.filteredRecipes = this.allRecipes;
  

  }
  
  restoreSelectedIngredients() {
    if (this.langSign==="hu") {
      const savedIngredients = localStorage.getItem('selectedIngredientsHu');
      const checkboxes = document.querySelectorAll<HTMLInputElement>('input[type="checkbox"]');
      if (savedIngredients) {
        const ingredientsArray = JSON.parse(savedIngredients);
        ingredientsArray.forEach((ingredient: string) => this.selectedIngredients.add(ingredient));
        this.filterRecipes();
      }
    } if (this.langSign==="en") {
      const savedIngredients = localStorage.getItem('selectedIngredientsEn');
      const checkboxes = document.querySelectorAll<HTMLInputElement>('input[type="checkbox"]');
      if (savedIngredients) {
        const ingredientsArray = JSON.parse(savedIngredients);
        ingredientsArray.forEach((ingredient: string) => this.selectedIngredients.add(ingredient));
        this.filterRecipes();
      }
    }

  }

  saveSelectedIngredients() {
    if (this.langSign==="hu") {
      localStorage.setItem('selectedIngredientsHu', JSON.stringify(Array.from(this.selectedIngredients)));  
    } if (this.langSign==="en") {
      localStorage.setItem('selectedIngredientsEn', JSON.stringify(Array.from(this.selectedIngredients)));
    }
    
  }

  toggleAndIncluded() {
    if (this.andIncluded) {
      this.andIncluded = false;
      this.orIncluded = true;
      this.filterRecipes();
    } else{
      this.andIncluded = true;
      this.orIncluded = false;
      this.filterRecipes();
    }
  }
  
  toggleOrIncluded() {
    if (this.orIncluded) {
      this.andIncluded = true;
      this.orIncluded = false;
      this.filterRecipes();
    } else{
      this.andIncluded = false;
      this.orIncluded = true;
      this.filterRecipes();
    }
  }

  toggleRecipes() {
    if (this.showRecipes) {
      this.showRecipes = false;
      this.vps.scrollToPosition([0,0]);
      this.show = this.showrecipe;
    } else {
      this.showRecipes = true;
      this.vps.scrollToPosition([0,0]);
      this.show = this.showingredients;
    }
  }
}
