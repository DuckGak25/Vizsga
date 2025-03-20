<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ingredient;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\IngredientRequest;
use App\Http\Requests\IngredientModRequest;
use App\Http\Resources\IngredientResource;
use App\Http\Controllers\ResponseController;
use Illuminate\Support\Facades\Gate;

class IngredientController extends ResponseController
{
    public function addIngredient(IngredientRequest $request)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $request->validated();
        $ingredient = new Ingredient();
        $ingredient->name = $request[ "name" ];
        $ingredient->category = $request[ "category" ];
        $ingredient->language = $request[ "language" ];
        $ingredient->save();

        return $this->sendResponse(new IngredientResource($ingredient), "Sikeres hozzávaló hozzáadás", 201);
    }

    public function modifyIngredient(IngredientModRequest $request)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $request->validated();
        $ingredient = Ingredient::find($request[ "id" ]);
        if (is_null($ingredient)) {
            return $this->sendError("Adathiba", "Nem található hozzávaló", 404);
        }
        $ingredient->name = $request[ "name" ];
        $ingredient->category = $request[ "category" ];
        $ingredient->language = $request[ "language" ];
        $ingredient->update();

        return $this->sendResponse(new IngredientResource($ingredient), "Sikeres módosítás");
    }

    public function destroyIngredient($id)
    {
        if (Gate::allows("user")) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $ingredient = Ingredient::find($id);
        if (!$ingredient) {
            return $this->sendError("Adathiba", "Nem található hozzávaló", 404);
        }
        $ingredient->delete();

        return $this->sendResponse($ingredient, "Sikeres törlés");
    }
    public function getIngredients()
    {
        $user = auth()->user();
        if (!$user) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $ingredient = Ingredient::all();
        return response()->json($ingredient, 200);
    }
    public function getIngredient(IngredientRequest $request)
    {
        $request->validated();
        $ingredient = Ingredient::find($request["id"]);
        return response()->json($ingredient, 200);
    }
    
}
