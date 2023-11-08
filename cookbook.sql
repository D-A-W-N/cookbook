-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 27, 2023 at 07:30 AM
-- Server version: 10.6.12-MariaDB-1:10.6.12+maria~ubu2004-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookbook`
--
CREATE Database cookbook;
-- --------------------------------------------------------
USE cookbook;
--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `name`) VALUES
(1, 'Hauptspeise'),
(2, 'Dessert'),
(3, 'Vorspeise');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredientId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`ingredientId`, `name`) VALUES
(1, 'Kürbisfleisch'),
(2, 'Zwiebel'),
(4, 'Champignons, weiß'),
(5, 'Eier'),
(6, 'Peperoni, rot'),
(7, 'Oregano'),
(8, 'Kräuter, gemischt'),
(9, 'Salz'),
(10, 'Pfeffer'),
(11, 'Rapsöl'),
(12, 'Fett'),
(13, 'Hähnchenbrustfilet(s)'),
(14, 'Speisestärke'),
(15, 'Erdnussöl'),
(16, 'Cashewnüsse'),
(17, 'Knoblauchzehe'),
(18, 'Currypaste (Massaman)'),
(19, 'Kokosmilch'),
(20, 'Hühnerbrühe'),
(21, 'Kartoffeln, festkochend'),
(22, 'Kartoffeln, mehlig kochend'),
(23, 'Kartoffeln,vorwiegend festkochend'),
(24, 'Tamarindenpaste'),
(25, 'Palmzucker'),
(26, 'Fischsauce'),
(27, 'Chiliflocken'),
(28, 'Ananas, frische\r\n'),
(29, 'Frühlingszwiebel(n)'),
(30, 'Orecchiette'),
(31, 'Brokkoli'),
(32, 'Thymianzweig(e)'),
(33, 'Olivenöl'),
(34, 'Mazzetti Condimento Bianco'),
(35, 'Parmesan'),
(36, 'Sardellenfilet(s), in Öl eingelegt'),
(37, 'Tagliatelle'),
(38, 'Chilischote(n)'),
(39, 'Spitzpaprika'),
(40, 'Petersilie'),
(41, 'Zitrone(n)'),
(42, 'Garnele(n), geschälte (TK)'),
(43, 'Paprikapulver, edelsüßes'),
(44, 'Bürger Schwäbische Eierspätzle'),
(45, 'Butter'),
(46, 'Champignons, braune'),
(47, 'Weißwein'),
(48, 'Sahne'),
(49, 'Gemüsebrühepulver'),
(50, 'Blattspinat'),
(51, 'Kirschtomate(n)');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `recipeId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `instructions` text NOT NULL,
  `cooking_time` int(3) NOT NULL,
  `preparation_type` varchar(100) NOT NULL,
  `nutrition` varchar(100) NOT NULL,
  `calories` float NOT NULL,
  `category` int(2) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`recipeId`, `name`, `description`, `instructions`, `cooking_time`, `preparation_type`, `nutrition`, `calories`, `category`, `picture`) VALUES
