-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2023 a las 23:26:56
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
(3, 'ADMINISTRADOR DE SISTEMA');

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
(1, 'admin', 'pbkdf2:sha256:260000$qG8sPedTgHcpdby6$1b1277ed67af05e359ab9ea0e7f3ae2ba90d2fd1659ac3fc1d524f84b59f055e', 1),
(2, 'user', 'pbkdf2:sha256:260000$ARqq2KZQSpvkysDN$2c4a2bde7768c1d62b519377024a0d6637b45cc949dde865e0a193cea460a697', 2),
(3, 'prueba', 'pbkdf2:sha256:260000$L05KvxnrEC3fvGTc$843b124a885d6a3d954de77b72c1bc471a7ab7582ce74c5d7d34e56b5916bd5b', 2),
(4, 'test', 'pbkdf2:sha256:260000$MFtYjVfzaGO5u3Qf$e257f83baec1ea94df537d7d8d15ed682d0a13c6c588a75fc8b6267b2a7920b9', 2),
(5, 'nombre1', 'pbkdf2:sha256:260000$qeq1LO6xlwGehlMD$e232dad494c2d099357df325549da73aa2435544c51bea0d628938247e82a768', 2),
(6, 'verifi', 'pbkdf2:sha256:260000$E2NB9Wu00SBu9ES7$1992c33082e0b4220c29c6d02cb8b300c56301b44fefdec590e62508f38ac9f0', 2),
(7, 'digi', 'pbkdf2:sha256:260000$9M2fpu50avZe6TXM$8657b4b4691cb30e108bbce298d26deab98cad5861f61de8accf4a878bfecd08', 2),
(8, 'boviedo', 'pbkdf2:sha256:260000$TlQZhRURgMfb7VRY$49ca65891f5ed587b900f05afbef4089a03d6fd195aaeaaba2bd2f96d0c24b1e', 1),
(9, 'nombre', 'pbkdf2:sha256:260000$8c1WCZKq5ysvSO41$f10ef955eef1fef393c170bf38d9cf47387dc2acf820edabc72f53e5e2d88cec', 2);

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
(1, 1, 32, 80, 7.5, 72.5, 0),
(2, 1, 32, 100, 20, 80, 0),
(3, 1, 29, 80, 15, 65, 0),
(4, 1, 54, 100, 0, 100, 0),
(5, 2, 53, 100, 5, 95, 0),
(6, 2, 34, 400, 20, 380, 0),
(7, 3, 53, 100, 5, 95, 0),
(8, 3, 53, 200, 50, 150, 0),
(9, 3, 1, 10, 5, 2, 3),
(10, 3, 3, 500, 50, 450, 0),
(11, 3, 54, 20, 0, 20, 0),
(12, 4, 34, 100, 10, 90, 0),
(13, 4, 34, 30, 5, 25, 0),
(14, 4, 52, 100, 3, 96, 1),
(15, 4, 36, 400, 30, 350, 20),
(16, 5, 34, 200, 20, 170, 10),
(17, 6, 53, 100, 5, 95, 0),
(18, 7, 34, 100, 50, 50, 0),
(19, 8, 7, 50, 10, 40, 0),
(20, 9, 7, 100, 5, 95, 0),
(21, 10, 3, 100, 10, 90, 0),
(22, 12, 3, 100, 10, 90, 0),
(23, 13, 34, 20.7, 17, 3.7, 0),
(24, 13, 33, 20, 14, 6, 0),
(25, 13, 33, 100, 29, 71, 0),
(26, 13, 34, 500, 20, 480, 0),
(27, 13, 55, 50, 7.5, 42.5, 0),
(28, 13, 54, 120, 0.1, 119.9, 0),
(29, 13, 54, 120, 0, 120, 0),
(30, 13, 53, 100, 15, 84.5, 0.5),
(31, 14, 35, 100, 5, 95, 0),
(32, 16, 52, 50, 10, 40, 0),
(33, 14, 3, 50, 8, 42, 0),
(34, 16, 3, 100, 7, 93, 0),
(35, 14, 33, 100, 5, 95, 0),
(36, 17, 7, 100, 5, 95, 0),
(37, 15, 7, 100, 10, 90, 0),
(38, 16, 34, 20.7, 2.5, 18, 0),
(39, 14, 53, 20.7, 2.5, 18.2, 0),
(40, 14, 34, 20.7, 2.5, 18.2, 0),
(41, 14, 34, 20.7, 2.5, 18.2, 0),
(42, 14, 3, 20.7, 2.5, 18.2, 0),
(43, 14, 3, 20.8, 2.5, 18.3, 0),
(44, 14, 3, 50.8, 2.6, 48.2, 0),
(45, 14, 34, 50.6, 10.15, 40.45, 0),
(46, 10, 53, 10.6, 15.5, -4.9, 0),
(47, 19, 3, 10, 20, -10, 0),
(48, 11, 52, 10, 20, -10, 0),
(49, 21, 53, 100, 200, -100, 0),
(50, 21, 2, 200, 100, 100, 0),
(51, 21, 53, 200, 50, 150, 0),
(52, 20, 53, 100, 200, -100, 0),
(53, 20, 53, 200, 50, 150, 0);

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
(4, 'Completado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_material`
--

CREATE TABLE `tb_material` (
  `Id_Material` int(11) NOT NULL,
  `NombreMaterial` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Id_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_material`
--

INSERT INTO `tb_material` (`Id_Material`, `NombreMaterial`, `IdOddo`, `Id_Estado`) VALUES
(1, 'ACERO', NULL, 1),
(2, 'ACERO 201', NULL, 1),
(3, 'PET L TRANSPARENTE', NULL, 1),
(4, 'PET PREFORMA VERDE', NULL, 1),
(5, 'PET PREFORMA TRANSPARENTE', NULL, 1),
(6, 'PET PREFORMA CELESTE', NULL, 1),
(7, 'PRIX COLA', NULL, 1),
(8, 'BATERIA DE MOTO CON ACIDO', NULL, 1),
(9, 'CHATARRA CARROCERIA 2DA', NULL, 1),
(10, 'CHATARRA MIXTA F', NULL, 1),
(11, 'CHATARRA CARROCERIA', NULL, 1),
(12, 'CHATARRA MIXTA', NULL, 1),
(13, 'BATERIA PARA MOTO', NULL, 1),
(14, 'BATERIA CON GEL', NULL, 1),
(15, 'BATERIA CON ?CIDO', NULL, 1),
(16, 'BATERIA SIN POSTE', NULL, 1),
(17, 'BATERIA', NULL, 1),
(18, 'ACERO 316', NULL, 1),
(19, 'CHATARRA BLANDO F', NULL, 1),
(20, 'CHATARRA MALLA', NULL, 1),
(21, 'CHATARRA DE SEGUNDA', NULL, 1),
(22, 'CHATARRA BLANDO', NULL, 1),
(23, 'CHATARRA S?LIDO', NULL, 1),
(24, 'CARTON', NULL, 1),
(25, 'GAL?N 2', NULL, 1),
(26, 'GAL?N', NULL, 1),
(27, 'PET VERDE 2', NULL, 1),
(28, 'PET VERDE', NULL, 1),
(29, 'PET CELESTE 2', NULL, 1),
(30, 'PET CELESTE', NULL, 1),
(31, 'PET SEGUNDA TRANSPARENTE', NULL, 1),
(32, 'PET TRANSPARENTE', NULL, 1),
(33, 'ALUMINIO MIXTO', NULL, 1),
(34, 'LATA B ', NULL, 1),
(35, 'LATA AEROSOL', NULL, 1),
(36, 'CONDENSADOR', NULL, 1),
(37, 'ACERO 321 ', NULL, 1),
(38, 'ALUMINIO RADIADOR', NULL, 1),
(39, 'LATA', NULL, 1),
(40, 'TUBER?A', NULL, 1),
(41, 'PERFIL DE SEGUNDA', NULL, 1),
(42, 'RINES', NULL, 1),
(43, 'LITOGRAF?A', NULL, 1),
(44, 'PERFIL', NULL, 1),
(45, 'CABLE LIMPIO ', NULL, 1),
(46, 'ALUMINIO BLANDO', NULL, 1),
(47, 'ALUMINIO S?LIDO', NULL, 1),
(48, 'ZIPPER BRONCE AMARILLO', NULL, 1),
(49, 'BRONCE VIRUTA ', NULL, 1),
(50, 'RADIADOR', NULL, 1),
(51, 'BRONCE AMARILLO', NULL, 1),
(52, 'COBRE 2', NULL, 1),
(53, 'COBRE 1', NULL, 1),
(54, 'JUMBO', NULL, 1),
(55, 'RECHAZO', NULL, 1);

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
(12, 'EDGARD SAÚL ALMENDAREZ URBINA', NULL, '0011509930014T', 1),
(13, 'PROVEDITO', NULL, '45', 1),
(14, 'GABRIEL PS', NULL, '001-256485-0000M', 1);

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
(1, 'Administrador', '201', 3, NULL, 1, 1, 1),
(2, 'Usuario', '401', 1, NULL, 2, 1, 2),
(3, 'PRUEBA', '77', 2, NULL, 3, 1, NULL),
(4, 'PYTHONTEST', '8', 1, NULL, 4, 1, NULL),
(5, 'NOMBRE 1', '9', 2, NULL, 5, 1, NULL),
(6, 'VERIFICADOR PRUEBA', '79', 2, NULL, 6, 1, NULL),
(7, 'DIGITADOR PRUEBA', '96', 1, NULL, 7, 1, NULL),
(8, 'BRYAN ISAAC OVIEDO MARENCO', '2010112960002G', 3, NULL, 8, 1, NULL),
(9, 'NOMBRE', '22', 2, NULL, 9, 1, NULL);

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
(1, '2023-02-06 00:00:00', 'PO79293', 8776, 4, 3, 4, 2, 3, 3, 8),
(2, '2023-02-07 00:00:00', 'PO98', 768, 9, 5, 4, 2, 2, 4, 1),
(3, '2023-02-07 00:00:00', 'PO792935', 890, 9, 3, 4, 2, 2, 4, 1),
(4, '2023-02-07 00:00:00', 'PO79293', 45666, 1, 5, 2, 1, 1, 4, 1),
(5, '2023-02-08 00:00:00', NULL, NULL, 9, NULL, NULL, 5, NULL, 4, 2),
(6, '2023-02-08 00:00:00', NULL, NULL, 9, NULL, NULL, 5, NULL, 4, 2),
(7, '2023-02-08 00:00:00', NULL, NULL, 9, NULL, NULL, 5, NULL, 4, 2),
(8, '2023-02-08 00:00:00', NULL, NULL, 9, NULL, NULL, 5, NULL, 4, 2),
(9, '2023-02-08 00:00:00', 'PRUEBA', 65, 9, 2, 2, 2, 2, 4, 2),
(10, '2023-02-08 00:00:00', '25462', 8776, 9, 2, 4, 2, 1, 4, 2),
(11, '2023-02-08 00:00:00', 'PRUEBAS', 54, 14, 2, 4, 2, 6, 3, 2),
(12, '2023-02-08 00:00:00', 'PO79293', 8776, 9, 1, 4, 2, 3, 4, 1),
(13, '2023-02-08 00:00:00', 'PO165233', 45555, 1, 1, 4, 1, 1, 4, 1),
(14, '2023-02-08 00:00:00', 'PO165234', 0, 2, 1, 2, 1, 1, 4, 1),
(15, '2023-02-08 00:00:00', 'PRUEBAS', 33, 13, 1, 4, 1, 2, 4, 1),
(16, '2023-02-08 00:00:00', 'PO165233', 0, 1, 1, 4, 2, 1, 4, 1),
(17, '2023-02-08 14:08:44', NULL, NULL, 1, NULL, NULL, 5, NULL, 3, 1),
(18, '2023-02-08 15:07:36', NULL, NULL, 1, NULL, NULL, 5, NULL, 3, 1),
(19, '2023-02-08 15:55:41', 'PRUEBA', 65, 2, 2, 4, 2, 6, 3, 2),
(20, '2023-02-08 16:01:06', 'PRUEBASSS', 58, 8, 1, 2, 1, 3, 4, 1),
(21, '2023-02-08 16:04:32', 'JI', 65, 9, 1, 2, 1, 2, 4, 1);

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
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD CONSTRAINT `tb_credenciales_ibfk_1` FOREIGN KEY (`IdRol`) REFERENCES `tb_roles` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;

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
