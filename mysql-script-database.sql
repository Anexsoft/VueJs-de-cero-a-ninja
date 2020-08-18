-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.14 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para kodoticinema
CREATE DATABASE IF NOT EXISTS `kodoticinema` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `kodoticinema`;

-- Volcando estructura para tabla kodoticinema.cinemas
CREATE TABLE IF NOT EXISTS `cinemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla kodoticinema.cinemas: 4 rows
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` (`id`, `name`, `price`, `createdAt`, `updatedAt`) VALUES
	(1, 'KODOTI Star Zona Norte', 17.00, '2019-05-19', '2019-05-19'),
	(2, 'KODOTI Stars Zona Sur', 18.00, '2019-05-19', '2019-05-19'),
	(3, 'KODOTI Stars Zona Este', 24.00, '2019-05-19', '2019-05-19'),
	(4, 'KODOTI Stars Zona Oeste', 21.50, '2019-05-19', '2019-05-19');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;

-- Volcando estructura para tabla kodoticinema.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `description` text COLLATE utf8_spanish_ci NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla kodoticinema.movies: 4 rows
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `image`, `name`, `description`, `createdAt`, `updatedAt`) VALUES
	(1, '/static/terminator.jpg', 'Terminator', 'Un asesino cibernético del futuro es enviado a Los Ángeles, para matar a la mujer que procreará a un líder.', '2019-05-18', '2019-05-18'),
	(2, '/static/dragonball.jpg', 'Dragon Ball Super: Broly', 'Después de disputarse el Torneo de la Fuerza, la Tierra se encuentra en paz. Goku al darse cuenta de que en el universo aún hay personas extremadamente fuertes, continúa entrenando para volverse más fuerte. Pero un día, Freezer aparece en la Tierra con un misterioso saiyajin llamado Broly, el cuál enfrenta a Goku y Vegeta.', '2019-05-18', '2019-05-18'),
	(3, '/static/profesional.jpg', 'El perfecto asesino', 'Mathilda es una niña que no se lleva bien con su familia, excepto con su hermano pequeño. Su padre es un narcotraficante que hace negocios con Stan, un corrupto agente de la D.E.A. Un día Stan mata a su familia y Mathilda se refugia en casa de Léon, un solitario y misterioso vecino que resulta ser un asesino a sueldo, pero hará un pacto con él: ella se encargará de las tareas domésticas y le enseñará a leer a Léon y éste le enseñará a disparar para poder vengarse de la muerte de su hermano.', '2019-05-18', '2019-05-18'),
	(4, '/static/johnwick.jpg', 'John Wick', 'John Wick es una película de acción estadounidense de 2014, dirigida por David Leitch y Chad Stahelski.', '2019-05-18', '2019-05-18');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Volcando estructura para tabla kodoticinema.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `scheduleId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla kodoticinema.orders: 1 rows
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `userId`, `scheduleId`, `quantity`, `total`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, 4, 17.00, '2019-05-21', '2019-05-21');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Volcando estructura para tabla kodoticinema.schedules
CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieId` int(11) NOT NULL,
  `cinemaId` int(11) NOT NULL,
  `time` VARCHAR(20) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla kodoticinema.schedules: 66 rows
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` (`id`, `movieId`, `cinemaId`, `time`, `createdAt`, `updatedAt`) VALUES
	(1, 1, 1, '12:00:00', '2019-05-19', '2019-05-19'),
	(3, 1, 3, '12:00:00', '2019-05-19', '2019-05-19'),
	(5, 2, 1, '12:00:00', '2019-05-19', '2019-05-19'),
	(6, 2, 2, '12:00:00', '2019-05-19', '2019-05-19'),
	(7, 2, 3, '12:00:00', '2019-05-19', '2019-05-19'),
	(8, 2, 4, '12:00:00', '2019-05-19', '2019-05-19'),
	(9, 3, 1, '12:00:00', '2019-05-19', '2019-05-19'),
	(10, 3, 2, '12:00:00', '2019-05-19', '2019-05-19'),
	(11, 3, 3, '12:00:00', '2019-05-19', '2019-05-19'),
	(12, 3, 4, '12:00:00', '2019-05-19', '2019-05-19'),
	(14, 4, 2, '12:00:00', '2019-05-19', '2019-05-19'),
	(15, 4, 3, '12:00:00', '2019-05-19', '2019-05-19'),
	(17, 1, 1, '14:00:00', '2019-05-19', '2019-05-19'),
	(18, 1, 2, '14:00:00', '2019-05-19', '2019-05-19'),
	(20, 1, 4, '14:00:00', '2019-05-19', '2019-05-19'),
	(21, 2, 1, '14:00:00', '2019-05-19', '2019-05-19'),
	(22, 2, 2, '14:00:00', '2019-05-19', '2019-05-19'),
	(23, 2, 3, '14:00:00', '2019-05-19', '2019-05-19'),
	(24, 2, 4, '14:00:00', '2019-05-19', '2019-05-19'),
	(25, 3, 1, '14:00:00', '2019-05-19', '2019-05-19'),
	(26, 3, 2, '14:00:00', '2019-05-19', '2019-05-19'),
	(27, 3, 3, '14:00:00', '2019-05-19', '2019-05-19'),
	(28, 3, 4, '14:00:00', '2019-05-19', '2019-05-19'),
	(29, 4, 1, '14:00:00', '2019-05-19', '2019-05-19'),
	(30, 4, 2, '14:00:00', '2019-05-19', '2019-05-19'),
	(31, 4, 3, '14:00:00', '2019-05-19', '2019-05-19'),
	(32, 4, 4, '14:00:00', '2019-05-19', '2019-05-19'),
	(33, 1, 1, '16:00:00', '2019-05-19', '2019-05-19'),
	(34, 1, 2, '16:00:00', '2019-05-19', '2019-05-19'),
	(35, 1, 3, '16:00:00', '2019-05-19', '2019-05-19'),
	(37, 2, 1, '16:00:00', '2019-05-19', '2019-05-19'),
	(38, 2, 2, '16:00:00', '2019-05-19', '2019-05-19'),
	(39, 2, 3, '16:00:00', '2019-05-19', '2019-05-19'),
	(41, 3, 1, '16:00:00', '2019-05-19', '2019-05-19'),
	(42, 3, 2, '16:00:00', '2019-05-19', '2019-05-19'),
	(43, 3, 3, '16:00:00', '2019-05-19', '2019-05-19'),
	(44, 3, 4, '16:00:00', '2019-05-19', '2019-05-19'),
	(45, 4, 1, '16:00:00', '2019-05-19', '2019-05-19'),
	(46, 4, 2, '16:00:00', '2019-05-19', '2019-05-19'),
	(47, 4, 3, '16:00:00', '2019-05-19', '2019-05-19'),
	(48, 4, 4, '16:00:00', '2019-05-19', '2019-05-19'),
	(49, 1, 1, '18:00:00', '2019-05-19', '2019-05-19'),
	(50, 1, 2, '18:00:00', '2019-05-19', '2019-05-19'),
	(51, 1, 3, '18:00:00', '2019-05-19', '2019-05-19'),
	(52, 1, 4, '18:00:00', '2019-05-19', '2019-05-19'),
	(53, 2, 1, '18:00:00', '2019-05-19', '2019-05-19'),
	(54, 2, 2, '18:00:00', '2019-05-19', '2019-05-19'),
	(55, 2, 3, '18:00:00', '2019-05-19', '2019-05-19'),
	(56, 2, 4, '18:00:00', '2019-05-19', '2019-05-19'),
	(57, 3, 1, '18:00:00', '2019-05-19', '2019-05-19'),
	(59, 3, 3, '18:00:00', '2019-05-19', '2019-05-19'),
	(61, 4, 1, '18:00:00', '2019-05-19', '2019-05-19'),
	(63, 4, 3, '18:00:00', '2019-05-19', '2019-05-19'),
	(64, 4, 4, '18:00:00', '2019-05-19', '2019-05-19'),
	(65, 1, 1, '20:00:00', '2019-05-19', '2019-05-19'),
	(66, 1, 2, '20:00:00', '2019-05-19', '2019-05-19'),
	(68, 1, 4, '20:00:00', '2019-05-19', '2019-05-19'),
	(71, 2, 3, '20:00:00', '2019-05-19', '2019-05-19'),
	(73, 3, 1, '20:00:00', '2019-05-19', '2019-05-19'),
	(74, 3, 2, '20:00:00', '2019-05-19', '2019-05-19'),
	(75, 3, 3, '20:00:00', '2019-05-19', '2019-05-19'),
	(76, 3, 4, '20:00:00', '2019-05-19', '2019-05-19'),
	(77, 4, 1, '20:00:00', '2019-05-19', '2019-05-19'),
	(78, 4, 2, '20:00:00', '2019-05-19', '2019-05-19'),
	(79, 4, 3, '20:00:00', '2019-05-19', '2019-05-19'),
	(80, 4, 4, '20:00:00', '2019-05-19', '2019-05-19');
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;

-- Volcando estructura para tabla kodoticinema.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `isAdmin` tinyint(4) NOT NULL DEFAULT '0',
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla kodoticinema.users: 7 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `isAdmin`, `createdAt`, `updatedAt`) VALUES
	(1, 'Eduardo', 'eduardo@kodoti.com', '123456', 1, '2019-05-19', '2019-05-19'),
	(2, 'Susana', 'susana@gmail.com', '123456', 0, '2019-05-19', '2019-05-19'),
	(3, 'Alonso', 'alonso@gmail.com', '123456', 0, '2019-05-19', '2019-05-19'),
	(4, 'José', 'jose@gmail.com', '123456', 0, '2019-05-19', '2019-05-19'),
	(5, 'Cesar', 'cesar@gmail.com', '123456', 0, '2019-05-19', '2019-05-19'),
	(6, 'Sandra', 'sandra@gmail.com', '123456', 0, '2019-05-19', '2019-05-19'),
	(7, 'Carla', 'carla@gmail.com', '123456', 0, '2019-05-19', '2019-05-19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
