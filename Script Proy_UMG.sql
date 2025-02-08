-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2025 a las 02:05:12
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `umg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `carnet_alumno` varchar(15) NOT NULL,
  `nombre_alumno` varchar(45) DEFAULT NULL,
  `direccion_alumno` varchar(45) DEFAULT NULL,
  `telefono_alumno` varchar(45) DEFAULT NULL,
  `email_alumno` varchar(20) DEFAULT NULL,
  `estatus_alumno` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`carnet_alumno`, `nombre_alumno`, `direccion_alumno`, `telefono_alumno`, `email_alumno`, `estatus_alumno`) VALUES
('9959-23-1224', 'Evelyn Andrade', 'zona 24', '4587-4147', 'andrade@gmail.com', '1'),
('9959-23-1379', 'Isabel Melendez', 'zona 25', '5015-8376', 'melendez@gmail.com', '1'),
('9959-23-848', 'Carlos Calderon', 'zona 18', '4969-7890', 'calderon@gmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacioncursosalumnos`
--

CREATE TABLE `asignacioncursosalumnos` (
  `codigo_carrera` varchar(5) NOT NULL,
  `codigo_sede` varchar(5) NOT NULL,
  `codigo_jornada` varchar(5) NOT NULL,
  `codigo_seccion` varchar(5) NOT NULL,
  `codigo_aula` varchar(5) NOT NULL,
  `codigo_curso` varchar(5) NOT NULL,
  `carnet_alumno` varchar(15) NOT NULL,
  `nota_asignacioncursoalumnos` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `asignacioncursosalumnos`
--

INSERT INTO `asignacioncursosalumnos` (`codigo_carrera`, `codigo_sede`, `codigo_jornada`, `codigo_seccion`, `codigo_aula`, `codigo_curso`, `carnet_alumno`, `nota_asignacioncursoalumnos`) VALUES
('1379', '149', '478', '445', '022', '012', '9959-23-1379', 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacioncursosmaestros`
--

CREATE TABLE `asignacioncursosmaestros` (
  `Codigo_carrera` varchar(5) NOT NULL,
  `Codigo_sede` varchar(5) NOT NULL,
  `Codigo_jornada` varchar(5) NOT NULL,
  `Codigo_seccion` varchar(5) NOT NULL,
  `Codigo_aula` varchar(5) NOT NULL,
  `Codigo_curso` varchar(5) NOT NULL,
  `Codigo_maestro` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `Codigo_aula` varchar(5) NOT NULL,
  `Nombre_aula` varchar(45) DEFAULT NULL,
  `Estatus_aula` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`Codigo_aula`, `Nombre_aula`, `Estatus_aula`) VALUES
('022', 'C104', '1'),
('045', 'C106', '1'),
('087', 'C105', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `Codigo_carrera` varchar(5) NOT NULL,
  `Nombre_carrera` varchar(45) DEFAULT NULL,
  `Codigo_facultad` varchar(5) DEFAULT NULL,
  `Estatus_carrera` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`Codigo_carrera`, `Nombre_carrera`, `Codigo_facultad`, `Estatus_carrera`) VALUES
('1224', 'Informatica', '9959', '1'),
('1379', 'Sistemas', '9959', '1'),
('4568', 'Bases de datos I', '9959', '1'),
('7898', 'software', '9959', '1'),
('848', 'Arquitectura de computadores', '9959', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `Codigo_curso` varchar(5) NOT NULL,
  `Nombre_curso` varchar(45) DEFAULT NULL,
  `Estatus_curso` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`Codigo_curso`, `Nombre_curso`, `Estatus_curso`) VALUES
('012', 'Electronica analogica', '1'),
('124', 'Metodos numericos', '1'),
('878', 'Programacion III', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facultad`
--

CREATE TABLE `facultad` (
  `Codigo_facultad` varchar(5) NOT NULL,
  `Nombre_facultad` varchar(45) DEFAULT NULL,
  `Estatus_facultad` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `facultad`
--

INSERT INTO `facultad` (`Codigo_facultad`, `Nombre_facultad`, `Estatus_facultad`) VALUES
('9959', 'Ingenieria ', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `Codigo_jornada` varchar(5) NOT NULL,
  `Nombre_jornada` varchar(45) DEFAULT NULL,
  `Estatus_jornada` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`Codigo_jornada`, `Nombre_jornada`, `Estatus_jornada`) VALUES
('236', 'Nocturno', '1'),
('456', 'Vespertino', '1'),
('478', 'Matutino', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `codigo_maestro` varchar(15) NOT NULL,
  `nombre_maestro` varchar(15) DEFAULT NULL,
  `direccion_maestro` varchar(15) DEFAULT NULL,
  `telefono_maestro` varchar(45) DEFAULT NULL,
  `email_maestro` varchar(20) DEFAULT NULL,
  `estatus_maestro` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`codigo_maestro`, `nombre_maestro`, `direccion_maestro`, `telefono_maestro`, `email_maestro`, `estatus_maestro`) VALUES
('005', 'Eduardo Rodrigu', 'zona 7', '8963-6374', 'eduardo@gmail.com', '1'),
('015', 'Carlos Calderon', 'zona 6', '4879-6378', 'carlos@gmail.com', '1'),
('018', 'Tatiana Morales', 'zona 5', '4877-6374', 'tatiana@gmail.com', '1'),
('022', 'Mynor Estrada', 'zona 18', '7896-6541', 'mynor@gmail.com', '1'),
('042', 'Camila Perez', 'zona 4', '4569-7896', 'camila@gmail.com', '1'),
('078', 'Maricela Ortiz', 'zona 11', '1234-8968', 'mar@gmail.com', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `Codigo_seccion` varchar(5) NOT NULL,
  `Nombre_seccion` varchar(45) DEFAULT NULL,
  `Estatus_seccion` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`Codigo_seccion`, `Nombre_seccion`, `Estatus_seccion`) VALUES
('445', 'C', '1'),
('456', 'A', '1'),
('476', 'B', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `Codigo_sede` varchar(5) NOT NULL,
  `Nombre_sede` varchar(45) DEFAULT NULL,
  `Estatus_sede` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`Codigo_sede`, `Nombre_sede`, `Estatus_sede`) VALUES
('145', 'Portales', '1'),
('148', 'Central', '1'),
('149', 'Naranjo', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`carnet_alumno`);

--
-- Indices de la tabla `asignacioncursosalumnos`
--
ALTER TABLE `asignacioncursosalumnos`
  ADD PRIMARY KEY (`codigo_carrera`,`codigo_sede`,`codigo_jornada`,`codigo_seccion`,`codigo_aula`,`codigo_curso`,`carnet_alumno`),
  ADD KEY `codigo_sede` (`codigo_sede`),
  ADD KEY `codigo_jornada` (`codigo_jornada`),
  ADD KEY `codigo_seccion` (`codigo_seccion`),
  ADD KEY `codigo_aula` (`codigo_aula`),
  ADD KEY `codigo_curso` (`codigo_curso`),
  ADD KEY `carnet_alumno` (`carnet_alumno`);

--
-- Indices de la tabla `asignacioncursosmaestros`
--
ALTER TABLE `asignacioncursosmaestros`
  ADD PRIMARY KEY (`Codigo_carrera`,`Codigo_sede`,`Codigo_jornada`,`Codigo_seccion`,`Codigo_aula`,`Codigo_curso`,`Codigo_maestro`),
  ADD KEY `Codigo_sede` (`Codigo_sede`),
  ADD KEY `Codigo_jornada` (`Codigo_jornada`),
  ADD KEY `Codigo_seccion` (`Codigo_seccion`),
  ADD KEY `Codigo_aula` (`Codigo_aula`),
  ADD KEY `Codigo_curso` (`Codigo_curso`),
  ADD KEY `Codigo_maestro` (`Codigo_maestro`);

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`Codigo_aula`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`Codigo_carrera`),
  ADD KEY `Codigo_facultad` (`Codigo_facultad`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Codigo_curso`);

--
-- Indices de la tabla `facultad`
--
ALTER TABLE `facultad`
  ADD PRIMARY KEY (`Codigo_facultad`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`Codigo_jornada`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`codigo_maestro`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`Codigo_seccion`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`Codigo_sede`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacioncursosalumnos`
--
ALTER TABLE `asignacioncursosalumnos`
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_1` FOREIGN KEY (`codigo_carrera`) REFERENCES `carreras` (`Codigo_carrera`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_2` FOREIGN KEY (`codigo_sede`) REFERENCES `sedes` (`Codigo_sede`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_3` FOREIGN KEY (`codigo_jornada`) REFERENCES `jornadas` (`Codigo_jornada`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_4` FOREIGN KEY (`codigo_seccion`) REFERENCES `secciones` (`Codigo_seccion`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_5` FOREIGN KEY (`codigo_aula`) REFERENCES `aulas` (`Codigo_aula`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_6` FOREIGN KEY (`codigo_curso`) REFERENCES `cursos` (`Codigo_curso`),
  ADD CONSTRAINT `asignacioncursosalumnos_ibfk_7` FOREIGN KEY (`carnet_alumno`) REFERENCES `alumnos` (`carnet_alumno`);

--
-- Filtros para la tabla `asignacioncursosmaestros`
--
ALTER TABLE `asignacioncursosmaestros`
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_1` FOREIGN KEY (`Codigo_carrera`) REFERENCES `carreras` (`Codigo_carrera`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_2` FOREIGN KEY (`Codigo_sede`) REFERENCES `sedes` (`Codigo_sede`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_3` FOREIGN KEY (`Codigo_jornada`) REFERENCES `jornadas` (`Codigo_jornada`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_4` FOREIGN KEY (`Codigo_seccion`) REFERENCES `secciones` (`Codigo_seccion`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_5` FOREIGN KEY (`Codigo_aula`) REFERENCES `aulas` (`Codigo_aula`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_6` FOREIGN KEY (`Codigo_curso`) REFERENCES `cursos` (`Codigo_curso`),
  ADD CONSTRAINT `asignacioncursosmaestros_ibfk_7` FOREIGN KEY (`Codigo_maestro`) REFERENCES `maestros` (`codigo_maestro`);

--
-- Filtros para la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD CONSTRAINT `carreras_ibfk_1` FOREIGN KEY (`Codigo_facultad`) REFERENCES `facultad` (`Codigo_facultad`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
