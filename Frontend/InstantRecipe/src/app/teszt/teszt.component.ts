import { Component } from '@angular/core';
import { BaseService } from '../base.service';
import { Recipe } from '../models/recipe.model';

@Component({
  selector: 'app-teszt',
  templateUrl: './teszt.component.html',
  styleUrl: './teszt.component.css'
})
export class TesztComponent {
  recipes = [];
  ingredients = [];

  oszlopok=[
    {key:"id", text:"#", type:"plain"},
    {key:"title", text:"Cím", type:"text"},
  ]

  constructor(private base: BaseService) {
    base.getRecipes().subscribe(
      (adatok) => this.recipes = adatok,
      (error) => console.error('Hiba az adatok betöltésekor:', error)
    );
  }

}
