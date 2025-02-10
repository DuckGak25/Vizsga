<?php

namespace App\Http\Controllers;

use App\Models\RecipeIngredient; 
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

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
}
