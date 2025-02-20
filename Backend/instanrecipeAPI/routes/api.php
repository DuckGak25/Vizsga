<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\RecipeIngredientController;
use App\Http\Controllers\IngredientController;
use App\Http\Controllers\AuthController;



Route::get('/recipes', [RecipeController::class, 'index']);
Route::get('/recipes/{id}', [RecipeController::class, 'show']);
Route::get('/recipes/{id}/ingredients', [RecipeController::class, 'showIngredients']);

Route::get('/ingredients', [IngredientController::class, 'getIngredients']);
Route::post('/postrecipe', [RecipeController::class, 'postRecipes']);
Route::put('/modifyrecipe', [RecipeController::class, 'modifyRecipe']);

Route::delete('deleterecipe/{id}', [RecipeController::class, 'deleteRecipe']);


Route::post('/storerecipes', [RecipeController::class, 'store']);

Route::post('/recipe-ingredients', [RecipeIngredientController::class, 'storeIngredients']);
Route::delete('/delete-recipe-ingredient/{id}', [RecipeIngredientController::class, 'destroyRecipeIngredient']);


Route::post('/addingredient', [IngredientController::class, 'addIngredient']);
Route::put('/modifyingredient', [IngredientController::class, 'modifyIngredient']);
Route::delete('/destroyingredient/{id}', [IngredientController::class, 'destroyIngredient']);
Route::get('/getingredients', [IngredientController::class, 'getIngredients']);
Route::get('/getingredient/{id}', [IngredientController::class, 'getIngredient']);


Route::put('/editingredients', [RecipeIngredientController::class, 'editRecipeIngredient']);

Route::delete('/deleteingredients', [RecipeIngredientController::class, 'deleteIngredient']);


Route::post( "/register", [ AuthController::class, "register" ]);
Route::post( "/login", [ AuthController::class, "login" ]);


Route::middleware(['auth:sanctum'])->group( function () {
    Route::post( "/logout", [ AuthController::class, "logout" ]);
    Route::get("/isadmin", [ TestController::class, "isAdmin" ]);
    Route::put("/setadmin", [ UserController::class, "setAdmin" ]);
});