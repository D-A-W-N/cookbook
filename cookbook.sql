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
(97, 'Zucker');

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
(4, 'Kürbis-Eierkuchen mit Champignons und Peperoni', 'Ein gelungenes Herbstessen mit wenig Aufwand\r\n\r\n\r\n', '1.Kürbisfleisch klein würfeln, Zwiebeln und Knoblauch schälen und fein würfeln, Champignons putzen und in die gewünschte Größe schneiden, die Stiele ebenso.\r\n\r\n2.Öl in einer Pfanne auf kleinerer Stufe erhitzen (bei mir die 4 von 9), Kürbis, Zwiebeln und Knoblauch hineingeben und immer mal wenden. Anschließend die Pilze dazugeben und mitbraten, würzen und abschmecken.\r\n\r\n3.Den Backofen vorheizen auf 200° Ober-/Unterhitze.\r\n\r\n4.Eier in einer Schüssel verquirlen und würzen, fein geschnittene Peperoni und Oregano-Blättchen und die TK-Kräuter untermischen. Die Mischung in der Pfanne damit übergießen und vorsichtig unterheben. Die Hitze ausschalten.\r\n\r\n5.Eine Auflaufform mit Fett einreiben, den Pfanneninhalt einfüllen und auf mittlerer Schiene 20-25 Minuten backen, bis das Ei gestockt ist.\r\n\r\n6.Dieser Kürbis-Eierkuchen schmeckt auch kalt sehr gut und kann wunderbar am nächsten Tag in der Mikrowelle erhitzt werden.\r\n\r\n7.Dazu passt Baguette und grüner Salat.', 65, 'Eiweiß 4g\r\nFett 2g\r\nKohlenhydr. 20g ', 211, 1, 'Kürbis-Eierkuchen mit Champignons und Peperoni'),
(5, 'Thai-Curry mit Massaman\r\n', 'Massaman-Curry ist eine köstliche thailändische Curry-Variante, die für ihre reiche und würzige Geschmacksrichtung bekannt ist. Es zeichnet sich durch die Verwendung von Massaman-Currypaste aus, die oft eine Mischung aus Gewürzen wie Koriander, Kreuzkümmel, Zimt und Kardamom enthält. Dies verleiht dem Curry eine einzigartige Tiefe und Aromen.', '1.Das Hähnchenbrustfilet waschen und trocken tupfen, in Streifen schneiden und auf einen Teller legen. Nicht würzen. Mit der Speisestärke bestäuben und diese vorsichtig in das Fleisch kneten, so dass das Fleisch damit umhüllt ist.\r\n\r\n2.Die Kartoffeln schälen, waschen und vierteln. Die Zwiebeln schälen und vierteln. Die Knoblauchzehe schälen und fein würfeln.\r\n\r\n3.Die Cashewnüsse in etwas Öl anrösten und auf ein Küchenkrepp schütten. In der gleichen Pfanne mit 1 EL Erdnussöl das Fleisch knusprig braten und auf ein Küchenkrepp geben.\r\n\r\n4.Die Frühlingszwiebeln waschen und nur das Grüne in 1 cm breite Ringe schneiden, den Rest anderweitig verwenden. Die frische Ananas schälen und 2 Scheiben davon in kleine Stücke schneiden.\r\n\r\n5.Die Cashewnüsse, das Fleisch, die Frühlingszwiebeln und die Ananasstücke kommen erst zum Schluss in die Sauce.\r\n\r\n6.2 EL Öl in die Pfanne geben und den Knoblauch bei mittlerer Hitze leicht anbraten. Die Currypaste dazugeben und ebenfalls etwas anrösten. Die Zwiebeln dazugeben und mitbraten. Die Masse mit der Kokosmilch und der Hühnerbrühe ablöschen. Kartoffeln, Tamarindenpaste, Palmzucker und Fischsauce dazugeben und die Sauce bei mittlerer Hitze köcheln lassen, bis die Kartoffeln gar sind und die Sauce die gewünschte Konsistenz hat. Evtl. noch etwas Brühe dazugeben.\r\n\r\n7.Nun das Fleisch, die Ananasstücke, die Cashewnüsse und die Frühlingszwiebeln dazugeben und nochmals 2 Minuten sanft köcheln lassen. Das Curry abschmecken und evtl. für die Schärfe noch Chiliflocken dazugeben.\r\n\r\n8.Dazu passt thailändischer Duftreis und als Getränk ein Singha-Bier.\r\n\r\n9.Keine Angst vor der Fischsauce, sie dient als Salzersatz und das Gericht schmeckt keinesfalls nach Fisch!', 65, 'Eiweiß 20g\r\nFett 25g\r\nKohlenhydr. 25g', 400, 1, 'Thai-Curry mit Massaman'),
(6, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch', 'Orecchiette mit Brokkoli, Sardellen und Knoblauch ist ein köstliches italienisches Pasta-Gericht mit einer ausgewogenen Mischung aus salzigen, nussigen und leicht bitteren Aromen. Die Orecchiette-Nudeln nehmen die Aromen von angebratenem Brokkoli, gehacktem Knoblauch und Sardellenfilets auf, um ein delikates und geschmacksintensives Gericht zu schaffen.', '1. Orecchiette nach Packungsanweisung in kochendem Salzwasser zubereiten.\r\n\r\n2. In der Zwischenzeit den Brokkoli waschen, trocken tupfen, vom Strunk befreien und in mundgerechte Stücke schneiden. Knoblauch schälen. Thymian und Oregano waschen, trocken schütteln und vom Stiel zupfen.\r\n\r\n3. Olivenöl in einer Pfanne erhitzen, Knoblauch und Brokkoli für ca. 2 Minuten anschwitzen. Anschließend mit Essig ablöschen und mit etwas Nudelwasser aufgießen. Al dente gegarte Orecchiette mit einer Schaumkelle hinzugeben. Die Hälfte des Parmesans reiben und zusammen mit Sardellen zur Pasta geben. Mit Salz und Pfeffer abschmecken und einen Teil der Kräuter dazu geben.\r\n\r\n4. Orecchiette mit restlichem Parmesan und restlichen Kräutern servieren.\r\n\r\nTipp: Parmesan auf Seafood-Pasta? Da streiten sich die Italiener. Wir finden: Er macht die Orecchiette mit Brokkoli, Knoblauch und Sardellen perfekt.', 35, 'Eiweiß 10g\r\nFett 10g\r\nKohlenhydr.50g', 400, 1, 'Orecchiette mit Brokkoli, Sardellen und Knoblauch'),
(7, 'Piri-Piri Garnelen mit Tagliatelle', 'Piri-Piri Garnelen mit Tagliatelle ist eine würzige und schmackhafte Kombination aus Garnelen, scharfer Piri-Piri-Sauce und Tagliatelle-Pasta. Die geröstete Spitzpaprika mit ihren süßen Aromen harmoniert perfekt zu den Garnelen.', '1.Den Backofen auf 200 Grad Umluft (220 Grad Ober-/Unterhitze) vorheizen.\r\n\r\n2.Spitzpaprika rundherum mit einer Gabel einstechen und auf ein Backblech legen. Die Paprika 15 Minuten im Ofen rösten, bis sie gar sind. Die Paprika anschließend in eine Schüssel geben und für 5 Minuten abdecken. Dadurch wird die Paprika gedämpft und lässt sich leichter schälen. Die Paprika dann in Streifen schneiden.\r\n\r\n3.In einem großen Topf Wasser mit einer Prise Salz zum Kochen bringen. Tagliatelle nach den Anweisungen auf der Verpackung kochen und dann abgießen.\r\n\r\n4.Die Chilischoten in dünne Scheiben schneiden und die Knoblauchzehen fein hacken. Öl in einer Pfanne erhitzen und darin die roten Chilis, den Knoblauch und 1 TL Paprikapulver anbraten. Garnelen in die Pfanne geben und langsam mitgaren lassen.\r\n\r\n5.Die abgetropften Tagliatelle und die Paprika zu den Garnelen in die Pfanne geben und vermengen.\r\n\r\n6.Die Blätter der Petersilie fein hacken und unter die Pasta rühren. Die Pasta mit dem Saft und der Schale von 1 Zitrone, Pfeffer und Salz abschmecken.', 40, 'Eiweiß 22g\r\nFett 12g\r\nKohlenhydr. 35g', 350, 1, 'Piri-Piri Garnelen mit Tagliatelle'),
(8, 'Bunte Gemüse-Spätzle-Pfanne', 'Bunte Gemüse-Spätzle-Pfanne ist ein leckeres Gericht, bei dem Spätzle, eine Art deutsche Eiernudeln, mit einer Vielzahl von buntem Gemüse, wie Paprika, Zucchini und Tomaten, in einer herzhaften Sauce kombiniert werden. Dieses Gericht zeichnet sich durch seine vielfältigen Farben, Aromen und Texturen aus und ist eine beliebte Wahl in der deutschen Küche.\r\n\r\n', '1. In einer großen Pfanne 1 EL Butter erhitzen, die Spätzle ca. 3 Minuten darin anbraten und beiseitestellen.\r\n\r\n2. Zwiebel und Knoblauch schälen und fein würfeln.\r\n\r\n3. Champignons putzen und vierteln.\r\n\r\n4. Die restliche Butter in der Pfanne erhitzen. Zwiebel, Knoblauch und Champignons 5 Minuten darin anbraten.\r\n\r\n5. Alles mit Weißwein ablöschen, kurz köcheln lassen, dann die Sahne und Gemüsebrühepulver dazu geben und weitere 3 Minuten köcheln.\r\n\r\n6. Spinat waschen und trocken schütteln.\r\n\r\n7. Kirschtomaten waschen, halbieren und mit Spätzle und Spinat in die Sahnesauce geben. Alles gut vermengen und mit Salz und Pfeffer abschmecken.\r\n\r\n8. Parmesan auf die Spätzle reiben und direkt servieren.', 20, 'Eiweiß 8g\r\nFett 10g\r\nKohlenhydr. 50g', 300, 1, 'Bunte Gemüse-Spätzle-Pfanne'),
(9, 'Gyros-Nudelauflauf in Metaxasoße', 'Ein mediterranes Gericht, bei dem gewürzte Gyrosstreifen mit Nudeln und einer reichen Metaxasoße kombiniert werden. Dieser Auflauf ist ein Fest für Fans der griechischen Küche und ein wahrer Genuss für den Gaumen.', '1.Nudeln in ausreichend Salzwasser kochen, abgießen und in eine Auflaufform geben. Gyros in Öl anbraten. Dann ebenfalls in die Auflaufform geben.\r\n\r\n2.Das Gemüse waschen, klein schneiden und in demselben Öl anbraten, in dem zuvor das Gyros angebraten wurde. Noch etwas mit Salz und Pfeffer würzen. Das Gemüse nun zu dem Gyros und den Nudeln in die Auflaufform geben und vermengen.\r\n\r\n3.Das Öl mit Sahne ablöschen und den Schmand einrühren. Nun auch Tomatenmark und Metaxa hinzugeben. Nach Belieben vom Tomatenmark und Metaxa etwas mehr hinzugeben. Mit Salz und Pfeffer, gegebenenfalls mit Paprikapulver und anderen Gewürzen würzen.\r\n\r\n4.Nun die Soße über die Zutaten in der Auflaufform gießen, Käse drüber streuen und bei 180 °C Umluft für 20 - 30 Minuten in den heißen Ofen schieben.', 80, 'Eiweiß 50,15 g\r\nFett 50,13 g\r\nKohlenhydr. 55,55 g', 878, 1, 'Gyros-Nudelauflauf in Metaxasoße'),
(10, 'One-Pot-Spätzle mit Hähnchen', 'Ein herzhaftes Gericht, bei dem saftige Hähnchenstücke und Spätzle zusammen in einem Topf garen. Dieses Gericht ist einfach zuzubereiten und bietet den perfekten Genuss von zartem Hähnchenfleisch und hausgemachten Spätzle, die in einer köstlichen Sauce schmoren.', '1. Hähnchen trocken tupfen und in Würfel schneiden. Lauch waschen, putzen und in feine Ringe schneiden, Möhren schälen, waschen und in kleine Würfel schneiden. Öl in einem Topf erhitzen und Hähnchen darin ca. 2 Minuten anbraten.\r\n\r\n2. Lauch und Möhren zugeben und weitere ca. 2 Minuten braten. Tomatenmark und Sambal Oelek zugeben, kurz mitbraten und mit Sahne und Brühe ablöschen. Spätzle zugeben und ca. 2 Minuten köcheln lassen.\r\n\r\n3. One-Pot-Spätzle mit Käse verfeinern, mit Salz und Pfeffer abschmecken und mit Petersilie bestreut servieren.', 36, 'Eiweiß 32,4 g\r\nFett 16,7 g\r\nKohlenhydr. 33,4 g', 421, 1, 'One-Pot-Spätzle mit Hähnchen'),
(11, 'Vegetarische Tortellini-Pfanne', 'Eine leckere vegetarische Option, bei der gefüllte Tortellini mit Gemüse in einer Pfanne angebraten werden. Die Aromen vermischen sich zu einer wunderbaren Mahlzeit, die leicht zuzubereiten ist und Vegetarier begeistern wird.', '1.Die Tortellini in Salzwasser al dente kochen, abgießen und beiseitestellen. Die Bohnen in Salzwasser ca. 8 Minuten kochen, dann die Brokkoliröschen für weitere 3 - 4 Minuten dazugeben, das Gemüse abgießen, kalt abschrecken und beiseitestellen.\r\n\r\n2.Butter in einer Pfanne erhitzen und Porree, Pilze und Knoblauch darin anschwitzen. Mit Salz, Pfeffer, Chili und etwas Gemüsebrühpulver würzen. Mit dem Sahneersatz ablöschen, die Tortellini dazugeben, die Bohnen und die Brokkoliröschen untermischen und alles heiß werden lassen. Bei Bedarf mit etwas Speisestärke andicken. Die halbierten Cherrytomaten unterheben.\r\n\r\n3.Mit Salz und Pfeffer abschmecken und mit frisch geriebenem Parmesan bestreut servieren.', 35, 'Eiweiß 10g\r\nFett 10g\r\nKohlenhydr. 40g', 300, 1, 'Vegetarische Tortellini-Pfanne'),
(12, 'Mozzarella-Hähnchen in Basilikum-Sahnesauce', 'Ein raffiniertes Gericht, bei dem zartes Hähnchen mit frischem Mozzarella in einer cremigen Basilikum-Sahnesauce serviert wird. Diese Kombination aus herzhaft und würzig ist ein Fest für die Sinne.', '1.Fleisch waschen und trocken tupfen. Mit Salz und Pfeffer würzen. Öl in einer Pfanne erhitzen. Filets darin von allen Seiten ca. 5 Min. kräftig anbraten.\r\n\r\n2.Tomaten waschen und halbieren. Basilikumblätter abzupfen, waschen und fein hacken.\r\n\r\n3.Sahne in einem Topf aufkochen lassen. Schmelzkäse hineinrühren und schmelzen lassen. Mit Salz und Pfeffer würzen. 2/3 vom Basilikum unterrühren.\r\n\r\n4.Fleisch und Tomaten in eine gefettete Auflaufform geben. Sauce darüber gießen. Mozzarella in kleine Stückchen schneiden und auf dem Fleisch verteilen. Wer mag, kann noch geriebenen Parmesan und 1 EL Kräuterbutter in kleinen Flöckchen darauf verteilen.\r\n\r\n5.Im vorgeheizten Ofen bei 200 °C Ober-/Unterhitze bzw. 175 °C Umluft ca. 30 Min. backen. Herausnehmen und mit restlichem Basilikum bestreuen.\r\n\r\n6.Dazu schmecken Kroketten oder Reis.', 50, 'Eiweiß 30g\r\nFett 20g\r\nKohlenhydrate 5g ', 350, 1, 'Mozzarella-Hähnchen in Basilikum-Sahnesauce'),
(13, 'Frische Tomatensuppe', 'Eine klassische Tomatensuppe, die mit reifen Tomaten und frischen Kräutern zubereitet wird. Diese Suppe ist erfrischend und perfekt für jeden, der sich nach einer leichten und gesunden Mahlzeit sehnt.', '1.Die Tomaten an der Unterseite kreuzweise anritzen, in eine große Schüssel legen und mit kochendem oder heißem Wasser übergießen. Nach 10 Minuten vorsichtig die Haut und den grünen Knopf auf der Oberseite von der Tomate entfernen und die geschälten Tomaten klein schneiden.\r\n\r\n2.Nun die Zwiebeln klein würfeln und den Knoblauch pressen. Beides in Olivenöl anbraten und nach ca. 3 Minuten die Tomatenstücke hinzugeben. Nach ein paar Minuten die Gemüsebrühe und die Gewürze (ohne die Petersilie) hinzugeben und auf niedriger Temperatur 20 Minuten kochen. Das Tomatenmark unterrühren und die Suppe mit einem Mixstab fein pürieren. Nach Belieben die Suppe mit den Gewürzen abschmecken und mit ein wenig frischer Petersilie servieren.', 60, 'Eiweiß 4,63\r\nFett 9,87 g\r\nKohlenhydr. 12,32 g', 160, 3, 'Frische Tomatensuppe'),
(14, 'Überbackener Ziegenkäse mit Honigsauce', 'Ein elegantes Vorspeisengericht, bei dem Ziegenkäse mit Honig und Gewürzen überbacken wird. Diese Kombination aus süß und herzhaft ist ein kulinarischer Genuss.', '1.Den Ofen auf 225 °C (Ober-/Unterhitze) vorheizen.\r\n\r\n2.Die Pinienkerne unter Umrühren in einer Pfanne ohne Fett rösten. Die Äpfel in vier große Scheiben mit ca. 1,5 cm Dicke schneiden. Das Kerngehäuse entfernen. Die Apfelscheiben in eine gefettete Form legen und jeweils eine Scheibe Käse obenauf legen. Ca. 20 Minuten überbacken, bis der Käse schön goldgelb ist.\r\n\r\n3.Den Salat waschen und die Blätter auf Portionstellern anrichten. Den überbackenen Käse auf den Salat setzen. Mit den Pinienkernen bestreuen.\r\n\r\n4.Honig, Butter und Balsamico in die noch warme Form geben und verrühren. Die Sauce über den Käse gießen und servieren.', 60, 'Eiweiß 10g\r\nFett 15g\r\nKohlenhydr. 15g', 250, 3, 'Überbackener Ziegenkäse mit Honigsauce'),
(15, 'Himbeerdessert mit Spekulatius', 'Ein verführerisches Dessert, bei dem frische Himbeeren mit einer knusprigen Spekulatiuskruste kombiniert werden. Dieses Dessert ist eine süße Versuchung für jeden Naschkatzen.', '1.Die Sahne schlagen. Quark, Mascarpone, Zucker und Vanillezucker mischen. Die Sahne unterheben.\r\n\r\n2.In einer ausreichend hohen eckigen oder runden Schüssel mit drei, vier EL Creme den Boden bedecken. Darauf eine Schicht Spekulatius, ganz oder in Stücke gebrochen, verteilen. Die Hälfte der restlichen Creme darauf verstreichen. Die gefrorenen Himbeeren darüber verteilen, diese mit dem Rest der Creme bedecken, so dass sie nicht mehr zu sehen sind. Zerbröckelten Spekulatius (Menge nach Belieben) darüber verteilen.\r\n\r\n3.Die Creme muss mindestens 4 Stunden kalt gestellt werden.\r\nVor dem Servieren kann man noch etwas Puderzucker drüber streuen.', 260, 'Eiweiß 8,96 g\r\nFett 24,55 g\r\nKohlenhydr. 39,07 g', 420, 2, 'Himbeerdessert mit Spekulatius');

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
(8, 51, 100, 'g'),
(9, 2, 1, 'Stk.'),
(9, 9, 1, 'Pr'),
(9, 10, 1, 'Pr'),
(9, 43, 1, 'Pr'),
(9, 48, 200, 'g'),
(9, 52, 125, 'g'),
(9, 53, 250, 'g'),
(9, 54, 1, 'Stk.'),
(9, 55, 75, 'g'),
(9, 56, 25, 'g'),
(9, 57, 100, 'g'),
(9, 58, 2, 'cl'),
(9, 59, 62, 'g'),
(10, 9, 1, 'Pr'),
(10, 10, 1, 'Pr'),
(10, 13, 500, 'g'),
(10, 40, 1, 'EL'),
(10, 48, 100, 'ml'),
(10, 56, 1, 'TL'),
(10, 60, 1, 'Stange'),
(10, 61, 1, 'EL'),
(10, 62, 1, 'EL'),
(10, 63, 250, 'ml'),
(10, 64, 1, 'Pck'),
(10, 65, 3, 'EL'),
(10, 96, 2, 'Stk'),
(11, 9, 1, 'Pr'),
(11, 10, 1, 'Pr'),
(11, 35, 1, 'Pr'),
(11, 45, 1, 'EL'),
(11, 67, 1, 'Pck'),
(11, 68, 1, 'Stk'),
(11, 69, 200, 'g'),
(11, 70, 2, 'Stk'),
(11, 71, 1, 'Stk'),
(11, 72, 2, 'Handvoll'),
(11, 73, 10, 'Stk'),
(11, 74, 1, 'Pr'),
(11, 75, 200, 'ml'),
(11, 76, 1, 'Pr'),
(11, 77, 1, 'EL'),
(12, 9, 1, 'Pr'),
(12, 10, 1, 'Pr'),
(12, 35, 1, 'Pr'),
(12, 48, 100, 'g'),
(12, 73, 125, 'g'),
(12, 78, 1, 'Topf'),
(12, 79, 1, 'EL'),
(12, 80, 2, 'Stk'),
(12, 81, 50, 'g'),
(12, 82, 62, 'g'),
(12, 83, 1, 'EL'),
(13, 2, 2, 'Stk'),
(13, 9, 1, 'Pr'),
(13, 10, 1, 'Pr'),
(13, 32, 1, 'Pr'),
(13, 40, 1, 'Pr'),
(13, 56, 3, 'TL'),
(13, 66, 1, 'kg'),
(13, 70, 3, 'Stk'),
(13, 77, 3, 'L'),
(13, 84, 1, 'Pr'),
(14, 45, 1, 'EL'),
(14, 85, 1, 'EL'),
(14, 86, 1, 'Stk'),
(14, 87, 2, 'Stk'),
(14, 88, 1, 'Pr'),
(14, 89, 1, 'EL'),
(14, 90, 1, 'EL'),
(15, 48, 100, 'ml'),
(15, 91, 125, 'g'),
(15, 92, 125, 'g'),
(15, 93, 1, 'Pck'),
(15, 94, 175, 'g'),
(15, 95, 125, 'g'),
(15, 97, 62, 'g');

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