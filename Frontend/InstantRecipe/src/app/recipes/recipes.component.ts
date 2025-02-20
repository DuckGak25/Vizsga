import { Component, Input, OnInit } from '@angular/core';
import { RecipeService } from '../recipe.service';
import { Recipe } from '../models/recipe.model';
import AOS from 'aos';
import { Ingredient } from '../models/ingredient.model';

@Component({
  selector: 'app-recipes',
  templateUrl: './recipes.component.html',
  styleUrls: ['./recipes.component.css']
})
export class RecipesComponent implements OnInit {
  @Input() filteredRecipes: Recipe[] = [];
  recipes: Recipe[] = [];
  ingredients: Ingredient[] = [];

  constructor(private recipeService: RecipeService) {}

  ngOnInit(): void {
    AOS.init({
      once: true
    });

  }

  getIngredients(ingredient: Ingredient): string[] {
     return Object.keys(this.ingredients);
   }


}
