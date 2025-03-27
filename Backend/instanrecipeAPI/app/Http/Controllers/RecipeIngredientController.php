<?php

namespace App\Http\Controllers;

use App\Models\RecipeIngredient; 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\RecipeRequest;
use App\Http\Resources\Recipe as RecipeResource;
use App\Http\Resources\RecipeIngredientResource;
use App\Http\Requests\IngredientRequest;
use App\Http\Requests\RecipeIngredientRequest;
use App\Http\Requests\IngredientModRequest;
use App\Http\Resources\IngredientResource;
use App\Models\Recipe;
use App\Models\Ingredient;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\ResponseController;
use Illuminate\Support\Facades\Gate;

class RecipeIngredientController extends ResponseController
{

    public function storeIngredients(RecipeIngredientRequest $request)
    {
        $user = auth()->user();

        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $request->validated();
    
        $recipeIngredient = RecipeIngredient::create([
            'recipe_id' => $request['recipe_id'],
            'ingredient_id' => $request['ingredient_id'],
            'quantity' => $request['quantity'],
        ]);
    
        return $this->sendResponse(new RecipeResource($recipeIngredient), 'Sikeres hozzávaló hozzáadás a recepthez');
    }
    

    public function destroyRecipeIngredient($id)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipeIngredient = RecipeIngredient::find($id);
        if (!$recipeIngredient) {
            return $this->sendError("Adathiba", "Nem található recept hozzávaló", 404);
        }
        $recipeIngredient->delete();
        return $this->sendResponse(new RecipeResource($recipeIngredient), 'Sikeres recept hozzávaló törlés');
    }

    public function modifyQuantity(RecipeIngredientRequest $request) {
        $user = auth()->user();
    
        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }

        $recipe_id = $request->input('recipe_id');
        $ingredient_id = $request->input('ingredient_id');
        $quantity = $request->input('quantity');
    
        if (!$recipe_id || !$ingredient_id || !$quantity) {
            return $this->sendResponse('Adathiba', 'Nem található recept hozzávaló', 404);
        }
    
        $recipeIngredient = RecipeIngredient::where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->first();
    
        if (!$recipeIngredient) {
            return $this->sendResponse('Adathiba', 'Nincs ilyen recept hozzávaló', 404);
        }
    
        $recipeIngredient->quantity = $quantity;
        $recipeIngredient->save();
    
        return $this->sendResponse(new RecipeResource($recipeIngredient), 'Sikeres recept hozzávaló módosítás');
    }
    


    public function deleteIngredient(Request $request) {
        $user = auth()->user();

        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $recipe_id = $request->query('recipe_id');
        $ingredient_id = $request->query('ingredient_id');
    
        if (!$recipe_id || !$ingredient_id) {
            return $this->sendResponse('Adathiba', 'Nem található recept hozzávaló', 404);
        }
    
        $deleted = DB::table('recipe_ingredient')
            ->where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->delete();
    
        if ($deleted) {
            return $this->sendResponse('Sikeres recept hozzávaló törlés', 200);
        } else {
            return $this->sendResponse('Adathiba', 'Nem található recept hozzávaló', 404);
        }
    }
}
