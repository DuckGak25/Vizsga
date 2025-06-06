<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class IngredientRequest extends FormRequest
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
            "name" => "required|string|max:255|unique:ingredients,name," . $this->route('ingredient') . ",id,language," . request('language'),
            "category" => "required|string",
            "language" => "required|string"
        ];
    }
    

    public function messages()
    {
        return [
            'name.required' => 'A név elvárt.',
            'name.unique' => 'Már létező hozzávaló.',
            'category.required' => 'A kategória elvárt.',
            'language.required' => 'A nyelv elvárt.'

        ];
    }
}
