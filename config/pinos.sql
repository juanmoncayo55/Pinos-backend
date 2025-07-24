-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2025 a las 20:44:53
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
-- Base de datos: `pinos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interesados_vivienda`
--

CREATE TABLE `interesados_vivienda` (
  `id` int(11) NOT NULL COMMENT 'ID único del registro del interesado',
  `nombre_completo` varchar(255) NOT NULL COMMENT 'Nombre completo del interesado',
  `cedula` varchar(50) NOT NULL COMMENT 'Número de cédula del interesado, marcado como único',
  `telefono` varchar(50) NOT NULL COMMENT 'Número de contacto del interesado',
  `direccion` varchar(255) NOT NULL COMMENT 'Dirección de residencia del interesado',
  `situacion_vivienda` varchar(100) DEFAULT NULL COMMENT 'Respuesta sobre si paga arriendo o vive con familiares',
  `importancia_casa` varchar(100) DEFAULT NULL COMMENT 'Importancia de tener casa propia en los próximos 6 meses',
  `personas_convivientes` varchar(50) DEFAULT NULL COMMENT 'Número de personas que viven con el interesado',
  `ocupacion` varchar(100) DEFAULT NULL COMMENT 'Actividad a la que se dedica el interesado',
  `tipo_contrato` varchar(100) DEFAULT NULL COMMENT 'Tipo de contrato laboral si es empleado',
  `proceso_compra` varchar(100) DEFAULT NULL COMMENT 'Si el proceso de compra es solo o con otras personas',
  `ingresos_personales` varchar(100) DEFAULT NULL COMMENT 'Monto de ingresos mensuales personales',
  `otra_ingreso_personal` varchar(255) DEFAULT NULL COMMENT 'Campo abierto para otro ingreso personal si aplica',
  `ingresos_familiares` varchar(100) DEFAULT NULL COMMENT 'Ingreso mensual total del grupo familiar',
  `otra_ingreso_familia` varchar(255) DEFAULT NULL COMMENT 'Campo abierto para otro ingreso familiar si aplica',
  `recursos_propios` varchar(100) DEFAULT NULL COMMENT 'Disponibilidad de recursos propios para la cuota inicial',
  `deudas` varchar(100) DEFAULT NULL COMMENT 'Información sobre créditos o deudas activas',
  `sisben` varchar(10) DEFAULT NULL COMMENT 'Si está registrado en el SISBÉN IV',
  `clasificacion_sisben` varchar(50) DEFAULT NULL COMMENT 'Clasificación en el SISBÉN IV',
  `caja_compensacion` varchar(10) DEFAULT NULL COMMENT 'Si está afiliado a una Caja de Compensación Familiar',
  `nombre_caja` varchar(255) DEFAULT NULL COMMENT 'Nombre de la Caja de Compensación Familiar',
  `categoria_caja` varchar(100) DEFAULT NULL COMMENT 'Categoría dentro de la Caja de Compensación Familiar',
  `proyecto_los_pinos` varchar(255) DEFAULT NULL COMMENT 'Interés en el Proyecto Los Pinos, Manizales',
  `asesoria` varchar(255) DEFAULT NULL COMMENT 'Preferencia para recibir asesoría',
  `dia_cita` date NOT NULL COMMENT 'Día ideal para la cita de asesoría',
  `hora_cita` time NOT NULL COMMENT 'Hora ideal para la cita de asesoría',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha y hora de creación del registro',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Fecha y hora de la última actualización del registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `interesados_vivienda`
--

INSERT INTO `interesados_vivienda` (`id`, `nombre_completo`, `cedula`, `telefono`, `direccion`, `situacion_vivienda`, `importancia_casa`, `personas_convivientes`, `ocupacion`, `tipo_contrato`, `proceso_compra`, `ingresos_personales`, `otra_ingreso_personal`, `ingresos_familiares`, `otra_ingreso_familia`, `recursos_propios`, `deudas`, `sisben`, `clasificacion_sisben`, `caja_compensacion`, `nombre_caja`, `categoria_caja`, `proyecto_los_pinos`, `asesoria`, `dia_cita`, `hora_cita`, `created_at`, `updated_at`) VALUES
(1, 'Juan David Pérez Londoño', '1234567890', '3101234567', 'Calle 10 # 20-30, Barrio El Centro', 'Pago arriendo mensualmente', 'Es mi prioridad', '3 personas', 'EMPLEADO', 'Término Indefinido', 'Con otra persona o personas', 'De $2.000.000 a  $2.847.000', NULL, 'De $3.500.000 en adelante', NULL, 'Entre $10.000.001 a $20.000.000 millones', 'No tengo deudas', 'Sí', 'De B1 a B7', 'Si', 'COMFAMILIAR', 'CATEGORIA B', 'Sí, de dos (2) habitaciones por 120 SMMLV ($170.820.000)', 'Sí, prefiero una videollamada de orientación', '2025-08-15', '10:30:00', '2025-07-24 15:00:51', '2025-07-24 15:00:51'),
(2, 'zsfsdfsdf', '5445645646', 'sdfsdfsdf', 'Cll 65 # 10 n 852', 'Vivo con familiares', 'Me interesa, pero no sé cómo empezar', '3 personas', 'INDEPENDIENTE', 'Término Indefinido', 'Con otra persona o personas', '3.500.000 en adelante', NULL, '1.423.500 a 2.000.000', NULL, '10.000.001 a 20.000.000', '5.000.001 a 10.000.000', 'No sé', 'C1 a C18', 'No sé', NULL, 'CATEGORIA C', 'Tres habitaciones', 'Solo quiero información', '2025-07-01', '11:20:00', '2025-07-24 16:15:17', '2025-07-24 16:15:17'),
(6, 'zsfsdfsdf', 'sdfsdf', 'sdfsdfsd', 'Cll 87 n 56 # 546', 'Otra situación', 'Es mi prioridad', '2 personas', 'COLOMBIANO EN EL EXTERIOR', 'Término Indefinido', 'Con otra persona o personas', '2.847.000 a 3.500.000', NULL, '3.500.000 en adelante', NULL, '20.000.001 a 30.000.000', '5.000.001 a 10.000.000', 'No sé', 'D1 a D20', 'No sé', NULL, 'CATEGORIA B', 'Tres habitaciones', 'Videollamada', '2025-07-01', '01:34:00', '2025-07-24 16:32:19', '2025-07-24 16:32:19'),
(7, 'Juan Moriones', '1061803365', 'jhasdbhasbdsh', 'Cll 00 n 56 # 1111', 'Vivo con familiares', 'Me interesa, pero no sé cómo empezar', '2 personas', 'Contratista Prestación Servicios Profesionales', 'Prestación de servicios', 'Con otra persona o personas', '3.500.000 en adelante', NULL, '1.423.500 a 2.000.000', NULL, '10.000.001 a 20.000.000', 'Más de 10.000.000', 'No', 'D21', 'No sé', NULL, 'CATEGORIA A', 'Quiero asesoría', 'Solo quiero información', '2025-07-10', '11:36:00', '2025-07-24 16:33:23', '2025-07-24 16:33:23'),
(10, 'Juan Moriones', '10618033653', 'sdasd', 'Cll 00 n 56 # 1111', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-22', '04:40:00', '2025-07-24 16:35:49', '2025-07-24 16:35:49'),
(11, 'Sonia Moncayo', '85456465465', 'sdfsdfsdf', 'Cll 65 # 10 n 852', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-25', '03:41:00', '2025-07-24 16:38:00', '2025-07-24 16:38:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `interesados_vivienda`
--
ALTER TABLE `interesados_vivienda`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD KEY `idx_cedula` (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `interesados_vivienda`
--
ALTER TABLE `interesados_vivienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID único del registro del interesado', AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
