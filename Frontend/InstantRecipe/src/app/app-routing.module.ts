import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { PantryComponent } from './pantry/pantry.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RecipesComponent } from './recipes/recipes.component';
import { AppLoadingComponent } from './app-loading/app-loading.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { AdminComponent } from './admin/admin.component';
import { RecipeDetailComponent } from './recipe-detail/recipe-detail.component';
import { TesztComponent } from './teszt/teszt.component';
import { RecipeListComponent } from './recipe-list/recipe-list.component';
import { AddRecipeComponent } from './add-recipe/add-recipe.component';


const routes: Routes = [
  {path:"home", component: HomeComponent},
  {path: "pantry", component: PantryComponent},
  {path: "recipes", component: RecipesComponent},
  {path: "app-loading", component: AppLoadingComponent},
  {path: "register", component: RegisterComponent},
  {path: "login", component: LoginComponent},
  {path: "admin", component: AdminComponent},
  { path: 'recipes/:id', component: RecipeDetailComponent },
  { path: 'teszt', component: TesztComponent },

  {path: "addrecipe", component: AddRecipeComponent},
  {path:"", redirectTo:'/home', pathMatch:'full'},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
