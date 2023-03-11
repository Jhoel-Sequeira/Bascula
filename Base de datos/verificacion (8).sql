-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-03-2023 a las 18:51:39
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
(9, 'marcos.chavez@crn.com.ni', 'pbkdf2:sha256:260000$ArTe5DcZlx7GTxv7$95135b9b633e55bd1bbdcc864d3ffbda064ee0f5f9c0507be7da76f70c58d9db', 2),
(10, 'jonathan.siria@crn.com.ni', 'pbkdf2:sha256:260000$EzRWaVbQDyryzsdS$ade0ae4c4d8428ed9d8dcbb2f1c07c6162af8ddeb55e5992eb754a8c7a7eb315', 2),
(11, 'Bryan.Oviedo@crn.com.ni', 'pbkdf2:sha256:260000$zC1XZ36eWhOkVmcS$baa8a3c7b5f573e6d04aa21f3e063f4cbbef34dc67622e8152b76b814d70b0e8', 1);

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
(216, 728, 'Pana', 14.5),
(217, 728, 'Pana', 13.5),
(218, 729, 'Pana', 13),
(219, 730, 'Pana', 14),
(220, 731, 'Jumbo', 60.5),
(221, 744, 'Jumbo', 7),
(222, 750, 'Pana', 13.5),
(223, 751, 'Pana', 13),
(224, 728, 'Pana', 30.5),
(225, 730, 'Cajilla', 3.5),
(226, 753, 'Cajilla', 2.5),
(227, 755, 'Jumbo', 7),
(228, 758, 'Jumbo', 31),
(229, 763, 'Pana', 18),
(230, 769, 'Pana', 12.5),
(231, 770, 'Pana', 14.5),
(232, 771, 'Pana', 14),
(233, 771, 'Cajilla', 3),
(234, 773, 'Jumbo', 7),
(235, 775, 'Jumbo', 24),
(236, 786, 'Jumbo', 17.5),
(237, 796, 'Pana', 13),
(238, 796, 'Pana', 15.5),
(239, 801, 'Pana', 13.5);

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
(707, 353, 32, 100, 0, 100, 0),
(708, 352, 32, 100, 0, 100, 0),
(709, 352, 32, 50, 0, 50, 0),
(710, 353, 32, 50, 0, 50, 0),
(711, 352, 53, 20, 0, 20, 0),
(712, 353, 53, 20, 0, 20, 0),
(713, 353, 64, 10, 0, 10, 0),
(714, 352, 64, 10, 0, 10, 0),
(715, 352, 58, 20, 0, 20, 0),
(716, 353, 58, 20, 0, 20, 0),
(717, 353, 54, 30, 0, 30, 0),
(718, 352, 54, 30, 0, 30, 0),
(719, 354, 39, 200, 0, 200, 0),
(720, 355, 39, 200, 0, 200, 0),
(721, 358, 39, 100, 0, 100, 0),
(722, 357, 39, 100, 0, 100, 0),
(723, 358, 54, 20, 0, 20, 0),
(724, 357, 54, 20, 0, 20, 0),
(725, 358, 64, 30, 0, 30, 0),
(726, 357, 64, 30, 0, 30, 0),
(728, 359, 52, 894.2, 58.5, 833.2, 2.5),
(729, 359, 53, 274.2, 13, 261.2, 0),
(730, 359, 51, 305.2, 17.5, 283.7, 4),
(731, 359, 39, 106.2, 60.5, 45.7, 0),
(732, 363, 37, 84.7, 0, 77.7, 7),
(733, 364, 37, 84.7, 0, 77.7, 7),
(734, 365, 37, 84.7, 0, 77.7, 7),
(735, 359, 39, 93.7, 0, 93.7, 0),
(736, 359, 39, 80.2, 0, 80.2, 0),
(737, 359, 39, 93.2, 0, 93.2, 0),
(738, 359, 39, 110.2, 0, 110.2, 0),
(739, 359, 39, 98.7, 0, 98.7, 0),
(740, 359, 39, 105.2, 0, 105.2, 0),
(741, 359, 39, 98.7, 0, 98.7, 0),
(742, 359, 39, 84.2, 0, 84.2, 0),
(743, 359, 39, 121.2, 0, 121.2, 0),
(744, 359, 39, 108.7, 7, 101.7, 0),
(746, 359, 18, 166.7, 18.5, 148.2, 0),
(747, 359, 59, 1.5, 0, 1.5, 0),
(749, 359, 50, 19.7, 0, 17.2, 2.5),
(750, 359, 36, 48.2, 13.5, 34.2, 0.5),
(751, 361, 52, 72.7, 13, 59.7, 0),
(752, 359, 58, 6, 0, 6, 0),
(753, 361, 51, 7.2, 2.5, 4.2, 0.5),
(754, 359, 2, 66.7, 13, 51.7, 2),
(755, 366, 40, 289.7, 7, 282.7, 0),
(756, 367, 40, 289.7, 7, 282.7, 0),
(757, 369, 40, 289.7, 7, 282.7, 0),
(758, 359, 39, 96.2, 31, 65.2, 0),
(759, 359, 39, 95.7, 0, 95.7, 0),
(760, 359, 39, 68.7, 0, 68.7, 0),
(761, 359, 39, 80.7, 0, 80.7, 0),
(762, 359, 39, 97.7, 0, 97.7, 0),
(763, 361, 53, 21.2, 18, 3.2, 0),
(764, 359, 39, 88.2, 0, 88.2, 0),
(765, 361, 54, 16.5, 0, 16.5, 0),
(766, 361, 58, 8.5, 0, 8.5, 0),
(767, 359, 54, 123, 0, 123, 0),
(768, 359, 64, 42.5, 0, 42.5, 0),
(769, 370, 53, 47.7, 12.5, 35.2, 0),
(770, 370, 52, 95.2, 14.5, 80.7, 0),
(771, 370, 51, 51.7, 17, 33.2, 1.5),
(772, 370, 58, 1.5, 0, 1.5, 0),
(773, 359, 39, 120.7, 7, 113.7, 0),
(774, 359, 39, 94.2, 0, 94.2, 0),
(775, 361, 39, 0, 24, -24, 0),
(776, 370, 59, 1.5, 0, 1.5, 0),
(777, 370, 54, 13, 0, 13, 0),
(778, 361, 39, 83.7, 0, 83.7, 0),
(779, 361, 39, 86.7, 0, 86.7, 0),
(780, 361, 39, 88.7, 0, 88.7, 0),
(781, 359, 39, 138.7, 0, 138.7, 0),
(782, 359, 34, 171.7, 6, 165.7, 0),
(783, 359, 64, 3, 0, 3, 0),
(784, 359, 54, 6.5, 0, 6.5, 0),
(785, 361, 64, 14.5, 0, 14.5, 0),
(786, 370, 39, 110.7, 17.5, 93.2, 0),
(787, 370, 64, 2, 0, 2, 0),
(788, 368, 54, 11.5, 0, 11.5, 0),
(789, 370, 39, 140.2, 0, 140.2, 0),
(790, 370, 45, 50.7, 15, 35.7, 0),
(791, 370, 36, 1.5, 0.5, 1, 0),
(792, 370, 50, 1.5, 0, 1.5, 0),
(793, 370, 59, 2.5, 0, 2.5, 0),
(795, 368, 64, 6, 0, 6, 0),
(796, 368, 41, 57.2, 28.5, 28.7, 0),
(797, 368, 2, 37.7, 16, 20.7, 1),
(798, 368, 38, 16.7, 0, 10.7, 6),
(799, 368, 47, 47.7, 13.5, 34.2, 0),
(800, 368, 46, 36.2, 14, 22.2, 0),
(801, 368, 33, 75.2, 13.5, 27.7, 34),
(802, 368, 33, 127.7, 15, 101.7, 11),
(803, 368, 39, 106.7, 17.5, 89.2, 0),
(804, 368, 39, 119.7, 0, 119.7, 0),
(805, 371, 47, 100, 4, 92, 4),
(806, 372, 39, 100, 7, 93, 0),
(807, 372, 39, 80, 7, 73, 0);

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
(15, 'BATERIA CON ÁCIDO', NULL, 1, NULL),
(16, 'BATERIA SIN POSTE', NULL, 1, NULL),
(17, 'BATERIA', NULL, 1, NULL),
(18, 'ACERO 316', NULL, 1, NULL),
(19, 'CHATARRA BLANDO F', NULL, 1, NULL),
(20, 'CHATARRA MALLA', NULL, 1, NULL),
(21, 'CHATARRA DE SEGUNDA', NULL, 1, NULL),
(22, 'CHATARRA BLANDO', NULL, 1, NULL),
(23, 'CHATARRA SÓLIDO', NULL, 1, NULL),
(24, 'CARTON', NULL, 1, NULL),
(25, 'GALON 2', NULL, 1, NULL),
(26, 'GALÓN', NULL, 1, NULL),
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
(40, 'TUBERÍA', NULL, 1, NULL),
(41, 'PERFIL DE SEGUNDA', NULL, 1, NULL),
(42, 'RINES', NULL, 1, NULL),
(43, 'LITOGRAFÍA', NULL, 1, NULL),
(44, 'PERFIL', NULL, 1, NULL),
(45, 'CABLE LIMPIO ', NULL, 1, NULL),
(46, 'ALUMINIO BLANDO', NULL, 1, NULL),
(47, 'ALUMINIO SÓLIDO', NULL, 1, NULL),
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
(64, 'Rechazo (Lata)', NULL, 1, NULL);

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
(34, 'DINA ABIGAIL RODRIGUEZ SANCHEZ', 1249, NULL, 1),
(35, 'BLANCA AZUCENA CALERO MOLINA', 26569, NULL, 1),
(36, 'NESTOR NOEL BONILLA GUEVARA', 4224, NULL, 1),
(37, 'NESTOR ALEJANDRO DAVILA ALEJOS', 3197, NULL, 1),
(38, 'CARLOS NOEL ROJAS PIZARRRO', 27658, NULL, 1),
(39, 'FRANCISCO NOEL MARCHENA PORRAS', 6095, NULL, 1),
(40, 'MAURICIO JOSE AREVALO ALEMAN', 24936, NULL, 1),
(41, 'CARLOS MAURICIO DUARTE MELENDEZ', 4569, NULL, 1),
(42, 'ALEXANDER MAURICIO CRUZ', 26863, NULL, 1),
(43, 'ENOC JOSUE NARVAEZ PUERTO', 1242, NULL, 1),
(44, 'JOSE FELIPE MOLINA QUINTERO', 1903, NULL, 1),
(45, 'GERMAN ARIEL DAVILA MARENCO', 27359, NULL, 1),
(46, 'JOSE GEOVANY RAMIREZ LOPEZ', 4402, NULL, 1),
(47, 'PEDRO ENRIQUE MORALES GARCIA', 1685, NULL, 1);

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
(4, 'DORIS FONSECA', NULL, 5, 218, 4, 1, 1),
(5, 'BETSABEL COLOMER', NULL, 1, 248, 5, 1, 1),
(6, 'CARLOS GUEVARA', NULL, 3, 214, 6, 1, 1),
(8, 'VALERIA PINEDA', NULL, 5, 238, 8, 1, 1),
(9, 'MARCOS CHAVEZ', 'verificador', 2, NULL, 9, 1, 2),
(10, 'JONATHAN SIRIA', '', 2, NULL, 10, 1, 1),
(11, 'IT Administrador', NULL, 3, 132, 11, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_verificacion`
--

CREATE TABLE `tb_verificacion` (
  `Id_Verificacion` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `PO` text DEFAULT NULL,
  `NoBoleta` text DEFAULT NULL,
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
(349, '2023-03-09 09:51:03', NULL, '0', NULL, NULL, NULL, 5, NULL, 3, 4),
(350, '2023-03-09 09:51:03', NULL, '0', NULL, NULL, NULL, 5, NULL, 3, 4),
(351, '2023-03-09 09:51:03', NULL, '0', NULL, NULL, NULL, 5, NULL, 3, 4),
(352, '2023-03-09 09:51:48', 'PO165377', '123456', 31, 9, 5, 2, 1, 4, 9),
(353, '2023-03-09 09:51:50', 'PO165377', '123456', 31, 9, 5, 1, 1, 4, 5),
(354, '2023-03-09 11:25:04', 'PO165378', '654321', 24, 9, 5, 2, 1, 5, 9),
(355, '2023-03-09 11:25:06', 'PO165378', '654321', 24, 9, 5, 1, 1, 5, 5),
(357, '2023-03-10 08:23:30', 'PO165380', '5464', 24, 9, 1, 2, 1, 5, 9),
(358, '2023-03-10 08:23:31', 'PO165380', '5464', 24, 9, 1, 1, 1, 5, 1),
(359, '2023-03-10 08:53:14', '--', '63320', 34, 9, 1, 2, 7, 5, 9),
(360, '2023-03-10 08:53:22', '--', '63320', 34, 9, 1, 1, 7, 5, 1),
(361, '2023-03-10 08:54:44', '--', '63324', 43, 9, 1, 2, 4, 5, 9),
(362, '2023-03-10 08:54:46', '--', '63324', 43, 9, 1, 1, 4, 5, 1),
(363, '2023-03-10 09:28:44', 'PO165381', '1', 44, 9, 1, 2, 4, 5, 9),
(364, '2023-03-10 09:35:15', 'PO165381', '1', 44, 9, 1, 1, 4, 5, 1),
(365, '2023-03-10 09:37:26', 'PO165381', '1', 44, 9, 1, 1, 4, 5, 1),
(366, '2023-03-10 10:22:17', 'PO165383', '63335', 45, 9, 1, 2, 4, 5, 9),
(367, '2023-03-10 10:24:48', 'PO165383', '63335', 45, 9, 1, 1, 4, 5, 1),
(368, '2023-03-10 10:27:59', '--', '63330', 46, 9, 1, 2, 4, 5, 9),
(369, '2023-03-10 10:28:16', 'PO165383', '63335', 45, 9, 1, 1, 4, 5, 1),
(370, '2023-03-10 10:31:04', '--', '63332', 47, 9, 1, 2, 5, 5, 9),
(371, '2023-03-10 13:25:20', '--', '47854', 24, 9, 1, 1, 1, 3, 11),
(372, '2023-03-10 13:45:11', '--', '14789', 34, 9, 1, 1, 1, 5, 11),
(382, '2023-03-11 11:25:46', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 1),
(383, '2023-03-11 11:25:47', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 1),
(384, '2023-03-11 11:25:48', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 1),
(385, '2023-03-11 11:26:09', NULL, 'CUADRILLA CHATARRA', NULL, NULL, NULL, 5, NULL, 3, 5),
(386, '2023-03-11 11:26:18', NULL, 'CASETA', NULL, NULL, NULL, 5, NULL, 3, 5),
(387, '2023-03-11 11:26:25', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 5),
(388, '2023-03-11 11:26:33', NULL, '478885', NULL, NULL, NULL, 5, NULL, 3, 5),
(389, '2023-03-11 11:49:31', NULL, '0001', NULL, NULL, NULL, 5, NULL, 3, 5),
(390, '2023-03-11 11:49:38', NULL, 'CUADRILLA CHATARRA', NULL, NULL, NULL, 5, NULL, 3, 5),
(391, '2023-03-11 11:49:48', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 1),
(392, '2023-03-11 11:49:49', NULL, 'MOVIL', NULL, NULL, NULL, 5, NULL, 3, 1);

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
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  MODIFY `Id_DetalleTara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT de la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808;

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
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

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
