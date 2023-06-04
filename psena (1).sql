-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2023 a las 21:54:15
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `psena`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `Id_Facultad` int NOT NULL,
  `NombreFacultad` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`Id_Facultad`, `NombreFacultad`) VALUES
(1, 'Ciencias de la Salud'),
(2, 'Ingenierias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `Id_Programa` int NOT NULL,
  `NombrePrograma` varchar(30) NOT NULL,
  `Id_Facultad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`Id_Programa`, `NombrePrograma`, `Id_Facultad`) VALUES
(10, 'Enfermeria', 1),
(20, 'Ingenieria de Sistemas', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `Id` int NOT NULL,
  `Documento` int NOT NULL,
  `Nombres` text NOT NULL,
  `Rol` text NOT NULL,
  `Id_Programa` int NOT NULL,
  `NombrePrograma` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`Id`, `Documento`, `Nombres`, `Rol`, `Id_Programa`, `NombrePrograma`, `Correo`) VALUES
(1, 1023558965, 'Rafael Zapata', 'Estudiante', 10, 'Enfermeria', 'rafael.zapata50@misena.edu.co'),
(2, 52346845, 'Carolina Poveda', 'Docente', 20, 'Ingenieria de Sistemas', 'Caroli@correo.com'),
(3, 52734512, 'Ricardo Cruz', 'Estudiante', 10, 'Enfermeria', 'rr@correo.com'),
(4, 52742365, 'yohana cortez', 'Administrativo', 10, 'Enfermeria', 'yr@correo.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`Id_Facultad`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`Id_Programa`),
  ADD KEY `Id_Facultad` (`Id_Facultad`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Programa` (`Id_Programa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `programa_ibfk_1` FOREIGN KEY (`Id_Facultad`) REFERENCES `facultad` (`Id_Facultad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`Id_Programa`) REFERENCES `programa` (`Id_Programa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
