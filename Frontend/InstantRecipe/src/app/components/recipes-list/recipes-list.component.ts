import { Component } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Recipe } from '../../models/recipe.model';
import AOS from 'aos';

@Component({
  selector: 'app-recipes-list',
  templateUrl: './recipes-list.component.html',
  styleUrl: './recipes-list.component.css'
})
export class RecipesListComponent {

  editButton = "";
  deleteButton = "";
  saveButton = "";
  recipes: Recipe[] = [];

  isVisible: boolean = false;

  modalTitle = '';
  modalContent = '';

  actLang = "Magyar";

  constructor(private config: ConfigService, private recipeService: RecipeService) {}

  open() {

    this.isVisible = true;
    AOS.init({
      once: true
    });
  }


  ngOnInit() {
    this.loadContent();
    this.recipeService.getRecipes().subscribe((data: Recipe[]) => {
          this.recipes = data;
          console.log(this.recipes); // Ellenőrzés a konzolon
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
  
  
  
}
