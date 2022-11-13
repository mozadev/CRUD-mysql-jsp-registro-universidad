-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2022 a las 04:26:23
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cesar_moza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `ID` int(10) NOT NULL,
  `APELLIDO` varchar(120) NOT NULL,
  `NOMBRE` varchar(120) NOT NULL,
  `GENERO` varchar(120) NOT NULL,
  `OCUPACION` varchar(120) NOT NULL,
  `CURRICULO` varchar(120) NOT NULL,
  `EDAD` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`ID`, `APELLIDO`, `NOMBRE`, `GENERO`, `OCUPACION`, `CURRICULO`, `EDAD`) VALUES
(107, 'moza', 'cesar', 'Masculino', 'Ingeniero', 'Estudios', 24),
(108, 'Rodriguez', 'Julio', 'Masculino', 'Ingeniero', 'Estudios', 37),
(109, 'Mestanza', 'Yesenia', 'Femenino', 'Doctor', 'Estudios', 23),
(110, 'Coronado', 'Juan', 'Masculino', 'Administrador', 'Estudios', 29),
(111, 'Bautista', 'Eduardo', 'Masculino', 'Ingeniero', 'Estudios', 47),
(112, 'Medina', 'Rosa', 'Femenino', 'Ingeniero', 'Estudios', 27),
(113, 'Carranza', 'Noemi', 'Femenino', 'Ingeniero', 'Estudios', 35),
(114, 'Alvares', 'Raul', 'Masculino', 'Administrador', 'Estudios', 32),
(115, 'Torres', 'Gerardo', 'Masculino', 'Ingeniero', 'Estudios', 20),
(116, 'Alva', 'Ana', 'Femenino', 'Ingeniero', 'Estudios', 40),
(117, 'Zuniga', 'Rolando', 'Masculino', 'Administrador', 'Estudios', 46),
(118, 'Ariaga', 'Fabiola', 'Femenino', 'Ingeniero', 'Estudios', 34);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12122;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
