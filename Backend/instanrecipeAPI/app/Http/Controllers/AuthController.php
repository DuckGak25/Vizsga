<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\UserRegisterRequest;
use App\Http\Requests\UserLoginRequest;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class AuthController extends ResponseController
{

    public function register( UserRegisterRequest $request ) {

        $request->validated();

        $user = User::create([
            "name" => $request["name"],
            "email" => $request["email"],
            "password" => bcrypt( $request["password"]),
            "admin" => 0
        ]);

        return $this->sendResponse( $user->name, "Sikeres regisztráció");
    }


    
    public function login(UserLoginRequest $request)
    {
        $request->validated();

        if (Auth::attempt([ 'email' => $request['email'], 'password' => $request['password'] ])) {
            $authUser = Auth::user();
            $token = $authUser->createToken($authUser->email . "Token")->plainTextToken;
            
            return response()->json([
                'success' => true,
                'user' => $authUser,
                'token' => $token
            ]);
        }


        return $this->sendError("Helytelen felhasználó vagy jelszó!","Autentikációs hiba" , 401);
    }

    

public function logout(Request $request) {
    $user = auth("sanctum")->user();
    


    if ($user) {
        auth("sanctum")->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'Sikeres kijelentkezés',
            'user' => $user->name
        ], 200);
    }
    return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
}
}
