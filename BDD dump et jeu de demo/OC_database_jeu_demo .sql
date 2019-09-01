-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 01 sep. 2019 à 14:12
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `oc_pizza`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `Id_adresse` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_voie` int(11) NOT NULL,
  `complement_libelle` varchar(30) NOT NULL,
  `Ville_id` int(11) NOT NULL,
  PRIMARY KEY (`Id_adresse`,`Ville_id`),
  KEY `fk_Adresse_Ville1_idx` (`Ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`Id_adresse`, `libelle_voie`, `complement_libelle`, `Ville_id`) VALUES
(1, 9, 'Rue des cacahuetes', 4),
(2, 2, 'Rue de la paix', 1),
(3, 31, 'Avenue des champs', 8),
(4, 108, 'Avenue de Paris', 7),
(5, 5, 'Rue des pommes', 3),
(6, 44, 'Rue des fraises', 2),
(7, 29, 'Villa St Etienne', 4),
(8, 1, 'Rue Victor Hugo', 5),
(9, 388, 'Avenue des lumières', 6),
(10, 9, 'Avenue des jongleurs', 2),
(11, 4, 'Rue de la victoires', 6),
(12, 35, 'Avenue des pastèques', 3),
(13, 237, 'Avenue de Rome', 2),
(14, 25, 'Rue des abricots', 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Numero_de_client` int(11) NOT NULL AUTO_INCREMENT,
  `prenom` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adresse_mail` varchar(50) NOT NULL,
  `telephone` char(10) NOT NULL,
  `mot_de_passe` varchar(30) NOT NULL,
  PRIMARY KEY (`Numero_de_client`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`Numero_de_client`, `prenom`, `nom`, `adresse_mail`, `telephone`, `mot_de_passe`) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '0123456789', 'password'),
(2, 'Nicolas', 'Pit', 'nicolaspit@gmail.com', '0123456789', 'password'),
(3, 'Pierre', 'Rag', 'pierrerag@gmail.com', '0123456789', 'password'),
(4, 'Phillipe', 'Toc', 'phillipetoc@gmail.com', '0123456789', 'password'),
(5, 'Gerard', 'Poc', 'garardpoc@gmail.com', '0123456789', 'password'),
(6, 'Paul', 'Soc', 'paulsoc@gmail.com', '0123456789', 'password'),
(7, 'Nick', 'Doc', 'nickdoc@gmail.com', '0123456789', 'password'),
(8, 'Patrick', 'Wok', 'patrickwok@gmail.com', '0123456789', 'password'),
(9, 'Luc', 'Lop', 'luclop@gmail.com', '0123456789', 'password');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Numero_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `Client_Numero_de_client` int(11) NOT NULL,
  `Adresse_Id_adresse` int(11) NOT NULL,
  `Mode de paiement_Choix_paiement` int(11) NOT NULL,
  `Statut commande_Statut_commande_id` int(11) NOT NULL,
  PRIMARY KEY (`Numero_commande`),
  KEY `fk_Commande_Client1_idx` (`Client_Numero_de_client`),
  KEY `fk_Commande_Adresse1_idx` (`Adresse_Id_adresse`),
  KEY `fk_Commande_Mode de paiement1_idx` (`Mode de paiement_Choix_paiement`),
  KEY `fk_Commande_Statut commande1_idx` (`Statut commande_Statut_commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`Numero_commande`, `date_commande`, `Client_Numero_de_client`, `Adresse_Id_adresse`, `Mode de paiement_Choix_paiement`, `Statut commande_Statut_commande_id`) VALUES
(1, '2019-02-01', 1, 1, 1, 4),
(2, '2019-02-02', 2, 2, 1, 4),
(3, '2019-02-03', 3, 3, 1, 4),
(4, '2019-02-03', 4, 4, 2, 4),
(5, '2019-02-04', 5, 5, 2, 4),
(6, '2019-02-05', 6, 6, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `commande_has_pizza`
--

DROP TABLE IF EXISTS `commande_has_pizza`;
CREATE TABLE IF NOT EXISTS `commande_has_pizza` (
  `Numero_commande` int(11) NOT NULL,
  `Id_pizza` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `libelle` varchar(80) NOT NULL,
  PRIMARY KEY (`Numero_commande`,`Id_pizza`),
  KEY `fk_Commande_has_Pizza_Pizza1_idx` (`Id_pizza`),
  KEY `fk_Commande_has_Pizza_Commande1_idx` (`Numero_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande_has_pizza`
--

INSERT INTO `commande_has_pizza` (`Numero_commande`, `Id_pizza`, `quantite`, `prix`, `libelle`) VALUES
(1, 1, 1, 13.99, 'commande 1'),
(1, 2, 1, 14.99, 'commande 1'),
(2, 1, 3, 13.99, 'commande 2'),
(2, 2, 3, 14.99, 'commande 2'),
(2, 3, 3, 15.99, 'commande 2'),
(3, 1, 4, 15.99, 'commande 3'),
(4, 4, 2, 15.99, 'commande 4'),
(5, 1, 2, 13.99, 'commande 5'),
(5, 2, 2, 14.99, 'commande 5'),
(6, 1, 1, 13.99, 'commande 6'),
(6, 2, 1, 14.99, 'commande 6'),
(6, 3, 1, 15.99, 'commande 6'),
(6, 4, 1, 15.99, 'commande 6');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `Numero_facture` int(11) NOT NULL AUTO_INCREMENT,
  `date_facture` date NOT NULL,
  `description` varchar(60) NOT NULL,
  `Commande_Numero_commande` int(11) NOT NULL,
  PRIMARY KEY (`Numero_facture`,`Commande_Numero_commande`),
  KEY `fk_Facture_Commande1_idx` (`Commande_Numero_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`Numero_facture`, `date_facture`, `description`, `Commande_Numero_commande`) VALUES
