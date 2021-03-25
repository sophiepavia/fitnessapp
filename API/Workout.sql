-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 25, 2021 at 08:51 AM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cfaoptim_FitnessApp`
--

-- --------------------------------------------------------

--
-- Table structure for table `Workout`
--

CREATE TABLE `Workout` (
  `ExerciseOne` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseTwo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseThree` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseFour` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseFive` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseSize` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseLength` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ExerciseKey` int(10) NOT NULL,
  `WorkoutName` varchar(40) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
