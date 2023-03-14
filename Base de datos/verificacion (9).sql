-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2023 a las 21:07:29
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
(1, 'betsabel.colomer@crn.com.ni', 'pbkdf2:sha256:260000$DhrqiZsW812H5Lxl$3c98decd6394ceb46920ccffaad40e664f3ab76c699f8fb4b95b1000a8626245', 2),
(2, 'allan.guzman@crn.com.ni', 'pbkdf2:sha256:260000$w5OIbP7YDVlkprxD$86d552ec5d203c6388d90fe5a88692bf9f6add54151aeaf380b1e22a2f9f8b6e', 2),
(3, 'jhoel.sequeira@crn.com.ni', 'pbkdf2:sha256:260000$acUrBFO6LbRf9QiO$aa8e532668c2f420b3f9a68938ba6101c28d7855b2e600015103cc1859e41e1f', 1),
(4, 'marcos.chavez@crn.com.ni', 'pbkdf2:sha256:260000$Gi8RLKrh7twtAM9C$d3a9c4af566e68ee13cac83794c6bf1662a72d830e629d54aadde0f42677f05c', 2),
(5, 'alvaro.lopez@crn.com.ni', 'pbkdf2:sha256:260000$KzqlyiuT0MBkpscd$91d3dcf12cc55bfbc211825dfdbf3b1757c845542f4cd3abb02fa4a614d03af0', 2),
(6, 'leslie.antuche@crn.com.ni', 'pbkdf2:sha256:260000$9OkAP86MKIZqMASU$f4ae2b293b69abc73c94ea9410df8fb17af0ec968237229fa02956a84434ea96', 2),
(7, 'luisa.juarez@crn.com.ni', 'pbkdf2:sha256:260000$7UNZW62ptMiHbXlb$763fedec865d7aa01cd622792d5a6f168c9aa64eff06de805849924403ef0972', 2),
(8, 'morena.quintana@crn.com.ni', 'pbkdf2:sha256:260000$UyzDBpve7pDFXPfi$857280c5ba9fce8524683a5d9b1eaa3b72d3f1e46d1a3a5ec16a12574ae638de', 2),
(9, 'orielka.loza@crn.com.ni', 'pbkdf2:sha256:260000$xSrXBgy7mte77yOo$992d2a1669ff14f271ed5a74a61b29a47ae7742ec963f8014fc96ac44d3c7ab0', 2),
(10, 'jonathan.sirias@crn.com.ni', 'pbkdf2:sha256:260000$6ZrbsZs5FNjJGLEQ$6ac4ba73261f38443435f7c48c72e830180817a761cb8650ed30c17e0728a337', 2),
(11, 'josue.lopez@crn.com.ni', 'pbkdf2:sha256:260000$zZfBB49oojsD8MYv$ab2b9b909de5ba69446b2d716b297b70f19b66a30f2975243aabd3f166ea16ae', 2),
(12, 'katiela.silva@crn.com.ni', 'pbkdf2:sha256:260000$kSQ4bsSaOwJGjFnO$bb5bbd6982a6f85d09612e56cdd71b1f49ff97876b474dc268fbd65cc3925f35', 2),
(13, 'doris.fonseca@crn.com.ni', 'pbkdf2:sha256:260000$3QYDbEKOacoXxWwg$4c1f8a9457d4fafb1425d01e77c0b4f9f52416fc98a09c54a364556954d2e74d', 2),
(14, 'Bryan.Oviedo@crn.com.ni', 'pbkdf2:sha256:260000$DlmgnI2GvIjvOuIt$7732673e1406a5c8316e1a30895ac836981fe507f5dfeec31ea83e907085ffbb', 1);

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
(242, 829, 'Canasta', 4788);

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
(828, 401, 39, 200, 0, 200, 0),
(829, 402, 23, 7850, 4788, 2984, 78),
(830, 404, 39, 500, 0, 500, 0),
(832, 405, 39, 500, 0, 500, 0),
(833, 406, 39, 600, 0, 600, 0),
(834, 407, 3, 500, 0, 500, 0),
(835, 408, 34, 110, 5, 105, 0),
(836, 408, 34, 150, 10, 140, 0);

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
(47, 'PEDRO ENRIQUE MORALES GARCIA', 1685, NULL, 1),
(48, 'RICARDO LENIN MORALES CRUZ', 6148, NULL, 1),
(49, 'ROBERTO JOSE ALVARADO LEZAMA', 3751, NULL, 1),
(50, 'ABDIAS SAMUEL OPORTA TALAVERA', 28911, NULL, 1),
(51, 'ABDEL BENCK ZAMORA', 3039, NULL, 1),
(52, 'EDGAR ANTONIO DETRINIDAD LANZAS', 26708, NULL, 1),
(53, 'ADRIANA DEL CARMEN RAMIREZ', 29922, NULL, 1);

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
(1, 'GRANEL/PLANTA: Receipts', 1),
(5, 'Sin Punto', 1),
(26, 'CHATARRA: Recepciones', 1),
(115, 'MOVIL: Recepciones', 1);

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
(1, 'BETSABEL COLOMER', NULL, 1, 248, 1, 1, 1),
(2, 'ALLAN GUZMÁN', NULL, 1, 251, 2, 1, 1),
(3, 'JHOEL SEQUEIRA', NULL, 3, 273, 3, 1, 1),
(4, 'MARCOS ANTONIO CHAVEZ MARTINEZ', '', 2, NULL, 4, 1, 1),
(5, 'ALVARO LÓPEZ', NULL, 1, 258, 5, 1, 1),
(6, 'LESLIE JAZMIN ANTUCHE MONTOYA', '', 2, NULL, 6, 1, 5),
(7, 'LUISA ESTHER JUAREZ BERRIOS', '', 2, NULL, 7, 1, 1),
(8, 'MORENA GUADALUPE QUINTANA CASTRO', '', 2, NULL, 8, 1, 1),
(9, 'ORIELKA YASKARI LOZA VASQUEZ', '', 2, NULL, 9, 1, 1),
(10, 'JONATHAN EDUARDO SIRIAS SOTELO', '', 2, NULL, 10, 1, 1),
(11, 'JOSUE NEHEMIAS LOPEZ ESPINOZA', '', 2, NULL, 11, 1, 1),
(12, 'KATIELA NAHILEA SILVA REYES', '', 2, NULL, 12, 1, 1),
(13, 'DORIS FONSECA', NULL, 5, 218, 13, 1, 1),
(14, 'IT Administrador', NULL, 3, 132, 14, 1, 1);

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
(401, '2023-03-14 12:08:16', 'PO165404', 'MOVIL', 51, 4, 2, 115, 1, 5, 2),
(402, '2023-03-14 12:10:33', 'PO165406', '47896', 48, 4, 5, 26, 1, 5, 5),
(404, '2023-03-14 12:11:50', 'PO165404', 'MOVIL', 24, 4, 2, 115, 1, 5, 2),
(405, '2023-03-14 12:14:24', 'PO165404', 'MOVIL', 27, 4, 2, 115, 1, 5, 2),
(406, '2023-03-14 12:15:32', 'PO165404', 'MOVIL', 27, 4, 2, 115, 7, 5, 2),
(407, '2023-03-14 12:16:30', 'PO165405', '589657', 27, 4, 1, 1, 4, 5, 1),
(408, '2023-03-14 13:11:09', 'PO165407', '49699', 52, 4, 1, 1, 1, 5, 1);

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
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  MODIFY `Id_DetalleTara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT de la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=843;

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
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  MODIFY `Id_PuntoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

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
