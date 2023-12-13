-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Dez 2023 um 10:00
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cookbook`
--
    CREATE Database cookbook;
-- --------------------------------------------------------
    USE cookbook;
--
-- Tabellenstruktur für Tabelle `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `categories`
--

INSERT INTO `categories` (`categoryId`, `name`) VALUES
(1, 'Hauptspeise'),
(2, 'Dessert'),
(3, 'Vorspeise');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredientId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `ingredients`
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
(51, 'Kirschtomate(n)'),
(52, 'Nudeln'),
(53, 'Gyrosfleisch'),
(54, 'Paprikaschote(n), rote'),
(55, 'Champignons, frische'),
(56, 'Tomatenmark'),
(57, 'Schmand'),
(58, 'Metaxa'),
(59, 'Käse, geriebener'),
(60, 'Lauch'),
(61, 'Pflanzenöl'),
(62, 'Sambal Oelek'),
(63, 'Geflügelbrühe'),
(64, 'HENGLEIN Spätzle'),
(65, 'Gouda, gerieben'),
(66, 'Tomate'),
(67, 'Tortellini vegetarisch gefüllt'),
(68, 'Porreestange(n)'),
(69, 'Champignons, braune, geviertelt'),
(70, 'Knoblauchzehe(n), gehackt'),
(71, 'Brokkoli, davon die Röschen'),
(72, 'Bohnen, grüne, halbiert'),
(73, 'Cocktailtomaten, halbiert'),
(74, 'Chilipulver'),
(75, 'Sahneersatz '),
(76, 'Speisestärke zum Andicken'),
(77, 'Gemüsebrühe, instant'),
(78, 'Basilikum'),
(79, 'Öl'),
(80, 'Hühnerbrustfilet'),
(81, 'Sahneschmelzkäse'),
(82, 'Mozzarella'),
(83, 'Kräuterbutter'),
(84, 'Kräutersalz'),
(85, 'Pinienkerne'),
(86, 'Äpfel'),
(87, 'Ziegenfrischkäserolle'),
(88, 'Salat'),
(89, 'Honig'),
(90, 'Balsamico'),
(91, 'Quark'),
(92, 'Mascarpone'),
(93, 'Vanillezucker'),
(94, 'Himbeeren'),
(95, 'Spekulatius'),
(96, 'Möhre(n)'),
(97, 'Zucker'),
(98, 'Mango'),
(99, 'Limette'),
(100, 'Mehl'),
(101, 'Milch'),
(102, 'Beerenmischung'),
(103, 'Auberginen'),
(104, 'Feta'),
(105, 'Gemüsemischung für Ratatouille'),
(106, 'Knoblauchbrot'),
(107, 'Quinoa'),
(108, 'Gemüsemischung'),
(109, 'Würzige Sauce'),
(110, 'Gewürzmischung für Chili'),
(111, 'Tomatenmark');


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipes`
--

CREATE TABLE `recipes` (
  `recipeId` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `instructions` text NOT NULL,
  `cooking_time` int(3) NOT NULL,
  `nutrition` varchar(100) NOT NULL,
  `calories` float NOT NULL,
  `category` int(2) NOT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `recipes`
--

INSERT INTO `recipes` (`recipeId`, `name`, `description`, `instructions`, `cooking_time`, `nutrition`, `calories`, `category`, `picture`) VALUES
(1, 'Kürbis-Eierkuchen mit Champignons und Peperoni', 'Ein gelungenes Herbstessen mit wenig Aufwand', '1. Kürbisfleisch klein würfeln, Zwiebeln und Knoblauch schälen und fein würfeln, Champignons putzen und in die gewünschte Größe schneiden, die Stiele ebenso.\r\n\r\n2. Öl in einer Pfanne auf kleinerer Stufe erhitzen (bei mir die 4 von 9), Kürbis, Zwiebeln und Knoblauch hineingeben und immer mal wenden. Anschließend die Pilze dazugeben und mitbraten, würzen und abschmecken.\r\n\r\n3. Den Backofen vorheizen auf 200° Ober-/Unterhitze.\r\n\r\n4. Eier in einer Schüssel verquirlen und würzen, fein geschnittene Peperoni und Oregano-Blättchen und die TK-Kräuter untermischen. Die Mischung in der Pfanne damit übergießen und vorsichtig unterheben. Die Hitze ausschalten.\r\n\r\n5. Eine Auflaufform mit Fett einreiben, den Pfanneninhalt einfüllen und auf mittlerer Schiene 20-25 Minuten backen, bis das Ei gestockt ist.\r\n\r\n6. Dieser Kürbis-Eierkuchen schmeckt auch kalt sehr gut und kann wunderbar am nächsten Tag in der Mikrowelle erhitzt werden.\r\n\r\n7. Dazu passt Baguette und grüner Salat.', 65, 'Eiweiß 4g\r\nFett 2g\r\nKohlenhydr. 20g ', 211, 1, 'Kuerbis-Eierkuchen mit Champignons und Peperoni.png'),
(2, 'Thai-Curry mit Massaman', 'Massaman-Curry ist eine köstliche thailändische Curry-Variante, die für ihre reiche und würzige Geschmacksrichtung bekannt ist. Es zeichnet sich durch die Verwendung von Massaman-Currypaste aus, die oft eine Mischung aus Gewürzen wie Koriander, Kreuzkümmel, Zimt und Kardamom enthält. Dies verleiht dem Curry eine einzigartige Tiefe und Aromen.', '1. Das Hähnchenbrustfilet waschen und trocken tupfen, in Streifen schneiden und auf einen Teller legen. Nicht würzen. Mit der Speisestärke bestäuben und diese vorsichtig in das Fleisch kneten, so dass das Fleisch damit umhüllt ist.\r\n\r\n2. Die Kartoffeln schälen, waschen und vierteln. Die Zwiebeln schälen und vierteln. Die Knoblauchzehe schälen und fein würfeln.\r\n\r\n3. Die Cashewnüsse in etwas Öl anrösten und auf ein Küchenkrepp schütten. In der gleichen Pfanne mit 1 EL Erdnussöl das Fleisch knusprig braten und auf ein Küchenkrepp geben.\r\n\r\n4. Die Frühlingszwiebeln waschen und nur das Grüne in 1 cm breite Ringe schneiden, den Rest anderweitig verwenden. Die frische Ananas schälen und 2 Scheiben davon in kleine Stücke schneiden.\r\n\r\n5. Die Cashewnüsse, das Fleisch, die Frühlingszwiebeln und die Ananasstücke kommen erst zum Schluss in die Sauce.\r\n\r\n6. 2 EL Öl in die Pfanne geben und den Knoblauch bei mittlerer Hitze leicht anbraten. Die Currypaste dazugeben und ebenfalls etwas anrösten. Die Zwiebeln dazugeben und mitbraten. Die Masse mit der Kokosmilch und der Hühnerbrühe ablöschen. Kartoffeln, Tamarindenpaste, Palmzucker und Fischsauce dazugeben und die Sauce bei mittlerer Hitze köcheln lassen, bis die Kartoffeln gar sind und die Sauce die gewünschte Konsistenz hat. Evtl. noch etwas Brühe dazugeben.\r\n\r\n7. Nun das Fleisch, die Ananasstücke, die Cashewnüsse und die Frühlingszwiebeln dazugeben und nochmals 2 Minuten sanft köcheln lassen. Das Curry abschmecken und evtl. für die Schärfe noch Chiliflocken dazugeben.\r\n\r\n8. Dazu passt thailändischer Duftreis und als Getränk ein Singha-Bier.\r\n\r\n9. Keine Angst vor der Fischsauce, sie dient als Salzersatz und das Gericht schmeckt keinesfalls nach Fisch!', 65, 'Eiweiß 20g\r\nFett 25g\r\nKohlenhydr. 25g', 400, 1, 'Thai-Curry mit Massaman.png'),
(3, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch', 'Orecchiette mit Brokkoli, Sardellen und Knoblauch ist ein köstliches italienisches Pasta-Gericht mit einer ausgewogenen Mischung aus salzigen, nussigen und leicht bitteren Aromen. Die Orecchiette-Nudeln nehmen die Aromen von angebratenem Brokkoli, gehacktem Knoblauch und Sardellenfilets auf, um ein delikates und geschmacksintensives Gericht zu schaffen.', '1. Orecchiette nach Packungsanweisung in kochendem Salzwasser zubereiten.\r\n\r\n2. In der Zwischenzeit den Brokkoli waschen, trocken tupfen, vom Strunk befreien und in mundgerechte Stücke schneiden. Knoblauch schälen. Thymian und Oregano waschen, trocken schütteln und vom Stiel zupfen.\r\n\r\n3. Olivenöl in einer Pfanne erhitzen, Knoblauch und Brokkoli für ca. 2 Minuten anschwitzen. Anschließend mit Essig ablöschen und mit etwas Nudelwasser aufgießen. Al dente gegarte Orecchiette mit einer Schaumkelle hinzugeben. Die Hälfte des Parmesans reiben und zusammen mit Sardellen zur Pasta geben. Mit Salz und Pfeffer abschmecken und einen Teil der Kräuter dazu geben.\r\n\r\n4. Orecchiette mit restlichem Parmesan und restlichen Kräutern servieren.\r\n\r\nTipp: Parmesan auf Seafood-Pasta? Da streiten sich die Italiener. Wir finden: Er macht die Orecchiette mit Brokkoli, Knoblauch und Sardellen perfekt.', 35, 'Eiweiß 10g\r\nFett 10g\r\nKohlenhydr.50g', 400, 1, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch.png'),
(4, 'Piri-Piri Garnelen mit Tagliatelle', 'Piri-Piri Garnelen mit Tagliatelle ist eine würzige und schmackhafte Kombination aus Garnelen, scharfer Piri-Piri-Sauce und Tagliatelle-Pasta. Die geröstete Spitzpaprika mit ihren süßen Aromen harmoniert perfekt zu den Garnelen.', '1. Den Backofen auf 200 Grad Umluft (220 Grad Ober-/Unterhitze) vorheizen.\r\n\r\n2. Spitzpaprika rundherum mit einer Gabel einstechen und auf ein Backblech legen. Die Paprika 15 Minuten im Ofen rösten, bis sie gar sind. Die Paprika anschließend in eine Schüssel geben und für 5 Minuten abdecken. Dadurch wird die Paprika gedämpft und lässt sich leichter schälen. Die Paprika dann in Streifen schneiden.\r\n\r\n3. In einem großen Topf Wasser mit einer Prise Salz zum Kochen bringen. Tagliatelle nach den Anweisungen auf der Verpackung kochen und dann abgießen.\r\n\r\n4. Die Chilischoten in dünne Scheiben schneiden und die Knoblauchzehen fein hacken. Öl in einer Pfanne erhitzen und darin die roten Chilis, den Knoblauch und 1 TL Paprikapulver anbraten. Garnelen in die Pfanne geben und langsam mitgaren lassen.\r\n\r\n5.Die abgetropften Tagliatelle und die Paprika zu den Garnelen in die Pfanne geben und vermengen.\r\n\r\n6. Die Blätter der Petersilie fein hacken und unter die Pasta rühren. Die Pasta mit dem Saft und der Schale von 1 Zitrone, Pfeffer und Salz abschmecken.', 40, 'Eiweiß 22g\r\nFett 12g\r\nKohlenhydr. 35g', 350, 1, 'Piri-Piri Garnelen mit Tagliatelle.png'),
(5, 'Bunte Gemüse-Spätzle-Pfanne', 'Bunte Gemüse-Spätzle-Pfanne ist ein leckeres Gericht, bei dem Spätzle, eine Art deutsche Eiernudeln, mit einer Vielzahl von buntem Gemüse, wie Paprika, Zucchini und Tomaten, in einer herzhaften Sauce kombiniert werden. Dieses Gericht zeichnet sich durch seine vielfältigen Farben, Aromen und Texturen aus und ist eine beliebte Wahl in der deutschen Küche.', '1. In einer großen Pfanne 1 EL Butter erhitzen, die Spätzle ca. 3 Minuten darin anbraten und beiseitestellen.\r\n\r\n2. Zwiebel und Knoblauch schälen und fein würfeln.\r\n\r\n3. Champignons putzen und vierteln.\r\n\r\n4. Die restliche Butter in der Pfanne erhitzen. Zwiebel, Knoblauch und Champignons 5 Minuten darin anbraten.\r\n\r\n5. Alles mit Weißwein ablöschen, kurz köcheln lassen, dann die Sahne und Gemüsebrühepulver dazu geben und weitere 3 Minuten köcheln.\r\n\r\n6. Spinat waschen und trocken schütteln.\r\n\r\n7. Kirschtomaten waschen, halbieren und mit Spätzle und Spinat in die Sahnesauce geben. Alles gut vermengen und mit Salz und Pfeffer abschmecken.\r\n\r\n8. Parmesan auf die Spätzle reiben und direkt servieren.', 20, 'Eiweiß 8g\r\nFett 10g\r\nKohlenhydr. 50g', 300, 1, 'Bunte Gemuese-Spaetzle-Pfanne.png'),
(6, 'Gyros-Nudelauflauf in Metaxasoße', 'Ein mediterranes Gericht, bei dem gewürzte Gyrosstreifen mit Nudeln und einer reichen Metaxasoße kombiniert werden. Dieser Auflauf ist ein Fest für Fans der griechischen Küche und ein wahrer Genuss für den Gaumen.', '1. Nudeln in ausreichend Salzwasser kochen, abgießen und in eine Auflaufform geben. Gyros in Öl anbraten. Dann ebenfalls in die Auflaufform geben.\r\n\r\n2. Das Gemüse waschen, klein schneiden und in demselben Öl anbraten, in dem zuvor das Gyros angebraten wurde. Noch etwas mit Salz und Pfeffer würzen. Das Gemüse nun zu dem Gyros und den Nudeln in die Auflaufform geben und vermengen.\r\n\r\n3. Das Öl mit Sahne ablöschen und den Schmand einrühren. Nun auch Tomatenmark und Metaxa hinzugeben. Nach Belieben vom Tomatenmark und Metaxa etwas mehr hinzugeben. Mit Salz und Pfeffer, gegebenenfalls mit Paprikapulver und anderen Gewürzen würzen.\r\n\r\n4. Nun die Soße über die Zutaten in der Auflaufform gießen, Käse drüber streuen und bei 180 °C Umluft für 20 - 30 Minuten in den heißen Ofen schieben.', 80, 'Eiweiß 50,15 g\r\nFett 50,13 g\r\nKohlenhydr. 55,55 g', 878, 1, 'Gyros-Nudelauflauf in Metaxasoße.png'),
(7, 'One-Pot-Spätzle mit Hähnchen', 'Ein herzhaftes Gericht, bei dem saftige Hähnchenstücke und Spätzle zusammen in einem Topf garen. Dieses Gericht ist einfach zuzubereiten und bietet den perfekten Genuss von zartem Hähnchenfleisch und hausgemachten Spätzle, die in einer köstlichen Sauce schmoren.', '1. Hähnchen trocken tupfen und in Würfel schneiden. Lauch waschen, putzen und in feine Ringe schneiden, Möhren schälen, waschen und in kleine Würfel schneiden. Öl in einem Topf erhitzen und Hähnchen darin ca. 2 Minuten anbraten.\r\n\r\n2. Lauch und Möhren zugeben und weitere ca. 2 Minuten braten. Tomatenmark und Sambal Oelek zugeben, kurz mitbraten und mit Sahne und Brühe ablöschen. Spätzle zugeben und ca. 2 Minuten köcheln lassen.\r\n\r\n3. One-Pot-Spätzle mit Käse verfeinern, mit Salz und Pfeffer abschmecken und mit Petersilie bestreut servieren.', 36, 'Eiweiß 32,4 g\r\nFett 16,7 g\r\nKohlenhydr. 33,4 g', 421, 1, 'One-Pot-Spaetzle mit Haehnchen.png'),
(8, 'Vegetarische Tortellini-Pfanne', 'Eine leckere vegetarische Option, bei der gefüllte Tortellini mit Gemüse in einer Pfanne angebraten werden. Die Aromen vermischen sich zu einer wunderbaren Mahlzeit, die leicht zuzubereiten ist und Vegetarier begeistern wird.', '1. Die Tortellini in Salzwasser al dente kochen, abgießen und beiseitestellen. Die Bohnen in Salzwasser ca. 8 Minuten kochen, dann die Brokkoliröschen für weitere 3 - 4 Minuten dazugeben, das Gemüse abgießen, kalt abschrecken und beiseitestellen.\r\n\r\n2. Butter in einer Pfanne erhitzen und Porree, Pilze und Knoblauch darin anschwitzen. Mit Salz, Pfeffer, Chili und etwas Gemüsebrühpulver würzen. Mit dem Sahneersatz ablöschen, die Tortellini dazugeben, die Bohnen und die Brokkoliröschen untermischen und alles heiß werden lassen. Bei Bedarf mit etwas Speisestärke andicken. Die halbierten Cherrytomaten unterheben.\r\n\r\n3. Mit Salz und Pfeffer abschmecken und mit frisch geriebenem Parmesan bestreut servieren.', 35, 'Eiweiß 10g\r\nFett 10g\r\nKohlenhydr. 40g', 300, 1, 'Vegetarische Tortellini-Pfanne.png'),
(9, 'Mozzarella-Hähnchen in Basilikum-Sahnesauce', 'Ein raffiniertes Gericht, bei dem zartes Hähnchen mit frischem Mozzarella in einer cremigen Basilikum-Sahnesauce serviert wird. Diese Kombination aus herzhaft und würzig ist ein Fest für die Sinne.', '1. Fleisch waschen und trocken tupfen. Mit Salz und Pfeffer würzen. Öl in einer Pfanne erhitzen. Filets darin von allen Seiten ca. 5 Min. kräftig anbraten.\r\n\r\n2. Tomaten waschen und halbieren. Basilikumblätter abzupfen, waschen und fein hacken.\r\n\r\n3. Sahne in einem Topf aufkochen lassen. Schmelzkäse hineinrühren und schmelzen lassen. Mit Salz und Pfeffer würzen. 2/3 vom Basilikum unterrühren.\r\n\r\n4. Fleisch und Tomaten in eine gefettete Auflaufform geben. Sauce darüber gießen. Mozzarella in kleine Stückchen schneiden und auf dem Fleisch verteilen. Wer mag, kann noch geriebenen Parmesan und 1 EL Kräuterbutter in kleinen Flöckchen darauf verteilen.\r\n\r\n5. Im vorgeheizten Ofen bei 200 °C Ober-/Unterhitze bzw. 175 °C Umluft ca. 30 Min. backen. Herausnehmen und mit restlichem Basilikum bestreuen.\r\n\r\n6. Dazu schmecken Kroketten oder Reis.', 50, 'Eiweiß 30g\r\nFett 20g\r\nKohlenhydrate 5g ', 350, 1, 'Mozzarella-Haehnchen in Basilikum-Sahnesauce.png'),
(10, 'Frische Tomatensuppe', 'Eine klassische Tomatensuppe, die mit reifen Tomaten und frischen Kräutern zubereitet wird. Diese Suppe ist erfrischend und perfekt für jeden, der sich nach einer leichten und gesunden Mahlzeit sehnt.', '1. Die Tomaten an der Unterseite kreuzweise anritzen, in eine große Schüssel legen und mit kochendem oder heißem Wasser übergießen. Nach 10 Minuten vorsichtig die Haut und den grünen Knopf auf der Oberseite von der Tomate entfernen und die geschälten Tomaten klein schneiden.\r\n\r\n2. Nun die Zwiebeln klein würfeln und den Knoblauch pressen. Beides in Olivenöl anbraten und nach ca. 3 Minuten die Tomatenstücke hinzugeben. Nach ein paar Minuten die Gemüsebrühe und die Gewürze (ohne die Petersilie) hinzugeben und auf niedriger Temperatur 20 Minuten kochen. Das Tomatenmark unterrühren und die Suppe mit einem Mixstab fein pürieren. Nach Belieben die Suppe mit den Gewürzen abschmecken und mit ein wenig frischer Petersilie servieren.', 60, 'Eiweiß 4,63\r\nFett 9,87 g\r\nKohlenhydr. 12,32 g', 160, 3, 'Frische Tomatensuppe.png'),
(11, 'Überbackener Ziegenkäse mit Honigsauce', 'Ein elegantes Vorspeisengericht, bei dem Ziegenkäse mit Honig und Gewürzen überbacken wird. Diese Kombination aus süß und herzhaft ist ein kulinarischer Genuss.', '1. Den Ofen auf 225 °C (Ober-/Unterhitze) vorheizen.\r\n\r\n2. Die Pinienkerne unter Umrühren in einer Pfanne ohne Fett rösten. Die Äpfel in vier große Scheiben mit ca. 1,5 cm Dicke schneiden. Das Kerngehäuse entfernen. Die Apfelscheiben in eine gefettete Form legen und jeweils eine Scheibe Käse obenauf legen. Ca. 20 Minuten überbacken, bis der Käse schön goldgelb ist.\r\n\r\n3. Den Salat waschen und die Blätter auf Portionstellern anrichten. Den überbackenen Käse auf den Salat setzen. Mit den Pinienkernen bestreuen.\r\n\r\n4. Honig, Butter und Balsamico in die noch warme Form geben und verrühren. Die Sauce über den Käse gießen und servieren.', 60, 'Eiweiß 10g\r\nFett 15g\r\nKohlenhydr. 15g', 250, 3, 'Ueberbackener Ziegenkaese mit Honigsauce.png'),
(12, 'Himbeerdessert mit Spekulatius', 'Ein verführerisches Dessert, bei dem frische Himbeeren mit einer knusprigen Spekulatiuskruste kombiniert werden. Dieses Dessert ist eine süße Versuchung für jeden Naschkatzen.', '1. Die Sahne schlagen. Quark, Mascarpone, Zucker und Vanillezucker mischen. Die Sahne unterheben.\r\n\r\n2. In einer ausreichend hohen eckigen oder runden Schüssel mit drei, vier EL Creme den Boden bedecken. Darauf eine Schicht Spekulatius, ganz oder in Stücke gebrochen, verteilen. Die Hälfte der restlichen Creme darauf verstreichen. Die gefrorenen Himbeeren darüber verteilen, diese mit dem Rest der Creme bedecken, so dass sie nicht mehr zu sehen sind. Zerbröckelten Spekulatius (Menge nach Belieben) darüber verteilen.\r\n\r\n3. Die Creme muss mindestens 4 Stunden kalt gestellt werden.\r\nVor dem Servieren kann man noch etwas Puderzucker drüber streuen.', 260, 'Eiweiß 8,96 g\r\nFett 24,55 g\r\nKohlenhydr. 39,07 g', 420, 2, 'Himbeerdessert mit Spekulatius.png'),
(13, 'Spinat-Ricotta-Tortellini', 'Tortellini gefüllt mit Spinat und Ricotta in einer würzigen Tomatensauce.', '1. Koche die Tortellini gemäß der Anleitung auf der Verpackung.\r\n\r\n2. Erhitze in einer Pfanne Olivenöl und brate Knoblauch und Zwiebeln an.\r\n\r\n3. Gib Tomaten und Spinat hinzu und lasse es köcheln.\r\n\r\n4. Mische die gekochten Tortellini mit der Sauce und serviere das Gericht mit geriebenem Parmesan.', 25, 'Eiweiß 12g\r\nFett 8g\r\nKohlenhydr. 30g ', 320, 1, 'Spinat-Ricotta-Tortellini.png'),
(14, 'Mango-Limetten-Sorbet', 'Erfrischendes Sorbet mit süßer Mango und spritziger Limette.', '1. Schäle und würfle die Mango, gib sie in einen Mixer.\r\n\r\n2. Füge Limettensaft und Zucker hinzu und mixe alles zu einer glatten Masse.\r\n\r\n3. Gieße die Masse in eine flache Form und friere sie für mindestens 4 Stunden ein.\r\n\r\n4. Serviere das Sorbet mit frischer Minze.', 15, 'Eiweiß 1g\r\nFett 0g\r\nKohlenhydr. 20g ', 180, 2, 'Mango-Limetten-Sorbet.png'),
(15, 'Caprese-Salat mit Balsamico-Glasur', 'Ein einfacher Salat mit Tomaten, Mozzarella und Basilikum, verfeinert mit Balsamico-Glasur.', '1. Schneide Tomaten und Mozzarella in Scheiben und richte sie abwechselnd auf einem Teller an.\r\n\r\n2. Streue Basilikumblätter darüber und würze mit Salz und Pfeffer.\r\n\r\n3. Beträufle den Salat mit Balsamico-Glasur und Olivenöl und serviere ihn frisch.', 10, 'Eiweiß 12g\r\nFett 15g\r\nKohlenhydr. 5g ', 220, 3, 'Caprese-Salat mit Balsamico-Glasur.png'),
(16, 'Pfannkuchen mit Beeren und Ahornsirup', 'Fluffige Pfannkuchen mit frischen Beeren und süßem Ahornsirup.', '1. Bereite den Pfannkuchenteig nach deinem bevorzugten Rezept vor und backe die Pfannkuchen goldbraun.\r\n\r\n2. Wasche und schneide die Beeren deiner Wahl.\r\n\r\n3. Staple die Pfannkuchen auf einem Teller und belege sie mit den Beeren. Gieße Ahornsirup darüber und serviere sofort.', 20, 'Eiweiß 7g\r\nFett 5g\r\nKohlenhydr. 25g ', 200, 2, 'Pfannkuchen mit Beeren und Ahornsirup.png'),
(17, 'Gebratene Auberginenröllchen', 'Auberginenröllchen gefüllt mit würziger Feta-Creme, überbacken mit Käse.', '1. Schneide Auberginen in dünne Scheiben und brate sie in Olivenöl an.\r\n\r\n2. Vermische Feta, Kräuter und Gewürze zu einer Creme.\r\n\r\n3. Verteile die Feta-Creme auf den Auberginenscheiben und rolle sie auf.\r\n\r\n4. Lege die Röllchen in eine Auflaufform, bestreue sie mit Käse und backe sie im Ofen, bis der Käse goldbraun ist.', 30, 'Eiweiß 9g\r\nFett 10g\r\nKohlenhydr. 15g ', 250, 1, 'Gebratene Auberginenroellchen.png'),
(18, 'Ratatouille mit Knoblauchbrot', 'Ein französisches Gericht mit aromatischem Gemüse und knusprigem Knoblauchbrot.', '1. Schneide das Gemüse in gleichmäßige Stücke.\r\n\r\n2. Erhitze eine Pfanne auf mittlerer Hitze und brate das geschnittene Gemüse darin an, bis es leicht gebräunt und weich ist.\r\n\r\n3. Röste währenddessen in einer separaten Pfanne oder im Ofen das Knoblauchbrot, bis es knusprig und goldbraun ist.\r\n\r\n4. Serviere das Ratatouille auf einem Teller und garniere es mit frischen Kräutern. Dazu das knusprige Knoblauchbrot reichen und genießen.', 40, 'Eiweiß 8g\r\nFett 5g\r\nKohlenhydr. 25g ', 280, 3, 'Ratatouille mit Knoblauchbrot.png'),
(19, 'Gefüllte Paprika mit Quinoa und Gemüse', 'Paprika gefüllt mit Quinoa, Gemüse und würziger Sauce.', '1. Schneide die Paprikas der Länge nach auf und entferne die Kerne und das Innere.\r\n\r\n2. Bereite eine Füllung aus gekochtem Quinoa und einer Mischung aus verschiedenen Gemüsesorten zu.\r\n\r\n3. Fülle die Paprikahälften mit der vorbereiteten Quinoa-Gemüse-Mischung und backe sie im Ofen, bis die Paprika weich sind und die Füllung heiß ist.\r\n\r\n4. Serviere die gefüllten Paprikas mit einer würzigen Sauce nach Wahl und garniere sie mit frischen Kräutern.', 35, 'Eiweiß 10g\r\nFett 6g\r\nKohlenhydr. 30g ', 310, 1, 'Gefuellte Paprika mit Quinoa und Gemuese.png'),
(20, 'Scharfes Hühnchen-Chili', 'Ein würziges und herzhaftes Chili mit zartem Hühnchen.', '1. Erhitze Öl in einem Topf und brate das gewürfelte Hühnchenfleisch an.\r\n\r\n2. Gib Zwiebeln, Knoblauch, Paprika und Gewürze hinzu.\r\n\r\n3. Rühre Tomatenmark und passierte Tomaten ein.\r\n\r\n4. Lasse das Chili köcheln, bis alles gut durchgekocht ist und serviere es heiß.', 50, 'Eiweiß 20g\r\nFett 12g\r\nKohlenhydr. 35g ', 360, 1, 'Scharfes Huehnchen-Chili.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipeId` int(11) NOT NULL,
  `ingredientId` int(11) NOT NULL,
  `amount` float NOT NULL,
  `measure` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`recipeId`, `ingredientId`, `amount`, `measure`) VALUES
