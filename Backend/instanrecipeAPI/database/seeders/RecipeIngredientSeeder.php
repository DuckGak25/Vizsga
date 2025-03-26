<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use League\Csv\Reader;
use App\Models\RecipeIngredient;
use Illuminate\Support\Facades\Storage;

class RecipeIngredientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $csv = Reader::createFromPath(Storage::path('public/recipe_ingredient.csv'), 'r');
        $csv->setHeaderOffset(0);

        $records = $csv->getRecords();
        foreach ($records as $record) {
            RecipeIngredient::create([
                'id' => $record['id'],
                'ingredient_id' => $record['ingredient_id'],
                'recipe_id' => $record['recipe_id'],
                'quantity' => $record['quantity'],
            ]);
        }
    }
}
