-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2023 a las 00:07:28
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
(4, 'test', 'pbkdf2:sha256:260000$HM2S73CRvUPsQZE7$875911797b03bb86b3ec9ca7e50aeeac088b54ee125072c027114910332c2a9a', 2),
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
(4, 1, 54, 100, 0, 100, 0);

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
(1, 'ACERO+A55+A2+A2:A47', NULL, 1),
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
(3, 'PROVEEDOR 3', NULL, '401-030589-1252F', 1),
(4, 'PROVEEDOR 4', NULL, '204-256584L', 1),
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
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`Id_Usuario`, `NombreUsuario`, `Cedula`, `IdCargo`, `IdOddo`, `IdCredenciales`, `IdEstado`) VALUES
(1, 'Administrador', '201', 3, NULL, 1, 1),
(2, 'Usuario', '401', 1, NULL, 2, 1),
(3, 'PRUEBA', '77', 2, NULL, 3, 1),
(4, 'PRUEBITA', '8', 1, NULL, 4, 1),
(5, 'NOMBRE 1', '9', 2, NULL, 5, 1),
(6, 'VERIFICADOR PRUEBA', '79', 2, NULL, 6, 1),
(7, 'DIGITADOR PRUEBA', '96', 1, NULL, 7, 1),
(8, 'BRYAN ISAAC OVIEDO MARENCO', '2010112960002G', 3, NULL, 8, 1),
(9, 'NOMBRE', '22', 2, NULL, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_verificacion`
--

CREATE TABLE `tb_verificacion` (
  `Id_Verificacion` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
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
(1, '2023-02-06', 'PO79293', 8776, 4, 3, 4, 2, 3, 3, 8);

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
  ADD KEY `IdCredenciales` (`IdCredenciales`);

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
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `tb_usuarios_ibfk_2` FOREIGN KEY (`IdCredenciales`) REFERENCES `tb_credenciales` (`Id_Credenciales`) ON DELETE CASCADE ON UPDATE CASCADE;

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
