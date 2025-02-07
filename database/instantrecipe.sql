-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Feb 07. 14:56
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `instantrecipe`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `category`) VALUES
(1, 'paprika', 'zöldség'),
(2, 'paradicsom', 'zöldség'),
(3, 'vöröshagyma', 'zöldség'),
(4, 'olaj', 'zsír/olaj'),
(5, 'pirospaprika', 'fűszer'),
(6, 'só', 'fűszer'),
(7, 'bors', 'fűszer'),
(8, 'sertéshús', 'hús'),
(9, 'tojás', 'tejtermék/tojás'),
(10, 'liszt', 'alapanyagok'),
(11, 'zsemlemorzsa', 'alapanyagok'),
(12, 'piskótalap', 'édesség'),
(13, 'tejszín', 'tejtermék/tojás'),
(14, 'cukor', 'édesítőszer'),
(15, 'vaníliás cukor', 'édesítőszer'),
(16, 'kakaópor', 'édesség'),
(17, 'rum', 'ital'),
(18, 'darált dió', 'magvak'),
(19, 'mazsola', 'gyümölcs'),
(20, 'csokoládéöntet', 'édesség'),
(21, 'marhahús', 'hús'),
(22, 'burgonya', 'zöldség'),
(23, 'víz', 'folyadék'),
(24, 'tészta', 'alapanyagok'),
(25, 'túró', 'tejtermék/tojás'),
(26, 'füstölt szalonna', 'hús'),
(27, 'tejföl', 'tejtermék/tojás'),
(28, 'káposzta', 'zöldség'),
(29, 'főtt rizs', 'alapanyagok'),
(30, 'darált hús', 'hús'),
(31, 'zsemle', 'alapanyagok'),
(32, 'mák', 'magvak'),
(33, 'élesztő', 'alapanyagok'),
(34, 'paradicsomszósz', 'alapanyagok'),
(35, 'fokhagyma', 'fűszer'),
(36, 'bazsalikom', 'fűszer'),
(37, 'oregano', 'fűszer'),
(38, 'piskótalap', NULL),
(39, 'tejszín', NULL),
(40, 'tojás', NULL),
(41, 'cukor', NULL),
(42, 'liszt', NULL),
(43, 'vaníliás pudingpor', NULL),
(44, 'tej', NULL),
(45, 'puha vaj', NULL),
(46, 'rum', NULL),
(47, 'cukor (rumos cukorhoz)', NULL),
(48, 'csokoládé', NULL),
(49, 'apróra vágott dió', NULL),
(50, 'csokoládéreszelék', NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2024_09_30_171931_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `categories`) VALUES
(1, 'Lecsó', 'A hagymát apróra vágjuk, és olajon üvegesre pirítjuk...', 'magyar,főétel,vegetáriánus'),
(2, 'Rántott Hús', 'A húst vékonyra klopfoljuk...', 'magyar,főétel,húsétel'),
(3, 'Somlói Galuska', '<strong>A Somlói galuska egy hagyományos magyar desszert, amely a könnyed piskótát, a csokoládét és a diós krémet egyesíti. Ez a finom, rétegezett sütemény tökéletes választás bármilyen ünnepi alkalomra vagy egyszerűen egy édes finomságra.</strong>\r\n\r\n<p><strong>Elkészítés:</strong></p>\r\n<ol>\r\n  <li><strong>Piskóta készítése:</strong> A tojásokat szétválasztjuk, a tojásfehérjét felverjük, majd a tojás sárgáját cukorral habosra keverjük. A felvert tojásfehérjét óvatosan hozzáadjuk, majd a lisztet is belekeverjük, és a masszát sütőpapírral bélelt tepsiben 180°C-on 20-25 percig sütjük.</li>\r\n  <li><strong>Kréma készítése:</strong> A vaníliás pudingport a tejjel és cukorral elkeverjük, majd sűrűre főzzük. Hűtjük, és amikor kihűlt, a puha vajat is hozzákeverjük.</li>\r\n  <li><strong>Összeállítás:</strong> A piskótát három egyenlő részre vágjuk. Az első réteg piskótát egy tálba helyezzük, és megszórjuk rumos cukorral. Erre kerül a vaníliás krém, majd a következő réteg piskóta, és ismét rumos cukor, végül a csokoládékrém.</li>\r\n  <li><strong>Csokoládékrém:</strong> A csokoládét felolvasztjuk, majd a tejszínnel és a cukorral összekeverjük. A piskótára öntjük, és szép simára kenjük.</li>\r\n  <li><strong>Tálalás:</strong> A desszertet a tetejére szórt apróra vágott dióval és csokoládéreszelékkel díszítjük. Hűtőben pár órán keresztül pihentetjük, hogy az ízek összeérjenek.</li>\r\n</ol>\r\n<p><strong>Jó étvágyat!</strong></p>', 'magyar,desszert,édesség'),
(4, 'Töltött Káposzta', 'A savanyú káposztalevelekbe darált húst és rizst töltünk, majd a paradicsomszósszal megöntözzük.', 'magyar,főétel'),
(5, 'Rakott Krumpli', 'Krumplis és tojásos rakott étel, tejföllel megkenve.', 'magyar,főétel'),
(6, 'Főtt Rizs', 'Egyszerűen elkészített főtt rizs.', 'magyar,köret'),
(7, 'Mákos Guba', 'Piskótából készült édesség mákkal.', 'magyar,desszert'),
(8, 'Káposztás Tészta', 'Káposztával és tésztával készült étel.', 'magyar,főétel'),
(9, 'Gyümölcsleves', 'Friss gyümölcsökből készült leves.', 'magyar,leves'),
(10, 'Borsóleves', 'Zöldborsóból készült leves.', 'magyar,leves'),
(11, 'Sütőtök Krémleves', 'Sütőtökből készült krémleves.', 'magyar,leves'),
(12, 'Rántott Zöldség', 'Rántott zöldségek változatosan.', 'magyar,köret'),
(13, 'Gyümölcs Saláta', 'Friss gyümölcsökből készült saláta.', 'magyar,előétel'),
(14, 'Bolognai', '<strong>A bolognai spagetti egy ínycsiklandó olasz étel, amely tökéletes választás egy családi vacsorához vagy baráti összejövetelhez.</strong>\r\n\r\n<p><strong>Elkészítés:</strong></p>\r\n<ol>\r\n  <li><strong>Az alapanyagok előkészítése:</strong> A hagymát finomra vágjuk, a paradicsomokat meghámozzuk, és apróra vágjuk.</li>\r\n  <li><strong>A hús párolása:</strong> Egy serpenyőben forró olajon megpirítjuk a hagymát, majd hozzáadjuk a sertéshúst, és jól átpirítjuk.</li>\r\n  <li><strong>A fűszerek hozzáadása:</strong> A pirospaprikát, sót, borsot és cukrot hozzáadjuk a húsos keverékhez, és jól összekeverjük.</li>\r\n  <li><strong>Paradicsom és bor hozzáadása:</strong> Hozzáadjuk a paradicsomot és a vörösbort, és lefedve főzzük 1-1,5 órán keresztül alacsony hőmérsékleten.</li>\r\n  <li><strong>A tészta főzése:</strong> A spagetti tésztát sós vízben kifőzzük, majd lecsepegtetjük.</li>\r\n  <li><strong>Tálalás:</strong> A bolognait a főtt tésztára öntjük, és reszelt sajttal tálaljuk.</li>\r\n</ol>\r\n<p><strong>Jó étvágyat!</strong></p>', 'olasz,főétel,húsétel');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `quantity`) VALUES
(1, 1, '5 db'),
(1, 2, '3 db'),
(1, 3, '2 db'),
(1, 4, '3 evőkanál'),
(1, 5, '1 teáskanál'),
(2, 8, '4 szelet'),
(2, 9, '2 db'),
(3, 9, '4 db'),
(3, 10, '150 g'),
(3, 12, 'szükséges mennyiség'),
(3, 13, '3 dl'),
(3, 14, '150 g'),
(3, 17, '3 evőkanál'),
(3, 43, '1 csomag'),
(3, 44, '500 ml'),
(3, 45, '100 g'),
(3, 47, 'ízlés szerint'),
(3, 48, '200 g'),
(3, 49, 'ízlés szerint'),
(3, 50, 'ízlés szerint'),
(4, 2, '500 ml'),
(4, 3, '1 db'),
(4, 6, 'ízlés szerint'),
(4, 7, 'ízlés szerint'),
(4, 28, '1 fej'),
(4, 29, '200 g'),
(4, 30, '500 g'),
(5, 6, 'ízlés szerint'),
(5, 7, 'ízlés szerint'),
(5, 9, '4 db'),
(5, 22, '1 kg'),
(5, 26, '200 g'),
(5, 27, '500 g'),
(6, 6, 'ízlés szerint'),
(6, 23, '500 ml'),
(6, 29, '250 g'),
(7, 12, '300 g'),
(7, 14, 'ízlés szerint'),
(7, 23, '500 ml'),
(7, 32, '100 g'),
(8, 3, '1 db'),
(8, 4, '2 evőkanál'),
(8, 6, 'ízlés szerint'),
(8, 7, 'ízlés szerint'),
(8, 24, '300 g'),
(8, 28, '500 g'),
(9, 14, 'ízlés szerint'),
(9, 19, '300 g'),
(9, 23, '1 l'),
(10, 2, '300 g'),
(10, 3, '1 db'),
(10, 6, 'ízlés szerint'),
(10, 7, 'ízlés szerint'),
(10, 23, '1 l'),
(11, 6, 'ízlés szerint'),
(11, 7, 'ízlés szerint'),
(11, 23, '1 l'),
(11, 27, '100 g'),
(11, 30, '500 g'),
(12, 1, '300 g'),
(12, 4, 'a sütéshez'),
(12, 6, 'ízlés szerint'),
(12, 7, 'ízlés szerint'),
(12, 9, '2 db'),
(12, 10, '100 g'),
(12, 11, '100 g'),
(13, 6, '1 evőkanál'),
(13, 14, 'ízlés szerint'),
(13, 19, '500 g'),
(14, 2, '3 db'),
(14, 3, '1 db'),
(14, 4, '2 evőkanál'),
(14, 5, '1 teáskanál'),
(14, 6, 'ízlés szerint'),
(14, 7, 'ízlés szerint'),
(14, 8, '500 g'),
(14, 34, '500 g'),
(14, 35, '3 gerezd'),
(14, 36, '1 evőkanál'),
(14, 37, '1 teáskanál');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('08cCLCuduMqUxcc4yxkyNcDFzZDuZjTSs4BMW40v', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUk5lUkFjTDEySXN1ZDVtOTdMYVRrWDZGZnhLRFM3dnVhQVJKQTJyNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935978),
('0iqLX8jQhtnxUsTMwfOZzYSysjs7aYmkdiRnJyJQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREFnN2J5alVNeFVmZHZybzBSUFpuSXNwbXcyVnJnSzFHUFhRcUFHdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936263),
('0TY5a2odTIXstG7yclBE6LFqktdnm3JZhlugMF0G', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidW9zOU1vd3QyMnhHeEtSeVMzb2J4eTEySk1xNWhSN1htbzlqSEtXbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936325),
('1fSNbscRokkkJOpQUc3PPOgmStS8rhuUxTKPayqw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0xzZGxqZkpOWlFtNVJhdmNUQ3BHaFgwbThiM1k3c3ZQZ0lIS3dzUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936013),
('1ItfsNDOvaj9yUjCGvA8tMGQugaQU0pKuqbHM2TN', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1Z6SklQYVYyZDVpREllV1ZTakFIajNRYWxTR2N6a2FzSHVIRXpMaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935041),
('33Zd7V5I5AoXJzk6eODBJsEJZZ5OzkU9zUNgaOP5', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHkwQmx3aEozU2xDcFNZc0twWG1LdENWRVRPUHJSeGROcldQYnUwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936271),
('3CGF5uihe95NLLzU9eQCGxVzKmopFPJ3gDzYpDZz', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWxLVlk3RklUYm50WnVhdWI5UTl6WG0xWDNKWFJ3aGx4RlhleTBvRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936501),
('3ESmxsOw7a1fveQK8jZVgLja1rN7o2OmSlGoiS3N', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdDaHl3SFpvNHRUcXdPM1lOUWM5SHQwMVRhU09IamxWaWFscENidiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935458),
('3Huq4j4PD4EaDg6KjWIhFjbbRI92Wx5uNAtPCJ6R', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFMxbjlGVFk4TFFwQkwxZDlyckd6dm8xOTJvNmZMYmVMU3hhb3J1QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936132),
('3JsTZAfGrjSgDTzN9cx4pJcIYLDbabzVHXKMw6AK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWZBdzJKY0xneGpoNlVYQzZnV245R3BZNjB2ZkUwYUxSdUpnRDZCdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936129),
('4dkr3PM35nrf96ZtKFPRdxY2q5sE5NJ0hDBSR2sK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0RBZjQwb3p5cDVBaU5NS3NsMDNjdGJnNDBRd1VoV1M0OVQwczNiVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935397),
('4GIReekR6VaJmAkIXRoYKre1UUZ075Tv5kgPCAtM', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1J4dUoxa2QzQzRrREFzbkxwQjdkSTVqc0ZwZldJOW1QMGJ1Y0hNNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936239),
('4KL4yO7R5i5BLMVCNAu6nU3HUPTZBG4IulBkOmF4', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnJ1MkVadUQ4RHlZd2NHeFN2TXYyT1lRekNBWlpFTVhpbUVSaHBZayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935395),
('4tSKYXqmcrOE2rbqmdrimAkxijUNnRNe9Oinq2hq', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1ZCb1hVSjE5SXF0N3V4TGN0UjY1a2FlMVp4NHp1b3kzb0FmMzZ3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936161),
('4tv7XZuPIeUaDAUhbF2dJfzSUoHbiHWaO2g4SLYQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOThMWW1JVTdzVFlza3lEM2xockFmVjhCTjluWjhhcUJOZDNYREpZaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936441),
('4w8Rarzlz7mGHsYafROXcB82NgvHYNTy0CvBmksx', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFNJOFlrV3VLUHJvTlVLaDdjV042QnF2SjVYQVgzS2RaNktYVU1xaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935656),
('51RG1WlteXx7H1XGXkhbxt6r2pVNkvFvN2B8XSoH', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEFYblVKdW1WUFhZY1pDbWRkZERFQlFNYWZJS3lRNklaaVg5UllxZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935535),
('5E77HfnJen58gyhxrwUzuZMfNEKT2UhocPFeYTOB', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhZRzNoelNlczZnbTJjMUlVNk4wWjBuRmc1WFRjdUNUZGlxN2QwRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935865),
('5KgpqaSLjR2rwnamXmSpzBl7TjLWlKzCKtu49w8E', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieURoREwwT1MyaU1nZlVKTHVoc0pQT0YzSk5tTEU1MXlMd0pUYkoyQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935968),
('5QTeMLXTYdLFXGXBIQGenVJg0Ma9D6H9pjNqM2aR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE54ekJkTWpZaXJVS2V3dFdYbmJmMTcxdXp0SDFabkk5MEtUMVBCbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936297),
('5US4eB6KInDLS31airgNkVHZSFZoEdhuZFPn4gmw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjVJdkFtZDdFemRYOTdwbktHNHJhd250N2p0MVQyQkFmMVVGV1dRdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935436),
('6Ff0l8HilyaVA1KpftkoNXUl4EM96Qn7chwZWXog', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmRXallnOGJybU9yV3BoRFpNUThobWtFTE1uTmlSZWhaTzV2TlpvZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936275),
('6IBgmqoayW8AtxBuBCxMfcIBh9JAQT40OXsq3aVx', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1pkMzRLZ3ZidHdpM2lSdGY1cGF5azRDYWw4VERGU3YwRTBid2RyWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935532),
('7PgG3RLKBymEAquZtecf3DW14R8VblAk5JfV1h0J', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmtuVng5QjJrTTdWVWU4YmJIZ0loOG1vdE40VlhBZXpCSmE4WWk0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935765),
('8O67zgq63JtaFsx4vPqmVsMBNZZo0HEaE6ZAyk3m', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXFRSk92Mmw3RDBra1NyNHlhRlRqbHpHUjNGRE0wSkFLVll0anVNSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936106),
('9itJOd3VZdf9klAqYtK5X9bboNdIp1zN80J6VUqx', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3JyMHl2dFozalZ0Vkp6S1RWeEx3bHJZdU05U0F6M1FHNndIczFvUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935435),
('9LGOQ9hfCIkPxi6puriJd5rZcziMh7BcoqqmuHRL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXM4M3YxeHUxUXlBVDNyRFBvVk5RcFpZR3JjMkFxRzRoVTM5TzhrayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935770),
('A4eFQ8etA1wYNzQUITbYUr9byJqqETvqgAFBbmPs', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUFkYTZ1RTZ6WThDQVJ2WkgycWRvM05LWXlPaFNpczhXT2NlSlljZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936496),
('a8XFE8B0RdpDXVf1bjnNQkuXmR0YBhlcPvMNWK0l', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTG53WEZ0bzJkVGxYUzZxa202UkdFVzBqejloOWVnN2J0STAxUllIcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936414),
('a9XPR67pZhTwf8vx0FABtm6tnIP1yz2WEP6KIjus', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVdzVEVtZUNLaTVIUGFINW4xdmk2TnFEanRYY3R0aDlRbjFpaGd5aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936315),
('AjzNIY4EsXJvg2CWMQJZN6Z2gnuuNTkrhApDh4WG', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTVuUjAzNWNzZ0x4NHpUTlJhYk1CY0o5dUJOUU81QWh0Sll1MjYyRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935837),
('AOXiyBLzPFUO9brCoRaCvbRTzlT0PzOcTnOVZNII', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWFJRjU4VzliRVBMbXNtOW9rblJ5NXN0Sm96SXRaQzJjMXBBaUw2bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935381),
('AsUR20JHzlgIULS2W8qh1gYTkCEuf0xhCEggfSZN', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlBjdWhFenoyTzAyaEh6TW9ldVpwQ2dGSlpHYTRBeThjQldaNDNhbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935542),
('B2U7DPESWOHZKDLJchE9WLDPxPHyw8cLQrVTgmo2', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRm1MRTVvdkxJSFZVRmFtRmVjMXNSSDJMQVJ1OU5NUGlLZTJyclo0bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936292),
('bAURWr6R3uMd5xd4EIUC5T83UIwh6TRyPAIS8TAf', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVptYkxVY1U0c2o4MUYxRTZTMXR1cnJGdEJmZjZPbkh6cmNBbkIyciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936299),
('bDpphzl5yKjg3ABYOpznKFLmIzfudOS60yTuG9kW', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUZ2b1VkN2hCYk9MZDBkWmVvS2Uyb0JiY2ZQclFuakc2TGdUMnRQRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936250),
('be0Plyy3IJxtOxZ8WTP54LNwZ4yooeR47Vy7MwdL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnZpQUFubDFuNTUxMVdxZWYyeExEZ1NRcEF3a0E0UzVJdlRjUjRySiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935982),
('bPnNRU0fTWMACErij0lpgWbZCUjlgrT95sSf9Al7', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDlTbWYwNWd6b052MmFrWDJPMkI4THRCUGJDeG11SDd0SHVnQ0xiVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936470),
('BsDivwTxszuhnAXkAw7zH67d7nBy8PRxf5Vqay4P', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNno2UUN3U3NlT1JWS2U1NHdlYk5zWnFaZFRJUzVjYVo4WkVnT0tucCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935860),
('BUQ5qSAgXnvEVXvrRtO3D35VvZfBb6jLyiz7wp74', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielZnSkRQUDc5Y0xuc2JSbmE5NWFsSUNxWlVtSllObGYxanhGdGRSeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935928),
('CFonXQ7YzS3J1K2DTMNzVANv66JRGKAAc1WNFFdN', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkFLZ0hjVU9tZE0wUHo5RTAxUGE4eTlUTHZBQmdyc1BVcWRUUGdYTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936433),
('cFV7hwlCwqLMkWILyye8R7iOl5kdNdIQsmWvyWLn', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaURvTlZVYnBsd0phZVR1TGRMQk5rcFdwNmFZeE1nNUZXeVlUS3RmcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935975),
('cyzwEhTZjAjMv44dEIMvUr04VeinlsfUCdVCtRlw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFZ1U2k2OWtra0ZzM2d5REdqeUFMVmxmbEh3Q2szWXFOdEtTZGhSSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936145),
('D1sJ23MI7MsvqGPVY6kep3DUF34K7WAlxCJTUcTM', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUc3UkFJRThFendieHR0TlJDdTJ5NFI1ck9XWWFqc0JrSnUyR3FoUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936315),
('D1xAVHtMTRUfx4F3ZoAYX7snSHrRkdghOLQn7anz', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTk5ZVJYRmd0MVJQQnZFMHF6U3dXUTdsVVVVNjBTdWlRUlZuSHZhYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936063),
('dGbozanWYpOwGtIIuVVrUjKgNyc2HoyPLsAd0kxj', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTdWRHhoSHNwR0Jtb0ozUVh0S3dyazNlWEZ2UHNCSjBKTUVSQXAyRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936473),
('dp8Zo0LzJ4BseBvHFSuJG6fKjOEc5keKdSRHVjW9', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajFGQXY4dXRBNjNLTlBMeExFU01RUU9XTVlZSWFIMUJ0dWFVNzdqRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935834),
('dxA56UU5uOMj4dGjdbbP72W6fR6ezvqardt6H60n', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakNHb1c5WnVMeGJKOFNRSGtDV000bG5oSG9sblh5VE1EcllWUFo5NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936266),
('E0CHXi378ecP5WZ8a52Sk53w7mSse93oRovFqYJ5', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWl0YkpnU0RDcWFYamxUdHVycmFYb1poWk9QelZLVm5XZ0hONmxTTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936146),
('e5w8fsfmcHIRjxBrItuUsy4pjO9uILyXXGmT9RwX', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHZvaWd1VXIxSDBUZXV2dEdWQXkzNnJ5ZWhRWm1Uc2xrOTdjOXpqViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935681),
('EcIfjlCUQxNCsBDpCRsGnCRxOVmEjvDdHFkit7w3', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEU1NDFIWmNjV0pQQUZxb2c3WWdvSHluVnpjTENaeDE5eEg3UjVERCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936313),
('EeozoLvYvZr3hGwn7D2nMpjHctn62pt2NjwjWasb', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnBsZWlyTXVqSHdrRUR3WEo5SExCb1B5Q00zb2FTc2YwcGZHa1NZMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935925),
('eF3DVWwJmi9HVhHi8ZWw8QqjDhJJXzSksllQcFCE', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3lyUnlxRWlqZzBSRVYyckNZa21xbVZHUGQ0cUUySHRURk5EUmlRRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935188),
('F82JEpvjhQDzBVmuriY7R73VKRFbFoKbfxCgyOPb', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakc4N0JWS3BhNUtxQ3A1bW9naXpGVHU3SXFnRlJ6TUpmWVVHZzZ4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935525),
('Fg84ZAXZ6wSYKRxXAp2NRlYQOYEMjELjITRBBxnM', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGFlbE9KTVFsbzNnOHp4TlNnWlFYSHYzWGtCdzI4dXRReUF3R0c1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935867),
('fJpLES1gxOphb1mMLYrYA2iGptSOlnL8HTODMJNM', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGIxMkJRWG1xczhCUk5Oc1J5UjBVc2VVMnBpcTI2V0hsNVlkdzhxMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936085),
('GoowNS0p7QTxkXrmMwqtew1jhAzEn2f2xqRSw5oi', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWpnN1NtTFV5S1ZOM05vOUVyb2xicUJrcHl2bmY4dTl4SElEYVlzWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935722),
('gTnFICl9vVjQuTfYbEexvkSizMaTRSrLimTVJVlq', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDQ2RzNiYU1iN1JpQ1VubHJneEg2eFROdllhZWpxZzhMRUliNmtSWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935395),
('H35XNohpfCX3w9Yu8vAALNb7RVcwBEBb7nU3TZ2S', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEdZMGYzRk5TWFM4YXNkMTNxb29kMVBFVW9IWHphTjhNbHY0MEJwRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936470),
('hBCbzwWM2ZDLxW2UaU2emRFzPA3YMAxrb2BNI3Pk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldnRnZ4QlFwMUh4QWVSMEFJMkpoMVJXU3dHWElKd0k5YUFaeWpEYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935568),
('HDWm4QmS1uMDb5LNzQHcHGOgq55Zi5mjvpqe5BjR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUThLWnVxMldKS0kwd09QSnJDQ2Y1ejRuTmc2aEJPb1I1RXF4QTEyciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935824),
('hGkZvZAfH52KJK8C6FPC4Lp0kTMqyOHhXVFA1UOR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0hiSlVxOXdMTU1HbXI1b0k4R3Y5d2NBR0dzeVlWNXpDZHlER2UwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936461),
('hH2m70ZptFAOOy9sTJUaLNhYIpmSxnsVJ8WnfC6p', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFZPOTFmRnE2ZlduWTVYdTlmdWRiSWNES3NhZkNBVmlMYmVVdVczRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936473),
('hp7atyj4dnuYstwvlJOtIJsuIQ7iCMgsVS2nRYtI', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUF6MUtMVHBRSGJSRXc3aEhEYzVpdVJXdlh4Qzg3M0QzQXRDTTZFZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936417),
('IbK3yNIIayB9O9mDSiYZX1j0hCQwuVASHc3KNm5X', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTVrbWFNODdYbFdUNVpUc0ZyWFNIUXFoV0F2NmExc1h1eXNmZGhCYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935542),
('icyBtFvJ0QXM8Kt3RtRQvPfhOsxdeyEOfjAffYY6', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVVtVmZjc3M4bXBFT1RrMXp5d1A4aThUSlROV2M2TlBZZmNGRmZ3ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935968),
('iG3BzonomA6RZUfwaET9sMYBW0ELeOPO3RqeUfcI', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienFSbTFUMThQaUhhVFdIS01US1UzdlZiYnl4Nm14QkYyeGI3QnBkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935445),
('iJ9AhaX34hdDIUCTm6YWeEaHLtoNK5Sb1iDkU0db', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGUwREExYW5rZURxbk5XWnVrTFZoUHp4SlluakpxRGRUaTNWeHMxNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935551),
('iO6brp13t8dz7t8nbcrv0ap8UTTMXz8G3Wv0vPjk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHJxTXdXTkxEM1F1dm1VbnQyRnRNUGtsWWR1UUthQWtFdzJ2REVmaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936295),
('j5b09Z2vaAVw1LvYt0XBiXbrbopevESqylthdZqi', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGVWSEFjRWEyQUlOaFJjTTFuOVdRVG9WODExZHVRR3dmUm1lNmhFeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935578),
('JbbO3ZoZ2zJQAd6G6gBGcuTfbF52COmkOEMrCWHn', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak5QN29Ka24yT0dRd0ZQa2lMcDV0S0Jjbkx0ODE3TGlBNmdlU1dtSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935978),
('JEGpql8fFWZdMh4T0xfCyvtfozWoe9neyuKKAbh3', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFM2SzN6RmV2cUVLeWdHZm1VREJMV1FGN2tKSWlIV0t6dWVaMjV1ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935568),
('JHLwHtbqCRsHCPokQvoPtOLl3Gjx5zsekqYSqAtd', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0NodUxGcjlEU0V1dHBxTEFpalIwMHdBY1hmNkZTakxpSGpZOE4yNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935986),
('JnQMwo7thIi6qJjuFNCyZlLASpIYoV7Lo3rF4HWe', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEhrcWpYczNsZkV0MWxHQzE3ZHh1MTdXcE1pak5MTmZ1NkpKT2lGRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936010),
('JUoV0BNmtfTTPY7a1DoOHZWzXuhtLC04xsV9WCwc', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NnNDNaRjljN3h6TlRIazF4Qks5Rmp0TmJmNGI0bFhOblNoODZFWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935888),
('JXejPI8jBGA4KZa7T3NxVXXeRCn0kKZVbBXf6ZDD', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1VzVUpUMTdLWWZYcVQ0MTBmRkwyZ0E3cUFmZzJ3MVpGUEhOWUc5YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936106),
('KHP52yZ7yR0kmtaqyJnsm1UED8j5X4Ru8W4Q75Gw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamxHcEVCdERtSVpOT0s2RWkwNzhMWjNjcUtYd1hpc2hYaEZQSVRQWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935925),
('KjlR2IvsxkOL520FkJL7j1LSrPUGUXeEONDzXUBl', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDF5RjNMbFFkRWJVeXFaWkRqVFZXNjlPUXpyUjdKbHc5aUFDOUJUeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936297),
('Km2HGNbFDD41U15GSkCohgBY8DmIqIYdZiOcOAc5', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGtTUm80bENnU2NZcHJ6SW95NTl5SkpkZThGRjFlOVJsbDBFSVp2YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935532),
('KoarSbLRbsOgjLmMfBXreKMlRlbJ0V6oZqWnfGM0', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE15TFZUT0ZWU3lRYWR4ZjZteGVvYUx1aXFXRlhHOUc4QVY0VTZIMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936140),
('kOW4rk0hppEuLVxTigZv2webgyNA9HCfRzEV29f4', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3RHTHlsUGd1R0hha09NNFQzTjNlVjdjQkg2enpMOVlhTUNSY2dvTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935202),
('kSCkjB1poBZntfejmY2UVNvnBLiwUNbXCXwRa5qO', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXBnTmdRMFJUYUVCMmwwaHBwSVp0Z3EyN3ZqR1k1RlVhM0Nrbk5RSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935932),
('Ld5oO8Bt6Txn5JD8HVWluRkdL3L4AHVi8tp4lJ3b', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM01OM2VPcE9KTzhyVXdReExic1dXV0ZZdGdHV2djbjJIV3I1SmNoMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935535),
('loR3DtGtWuGtNryn8KXfx1PgBEbLyOmzvfWtY3xI', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3pTZzNkZEZrOWd0WU9XTHRiZUx1ekJteUJvV2x3MlpMdDJuM1g4ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935977),
('LujxJsPi0TkCTL3GyiaczuhShbOTb6fxkAvzqiux', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTJBaU5WaWJVTDZqWGI5dFJ2M21aRWtwM2xsUEQ1UjloUk1pd1pCZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935982),
('m2MqsuJQdRWjW4Sf7McOXsehfTSK20OYj1OS2pSK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTlCRGlSYnZrN0JOUTJhYWx4OWM5T3ZOTnlpNHpOakpOOFFxeFVoeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935860),
('MBALoyABPfPUoc4ksGk0nx3H93dlBTQkkG7SfW0d', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlcxNHlTY3JlOUtNSERuN0VBN2t2aFBlWXd2d2t5dFI5U2hJTGtzdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935834),
('mLE6B4usryc2UoH6SytmqJMIZIw51j9XmKIiwewI', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0l5U2tGbzV0NkJpekFaRW1mcHp0SmpjZDh0Y0pRbkwwZWIwdjFtSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935824),
('mmLU2ODnr6ERaNHSTiWGkjDgfkpotPZcvIMgFp9o', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDlWNHB4UWYyeXpESlpXdnVIWXdsZjBHQ3B6MTNVZDM1SUdmNGdSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935551),
('N1KbKlXKi0CcqqcXYKAjYCSBAx8zfLHqUZTbdTjT', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTdmdVlaMVFpaUJveHk5eFBBZFFKampYMDVZZUhGODFoSUlHU0tpZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935747),
('N8S3a8IQLiuFbnQieK2faEW3KwZEU5y7TsifDnFn', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2Nyc1o3MWVtR082YmNWalZyd1lVWk1xWmQzak1NY1VRMlhnQUIycSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935381),
('N9WFj1VEVf82tO3PzTK4FRIyRF8bJ6y0keAVzNAs', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFpCbWh6YlhyV21WUnVxUUl1WGFVQUM4MlpyRzRGUXNpbTFRdHFyUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936441),
('nccNn5SCCL1s0nm6a7RCFMbCh24QllWbs5qHISCF', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1BOQm9NajZmTklhTElYQTlyTHc2bkZ2NTJaaWhBR0ZqdDExaVFWOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935854),
('ngYoD9vhvSoJvWA0MmJUQ1fzN1D6e1z9QUkdERNi', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEY1U3BFUXhySkthalA3bTJzcFcybDNBNDRSQzYyaWhyRHdESFdVRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935928),
('NI3tQv4ZFNnTBCNc7VaexG73okeHb2uJpL1zzsNj', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibldyWEM0RTgyR0s1NzhtVld5NmlOT2hPZkk5dDZMZGNsRU04MWV0WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935580),
('NoGCswclXlwrJW4HZnZbEk7PKhwT3WoX16nznUhb', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0luTUtSbmx0RnJNTmVOYWhSaGpreTNDN3BwR2VkUGN6MVlDVTZrZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935580),
('nZ23HHGmODYHiUaahuSHjIa6mY1f8HDGmlmwIVrU', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUlPSjYwR2Z0TXFjcmU2dEQxVjl4UkdUeUFDWDRWVGpOcFNwVlF0NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936140),
('oHiBt7jznAmDojtG1azOHiiyIX8dBv0QXzpWIWH0', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSE5GcjFCcnAwVXpBZzlOSThmVWVCdXpXZVVYTjkxbWxyQWZld3dRaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935932),
('P1SYr4PUMbMLZo0vo7cIqQvZpn44Xc5HbfKhIabk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWJDc2w2RzRWVnlrZEN2TkJYTUVWMVhvampJTlJVMUlGVUNSbmFhUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935865),
('p4gddjby6lZyxQKIzW5jl8Ao8xgczqqusljis5zu', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnMwN0VINjdQWEJxSWtodjFHdEFuV3hkMVBya094dW9LY1J2d0NRRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936501),
('p5KskfGmdf1ZVthvrSQ0lxJd9YLweDYoCVFcaEMG', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzRRRjJYTHZiSTZEYVRNVUVNYWVMbHRreU9WRmtnVXRRM1ZXTmF5diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935578),
('P7MYJpU9liuhXxNtas6cLOKURWZFkxtZkVx1mA1c', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTVGSWtSazhBVzI1cDY2MUhSbjA2NWpmUzR4eG16MFM5ZVhyMUpYTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935893),
('pdHqz12f8f2765p3dQk7KRee3DXqNDrbzGww6Zxx', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEphQzVUS29jTTJBWnN0a0RyNW5FWGJHUDNzVk9vbFJZRWUyVGxRcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935188),
('pEekXyqsgKVnIZwgWDi0FXhm2zC4C8tWfobjBfDT', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczRmODFPMEFOZ3JZQ09aOHVjakpkRWpSUFcza1lHVnFsSGpiR2hGMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936322),
('pMdvqrPLUY80aLGieLFo2qFZjiZk5P6pdLRj4duQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjJ2NGZmNnJoTDZXdFR1bE9QaHdHd0xkZTlIMmliNmJvRmVUdlhvbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936239),
('PspuUwq59vfChRx1Xj1gCigq3UexbiTVdfC0CndK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDBsaDc0OFdyOWZJTjMxVXlNc1BFMGFlZkVERXM3elEzMWxqYkxrVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935202),
('q1dm349oeaDnlEcVNIOV4gk4tG6kz6gJSENUToea', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGZzUnFvRTdEOWhzZU1xQWZwTGw5UHZwUll3Y1NLMzJqRW95Z2x1MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936496),
('q1uRHwsc18Reg0EiOL8KZ70ZYC0LzOsSwGdrD23P', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXRLRFhrTUp4M2tFckJqUTdsU2lJNWJhbDcyNDNuaEpBVUt0TmJsSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935756),
('qDoWOCITrJbP4nH13eIA4Z5FivnO1OUAwAqSbhp6', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnhXMDdzYnJYN3g1d3BOVml5Q2h2RUE0ZzgwMVFOSWFjcEw1ZUlmcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936266);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('qJp4Gpa6qekyA6nP3W7REBSX2ZfshxK8ahZXxuZm', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmJuMVUzUG5aellDQnBSc0hkWkR4WGtLQUZhR2dTR3NDN2VNaVJ0dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935622),
('QKClkx1BDJgZd0hPVm0gdpLwUh2gQ2tuNOoN2IYR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2RMdFE2ZlJ2ZzI2dzZ2UHpBc2hzajJsY0dlQ2dUREFIY0VMU2U5dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935837),
('QM9nMNLFux8hhp9gOZgBA0uEtocPI89yWe6C4wKd', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRndpMEU0MnBYV29DMG84S3JkeWVYOGZQT0dhdk5aNzZmamZwWEVqbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935525),
('qrvTBvpbaTq6Phqb7gVwqm7QPCSlEegTpY4fQ96Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUZuZDhHTlQxWm5ZdTRTS2dDRWlmQ0Z4N1NuR0FZR1NpdGFLaEJRSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936132),
('QSUfjkg0i3cr61sacK7eaHlr9vvxlAM5fqjkDqHu', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE5GSHBnMjIwTGFYcjBjVnlKU1gxd3ZVRnNpTXdnN1ZZNGtBNjZFNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936295),
('QwlOj1Qk7WVq5B9T3OAsnIG8gWgeY8A6jNQ0bIOL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGpWaWRsZjJLZEpYYndRUXh4MXJhaUxKRWlWZVdUT3MyZDdqWXdhMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935716),
('Qy3cwy4AmrZC8vIzMie1zdA3t6nXlJ4ABM8qimgw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2RVdjlJcUR4V0ZPU2JUS2dHc3ZlZFhaQ0t2NUllWlN5SkZrTUhWYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935933),
('RpgfwDkJdiTQVCgg0Ojc3q3CqXpK2VA6rqWf0Pml', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEZDenFQM2JMczBRV1B3bmNrWW0zOVJFaDVPb1JHdXdSMHZHdGQwcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935768),
('saoeJhQaQ18J8QL7fDz8vWKV0Nrf2ypyy78gTLE1', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3dZa3cxN0dGQUhLSDRyb1VqbEY1Q0dSZ2xGNEluSXRPVkhkZlZ3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936432),
('SBx4WodVO9rakSAK2aKG8jzksHydaN41cia7Jc42', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG00cVk4ZkQ4UU5LNHpxNnlzM3B0bkZtVHJBb1l2czBNN1VWM3FxMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935867),
('Sfy0PZhrAMZjd1koMlHFFRkhwKpSLWGaPz1yyUMH', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHdoem9qWWthcEZvaWJKYjZTUnZjQ0xMUXpncDJUdHBndkNaWDA0TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935880),
('TNSU4ueJ6cfPWDgv16P9f54WOc4kNf0sA4ZGwGjm', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTJIa29JbG9qbHFCaElOWGkzT09RVGdCM2Z1N05Td216bUdLWkhFcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935918),
('TtZ7VHOotPYYwRc86clrmsfZCKWg2fpqXUNvP7nt', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREwzOUFacXc3QzNVMm5IZVFKZWpkWWpYVjNCSVpuNGFHNXZHNzVlMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936013),
('u11EDZJEiHt0SOV3XXrROooqgFBDoynOcN4qQoWk', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTW9rMkdGc2lOUmUyak5DeDJucGs0MU1YYkYzTTc4ODlJeEFIZ2tLZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935975),
('u4FcNBB6pZtwzeSF1ECRYIMRlbC1GZmbDfVxcu8H', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWFmMGtCalJEUXBqWXpoU2JhZzlQMTFvbFQ1SXdVaVRHbWFhT0ZCaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936161),
('u59KYcmgq8gkaeC5UijZUWrhK8UPboi5FxgGPATX', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWRuYVhiZE0ydTdQRjZjakVXT250M1lBSHhvQVZnMERTUWxLOVVVTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935753),
('u5VmtTO9lz1Z4vzc3DOVgDqKYjfRPzfKdhhXp6UQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkFUM1dpdDBXODhGeVg0bnFiQWY0M0c0SGVzaDBBN1U4bHRtQjBlQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935973),
('unxcNy8UpOaN7ZPCdPIJpdJwFpVQvVVxdjllAKlX', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFpDZDRFSGplQlFzOFFVWHVrOXlIM2tIRkZPWEhlUGtteDJiZ3NSdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936085),
('uqqecoMDwnPa6Gf636VniCgLC2idgls8kIb5sQ4N', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEJhaEtWUzBCVzBQTm1aeHNCUXh1Zzh6Y0NWUjZhd2UzbjdtazAxbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935918),
('UUiT3yGVN4fwA1X0JXANoRsI8xSDcAt5SCN6NR8G', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEhxTkplVFRnMnVkbHl5SnREelRObUMzYndMbDE0bmpacHd4d25VZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936410),
('vbILHaqKqZxjkZYky9Zovs1ghoem0vQZpLRYlbVJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3FQTGVIZG4wU2FYNWxTNFJGTDRZNzBrb205eVk3OG1SVWtPQjA4SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936419),
('viWp7yny498jSfIPIHh9cAXQZcoHWu2pa12a9V5G', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2Q2UVpXNmxPMTBpSzA1dEREeFVUTEtMcEJPNUVmN0pOMmFQeDJFZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936275),
('vOeknEPs0rfVZ939b3jfMjiQxWEPD07yXbfNU6sB', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVh5dlNiWnNvTWR6NFVZVVJEYnlaS0trM1V6ZUs0SkNOQzV4YjJZRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935986),
('w3I4YI23eb7zcQUmK5ZnIF8Q7zWNUZ5vss02cFCo', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHA5S1AwRFpvT2hjWXBETVpBVDdoQ1V3S2o0S2Rzc2RkMWRQcEJPRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935888),
('wAC0AuftCPlfS7uEXJpNUsKJDOEqBv4leGPr9S1T', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2FoNmhFQXdLWWhPV0Zqd3ZoMms4T1M0aDBseFJMZEtGa1RwdFdlYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936010),
('WXwCSJ8oj4LfqC2A6aZgsHwx3GiCE6ZgatyrAey4', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZXMHNyVTg1R0M1TWxYUWluUmZJbElDVjBOckNockFYaTNUS3JmWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935893),
('x3qaVfNNL0rxW0VOAw2k2Q5xt3BIUqPV6NoXItOi', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDNESlFqSkNqVmIwRXZxa1VlWUJwOXllb1VGTGw0M1lGMG5mNXN1ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936129),
('x6trldwZKq0wdhxOaSN1Bupzrehghp2pC6alULtl', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0JiQ2ZNWUNjODI3MFV2bExmMmdjdVprTmdsd2FvWERhTmV2ZWF2NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936461),
('xBJAskwaab9YUzQ18UAGa31U1eT6gaHTFveOj4YK', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWNRRE1DNjZxOFhEdkE2SExKZTNuMk85V0Q4T0lNTnBpZkFBV2xCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936313),
('XfbYC8r08BLiZYuLTmpkoAhwXu4QNN8z266JPOvY', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczVMZUdmS3ZGMEZ3R2NCTFJ0RzZ1YVNtbUdpYWVpWVM3QkNMWmZyRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935973),
('xJXqdXYvqhmnUZAnEVPgfxq0pjjL7IrtpM3Qv0M1', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDBERTVjNDlnUEx6UXU3RU1Fc3RtNWVjTU1PNmNwTUNnQktzNzZNciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738936271),
('xrBjSkR3XTuXsJJsJI9fxpljSVyGS7oKqw7K1wqL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnhQMDBlOXgzcHVyeEpqcUxwVUdLcHZueXRuWVVIYndIRmJHU0JqQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935977),
('XS3Qn7y1uYuT9DTwI8PcS3gFdOFZk8fW2uQJBZkd', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieERyTmR0MU5oRHpKVFlpRElQQkxQUGxQRm5kYkRrcnZINUp0RXdyTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935586),
('xuoP2Q7csTXzlL5l5CwCdAMffq41BjkotkiPrGCh', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWxFWnduRUVUc21Jc2NvaFhkUkdkeUNVOGJRMlRMaDRDMDBEVm5nZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935575),
('xVIzvqF7GKLvx4fqMSQbhdvLz2a9ztmddxzHeM6u', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE5xRFB1NnhFbmM3djVpbjcxUGxKZDRrcjN5azdsRm5rOThUdXpQbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935933),
('XW74jb1hUbH9DhrnY2aR1sn9PMoEQvWvdiYu1t4U', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXhXOHFEeTVmZ1lNd2hjYzBRZmFmTEE4UjJZR1Y3eGhoUHk4WWdWUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935765),
('XZOd6Jjvrc7fZ0sJaHaNJfcKEYlp0n9iSGLhRg9r', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHV1VEZsUzk3N1pGRzZFNnlLbU5WY0d3aEJVU2dLVmZJN0RlQnFJRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzLzE0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936424),
('Y8wZPkZyovbMCKPY8T4UiunimiPUan4agpwOdKlB', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREtHR0haT0ZhU3pEMVhnWlMyY2hyZkhDVmlLa3B0VmZzWFdqdnp0cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936292),
('yiZrhOKwJwSQdeXmyatPWjWGil0gR02VIyjZ8UJ4', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXRrV1RnTUk4bGJIc0xXQWVneHlHdklJdmZXUXFMckwzZFptUUJGeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935041),
('YO6N4cdDwyGgrtJsEfaY6GGtzJaNBjTxKGYgahL7', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXRKMzlzRklESFFLRk1LazA1eGNwWmhXR0RwR04xNmwxV2cxbTRoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936063),
('yPUGlhpJliigRNjKxceudtH77JUDGWKwimGMkUnS', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXh2eFE2enozRzBSVEs0UUVSVG1iVHNsUlFuM0JzN29oeVZ0SE55ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935756),
('YzrgIEkPvxe0l1HetMs2MF8Q4ruRAF4D7jiwBhNb', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjVJVkR4NnRxbUZDTWtZU0xrZ00xUnVMMzd0UmVPUW9GOGt3d0FUeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935880),
('z6GcR1Vq4YgMMlZyCf98Nu6DlwImxSXYclL3lnZc', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzdWTkxlTHY5Z01UclRNQVAwRGhMZGVteXoxOVNXQW9jRnQ3dlZkbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935445),
('ZdSSS8QKNMIQ00qJW2mm9DJjpHriCeWoqX58PkZR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNllTb3BtR2dsS05DenBnYnVQWXZBQ3BxY09rbzRJRXhXNklpaXlKSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936263),
('ZgIfzWeoiYhBkvjzp1cnSuTqhfdD8lAbELRfVh3F', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHVXRGV2bUh4bDVRRUlRYlIwSHEwRGRyVFoycHZPcVhFek9MWDRpeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935676),
('zKKahnVzp2sqHd9wbvrkNetcgiEUacochGlgnfnL', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXN1TGx1bXduZ2pxdjA4WHVLdVRVRUZKdFdZMjB5Z1Jwa2RQVDZCZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936299),
('zM67uztgODa9bM6yRlp9KVM4fu0sSDp3ksFglAGg', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnNHczBBb2Y0WU1RaTFBdm02MmRmZjNvM1lyaWl6Q0JWT3lzMUVJQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936322),
('zriXEBfdGEL03LGhL4CCHBIKr0VM7JOHj2svSZRX', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0xtUTBaYUZSbEFEVmN6VFpnaWZ6QzBqYWZhbUlob00wa0s1eFhqRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935586),
('ZrvDlMDp885rXHjCYPrajxy8d15IlHmvGqW5ndlp', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0tPb28yRUhKYTJnQ0t1eVU4MkxLdDZnSU1mM0ZJMDNINHVscVJMUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935770),
('ZS7iJ7G40CKLch4sy2y7teUFEJ6jpSGuDfToBzpP', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEsydWdLcGlCVFdVZ09laEFNbDZOVk9CUzFjZXNFaXZLTGE3RmNwdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738936250),
('ZvV4ibBMoavjFFBmPSxgD6gXaCQT9X8gHN9KIltt', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVueXVMMzVmVWtoMTliVU9KQzg4RHY0aThlNXdGMWdmVmx4aGQxVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbmdyZWRpZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1738935575),
('zWxzHTiePwEoLUi8gl5unkR6NMtobEkb4My0GBNB', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVY1c0lIa3lxNHBjVmVtaEJoMmVwaGg4WnIwZXhYYjF6S2o5eVJPYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1738935854);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- A tábla indexei `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