(1, 1, 330, 'g'),
(1, 2, 2, 'Stk'),
(1, 4, 100, 'g'),
(1, 5, 5, 'Stk'),
(1, 6, 1, 'Stk'),
(1, 7, 3, 'Stk'),
(1, 8, 1, 'EL'),
(1, 9, 1, 'Pr'),
(1, 10, 1, 'Pr'),
(1, 11, 3, 'EL'),
(1, 12, 20, 'g'),
(1, 17, 2, 'Stk'),
(2, 2, 2, 'Stk'),
(2, 13, 200, 'g'),
(2, 14, 1, 'TL'),
(2, 15, 4, 'EL'),
(2, 16, 40, 'g'),
(2, 17, 1, 'Stk'),
(2, 18, 1, 'EL'),
(2, 19, 400, 'ml'),
(2, 20, 250, 'ml'),
(2, 21, 2, 'Stk'),
(2, 24, 1, 'TL'),
(2, 25, 1, 'TL'),
(2, 26, 3, 'EL'),
(2, 27, 1, 'Pr'),
(2, 28, 2, 'Scheiben'),
(2, 29, 2, 'Stk'),
(3, 7, 4, 'Stiel(e)'),
(3, 9, 1, 'Pr'),
(3, 10, 1, 'Pr'),
(3, 17, 6, 'Stk'),
(3, 30, 600, 'g'),
(3, 31, 800, 'g'),
(3, 32, 10, 'Stk'),
(3, 33, 8, 'EL'),
(3, 34, 6, 'EL'),
(3, 35, 100, 'g'),
(3, 36, 60, 'g'),
(4, 9, 1, 'Pr'),
(4, 10, 1, 'Pr'),
(4, 17, 2, 'Stk'),
(4, 33, 3, 'EL'),
(4, 37, 300, 'g'),
(4, 38, 2, 'Stk'),
(4, 39, 2, 'Stk'),
(4, 40, 1, 'Bund'),
(4, 41, 1, 'Stk'),
(4, 42, 250, 'g'),
(4, 43, 1, 'TL'),
(5, 2, 1, 'Stk'),
(5, 9, 1, 'Pr'),
(5, 10, 1, 'Pr'),
(5, 17, 1, 'Stk'),
(5, 35, 30, 'g'),
(5, 44, 800, 'g'),
(5, 45, 2, 'EL'),
(5, 46, 100, 'g'),
(5, 47, 3, 'EL'),
(5, 48, 200, 'g'),
(5, 49, 1, 'TL'),
(5, 50, 100, 'g'),
(5, 51, 100, 'g'),
(6, 2, 1, 'Stk.'),
(6, 9, 1, 'Pr'),
(6, 10, 1, 'Pr'),
(6, 43, 1, 'Pr'),
(6, 48, 200, 'g'),
(6, 52, 125, 'g'),
(6, 53, 250, 'g'),
(6, 54, 1, 'Stk.'),
(6, 55, 75, 'g'),
(6, 56, 25, 'g'),
(6, 57, 100, 'g'),
(6, 58, 2, 'cl'),
(6, 59, 62, 'g'),
(7, 9, 1, 'Pr'),
(7, 10, 1, 'Pr'),
(7, 13, 500, 'g'),
(7, 40, 1, 'EL'),
(7, 48, 100, 'ml'),
(7, 56, 1, 'TL'),
(7, 60, 1, 'Stange'),
(7, 61, 1, 'EL'),
(7, 62, 1, 'EL'),
(7, 63, 250, 'ml'),
(7, 64, 1, 'Pck'),
(7, 65, 3, 'EL'),
(7, 96, 2, 'Stk'),
(8, 9, 1, 'Pr'),
(8, 10, 1, 'Pr'),
(8, 35, 1, 'Pr'),
(8, 45, 1, 'EL'),
(8, 67, 1, 'Pck'),
(8, 68, 1, 'Stk'),
(8, 69, 200, 'g'),
(8, 70, 2, 'Stk'),
(8, 71, 1, 'Stk'),
(8, 72, 2, 'Handvoll'),
(8, 73, 10, 'Stk'),
(8, 74, 1, 'Pr'),
(8, 75, 200, 'ml'),
(8, 76, 1, 'Pr'),
(8, 77, 1, 'EL'),
(9, 9, 1, 'Pr'),
(9, 10, 1, 'Pr'),
(9, 35, 1, 'Pr'),
(9, 48, 100, 'g'),
(9, 73, 125, 'g'),
(9, 78, 1, 'Topf'),
(9, 79, 1, 'EL'),
(9, 80, 2, 'Stk'),
(9, 81, 50, 'g'),
(9, 82, 62, 'g'),
(9, 83, 1, 'EL'),
(10, 2, 2, 'Stk'),
(10, 9, 1, 'Pr'),
(10, 10, 1, 'Pr'),
(10, 32, 1, 'Pr'),
(10, 40, 1, 'Pr'),
(10, 56, 3, 'TL'),
(10, 66, 1, 'kg'),
(10, 70, 3, 'Stk'),
(10, 77, 3, 'L'),
(10, 84, 1, 'Pr'),
(11, 45, 1, 'EL'),
(11, 85, 1, 'EL'),
(11, 86, 1, 'Stk'),
(11, 87, 2, 'Stk'),
(11, 88, 1, 'Pr'),
(11, 89, 1, 'EL'),
(11, 90, 1, 'EL'),
(12, 48, 100, 'ml'),
(12, 91, 125, 'g'),
(12, 92, 125, 'g'),
(12, 93, 1, 'Pck'),
(12, 94, 175, 'g'),
(12, 95, 125, 'g'),
(12, 97, 62, 'g'),
(13, 67, 250, 'g'),
(13, 17, 2, 'Stk'),
(13, 2, 1, 'Stk'),
(13, 66, 200, 'g'),
(13, 50, 100, 'g'),
(13, 35, 30, 'g'),
(14, 97, 150, 'g'),
(14, 98, 2, 'Stk'),
(14, 99, 3, 'Stk'),
(15, 66, 3, 'Stk'),
(15, 78, 5, 'Blätter'),
(15, 82, 200, 'g'),
(16, 100, 250, 'g'),
(16, 34, 2, 'Stk'),
(16, 101, 300, 'ml'),
(16, 102, 150, 'g'),
(17, 103, 2, 'Stk'),
(17, 104, 100, 'g'),
(17, 59, 50, 'g'),
(18, 105, 300, 'g'),
(18, 17, 2, 'Stk'),
(18, 2, 1, 'Stk'),
(18, 106, 100, 'g'),
(19, 39, 4, 'Stk'),
(19, 107, 200, 'g'),
(19, 108, 150, 'g'),
(19, 109, 50, 'ml'),
(20, 80, 300, 'g'),
(20, 2, 2, 'Stk'),
(20, 17, 2, 'Stk'),
(20, 111, 50, 'g'),
(20, 66, 200, 'g');


--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indizes für die Tabelle `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ingredientId`);

--
-- Indizes für die Tabelle `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`recipeId`),
  ADD KEY `category` (`category`),
  ADD KEY `category_2` (`category`);

--
-- Indizes für die Tabelle `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD UNIQUE KEY `recipe_ingredient` (`recipeId`,`ingredientId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `ingredientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT für Tabelle `recipes`
--
ALTER TABLE `recipes`
  MODIFY `recipeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;