-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Már 11. 11:58
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
  `category` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `category`, `language`) VALUES
(1, 'paprika', 'zöldség', 'hu'),
(2, 'paradicsom', 'zöldség', 'hu'),
(3, 'vöröshagyma', 'zöldség', 'hu'),
(4, 'olaj', 'alapvető', 'hu'),
(5, 'pirospaprika', 'fűszer', 'hu'),
(6, 'só', 'alapvető', 'hu'),
(7, 'bors', 'alapvető', 'hu'),
(8, 'sertéshús', 'hús', 'hu'),
(9, 'tojás', 'tejtermék', 'hu'),
(10, 'liszt', 'alapanyagok', 'hu'),
(11, 'zsemlemorzsa', 'alapanyagok', 'hu'),
(12, 'piskótalap', 'édesség', 'hu'),
(13, 'tejszín', 'tejtermék', 'hu'),
(14, 'cukor', 'alapvető', 'hu'),
(15, 'vaníliás cukor', 'édesítőszer', 'hu'),
(16, 'kakaópor', 'fűszer', 'hu'),
(17, 'rum', 'ital', 'hu'),
(18, 'darált dió', 'magvak', 'hu'),
(19, 'mazsola', 'gyümölcs', 'hu'),
(20, 'csokoládéöntet', 'édesség', 'hu'),
(21, 'marhahús', 'hús', 'hu'),
(22, 'burgonya', 'zöldség', 'hu'),
(23, 'víz', 'alapvető', 'hu'),
(24, 'tészta', 'alapanyagok', 'hu'),
(25, 'túró', 'tejtermék', 'hu'),
(26, 'füstölt szalonna', 'hús', 'hu'),
(27, 'tejföl', 'tejtermék', 'hu'),
(28, 'káposzta', 'zöldség', 'hu'),
(29, 'főtt rizs', 'alapanyagok', 'hu'),
(30, 'darált hús', 'hús', 'hu'),
(31, 'zsemle', 'alapanyagok', 'hu'),
(32, 'mák', 'magvak', 'hu'),
(33, 'élesztő', 'alapanyagok', 'hu'),
(34, 'paradicsomszósz', 'alapanyagok', 'hu'),
(35, 'fokhagyma', 'fűszer', 'hu'),
(36, 'bazsalikom', 'fűszer', 'hu'),
(37, 'oregano', 'fűszer', 'hu'),
(38, 'piskótalap', 'édesség', 'hu'),
(39, 'tejszín', 'tejtermék', 'hu'),
(40, 'tojás', 'tejtermék', 'hu'),
(42, 'liszt', 'alapvető', 'hu'),
(43, 'vaníliás pudingpor', 'porok', 'hu'),
(44, 'tej', 'tejtermék', 'hu'),
(45, 'puha vaj', 'tejtermék', 'hu'),
(48, 'csokoládé', 'édesség', 'hu'),
(49, 'apróra vágott dió', 'magvak', 'hu'),
(50, 'csokoládéreszelék', 'édesség', 'hu'),
(68, 'almapaprika', 'zöldség', 'hu'),
(69, 'mozarella', 'sajtok', 'hu'),
(74, 'főzőtejszín', 'tejtermék', 'hu'),
(75, 'étcsokoládé', 'csokoládé', 'hu'),
(76, 'hideg habtejszín', 'tejtermék', 'hu'),
(77, 'kristálycukor', 'alapvető', 'hu'),
(78, 'vanília', 'fűszer', 'hu'),
(79, 'mascarpone', 'tejtermék', 'hu'),
(80, 'kávé', 'ital', 'hu'),
(81, 'babapiskóta', 'pékáru', 'hu'),
(82, 'holland kakaópor', 'fűszer', 'hu'),
(83, 'szia', 'hello', 'hu'),
(87, 'potato', 'vegetable', 'en'),
(88, 'sugar', 'basic', 'en'),
(89, 'salt', 'basic', 'en'),
(90, 'soy sauce', 'condiment', 'en'),
(91, 'brown sugar', 'sweetener', 'en'),
(92, 'garlic', 'vegetable', 'en'),
(93, 'ginger', 'vegetable', 'en'),
(94, 'salmon', 'protein', 'en'),
(95, 'carrots', 'vegetable', 'en'),
(96, 'radishes', 'vegetable', 'en'),
(97, 'red cabbage', 'vegetable', 'en'),
(98, 'rice', 'grain', 'en'),
(99, 'sesame seeds', 'seeds', 'en'),
(100, 'green onion', 'vegetable', 'en'),
(101, 'olive oil', 'oil', 'en'),
(102, 'butter', 'dairy', 'en'),
(103, 'lemon juice', 'fruit', 'en'),
(104, 'honey', 'sweetener', 'en'),
(105, 'black pepper', 'basic', 'en'),
(106, 'salt', 'spice', 'en'),
(107, 'chicken breast', 'protein', 'en'),
(108, 'beef', 'protein', 'en'),
(109, 'pork', 'protein', 'en'),
(110, 'tofu', 'protein', 'en'),
(111, 'onion', 'vegetable', 'en'),
(112, 'tomato', 'vegetable', 'en'),
(113, 'bell pepper', 'vegetable', 'en'),
(114, 'potato', 'vegetable', 'en'),
(115, 'mushrooms', 'vegetable', 'en'),
(116, 'basil', 'herb', 'en'),
(117, 'parsley', 'herb', 'en'),
(118, 'cinnamon', 'spice', 'en'),
(119, 'nutmeg', 'spice', 'en'),
(120, 'milk', 'dairy', 'en'),
(121, 'cheddar cheese', 'dairy', 'en'),
(122, 'parmesan', 'dairy', 'en'),
(123, 'yogurt', 'dairy', 'en'),
(124, 'flour', 'grain', 'en'),
(125, 'oats', 'grain', 'en'),
(126, 'quinoa', 'grain', 'en'),
(127, 'chickpeas', 'legume', 'en'),
(128, 'lentils', 'legume', 'en'),
(129, 'walnuts', 'nuts', 'en'),
(130, 'almonds', 'nuts', 'en'),
(131, 'peanuts', 'nuts', 'en'),
(132, 'coconut milk', 'dairy alternative', 'en'),
(133, 'soy milk', 'dairy alternative', 'en');

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
(7, '2024_09_30_171931_create_sessions_table', 1),
(8, '2024_10_02_145101_create_recipes_table', 1),
(9, '2024_10_02_145111_create_ingredients_table', 1),
(10, '2024_10_03_111000_create_personal_access_tokens_table', 1),
(11, '2024_10_03_111657_create_recipe_ingredient_table', 1),
(12, '2025_02_18_195859_create_user_table', 1);

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
(4, 'App\\Models\\User', 1, 'gillich.norbert@icloud.comToken', '1ae9bf296763c9c72aca266671dd166c2cbf0c57b32ea60e620670cb720f11a1', '[\"*\"]', '2025-03-11 09:57:36', NULL, '2025-03-11 09:44:50', '2025-03-11 09:57:36');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `categories` varchar(255) NOT NULL,
  `imagelink` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `categories`, `imagelink`, `language`, `featured`, `user_id`, `approved`) VALUES
