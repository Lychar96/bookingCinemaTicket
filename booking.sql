-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.4.22-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de table bookingcinematicket. admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id_user` int(11) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  KEY `FK_admins_users` (`id_user`),
  CONSTRAINT `FK_admins_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.admins : ~3 rows (environ)
INSERT INTO `admins` (`id_user`, `is_admin`) VALUES
	(7, 1),
	(4, 1),
	(11, 1);

-- Listage de la structure de table bookingcinematicket. cinemas
CREATE TABLE IF NOT EXISTS `cinemas` (
  `id_cinema` int(11) NOT NULL AUTO_INCREMENT,
  `location_cinema` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.cinemas : ~6 rows (environ)
INSERT INTO `cinemas` (`id_cinema`, `location_cinema`) VALUES
	(1, 'gaumont1'),
	(2, 'gaumont2'),
	(3, 'gaumont3'),
	(4, 'pathe1'),
	(5, 'pathe2'),
	(6, 'pathe3');

-- Listage de la structure de table bookingcinematicket. movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id_movie` int(11) NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(50) DEFAULT NULL,
  `director_name` varchar(50) DEFAULT NULL,
  `movie_session` int(11) NOT NULL DEFAULT 0,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_movie`),
  KEY `FK_location_cinema` (`location`),
  KEY `FK_movie_session` (`movie_session`),
  CONSTRAINT `FK_movie_session` FOREIGN KEY (`movie_session`) REFERENCES `sessions` (`id_session`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.movies : ~11 rows (environ)
INSERT INTO `movies` (`id_movie`, `movie_title`, `director_name`, `movie_session`, `location`) VALUES
	(1, 'the dark knight', 'christopher nolan', 11, 5),
	(2, 'fight club', 'david fincher', 4, 4),
	(3, 'pulp fiction', 'quentin tarantino', 10, 4),
	(4, '2001 ', 'stanley kubrick', 1, 4),
	(5, 'blade runner', 'ridley scott', 2, 2),
	(6, 'le parrain', 'francis ford coppola', 8, 2),
	(7, 'forrest gump', 'robert zemeckis', 5, 5),
	(8, 'le seigneur des anneaux', 'peter jackson', 12, 6),
	(9, 'le bon, la brute et le truand', 'sergio leone', 6, 6),
	(10, 'princesse mononoke', 'hayao miyazaki', 7, 4),
	(11, 'eternal sunshine of the spotless mind', 'michel gondry', 9, 3);

-- Listage de la structure de table bookingcinematicket. payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id_payment` int(11) NOT NULL AUTO_INCREMENT,
  `age_user` int(11) NOT NULL,
  `type_of_payment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `FK_id_user` (`age_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.payments : ~12 rows (environ)
INSERT INTO `payments` (`id_payment`, `age_user`, `type_of_payment`) VALUES
	(1, 1, 'full price'),
	(2, 2, 'full price'),
	(3, 3, 'full price'),
	(4, 4, 'full price'),
	(5, 5, 'student rate'),
	(6, 6, 'student rate'),
	(7, 7, 'full price'),
	(8, 8, 'full price'),
	(9, 9, 'full price'),
	(10, 10, 'under 14'),
	(11, 11, 'under 14'),
	(12, 12, 'full price');

-- Listage de la structure de table bookingcinematicket. sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id_session` int(11) NOT NULL AUTO_INCREMENT,
  `id_movie` int(11) DEFAULT NULL,
  `id_cinema` int(11) DEFAULT NULL,
  `session_date` datetime NOT NULL,
  `max_seat` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `FK_id_movie` (`id_movie`),
  KEY `FK_id_cinema` (`id_cinema`),
  CONSTRAINT `FK_id_cinema` FOREIGN KEY (`id_cinema`) REFERENCES `cinemas` (`id_cinema`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.sessions : ~12 rows (environ)
INSERT INTO `sessions` (`id_session`, `id_movie`, `id_cinema`, `session_date`, `max_seat`) VALUES
	(1, 4, 1, '2026-08-18 14:45:00', 1),
	(2, 5, 2, '2026-08-17 15:15:00', 1),
	(3, 11, 3, '2026-08-18 10:00:00', 1),
	(4, 2, 4, '2026-08-19 16:00:00', 1),
	(5, 7, 5, '2026-08-20 18:00:00', 1),
	(6, 9, 6, '2026-08-14 11:00:00', 1),
	(7, 9, 1, '2026-08-15 21:00:00', 1),
	(8, 6, 2, '2026-08-16 18:00:00', 1),
	(9, 10, 3, '2026-08-17 17:00:00', 1),
	(10, 3, 4, '2026-08-18 21:00:00', 1),
	(11, 1, 5, '2026-08-21 15:00:00', 1),
	(12, 8, 6, '2026-08-18 10:00:00', 1);

-- Listage de la structure de table bookingcinematicket. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `age` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `go_to` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_go_to_movie` (`go_to`),
  CONSTRAINT `FK_user_go_to_movie` FOREIGN KEY (`go_to`) REFERENCES `movies` (`id_movie`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Listage des données de la table bookingcinematicket.users : ~12 rows (environ)
INSERT INTO `users` (`id`, `name`, `email`, `age`, `password`, `go_to`) VALUES
	(1, 'pierre dupont', 'pierredupont@email.fr', 22, '', 4),
	(2, 'raymond ward', 'raymondward@email.fr', 25, '', 5),
	(3, 'thomas abbot', 'thomasabbot@email.fr', 23, '', 11),
	(4, 'yvon gilbert', 'yvongilbert@email.fr', 27, '', 2),
	(5, 'marcel dusfresne', 'marceldusfresne@email.fr', 18, '', 7),
	(6, 'olympia beaulac', 'olympiabeaulac@email.fr', 16, '', 9),
	(7, 'marshall lamour', 'marshalllamour@email.fr', 50, '', 6),
	(8, 'franck charette', 'franckcharette@email.fr', 35, '', 6),
	(9, 'erembourg belanger', 'erembourgbelanger@email.fr', 36, '', 8),
	(10, 'maureen carignan', 'maureencarignan@email.fr', 13, '', 10),
	(11, 'anne audibert', 'anneaudibert@email.fr', 12, '', 3),
	(12, 'romain chesnay', 'romain chesnay', 28, '', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
