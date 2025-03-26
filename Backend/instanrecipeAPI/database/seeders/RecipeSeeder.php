<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use League\Csv\Reader;
use App\Models\Recipe;
use Illuminate\Support\Facades\Storage;


class RecipeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $csv = Reader::createFromPath(Storage::path('public/recipes.csv'), 'r');
        $csv->setHeaderOffset(0);

        $records = $csv->getRecords();
        foreach ($records as $record) {
            Recipe::create([
                'id' => $record['id'],
                'title' => $record['title'],
                'description' => $record['description'],
                'categories' => $record['categories'],
                'imagelink' => $record['imagelink'],
                'language' => $record['language'],
                'featured' => $record['featured'],
                'user_id' => $record['user_id'],
                'approved' => $record['approved'],
            ]);
        }
    }
}
