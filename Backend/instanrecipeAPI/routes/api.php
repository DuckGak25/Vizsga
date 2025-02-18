<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\RecipeIngredientController;
use App\Http\Controllers\IngredientController;



Route::get('/recipes', [RecipeController::class, 'index']);
Route::get('/recipes/{id}', [RecipeController::class, 'show']);
Route::get('/recipes/{id}/ingredients', [RecipeController::class, 'showIngredients']);
Route::get('/ingredients', [RecipeController::class, 'showIngredients']);

Route::post('/postrecipe', [RecipeController::class, 'postRecipes']);
Route::put('/modifyrecipe', [RecipeController::class, 'modifyRecipe']);

Route::delete('deleterecipe/{id}', [RecipeController::class, 'deleteRecipe']);


Route::post('/storerecipes', [RecipeController::class, 'store']);

Route::post('/recipe-ingredients', [RecipeIngredientController::class, 'storeIngredients']);


Route::post('/addingredient', [IngredientController::class, 'addIngredient']);
Route::put('/modifyingredient', [IngredientController::class, 'modifyIngredient']);
Route::delete('/destroyingredient/{id}', [IngredientController::class, 'destroyIngredient']);

Route::get('/recipewithingredients', [RecipeIngredientController::class, 'getRecipeWithIngredients']);

Route::put('/editingredients', [RecipeIngredientController::class, 'editIngredient']);

Route::delete('/deleteingredients', [RecipeIngredientController::class, 'deleteIngredient']);
