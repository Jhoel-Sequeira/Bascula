-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2023 at 04:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verificacion`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_cargo`
--

CREATE TABLE `tb_cargo` (
  `Id_Cargo` int(11) NOT NULL,
  `NombreCargo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_cargo`
--

INSERT INTO `tb_cargo` (`Id_Cargo`, `NombreCargo`) VALUES
(1, 'Digitador'),
(2, 'Verificador');

-- --------------------------------------------------------

--
-- Table structure for table `tb_credenciales`
--

CREATE TABLE `tb_credenciales` (
  `Id_Credenciales` int(11) NOT NULL,
  `Usuarios` text NOT NULL,
  `Contraseñas` text NOT NULL,
  `IdRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_credenciales`
--

INSERT INTO `tb_credenciales` (`Id_Credenciales`, `Usuarios`, `Contraseñas`, `IdRol`) VALUES
(1, 'admin', 'pbkdf2:sha256:260000$oHyhTtq7nPfH1cpN$12ecbb23be94f1fa3b12f4a864708ed18d674f432b09c24939f92376c31d2a03', 1),
(2, 'user', 'pbkdf2:sha256:260000$zCs8PeITU9qJh5VE$0e16649052a5ee0c881c4915b6abeee8be1af7f3ec8b39bea399dad2a78f5b57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detalleverificacion`
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

-- --------------------------------------------------------

--
-- Table structure for table `tb_estado`
--

CREATE TABLE `tb_estado` (
  `Id_Estado` int(11) NOT NULL,
  `NombreEstado` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_estado`
--

INSERT INTO `tb_estado` (`Id_Estado`, `NombreEstado`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `tb_material`
--

CREATE TABLE `tb_material` (
  `Id_Material` int(11) NOT NULL,
  `NombreMaterial` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Id_Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_material`
--

INSERT INTO `tb_material` (`Id_Material`, `NombreMaterial`, `IdOddo`, `Id_Estado`) VALUES
(1, 'Lata', NULL, 1),
(2, 'Cobre', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `Id_Proveedor` int(11) NOT NULL,
  `NombreProveedor` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_proveedor`
--

INSERT INTO `tb_proveedor` (`Id_Proveedor`, `NombreProveedor`, `IdOddo`, `IdEstado`) VALUES
(1, 'Proveedor 1', NULL, 1),
(2, 'Proveedor 2', NULL, 1),
(3, 'Proveedor 3', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_puntocompra`
--

CREATE TABLE `tb_puntocompra` (
  `Id_PuntoCompra` int(11) NOT NULL,
  `NombrePuntoCompra` text NOT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_puntocompra`
--

INSERT INTO `tb_puntocompra` (`Id_PuntoCompra`, `NombrePuntoCompra`, `IdEstado`) VALUES
(1, 'Caseta', 1),
(2, 'Bascula', 1),
(3, 'No Ferroso', 1),
(4, 'PET', 1),
(5, 'Sin Punto', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_roles`
--

CREATE TABLE `tb_roles` (
  `Id_Rol` int(11) NOT NULL,
  `NombreRol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_roles`
--

INSERT INTO `tb_roles` (`Id_Rol`, `NombreRol`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuarios`
--

CREATE TABLE `tb_usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `NombreUsuario` text NOT NULL,
  `IdCargo` int(11) NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `IdCredenciales` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`Id_Usuario`, `NombreUsuario`, `IdCargo`, `IdOddo`, `IdCredenciales`, `IdEstado`) VALUES
(1, 'Administrador', 1, NULL, 1, 1),
(2, 'Usuario', 2, NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_verificacion`
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
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cargo`
--
ALTER TABLE `tb_cargo`
  ADD PRIMARY KEY (`Id_Cargo`);

--
-- Indexes for table `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD PRIMARY KEY (`Id_Credenciales`),
  ADD KEY `IdRol` (`IdRol`);

--
-- Indexes for table `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  ADD PRIMARY KEY (`Id_DetalleVerificacion`),
  ADD KEY `IdVerificacion` (`IdVerificacion`),
  ADD KEY `IdMaterial` (`IdMaterial`);

--
-- Indexes for table `tb_estado`
--
ALTER TABLE `tb_estado`
  ADD PRIMARY KEY (`Id_Estado`);

--
-- Indexes for table `tb_material`
--
ALTER TABLE `tb_material`
  ADD PRIMARY KEY (`Id_Material`),
  ADD KEY `Id_Estado` (`Id_Estado`);

--
-- Indexes for table `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD KEY `IdEstado` (`IdEstado`);

--
-- Indexes for table `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  ADD PRIMARY KEY (`Id_PuntoCompra`),
  ADD KEY `IdEstado` (`IdEstado`);

--
-- Indexes for table `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indexes for table `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `IdCargo` (`IdCargo`),
  ADD KEY `IdCredenciales` (`IdCredenciales`);

--
-- Indexes for table `tb_verificacion`
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cargo`
--
ALTER TABLE `tb_cargo`
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  MODIFY `Id_PuntoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD CONSTRAINT `tb_credenciales_ibfk_1` FOREIGN KEY (`IdRol`) REFERENCES `tb_roles` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  ADD CONSTRAINT `tb_detalleverificacion_ibfk_1` FOREIGN KEY (`IdVerificacion`) REFERENCES `tb_verificacion` (`Id_Verificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_detalleverificacion_ibfk_2` FOREIGN KEY (`IdMaterial`) REFERENCES `tb_material` (`Id_Material`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_material`
--
ALTER TABLE `tb_material`
  ADD CONSTRAINT `tb_material_ibfk_1` FOREIGN KEY (`Id_Estado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD CONSTRAINT `tb_proveedor_ibfk_1` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  ADD CONSTRAINT `tb_puntocompra_ibfk_1` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  ADD CONSTRAINT `tb_usuarios_ibfk_1` FOREIGN KEY (`IdCargo`) REFERENCES `tb_cargo` (`Id_Cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuarios_ibfk_2` FOREIGN KEY (`IdCredenciales`) REFERENCES `tb_credenciales` (`Id_Credenciales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_verificacion`
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
