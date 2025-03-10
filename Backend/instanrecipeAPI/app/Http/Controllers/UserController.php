<?php

namespace App\Http\Controllers;



use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Controllers\ResponseController;
use Illuminate\Support\Facades\Gate;

class UserController extends ResponseController {

    
    public function setAdmin(Request $request) {

        if ( !Gate::allows("super") ) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }

        $user = User::find($request["id"]);

        $user->admin = 1;

        $user->update();

        return $this->sendResponse($user->name, "Admin jog megadva");
    }

    public function removeAdmin(Request $request) {

        if ( !Gate::allows("super") ) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }

        $user = User::find($request["id"]);

        $user->admin = 0;

        $user->update();

        return $this->sendResponse($user->name, "Admin jog sikeresen törölve");
    }

    public function getUsers()
     {

        if ( !Gate::allows("super") ) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }
        $user = User::all();

        return $this->sendResponse($user, "Sikeres lekérés");
     }
     public function deleteUser(Request $request) {

        if ( !Gate::allows("super") ) {
            return $this->sendError("Autentikációs hiba", "Nincs jogosultsága", 401);
        }

        $user = User::find($request["id"]);

        $user->delete();

        return $this->sendResponse($user->name, "Sikeres törölség");
     }

}
