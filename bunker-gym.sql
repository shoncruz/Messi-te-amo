-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2023 a las 18:02:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bunker-gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamientos`
--

CREATE TABLE `entrenamientos` (
  `ID_ENTRENAMIENTO` int(11) NOT NULL,
  `NOMBRE_ENTRENAMIENTO` varchar(50) DEFAULT NULL,
  `TIPO_ENTRENAMIENTO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `ID_HORARIO` int(11) NOT NULL,
  `DIA_SEMANA` varchar(15) DEFAULT NULL,
  `HORA_INICIO` time DEFAULT NULL,
  `HORA_FIN` time DEFAULT NULL,
  `ID_ENTRENAMIENTO` int(11) DEFAULT NULL,
  `PROFESOR_A_CARGO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `ID_PROFESOR` int(11) NOT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ESPECIALIDAD` varchar(50) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinasprofesores`
--

CREATE TABLE `rutinasprofesores` (
  `ID_RUTINA_PROFESOR` int(11) NOT NULL,
  `ID_PROFESOR` int(11) DEFAULT NULL,
  `ID_ENTRENAMIENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `DNI` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `CONTRASEÑA` varchar(50) DEFAULT NULL,
  `TIPO_USUARIO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrenamientos`
--
ALTER TABLE `entrenamientos`
  ADD PRIMARY KEY (`ID_ENTRENAMIENTO`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`ID_HORARIO`),
  ADD KEY `ID_ENTRENAMIENTO` (`ID_ENTRENAMIENTO`),
  ADD KEY `PROFESOR_A_CARGO` (`PROFESOR_A_CARGO`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`ID_PROFESOR`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `rutinasprofesores`
--
ALTER TABLE `rutinasprofesores`
  ADD PRIMARY KEY (`ID_RUTINA_PROFESOR`),
  ADD KEY `ID_PROFESOR` (`ID_PROFESOR`),
  ADD KEY `ID_ENTRENAMIENTO` (`ID_ENTRENAMIENTO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`ID_ENTRENAMIENTO`) REFERENCES `entrenamientos` (`ID_ENTRENAMIENTO`),
  ADD CONSTRAINT `horarios_ibfk_2` FOREIGN KEY (`PROFESOR_A_CARGO`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `profesores_ibfk_1` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `rutinasprofesores`
--
ALTER TABLE `rutinasprofesores`
  ADD CONSTRAINT `rutinasprofesores_ibfk_1` FOREIGN KEY (`ID_PROFESOR`) REFERENCES `profesores` (`ID_PROFESOR`),
  ADD CONSTRAINT `rutinasprofesores_ibfk_2` FOREIGN KEY (`ID_ENTRENAMIENTO`) REFERENCES `entrenamientos` (`ID_ENTRENAMIENTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
