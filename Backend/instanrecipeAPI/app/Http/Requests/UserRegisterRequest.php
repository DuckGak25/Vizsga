<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Validation\Rules;

class UserRegisterRequest extends FormRequest
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
            "name" => "required",
            "email" => "required|email|unique:users",
            "password" => [
                            "required",
                            "min:6",
                            "regex:/[a-z]/",
                            "regex:/[A-Z]/",
                            "regex:/[0-9]/" ],
            "confirm_password" => "required|same:password"
        ];
    }
    public function messages() {

        return [
            "name.required" => "Név nem lehet üres",
            "email.required" => "Email nem lehet üres",
            "email.email" => "Nem megfelelő email formátum",
            "email.unique" => "Létező email",
            "password.required" => "Jelszó nem lehet üres",
            "password.min" => "Túl rövid jelszó",
            "password.regex" => "A jelszónak tartalmazia kell kisbetűt, nagybetűt és számot",
            "confirm_password.same" => "Nem egyező jelszó"
        ];
    }

    public function failedValidation( Validator $validator ) {

        throw new HttpResponseException( response()->json([

            "success" => false,
            "message" => "Beviteli hiba",
            "data" => $validator->errors(),

        ], 422));
    }
}
