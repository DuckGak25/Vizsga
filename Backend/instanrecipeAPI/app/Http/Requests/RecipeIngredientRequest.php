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
            'recipe_id' => 'required|integer|exists:recipes,id',
            'ingredient_id' => 'required|integer',
            'quantity' => 'nullable|string',
        ];
    }

    public function messages()
    {
        return [
            'recipe_id.required' => 'A recept id elvárt.',
            'ingredient_id.required' => 'A hozzávaló id elvárt.',
        ];
    }
}
