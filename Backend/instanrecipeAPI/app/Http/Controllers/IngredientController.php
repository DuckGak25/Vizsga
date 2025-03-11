<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ingredient;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\IngredientRequest;
use App\Http\Requests\IngredientModRequest;
use App\Http\Resources\IngredientResource;

class IngredientController extends Controller
{
    public function addIngredient(IngredientRequest $request)
    {
        $request->validated();

        $ingredient = new Ingredient();
        $ingredient->name = $request[ "name" ];
        $ingredient->category = $request[ "category" ];
        $ingredient->language = $request[ "language" ];
        $ingredient->save();

        return response()->json($ingredient, 201);
    }

    public function modifyIngredient(IngredientModRequest $request)
    {
        $request->validated();
        $ingredient = Ingredient::find($request[ "id" ]);
        $ingredient->name = $request[ "name" ];
        $ingredient->category = $request[ "category" ];
        $ingredient->language = $request[ "language" ];
        $ingredient->update();

        return response()->json($ingredient, 201);
    }

    public function destroyIngredient($id)
    {
        $ingredient = Ingredient::find($id);
        $ingredient->delete();
        return response()->json(['message' => 'Sikeres !'], 200);
    }
    public function getIngredients()
    {
        $ingredient = Ingredient::all();
        return response()->json($ingredient, 200);
    }
    public function getIngredient(IngredientRequest $request){
        $request->validated();

        $ingredient = Ingredient::find($request["id"]);
        return response()->json($ingredient, 200);

    }
    
}