(1, 'Lecsó', '<p>A hagym&aacute;t apr&oacute;ra v&aacute;gjuk, &eacute;s olajon &uuml;vegesre pir&iacute;tjuk...</p>', 'főétel, vegetáriánus', 'https://minimalistbaker.com/wp-content/uploads/2021/06/EASY-Ratatouille-Versatile-1-Pot-Flavorful-French-inspired-packed-with-summer-vegetables-and-just-10-ingredients-required-minimalistbaker-recipe-plantbased-glutenfree-ratatouille-summer-4.jpg', 'hu', 0, 1, 1),
(2, 'Rántott Hús', '<p>A h&uacute;st v&eacute;konyra klopfoljuk...</p>', 'főétel, húsétel', 'https://minimalistbaker.com/wp-content/uploads/2023/03/Kimchi-Rice-Fritters-6.jpg', 'hu', 1, 1, 1),
(3, 'Somlói Galuska', '<p><strong>A Soml&oacute;i galuska egy hagyom&aacute;nyos magyar desszert...</strong></p>', 'desszert', 'https://pasakebab.hu/szekesfehervar/wp-content/uploads/sites/5/2020/08/IMG_4398-1.jpg', 'hu', 0, 1, 1),
(4, 'Töltött Káposzta', '<p>A savany&uacute; k&aacute;posztalevelekbe dar&aacute;lt h&uacute;st &eacute;s rizst t&ouml;lt&uuml;nk...</p>', 'főétel', 'https://f0345cba75.cbaul-cdnwnd.com/c74b54ad868b3970d1351863bf68edf0/200000045-054670643e/73d17aa1febe65f721deb657e3c50d4b.jpg', 'hu', 0, 1, 1),
(5, 'Rakott Krumpli', '<p>Krumplis &eacute;s toj&aacute;sos rakott &eacute;tel, tejf&ouml;llel megkenve.</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2021/04/daralt-husos-rakott-krumpli-1280x1920.jpg', 'hu', 0, 1, 1),
(6, 'Főtt Rizs', '<p>Egyszerűen elk&eacute;sz&iacute;tett főtt rizs.</p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/07/mgg-vitchakorn-zxnc_lbbvge-unsplash-1280x1920.jpg', 'hu', 0, 1, 1),
(7, 'Mákos Guba', '<p>Pisk&oacute;t&aacute;b&oacute;l k&eacute;sz&uuml;lt &eacute;dess&eacute;g m&aacute;kkal.</p>', 'desszert', 'https://static.streetkitchen.hu/live/uploads/2024/11/makos-guba-vaniliasodoval-2-scaled.jpg', 'hu', 1, 1, 1),
(8, 'Káposztás Tészta', '<p>K&aacute;poszt&aacute;val &eacute;s t&eacute;szt&aacute;val k&eacute;sz&uuml;lt &eacute;tel.</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2020/07/kaposztas-teszta-talalva-1280x1920.jpg', 'hu', 0, 1, 1),
(9, 'Gyümölcsleves', '<p>Friss gy&uuml;m&ouml;lcs&ouml;kből k&eacute;sz&uuml;lt leves.</p>', 'leves', 'https://www.karaidavid.hu/wp-content/uploads/2022/06/gyumolcsleves-9257_ps.jpg', 'hu', 0, 1, 1),
(10, 'Borsóleves', '<p>Z&ouml;ldbors&oacute;b&oacute;l k&eacute;sz&uuml;lt leves.</p>', 'leves', 'https://static.streetkitchen.hu/live/uploads/2021/02/meguszos-klasszik-borso-leves-0111-lilla-4-egyedi-1280x1920.jpg', 'hu', 0, 1, 1),
(11, 'Sütőtök Krémleves', '<p>S&uuml;tőt&ouml;kből k&eacute;sz&uuml;lt kr&eacute;mleves.</p>', 'leves', 'https://www.mindenmentes.hu/wp-content/uploads/2017/11/kokuszos-currys-sutotok-kremleves-5.jpg', 'hu', 0, 1, 1),
(12, 'Rántott Zöldség', '<p>R&aacute;ntott z&ouml;lds&eacute;gek v&aacute;ltozatosan.</p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/04/rantott-burgonya-csipos-szosszal-1-1280x1920.jpg', 'hu', 0, 1, 1),
(13, 'Gyümölcs Saláta', '<p>Friss gy&uuml;m&ouml;lcs&ouml;kből k&eacute;sz&uuml;lt sal&aacute;ta.sads</p>', 'előétel', 'https://static.streetkitchen.hu/live/uploads/2017/08/img_5022.jpg', 'hu', 0, 1, 1),
(77, 'Bolognai', '<ol data-start=\"209\" data-end=\"884\">\n<li data-start=\"209\" data-end=\"320\"><strong data-start=\"212\" data-end=\"244\">Az alapanyagok elők&eacute;sz&iacute;t&eacute;se:</strong> A hagym&aacute;t finomra v&aacute;gjuk, a paradicsomokat megh&aacute;mozzuk, &eacute;s apr&oacute;ra v&aacute;gjuk.</li>\n<li data-start=\"321\" data-end=\"446\"><strong data-start=\"324\" data-end=\"343\">A h&uacute;s p&aacute;rol&aacute;sa:</strong> Egy serpenyőben forr&oacute; olajon megpir&iacute;tjuk a hagym&aacute;t, majd hozz&aacute;adjuk a sert&eacute;sh&uacute;st, &eacute;s j&oacute;l &aacute;tpir&iacute;tjuk.</li>\n<li data-start=\"447\" data-end=\"570\"><strong data-start=\"450\" data-end=\"476\">A fűszerek hozz&aacute;ad&aacute;sa:</strong> A pirospaprik&aacute;t, s&oacute;t, borsot &eacute;s cukrot hozz&aacute;adjuk a h&uacute;sos kever&eacute;khez, &eacute;s j&oacute;l &ouml;sszekeverj&uuml;k.</li>\n<li data-start=\"571\" data-end=\"714\"><strong data-start=\"574\" data-end=\"607\">Paradicsom &eacute;s bor hozz&aacute;ad&aacute;sa:</strong> Hozz&aacute;adjuk a paradicsomot &eacute;s a v&ouml;r&ouml;sbort, &eacute;s lefedve főzz&uuml;k 1-1,5 &oacute;r&aacute;n kereszt&uuml;l alacsony hőm&eacute;rs&eacute;kleten.</li>\n<li data-start=\"715\" data-end=\"801\"><strong data-start=\"718\" data-end=\"738\">A t&eacute;szta főz&eacute;se:</strong> A spagetti t&eacute;szt&aacute;t s&oacute;s v&iacute;zben kifőzz&uuml;k, majd lecsepegtetj&uuml;k.</li>\n<li data-start=\"802\" data-end=\"884\"><strong data-start=\"805\" data-end=\"817\">T&aacute;lal&aacute;s:</strong> A bolognait a főtt t&eacute;szt&aacute;ra &ouml;ntj&uuml;k, &eacute;s reszelt <strong>mozzarella sajttal</strong> t&aacute;laljuk.</li>\n</ol>\n<p data-start=\"886\" data-end=\"904\"><strong data-start=\"886\" data-end=\"902\">J&oacute; &eacute;tv&aacute;gyat!</strong></p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2022/03/bolognai-ragu-8-scaled.jpg', 'hu', 1, 1, 1),
(181, 'Csokis Tiramisu', '<ol>\n<li data-start=\"508\" data-end=\"729\"><strong data-start=\"508\" data-end=\"529\">A kr&eacute;m k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"529\" data-end=\"532\">A <strong data-start=\"537\" data-end=\"559\">180 g főzőtejsz&iacute;nt</strong> egy l&aacute;basban k&ouml;zepes hőm&eacute;rs&eacute;kleten felmeleg&iacute;tj&uuml;k a <strong data-start=\"611\" data-end=\"635\">160 g &eacute;tcsokol&aacute;d&eacute;val</strong>. Amikor a csoki teljesen felolvadt, leh&uacute;zzuk a tűzről &eacute;s hagyjuk szobahőm&eacute;rs&eacute;kletűre hűlni.</li>\n<li data-start=\"731\" data-end=\"1069\">\n<p data-start=\"734\" data-end=\"1069\"><strong data-start=\"734\" data-end=\"761\">A habos kr&eacute;m k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"761\" data-end=\"764\">A <strong data-start=\"769\" data-end=\"796\">600 g hideg habtejsz&iacute;nt</strong> egy t&aacute;lba &ouml;ntj&uuml;k, hozz&aacute;adjuk a <strong data-start=\"828\" data-end=\"852\">120 g krist&aacute;lycukrot</strong> &eacute;s a <strong data-start=\"858\" data-end=\"875\">1 r&uacute;d van&iacute;lia</strong> kikapart magjait, majd robotg&eacute;ppel kem&eacute;ny habb&aacute; verj&uuml;k.<br data-start=\"931\" data-end=\"934\">Ezt k&ouml;vetően beleforgatjuk a <strong data-start=\"966\" data-end=\"987\">350 g mascarpon&eacute;t</strong> &eacute;s az előzőleg elk&eacute;sz&iacute;tett csokis tejsz&iacute;nt, hogy egy sz&eacute;p homog&eacute;n kr&eacute;met kapjunk.</p>\n</li>\n<li data-start=\"1071\" data-end=\"1184\">\n<p data-start=\"1074\" data-end=\"1184\"><strong data-start=\"1074\" data-end=\"1106\">A k&aacute;v&eacute;s m&aacute;rtogat&oacute; k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"1106\" data-end=\"1109\">A <strong data-start=\"1114\" data-end=\"1130\">200 ml k&aacute;v&eacute;t</strong> egy t&aacute;lban elkeverj&uuml;k a <strong data-start=\"1155\" data-end=\"1183\">3 ek holland kaka&oacute;porral</strong>.</p>\n</li>\n<li data-start=\"1186\" data-end=\"1595\">\n<p data-start=\"1189\" data-end=\"1595\"><strong data-start=\"1189\" data-end=\"1203\">R&eacute;tegez&eacute;s:</strong><br data-start=\"1203\" data-end=\"1206\">A t&aacute;l alj&aacute;ra egy r&eacute;teg csokis kr&eacute;met ken&uuml;nk, erre egy sor <strong data-start=\"1267\" data-end=\"1289\">40 db babapisk&oacute;t&aacute;t</strong> helyez&uuml;nk, amit előzőleg a <strong data-start=\"1317\" data-end=\"1347\">k&aacute;v&eacute;s kaka&oacute;poros kever&eacute;kbe</strong> m&aacute;rtunk.<br data-start=\"1356\" data-end=\"1359\">R&aacute;kenj&uuml;k egy &uacute;jabb r&eacute;teg csokis kr&eacute;met, megsz&oacute;rjuk <strong data-start=\"1413\" data-end=\"1441\">6 ek holland kaka&oacute;porral</strong>, majd ism&eacute;t j&ouml;het egy r&eacute;teg m&aacute;rtott babapisk&oacute;ta, csokis kr&eacute;m, kaka&oacute;por, &eacute;s &iacute;gy tov&aacute;bb, am&iacute;g elfogynak az alapanyagok. Az utols&oacute; r&eacute;teg mindig kr&eacute;m legyen.</p>\n</li>\n<li data-start=\"1597\" data-end=\"1775\">\n<p data-start=\"1600\" data-end=\"1775\"><strong data-start=\"1600\" data-end=\"1621\">Hűt&eacute;s &eacute;s t&aacute;lal&aacute;s:</strong><br data-start=\"1621\" data-end=\"1624\">A k&eacute;sz tiramisut hűtőbe tessz&uuml;k, minimum 2 &oacute;r&aacute;ra, de a legjobb, ha egy eg&eacute;sz &eacute;jszak&aacute;t tud &aacute;llni. T&aacute;lal&aacute;s előtt megsz&oacute;rjuk a tetej&eacute;t <strong data-start=\"1759\" data-end=\"1774\">kaka&oacute;porral</strong>.</p>\n</li>\n</ol>\n<h3 data-start=\"1782\" data-end=\"1807\"><strong data-start=\"1786\" data-end=\"1805\">Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul data-start=\"1808\" data-end=\"1870\">\n<li data-start=\"1808\" data-end=\"1836\"><strong data-start=\"1810\" data-end=\"1826\">Elők&eacute;sz&iacute;t&eacute;s:</strong> 40 perc</li>\n<li data-start=\"1837\" data-end=\"1870\"><strong data-start=\"1839\" data-end=\"1854\">Hűt&eacute;si idő:</strong> minimum 2 &oacute;ra</li>\n</ul>', 'desszert', 'https://static.streetkitchen.hu/live/uploads/2024/11/csokis-tiramisu-4-scaled.jpg', 'hu', 1, 1, 1),
(184, 'Tiszta Amerika', '<p>recipe</p>', 'English', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Vertical_United_States_Flag.svg/1200px-Vertical_United_States_Flag.svg.png', 'en', 0, 1, 1),
(188, 'Teriyaki Salmon Bowl', '<ol>\n<li>Preheat the oven to 400 degrees F (200 degrees C) and spray a baking dish with cooking spray.</li>\n<li id=\"mntl-sc-block_7-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Combine <strong>soy sauce, brown sugar, garlic, and ginger </strong>in a small bowl. Place the<strong> salmon</strong> in the prepared baking dish, skin side down. Pour <strong>teriyaki sauce</strong> over.</li>\n<li id=\"mntl-sc-block_11-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Bake in the preheated oven until fish flakes easily with a fork, 12 to 15 minutes.</li>\n<li id=\"mntl-sc-block_15-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Place <strong>rice</strong> in a bowl, top with <strong>salmon</strong>, and spoon over <strong>teriyaki sauce</strong> from the baking dish. Add in the <strong>shredded cabbage, grated carrots, and radishes. </strong>Sprinkle with <strong>sliced green onions and sesame seeds, </strong>to garnish.</li>\n</ol>', 'Main Dish', 'https://tastesbetterfromscratch.com/wp-content/uploads/2023/05/Salmon-Bowls-1.jpg', 'en', 1, 1, 1),
(189, 'szia', '<p>almafa</p>', 'finom', 'English', 'en', 0, 2, 1);

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
(219, 1, 12, '300 g'),
(220, 4, 12, 'a sütéshez'),
(221, 6, 12, 'ízlés szerint'),
(222, 7, 12, 'ízlés szerint'),
(223, 9, 12, '2 db'),
(224, 10, 12, '100 g'),
(225, 11, 12, '100 g'),
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
(269, 11, 80, '1'),
(272, 69, 77, '1 kg'),
(276, 4, 1, '3 ek'),
(277, 11, 81, '1 db'),
(278, 37, 81, '3 dkg'),
(279, 35, 81, 'kell sok'),
(280, 74, 181, '180 g'),
(281, 75, 181, '160 g'),
(282, 76, 181, '600 g'),
(283, 77, 181, '120 g'),
(284, 78, 181, '1 rúd'),
(285, 79, 181, '350 g'),
(286, 80, 181, '200 ml'),
(287, 82, 181, '9 ek'),
(288, 81, 181, '40 db'),
(289, 12, 182, '1 db'),
(290, 20, 182, '2 l'),
(291, 29, 13, '3 dkg'),
(292, 10, 182, '1'),
(297, 11, 208, '3232'),
(298, 87, 182, '3'),
(299, 87, 183, '3 db'),
(300, 87, 184, '3 pieces'),
(301, 89, 184, 'finom'),
(305, 87, 186, '4'),
(306, 89, 187, '3'),
(307, 88, 184, 'ahogy akarod'),
(308, 90, 188, '1/4 cup'),
(309, 91, 188, '3 tablespoons'),
(310, 92, 188, '1 small clove'),
(311, 93, 188, '1 tablespoon chopped'),
(312, 94, 188, '1 (6 ounce)'),
(313, 95, 188, '1/4 cup grated'),
(314, 96, 188, '2 (thinly sliced)'),
(315, 97, 188, '1 cup shredded'),
(316, 98, 188, '1 cup (cooked)'),
(317, 99, 188, '(optional) 1 teaspoon'),
(318, 100, 188, '(optional) 1 thinly sliced'),
(319, 89, 189, '3 db'),
(320, 88, 189, '4 db');

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
('BYZvuH4fgBfJ2inZeqKP5xxgiwyd4R8jgB9sDRjY', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXFnN25FVlpVRFFnazgwNXdRMG5pNW1ObUdSVnVadW5VUTVPZXZOZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9yZWNpcGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1741688730);

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
(1, 'Norbert', 'gillich.norbert@icloud.com', '$2y$12$173nhpko/r1rGsKCQFD2NeQzyIY/PZurBx6gE4N5MIhPwHqPFPgmu', 2, NULL, '2025-02-20 15:21:40', '2025-02-20 15:21:40'),
(2, 'Norbi', 'norbinstechnik@gmail.com', '$2y$12$oPuWKh491APN825gsGlok.0HV71N34FfUi7.MOHQ1YtfS90Gok3le', 0, NULL, '2025-02-20 18:08:51', '2025-03-06 03:36:49'),
(3, 'simaAdmin', 'trala@gmail.com', '$2y$12$dyIeIap0udIgG0LPttSlJuM8v4JcKUnTAiqSjoFD.yDW5hP5Qy8Dq', 1, NULL, '2025-02-20 18:27:00', '2025-03-02 13:13:15'),
(4, 'Attila', 'jager@attila.hu', '$2y$12$57YKLeEqb7R/YAh6fkoICeKf3jirCnYH5tzu3ox8DDs5yWFe615yi', 0, NULL, '2025-02-21 11:55:06', '2025-03-10 10:32:01'),
(5, 'Ács Bence', 'acs@bence.hu', '$2y$12$jmTdIeuBNmQtbhIJX5myhOBKH94MZGztbKU2dwf5wjKXfWhRsOkQq', 0, NULL, '2025-02-21 12:30:28', '2025-02-28 11:58:04'),
(8, 'Bálint Dezső Géza', 'balint@dezso.hu', '$2y$12$cNXKtfmWCRi01Kd90ECVpO7DAQsl3/RcV/DY6Ii2/v0UczyLumUSO', 0, NULL, '2025-02-21 12:36:54', '2025-02-28 11:23:26'),
(10, 'alma', 'alma@gmail.com', '$2y$12$/zwYyVwVygV0Wf1mPqfvUePIH6ZGyjlTaydPdEbXVONd/nAfYhr/i', 0, NULL, '2025-02-26 20:15:20', '2025-02-26 20:15:20'),
(11, 'Bence', 'acsbence@ktch.hu', '$2y$12$CaTRd8hZ1Pv6hCzMHom2c.8vYKXctVVEpeHWIA1aALdRizu.xvtSG', 1, NULL, '2025-02-28 12:03:23', '2025-03-01 20:57:38');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT a táblához `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=321;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
