-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-08-2024 a las 22:47:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `directorio_de_empleado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_empleado`
--

CREATE TABLE `informacion_empleado` (
  `ID_empleado` int(4) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Cargo` varchar(50) NOT NULL,
  `Area` varchar(50) NOT NULL,
  `Sucursal` varchar(50) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_empleado`
--

INSERT INTO `informacion_empleado` (`ID_empleado`, `Nombre`, `Apellido`, `Cargo`, `Area`, `Sucursal`, `Correo`, `Telefono`) VALUES
(1, 'Juan', 'Pérez', 'Gerente', 'Administración', 'Sucursal Central', 'juan.perez@empresa.com', '7542219'),
(2, 'Maria', 'Gómez', 'Asesor de Ventas', 'Ventas', 'Sucursal Norte', 'maria.gomez@empresa.com', '60452380'),
(3, 'Carlos', 'Lopéz', 'Cajero', 'Finanzas', 'Sucursal Sur', 'carlos.lopez@empresa.com', '75193998'),
(4, 'Ana ', 'Torres', 'Abogada', 'Legal', 'Sucursal Central', 'ana.torres@empresa.com', '60205406'),
(5, 'Luis', 'Hernández', 'Administrador', 'Administración', 'Sucursal Este', 'luis.hernandez@empresa.com', '70050403'),
(6, 'Laura', 'Díaz', 'Asesor de Ventas', 'Ventas', 'Sucursal Oeste', 'laura.diaz@empresa.com', '67890123'),
(7, 'José ', 'Martínez', 'Gerente', 'Adminstración', 'Sucursal Norte', 'jose.martinez@empresa.com', '78901234'),
(8, 'Paula', 'Sanchez', 'Cajera', 'Finanzas', 'Sucursal Sur', 'paula.sanchez@empresa.com', '69012345'),
(9, 'Andrés', 'Ramírez', 'Abogado', 'Legal', 'Sucursal Central', 'andres.ramirez@empresa.com', '69012345'),
(10, 'Bernardo', 'Uche', 'Ing. Software', 'Sistemas', 'Sucursal Central', 'bernardouche@empresa.com', '77463268');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `informacion_empleado`
--
ALTER TABLE `informacion_empleado`
  ADD PRIMARY KEY (`ID_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `informacion_empleado`
--
ALTER TABLE `informacion_empleado`
  MODIFY `ID_empleado` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
