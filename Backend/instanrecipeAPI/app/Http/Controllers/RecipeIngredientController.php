<?php

namespace App\Http\Controllers;

use App\Models\RecipeIngredient; 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\RecipeRequest;
use App\Http\Resources\Recipe as RecipeResource;
use App\Http\Requests\IngredientRequest;
use App\Http\Requests\RecipeIngredientRequest;
use App\Http\Requests\IngredientModRequest;
use App\Http\Resources\IngredientResource;
use App\Models\Recipe;
use App\Models\Ingredient;
use Illuminate\Support\Facades\DB;

class RecipeIngredientController extends Controller
{
    public function storeIngredients(RecipeIngredientRequest $request)
    {
        $validated = $request->validate([
            'recipe_id' => 'required|integer|exists:recipes,id',
            'ingredient_id' => 'required|integer',
            'quantity' => 'nullable|string',
        ]);
    
        RecipeIngredient::create([
            'recipe_id' => $validated['recipe_id'],
            'ingredient_id' => $validated['ingredient_id'],
            'quantity' => $validated['quantity'],
        ]);
    
        return response()->json(['message' => 'Sikeres hozzávaló hozzáadás'], 201);
    }
    

    public function destroyRecipeIngredient($id)
    {
        $id = RecipeIngredient::find($id);
        $id->delete();
        return response()->json(['message' => 'Sikeres !'], 200);
    }

    
    public function editRecipeIngredient(RecipeIngredientRequest $request) {
        $validated = $request->validated();
        $recipe_id = $validated['recipe_id'];
        $ingredient_id = $validated['ingredient_id'];
        $quantity = $validated['quantity'];
    
        $recipe_ingredient = DB::table('recipe_ingredient')
            ->where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->first();
    
        if (!$recipe_ingredient) {
            return response()->json(['message' => 'Recept hozzávaló nem található!'], 404);
        }
    
        DB::table('recipe_ingredient')
            ->where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->update(['quantity' => $quantity]);
    
        return response()->json(['message' => 'Recept hozzávaló módosítása sikeres!'], 200);
    }

    public function deleteIngredient(Request $request) {
        $recipe_id = $request->query('recipe_id');
        $ingredient_id = $request->query('ingredient_id');
    
        if (!$recipe_id || !$ingredient_id) {
            return response()->json(['message' => 'Hiányzó paraméterek!'], 400);
        }
    
        $deleted = DB::table('recipe_ingredient')
            ->where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->delete();
    
        if ($deleted) {
            return response()->json(['message' => 'Hozzávaló törlése sikeres!'], 200);
        } else {
            return response()->json(['message' => 'Nincs ilyen hozzávaló!'], 404);
        }
    }
    
    

}
