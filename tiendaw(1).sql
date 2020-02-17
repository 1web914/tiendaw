-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2020 a las 16:39:33
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendaw`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `id_visitante` varchar(200) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `Usuario_login_usu` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `descripcion` mediumtext DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `img` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `img`) VALUES
(2, 'Capita Doa 2020 - Snowboard', 'Perfecta para partirte los dientes con ella', 409.9, 'https://www.backinblack.es/sgf/34293/34293-large_1.jpg'),
(3, 'Capita Scott Stevens Pro 2020 - Snowboard', 'The SCOTT STEVENS PRO is a high quality CAPITA MAN SNOWBOARD for a VERSATILE FREESTYLE: it means this board is perfect for everything involves freestyle, like park or tricks on slopes but you can also use it on powder.', 449.99, 'https://www.backinblack.es/grpmedia/4385/PRK1-SCOTT-PRO_BASE%20copy.jpg'),
(4, 'Capita Mercury 2020 - Snowboard', NULL, 469.9, 'https://www.backinblack.es/sgf/34244/34244-large_1.jpg'),
(5, 'GNU Asym Carbon Credit BTX 2020 - Snowboard', NULL, 364.9, 'https://www.backinblack.es/grpmedia/4385/ASYM-CARBON-CREDIT-BTX_NO-COLOR_19SN003_NONE_01.jpg'),
(6, 'GNU Asym T2B C2e 2020 - Snowboard', NULL, 409.9, 'https://www.backinblack.es/sgf/34532/34532-large_1.jpg'),
(7, 'GNU Asym Head Space C3 2020 - Snowboard', NULL, 389.9, 'https://www.backinblack.es/grpmedia/4385/ASYM-HEADSPACE-C3_NO-COLOR_19SN010_NONE_01.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_pedido`
--

CREATE TABLE `producto_has_pedido` (
  `Producto_id` int(11) NOT NULL,
  `Pedido_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `login_usu` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD KEY `id_producto_idx` (`id_producto`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`,`Usuario_login_usu`),
  ADD KEY `fk_Pedido_Usuario1_idx` (`Usuario_login_usu`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto_has_pedido`
--
ALTER TABLE `producto_has_pedido`
  ADD PRIMARY KEY (`Producto_id`,`Pedido_id`),
  ADD KEY `fk_Producto_has_Pedido_Pedido1_idx` (`Pedido_id`),
  ADD KEY `fk_Producto_has_Pedido_Producto_idx` (`Producto_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`login_usu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cesta`
--
ALTER TABLE `cesta`
  ADD CONSTRAINT `id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Usuario1` FOREIGN KEY (`Usuario_login_usu`) REFERENCES `usuario` (`login_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_has_pedido`
--
ALTER TABLE `producto_has_pedido`
  ADD CONSTRAINT `fk_Producto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_has_Pedido_Producto` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
