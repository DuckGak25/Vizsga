# Telepítés

## Backend  
**Útvonal:** `/Backend/instanrecipeAPI`  

### 1. Konfiguráció  
- Nevezd át a **`.env.example`** fájlt **`.env`**-re.  
- Állítsd be az **adatbázis** és **levelezés** kapcsolati adatokat a `.env` fájlban.

### 2. Szükséges csomagok telepítése  
Amikor kész vagyunk ezzel, adjuk ki a következő parancsokat:  
```sh
composer install
php artisan key:generate
```

### 3. Adatbázis beállítása  
- Indítsuk el az **XAMPP**-ot, azon belül is a **MySQL Database**-t és az **Apache Web Server**-t.  
- Ezután adjuk ki a következő parancsot:  
  ```sh
  php artisan migrate
  ```

### 4. Adatbázis feltöltése  
- Fájlkezelőben navigáljunk vissza a gyökér mappába (`/Vizsga`), majd helyezzük át a **`database/private`** mappát ide:  
  ```plaintext
  /Backend/instanrecipeAPI/storage
  ```

- Ezután a konzolban futtassuk ezt a 4 parancsot a `/Backend/instanrecipeAPI` útvonalon:  
  ```sh
  php artisan db:seed --class=UserSeeder
  php artisan db:seed --class=RecipeSeeder
  php artisan db:seed --class=IngredientSeeder
  php artisan db:seed --class=RecipeIngredientSeeder
  ```

### 5. Backend indítása  
Ezután futtathatjuk:  
```sh
php artisan serve
```

---

## Frontend  
**Útvonal:** `/Frontend/InstantRecipe`  

### 1. Szükséges csomagok telepítése  
Adjuk ki a következő parancsot:  
```sh
npm install
```
### 2. Frontend indítása  
Ezután futtathatjuk:  
```sh
ng serve -o
```
---

## Használatra kész  
Ha mindennel kész vagyunk, a weboldal használható!
