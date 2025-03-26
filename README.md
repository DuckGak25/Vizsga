Telepítés: 
  BACKEND
    útvonal:
      /Backend/instanrecipeAPI
    tennivalók:
    1. Konfiguráció
      .env.example nevű fájl átnevezése .env-re és az adatbázis és levelezés beállítása
    2. Szükséges csomagok telepítése
      Amikor kész vagyunk ezzel adjuk ki a következő parancsokat:
        composer install
        php artisan key:generate
    3. Adatbázis beállítása
      Indítsuk el az XAMPP-ot azon belűl is a MySQL Database-t és az Apache Web Server-t utána adjuk ki a következő parancsot:
        php artisan migrate
    4. Adatbázis feltöltése
      Ezek után fájlkezelőbe navigáljunk vissza a gyökér mappá (/Vizsga)
      database/private
        ezt a mappát helyezzük át a /Backend/instanrecipeAPI/storage mappába
        a konzolban pedig futtassuk ezt a 4 parancsot a /Backend/instanrecipeAPI útvonalon: 
          php artisan db:seed --class=UserSeeder
          php artisan db:seed --class=RecipeSeeder
          php artisan db:seed --class=IngredientSeeder
          php artisan db:seed --class=RecipeIngredientSeeder
    5. Backend indítása
      Ezek után pedig futtathatjuk:
        php artisan serve
  FRONTEND
    útvonal: 
      /Frontend/InstantRecipe
    tennivalók:
    1. Szükséges csomagok telepítése
      adjuk ki a következő parancsot:
        npm install
Ha mindennel kész vagyunk a weboldal használható!
