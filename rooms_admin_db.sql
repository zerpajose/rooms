-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2020 a las 23:23:04
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rooms_admin_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contract`
--

CREATE TABLE `contract` (
  `id_contract` int(255) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(65,0) NOT NULL,
  `id_room` int(255) NOT NULL,
  `id_tenant` int(255) NOT NULL,
  `id_landlord` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `contract`
--

INSERT INTO `contract` (`id_contract`, `type`, `start_date`, `end_date`, `price`, `id_room`, `id_tenant`, `id_landlord`) VALUES
(1, '6meses', '2020-08-11', '2021-02-10', '25', 1, 2, 1),
(2, '6meses', '2020-06-30', '2020-12-29', '20', 2, 3, 1),
(3, '1year', '2020-07-15', '2021-07-14', '20', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `furniture`
--

CREATE TABLE `furniture` (
  `id_furniture` int(255) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(255) NOT NULL,
  `id_room` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `furniture`
--

INSERT INTO `furniture` (`id_furniture`, `type`, `name`, `quantity`, `id_room`) VALUES
(1, 'curtain', 'cortina cocina', 1, 1),
(2, 'curtain', 'cortina bano', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `landlord`
--

CREATE TABLE `landlord` (
  `id_landlord` int(255) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `landlord`
--

INSERT INTO `landlord` (`id_landlord`, `first_name`, `last_name`, `identification`, `phone`, `email`) VALUES
(1, 'Elizabeth', 'Montoya', 'V5361682', '04248471379', 'elizabeth.montoya7777@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `room`
--

CREATE TABLE `room` (
  `id_room` int(255) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `room`
--

INSERT INTO `room` (`id_room`, `type`, `number`, `size`, `address`) VALUES
(1, 'G', '1', '3x5', 'Urb El Tamarindo Sec 02 Vda 11 # 01-1'),
(2, 'M', '2', '3x4', 'Urb El Tamarindo Sec 02 Vda 11 # 01-2'),
(3, 'M', '3', '3x4', 'Urb El Tamarindo Sec 02 Vda 11 # 01-3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tenant`
--

CREATE TABLE `tenant` (
  `id_tenant` int(255) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tenant`
--

INSERT INTO `tenant` (`id_tenant`, `first_name`, `last_name`, `identification`, `phone`, `email`) VALUES
(1, 'Jose', 'Zerpa', 'V18145368', '04144628664', 'zjose88@gmail.com'),
(2, 'Juan', 'Soto', 'V13145368', '04144934006', 'jsototo79@gmail.com'),
(3, 'Josman', 'Zerpa', 'V13640317', '04148964545', 'josmanz@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `fk_to_id_tenant` (`id_tenant`),
  ADD KEY `fk_to_id_landlord` (`id_landlord`),
  ADD KEY `fk_to_room` (`id_room`);

--
-- Indices de la tabla `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`id_furniture`),
  ADD KEY `fk_to_id_room` (`id_room`);

--
-- Indices de la tabla `landlord`
--
ALTER TABLE `landlord`
  ADD PRIMARY KEY (`id_landlord`);

--
-- Indices de la tabla `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id_room`);

--
-- Indices de la tabla `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`id_tenant`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contract`
--
ALTER TABLE `contract`
  MODIFY `id_contract` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `furniture`
--
ALTER TABLE `furniture`
  MODIFY `id_furniture` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `landlord`
--
ALTER TABLE `landlord`
  MODIFY `id_landlord` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `room`
--
ALTER TABLE `room`
  MODIFY `id_room` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tenant`
--
ALTER TABLE `tenant`
  MODIFY `id_tenant` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `fk_to_id_landlord` FOREIGN KEY (`id_landlord`) REFERENCES `landlord` (`id_landlord`),
  ADD CONSTRAINT `fk_to_id_tenant` FOREIGN KEY (`id_tenant`) REFERENCES `tenant` (`id_tenant`),
  ADD CONSTRAINT `fk_to_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`);

--
-- Filtros para la tabla `furniture`
--
ALTER TABLE `furniture`
  ADD CONSTRAINT `fk_to_id_room` FOREIGN KEY (`id_room`) REFERENCES `room` (`id_room`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
