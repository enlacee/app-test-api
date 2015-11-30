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

INSERT INTO `ac_alternativas` (`id_alternativa`, `description`) VALUES
(1,	'accidente'),
(2,	'incidente'),
(3,	'persona'),
(4,	'material'),
(5,	'medio ambiente'),
(6,	'leve'),
(7,	'incapacitante'),
(8,	'mortal'),
(9,	'primer auxilio'),
(10,	'atención médica'),
(11,	'temporal'),
(12,	'permanente'),
(13,	'alto'),
(14,	'medio'),
(15,	'bajo');

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

INSERT INTO `ac_alternativas_formularios` (`id_alternativa_formulario`, `id_formulario`, `id_alternativa`) VALUES
(1,	1,	1),
(2,	1,	2),
(3,	2,	3),
(4,	2,	4),
(5,	2,	5),
(6,	3,	6),
(7,	3,	7),
(8,	3,	8),
(9,	4,	9),
(10,	4,	10),
(11,	4,	11),
(12,	4,	12),
(13,	5,	13),
(14,	5,	14),
(15,	5,	15);

DROP TABLE IF EXISTS `ac_encuestas`;
CREATE TABLE `ac_encuestas` (
  `id_encuesta` int(11) NOT NULL AUTO_INCREMENT,
  `id_juego` int(11) DEFAULT NULL,
  `codigo_usuario` varchar(45) DEFAULT NULL,
  `p1` int(11) DEFAULT NULL,
  `p2` int(11) DEFAULT NULL,
  `p3` int(11) DEFAULT NULL,
  `p4` int(11) DEFAULT NULL,
  `p5` int(11) DEFAULT NULL COMMENT 'PREGUNTAS',
  PRIMARY KEY (`id_encuesta`),
  KEY `fk_ac_encuestas_ac_juego1_idx` (`id_juego`),
  CONSTRAINT `fk_ac_encuestas_ac_juego1` FOREIGN KEY (`id_juego`) REFERENCES `ac_juego` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_escenarios`;
CREATE TABLE `ac_escenarios` (
  `id_escenario` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `path_audio` varchar(255) DEFAULT NULL,
  `path_image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id_escenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ac_escenarios` (`id_escenario`, `description`, `path_audio`, `path_image`, `status`) VALUES
(1,	'MUKITO se dispone a SUBIR por las ESCALERAS de la CHIMENEA.',	'public/audio/escenarios/1.mp3',	'public/image/escenarios/1.png',	0),
(2,	'MUKITO estaba hambriento y abrió una lata de atún para el refrigerio.',	'public/audio/escenarios/2.mp3',	'public/image/escenarios/2.png',	0),
(3,	'MUKITO trabaja sus soldaduras con normalidad en el taller de mantenimiento de su empresa, sin embargo el área de trabajo está desordenada.',	'public/audio/escenarios/3.mp3',	'public/image/escenarios/3.png',	0),
(4,	'Un día normal de trabajo para nuestro MUKITO en las labores de interior mina, notemos la cercanía de equipos de trabajo.',	'public/audio/escenarios/4.mp3',	'public/image/escenarios/4.png',	0),
(5,	'MUKITO se disponía a usar la sierra circular en el taller de carpintería. ',	'public/audio/escenarios/5.mp3',	'public/image/escenarios/5.png',	0),
(6,	'MUKITO se dispone a subir por las escaleras de la chimenea ciega.',	'public/audio/escenarios/6.mp3',	'public/image/escenarios/6.png',	0),
(7,	'Oh no!!! MUKITO está entrando a un frente luego de la voladura. Aún nadie desquinchó.',	'public/audio/escenarios/7.mp3',	'public/image/escenarios/7.png',	0),
(8,	'MUKITO se encuentra en sus días de descanso. Nada mejor que cocinar un poco!',	'public/audio/escenarios/8.mp3',	'public/image/escenarios/8.png',	0),
(9,	'El scoop estaba estacionado en la galería norte.',	'public/audio/escenarios/9.mp3',	'public/image/escenarios/9.png',	1),
(10,	'Mukito es el encargado de despachar combustible con la cisterna.',	'public/audio/escenarios/10.mp3',	'public/image/escenarios/10.png',	1),
(11,	'Mukito procedía a realizar el izaje de una carga pesada.',	'public/audio/escenarios/11.mp3',	'public/image/escenarios/11.png',	1),
(12,	'MUKITO caminaba muy cerca de la zona de construcción, la cual estaba sin señalización.',	'public/audio/escenarios/12.mp3',	'public/image/escenarios/12.png',	0),
(13,	'A MUKITO se le encargó la tarea de eliminar la basura.',	'public/audio/escenarios/13.mp3',	'public/image/escenarios/13.png',	0),
(14,	'MUKITO se encontraba realizando trabajos en andamios. Se había formado una capa de helada en la zona de trabajo.',	'public/audio/escenarios/14.mp3',	'public/image/escenarios/14.png',	0),
(15,	'MUKITO se encuentra en una labor después de la voladura. Aún nadie ha desquinchado.',	'public/audio/escenarios/15.mp3',	'public/image/escenarios/15.png',	0);

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
(8,	1,	4),
(9,	1,	5),
(10,	2,	7),
(11,	2,	8),
(12,	2,	9),
(13,	2,	10),
(14,	2,	11),
(15,	3,	13),
(16,	3,	14),
(17,	3,	15),
(18,	3,	16),
(19,	3,	17),
(20,	4,	18),
(21,	4,	19),
(22,	4,	20),
(23,	4,	21),
(24,	4,	22),
(25,	5,	23),
(26,	5,	24),
(27,	5,	25),
(28,	5,	26),
(29,	5,	27),
(30,	6,	28),
(31,	6,	29),
(32,	6,	30),
(33,	6,	31),
(60,	7,	32),
(61,	7,	33),
(62,	7,	34),
(63,	7,	35),
(64,	8,	36),
(65,	8,	37),
(66,	8,	38),
(67,	8,	39),
(68,	8,	40),
(69,	9,	41),
(70,	9,	42),
(71,	9,	43),
(72,	10,	44),
(73,	10,	45),
(74,	10,	46),
(75,	11,	47),
(76,	11,	48),
(77,	11,	49),
(78,	12,	50),
(79,	12,	51),
(80,	12,	52),
(81,	13,	53),
(82,	13,	54),
(83,	13,	55),
(84,	14,	56),
(85,	14,	57),
(86,	14,	58),
(87,	15,	59),
(88,	15,	60),
(89,	15,	61);

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

INSERT INTO `ac_evidencias` (`id_evidencia`, `imagen`, `texto`, `audio`, `id_formulario`, `respuesta`, `respuesta_true`, `respuesta_false`) VALUES
(1,	'public/image/evidencias/1/1.1.png',	'CAE de una altura de 03  metros. Al caer se lastima la pierna izquierda.',	'public/audio/evidencias/1/1.1.mp3',	1,	1,	'CORRECTO, incluso pudo haberse lesionado algo más que la pierna izquierda.',	'Si hubo un daño, en este caso lo recibió MUKITO, probablemente no sólo en su pierna izquierda\r\n\r\n'),
(2,	'public/image/evidencias/1/1.2.png',	'Se comprobó que el único daño lo recibió MUKITO, específicamente en la pierna izquierda.',	'public/audio/evidencias/1/1.2.mp3',	2,	3,	'CORRECTO, sólo MUKITO fue quien sufrió los daños.',	'Sólo MUKITO recibió daños, no hubo daños a los materiales ni contaminación ambiental.'),
(3,	'public/image/evidencias/1/1.3.png',	'MUKITO fue trasladado al tópico,  en donde se diagnosticó que sufrió una fractura en la pierna.',	'public/audio/evidencias/1/1.3.mp3',	3,	7,	'CORRECTO,  MUKITO quedó incapacitado de realizar sus labores cotidianas.',	'La severidad del daño es más que leve, pues hay una incapacidad de por medio. Además MUKITO sigue con vida.'),
(4,	'public/image/evidencias/1/1.4.png',	'El médico de turno indicó que MUKITO deberá guardar esctricto reposo por un período de 3 meses.',	'public/audio/evidencias/1/1.4.mp3',	4,	11,	'CORRECTO,  a pesar de tener una lesión incapacitante, MUKITO regresará a laborar luego de 3 meses.',	'Notemos que  a pesar de tener una lesión incapacitante, MUKITO regresará a laborar luego de 3 meses.'),
(5,	'public/image/evidencias/1/1.5.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/1/1.5.mp3',	5,	13,	'',	''),
(7,	'public/image/evidencias/2/2.1.png',	'Sin embargo se produjo un pequeño corte en la mano izquierda.',	'public/audio/evidencias/2/2.1.mp3',	1,	1,	'Correcto. Los cortes y golpes constituyen ya un accidente con daños a la persona.',	'Los cortes y golpes constituyen ya un accidente con daños a la persona.'),
(8,	'public/image/evidencias/2/2.2.png',	'Se comprobó que el único daño lo recibió MUKITO, específicamente en la mano izquierda.',	'public/audio/evidencias/2/2.2.mp3',	2,	3,	'Correcto, sólo MUKITO fue quien sufrió el daño.',	'Sólo MUKITO fue quien sufrió el daño, no hubo daños a los materiales ni contaminación ambiental.'),
(9,	'public/image/evidencias/2/2.3.png',	'El pequeño corte tenía una longitud de 2 milímetros de largo y menos de 1 milímetro de profundidad.',	'public/audio/evidencias/2/2.3.mp3',	3,	6,	'CORRECTO, El corte es considerado leve.',	'El corte es considerado leve porque no se produjeron mayores daños que el pequeño corte.'),
(10,	'public/image/evidencias/2/2.4.png',	'Para curar el pequeño corte, MUKITO utilizó tan solo el botiquín de primeros auxilios.',	'public/audio/evidencias/2/2.4.mp3',	4,	9,	'Correcto, el corte fue poco significativo y se pudo curar con los implementos del botiquín.',	'Ten en cuenta que el corte fue poco significativo y se pudo curar con los implementos del botiquín.'),
(11,	'public/image/evidencias/2/2.5.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/2/2.5.mp3',	5,	15,	NULL,	NULL),
(13,	'public/image/evidencias/3/3.1.png',	'Una chispa de soldadura produce fuego sobre los aceites nuevos muy cerca de MUKITO.',	'public/audio/evidencias/3/3.1.mp3',	1,	1,	'Correcto. Se generaron daños materiales  y posiblemente a personas.',	'Se generaron daños materiales  y posiblemente a personas.'),
(14,	'public/image/evidencias/3/3.2.png',	'La brigada de rescate encontró a MUKITO con fuego en el brazo derecho, inmediatamente apagaron el fuego de su cuerpo.',	'public/audio/evidencias/3/3.2.mp3',	2,	3,	'CORRECTO. A pesar de que hubo pérdida material, la persona será la prioridad siempre.',	'A pesar de que hubo pérdida material, la persona será la prioridad siempre.'),
(15,	'public/image/evidencias/3/3.3.png',	'Se determinó que la quemadura en el brazo fue de segundo grado.',	'public/audio/evidencias/3/3.3.mp3',	3,	7,	'CORRECTO. MUKITO estará incapacitado para trabajar. ',	'MUKITO estará incapacitado para trabajar. Debido a la quemadura deberá guardar reposo.'),
(16,	'public/image/evidencias/3/3.4.png',	'El diagnostico del médico indica que MUKITO tendrá que descansar 03 semanas antes de volver a trabajar.',	'public/audio/evidencias/3/3.4.mp3',	4,	11,	'CORRECTO,  a pesar de tener una lesión incapacitante, MUKITO regresará a laborar luego de 03 semanas.',	'A pesar de tener una lesión incapacitante, MUKITO regresará a laborar luego de 03 semanas.'),
(17,	'public/image/evidencias/3/3.5.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/3/3.5.mp3',	5,	13,	'',	''),
(18,	'public/image/evidencias/4/4.1.png',	'Una mala coordinación  hizo que terminara atropellado por el SCOOP.',	'public/audio/evidencias/4/4.1.mp3',	1,	1,	'CORRECTO. Nuestro compañero ha sufrido un daño a su integridad.',	'Nuestro compañero ha sufrido un daño a su integridad!'),
(19,	'public/image/evidencias/4/4.2.png',	'En el atropello dañó considerablemente las piernas de nuestro compañero.',	'public/audio/evidencias/4/4.2.mp3',	2,	3,	'CORRECTO. A pesar de que hubo pérdida material, la persona será la prioridad siempre. Se calificará como accidente con daño a la persona y daños materiales.',	'A pesar de que hubo pérdida material, la persona será la prioridad siempre. Se calificará como accidente con daño a la persona y daños materiales.'),
(20,	'public/image/evidencias/4/4.3.png',	'El compañero tuvo que ser evacuado al hospital de la ciudad más cercana. Sufrió daños considerables en las piernas.',	'public/audio/evidencias/4/4.3.mp3',	3,	7,	'CORRECTO. Lamentablemente este accidente ha dejado incapacitado a nuestro compañero.',	' Lamentablemente este accidente ha dejado incapacitado a nuestro compañero.'),
(21,	'public/image/evidencias/4/4.4.png',	'Lamentablemente, luego de las operaciones para intentar salvarle las piernas, los médicos determinaron que MUKITO no volverá a caminar por sus propios medios.',	'public/audio/evidencias/4/4.4.mp3',	4,	12,	'CORRECTO. Según lo descrito el daño será permanente.',	'Debemos notar que el daño producido a nuestro MUKITO  generará una lesión incapacitante que durará toda su vida.'),
(22,	'public/image/evidencias/4/4.5.png',	'Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/4/4.5.mp3',	5,	13,	NULL,	NULL),
(23,	'public/image/evidencias/5/5.1.png',	'La falta de guarda de protección sobre la sierra, hizo que MUKITO se corte la mano.',	'public/audio/evidencias/5/5.1.mp3',	1,	1,	'Correcto, el corte es un daño. Por lo tanto es un accidente.',	' El corte es un daño. Por lo tanto es un accidente.'),
(24,	'public/image/evidencias/5/5.2.png',	'MUKITO resultó lesionado producto del accidente.',	'public/audio/evidencias/5/5.2.mp3',	2,	3,	'Correcto, la lesión se produjo en MUKITO. La lesión es a la persona.',	'La lesión se produjo en MUKITO. La lesión es a la persona.'),
(25,	'public/image/evidencias/5/5.3.png',	'MUKITO perdió tres dedos de su mano a raíz del accidente.',	'public/audio/evidencias/5/5.3.mp3',	3,	7,	'Correcto, la pérdida de alguna parte de alguna parte del cuerpo corresponde a una lesión incapacitante.',	'La pérdida de alguna parte de alguna parte del cuerpo corresponde a una lesión incapacitante.'),
(26,	'public/image/evidencias/5/5.4.png',	'A pesar de todos los intentos, MUKITO no recuperará sus dedos jamás.',	'public/audio/evidencias/5/5.4.mp3',	4,	12,	'Correcto, la pérdida que sufrió MUKITO es permanente.',	'La pérdida que sufrió MUKITO es permanente.'),
(27,	'public/image/evidencias/5/5.5.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/5/5.5.mp3',	5,	13,	NULL,	NULL),
(28,	'public/image/evidencias/6/6.1.png',	'MUKITO cae 20 metros abajo, producto del gaseamiento.',	'public/audio/evidencias/6/6.1.mp3',	1,	1,	'Correcto, la caída de la persona genera un daño, por lo tanto es un accidente.',	'La caída de la persona genera un daño, por lo tanto es un accidente.'),
(29,	'public/image/evidencias/6/6.2.png',	'MUKITO se impactó en el piso producto de la caída.',	'public/audio/evidencias/6/6.2.mp3',	2,	3,	'Correcto, el daño es recibido por MUKITO, por tanto el accidente es con daños a la persona.',	' El daño es recibido por MUKITO, por tanto el accidente es con daños a la persona.'),
(30,	'public/image/evidencias/6/6.3.png',	'MUKITO perdió la vida.',	'public/audio/evidencias/6/6.3.mp3',	3,	8,	'Correcto, lamentablemente en esta situación el accidente es catalogado como mortal.',	'Lamentablemente en esta situación el accidente es catalogado como mortal.'),
(31,	'public/image/evidencias/6/6.4.png',	'Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/6/6.4.mp3',	5,	13,	NULL,	NULL),
(32,	'public/image/evidencias/7/7.1.png',	'Una plancha de roca cae sobre MUKITO.',	'public/audio/evidencias/7/7.1.mp3',	1,	1,	'Correcto, la caída de algún objeto sobre la persona genera un daño, por lo tanto es un accidente.',	'La caída de algún objeto sobre la persona genera un daño, por lo tanto es un accidente.'),
(33,	'public/image/evidencias/7/7.2.png',	'La plancha cubrió totalmente a MUKITO.',	'public/audio/evidencias/7/7.2.mp3',	2,	3,	'Correcto, el daño es recibido por MUKITO, por tanto el accidente es con daños a la persona.',	' El daño es recibido por MUKITO, por tanto el accidente es con daños a la persona.'),
(34,	'public/image/evidencias/7/7.3.png',	'MUKITO, ha muerto producto del aplastamiento de la plancha.',	'public/audio/evidencias/7/7.3.mp3',	3,	8,	'Correcto, lamentablemente en esta situación el accidente es catalogado como mortal.',	'Lamentablemente en esta situación el accidente es catalogado como mortal.'),
(35,	'public/image/evidencias/7/7.4.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/7/7.4.mp3',	5,	13,	NULL,	NULL),
(36,	'public/image/evidencias/8/8.1.png',	'En el primer intento, MUKITO es salpicado por el aceite caliente de la sartén.',	'public/audio/evidencias/8/8.1.mp3',	1,	1,	'Correcto, el aceite caliente de la sartén generará un daño en la piel de MUKITO. ',	'El aceite caliente de la sartén generará un daño en la piel de MUKITO. '),
(37,	'public/image/evidencias/8/8.2.png',	'Una pequeña ampoya de quemadura aparece en la mano de MUKITO.',	'public/audio/evidencias/8/8.2.mp3',	2,	3,	'Correcto, la ampoya es una lesión  a la persona.',	'La ampoya es una lesión a la persona.'),
(38,	'public/image/evidencias/8/8.3.png',	'La ampoya de la mano de MUKITO, no compromete más piel que la superficial. El médico recetó pastillas y pomadas.',	'public/audio/evidencias/8/8.3.mp3',	3,	6,	'Correcto, se nos indica que el daño generado por la ampoya sólo lesionó la parte superficial de la piel.',	'Se nos indica que el daño generado por la ampoya sólo lesionó la parte superficial de la piel.'),
(39,	'public/image/evidencias/8/8.4.png',	'Al llegar a la posta más cercana, el médico recetó pomadas y pastillas.',	'public/audio/evidencias/8/8.4.mp3',	4,	10,	'Correcto, el diagnóstico del médico estuvo acompañado de pastillas y pomadas, sin duda es una atención médica.',	'El diagnóstico del médico estuvo acompañado de pastillas y pomadas, sin duda es una atención médica.'),
(40,	'public/image/evidencias/8/8.5.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/8/8.5.mp3',	5,	15,	NULL,	NULL),
(41,	'public/image/evidencias/9/9.1.png',	'Se produjo una abolladura del  equipo por desprendimientos de roca.',	'public/audio/evidencias/9/9.1.mp3',	1,	1,	'Correcto, la abolladura representa un daño al equipo.',	'La abolladura representa un daño al equipo.'),
(42,	'public/image/evidencias/9/9.2.png',	'Afortunadamente el equipo estaba sin personas dentro, las rocas impactaron en la cabina del operador.',	'public/audio/evidencias/9/9.2.mp3',	2,	4,	'Correcto, el daño se produjo sólo en el equipo, por lo tanto es un daño material.',	'\"El daño se produjo sólo en el equipo, por lo tanto es un daño material. \"'),
(43,	'public/image/evidencias/9/9.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/9/9.3.mp3',	5,	13,	NULL,	NULL),
(44,	'public/image/evidencias/10/10.1.png',	'En el despacho de combustible, MUKITO pierde el control de la manguera y se derraman 03 galones del hidrocarburo.',	'public/audio/evidencias/10/10.1.mp3',	1,	1,	'Correcto, el derrame del hidrocarburo constituye un accidente.',	'El derrame del hidrocarburo constituye un accidente.'),
(45,	'public/image/evidencias/10/10.2.png',	'El combustible derramado entró en contacto con la tierra. Inmediatamente se procedió a limpiar la zona afectada.',	'public/audio/evidencias/10/10.2.mp3',	2,	5,	'Correcto, al entrar en contacto con la tierra, el accidente es contra el medio ambiente.',	'Al entrar en contacto con la tierra, el accidente es contra el medio ambiente.'),
(46,	'public/image/evidencias/10/10.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/10/10.3.mp3',	5,	14,	NULL,	NULL),
(47,	'public/image/evidencias/11/11.1.png',	'De pronto la eslinga cedió al amarre y la carga cayó al suelo.',	'public/audio/evidencias/11/11.1.mp3',	1,	1,	'Correcto, tanto la rotura de la eslinga como la caída de la carga son accidentes.',	'\"Tanto la rotura de la eslinga como la caída de la carga son accidentes. \"'),
(48,	'public/image/evidencias/11/11.2.png',	'La carga quedó semi destrozada, se produjo una pérdida valorizada en 4000 dólares americanos. Sin embargo ningún trabajador resultó herido.',	'public/audio/evidencias/11/11.2.mp3',	2,	4,	'Correcto, se produjeron sólo daños materiales , el más costoso fue la carga semidestrozada.',	'Se produjeron sólo daños materiales , el más costoso fue la carga semidestrozada.'),
(49,	'public/image/evidencias/11/11.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/11/11.3.mp3',	5,	13,	NULL,	NULL),
(50,	'public/image/evidencias/12/12.1.png',	'De pronto, un ladrillo cae de 3 metros de altura. Casi impacta a MUKITO.',	'public/audio/evidencias/12/12.1.mp3',	1,	2,	'Correcto, poniéndo la atención en MUKITO, no se generaron daños personales.',	'Poniéndo la atención en MUKITO, no se generaron daños personales.'),
(51,	'public/image/evidencias/12/12.2.png',	'El ladrillo pudo haber golpeado y dañado a MUKITO en la cabeza.',	'public/audio/evidencias/12/12.2.mp3',	2,	3,	'Correcto, casi se daña MUKITO.',	'MUKITO es el que estuvo a punto de ser dañado.'),
(52,	'public/image/evidencias/12/12.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/12/12.3.mp3',	5,	13,	NULL,	NULL),
(53,	'public/image/evidencias/13/13.1.png',	'Estaba a punto de prenderle fuego! Afortunadamente un compañero lo detuvo.',	'public/audio/evidencias/13/13.1.mp3',	1,	2,	'Correcto, se iba a generar un daño al medio ambiente.',	'Se iba a generar un daño al medio ambiente.'),
(54,	'public/image/evidencias/13/13.2.png',	'El compañero le advirtió de los daños que ocasionaría al ecosistema y lo convenció de que no lo hiciera.',	'public/audio/evidencias/13/13.2.mp3',	2,	5,	'Correcto, se iba a generar un daño al medio ambiente.',	'Se iba a generar un daño al medio ambiente.'),
(55,	'public/image/evidencias/13/13.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/13/13.3.mp3',	5,	13,	NULL,	NULL),
(56,	'public/image/evidencias/14/14.1.png',	'Producto de la helada, MUKITO resbala y estuvo muy cerca de caerse.',	'public/audio/evidencias/14/14.1.mp3',	1,	2,	'Correcto, a pesar de que hubieron muchas probabilidades de caerse, no se materializó ningún daño.',	'A pesar de que hubieron muchas probabilidades de caerse, no se materializó ningún daño.'),
(57,	'public/image/evidencias/14/14.2.png',	'MUKITO llego a patinar casi un metro sobre la helada, pudo haber caído varios metros abajo.',	'public/audio/evidencias/14/14.2.mp3',	2,	3,	'Correcto, fue MUKITO el que pudo haber resultado lesionado.',	'MUKITO es el que pudo haber resultado lesionado.'),
(58,	'public/image/evidencias/14/14.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/14/14.3.mp3',	5,	13,	NULL,	NULL),
(59,	'public/image/evidencias/15/15.1.png',	'Una plancha de roca se cae justo delante de él. Felizmente no lo impactó',	'public/audio/evidencias/15/15.1.mp3',	1,	2,	'Correcto, a pesar de que hubieron muchas probabilidades de lesionarse, no se materializó ningún daño.',	'A pesar de que hubieron muchas probabilidades de lesionarse, no se materializó ningún daño.'),
(60,	'public/image/evidencias/15/15.2.png',	'La plancha estuvo a 40 centímetros de impactar y dañar a MUKITO.',	'public/audio/evidencias/15/15.2.mp3',	2,	3,	'Correcto, fue MUKITO el que pudo haber resultado lesionado.',	'MUKITO es el que pudo haber resultado lesionado.'),
(61,	'public/image/evidencias/15/15.3.png',	'¿Según la matriz, cual es el potencial del evento?',	'public/audio/evidencias/15/15.3.mp3',	5,	13,	NULL,	NULL);

DROP TABLE IF EXISTS `ac_formularios`;
CREATE TABLE `ac_formularios` (
  `id_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `pregunta_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `ac_formularios` (`id_formulario`, `titulo`, `pregunta_text`) VALUES
(1,	'f1',	'LA  SIGUIENTE SITUACIÓN ES UN:'),
(2,	'f2',	'COMO CLASIFICAMOS EL TIPO DE ACCIDENTE O INCIDENTE:'),
(3,	'f3',	'COMO CLASIFICAMOS EL TIPO DE ACCIDENTE O INCIDENTE:'),
(4,	'f4',	'COMO CLASIFICAMOS EL TIPO DE ACCIDENTE O INCIDENTE:'),
(5,	'f5',	'CUAL ES EL POTENCIAL DEL EVENTO?');

DROP TABLE IF EXISTS `ac_juego`;
CREATE TABLE `ac_juego` (
  `id_juego` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` varchar(10) DEFAULT NULL,
  `puntos_total` int(11) DEFAULT NULL,
  `puntos` int(11) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `metadata` text,
  PRIMARY KEY (`id_juego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ac_juego_detalle`;
CREATE TABLE `ac_juego_detalle` (
  `id_juego_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_juego` int(11) NOT NULL,
  `id_escenario_evidencia` int(11) NOT NULL,
  `respuesta` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_juego_detalle`),
  KEY `fk_respuestas_escenarios_evidencias1_idx` (`id_escenario_evidencia`),
  KEY `fk_ac_juego_detalle_ac_juego1_idx` (`id_juego`),
  KEY `fk_ac_juego_detalle_ac_alternativas1_idx` (`respuesta`),
  CONSTRAINT `fk_ac_juego_detalle_ac_alternativas1` FOREIGN KEY (`respuesta`) REFERENCES `ac_alternativas` (`id_alternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ac_juego_detalle_ac_juego1` FOREIGN KEY (`id_juego`) REFERENCES `ac_juego` (`id_juego`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_respuestas_escenarios_evidencias1` FOREIGN KEY (`id_escenario_evidencia`) REFERENCES `ac_escenarios_evidencias` (`id_escenario_evidencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2015-11-30 09:04:52
