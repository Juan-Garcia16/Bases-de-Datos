-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 17:36:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliaria`
--
DROP DATABASE IF EXISTS `inmobiliaria`;
CREATE DATABASE IF NOT EXISTS `inmobiliaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inmobiliaria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativos`
--

CREATE TABLE `administrativos` (
  `fk_id_empleado` int(11) NOT NULL,
  `velocidad_escritura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `id_anuncio` int(11) NOT NULL,
  `fk_id_inmueble` int(11) NOT NULL,
  `fk_id_periodico` int(11) NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `coste_economico` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id_contrato` int(11) NOT NULL,
  `fk_id_inmueble` int(11) NOT NULL,
  `fk_id_inquilino` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL,
  `importe_mensual` decimal(10,2) NOT NULL CHECK (`importe_mensual` > 0),
  `metodo_pago` varchar(50) NOT NULL,
  `importe_deposito` decimal(10,2) NOT NULL CHECK (`importe_deposito` >= 0),
  `deposito_realizado` tinyint(1) NOT NULL DEFAULT 0,
  `fecha_inicio` date NOT NULL,
  `fecha_finalizacion` date NOT NULL,
  `duracion_meses` int(11) NOT NULL CHECK (`duracion_meses` between 3 and 12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

CREATE TABLE `directores` (
  `fk_id_empleado` int(11) NOT NULL,
  `fk_id_oficina` int(11) NOT NULL,
  `fecha_inicio_cargo` date NOT NULL,
  `pago_anual_vehiculo` decimal(12,2) NOT NULL,
  `bonificacion_mensual` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `fk_id_oficina` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `salario_anual` decimal(12,2) NOT NULL CHECK (`salario_anual` > 0),
  `fecha_ingreso` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `fk_id_propietario` int(11) NOT NULL,
  `nombre_comercial` varchar(50) NOT NULL,
  `tipo_empresa` varchar(50) DEFAULT NULL,
  `contacto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `id_inmueble` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `tipo_inmueble` varchar(50) NOT NULL,
  `numero_habitaciones` int(11) NOT NULL CHECK (`numero_habitaciones` > 0),
  `precio_mensual` decimal(10,2) NOT NULL CHECK (`precio_mensual` > 0),
  `fk_id_propietario` int(11) NOT NULL,
  `fk_id_empleado_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `id_inquilino` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `tipo_inmueble_preferido` varchar(50) NOT NULL,
  `importe_maximo_mensual` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `comentarios` text DEFAULT NULL,
  `fk_id_empleado_asignado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inspecciones`
--

CREATE TABLE `inspecciones` (
  `id_inspeccion` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL,
  `fk_id_inmueble` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `id_oficina` int(11) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fax` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parientes`
--

CREATE TABLE `parientes` (
  `id_pariente` int(11) NOT NULL,
  `fk_id_empleado` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `relacion` varchar(20) DEFAULT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `particulares`
--

CREATE TABLE `particulares` (
  `fk_id_propietario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicos`
--

CREATE TABLE `periodicos` (
  `id_periodico` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `contacto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `id_propietario` int(11) NOT NULL,
  `direccion` varchar(120) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisores`
--

CREATE TABLE `supervisores` (
  `fk_id_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id_visita` int(11) NOT NULL,
  `fk_id_inmueble` int(11) NOT NULL,
  `fk_id_inquilino` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `comentarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD PRIMARY KEY (`fk_id_empleado`);

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`id_anuncio`),
  ADD KEY `fk_anuncios_inmuebles` (`fk_id_inmueble`),
  ADD KEY `fk_anuncios_periodicos` (`fk_id_periodico`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `fk_contratos_inmuebles` (`fk_id_inmueble`),
  ADD KEY `fk_contratos_inquilinos` (`fk_id_inquilino`),
  ADD KEY `fk_contratos_empleados` (`fk_id_empleado`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`fk_id_empleado`),
  ADD UNIQUE KEY `fk_id_oficina` (`fk_id_oficina`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `fk_empleados_oficinas` (`fk_id_oficina`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`fk_id_propietario`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`id_inmueble`),
  ADD KEY `fk_inmuebles_propietarios` (`fk_id_propietario`),
  ADD KEY `fk_inmuebles_empleados` (`fk_id_empleado_responsable`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`id_inquilino`),
  ADD KEY `fk_inquilinos_empleados` (`fk_id_empleado_asignado`);

--
-- Indices de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD PRIMARY KEY (`id_inspeccion`),
  ADD KEY `fk_inspecciones_empleados` (`fk_id_empleado`),
  ADD KEY `fk_inspecciones_inmuebles` (`fk_id_inmueble`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`id_oficina`);

--
-- Indices de la tabla `parientes`
--
ALTER TABLE `parientes`
  ADD PRIMARY KEY (`id_pariente`),
  ADD UNIQUE KEY `fk_id_empleado` (`fk_id_empleado`);

--
-- Indices de la tabla `particulares`
--
ALTER TABLE `particulares`
  ADD PRIMARY KEY (`fk_id_propietario`);

--
-- Indices de la tabla `periodicos`
--
ALTER TABLE `periodicos`
  ADD PRIMARY KEY (`id_periodico`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`id_propietario`);

--
-- Indices de la tabla `supervisores`
--
ALTER TABLE `supervisores`
  ADD PRIMARY KEY (`fk_id_empleado`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id_visita`),
  ADD KEY `fk_visitas_inmuebles` (`fk_id_inmueble`),
  ADD KEY `fk_visitas_inquilinos` (`fk_id_inquilino`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `id_anuncio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `id_inmueble` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  MODIFY `id_inquilino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  MODIFY `id_inspeccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  MODIFY `id_oficina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parientes`
--
ALTER TABLE `parientes`
  MODIFY `id_pariente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodicos`
--
ALTER TABLE `periodicos`
  MODIFY `id_periodico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `id_propietario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativos`
--
ALTER TABLE `administrativos`
  ADD CONSTRAINT `fk_administrativos_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `fk_anuncios_inmuebles` FOREIGN KEY (`fk_id_inmueble`) REFERENCES `inmuebles` (`id_inmueble`),
  ADD CONSTRAINT `fk_anuncios_periodicos` FOREIGN KEY (`fk_id_periodico`) REFERENCES `periodicos` (`id_periodico`);

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `fk_contratos_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_contratos_inmuebles` FOREIGN KEY (`fk_id_inmueble`) REFERENCES `inmuebles` (`id_inmueble`),
  ADD CONSTRAINT `fk_contratos_inquilinos` FOREIGN KEY (`fk_id_inquilino`) REFERENCES `inquilinos` (`id_inquilino`);

--
-- Filtros para la tabla `directores`
--
ALTER TABLE `directores`
  ADD CONSTRAINT `fk_directores_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_directores_oficinas` FOREIGN KEY (`fk_id_oficina`) REFERENCES `oficinas` (`id_oficina`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `fk_empleados_oficinas` FOREIGN KEY (`fk_id_oficina`) REFERENCES `oficinas` (`id_oficina`);

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `fk_empresas_propietarios` FOREIGN KEY (`fk_id_propietario`) REFERENCES `propietarios` (`id_propietario`);

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `fk_inmuebles_empleados` FOREIGN KEY (`fk_id_empleado_responsable`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_inmuebles_propietarios` FOREIGN KEY (`fk_id_propietario`) REFERENCES `propietarios` (`id_propietario`);

--
-- Filtros para la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD CONSTRAINT `fk_inquilinos_empleados` FOREIGN KEY (`fk_id_empleado_asignado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `inspecciones`
--
ALTER TABLE `inspecciones`
  ADD CONSTRAINT `fk_inspecciones_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `fk_inspecciones_inmuebles` FOREIGN KEY (`fk_id_inmueble`) REFERENCES `inmuebles` (`id_inmueble`);

--
-- Filtros para la tabla `parientes`
--
ALTER TABLE `parientes`
  ADD CONSTRAINT `fk_parientes_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `particulares`
--
ALTER TABLE `particulares`
  ADD CONSTRAINT `fk_particulares_propietarios` FOREIGN KEY (`fk_id_propietario`) REFERENCES `propietarios` (`id_propietario`);

--
-- Filtros para la tabla `supervisores`
--
ALTER TABLE `supervisores`
  ADD CONSTRAINT `fk_supervisores_empleados` FOREIGN KEY (`fk_id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `fk_visitas_inmuebles` FOREIGN KEY (`fk_id_inmueble`) REFERENCES `inmuebles` (`id_inmueble`),
  ADD CONSTRAINT `fk_visitas_inquilinos` FOREIGN KEY (`fk_id_inquilino`) REFERENCES `inquilinos` (`id_inquilino`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
