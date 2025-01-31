// src/app/components/recipe-detail/recipe-detail.component.ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { RecipeService } from '../recipe.service';
import { Recipe } from '../models/recipe.model';
import { Ingredient } from '../models/ingredient.model';

@Component({
  selector: 'app-recipe-detail',
  templateUrl: './recipe-detail.component.html',
  styleUrls: ['./recipe-detail.component.css']
})
export class RecipeDetailComponent implements OnInit {
  recipe: Recipe | undefined;

  constructor(
    private route: ActivatedRoute,
    private recipeService: RecipeService
  ) {}


  ngOnInit(): void {
    const id:any = this.route.snapshot.paramMap.get('id'); 
    if (id) {
      this.recipeService.getRecipeById(id).subscribe(
        (data: Recipe) => {
          this.recipe = data;
        },
        (error) => {
          console.error('Error fetching recipe:', error); // Hiba kezelés
        }
      );
    }
  }
}
