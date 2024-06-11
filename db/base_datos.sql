-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.28 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para preddep
CREATE DATABASE IF NOT EXISTS `preddep` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `preddep`;

-- Volcando estructura para tabla preddep.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.auth_group: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.auth_permission: ~60 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add site', 6, 'add_site'),
	(22, 'Can change site', 6, 'change_site'),
	(23, 'Can delete site', 6, 'delete_site'),
	(24, 'Can view site', 6, 'view_site'),
	(25, 'Can add user', 7, 'add_user'),
	(26, 'Can change user', 7, 'change_user'),
	(27, 'Can delete user', 7, 'delete_user'),
	(28, 'Can view user', 7, 'view_user'),
	(29, 'Can add paciente', 8, 'add_paciente'),
	(30, 'Can change paciente', 8, 'change_paciente'),
	(31, 'Can delete paciente', 8, 'delete_paciente'),
	(32, 'Can view paciente', 8, 'view_paciente'),
	(33, 'Can add doctor', 9, 'add_doctor'),
	(34, 'Can change doctor', 9, 'change_doctor'),
	(35, 'Can delete doctor', 9, 'delete_doctor'),
	(36, 'Can view doctor', 9, 'view_doctor'),
	(37, 'Can add trastorno', 10, 'add_trastorno'),
	(38, 'Can change trastorno', 10, 'change_trastorno'),
	(39, 'Can delete trastorno', 10, 'delete_trastorno'),
	(40, 'Can view trastorno', 10, 'view_trastorno'),
	(41, 'Can add preguntas', 11, 'add_preguntas'),
	(42, 'Can change preguntas', 11, 'change_preguntas'),
	(43, 'Can delete preguntas', 11, 'delete_preguntas'),
	(44, 'Can view preguntas', 11, 'view_preguntas'),
	(45, 'Can add escala', 12, 'add_escala'),
	(46, 'Can change escala', 12, 'change_escala'),
	(47, 'Can delete escala', 12, 'delete_escala'),
	(48, 'Can view escala', 12, 'view_escala'),
	(49, 'Can add cuestionario', 13, 'add_cuestionario'),
	(50, 'Can change cuestionario', 13, 'change_cuestionario'),
	(51, 'Can delete cuestionario', 13, 'delete_cuestionario'),
	(52, 'Can view cuestionario', 13, 'view_cuestionario'),
	(53, 'Can add pregunta', 14, 'add_pregunta'),
	(54, 'Can change pregunta', 14, 'change_pregunta'),
	(55, 'Can delete pregunta', 14, 'delete_pregunta'),
	(56, 'Can view pregunta', 14, 'view_pregunta'),
	(57, 'Can add test', 15, 'add_test'),
	(58, 'Can change test', 15, 'change_test'),
	(59, 'Can delete test', 15, 'delete_test'),
	(60, 'Can view test', 15, 'view_test'),
	(61, 'Can add resultado', 16, 'add_resultado'),
	(62, 'Can change resultado', 16, 'change_resultado'),
	(63, 'Can delete resultado', 16, 'delete_resultado'),
	(64, 'Can view resultado', 16, 'view_resultado');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_persona_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_persona_user_id` FOREIGN KEY (`user_id`) REFERENCES `persona_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.django_content_type: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(13, 'estructura', 'cuestionario'),
	(12, 'estructura', 'escala'),
	(14, 'estructura', 'pregunta'),
	(11, 'estructura', 'preguntas'),
	(16, 'estructura', 'resultado'),
	(15, 'estructura', 'test'),
	(10, 'estructura', 'trastorno'),
	(9, 'persona', 'doctor'),
	(8, 'persona', 'paciente'),
	(7, 'persona', 'user'),
	(5, 'sessions', 'session'),
	(6, 'sites', 'site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.django_migrations: ~26 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2023-02-04 18:08:58.425238'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2023-02-04 18:09:03.050407'),
	(3, 'auth', '0001_initial', '2023-02-04 18:09:05.699591'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2023-02-04 18:09:29.840959'),
	(5, 'auth', '0003_alter_user_email_max_length', '2023-02-04 18:09:30.057484'),
	(6, 'auth', '0004_alter_user_username_opts', '2023-02-04 18:09:30.240600'),
	(7, 'auth', '0005_alter_user_last_login_null', '2023-02-04 18:09:30.622266'),
	(8, 'auth', '0006_require_contenttypes_0002', '2023-02-04 18:09:30.825576'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2023-02-04 18:09:31.087400'),
	(10, 'auth', '0008_alter_user_username_max_length', '2023-02-04 18:09:31.331328'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2023-02-04 18:09:31.760896'),
	(12, 'auth', '0010_alter_group_name_max_length', '2023-02-04 18:09:32.577823'),
	(13, 'auth', '0011_update_proxy_permissions', '2023-02-04 18:09:32.670385'),
	(14, 'persona', '0001_initial', '2023-02-04 18:09:45.099226'),
	(15, 'admin', '0001_initial', '2023-02-04 18:10:24.159392'),
	(16, 'admin', '0002_logentry_remove_auto_add', '2023-02-04 18:10:36.138551'),
	(17, 'admin', '0003_logentry_add_action_flag_choices', '2023-02-04 18:10:36.521424'),
	(18, 'estructura', '0001_initial', '2023-02-04 18:10:41.932216'),
	(19, 'sessions', '0001_initial', '2023-02-04 18:10:54.611802'),
	(20, 'sites', '0001_initial', '2023-02-04 18:11:01.732098'),
	(21, 'sites', '0002_alter_domain_unique', '2023-02-04 18:11:03.566432'),
	(22, 'estructura', '0002_auto_20230204_2112', '2023-02-05 00:12:45.885135'),
	(23, 'persona', '0002_auto_20230204_2112', '2023-02-05 00:13:05.932872'),
	(24, 'estructura', '0003_test', '2023-02-05 00:46:21.328024'),
	(25, 'estructura', '0004_auto_20230206_1401', '2023-02-06 17:01:33.820126'),
	(26, 'estructura', '0005_auto_20230206_1459', '2023-02-06 17:59:51.881607'),
	(27, 'estructura', '0006_resultado', '2023-02-06 18:56:00.857400');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.django_session: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('2se49h067sh6mnanb3li5d75qres9nrd', 'MDhkMWIwNjc2OTQxYzJhMTQyMGI4NDYwMWFmMmIwZjQ2ODM3ZTFiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3M2I5YmE1ZmY2M2EwMjNmODA0MTVkOTI5NTNiOWZiMmVhZTkzMWQ5In0=', '2023-02-19 00:14:21.023928'),
	('r10iwwhoot24s1x8xxz3r29wljeenwq5', 'MDhkMWIwNjc2OTQxYzJhMTQyMGI4NDYwMWFmMmIwZjQ2ODM3ZTFiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3M2I5YmE1ZmY2M2EwMjNmODA0MTVkOTI5NTNiOWZiMmVhZTkzMWQ5In0=', '2023-02-18 18:20:19.619406');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_site
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.django_site: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'example.com', 'example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_cuestionario
CREATE TABLE IF NOT EXISTS `estructura_cuestionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trastorno_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_cuestionario_trastorno_id_f5a769c2_fk_trastorno_id` (`trastorno_id`),
  CONSTRAINT `estructura_cuestionario_trastorno_id_f5a769c2_fk_trastorno_id` FOREIGN KEY (`trastorno_id`) REFERENCES `estructura_trastorno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_cuestionario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_cuestionario` DISABLE KEYS */;
INSERT INTO `estructura_cuestionario` (`id`, `trastorno_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `estructura_cuestionario` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_cuestionario_preguntas
CREATE TABLE IF NOT EXISTS `estructura_cuestionario_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuestionario_id` int NOT NULL,
  `pregunta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estructura_cuestionario__cuestionario_id_pregunta_b500ac65_uniq` (`cuestionario_id`,`pregunta_id`),
  KEY `estructura_cuestiona_pregunta_id_a04f37d4_fk_estructur` (`pregunta_id`),
  CONSTRAINT `estructura_cuestiona_cuestionario_id_cb7e9789_fk_estructur` FOREIGN KEY (`cuestionario_id`) REFERENCES `estructura_cuestionario` (`id`),
  CONSTRAINT `estructura_cuestiona_pregunta_id_a04f37d4_fk_estructur` FOREIGN KEY (`pregunta_id`) REFERENCES `estructura_pregunta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_cuestionario_preguntas: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_cuestionario_preguntas` DISABLE KEYS */;
INSERT INTO `estructura_cuestionario_preguntas` (`id`, `cuestionario_id`, `pregunta_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4),
	(5, 1, 5),
	(6, 1, 6),
	(7, 1, 7),
	(8, 1, 8),
	(9, 1, 9),
	(10, 1, 10),
	(11, 1, 11),
	(12, 1, 12),
	(13, 1, 13),
	(14, 1, 14),
	(15, 1, 15),
	(16, 1, 16),
	(17, 1, 17),
	(18, 1, 18),
	(19, 1, 19),
	(20, 1, 20),
	(21, 1, 21),
	(22, 1, 22),
	(23, 1, 23),
	(24, 1, 24),
	(25, 1, 25),
	(26, 1, 26),
	(27, 1, 27),
	(28, 1, 28),
	(29, 1, 29),
	(30, 1, 30),
	(31, 1, 31),
	(32, 1, 32),
	(33, 1, 33),
	(34, 1, 34),
	(35, 1, 35),
	(36, 1, 36);
/*!40000 ALTER TABLE `estructura_cuestionario_preguntas` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_escala
CREATE TABLE IF NOT EXISTS `estructura_escala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `caracteristicas` longtext NOT NULL,
  `tratamientos` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `id_trastorno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `escala_id_trastorno_168e2a02_fk_trastorno_id` (`id_trastorno`),
  CONSTRAINT `escala_id_trastorno_168e2a02_fk_trastorno_id` FOREIGN KEY (`id_trastorno`) REFERENCES `estructura_trastorno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_escala: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_escala` DISABLE KEYS */;
INSERT INTO `estructura_escala` (`id`, `tipo`, `descripcion`, `caracteristicas`, `tratamientos`, `is_active`, `id_trastorno`) VALUES
	(1, 'Depresión distimia leve', 'El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.', 'Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva', 'El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva.', 1, 1),
	(2, 'Depresión distimia moderado', 'El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.', 'Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva', 'El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva, con la posibilidad de una combinación de estos enfoques.', 1, 1),
	(3, 'Depresión distimia grave', 'El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.', 'Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva', 'Terapia psicológica: La terapia psicológica, como la terapia cognitivo-conductual (TCC), puede ayudar a las personas a comprender y manejar sus pensamientos y emociones negativas.\r\n\r\nMedicación: Los antidepresivos pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de grupo: La terapia de grupo puede ser una forma efectiva de tratar la depresión neurótica al brindar un entorno de apoyo y comprensión.\r\n\r\nCambios en el estilo de vida: Modificaciones en la dieta, el ejercicio y la eliminación del estrés pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de apoyo: La terapia de apoyo brinda a la persona un espacio para hablar sobre sus pensamientos y emociones con un profesional capacitado.', 1, 1),
	(4, 'Depresión mayor leve', 'El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.', 'Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio', 'El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva.', 1, 1),
	(5, 'Depresión mayor moderado', 'El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.', 'Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio', 'El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva, con la posibilidad de una combinación de estos enfoques.', 1, 1),
	(6, 'Depresión mayor grave', 'El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.', 'Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio', 'El tratamiento incluye terapia psicológica intensiva, como terapia cognitivo-conductual y terapia interpersonal, combinado con medicación antidepresiva y a veces con terapia electroconvulsiva (ECT).', 1, 1),
	(7, 'Depresión neurótica moderado', 'La depresión neurótica es un subtipo de depresión que se asocia con ansiedad y estrés. A menudo se desencadena por eventos estresantes o conflictos emocionales, y los síntomas incluyen tristeza, ansiedad, insomnio y preocupación excesiva. La depresión neurótica también puede incluir síntomas somáticos como dolores de cabeza, dolores musculares y fatiga. Este tipo de depresión puede ser tratado con terapia psicológica, medicación y cambios en el estilo de vida para manejar el estrés y la ansiedad.', '- Tristeza y desánimo: La persona experimenta una tristeza profunda y un sentimiento de desánimo.\r\n- Ansiedad: La persona experimenta una sensación de inquietud y preocupación excesiva.\r\n- Insomnio: Dificultad para dormir o para mantenerse dormido.\r\n- Estrés: La persona está más susceptible a sentirse estresada y ansiosa en situaciones estresantes.\r\n- Preocupación excesiva: La persona se preocupa excesivamente sobre eventos futuros o sobre el resultado de situaciones cotidianas.\r\n- Síntomas somáticos: Dolor de cabeza, dolores musculares y fatiga son comunes.\r\n- Pérdida de interés: La persona puede tener dificultades para sentir placer en actividades que antes disfrutaba.\r\n- Dificultad para concentrarse: La persona puede tener dificultades para concentrarse y tomar decisiones.\r\n- Cambios en el apetito: La persona puede experimentar cambios en el apetito, como un aumento o una disminución en el apetito.', 'Terapia psicológica: La terapia psicológica, como la terapia cognitivo-conductual (TCC), puede ayudar a las personas a comprender y manejar sus pensamientos y emociones negativas.\r\n\r\nMedicación: Los antidepresivos pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de grupo: La terapia de grupo puede ser una forma efectiva de tratar la depresión neurótica al brindar un entorno de apoyo y comprensión.\r\n\r\nCambios en el estilo de vida: Modificaciones en la dieta, el ejercicio y la eliminación del estrés pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de apoyo: La terapia de apoyo brinda a la persona un espacio para hablar sobre sus pensamientos y emociones con un profesional capacitado.', 1, 1),
	(8, 'Depresión neurótica grave', 'La depresión neurótica es un subtipo de depresión que se asocia con ansiedad y estrés. A menudo se desencadena por eventos estresantes o conflictos emocionales, y los síntomas incluyen tristeza, ansiedad, insomnio y preocupación excesiva. La depresión neurótica también puede incluir síntomas somáticos como dolores de cabeza, dolores musculares y fatiga. Este tipo de depresión puede ser tratado con terapia psicológica, medicación y cambios en el estilo de vida para manejar el estrés y la ansiedad.', '- Tristeza y desánimo: La persona experimenta una tristeza profunda y un sentimiento de desánimo.\r\n- Ansiedad: La persona experimenta una sensación de inquietud y preocupación excesiva.\r\n- Insomnio: Dificultad para dormir o para mantenerse dormido.\r\n- Estrés: La persona está más susceptible a sentirse estresada y ansiosa en situaciones estresantes.\r\n- Preocupación excesiva: La persona se preocupa excesivamente sobre eventos futuros o sobre el resultado de situaciones cotidianas.\r\n- Síntomas somáticos: Dolor de cabeza, dolores musculares y fatiga son comunes.\r\n- Pérdida de interés: La persona puede tener dificultades para sentir placer en actividades que antes disfrutaba.\r\n- Dificultad para concentrarse: La persona puede tener dificultades para concentrarse y tomar decisiones.\r\n- Cambios en el apetito: La persona puede experimentar cambios en el apetito, como un aumento o una disminución en el apetito.', 'El tratamiento incluye terapia psicológica intensiva, como terapia cognitivo-conductual y terapia interpersonal, combinado con medicación antidepresiva y a veces con terapia electroconvulsiva (ECT).', 1, 1),
	(9, 'Depresión existencial', 'La depresión existencial es un tipo de depresión que se relaciona con cuestiones filosóficas y existenciales, como la identidad, el sentido de la vida y la muerte.', 'Sentido de vacío y desesperación: La persona puede sentir un vacío emocional y una sensación de que su vida carece de significado o propósito.\r\n\r\nIncertidumbre existencial: Puede sentir una sensación de incertidumbre y confusión acerca de su identidad y su lugar en el mundo.\r\n\r\nTemor a la muerte: La persona puede experimentar miedo o ansiedad acerca de la muerte y su significado.\r\n\r\nPérdida de interés en actividades que solían ser gratificantes: La persona puede perder el interés en actividades que antes encontraba gratificantes y significativas.', 'El tratamiento para la depresión existencial incluye terapias psicológicas como la terapia cognitivo-conductual (TCC) y la terapia humanista, así como la terapia de grupo y la terapia de apoyo. También puede ser útil trabajar con un terapeuta que se especialice en cuestiones existenciales. Es importante buscar tratamiento temprano para la depresión existencial, ya que puede afectar significativamente la calidad de vida de la persona.', 1, 1),
	(10, 'Depresión psicótica', 'El trastorno depresivo psicótico es un tipo de depresión que se caracteriza por los síntomas típicos del trastorno depresivo mayor, junto con síntomas psicóticos, como alucinaciones o delirios.', 'Síntomas similares a los del trastorno depresivo mayor\r\nAdemás, presencia de síntomas psicóticos, como alucinaciones o delirios', 'El tratamiento incluye terapia psicológica intensiva y medicación antipsicótica, combinado con terapia para tratar síntomas psicóticos.', 1, 1);
/*!40000 ALTER TABLE `estructura_escala` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_pregunta
CREATE TABLE IF NOT EXISTS `estructura_pregunta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_item` int NOT NULL,
  `pregunta` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_pregunta: ~36 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_pregunta` DISABLE KEYS */;
INSERT INTO `estructura_pregunta` (`id`, `nro_item`, `pregunta`) VALUES
	(1, 1, '¿Está deprimido por alguna situación de su vida?'),
	(2, 2, '¿Muy poco sueño?'),
	(3, 3, '¿Se fatiga o pierde la energía casi cada día?'),
	(4, 4, '¿Baja autoestima?'),
	(5, 5, '¿Come muy poco?'),
	(6, 6, '¿Problemas de memoria, atención y concentración?'),
	(7, 7, '¿Pensamiento de que todo le sale mal?'),
	(8, 8, '¿Ve el futuro negativamente?'),
	(9, 9, '¿Tiene pensamientos negativos?'),
	(10, 10, '¿Se desanima con facilidad?'),
	(11, 11, '¿Pensamiento suicida?'),
	(12, 12, '¿Pensamiento de hacerse daño?'),
	(13, 13, '¿No quiere conversar con nadie?'),
	(14, 14, '¿No quiere salir a ningún lado?'),
	(15, 15, '¿Se siente triste o vacío?'),
	(16, 16, '¿Se siente a veces o siempre irritable?'),
	(17, 17, '¿Ha perdido o aumentado 5% de su peso corporal?'),
	(18, 18, '¿Presenta insomnio casi cada día?'),
	(19, 19, '¿Se agita en actividades psicomotoras?'),
	(20, 20, '¿Presenta sensación de inutilidad y confusión?'),
	(21, 21, '¿Ha perdido a un ser querido recientemente?'),
	(22, 22, '¿Tiene alucinaciones?'),
	(23, 23, '¿Está pasando por algún problema?'),
	(24, 24, '¿Piensa que no tiene suerte en su vida?'),
	(25, 25, '¿Todos los síntomas se presentan de vez en cuando?'),
	(26, 26, '¿Todos los síntomas se presentan todos los días?'),
	(27, 27, '¿Está muy estresado?'),
	(28, 28, '¿Siente que su vida no tiene sentido?'),
	(29, 29, '¿Se siente agotado y con miedo?'),
	(30, 30, '¿Sufre de falta de motivación por realizar sus cosas cotidianas?'),
	(31, 31, '¿No tiene pasión por nada?'),
	(32, 32, '¿Tiene ganas de dormir en el día?'),
	(33, 33, '¿Se encuentra en un estado de ilusión?'),
	(34, 34, '¿Escucha voces en la cabeza?'),
	(35, 35, '¿Es muy impulsivo (a)?'),
	(36, 36, '¿Es muy nervioso (a)?');
/*!40000 ALTER TABLE `estructura_pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_resultado
CREATE TABLE IF NOT EXISTS `estructura_resultado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `respuesta` tinyint(1) NOT NULL,
  `pregunta_id` int NOT NULL,
  `test_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_resultado_pregunta_id_e78cc486_fk_estructur` (`pregunta_id`),
  KEY `estructura_resultado_test_id_dc45c01a_fk_estructura_test_id` (`test_id`),
  CONSTRAINT `estructura_resultado_pregunta_id_e78cc486_fk_estructur` FOREIGN KEY (`pregunta_id`) REFERENCES `estructura_pregunta` (`id`),
  CONSTRAINT `estructura_resultado_test_id_dc45c01a_fk_estructura_test_id` FOREIGN KEY (`test_id`) REFERENCES `estructura_test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_resultado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_resultado` DISABLE KEYS */;
INSERT INTO `estructura_resultado` (`id`, `respuesta`, `pregunta_id`, `test_id`) VALUES
	(7, 1, 1, 1),
	(8, 0, 2, 1),
	(9, 1, 3, 1),
	(10, 0, 4, 1),
	(11, 1, 5, 1),
	(12, 0, 6, 1),
	(13, 0, 7, 1),
	(14, 0, 8, 1),
	(15, 0, 9, 1),
	(16, 1, 10, 1),
	(17, 0, 11, 1),
	(18, 1, 12, 1),
	(19, 1, 13, 1),
	(20, 0, 14, 1),
	(21, 1, 15, 1),
	(22, 1, 16, 1),
	(23, 1, 17, 1),
	(24, 1, 18, 1),
	(25, 0, 19, 1),
	(26, 0, 20, 1),
	(27, 1, 21, 1),
	(28, 0, 22, 1),
	(29, 0, 23, 1),
	(30, 0, 24, 1),
	(31, 1, 25, 1),
	(32, 1, 26, 1),
	(33, 0, 27, 1),
	(34, 0, 28, 1),
	(35, 1, 29, 1),
	(36, 0, 30, 1),
	(37, 1, 31, 1),
	(38, 0, 32, 1),
	(39, 0, 33, 1),
	(40, 0, 34, 1),
	(41, 1, 35, 1),
	(42, 1, 36, 1),
	(43, 0, 1, 3),
	(44, 0, 2, 3),
	(45, 0, 3, 3),
	(46, 0, 4, 3),
	(47, 0, 5, 3),
	(48, 1, 6, 3),
	(49, 1, 7, 3),
	(50, 1, 8, 3),
	(51, 1, 9, 3),
	(52, 1, 10, 3),
	(53, 0, 11, 3),
	(54, 0, 12, 3),
	(55, 0, 13, 3),
	(56, 0, 14, 3),
	(57, 0, 15, 3),
	(58, 0, 16, 3),
	(59, 0, 17, 3),
	(60, 0, 18, 3),
	(61, 0, 19, 3),
	(62, 0, 20, 3),
	(63, 0, 21, 3),
	(64, 0, 22, 3),
	(65, 0, 23, 3),
	(66, 0, 24, 3),
	(67, 0, 25, 3),
	(68, 0, 26, 3),
	(69, 0, 27, 3),
	(70, 0, 28, 3),
	(71, 0, 29, 3),
	(72, 0, 30, 3),
	(73, 0, 31, 3),
	(74, 0, 32, 3),
	(75, 0, 33, 3),
	(76, 0, 34, 3),
	(77, 0, 35, 3),
	(78, 0, 36, 3);
/*!40000 ALTER TABLE `estructura_resultado` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_test
CREATE TABLE IF NOT EXISTS `estructura_test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `cuestionario_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_test_cuestionario_id_e6bff2ca_fk_estructur` (`cuestionario_id`),
  KEY `estructura_test_doctor_id_1dbbd824_fk_persona_doctor_id` (`doctor_id`),
  KEY `estructura_test_paciente_id_bfbb1c9c_fk_persona_paciente_id` (`paciente_id`),
  CONSTRAINT `estructura_test_cuestionario_id_e6bff2ca_fk_estructur` FOREIGN KEY (`cuestionario_id`) REFERENCES `estructura_cuestionario` (`id`),
  CONSTRAINT `estructura_test_doctor_id_1dbbd824_fk_persona_doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `persona_doctor` (`id`),
  CONSTRAINT `estructura_test_paciente_id_bfbb1c9c_fk_persona_paciente_id` FOREIGN KEY (`paciente_id`) REFERENCES `persona_paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_test: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_test` DISABLE KEYS */;
INSERT INTO `estructura_test` (`id`, `fecha`, `cuestionario_id`, `doctor_id`, `paciente_id`) VALUES
	(1, '2023-02-06 20:03:07.512353', 1, 1, 2),
	(2, '2023-02-06 21:54:50.764634', 1, 1, 2),
	(3, '2023-02-06 22:03:29.663316', 1, 1, 2);
/*!40000 ALTER TABLE `estructura_test` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.estructura_trastorno
CREATE TABLE IF NOT EXISTS `estructura_trastorno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.estructura_trastorno: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `estructura_trastorno` DISABLE KEYS */;
INSERT INTO `estructura_trastorno` (`id`, `nombre`, `descripcion`, `is_active`) VALUES
	(1, 'Depresión', 'La depresión es un trastorno del estado de ánimo que se caracteriza por una tristeza persistente, pérdida de interés o placer en actividades que solían ser disfrutadas, y cambios en el apetito, sueño y energía. Puede afectar a la capacidad de una persona para llevar a cabo tareas cotidianas y puede tener un impacto negativo en las relaciones personales y en la vida laboral. La depresión puede ser un trastorno aislado o formar parte de un trastorno mayor, y puede ser tratada con una combinación de medicación, terapia y cambios en el estilo de vida.', 1);
/*!40000 ALTER TABLE `estructura_trastorno` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.persona_doctor
CREATE TABLE IF NOT EXISTS `persona_doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `persona_doctor_user_id_9790c1cd_fk_persona_user_id` FOREIGN KEY (`user_id`) REFERENCES `persona_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.persona_doctor: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_doctor` DISABLE KEYS */;
INSERT INTO `persona_doctor` (`id`, `ci`, `user_id`) VALUES
	(1, '6123234', 1);
/*!40000 ALTER TABLE `persona_doctor` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.persona_paciente
CREATE TABLE IF NOT EXISTS `persona_paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.persona_paciente: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_paciente` DISABLE KEYS */;
INSERT INTO `persona_paciente` (`id`, `ci`, `nombre`, `apellido`, `telefono`, `direccion`, `email`, `fecha_nacimiento`) VALUES
	(2, '6234456', 'Pedro', 'González', '0975267413', 'Yasyreta y Humaita, Coronel Oviedo, Paraguay', 'pedro@gmail.com', '1987-02-01');
/*!40000 ALTER TABLE `persona_paciente` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.persona_user
CREATE TABLE IF NOT EXISTS `persona_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `signup_confirmation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.persona_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_user` DISABLE KEYS */;
INSERT INTO `persona_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `telefono`, `direccion`, `signup_confirmation`) VALUES
	(1, 'pbkdf2_sha256$150000$yr0YA4nisvQA$mhiVX2w/UeWi4h3bf6h3+5af/5+6vO6Re+eE/tIr8sk=', '2023-02-05 00:14:20.793926', 1, 'admin', 'Jose', 'Martínez Pérez', 'jmartinez@gmail.com', 1, 1, '2023-02-04 18:13:41.463620', '0975267388', 'Calle 13', 0);
/*!40000 ALTER TABLE `persona_user` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.persona_user_groups
CREATE TABLE IF NOT EXISTS `persona_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_user_groups_user_id_group_id_da414436_uniq` (`user_id`,`group_id`),
  KEY `persona_user_groups_group_id_7ed904df_fk_auth_group_id` (`group_id`),
  CONSTRAINT `persona_user_groups_group_id_7ed904df_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `persona_user_groups_user_id_27e9297c_fk_persona_user_id` FOREIGN KEY (`user_id`) REFERENCES `persona_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.persona_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.persona_user_user_permissions
CREATE TABLE IF NOT EXISTS `persona_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_user_user_permis_user_id_permission_id_29dd9108_uniq` (`user_id`,`permission_id`),
  KEY `persona_user_user_pe_permission_id_9d38d456_fk_auth_perm` (`permission_id`),
  CONSTRAINT `persona_user_user_pe_permission_id_9d38d456_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `persona_user_user_pe_user_id_7ea6381c_fk_persona_u` FOREIGN KEY (`user_id`) REFERENCES `persona_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla preddep.persona_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_user_user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
