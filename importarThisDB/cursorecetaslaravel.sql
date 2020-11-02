/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.21-MariaDB : Database - cursorecetaslaravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `categoria_recetas` */

DROP TABLE IF EXISTS `categoria_recetas`;

CREATE TABLE `categoria_recetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categoria_recetas` */

insert  into `categoria_recetas`(`id`,`nombre`,`created_at`,`updated_at`) values (1,'Comida Mexicana','2020-09-11 21:54:42','2020-09-11 21:54:42'),(2,'Comida Italiana','2020-09-11 21:54:42','2020-09-11 21:54:42'),(3,'Comida Argentina','2020-09-11 21:54:42','2020-09-11 21:54:42'),(4,'Postres','2020-09-11 21:54:43','2020-09-11 21:54:43'),(5,'Cortes','2020-09-11 21:54:43','2020-09-11 21:54:43'),(6,'Ensaladas','2020-09-11 21:54:43','2020-09-11 21:54:43'),(7,'Desayunos','2020-09-11 21:54:43','2020-09-11 21:54:43');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `likes_receta` */

DROP TABLE IF EXISTS `likes_receta`;

CREATE TABLE `likes_receta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `receta_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_receta_user_id_foreign` (`user_id`),
  KEY `likes_receta_receta_id_foreign` (`receta_id`),
  CONSTRAINT `likes_receta_receta_id_foreign` FOREIGN KEY (`receta_id`) REFERENCES `recetas` (`id`),
  CONSTRAINT `likes_receta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `likes_receta` */

