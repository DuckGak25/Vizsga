-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Feb 25. 21:18
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `category`) VALUES
(1, 'paprika', 'zöldség'),
(2, 'paradicsom', 'zöldség'),
(3, 'vöröshagyma', 'zöldség'),
(4, 'olaj', 'alapvető'),
(5, 'pirospaprika', 'fűszer'),
(6, 'só', 'alapvető'),
(7, 'bors', 'alapvető'),
(8, 'sertéshús', 'hús'),
(9, 'tojás', 'tejtermék/tojás'),
(10, 'liszt', 'alapanyagok'),
(11, 'zsemlemorzsa', 'alapanyagok'),
(12, 'piskótalap', 'édesség'),
(13, 'tejszín', 'tejtermék/tojás'),
(14, 'cukor', 'alapvető'),
(15, 'vaníliás cukor', 'édesítőszer'),
(16, 'kakaópor', 'édesség'),
(17, 'rum', 'ital'),
(18, 'darált dió', 'magvak'),
(19, 'mazsola', 'gyümölcs'),
(20, 'csokoládéöntet', 'édesség'),
(21, 'marhahús', 'hús'),
(22, 'burgonya', 'zöldség'),
(23, 'víz', 'alapvető'),
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
(38, 'piskótalap', 'édesség'),
(39, 'tejszín', 'tejtermék/tojás'),
(40, 'tojás', 'tejtermék/tojás'),
(42, 'liszt', 'alapvető'),
(43, 'vaníliás pudingpor', 'porok'),
(44, 'tej', 'tejtermék/tojás'),
(45, 'puha vaj', 'tejtermék/tojás'),
(48, 'csokoládé', 'édesség'),
(49, 'apróra vágott dió', 'magvak'),
(50, 'csokoládéreszelék', 'édesség'),
(67, 'halo', 'szia'),
(68, 'almapaprika', 'zöldség');

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
(26, '2024_09_30_171931_create_sessions_table', 1),
(27, '2024_10_02_145101_create_recipes_table', 1),
(28, '2024_10_02_145111_create_ingredients_table', 1),
(29, '2024_10_03_111000_create_personal_access_tokens_table', 1),
(30, '2024_10_03_111657_create_recipe_ingredient_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'norbinstechnik@gmail.comToken', 'c8cdb393f0f912c9eb833f644e6e4a11287faa5f767fea69deb856d3a5957c1b', '[\"*\"]', NULL, NULL, '2025-02-25 19:13:47', '2025-02-25 19:13:47');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `imagelink` varchar(255) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `categories`, `imagelink`, `featured`) VALUES
(1, 'Lecsó', '<p>A hagym&aacute;t apr&oacute;ra v&aacute;gjuk, &eacute;s olajon &uuml;vegesre pir&iacute;tjuk...</p>', 'főétel, vegetáriánus', 'https://minimalistbaker.com/wp-content/uploads/2021/06/EASY-Ratatouille-Versatile-1-Pot-Flavorful-French-inspired-packed-with-summer-vegetables-and-just-10-ingredients-required-minimalistbaker-recipe-plantbased-glutenfree-ratatouille-summer-4.jpg', 1),
(2, 'Rántott Hús', '<p>A h&uacute;st v&eacute;konyra klopfoljuk...</p>', 'főétel, húsétel', 'https://minimalistbaker.com/wp-content/uploads/2023/03/Kimchi-Rice-Fritters-6.jpg', 0),
(3, 'Somlói Galuska', '<p><strong>A Soml&oacute;i galuska egy hagyom&aacute;nyos magyar desszert...</strong></p>', 'desszert', 'https://pasakebab.hu/szekesfehervar/wp-content/uploads/sites/5/2020/08/IMG_4398-1.jpg', 1),
(4, 'Töltött Káposzta', '<p>A savany&uacute; k&aacute;posztalevelekbe dar&aacute;lt h&uacute;st &eacute;s rizst t&ouml;lt&uuml;nk...</p>', 'főétel', 'https://f0345cba75.cbaul-cdnwnd.com/c74b54ad868b3970d1351863bf68edf0/200000045-054670643e/73d17aa1febe65f721deb657e3c50d4b.jpg', 0),
(5, 'Rakott Krumpli', '<p>Krumplis &eacute;s toj&aacute;sos rakott &eacute;tel, tejf&ouml;llel megkenve.</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2021/04/daralt-husos-rakott-krumpli-1280x1920.jpg', 0),
(6, 'Főtt Rizs', '<p>Egyszerűen elk&eacute;sz&iacute;tett főtt rizs.</p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/07/mgg-vitchakorn-zxnc_lbbvge-unsplash-1280x1920.jpg', 0),
(7, 'Mákos Guba', '<p>Pisk&oacute;t&aacute;b&oacute;l k&eacute;sz&uuml;lt &eacute;dess&eacute;g m&aacute;kkal.</p>', 'desszert', 'https://static.streetkitchen.hu/live/uploads/2024/11/makos-guba-vaniliasodoval-2-scaled.jpg', 0),
(8, 'Káposztás Tészta', '<p>K&aacute;poszt&aacute;val &eacute;s t&eacute;szt&aacute;val k&eacute;sz&uuml;lt &eacute;tel.</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2020/07/kaposztas-teszta-talalva-1280x1920.jpg', 1),
(9, 'Gyümölcsleves', '<p>Friss gy&uuml;m&ouml;lcs&ouml;kből k&eacute;sz&uuml;lt leves.</p>', 'leves', 'https://www.karaidavid.hu/wp-content/uploads/2022/06/gyumolcsleves-9257_ps.jpg', 0),
(10, 'Borsóleves', '<p>Z&ouml;ldbors&oacute;b&oacute;l k&eacute;sz&uuml;lt leves.</p>', 'leves', 'https://static.streetkitchen.hu/live/uploads/2021/02/meguszos-klasszik-borso-leves-0111-lilla-4-egyedi-1280x1920.jpg', 0),
(11, 'Sütőtök Krémleves', '<p>S&uuml;tőt&ouml;kből k&eacute;sz&uuml;lt kr&eacute;mleves.</p>', 'leves', 'https://www.mindenmentes.hu/wp-content/uploads/2017/11/kokuszos-currys-sutotok-kremleves-5.jpg', 1),
(12, 'Rántott Zöldség', '<p>R&aacute;ntott z&ouml;lds&eacute;gek v&aacute;ltozatosan.</p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/04/rantott-burgonya-csipos-szosszal-1-1280x1920.jpg', 0),
(13, 'Gyümölcs Saláta', '<p>Friss gy&uuml;m&ouml;lcs&ouml;kből k&eacute;sz&uuml;lt sal&aacute;ta.</p>', 'előétel', 'https://static.streetkitchen.hu/live/uploads/2017/08/img_5022.jpg', 0),
(77, 'Bolognai', '<p class=\"p1\"><strong>A bolognai spagetti egy &iacute;nycsikland&oacute; olasz &eacute;tel...</strong></p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2022/03/bolognai-ragu-8-scaled.jpg', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`id`, `ingredient_id`, `recipe_id`, `quantity`) VALUES
(162, 1, 1, '5 db'),
(163, 2, 1, '3 db'),
(164, 3, 1, '2 db'),
(165, 4, 1, '3 evőkanál'),
(166, 8, 2, '4 szelet'),
(167, 9, 2, '2 db'),
(168, 9, 3, '4 db'),
(169, 10, 3, '150 g'),
(171, 13, 3, '3 dl'),
(172, 14, 3, '150 g'),
(173, 17, 3, '3 evőkanál'),
(174, 43, 3, '1 csomag'),
(175, 44, 3, '500 ml'),
(176, 45, 3, '100 g'),
(177, 48, 3, '200 g'),
(178, 49, 3, 'ízlés szerint'),
(179, 50, 3, 'ízlés szerint'),
(180, 2, 4, '500 ml'),
(181, 3, 4, '1 db'),
(182, 6, 4, 'ízlés szerint'),
(183, 7, 4, 'ízlés szerint'),
(184, 28, 4, '1 fej'),
(185, 29, 4, '200 g'),
(186, 30, 4, '500 g'),
(187, 6, 5, 'ízlés szerint'),
(188, 7, 5, 'ízlés szerint'),
(189, 9, 5, '4 db'),
(190, 22, 5, '1 kg'),
(191, 26, 5, '200 g'),
(192, 27, 5, '500 g'),
(193, 6, 6, 'ízlés szerint'),
(194, 23, 6, '500 ml'),
(195, 29, 6, '250 g'),
(196, 12, 7, '300 g'),
(197, 14, 7, 'ízlés szerint'),
(198, 23, 7, '500 ml'),
(199, 32, 7, '100 g'),
(200, 3, 8, '1 db'),
(201, 4, 8, '2 evőkanál'),
(202, 6, 8, 'ízlés szerint'),
(203, 7, 8, 'ízlés szerint'),
(204, 24, 8, '300 g'),
(205, 28, 8, '500 g'),
(206, 14, 9, 'ízlés szerint'),
(207, 19, 9, '300 g'),
(208, 23, 9, '1 l'),
(209, 2, 10, '300 g'),
(210, 3, 10, '1 db'),
(211, 6, 10, 'ízlés szerint'),
(212, 7, 10, 'ízlés szerint'),
(213, 23, 10, '1 l'),
(214, 6, 11, 'ízlés szerint'),
(215, 7, 11, 'ízlés szerint'),
(216, 23, 11, '1 l'),
(217, 27, 11, '100 g'),
(218, 30, 11, '500 g'),
(219, 1, 12, '300 g'),
(220, 4, 12, 'a sütéshez'),
(221, 6, 12, 'ízlés szerint'),
(222, 7, 12, 'ízlés szerint'),
(223, 9, 12, '2 db'),
(224, 10, 12, '100 g'),
(225, 11, 12, '100 g'),
(226, 6, 13, '1 evőkanál'),
(227, 14, 13, 'ízlés szerint'),
(228, 19, 13, '500 g'),
(256, 2, 77, '3 db'),
(257, 3, 77, '1 db'),
(258, 4, 77, '2 evőkanál'),
(259, 5, 77, '1 teáskanál'),
(260, 6, 77, 'ízlés szerint'),
(261, 7, 77, 'ízlés szerint'),
(262, 8, 77, '500 g'),
(263, 34, 77, '500 g'),
(264, 35, 77, '3 gerezd'),
(265, 36, 77, '1 evőkanál'),
(266, 37, 77, '1 teáskanál'),
(267, 16, 78, '1 kg'),
(268, 10, 79, '1'),
(269, 11, 80, '1');

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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` int(11) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Norbert', 'gillich.norbert@icloud.com', '$2y$12$173nhpko/r1rGsKCQFD2NeQzyIY/PZurBx6gE4N5MIhPwHqPFPgmu', 2, NULL, '2025-02-20 16:21:40', '2025-02-20 16:21:40'),
(2, 'Norbi', 'norbinstechnik@gmail.com', '$2y$12$oPuWKh491APN825gsGlok.0HV71N34FfUi7.MOHQ1YtfS90Gok3le', 0, NULL, '2025-02-20 19:08:51', '2025-02-20 19:08:51'),
(3, 'simaAdmin', 'trala@gmail.com', '$2y$12$dyIeIap0udIgG0LPttSlJuM8v4JcKUnTAiqSjoFD.yDW5hP5Qy8Dq', 1, NULL, '2025-02-20 19:27:00', '2025-02-20 19:27:00'),
(4, 'Attila', 'jager@attila.hu', '$2y$12$57YKLeEqb7R/YAh6fkoICeKf3jirCnYH5tzu3ox8DDs5yWFe615yi', 0, NULL, '2025-02-21 12:55:06', '2025-02-21 12:55:06'),
(5, 'Ács Bence', 'acs@bence.hu', '$2y$12$jmTdIeuBNmQtbhIJX5myhOBKH94MZGztbKU2dwf5wjKXfWhRsOkQq', 0, NULL, '2025-02-21 13:30:28', '2025-02-21 13:30:28'),
(8, 'Bálint Dezső Géza', 'balint@dezso.hu', '$2y$12$cNXKtfmWCRi01Kd90ECVpO7DAQsl3/RcV/DY6Ii2/v0UczyLumUSO', 0, NULL, '2025-02-21 13:36:54', '2025-02-21 13:36:54'),
(9, 'sibidi dijcsland', 'nembaszlakat123@gmail.com', '$2y$12$f1ZeGLv4.WIjjty8P9YULOWOYweOJN2rxMM3ARVJhloeJ8mOEc92K', 0, NULL, '2025-02-21 18:04:45', '2025-02-21 18:04:45');

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
-- A tábla indexei `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT a táblához `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
