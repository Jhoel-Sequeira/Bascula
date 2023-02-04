-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-02-2023 a las 19:51:06
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
(2, 'user1', 'pbkdf2:sha256:260000$ARqq2KZQSpvkysDN$2c4a2bde7768c1d62b519377024a0d6637b45cc949dde865e0a193cea460a697', 2),
(3, 'prueba', 'pbkdf2:sha256:260000$L05KvxnrEC3fvGTc$843b124a885d6a3d954de77b72c1bc471a7ab7582ce74c5d7d34e56b5916bd5b', 2),
(4, 'test', 'pbkdf2:sha256:260000$HM2S73CRvUPsQZE7$875911797b03bb86b3ec9ca7e50aeeac088b54ee125072c027114910332c2a9a', 2),
(5, 'nombre1', 'pbkdf2:sha256:260000$qeq1LO6xlwGehlMD$e232dad494c2d099357df325549da73aa2435544c51bea0d628938247e82a768', 2),
(6, 'verifi', 'pbkdf2:sha256:260000$E2NB9Wu00SBu9ES7$1992c33082e0b4220c29c6d02cb8b300c56301b44fefdec590e62508f38ac9f0', 2),
(7, 'digi', 'pbkdf2:sha256:260000$9M2fpu50avZe6TXM$8657b4b4691cb30e108bbce298d26deab98cad5861f61de8accf4a878bfecd08', 2),
(8, 'boviedo', 'pbkdf2:sha256:260000$8nmUEP8BGgWUK3CR$439e6967ef6ac0c2bba02bfb0d51acc7fa76571c76bfba5890f6b6bd70b99577', 1),
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
(3, 1, 1, 156, 20, 131, 5),
(4, 1, 1, 20, 3, 2, 15),
(5, 1, 1, 100, 2, 18, 80),
(6, 1, 1, 200, 2, 188, 10),
(7, 1, 2, 300, 30, 259, 11),
(8, 3, 1, 100, 5, 45, 50),
(9, 1, 2, 100, 5, 45, 50),
(10, 1, 1, 5000, 300, 4680, 20),
(11, 1, 1, 20, 2, 13, 5),
(12, 6, 1, 100, 5, 90, 5),
(13, 6, 2, 100, 5, 95, 0),
(14, 6, 1, 200, 100, 100, 0),
(15, 4, 1, 90, 5, 85, 0),
(16, 6, 1, 90, 7, 80, 3),
(17, 5, 1, 65, 8, 52, 5),
(18, 2, 1, 100, 50, 45, 5),
(19, 10, 1, 100, 50, 40, 10),
(20, 11, 1, 100, 50, 48, 2),
(21, 2, 2, 100, 50, 49, 1),
(22, 2, 1, 100, 7, 93, 0),
(23, 14, 1, 100, 50, 20, 30),
(24, 14, 2, 100, 20, 50, 30),
(25, 13, 1, 100, 50, 45, 5),
(26, 13, 2, 50, 5, 40, 5),
(27, 15, 1, 100, 2, 96, 2),
(28, 16, 1, 100, 20, 58, 22),
(29, 17, 1, 100, 20, 75, 5),
(30, 18, 1, 100, 20, 78, 2),
(31, 19, 2, 100, 6, 74, 20),
(32, 19, 1, 100, 50, 30, 20),
(33, 19, 1, 100, 50, 30, 20),
(34, 19, 2, 200, 10, 170, 20),
(41, 20, 1, 100, 10, 90, 0),
(42, 20, 1, 10, 5, 5, 0),
(43, 20, 1, 10, 20, -10, 0),
(44, 20, 1, 10, 10, 0, 0),
(45, 20, 1, 10, 10, 0, 0),
(46, 20, 1, 10, 9, 0, 1),
(47, 20, 1, 10, 2, 8, 0),
(48, 20, 1, 4, 3, 1, 0),
(49, 20, 1, 100, 50, 50, 0),
(50, 23, 1, 1000, 100, 898, 2),
(51, 23, 1, 100, 10, 90, 0),
(52, 23, 2, 10, 5, 2, 3);

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
(1, 'Lata', NULL, 1),
(2, 'Cobre', NULL, 1);

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
(1, '2023-01-30', 'PO', 1, 1, 2, 1, 1, 2, 4, 1),
(2, '2023-01-30', 'PO015', 8, 1, 2, 1, 1, 2, 4, 1),
(3, '2023-01-30', 'prueba', 87, 2, 2, 1, 1, 2, 4, 1),
(4, '2023-01-30', 'PO', 5, 1, 2, 1, 2, 2, 4, 1),
(5, '2023-01-30', 'PO', 5487, 2, 2, 1, 1, 2, 4, 1),
(6, '2023-01-30', 'PO158795', 475, 2, 2, 1, 3, 3, 4, 1),
(7, '2023-01-30', 'PO', 51, 1, 2, 1, 2, 2, 4, 1),
(8, '2023-01-30', 'PO', 988, 2, 2, 1, 1, 1, 4, 1),
(9, '2023-01-30', 'PO', 966, 2, 2, 1, 1, 2, 4, 1),
(10, '2023-01-30', 'PO', 59678, 1, 2, 1, 1, 2, 4, 1),
(11, '2023-01-30', 'PI', 96633, 1, 2, 1, 1, 2, 4, 1),
(12, '2023-01-31', NULL, NULL, 1, NULL, NULL, 5, NULL, 3, 2),
(13, '2023-01-31', 'PO', 55, 1, 2, 1, 2, 2, 4, 1),
(14, '2023-01-31', 'PO', 54, 1, 2, 1, 2, 2, 4, 1),
(15, '2023-01-31', 'PO', 33, 1, 2, 1, 2, 1, 4, 1),
(16, '2023-01-31', 'PO', 87, 1, 2, 1, 1, 2, 4, 1),
(17, '2023-01-31', 'PO', 65, 1, 2, 1, 2, 2, 4, 1),
(18, '2023-01-31', 'PO', 36, 1, 2, 1, 1, 2, 4, 1),
(19, '2023-01-31', 'PI', 988, 1, 2, 1, 2, 2, 4, 1),
(20, '2023-01-31', 'PO', 8525, 2, 2, 1, 2, 2, 4, 1),
(21, '2023-02-02', NULL, NULL, 1, NULL, NULL, 5, NULL, 3, 1),
(23, '2023-02-03', 'PO', 988, 7, 1, 2, 1, 2, 4, 1),
(24, '2023-02-03', NULL, NULL, 4, NULL, NULL, 5, NULL, 3, 1),
(25, '2023-02-04', NULL, NULL, 14, NULL, NULL, 5, NULL, 3, 1),
(26, '2023-02-04', 'PO11', 9885, 4, 5, 4, 2, 3, 3, 1);

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
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
