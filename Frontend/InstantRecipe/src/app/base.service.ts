import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BaseService {
  url = 'http://localhost:8000/recipes';

  private recipeSubject = new BehaviorSubject([])

  constructor(private http:HttpClient) {
    this.loadRecipes()
  }

  public getRecipes() {
    return this.recipeSubject
  }

  private loadRecipes() {
    this.http.get(this.url).subscribe(
      (res: any) => this.recipeSubject.next(res),
      (error) => {
        console.error('Error loading recipes:', error);
      }
    );
  }

  public postRecipes(newRecipe: any) {
    this.http.post<any>(this.url, newRecipe).subscribe(
      (res) => {
        console.log('Recipe created successfully:', res);
        this.loadRecipes();
      },
      (error) => {
        console.error('Error creating recipe:', error);
      }
    );
  }


}



