import { Component } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Ingredient } from '../../models/ingredient.model';
import { lastValueFrom } from 'rxjs';

@Component({
  selector: 'app-ingredients-list',
  templateUrl: './ingredients-list.component.html',
  styleUrl: './ingredients-list.component.css'
})
export class IngredientsListComponent {
  ingredients: Ingredient[] = [];
  searchTerm: string = '';
  defaultIngredients: Ingredient[] = []
  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: ''
  }


  actLang = "Magyar";
  editButton = "";
  deleteButton: any;
  saveButton: any;

  constructor(private config: ConfigService, private recipeService: RecipeService) {
    
    this.getRecipes();
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

  getRecipes() {
    this.recipeService.getIngredients().subscribe(ingredients => {
      this.ingredients = ingredients
    })
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
  

  editIngredient(ingredient: Ingredient) {
    this.recipeService.modifyIngredient(ingredient).subscribe(
      response => {
        console.log('Ingredient modified successfully', response);
      },
      error => {
        console.error('Error modifying ingredient', error);
      }
    );
  }

  async deleteIngredient(ingredient: Ingredient) {
    try {
      const response = await lastValueFrom(this.recipeService.destroyIngredient(ingredient));
      console.log('Ingredient deleted successfully', response);
  
      await this.getRecipes();
    } catch (error) {
      console.error('Error deleting ingredient', error);
    }
  }

  filterIngredients(): Ingredient[] {
    if (!this.newIngredient.name && !this.newIngredient.category) {
      return this.ingredients;
    }
    const lowerCaseName = this.newIngredient.name ? this.newIngredient.name.toLowerCase() : '';
    const lowerCaseCategory = this.newIngredient.category ? this.newIngredient.category.toLowerCase() : '';
  
    return this.ingredients.filter(ingredient => {
      const matchesName = lowerCaseName ? ingredient.name.toLowerCase().includes(lowerCaseName) : true;
      const matchesCategory = lowerCaseCategory ? ingredient.category.toLowerCase().includes(lowerCaseCategory) : true;
  
      return matchesName && matchesCategory;
    });
  }


}
