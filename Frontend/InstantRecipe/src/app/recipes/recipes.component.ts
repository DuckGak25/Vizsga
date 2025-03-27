import { Component, Input, OnInit } from '@angular/core';
import { Recipe } from '../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../models/ingredient.model';
import { RecipeService } from '../services/recipe.service';
import { ConfigService } from '../services/config.service';


@Component({
  selector: 'app-recipes',
  templateUrl: './recipes.component.html',
  styleUrls: ['./recipes.component.css']
})
export class RecipesComponent {
  @Input() filteredRecipes: Recipe[] = [];
  recipes: Recipe[] = [];
  ingredients: Ingredient[] = [];
  ingredientsHeaderTitle = "Ingredients";
  actLang = 'Magyar';
  langSign = ""
  

  constructor(private recipeService: RecipeService, private config: ConfigService) {
    this.loadContent()
    this.langSign = config.langSign 
  }

  ngOnInit(): void {
    AOS.init({
      once: true
    });
    this.loadContent()

  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.ingredientsHeaderTitle = content.ingredientsHeaderTitle
    });
  }

  getIngredients(ingredient: Ingredient): string[] {
     return Object.keys(this.ingredients);
   }

   navigateTo(url: string) {
    window.location.href = url;
  }
}
