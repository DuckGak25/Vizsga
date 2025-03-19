import { Component, ViewChild } from '@angular/core';
import { ConfigService } from '../../config.service';
import { RecipeService } from '../../recipe.service';
import { Ingredient } from '../../models/ingredient.model';
import { lastValueFrom } from 'rxjs';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-ingredients-list',
  templateUrl: './ingredients-list.component.html',
  styleUrl: './ingredients-list.component.css'
})
export class IngredientsListComponent {
  @ViewChild('content') content: any;
  ingredients: Ingredient[] = [];
  searchTerm: string = '';
  defaultIngredients: Ingredient[] = []
  newIngredient: Ingredient = {
    id: 0,
    name: '',
    category: '',
    language: '',

  }
  langSign = "";

  addButton = "";
  ingredientsHeaderTitle = "";
  categoryTitle = "";
  ingredientName = "";
  language = ""
  actLang = "Magyar";
  editButton = "";
  ingredientsDescription = "";
  deleteButton: any;
  saveButton: any;
  modalTitle = '';
  modalContent = '';
  closeButton = ""

  constructor(private config: ConfigService, private recipeService: RecipeService, private modalService: NgbModal) {
    this.getIngredients();
    this.loadContent();
    this.langSign = config.langSign
  }

  loadContent() {
    this.config.getContent().subscribe((content) => {
      this.editButton = content.editButton
      this.deleteButton = content.deleteButton
      this.saveButton = content.saveButton
      this.addButton = content.addButton
      this.ingredientsHeaderTitle = content.ingredientsHeaderTitle
      this.categoryTitle = content.categoryTitle
      this.ingredientName = content.ingredientName
      this.ingredientsDescription = content.ingredientsDescription
      this.language = content.language
      this.closeButton = content.closeButton
    });
  }


  langChange(lang: any) {
    this.actLang = lang.text;
    this.config.changeLanguage(lang.sign);
  }

  openModal() {
    this.modalService.open(this.content, { centered: true });
  }

  getIngredients() {
    this.recipeService.getIngredients().subscribe(ingredients => {
      this.ingredients = ingredients
    })
  }

  async postIngredient(ingredient: Ingredient) {
    try {
      const response = await this.recipeService.postIngredients(ingredient).toPromise();
      console.log('Ingredient added successfully', response);
      if (this.langSign === "hu") {
        this.modalContent = "Sikeresen hozzáadtad a hozzávalót!"
      } else {
        this.modalContent = "Successfully added the ingredient!"
      }
      
      await this.getIngredients();
    } catch (error) {
      if (this.langSign === "hu") {
        this.modalContent = "Hozzávaló hozzáadása sikertelen!"
      } else {
      this.modalContent = "Error adding ingredient"
      }
      console.error('Error adding ingredient', error);
    }
    this.openModal()
  }
  

  editIngredient(ingredient: Ingredient) {
    this.recipeService.modifyIngredient(ingredient).subscribe(
      response => {
        if (this.langSign === "hu") {
          this.modalContent = "Sikeresen módosítottad a hozzávalót!"
        } else {
          this.modalContent = "Successfully modified the ingredient!"
        }
        console.log('Ingredient modified successfully', response);
      },
      error => {
        if (this.langSign === "hu") {
          this.modalContent = "Hozzávaló módosítása sikertelen!"
        } else {
          this.modalContent = "Error modifying ingredient"
        }
        console.error('Error modifying ingredient', error);
      }
    );
    this.openModal()
  }

  async deleteIngredient(ingredient: Ingredient) {
    try {
      const response = await lastValueFrom(this.recipeService.destroyIngredient(ingredient));
      console.log('Ingredient deleted successfully', response);
  
      await this.getIngredients();
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
