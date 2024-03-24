-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 24 mars 2024 à 14:01
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `box_composition`
--

CREATE TABLE `box_composition` (
  `box_composition_id` int(11) NOT NULL,
  `relay_id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `relay_nb` int(11) NOT NULL,
  `sensor_nb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `box_composition`
--

INSERT INTO `box_composition` (`box_composition_id`, `relay_id`, `sensor_id`, `relay_nb`, `sensor_nb`) VALUES
(1, 1, 1, 1, 2),
(2, 2, 2, 2, 3),
(3, 3, 3, 3, 2),
(4, 4, 4, 2, 1),
(5, 2, 1, 1, 2),
(6, 3, 2, 3, 3),
(7, 4, 3, 2, 2),
(8, 1, 4, 1, 1),
(9, 2, 1, 2, 3),
(10, 3, 2, 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `cart_wheels_color` enum('red','green','grey') NOT NULL,
  `cart_wheels_fixed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_wheels_color`, `cart_wheels_fixed`) VALUES
(1, 'green', 1),
(2, 'grey', 0),
(3, 'red', 1),
(4, 'green', 0),
(5, 'grey', 1),
(6, 'red', 0),
(7, 'green', 1),
(8, 'grey', 0),
(9, 'red', 1),
(10, 'green', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_time` date NOT NULL,
  `order_completion_time` time NOT NULL,
  `order_status` enum('not_started','ongoing','done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`order_id`, `order_time`, `order_completion_time`, `order_status`) VALUES
(1, '2024-03-07', '00:30:00', 'not_started'),
(2, '2024-03-08', '00:45:00', 'ongoing'),
(3, '2024-03-09', '00:15:00', 'done'),
(4, '2024-03-10', '00:20:00', 'done');

-- --------------------------------------------------------

--
-- Structure de la table `order_content`
--

CREATE TABLE `order_content` (
  `order_content_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_nb` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `order_content`
--

INSERT INTO `order_content` (`order_content_id`, `order_id`, `product_nb`, `product_id`) VALUES
(1, 1, 3, 1),
(2, 2, 2, 2),
(3, 3, 4, 3),
(4, 4, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `box_composition_id` int(11) DEFAULT NULL,
  `product_type` enum('cart','box') NOT NULL,
  `cart_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`product_id`, `box_composition_id`, `product_type`, `cart_id`) VALUES
(1, NULL, 'cart', 1),
(2, NULL, 'cart', 2),
(3, NULL, 'cart', 3),
(4, NULL, 'cart', 4),
(5, NULL, 'cart', 5),
(6, NULL, 'cart', 6),
(7, NULL, 'cart', 7),
(8, NULL, 'cart', 8),
(9, NULL, 'cart', 9),
(10, NULL, 'cart', 10),
(11, 1, 'box', NULL),
(12, 2, 'box', NULL),
(13, 3, 'box', NULL),
(14, 4, 'box', NULL),
(15, 5, 'box', NULL),
(16, 6, 'box', NULL),
(17, 7, 'box', NULL),
(18, 8, 'box', NULL),
(19, 9, 'box', NULL),
(20, 10, 'box', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `relay`
--

CREATE TABLE `relay` (
  `relay_id` int(11) NOT NULL,
  `relay_type` enum('mechatronic_parts','lamps') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `relay`
--

INSERT INTO `relay` (`relay_id`, `relay_type`) VALUES
(1, 'mechatronic_parts'),
(2, 'lamps'),
(3, 'mechatronic_parts'),
(4, 'lamps'),
(5, 'mechatronic_parts'),
(6, 'lamps'),
(7, 'mechatronic_parts'),
(8, 'lamps'),
(9, 'mechatronic_parts'),
(10, 'lamps'),
(11, 'mechatronic_parts'),
(12, 'lamps');

-- --------------------------------------------------------

--
-- Structure de la table `sensor`
--

CREATE TABLE `sensor` (
  `sensor_id` int(11) NOT NULL,
  `sensor_type` enum('Temperature','Humidity','C02','Light','Smoke','Pressure') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sensor`
--

INSERT INTO `sensor` (`sensor_id`, `sensor_type`) VALUES
(1, 'Temperature'),
(2, 'Humidity'),
(3, 'C02'),
(4, 'Light'),
(5, 'Smoke'),
(6, 'Pressure');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `box_composition`
--
ALTER TABLE `box_composition`
  ADD PRIMARY KEY (`box_composition_id`),
  ADD KEY `fk_sensor_id` (`sensor_id`),
  ADD KEY `fk_relay_id` (`relay_id`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Index pour la table `order_content`
--
ALTER TABLE `order_content`
  ADD PRIMARY KEY (`order_content_id`),
  ADD KEY `fk_order_id` (`order_id`),
  ADD KEY `fk_product_id` (`product_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_cart_id` (`cart_id`),
  ADD KEY `fk_box_composition_id` (`box_composition_id`);

--
-- Index pour la table `relay`
--
ALTER TABLE `relay`
  ADD PRIMARY KEY (`relay_id`);

--
-- Index pour la table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`sensor_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `box_composition`
--
ALTER TABLE `box_composition`
  ADD CONSTRAINT `fk_relay_id` FOREIGN KEY (`relay_id`) REFERENCES `relay` (`relay_id`),
  ADD CONSTRAINT `fk_sensor_id` FOREIGN KEY (`sensor_id`) REFERENCES `sensor` (`sensor_id`);

--
-- Contraintes pour la table `order_content`
--
ALTER TABLE `order_content`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_box_composition_id` FOREIGN KEY (`box_composition_id`) REFERENCES `box_composition` (`box_composition_id`),
  ADD CONSTRAINT `fk_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