(4, 'Kürbis-Eierkuchen mit Champignons und Peperoni', 'Ein gelungenes Herbstessen mit wenig Aufwand\r\n\r\n\r\n', 'Kürbisfleisch klein würfeln, Zwiebeln und Knoblauch schälen und fein würfeln, Champignons putzen und in die gewünschte Größe schneiden, die Stiele ebenso.\r\n\r\nÖl in einer Pfanne auf kleinerer Stufe erhitzen (bei mir die 4 von 9), Kürbis, Zwiebeln und Knoblauch hineingeben und immer mal wenden. Anschließend die Pilze dazugeben und mitbraten, würzen und abschmecken.\r\n\r\nDen Backofen vorheizen auf 200° Ober-/Unterhitze.\r\n\r\nEier in einer Schüssel verquirlen und würzen, fein geschnittene Peperoni und Oregano-Blättchen und die TK-Kräuter untermischen. Die Mischung in der Pfanne damit übergießen und vorsichtig unterheben. Die Hitze ausschalten.\r\n\r\nEine Auflaufform mit Fett einreiben, den Pfanneninhalt einfüllen und auf mittlerer Schiene 20-25 Minuten backen, bis das Ei gestockt ist.\r\n\r\nDieser Kürbis-Eierkuchen schmeckt auch kalt sehr gut und kann wunderbar am nächsten Tag in der Mikrowelle erhitzt werden.\r\n\r\nDazu passt Baguette und grüner Salat.', 65, 'Hauptspeise', 'Test Nutrition', 100, 1, 'kuerbis-eierkuchen-mit-champignons-und-peperoni.png'),
(5, 'Thai-Curry mit Massaman\r\n', 'mit frischer Ananas und Cashewnüssen', 'Das Hähnchenbrustfilet waschen und trocken tupfen, in Streifen schneiden und auf einen Teller legen. Nicht würzen. Mit der Speisestärke bestäuben und diese vorsichtig in das Fleisch kneten, so dass das Fleisch damit umhüllt ist.\r\n\r\nDie Kartoffeln schälen, waschen und vierteln. Die Zwiebeln schälen und vierteln. Die Knoblauchzehe schälen und fein würfeln.\r\n\r\nDie Cashewnüsse in etwas Öl anrösten und auf ein Küchenkrepp schütten. In der gleichen Pfanne mit 1 EL Erdnussöl das Fleisch knusprig braten und auf ein Küchenkrepp geben.\r\n\r\nDie Frühlingszwiebeln waschen und nur das Grüne in 1 cm breite Ringe schneiden, den Rest anderweitig verwenden. Die frische Ananas schälen und 2 Scheiben davon in kleine Stücke schneiden.\r\n\r\nDie Cashewnüsse, das Fleisch, die Frühlingszwiebeln und die Ananasstücke kommen erst zum Schluss in die Sauce.\r\n\r\n2 EL Öl in die Pfanne geben und den Knoblauch bei mittlerer Hitze leicht anbraten. Die Currypaste dazugeben und ebenfalls etwas anrösten. Die Zwiebeln dazugeben und mitbraten. Die Masse mit der Kokosmilch und der Hühnerbrühe ablöschen. Kartoffeln, Tamarindenpaste, Palmzucker und Fischsauce dazugeben und die Sauce bei mittlerer Hitze köcheln lassen, bis die Kartoffeln gar sind und die Sauce die gewünschte Konsistenz hat. Evtl. noch etwas Brühe dazugeben.\r\n\r\nNun das Fleisch, die Ananasstücke, die Cashewnüsse und die Frühlingszwiebeln dazugeben und nochmals 2 Minuten sanft köcheln lassen. Das Curry abschmecken und evtl. für die Schärfe noch Chiliflocken dazugeben.\r\n\r\nDazu passt thailändischer Duftreis und als Getränk ein Singha-Bier.\r\n\r\nKeine Angst vor der Fischsauce, sie dient als Salzersatz und das Gericht schmeckt keinesfalls nach Fisch!', 65, 'Hauptspeise', 'Test Nutrition', 100, 1, 'thai-curry-mit-massaman.png'),
(6, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch', 'Soulfood auf italienisch', '1. Orecchiette nach Packungsanweisung in kochendem Salzwasser zubereiten.\r\n\r\n2. In der Zwischenzeit den Brokkoli waschen, trocken tupfen, vom Strunk befreien und in mundgerechte Stücke schneiden. Knoblauch schälen. Thymian und Oregano waschen, trocken schütteln und vom Stiel zupfen.\r\n\r\n3. Olivenöl in einer Pfanne erhitzen, Knoblauch und Brokkoli für ca. 2 Minuten anschwitzen. Anschließend mit Essig ablöschen und mit etwas Nudelwasser aufgießen. Al dente gegarte Orecchiette mit einer Schaumkelle hinzugeben. Die Hälfte des Parmesans reiben und zusammen mit Sardellen zur Pasta geben. Mit Salz und Pfeffer abschmecken und einen Teil der Kräuter dazu geben.\r\n\r\n4. Orecchiette mit restlichem Parmesan und restlichen Kräutern servieren.\r\n\r\nTipp: Parmesan auf Seafood-Pasta? Da streiten sich die Italiener. Wir finden: Er macht die Orecchiette mit Brokkoli, Knoblauch und Sardellen perfekt.', 35, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'orecchiette-mit-brokkoli-sardellen-und-knoblauch.png'),
(7, 'Piri-Piri Garnelen mit Tagliatelle', 'Die geröstete Spitzpaprika mit ihren süßen Aromen harmoniert perfekt zu den Garnelen.', 'Den Backofen auf 200 Grad Umluft (220 Grad Ober-/Unterhitze) vorheizen.\r\n\r\nSpitzpaprika rundherum mit einer Gabel einstechen und auf ein Backblech legen. Die Paprika 15 Minuten im Ofen rösten, bis sie gar sind. Die Paprika anschließend in eine Schüssel geben und für 5 Minuten abdecken. Dadurch wird die Paprika gedämpft und lässt sich leichter schälen. Die Paprika dann in Streifen schneiden.\r\n\r\nIn einem großen Topf Wasser mit einer Prise Salz zum Kochen bringen. Tagliatelle nach den Anweisungen auf der Verpackung kochen und dann abgießen.\r\n\r\nDie Chilischoten in dünne Scheiben schneiden und die Knoblauchzehen fein hacken. Öl in einer Pfanne erhitzen und darin die roten Chilis, den Knoblauch und 1 TL Paprikapulver anbraten. Garnelen in die Pfanne geben und langsam mitgaren lassen.\r\n\r\nDie abgetropften Tagliatelle und die Paprika zu den Garnelen in die Pfanne geben und vermengen.\r\n\r\nDie Blätter der Petersilie fein hacken und unter die Pasta rühren. Die Pasta mit dem Saft und der Schale von 1 Zitrone, Pfeffer und Salz abschmecken.', 40, 'Hauptspeise', 'Test Nutrition', 100, 1, 'piri-piri-garnelen-mit-tagliatelle.png'),
(8, 'Bunte Gemüse-Spätzle-Pfanne', 'superschnell etwas Leckeres auf den Tisch gezaubert', '1. In einer großen Pfanne 1 EL Butter erhitzen, die Spätzle ca. 3 Minuten darin anbraten und beiseitestellen.\r\n\r\n2. Zwiebel und Knoblauch schälen und fein würfeln.\r\n\r\n3. Champignons putzen und vierteln.\r\n\r\n4. Die restliche Butter in der Pfanne erhitzen. Zwiebel, Knoblauch und Champignons 5 Minuten darin anbraten.\r\n\r\n5. Alles mit Weißwein ablöschen, kurz köcheln lassen, dann die Sahne und Gemüsebrühepulver dazu geben und weitere 3 Minuten köcheln.\r\n\r\n6. Spinat waschen und trocken schütteln.\r\n\r\n7. Kirschtomaten waschen, halbieren und mit Spätzle und Spinat in die Sahnesauce geben. Alles gut vermengen und mit Salz und Pfeffer abschmecken.\r\n\r\n8. Parmesan auf die Spätzle reiben und direkt servieren.', 20, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'bunte-gemuese-spaetzle-pfanne.png');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipeId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL,
  `amount` float NOT NULL,
  `measure` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipeId`, `ingredientId`, `amount`, `measure`) VALUES
(4, 1, 330, 'g'),
(4, 2, 2, 'Stk'),
(4, 4, 100, 'g'),
(4, 5, 5, 'Stk'),
(4, 6, 1, 'Stk'),
(4, 7, 3, 'Stk'),
(4, 8, 1, 'EL'),
(4, 9, 1, 'Pr'),
(4, 10, 1, 'Pr'),
(4, 11, 3, 'EL'),
(4, 12, 20, 'g'),
(4, 17, 2, 'Stk'),
(5, 2, 2, 'Stk'),
(5, 13, 200, 'g'),
(5, 14, 1, 'TL'),
(5, 15, 4, 'EL'),
(5, 16, 40, 'g'),
(5, 17, 1, 'Stk'),
(5, 18, 1, 'EL'),
(5, 19, 400, 'ml'),
(5, 20, 250, 'ml'),
(5, 21, 2, 'Stk'),
(5, 24, 1, 'TL'),
(5, 25, 1, 'TL'),
(5, 26, 3, 'EL'),
(5, 27, 1, 'Pr'),
(5, 28, 2, 'Scheiben'),
(5, 29, 2, 'Stk'),
(6, 7, 4, 'Stiel(e)'),
(6, 9, 1, 'Pr'),
(6, 10, 1, 'Pr'),
(6, 17, 6, 'Stk'),
(6, 30, 600, 'g'),
(6, 31, 800, 'g'),
(6, 32, 10, 'Stk'),
(6, 33, 8, 'EL'),
(6, 34, 6, 'EL'),
(6, 35, 100, 'g'),
(6, 36, 60, 'g'),
(7, 9, 1, 'Pr'),
(7, 10, 1, 'Pr'),
(7, 17, 2, 'Stk'),
(7, 33, 3, 'EL'),
(7, 37, 300, 'g'),
(7, 38, 2, 'Stk'),
(7, 39, 2, 'Stk'),
(7, 40, 1, 'Bund'),
(7, 41, 1, 'Stk'),
(7, 42, 250, 'g'),
(7, 43, 1, 'TL'),
(8, 2, 1, 'Stk'),
(8, 9, 1, 'Pr'),
(8, 10, 1, 'Pr'),
(8, 17, 1, 'Stk'),
(8, 35, 30, 'g'),
(8, 44, 800, 'g'),
(8, 45, 2, 'EL'),
(8, 46, 100, 'g'),
(8, 47, 3, 'EL'),
(8, 48, 200, 'g'),
(8, 49, 1, 'TL'),
(8, 50, 100, 'g'),
(8, 51, 100, 'g');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredientId`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipeId`),
  ADD KEY `category` (`category`),
  ADD KEY `category_2` (`category`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD UNIQUE KEY `recipe_ingredient` (`recipeId`,`ingredientId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
