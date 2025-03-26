<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use League\Csv\Reader;
use App\Models\Ingredient;
use Illuminate\Support\Facades\Storage;
class IngredientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $csv = Reader::createFromPath(Storage::path('public/ingredients.csv'), 'r');
        $csv->setHeaderOffset(0);

        $records = $csv->getRecords();
        foreach ($records as $record) {
            Ingredient::create([
                'id' => $record['id'],
                'name' => $record['name'],
                'category' => $record['category'],
                'language' => $record['language']
            ]);
        }
    }
}
