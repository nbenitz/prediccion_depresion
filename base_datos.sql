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
CREATE DATABASE IF NOT EXISTS `preddep` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `preddep`;

-- Volcando estructura para tabla preddep.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.auth_group_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.auth_permission: ~44 rows (aproximadamente)
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
	(37, 'Can add items', 10, 'add_items'),
	(38, 'Can change items', 10, 'change_items'),
	(39, 'Can delete items', 10, 'delete_items'),
	(40, 'Can view items', 10, 'view_items'),
	(41, 'Can add tipo depresion', 11, 'add_tipodepresion'),
	(42, 'Can change tipo depresion', 11, 'change_tipodepresion'),
	(43, 'Can delete tipo depresion', 11, 'delete_tipodepresion'),
	(44, 'Can view tipo depresion', 11, 'view_tipodepresion');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE latin1_spanish_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `first_name` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `last_name` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(254) COLLATE latin1_spanish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telefono` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `is_paciente` tinyint(1) NOT NULL,
  `signup_confirmation` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.auth_user: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `telefono`, `direccion`, `is_paciente`, `signup_confirmation`) VALUES
	(1, 'pbkdf2_sha256$150000$ewWOrCeSNUzb$4vP7WDdi2aEfin2GcH/BO4bd7Q7x15rgP7gnmqL7MoA=', '2022-11-16 02:11:57.550621', 1, 'admin', 'Fredy', 'Villalba', 'yonestor87@gmail.com', 1, 1, '2022-11-16 02:10:26.307764', '0994123123', 'Calle González', 0, 0),
	(2, '', NULL, 0, 'feli', 'Felipe', 'Ro', 'feli@felippo.com', 0, 1, '2022-11-16 02:36:56.132709', '0971123123', 'Calle Rojas', 0, 0),
	(3, 'pbkdf2_sha256$150000$IHs8Zb6ZjBI6$K/hbKg5vv+JvMqSLre4tFQEU6PpUVA8Brc+g6Zz2AZU=', NULL, 0, 'Rodri', 'Rodrigo', 'Portillo', 'rodri@hotmail.com', 0, 0, '2022-11-16 11:54:47.567232', '0981123123', 'Ruta 8', 1, 0),
	(4, 'pbkdf2_sha256$150000$FzkgdTQZnx7W$wBhvwYe75i5r113ZHmKeDafeSRUVf2sWVcWU2Q5qN3Y=', NULL, 0, 'toni', 'Toni', 'Perez', 'toni@hotmail.com', 0, 0, '2022-11-16 14:21:08.155159', '09994777333', 'Calle Yguazu', 1, 0);
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.auth_user_groups: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.auth_user_user_permissions: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE latin1_spanish_ci,
  `object_repr` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE latin1_spanish_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.django_admin_log: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `model` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.django_content_type: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(10, 'estructura', 'items'),
	(11, 'estructura', 'tipodepresion'),
	(9, 'persona', 'doctor'),
	(8, 'persona', 'paciente'),
	(7, 'persona', 'user'),
	(5, 'sessions', 'session'),
	(6, 'sites', 'site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.django_migrations: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-11-16 02:06:02.038837'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2022-11-16 02:06:05.817552'),
	(3, 'auth', '0001_initial', '2022-11-16 02:06:09.204281'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2022-11-16 02:06:27.521467'),
	(5, 'auth', '0003_alter_user_email_max_length', '2022-11-16 02:06:27.727598'),
	(6, 'auth', '0004_alter_user_username_opts', '2022-11-16 02:06:28.109369'),
	(7, 'auth', '0005_alter_user_last_login_null', '2022-11-16 02:06:28.294696'),
	(8, 'auth', '0006_require_contenttypes_0002', '2022-11-16 02:06:28.386312'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2022-11-16 02:06:28.882037'),
	(10, 'auth', '0008_alter_user_username_max_length', '2022-11-16 02:06:29.399486'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2022-11-16 02:06:29.843464'),
	(12, 'auth', '0010_alter_group_name_max_length', '2022-11-16 02:06:31.224776'),
	(13, 'auth', '0011_update_proxy_permissions', '2022-11-16 02:06:31.805380'),
	(14, 'persona', '0001_initial', '2022-11-16 02:06:40.689457'),
	(15, 'admin', '0001_initial', '2022-11-16 02:07:32.520481'),
	(16, 'admin', '0002_logentry_remove_auto_add', '2022-11-16 02:07:41.863999'),
	(17, 'admin', '0003_logentry_add_action_flag_choices', '2022-11-16 02:07:42.161330'),
	(18, 'estructura', '0001_initial', '2022-11-16 02:07:47.191094'),
	(19, 'sessions', '0001_initial', '2022-11-16 02:07:48.998761'),
	(20, 'sites', '0001_initial', '2022-11-16 02:07:52.349135'),
	(21, 'sites', '0002_alter_domain_unique', '2022-11-16 02:07:53.571341'),
	(22, 'estructura', '0002_auto_20221116_0812', '2022-11-16 11:13:10.714987');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `session_data` longtext COLLATE latin1_spanish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.django_session: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('dk1yg7vtohqt5j4dk2jvybotxqmdbqkp', 'NDE2NDk3ZmRiNjgzNDA0MWU0NWMzZDJjYWY2N2ZiN2MwMjE5N2Q5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Njc2MDI3NTgyYmFhZWFlMDBiNWJhYTFjNWJlZDc0ZjlhNWVmODg5In0=', '2022-11-30 02:11:57.672652');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.django_site
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.django_site: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
	(1, 'example.com', 'example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.doctor
CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `doctor_user_id_382cea53_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.doctor: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` (`id`, `ci`, `user_id`) VALUES
	(1, '6123123', 1),
	(2, '4123123', 2);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.item
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.item: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `paciente_user_id_b672a151_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.paciente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `ci`, `user_id`) VALUES
	(1, '7888222', 3),
	(2, '7666555', 4);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Volcando estructura para tabla preddep.tipo_depresión
