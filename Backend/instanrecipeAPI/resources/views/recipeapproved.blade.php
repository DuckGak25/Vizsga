<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Új recept hozzáadva</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            background-color: #28a745;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }
        .content {
            padding: 20px;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            text-align: center;
            color: #666;
        }
        .btn {
            display: inline-block;
            background-color: #28a745;
            color: #ffffff;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2>Új receptet adtál hozzá!</h2>
        </div>
        <div class="content">
            <p>Kedves {{ $recipe->user->name }},</p>
            <p>Az alábbi receptedet elfogadták az adminok:</p>
            <h3>{{ $recipe->title }}</h3>
            <p>Mostantól meg tudod nézni a receptedet weboldalunkon.</p>
        </div>
        <div class="footer">
            <p>Ez egy automatikus üzenet, kérjük, ne válaszolj rá.</p>
        </div>
    </div>
</body>
</html>
