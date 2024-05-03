-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2024 a las 19:29:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL,
  `categoria_nombre` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_nombre`) VALUES
(1, 'deportes'),
(2, 'tegnologia'),
(3, 'cocina'),
(4, 'cine'),
(5, 'libros'),
(6, 'viajes'),
(7, 'noticias'),
(8, 'jardinería'),
(9, 'belleza'),
(10, 'salud y bienestar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_de_publicaciones`
--

CREATE TABLE `categorias_de_publicaciones` (
  `categoria_publicaciones_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `publicacion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias_de_publicaciones`
--

INSERT INTO `categorias_de_publicaciones` (`categoria_publicaciones_id`, `categoria_id`, `publicacion_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `comentario_id` int(11) NOT NULL,
  `comentario` text DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `publicaciones_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`comentario_id`, `comentario`, `usuario_id`, `publicaciones_id`) VALUES
(1, 'Excelente artículo, muy informativo.', 1, 3),
(2, 'Me encantó este partido, ¡fue emocionante!', 2, 4),
(3, 'Buena crítica, me ayudó a decidir si ver la película o no.', 3, 2),
(4, '¿Tienes más recetas? Esta suena deliciosa.', 4, 6),
(5, 'Gracias por los consejos, me serán útiles en mi próximo viaje.', 5, 7),
(6, 'Estoy de acuerdo, este libro es una obra maestra.', 6, 5),
(7, '¡Los tutoriales son geniales! Me ayudaron a mejorar mis habilidades de maquillaje.', 7, 8),
(8, 'Necesitaba estos consejos, mi jardín necesita atención.', 12, 9),
(9, 'Interesantes noticias, estoy ansioso por ver lo que viene.', 13, 10),
(10, 'Estos consejos son justo lo que necesitaba para comenzar mi rutina de ejercicio.', 15, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `publicaciones_id` int(11) NOT NULL,
  `titulo` varchar(250) DEFAULT NULL,
  `contenido` varchar(250) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`publicaciones_id`, `titulo`, `contenido`, `usuario_id`) VALUES
(1, 'Nuevo producto tecnológico', 'Descripción del nuevo producto tecnológico.', 1),
(2, 'Partido de fútbol', 'Resumen del partido de fútbol.', 2),
(3, 'Estreno de película', 'Opinión sobre la última película de cine.', 3),
(4, 'Recetas de cocina', 'Recetas deliciosas para preparar en casa.', 4),
(5, 'Consejos de viaje', 'Consejos útiles para viajar de manera segura y económica.', 5),
(6, 'Reseñas de libros', 'Opiniones sobre los últimos libros más vendidos.', 6),
(7, 'Tutoriales de maquillaje', 'Instrucciones paso a paso para maquillarse como un profesional.', 7),
(8, 'Consejos de jardinería', 'Cómo cuidar tus plantas y jardín durante todas las estaciones del año.', 12),
(9, 'Noticias de tecnología', 'Últimas noticias sobre avances tecnológicos y gadgets.', 13),
(10, 'Consejos de ejercicio', 'Formas efectivas de mantenerse en forma y saludable.', 15),
(19, 'Mayorista', 'esta public de prueba', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL,
  `rol_nombres` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`rol_id`, `rol_nombres`) VALUES
(1, 'Usuario'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL,
  `usuario_nombre` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(150) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_nombre`, `email`, `password`, `rol_id`) VALUES
(1, 'Clarette', 'callsop0@github.io', '5827', 1),
(2, 'Breanne', 'beltune1@eventbrite.com', '7187', 1),
(3, 'Teresina', 'tgooden2@adobe.com', '9601', 1),
(4, 'Joellyn', 'jfaithfull3@i2i.jp', '3078', 2),
(5, 'Phillie', 'pcritoph4@dailymotion.com', '6696', 2),
(6, 'Karrah', 'kbromby5@sogou.com', '9328', 2),
(7, 'Yvon', 'yroycroft6@army.mil', '4210', 1),
(12, 'Alejandro', 'example@gmail.com', '234', 2),
(13, 'diego', 'example@gmail.com', '244', 1),
(15, 'enzo', 'example@gmail.com', '244', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `categorias_de_publicaciones`
--
ALTER TABLE `categorias_de_publicaciones`
  ADD PRIMARY KEY (`categoria_publicaciones_id`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `publicacion_id` (`publicacion_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`comentario_id`),
  ADD KEY `publicaciones_id` (`publicaciones_id`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`publicaciones_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categorias_de_publicaciones`
--
ALTER TABLE `categorias_de_publicaciones`
  MODIFY `categoria_publicaciones_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `comentario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `publicaciones_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias_de_publicaciones`
--
ALTER TABLE `categorias_de_publicaciones`
  ADD CONSTRAINT `categorias_de_publicaciones_ibfk_1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicaciones` (`publicaciones_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categorias_de_publicaciones_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`publicaciones_id`) REFERENCES `publicaciones` (`publicaciones_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