insert  into `likes_receta`(`id`,`user_id`,`receta_id`,`created_at`,`updated_at`) values (6,1,1,NULL,NULL),(7,1,3,NULL,NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (9,'2014_10_12_000000_create_users_table',1),(10,'2014_10_12_100000_create_password_resets_table',1),(11,'2019_08_19_000000_create_failed_jobs_table',1),(12,'2020_09_08_175816_create_recetas_table',1),(13,'2020_09_11_190241_create_perfils_table',1),(14,'2020_09_12_185406_create_like_receta_pivot_table',2),(15,'2020_09_12_191502_create_likes_receta_pivot_table',3);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `perfils` */

DROP TABLE IF EXISTS `perfils`;

CREATE TABLE `perfils` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `biografia` text COLLATE utf8mb4_unicode_ci,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfils_user_id_foreign` (`user_id`),
  CONSTRAINT `perfils_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `perfils` */

insert  into `perfils`(`id`,`user_id`,`biografia`,`imagen`,`created_at`,`updated_at`) values (1,1,'<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam maximus ullamcorper sapien vel pretium. Fusce vehicula nisl ut diam feugiat commodo. Vestibulum id nunc fringilla tellus malesuada vulputate sit amet vitae eros. Duis auctor lacus eu ex pellentesque dictum. Nam sed risus tristique, pharetra est eget, laoreet ipsum. Vivamus accumsan odio mauris, ut pellentesque ante commodo non. Sed et rutrum metus, vitae maximus quam. Nunc volutpat purus nec quam rutrum congue. Nulla facilisi.<br><br></div><div>Donec nec pulvinar leo. Quisque lectus enim, luctus vel sollicitudin venenatis, condimentum ut diam. Etiam dignissim justo nec blandit molestie. Donec ornare volutpat mattis. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.</div>','upload-perfiles/MWpk1Sh04xYf5kNnzDkD93xUECQByV33nLMM8E8X.png','2020-09-11 21:54:43','2020-09-11 21:55:46'),(2,2,'<div>Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.<br><br></div><div>Duis sodales purus nec tellus aliquam dictum. Phasellus elementum nibh faucibus consequat tempor. Sed vel magna velit. Donec tempus sed orci non auctor. Cras eu sagittis arcu, non suscipit felis. Suspendisse a nunc lorem. Duis quis feugiat dolor.</div>','upload-perfiles/T7yT96tZC1CVXQvRfEgixgMbtSLxFa2XnIEMthAM.jpeg','2020-09-11 21:54:43','2020-09-11 21:57:41');

/*Table structure for table `recetas` */

DROP TABLE IF EXISTS `recetas`;

CREATE TABLE `recetas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredientes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preparacion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `categoria_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recetas_user_id_foreign` (`user_id`),
  KEY `recetas_categoria_id_foreign` (`categoria_id`),
  CONSTRAINT `recetas_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_recetas` (`id`),
  CONSTRAINT `recetas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `recetas` */

insert  into `recetas`(`id`,`titulo`,`ingredientes`,`preparacion`,`imagen`,`user_id`,`categoria_id`,`created_at`,`updated_at`) values (1,'Primera receta','<div>estos son los ingredientes</div>','<div>la preparacion es tal</div>','upload-Recetas/Qt7Bow60erlnZlUObFqh7mI6g0t8a0YIC6T6J7nY.jpeg',1,1,'2020-09-11 21:56:38','2020-09-11 21:56:38'),(2,'venetto','<div>pasta, brocoli, papa</div>','<div>hierve la pasta, sazona el brocoli con aseite de oliva y despues de 5 minutos verte la pasta de tu preferencia. Por lo general queda mejor con&nbsp; tipo de pasta larga y con&nbsp; nivel de picante de 5 a 6.</div>','upload-Recetas/yDXKLVVvJt4JiwtM2XjQDt6i6n7Ogn9LGivVSKRW.jpeg',2,2,'2020-09-11 22:04:23','2020-09-11 22:04:23'),(3,'segunda','<div>em ipsum dolor sit amet, consectetur adipiscing elit. Nullam maximus ullamcorper sapien vel pretium. Fusce vehicula nisl ut diam feugiat commodo. Vestibulum id nunc fringilla tellus malesuada vulputate sit amet vitae eros. Duis auctor lacus eu ex pellentesque dictum. Nam sed risus tristique, pharetra est eget, laor</div>','<div>em ipsum dolor sit amet, consectetur adipiscing elit. Nullam maximus ullamcorper sapien vel pretium. Fusce vehicula nisl ut diam feugiat commodo. Vestibulum id nunc fringilla tellus malesuada vulputate sit amet vitae eros. Duis auctor lacus eu ex pellentesque dictum. Nam sed risus tristique, pharetra est eget, laor</div>','upload-Recetas/k4LGou5lFRnZoSM2WsH5cEmG3iANE00yF5MbcaXM.jpeg',1,1,'2020-09-11 22:17:06','2020-09-11 22:17:06'),(4,'tercera','<div>s. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.<br><br></div><div>Duis sodales purus nec tellus aliquam dictum. Phasellus elementum nibh&nbsp;<br><br></div>','<div>s. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.<br><br></div><div>Duis sodales purus nec tellus aliquam dictum. Phasellus elementum nibh&nbsp;<br><br></div>','upload-Recetas/VDaGVegVCjdlfMZWPqVfu6lRhMUIOu7AMzsohXzT.jpeg',1,2,'2020-09-11 22:17:34','2020-09-11 22:17:34'),(5,'cuarta','<div>itur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.<br><br></div><div>Duis sodales purus nec tellus aliquam dictum. Phasellus elementum nibh faucibus consequat tempor. Sed vel magna velit. Donec tempus sed orci non auctor. Cras eu sagittis arcu, non suscipit felis. Suspendisse a nunc lorem. Duis quis feugiat dolor.<br>|</div>','<div>itur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.<br><br></div><div>Duis sodales purus nec tellus aliquam dictum. Phasellus elementum nibh faucibus consequat tempor. Sed vel magna velit. Donec tempus sed orci non auctor. Cras eu sagittis arcu, non suscipit felis. Suspendisse a nunc lorem. Duis quis feugiat dolor.<br><br></div>','upload-Recetas/piTMOU92YLvUZOjrSMxMvvNI4tMKCK96k7JSh2CH.jpeg',1,3,'2020-09-11 22:18:16','2020-09-11 22:18:16'),(6,'quinta','<div>Donec nec pulvinar leo. Quisque lectus enim, luctus vel sollicitudin venenatis, condimentum ut diam. Etiam dignissim justo nec blandit molestie. Donec ornare volutpat mattis. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.</div>','<div>Donec nec pulvinar leo. Quisque lectus enim, luctus vel sollicitudin venenatis, condimentum ut diam. Etiam dignissim justo nec blandit molestie. Donec ornare volutpat mattis. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.</div>','upload-Recetas/DF4vrEKS6KsGR246DWqo69dZQKhpir5SGGcpgbpu.jpeg',1,2,'2020-09-11 22:19:08','2020-09-11 22:19:08'),(7,'quinta','<div>Donec nec pulvinar leo. Quisque lectus enim, luctus vel sollicitudin venenatis, condimentum ut diam. Etiam dignissim justo nec blandit molestie. Donec ornare volutpat mattis. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.klmlkkkml</div>','<div>Donec nec pulvinar leo. Quisque lectus enim, luctus vel sollicitudin venenatis, condimentum ut diam. Etiam dignissim justo nec blandit molestie. Donec ornare volutpat mattis. Nunc rutrum, metus eu pretium cursus, massa orci gravida velit, ut lobortis est metus a tortor. Ut tristique eros a auctor egestas. Nullam efficitur vulputate orci ut egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus neque risus, bibendum in dictum at, lobortis sit amet justo.</div>','upload-Recetas/7EoO4eEiFKEnA0HBuFuB8nMxXYCTMlb5xgxHyLOF.jpeg',1,2,'2020-09-11 22:19:10','2020-09-11 22:19:10');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`url`,`remember_token`,`created_at`,`updated_at`) values (1,'Arturo','correo@correo.com',NULL,'$2y$10$uqrw8cyfQPR3ca6AZ1ggpuef8yz6Y56n/BjDZo5ak7n6SbW9QDnta','https://www.easyGame.com',NULL,'2020-09-11 21:54:43','2020-09-11 21:54:43'),(2,'Armin','correo2@correo.com',NULL,'$2y$10$0GXI1OsrnkfNKGaYzcHvUOcMXXI//Sxj/kemRJ5scddTRUVAW.4V.','https://www.snk.com',NULL,'2020-09-11 21:54:43','2020-09-11 21:54:43');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
