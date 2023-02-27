-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-02-2023 a las 16:17:13
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `verificacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cargo`
--

CREATE TABLE `tb_cargo` (
  `Id_Cargo` int(11) NOT NULL,
  `NombreCargo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_cargo`
--

INSERT INTO `tb_cargo` (`Id_Cargo`, `NombreCargo`) VALUES
(1, 'Digitador'),
(2, 'Verificador'),
(3, 'ADMINISTRADOR DE SISTEMA'),
(5, 'VALIDADOR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_credenciales`
--

CREATE TABLE `tb_credenciales` (
  `Id_Credenciales` int(11) NOT NULL,
  `Usuarios` text NOT NULL,
  `Contraseñas` text NOT NULL,
  `IdRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_credenciales`
--

INSERT INTO `tb_credenciales` (`Id_Credenciales`, `Usuarios`, `Contraseñas`, `IdRol`) VALUES
(1, 'allan.guzman@crn.com.ni', 'pbkdf2:sha256:260000$Cj682fhaTyECjEWB$98760e9e8d10c6a47ff1d5b98a15454bde34b0b2726db9ea96ffcd4b89591750', 2),
(3, 'jhoel.sequeira@crn.com.ni', 'pbkdf2:sha256:260000$nuhWnr9ijOSB4Tz3$029b5eda8a67036d7e3450971ff8f4735bb13e3d1f92834dab2175d2905e835e', 1),
(4, 'doris.fonseca@crn.com.ni', 'pbkdf2:sha256:260000$eRO6n5stA0TKJYox$2715b9d1be8c4c836cb9115868f67d46ddf7f3789e0b29a7940b704da7e6aa7e', 2),
(5, 'betsabel.colomer@crn.com.ni', 'pbkdf2:sha256:260000$UhJEQqizBXuEE8bm$7f99b9ef8d6db39c5c8f34adf951e676e9c94b9eb2fea095f1889bb10fbf968a', 2),
(6, 'it@crn.com.ni', 'pbkdf2:sha256:260000$3ByklbcbW2WHdPiX$46e05673db500442eb30d7783a6f6aacf76fbf09ce97442526d13d2facf8624b', 2),
(8, 'valeria.pineda@crn.com.ni', 'pbkdf2:sha256:260000$9z1QvexDW7Z5m5kc$4cb4271ab2497a91d128b117ae6dc02f957cc4fe3eee7918ffd16a8daeac400e', 2),
(9, 'verificador@crn.com.ni', 'pbkdf2:sha256:260000$ArTe5DcZlx7GTxv7$95135b9b633e55bd1bbdcc864d3ffbda064ee0f5f9c0507be7da76f70c58d9db', 2),
(10, 'jonathan.siria@crn.com.ni', 'pbkdf2:sha256:260000$EzRWaVbQDyryzsdS$ade0ae4c4d8428ed9d8dcbb2f1c07c6162af8ddeb55e5992eb754a8c7a7eb315', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalletara`
--

CREATE TABLE `tb_detalletara` (
  `Id_DetalleTara` int(11) NOT NULL,
  `IdDetalleVerificacion` int(11) NOT NULL,
  `Contenedor` text DEFAULT NULL,
  `ValorTaraExtra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalletara`
--

INSERT INTO `tb_detalletara` (`Id_DetalleTara`, `IdDetalleVerificacion`, `Contenedor`, `ValorTaraExtra`) VALUES
(178, 393, 'Pana', 13.5),
(179, 394, 'Pana', 16),
(180, 403, 'Pana', 13),
(181, 403, 'Pana', 17.5),
(182, 404, 'Pana', 14),
(183, 405, 'Pana', 18),
(184, 405, 'Pana', 13.5),
(185, 406, 'Pana', 17.5),
(186, 406, 'Pana', 13),
(187, 397, 'Cajilla', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalleverificacion`
--

CREATE TABLE `tb_detalleverificacion` (
  `Id_DetalleVerificacion` int(11) NOT NULL,
  `IdVerificacion` int(11) NOT NULL,
  `IdMaterial` int(11) NOT NULL,
  `PesoBruto` float NOT NULL,
  `PesoTara` float NOT NULL,
  `PesoNeto` float NOT NULL,
  `Destare` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_detalleverificacion`
--

INSERT INTO `tb_detalleverificacion` (`Id_DetalleVerificacion`, `IdVerificacion`, `IdMaterial`, `PesoBruto`, `PesoTara`, `PesoNeto`, `Destare`) VALUES
(391, 239, 34, 100, 0, 100, 0),
(392, 239, 34, 50, 0, 50, 0),
(393, 237, 53, 0, 13.5, -13.5, 0),
(394, 237, 52, 0, 16, -16, 0),
(395, 237, 39, 130.7, 0, 130.7, 0),
(396, 237, 39, 177.7, 0, 177.7, 0),
(397, 240, 39, 0, 45, -45, 0),
(398, 241, 39, 80.2, 25, 55.2, 0),
(399, 241, 55, 4, 0, 4, 0),
(400, 241, 54, 25.5, 0, 25.5, 0),
(401, 241, 52, 111.2, 18, 93.2, 0),
(402, 241, 53, 32.2, 12, 20.2, 0),
(403, 241, 41, 145.7, 30.5, 114.2, 1),
(404, 241, 47, 63.2, 14, 49.2, 0),
(405, 241, 33, 108.2, 31.5, 68.7, 8),
(406, 241, 46, 97.2, 30.5, 66.7, 0),
(407, 241, 33, 19.2, 0, 9.2, 10),
(408, 240, 53, 0, 0, 0, 0),
(409, 240, 52, 0, 0, -13.5, 13.5),
(410, 241, 59, 8, 0, 8, 0),
(411, 241, 39, 86.2, 0, 86.2, 0),
(412, 241, 39, 90.2, 0, 90.2, 0),
(413, 241, 39, 76.7, 0, 76.7, 0),
(414, 242, 34, 10, 0, 10, 0),
(422, 263, 34, 50, 0, 50, 0),
(448, 273, 39, 200, 0, 200, 0),
(452, 277, 34, 20, 0, 20, 0),
(462, 286, 39, 100, 0, 100, 0),
(464, 243, 34, 50, 0, 50, 0),
(467, 289, 39, 50, 0, 50, 0),
(468, 290, 39, 500, 0, 500, 0),
(469, 302, 54, 50, 0, 50, 0),
(470, 303, 63, 20, 0, 20, 0),
(471, 306, 39, 100, 7, 93, 0),
(472, 307, 39, 100, 7, 93, 0),
(473, 307, 39, 150, 7, 141, 2),
(474, 306, 39, 150, 7, 141, 2),
(475, 306, 54, 96, 0, 96, 0),
(476, 307, 54, 96, 0, 96, 0),
(477, 306, 39, 100, 7, 92, 1),
(478, 307, 39, 100, 7, 92, 1),
(479, 306, 53, 150, 7, 143, 0),
(480, 307, 53, 150, 7, 143, 0),
(481, 306, 58, 50, 0, 50, 0),
(482, 307, 58, 50, 0, 50, 0),
(483, 307, 39, 80, 7, 73, 0),
(484, 306, 39, 80, 7, 73, 0),
(485, 309, 39, 100, 0, 100, 0),
(486, 308, 39, 100, 0, 100, 0),
(487, 311, 39, 100, 0, 100, 0),
(488, 310, 39, 100, 0, 100, 0),
(489, 312, 39, 100, 0, 100, 0),
(490, 304, 39, 100, 0, 100, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_estado`
--

CREATE TABLE `tb_estado` (
  `Id_Estado` int(11) NOT NULL,
  `NombreEstado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_estado`
--

INSERT INTO `tb_estado` (`Id_Estado`, `NombreEstado`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Pendiente'),
(4, 'Completado'),
(5, 'Validar'),
(6, 'CANCELADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_material`
--

CREATE TABLE `tb_material` (
  `Id_Material` int(11) NOT NULL,
  `NombreMaterial` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Id_Estado` int(11) NOT NULL,
  `TipoMaterial` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_material`
--

INSERT INTO `tb_material` (`Id_Material`, `NombreMaterial`, `IdOddo`, `Id_Estado`, `TipoMaterial`) VALUES
(1, 'ACERO', NULL, 1, NULL),
(2, 'ACERO 201', NULL, 1, NULL),
(3, 'PET L TRANSPARENTE', NULL, 1, 'Primera'),
(4, 'PET PREFORMA VERDE', NULL, 1, 'Segunda'),
(5, 'PET PREFORMA TRANSPARENTE', NULL, 1, 'Primera'),
(6, 'PET PREFORMA CELESTE', NULL, 1, NULL),
(7, 'PRIX COLA', NULL, 1, NULL),
(8, 'BATERIA DE MOTO CON ACIDO', NULL, 1, NULL),
(9, 'CHATARRA CARROCERIA 2DA', NULL, 1, NULL),
(10, 'CHATARRA MIXTA F', NULL, 1, NULL),
(11, 'CHATARRA CARROCERIA', NULL, 1, NULL),
(12, 'CHATARRA MIXTA', NULL, 1, NULL),
(13, 'BATERIA PARA MOTO', NULL, 1, NULL),
(14, 'BATERIA CON GEL', NULL, 1, NULL),
(15, 'BATERIA CON ?CIDO', NULL, 1, NULL),
(16, 'BATERIA SIN POSTE', NULL, 1, NULL),
(17, 'BATERIA', NULL, 1, NULL),
(18, 'ACERO 316', NULL, 1, NULL),
(19, 'CHATARRA BLANDO F', NULL, 1, NULL),
(20, 'CHATARRA MALLA', NULL, 1, NULL),
(21, 'CHATARRA DE SEGUNDA', NULL, 1, NULL),
(22, 'CHATARRA BLANDO', NULL, 1, NULL),
(23, 'CHATARRA S?LIDO', NULL, 1, NULL),
(24, 'CARTON', NULL, 1, NULL),
(25, 'GALON 2', NULL, 1, NULL),
(26, 'GAL?N', NULL, 1, NULL),
(27, 'PET VERDE 2', NULL, 1, NULL),
(28, 'PET VERDE', NULL, 1, NULL),
(29, 'PET CELESTE 2', NULL, 1, NULL),
(30, 'PET CELESTE', NULL, 1, NULL),
(31, 'PET SEGUNDA TRANSPARENTE', NULL, 1, NULL),
(32, 'PET TRANSPARENTE', NULL, 1, 'Primera'),
(33, 'ALUMINIO MIXTO', NULL, 1, NULL),
(34, 'LATA B ', NULL, 1, NULL),
(35, 'LATA AEROSOL', NULL, 1, NULL),
(36, 'CONDENSADOR', NULL, 1, NULL),
(37, 'ACERO 321 ', NULL, 1, NULL),
(38, 'ALUMINIO RADIADOR', NULL, 1, NULL),
(39, 'LATA', NULL, 1, NULL),
(40, 'TUBER?A', NULL, 1, NULL),
(41, 'PERFIL DE SEGUNDA', NULL, 1, NULL),
(42, 'RINES', NULL, 1, NULL),
(43, 'LITOGRAF?A', NULL, 1, NULL),
(44, 'PERFIL', NULL, 1, NULL),
(45, 'CABLE LIMPIO ', NULL, 1, NULL),
(46, 'ALUMINIO BLANDO', NULL, 1, NULL),
(47, 'ALUMINIO S?LIDO', NULL, 1, NULL),
(48, 'ZIPPER BRONCE AMARILLO', NULL, 1, NULL),
(49, 'BRONCE VIRUTA ', NULL, 1, NULL),
(50, 'RADIADOR', NULL, 1, NULL),
(51, 'BRONCE AMARILLO', NULL, 1, NULL),
(52, 'COBRE 2', NULL, 1, NULL),
(53, 'COBRE 1', NULL, 1, NULL),
(54, 'JUMBO', NULL, 1, NULL),
(55, 'RECHAZO', NULL, 1, NULL),
(58, 'Rechazo (cobre)', NULL, 1, NULL),
(59, 'Rechazo (Aluminio)', NULL, 1, NULL),
(60, 'Rechazo (Acero)', NULL, 1, NULL),
(61, 'Rechazo (Bronce)', NULL, 1, NULL),
(62, 'Rechazo (Cable)', NULL, 1, NULL),
(63, 'PET L TRANSPARENTE 2', NULL, 1, 'Segunda'),
(64, 'Rechazo (lata)', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `Id_Proveedor` int(11) NOT NULL,
  `NombreProveedor` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Cedula` text DEFAULT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_proveedor`
--

INSERT INTO `tb_proveedor` (`Id_Proveedor`, `NombreProveedor`, `IdOddo`, `Cedula`, `IdEstado`) VALUES
(1, 'PROVEEDOR 1', NULL, '401-030589-1252L', 1),
(2, 'PROVEEDOR 2', NULL, '401-030589-1252K', 1),
(3, 'PROVEEDOR 3', NULL, '401-030589-1252F', 2),
(4, 'PROVEEDOR 4', NULL, '204-256584L', 2),
(7, 'HUMBRETO', NULL, '201-0604001-5624D', 1),
(8, 'PROVED', NULL, 'None', 1),
(9, 'MARIO DIAZ', NULL, '569', 1),
(10, 'JUAN', NULL, '87', 1),
(11, 'JUAN MARQUEZ', NULL, '874', 1),
(13, 'PROVEDITO', NULL, '45', 1),
(14, 'GABRIEL PS', NULL, '001-256485-0000M', 1),
(15, 'PROVEEDOR 1', NULL, 'PROVEEDOR  1', 1),
(19, 'CARLOS GUEVARA', 0, NULL, 1),
(20, ' JHEMAY J JACKSON ROSALES', 0, NULL, 1),
(21, 'AARON JOSE RODRIGUEZ ZEPEDA', 0, NULL, 1),
(22, 'ADANIELKA ESTHER MARTINEZ SALAZAR', 7101, NULL, 1),
(23, 'A&T SERVICIOS LOGISTICOS SOCIEDAD ANONIMA', 30151, NULL, 1),
(24, 'HUBENCE TORREZ ABURTO', 1232, NULL, 1),
(25, 'AGROINDUSTRIAL DE OLEAGINOSAS, S.A.', 3217, NULL, 1),
(26, 'EDGAR ANTONIO AGUILAR FLORES', 1664, NULL, 1),
(27, 'EDGARD SAUL ALMENDAREZ URBINA', 1236, NULL, 1),
(28, 'JENNY DE LA CRUZ FLORES TORRES', 1246, NULL, 1),
(29, 'JUANA CRISTINA ESPINO ESPINOZA', 5603, NULL, 1),
(30, 'YADIRA DEL CARMEN MARTINEZ', 25487, '20153', 1),
(31, 'LUIS MANUEL CHAVEZ VELASQUEZ', 2883, NULL, 1),
(32, 'ALBERTO CARLOS MONTES ARAGON', 6819, NULL, 1),
(33, 'EDGARD ALEJANDRO SAAVEDRA GONZALEZ', 29781, NULL, 1),
(34, 'DINA ABIGAIL RODRIGUEZ SANCHEZ', 1249, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_puntocompra`
--

CREATE TABLE `tb_puntocompra` (
  `Id_PuntoCompra` int(11) NOT NULL,
  `NombrePuntoCompra` text NOT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_puntocompra`
--

INSERT INTO `tb_puntocompra` (`Id_PuntoCompra`, `NombrePuntoCompra`, `IdEstado`) VALUES
(1, 'Caseta', 1),
(2, 'Bascula', 1),
(3, 'No Ferroso', 1),
(4, 'PET', 1),
(5, 'Sin Punto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_roles`
--

CREATE TABLE `tb_roles` (
  `Id_Rol` int(11) NOT NULL,
  `NombreRol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_roles`
--

INSERT INTO `tb_roles` (`Id_Rol`, `NombreRol`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `NombreUsuario` text NOT NULL,
  `Cedula` text DEFAULT NULL,
  `IdCargo` int(11) NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `IdCredenciales` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdPuesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`Id_Usuario`, `NombreUsuario`, `Cedula`, `IdCargo`, `IdOddo`, `IdCredenciales`, `IdEstado`, `IdPuesto`) VALUES
(1, 'ALLAN GUZMÁN', NULL, 1, 251, 1, 1, 1),
(3, 'JHOEL SEQUEIRA', NULL, 3, 273, 3, 1, 1),
(4, 'DORIS FONSECA', NULL, 2, 218, 4, 1, 1),
(5, 'BETSABEL COLOMER', NULL, 1, 248, 5, 1, 1),
(6, 'CARLOS GUEVARA', NULL, 3, 214, 6, 1, 1),
(8, 'VALERIA PINEDA', NULL, 5, 238, 8, 1, 1),
(9, 'VERIFICADOR', 'verificador', 2, NULL, 9, 1, 2),
(10, 'jonathan', '', 2, NULL, 10, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_verificacion`
--

CREATE TABLE `tb_verificacion` (
  `Id_Verificacion` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `PO` text DEFAULT NULL,
  `NoBoleta` int(11) DEFAULT NULL,
  `IdProveedor` int(11) DEFAULT NULL,
  `IdVerificador` int(11) DEFAULT NULL,
  `IdDigitador` int(11) DEFAULT NULL,
  `IdPuntoCompra` int(11) DEFAULT NULL,
  `Bahia` int(11) DEFAULT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdUsuarioCreacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_verificacion`
--

INSERT INTO `tb_verificacion` (`Id_Verificacion`, `Fecha`, `PO`, `NoBoleta`, `IdProveedor`, `IdVerificador`, `IdDigitador`, `IdPuntoCompra`, `Bahia`, `IdEstado`, `IdUsuarioCreacion`) VALUES
(237, '2023-02-22 08:42:54', 'PO79293', 4536, 29, 4, 1, 1, 4, 5, 4),
(239, '2023-02-22 09:18:55', 'PO237541', 2, 27, 4, 1, 1, 1, 5, 1),
(240, '2023-02-22 09:18:55', 'PO792935', 61426, 30, 4, 1, 1, 5, 5, 4),
(241, '2023-02-22 09:18:55', 'PO7865H', 61426, 31, 4, 1, 1, 4, 5, 4),
(242, '2023-02-22 09:18:55', 'SAD', 61426, 27, 4, 1, 1, 2, 5, 4),
(243, '2023-02-22 09:18:55', 'PO015', 61426, 27, 4, 5, 1, 4, 6, 4),
(244, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(245, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(246, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(247, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(248, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(249, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(250, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(251, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(252, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(253, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(254, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(255, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(256, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(257, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(258, '2023-02-22 09:18:55', NULL, 61426, NULL, NULL, NULL, 5, NULL, 3, 4),
(263, '2023-02-22 15:10:36', 'PO237541', 5, 27, 4, 1, 1, 2, 5, 1),
(273, '2023-02-23 09:36:57', 'PO237541', 1, 27, 4, 5, 1, 2, 5, 5),
(277, '2023-02-23 13:36:12', 'PO237541', 1, 27, 4, 1, 1, 2, 5, 1),
(286, '2023-02-24 13:34:43', 'PO125489', 47589, 32, 4, 1, 1, 1, 5, 1),
(289, '2023-02-25 08:44:46', 'PO237541', 61426, 27, 4, 1, 1, 1, 5, 1),
(290, '2023-02-25 08:44:46', 'PO015', 61426, 27, 4, 1, 1, 1, 6, 1),
(302, '2023-02-25 10:00:38', 'PO237541', 1, 27, 9, 1, 1, 1, 5, 9),
(303, '2023-02-25 10:11:30', 'PO015', 4, 27, 9, 1, 1, 3, 5, 9),
(304, '2023-02-25 10:48:15', 'AS', 2, 27, 9, 1, 2, 1, 5, 9),
(305, '2023-02-25 10:51:52', NULL, 1, NULL, NULL, NULL, 5, NULL, 3, 3),
(306, '2023-02-25 10:51:52', 'PO12563', 45789, 24, 9, 1, 1, 1, 5, 1),
(307, '2023-02-25 10:51:52', 'PO12563', 45789, 24, 9, 1, 2, 1, 3, 9),
(308, '2023-02-25 11:55:28', 'PO01', 41763, 27, 9, 1, 1, 1, 5, 1),
(309, '2023-02-25 11:55:28', 'PO01', 41763, 27, 9, 1, 2, 1, 5, 9),
(310, '2023-02-27 08:25:56', 'PO237541', 4, 20, 9, 1, 2, 1, 5, 9),
(311, '2023-02-27 08:25:56', 'PO237541', 4, 20, 9, 1, 1, 1, 5, 1),
(312, '2023-02-27 08:25:56', 'PRUEBAS', 6, 27, 9, 1, 1, 1, 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_cargo`
--
ALTER TABLE `tb_cargo`
  ADD PRIMARY KEY (`Id_Cargo`);

--
-- Indices de la tabla `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD PRIMARY KEY (`Id_Credenciales`),
  ADD KEY `IdRol` (`IdRol`);

--
-- Indices de la tabla `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  ADD PRIMARY KEY (`Id_DetalleTara`),
  ADD KEY `IdDetalleVerificacion` (`IdDetalleVerificacion`);

--
-- Indices de la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  ADD PRIMARY KEY (`Id_DetalleVerificacion`),
  ADD KEY `IdVerificacion` (`IdVerificacion`),
  ADD KEY `IdMaterial` (`IdMaterial`);

--
-- Indices de la tabla `tb_estado`
--
ALTER TABLE `tb_estado`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indices de la tabla `tb_material`
--
ALTER TABLE `tb_material`
  ADD PRIMARY KEY (`Id_Material`),
  ADD KEY `Id_Estado` (`Id_Estado`);

--
-- Indices de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD KEY `IdEstado` (`IdEstado`);

--
-- Indices de la tabla `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  ADD PRIMARY KEY (`Id_PuntoCompra`),
  ADD KEY `IdEstado` (`IdEstado`);

--
-- Indices de la tabla `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `IdCargo` (`IdCargo`),
  ADD KEY `IdCredenciales` (`IdCredenciales`),
  ADD KEY `IdPuesto` (`IdPuesto`);

--
-- Indices de la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  ADD PRIMARY KEY (`Id_Verificacion`),
  ADD KEY `IdProveedor` (`IdProveedor`),
  ADD KEY `IdVerificador` (`IdVerificador`),
  ADD KEY `IdDigitador` (`IdDigitador`),
  ADD KEY `IdPuntoCompra` (`IdPuntoCompra`),
  ADD KEY `IdEstado` (`IdEstado`),
  ADD KEY `IdUsuarioCreacion` (`IdUsuarioCreacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_cargo`
--
ALTER TABLE `tb_cargo`
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  MODIFY `Id_DetalleTara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT de la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=491;

--
-- AUTO_INCREMENT de la tabla `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  MODIFY `Id_PuntoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD CONSTRAINT `tb_credenciales_ibfk_1` FOREIGN KEY (`IdRol`) REFERENCES `tb_roles` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  ADD CONSTRAINT `tb_detalletara_ibfk_1` FOREIGN KEY (`IdDetalleVerificacion`) REFERENCES `tb_detalleverificacion` (`Id_DetalleVerificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  ADD CONSTRAINT `tb_detalleverificacion_ibfk_1` FOREIGN KEY (`IdVerificacion`) REFERENCES `tb_verificacion` (`Id_Verificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detalleverificacion_ibfk_2` FOREIGN KEY (`IdMaterial`) REFERENCES `tb_material` (`Id_Material`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_material`
--
ALTER TABLE `tb_material`
  ADD CONSTRAINT `tb_material_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD CONSTRAINT `tb_proveedor_ibfk_1` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  ADD CONSTRAINT `tb_puntocompra_ibfk_1` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD CONSTRAINT `tb_usuarios_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `tb_cargo` (`Id_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuarios_ibfk_2` FOREIGN KEY (`IdCredenciales`) REFERENCES `tb_credenciales` (`Id_Credenciales`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuarios_ibfk_3` FOREIGN KEY (`IdPuesto`) REFERENCES `tb_puntocompra` (`Id_PuntoCompra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  ADD CONSTRAINT `tb_verificacion_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `tb_proveedor` (`Id_Proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_2` FOREIGN KEY (`IdVerificador`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_3` FOREIGN KEY (`IdDigitador`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_4` FOREIGN KEY (`IdPuntoCompra`) REFERENCES `tb_puntocompra` (`Id_PuntoCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_5` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_6` FOREIGN KEY (`IdUsuarioCreacion`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
