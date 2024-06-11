CREATE DATABASE  IF NOT EXISTS `preddep` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `preddep`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: preddep
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add site',6,'add_site'),(22,'Can change site',6,'change_site'),(23,'Can delete site',6,'delete_site'),(24,'Can view site',6,'view_site'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add paciente',8,'add_paciente'),(30,'Can change paciente',8,'change_paciente'),(31,'Can delete paciente',8,'delete_paciente'),(32,'Can view paciente',8,'view_paciente'),(33,'Can add doctor',9,'add_doctor'),(34,'Can change doctor',9,'change_doctor'),(35,'Can delete doctor',9,'delete_doctor'),(36,'Can view doctor',9,'view_doctor'),(37,'Can add cuestionario',10,'add_cuestionario'),(38,'Can change cuestionario',10,'change_cuestionario'),(39,'Can delete cuestionario',10,'delete_cuestionario'),(40,'Can view cuestionario',10,'view_cuestionario'),(41,'Can add pregunta',11,'add_pregunta'),(42,'Can change pregunta',11,'change_pregunta'),(43,'Can delete pregunta',11,'delete_pregunta'),(44,'Can view pregunta',11,'view_pregunta'),(45,'Can add trastorno',12,'add_trastorno'),(46,'Can change trastorno',12,'change_trastorno'),(47,'Can delete trastorno',12,'delete_trastorno'),(48,'Can view trastorno',12,'view_trastorno'),(49,'Can add test',13,'add_test'),(50,'Can change test',13,'change_test'),(51,'Can delete test',13,'delete_test'),(52,'Can view test',13,'view_test'),(53,'Can add resultado',14,'add_resultado'),(54,'Can change resultado',14,'change_resultado'),(55,'Can delete resultado',14,'delete_resultado'),(56,'Can view resultado',14,'view_resultado'),(57,'Can add escala',15,'add_escala'),(58,'Can change escala',15,'change_escala'),(59,'Can delete escala',15,'delete_escala'),(60,'Can view escala',15,'view_escala'),(61,'Can add regla',16,'add_regla'),(62,'Can change regla',16,'change_regla'),(63,'Can delete regla',16,'delete_regla'),(64,'Can view regla',16,'view_regla');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario`
--

DROP TABLE IF EXISTS `cuestionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `trastorno_id` bigint NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_cuestionario_trastorno_id_f5a769c2_fk` (`trastorno_id`),
  CONSTRAINT `estructura_cuestionario_trastorno_id_f5a769c2_fk` FOREIGN KEY (`trastorno_id`) REFERENCES `trastorno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario`
--

LOCK TABLES `cuestionario` WRITE;
/*!40000 ALTER TABLE `cuestionario` DISABLE KEYS */;
INSERT INTO `cuestionario` VALUES (1,1,'Cuestionario de Depresión'),(2,3,'Cuestionario de Prueba');
/*!40000 ALTER TABLE `cuestionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuestionario_preguntas`
--

DROP TABLE IF EXISTS `cuestionario_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuestionario_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuestionario_id` bigint NOT NULL,
  `pregunta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estructura_cuestionario__cuestionario_id_pregunta_b500ac65_uniq` (`cuestionario_id`,`pregunta_id`),
  KEY `estructura_cuestiona_pregunta_id_a04f37d4_fk_estructur` (`pregunta_id`),
  CONSTRAINT `estructura_cuestiona_pregunta_id_a04f37d4_fk_estructur` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `estructura_cuestionario_preguntas_cuestionario_id_cb7e9789_fk` FOREIGN KEY (`cuestionario_id`) REFERENCES `cuestionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuestionario_preguntas`
--

LOCK TABLES `cuestionario_preguntas` WRITE;
/*!40000 ALTER TABLE `cuestionario_preguntas` DISABLE KEYS */;
INSERT INTO `cuestionario_preguntas` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,2,37);
/*!40000 ALTER TABLE `cuestionario_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-06-08 16:56:25.246269','1','1',1,'[{\"added\": {}}]',16,1),(2,'2024-06-08 16:57:00.676922','1','Depresión distimia leve',2,'[{\"changed\": {\"fields\": [\"Nombre de la regla\"]}}]',16,1),(3,'2024-06-08 16:57:20.323980','1','1. Depresión distimia leve',2,'[{\"changed\": {\"fields\": [\"Nombre de la regla\"]}}]',16,1),(4,'2024-06-08 16:58:25.726132','2','2. Depresión distimia moderado',1,'[{\"added\": {}}]',16,1),(5,'2024-06-08 17:02:20.823898','3','3. Depresión distimia moderado',1,'[{\"added\": {}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(10,'estructura','cuestionario'),(15,'estructura','escala'),(11,'estructura','pregunta'),(16,'estructura','regla'),(14,'estructura','resultado'),(13,'estructura','test'),(12,'estructura','trastorno'),(9,'persona','doctor'),(8,'persona','paciente'),(7,'persona','user'),(5,'sessions','session'),(6,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-11-25 17:30:09.101446'),(2,'contenttypes','0002_remove_content_type_name','2023-11-25 17:30:09.137898'),(3,'auth','0001_initial','2023-11-25 17:30:09.330431'),(4,'auth','0002_alter_permission_name_max_length','2023-11-25 17:30:09.364732'),(5,'auth','0003_alter_user_email_max_length','2023-11-25 17:30:09.371276'),(6,'auth','0004_alter_user_username_opts','2023-11-25 17:30:09.376266'),(7,'auth','0005_alter_user_last_login_null','2023-11-25 17:30:09.381025'),(8,'auth','0006_require_contenttypes_0002','2023-11-25 17:30:09.385306'),(9,'auth','0007_alter_validators_add_error_messages','2023-11-25 17:30:09.390567'),(10,'auth','0008_alter_user_username_max_length','2023-11-25 17:30:09.395798'),(11,'auth','0009_alter_user_last_name_max_length','2023-11-25 17:30:09.400562'),(12,'auth','0010_alter_group_name_max_length','2023-11-25 17:30:09.413098'),(13,'auth','0011_update_proxy_permissions','2023-11-25 17:30:09.419103'),(14,'auth','0012_alter_user_first_name_max_length','2023-11-25 17:30:09.424391'),(15,'persona','0001_initial','2023-11-25 17:30:09.679004'),(16,'admin','0001_initial','2023-11-25 17:30:09.763464'),(17,'admin','0002_logentry_remove_auto_add','2023-11-25 17:30:09.769161'),(18,'admin','0003_logentry_add_action_flag_choices','2023-11-25 17:30:09.775414'),(19,'estructura','0001_initial','2023-11-25 17:30:10.174554'),(20,'sessions','0001_initial','2023-11-25 17:30:10.203873'),(21,'sites','0001_initial','2023-11-25 17:30:10.221469'),(22,'sites','0002_alter_domain_unique','2023-11-25 17:30:10.236927'),(23,'estructura','0002_alter_cuestionario_id_alter_resultado_id_and_more','2023-11-25 17:36:26.819465'),(24,'persona','0002_alter_doctor_id_alter_paciente_id_alter_user_id','2023-11-25 17:36:27.485792'),(25,'estructura','0003_alter_resultado_test_alter_cuestionario_table_and_more','2024-06-08 15:36:32.112291'),(26,'persona','0003_alter_user_options_alter_doctor_table_and_more','2024-06-08 15:36:32.253203'),(27,'estructura','0004_regla_escala_reglas','2024-06-08 16:23:51.497229'),(28,'estructura','0005_remove_escala_reglas_regla_escala','2024-06-08 16:49:39.707104'),(29,'estructura','0006_remove_regla_descripcion','2024-06-08 16:59:27.585168'),(30,'estructura','0007_alter_regla_escala_alter_regla_respuestas_necesarias_and_more','2024-06-09 00:47:10.304004'),(31,'estructura','0008_regla_cuestionario','2024-06-09 01:00:07.114547'),(32,'estructura','0009_cuestionario_nombre','2024-06-09 01:05:33.159971'),(33,'estructura','0010_remove_regla_nombre','2024-06-11 00:25:30.943916');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1i6outn32hu2kbn667giz88i1xi7yfav','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1sFhHu:vjeqR7C0GpAReig6YGEA9-HodfLGhxfTyvROX5b545s','2024-06-21 21:38:18.471564'),('2se49h067sh6mnanb3li5d75qres9nrd','MDhkMWIwNjc2OTQxYzJhMTQyMGI4NDYwMWFmMmIwZjQ2ODM3ZTFiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3M2I5YmE1ZmY2M2EwMjNmODA0MTVkOTI5NTNiOWZiMmVhZTkzMWQ5In0=','2023-02-19 00:14:21.023928'),('5oynbawe0hl54cf6pss6xmicuuu1okcw','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r7du6:G4BqoZwOQsERL60rGstow5evad48Mmg06ZqDtov0vXM','2023-12-11 15:52:10.611825'),('73bp7aodijqkmnvlwp0g5255bekumyb4','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r7iIi:v3CAOHH6OUyLig9oH3ySRIZOKRV9iZOHyyE5Xh1ULa4','2023-12-11 20:33:52.586953'),('8x31p4w7befrodo758cl7qcilkt49n7l','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1sGpvR:KuzzZkrICK_GnsSJta1S3SI3H4m5YHvomJCjJmXgz4E','2024-06-25 01:03:49.787775'),('a5t3gy0sulmr0x2vrqktwnikdnsz1jbo','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r8oXB:KsY-WQr_oDZLAgzq8S4mU01-lRM4f0GiBGV-WgKd2Tc','2023-12-14 21:25:21.263099'),('juzlice1uzxjjpjyu0lq9f9y9vw6edub','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r8pu1:UfCeXBJCP9BqzbWf2N5jIBDR_4A_BaFdo20lWsXVs-0','2023-12-14 22:53:01.782662'),('mt16xivveuhgbb0e2xq6l2o8d6571qo4','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1sH2HT:X7HLSlx18eN8gua2KkNrGDJHMgFdLXcNPiiwX8quKD4','2024-06-25 14:15:23.099220'),('nqfjgjfdnb7j2shqd506kznd9iwhamo5','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r6waJ:jQuMwp67oVa9t5LrPcMllXNHqJ74ysa7IxfV1BA0NAE','2023-12-09 17:36:51.907093'),('r10iwwhoot24s1x8xxz3r29wljeenwq5','MDhkMWIwNjc2OTQxYzJhMTQyMGI4NDYwMWFmMmIwZjQ2ODM3ZTFiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3M2I5YmE1ZmY2M2EwMjNmODA0MTVkOTI5NTNiOWZiMmVhZTkzMWQ5In0=','2023-02-18 18:20:19.619406'),('s4f67l9qmy8frouqr5gv8nlv2bdhvnux','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1rUzIn:6uqcznzNqqDl6nL3J5z_hAhPvVPoFibar7_mQVAwN_A','2024-02-14 01:22:09.002503'),('wh6q4g0vqvwus0q7cc41etpapbj2d7ty','.eJxVjMEOwiAQRP-FsyFiYXE9evcbyMJupWogKe3J-O-WpAed02TezLxVoHXJYW0yh4nVRRl1-M0ipaeUDvhB5V51qmWZp6h7Re-06VtleV337t9Bppb7Ojm0gwc-Q0RvmdCCkZGYhX30zh9FLBlKw4l4cxEcOtzEBDIyqs8X_kE46g:1r7cTc:qSmTWFk_6pAh2sL5q0CWbNPTJ1zNT0OoBKE12oHY9YA','2023-12-11 14:20:44.254111');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `persona_doctor_user_id_9790c1cd_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'6123234',1),(2,'4123456789',2);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escala`
--

DROP TABLE IF EXISTS `escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `caracteristicas` longtext NOT NULL,
  `tratamientos` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `id_trastorno` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_escala_id_trastorno_0350939c_fk` (`id_trastorno`),
  CONSTRAINT `estructura_escala_id_trastorno_0350939c_fk` FOREIGN KEY (`id_trastorno`) REFERENCES `trastorno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escala`
--

LOCK TABLES `escala` WRITE;
/*!40000 ALTER TABLE `escala` DISABLE KEYS */;
INSERT INTO `escala` VALUES (1,'Depresión distimia leve','El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.','Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva','El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva.',1,1),(2,'Depresión distimia moderado','El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.','Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva','El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva, con la posibilidad de una combinación de estos enfoques.',1,1),(3,'Depresión distimia grave','El trastorno distímico es un trastorno depresivo de grado moderado que se caracteriza por sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años. Además, puede haber cambios leves pero persistentes en el apetito y el sueño, dificultad para concentrarse o tomar decisiones, fatiga o pérdida de energía, y sentimientos de inutilidad o culpa excesiva.','Sentimientos persistentes de tristeza, vacío o desesperanza durante un período de al menos dos años\r\nCambios leves pero persistentes en el apetito y el sueño\r\nDificultad para concentrarse o tomar decisiones\r\nFatiga o pérdida de energía\r\nSentimientos de inutilidad o culpa excesiva','Terapia psicológica: La terapia psicológica, como la terapia cognitivo-conductual (TCC), puede ayudar a las personas a comprender y manejar sus pensamientos y emociones negativas.\r\n\r\nMedicación: Los antidepresivos pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de grupo: La terapia de grupo puede ser una forma efectiva de tratar la depresión neurótica al brindar un entorno de apoyo y comprensión.\r\n\r\nCambios en el estilo de vida: Modificaciones en la dieta, el ejercicio y la eliminación del estrés pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de apoyo: La terapia de apoyo brinda a la persona un espacio para hablar sobre sus pensamientos y emociones con un profesional capacitado.',1,1),(4,'Depresión mayor leve','El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.','Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio','El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva.',1,1),(5,'Depresión mayor moderado','El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.','Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio','El tratamiento incluye terapia cognitivo-conductual, terapia interpersonal y/o medicación antidepresiva, con la posibilidad de una combinación de estos enfoques.',1,1),(6,'Depresión mayor grave','El trastorno depresivo mayor es un trastorno mental que se caracteriza por una tristeza persistente, una pérdida de interés o placer en actividades que solían ser agradables, y una serie de otros síntomas que pueden incluir cambios significativos en el apetito y el sueño, fatiga o pérdida de energía, dificultad para concentrarse o tomar decisiones, sentimientos de inutilidad o culpa excesiva y pensamientos de muerte o suicidio.','Sentimientos persistentes de tristeza, vacío o desesperanza\r\nPérdida de interés o placer en actividades que solían ser agradables\r\nCambios significativos en el apetito y el sueño\r\nFatiga o pérdida de energía\r\nDificultad para concentrarse o tomar decisiones\r\nSentimientos de inutilidad o culpa excesiva\r\nPensamientos de muerte o suicidio','El tratamiento incluye terapia psicológica intensiva, como terapia cognitivo-conductual y terapia interpersonal, combinado con medicación antidepresiva y a veces con terapia electroconvulsiva (ECT).',1,1),(7,'Depresión neurótica moderado','La depresión neurótica es un subtipo de depresión que se asocia con ansiedad y estrés. A menudo se desencadena por eventos estresantes o conflictos emocionales, y los síntomas incluyen tristeza, ansiedad, insomnio y preocupación excesiva. La depresión neurótica también puede incluir síntomas somáticos como dolores de cabeza, dolores musculares y fatiga. Este tipo de depresión puede ser tratado con terapia psicológica, medicación y cambios en el estilo de vida para manejar el estrés y la ansiedad.','- Tristeza y desánimo: La persona experimenta una tristeza profunda y un sentimiento de desánimo.\r\n- Ansiedad: La persona experimenta una sensación de inquietud y preocupación excesiva.\r\n- Insomnio: Dificultad para dormir o para mantenerse dormido.\r\n- Estrés: La persona está más susceptible a sentirse estresada y ansiosa en situaciones estresantes.\r\n- Preocupación excesiva: La persona se preocupa excesivamente sobre eventos futuros o sobre el resultado de situaciones cotidianas.\r\n- Síntomas somáticos: Dolor de cabeza, dolores musculares y fatiga son comunes.\r\n- Pérdida de interés: La persona puede tener dificultades para sentir placer en actividades que antes disfrutaba.\r\n- Dificultad para concentrarse: La persona puede tener dificultades para concentrarse y tomar decisiones.\r\n- Cambios en el apetito: La persona puede experimentar cambios en el apetito, como un aumento o una disminución en el apetito.','Terapia psicológica: La terapia psicológica, como la terapia cognitivo-conductual (TCC), puede ayudar a las personas a comprender y manejar sus pensamientos y emociones negativas.\r\n\r\nMedicación: Los antidepresivos pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de grupo: La terapia de grupo puede ser una forma efectiva de tratar la depresión neurótica al brindar un entorno de apoyo y comprensión.\r\n\r\nCambios en el estilo de vida: Modificaciones en la dieta, el ejercicio y la eliminación del estrés pueden ayudar a aliviar los síntomas de la depresión neurótica.\r\n\r\nTerapia de apoyo: La terapia de apoyo brinda a la persona un espacio para hablar sobre sus pensamientos y emociones con un profesional capacitado.',1,1),(8,'Depresión neurótica grave','La depresión neurótica es un subtipo de depresión que se asocia con ansiedad y estrés. A menudo se desencadena por eventos estresantes o conflictos emocionales, y los síntomas incluyen tristeza, ansiedad, insomnio y preocupación excesiva. La depresión neurótica también puede incluir síntomas somáticos como dolores de cabeza, dolores musculares y fatiga. Este tipo de depresión puede ser tratado con terapia psicológica, medicación y cambios en el estilo de vida para manejar el estrés y la ansiedad.','- Tristeza y desánimo: La persona experimenta una tristeza profunda y un sentimiento de desánimo.\r\n- Ansiedad: La persona experimenta una sensación de inquietud y preocupación excesiva.\r\n- Insomnio: Dificultad para dormir o para mantenerse dormido.\r\n- Estrés: La persona está más susceptible a sentirse estresada y ansiosa en situaciones estresantes.\r\n- Preocupación excesiva: La persona se preocupa excesivamente sobre eventos futuros o sobre el resultado de situaciones cotidianas.\r\n- Síntomas somáticos: Dolor de cabeza, dolores musculares y fatiga son comunes.\r\n- Pérdida de interés: La persona puede tener dificultades para sentir placer en actividades que antes disfrutaba.\r\n- Dificultad para concentrarse: La persona puede tener dificultades para concentrarse y tomar decisiones.\r\n- Cambios en el apetito: La persona puede experimentar cambios en el apetito, como un aumento o una disminución en el apetito.','El tratamiento incluye terapia psicológica intensiva, como terapia cognitivo-conductual y terapia interpersonal, combinado con medicación antidepresiva y a veces con terapia electroconvulsiva (ECT).',1,1),(9,'Depresión existencial','La depresión existencial es un tipo de depresión que se relaciona con cuestiones filosóficas y existenciales, como la identidad, el sentido de la vida y la muerte.','Sentido de vacío y desesperación: La persona puede sentir un vacío emocional y una sensación de que su vida carece de significado o propósito.\r\n\r\nIncertidumbre existencial: Puede sentir una sensación de incertidumbre y confusión acerca de su identidad y su lugar en el mundo.\r\n\r\nTemor a la muerte: La persona puede experimentar miedo o ansiedad acerca de la muerte y su significado.\r\n\r\nPérdida de interés en actividades que solían ser gratificantes: La persona puede perder el interés en actividades que antes encontraba gratificantes y significativas.','El tratamiento para la depresión existencial incluye terapias psicológicas como la terapia cognitivo-conductual (TCC) y la terapia humanista, así como la terapia de grupo y la terapia de apoyo. También puede ser útil trabajar con un terapeuta que se especialice en cuestiones existenciales. Es importante buscar tratamiento temprano para la depresión existencial, ya que puede afectar significativamente la calidad de vida de la persona.',1,1),(10,'Depresión psicótica','El trastorno depresivo psicótico es un tipo de depresión que se caracteriza por los síntomas típicos del trastorno depresivo mayor, junto con síntomas psicóticos, como alucinaciones o delirios.','Síntomas similares a los del trastorno depresivo mayor\r\nAdemás, presencia de síntomas psicóticos, como alucinaciones o delirios','El tratamiento incluye terapia psicológica intensiva y medicación antipsicótica, combinado con terapia para tratar síntomas psicóticos.',1,1);
/*!40000 ALTER TABLE `escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ci` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ci` (`ci`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (2,'6234456','Pedro','González','1987-02-01','0975267413','Yasyreta y Humaita, Coronel Oviedo, Paraguay','pedro@gmail.com'),(3,'4117711','Perla','Centurión','2024-04-17',NULL,NULL,'perla@gmail.com');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nro_item` int NOT NULL,
  `pregunta` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,1,'¿Está deprimido por alguna situación de su vida?'),(2,2,'¿Muy poco sueño?'),(3,3,'¿Se fatiga o pierde la energía casi cada día?'),(4,4,'¿Baja autoestima?'),(5,5,'¿Come muy poco?'),(6,6,'¿Problemas de memoria, atención y concentración?'),(7,7,'¿Pensamiento de que todo le sale mal?'),(8,8,'¿Ve el futuro negativamente?'),(9,9,'¿Tiene pensamientos negativos?'),(10,10,'¿Se desanima con facilidad?'),(11,11,'¿Pensamiento suicida?'),(12,12,'¿Pensamiento de hacerse daño?'),(13,13,'¿No quiere conversar con nadie?'),(14,14,'¿No quiere salir a ningún lado?'),(15,15,'¿Se siente triste o vacío?'),(16,16,'¿Se siente a veces o siempre irritable?'),(17,17,'¿Ha perdido o aumentado 5% de su peso corporal?'),(18,18,'¿Presenta insomnio casi cada día?'),(19,19,'¿Se agita en actividades psicomotoras?'),(20,20,'¿Presenta sensación de inutilidad y confusión?'),(21,21,'¿Ha perdido a un ser querido recientemente?'),(22,22,'¿Tiene alucinaciones?'),(23,23,'¿Está pasando por algún problema?'),(24,24,'¿Piensa que no tiene suerte en su vida?'),(25,25,'¿Todos los síntomas se presentan de vez en cuando?'),(26,26,'¿Todos los síntomas se presentan todos los días?'),(27,27,'¿Está muy estresado?'),(28,28,'¿Siente que su vida no tiene sentido?'),(29,29,'¿Se siente agotado y con miedo?'),(30,30,'¿Sufre de falta de motivación por realizar sus cosas cotidianas?'),(31,31,'¿No tiene pasión por nada?'),(32,32,'¿Tiene ganas de dormir en el día?'),(33,33,'¿Se encuentra en un estado de ilusión?'),(34,34,'¿Escucha voces en la cabeza?'),(35,35,'¿Es muy impulsivo (a)?'),(36,36,'¿Es muy nervioso (a)?'),(37,1,'¿Pregunta de prueba?');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regla`
--

DROP TABLE IF EXISTS `regla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regla` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `escala_id` int NOT NULL,
  `cuestionario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_regla_escala_id_e09d23b3_fk_escala_id` (`escala_id`),
  KEY `regla_cuestionario_id_52a7a4ac_fk_cuestionario_id` (`cuestionario_id`),
  CONSTRAINT `estructura_regla_escala_id_e09d23b3_fk_escala_id` FOREIGN KEY (`escala_id`) REFERENCES `escala` (`id`),
  CONSTRAINT `regla_cuestionario_id_52a7a4ac_fk_cuestionario_id` FOREIGN KEY (`cuestionario_id`) REFERENCES `cuestionario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regla`
--

LOCK TABLES `regla` WRITE;
/*!40000 ALTER TABLE `regla` DISABLE KEYS */;
INSERT INTO `regla` VALUES (1,1,1),(2,2,1),(3,2,1),(4,3,1),(5,3,1),(6,4,1),(7,5,1),(8,5,1),(9,6,1),(10,6,1),(11,7,1),(12,8,1),(13,8,1),(14,9,1),(15,10,1),(16,10,1);
/*!40000 ALTER TABLE `regla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regla_respuestas_necesarias`
--

DROP TABLE IF EXISTS `regla_respuestas_necesarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regla_respuestas_necesarias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `regla_id` bigint NOT NULL,
  `pregunta_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estructura_regla_respues_regla_id_pregunta_id_d606b645_uniq` (`regla_id`,`pregunta_id`),
  KEY `estructura_regla_res_pregunta_id_51fe1325_fk_pregunta_` (`pregunta_id`),
  CONSTRAINT `estructura_regla_res_pregunta_id_51fe1325_fk_pregunta_` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `estructura_regla_res_regla_id_c83511d1_fk_estructur` FOREIGN KEY (`regla_id`) REFERENCES `regla` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regla_respuestas_necesarias`
--

LOCK TABLES `regla_respuestas_necesarias` WRITE;
/*!40000 ALTER TABLE `regla_respuestas_necesarias` DISABLE KEYS */;
INSERT INTO `regla_respuestas_necesarias` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,3,1),(12,3,2),(13,3,3),(14,3,4),(15,3,5),(16,3,6),(17,3,7),(18,3,8),(19,3,9),(20,3,10),(22,4,1),(23,4,2),(24,4,3),(25,4,4),(26,4,5),(27,4,6),(28,4,7),(29,4,8),(30,4,9),(31,4,10),(32,4,11),(33,4,12),(34,4,13),(35,4,14),(36,5,11),(37,5,12),(38,5,13),(39,5,14),(42,6,3),(43,6,15),(40,6,16),(41,6,19),(44,7,3),(45,7,15),(46,7,16),(47,7,18),(48,7,19),(49,7,20),(50,8,18),(51,8,20),(52,9,3),(53,9,6),(54,9,11),(55,9,15),(56,9,16),(57,9,17),(58,9,18),(59,9,19),(60,9,20),(61,9,21),(62,9,22),(63,10,6),(64,10,11),(65,10,17),(66,10,21),(67,10,22),(68,11,7),(69,11,9),(70,11,23),(71,11,24),(72,11,25),(73,12,7),(74,12,9),(75,12,23),(76,12,24),(77,12,25),(78,12,26),(79,12,27),(80,13,26),(81,13,27),(83,14,28),(84,14,29),(85,14,30),(86,14,31),(82,14,32),(91,15,22),(87,15,33),(88,15,34),(89,15,35),(90,15,36),(96,16,22),(92,16,33),(93,16,34),(94,16,35),(95,16,36);
/*!40000 ALTER TABLE `regla_respuestas_necesarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resultado` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `respuesta` tinyint(1) NOT NULL,
  `pregunta_id` int NOT NULL,
  `test_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_resultado_pregunta_id_e78cc486_fk_estructur` (`pregunta_id`),
  KEY `estructura_resultado_test_id_dc45c01a_fk` (`test_id`),
  CONSTRAINT `estructura_resultado_pregunta_id_e78cc486_fk_estructur` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`),
  CONSTRAINT `estructura_resultado_test_id_dc45c01a_fk` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
INSERT INTO `resultado` VALUES (7,1,1,1),(8,0,2,1),(9,1,3,1),(10,0,4,1),(11,1,5,1),(12,0,6,1),(13,0,7,1),(14,0,8,1),(15,0,9,1),(16,1,10,1),(17,0,11,1),(18,1,12,1),(19,1,13,1),(20,0,14,1),(21,1,15,1),(22,1,16,1),(23,1,17,1),(24,1,18,1),(25,0,19,1),(26,0,20,1),(27,1,21,1),(28,0,22,1),(29,0,23,1),(30,0,24,1),(31,1,25,1),(32,1,26,1),(33,0,27,1),(34,0,28,1),(35,1,29,1),(36,0,30,1),(37,1,31,1),(38,0,32,1),(39,0,33,1),(40,0,34,1),(41,1,35,1),(42,1,36,1),(43,0,1,3),(44,0,2,3),(45,0,3,3),(46,0,4,3),(47,0,5,3),(48,1,6,3),(49,1,7,3),(50,1,8,3),(51,1,9,3),(52,1,10,3),(53,0,11,3),(54,0,12,3),(55,0,13,3),(56,0,14,3),(57,0,15,3),(58,0,16,3),(59,0,17,3),(60,0,18,3),(61,0,19,3),(62,0,20,3),(63,0,21,3),(64,0,22,3),(65,0,23,3),(66,0,24,3),(67,0,25,3),(68,0,26,3),(69,0,27,3),(70,0,28,3),(71,0,29,3),(72,0,30,3),(73,0,31,3),(74,0,32,3),(75,0,33,3),(76,0,34,3),(77,0,35,3),(78,0,36,3),(79,1,1,5),(80,0,2,5),(81,1,3,5),(82,1,4,5),(83,0,5,5),(84,0,6,5),(85,1,7,5),(86,1,8,5),(87,1,9,5),(88,1,10,5),(89,1,11,5),(90,1,12,5),(91,0,13,5),(92,1,14,5),(93,1,15,5),(94,1,16,5),(95,1,17,5),(96,0,18,5),(97,1,19,5),(98,1,20,5),(99,0,21,5),(100,0,22,5),(101,1,23,5),(102,1,24,5),(103,0,25,5),(104,0,26,5),(105,1,27,5),(106,1,28,5),(107,0,29,5),(108,1,30,5),(109,0,31,5),(110,1,32,5),(111,0,33,5),(112,1,34,5),(113,1,35,5),(114,1,36,5),(115,1,1,6),(116,1,2,6),(117,1,3,6),(118,1,4,6),(119,1,5,6),(120,1,6,6),(121,1,7,6),(122,1,8,6),(123,1,9,6),(124,1,10,6),(125,1,11,6),(126,1,12,6),(127,1,13,6),(128,1,14,6),(129,1,15,6),(130,1,16,6),(131,1,17,6),(132,1,18,6),(133,1,19,6),(134,1,20,6),(135,1,21,6),(136,1,22,6),(137,1,23,6),(138,1,24,6),(139,1,25,6),(140,1,26,6),(141,1,27,6),(142,1,28,6),(143,1,29,6),(144,1,30,6),(145,1,31,6),(146,1,32,6),(147,1,33,6),(148,1,34,6),(149,1,35,6),(150,1,36,6),(151,0,1,9),(152,0,2,9),(153,0,3,9),(154,0,4,9),(155,0,5,9),(156,0,6,9),(157,0,7,9),(158,0,8,9),(159,0,9,9),(160,0,10,9),(161,0,11,9),(162,0,12,9),(163,0,13,9),(164,0,14,9),(165,0,15,9),(166,0,16,9),(167,0,17,9),(168,1,18,9),(169,0,19,9),(170,1,20,9),(171,0,21,9),(172,0,22,9),(173,0,23,9),(174,0,24,9),(175,0,25,9),(176,0,26,9),(177,0,27,9),(178,0,28,9),(179,0,29,9),(180,0,30,9),(181,0,31,9),(182,0,32,9),(183,0,33,9),(184,0,34,9),(185,0,35,9),(186,0,36,9);
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `cuestionario_id` bigint NOT NULL,
  `doctor_id` bigint NOT NULL,
  `paciente_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estructura_test_cuestionario_id_e6bff2ca_fk` (`cuestionario_id`),
  KEY `estructura_test_doctor_id_1dbbd824_fk` (`doctor_id`),
  KEY `estructura_test_paciente_id_bfbb1c9c_fk` (`paciente_id`),
  CONSTRAINT `estructura_test_cuestionario_id_e6bff2ca_fk` FOREIGN KEY (`cuestionario_id`) REFERENCES `cuestionario` (`id`),
  CONSTRAINT `estructura_test_doctor_id_1dbbd824_fk` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `estructura_test_paciente_id_bfbb1c9c_fk` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'2023-02-06 20:03:07.512353',1,1,2),(2,'2023-02-06 21:54:50.764634',1,1,2),(3,'2023-02-06 22:03:29.663316',1,1,2),(4,'2023-11-27 16:42:25.787228',1,1,2),(5,'2023-11-27 23:52:51.900237',1,2,3),(6,'2024-06-07 21:39:34.076142',1,1,2),(7,'2024-06-08 15:58:59.118377',1,1,3),(8,'2024-06-10 19:45:18.798313',1,2,2),(9,'2024-06-11 01:30:24.323419',1,2,2);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trastorno`
--

DROP TABLE IF EXISTS `trastorno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trastorno` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trastorno`
--

LOCK TABLES `trastorno` WRITE;
/*!40000 ALTER TABLE `trastorno` DISABLE KEYS */;
INSERT INTO `trastorno` VALUES (1,'Depresión','La depresión es un trastorno del estado de ánimo que se caracteriza por una tristeza persistente, pérdida de interés o placer en actividades que solían ser disfrutadas, y cambios en el apetito, sueño y energía. Puede afectar a la capacidad de una persona para llevar a cabo tareas cotidianas y puede tener un impacto negativo en las relaciones personales y en la vida laboral. La depresión puede ser un trastorno aislado o formar parte de un trastorno mayor, y puede ser tratada con una combinación de medicación, terapia y cambios en el estilo de vida.',1),(3,'Trastorno de Prueba','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sed lacus elit. Integer vel egestas orci. Ut vitae commodo dui, porttitor euismod felis. Nunc molestie fermentum convallis. Suspendisse vehicula nunc ligula, a scelerisque ante egestas nec. Maecenas egestas, lacus sed commodo venenatis, ligula quam tincidunt nibh, ut mollis enim enim quis massa. Maecenas sed vestibulum enim. Morbi quis quam ut odio porta maximus. Nullam vestibulum nunc enim, porttitor porttitor metus vestibulum vitae. Curabitur lacinia erat metus, in dapibus neque suscipit ac. Integer quis hendrerit elit. Mauris auctor ac leo vitae pretium. Nulla facilisi. Nulla hendrerit rhoncus sapien eget ultrices. Donec malesuada convallis dolor, ac dictum justo blandit maximus.',1);
/*!40000 ALTER TABLE `trastorno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'pbkdf2_sha256$600000$83N9oRSpdB8pspAczBOKtD$CknhHuUCJQu4kR4vwKQviTf3S60b7kmFOTXaUo0Vc6c=','2024-06-11 14:15:23.093275',1,'admin','Jose','Martínez Pérez','jmartinez@gmail.com',1,1,'2023-02-04 18:13:41.463620','0975267388','Calle 13',0),(2,'',NULL,0,'feli','Felix','Benitez','n.benitez.a@hotmail.com',0,1,'2023-11-25 17:51:49.418243','+595994234853',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_user_groups_user_id_group_id_da414436_uniq` (`user_id`,`group_id`),
  KEY `persona_user_groups_group_id_7ed904df_fk_auth_group_id` (`group_id`),
  CONSTRAINT `persona_user_groups_group_id_7ed904df_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `persona_user_groups_user_id_27e9297c_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_user_user_permis_user_id_permission_id_29dd9108_uniq` (`user_id`,`permission_id`),
  KEY `persona_user_user_pe_permission_id_9d38d456_fk_auth_perm` (`permission_id`),
  CONSTRAINT `persona_user_user_pe_permission_id_9d38d456_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `persona_user_user_permissions_user_id_7ea6381c_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permissions`
--

LOCK TABLES `user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'preddep'
--

--
-- Dumping routines for database 'preddep'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 10:28:13
