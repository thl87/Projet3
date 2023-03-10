-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)

--

-- Host: localhost    Database: salesforce

-- ------------------------------------------------------

-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!50503 SET NAMES utf8 */

;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */

;

/*!40103 SET TIME_ZONE='+00:00' */

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

--

-- Table structure for table `commentaire`

--

DROP TABLE IF EXISTS `commentaire`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `commentaire` (
        `idcommentaire` int NOT NULL AUTO_INCREMENT,
        `detail` text NOT NULL,
        `date` VARCHAR(80) NOT NULL,
        `utilisateur_idutilisateur` int NOT NULL,
        `idee_ididee` int NOT NULL,
        PRIMARY KEY (`idcommentaire`),
        KEY `fk_commentaire_utilisateur1_idx` (`utilisateur_idutilisateur`),
        KEY `fk_commentaire_idee1_idx` (`idee_ididee`),
        CONSTRAINT `fk_commentaire_idee1` FOREIGN KEY (`idee_ididee`) REFERENCES `idee` (`ididee`),
        CONSTRAINT `fk_commentaire_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `commentaire`

--

LOCK TABLES `commentaire` WRITE;

/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */

;

/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `archive`

--

DROP TABLE IF EXISTS `archive`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `archive` (
        `idee_ididee` int NOT NULL,
        KEY `fk_idee1_idx` (`idee_ididee`),
        CONSTRAINT `fk_idee1` FOREIGN KEY (`idee_ididee`) REFERENCES `idee` (`ididee`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

--

-- Dumping data for table `archive`

--

LOCK TABLES `archive` WRITE;

/*!40000 ALTER TABLE `archive` DISABLE KEYS */

;

/*!40000 ALTER TABLE `archive` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `favoris`

--

DROP TABLE IF EXISTS `favoris`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `favoris` (
        `idee_ididee` int NOT NULL,
        `utilisateur_idutilisateur` int NOT NULL,
        KEY `fk_favoris_idee_idx` (`idee_ididee`),
        KEY `fk_favoris_utilisateur1_idx` (`utilisateur_idutilisateur`),
        CONSTRAINT `fk_favoris_idee` FOREIGN KEY (`idee_ididee`) REFERENCES `idee` (`ididee`),
        CONSTRAINT `fk_favoris_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `favoris`

--

LOCK TABLES `favoris` WRITE;

/*!40000 ALTER TABLE `favoris` DISABLE KEYS */

;

/*!40000 ALTER TABLE `favoris` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `fonction`

--

DROP TABLE IF EXISTS `fonction`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `fonction` (
        `idfonction` int NOT NULL AUTO_INCREMENT,
        `nom` varchar(80) NOT NULL,
        PRIMARY KEY (`idfonction`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `fonction`

--

LOCK TABLES `fonction` WRITE;

/*!40000 ALTER TABLE `fonction` DISABLE KEYS */

;

INSERT INTO `fonction`
VALUES (1, 'Employ??'), (2, 'Commercial'), (3, 'Secr??taire'), (4, 'RH'), (5, 'Comptable'), (6, 'Manager'), (7, 'Chef d\'??quipe'), (8, 'PDG');

/*!40000 ALTER TABLE `fonction` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `idee`

--

DROP TABLE IF EXISTS `idee`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `idee` (
        `ididee` int NOT NULL AUTO_INCREMENT,
        `date` varchar(80) NOT NULL,
        `theme` varchar(80) NOT NULL,
        `titre` varchar(80) NOT NULL,
        `description` text NOT NULL,
        `ressource` longblob,
        `archive` tinyint NOT NULL,
        `utilisateur_idutilisateur` int NOT NULL,
        `service_idservice` int NOT NULL,
        PRIMARY KEY (`ididee`),
        KEY `fk_idee_utilisateur1_idx` (`utilisateur_idutilisateur`),
        KEY `fk_idee_service1_idx` (`service_idservice`),
        CONSTRAINT `fk_idee_service1` FOREIGN KEY (`service_idservice`) REFERENCES `service` (`idservice`),
        CONSTRAINT `fk_idee_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `idee`

--

LOCK TABLES `idee` WRITE;

/*!40000 ALTER TABLE `idee` DISABLE KEYS */

;

/*!40000 ALTER TABLE `idee` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `like_com`

--

DROP TABLE IF EXISTS `like_com`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `like_com` (
        `commentaire_idcommentaire` int NOT NULL,
        `utilisateur_idutilisateur` int NOT NULL,
        KEY `fk_like_com_commentaire1_idx` (`commentaire_idcommentaire`),
        KEY `fk_like_com_utilisateur1_idx` (`utilisateur_idutilisateur`),
        CONSTRAINT `fk_like_com_commentaire1` FOREIGN KEY (`commentaire_idcommentaire`) REFERENCES `commentaire` (`idcommentaire`),
        CONSTRAINT `fk_like_com_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `like_com`

--

LOCK TABLES `like_com` WRITE;

/*!40000 ALTER TABLE `like_com` DISABLE KEYS */

;

/*!40000 ALTER TABLE `like_com` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `likes`

--

DROP TABLE IF EXISTS `likes`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `likes` (
        `utilisateur_idutilisateur` int NOT NULL,
        `idee_ididee` int NOT NULL,
        KEY `fk_likes_utilisateur1_idx` (`utilisateur_idutilisateur`),
        KEY `fk_likes_idee1_idx` (`idee_ididee`),
        CONSTRAINT `fk_likes_idee1` FOREIGN KEY (`idee_ididee`) REFERENCES `idee` (`ididee`),
        CONSTRAINT `fk_likes_utilisateur1` FOREIGN KEY (`utilisateur_idutilisateur`) REFERENCES `utilisateur` (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `likes`

--

LOCK TABLES `likes` WRITE;

/*!40000 ALTER TABLE `likes` DISABLE KEYS */

;

/*!40000 ALTER TABLE `likes` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `service`

--

DROP TABLE IF EXISTS `service`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `service` (
        `idservice` int NOT NULL AUTO_INCREMENT,
        `nomservice` varchar(80) NOT NULL,
        `nbemploye` int NOT NULL,
        `localisation` varchar(80) NOT NULL,
        PRIMARY KEY (`idservice`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `service`

--

LOCK TABLES `service` WRITE;

/*!40000 ALTER TABLE `service` DISABLE KEYS */

;

INSERT INTO `service`
VALUES (
        1,
        'Recherche et D??veloppement',
        15,
        'quatri??me sous-sol'
    ), (
        2,
        'Comptabilit??',
        10,
        'troisi??me sous-sol'
    ), (
        3,
        'Secr??tariat',
        6,
        'troisi??me ??tage'
    ), (
        4,
        'Commercial',
        8,
        'premier ??tage'
    ), (
        5,
        'Encadrement',
        6,
        'dernier ??tage'
    ), (
        6,
        'Marketing',
        8,
        'deuxi??me ??tage'
    ), (
        7,
        'Entretien',
        12,
        'deuxi??me sous-sol'
    ), (
        8,
        'Relation Client??le',
        4,
        'rez-de-chauss??e'
    ), (9, 'Exp??dition', 6, 'Entrep??t'), (10, 'Reception', 2, 'Entrep??t'), (
        11,
        'Relations Humaines',
        4,
        'troisi??me ??tage'
    ), (
        12,
        'Logistique',
        4,
        'premier sous-sol'
    );

/*!40000 ALTER TABLE `service` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `theme`

--

DROP TABLE IF EXISTS `theme`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `theme` (
        `idtheme` int NOT NULL AUTO_INCREMENT,
        `nom` varchar(80) NOT NULL,
        PRIMARY KEY (`idtheme`)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `theme`

--

LOCK TABLES `theme` WRITE;

/*!40000 ALTER TABLE `theme` DISABLE KEYS */

;

/*!40000 ALTER TABLE `theme` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `utilisateur`

--

DROP TABLE IF EXISTS `utilisateur`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!50503 SET character_set_client = utf8mb4 */

;

CREATE TABLE
    `utilisateur` (
        `id` int NOT NULL AUTO_INCREMENT,
        `nom` varchar(80) NOT NULL,
        `prenom` varchar(80) NOT NULL,
        `dateembauche` date NOT NULL,
        `motdepasse` varchar(255) DEFAULT NULL,
        `admin` tinyint NOT NULL,
        `anniversaire` date NOT NULL,
        `serviceIdservice` int NOT NULL,
        `fonctionIdfonction` int NOT NULL,
        `email` varchar(80) NOT NULL,
        `biographie` varchar(800) DEFAULT NULL,
        `avatar` varchar(250) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `fk_utilisateur_service1_idx` (`serviceIdservice`),
        KEY `fk_utilisateur_fonction1_idx` (`fonctionIdfonction`),
        CONSTRAINT `fk_utilisateur_fonction1` FOREIGN KEY (`fonctionIdfonction`) REFERENCES `fonction` (`idfonction`) ON DELETE CASCADE,
        CONSTRAINT `fk_utilisateur_service1` FOREIGN KEY (`serviceIdservice`) REFERENCES `service` (`idservice`) ON DELETE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 93 DEFAULT CHARSET = utf8mb3;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `utilisateur`

--

LOCK TABLES `utilisateur` WRITE;

/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */

;

INSERT INTO `utilisateur`
VALUES (
        1,
        'MacRitchie',
        'Kelsi',
        '2020-05-01',
        'mngfA7q5uDL',
        0,
        '2000-09-03',
        10,
        7,
        'kmacritchie0@huffingtonpost.com',
        NULL,
        NULL
    ), (
        2,
        'Birkinshaw',
        'Taylor',
        '2004-09-14',
        'qeCUC2',
        1,
        '1991-09-26',
        5,
        6,
        'tbirkinshaw1a@creativecommons.org',
        NULL,
        NULL
    ), (
        3,
        'Cockling',
        'Ethel',
        '2012-01-16',
        'Ivkf9O',
        0,
        '1999-11-03',
        10,
        1,
        'ecockling1@google.com',
        NULL,
        NULL
    ), (
        4,
        'Freeburn',
        'Krissie',
        '2007-08-06',
        'dbSSWhym',
        0,
        '1974-05-02',
        1,
        7,
        'kfreeburn2@prweb.com',
        NULL,
        NULL
    ), (
        5,
        'Bussel',
        'Kin',
        '2015-03-19',
        'sgqStdQ8FS',
        0,
        '1979-04-03',
        1,
        7,
        'kbussel3@weather.com',
        NULL,
        NULL
    ), (
        6,
        'Gimeno',
        'Templeton',
        '2019-09-10',
        'ftvD0mse',
        0,
        '1993-07-27',
        1,
        7,
        'tgimeno4@wp.com',
        NULL,
        NULL
    ), (
        7,
        'Palek',
        'Illa',
        '2000-04-14',
        'McS2a0pT7G0',
        0,
        '1983-04-01',
        1,
        1,
        'ipalek5@fema.gov',
        NULL,
        NULL
    ), (
        8,
        'Snead',
        'Jacinthe',
        '2018-08-13',
        'mJlI2E',
        0,
        '2001-01-20',
        1,
        1,
        'jsnead6@ow.ly',
        NULL,
        NULL
    ), (
        9,
        'Layfield',
        'Jorrie',
        '2005-07-17',
        'Hm0dzLu',
        0,
        '1978-05-07',
        1,
        1,
        'jlayfield7@sfgate.com',
        NULL,
        NULL
    ), (
        10,
        'Arch',
        'Eamon',
        '2004-08-03',
        '5Raf1Aad',
        0,
        '1991-01-21',
        1,
        1,
        'earch8@xrea.com',
        NULL,
        NULL
    ), (
        11,
        'Ilsley',
        'Lindsy',
        '2011-09-17',
        'QUNJvAPS',
        0,
        '2000-08-13',
        1,
        1,
        'lilsley9@upenn.edu',
        NULL,
        NULL
    ), (
        12,
        'Hooban',
        'Whit',
        '2003-03-19',
        'GmqSz8fi5x',
        0,
        '1986-09-27',
        1,
        1,
        'whoobana@list-manage.com',
        NULL,
        NULL
    ), (
        13,
        'Fibbitts',
        'Jaquenetta',
        '2017-08-27',
        '5yUqPv3YqQv',
        0,
        '2004-01-14',
        1,
        1,
        'jfibbittsb@yolasite.com',
        NULL,
        NULL
    ), (
        14,
        'Fabri',
        'Kelly',
        '2001-11-07',
        'XDv3FUVH',
        0,
        '1982-10-28',
        1,
        1,
        'kfabric@xrea.com',
        NULL,
        NULL
    ), (
        15,
        'Dellatorre',
        'Cherri',
        '2017-11-11',
        'yS70YFJb',
        0,
        '1990-09-10',
        1,
        1,
        'cdellatorred@ning.com',
        NULL,
        NULL
    ), (
        16,
        'Burgis',
        'Mirelle',
        '2013-10-18',
        'kpLE5z',
        0,
        '1993-10-27',
        1,
        1,
        'mburgise@gravatar.com',
        NULL,
        NULL
    ), (
        17,
        'Maccrae',
        'Maia',
        '2009-11-04',
        '6mmmy82vYm',
        0,
        '1983-08-28',
        1,
        1,
        'mmaccraef@wix.com',
        NULL,
        NULL
    ), (
        18,
        'Dubbin',
        'Giulietta',
        '2004-04-06',
        'pbJ8PP',
        0,
        '1986-12-02',
        1,
        1,
        'gdubbing@hud.gov',
        NULL,
        NULL
    ), (
        19,
        'Lavers',
        'Glenda',
        '2007-10-10',
        '2pMGjUe',
        0,
        '1984-04-08',
        2,
        7,
        'glaversh@google.com.au',
        NULL,
        NULL
    ), (
        20,
        'Sanja',
        'Miranda',
        '2014-04-24',
        'trspAcLb',
        0,
        '1985-11-06',
        2,
        5,
        'msanjai@freewebs.com',
        NULL,
        NULL
    ), (
        21,
        'Simone',
        'Wenona',
        '2019-10-09',
        'eu55Ls6',
        0,
        '1990-01-12',
        2,
        7,
        'wsimonej@wired.com',
        NULL,
        NULL
    ), (
        22,
        'Wombwell',
        'Coreen',
        '2010-12-30',
        'upki35',
        0,
        '1996-08-01',
        2,
        5,
        'cwombwellk@google.nl',
        NULL,
        NULL
    ), (
        23,
        'Insoll',
        'Gael',
        '2010-08-18',
        '8rRhON',
        0,
        '1983-03-20',
        2,
        5,
        'ginsolll@wordpress.org',
        NULL,
        NULL
    ), (
        24,
        'Murrum',
        'Raychel',
        '2016-02-25',
        'YbbtGPczsY',
        0,
        '1980-09-05',
        2,
        5,
        'rmurrumm@diigo.com',
        NULL,
        NULL
    ), (
        25,
        'Meere',
        'Karalynn',
        '2021-09-08',
        'xCMhyfxTds',
        0,
        '1999-05-18',
        2,
        5,
        'kmeeren@mediafire.com',
        NULL,
        NULL
    ), (
        26,
        'Diment',
        'Kaila',
        '2020-11-27',
        '8KabkMD9UkhH',
        0,
        '1997-10-13',
        2,
        5,
        'kdimento@columbia.edu',
        NULL,
        NULL
    ), (
        27,
        'Tetlow',
        'Carol',
        '2011-12-20',
        'Xkjeh7cA',
        0,
        '1999-11-18',
        2,
        5,
        'ctetlowp@npr.org',
        NULL,
        NULL
    ), (
        28,
        'Cawkwell',
        'Sibyl',
        '2012-06-14',
        '6ILD1Un67U6d',
        0,
        '1973-07-19',
        2,
        5,
        'scawkwellq@rediff.com',
        NULL,
        NULL
    ), (
        29,
        'Macauley',
        'Lin',
        '2021-02-28',
        'HohrKcm',
        0,
        '2000-02-01',
        3,
        3,
        'lmacauleyr@ucoz.com',
        NULL,
        NULL
    ), (
        30,
        'Twydell',
        'Sonia',
        '2009-04-28',
        'VEQKeWh1mW',
        0,
        '1972-10-30',
        3,
        3,
        'stwydells@joomla.org',
        NULL,
        NULL
    ), (
        31,
        'Drage',
        'Venus',
        '2009-03-26',
        'AzugCrPMi',
        0,
        '2003-07-10',
        3,
        3,
        'vdraget@squidoo.com',
        NULL,
        NULL
    ), (
        32,
        'Lusgdin',
        'Brett',
        '2001-08-27',
        '8V4A507',
        0,
        '1971-03-18',
        3,
        3,
        'blusgdinu@wufoo.com',
        NULL,
        NULL
    ), (
        33,
        'Chrestien',
        'Flossi',
        '2012-10-12',
        '7h0lPR76',
        0,
        '1987-09-05',
        3,
        3,
        'fchrestienv@prnewswire.com',
        NULL,
        NULL
    ), (
        34,
        'MacTerrelly',
        'Elysha',
        '2016-11-28',
        'vfpvFHc',
        0,
        '1996-11-19',
        3,
        3,
        'emacterrellyw@nifty.com',
        NULL,
        NULL
    ), (
        35,
        'Arch',
        'Sherlocke',
        '2019-11-15',
        'a9nUvVrME',
        0,
        '1994-10-03',
        4,
        2,
        'sarchx@redcross.org',
        NULL,
        NULL
    ), (
        36,
        'Yatman',
        'Baldwin',
        '2022-06-11',
        'CKidFDeK',
        0,
        '1993-11-09',
        4,
        2,
        'byatmany@creativecommons.org',
        NULL,
        NULL
    ), (
        37,
        'Baynard',
        'Ollie',
        '2016-06-07',
        'ngRP3xL2YZn',
        0,
        '2000-09-08',
        4,
        2,
        'obaynardz@hibu.com',
        NULL,
        NULL
    ), (
        38,
        'Dincey',
        'Maggi',
        '2018-05-24',
        'qbafN6ScO50',
        0,
        '2003-11-27',
        4,
        2,
        'mdincey10@slashdot.org',
        NULL,
        NULL
    ), (
        39,
        'Voysey',
        'Editha',
        '2000-12-11',
        'YymmRq',
        0,
        '1971-05-06',
        4,
        2,
        'evoysey11@google.de',
        NULL,
        NULL
    ), (
        40,
        'Carden',
        'Chuck',
        '2018-11-15',
        'IfQOC7GXj',
        0,
        '1974-05-04',
        4,
        2,
        'ccarden12@sourceforge.net',
        NULL,
        NULL
    ), (
        41,
        'Robuchon',
        'Standford',
        '2015-02-26',
        'S58spB1sH',
        0,
        '1976-10-29',
        4,
        2,
        'srobuchon13@google.es',
        NULL,
        NULL
    ), (
        42,
        'Hollyland',
        'Hernando',
        '2020-07-18',
        'r4qDPcDlPt2Z',
        0,
        '1978-02-16',
        4,
        2,
        'hhollyland14@blogspot.com',
        NULL,
        NULL
    ), (
        43,
        'Pargeter',
        'Melany',
        '2006-03-18',
        'kSXaBeAnvX5x',
        1,
        '1984-09-20',
        5,
        6,
        'mpargeter15@fc2.com',
        NULL,
        NULL
    ), (
        44,
        'Dumper',
        'Sibella',
        '2014-05-14',
        'hclRJjN',
        1,
        '1988-05-03',
        5,
        6,
        'sdumper16@foxnews.com',
        NULL,
        NULL
    ), (
        45,
        'Clemits',
        'Tim',
        '2010-08-14',
        'UcMwScXr85j2',
        1,
        '1983-11-24',
        5,
        6,
        'tclemits17@mediafire.com',
        NULL,
        NULL
    ), (
        46,
        'Levet',
        'Mercy',
        '2014-02-16',
        'XOLCLTceD',
        1,
        '1999-11-10',
        5,
        6,
        'mlevet18@samsung.com',
        NULL,
        NULL
    ), (
        47,
        'Balk',
        'Sanderson',
        '2008-06-02',
        'qDxsnHgZk',
        1,
        '1973-02-23',
        5,
        6,
        'sbalk19@paginegialle.it',
        NULL,
        NULL
    ), (
        48,
        'Lanchberry',
        'Ashien',
        '2019-01-09',
        'sO7rtTG8Zt',
        0,
        '1980-08-12',
        6,
        1,
        'alanchberry1b@bandcamp.com',
        NULL,
        NULL
    ), (
        49,
        'Large',
        'Gav',
        '2019-02-11',
        'AoVLXzY0',
        0,
        '1973-01-28',
        6,
        1,
        'glarge1c@liveinternet.ru',
        NULL,
        NULL
    ), (
        50,
        'Hewkin',
        'Penn',
        '2001-10-11',
        'EaZAmtr7jS',
        0,
        '1992-01-14',
        6,
        1,
        'phewkin1d@drupal.org',
        NULL,
        NULL
    ), (
        51,
        'Bauchop',
        'Lorne',
        '2006-11-20',
        'm3pf50wbO',
        0,
        '1974-03-17',
        6,
        1,
        'lbauchop1e@sciencedirect.com',
        NULL,
        NULL
    ), (
        52,
        'Bailiss',
        'Burty',
        '2020-03-26',
        'PlHdHTRi7XB5',
        0,
        '1976-02-29',
        6,
        1,
        'bbailiss1f@miitbeian.gov.cn',
        NULL,
        NULL
    ), (
        53,
        'Parcells',
        'Marley',
        '2015-01-05',
        'NnroifZ',
        0,
        '1996-05-09',
        6,
        1,
        'mparcells1g@amazon.com',
        NULL,
        NULL
    ), (
        54,
        'Durward',
        'Wilhelmina',
        '2006-07-29',
        'oYKm0FXEf',
        0,
        '2001-12-12',
        6,
        1,
        'wdurward1h@ask.com',
        NULL,
        NULL
    ), (
        55,
        'Cuddehy',
        'Emanuel',
        '2000-09-15',
        '69aZaicCOU',
        0,
        '1981-07-22',
        6,
        7,
        'ecuddehy1i@ucoz.ru',
        NULL,
        NULL
    ), (
        56,
        'Roads',
        'Susann',
        '2017-10-02',
        '2jR4CtCSTW',
        0,
        '1985-09-04',
        7,
        1,
        'sroads1j@wikispaces.com',
        NULL,
        NULL
    ), (
        57,
        'Powys',
        'Hayward',
        '2022-04-30',
        'OIU2iOWhUh6',
        0,
        '1981-01-03',
        7,
        1,
        'hpowys1k@msn.com',
        NULL,
        NULL
    ), (
        58,
        'De Caville',
        'Mikey',
        '2010-11-10',
        'Z01r0JFaW7E',
        0,
        '1974-12-09',
        7,
        1,
        'mdecaville1l@delicious.com',
        NULL,
        NULL
    ), (
        59,
        'Eefting',
        'Deerdre',
        '2003-02-24',
        'I81yt8',
        0,
        '1972-05-09',
        7,
        1,
        'deefting1m@statcounter.com',
        NULL,
        NULL
    ), (
        60,
        'Campion',
        'Terence',
        '2006-03-03',
        'U9btNGFRsv',
        0,
        '1972-01-03',
        7,
        1,
        'tcampion1n@nhs.uk',
        NULL,
        NULL
    ), (
        61,
        'Osbiston',
        'Jilly',
        '2014-05-30',
        'zUpqk9HpJVP',
        0,
        '1994-04-25',
        7,
        1,
        'josbiston1o@pen.io',
        NULL,
        NULL
    ), (
        62,
        'Culleford',
        'Gawen',
        '2021-03-10',
        'xjoeB4X',
        0,
        '1992-02-10',
        7,
        1,
        'gculleford1p@paypal.com',
        NULL,
        NULL
    ), (
        63,
        'Mation',
        'Bert',
        '2017-05-11',
        'Q3SCHyUAkGK',
        0,
        '1975-05-03',
        7,
        1,
        'bmation1q@biglobe.ne.jp',
        NULL,
        NULL
    ), (
        64,
        'Cudiff',
        'Lisa',
        '2010-12-03',
        'P3AoWH9OtV',
        0,
        '1997-08-01',
        7,
        1,
        'lcudiff1r@dyndns.org',
        NULL,
        NULL
    ), (
        65,
        'Martygin',
        'Gwendolin',
        '2016-01-21',
        'BfSF87jlwr0h',
        0,
        '1995-11-02',
        7,
        1,
        'gmartygin1s@admin.ch',
        NULL,
        NULL
    ), (
        66,
        'Wilshire',
        'Theodora',
        '2005-04-20',
        'YA1B3aBuZTJ',
        0,
        '1977-09-04',
        7,
        1,
        'twilshire1t@msn.com',
        NULL,
        NULL
    ), (
        67,
        'Magnar',
        'Agnella',
        '2001-12-31',
        '0ebarP7cRq',
        0,
        '1990-04-13',
        7,
        1,
        'amagnar1u@macromedia.com',
        NULL,
        NULL
    ), (
        68,
        'Parchment',
        'Shurlock',
        '2003-06-25',
        'AqJqKSL5x0',
        0,
        '1974-11-30',
        8,
        7,
        'sparchment1v@spotify.com',
        NULL,
        NULL
    ), (
        69,
        'Bond',
        'Cherie',
        '2021-07-16',
        'fMgUcYqxE',
        0,
        '1980-12-12',
        8,
        1,
        'cbond1w@google.com.au',
        NULL,
        NULL
    ), (
        70,
        'Shackleton',
        'Merilyn',
        '2005-01-14',
        'yW2FI6f',
        0,
        '1992-01-12',
        8,
        1,
        'mshackleton1x@quantcast.com',
        NULL,
        NULL
    ), (
        71,
        'Thunderchief',
        'Ertha',
        '2013-03-01',
        'OqXZg8',
        0,
        '1981-12-26',
        8,
        1,
        'ethunderchief1y@nasa.gov',
        NULL,
        NULL
    ), (
        72,
        'Bartholomew',
        'Kirk',
        '2012-06-15',
        'xLhvtLwnBCs',
        0,
        '1995-08-31',
        9,
        1,
        'kbartholomew1z@dot.gov',
        NULL,
        NULL
    ), (
        73,
        'Eadington',
        'Magdalena',
        '2006-07-31',
        '9mFNFUN7',
        0,
        '1971-01-08',
        9,
        1,
        'meadington20@patch.com',
        NULL,
        NULL
    ), (
        74,
        'Dikelin',
        'Gayle',
        '2013-06-24',
        'NJnsJG9NB8',
        0,
        '1988-01-01',
        9,
        1,
        'gdikelin21@stumbleupon.com',
        NULL,
        NULL
    ), (
        75,
        'Flageul',
        'Selestina',
        '2007-04-21',
        'Sx7A5Es',
        0,
        '1975-06-18',
        9,
        1,
        'sflageul22@shareasale.com',
        NULL,
        NULL
    ), (
        76,
        'Dafforne',
        'Tiffy',
        '2002-12-06',
        'W4cvZq',
        0,
        '1990-05-16',
        9,
        1,
        'tdafforne23@imageshack.us',
        NULL,
        NULL
    ), (
        77,
        'Ewbanks',
        'Bernardina',
        '2016-08-24',
        'r4tsmBRnFM',
        0,
        '1997-05-21',
        9,
        1,
        'bewbanks24@usatoday.com',
        NULL,
        NULL
    ), (
        78,
        'Grubbe',
        'Sarah',
        '2020-12-25',
        'KxMUMYJ5',
        1,
        '1998-02-11',
        11,
        4,
        'sgrubbe25@google.nl',
        NULL,
        NULL
    ), (
        79,
        'Dumpleton',
        'Wyndham',
        '2001-12-03',
        'gGvoW2cK',
        1,
        '1972-07-26',
        11,
        4,
        'wdumpleton26@google.fr',
        NULL,
        NULL
    ), (
        80,
        'Attridge',
        'Florie',
        '2007-08-25',
        'Dk6Yqd5d',
        1,
        '2004-08-13',
        11,
        4,
        'fattridge27@hp.com',
        NULL,
        NULL
    ), (
        81,
        'Rostern',
        'Xylina',
        '2020-02-20',
        'jLHoPHNQDp21',
        1,
        '1996-02-07',
        11,
        4,
        'xrostern28@xrea.com',
        NULL,
        NULL
    ), (
        82,
        'Gruszka',
        'Hunt',
        '2008-09-21',
        'VoCyiFMwOYo9',
        0,
        '1974-04-06',
        12,
        7,
        'hgruszka29@fema.gov',
        NULL,
        NULL
    ), (
        83,
        'Tisor',
        'Maggy',
        '2022-04-21',
        'sombOLRLJwv3',
        0,
        '2000-06-22',
        12,
        1,
        'mtisor2a@youtu.be',
        NULL,
        NULL
    ), (
        84,
        'Veljes',
        'Gui',
        '2017-03-24',
        'HlLFdf',
        0,
        '1974-08-09',
        12,
        1,
        'gveljes2b@ibm.com',
        NULL,
        NULL
    ), (
        85,
        'Cretney',
        'Sarine',
        '2002-11-13',
        'CbgFjg31X9z',
        0,
        '1989-05-27',
        12,
        1,
        'scretney2c@time.com',
        NULL,
        NULL
    ), (
        91,
        'eliot',
        'Kel',
        '2020-04-29',
        '$2a$12$0SqUblM4zPHxzFu83Up8FOrz6ue6S2tuwx92zL5xM2d5bll4jWlaS',
        0,
        '2000-09-01',
        9,
        2,
        'mach@huffingtonpost.com',
        NULL,
        NULL
    ), (
        92,
        'Stark',
        'Tony',
        '2020-04-29',
        '$2a$12$0SqUblM4zPHxzFu83Up8FOl6QKq3NY4YpKvuZ8XdvqLTx1HttRoNq',
        1,
        '2000-09-01',
        9,
        2,
        'popperpots@huffingtonpost.com',
        NULL,
        NULL
    );

/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */

;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */

;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */

;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */

;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */

;

-- Dump completed on 2023-01-26 12:07:04