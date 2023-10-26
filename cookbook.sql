-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 26, 2023 at 09:37 AM
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

-- --------------------------------------------------------

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
(1, 'Test Category'),
(2, 'Test Category2');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredientId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(4, 'Kürbis-Eierkuchen mit Champignons und Peperoni', 'Ein gelungenes Herbstessen mit wenig Aufwand\r\n\r\n\r\n', 'Kürbisfleisch klein würfeln, Zwiebeln und Knoblauch schälen und fein würfeln, Champignons putzen und in die gewünschte Größe schneiden, die Stiele ebenso.\r\n\r\nÖl in einer Pfanne auf kleinerer Stufe erhitzen (bei mir die 4 von 9), Kürbis, Zwiebeln und Knoblauch hineingeben und immer mal wenden. Anschließend die Pilze dazugeben und mitbraten, würzen und abschmecken.\r\n\r\nDen Backofen vorheizen auf 200° Ober-/Unterhitze.\r\n\r\nEier in einer Schüssel verquirlen und würzen, fein geschnittene Peperoni und Oregano-Blättchen und die TK-Kräuter untermischen. Die Mischung in der Pfanne damit übergießen und vorsichtig unterheben. Die Hitze ausschalten.\r\n\r\nEine Auflaufform mit Fett einreiben, den Pfanneninhalt einfüllen und auf mittlerer Schiene 20-25 Minuten backen, bis das Ei gestockt ist.\r\n\r\nDieser Kürbis-Eierkuchen schmeckt auch kalt sehr gut und kann wunderbar am nächsten Tag in der Mikrowelle erhitzt werden.\r\n\r\nDazu passt Baguette und grüner Salat.', 65, 'Hauptspeise', 'Test Nutrition', 100, 1, 'https://img.chefkoch-cdn.de/rezepte/2615041410699936/bilder/727987/crop-960x640/kuerbis-eierkuchen-mit-champignons-und-peperoni.jpg'),
(5, 'Thai-Curry mit Massaman\r\n', 'mit frischer Ananas und Cashewnüssen', 'Das Hähnchenbrustfilet waschen und trocken tupfen, in Streifen schneiden und auf einen Teller legen. Nicht würzen. Mit der Speisestärke bestäuben und diese vorsichtig in das Fleisch kneten, so dass das Fleisch damit umhüllt ist.\r\n\r\nDie Kartoffeln schälen, waschen und vierteln. Die Zwiebeln schälen und vierteln. Die Knoblauchzehe schälen und fein würfeln.\r\n\r\nDie Cashewnüsse in etwas Öl anrösten und auf ein Küchenkrepp schütten. In der gleichen Pfanne mit 1 EL Erdnussöl das Fleisch knusprig braten und auf ein Küchenkrepp geben.\r\n\r\nDie Frühlingszwiebeln waschen und nur das Grüne in 1 cm breite Ringe schneiden, den Rest anderweitig verwenden. Die frische Ananas schälen und 2 Scheiben davon in kleine Stücke schneiden.\r\n\r\nDie Cashewnüsse, das Fleisch, die Frühlingszwiebeln und die Ananasstücke kommen erst zum Schluss in die Sauce.\r\n\r\n2 EL Öl in die Pfanne geben und den Knoblauch bei mittlerer Hitze leicht anbraten. Die Currypaste dazugeben und ebenfalls etwas anrösten. Die Zwiebeln dazugeben und mitbraten. Die Masse mit der Kokosmilch und der Hühnerbrühe ablöschen. Kartoffeln, Tamarindenpaste, Palmzucker und Fischsauce dazugeben und die Sauce bei mittlerer Hitze köcheln lassen, bis die Kartoffeln gar sind und die Sauce die gewünschte Konsistenz hat. Evtl. noch etwas Brühe dazugeben.\r\n\r\nNun das Fleisch, die Ananasstücke, die Cashewnüsse und die Frühlingszwiebeln dazugeben und nochmals 2 Minuten sanft köcheln lassen. Das Curry abschmecken und evtl. für die Schärfe noch Chiliflocken dazugeben.\r\n\r\nDazu passt thailändischer Duftreis und als Getränk ein Singha-Bier.\r\n\r\nKeine Angst vor der Fischsauce, sie dient als Salzersatz und das Gericht schmeckt keinesfalls nach Fisch!', 65, 'Hauptspeise', 'Test Nutrition', 100, 1, 'https://img.chefkoch-cdn.de/rezepte/2946171446895319/bilder/917089/crop-642x428/thai-curry-mit-massaman.jpg'),
(6, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch', 'Soulfood auf italienisch', '1. Orecchiette nach Packungsanweisung in kochendem Salzwasser zubereiten.\r\n\r\n2. In der Zwischenzeit den Brokkoli waschen, trocken tupfen, vom Strunk befreien und in mundgerechte Stücke schneiden. Knoblauch schälen. Thymian und Oregano waschen, trocken schütteln und vom Stiel zupfen.\r\n\r\n3. Olivenöl in einer Pfanne erhitzen, Knoblauch und Brokkoli für ca. 2 Minuten anschwitzen. Anschließend mit Essig ablöschen und mit etwas Nudelwasser aufgießen. Al dente gegarte Orecchiette mit einer Schaumkelle hinzugeben. Die Hälfte des Parmesans reiben und zusammen mit Sardellen zur Pasta geben. Mit Salz und Pfeffer abschmecken und einen Teil der Kräuter dazu geben.\r\n\r\n4. Orecchiette mit restlichem Parmesan und restlichen Kräutern servieren.\r\n\r\nTipp: Parmesan auf Seafood-Pasta? Da streiten sich die Italiener. Wir finden: Er macht die Orecchiette mit Brokkoli, Knoblauch und Sardellen perfekt.', 35, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'https://img.chefkoch-cdn.de/rezepte/4253581694696728/bilder/1524148/crop-642x428/orecchiette-mit-brokkoli-sardellen-und-knoblauch.jpg'),
(7, 'Piri-Piri Garnelen mit Tagliatelle', 'Die geröstete Spitzpaprika mit ihren süßen Aromen harmoniert perfekt zu den Garnelen.', 'Den Backofen auf 200 Grad Umluft (220 Grad Ober-/Unterhitze) vorheizen.\r\n\r\nSpitzpaprika rundherum mit einer Gabel einstechen und auf ein Backblech legen. Die Paprika 15 Minuten im Ofen rösten, bis sie gar sind. Die Paprika anschließend in eine Schüssel geben und für 5 Minuten abdecken. Dadurch wird die Paprika gedämpft und lässt sich leichter schälen. Die Paprika dann in Streifen schneiden.\r\n\r\nIn einem großen Topf Wasser mit einer Prise Salz zum Kochen bringen. Tagliatelle nach den Anweisungen auf der Verpackung kochen und dann abgießen.\r\n\r\nDie Chilischoten in dünne Scheiben schneiden und die Knoblauchzehen fein hacken. Öl in einer Pfanne erhitzen und darin die roten Chilis, den Knoblauch und 1 TL Paprikapulver anbraten. Garnelen in die Pfanne geben und langsam mitgaren lassen.\r\n\r\nDie abgetropften Tagliatelle und die Paprika zu den Garnelen in die Pfanne geben und vermengen.\r\n\r\nDie Blätter der Petersilie fein hacken und unter die Pasta rühren. Die Pasta mit dem Saft und der Schale von 1 Zitrone, Pfeffer und Salz abschmecken.', 40, 'Hauptspeise', 'Test Nutrition', 100, 1, 'https://img.chefkoch-cdn.de/rezepte/4249241692876856/bilder/1521571/crop-642x428/piri-piri-garnelen-mit-tagliatelle.jpg'),
(8, 'Bunte Gemüse-Spätzle-Pfanne', 'superschnell etwas Leckeres auf den Tisch gezaubert', '1. In einer großen Pfanne 1 EL Butter erhitzen, die Spätzle ca. 3 Minuten darin anbraten und beiseitestellen.\r\n\r\n2. Zwiebel und Knoblauch schälen und fein würfeln.\r\n\r\n3. Champignons putzen und vierteln.\r\n\r\n4. Die restliche Butter in der Pfanne erhitzen. Zwiebel, Knoblauch und Champignons 5 Minuten darin anbraten.\r\n\r\n5. Alles mit Weißwein ablöschen, kurz köcheln lassen, dann die Sahne und Gemüsebrühepulver dazu geben und weitere 3 Minuten köcheln.\r\n\r\n6. Spinat waschen und trocken schütteln.\r\n\r\n7. Kirschtomaten waschen, halbieren und mit Spätzle und Spinat in die Sahnesauce geben. Alles gut vermengen und mit Salz und Pfeffer abschmecken.\r\n\r\n8. Parmesan auf die Spätzle reiben und direkt servieren.', 20, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'https://img.chefkoch-cdn.de/rezepte/4254251695043056/bilder/1524615/crop-642x428/bunte-gemuese-spaetzle-pfanne.jpg');

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
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
