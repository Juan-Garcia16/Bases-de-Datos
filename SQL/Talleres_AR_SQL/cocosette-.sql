-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2025 a las 16:51:01
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
-- Base de datos: `cocosette`
--
CREATE DATABASE IF NOT EXISTS `cocosette` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci;
USE `cocosette`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `NUMCLIE` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `REPCLIE` int(11) DEFAULT NULL,
  `LIMITECREDITO` bigint(20) DEFAULT NULL COMMENT 'cupo de credito'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`NUMCLIE`, `NOMBRE`, `REPCLIE`, `LIMITECREDITO`) VALUES
(2101, 'LUIS GARCIA ANTON', 106, 65000),
(2102, 'ALVARO RODRIGUEZ', 101, 1000000),
(2103, 'JAIME LLORENZ', 105, 50000),
(2105, 'ANTONIO CANALES', 101, 1000000),
(2106, 'JUAN SUAREZ', 102, 65000),
(2107, 'JULIAN LOPEZ', 110, 35000),
(2108, 'JULIA ANTEQUERA', 109, 55000),
(2109, 'ALBERTO JUANES', 103, 1000000),
(2111, 'CRISTOBAL GARCIA', 103, 1000000),
(2112, 'MARIA SILVA', 108, 50000),
(2113, 'LUISA MARON', 104, 1000000),
(2114, 'CRISTINA BULINI', 102, 20000),
(2115, 'VICENTE MARTINEZ', 101, 1000000),
(2117, 'CARLOS TENA', 106, 35000),
(2118, 'JUNIPERO ALVAREZ', 108, 60000),
(2119, 'SALOMON BUENO', 109, 25000),
(2120, 'JUAN MALO', 102, 50000),
(2121, 'VICENTE RIOS', 103, 1000000),
(2122, 'JOSE MARCHANTE', 105, 30000),
(2123, 'JOSE LIBROS', 102, 40000),
(2124, 'JUAN BOLTO', 107, 40000),
(5114, 'ARGEMIRO VALENCIA', 110, 50000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `NUMEMP` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `EDAD` int(11) NOT NULL DEFAULT 0,
  `OFICINA` int(11) NOT NULL,
  `TITULO` varchar(20) NOT NULL,
  `CONTRATO` date NOT NULL,
  `JEFE` int(11) DEFAULT NULL,
  `CUOTA` int(11) DEFAULT 0,
  `VENTAS` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`NUMEMP`, `NOMBRE`, `EDAD`, `OFICINA`, `TITULO`, `CONTRATO`, `JEFE`, `CUOTA`, `VENTAS`) VALUES
