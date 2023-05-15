-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 10:23 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

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
(2, 'Verificador'),
(3, 'ADMINISTRADOR DE SISTEMA'),
(5, 'VALIDADOR'),
(6, 'SUPERVISOR');

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
(4, 'marcos.chavez@crn.com.ni', 'pbkdf2:sha256:260000$Gi8RLKrh7twtAM9C$d3a9c4af566e68ee13cac83794c6bf1662a72d830e629d54aadde0f42677f05c', 2),
(5, 'alvaro.lopez@crn.com.ni', 'pbkdf2:sha256:260000$KzqlyiuT0MBkpscd$91d3dcf12cc55bfbc211825dfdbf3b1757c845542f4cd3abb02fa4a614d03af0', 2),
(7, 'luisa.juarez@crn.com.ni', 'pbkdf2:sha256:260000$7UNZW62ptMiHbXlb$763fedec865d7aa01cd622792d5a6f168c9aa64eff06de805849924403ef0972', 2),
(9, 'orielka.loza@crn.com.ni', 'pbkdf2:sha256:260000$WvA5SBbDKyvorNhB$52c57820472e58d1828e574d79ae037d2fbadd654fa4356aa98078f8470ac9d1', 2),
(10, 'jonathan.sirias@crn.com.ni', 'pbkdf2:sha256:260000$6ZrbsZs5FNjJGLEQ$6ac4ba73261f38443435f7c48c72e830180817a761cb8650ed30c17e0728a337', 2),
(11, 'josue.lopez@crn.com.ni', 'pbkdf2:sha256:260000$zZfBB49oojsD8MYv$ab2b9b909de5ba69446b2d716b297b70f19b66a30f2975243aabd3f166ea16ae', 2),
(12, 'katiela.silva@crn.com.ni', 'pbkdf2:sha256:260000$kSQ4bsSaOwJGjFnO$bb5bbd6982a6f85d09612e56cdd71b1f49ff97876b474dc268fbd65cc3925f35', 2),
(14, 'Bryan.Oviedo@crn.com.ni', 'pbkdf2:sha256:260000$DlmgnI2GvIjvOuIt$7732673e1406a5c8316e1a30895ac836981fe507f5dfeec31ea83e907085ffbb', 1),
(16, 'valeria.pineda@crn.com.ni', 'pbkdf2:sha256:260000$o0EIgtMO8AJWd2rb$d743c736e9dd127b0e5d70df956cc6efcc16ff0a2bbdbd96811b047dd11babd8', 2),
(17, 'allan.medina@crn.com.ni', 'pbkdf2:sha256:260000$CI6pPAmWLAAT6rou$9a886aaaae52ed0e1ef378390c700a8cb8b03118ab2d3bf9dcabf3813b564ab1', 2),
(22, 'vivian.corea@crn.com.ni', 'pbkdf2:sha256:260000$sunReSBpra2hsquo$fdeb5ae9af1d8066c7aecf1504e8716d1a3d70f95829e10cec5ec075fa74928e', 2),
(23, 'jhoel.sequeira@crn.com.ni', 'pbkdf2:sha256:260000$sdIST47y2i4upzZS$d462c78ac08ac5d61174576c7712e71f19d35570966be92b6d82c223149cfb90', 1),
(24, 'bascula@crn.com.ni', 'pbkdf2:sha256:260000$Ln3VX01mHsCYjE5M$2581787ca044b00a2e9273dd1a10f1c416a590a87762ab59d1917add31d7528d', 2),
(26, 'doris.fonseca@crn.com.ni', 'pbkdf2:sha256:260000$benqWhDSgbq8KH0q$ceb7450346fc4eb34c7880482c97df457fdeccc7969f7d38c035bca7c624f049', 2),
(27, 'allan.guzman@crn.com.ni', 'pbkdf2:sha256:260000$UwpQRluniFhFm2WN$04f74b55c929154bd6ecb51bd4ee91b96965d5fa30737d6d585e52be085607e7', 2),
(28, 'digitador@crn.com.ni', 'pbkdf2:sha256:260000$yPyYHhg8LqajoJqu$b60824ec99a83813230b1316efdf2609863808dc99105fcbe142dfcb2c07f321', 2),
(29, 'fiscal.supervisor@crn.com.ni', 'pbkdf2:sha256:260000$bdmW5ZfNxuf05v7t$df4bfbdac8847277bbf0711c207911233b936e0ae286cd51df5048f8c0e5eb1d', 2),
(31, 'julio.perez@crn.com.ni', 'pbkdf2:sha256:260000$W29RKVRU5nfzqedS$ca9a03d2b6cbb1c196e1e9c809adabfef6883d6fa913aba931886d294815dbc5', 2),
(32, 'it@crn.com.ni', 'pbkdf2:sha256:260000$Ed0lStewQYBAAGPt$824fb523429568f51440b94af46915e02c6cf68d16887f59a947e801d9995699', 2),
(33, 'norma.cano@crn.com.ni', 'pbkdf2:sha256:260000$VKBP8TzAScY6mNKW$8833fbb1e074858c0a42cfbab0a4e64f70c932d61a2a99151fb0ce458357b340', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_cuadrilla`
--

CREATE TABLE `tb_cuadrilla` (
  `Id_CuadrillaJefe` int(11) NOT NULL,
  `NombreJefe` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_cuadrilla`
--

INSERT INTO `tb_cuadrilla` (`Id_CuadrillaJefe`, `NombreJefe`) VALUES
(28581, 'HOLDEMER SALAZAR JOSE');

-- --------------------------------------------------------

--
-- Table structure for table `tb_desbloqueos`
--

CREATE TABLE `tb_desbloqueos` (
  `Id_Desbloqueo` int(11) NOT NULL,
  `IdVerificacion` int(11) NOT NULL,
  `Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_desbloqueos`
--

INSERT INTO `tb_desbloqueos` (`Id_Desbloqueo`, `IdVerificacion`, `Fecha`) VALUES
(14, 934, '2023-05-11 12:51:16'),
(15, 939, '2023-05-11 13:05:18'),
(16, 1007, '2023-05-12 10:17:04'),
(17, 1064, '2023-05-15 14:04:19');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detalletara`
--

CREATE TABLE `tb_detalletara` (
  `Id_DetalleTara` int(11) NOT NULL,
  `IdDetalleVerificacion` int(11) NOT NULL,
  `Contenedor` text DEFAULT NULL,
  `ValorTaraExtra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Dumping data for table `tb_detalleverificacion`
--

INSERT INTO `tb_detalleverificacion` (`Id_DetalleVerificacion`, `IdVerificacion`, `IdMaterial`, `PesoBruto`, `PesoTara`, `PesoNeto`, `Destare`) VALUES
(1957, 908, 30, 17.2, 16, 1.2, 0),
(1958, 910, 30, 17.2, 16, 1.2, 0),
(1959, 910, 32, 43.7, 6, 37.7, 0),
(1962, 910, 28, 22.7, 16, 6.7, 0),
(1963, 908, 32, 43.7, 6, 37.7, 0),
(1964, 908, 28, 22.7, 16, 6.7, 0),
(1965, 911, 39, 42.2, 6, 36.2, 0),
(1966, 912, 39, 42.2, 6, 36.2, 0),
(1968, 912, 52, 54.7, 16, 38.7, 0),
(1969, 911, 52, 54.7, 16, 38.7, 0),
(1970, 911, 47, 15.7, 3.5, 12.2, 0),
(1971, 912, 47, 15.7, 3.5, 12.2, 0),
(1972, 911, 33, 90.7, 16, 67.7, 7),
(1973, 912, 33, 90.7, 16, 67.7, 7),
(1974, 911, 33, 11.7, 0, 5.7, 6),
(1975, 912, 33, 11.7, 0, 5.7, 6),
(1976, 914, 53, 1.2, 0, 1.2, 0),
(1977, 913, 53, 1.2, 0, 1.2, 0),
(1978, 913, 46, 22.2, 13.5, 8.7, 0),
(1979, 914, 46, 22.2, 13.5, 8.7, 0),
(1980, 916, 32, 92.2, 5.5, 86.7, 0),
(1981, 915, 32, 92.2, 5.5, 86.7, 0),
(1982, 918, 32, 19.7, 13.5, 6.2, 0),
(1983, 917, 32, 19.7, 13.5, 6.2, 0),
(1984, 918, 71, 5.2, 3.5, 1.7, 0),
(1985, 917, 71, 5.2, 3.5, 1.7, 0),
(1986, 918, 28, 6.2, 3.5, 2.7, 0),
(1987, 917, 28, 6.2, 3.5, 2.7, 0),
(1988, 918, 30, 4.7, 3.5, 1.2, 0),
(1989, 917, 30, 4.7, 3.5, 1.2, 0),
(1990, 917, 22, 35.7, 0, 35.7, 0),
(1991, 918, 22, 35.7, 0, 35.7, 0),
(1993, 919, 26, 5.2, 4.5, 0.7, 0),
(1994, 920, 26, 5.2, 4.5, 0.7, 0),
(1995, 919, 32, 21.7, 13.5, 8.2, 0),
(1996, 920, 32, 21.7, 13.5, 8.2, 0),
(1997, 920, 39, 5.2, 4.5, 0.7, 0),
(1998, 919, 39, 5.2, 4.5, 0.7, 0),
(1999, 922, 39, 153.2, 6, 147.2, 0),
(2000, 921, 39, 153.2, 6, 147.2, 0),
(2001, 923, 32, 31.7, 14, 17.7, 0),
(2002, 924, 32, 31.7, 14, 17.7, 0),
(2003, 924, 22, 3.7, 0, 3.7, 0),
(2004, 923, 22, 3.7, 0, 3.7, 0),
(2005, 922, 52, 113.7, 13.5, 100.2, 0),
(2007, 921, 52, 113.7, 13.5, 100.2, 0),
(2008, 921, 53, 92.2, 16, 76.2, 0),
(2009, 922, 53, 92.2, 16, 76.2, 0),
(2010, 926, 71, 1.7, 0, 1.7, 0),
(2011, 925, 71, 1.7, 0, 1.7, 0),
(2012, 925, 3, 1.2, 0, 1.2, 0),
(2013, 926, 3, 1.2, 0, 1.2, 0),
(2014, 926, 26, 4.7, 0, 4.7, 0),
(2015, 925, 26, 4.7, 0, 4.7, 0),
(2016, 926, 30, 1.2, 0, 1.2, 0),
(2017, 925, 30, 1.2, 0, 1.2, 0),
(2018, 921, 39, 109.2, 6, 103.2, 0),
(2019, 922, 39, 109.2, 6, 103.2, 0),
(2020, 928, 22, 239.2, 0, 239.2, 0),
(2021, 927, 22, 239.2, 0, 239.2, 0),
(2022, 927, 22, 116.2, 0, 116.2, 0),
(2023, 928, 22, 116.2, 0, 116.2, 0),
(2024, 922, 33, 29.7, 18.5, 9.7, 1.5),
(2025, 921, 33, 29.7, 18.5, 9.7, 1.5),
(2026, 928, 23, 35.7, 0, 35.7, 0),
(2027, 927, 23, 35.7, 0, 35.7, 0),
(2028, 930, 52, 4.2, 0, 4.2, 0),
(2029, 929, 52, 4.2, 0, 4.2, 0),
(2030, 930, 50, 2.2, 0, 1.7, 0.5),
(2031, 929, 50, 2.2, 0, 1.7, 0.5),
(2032, 927, 22, 22.2, 0, 22.2, 0),
(2033, 928, 22, 22.2, 0, 22.2, 0),
(2034, 930, 32, 0, 13.5, -13.5, 0),
(2035, 929, 32, 0, 13.5, -13.5, 0),
(2036, 928, 33, 1.7, 0, 1.2, 0.5),
(2037, 927, 33, 1.7, 0, 1.2, 0.5),
(2038, 927, 39, 6.7, 0.5, 6.2, 0),
(2039, 928, 39, 6.7, 0.5, 6.2, 0),
(2040, 932, 32, 24.7, 0.5, 24.2, 0),
(2041, 931, 32, 24.7, 0.5, 24.2, 0),
(2042, 930, 32, 90.2, 0, 90.2, 0),
(2043, 929, 32, 90.2, 0, 90.2, 0),
(2044, 932, 30, 2.7, 0, 2.7, 0),
(2045, 931, 30, 2.7, 0, 2.7, 0),
(2046, 933, 52, 9.7, 0, 9.7, 0),
(2047, 935, 52, 9.7, 0, 9.7, 0),
(2048, 930, 32, 80.2, 0, 80.2, 0),
(2049, 929, 32, 80.2, 0, 80.2, 0),
(2054, 938, 42, 44.7, 0, 44.7, 0),
(2055, 937, 42, 44.7, 0, 44.7, 0),
(2059, 936, 15, 82.7, 0, 82.7, 0),
(2060, 934, 15, 82.7, 0, 82.7, 0),
(2061, 934, 13, 4.7, 0, 4.7, 0),
(2062, 936, 13, 4.7, 0, 4.7, 0),
(2063, 941, 43, 74.7, 0, 74.7, 0),
(2064, 942, 43, 74.7, 0, 74.7, 0),
(2065, 939, 43, 154.2, 0, 154.2, 0),
(2066, 940, 43, 154.2, 0, 154.2, 0),
(2067, 946, 39, 129.2, 6.5, 122.7, 0),
(2068, 945, 39, 129.2, 6.5, 122.7, 0),
(2069, 947, 51, 11.7, 0, 11.2, 0.5),
(2070, 948, 51, 11.7, 0, 11.2, 0.5),
(2071, 948, 52, 19.7, 3.5, 16.2, 0),
(2072, 947, 52, 19.7, 3.5, 16.2, 0),
(2073, 943, 15, 814.2, 0, 814.2, 0),
(2074, 944, 15, 814.2, 0, 814.2, 0),
(2075, 946, 38, 13.2, 0, 13.2, 0),
(2076, 945, 38, 13.2, 0, 13.2, 0),
(2077, 949, 15, 31.2, 0, 31.2, 0),
(2078, 950, 15, 31.2, 0, 31.2, 0),
(2079, 946, 41, 6.2, 0, 6.2, 0),
(2080, 945, 41, 6.2, 0, 6.2, 0),
(2081, 946, 38, 2.7, 0, 2.7, 0),
(2082, 945, 38, 2.7, 0, 2.7, 0),
(2083, 945, 46, 40.7, 16, 24.7, 0),
(2084, 946, 46, 40.7, 16, 24.7, 0),
(2085, 943, 13, 155.7, 0, 155.7, 0),
(2086, 944, 13, 155.7, 0, 155.7, 0),
(2088, 946, 33, 40.2, 13.5, 23.7, 3),
(2090, 945, 33, 40.2, 13.5, 23.7, 3),
(2091, 951, 28, 35.2, 19, 16.2, 0),
(2092, 952, 28, 35.2, 19, 16.2, 0),
(2093, 951, 30, 11.7, 0, 11.7, 0),
(2094, 952, 30, 11.7, 0, 11.7, 0),
(2095, 953, 12, 63.2, 0, 56.2, 7),
(2096, 954, 12, 63.2, 0, 56.2, 7),
(2097, 943, 14, 15.2, 0, 15.2, 0),
(2098, 944, 14, 15.2, 0, 15.2, 0),
(2099, 943, 17, 45.7, 0, 45.7, 0),
(2100, 944, 17, 45.7, 0, 45.7, 0),
(2101, 956, 15, 197.2, 0, 197.2, 0),
(2102, 955, 15, 197.2, 0, 197.2, 0),
(2103, 952, 32, 87.7, 7, 80.7, 0),
(2104, 951, 32, 87.7, 7, 80.7, 0),
(2105, 952, 32, 78.7, 13.5, 65.2, 0),
(2106, 951, 32, 78.7, 13.5, 65.2, 0),
(2107, 958, 47, 79.2, 14, 65.2, 0),
(2108, 959, 47, 79.2, 14, 65.2, 0),
(2110, 956, 13, 6.7, 0, 6.7, 0),
(2111, 956, 14, 3.7, 0, 3.7, 0),
(2112, 955, 13, 6.7, 0, 6.7, 0),
(2113, 955, 14, 3.7, 0, 3.7, 0),
(2114, 960, 46, 25.2, 13.5, 11.7, 0),
(2115, 957, 46, 25.2, 13.5, 11.7, 0),
(2116, 960, 36, 6.2, 0, 6.2, 0),
(2117, 957, 36, 6.2, 0, 6.2, 0),
(2118, 960, 38, 5.2, 0, 5.2, 0),
(2119, 957, 38, 5.2, 0, 5.2, 0),
(2120, 960, 42, 11.7, 0, 11.7, 0),
(2121, 957, 42, 11.7, 0, 11.7, 0),
(2122, 960, 51, 4.7, 0, 4.7, 0),
(2123, 957, 51, 4.7, 0, 4.7, 0),
(2124, 960, 47, 24.2, 14.5, 9.7, 0),
(2125, 957, 47, 24.2, 14.5, 9.7, 0),
(2126, 960, 52, 14.7, 0, 14.7, 0),
(2127, 957, 52, 14.7, 0, 14.7, 0),
(2128, 957, 33, 63.2, 16, 42.2, 5),
(2129, 960, 33, 63.2, 16, 42.2, 5),
(2130, 952, 32, 84.2, 0, 84.2, 0),
(2131, 951, 32, 84.2, 0, 84.2, 0),
(2132, 962, 15, 552.2, 0, 552.2, 0),
(2133, 961, 15, 552.2, 0, 552.2, 0),
(2134, 965, 39, 25.2, 14, 11.2, 0),
(2135, 963, 39, 25.2, 14, 11.2, 0),
(2136, 963, 47, 0.2, 0, 0.2, 0),
(2137, 965, 47, 0.2, 0, 0.2, 0),
(2138, 965, 46, 0.7, 0, 0.7, 0),
(2139, 963, 46, 0.7, 0, 0.7, 0),
(2140, 967, 15, 21.2, 0, 21.2, 0),
(2141, 964, 15, 21.2, 0, 21.2, 0),
(2142, 967, 13, 4.2, 0, 4.2, 0),
(2143, 964, 13, 4.2, 0, 4.2, 0),
(2144, 961, 13, 76.7, 0, 76.7, 0),
(2145, 962, 13, 76.7, 0, 76.7, 0),
(2146, 961, 14, 14.7, 0, 14.7, 0),
(2147, 961, 17, 51.2, 0, 51.2, 0),
(2148, 968, 39, 47.7, 28, 19.7, 0),
(2149, 962, 14, 14.7, 0, 14.7, 0),
(2150, 962, 17, 51.2, 0, 51.2, 0),
(2151, 969, 39, 47.7, 28, 19.7, 0),
(2152, 969, 47, 25.2, 16, 9.2, 0),
(2153, 968, 47, 25.2, 16, 9.2, 0),
(2154, 969, 38, 3.7, 0, 3.7, 0),
(2155, 968, 38, 3.7, 0, 3.7, 0),
(2156, 969, 22, 269.7, 1, 268.7, 0),
(2157, 968, 22, 269.7, 1, 268.7, 0),
(2158, 974, 39, 79.7, 6.5, 73.2, 0),
(2159, 973, 39, 79.7, 6.5, 73.2, 0),
(2160, 978, 15, 72.7, 0, 72.7, 0),
(2161, 977, 15, 72.7, 0, 72.7, 0),
(2162, 978, 14, 64.7, 0, 64.7, 0),
(2163, 977, 14, 64.7, 0, 64.7, 0),
(2164, 978, 13, 4.2, 0, 4.2, 0),
(2165, 977, 13, 4.2, 0, 4.2, 0),
(2166, 974, 38, 9.7, 0, 9.7, 0),
(2167, 973, 38, 9.7, 0, 9.7, 0),
(2168, 974, 46, 36.7, 14.5, 22.2, 0),
(2169, 973, 46, 36.7, 14.5, 22.2, 0),
(2170, 974, 47, 5.2, 0, 5.2, 0),
(2171, 973, 47, 5.2, 0, 5.2, 0),
(2172, 972, 48, 41.2, 0, 41.2, 0),
(2173, 970, 48, 41.2, 0, 41.2, 0),
(2174, 980, 15, 505.2, 0, 505.2, 0),
(2175, 979, 15, 505.2, 0, 505.2, 0),
(2177, 974, 41, 29.7, 13, 16.2, 0.5),
(2178, 973, 41, 29.7, 13, 16.2, 0.5),
(2179, 974, 52, 31.7, 3.5, 28.2, 0),
(2180, 973, 52, 31.7, 3.5, 28.2, 0),
(2181, 974, 33, 18.2, 15, 2.7, 0.5),
(2183, 973, 33, 18.2, 15, 2.7, 0.5),
(2184, 979, 13, 57.7, 0, 57.7, 0),
(2185, 980, 13, 57.7, 0, 57.7, 0),
(2186, 979, 14, 9.2, 0, 9.2, 0),
(2187, 980, 14, 9.2, 0, 9.2, 0),
(2189, 975, 15, 177.2, 0, 177.2, 0),
(2191, 981, 26, 15.7, 13, 2.7, 0),
(2192, 982, 26, 15.7, 13, 2.7, 0),
(2193, 982, 39, 6.7, 3.5, 3.2, 0),
(2194, 981, 39, 6.7, 3.5, 3.2, 0),
(2196, 975, 13, 159.7, 0, 159.7, 0),
(2200, 976, 13, 159.7, 0, 159.7, 0),
(2201, 976, 15, 177.2, 0, 177.2, 0),
(2202, 975, 14, 3.7, 0, 3.7, 0),
(2203, 976, 14, 3.7, 0, 3.7, 0),
(2204, 975, 55, 38, 0, 38, 0),
(2205, 976, 55, 38, 0, 38, 0),
(2206, 982, 22, 87.7, 15, 72.7, 0),
(2207, 981, 22, 87.7, 15, 72.7, 0),
(2208, 986, 13, 4.2, 0, 4.2, 0),
(2209, 983, 13, 4.2, 0, 4.2, 0),
(2210, 990, 15, 149.7, 0, 149.7, 0),
(2211, 991, 15, 149.7, 0, 149.7, 0),
(2212, 987, 32, 30.7, 7, 23.7, 0),
(2213, 984, 32, 30.7, 7, 23.7, 0),
(2215, 987, 30, 16.7, 15, 1.7, 0),
(2216, 984, 30, 16.7, 15, 1.7, 0),
(2217, 987, 39, 3.7, 3.5, 0.2, 0),
(2218, 984, 39, 3.7, 3.5, 0.2, 0),
(2219, 990, 14, 19.2, 0, 19.2, 0),
(2220, 991, 14, 19.2, 0, 19.2, 0),
(2221, 989, 39, 82.7, 39, 43.7, 0),
(2222, 988, 39, 82.7, 39, 43.7, 0),
(2223, 992, 15, 285.2, 0, 285.2, 0),
(2224, 993, 15, 285.2, 0, 285.2, 0),
(2225, 992, 14, 6.7, 0, 6.7, 0),
(2226, 993, 14, 6.7, 0, 6.7, 0),
(2227, 992, 13, 11.2, 0, 11.2, 0),
(2228, 993, 13, 11.2, 0, 11.2, 0),
(2229, 989, 40, 35.7, 15, 20.7, 0),
(2230, 988, 40, 35.7, 15, 20.7, 0),
(2231, 994, 15, 361.2, 0, 361.2, 0),
(2232, 995, 15, 361.2, 0, 361.2, 0),
(2233, 989, 38, 6.2, 0, 6.2, 0),
(2234, 988, 38, 6.2, 0, 6.2, 0),
(2235, 989, 41, 80.7, 13, 67.7, 0),
(2236, 988, 41, 80.7, 13, 67.7, 0),
(2237, 988, 41, 0, 0, 0, 0),
(2238, 989, 52, 43.2, 4.5, 38.7, 0),
(2239, 988, 52, 43.2, 4.5, 38.7, 0),
(2240, 988, 51, 11.7, 0, 11.7, 0),
(2241, 989, 51, 11.7, 0, 11.7, 0),
(2242, 994, 13, 123.7, 0, 123.7, 0),
(2243, 995, 13, 123.7, 0, 123.7, 0),
(2244, 988, 33, 61.2, 14.5, 42.2, 4.5),
(2245, 989, 33, 61.2, 14.5, 42.2, 4.5),
(2246, 994, 14, 26.7, 0, 26.7, 0),
(2247, 995, 14, 26.7, 0, 26.7, 0),
(2248, 989, 46, 13.2, 4.5, 8.7, 0),
(2249, 989, 47, 12.7, 3.5, 9.2, 0),
(2250, 988, 47, 12.7, 3.5, 9.2, 0),
(2251, 988, 46, 13.2, 4.5, 8.7, 0),
(2252, 1000, 15, 589.2, 0, 589.2, 0),
(2253, 1001, 15, 589.2, 0, 589.2, 0),
(2254, 997, 41, 20.7, 0, 20.2, 0.5),
(2255, 996, 41, 20.7, 0, 20.2, 0.5),
(2256, 996, 52, 1.7, 0, 1.7, 0),
(2257, 997, 52, 1.7, 0, 1.7, 0),
(2258, 999, 32, 14.2, 0, 14.2, 0),
(2259, 998, 32, 14.2, 0, 14.2, 0),
(2260, 999, 71, 3.7, 0, 3.7, 0),
(2261, 998, 71, 3.7, 0, 3.7, 0),
(2262, 999, 30, 1.2, 0, 1.2, 0),
(2263, 998, 30, 1.2, 0, 1.2, 0),
(2264, 999, 28, 1.7, 0, 1.7, 0),
(2265, 998, 28, 1.7, 0, 1.7, 0),
(2266, 998, 26, 3.2, 0, 3.2, 0),
(2267, 999, 26, 3.2, 0, 3.2, 0),
(2268, 999, 32, 0, 1.5, -1.5, 0),
(2269, 998, 32, 0, 1.5, -1.5, 0),
(2270, 1001, 17, 60.7, 0, 60.7, 0),
(2271, 1000, 17, 60.7, 0, 60.7, 0),
(2272, 1002, 32, 68.2, 7, 61.2, 0),
(2273, 1003, 32, 68.2, 7, 61.2, 0),
(2274, 1003, 71, 8.7, 0, 8.7, 0),
(2275, 1002, 71, 8.7, 0, 8.7, 0),
(2276, 1003, 30, 3.7, 0, 3.7, 0),
(2277, 1002, 30, 3.7, 0, 3.7, 0),
(2278, 1006, 39, 0, 13, -13, 0),
(2279, 1005, 39, 0, 13, -13, 0),
(2280, 1006, 39, 109.7, 0, 109.7, 0),
(2281, 1005, 39, 109.7, 0, 109.7, 0),
(2282, 1000, 14, 119.7, 0, 119.7, 0),
(2283, 1001, 14, 119.7, 0, 119.7, 0),
(2284, 1006, 39, 46.2, 0, 46.2, 0),
(2285, 1005, 39, 46.2, 0, 46.2, 0),
(2286, 1000, 13, 64.7, 0, 64.7, 0),
(2287, 1001, 13, 64.7, 0, 64.7, 0),
(2288, 1005, 46, 28.7, 15, 13.7, 0),
(2289, 1006, 46, 28.7, 15, 13.7, 0),
(2290, 1005, 33, 10.7, 0, 9.7, 1),
(2291, 1006, 33, 10.7, 0, 9.7, 1),
(2292, 1006, 47, 17.2, 3.5, 13.7, 0),
(2293, 1005, 47, 17.2, 3.5, 13.7, 0),
(2294, 1005, 52, 21.2, 4.5, 16.7, 0),
(2295, 1006, 52, 21.2, 4.5, 16.7, 0),
(2296, 1006, 51, 4.7, 0, 4.7, 0),
(2297, 1005, 51, 4.7, 0, 4.7, 0),
(2298, 1012, 22, 157.7, 0, 157.7, 0),
(2299, 1011, 22, 157.7, 0, 157.7, 0),
(2300, 1007, 15, 2962.2, 0, 2962.2, 0),
(2301, 1009, 15, 2962.2, 0, 2962.2, 0),
(2302, 1013, 52, 3.7, 0, 3.7, 0),
(2303, 1014, 52, 3.7, 0, 3.7, 0),
(2304, 1016, 32, 42.7, 29.5, 13.2, 0),
(2305, 1015, 32, 42.7, 29.5, 13.2, 0),
(2306, 1016, 26, 5.2, 0, 5.2, 0),
(2307, 1015, 26, 5.2, 0, 5.2, 0),
(2308, 1015, 30, 2.2, 0, 2.2, 0),
(2309, 1016, 30, 2.2, 0, 2.2, 0),
(2310, 1016, 28, 1.7, 0, 1.7, 0),
(2311, 1015, 28, 1.7, 0, 1.7, 0),
(2313, 1016, 71, 1.7, 0, 1.7, 0),
(2314, 1015, 71, 1.7, 0, 1.7, 0),
(2315, 1016, 3, 0.7, 0, 0.7, 0),
(2316, 1015, 3, 0.7, 0, 0.7, 0),
(2317, 1016, 39, 0.7, 0, 0.7, 0),
(2318, 1015, 39, 0.7, 0, 0.7, 0),
(2319, 1016, 22, 7.2, 0, 7.2, 0),
(2320, 1015, 22, 7.2, 0, 7.2, 0),
(2321, 1020, 53, 1.2, 0, 1.2, 0),
(2322, 1019, 53, 1.2, 0, 1.2, 0),
(2323, 1019, 52, 9.7, 3.5, 6.2, 0),
(2324, 1020, 52, 9.7, 3.5, 6.2, 0),
(2325, 1024, 15, 29.2, 0, 29.2, 0),
(2326, 1023, 15, 29.2, 0, 29.2, 0),
(2327, 1007, 14, 96.2, 0, 96.2, 0),
(2328, 1009, 14, 96.2, 0, 96.2, 0),
(2329, 1007, 13, 55.2, 0, 55.2, 0),
(2331, 1009, 13, 55.2, 0, 55.2, 0),
(2332, 1022, 41, 54.7, 0, 52.2, 2.5),
(2333, 1021, 41, 54.7, 0, 52.2, 2.5),
(2334, 1021, 47, 17.2, 0, 17.2, 0),
(2335, 1022, 47, 17.2, 0, 17.2, 0),
(2336, 1022, 33, 81.7, 15, 59.7, 7),
(2337, 1021, 33, 81.7, 15, 59.7, 7),
(2338, 1021, 33, 15.7, 0, 5.7, 10),
(2339, 1022, 33, 15.7, 0, 5.7, 10),
(2340, 1022, 46, 30.2, 13, 17.2, 0),
(2341, 1021, 46, 30.2, 13, 17.2, 0),
(2342, 1021, 52, 32.7, 3.5, 29.2, 0),
(2343, 1022, 52, 32.7, 3.5, 29.2, 0),
(2344, 1022, 53, 12.2, 0, 12.2, 0),
(2345, 1021, 53, 12.2, 0, 12.2, 0),
(2346, 1022, 51, 7.7, 0, 7.2, 0.5),
(2347, 1021, 51, 7.7, 0, 7.2, 0.5),
(2348, 1021, 50, 11.7, 0, 11.7, 0),
(2349, 1022, 50, 11.7, 0, 11.7, 0),
(2350, 1017, 15, 405.2, 0, 405.2, 0),
(2351, 1018, 15, 405.2, 0, 405.2, 0),
(2352, 1027, 52, 14.2, 3.5, 10.7, 0),
(2353, 1028, 52, 14.2, 3.5, 10.7, 0),
(2354, 1027, 53, 7.7, 0, 7.7, 0),
(2355, 1028, 53, 7.7, 0, 7.7, 0),
(2356, 1027, 39, 67.7, 7, 60.7, 0),
(2357, 1028, 39, 67.7, 7, 60.7, 0),
(2358, 1017, 13, 171.2, 0, 171.2, 0),
(2359, 1018, 13, 171.2, 0, 171.2, 0),
(2360, 1025, 15, 75.2, 0, 75.2, 0),
(2361, 1026, 15, 75.2, 0, 75.2, 0),
(2362, 1026, 14, 17.2, 0, 17.2, 0),
(2363, 1025, 14, 17.2, 0, 17.2, 0),
(2365, 1025, 13, 21.7, 0, 21.7, 0),
(2366, 1026, 13, 21.7, 0, 21.7, 0),
(2367, 1017, 17, 34.7, 0, 34.7, 0),
(2368, 1018, 17, 34.7, 0, 34.7, 0),
(2369, 1017, 14, 50.2, 0, 50.2, 0),
(2370, 1018, 14, 50.2, 0, 50.2, 0),
(2371, 1030, 22, 426.7, 0, 426.7, 0),
(2372, 1029, 22, 426.7, 0, 426.7, 0),
(2373, 1032, 39, 0, 7, -7, 0),
(2374, 1034, 15, 369.2, 0, 369.2, 0),
(2375, 1035, 15, 369.2, 0, 369.2, 0),
(2376, 1034, 13, 4.2, 0, 4.2, 0),
(2377, 1035, 13, 4.2, 0, 4.2, 0),
(2378, 1031, 39, 147.7, 0, 147.7, 0),
(2379, 1032, 39, 147.7, 0, 147.7, 0),
(2380, 1031, 39, 0, 7, -7, 0),
(2381, 1032, 33, 127.2, 15, 92.2, 20),
(2382, 1031, 33, 127.2, 15, 92.2, 20),
(2383, 1032, 46, 16.2, 5, 11.2, 0),
(2384, 1031, 46, 16.2, 5, 11.2, 0),
(2385, 1032, 47, 36.7, 13.5, 23.2, 0),
(2386, 1031, 47, 36.7, 13.5, 23.2, 0),
(2387, 1031, 52, 13.2, 3.5, 9.7, 0),
(2388, 1032, 52, 13.2, 3.5, 9.7, 0),
(2389, 1032, 38, 2.7, 0, 2.7, 0),
(2390, 1031, 38, 2.7, 0, 2.7, 0),
(2391, 1037, 22, 147.7, 0, 147.7, 0),
(2392, 1033, 22, 147.7, 0, 147.7, 0),
(2393, 1036, 15, 43.2, 0, 43.2, 0),
(2394, 1038, 15, 43.2, 0, 43.2, 0),
(2395, 1042, 39, 19.2, 13, 6.2, 0),
(2396, 1044, 39, 19.2, 13, 6.2, 0),
(2398, 1042, 41, 27.7, 15, 12.2, 0.5),
(2399, 1044, 41, 27.7, 15, 12.2, 0.5),
(2400, 1044, 46, 32.7, 14.5, 18.2, 0),
(2401, 1042, 46, 32.7, 14.5, 18.2, 0),
(2402, 1044, 38, 0.7, 0, 0.7, 0),
(2403, 1042, 38, 0.7, 0, 0.7, 0),
(2404, 1042, 2, 30.7, 13.5, 17.2, 0),
(2405, 1044, 2, 30.7, 13.5, 17.2, 0),
(2407, 1042, 52, 9.7, 3.5, 6.2, 0),
(2408, 1044, 52, 9.7, 3.5, 6.2, 0),
(2409, 1039, 15, 2452.7, 0, 2452.7, 0),
(2410, 1040, 15, 2452.7, 0, 2452.7, 0),
(2411, 1046, 32, 101.7, 14, 87.7, 0),
(2412, 1047, 32, 101.7, 14, 87.7, 0),
(2413, 1047, 32, 102.2, 0, 102.2, 0),
(2414, 1046, 32, 102.2, 0, 102.2, 0),
(2415, 1049, 15, 57.2, 0, 57.2, 0),
(2416, 1048, 15, 57.2, 0, 57.2, 0),
(2417, 1043, 13, 184.2, 0, 184.2, 0),
(2418, 1045, 13, 184.2, 0, 184.2, 0),
(2419, 1045, 15, 19.2, 0, 19.2, 0),
(2420, 1043, 15, 19.2, 0, 19.2, 0),
(2421, 1051, 14, 48.7, 0, 48.7, 0),
(2422, 1050, 14, 48.7, 0, 48.7, 0),
(2423, 1050, 15, 55.2, 0, 55.2, 0),
(2424, 1051, 15, 55.2, 0, 55.2, 0),
(2425, 1052, 32, 0, 17.5, -17.5, 0),
(2426, 1053, 32, 0, 17.5, -17.5, 0),
(2427, 1056, 15, 287.7, 0, 287.7, 0),
(2428, 1057, 15, 287.7, 0, 287.7, 0),
(2429, 1056, 13, 45.2, 0, 45.2, 0),
(2430, 1057, 13, 45.2, 0, 45.2, 0),
(2431, 1040, 13, 697.7, 0, 697.7, 0),
(2432, 1039, 13, 697.7, 0, 697.7, 0);

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
(3, 'Pendiente'),
(4, 'COMPLETADO'),
(5, 'Validar'),
(6, 'ANULADO'),
(7, 'BLOQUEADO'),
(8, 'PROCESANDO'),
(9, 'VALIDADO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_material`
--

CREATE TABLE `tb_material` (
  `Id_Material` int(11) NOT NULL,
  `NombreMaterial` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Id_Estado` int(11) NOT NULL,
  `TipoMaterial` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_material`
--

INSERT INTO `tb_material` (`Id_Material`, `NombreMaterial`, `IdOddo`, `Id_Estado`, `TipoMaterial`) VALUES
(2, 'ACERO 201', NULL, 1, NULL),
(3, 'PET L TRANSPARENTE', NULL, 1, 'Primera'),
(4, 'PET PREFORMA VERDE', NULL, 1, 'Primera'),
(5, 'PET PREFORMA TRANSPARENTE', NULL, 1, 'Primera'),
(6, 'PET PREFORMA CELESTE', NULL, 1, 'Primera'),
(7, 'PRIX COLA', NULL, 1, 'Primera'),
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
(25, 'GALÓN 2', NULL, 1, 'Segunda'),
(26, 'GALON', NULL, 1, 'Primera'),
(27, 'PET VERDE 2', NULL, 1, 'Segunda'),
(28, 'PET VERDE', NULL, 1, 'Primera'),
(29, 'PET CELESTE 2', NULL, 1, 'Segunda'),
(30, 'PET CELESTE', NULL, 1, 'Primera'),
(31, 'PET SEGUNDA TRANSPARENTE', NULL, 1, 'Segunda'),
(32, 'PET TRANSPARENTE', NULL, 1, 'Primera'),
(33, 'ALUMINIO MIXTO', NULL, 1, NULL),
(34, 'LATA B', NULL, 1, NULL),
(35, 'LATA AEROSOL', NULL, 1, NULL),
(36, 'CONDENSADOR', NULL, 1, NULL),
(37, 'ACERO 321', NULL, 1, NULL),
(38, 'ALUMINIO RADIADOR', NULL, 1, NULL),
(39, 'LATA', NULL, 1, NULL),
(40, 'TUBERÍA', NULL, 1, NULL),
(41, 'PERFIL DE SEGUNDA', NULL, 1, NULL),
(42, 'RINES', NULL, 1, NULL),
(43, 'LITOGRAFÍA', NULL, 1, NULL),
(44, 'PERFIL', NULL, 1, NULL),
(45, 'CABLE LIMPIO', NULL, 1, NULL),
(46, 'ALUMINIO BLANDO', NULL, 1, NULL),
(47, 'ALUMINIO SÓLIDO', NULL, 1, NULL),
(48, 'ZIPPER BRONCE AMARILLO', NULL, 1, NULL),
(49, 'BRONCE VIRUTA', NULL, 1, NULL),
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
(64, 'Rechazo (Lata)', NULL, 1, NULL),
(66, 'ACERO 304', NULL, 1, NULL),
(68, 'CHATARRA SOLIDA F', NULL, 1, NULL),
(69, 'COBRE SUCIO', NULL, 1, NULL),
(70, 'MONEDAS BRONCE AMARILLO', NULL, 1, NULL),
(71, 'PET RAPTOR', NULL, 1, NULL),
(72, 'VIRUTA DE COBRE', NULL, 1, NULL),
(73, 'DEVOLUCION MATERIAL', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `Id_Proveedor` int(11) NOT NULL,
  `NombreProveedor` text NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `Cedula` text DEFAULT NULL,
  `IdEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_proveedor`
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
(53, 'ADRIANA DEL CARMEN RAMIREZ', 29922, NULL, 1),
(54, 'HUBERT ROMAN PICADO', 3215, NULL, 1),
(55, 'MIGUEL JOSE GUIDO RODRIGUEZ', 6222, NULL, 1),
(56, '', 30531, NULL, 1),
(57, 'VIDAL ANTONIO ULLOA', 1231, NULL, 1),
(58, 'JOEL GUILLERMO SARMIENTO QUINTERO', 1235, NULL, 1),
(59, 'ALAIN ERNESTO YAÑES MADERAS', 1967, NULL, 1),
(60, 'ALEJANDRO HUMBERTO RAYO', 25118, NULL, 1),
(61, 'PROVEEDOR EVENTUAL', 1973, NULL, 1),
(62, 'JUAN PEREZ ESTRELLA', 30539, NULL, 1),
(63, 'IVAN JOSE ROMERO SOTO.', 5865, NULL, 1),
(64, 'GESSLER JORDY NAVAS/PROVEEDOR', 26019, NULL, 1),
(65, 'OLINTO JOSE PANIAGUA MANZANAREZ', 2733, NULL, 1),
(66, 'CESAR AUGUSTO VANEGA JUAREZ', 3308, NULL, 1),
(67, 'JORLAN DAVID OROZCO RAMIREZ', 26091, NULL, 1),
(68, 'DANILO ENRIQUE GUERRERO RAMIREZ', 29998, NULL, 1),
(69, 'EDUARDO JOSE CASTRO', 3660, NULL, 1),
(70, 'BERMAN DE JESUS HERNANDEZ', 30601, NULL, 1),
(71, 'HERVIN JOSE RUEDA SANCHEZ', 3718, NULL, 1),
(72, 'ARMANDO HUMBERTO SANTAMARIA LOPEZ', 1927, NULL, 1),
(73, 'EDUARDO GONZALO LARGAESPADA ALEMAN', 25456, NULL, 1),
(74, 'EDUARDO JOSE LARGAESPADA LOPEZ', 5806, NULL, 1),
(75, 'HENRY ROSENDO PAVON DUARTE', 28380, NULL, 1),
(76, 'OSCAR ANTONIO TALENO', 1882, NULL, 1),
(77, 'PEDRO PABLO DIAZ PEREZ', 2146, NULL, 1),
(78, 'KEVIN AXEL SOLIZ MENDOZA', 30663, NULL, 1),
(79, 'JUNIER ANTONIO SERRANO GUZMAN', 28076, NULL, 1),
(80, 'MEYLING NEFREK AGUILAR BLANDON.', 30402, NULL, 1),
(81, 'PEDRO GERARDO ROMERO CHACON', 5561, NULL, 1),
(82, 'JAVIER ANTONIO BONILLA', 25774, NULL, 1),
(83, 'RUNEL  DE JESUS ESPINOZA LOPEZ', 29393, NULL, 1),
(84, 'RAFAEL ANDRES BARTRES GARCIA', 4273, NULL, 1),
(85, 'FERNANDO ISABEL ROCHA', 31144, NULL, 1),
(86, 'MARIO ISMAEL PEREZ RIVERA', 31145, NULL, 1),
(87, 'APOLONIO ANTONIO JARQUIN HERNANDEZ', 28355, NULL, 1),
(88, 'PABLO ALBERTO CENTENO TORREZ', 7003, NULL, 1),
(89, 'PEDRO ALBERTO GARCIA SALAZAR', 31146, NULL, 1),
(90, 'DIGITAL PRINTING S.A', 31147, NULL, 1),
(91, 'OSMAN NOLBERTO VALLEJOS HERNANDEZ', 31148, NULL, 1),
(92, 'RITA ELENA TORREZ GARCIA', 5750, NULL, 1),
(93, 'CARLOS IVAN ROCHA ACUÑA', 29618, NULL, 1),
(94, 'ANA JACOBA NOVOA SOMARRIBA', 27559, NULL, 1),
(95, 'ENMANUEL ANTONIO MARTINEZ CALERO', 1243, NULL, 1),
(96, 'JAIRO ALBERTO MORALES ACUÑA', 31149, NULL, 1),
(97, 'BRAYAM ALEXANDER MENDEZ GUZMAN', 28044, NULL, 1),
(98, 'BRAYAM ALEXANDER MENDEZ GUZMAN', 28044, NULL, 1),
(99, 'JORGE MARCELO RAMIREZ', 2892, NULL, 1),
(100, 'ARNOLDO FRANCISCO RAMIREZ', 26588, NULL, 1),
(101, 'HERRY FRANCISCO SALGADO PINEDA', 31150, NULL, 1),
(102, 'DARWIN ESTEBAN URBINA MEJIA', 30255, NULL, 1),
(103, 'BAYARDO JOSE GONZALEZ VANEGAS', 28200, NULL, 1),
(104, 'NOE ABRAHAM AGUIRRE HERNANDEZ', 29967, NULL, 1),
(105, 'ARLEN CRECENSIO GONZALEZ PEREZ', 31155, NULL, 1),
(106, 'RONALD AUGUSTO GUERRERO PERALTA', 30720, NULL, 1),
(107, 'JUAN ENRIQUE ACEVEDO', 29427, NULL, 1),
(108, 'LUIS CARLOS SANDOVAL CHAVEZ', 26196, NULL, 1),
(109, 'ELIEZER ALEXANDER AGUILAR MORALES', 2354, NULL, 1),
(110, 'Jaffett Daniel Marenco', 2078, NULL, 1),
(111, 'COSME DAMIAN ALVAREZ', 26115, NULL, 1),
(112, 'ROBERTO DE JESUS ORTUÑO ROCHA', 1247, NULL, 1),
(113, 'ANA CRISTINA GARCIA SOLORZANO', 28602, NULL, 1),
(114, 'GABRIEL DE JESUS RUGAMA OCON', 26366, NULL, 1),
(115, 'LUZ MARINA RAMOS CALERO', 30458, NULL, 1),
(116, 'FRANCISCO ANTONIO BENAVIDES MEJIA', 31158, NULL, 1),
(117, 'JUAN ALEJANDRO PANIAGUA DAVILA', 1890, NULL, 1),
(118, 'DORA ARGENTINA NOGUERA VELASQUEZ', 3650, NULL, 1),
(119, 'MARTIN ALONSO LARA', 27808, NULL, 1),
(120, 'JEREMIAS JOSE RAMOS ALANIZ', 27667, NULL, 1),
(121, 'ARACELLY DEL SOCORRO GARCIA ARAICA', 3240, NULL, 1),
(122, 'OTONIEL ENRIQUE RIVAS MENDOZA', 29610, NULL, 1),
(123, 'RAMON EMILIO MOLINA MONDRAGON', 28273, NULL, 1),
(124, 'DARWIN ROMMEL VEGA MEDINA', 28895, NULL, 1);

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
(1, 'GRANEL/PLANTA: Receipts', 1),
(5, 'Sin Punto', 1),
(10, 'CASETA: Recepciones', 1),
(26, 'CHATARRA: Recepciones', 1),
(115, 'MOVIL: Recepciones', 1);

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
  `Cedula` text DEFAULT NULL,
  `IdCargo` int(11) NOT NULL,
  `IdOddo` int(11) DEFAULT NULL,
  `IdCredenciales` int(11) NOT NULL,
  `IdEstado` int(11) NOT NULL,
  `IdPuesto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_usuarios`
--

INSERT INTO `tb_usuarios` (`Id_Usuario`, `NombreUsuario`, `Cedula`, `IdCargo`, `IdOddo`, `IdCredenciales`, `IdEstado`, `IdPuesto`) VALUES
(4, 'MARCOS ANTONIO CHAVEZ MARTINEZ', '', 2, NULL, 4, 1, 10),
(5, 'ALVARO LÓPEZ', NULL, 1, 258, 5, 1, 1),
(7, 'LUISA ESTHER JUAREZ BERRIOS', '', 2, NULL, 7, 1, 1),
(9, 'ORIELKA YASKARI LOZA VASQUEZ', '', 2, NULL, 9, 1, 10),
(10, 'JONATHAN EDUARDO SIRIAS SOTELO', '', 2, NULL, 10, 1, 1),
(11, 'JOSUE NEHEMIAS LOPEZ ESPINOZA', '', 2, NULL, 11, 1, 1),
(12, 'KATIELA NAHILEA SILVA REYES', '', 2, NULL, 12, 1, 1),
(14, 'IT Administrador', NULL, 3, 132, 14, 1, 1),
(16, 'VALERIA PINEDA', NULL, 5, 238, 16, 1, 1),
(17, 'ALLAN MEDINA', NULL, 1, 288, 17, 1, 1),
(22, 'VIVIAN COREA', NULL, 1, 275, 22, 1, 1),
(23, 'JHOEL SEQUEIRA', NULL, 3, 273, 23, 1, 1),
(24, 'VALERIA PINEDA', NULL, 5, 238, 24, 1, 1),
(26, 'DORIS FONSECA', NULL, 6, 218, 26, 1, 1),
(27, 'ALLAN JAVIER GUZMAN REYES', '561-290101-1001J', 2, NULL, 27, 1, 10),
(28, 'DIGITADOR', NULL, 1, 300, 28, 1, 10),
(29, 'FISCAL / SUPERVISOR PET', NULL, 6, 185, 29, 1, 1),
(31, 'JULIO PÉREZ', NULL, 1, 301, 31, 1, 10),
(32, 'CARLOS GUEVARA', NULL, 5, 214, 32, 1, 1),
(33, 'NORMA MARGARITA CANO', '001-170499-1028K', 2, NULL, 33, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_validacion`
--

CREATE TABLE `tb_validacion` (
  `Id_Validacion` int(11) NOT NULL,
  `IdVerificacion` int(11) NOT NULL,
  `TipoMaterial` text NOT NULL,
  `PesoBascula` float NOT NULL,
  `Variacion1` float NOT NULL,
  `Variacion2` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_validacion`
--

INSERT INTO `tb_validacion` (`Id_Validacion`, `IdVerificacion`, `TipoMaterial`, `PesoBascula`, `Variacion1`, `Variacion2`) VALUES
(33, 943, 'Bateria', 740, 0, -292),
(34, 943, 'Bateria', 740, 0, -292),
(35, 961, 'Bateria', 660, 0, -36),
(36, 979, 'Bateria', 680, -80, 27),
(37, 975, 'Bateria', 380, 0, 0.2),
(38, 992, 'Bateria', 300, 0, -4),
(39, 994, 'Bateria', 500, 0, -12.5),
(40, 1000, 'Bateria', 840, 0, 4.5),
(41, 1007, 'Bateria', 3100, 0, -14.5),
(42, 1017, 'Bateria', 740, 0, 77.5),
(43, 1056, 'Bateria', 620, -80, 206.5),
(44, 1056, 'Bateria', 620, -80, 206.5),
(45, 1056, 'Bateria', 620, -80, 206.5);

-- --------------------------------------------------------

--
-- Table structure for table `tb_verificacion`
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
  `IdUsuarioCreacion` int(11) NOT NULL,
  `IdJefeCuadrilla` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_verificacion`
--

INSERT INTO `tb_verificacion` (`Id_Verificacion`, `Fecha`, `PO`, `NoBoleta`, `IdProveedor`, `IdVerificador`, `IdDigitador`, `IdPuntoCompra`, `Bahia`, `IdEstado`, `IdUsuarioCreacion`, `IdJefeCuadrilla`) VALUES
(908, '2023-05-11 11:02:26', 'PO184177', 'CS1', 82, 27, 31, 10, 1, 4, 31, NULL),
(910, '2023-05-11 11:02:44', 'PO184177', 'CS1', 82, 27, 31, 10, 1, 4, 27, NULL),
(911, '2023-05-11 11:13:08', 'PO184179', 'CS2', 76, 27, 31, 10, 1, 4, 31, NULL),
(912, '2023-05-11 11:13:09', 'PO184179', 'CS2', 76, 27, 31, 10, 1, 4, 27, NULL),
(913, '2023-05-11 11:29:01', 'PO184180', 'CS3', 76, 27, 31, 10, 1, 4, 31, NULL),
(914, '2023-05-11 11:29:03', 'PO184180', 'CS3', 76, 27, 31, 10, 1, 4, 27, NULL),
(915, '2023-05-11 11:32:33', 'PO184191', 'CS4', 83, 27, 31, 10, 1, 4, 27, NULL),
(916, '2023-05-11 11:32:33', 'PO184191', 'CS4', 83, 27, 31, 10, 1, 4, 31, NULL),
(917, '2023-05-11 11:36:42', 'PO184186', 'CS5', 73, 27, 31, 10, 1, 4, 31, NULL),
(918, '2023-05-11 11:36:45', 'PO184186', 'CS5', 73, 27, 31, 10, 1, 4, 27, NULL),
(919, '2023-05-11 11:44:42', 'PO184190', 'CS6', 84, 27, 31, 10, 1, 4, 31, NULL),
(920, '2023-05-11 11:44:43', 'PO184190', 'CS6', 84, 27, 31, 10, 1, 4, 27, NULL),
(921, '2023-05-11 11:50:33', 'PO184202', 'CS7', 85, 27, 31, 10, 1, 4, 31, NULL),
(922, '2023-05-11 11:50:40', 'PO184202', 'CS7', 85, 27, 31, 10, 1, 4, 27, NULL),
(923, '2023-05-11 11:54:07', 'PO184193', 'CS8', 61, 27, 31, 10, 2, 4, 31, NULL),
(924, '2023-05-11 11:54:12', 'PO184193', 'CS8', 61, 27, 31, 10, 2, 4, 27, NULL),
(925, '2023-05-11 12:06:18', 'PO184196', 'CS9', 61, 27, 31, 10, 2, 4, 31, NULL),
(926, '2023-05-11 12:07:16', 'PO184196', 'CS9', 61, 27, 31, 10, 2, 4, 27, NULL),
(927, '2023-05-11 12:10:01', 'PO184209', 'CS10', 86, 27, 31, 10, 2, 4, 31, NULL),
(928, '2023-05-11 12:10:06', 'PO184209', 'CS10', 86, 27, 31, 10, 2, 4, 27, NULL),
(929, '2023-05-11 12:27:19', 'PO184213', 'CS11', 87, 27, 31, 10, 1, 4, 31, NULL),
(930, '2023-05-11 12:27:21', 'PO184213', 'CS11', 87, 27, 31, 10, 1, 4, 27, NULL),
(931, '2023-05-11 12:33:58', 'PO184207', 'CS12', 88, 27, 31, 10, 2, 4, 31, NULL),
(932, '2023-05-11 12:34:04', 'PO184207', 'CS12', 88, 27, 31, 10, 2, 4, 27, NULL),
(933, '2023-05-11 12:42:15', 'PO184210', 'CS13', 89, 27, 31, 10, 1, 4, 31, NULL),
(934, '2023-05-11 12:42:18', 'PO184219', 'CS14', 71, 27, 31, 10, 2, 4, 31, NULL),
(935, '2023-05-11 12:42:24', 'PO184210', 'CS13', 89, 27, 31, 10, 1, 4, 27, NULL),
(936, '2023-05-11 12:47:10', 'PO184219', 'CS14', 71, 27, 31, 10, 2, 4, 27, NULL),
(937, '2023-05-11 12:50:49', 'PO184216', 'CS15', 71, 27, 31, 10, 2, 4, 31, NULL),
(938, '2023-05-11 12:50:55', 'PO184216', 'CS15', 71, 27, 31, 10, 2, 4, 27, NULL),
(939, '2023-05-11 12:55:27', 'PO184221', 'CS16', 90, 27, 31, 10, 2, 4, 31, NULL),
(940, '2023-05-11 12:56:22', 'PO184221', 'CS16', 90, 27, 31, 10, 2, 4, 27, NULL),
(941, '2023-05-11 13:01:36', 'PO184220', 'CS17', 91, 27, 31, 10, 2, 4, 31, NULL),
(942, '2023-05-11 13:01:39', 'PO184220', 'CS17', 91, 27, 31, 10, 2, 4, 27, NULL),
(943, '2023-05-11 13:09:55', 'PO184247', '71524', 47, 27, 31, 10, 2, 5, 27, NULL),
(944, '2023-05-11 13:09:55', 'PO184247', '71524', 47, 27, 31, 10, 2, 5, 31, NULL),
(945, '2023-05-11 14:24:52', 'PO184244', 'CS18', 92, 27, 31, 10, 1, 4, 31, NULL),
(946, '2023-05-11 14:24:57', 'PO184244', 'CS18', 92, 27, 31, 10, 1, 4, 27, NULL),
(947, '2023-05-11 14:25:03', 'PO184237', 'CS19', 79, 27, 31, 10, 1, 4, 31, NULL),
(948, '2023-05-11 14:25:04', 'PO184237', 'CS19', 79, 27, 31, 10, 1, 4, 27, NULL),
(949, '2023-05-11 14:25:11', 'PO184240', 'CS20', 93, 27, 31, 10, 2, 4, 31, NULL),
(950, '2023-05-11 14:25:13', 'PO184240', 'CS20', 93, 27, 31, 10, 2, 4, 27, NULL),
(951, '2023-05-11 14:52:17', 'PO184259', 'CS21', 71, 27, 31, 10, 1, 4, 31, NULL),
(952, '2023-05-11 14:52:24', 'PO184259', 'CS21', 71, 27, 31, 10, 1, 4, 27, NULL),
(953, '2023-05-11 14:52:27', 'PO184255', 'CS22', 94, 27, 31, 10, 1, 4, 31, NULL),
(954, '2023-05-11 14:52:29', 'PO184255', 'CS22', 94, 27, 31, 10, 1, 4, 27, NULL),
(955, '2023-05-11 14:52:33', 'PO184254', 'CS23', 95, 27, 31, 10, 2, 4, 31, NULL),
(956, '2023-05-11 14:52:37', 'PO184254', 'CS23', 95, 27, 31, 10, 2, 4, 27, NULL),
(957, '2023-05-11 15:02:05', 'PO184258', 'CS24', 97, 27, 31, 10, 1, 4, 31, NULL),
(958, '2023-05-11 15:02:14', 'PO184251', 'CS25', 96, 27, 31, 10, 1, 4, 31, NULL),
(959, '2023-05-11 15:02:57', 'PO184251', 'CS25', 96, 27, 31, 10, 1, 4, 27, NULL),
(960, '2023-05-11 15:09:32', 'PO184258', 'CS24', 98, 27, 31, 10, 1, 4, 27, NULL),
(961, '2023-05-11 15:23:16', 'PO184279', '71546', 99, 27, 31, 10, 2, 9, 27, NULL),
(962, '2023-05-11 15:25:01', 'PO184279', '71546', 99, 27, 31, 10, 2, 9, 31, NULL),
(963, '2023-05-11 15:25:56', 'PO184261', 'CS26', 100, 27, 31, 10, 1, 4, 31, NULL),
(964, '2023-05-11 15:26:00', 'PO184263', 'CS27', 97, 27, 31, 10, 2, 4, 31, NULL),
(965, '2023-05-11 15:26:02', 'PO184261', 'CS26', 100, 27, 31, 10, 1, 4, 27, NULL),
(967, '2023-05-11 15:26:10', 'PO184263', 'CS27', 97, 27, 31, 10, 2, 4, 27, NULL),
(968, '2023-05-11 15:26:35', 'PO184280', 'CS28', 101, 27, 31, 10, 1, 4, 31, NULL),
(969, '2023-05-11 15:26:39', 'PO184280', 'CS28', 101, 27, 31, 10, 1, 4, 27, NULL),
(970, '2023-05-11 15:38:02', 'PO184348', 'CS30', 105, 27, 31, 10, 1, 4, 31, NULL),
(972, '2023-05-11 15:38:08', 'PO184348', 'CS30', 105, 27, 31, 10, 1, 4, 27, NULL),
(973, '2023-05-11 15:38:13', 'PO184351', 'CS31', 103, 27, 31, 10, 1, 4, 31, NULL),
(974, '2023-05-11 15:38:16', 'PO184351', 'CS31', 103, 27, 31, 10, 1, 4, 27, NULL),
(975, '2023-05-12 07:58:44', 'PO184353', '71606', 102, 27, 31, 10, 2, 9, 27, NULL),
(976, '2023-05-12 08:06:55', 'PO184353', '71606', 102, 27, 31, 10, 2, 9, 31, NULL),
(977, '2023-05-12 08:12:36', 'PO184346', 'CS32', 104, 27, 31, 10, 2, 4, 31, NULL),
(978, '2023-05-12 08:12:41', 'PO184346', 'CS32', 104, 27, 31, 10, 2, 4, 27, NULL),
(979, '2023-05-12 08:20:19', 'PO184350', '71610', 106, 27, 31, 10, 2, 9, 27, NULL),
(980, '2023-05-12 08:20:46', 'PO184350', '71610', 106, 27, 31, 10, 2, 9, 31, NULL),
(981, '2023-05-12 08:27:35', 'PO184354', 'CS33', 107, 27, 31, 10, 1, 4, 31, NULL),
(982, '2023-05-12 08:27:42', 'PO184354', 'CS33', 107, 27, 31, 10, 1, 4, 27, NULL),
(983, '2023-05-12 08:36:45', 'PO184356', 'CS34', 107, 27, 31, 10, 1, 4, 31, NULL),
(984, '2023-05-12 08:36:48', 'PO184357', 'CS35', 61, 27, 31, 10, 1, 4, 31, NULL),
(986, '2023-05-12 08:36:53', 'PO184356', 'CS34', 107, 27, 31, 10, 1, 4, 27, NULL),
(987, '2023-05-12 08:37:00', 'PO184357', 'CS35', 61, 27, 31, 10, 1, 4, 27, NULL),
(988, '2023-05-12 08:37:02', 'PO184366', 'CS36', 76, 27, 31, 10, 1, 4, 31, NULL),
(989, '2023-05-12 08:37:07', 'PO184366', 'CS36', 76, 27, 31, 10, 1, 4, 27, NULL),
(990, '2023-05-12 08:38:51', 'PO184358', '71617', 103, 27, 31, 10, 2, 4, 27, NULL),
(991, '2023-05-12 08:39:27', 'PO184358', '71617', 103, 27, 31, 10, 2, 4, 31, NULL),
(992, '2023-05-12 08:47:28', 'PO184361', '71613', 108, 27, 31, 10, 2, 9, 27, NULL),
(993, '2023-05-12 08:48:48', 'PO184361', '71613', 108, 27, 31, 10, 2, 9, 31, NULL),
(994, '2023-05-12 08:55:25', 'PO184364', '71622', 109, 27, 31, 10, 2, 9, 27, NULL),
(995, '2023-05-12 08:55:26', 'PO184364', '71622', 109, 27, 31, 10, 2, 9, 31, NULL),
(996, '2023-05-12 09:09:59', 'PO184367', 'CS38', 76, 27, 31, 10, 1, 4, 27, NULL),
(997, '2023-05-12 09:10:00', 'PO184367', 'CS38', 76, 27, 31, 10, 1, 4, 31, NULL),
(998, '2023-05-12 09:10:04', 'PO184368', 'CS39', 110, 27, 31, 10, 1, 4, 31, NULL),
(999, '2023-05-12 09:10:06', 'PO184368', 'CS39', 110, 27, 31, 10, 1, 4, 27, NULL),
(1000, '2023-05-12 09:10:15', 'PO184375', '71623', 57, 27, 31, 10, 2, 9, 27, NULL),
(1001, '2023-05-12 09:11:26', 'PO184375', '71623', 57, 27, 31, 10, 2, 9, 31, NULL),
(1002, '2023-05-12 09:20:39', 'PO184371', 'CS40', 61, 27, 31, 10, 1, 4, 31, NULL),
(1003, '2023-05-12 09:20:42', 'PO184371', 'CS40', 61, 27, 31, 10, 1, 4, 27, NULL),
(1005, '2023-05-12 09:20:54', 'PO184377', 'CS41', 104, 27, 31, 10, 1, 4, 31, NULL),
(1006, '2023-05-12 09:20:57', 'PO184377', 'CS41', 104, 27, 31, 10, 1, 4, 27, NULL),
(1007, '2023-05-12 09:36:47', 'PO184395', '71629', 65, 27, 31, 10, 2, 9, 27, NULL),
(1009, '2023-05-12 09:37:57', 'PO184395', '71629', 65, 27, 31, 10, 2, 9, 31, NULL),
(1011, '2023-05-12 09:44:06', 'PO184379', 'CS42', 111, 27, 31, 10, 1, 4, 31, NULL),
(1012, '2023-05-12 09:44:09', 'PO184379', 'CS42', 111, 27, 31, 10, 1, 4, 27, NULL),
(1013, '2023-05-12 09:44:14', 'PO184384', 'CS43', 61, 27, 31, 10, 1, 4, 27, NULL),
(1014, '2023-05-12 09:44:16', 'PO184384', 'CS43', 61, 27, 31, 10, 1, 4, 31, NULL),
(1015, '2023-05-12 09:48:16', 'PO184387', 'CS44', 61, 27, 31, 10, 3, 4, 31, NULL),
(1016, '2023-05-12 09:48:18', 'PO184387', 'CS44', 61, 27, 31, 10, 3, 4, 27, NULL),
(1017, '2023-05-12 09:50:05', 'PO184405', '71628', 112, 27, 31, 10, 2, 9, 27, NULL),
(1018, '2023-05-12 09:50:05', 'PO184405', '71628', 112, 27, 31, 10, 2, 9, 31, NULL),
(1019, '2023-05-12 10:00:36', 'PO184389', 'CS45', 113, 27, 31, 10, 1, 4, 31, NULL),
(1020, '2023-05-12 10:00:40', 'PO184389', 'CS45', 113, 27, 31, 10, 1, 4, 27, NULL),
(1021, '2023-05-12 10:00:43', 'PO184399', 'CS46', 114, 27, 31, 10, 1, 4, 31, NULL),
(1022, '2023-05-12 10:00:47', 'PO184399', 'CS46', 114, 27, 31, 10, 1, 4, 27, NULL),
(1023, '2023-05-12 10:04:35', 'PO184390', 'CS47', 61, 27, 31, 10, 1, 4, 31, NULL),
(1024, '2023-05-12 10:05:16', 'PO184390', 'CS47', 61, 27, 31, 10, 1, 4, 27, NULL),
(1025, '2023-05-12 10:15:45', 'PO184403', 'CS48', 114, 27, 31, 10, 1, 4, 31, NULL),
(1026, '2023-05-12 10:15:47', 'PO184403', 'CS48', 114, 27, 31, 10, 1, 4, 27, NULL),
(1027, '2023-05-12 10:29:56', 'PO184401', 'CS49', 115, 27, 31, 10, 1, 4, 27, NULL),
(1028, '2023-05-12 10:29:57', 'PO184401', 'CS49', 115, 27, 31, 10, 1, 4, 31, NULL),
(1029, '2023-05-12 10:30:02', 'PO184409', 'CS50', 116, 27, 31, 10, 1, 4, 27, NULL),
(1030, '2023-05-12 10:30:03', 'PO184409', 'CS50', 116, 27, 31, 10, 1, 4, 31, NULL),
(1031, '2023-05-12 10:47:42', 'PO184419', 'CS51', 117, 27, 31, 10, 2, 4, 31, NULL),
(1032, '2023-05-12 10:49:17', 'PO184419', 'CS51', 117, 27, 31, 10, 2, 4, 27, NULL),
(1033, '2023-05-12 10:59:25', 'PO184423', 'CS52', 119, 27, 31, 10, 1, 4, 31, NULL),
(1034, '2023-05-12 11:00:13', 'PO184416', '71642', 118, 27, 31, 10, 2, 5, 27, NULL),
(1035, '2023-05-12 11:00:57', 'PO184416', '71642', 118, 27, 31, 10, 2, 5, 31, NULL),
(1036, '2023-05-12 11:16:36', 'PO184424', 'CS53', 119, 27, 31, 10, 1, 4, 31, NULL),
(1037, '2023-05-12 11:16:50', 'PO184423', 'CS52', 119, 27, 31, 10, 1, 4, 27, NULL),
(1038, '2023-05-12 11:17:00', 'PO184424', 'CS53', 119, 27, 31, 10, 1, 4, 27, NULL),
(1039, '2023-05-12 11:25:45', '--', '71654', 34, 27, 31, 10, 2, 3, 31, NULL),
(1040, '2023-05-12 11:25:48', '--', '71654', 34, 27, 31, 10, 2, 3, 27, NULL),
(1042, '2023-05-12 11:27:01', 'PO184431', 'CS54', 120, 27, 31, 10, 1, 4, 27, NULL),
(1043, '2023-05-12 11:27:13', 'PO184441', 'CS55', 120, 27, 31, 10, 1, 4, 31, NULL),
(1044, '2023-05-12 11:27:45', 'PO184431', 'CS54', 120, 27, 31, 10, 1, 4, 31, NULL),
(1045, '2023-05-12 11:30:09', 'PO184441', 'CS55', 120, 27, 31, 10, 1, 4, 27, NULL),
(1046, '2023-05-12 11:40:19', 'PO184437', 'CS56', 113, 27, 31, 10, 1, 4, 31, NULL),
(1047, '2023-05-12 11:42:30', 'PO184437', 'CS56', 113, 27, 31, 10, 1, 4, 27, NULL),
(1048, '2023-05-12 11:48:40', 'PO184438', 'CS57', 121, 27, 31, 10, 1, 4, 31, NULL),
(1049, '2023-05-12 11:48:45', 'PO184438', 'CS57', 121, 27, 31, 10, 1, 4, 27, NULL),
(1050, '2023-05-12 11:54:40', 'PO184444', 'CS58', 122, 27, 31, 10, 1, 4, 31, NULL),
(1051, '2023-05-12 11:54:46', 'PO184444', 'CS58', 122, 27, 31, 10, 1, 4, 27, NULL),
(1052, '2023-05-12 11:54:53', '--', 'CS59', 123, 27, 31, 10, 1, 3, 27, NULL),
(1053, '2023-05-12 11:54:53', '--', 'CS59', 123, 27, 31, 10, 1, 3, 31, NULL),
(1056, '2023-05-12 12:01:11', 'PO184446', '71647', 117, 27, 31, 10, 1, 5, 27, NULL),
(1057, '2023-05-12 12:01:49', 'PO184446', '71647', 117, 27, 31, 10, 1, 5, 31, NULL),
(1058, '2023-05-12 12:08:39', '--', '71672', 124, 27, 31, 10, 1, 3, 27, NULL);

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
-- Indexes for table `tb_cuadrilla`
--
ALTER TABLE `tb_cuadrilla`
  ADD PRIMARY KEY (`Id_CuadrillaJefe`);

--
-- Indexes for table `tb_desbloqueos`
--
ALTER TABLE `tb_desbloqueos`
  ADD PRIMARY KEY (`Id_Desbloqueo`);

--
-- Indexes for table `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  ADD PRIMARY KEY (`Id_DetalleTara`),
  ADD KEY `IdDetalleVerificacion` (`IdDetalleVerificacion`);

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
  ADD KEY `IdCredenciales` (`IdCredenciales`),
  ADD KEY `IdPuesto` (`IdPuesto`);

--
-- Indexes for table `tb_validacion`
--
ALTER TABLE `tb_validacion`
  ADD PRIMARY KEY (`Id_Validacion`),
  ADD KEY `IdVerificacion` (`IdVerificacion`);

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
  ADD KEY `IdUsuarioCreacion` (`IdUsuarioCreacion`),
  ADD KEY `IdJefeCuadrilla` (`IdJefeCuadrilla`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cargo`
--
ALTER TABLE `tb_cargo`
  MODIFY `Id_Cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  MODIFY `Id_Credenciales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_desbloqueos`
--
ALTER TABLE `tb_desbloqueos`
  MODIFY `Id_Desbloqueo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  MODIFY `Id_DetalleTara` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- AUTO_INCREMENT for table `tb_detalleverificacion`
--
ALTER TABLE `tb_detalleverificacion`
  MODIFY `Id_DetalleVerificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2443;

--
-- AUTO_INCREMENT for table `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_material`
--
ALTER TABLE `tb_material`
  MODIFY `Id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT for table `tb_puntocompra`
--
ALTER TABLE `tb_puntocompra`
  MODIFY `Id_PuntoCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_usuarios`
--
ALTER TABLE `tb_usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_validacion`
--
ALTER TABLE `tb_validacion`
  MODIFY `Id_Validacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  MODIFY `Id_Verificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1066;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_credenciales`
--
ALTER TABLE `tb_credenciales`
  ADD CONSTRAINT `tb_credenciales_ibfk_1` FOREIGN KEY (`IdRol`) REFERENCES `tb_roles` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_detalletara`
--
ALTER TABLE `tb_detalletara`
  ADD CONSTRAINT `tb_detalletara_ibfk_1` FOREIGN KEY (`IdDetalleVerificacion`) REFERENCES `tb_detalleverificacion` (`Id_DetalleVerificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `tb_usuarios_ibfk_2` FOREIGN KEY (`IdCredenciales`) REFERENCES `tb_credenciales` (`Id_Credenciales`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_usuarios_ibfk_3` FOREIGN KEY (`IdPuesto`) REFERENCES `tb_puntocompra` (`Id_PuntoCompra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_validacion`
--
ALTER TABLE `tb_validacion`
  ADD CONSTRAINT `tb_validacion_ibfk_1` FOREIGN KEY (`IdVerificacion`) REFERENCES `tb_verificacion` (`Id_Verificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_verificacion`
--
ALTER TABLE `tb_verificacion`
  ADD CONSTRAINT `tb_verificacion_ibfk_1` FOREIGN KEY (`IdProveedor`) REFERENCES `tb_proveedor` (`Id_Proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_2` FOREIGN KEY (`IdVerificador`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_3` FOREIGN KEY (`IdDigitador`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_4` FOREIGN KEY (`IdPuntoCompra`) REFERENCES `tb_puntocompra` (`Id_PuntoCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_5` FOREIGN KEY (`IdEstado`) REFERENCES `tb_estado` (`Id_Estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_6` FOREIGN KEY (`IdUsuarioCreacion`) REFERENCES `tb_usuarios` (`Id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_verificacion_ibfk_7` FOREIGN KEY (`IdJefeCuadrilla`) REFERENCES `tb_cuadrilla` (`Id_CuadrillaJefe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
