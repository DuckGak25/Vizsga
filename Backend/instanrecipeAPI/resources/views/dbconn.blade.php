<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laravel & MYSQL</title>
</head>
<body>
    <div>
        <?php
            if(DB::connection()->getPdo()){
                echo "Ügyes vagy". DB::connection()->getDatabaseName();
            }
        ?>
    </div>
</body>
</html>