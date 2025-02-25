// src/app/components/recipe-detail/recipe-detail.component.ts
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { RecipeService } from '../recipe.service';
import { Recipe } from '../models/recipe.model';
import { Ingredient } from '../models/ingredient.model';
import { ConfigService } from '../config.service';

@Component({
  selector: 'app-recipe-detail',
  templateUrl: './recipe-detail.component.html',
  styleUrls: ['./recipe-detail.component.css']
})
export class RecipeDetailComponent implements OnInit {
  recipe: Recipe | undefined;

  ingredientsHeaderTitle: string = '';
  descriptionTitle: string = '';
  actLang = "Magyar";

  constructor(
    private route: ActivatedRoute,
    private recipeService: RecipeService,
    private config: ConfigService
  ) {}


  ngOnInit(): void {
    const id:any = this.route.snapshot.paramMap.get('id'); 
    if (id) {
      this.recipeService.getRecipeById(id).subscribe(
        (data: Recipe) => {
          this.recipe = data;
        },
        (error) => {
          console.error('Error fetching recipe:', error);
        }
      );
    }

    this.loadContent();
  }

  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.ingredientsHeaderTitle = content.ingredientsHeaderTitle || '';
      this.descriptionTitle = content.descriptionTitle || '';
    });
  }
}
