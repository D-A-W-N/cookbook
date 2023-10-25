-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Oct 25, 2023 at 10:23 AM
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
(1, '', 'This is a new description', '', 0, '', '', 0, 0, ''),
(2, '', 'This is a new description', '', 0, '', '', 0, 0, ''),
(3, '', 'This is a new description', '', 0, '', '', 0, 0, ''),
(4, 'Test Recipe', 'Test Description', 'Test Instructions', 10, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'Test Picture'),
(5, 'Test Recipe', 'Test Description', 'Test Instructions', 10, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'Test Picture'),
(6, 'Test Recipe', 'Test Description', 'Test Instructions', 10, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'Test Picture'),
(7, 'Test Recipe', 'Test Description', 'Test Instructions', 10, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'Test Picture'),
(8, 'Test Recipe', 'Test Description', 'Test Instructions', 10, 'Test Preparation Type', 'Test Nutrition', 100, 1, 'Test Picture');

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
