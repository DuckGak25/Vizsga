-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: localhost
-- Létrehozás ideje: 2025. Már 26. 18:16
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
(124, 'flour', 'basic', 'en'),
(125, 'oats', 'grain', 'en'),
(126, 'quinoa', 'grain', 'en'),
(127, 'chickpeas', 'legume', 'en'),
(128, 'lentils', 'legume', 'en'),
(129, 'walnuts', 'nuts', 'en'),
(130, 'almonds', 'nuts', 'en'),
(131, 'peanuts', 'nuts', 'en'),
(132, 'coconut milk', 'dairy alternative', 'en'),
(133, 'soy milk', 'dairy alternative', 'en'),
(143, 'water', 'basic', 'en'),
(144, 'ground beef', 'protein', 'en'),
(145, 'ketchup', 'condiment', 'en'),
(146, 'mustard', 'condiment', 'en'),
(147, 'hamburger buns', 'bread', 'en'),
(148, 'Worcestershire sauce', 'condiment', 'en'),
(150, 'elbow macaroni', 'pasta', 'en'),
(151, 'baking powder', 'baking', 'en'),
(152, 'baking soda', 'baking', 'en'),
(154, 'vanilla extract', 'flavoring', 'en'),
(156, 'chocolate chips', 'sweets', 'en'),
(157, 'hot sauce', 'condiment', 'en'),
(158, 'vinegar', 'condiment', 'en'),
(159, 'garlic powder', 'spice', 'en'),
(160, 'ranch dressing', 'sauce', 'en'),
(161, 'blue cheese dip', 'sauce', 'en'),
(162, 'chicken wings', 'protein', 'en'),
(163, 'alma', 'gyümölcs', 'hu'),
(206, 'borsó', 'zöldség', 'hu'),
(207, 'sütőtök', 'zöldség', 'hu'),
(208, 'banán', 'gyümölcs', 'hu'),
(209, 'körte', 'gyümölcs', 'hu'),
(210, 'narancs', 'gyümölcs', 'hu'),
(211, 'szölő', 'gyümölcs', 'hu'),
(212, 'citrom', 'gyümölcs', 'hu'),
(213, 'ananász', 'gyümölcs', 'hu');

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
(1, 'Lecsó', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A z&ouml;lds&eacute;gek elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 2 db v&ouml;r&ouml;shagym&aacute;t megtiszt&iacute;tjuk, majd f&eacute;lfőre vagy apr&oacute;ra v&aacute;gjuk. Az 5 db paprik&aacute;t megmossuk, kicsum&aacute;zzuk, &eacute;s v&eacute;kony cs&iacute;kokra szeletelj&uuml;k. A 3 db paradicsomot szint&eacute;n megmossuk, majd felkock&aacute;zzuk.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">A hagyma dinsztel&eacute;se:</p>\n</li>\n</ol>\n<p dir=\"ltr\">Egy nagyobb serpenyőben vagy l&aacute;bosban felhev&iacute;tj&uuml;k a 3 ek olajat, majd hozz&aacute;adjuk a felapr&iacute;tott hagym&aacute;t. K&ouml;zepes hőm&eacute;rs&eacute;kleten &uuml;vegesre dinsztelj&uuml;k.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A paprika hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Amikor a hagyma megpuhult, hozz&aacute;adjuk a felcs&iacute;kozott paprik&aacute;t, majd k&ouml;zepes l&aacute;ngon kevergetve pir&iacute;tjuk 5-7 percig, am&iacute;g kiss&eacute; &ouml;sszeesik.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A paradicsom hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Belekeverj&uuml;k a felkock&aacute;zott paradicsomot, majd az eg&eacute;szet fedő alatt p&aacute;roljuk tov&aacute;bbi 10-15 percig, am&iacute;g a z&ouml;lds&eacute;gek megpuhulnak &eacute;s a paradicsom szaftos &aacute;llagot ad az &eacute;telnek. K&ouml;zben &iacute;zl&eacute;s szerint s&oacute;zzuk, borsozzuk.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A k&eacute;sz lecs&oacute;t frissen, keny&eacute;rrel fogyaszthatjuk, de k&ouml;retk&eacute;nt is t&aacute;lalhat&oacute; p&eacute;ld&aacute;ul rizzsel vagy toj&aacute;ssal gazdag&iacute;tva.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 20 perc</p>\n</li>\n</ul>\n<p><strong id=\"docs-internal-guid-fdaa7af9-7fff-3db3-f0e2-918f81fc7e69\"><br><br></strong></p>', 'főétel, vegetáriánus', 'https://minimalistbaker.com/wp-content/uploads/2021/06/EASY-Ratatouille-Versatile-1-Pot-Flavorful-French-inspired-packed-with-summer-vegetables-and-just-10-ingredients-required-minimalistbaker-recipe-plantbased-glutenfree-ratatouille-summer-4.jpg', 'hu', 0, 1, 1),
(2, 'Rántott Hús', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\"><strong>A h&uacute;s elők&eacute;sz&iacute;t&eacute;se:</strong></p>\n</li>\n</ol>\n<ul>\n<li dir=\"ltr\">A 4 szelet sert&eacute;sh&uacute;st klopfol&oacute;val egyenletes vastags&aacute;g&uacute;ra lap&iacute;tjuk. Enyh&eacute;n megs&oacute;zzuk &eacute;s borsozzuk mindk&eacute;t oldal&aacute;t.</li>\n</ul>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pan&iacute;r k&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<ul>\n<li dir=\"ltr\">Egy t&aacute;lban felverj&uuml;k a 2 db toj&aacute;st egy csipet s&oacute;val. Egy m&aacute;sik t&aacute;lba lisztet, egy harmadikba zsemlemorzs&aacute;t k&eacute;sz&iacute;t&uuml;nk elő.</li>\n</ul>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pan&iacute;roz&aacute;s:</strong></h4>\n</li>\n</ol>\n<ul>\n<li dir=\"ltr\">A h&uacute;sszeleteket elősz&ouml;r lisztbe forgatjuk, majd a felvert toj&aacute;sba m&aacute;rtjuk, v&eacute;g&uuml;l alaposan bebor&iacute;tjuk zsemlemorzs&aacute;val, hogy mindenhol j&oacute;l fedje a bund&aacute;z&aacute;s.</li>\n</ul>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A s&uuml;t&eacute;s:</strong></h4>\n</li>\n</ol>\n<ul>\n<li dir=\"ltr\">Egy serpenyőben bő olajat hev&iacute;t&uuml;nk k&ouml;zepesen magas hőfokra. A bepan&iacute;rozott h&uacute;sszeleteket aranybarn&aacute;ra s&uuml;tj&uuml;k, oldalank&eacute;nt kb. 3-4 percig, am&iacute;g k&iacute;v&uuml;l ropog&oacute;s, bel&uuml;l pedig &aacute;ts&uuml;lt nem lesz. A k&eacute;sz r&aacute;ntott h&uacute;sokat pap&iacute;rt&ouml;rlőre tessz&uuml;k, hogy a felesleges olajat felsz&iacute;vja.</li>\n</ul>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<ul>\n<li dir=\"ltr\">A r&aacute;ntott h&uacute;st frissen, k&ouml;rettel (p&eacute;ld&aacute;ul s&uuml;lt krumplival, rizzsel vagy friss sal&aacute;t&aacute;val) t&aacute;laljuk.</li>\n</ul>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\">Elők&eacute;sz&iacute;t&eacute;s: 20 perc</li>\n<li dir=\"ltr\">S&uuml;t&eacute;si idő: 10-15 perc</li>\n</ul>', 'főétel, húsétel', 'https://minimalistbaker.com/wp-content/uploads/2023/03/Kimchi-Rice-Fritters-6.jpg', 'hu', 1, 1, 1),
(3, 'Somlói Galuska', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pisk&oacute;ta elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 4 db toj&aacute;st sz&eacute;tv&aacute;lasztjuk. A s&aacute;rg&aacute;j&aacute;t 100 g cukorral habosra keverj&uuml;k, a feh&eacute;rj&eacute;t k&uuml;l&ouml;n t&aacute;lban kem&eacute;ny habb&aacute; verj&uuml;k. A habos toj&aacute;ss&aacute;rg&aacute;j&aacute;hoz &oacute;vatosan hozz&aacute;forgatjuk a 150 g lisztet, majd beleforgatjuk a toj&aacute;sfeh&eacute;rjehabot is. A massz&aacute;t s&uuml;tőpap&iacute;rral b&eacute;lelt tepsibe &ouml;ntj&uuml;k, &eacute;s 180&deg;C-ra előmeleg&iacute;tett s&uuml;tőben kb. 15-20 perc alatt aranybarn&aacute;ra s&uuml;tj&uuml;k.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A van&iacute;liakr&eacute;m elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 1 csomag van&iacute;li&aacute;s pudingport elkeverj&uuml;k 50 g cukorral, majd fokozatosan hozz&aacute;adunk 500 ml tejet. Folyamatos kever&eacute;s mellett sűrű kr&eacute;met főz&uuml;nk, majd levessz&uuml;k a tűzről &eacute;s hagyjuk kihűlni.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A csokol&aacute;d&eacute;&ouml;ntet elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 200 g csokol&aacute;d&eacute;t v&iacute;zgőz felett vagy mikr&oacute;ban megolvasztjuk. Hozz&aacute;adjuk a 100 g puha vajat &eacute;s 3 evőkan&aacute;l rumot, majd sim&aacute;ra keverj&uuml;k.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A tejsz&iacute;nhab elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 3 dl hideg tejsz&iacute;nt kem&eacute;ny habb&aacute; verj&uuml;k.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A r&eacute;tegez&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A kihűlt pisk&oacute;t&aacute;t kisebb darabokra t&eacute;pkedj&uuml;k vagy kock&aacute;kra v&aacute;gjuk. Egy nagy t&aacute;lba vagy poharakba r&eacute;tegezz&uuml;k a pisk&oacute;t&aacute;t, meglocsoljuk egy kev&eacute;s rummal, r&aacute;&ouml;ntj&uuml;k a van&iacute;liakr&eacute;met, majd megsz&oacute;rjuk apr&oacute;ra v&aacute;gott di&oacute;val. Ezt k&ouml;vetően &uacute;jabb r&eacute;teg pisk&oacute;t&aacute;t tesz&uuml;nk r&aacute;, csokol&aacute;d&eacute;&ouml;ntettel meglocsoljuk, &eacute;s ezt a r&eacute;tegez&eacute;st addig folytatjuk, am&iacute;g elfogynak az alapanyagok. A tetej&eacute;re tejsz&iacute;nhabot halmozunk, &eacute;s megsz&oacute;rjuk csokol&aacute;d&eacute;reszel&eacute;kkel.</p>\n<ol start=\"6\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Hűt&eacute;s &eacute;s t&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A k&eacute;sz soml&oacute;i galusk&aacute;t legal&aacute;bb 2 &oacute;r&aacute;ra hűtőbe tessz&uuml;k, hogy az &iacute;zek &ouml;ssze&eacute;rjenek. T&aacute;lal&aacute;skor kan&aacute;llal galusk&aacute;kat szaggatunk belőle, &eacute;s extra csokol&aacute;d&eacute;&ouml;ntettel meglocsolva k&iacute;n&aacute;ljuk.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 30 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">S&uuml;t&eacute;si idő: 20 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Hűt&eacute;si idő: minimum 2 &oacute;ra</p>\n</li>\n</ul>\n<p><strong id=\"docs-internal-guid-ea8c9388-7fff-d358-3a7b-e06a2a210108\"><br><br></strong></p>', 'desszert', 'https://pasakebab.hu/szekesfehervar/wp-content/uploads/sites/5/2020/08/IMG_4398-1.jpg', 'hu', 0, 1, 1),
(4, 'Töltött Káposzta', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A k&aacute;poszta elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 1 fej k&aacute;poszta torzs&aacute;j&aacute;t kiv&aacute;gjuk, majd forr&oacute; v&iacute;zbe tessz&uuml;k n&eacute;h&aacute;ny percre, hogy a levelei k&ouml;nnyen lev&aacute;ljanak. A nagyobb leveleket f&eacute;lretessz&uuml;k a t&ouml;ltel&eacute;khez, a kisebbeket felapr&iacute;tjuk &eacute;s az ed&eacute;ny alj&aacute;ra sz&oacute;rjuk.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A t&ouml;ltel&eacute;k elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 1 db v&ouml;r&ouml;shagym&aacute;t apr&oacute;ra v&aacute;gjuk &eacute;s kev&eacute;s olajon &uuml;vegesre pir&iacute;tjuk. A 500 g dar&aacute;lt h&uacute;st egy t&aacute;lba tessz&uuml;k, hozz&aacute;adjuk a 200 g főtt rizst, a pir&iacute;tott hagym&aacute;t, &iacute;zl&eacute;s szerint s&oacute;t &eacute;s borsot, majd alaposan &ouml;sszekeverj&uuml;k.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A t&ouml;lt&ouml;tt k&aacute;poszt&aacute;k form&aacute;z&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A k&aacute;posztalevelek vastagabb ereit v&eacute;konyra v&aacute;gjuk, hogy k&ouml;nnyebben hajthat&oacute;k legyenek. Egy-egy kan&aacute;lnyi t&ouml;ltel&eacute;ket helyez&uuml;nk a lev&eacute;l k&ouml;zep&eacute;re, majd k&eacute;t oldalr&oacute;l behajtjuk &eacute;s szorosan feltekerj&uuml;k.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A főz&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Egy nagy l&aacute;bos alj&aacute;ra tessz&uuml;k az apr&oacute;ra v&aacute;gott k&aacute;poszt&aacute;t, majd erre helyezz&uuml;k a t&ouml;ltel&eacute;keket. Az 500 ml paradicsomot v&iacute;zzel h&iacute;g&iacute;tva a t&ouml;lt&ouml;tt k&aacute;poszt&aacute;kra &ouml;ntj&uuml;k, majd annyi vizet adunk hozz&aacute;, hogy ellepje. K&ouml;zepes l&aacute;ngon, fedő alatt kb. 1,5-2 &oacute;r&aacute;n &aacute;t főzz&uuml;k, am&iacute;g a k&aacute;poszta megpuhul &eacute;s az &iacute;zek &ouml;ssze&eacute;rnek.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A t&ouml;lt&ouml;tt k&aacute;poszt&aacute;t forr&oacute;n, friss keny&eacute;rrel vagy tejf&ouml;llel t&aacute;laljuk.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 30 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 1,5-2 &oacute;ra</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'főétel', 'https://f0345cba75.cbaul-cdnwnd.com/c74b54ad868b3970d1351863bf68edf0/200000045-054670643e/73d17aa1febe65f721deb657e3c50d4b.jpg', 'hu', 0, 1, 1),
(5, 'Rakott Krumpli', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A hozz&aacute;val&oacute;k elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 1 kg burgony&aacute;t h&eacute;j&aacute;ban, s&oacute;s v&iacute;zben kb. 20-25 perc alatt f&eacute;lpuh&aacute;ra főzz&uuml;k, majd hagyjuk kihűlni, megh&aacute;mozzuk &eacute;s karik&aacute;kra szeletelj&uuml;k.<br>A 4 db toj&aacute;st kem&eacute;nyre főzz&uuml;k (kb. 10 perc), hideg v&iacute;zben lehűtj&uuml;k, megh&aacute;mozzuk &eacute;s karik&aacute;kra v&aacute;gjuk.<br>A 200 g f&uuml;st&ouml;lt szalonn&aacute;t apr&oacute; kock&aacute;kra v&aacute;gjuk, majd egy serpenyőben zs&iacute;rosra pir&iacute;tjuk. A kis&uuml;lt szalonnazs&iacute;rt f&eacute;lretessz&uuml;k.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A tejf&ouml;l&ouml;s kever&eacute;k elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 500 g tejf&ouml;lt egy t&aacute;lban &iacute;zl&eacute;s szerint s&oacute;val &eacute;s borssal &iacute;zes&iacute;tj&uuml;k, majd hozz&aacute;keverj&uuml;k a pir&iacute;tott szalonnazs&iacute;rt.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A r&eacute;tegez&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Egy hő&aacute;ll&oacute; t&aacute;lat kivajazunk vagy kiken&uuml;nk egy kev&eacute;s szalonnazs&iacute;rral. Az alj&aacute;ra egy r&eacute;teg burgony&aacute;t rakunk, majd erre egy r&eacute;teg toj&aacute;st &eacute;s szalonn&aacute;t helyez&uuml;nk. Meglocsoljuk a tejf&ouml;l&ouml;s kever&eacute;kkel.<br>Ezt a r&eacute;tegez&eacute;st addig folytatjuk, am&iacute;g az alapanyagok el nem fogynak, az utols&oacute; r&eacute;teg mindig burgonya legyen. A tetej&eacute;re r&aacute;&ouml;ntj&uuml;k a marad&eacute;k tejf&ouml;lt, &eacute;s egyenletesen eloszlatjuk.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A s&uuml;t&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A rakott krumplit 180&deg;C-ra előmeleg&iacute;tett s&uuml;tőben kb. 30-35 percig s&uuml;tj&uuml;k, am&iacute;g a teteje aranybarn&aacute;ra pirul.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A k&eacute;sz rakott krumplit szeletekre v&aacute;gva, friss sal&aacute;t&aacute;val vagy savany&uacute;s&aacute;ggal k&iacute;n&aacute;ljuk.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 30 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">S&uuml;t&eacute;si idő: 30-35 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2021/04/daralt-husos-rakott-krumpli-1280x1920.jpg', 'hu', 0, 1, 1),
(6, 'Főtt Rizs', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A rizs főz&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Egy l&aacute;basba &ouml;ntj&uuml;k az 500 ml vizet, majd &iacute;zl&eacute;s szerint s&oacute;zzuk.</p>\n<p dir=\"ltr\">A vizet felforraljuk, majd hozz&aacute;adjuk a 250 g rizst.</p>\n<p dir=\"ltr\">K&ouml;zepes l&aacute;ngon, időnk&eacute;nt megkeverve addig főzz&uuml;k, am&iacute;g a rizs felsz&iacute;vja a vizet (kb. 10-15 perc).</p>\n<p dir=\"ltr\">Ha a rizs megpuhult, levessz&uuml;k a tűzről, lefedj&uuml;k, &eacute;s 5-10 percig pihentetj&uuml;k, hogy teljesen megpuhuljon.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A főtt rizst &ouml;n&aacute;ll&oacute; k&ouml;retk&eacute;nt vagy egy&eacute;b &eacute;telek mell&eacute; t&aacute;laljuk.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 5 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 15 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Pihentet&eacute;s: 5-10 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/07/mgg-vitchakorn-zxnc_lbbvge-unsplash-1280x1920.jpg', 'hu', 0, 1, 1),
(7, 'Mákos Guba', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pisk&oacute;ta elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 300 g pisk&oacute;talapot kisebb darabokra t&ouml;rdelj&uuml;k vagy v&eacute;kony szeletekre v&aacute;gjuk, majd egy t&aacute;lba tessz&uuml;k.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A cukros szirup elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 500 ml vizet egy l&aacute;basba &ouml;ntj&uuml;k, majd &iacute;zl&eacute;s szerint cukrot adunk hozz&aacute;.</p>\n<p dir=\"ltr\">A vizet felforraljuk, majd p&aacute;r percig főzz&uuml;k, am&iacute;g a cukor teljesen felold&oacute;dik.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pisk&oacute;ta &aacute;ztat&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A forr&oacute; cukros szirupot a pisk&oacute;t&aacute;ra &ouml;ntj&uuml;k, &eacute;s &oacute;vatosan &aacute;tforgatjuk, hogy a pisk&oacute;ta egyenletesen mag&aacute;ba sz&iacute;vja a folyad&eacute;kot, de ne &aacute;zzon el t&uacute;lzottan.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A m&aacute;k hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 100 g dar&aacute;lt m&aacute;kot egyenletesen r&aacute;sz&oacute;rjuk a pisk&oacute;t&aacute;ra, majd finoman elkeverj&uuml;k, hogy mindenhol bevonja.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A m&aacute;kos gub&aacute;t langyosan vagy hidegen fogyasztjuk, &iacute;zl&eacute;s szerint van&iacute;liasod&oacute;val vagy porcukorral megsz&oacute;rva t&aacute;lalhatjuk.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 5 perc</p>\n</li>\n</ul>', 'desszert', 'https://static.streetkitchen.hu/live/uploads/2024/11/makos-guba-vaniliasodoval-2-scaled.jpg', 'hu', 1, 1, 1),
(8, 'Káposztás Tészta', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A k&aacute;poszta elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 500 g k&aacute;poszt&aacute;t lereszelj&uuml;k vagy v&eacute;kony cs&iacute;kokra v&aacute;gjuk.</p>\n<p dir=\"ltr\">Enyh&eacute;n megs&oacute;zzuk, majd 10-15 percig &aacute;llni hagyjuk, hogy levet eresszen.</p>\n<p dir=\"ltr\">Kinyomkodjuk belőle a felesleges nedvess&eacute;get.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A hagyma &eacute;s a k&aacute;poszta pir&iacute;t&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Egy nagy serpenyőben felforr&oacute;s&iacute;tjuk a 2 evőkan&aacute;l olajat.</p>\n<p dir=\"ltr\">Az 1 db apr&oacute;ra v&aacute;gott v&ouml;r&ouml;shagym&aacute;t &uuml;vegesre pir&iacute;tjuk.</p>\n<p dir=\"ltr\">Hozz&aacute;adjuk a kinyomkodott k&aacute;poszt&aacute;t, &eacute;s k&ouml;zepes l&aacute;ngon aranybarn&aacute;ra pir&iacute;tjuk (kb. 15-20 perc).</p>\n<p dir=\"ltr\">&Iacute;zl&eacute;s szerint borssal fűszerezz&uuml;k.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A t&eacute;szta főz&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A 300 g t&eacute;szt&aacute;t lobog&oacute;, s&oacute;s v&iacute;zben a csomagol&aacute;son felt&uuml;ntetett idő alatt al dente &aacute;llag&uacute;ra főzz&uuml;k.</p>\n<p dir=\"ltr\">Leszűrj&uuml;k, majd a pir&iacute;tott k&aacute;poszt&aacute;hoz keverj&uuml;k.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></p>\n</li>\n</ol>\n<p dir=\"ltr\">Frissen, melegen t&aacute;laljuk, &iacute;zl&eacute;s szerint extra borssal megsz&oacute;rva.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 15 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;s &eacute;s pir&iacute;t&aacute;s: 25 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2020/07/kaposztas-teszta-talalva-1280x1920.jpg', 'hu', 0, 1, 1),
(9, 'Gyümölcsleves', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A gy&uuml;m&ouml;lcsleves alapja:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">1 liter v&iacute;z a l&aacute;basba &ouml;ntj&uuml;k, majd felforraljuk.</p>\n<p dir=\"ltr\">&Iacute;zl&eacute;s szerint cukrot adunk hozz&aacute;, &eacute;s j&oacute;l elkeverj&uuml;k, hogy felold&oacute;djon.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A mazsola hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">300 g mazsol&aacute;t a cukros v&iacute;zhez adjuk, &eacute;s lass&uacute; tűz&ouml;n p&aacute;r percig főzz&uuml;k, hogy a mazsola megpuhuljon &eacute;s &aacute;tvegye az &iacute;zeket.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A gy&uuml;m&ouml;lcsleves befejez&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Ha szeretn&eacute;nk, a leveshez hozz&aacute;adhatunk friss gy&uuml;m&ouml;lcs&ouml;t, p&eacute;ld&aacute;ul alm&aacute;t, barackot vagy m&aacute;s id&eacute;nygy&uuml;m&ouml;lcs&ouml;t. Ezeket kisebb darabokra v&aacute;gva, a mazsol&aacute;val egy&uuml;tt a leveshez adjuk, majd 10-15 percig főzz&uuml;k, hogy a gy&uuml;m&ouml;lcs&ouml;k megpuhuljanak.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A gy&uuml;m&ouml;lcslevest langyosan vagy hidegen t&aacute;laljuk, &iacute;zl&eacute;s szerint citroml&eacute;vel, fah&eacute;jjal vagy van&iacute;li&aacute;val &iacute;zes&iacute;thetj&uuml;k.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;s: 15-20 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'leves', 'https://www.karaidavid.hu/wp-content/uploads/2022/06/gyumolcsleves-9257_ps.jpg', 'hu', 0, 1, 1),
(10, 'Borsóleves', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A leves alapja:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">1 liter v&iacute;z egy l&aacute;basba &ouml;ntj&uuml;k &eacute;s felforraljuk.</p>\n<p dir=\"ltr\">A 300 g paradicsomot megmossuk, felkock&aacute;zzuk vagy durv&aacute;ra turmixoljuk, majd a forr&oacute; v&iacute;zhez adjuk.</p>\n<p dir=\"ltr\">Az 1 db v&ouml;r&ouml;shagym&aacute;t apr&oacute;ra v&aacute;gjuk, &eacute;s egy kev&eacute;s olajon vagy vajon &uuml;vegesre pir&iacute;tjuk.</p>\n<p dir=\"ltr\">A pir&iacute;tott hagym&aacute;t hozz&aacute;adjuk a v&iacute;zhez, majd &iacute;zl&eacute;s szerint s&oacute;val &eacute;s borssal fűszerezz&uuml;k.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A bors&oacute; hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A leveshez 300 g fagyasztott bors&oacute;t vagy friss bors&oacute;t adunk, &eacute;s egy&uuml;tt főzz&uuml;k a paradicsomos alapl&eacute;vel, am&iacute;g a bors&oacute; megpuhul (kb. 15-20 perc).</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A levest forr&oacute;n, friss keny&eacute;rrel t&aacute;laljuk. Ha szeretn&eacute;nk, egy kis tejsz&iacute;nnel vagy friss petrezselyemmel d&iacute;sz&iacute;thetj&uuml;k.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 20-25 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'leves', 'https://static.streetkitchen.hu/live/uploads/2021/02/meguszos-klasszik-borso-leves-0111-lilla-4-egyedi-1280x1920.jpg', 'hu', 0, 1, 1),
(11, 'Sütőtök Krémleves', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A s&uuml;tőt&ouml;k elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">500 g s&uuml;tőt&ouml;k&ouml;t megh&aacute;mozunk, felkock&aacute;zunk.</p>\n<p dir=\"ltr\">Egy l&aacute;basban 1 liter vizet felforralunk, majd hozz&aacute;adjuk a s&uuml;tőt&ouml;k&ouml;t &eacute;s k&ouml;zepes l&aacute;ngon főzz&uuml;k, am&iacute;g megpuhul (kb. 20-25 perc).</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A kr&eacute;mleves k&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Amikor a s&uuml;tőt&ouml;k megpuhult, botmixerrel p&uuml;r&eacute;s&iacute;tj&uuml;k, hogy kr&eacute;mes &aacute;llagot kapjunk.</p>\n<p dir=\"ltr\">&Iacute;zl&eacute;s szerint s&oacute;val &eacute;s borssal &iacute;zes&iacute;tj&uuml;k.</p>\n<p dir=\"ltr\">Hozz&aacute;adunk 100 g tejf&ouml;lt, &eacute;s alaposan elkeverj&uuml;k, hogy a leves kr&eacute;mesebb &eacute;s gazdagabb &iacute;zű legyen.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A k&eacute;sz kr&eacute;mlevest forr&oacute;n t&aacute;laljuk, &iacute;zl&eacute;s szerint friss petrezselyemmel, p&ouml;rk&ouml;lt t&ouml;kmaggal vagy egy kev&eacute;s extra tejf&ouml;llel d&iacute;sz&iacute;thetj&uuml;k.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Főz&eacute;si idő: 20-25 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'leves', 'https://www.mindenmentes.hu/wp-content/uploads/2017/11/kokuszos-currys-sutotok-kremleves-5.jpg', 'hu', 0, 1, 1),
(12, 'Rántott Zöldség', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A z&ouml;lds&eacute;gek elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">300 g paprik&aacute;t megmossuk, f&eacute;lbev&aacute;gjuk, majd a magh&aacute;z&aacute;t elt&aacute;vol&iacute;tjuk.</p>\n<p dir=\"ltr\">A paprik&aacute;t v&eacute;kony szeletekre vagy cs&iacute;kokra v&aacute;gjuk.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A pan&iacute;r elk&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">K&eacute;t t&aacute;ny&eacute;rra helyez&uuml;nk 100 g lisztet &eacute;s 100 g zsemlemorzs&aacute;t.</p>\n<p dir=\"ltr\">A 2 db toj&aacute;st egy t&aacute;lban felverj&uuml;k, &iacute;zl&eacute;s szerint s&oacute;val &eacute;s borssal &iacute;zes&iacute;tj&uuml;k.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A z&ouml;lds&eacute;gek pan&iacute;roz&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A paprika szeleteket elősz&ouml;r a lisztbe m&aacute;rtjuk, majd a felvert toj&aacute;sba, v&eacute;g&uuml;l a zsemlemorzs&aacute;ba.</p>\n<p dir=\"ltr\">Gondosan megforgatjuk a z&ouml;lds&eacute;geket minden r&eacute;teggel, hogy teljesen bevonja őket a pan&iacute;r.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A s&uuml;t&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Egy serpenyőben bő olajat forr&oacute;s&iacute;tunk.</p>\n<p dir=\"ltr\">A pan&iacute;rozott paprikaszeleteket a forr&oacute; olajban aranybarn&aacute;ra &eacute;s ropog&oacute;sra s&uuml;tj&uuml;k, kb. 2-3 perc mindk&eacute;t oldalukat.</p>\n<p dir=\"ltr\">A k&eacute;sz r&aacute;ntott z&ouml;lds&eacute;geket pap&iacute;rt&ouml;rlőn lecs&ouml;p&ouml;gtetj&uuml;k, hogy felesleges olajat elt&aacute;vol&iacute;tsuk.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">A r&aacute;ntott z&ouml;lds&eacute;geket frissen, melegen t&aacute;laljuk, ak&aacute;r egy kis fokhagym&aacute;s tejf&ouml;llel vagy friss sal&aacute;t&aacute;val.</p>\n<h3 dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">S&uuml;t&eacute;si idő: 10-15 perc</p>\n</li>\n</ul>\n<p><strong id=\"docs-internal-guid-77771a5f-7fff-7566-bdb2-c32fda46e8fe\"><br><br></strong></p>', 'köret', 'https://static.streetkitchen.hu/live/uploads/2020/04/rantott-burgonya-csipos-szosszal-1-1280x1920.jpg', 'hu', 0, 1, 1),
(13, 'Gyümölcs Saláta', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A gy&uuml;m&ouml;lcs elők&eacute;sz&iacute;t&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">V&aacute;lasszunk ki 500 g k&uuml;l&ouml;nb&ouml;ző gy&uuml;m&ouml;lcs&ouml;t, p&eacute;ld&aacute;ul alm&aacute;t, ban&aacute;nt, k&ouml;rt&eacute;t, narancsot, szőlőt vagy bogy&oacute;s gy&uuml;m&ouml;lcs&ouml;ket, &eacute;s v&aacute;gjuk fel őket kisebb darabokra vagy szeletekre.</p>\n<p dir=\"ltr\">Ha sz&uuml;ks&eacute;ges, h&aacute;mozzuk meg a gy&uuml;m&ouml;lcs&ouml;ket.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A mazsola hozz&aacute;ad&aacute;sa:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">500 g mazsol&aacute;t hozz&aacute;adunk a felkock&aacute;zott gy&uuml;m&ouml;lcs&ouml;kh&ouml;z.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Az &iacute;zes&iacute;t&eacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">&Iacute;zl&eacute;s szerint cukrot adhatunk a sal&aacute;t&aacute;hoz, ha szeretn&eacute;nk, hogy &eacute;desebb legyen. Ha sz&uuml;ks&eacute;ges, egy kis citromlevet is csepegtethet&uuml;nk r&aacute;, hogy frissebb &iacute;zt kapjunk.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>A gy&uuml;m&ouml;lcssal&aacute;ta kever&eacute;se:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Az &ouml;sszes hozz&aacute;val&oacute;t &oacute;vatosan &ouml;sszekeverj&uuml;k, &uuml;gyelve arra, hogy a gy&uuml;m&ouml;lcs&ouml;k ne t&ouml;rjenek &ouml;ssze.</p>\n<ol start=\"5\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>T&aacute;lal&aacute;s:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Frissen t&aacute;laljuk a gy&uuml;m&ouml;lcssal&aacute;t&aacute;t, &iacute;zl&eacute;s szerint d&iacute;sz&iacute;thetj&uuml;k egy kis ment&aacute;val vagy egy pici joghurttal.</p>\n<p dir=\"ltr\"><strong>Elk&eacute;sz&iacute;t&eacute;si idő</strong></p>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Elők&eacute;sz&iacute;t&eacute;s: 10 perc</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'előétel', 'https://static.streetkitchen.hu/live/uploads/2017/08/img_5022.jpg', 'hu', 0, 1, 1),
(77, 'Bolognai', '<ol data-start=\"209\" data-end=\"884\">\n<li data-start=\"209\" data-end=\"320\"><strong data-start=\"212\" data-end=\"244\">Az alapanyagok elők&eacute;sz&iacute;t&eacute;se:</strong> A hagym&aacute;t finomra v&aacute;gjuk, a paradicsomokat megh&aacute;mozzuk, &eacute;s apr&oacute;ra v&aacute;gjuk.</li>\n<li data-start=\"321\" data-end=\"446\"><strong data-start=\"324\" data-end=\"343\">A h&uacute;s p&aacute;rol&aacute;sa:</strong> Egy serpenyőben forr&oacute; olajon megpir&iacute;tjuk a hagym&aacute;t, majd hozz&aacute;adjuk a sert&eacute;sh&uacute;st, &eacute;s j&oacute;l &aacute;tpir&iacute;tjuk.</li>\n<li data-start=\"447\" data-end=\"570\"><strong data-start=\"450\" data-end=\"476\">A fűszerek hozz&aacute;ad&aacute;sa:</strong> A pirospaprik&aacute;t, s&oacute;t, borsot &eacute;s cukrot hozz&aacute;adjuk a h&uacute;sos kever&eacute;khez, &eacute;s j&oacute;l &ouml;sszekeverj&uuml;k.</li>\n<li data-start=\"571\" data-end=\"714\"><strong data-start=\"574\" data-end=\"607\">Paradicsom &eacute;s bor hozz&aacute;ad&aacute;sa:</strong> Hozz&aacute;adjuk a paradicsomot &eacute;s a v&ouml;r&ouml;sbort, &eacute;s lefedve főzz&uuml;k 1-1,5 &oacute;r&aacute;n kereszt&uuml;l alacsony hőm&eacute;rs&eacute;kleten.</li>\n<li data-start=\"715\" data-end=\"801\"><strong data-start=\"718\" data-end=\"738\">A t&eacute;szta főz&eacute;se:</strong> A spagetti t&eacute;szt&aacute;t s&oacute;s v&iacute;zben kifőzz&uuml;k, majd lecsepegtetj&uuml;k.</li>\n<li data-start=\"802\" data-end=\"884\"><strong data-start=\"805\" data-end=\"817\">T&aacute;lal&aacute;s:</strong> A bolognait a főtt t&eacute;szt&aacute;ra &ouml;ntj&uuml;k, &eacute;s reszelt <strong>mozzarella sajttal</strong> t&aacute;laljuk.</li>\n</ol>\n<p data-start=\"886\" data-end=\"904\"><strong data-start=\"886\" data-end=\"902\">J&oacute; &eacute;tv&aacute;gyat!</strong></p>', 'főétel', 'https://static.streetkitchen.hu/live/uploads/2022/03/bolognai-ragu-8-scaled.jpg', 'hu', 1, 1, 1),
(181, 'Csokis Tiramisu', '<ol>\n<li data-start=\"508\" data-end=\"729\"><strong data-start=\"508\" data-end=\"529\">A kr&eacute;m k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"529\" data-end=\"532\">A <strong data-start=\"537\" data-end=\"559\">180 g főzőtejsz&iacute;nt</strong> egy l&aacute;basban k&ouml;zepes hőm&eacute;rs&eacute;kleten felmeleg&iacute;tj&uuml;k a <strong data-start=\"611\" data-end=\"635\">160 g &eacute;tcsokol&aacute;d&eacute;val</strong>. Amikor a csoki teljesen felolvadt, leh&uacute;zzuk a tűzről &eacute;s hagyjuk szobahőm&eacute;rs&eacute;kletűre hűlni.</li>\n<li data-start=\"731\" data-end=\"1069\">\n<p data-start=\"734\" data-end=\"1069\"><strong data-start=\"734\" data-end=\"761\">A habos kr&eacute;m k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"761\" data-end=\"764\">A <strong data-start=\"769\" data-end=\"796\">600 g hideg habtejsz&iacute;nt</strong> egy t&aacute;lba &ouml;ntj&uuml;k, hozz&aacute;adjuk a <strong data-start=\"828\" data-end=\"852\">120 g krist&aacute;lycukrot</strong> &eacute;s a <strong data-start=\"858\" data-end=\"875\">1 r&uacute;d van&iacute;lia</strong> kikapart magjait, majd robotg&eacute;ppel kem&eacute;ny habb&aacute; verj&uuml;k.<br data-start=\"931\" data-end=\"934\">Ezt k&ouml;vetően beleforgatjuk a <strong data-start=\"966\" data-end=\"987\">350 g mascarpon&eacute;t</strong> &eacute;s az előzőleg elk&eacute;sz&iacute;tett csokis tejsz&iacute;nt, hogy egy sz&eacute;p homog&eacute;n kr&eacute;met kapjunk.</p>\n</li>\n<li data-start=\"1071\" data-end=\"1184\">\n<p data-start=\"1074\" data-end=\"1184\"><strong data-start=\"1074\" data-end=\"1106\">A k&aacute;v&eacute;s m&aacute;rtogat&oacute; k&eacute;sz&iacute;t&eacute;se:</strong><br data-start=\"1106\" data-end=\"1109\">A <strong data-start=\"1114\" data-end=\"1130\">200 ml k&aacute;v&eacute;t</strong> egy t&aacute;lban elkeverj&uuml;k a <strong data-start=\"1155\" data-end=\"1183\">3 ek holland kaka&oacute;porral</strong>.</p>\n</li>\n<li data-start=\"1186\" data-end=\"1595\">\n<p data-start=\"1189\" data-end=\"1595\"><strong data-start=\"1189\" data-end=\"1203\">R&eacute;tegez&eacute;s:</strong><br data-start=\"1203\" data-end=\"1206\">A t&aacute;l alj&aacute;ra egy r&eacute;teg csokis kr&eacute;met ken&uuml;nk, erre egy sor <strong data-start=\"1267\" data-end=\"1289\">40 db babapisk&oacute;t&aacute;t</strong> helyez&uuml;nk, amit előzőleg a <strong data-start=\"1317\" data-end=\"1347\">k&aacute;v&eacute;s kaka&oacute;poros kever&eacute;kbe</strong> m&aacute;rtunk.<br data-start=\"1356\" data-end=\"1359\">R&aacute;kenj&uuml;k egy &uacute;jabb r&eacute;teg csokis kr&eacute;met, megsz&oacute;rjuk <strong data-start=\"1413\" data-end=\"1441\">6 ek holland kaka&oacute;porral</strong>, majd ism&eacute;t j&ouml;het egy r&eacute;teg m&aacute;rtott babapisk&oacute;ta, csokis kr&eacute;m, kaka&oacute;por, &eacute;s &iacute;gy tov&aacute;bb, am&iacute;g elfogynak az alapanyagok. Az utols&oacute; r&eacute;teg mindig kr&eacute;m legyen.</p>\n</li>\n<li data-start=\"1597\" data-end=\"1775\">\n<p data-start=\"1600\" data-end=\"1775\"><strong data-start=\"1600\" data-end=\"1621\">Hűt&eacute;s &eacute;s t&aacute;lal&aacute;s:</strong><br data-start=\"1621\" data-end=\"1624\">A k&eacute;sz tiramisut hűtőbe tessz&uuml;k, minimum 2 &oacute;r&aacute;ra, de a legjobb, ha egy eg&eacute;sz &eacute;jszak&aacute;t tud &aacute;llni. T&aacute;lal&aacute;s előtt megsz&oacute;rjuk a tetej&eacute;t <strong data-start=\"1759\" data-end=\"1774\">kaka&oacute;porral</strong>.</p>\n</li>\n</ol>\n<h3 data-start=\"1782\" data-end=\"1807\"><strong data-start=\"1786\" data-end=\"1805\">Elk&eacute;sz&iacute;t&eacute;si idő</strong></h3>\n<ul data-start=\"1808\" data-end=\"1870\">\n<li data-start=\"1808\" data-end=\"1836\"><strong data-start=\"1810\" data-end=\"1826\">Elők&eacute;sz&iacute;t&eacute;s:</strong> 40 perc</li>\n<li data-start=\"1837\" data-end=\"1870\"><strong data-start=\"1839\" data-end=\"1854\">Hűt&eacute;si idő:</strong> minimum 2 &oacute;ra</li>\n</ul>', 'desszert', 'https://static.streetkitchen.hu/live/uploads/2024/11/csokis-tiramisu-4-scaled.jpg', 'hu', 1, 1, 1),
(184, 'Tiszta Amerika', '<ol>\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Preparing the potatoes:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Peel and wash the 3 potatoes.</p>\n<p dir=\"ltr\">Cut them into slices or cubes, depending on your preference.</p>\n<ol start=\"2\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Cooking the potatoes:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Boil the potatoes in water until they are soft (about 10-15 minutes).</p>\n<p dir=\"ltr\">Once they are cooked, drain the water.</p>\n<ol start=\"3\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Seasoning:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Add salt to taste, and if desired, a small amount of sugar to balance the flavor.</p>\n<ol start=\"4\">\n<li dir=\"ltr\" aria-level=\"1\">\n<h4 dir=\"ltr\" role=\"presentation\"><strong>Serving:</strong></h4>\n</li>\n</ol>\n<p dir=\"ltr\">Serve the potatoes hot as a side dish or a simple snack. You can also add some butter or herbs for extra flavor.</p>\n<h3 dir=\"ltr\"><strong>Preparation Time:</strong></h3>\n<ul>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Preparation: 5 minutes</p>\n</li>\n<li dir=\"ltr\" aria-level=\"1\">\n<p dir=\"ltr\" role=\"presentation\">Cooking Time: 15 minutes</p>\n</li>\n</ul>\n<p>&nbsp;</p>', 'English', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Vertical_United_States_Flag.svg/1200px-Vertical_United_States_Flag.svg.png', 'en', 0, 1, 1),
(188, 'Teriyaki Salmon Bowl', '<ol>\n<li>Preheat the oven to 400 degrees F (200 degrees C) and spray a baking dish with cooking spray.</li>\n<li id=\"mntl-sc-block_7-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Combine <strong>soy sauce, brown sugar, garlic, and ginger </strong>in a small bowl. Place the<strong> salmon</strong> in the prepared baking dish, skin side down. Pour <strong>teriyaki sauce</strong> over.</li>\n<li id=\"mntl-sc-block_11-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Bake in the preheated oven until fish flakes easily with a fork, 12 to 15 minutes.</li>\n<li id=\"mntl-sc-block_15-0\" class=\"comp mntl-sc-block mntl-sc-block-html\">Place <strong>rice</strong> in a bowl, top with <strong>salmon</strong>, and spoon over <strong>teriyaki sauce</strong> from the baking dish. Add in the <strong>shredded cabbage, grated carrots, and radishes. </strong>Sprinkle with <strong>sliced green onions and sesame seeds, </strong>to garnish.</li>\n</ol>', 'Main Dish', 'https://tastesbetterfromscratch.com/wp-content/uploads/2023/05/Salmon-Bowls-1.jpg', 'en', 1, 1, 1),
(192, 'Sloppy Joes', '<ol>\n<li>In a pan, cook <strong>ground beef</strong> over medium heat until browned. Drain excess fat.</li>\n<li>Add <strong>chopped onion</strong> and cook for 3 minutes.</li>\n<li>Stir in <strong>ketchup, Worcestershire sauce, mustard, salt, and pepper.</strong> Simmer for 10 minutes.</li>\n<li>Serve on toasted hamburger buns.</li>\n</ol>', 'American', 'https://www.onceuponachef.com/images/2020/03/sloppy-joes-1200x1552.jpg', 'en', 1, 1, 1),
(193, 'Buffalo Wings', '<ol>\n<li>Preheat oven to 200&deg;C (400&deg;F).</li>\n<li>Place <strong>chicken wings</strong> on a baking sheet and bake for 40 minutes, flipping halfway.</li>\n<li>In a pan, melt <strong>butter,</strong> then add <strong>hot sauce, vinegar, garlic powder, and salt.</strong></li>\n<li>Toss baked wings in the <strong>hot sauce</strong> and serve with <strong>ranch dressing</strong> or <strong>blue cheese dip</strong>.</li>\n</ol>', 'American', 'https://carlsbadcravings.com/wp-content/uploads/2014/12/Buffalo-Honey-Hot-Wings10.jpg', 'en', 1, 1, 1),
(243, 'Almás pite', '<ol>\n<li>Szedj&uuml;nk <strong>alm&aacute;t</strong></li>\n</ol>', 'desszert', 'https://cakesbymk.com/wp-content/uploads/2024/11/Template-Size-for-Blog-5.jpg', 'hu', 0, 22, 1),
(244, 'sdasd', '<p>sdas</p>', 'dsdasd', 'dada', 'hu', 0, 22, 0),
(245, 'Kakaós almás cucc', '<p>hehe</p>', 'sdsad', 'dsdas', 'hu', 0, 1, 1);

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
(292, 10, 182, '1'),
(297, 11, 208, '3232'),
(298, 87, 182, '3'),
(299, 87, 183, '3 db'),
(300, 87, 184, '3 pieces'),
(305, 87, 186, '4'),
(306, 89, 187, '3'),
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
(320, 88, 189, '4 db'),
(321, 11, 190, '3 db'),
(322, 10, 191, '3'),
(323, 12, 191, '4'),
(324, 144, 192, '500 g'),
(325, 111, 192, '1 chopped'),
(326, 145, 192, '1/2 cup'),
(327, 146, 192, '1 tsp'),
(328, 89, 192, '1/2 tsp'),
(329, 105, 192, '1/4 tsp'),
(330, 147, 192, '4'),
(331, 157, 193, '1/2 cup'),
(332, 102, 193, '2 tbsp'),
(333, 158, 193, '1 tbsp'),
(334, 159, 193, '1/2 tsp'),
(335, 89, 193, '1/2 tsp'),
(336, 162, 193, '500 g'),
(337, 160, 193, 'optional'),
(338, 161, 193, 'optional'),
(340, 151, 194, '3piece'),
(341, 92, 195, '3 pieces'),
(342, 171, 195, '2 db'),
(343, 206, 10, '300 g'),
(344, 207, 11, '500 g'),
(346, 208, 13, 'ízlés szerint'),
(347, 163, 13, 'ízlés szerint'),
(348, 210, 13, 'ízlés szerint'),
(349, 211, 13, 'ízlés szerint'),
(350, 209, 13, 'ízlés szerint'),
(351, 88, 184, '5 g'),
(352, 89, 184, '5 g'),
(412, 6, 2, 'ízlés szerint'),
(413, 7, 2, 'ízlés szerint'),
(414, 42, 2, '500 g'),
(415, 163, 243, '3 db'),
(416, 42, 243, '2 kg'),
(418, 11, 244, '3'),
(419, 163, 245, '4 db'),
(420, 82, 245, '3 kg'),
(421, 77, 3, '150 g'),
(422, 77, 7, 'ízlés szerint'),
(423, 77, 13, 'ízlés szerint');

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
(1, 'Norbert', 'gillich.norbert@icloud.com', '$2y$12$173nhpko/r1rGsKCQFD2NeQzyIY/PZurBx6gE4N5MIhPwHqPFPgmu', 2, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(2, 'Norbi', 'norbinstechnik@gmail.com', '$2y$12$oPuWKh491APN825gsGlok.0HV71N34FfUi7.MOHQ1YtfS90Gok3le', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(4, 'Attila', 'jager@attila.hu', '$2y$12$57YKLeEqb7R/YAh6fkoICeKf3jirCnYH5tzu3ox8DDs5yWFe615yi', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(5, 'Ács Bence', 'acs@bence.hu', '$2y$12$jmTdIeuBNmQtbhIJX5myhOBKH94MZGztbKU2dwf5wjKXfWhRsOkQq', 1, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(8, 'Bálint Dezső Géza', 'balint@dezso.hu', '$2y$12$cNXKtfmWCRi01Kd90ECVpO7DAQsl3/RcV/DY6Ii2/v0UczyLumUSO', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(11, 'Bence', 'acsbence@ktch.hu', '$2y$12$CaTRd8hZ1Pv6hCzMHom2c.8vYKXctVVEpeHWIA1aALdRizu.xvtSG', 1, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(12, 'Erika', 'parduc0224@freemail.hu', '$2y$12$90oKOGhAgmw4YtbWVp3lpef2i14ud0MC2rI/HGSWycpiLQCQ7PVpy', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(20, 'Bettina', 'gillich.bettina99@gmail.com', '$2y$12$uE5N5q.bYycRMNVGNhOlWewvE4KCqic7B27Huy/etki0.JSyGRu8C', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(21, 'Kristóf', 'abaikristof51@gmail.com', '$2y$12$xsc5zRZOH075DRn4sqXpTu7Iq3l8E4NY3eGdhJZ5gGyafbJ0geM76', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33'),
(22, 'Gillich', 'gillichnorbert@ktch.hu', '$2y$12$q5R9hoSX8cESfs45iSQMgu8xICjuvNhNFNV8qr0PxODEZ1v/PE8u.', 0, NULL, '2025-03-26 13:29:33', '2025-03-26 13:29:33');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT a táblához `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT a táblához `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=426;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