(101, 'ANTONIO VIGUER', 45, 12, '', '2006-10-20', 104, 30000, 305000),
(102, 'ALVARO JAUMES', 48, 21, '', '2006-12-10', 108, 7250, 474000),
(103, 'JUAN ROVIRA', 29, 12, 'REPRESENTANTE', '1997-03-10', 104, 30000, 0),
(104, 'JOSE GONZALEZ', 33, 12, 'DIR VENTAS', '1997-05-19', 106, 30000, 0),
(105, 'VICENTE PANTALLA', 37, 13, 'REPRESENTANTE', '1998-02-12', 104, 3500, 0),
(106, 'LUIS ANTONIO', 52, 11, 'DIR GENERAL', '1998-06-14', 0, 5750, 299000),
(107, 'JORGE GUTIERREZ', 49, 22, 'REPRESENTANTE', '1998-11-14', 108, 3000, 186000),
(108, 'ANA BUSTAMANTE', 62, 21, 'DIR VENTAS', '1999-10-12', 106, 7250, 361000),
(109, 'MARIA SUNTA JIMENEZ', 31, 11, '', '1999-10-12', 106, 5750, 392000),
(110, 'JUAN VICTOR', 41, 22, '', '1990-01-13', 104, 0, 76000),
(200, 'JULIAN LOPEZ', 30, 0, '', '2016-01-23', 0, 3500000, 0),
(220, 'Juan Antonio Lopez', 30, 0, 'rep ventas', '2001-06-23', NULL, 350000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE `oficinas` (
  `OFICINA` int(11) NOT NULL,
  `CIUDAD` varchar(20) NOT NULL,
  `REGION` varchar(20) NOT NULL,
  `DIR` int(11) DEFAULT NULL,
  `OBJETIVO` int(11) DEFAULT 0,
  `VENTAS` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `oficinas`
--

INSERT INTO `oficinas` (`OFICINA`, `CIUDAD`, `REGION`, `DIR`, `OBJETIVO`, `VENTAS`) VALUES
(11, 'CALI', 'OESTE', 106, 575000, 693000),
(12, 'IBAGUE', 'ESTE', 104, 3000000, 735000),
(13, 'ARMENIA', 'ESTE', 105, 350000, 368000),
(21, 'BARRANQUILLA', 'NORTE', 108, 725000, 836000),
(22, 'POPAYAN', 'OESTE', 108, 300000, 186000),
(23, 'BOGOTA', 'CENTRO', 108, 900000, 340000),
(24, 'PEREIRA', 'CENTRO', 108, 750000, 150000),
(26, 'CARTAGENA', 'NORTE', NULL, 400000, 0),
(28, 'CHOCO', 'ESTE', NULL, 90000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `CODIGO` int(11) NOT NULL,
  `NUMPEDIDO` int(11) DEFAULT 0,
  `FECHAPEDIDO` date DEFAULT NULL,
  `CLIE` varchar(25) DEFAULT NULL,
  `REP` varchar(25) DEFAULT NULL,
  `FAB` varchar(25) DEFAULT NULL,
  `PRODUCTO` varchar(25) DEFAULT NULL,
  `CANT` int(11) DEFAULT 0,
  `IMPORTE` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`CODIGO`, `NUMPEDIDO`, `FECHAPEDIDO`, `CLIE`, `REP`, `FAB`, `PRODUCTO`, `CANT`, `IMPORTE`) VALUES
(1, 110036, '1997-01-02', '2107', '110', 'ACI', '4100Z', 9, 22500),
(2, 110036, '1997-01-02', '2117', '106', 'REI', '2A44I', 7, 31500),
(3, 112963, '1997-05-10', '2103', '105', 'ACI', '41004', 28, 3276),
(4, 112968, '1990-01-11', '2102', '101', 'ACI', '41004', 34, 3978),
(5, 112975, '1997-02-11', '2111', '103', 'REI', '2A44G', 6, 2100),
(6, 112979, '1989-10-12', '2114', '108', 'ACI', '4100Z', 6, 15000),
(7, 112983, '1997-05-10', '2103', '105', 'ACI', '41004', 6, 702),
(8, 112987, '1997-01-01', '2103', '105', 'ACI', '4100Y', 11, 27500),
(9, 112989, '1997-12-10', '2101', '106', 'FEA', '114', 6, 1458),
(10, 112992, '1990-04-15', '2118', '108', 'ACI', '41002', 10, 760),
(11, 112993, '1997-03-10', '2106', '102', 'REI', '2A45C', 24, 1896),
(12, 112997, '1997-04-04', '2124', '107', 'BIC', '41003', 1, 652),
(13, 113003, '1997-02-05', '2108', '109', 'IMM', '779C', 3, 5625),
(14, 113007, '1997-01-01', '2112', '108', 'IMM', '773C', 3, 2925),
(15, 113012, '1997-05-05', '2111', '105', 'ACI', '41003', 35, 3745),
(16, 113013, '1997-08-06', '2118', '108', 'BIC', '41003', 1, 652),
(17, 113024, '1997-07-04', '2114', '108', 'QSA', 'XK47', 20, 7100),
(18, 113027, '1997-02-05', '2103', '105', 'ACI', '41002', 54, 4104),
(19, 113034, '1997-11-05', '2107', '110', 'REI', '2A45C', 8, 632),
(20, 113042, '1997-01-01', '2113', '101', 'REI', '2A44R', 5, 22500),
(21, 113045, '1997-07-02', '2112', '108', 'REI', '2A44R', 10, 45000),
(22, 113048, '1997-02-02', '2120', '102', 'IMM', '779C', 2, 3750),
(23, 113049, '1997-04-04', '2118', '108', 'QSA', 'XK47', 2, 776),
(24, 113051, '1997-07-06', '2118', '108', 'QSA', 'XK47', 4, 1420),
(25, 113055, '1999-04-01', '2108', '101', 'ACI', '4100X', 6, 150),
(26, 113057, '1997-11-01', '2111', '103', 'ACI', '4100X', 24, 600),
(27, 113058, '1989-07-04', '2108', '109', 'FEA', '112', 10, 1480),
(28, 113062, '1997-07-04', '2124', '107', 'BIC', '41003', 10, 2430),
(29, 113065, '1997-06-03', '2106', '102', 'QSA', 'XK47', 6, 2130),
(30, 113069, '1997-08-01', '2109', '107', 'IMM', '773C', 22, 31350);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IDFAB` varchar(5) NOT NULL,
  `IDPRODUCTO` varchar(25) NOT NULL,
  `DESCRIPCION` varchar(20) NOT NULL,
  `PRECIO` int(11) NOT NULL,
  `EXISTENCIAS` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IDFAB`, `IDPRODUCTO`, `DESCRIPCION`, `PRECIO`, `EXISTENCIAS`) VALUES
('ACI', '41001', 'ARANDELA', 58, 277),
('ACI', '41002', 'BISAGRA', 80, 167),
('ACI', '41003', 'ART13', 112, 207),
('ACI', '41004', 'ART14', 123, 139),
('ACI', '4100X', 'JUNTA', 26, 37),
('ACI', '4100Y', 'EXTRACTOR', 2888, 25),
('ACI', '4100Z', 'MONT', 2625, 28),
('BIC', '41003', 'MANIVELA', 652, 3),
('BIC', '41089', 'RODAMIENTO', 225, 78),
('BIC', '41672', 'PLATO', 180, 0),
('FEA', '112', 'CUBO', 148, 115),
('FEA', '114', 'CUBO', 243, 15),
('IMM', '773C', 'REOSTATO', 975, 28),
('IMM', '775C', 'REOSTATO2', 1, 5),
('IMM', '779C', 'REOSTATO3', 1, 0),
('IMM', '887H', 'CAJA CLAVOS', 54, 223),
('IMM', '887P', 'PERNO', 25, 24),
('IMM', '887X', 'MANIVELA', 475, 32),
('QSA', 'XK47', 'RED', 355, 38),
('QSA', 'XK48', 'RED', 134, 203),
('QSA', 'XK48A', 'RED', 117, 37),
('REI', '2A44G', 'PAS', 117, 14),
('REI', '2A44I', 'BOMBA I', 4, 12),
('REI', '2A44R', 'BOMBA R', 4, 12),
('REI', '2A45C', 'JUNTA', 79, 210);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`NUMCLIE`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`NUMEMP`),
  ADD KEY `NUMEMP` (`NUMEMP`),
  ADD KEY `oficina1` (`OFICINA`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`OFICINA`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IDFAB`,`IDPRODUCTO`),
  ADD KEY `IDFAB` (`IDFAB`),
  ADD KEY `IDPRODUCTO` (`IDPRODUCTO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
