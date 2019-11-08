-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2019 at 01:04 AM
-- Server version: 5.6.13
-- PHP Version: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `e_sports`
--
CREATE DATABASE IF NOT EXISTS `e_sports` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `e_sports`;

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `preco` int(10) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `produto`
--

INSERT INTO `produto` (`id`, `nome`, `marca`, `preco`, `imagem`) VALUES
(1, 'Moletom ', 'Nike', 400, 'img1.jpg'),
(3, 'Camiseta', 'Adidas', 120, 'img3.jpg'),
(5, 'Polo', 'Calvin Klein', 220, 'img5.jpg'),
(6, 'TÃ?Âªnis ', 'Puma', 240, 'img6.jpg'),
(9, 'Meia', 'Duo', 20, 'img9.jpg'),
(10, 'Imagem', 'Foto', 321, 'img10.jpg'),
(11, 'Foto', 'Imagem', 340, 'img11.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
