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
    public function storeIngredients(Request $request)
    {

        $validated = $request->validate([
            'recipe_id' => 'required|integer|exists:recipes,id',
            'ingredients' => 'required|array',
            'ingredients.*.ingredient_id' => 'required|integer|exists:ingredients,id',
            'ingredients.*.quantity' => 'nullable|string',
        ]);


        foreach ($validated['ingredients'] as $ingredient) {
            RecipeIngredient::create([
                'recipe_id' => $validated['recipe_id'],
                'ingredient_id' => $ingredient['ingredient_id'],
                'quantity' => $ingredient['quantity'],
            ]);
        }


        return response()->json(['message' => 'Ingredients added successfully'], 201);
    }

    public function destroy(Request $request)
    {
        $recipe_id = $request->input('recipe_id');
        $ingredient_id = $request->input('ingredient_id');
        $quantity = $request->input('quantity');
        $recipe_ingredient = RecipeIngredient::where('recipe_id', $recipe_id)
            ->where('ingredient_id', $ingredient_id)
            ->where('quantity', $quantity)
            ->first();            

        if ($recipe_ingredient) {
            $recipe_ingredient->delete();
            return response()->json(['message' => 'Ingredient deleted successfully'], 200);
        } else {            
            return response()->json(['message' => 'Ingredient not found'], 404);
        }
    }

    public function getRecipeWithIngredients(RecipeIngredientRequest $request) {
        $recipe = Recipe::with('ingredients')->find($request->id);
        return response()->json($recipe);
    }

}