CREATE TABLE IF NOT EXISTS `tipo_depresión` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` longtext COLLATE latin1_spanish_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- Volcando datos para la tabla preddep.tipo_depresión: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_depresión` DISABLE KEYS */;
INSERT INTO `tipo_depresión` (`id`, `tipo`, `descripcion`, `is_active`) VALUES
	(1, '1. Trastorno Depresivo Mayor', 'Es el más característico y el que concentra la mayoría de síntomas. Cuando el paciente se muestra extremadamente apático y con inhibición psicomotriz, se habla también de melancolía; en los casos más graves conduce al estupor depresivo. En el que el paciente se encuentra inmóvil e incluso puede rechazar comer o beber.\r\n\r\nExiste un subtipo en el que aparecen trastornos delirantes, es decir creencias firmemente sostenidas pero sin fundamentos adecuados. Los delirios suelen ser de culpa o ruina.', 1),
	(2, '2. Distimia', 'Se distingue por su cronicidad, la inestabilidad del humor, la fuerte ansiedad y la fluctuación del estado de ánimo. La baja autoestima y la desesperanza son también características de la distima.', 1),
	(3, '3. Trastorno ansioso-depresivo', 'Es una mezcla de ansiedad y depresión, en general moderada.', 1),
	(4, '4. Depresión Atípica', 'Se caracteriza por gran reactividad del estado de ánimo a situación diversas, con marcada ansiedad y síntomas depresivos” invertidos”: empeoramiento por las tardes, aumento de apetito e hipersomnia', 1),
	(5, '5. Trastorno afectivo estacional', 'Aparece de forma regular y repetida, coincidiendo con cambios estacionales, en general, en otoño e invierno, y asociado a los cambios lumínicos. Somnolencia excesiva, apetencia por los hidratos de carbono junto con los síntomas típicos de la depresión, destacando la fatiga.', 1),
	(6, '6. Trastorno Bipolar', 'Implica la existencia d episodios depresivos graves alternados por otros de exaltación de las funciones mentales (“manía”), consistente en aceleración del pensamiento, hiperactividad, gastos descontrolados, insomnio e irritabilidad.', 1),
	(7, '7. Ciclotimia', 'Manifestaciones leves e imprevisibles con cambios frecuentes de estado de ánimo (de la euforia a la tristeza) en varios días, sin motivo aparente; son sujetos muy inestables. Es difícil diferenciarla de los cambios normales.', 1);
/*!40000 ALTER TABLE `tipo_depresión` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
