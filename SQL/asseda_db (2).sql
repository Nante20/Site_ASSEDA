-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 15 oct. 2024 à 11:00
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `asseda_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(5, 'Nantenaina', '$2y$10$OnuTij4r1EJ0Oa2DquBg/eYZhtZyHuHbNmHTvHxe/WJ75jrU5Rfyy');

-- --------------------------------------------------------

--
-- Structure de la table `contenu`
--

DROP TABLE IF EXISTS `contenu`;
CREATE TABLE IF NOT EXISTS `contenu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `paragraphe` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_contenu` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contenu`
--

INSERT INTO `contenu` (`id`, `titre`, `paragraphe`, `image`, `admin_id`) VALUES
(1, 'L\'ASSEDA en quelques mots', 'L’ASSEDA est une petite association se trouvant sur Oullins et qui œuvre spécialement dans l\'aide aux migrants. Nous soutenons principalement les familles qui sont déboutées après une demande d\'asile. Donc, nous les aidons pour la procédure pour obtenir un titre de séjour. La plupart des familles viennent d’ Albanie, du Congo, de Russie, d’Angola, de Madagascar, du Cameroun...\r\n            Ces familles n’ont pas souvent de ressources et n’ont pas le droit de travailler. Elles essayent de survivre avec l\'aide des restos du cœur, de la maison de la métropole et du secours populaire ou catholique. L\'association ne dispose pas de subvention. Nous fonctionnons grâce à des dons qui nous permettent de louer des appartements à Oullins où nous plaçons les familles en difficultés à l’abri. Nous cherchons ainsi des logements « solidaires » avec des loyers moins chers pour aider plus de personnes.\r\n            A noter que vous pouvez venir nous rencontrer lors de nos permanences chaque vendredi de 14h à 17h à Saint Viateur, 3 rue Henri Barbusse à Oullins.\r\n', 'images/solidarite.jpg\r\n', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contenu_2`
--

DROP TABLE IF EXISTS `contenu_2`;
CREATE TABLE IF NOT EXISTS `contenu_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `paragraphe` text NOT NULL,
  `sous_titre` varchar(255) NOT NULL,
  `sous_paragraphe` text NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_contenu_2` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contenu_2`
--

INSERT INTO `contenu_2` (`id`, `titre`, `paragraphe`, `sous_titre`, `sous_paragraphe`, `admin_id`) VALUES
(1, 'A propos', '\r\n            L’ASSEDA est une association laïque et non confessionnelle d’aide aux migrants sur Oullins. Nous percevons une petite subvention de la mairie, qui nous permet d\'aider les familles à payer la cantine de leurs enfnats à l\'école, et nous fonctionnons principalement par les dons de particuliers et de personnes morales.\r\n            L\'ASSEDA est reconnue comme \"Organisme d\'intérêt général\". Les dons à l\' ASSEDA ouvrent droit à une réduction d\'impôt prévue à l\'article 200 et 238bis du CGI.', '', '', NULL),
(2, '', '', 'Que faisons-nous actuellement?', 'Nous accompagnons 10 familles en ce moment et 2 célibataires. Nous avons mis en place une aide à l\'hébergement : nuitées d\'urgence à l’hôtel, hébergement chez des particuliers, appartements en loyer solidaire.\r\n            Nous aidons financièrement les familles pour la vie quotidienne, les cartes de bus, et nous les aidons pour les démarches administratives ,nous interpellons les pouvoirs publics. Nous aidons pour les loisirs des enfants.\r\n            Nous tenons des permanences \"pauses café\" à Saint Viateur, 3 rue Henri Barbusse à Oullins, l\'occasion d\'échanger, de partager le vendredi après midi de 14h à 17h.\r\n            Nous organisons des moments conviviaux : moments de rencontre à plus grande échelle où nous jouons ensemble, petits et grands, des moments forts pour oublier un peu les soucis quotidiens.\r\n            Nous faisons aussi des échanges culinaires nous permettant de découvrir les cuisines du monde ... Nous soutenons moralement ces familles pour qui l\'attente si longue des papiers est une véritable torture, et nous restons en lien d\'amitié avec les familles qui sont régularisées et vivent de façon autonome.\r\n        ', NULL),
(3, '', '', 'Aide à l\'hébergement', 'Devant l’insuffisance des politiques d’accueil et d’intégration des demandeurs d’asile la question de leur hébergement est aujourd’hui durablement préoccupante. Cette situation a conduit l’ASSEDA à rechercher des solutions d’hébergement dignes en faisant appel aux dons et en cherchant des appartements à faible loyer.\r\n            Les dons réguliers d’une centaine de particuliers nous permettent de louer actuellement 3 appartements dans le parc privé, dont 2 au prix du marché et un à bas loyer. Cela permet de sécuriser l’hébergement de 3 familles qui sinon seraient à la rue. Nous continuons à chercher des appartements à faible loyer. ', NULL),
(4, '', '', 'Comment ça fonctionne ? ', '100 personnes x 10,00 euros / mois = 1 famille hébergée. \r\n100 personnes x 20,00 euros / mois = 2 famille hébergée. \r\n70 personnes x 30,00 euros / mois = 2 famille hébergée.\r\n            Si la cause vous intéresse, on vous invite à nous soutenir.', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `contenu_3`
--

DROP TABLE IF EXISTS `contenu_3`;
CREATE TABLE IF NOT EXISTS `contenu_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `paragraphe` text NOT NULL,
  `liste` text NOT NULL,
  `sous_titre` varchar(255) NOT NULL,
  `sous_paragraphe` text NOT NULL,
  `lien_texte` varchar(255) NOT NULL,
  `lien_url` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_contenu_3` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contenu_3`
--

INSERT INTO `contenu_3` (`id`, `titre`, `paragraphe`, `liste`, `sous_titre`, `sous_paragraphe`, `lien_texte`, `lien_url`, `image`, `admin_id`) VALUES
(1, 'Nous avons besoin de vous et de vos participations', 'Vous pouvez nous aider:', 'si vous êtes propriétaire d\'un petit logement inoccupé, en le louant à l\'association à un tarif modéré (l\'association vous garantit de le libérer quand vous le souhaitez, et de veiller au respect des lieux). Nous RECHERCHONS des PETITS APPARTEMENTS sur Oullins ou aux environs.\r\n                   ', '', '', '', '', '', NULL),
(2, '', '', 'en participant au loyer solidaire : un prélèvement mensuel de 10€, 20€, 30€ ou plus pour nous permettre de louer un appartement pour héberger une famille. Actuellement nous louons 3 appartements dans lesquels sont logées 3 familles.', '', '', '', '', '', NULL),
(3, '', '', 'en faisant un don ponctuel à l\'association : les dons ponctuels nous permettent d\'aider à la vie quotidienne (bus, médicaments, ...)', '', '', '', '', '', NULL),
(4, '', '', 'en accueillant des personnes suivies par l\'association ponctuellement ou en alternance avec d\'autres membres de l\'association', '', '', '', '', '', NULL),
(5, '', '', 'en acceptant de suivre une famille : liens, conseils, ...', '', '', '', '', '', NULL),
(6, '', '', 'en participant aux différentes actions que nous organisons', '', '', '', '', 'images/soutenir.jpg', NULL),
(7, '', '', '', 'Vous voulez nous soutenir? (réduction d\'impôt pouvant aller jusqu\'à 75%)', '', '', '', '', NULL),
(8, '', '', '', 'Faites un don par chèque', 'Envoyez votre chèque accompagné de votre adresse postale pour que nous puissions vous envoyer le reçu fiscal : ASSEDA 13 rue Pasteur 69600 Oullins\r\n                     ', '', '', '', NULL),
(9, '', '', '', 'Participez au loyer solidaire', 'Pour participer au loyer solidaire, vous pouvez faire un virement mensuel de 10€, 20€ ou plus sur le compte de l\'association.\r\n                         ', 'Téléchargez ici la plaquette d\'information et le RIB', 'https://www.asseda.fr/_files/ugd/10c70c_992d54bc701146c3bf10cfecc0a42716.pdf', '', NULL),
(10, '', '', '', 'Adhérez', '', 'Téléchargez le bulletin d\'adhésion', 'images/bulletin_adhesion (4).doc', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `admin_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `content`, `admin_id`) VALUES
(1, 'accueil', 'http://localhost/site_asseda/index.php', '   <div>\r\n        <h1>L\'ASSEDA en quelques mots</h1>\r\n                <p>L’ASSEDA est une petite association se trouvant sur Oullins et qui œuvre spécialement dans l\'aide aux migrants. Nous soutenons principalement les familles qui sont déboutées après une demande d\'asile. Donc, nous les aidons pour la procédure pour obtenir un titre de séjour. La plupart des familles viennent d’ Albanie, du Congo, de Russie, d’Angola, de Madagascar, du Cameroun ...\r\n            Ces familles n’ont pas souvent de ressources et n’ont pas le droit de travailler. Elles essayent de survivre avec l\'aide des restos du cœur, de la maison de la métropole et du secours populaire ou catholique. L\'association ne dispose pas de subvention. Nous fonctionnons grâce à des dons qui nous permettent de louer des appartements à Oullins où nous plaçons les familles en difficultés à l’abri. Nous cherchons ainsi des logements « solidaires » avec des loyers moins chers pour aider plus de personnes.\r\n            A noter que vous pouvez venir nous rencontrer lors de nos permanences chaque vendredi de 14h à 17h à Saint Viateur, 3 rue Henri Barbusse à Oullins.</p>\r\n\r\n        <img src=\"images/solidarité.jpg\" alt=\"Solidarité\" class=\"responsive-image\">\r\n    </div>', NULL),
(2, 'Qui sommes nous', 'http://localhost/site_asseda/qui_sommes_nous.php', '<div>\r\n        <h1>A propos</h1>\r\n        <p>\r\nL’ASSEDA est une association laïque et non confessionnelle d’aide aux migrants sur Oullins. Nous percevons une petite subvention de la mairie, qui nous permet d\'aider les familles à payer la cantine de leurs enfants à l\'école, et nous fonctionnons principalement par les dons de particuliers et de personnes morales.\r\n            L\'ASSEDA est reconnue comme \"Organisme d\'intérêt général\". Les dons à l\' ASSEDA ouvrent droit à une réduction d\'impôt prévue à l\'article 200 et 238bis du CGI.\r\n        </p>\r\n        <h2>Que faisons-nous actuellement?</h2>\r\n        <p>\r\n            Nous accompagnons 10 familles en ce moment et 2 célibataires. Nous avons mis en place une aide à l\'hébergement : nuitées d\'urgence à l’hôtel, hébergement chez des particuliers, appartements en loyer solidaire.\r\n            Nous aidons financièrement les familles pour la vie quotidienne, les cartes de bus, et nous les aidons pour les démarches administratives ,nous interpellons les pouvoirs publics. Nous aidons pour les loisirs des enfants.\r\n            Nous tenons des permanences \"pauses café\" à Saint Viateur, 3 rue Henri Barbusse à Oullins, l\'occasion d\'échanger, de partager le vendredi après midi de 14h à 17h.\r\n            Nous organisons des moments conviviaux : moments de rencontre à plus grande échelle où nous jouons ensemble, petits et grands, des moments forts pour oublier un peu les soucis quotidiens.\r\n            Nous faisons aussi des échanges culinaires nous permettant de découvrir les cuisines du monde... Nous soutenons moralement ces familles pour qui l\'attente si longue des papiers est une véritable torture, et nous restons en lien d\'amitié avec les familles qui sont régularisées et vivent de façon autonome.\r\n        </p>\r\n        <h2>Aide à l\'hébergement</h2>\r\n        <p>\r\n            Devant l’insuffisance des politiques d’accueil et d’intégration des demandeurs d’asile la question de leur hébergement est aujourd’hui durablement préoccupante. Cette situation a conduit l’ASSEDA à rechercher des solutions d’hébergement dignes en faisant appel aux dons et en cherchant des appartements à faible loyer.\r\n            Les dons réguliers d’une centaine de particuliers nous permettent de louer actuellement 3 appartements dans le parc privé, dont 2 au prix du marché et un à bas loyer. Cela permet de sécuriser l’hébergement de 3 familles qui sinon seraient à la rue.\r\n            Nous continuons à chercher des appartements à faible loyer. Comment ça fonctionne ? 100 personnes x 10,00 euros / mois = 1 famille hébergée. 100 personnes x 20,00 euros / mois = 2 famille hébergée. 70 personnes x 30,00 euros / mois = 2 famille hébergée.\r\n            Si la cause vous intéresse, on vous invite à nous soutenir.\r\n        </p>\r\n    </div>', NULL),
(3, 'Nous soutenir', 'http://localhost/site_asseda/nous_soutenir.php', '<h1>Nous avons besoin de vous et de vos participations</h1>\r\n                <p>Vous pouvez nous aider:</p>\r\n                <ul>\r\n                    <li>si vous êtes propriétaire d\'un petit logement inoccupé, en le louant à l\'association à un tarif modéré (l\'association vous garantit de le libérer quand vous le souhaitez, et de veiller au respect des lieux). Nous RECHERCHONS des PETITS APPARTEMENTS sur Oullins ou aux environs.</li>\r\n                    <li>en participant au loyer solidaire : un prélèvement mensuel de 10€, 20€, 30€ ou plus pour nous permettre de louer un appartement pour héberger une famille. Actuellement nous louons 3 appartements dans lesquels sont logées 3 familles.</li>\r\n                    <li>en faisant un don ponctuel à l\'association : les dons ponctuels nous permettent d\'aider à la vie quotidienne (bus, médicaments, ...)</li>\r\n                    <li>en accueillant des personnes suivies par l\'association ponctuellement ou en alternance avec d\'autres membres de l\'association</li>\r\n                    <li>en acceptant de suivre une famille : liens, conseils, ...</li>\r\n                    <li>en participant aux différentes actions que nous organisons</li>\r\n                </ul>\r\n                <img src=\"images/soutenir.jpg\" class=\"img-thumbnail\" alt=\"image\">\r\n            </div>\r\n            <div>\r\n                <h2>Vous voulez nous soutenir? (réduction d\'impôt pouvant aller jusqu\'à 75%)</h2>\r\n                <div>\r\n                                            <p>\r\n                        <h3>Faites un don par chèque</h3>\r\n                        Envoyez votre chèque accompagné de votre adresse postale pour que nous puissions vous envoyer le reçu fiscal : ASSEDA 13 rue Pasteur 69600 Oullins\r\n                        </p>\r\n                        <p>\r\n                        <h3>Participez au loyer solidaire</h3>\r\n                        Pour participer au loyer solidaire, vous pouvez faire un virement mensuel de 10€, 20€ ou plus. <a href=\"https://www.asseda.fr/_files/ugd/10c70c_992d54bc701146c3bf10cfecc0a42716.pdf\" target=\"_blank\">Téléchargez la plaquette d\'information</a>(nb: contient le RIB de l\'association)\r\n                        </p>\r\n                        <p>\r\n                        <h3>Adhérez</h3>\r\n                        <a href=\"images/bulletin_adhesion (4).doc\">Téléchargez le bulletin d\'adhésion</a>\r\n                        </p>\r\n                    </div>', NULL),
(4, 'Contact', 'http://localhost/site_asseda/nous_contacter.php', '<div>\r\n            <h2>Contactez-nous</h2>\r\n            <form action=\"templates/contact.php\" method=\"post\">\r\n                <div>\r\n                    <label for=\"name\">Nom :</label>\r\n                    <input type=\"text\" id=\"name\" name=\"name\" required>\r\n                </div>\r\n                <div>\r\n                    <label for=\"email\">Email :</label>\r\n                    <input type=\"email\" id=\"email\" name=\"email\" required>\r\n                </div>\r\n                <div>\r\n                    <label for=\"message\">Message :</label>\r\n                    <textarea id=\"message\" name=\"message\" required></textarea>\r\n                </div>\r\n                <div>\r\n                    <button type=\"submit\">Envoyer</button>\r\n                </div>\r\n            </form>\r\n        </div>', NULL),
(5, '', '', '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `email`, `message`) VALUES
(1, 'RAZAFINDRAMISA', 'hajazerp@gmail.com', 'jkdkd'),
(29, 'Dujardin', 'dujardin@hotmail.com', 'Je veux devenir membre');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contenu`
--
ALTER TABLE `contenu`
  ADD CONSTRAINT `fk_admin_contenu` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Contraintes pour la table `contenu_2`
--
ALTER TABLE `contenu_2`
  ADD CONSTRAINT `fk_admin_contenu_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Contraintes pour la table `contenu_3`
--
ALTER TABLE `contenu_3`
  ADD CONSTRAINT `fk_admin_contenu_3` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Contraintes pour la table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
