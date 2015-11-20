-- Adminer 4.2.1 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `ac_alternativas`;
CREATE TABLE `ac_alternativas` (
  `id_alternativa` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_alternativa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_alternativas_formularios`;
CREATE TABLE `ac_alternativas_formularios` (
  `id_alternativa_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `id_formulario` int(11) NOT NULL,
  `id_alternativa` int(11) NOT NULL,
  PRIMARY KEY (`id_alternativa_formulario`),
  KEY `fk_alternativas_formularios_alternativas1_idx` (`id_alternativa`),
  KEY `fk_alternativas_formularios_formularios1_idx` (`id_formulario`),
  CONSTRAINT `fk_alternativas_formularios_alternativas1` FOREIGN KEY (`id_alternativa`) REFERENCES `ac_alternativas` (`id_alternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_alternativas_formularios_formularios1` FOREIGN KEY (`id_formulario`) REFERENCES `ac_formularios` (`id_formulario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_escenarios`;
CREATE TABLE `ac_escenarios` (
  `id_escenario` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `path_audio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_escenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_escenarios_evidencias`;
CREATE TABLE `ac_escenarios_evidencias` (
  `id_escenario_evidencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_escenario` int(11) NOT NULL,
  `id_evidencia` int(11) NOT NULL,
  PRIMARY KEY (`id_escenario_evidencia`),
  KEY `fk_escenarios_evidencias_escenarios_idx` (`id_escenario`),
  KEY `fk_escenarios_evidencias_evidencias1_idx` (`id_evidencia`),
  CONSTRAINT `fk_escenarios_evidencias_escenarios` FOREIGN KEY (`id_escenario`) REFERENCES `ac_escenarios` (`id_escenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_escenarios_evidencias_evidencias1` FOREIGN KEY (`id_evidencia`) REFERENCES `ac_evidencias` (`id_evidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ac_escenarios_evidencias` (`id_escenario_evidencia`, `id_escenario`, `id_evidencia`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	1,	3),
(4,	1,	4),
(5,	1,	5),
(6,	2,	6),
(7,	2,	7),
(8,	2,	8),
(9,	2,	9),
(10,	2,	10);

DROP TABLE IF EXISTS `ac_evidencias`;
CREATE TABLE `ac_evidencias` (
  `id_evidencia` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(255) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `id_formulario` int(11) DEFAULT NULL,
  `respuesta` int(11) DEFAULT NULL,
  `respuesta_true` varchar(255) DEFAULT NULL,
  `respuesta_false` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_evidencia`),
  KEY `fk_evidencias_formularios1_idx` (`id_formulario`),
  KEY `fk_evidencias_alternativas1_idx` (`respuesta`),
  CONSTRAINT `fk_evidencias_alternativas1` FOREIGN KEY (`respuesta`) REFERENCES `ac_alternativas` (`id_alternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evidencias_formularios1` FOREIGN KEY (`id_formulario`) REFERENCES `ac_formularios` (`id_formulario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_formularios`;
CREATE TABLE `ac_formularios` (
  `id_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `pregunta_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_juego`;
CREATE TABLE `ac_juego` (
  `id_juego` int(11) NOT NULL,
  `codigo_usuario` varchar(10) DEFAULT NULL,
  `puntos` varchar(45) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `metadata` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_juego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_juego_detalle`;
CREATE TABLE `ac_juego_detalle` (
  `id_juego_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_juego` int(11) NOT NULL,
  `id_escenario_evidencia` int(11) NOT NULL,
  `respuesta` int(11) NOT NULL,
  PRIMARY KEY (`id_juego_detalle`),
  KEY `fk_respuestas_escenarios_evidencias1_idx` (`id_escenario_evidencia`),
  KEY `fk_ac_juego_detalle_ac_juego1_idx` (`id_juego`),
  KEY `fk_ac_juego_detalle_ac_alternativas1_idx` (`respuesta`),
  CONSTRAINT `fk_ac_juego_detalle_ac_alternativas1` FOREIGN KEY (`respuesta`) REFERENCES `ac_alternativas` (`id_alternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ac_juego_detalle_ac_juego1` FOREIGN KEY (`id_juego`) REFERENCES `ac_juego` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_escenarios_evidencias1` FOREIGN KEY (`id_escenario_evidencia`) REFERENCES `ac_escenarios_evidencias` (`id_escenario_evidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2015-11-20 22:19:19
