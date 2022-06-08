-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2022 a las 22:54:50
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `stm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `id_asesor` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf32_unicode_ci DEFAULT NULL,
  `telefono` int(15) DEFAULT NULL,
  `correo` varchar(70) COLLATE utf32_unicode_ci DEFAULT NULL,
  `estacion_id_estacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `asesor`
--

INSERT INTO `asesor` (`id_asesor`, `nombre`, `telefono`, `correo`, `estacion_id_estacion`) VALUES
(35154, 'daniela bustamente', 3396532, 'daniela@recisa.com', 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor_has_venta`
--

CREATE TABLE `asesor_has_venta` (
  `asesor_id_asesor` int(11) DEFAULT NULL,
  `venta_idventa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `asesor_has_venta`
--

INSERT INTO `asesor_has_venta` (`asesor_id_asesor`, `venta_idventa`) VALUES
(35154, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `saldo_actual_caja` int(11) DEFAULT NULL,
  `fecha_saldo` varchar(10) COLLATE utf32_unicode_ci DEFAULT NULL,
  `asesor_idasesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `saldo_actual_caja`, `fecha_saldo`, `asesor_idasesor`) VALUES
(1, 105000, '03/06/2022', 35154);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacion`
--

CREATE TABLE `estacion` (
  `id_estacion` int(11) NOT NULL,
  `direccion` varchar(70) COLLATE utf32_unicode_ci DEFAULT NULL,
  `h_apertura_estacion` varchar(10) COLLATE utf32_unicode_ci DEFAULT NULL,
  `h_cierre_estacion` varchar(10) COLLATE utf32_unicode_ci DEFAULT NULL,
  `nombre_estacion` varchar(45) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `estacion`
--

INSERT INTO `estacion` (`id_estacion`, `direccion`, `h_apertura_estacion`, `h_cierre_estacion`, `nombre_estacion`) VALUES
(35, 'parque el lago', '5:00 am', '10:00 pm', 'el lago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idinventario` int(11) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `valor_tarjeta` int(11) DEFAULT NULL,
  `cantidad_tarjetas` int(11) DEFAULT NULL,
  `asesor_idasesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`idinventario`, `fecha_ingreso`, `valor_tarjeta`, `cantidad_tarjetas`, `asesor_idasesor`) VALUES
(1, '2022-06-08', 5000, 10, 35154);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario_has_tarjetas`
--

CREATE TABLE `inventario_has_tarjetas` (
  `inventario_idinventario` int(11) DEFAULT NULL,
  `tarjetas_cod_tarjetas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `stmcajainventario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `stmcajainventario` (
`idasesor` int(11)
,`nombre` varchar(70)
,`correo` varchar(70)
,`id_caja` int(11)
,`saldo_actual_caja` int(11)
,`idinventario` int(11)
,`cantidad_tarjetas` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `cod_tarjeta` int(11) NOT NULL,
  `ref_chip` varchar(45) COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula` int(11) NOT NULL,
  `nombreUser` varchar(45) COLLATE utf32_unicode_ci NOT NULL,
  `direccion` varchar(70) COLLATE utf32_unicode_ci NOT NULL,
  `asesor_idasesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula`, `nombreUser`, `direccion`, `asesor_idasesor`) VALUES
(13579, '.alejandro.', 'samaria 2 manzana 25 ', 35154),
(24659632, 'german', 'barrio providencia M5 casa 20', 35154),
(123456789, '.juan camilo loaiza.', 'avenida sur calle 28', 35154),
(987654321, '.samuel mejia.', 'avenida sur calle 28', 35154);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `cantidad_tarjetas` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `usuario_cedula` int(11) DEFAULT NULL,
  `id_asesor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura para la vista `stmcajainventario`
--
DROP TABLE IF EXISTS `stmcajainventario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stmcajainventario`  AS SELECT `a`.`id_asesor` AS `idasesor`, `a`.`nombre` AS `nombre`, `a`.`correo` AS `correo`, `c`.`id_caja` AS `id_caja`, `c`.`saldo_actual_caja` AS `saldo_actual_caja`, `i`.`idinventario` AS `idinventario`, `i`.`cantidad_tarjetas` AS `cantidad_tarjetas` FROM ((`asesor` `a` join `caja` `c` on(`a`.`id_asesor` = `c`.`asesor_idasesor`)) join `inventario` `i` on(`i`.`asesor_idasesor` = `a`.`id_asesor`)) WHERE 11  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`id_asesor`);

--
-- Indices de la tabla `asesor_has_venta`
--
ALTER TABLE `asesor_has_venta`
  ADD KEY `asesor_id_asesor` (`asesor_id_asesor`),
  ADD KEY `venta_idventa` (`venta_idventa`);

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`);

--
-- Indices de la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD PRIMARY KEY (`id_estacion`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idinventario`);

--
-- Indices de la tabla `inventario_has_tarjetas`
--
ALTER TABLE `inventario_has_tarjetas`
  ADD KEY `inventario_idinventario` (`inventario_idinventario`),
  ADD KEY `tarjetas_cod_tarjetas` (`tarjetas_cod_tarjetas`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`cod_tarjeta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `id_asesor` (`id_asesor`),
  ADD KEY `usuario_cedula` (`usuario_cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estacion`
--
ALTER TABLE `estacion`
  MODIFY `id_estacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idinventario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `cedula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987654322;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
