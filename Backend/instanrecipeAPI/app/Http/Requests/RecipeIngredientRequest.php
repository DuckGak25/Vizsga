<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RecipeIngredientRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "recipe_id" => "required|integer|exists:recipes,id",
            "ingredient_id" => "required|integer|exists:ingredients,id",
            "quantity" => "string",
        ];
    }

    public function messages()
    {
        return [
            'recipe_id.required' => 'A recipe is required.',
            'ingredient_id.required' => 'An ingredient is required.',
        ];
    }
}