(1, '2019-02-01', 'Montant : 13.99 + 14.99 = 28.98', 1),
(2, '2019-02-02', 'Montant : 3 x 13.99 + 3 x 14.99 = 86.94', 2),
(3, '2019-02-03', 'Montant : 4 x 15.99 = 63.96', 3),
(4, '2019-02-03', 'Montant : 2 x 15.99 = 31.98', 4),
(5, '2019-02-04', 'Montant : 2 x 13.99 + 2 x 14.99 = 57.96', 5),
(6, '2019-02-05', '13.99 + 14.99 + 2 x 15.99 = 60.96', 6);

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE IF NOT EXISTS `ingredient` (
  `Id_ingredient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`Id_ingredient`, `nom`, `description`) VALUES
(1, 'Pâte à pizza', 'Pâte de préparation pour les pizzas'),
(2, 'Purée de tomates', 'Sauce tomate servant de garniture'),
(3, 'Mozzarella de bufflonne', 'Fromage servant de garniture'),
(4, 'Basilics frais', 'Herbe aromatique pour améliorer le goût'),
(5, 'Huile d\"olive', 'Matière grasse faite d\"olives'),
(6, 'Sel', 'Condiment'),
(7, 'Poivre', 'Condiment'),
(8, 'Gorgonzola', 'Fromage servant de garniture'),
(9, 'Gruyère', 'Fromage servant de garniture'),
(10, 'Olives noires', 'Oléagineux servant de garniture'),
(11, 'Parmesan', 'Fromage servant de garniture'),
(12, 'Jambon', 'Viande de porc servant de garniture'),
(13, 'Jambon blanc', 'Viande de porc servant de garniture'),
(14, 'Champignon de Paris', 'Champignon servant de garniture'),
(15, 'Crème fraîche', 'Crème servant de garniture'),
(16, 'Fromage de chèvre', 'Fromage servant de garniture'),
(17, 'Miel', 'Miel servant de garniture');

-- --------------------------------------------------------

--
-- Structure de la table `magasin`
--

DROP TABLE IF EXISTS `magasin`;
CREATE TABLE IF NOT EXISTS `magasin` (
  `Id_magasin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_magasin` varchar(30) NOT NULL,
  `Adresse_Id_adresse` int(11) NOT NULL,
  PRIMARY KEY (`Id_magasin`,`Adresse_Id_adresse`),
  KEY `fk_Magasin_Adresse1_idx` (`Adresse_Id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `magasin`
--

INSERT INTO `magasin` (`Id_magasin`, `nom_magasin`, `Adresse_Id_adresse`) VALUES
(6, 'Pizzeria A', 10),
(7, 'Pizzeria B', 11),
(8, 'Pizzeria C', 12),
(9, 'Pizzeria D', 13),
(10, 'Pizzeria E', 14);

-- --------------------------------------------------------

--
-- Structure de la table `magasin_has_ingredient`
--

DROP TABLE IF EXISTS `magasin_has_ingredient`;
CREATE TABLE IF NOT EXISTS `magasin_has_ingredient` (
  `Id_magasin` int(11) NOT NULL,
  `Id_ingredient` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`Id_magasin`,`Id_ingredient`),
  KEY `fk_Magasin_has_Ingredient_Ingredient1_idx` (`Id_ingredient`),
  KEY `fk_Magasin_has_Ingredient_Magasin1_idx` (`Id_magasin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `magasin_has_ingredient`
--

INSERT INTO `magasin_has_ingredient` (`Id_magasin`, `Id_ingredient`, `quantite`) VALUES
(6, 1, 99),
(6, 2, 99),
(6, 3, 99),
(6, 4, 99),
(6, 5, 99),
(6, 6, 99),
(6, 7, 99),
(6, 8, 99),
(6, 9, 99),
(6, 10, 99),
(6, 11, 99),
(6, 12, 99),
(6, 13, 99),
(6, 14, 99),
(6, 15, 99),
(6, 16, 99),
(6, 17, 99),
(7, 1, 99),
(7, 2, 99),
(7, 3, 99),
(7, 4, 99),
(7, 5, 99),
(7, 6, 99),
(7, 7, 99),
(7, 8, 99),
(7, 9, 99),
(7, 10, 99),
(7, 11, 99),
(7, 12, 99),
(7, 13, 99),
(7, 14, 99),
(7, 15, 99),
(7, 16, 99),
(7, 17, 99),
(8, 1, 99),
(8, 2, 99),
(8, 3, 99),
(8, 4, 99),
(8, 5, 99),
(8, 6, 99),
(8, 7, 99),
(8, 8, 99),
(8, 9, 99),
(8, 10, 99),
(8, 11, 99),
(8, 12, 99),
(8, 13, 99),
(8, 14, 99),
(8, 15, 99),
(8, 16, 99),
(8, 17, 99),
(9, 1, 99),
(9, 2, 99),
(9, 3, 99),
(9, 4, 99),
(9, 5, 99),
(9, 6, 99),
(9, 7, 99),
(9, 8, 99),
(9, 9, 99),
(9, 10, 99),
(9, 11, 99),
(9, 12, 99),
(9, 13, 99),
(9, 14, 99),
(9, 15, 99),
(9, 16, 99),
(9, 17, 99),
(10, 1, 99),
(10, 2, 99),
(10, 3, 99),
(10, 4, 99),
(10, 5, 99),
(10, 6, 99),
(10, 7, 99),
(10, 8, 99),
(10, 9, 99),
(10, 10, 99),
(10, 11, 99),
(10, 12, 99),
(10, 13, 99),
(10, 14, 99),
(10, 15, 99),
(10, 16, 99),
(10, 17, 99);

-- --------------------------------------------------------

--
-- Structure de la table `mode_de_paiement`
--

DROP TABLE IF EXISTS `mode_de_paiement`;
CREATE TABLE IF NOT EXISTS `mode_de_paiement` (
  `Choix_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`Choix_paiement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mode_de_paiement`
--

INSERT INTO `mode_de_paiement` (`Choix_paiement`, `libelle`) VALUES
(1, 'En espèce'),
(2, 'En ligne');

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE IF NOT EXISTS `pizza` (
  `Id_pizza` int(11) NOT NULL AUTO_INCREMENT,
  `recette_pizza` longtext NOT NULL,
  `libelle` varchar(120) NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`Id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`Id_pizza`, `recette_pizza`, `libelle`, `prix`) VALUES
(1, '4 Pers.\r\nINGRÉDIENTS\r\n400 g de pâte à pizza\r\n6 cuillérées de purée de tomates\r\n250 g de mozzarella de bufflonne\r\nQuelques feuilles de basilic frais\r\n5 c. à soupe d’huile d’olive extra vierge\r\nSel, poivre\r\nPRÉPARATION\r\nÉTAPE 1\r\nPréchauffez le four Th8 (240°C).\r\n\r\nÉTAPE 2\r\nAssaisonnez la purée de tomate avec du sel, 1 c. à soupe d’huile et du poivré réservez.\r\n\r\nÉTAPE 3\r\nEgouttez la mozzarella et coupez-la en petits dés.\r\n\r\nÉTAPE 4\r\nA l’aide du rouleau à pâtisserie, propre et fariné, étalez la pâte à pizza sur un papier sulfurisé adapté à un moule de 30 cm de diamètre environ. Faites un bourrelet sur tout le pourtour.\r\n\r\nÉTAPE 5\r\nEtalez la purée de tomates sur la pizza et mettez-la dans le four préchauffé Th8 (240°C) pendant 10 min.\r\n\r\nÉTAPE 6\r\nSortez la pizza du four, étalez les dés de mozzarella et enfournez-la de nouveau pendant 10 min environ.\r\n\r\nÉTAPE 7\r\nSortez la pizza du four, assaisonnez-la avec l’huile restante et les feuilles de basilic.', 'Margherita', 13.99),
(2, '4 Pers.\r\nINGRÉDIENTS\r\n1 préparation pour pâte à pizza\r\n50 g de mozzarella\r\n50 g de gorgonzola\r\n50 g de gruyère\r\nquelques olives noires\r\n1 c. à soupe de parmesan râpé\r\n2 c. à soupe d\'huile d\'olive\r\nsel, poivre\r\nPRÉPARATION\r\nÉTAPE 1\r\nLa première étape de cette recette de pizza aux quatre fromages consiste à préparer la pâte à pizza en suivant les indications du paquet. Vous pouvez également acheter une pâte à pizza toute prête pour vous faciliter la tâche.\r\n\r\nÉTAPE 2\r\nÉtalez la pâte sur une tôle huilée ou une plaque de votre four, huilez également toute la surface de la pâte avec de l\'huile d\'olive et à l\'aide d\'un pinceau de cuisine.\r\n\r\nÉTAPE 3\r\nPréchauffez le four th.7 (210°C).\r\n\r\nÉTAPE 4\r\nRépartissez les 3 fromages coupés en cubes sur la pâte de manière uniforme en veillant bien à mélanger les goûts sur toute la surface en laissant juste un centimètre de bord. Salez, poivrez à votre convenance et arrosez d\'un filet d\'huile d\'olive.\r\n\r\nÉTAPE 5\r\nGlissez au four pour 25 min environ, jusqu\'à ce que la pâte soit bien dorée et croustillante.\r\n\r\nÉTAPE 6\r\nParsemez de parmesan frais râpé ou en copeau et d\'olives noires coupées avant de servir votre pizza aux quatre fromages bien chaude.', 'Quatre fromages', 14.99),
(3, '4 Pers.\r\nINGRÉDIENTS\r\nPour la pâte à pizza :\r\n250 g de farine\r\n2 c. à soupe d\'huile d’olive\r\n15 cl d’eau froide + 2 c. à soupe\r\n1 pincée de sucre en poudre\r\n15 g de levure fraîche de boulanger\r\n1/2 c. à café de sel\r\nPour la garniture :\r\n150 g de sauce tomate\r\n100 g de champignons de Paris\r\n150 g de tranches de jambon blanc découenné\r\n100 g de gruyère râpé\r\nsel, poivre au goût\r\n\r\nPRÉPARATION\r\n\r\nÉTAPE 1\r\nRépartissez la sauce tomate sur la pâte à l’aide d’une cuillère à soupe.\r\n\r\nÉTAPE 2\r\nLavez, retirez les pieds terreux et émincez les champignons de Paris en lamelles.\r\n\r\nÉTAPE 3\r\nCoupez les tranches de jambon en petits morceaux.\r\n\r\nÉTAPE 4\r\nRépartissez les lamelles de champignons, les morceaux de jambon, puis le gruyère râpé sur la pâte. Salez et poivrez selon vos goûts.\r\n\r\nÉTAPE 5\r\nEnfournez la pizza reine dans le four préchauffé et laissez cuire pendant 20 min.\r\n\r\nÉTAPE 6\r\nServez et dégustez cette pizza reine bien chaude dès la sortie du four.', 'Reine', 15.99),
(4, '6 Pers.\r\nINGRÉDIENTS\r\n1 pâte à pizza\r\n2 à 3 c. à soupe de crème fraîche\r\n1 fromage de chèvre\r\n3 tranches de jambon blanc\r\n4 c. à soupe de miel\r\nmozzarella râpée\r\nsel, poivre\r\nPRÉPARATION\r\nÉTAPE 1\r\nSortez la pâte 15 min avant utilisation, pour qu\'elle soit plus facile à dérouler. Préchauffez le four à th.5 (150°C).\r\n\r\nÉTAPE 2\r\nDéroulez la pâte, tapissez-la de 2 à 3 c. à soupe de crème fraîche. Déposez le jambon coupé en lamelles.\r\n\r\nÉTAPE 3\r\nCoupez le chèvre en rondelles, disposez-le en cercle, de l\'extérieur vers l\'intérieur. Salez et poivrez si nécessaire.\r\n\r\nÉTAPE 4\r\nAjoutez le miel, en veillant à bien le répartir sur toute la pizza. Parsemez de mozzarella râpée. Enfournez pour 25 min. Et régalez-vous !\r\n', 'Chèvre miel', 15.99);

-- --------------------------------------------------------

--
-- Structure de la table `pizza_has_ingredient`
--

DROP TABLE IF EXISTS `pizza_has_ingredient`;
CREATE TABLE IF NOT EXISTS `pizza_has_ingredient` (
  `Id_pizza` int(11) NOT NULL,
  `Id_ingredient` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`Id_pizza`,`Id_ingredient`),
  KEY `fk_Pizza_has_Ingredient_Ingredient1_idx` (`Id_ingredient`),
  KEY `fk_Pizza_has_Ingredient_Pizza1_idx` (`Id_pizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pizza_has_ingredient`
--

INSERT INTO `pizza_has_ingredient` (`Id_pizza`, `Id_ingredient`, `quantite`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(1, 7, 1),
(2, 1, 1),
(2, 3, 1),
(2, 5, 1),
(2, 6, 1),
(2, 7, 1),
(2, 8, 1),
(2, 9, 1),
(2, 10, 1),
(2, 11, 1),
(3, 1, 1),
(3, 2, 1),
(3, 4, 1),
(3, 9, 1),
(3, 12, 1),
(3, 14, 1),
(4, 1, 1),
(4, 3, 1),
(4, 6, 1),
(4, 7, 1),
(4, 13, 1),
(4, 15, 1),
(4, 16, 1),
(4, 17, 1);

-- --------------------------------------------------------

--
-- Structure de la table `statut_commande`
--

DROP TABLE IF EXISTS `statut_commande`;
CREATE TABLE IF NOT EXISTS `statut_commande` (
  `Statut_commande_id` int(11) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`Statut_commande_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statut_commande`
--

INSERT INTO `statut_commande` (`Statut_commande_id`, `libelle`) VALUES
(1, 'En attente de préparation'),
(2, 'En cours de préparation'),
(3, 'En cours de livraison'),
(4, 'Terminée');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `Id_ville` int(11) NOT NULL AUTO_INCREMENT,
  `nom_ville` varchar(60) NOT NULL,
  `code_postal` char(6) NOT NULL,
  PRIMARY KEY (`Id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`Id_ville`, `nom_ville`, `code_postal`) VALUES
(1, 'Charenton le pont', '94220'),
(2, 'Creteil', '94000'),
(3, 'Alfort Ville', '94140'),
(4, 'Maisons Alfort', '94700'),
(5, 'Ivry', '94205'),
(6, 'Vitry', '94400'),
(7, 'Saint Maurice', '94410'),
(8, 'Saint Maur', '94100'),
(9, 'Villejuif', '94800');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `fk_Adresse_Ville1` FOREIGN KEY (`Ville_id`) REFERENCES `ville` (`Id_ville`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_Adresse1` FOREIGN KEY (`Adresse_Id_adresse`) REFERENCES `adresse` (`Id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_Client1` FOREIGN KEY (`Client_Numero_de_client`) REFERENCES `client` (`Numero_de_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_Mode de paiement1` FOREIGN KEY (`Mode de paiement_Choix_paiement`) REFERENCES `mode_de_paiement` (`Choix_paiement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_Statut commande1` FOREIGN KEY (`Statut commande_Statut_commande_id`) REFERENCES `statut_commande` (`Statut_commande_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande_has_pizza`
--
ALTER TABLE `commande_has_pizza`
  ADD CONSTRAINT `fk_Commande_has_Pizza_Commande1` FOREIGN KEY (`Numero_commande`) REFERENCES `commande` (`Numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_has_Pizza_Pizza1` FOREIGN KEY (`Id_pizza`) REFERENCES `pizza` (`Id_pizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_Facture_Commande1` FOREIGN KEY (`Commande_Numero_commande`) REFERENCES `commande` (`Numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `magasin_has_ingredient`
--
ALTER TABLE `magasin_has_ingredient`
  ADD CONSTRAINT `fk_Magasin_has_Ingredient_Ingredient1` FOREIGN KEY (`Id_ingredient`) REFERENCES `ingredient` (`Id_ingredient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Magasin_has_Ingredient_Magasin1` FOREIGN KEY (`Id_magasin`) REFERENCES `magasin` (`Id_magasin`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pizza_has_ingredient`
--
ALTER TABLE `pizza_has_ingredient`
  ADD CONSTRAINT `fk_Pizza_has_Ingredient_Ingredient1` FOREIGN KEY (`Id_ingredient`) REFERENCES `ingredient` (`Id_ingredient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pizza_has_Ingredient_Pizza1` FOREIGN KEY (`Id_pizza`) REFERENCES `pizza` (`Id_pizza`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
