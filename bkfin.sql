-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 04 mai 2022 à 01:01
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bkfin`
--

-- --------------------------------------------------------

--
-- Structure de la table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `rib` varchar(23) NOT NULL,
  `sold` bigint(20) DEFAULT NULL,
  `open_date` date DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `type_account` varchar(255) DEFAULT NULL,
  `interest` float NOT NULL,
  `index_interest` int(11) NOT NULL,
  `client_acc_id` bigint(20) DEFAULT NULL,
  `client_acc_cin` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rib`),
  KEY `FKrnpm3yinen53uucyyrtte9pqi` (`client_acc_cin`),
  KEY `FKbxkotxdkj0wqjj7huyi62mre3` (`client_acc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2837 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `account`
--

INSERT INTO `account` (`rib`, `sold`, `open_date`, `state`, `type_account`, `interest`, `index_interest`, `client_acc_id`, `client_acc_cin`) VALUES
('0192000410V0RPZWLP6LW15', 312665, '2022-04-24', b'1', 'SAVINGSACCOUNT', 2222.42, 51, 1, NULL),
('0192000410OQRFM6DDMVR71', 1900, NULL, b'1', 'SAVINGSACCOUNT', 18.0422, 68, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `account_accountt`
--

DROP TABLE IF EXISTS `account_accountt`;
CREATE TABLE IF NOT EXISTS `account_accountt` (
  `accounts_rib` bigint(20) NOT NULL,
  `accountt_id_transaction` bigint(20) NOT NULL,
  PRIMARY KEY (`accounts_rib`,`accountt_id_transaction`),
  KEY `FK2d565cw7txwu6ejhheejjrydi` (`accountt_id_transaction`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth_day` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` bigint(20) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `birth_day`, `email`, `name`, `phone_num`, `second_name`, `password`) VALUES
(1, NULL, 'ahmed.kalai@esprit.tn', 'salut', 21212121, 'et toi', 'aissa');

-- --------------------------------------------------------

--
-- Structure de la table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE IF NOT EXISTS `admin_roles` (
  `admin_id_admin` bigint(20) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id_admin`,`roles_id`),
  KEY `FK1tckqbr9482dxy81bwk6qevln` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin_roles`
--

INSERT INTO `admin_roles` (`admin_id_admin`, `roles_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `id_agent` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `localisation` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` bigint(20) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `admin_id_admin` bigint(20) DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `full_location` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT NULL,
  `performance` varchar(255) DEFAULT NULL,
  `potentiel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_agent`),
  KEY `FKowbiu8u59fug8q56fpgmqwm33` (`admin_id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`id_agent`, `adresse`, `email`, `localisation`, `name`, `phone_num`, `second_name`, `admin_id_admin`, `state`, `ip_address`, `full_location`, `latitude`, `longitude`, `password`, `classification`, `performance`, `potentiel`) VALUES
(1, 'marsa', 'aa@aa.com', 87456, 'amine', 54080423, 'swiden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'aaaa', 'amine.swiden@esprit.tn', 5555, 'ddd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'amine', NULL, NULL, NULL),
(3, 'tunis', NULL, NULL, 'agent111', NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `agent_event`
--

DROP TABLE IF EXISTS `agent_event`;
CREATE TABLE IF NOT EXISTS `agent_event` (
  `agent_id_agent` bigint(20) NOT NULL,
  `event_id_event` bigint(20) NOT NULL,
  PRIMARY KEY (`agent_id_agent`,`event_id_event`),
  KEY `FKvcfxvgi0dylb2fpjj4ok6w1e` (`event_id_event`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `agent_roles`
--

DROP TABLE IF EXISTS `agent_roles`;
CREATE TABLE IF NOT EXISTS `agent_roles` (
  `agent_id_agent` bigint(20) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`agent_id_agent`,`roles_id`),
  KEY `FKqi3qpfw9b4clr59ktlts6tcbs` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agent_roles`
--

INSERT INTO `agent_roles` (`agent_id_agent`, `roles_id`) VALUES
(2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_execution`
--

DROP TABLE IF EXISTS `batch_job_execution`;
CREATE TABLE IF NOT EXISTS `batch_job_execution` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime(6) NOT NULL,
  `START_TIME` datetime(6) DEFAULT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime(6) DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_execution_context`
--

DROP TABLE IF EXISTS `batch_job_execution_context`;
CREATE TABLE IF NOT EXISTS `batch_job_execution_context` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_execution_params`
--

DROP TABLE IF EXISTS `batch_job_execution_params`;
CREATE TABLE IF NOT EXISTS `batch_job_execution_params` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `TYPE_CD` varchar(6) NOT NULL,
  `KEY_NAME` varchar(100) NOT NULL,
  `STRING_VAL` varchar(250) DEFAULT NULL,
  `DATE_VAL` datetime(6) DEFAULT NULL,
  `LONG_VAL` bigint(20) DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) NOT NULL,
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_execution_seq`
--

DROP TABLE IF EXISTS `batch_job_execution_seq`;
CREATE TABLE IF NOT EXISTS `batch_job_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batch_job_execution_seq`
--

INSERT INTO `batch_job_execution_seq` (`ID`, `UNIQUE_KEY`) VALUES
(0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_instance`
--

DROP TABLE IF EXISTS `batch_job_instance`;
CREATE TABLE IF NOT EXISTS `batch_job_instance` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_KEY` varchar(32) NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_job_seq`
--

DROP TABLE IF EXISTS `batch_job_seq`;
CREATE TABLE IF NOT EXISTS `batch_job_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batch_job_seq`
--

INSERT INTO `batch_job_seq` (`ID`, `UNIQUE_KEY`) VALUES
(0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `batch_step_execution`
--

DROP TABLE IF EXISTS `batch_step_execution`;
CREATE TABLE IF NOT EXISTS `batch_step_execution` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `STEP_NAME` varchar(100) NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime(6) NOT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `COMMIT_COUNT` bigint(20) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `FILTER_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_COUNT` bigint(20) DEFAULT NULL,
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_step_execution_context`
--

DROP TABLE IF EXISTS `batch_step_execution_context`;
CREATE TABLE IF NOT EXISTS `batch_step_execution_context` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `batch_step_execution_seq`
--

DROP TABLE IF EXISTS `batch_step_execution_seq`;
CREATE TABLE IF NOT EXISTS `batch_step_execution_seq` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `batch_step_execution_seq`
--

INSERT INTO `batch_step_execution_seq` (`ID`, `UNIQUE_KEY`) VALUES
(0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
CREATE TABLE IF NOT EXISTS `chat_message` (
  `idm` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`idm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cin` bigint(20) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `birth_day` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` bigint(20) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `agent_id_agent` bigint(20) DEFAULT NULL,
  `credit_authorization` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK443fxtq0n3y0lc4pj10gako4x` (`agent_id_agent`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `cin`, `adresse`, `birth_day`, `email`, `image`, `name`, `phone_num`, `second_name`, `agent_id_agent`, `credit_authorization`, `password`) VALUES
(1, NULL, '555', NULL, 'emna.lazzez@esprit.tn', 'kkk', 'yassine', NULL, NULL, 1, b'0', 'emna'),
(3, NULL, '555', NULL, 'ahmed@esprit.tn', 'kkk', 'ahmed', NULL, NULL, 1, b'0', 'emna'),
(4, NULL, '555', NULL, 'ahmed@esprit.tn', 'kkk', 'bechir', NULL, NULL, 1, NULL, 'emna'),
(5, NULL, '555', NULL, 'emna.lazzez@esprit.tn', 'kkk', 'amine', NULL, NULL, 1, NULL, 'emna');

-- --------------------------------------------------------

--
-- Structure de la table `client_roles`
--

DROP TABLE IF EXISTS `client_roles`;
CREATE TABLE IF NOT EXISTS `client_roles` (
  `client_id` bigint(20) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`roles_id`),
  KEY `FKsgkujj8649e59exwr5rlu1p0` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client_roles`
--

INSERT INTO `client_roles` (`client_id`, `roles_id`) VALUES
(2, 1),
(5, 4);

-- --------------------------------------------------------

--
-- Structure de la table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
CREATE TABLE IF NOT EXISTS `complaint` (
  `id_complaint` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_complaint` date DEFAULT NULL,
  `information_text` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `clientcomp_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_complaint`),
  KEY `FKcvla5q9kfguf3gj62p14g3mi8` (`clientcomp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `complaint`
--

INSERT INTO `complaint` (`id_complaint`, `date_complaint`, `information_text`, `object`, `state`, `clientcomp_id`) VALUES
(46, '2022-04-28', 'bechir', 'fuck', b'1', 1),
(47, '2022-04-28', '****', 'bechir', b'1', 1),
(54, '2022-04-28', '****', 'bechir', b'1', 1),
(49, '2022-04-28', '****', 'bechir', b'1', 1),
(50, '2022-04-28', '****', 'fuck', b'0', 1),
(51, '2022-04-28', '****', 'fuck', b'0', 1),
(52, '2022-04-28', 'shit', 'infini', b'0', 1),
(53, '2022-04-28', '****', 'infini', b'0', 1),
(55, '2022-04-28', '****', '123456', b'0', 1),
(43, '2022-04-24', '****', 'jliidiii', b'0', 1),
(44, '2022-04-24', '****', 'jliidiii', b'0', 1),
(56, '2022-04-30', 'salut', 'cava', b'0', 1),
(57, '2022-04-30', 'Meriam', 'marieem', b'0', 1),
(58, '2022-04-30', 'aaaa', 'aaa', b'0', 1),
(59, '2022-05-04', 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaccccc', b'0', 1);

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

DROP TABLE IF EXISTS `credit`;
CREATE TABLE IF NOT EXISTS `credit` (
  `id_credit` bigint(20) NOT NULL AUTO_INCREMENT,
  `risk` float NOT NULL,
  `amount` float DEFAULT NULL,
  `credit_period` float NOT NULL,
  `date_demande` date DEFAULT NULL,
  `interest_rate` float NOT NULL,
  `monthly_payment_amount` float DEFAULT NULL,
  `monthly_payment_date` date DEFAULT NULL,
  `obtaining_date` date DEFAULT NULL,
  `state` bit(1) DEFAULT NULL,
  `funds_id_fund` bigint(20) DEFAULT NULL,
  `pack_credit_id_pack` bigint(20) DEFAULT NULL,
  `completed` bit(1) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `diff_period` float DEFAULT NULL,
  `différé` bit(1) DEFAULT NULL,
  `differe` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_credit`),
  KEY `FKsppfvdwdkxqtusccsjrgjd08b` (`client_id`),
  KEY `FKbwn87vvbwp9jejo331a6uaasa` (`funds_id_fund`),
  KEY `FKid4h85682655coc4msfvq6buf` (`pack_credit_id_pack`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `credit`
--

INSERT INTO `credit` (`id_credit`, `risk`, `amount`, `credit_period`, `date_demande`, `interest_rate`, `monthly_payment_amount`, `monthly_payment_date`, `obtaining_date`, `state`, `funds_id_fund`, `pack_credit_id_pack`, `completed`, `reason`, `client_id`, `diff_period`, `différé`, `differe`) VALUES
(88, 0.015, 1000, 1, '2022-05-03', 0.195, 92.3953, '2022-05-03', '2022-05-03', b'1', 1, 1, b'1', 'NouveauClient avec garant certifié', 3, 0, NULL, b'0'),
(90, 0.1, 1000, 1, '2022-05-03', 0.28, 96.5061, '2022-05-03', '2022-05-03', b'1', 1, 1, b'0', 'Ancien client avec un BON risque ', 3, 0, NULL, b'0'),
(91, 0, 100, 1, '2022-05-03', 0, 0, '2022-05-03', NULL, b'0', 1, 1, NULL, 'Interdiction de Crédit', 3, 0, NULL, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `dues_history`
--

DROP TABLE IF EXISTS `dues_history`;
CREATE TABLE IF NOT EXISTS `dues_history` (
  `id_dues` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_history` date DEFAULT NULL,
  `credits_id_credit` bigint(20) DEFAULT NULL,
  `supposed_date` date DEFAULT NULL,
  PRIMARY KEY (`id_dues`),
  KEY `FKa07tt0le2ugf5el6jd4e3eg5a` (`credits_id_credit`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dues_history`
--

INSERT INTO `dues_history` (`id_dues`, `date_history`, `credits_id_credit`, `supposed_date`) VALUES
(53, '2022-08-03', 88, '2022-08-03'),
(57, '2022-12-03', 88, '2022-12-03'),
(52, '2022-07-03', 88, '2022-07-03'),
(56, '2022-11-03', 88, '2022-11-03'),
(55, '2022-10-03', 88, '2022-10-03'),
(54, '2022-09-03', 88, '2022-09-03'),
(51, '2022-06-03', 88, '2022-06-03'),
(50, '2022-05-03', 88, '2022-05-03'),
(58, '2023-01-03', 88, '2023-01-03'),
(64, '2023-04-03', 88, '2023-04-03'),
(63, '2023-03-03', 88, '2023-03-03'),
(62, '2023-02-03', 88, '2023-02-03'),
(65, '2022-05-10', 90, '2022-05-03'),
(66, '2022-05-12', 90, '2022-06-03');

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id_event` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_event` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name_event` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_event`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event`
--

INSERT INTO `event` (`id_event`, `date_event`, `description`, `name_event`, `region`) VALUES
(1, '2022-05-04', 'testtt', 'test', 'test'),
(4, '2022-05-27', 'HELOOOOO', 'TEST', 'ARIANA'),
(5, '2022-05-27', 'comeeeeeeeeeeeeeeeeeentt', 'event1', 'TUnis');

-- --------------------------------------------------------

--
-- Structure de la table `event_agent`
--

DROP TABLE IF EXISTS `event_agent`;
CREATE TABLE IF NOT EXISTS `event_agent` (
  `event_id_event` bigint(20) NOT NULL,
  `agent_id_agent` bigint(20) NOT NULL,
  PRIMARY KEY (`event_id_event`,`agent_id_agent`),
  KEY `FKqmogrb4xem6b7fg7nqh2lmabb` (`agent_id_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `event_agent`
--

INSERT INTO `event_agent` (`event_id_event`, `agent_id_agent`) VALUES
(5, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fund`
--

DROP TABLE IF EXISTS `fund`;
CREATE TABLE IF NOT EXISTS `fund` (
  `id_fund` bigint(20) NOT NULL AUTO_INCREMENT,
  `amount_fund` float NOT NULL,
  `taux_fund` float NOT NULL,
  `taux_gain` float NOT NULL,
  PRIMARY KEY (`id_fund`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fund`
--

INSERT INTO `fund` (`id_fund`, `amount_fund`, `taux_fund`, `taux_gain`) VALUES
(1, 700000, 0.12, 0);

-- --------------------------------------------------------

--
-- Structure de la table `garantor`
--

DROP TABLE IF EXISTS `garantor`;
CREATE TABLE IF NOT EXISTS `garantor` (
  `id_garantor` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_garantor` varchar(255) DEFAULT NULL,
  `salary_garantor` float DEFAULT NULL,
  `secondname_garantor` varchar(255) DEFAULT NULL,
  `work_garantor` varchar(255) DEFAULT NULL,
  `credit_id_credit` bigint(20) DEFAULT NULL,
  `urlimage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_garantor`),
  KEY `FK9lpyavb54b2n77f7xwm9iky2x` (`credit_id_credit`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `garantor`
--

INSERT INTO `garantor` (`id_garantor`, `name_garantor`, `salary_garantor`, `secondname_garantor`, `work_garantor`, `credit_id_credit`, `urlimage`) VALUES
(108, 'ahmed', 1000, NULL, 'DIRECTEUR FINANCIER ', NULL, 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651584195/fiche_2.png1651584191366.png'),
(109, 'bechir', 2000, NULL, 'DIRECTEUR FINANCIER ', NULL, 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651589011/fiche_3.png1651589007151.png'),
(110, 'KALAI AHMED ', 2000, NULL, 'DIRECTEUR FINANCIER ', NULL, 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651590963/fiche_3.png1651590957905.png'),
(111, 'KALAI AHMED ', 2000, NULL, 'DIRECTEUR FINANCIER ', NULL, 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651613159/fiche_3.png1651613154802.png');

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(5);

-- --------------------------------------------------------

--
-- Structure de la table `investesment`
--

DROP TABLE IF EXISTS `investesment`;
CREATE TABLE IF NOT EXISTS `investesment` (
  `id_investesment` bigint(20) NOT NULL AUTO_INCREMENT,
  `amout_investesment` float NOT NULL,
  `cin_investesment` bigint(20) NOT NULL,
  `final_amount` float NOT NULL,
  `mail_investesment` varchar(255) DEFAULT NULL,
  `name_investesment` varchar(255) DEFAULT NULL,
  `profession_investesment` varchar(255) DEFAULT NULL,
  `secondnname_investesment` varchar(255) DEFAULT NULL,
  `state` bit(1) NOT NULL,
  `taux_inves` float NOT NULL,
  `fund_id_fund` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_investesment`),
  KEY `FKjmnk1id99urxdm7i42v73622m` (`fund_id_fund`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `investesment`
--

INSERT INTO `investesment` (`id_investesment`, `amout_investesment`, `cin_investesment`, `final_amount`, `mail_investesment`, `name_investesment`, `profession_investesment`, `secondnname_investesment`, `state`, `taux_inves`, `fund_id_fund`) VALUES
(5, 700000, 527745, 784000, 'ahmed.paparazzi@gmail.com', 'Name1', 'Profession', 'SecondName', b'0', 0.12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id_notification` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_notif` date DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `credit_id_credit` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_notification`),
  KEY `FKt6ap4rpfygommlr0qjipej6nc` (`credit_id_credit`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id_notification`, `date_notif`, `object`, `credit_id_credit`) VALUES
(59, '2022-05-04', 'you have two days left to pay your payment', 88);

-- --------------------------------------------------------

--
-- Structure de la table `pack`
--

DROP TABLE IF EXISTS `pack`;
CREATE TABLE IF NOT EXISTS `pack` (
  `id_pack` bigint(20) NOT NULL AUTO_INCREMENT,
  `description_pack` varchar(255) DEFAULT NULL,
  `image_pack` varchar(255) DEFAULT NULL,
  `pack_type` varchar(255) DEFAULT NULL,
  `secteur_pack` varchar(255) DEFAULT NULL,
  `state_pack` bit(1) DEFAULT NULL,
  `pricep` float DEFAULT NULL,
  PRIMARY KEY (`id_pack`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pack`
--

INSERT INTO `pack` (`id_pack`, `description_pack`, `image_pack`, `pack_type`, `secteur_pack`, `state_pack`, `pricep`) VALUES
(1, 'pack1', NULL, NULL, NULL, NULL, NULL),
(25, 'z', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651600245/hjcv.jpg1651600247506.jpg', 'ahmiddd', 'a', NULL, 93.93),
(24, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539510/hjcv.jpg1651539513992.jpg', 'agriculture', 'agriculture', b'1', 59.52),
(21, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539450/hjcv.jpg1651539454453.jpg', 'agriculture', 'agriculture', b'1', 62.31),
(22, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539459/hjcv.jpg1651539463483.jpg', 'agriculture', 'agriculture', b'1', 62.31),
(23, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539501/hjcv.jpg1651539504789.jpg', 'agriculture', 'agriculture', b'1', 59.52),
(19, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539428/hjcv.jpg1651539431955.jpg', 'agriculture', 'agriculture', b'1', 62.31),
(18, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651537431/hjcv.jpg1651537434637.jpg', 'agriculture', 'agriculture', b'1', 61.38),
(20, 'vous trouverez tout ce que vous souhaitez', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539441/hjcv.jpg1651539445624.jpg', 'agriculture', 'agriculture', b'1', 62.31);

-- --------------------------------------------------------

--
-- Structure de la table `pack_product_pack`
--

DROP TABLE IF EXISTS `pack_product_pack`;
CREATE TABLE IF NOT EXISTS `pack_product_pack` (
  `packs_id_pack` bigint(20) NOT NULL,
  `product_pack_id_product` bigint(20) NOT NULL,
  PRIMARY KEY (`packs_id_pack`,`product_pack_id_product`),
  KEY `FK1vd38mhlcy6y1668rnmbiyvu` (`product_pack_id_product`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pack_product_pack`
--

INSERT INTO `pack_product_pack` (`packs_id_pack`, `product_pack_id_product`) VALUES
(25, 28);

-- --------------------------------------------------------

--
-- Structure de la table `partner`
--

DROP TABLE IF EXISTS `partner`;
CREATE TABLE IF NOT EXISTS `partner` (
  `partner` bigint(20) NOT NULL AUTO_INCREMENT,
  `activite_partner` varchar(255) DEFAULT NULL,
  `logo_partner` varchar(255) DEFAULT NULL,
  `name_partner` varchar(255) DEFAULT NULL,
  `price_partner` float DEFAULT NULL,
  `sector_partner` varchar(255) DEFAULT NULL,
  `url_partner` varchar(255) DEFAULT NULL,
  `email_partner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`partner`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `partner`
--

INSERT INTO `partner` (`partner`, `activite_partner`, `logo_partner`, `name_partner`, `price_partner`, `sector_partner`, `url_partner`, `email_partner`) VALUES
(1, 'services', 'https://res.cloudinary.com/dlw3w0bei/image/upload/v1651539441/hjcv.jpg1651539445624.jpg', 'wiki', NULL, 'Electroménager et cuisine', 'https://www.wiki.tn/c/electromenager-cuisine--504.html', 'yassine.benzekri@esprit.tn');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_product` varchar(255) DEFAULT NULL,
  `value_product` float DEFAULT NULL,
  `partner_product_partner` bigint(20) DEFAULT NULL,
  `valueexc` float DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FKc3ijeoa1ll2nml6dwih06xwy0` (`partner_product_partner`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_product`, `name_product`, `value_product`, `partner_product_partner`, `valueexc`) VALUES
(23, 'Balance de Cuisine KIWI - KKS-1123 - Rouge', 39, 1, NULL),
(24, 'CUISEUR A OEUFS SINBO - SEB-5803 - Noir', 39, 1, NULL),
(25, 'Moulin a Epices Electrique KIWI - KSPG-4806 - Inox', 45, 1, NULL),
(26, 'Pese personne Aprilla - ABS-1028 - Noir', 46, 1, NULL),
(27, 'Batteur a Main KIWI - KMX-3608 - Blanc', 49, 1, NULL),
(28, 'Bouilloire KIWI - KK-3325P - Blanc', 49, 1, NULL),
(33, 'PAQUET DE 10 CAPSULES INTENSO COMPATIBLE CAFFITALY', 17, 1, NULL),
(34, 'PAQUET DE 10 CAPSULES CAFFITALY BRASILE', 29, 1, NULL),
(35, 'EPILATEUR ELECTRIQUE - APRILLA - AEP-7803 - Blanc', 30, 1, NULL),
(36, 'Filtre a Charbon FOCUS pour hotte F601', 35, 1, NULL),
(37, 'Machine a Cafe Turque SINBO - SCM-2928 - Beige / Marron', 37, 1, NULL),
(38, 'Balance de Cuisine KIWI - KKS-1123 - Rouge', 39, 1, NULL),
(39, 'CUISEUR A OEUFS SINBO - SEB-5803 - Noir', 39, 1, NULL),
(40, 'Moulin a Epices Electrique KIWI - KSPG-4806 - Inox', 45, 1, NULL),
(41, 'Pese personne Aprilla - ABS-1028 - Noir', 46, 1, NULL),
(42, 'Batteur a Main KIWI - KMX-3608 - Blanc', 49, 1, NULL),
(43, 'Bouilloire KIWI - KK-3325P - Blanc', 49, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 1),
(2, 0),
(3, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id_transaction` bigint(20) NOT NULL AUTO_INCREMENT,
  `rib_emetteur` varchar(255) DEFAULT NULL,
  `rib_recipient` varchar(255) DEFAULT NULL,
  `amount` float NOT NULL,
  `date_transaction` date DEFAULT NULL,
  `compte_bancaire_rib` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `FKk0b8ltvl63ts1inpmpwr5su1m` (`compte_bancaire_rib`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `rib_emetteur`, `rib_recipient`, `amount`, `date_transaction`, `compte_bancaire_rib`) VALUES
(1, 'kikiki', 'kikiki', 3, '2022-04-29', 'kikiki'),
(2, NULL, NULL, 3, NULL, NULL),
(3, 'kikiki', 'kikiki', 3, '2022-04-29', 'kikiki'),
(4, 'kikiki', 'kikiki', 3, '2022-04-29', 'kikiki'),
(5, 'kikiki', 'kikiki', 12, '2022-04-29', 'kikiki'),
(6, 'kikiki', 'kikiki', 1, '2022-04-30', 'kikiki'),
(7, 'kikiki', 'kikiki', 1, '2022-04-30', 'kikiki'),
(8, '0192000410V0RPZWLP6LW15', 'kikiki', 8, '2022-05-03', '0192000410V0RPZWLP6LW15'),
(9, '0192000410V0RPZWLP6LW15', 'kikiki', 1, NULL, NULL),
(10, '0192000410V0RPZWLP6LW15', 'kikiki', 3, NULL, NULL),
(11, '0192000410V0RPZWLP6LW15', 'kikiki', 2, NULL, NULL),
(12, '0192000410V0RPZWLP6LW15', 'kikiki', 2, NULL, NULL),
(13, '0192000410V0RPZWLP6LW15', 'kikiki', 3, NULL, NULL),
(14, '0192000410V0RPZWLP6LW15', 'kikiki', 23, NULL, NULL),
(15, '0192000410V0RPZWLP6LW15', 'kikiki', 12, NULL, NULL),
(16, '0192000410V0RPZWLP6LW15', 'kikiki', 2, NULL, NULL),
(17, '0192000410OQRFM6DDMVR71', '0192000410V0RPZWLP6LW15', 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `unemployedpopulation`
--

DROP TABLE IF EXISTS `unemployedpopulation`;
CREATE TABLE IF NOT EXISTS `unemployedpopulation` (
  `population_id` bigint(20) NOT NULL,
  `between_1km_2km` bigint(20) DEFAULT NULL,
  `distribution_of_population` bigint(20) DEFAULT NULL,
  `inactive_population` bigint(20) DEFAULT NULL,
  `plus2km` bigint(20) DEFAULT NULL,
  `population_aged_15_and_plus` bigint(20) DEFAULT NULL,
  `regions` varchar(255) DEFAULT NULL,
  `sexe` varchar(255) DEFAULT NULL,
  `unemployed_15_19_years_age` bigint(20) DEFAULT NULL,
  `unemployed_20_24_years_age` bigint(20) DEFAULT NULL,
  `unemployed_25_29_years_age` bigint(20) DEFAULT NULL,
  `unemployed_30_34_years_age` bigint(20) DEFAULT NULL,
  `unemployed_35_39_years_age` bigint(20) DEFAULT NULL,
  `unemployed_40_44_years_age` bigint(20) DEFAULT NULL,
  `unemployed_45_49_years_age` bigint(20) DEFAULT NULL,
  `unemployed_50_59_years_age` bigint(20) DEFAULT NULL,
  `unemployed_60plus_years` bigint(20) DEFAULT NULL,
  `unemployed_agriculture_fishing` bigint(20) DEFAULT NULL,
  `unemployed_building_public_works` bigint(20) DEFAULT NULL,
  `unemployed_commerce` bigint(20) DEFAULT NULL,
  `unemployed_education_health_administrative_services` bigint(20) DEFAULT NULL,
  `unemployed_mines_energy` bigint(20) DEFAULT NULL,
  `unemployed_néant` bigint(20) DEFAULT NULL,
  `unemployed_other_services` bigint(20) DEFAULT NULL,
  `unemployed_primary` bigint(20) DEFAULT NULL,
  `unemployed_secondary` bigint(20) DEFAULT NULL,
  `unemployed_transport` bigint(20) DEFAULT NULL,
  `unemployed_undeclared` bigint(20) DEFAULT NULL,
  `unemployed_faculty` bigint(20) DEFAULT NULL,
  `unemployed_manufacturing_industry` bigint(20) DEFAULT NULL,
  `unemployment_rate` float DEFAULT NULL,
  `active_population_occupied` bigint(20) DEFAULT NULL,
  `activity_rate` float DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `less_than_1km` bigint(20) DEFAULT NULL,
  `number_houses` bigint(20) DEFAULT NULL,
  `unemployed_neant` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`population_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `unemployedpopulation`
--

INSERT INTO `unemployedpopulation` (`population_id`, `between_1km_2km`, `distribution_of_population`, `inactive_population`, `plus2km`, `population_aged_15_and_plus`, `regions`, `sexe`, `unemployed_15_19_years_age`, `unemployed_20_24_years_age`, `unemployed_25_29_years_age`, `unemployed_30_34_years_age`, `unemployed_35_39_years_age`, `unemployed_40_44_years_age`, `unemployed_45_49_years_age`, `unemployed_50_59_years_age`, `unemployed_60plus_years`, `unemployed_agriculture_fishing`, `unemployed_building_public_works`, `unemployed_commerce`, `unemployed_education_health_administrative_services`, `unemployed_mines_energy`, `unemployed_néant`, `unemployed_other_services`, `unemployed_primary`, `unemployed_secondary`, `unemployed_transport`, `unemployed_undeclared`, `unemployed_faculty`, `unemployed_manufacturing_industry`, `unemployment_rate`, `active_population_occupied`, `activity_rate`, `environment`, `less_than_1km`, `number_houses`, `unemployed_neant`) VALUES
(1, 435075, 987764, 945506, 918174, 2801915, 'Tunisie', 'Masculin', 2242, 17962, 49851, 57481, 32978, 15751, 9191, 6663, 8970, 103440, 258838, 265144, 116202, 76872, 68275, 399366, 27092, 8260, 273069, 222730, 46333, 40034, 10.88, 1654497, 66.26, 'Communal', 476479, 1829728, NULL),
(2, 435075, 902500, 1937637, 918174, 2868917, 'Tunisie', 'Féminin', 1657, 8928, 37626, 67264, 43677, 20299, 9749, 5757, 4775, 68275, 214365, 5646, 10399, 11847, 9653, 299597, 305605, 8870, 70213, 112047, 27092, 6157, 305605, 731928, 32.46, 'Communal', 476479, 1829728, NULL),
(3, 435075, 582060, 467820, 918174, 1290817, 'Tunisie', 'Masculin', 805, 13725, 23281, 22833, 14600, 9116, 5658, 4772, 7419, 41684, 65547, 202675, 33000, 194783, 20652, 95487, 14516, 14400, 77592, 39447, 35939, 9430, 12.66, 718766, 63.76, 'Rural', 476479, 1829728, NULL),
(4, 435075, 442444, 1091988, 918174, 1350582, 'Tunisie', 'Féminin', 475, 6825, 15513, 20757, 11804, 5721, 2935, 1867, 1755, 20652, 64048, 3074, 1023, 62579, 1220, 33716, 50506, 9037, 12162, 12950, 14516, 747, 50506, 190774, 19.15, 'Rural', 476479, 1829728, NULL),
(5, 286628, 432720, 89869, 443309, 221718, 'Nord_Est', 'Masculin', 916, 7699, 22768, 26160, 15028, 7242, 4501, 3220, 4098, 49323, 130202, 111617, 60992, 30793, 32459, 185536, 11531, 3111, 132215, 119564, 20875, 17221, 12.74, 115056, 59.47, 'Communal', 355396, 1085333, NULL),
(6, 286628, 395595, 113847, 443309, 169197, 'Nord_Est', 'Féminin', 723, 3995, 16570, 27951, 18072, 8692, 4405, 2635, 2160, 32459, 107639, 2949, 6770, 5805, 4996, 149643, 171496, 3015, 38065, 69546, 11531, 3373, 171496, 45500, 32.71, 'Communal', 355396, 1085333, NULL),
(7, 286628, 131314, 37595, 443309, 99458, 'Nord_Est', 'Masculin', 143, 2980, 5211, 4623, 2863, 1655, 1046, 865, 1233, 9532, 28529, 37941, 9800, 50601, 4789, 20859, 3083, 2507, 17739, 13367, 6990, 3081, 11.6, 54685, 62.2, 'Rural', 355396, 1085333, NULL),
(8, 286628, 100244, 70318, 443309, 91935, 'Nord_Est', 'Féminin', 105, 1556, 3251, 3869, 2249, 1221, 694, 456, 394, 4789, 32369, 567, 416, 14057, 200, 9325, 19556, 1826, 5394, 5220, 3083, 246, 19556, 17163, 23.51, 'Rural', 355396, 1085333, NULL),
(9, 54116, 124426, 142802, 12036, 415092, 'Tunis', 'Masculin', 290, 2306, 7247, 8603, 5189, 2597, 1706, 1260, 1479, 16749, 28718, 26635, 21939, 1936, 11719, 64020, 3908, 932, 46266, 45228, 6925, 6457, 11.31, 241489, 65.6, 'Communal', 277196, 343348, NULL),
(10, 54116, 115423, 273225, 12036, 422505, 'Tunis', 'Féminin', 231, 1316, 5413, 8770, 5747, 2918, 1556, 954, 824, 11719, 20328, 1027, 2642, 287, 2619, 53845, 58872, 831, 13199, 28604, 3908, 1393, 58872, 121556, 35.33, 'Communal', 277196, 343348, NULL),
(11, 1948, 2105, 3819, 570, 9488, 'Carthage', 'Masculin', 5, 31, 131, 161, 85, 38, 30, 22, 8, 271, 404, 456, 324, 88, 186, 1695, 52, 14, 675, 1301, 63, 206, 9.08, 5154, 59.75, 'Communal', 5727, 8245, NULL),
(12, 1948, 2181, 6916, 570, 10198, 'Carthage', 'Féminin', 1, 15, 97, 125, 97, 57, 25, 14, 20, 186, 269, 18, 50, 1, 487, 1247, 1244, 10, 309, 902, 52, 23, 1244, 2820, 32.18, 'Communal', 5727, 8245, NULL),
(13, 1814, 2944, 3153, 264, 9280, 'Medina', 'Masculin', 1, 27, 146, 194, 129, 55, 38, 37, 46, 418, 528, 379, 278, 18, 272, 1230, 73, 26, 2097, 838, 114, 67, 11.28, 5436, 66.03, 'Communal', 5353, 7431, NULL),
(14, 1814, 2380, 5772, 264, 8592, 'Medina', 'Féminin', 4, 16, 110, 177, 110, 41, 38, 37, 25, 272, 296, 13, 41, 3, 647, 1117, 852, 16, 304, 453, 73, 25, 852, 2256, 32.83, 'Communal', 5353, 7431, NULL),
(15, 857, 2809, 5453, 108, 16662, 'Bab_El_Bhar', 'Masculin', 15, 37, 170, 288, 149, 88, 55, 34, 33, 451, 996, 528, 636, 51, 337, 3149, 61, 7, 2316, 2478, 99, 175, 7.72, 10344, 67.28, 'Communal', 14005, 14970, NULL),
(16, 857, 2809, 8661, 108, 14567, 'Bab_El_Bhar', 'Féminin', 4, 19, 107, 268, 165, 102, 52, 43, 31, 337, 477, 56, 113, 12, 62, 2697, 2436, 9, 532, 1165, 61, 57, 2436, 5113, 40.54, 'Communal', 14005, 14970, NULL),
(17, 978, 3654, 4239, 39, 11977, 'Bab_Souika', 'Masculin', 7, 60, 214, 237, 182, 85, 61, 49, 55, 574, 843, 464, 516, 26, 414, 1878, 121, 24, 1728, 1229, 204, 91, 12.35, 6782, 64.61, 'Communal', 8765, 9782, NULL),
(18, 978, 3328, 8039, 39, 12354, 'Bab_Souika', 'Féminin', 9, 29, 141, 262, 182, 98, 65, 23, 34, 414, 418, 34, 60, 2, 111, 1758, 1237, 31, 435, 719, 121, 35, 1237, 3470, 34.93, 'Communal', 8765, 9782, NULL),
(19, 1192, 5715, 5587, 73, 16333, 'Omrane', 'Masculin', 17, 113, 324, 330, 234, 141, 115, 91, 108, 748, 852, 1077, 743, 55, 589, 2836, 236, 73, 1578, 1703, 461, 404, 13.78, 9265, 65.8, 'Communal', 11784, 13049, NULL),
(20, 1192, 5012, 11056, 73, 17172, 'Omrane', 'Féminin', 16, 61, 273, 353, 244, 153, 81, 65, 42, 589, 702, 35, 92, 3, 78, 2249, 2523, 55, 418, 1273, 236, 48, 2523, 4836, 35.62, 'Communal', 11784, 13049, NULL),
(21, 1649, 6082, 8483, 747, 22173, 'Omrane_Superieur', 'Masculin', 14, 110, 355, 494, 339, 159, 109, 90, 72, 929, 1225, 1103, 1283, 41, 702, 3451, 190, 47, 2054, 2499, 333, 275, 12.75, 11945, 61.74, 'Communal', 15319, 17715, NULL),
(22, 1649, 5852, 14753, 747, 22635, 'Omrane_Superieur', 'Féminin', 8, 59, 285, 553, 392, 220, 105, 69, 48, 702, 965, 57, 119, 1, 69, 2939, 2569, 38, 638, 1349, 190, 63, 2569, 6139, 34.83, 'Communal', 15319, 17715, NULL),
(23, 1052, 2016, 3131, 163, 8514, 'Ettahrir', 'Masculin', 7, 41, 132, 194, 122, 58, 38, 37, 33, 338, 447, 246, 528, 17, 212, 1701, 47, 11, 783, 854, 115, 142, 12.22, 4725, 63.23, 'Communal', 5774, 6989, NULL),
(24, 1052, 2190, 5657, 163, 8787, 'Ettahrir', 'Féminin', 1, 29, 95, 178, 163, 71, 33, 19, 8, 212, 337, 21, 49, 2, 48, 1378, 1332, 5, 208, 509, 47, 28, 1332, 2533, 35.62, 'Communal', 5774, 6989, NULL),
(25, 2099, 2188, 6703, 675, 16471, 'Menzah', 'Masculin', 11, 21, 77, 180, 106, 48, 40, 15, 18, 182, 778, 601, 391, 123, 127, 3102, 25, 10, 1303, 2766, 39, 180, 5.25, 9255, 59.3, 'Communal', 12871, 15645, NULL),
(26, 2099, 2613, 10366, 675, 18095, 'Menzah', 'Féminin', 13, 10, 67, 211, 140, 80, 29, 16, 18, 127, 363, 89, 163, 25, 162, 3487, 2863, 6, 557, 2361, 25, 92, 2863, 7150, 42.72, 'Communal', 12871, 15645, NULL),
(27, 2821, 2810, 5123, 481, 14394, 'Cite_Khadhra', 'Masculin', 13, 29, 114, 188, 77, 37, 38, 21, 28, 250, 835, 532, 567, 59, 190, 2578, 57, 5, 1263, 2691, 76, 190, 5.86, 8728, 64.41, 'Communal', 9488, 12790, NULL),
(28, 2821, 2771, 8585, 481, 14525, 'Cite_Khadhra', 'Féminin', 12, 23, 104, 207, 130, 74, 42, 16, 21, 190, 570, 75, 138, 8, 56, 2391, 2379, 19, 435, 1618, 57, 67, 2379, 5314, 40.89, 'Communal', 9488, 12790, NULL),
(29, 2874, 6696, 10472, 625, 28181, 'Bardo', 'Masculin', 28, 89, 350, 575, 325, 173, 114, 73, 104, 965, 1588, 1070, 1514, 100, 671, 5404, 173, 46, 2836, 2979, 291, 361, 10.33, 15880, 62.84, 'Communal', 20606, 24105, NULL),
(30, 2874, 6631, 19062, 625, 29758, 'Bardo', 'Féminin', 15, 38, 290, 575, 413, 202, 115, 75, 62, 671, 1018, 72, 200, 12, 162, 5025, 3983, 36, 789, 1672, 173, 106, 3983, 8909, 35.94, 'Communal', 20606, 24105, NULL),
(31, 2005, 5983, 4535, 245, 13400, 'Sijoumi', 'Masculin', 5, 139, 375, 367, 273, 188, 117, 95, 103, 871, 918, 800, 673, 22, 602, 1595, 311, 67, 2080, 863, 590, 234, 18.89, 7190, 66.16, 'Communal', 6519, 8769, NULL),
(32, 2005, 4735, 9256, 245, 13599, 'Sijoumi', 'Féminin', 8, 60, 273, 315, 246, 133, 85, 50, 53, 602, 710, 25, 49, 2, 78, 1216, 858, 59, 448, 620, 311, 37, 858, 3115, 31.93, 'Communal', 6519, 8769, NULL),
(33, 867, 5165, 3042, 350, 7864, 'Ezzouhour', 'Masculin', 7, 116, 274, 306, 252, 110, 78, 70, 96, 600, 287, 576, 240, 53, 408, 1631, 195, 17, 451, 192, 222, 61, 27.46, 3498, 61.31, 'Communal', 3989, 5206, NULL),
(34, 867, 4992, 5615, 350, 8245, 'Ezzouhour', 'Féminin', 7, 80, 213, 321, 204, 112, 63, 49, 43, 474, 129, 25, 14, 23, 6, 1120, 448, 16, 77, 114, 120, 27, 448, 1536, 31.9, 'Communal', 3989, 5206, NULL),
(35, 4353, 15495, 13263, 1173, 42106, 'Hrairia', 'Masculin', 35, 313, 970, 1023, 654, 307, 172, 119, 143, 2174, 3313, 3103, 3264, 211, 1434, 6628, 497, 69, 4999, 2890, 854, 654, 12.99, 25097, 68.5, 'Communal', 26757, 32283, NULL),
(36, 4353, 13837, 28464, 1173, 42527, 'Hrairia', 'Féminin', 16, 165, 673, 1229, 775, 365, 157, 105, 65, 1434, 2618, 74, 142, 55, 50, 4672, 5999, 71, 1263, 1579, 497, 86, 5999, 10505, 33.07, 'Communal', 26757, 32283, NULL),
(37, 7008, 18572, 11731, 2241, 41318, 'SidiHassine', 'Masculin', 18, 480, 1125, 927, 511, 228, 150, 116, 165, 2161, 4280, 5818, 2925, 263, 1417, 4522, 588, 146, 5094, 2260, 1042, 653, 12.69, 25833, 71.61, 'Communal', 21833, 31082, NULL),
(38, 7008, 14954, 28010, 2241, 40353, 'SidiHassine', 'Féminin', 14, 281, 794, 956, 553, 252, 150, 71, 74, 1417, 3568, 75, 128, 69, 40, 2640, 6091, 157, 1178, 1441, 588, 79, 6091, 9192, 30.59, 'Communal', 21833, 31082, NULL),
(39, 956, 4379, 4583, 100, 12402, 'Ouardia', 'Masculin', 6, 76, 252, 290, 178, 99, 71, 52, 66, 600, 1100, 499, 687, 32, 379, 1804, 123, 12, 1516, 917, 323, 160, 14.04, 6721, 63.05, 'Communal', 8334, 9390, NULL),
(40, 956, 4142, 9281, 100, 13325, 'Ouardia', 'Féminin', 16, 42, 180, 252, 142, 78, 45, 34, 30, 379, 594, 18, 80, 1, 89, 1482, 885, 20, 418, 586, 123, 41, 885, 3236, 30.35, 'Communal', 8334, 9390, NULL),
(41, 3870, 10623, 11691, 713, 33102, 'Kabaria', 'Masculin', 18, 249, 826, 948, 540, 251, 164, 115, 129, 1840, 2806, 1943, 1790, 59, 1250, 4949, 433, 93, 3627, 2185, 761, 773, 15.23, 18150, 64.68, 'Communal', 20261, 24844, NULL),
(42, 3870, 10392, 22544, 713, 33935, 'Kabaria', 'Féminin', 12, 141, 606, 892, 551, 275, 154, 74, 73, 1250, 2061, 50, 239, 11, 49, 3850, 4200, 79, 972, 1292, 433, 127, 4200, 8614, 33.57, 'Communal', 20261, 24844, NULL),
(43, 60, 3147, 4330, 0, 11250, 'Sidi_El_Bechir', 'Masculin', 6, 40, 203, 239, 153, 80, 53, 50, 64, 452, 774, 365, 451, 41, 334, 1588, 101, 47, 1632, 1037, 231, 131, 12.93, 6025, 61.51, 'Communal', 9147, 9207, NULL),
(44, 60, 3009, 7942, 0, 11734, 'Sidi_El_Bechir', 'Féminin', 10, 34, 133, 233, 161, 65, 42, 41, 33, 334, 410, 23, 80, 7, 28, 1506, 1696, 23, 330, 626, 101, 57, 1696, 3049, 32.31, 'Communal', 9147, 9207, NULL),
(45, 1596, 3760, 3330, 90, 9077, 'Djebel_Djelloud', 'Masculin', 7, 79, 211, 266, 197, 142, 89, 59, 54, 571, 1264, 641, 420, 22, 367, 889, 182, 71, 774, 504, 377, 115, 19.33, 4636, 63.31, 'Communal', 5061, 6747, NULL),
(46, 1596, 3429, 6655, 90, 9560, 'Djebel_Djelloud', 'Féminin', 10, 44, 182, 229, 155, 85, 52, 36, 31, 367, 916, 28, 38, 2, 22, 553, 712, 49, 219, 302, 182, 15, 712, 2083, 30.38, 'Communal', 5061, 6747, NULL),
(47, 1737, 3156, 5689, 341, 17856, 'LaGoulette', 'Masculin', 15, 42, 186, 270, 154, 64, 29, 35, 28, 390, 982, 766, 935, 137, 330, 3314, 77, 15, 1874, 3061, 141, 266, 6.71, 11350, 68.14, 'Communal', 15852, 17930, NULL),
(48, 1737, 3450, 9990, 341, 17940, 'LaGoulette', 'Féminin', 10, 34, 143, 295, 210, 127, 61, 34, 18, 330, 543, 73, 293, 14, 78, 3320, 5928, 15, 710, 1943, 77, 115, 5928, 7021, 44.31, 'Communal', 15852, 17930, NULL),
(49, 6999, 7385, 9546, 1842, 28824, 'Kram', 'Masculin', 29, 136, 451, 536, 302, 152, 91, 61, 71, 1071, 1565, 1945, 1586, 236, 723, 4499, 224, 59, 2813, 4073, 298, 698, 9.51, 17444, 66.88, 'Communal', 18139, 26980, NULL),
(50, 6999, 7549, 17846, 1842, 29217, 'Kram', 'Féminin', 23, 89, 322, 558, 370, 168, 89, 49, 54, 723, 1244, 69, 269, 9, 119, 3951, 5500, 41, 1149, 2810, 224, 131, 5500, 9655, 38.92, 'Communal', 18139, 26980, NULL),
(51, 6645, 9742, 12563, 1503, 36693, 'Marsa', 'Masculin', 24, 133, 364, 589, 288, 113, 75, 52, 108, 895, 2128, 3540, 1191, 308, 708, 4607, 217, 73, 3105, 6973, 291, 500, 7.27, 22376, 65.76, 'Communal', 25039, 33187, NULL),
(52, 6645, 9167, 22868, 1503, 37175, 'Marsa', 'Féminin', 23, 82, 342, 551, 330, 166, 91, 55, 62, 708, 1553, 99, 232, 38, 121, 4438, 4405, 76, 1384, 4723, 217, 123, 4405, 12613, 38.49, 'Communal', 25039, 33187, NULL),
(53, 3981, 59248, 61638, 2835, 196899, 'Ariana', 'Masculin', 98, 1104, 3052, 3461, 2091, 961, 546, 368, 532, 6541, 15675, 22469, 9470, 3200, 4088, 28152, 1411, 500, 20702, 20364, 2562, 2847, 9.08, 122977, 68.7, 'Communal', 12372, 19188, NULL),
(54, 3981, 51965, 121769, 2835, 194977, 'Ariana', 'Féminin', 100, 528, 2165, 3904, 2590, 1102, 571, 333, 246, 4088, 12968, 604, 1331, 247, 533, 24948, 34304, 412, 6111, 14738, 1411, 666, 34304, 61713, 37.55, 'Communal', 12372, 19188, NULL),
(55, 3981, 9493, 6807, 2835, 24155, 'Ariana', 'Masculin', 9, 131, 327, 355, 224, 92, 47, 41, 65, 706, 2003, 3196, 1474, 1491, 439, 3087, 162, 65, 2589, 1816, 348, 381, 7.51, 16046, 71.82, 'Rural', 12372, 19188, NULL),
(56, 3981, 7836, 15612, 2835, 23347, 'Ariana', 'Féminin', 19, 79, 259, 381, 226, 114, 43, 29, 34, 439, 1445, 76, 89, 214, 5, 2524, 5614, 64, 855, 1264, 162, 78, 5614, 6564, 33.13, 'Rural', 12372, 19188, NULL),
(57, 6207, 7236, 16630, 611, 45318, 'Ariana_Ville', 'Masculin', 24, 78, 336, 562, 359, 173, 91, 62, 65, 782, 2561, 1949, 1561, 282, 535, 8989, 122, 26, 4757, 6212, 175, 607, 6.09, 26942, 63.3, 'Communal', 32955, 39773, NULL),
(58, 6207, 7630, 26444, 611, 46914, 'Ariana_Ville', 'Féminin', 39, 42, 262, 669, 476, 222, 115, 73, 52, 535, 1427, 177, 522, 41, 262, 9708, 7957, 28, 1749, 4635, 122, 254, 7957, 18552, 43.63, 'Communal', 32955, 39773, NULL),
(59, 10271, 15076, 14144, 2717, 49313, 'Soukra', 'Masculin', 30, 253, 697, 806, 461, 222, 125, 92, 111, 1488, 5056, 6247, 2531, 346, 1025, 6492, 357, 116, 5287, 5629, 600, 742, 7.99, 32360, 71.32, 'Communal', 26139, 39127, NULL),
(60, 10271, 13260, 28593, 2717, 48755, 'Soukra', 'Féminin', 23, 120, 513, 1018, 685, 261, 161, 77, 65, 1025, 4616, 179, 421, 40, 96, 6067, 10449, 119, 1678, 4043, 357, 175, 10449, 17242, 41.35, 'Communal', 26139, 39127, NULL),
(61, 936, 10905, 10975, 366, 36119, 'Raoued', 'Masculin', 13, 186, 476, 523, 293, 123, 82, 58, 97, 909, 2824, 5058, 2368, 254, 612, 4605, 249, 88, 3573, 4039, 393, 546, 7.41, 23280, 69.61, 'Communal', 2130, 3432, NULL),
(62, 936, 9523, 22059, 366, 34713, 'Raoued', 'Féminin', 14, 76, 328, 655, 459, 221, 96, 63, 47, 612, 1866, 114, 244, 22, 50, 4570, 8820, 68, 1067, 2660, 249, 140, 8820, 10697, 36.45, 'Communal', 2130, 3432, NULL),
(63, 936, 1821, 1227, 366, 4302, 'Raoued', 'Masculin', -1, 32, 64, 64, 36, 19, 15, 9, 19, 128, 437, 612, 278, 260, 95, 352, 42, 25, 527, 283, 77, 63, 8.59, 2811, 71.48, 'Rural', 2130, 3432, NULL),
(64, 936, 1451, 2923, 366, 4205, 'Raoued', 'Féminin', 3, 15, 56, 77, 44, 26, 6, 10, 9, 95, 302, 14, 15, 25, 1, 342, 956, 17, 148, 182, 42, 7, 956, 1038, 30.5, 'Rural', 2130, 3432, NULL),
(65, 397, 3154, 1833, 552, 6861, 'Kalaat_El_Andalous', 'Masculin', 6, 53, 85, 75, 33, 12, 13, 12, 8, 157, 325, 567, 212, 1834, 87, 897, 34, 11, 559, 257, 77, 71, 5.97, 4728, 73.28, 'Communal', 1343, 2292, NULL),
(66, 397, 2744, 4906, 552, 6156, 'Kalaat_El_Andalous', 'Féminin', 2, 25, 68, 102, 44, 15, 9, 8, 3, 87, 358, 6, 6, 20, 9, 411, 191, 3, 102, 64, 34, 5, 191, 974, 20.31, 'Communal', 1343, 2292, NULL),
(67, 397, 1687, 866, 552, 3239, 'Kalaat_El_Andalous', 'Masculin', 2, 18, 36, 25, 16, 6, 3, 4, 7, 51, 248, 453, 292, 554, 26, 213, 17, 5, 287, 153, 56, 53, 4.97, 2255, 73.26, 'Rural', 1343, 2292, NULL),
(68, 397, 1329, 2260, 552, 2995, 'Kalaat_El_Andalous', 'Féminin', 1, 12, 25, 21, 10, 5, 2, 2, 1, 26, 230, 5, 4, 73, 3, 122, 395, 8, 88, 128, 17, 4, 395, 655, 24.55, 'Rural', 1343, 2292, NULL),
(69, 737, 1848, 1164, 846, 4219, 'Sidi_Thabet', 'Masculin', 2, 38, 89, 103, 57, 26, 17, 13, 22, 208, 377, 407, 163, 345, 129, 663, 68, 14, 366, 282, 113, 78, 12.18, 2683, 72.41, 'Communal', 1978, 3561, NULL),
(70, 737, 1596, 2739, 846, 4295, 'Sidi_Thabet', 'Féminin', 0, 22, 67, 84, 58, 25, 20, 18, 12, 129, 459, 15, 8, 94, 9, 411, 549, 23, 145, 103, 68, 12, 549, 1247, 36.23, 'Communal', 1978, 3561, NULL),
(71, 737, 2325, 1305, 846, 4911, 'Sidi_Thabet', 'Masculin', -1, 35, 80, 79, 44, 22, 6, 13, 17, 178, 395, 611, 371, 597, 101, 534, 34, 11, 427, 287, 84, 86, 8.29, 3307, 73.43, 'Rural', 1978, 3561, NULL),
(72, 737, 1866, 3544, 846, 4750, 'Sidi_Thabet', 'Féminin', -1, 22, 53, 72, 30, 20, 9, 2, 5, 101, 332, 10, 17, 104, 2, 229, 539, 5, 172, 121, 34, 7, 539, 991, 25.39, 'Rural', 1978, 3561, NULL),
(73, 5537, 12369, 10603, 118, 32848, 'Ettadhamen', 'Masculin', 11, 246, 818, 870, 564, 269, 132, 84, 122, 1817, 2715, 4093, 1668, 68, 1022, 4012, 347, 94, 3777, 2332, 732, 430, 14.11, 19106, 67.72, 'Communal', 18853, 24508, NULL),
(74, 5537, 10416, 22242, 118, 32594, 'Ettadhamen', 'Féminin', 12, 138, 541, 858, 540, 223, 109, 55, 37, 1022, 2708, 53, 72, 7, 84, 2317, 2774, 68, 837, 1788, 347, 50, 2774, 7844, 31.76, 'Communal', 18853, 24508, NULL),
(75, 1911, 8660, 6289, 1071, 22221, 'Mnihla', 'Masculin', 12, 250, 551, 522, 324, 136, 86, 47, 107, 1181, 1817, 4148, 967, 71, 678, 2494, 234, 151, 2383, 1613, 472, 373, 12.89, 13878, 71.7, 'Communal', 6921, 9903, NULL),
(76, 1911, 6796, 14786, 1071, 21550, 'Mnihla', 'Féminin', 7, 105, 386, 517, 328, 135, 61, 39, 30, 678, 1535, 60, 58, 23, 23, 1465, 3564, 103, 533, 1446, 234, 30, 3564, 5157, 31.39, 'Communal', 6921, 9903, NULL),
(77, 1911, 3660, 3409, 1071, 11703, 'Mnihla', 'Masculin', 9, 46, 147, 187, 128, 45, 23, 15, 22, 348, 923, 1520, 533, 80, 217, 1988, 69, 24, 1348, 1093, 131, 179, 7.49, 7673, 70.87, 'Rural', 6921, 9903, NULL),
(78, 1911, 3190, 6885, 1071, 11397, 'Mnihla', 'Féminin', 16, 30, 125, 210, 142, 63, 26, 15, 19, 217, 581, 47, 53, 12, 2, 1831, 3724, 34, 447, 833, 69, 60, 3724, 3880, 39.59, 'Rural', 6921, 9903, NULL),
(79, 3251, 64771, 73304, 3955, 218743, 'BenArous', 'Masculin', 144, 1159, 3815, 4448, 2359, 1163, 733, 498, 636, 8371, 26527, 14004, 12496, 2376, 5656, 31409, 1811, 375, 22969, 17339, 3072, 3191, 10.3, 130455, 66.49, 'Communal', 7898, 15104, NULL),
(80, 3251, 62679, 141861, 3955, 222352, 'BenArous', 'Féminin', 129, 589, 2772, 4756, 3228, 1585, 780, 458, 365, 5656, 18445, 550, 1580, 746, 763, 27316, 35015, 464, 6687, 9698, 1811, 726, 35015, 65877, 36.2, 'Communal', 7898, 15104, NULL),
(81, 3251, 10311, 5986, 3955, 21820, 'BenArous', 'Masculin', 16, 251, 455, 368, 241, 135, 97, 64, 94, 855, 3707, 2562, 1084, 2108, 483, 1469, 320, 119, 2028, 848, 633, 287, 10.89, 14109, 72.57, 'Rural', 7898, 15104, NULL),
(82, 3251, 7989, 14926, 3955, 21325, 'BenArous', 'Féminin', 13, 164, 276, 309, 172, 127, 85, 52, 47, 483, 2723, 44, 35, 761, 11, 699, 2554, 154, 532, 325, 320, 24, 2554, 5156, 30, 'Rural', 7898, 15104, NULL),
(83, 876, 3768, 4176, 61, 11860, 'BenArous', 'Masculin', 8, 52, 222, 211, 138, 84, 55, 52, 43, 497, 1700, 446, 716, 34, 311, 1600, 93, 11, 1308, 858, 168, 150, 11.24, 6820, 64.79, 'Communal', 8770, 9707, NULL),
(84, 876, 3777, 8197, 61, 12551, 'BenArous', 'Féminin', 10, 26, 124, 241, 168, 99, 46, 33, 25, 311, 1214, 19, 63, 8, 138, 1358, 1268, 15, 351, 534, 93, 32, 1268, 3589, 34.69, 'Communal', 8770, 9707, NULL),
(85, 2162, 6334, 7200, 130, 21806, 'Nouvelle_Medina', 'Masculin', 17, 90, 346, 500, 274, 132, 77, 52, 61, 860, 3044, 1186, 1227, 71, 565, 3080, 186, 32, 2244, 1806, 324, 385, 10.58, 13060, 66.98, 'Communal', 16572, 18864, NULL),
(86, 2162, 6041, 13206, 130, 22087, 'Nouvelle_Medina', 'Féminin', 22, 50, 280, 515, 363, 184, 89, 48, 23, 565, 2210, 59, 179, 16, 41, 2959, 4179, 43, 711, 1060, 186, 100, 4179, 7316, 40.2, 'Communal', 16572, 18864, NULL),
(87, 2305, 9819, 13359, 516, 40524, 'Mourouj', 'Masculin', 20, 165, 666, 816, 381, 126, 85, 44, 73, 1330, 4130, 2084, 2419, 147, 1011, 7051, 236, 35, 4787, 3496, 336, 641, 8.8, 24775, 67.03, 'Communal', 29002, 31823, NULL),
(88, 2305, 9818, 24528, 516, 39736, 'Mourouj', 'Féminin', 21, 83, 494, 1038, 667, 280, 138, 79, 63, 1011, 2288, 105, 304, 78, 164, 6479, 7811, 69, 1228, 1700, 236, 151, 7811, 12354, 38.27, 'Communal', 29002, 31823, NULL),
(89, 2764, 4927, 6275, 382, 16141, 'HammamLif', 'Masculin', 6, 84, 278, 306, 152, 118, 72, 43, 74, 671, 1568, 753, 755, 152, 458, 2105, 157, 22, 1739, 1471, 231, 167, 11.66, 8716, 61.12, 'Communal', 10886, 14032, NULL),
(90, 2764, 5065, 11983, 382, 17677, 'HammamLif', 'Féminin', 10, 44, 192, 310, 209, 130, 79, 43, 31, 458, 1062, 45, 113, 16, 68, 1870, 1795, 20, 594, 883, 157, 51, 1795, 4644, 32.21, 'Communal', 10886, 14032, NULL),
(91, 1375, 3006, 4365, 244, 12396, 'Hammam_Chott', 'Masculin', 11, 54, 208, 287, 166, 74, 50, 31, 40, 501, 1766, 751, 618, 107, 375, 1841, 96, 28, 1014, 861, 159, 144, 11.43, 7113, 64.79, 'Communal', 8764, 10383, NULL),
(92, 1375, 3038, 7555, 244, 12746, 'Hammam_Chott', 'Féminin', 1, 41, 207, 311, 235, 78, 45, 22, 23, 375, 1410, 30, 105, 28, 28, 1693, 2255, 23, 409, 499, 96, 53, 2255, 4228, 40.73, 'Communal', 8764, 10383, NULL),
(93, 2943, 4869, 4880, 814, 14984, 'BouMhel_Bassatine', 'Masculin', 17, 81, 209, 247, 145, 56, 43, 33, 29, 460, 1918, 1268, 595, 353, 317, 2005, 134, 23, 1735, 1158, 196, 203, 8.43, 9252, 67.43, 'Communal', 8850, 12607, NULL),
(94, 2943, 4411, 9433, 814, 15080, 'BouMhel_Bassatine', 'Féminin', 13, 34, 161, 288, 202, 111, 49, 24, 27, 317, 1241, 35, 84, 100, 26, 1913, 2985, 40, 540, 777, 134, 40, 2985, 4743, 37.45, 'Communal', 8850, 12607, NULL),
(95, 208, 3079, 4858, 157, 13231, 'Ezzahra', 'Masculin', 9, 30, 140, 207, 120, 49, 60, 36, 50, 387, 1355, 600, 691, 113, 313, 2102, 90, 18, 1384, 1211, 126, 197, 8.49, 7662, 63.28, 'Communal', 11322, 11687, NULL),
(96, 208, 3195, 8765, 157, 14365, 'Ezzahra', 'Féminin', 8, 12, 124, 239, 191, 98, 49, 36, 24, 313, 868, 36, 151, 14, 70, 2290, 2152, 32, 511, 864, 90, 78, 2152, 4820, 38.98, 'Communal', 11322, 11687, NULL),
(97, 1972, 6300, 7878, 530, 23178, 'Rades', 'Masculin', 17, 82, 344, 427, 244, 122, 69, 46, 52, 772, 2613, 1439, 1527, 140, 553, 3283, 181, 25, 2479, 1970, 253, 436, 9.12, 13904, 66.01, 'Communal', 16230, 18732, NULL),
(98, 1972, 6300, 14561, 530, 23326, 'Rades', 'Féminin', 14, 42, 248, 478, 350, 174, 89, 43, 33, 553, 1565, 70, 284, 22, 73, 3321, 3519, 38, 745, 1169, 181, 111, 3519, 7301, 37.58, 'Communal', 16230, 18732, NULL),
(99, 835, 2868, 3830, 196, 10144, 'Megrine', 'Masculin', 11, 33, 132, 182, 103, 67, 55, 34, 37, 345, 1290, 377, 466, 35, 247, 1452, 76, 9, 948, 927, 152, 154, 10.36, 5660, 62.24, 'Communal', 6980, 8011, NULL),
(100, 835, 2957, 6850, 196, 10934, 'Megrine', 'Féminin', 8, 23, 108, 178, 132, 65, 37, 22, 30, 247, 968, 27, 93, 4, 51, 1411, 1121, 6, 314, 616, 76, 45, 1121, 3486, 37.35, 'Communal', 6980, 8011, NULL),
(101, 225, 8444, 6643, 305, 22583, 'Mohamedia', 'Masculin', 8, 260, 569, 533, 261, 139, 77, 51, 75, 1120, 2771, 2623, 1490, 229, 645, 3131, 236, 93, 2128, 1261, 501, 315, 12.45, 13956, 70.59, 'Communal', 854, 1384, NULL),
(102, 225, 7626, 15417, 305, 22254, 'Mohamedia', 'Féminin', 6, 95, 383, 469, 294, 144, 69, 38, 27, 645, 2478, 46, 77, 44, 39, 1547, 3513, 59, 514, 573, 236, 25, 3513, 5310, 30.72, 'Communal', 854, 1384, NULL),
(103, 225, 942, 445, 305, 2008, 'Mohamedia', 'Masculin', -1, 29, 49, 41, 18, 4, 3, 7, 4, 102, 270, 374, 141, 228, 66, 124, 31, 8, 174, 66, 40, 31, 9.98, 1407, 77.84, 'Rural', 854, 1384, NULL),
(104, 225, 708, 1408, 305, 1930, 'Mohamedia', 'Féminin', 2, 27, 32, 26, 24, 16, 9, 3, 5, 66, 199, 4, 7, 52, 4, 56, 220, 18, 36, 25, 31, 0, 220, 381, 27.05, 'Rural', 854, 1384, NULL),
(105, 1655, 5760, 5256, 1100, 17308, 'Fouchana', 'Masculin', 10, 111, 380, 421, 210, 98, 53, 42, 64, 816, 2633, 1234, 1170, 110, 506, 2200, 170, 37, 1821, 1255, 314, 228, 11.54, 10661, 69.64, 'Communal', 5401, 8156, NULL),
(106, 1655, 5522, 11119, 1100, 17026, 'Fouchana', 'Féminin', 6, 68, 275, 408, 252, 135, 46, 46, 38, 506, 2087, 43, 79, 14, 42, 1409, 3073, 61, 413, 568, 170, 17, 3073, 4636, 34.7, 'Communal', 5401, 8156, NULL),
(107, 1655, 4960, 3134, 1100, 11126, 'Fouchana', 'Masculin', 8, 133, 246, 209, 148, 76, 47, 30, 56, 486, 2309, 1509, 437, 188, 284, 759, 210, 58, 1153, 495, 333, 179, 11.95, 7037, 71.83, 'Rural', 5401, 8156, NULL),
(108, 1655, 4098, 7027, 1100, 11165, 'Fouchana', 'Féminin', 8, 87, 163, 201, 108, 80, 58, 34, 34, 284, 2033, 25, 19, 239, 3, 434, 1948, 93, 369, 222, 210, 15, 1948, 3364, 37.05, 'Rural', 5401, 8156, NULL),
(109, 1371, 5597, 4584, 2550, 14588, 'Mornag', 'Masculin', 11, 117, 319, 311, 165, 98, 37, 34, 38, 612, 1739, 1243, 822, 885, 355, 1558, 156, 42, 1382, 1065, 312, 171, 11.28, 8876, 68.58, 'Communal', 1643, 5564, NULL),
(110, 1371, 4929, 10247, 2550, 14570, 'Mornag', 'Féminin', 11, 71, 176, 282, 165, 87, 44, 24, 21, 355, 1054, 35, 48, 402, 23, 1065, 1344, 58, 357, 455, 156, 23, 1344, 3450, 29.66, 'Communal', 1643, 5564, NULL),
(111, 1371, 4409, 2407, 2550, 8686, 'Mornag', 'Masculin', 8, 89, 161, 119, 75, 55, 47, 27, 34, 268, 1129, 679, 506, 1692, 133, 586, 79, 53, 701, 287, 260, 77, 9.78, 5665, 72.3, 'Rural', 1643, 5564, NULL),
(112, 1371, 3183, 6491, 2550, 8230, 'Mornag', 'Féminin', 3, 50, 81, 82, 40, 31, 18, 15, 8, 133, 491, 15, 9, 470, 4, 209, 386, 43, 127, 78, 79, 9, 386, 1411, 21.13, 'Rural', 1643, 5564, NULL),
(113, 5436, 39437, 36325, 7813, 111601, 'Manouba', 'Masculin', 61, 827, 2653, 3118, 1776, 850, 471, 340, 471, 5765, 9938, 11497, 4953, 2124, 3838, 17467, 1450, 379, 9606, 7509, 2762, 1457, 14.17, 64612, 67.45, 'Communal', 10069, 23318, NULL),
(114, 5436, 34260, 73463, 7813, 111187, 'Manouba', 'Féminin', 48, 428, 1957, 3239, 2012, 918, 450, 261, 195, 3838, 8081, 203, 392, 741, 295, 11577, 12710, 371, 2708, 4258, 1450, 198, 12710, 28206, 33.93, 'Communal', 10069, 23318, NULL),
(115, 5436, 16001, 10645, 7813, 35552, 'Manouba', 'Masculin', 16, 314, 747, 692, 477, 241, 153, 131, 165, 1462, 2630, 4052, 1602, 5575, 905, 3668, 460, 206, 2359, 1540, 1052, 485, 11.96, 21927, 70.05, 'Rural', 10069, 23318, NULL),
(116, 5436, 12267, 26046, 7813, 34470, 'Manouba', 'Féminin', 13, 176, 505, 633, 401, 190, 94, 66, 73, 905, 2000, 47, 56, 1307, 22, 1477, 2732, 170, 763, 576, 460, 37, 2732, 6276, 24.43, 'Rural', 10069, 23318, NULL),
(117, 3391, 5592, 8426, 258, 23198, 'Mannouba', 'Masculin', 24, 96, 387, 570, 306, 147, 89, 56, 76, 929, 1507, 1025, 1230, 139, 690, 4535, 180, 23, 2110, 2140, 276, 313, 11.84, 13023, 63.68, 'Communal', 14033, 17682, NULL),
(118, 3391, 5498, 14444, 258, 23552, 'Mannouba', 'Féminin', 15, 54, 319, 650, 478, 185, 82, 52, 31, 690, 884, 55, 138, 18, 142, 4286, 3860, 22, 614, 1151, 180, 84, 3860, 7245, 38.67, 'Communal', 14033, 17682, NULL),
(119, 228, 12174, 10171, 68, 32072, 'Douar_Hicher', 'Masculin', 13, 314, 861, 994, 561, 264, 141, 97, 146, 1892, 3137, 4563, 1251, 145, 1156, 4123, 403, 175, 2767, 2092, 898, 385, 15.64, 18476, 68.29, 'Communal', 103, 399, NULL),
(120, 228, 10127, 21098, 68, 31452, 'Douar_Hicher', 'Féminin', 7, 163, 611, 971, 560, 234, 99, 46, 40, 1156, 3174, 52, 71, 21, 25, 2094, 3072, 125, 649, 1516, 403, 36, 3072, 7620, 32.92, 'Communal', 103, 399, NULL),
(121, 228, 227, 186, 68, 592, 'Douar_Hicher', 'Masculin', 0, 12, 17, 18, 9, 7, 4, 1, 4, 34, 30, 138, 13, 9, 25, 56, 12, 15, 33, 42, 19, 10, 18.47, 331, 68.47, 'Rural', 103, 399, NULL),
(122, 228, 176, 412, 68, 558, 'Douar_Hicher', 'Féminin', 0, 6, 19, 13, 4, 2, 0, 1, 2, 25, 36, 1, 1, 5, 0, 10, 68, 2, 12, 33, 12, 1, 68, 99, 26.16, 'Rural', 103, 399, NULL),
(123, 512, 8278, 7020, 809, 22233, 'Oued_Ellil', 'Masculin', 6, 131, 524, 572, 344, 161, 76, 59, 72, 1095, 2120, 2324, 1111, 434, 793, 3723, 312, 50, 1829, 1432, 502, 274, 12.88, 13253, 68.43, 'Communal', 1771, 3092, NULL),
(124, 512, 7222, 14155, 809, 21925, 'Oued_Ellil', 'Féminin', 11, 71, 409, 652, 385, 192, 88, 61, 36, 793, 1905, 42, 86, 231, 38, 2281, 2667, 73, 539, 742, 312, 33, 2667, 5870, 35.44, 'Communal', 1771, 3092, NULL),
(125, 512, 1826, 1318, 809, 4375, 'Oued_Ellil', 'Masculin', 0, 31, 94, 83, 46, 24, 18, 17, 19, 182, 539, 588, 131, 275, 144, 512, 67, 7, 374, 246, 116, 54, 11.06, 2719, 69.87, 'Rural', 1771, 3092, NULL),
(126, 512, 1583, 2957, 809, 4379, 'Oued_Ellil', 'Féminin', 4, 19, 62, 113, 61, 32, 27, 16, 7, 144, 458, 8, 7, 111, 0, 262, 467, 23, 107, 121, 67, 6, 467, 1084, 32.47, 'Rural', 1771, 3092, NULL),
(127, 1127, 2645, 2383, 1416, 7483, 'Mornaguia', 'Masculin', 5, 44, 141, 157, 77, 35, 20, 18, 32, 272, 765, 711, 490, 104, 179, 1191, 76, 19, 728, 478, 133, 95, 10.45, 4567, 68.15, 'Communal', 3431, 5974, NULL),
(128, 1127, 2363, 5011, 1416, 7621, 'Mornaguia', 'Féminin', 7, 23, 84, 178, 115, 72, 21, 14, 18, 179, 455, 11, 26, 43, 32, 991, 1277, 25, 271, 258, 76, 22, 1277, 2084, 34.25, 'Communal', 3431, 5974, NULL),
(129, 1127, 4152, 2726, 1416, 8900, 'Mornaguia', 'Masculin', 4, 43, 163, 158, 112, 56, 25, 24, 23, 333, 813, 1234, 670, 787, 198, 834, 80, 23, 704, 388, 194, 125, 9.96, 5559, 69.36, 'Rural', 3431, 5974, NULL),
(130, 1127, 3190, 6387, 1416, 8714, 'Mornaguia', 'Féminin', 1, 28, 112, 133, 83, 44, 11, 7, 11, 198, 612, 16, 27, 277, 3, 464, 808, 13, 304, 174, 80, 23, 808, 1898, 26.7, 'Rural', 3431, 5974, NULL),
(131, 515, 957, 798, 1312, 2518, 'Borj_Amri', 'Masculin', 1, 32, 73, 80, 47, 41, 20, 17, 31, 168, 162, 206, 98, 111, 171, 406, 101, 22, 173, 171, 127, 40, 20.47, 1368, 68.31, 'Communal', 862, 2689, NULL),
(132, 515, 776, 1545, 1312, 2531, 'Borj_Amri', 'Féminin', 4, 14, 76, 96, 82, 44, 41, 22, 21, 171, 138, 8, 5, 58, 4, 239, 222, 41, 55, 70, 101, 2, 222, 579, 38.96, 'Communal', 862, 2689, NULL),
(133, 515, 1823, 1350, 1312, 4261, 'Borj_Amri', 'Masculin', 2, 42, 102, 89, 61, 34, 25, 15, 30, 185, 303, 430, 142, 638, 130, 462, 72, 38, 282, 187, 155, 58, 13.98, 2504, 68.29, 'Rural', 862, 2689, NULL),
(134, 515, 1520, 3149, 1312, 4091, 'Borj_Amri', 'Féminin', -1, 31, 69, 82, 55, 22, 8, 13, 15, 130, 206, 9, 7, 148, 5, 140, 266, 23, 73, 60, 72, 2, 266, 644, 23.03, 'Rural', 862, 2689, NULL),
(135, 1348, 4610, 3269, 1897, 10961, 'Djedeida', 'Masculin', 9, 122, 297, 303, 200, 82, 41, 36, 44, 614, 1319, 1295, 390, 562, 351, 1467, 168, 38, 834, 510, 378, 162, 14.87, 6548, 70.18, 'Communal', 1073, 4318, NULL),
(136, 1348, 3842, 7877, 1897, 10771, 'Djedeida', 'Féminin', 3, 47, 200, 270, 158, 93, 52, 30, 17, 351, 771, 17, 25, 157, 15, 641, 857, 44, 211, 187, 168, 8, 857, 2020, 26.87, 'Communal', 1073, 4318, NULL),
(137, 1348, 2775, 1658, 1897, 6184, 'Djedeida', 'Masculin', 2, 60, 127, 113, 81, 37, 20, 22, 25, 271, 405, 658, 280, 1417, 135, 576, 80, 38, 393, 219, 144, 81, 10.94, 4031, 73.19, 'Rural', 1073, 4318, NULL),
(138, 1348, 2134, 4631, 1897, 5971, 'Djedeida', 'Féminin', 3, 34, 79, 99, 67, 26, 13, 7, 8, 135, 291, 5, 8, 254, 7, 280, 554, 17, 91, 71, 80, 3, 554, 1006, 22.43, 'Rural', 1073, 4318, NULL),
(139, 628, 4291, 3469, 1247, 10711, 'Tebourba', 'Masculin', 2, 80, 317, 368, 207, 102, 66, 49, 55, 660, 790, 1205, 317, 418, 401, 1533, 176, 40, 1024, 532, 404, 151, 17.54, 5972, 67.62, 'Communal', 1954, 3829, NULL),
(140, 628, 3576, 7585, 1247, 10887, 'Tebourba', 'Féminin', 4, 47, 214, 332, 187, 76, 58, 29, 27, 401, 636, 16, 25, 185, 26, 844, 593, 34, 327, 279, 176, 11, 593, 2327, 30.33, 'Communal', 1954, 3829, NULL),
(141, 628, 3003, 1856, 1247, 6323, 'Tebourba', 'Masculin', 4, 67, 143, 130, 80, 46, 35, 32, 44, 244, 352, 625, 214, 1124, 178, 847, 101, 45, 375, 219, 264, 116, 13.23, 3876, 70.65, 'Rural', 1954, 3829, NULL),
(142, 628, 2033, 4714, 1247, 6040, 'Tebourba', 'Féminin', 4, 41, 98, 118, 81, 40, 27, 19, 22, 178, 257, 5, 4, 220, 7, 190, 341, 64, 122, 71, 101, 1, 341, 874, 21.94, 'Rural', 1954, 3829, NULL),
(143, 1078, 890, 789, 1064, 2425, 'Battane', 'Masculin', -1, 8, 52, 73, 34, 18, 18, 8, 15, 134, 138, 169, 66, 211, 97, 490, 34, 12, 141, 154, 44, 37, 14.12, 1405, 67.46, 'Communal', 875, 3017, NULL),
(144, 1078, 856, 1748, 1064, 2448, 'Battane', 'Féminin', 0, 9, 44, 89, 47, 22, 9, 7, 5, 97, 117, 2, 16, 28, 13, 199, 162, 7, 42, 55, 34, 2, 162, 461, 28.61, 'Communal', 875, 3017, NULL),
(145, 1078, 2195, 1551, 1064, 4917, 'Battane', 'Masculin', 5, 59, 100, 100, 87, 37, 26, 20, 20, 213, 188, 379, 152, 1324, 95, 381, 48, 40, 198, 239, 159, 41, 13.64, 2907, 68.47, 'Rural', 875, 3017, NULL),
(146, 1078, 1631, 3796, 1064, 4717, 'Battane', 'Féminin', 2, 17, 66, 75, 49, 24, 8, 3, 8, 95, 140, 3, 2, 292, 0, 131, 228, 28, 54, 46, 48, 1, 228, 671, 19.53, 'Rural', 875, 3017, NULL),
(147, 259528, 82292, 62339, 380068, 205021, 'Nabeul', 'Masculin', 157, 1053, 2838, 3142, 1664, 714, 498, 358, 470, 5364, 25614, 21341, 6244, 14135, 3511, 20465, 1546, 336, 19726, 22427, 2567, 1663, 7.65, 131772, 69.6, 'Communal', 310460, 950056, NULL),
(148, 259528, 73150, 129394, 380068, 202030, 'Nabeul', 'Féminin', 99, 563, 2199, 3880, 2468, 1134, 564, 336, 271, 3511, 24283, 225, 488, 3337, 458, 17007, 18835, 380, 6241, 9289, 1546, 195, 18835, 61164, 35.95, 'Communal', 310460, 950056, NULL),
(149, 259528, 46359, 25530, 380068, 94981, 'Nabeul', 'Masculin', 39, 871, 1409, 1254, 695, 391, 250, 186, 269, 2477, 10770, 12223, 2866, 19674, 1271, 4862, 932, 439, 5840, 6756, 1859, 1015, 7.78, 64045, 73.12, 'Rural', 310460, 950056, NULL),
(150, 259528, 36876, 58730, 380068, 94380, 'Nabeul', 'Féminin', 28, 442, 914, 1185, 706, 377, 204, 126, 117, 1271, 15295, 128, 173, 8652, 76, 2350, 5127, 416, 2521, 2351, 932, 56, 5127, 31554, 37.77, 'Rural', 310460, 950056, NULL),
(151, 119, 9632, 9490, 261, 27561, 'Nabeul', 'Masculin', 30, 97, 329, 437, 222, 78, 68, 39, 42, 612, 3899, 1851, 813, 343, 435, 3102, 204, 45, 2860, 3620, 284, 222, 7.37, 16740, 65.57, 'Communal', 350, 730, NULL),
(152, 119, 8675, 17188, 261, 27366, 'Nabeul', 'Féminin', 16, 64, 271, 538, 343, 149, 59, 34, 33, 435, 2592, 35, 87, 62, 140, 3184, 3177, 59, 892, 1771, 204, 35, 3177, 8674, 37.19, 'Communal', 350, 730, NULL),
(153, 119, 519, 229, 261, 1035, 'Nabeul', 'Masculin', 0, 17, 18, 22, 13, 8, 6, 4, 6, 34, 276, 129, 50, 46, 31, 43, 32, 15, 67, 68, 41, 31, 11.91, 710, 77.9, 'Rural', 350, 730, NULL),
(154, 119, 405, 536, 261, 985, 'Nabeul', 'Féminin', 1, 12, 16, 19, 15, 13, 7, 6, 6, 31, 260, 0, 0, 21, 4, 25, 55, 20, 10, 35, 32, 3, 55, 355, 45.64, 'Rural', 350, 730, NULL),
(155, 195, 6529, 4768, 920, 16098, 'Dar_Chaabane_Fehri', 'Masculin', 16, 83, 203, 203, 110, 41, 27, 27, 34, 334, 2328, 2440, 590, 295, 253, 1602, 95, 8, 1820, 1381, 177, 123, 6.49, 10595, 70.39, 'Communal', 102, 1217, NULL),
(156, 195, 5831, 9556, 920, 15848, 'Dar_Chaabane_Fehri', 'Féminin', 8, 50, 163, 287, 204, 73, 39, 33, 15, 253, 2265, 16, 35, 107, 34, 1749, 1982, 21, 477, 756, 95, 12, 1982, 5425, 39.71, 'Communal', 102, 1217, NULL),
(157, 195, 1035, 315, 920, 1850, 'Dar_Chaabane_Fehri', 'Masculin', 1, 23, 25, 14, 7, 5, 1, 1, 4, 22, 278, 314, 54, 532, 28, 70, 33, 11, 113, 52, 43, 40, 5.28, 1454, 82.97, 'Rural', 102, 1217, NULL),
(158, 195, 714, 990, 920, 1680, 'Dar_Chaabane_Fehri', 'Féminin', 0, 15, 24, 23, 12, 7, 2, 4, 0, 28, 274, 4, 1, 281, 1, 16, 47, 10, 15, 12, 33, 0, 47, 603, 41.07, 'Rural', 102, 1217, NULL),
(159, 1191, 6052, 3973, 417, 13675, 'Beni_khiar', 'Masculin', 5, 29, 114, 144, 72, 22, 16, 17, 17, 174, 1775, 2335, 571, 909, 139, 1272, 66, 6, 1293, 947, 101, 158, 4.5, 9265, 70.95, 'Communal', 260, 1868, NULL),
(160, 1191, 5330, 8628, 417, 13630, 'Beni_khiar', 'Féminin', 5, 22, 120, 256, 139, 59, 21, 10, 4, 139, 2129, 23, 31, 277, 15, 1199, 1346, 8, 325, 360, 66, 21, 1346, 4370, 36.7, 'Communal', 260, 1868, NULL),
(161, 1191, 1299, 551, 417, 2485, 'Beni_khiar', 'Masculin', 1, 16, 27, 22, 12, 5, 4, 6, 2, 44, 494, 343, 57, 536, 23, 86, 12, 7, 158, 140, 39, 21, 5.07, 1836, 77.8, 'Rural', 260, 1868, NULL),
(162, 1191, 986, 1314, 417, 2271, 'Beni_khiar', 'Féminin', 1, 17, 17, 14, 8, 4, 3, 0, 5, 23, 393, 0, 4, 343, 0, 54, 248, 9, 44, 46, 12, 2, 248, 887, 42.11, 'Rural', 260, 1868, NULL),
(163, 1459, 8499, 5039, 2594, 18074, 'Korba', 'Masculin', 15, 116, 238, 264, 131, 82, 45, 27, 56, 475, 2471, 2029, 486, 1702, 285, 1720, 129, 11, 2224, 1196, 286, 218, 7.47, 12061, 72.12, 'Communal', 1732, 5785, NULL),
(164, 1459, 7640, 10768, 2594, 17792, 'Korba', 'Féminin', 7, 51, 185, 257, 186, 90, 40, 24, 32, 285, 3530, 17, 36, 355, 24, 1429, 979, 27, 396, 368, 129, 18, 979, 6156, 39.48, 'Communal', 1732, 5785, NULL),
(165, 1459, 4005, 1794, 2594, 7722, 'Korba', 'Masculin', 3, 54, 73, 76, 42, 30, 25, 13, 38, 137, 898, 865, 269, 2314, 75, 314, 49, 46, 463, 375, 140, 67, 6.07, 5568, 76.77, 'Rural', 1732, 5785, NULL),
(166, 1459, 3070, 3878, 2594, 7674, 'Korba', 'Féminin', 1, 34, 42, 71, 35, 21, 13, 15, 7, 75, 1740, 8, 4, 1416, 11, 168, 576, 29, 157, 63, 49, 0, 576, 3557, 49.47, 'Rural', 1732, 5785, NULL),
(167, 1893, 7672, 4594, 2579, 16325, 'Menzel_Temime', 'Masculin', 7, 79, 180, 205, 104, 54, 25, 17, 14, 336, 1496, 2298, 417, 1981, 192, 1615, 73, 14, 2046, 1081, 153, 105, 5.84, 11046, 71.87, 'Communal', 1741, 6213, NULL),
(168, 1893, 6370, 11315, 2579, 16368, 'Menzel_Temime', 'Féminin', 4, 34, 165, 279, 179, 62, 27, 15, 14, 192, 2377, 14, 18, 135, 26, 1060, 645, 20, 257, 396, 73, 10, 645, 4271, 30.87, 'Communal', 1741, 6213, NULL),
(169, 1893, 3820, 1988, 2579, 7769, 'Menzel_Temime', 'Masculin', -1, 30, 86, 84, 51, 27, 10, 8, 11, 139, 289, 1828, 179, 1921, 57, 463, 33, 18, 492, 263, 85, 39, 5.33, 5473, 74.41, 'Rural', 1741, 6213, NULL),
(170, 1893, 2905, 5317, 2579, 8317, 'Menzel_Temime', 'Féminin', 3, 22, 56, 105, 65, 21, 12, 0, 6, 57, 1726, 13, 3, 668, 11, 185, 175, 13, 53, 58, 33, 2, 175, 2711, 36.07, 'Rural', 1741, 6213, NULL),
(171, 1851, 583, 511, 3322, 1512, 'Mida', 'Masculin', 0, 10, 26, 29, 14, 10, 4, 3, 8, 47, 90, 222, 35, 97, 23, 230, 9, 7, 118, 91, 31, 13, 10.49, 896, 66.2, 'Communal', 2110, 7283, NULL),
(172, 1851, 585, 858, 3322, 1526, 'Mida', 'Féminin', -1, 5, 15, 30, 24, 8, 2, 3, 2, 23, 278, 0, 6, 79, 6, 146, 95, 5, 32, 36, 9, 2, 95, 578, 43.77, 'Communal', 2110, 7283, NULL),
(173, 1851, 3927, 2308, 3322, 8130, 'Mida', 'Masculin', 1, 56, 98, 90, 43, 38, 24, 19, 22, 185, 581, 1439, 177, 1802, 79, 447, 30, 30, 489, 435, 132, 52, 6.85, 5423, 71.61, 'Rural', 2110, 7283, NULL),
(174, 1851, 3508, 5029, 3322, 8789, 'Mida', 'Féminin', 2, 32, 59, 109, 40, 14, 3, 2, 6, 79, 1910, 9, 17, 1155, 3, 213, 309, 11, 121, 67, 30, 0, 309, 3494, 42.78, 'Rural', 2110, 7283, NULL),
(175, 857, 8605, 6153, 818, 19606, 'Kelibia', 'Masculin', 14, 94, 287, 300, 187, 81, 57, 39, 44, 474, 3173, 1889, 542, 1552, 323, 2046, 142, 38, 1688, 1306, 249, 134, 8.24, 12344, 68.62, 'Communal', 413, 2088, NULL),
(176, 857, 7331, 13763, 818, 19585, 'Kelibia', 'Féminin', 11, 52, 242, 415, 296, 126, 59, 25, 18, 323, 1876, 16, 18, 171, 45, 1510, 1251, 27, 449, 528, 142, 10, 1251, 4589, 29.73, 'Communal', 413, 2088, NULL),
(177, 857, 1197, 675, 818, 2516, 'Kelibia', 'Masculin', 1, 23, 31, 32, 16, 10, 5, 5, 5, 51, 221, 510, 65, 605, 33, 159, 22, 23, 77, 53, 40, 19, 7.12, 1710, 73.17, 'Rural', 413, 2088, NULL),
(178, 857, 936, 1731, 818, 2432, 'Kelibia', 'Féminin', -1, 12, 30, 34, 24, 7, 3, 2, 1, 33, 264, 8, 0, 220, 9, 47, 143, 7, 21, 30, 22, 0, 143, 589, 28.82, 'Rural', 413, 2088, NULL),
(179, 4, 2275, 1479, 694, 5158, 'Hammam_Guezaz', 'Masculin', 1, 14, 39, 49, 25, 8, 7, 7, 9, 78, 571, 725, 179, 904, 79, 515, 20, 4, 339, 249, 30, 34, 4.4, 3517, 71.33, 'Communal', 3, 701, NULL),
(180, 4, 1903, 3447, 694, 5070, 'Hammam_Guezaz', 'Féminin', 0, 8, 54, 107, 67, 41, 11, 5, 2, 79, 451, 9, 17, 255, 2, 356, 560, 0, 120, 118, 20, 2, 560, 1328, 32.01, 'Communal', 3, 701, NULL),
(181, 4, 390, 213, 694, 830, 'Hammam_Guezaz', 'Masculin', 1, 1, 3, 4, 7, 3, 2, 1, 0, 7, 52, 67, 18, 358, 9, 32, 3, 2, 36, 26, 2, 6, 3.4, 596, 74.43, 'Rural', 3, 701, NULL),
(182, 4, 270, 533, 694, 845, 'Hammam_Guezaz', 'Féminin', 0, 1, 6, 14, 5, 5, 1, 1, 1, 9, 55, 0, 2, 187, 1, 21, 57, 0, 5, 8, 3, 0, 57, 278, 37.04, 'Rural', 3, 701, NULL),
(183, 2021, 1269, 1336, 3331, 3678, 'Haouaria', 'Masculin', 3, 11, 65, 104, 32, 12, 7, 4, 7, 131, 195, 582, 84, 314, 51, 378, 9, 6, 203, 272, 26, 66, 10.46, 2097, 63.7, 'Communal', 3679, 9031, NULL),
(184, 2021, 1165, 2974, 3331, 3695, 'Haouaria', 'Féminin', 2, 3, 49, 88, 51, 20, 7, 0, 1, 51, 125, 3, 8, 43, 8, 195, 109, 2, 56, 68, 9, 2, 109, 502, 19.51, 'Communal', 3679, 9031, NULL),
(185, 2021, 5567, 3593, 3331, 12307, 'Haouaria', 'Masculin', 6, 69, 169, 180, 95, 25, 21, 15, 18, 297, 689, 1379, 251, 3787, 141, 700, 71, 14, 736, 487, 126, 86, 6.81, 8121, 70.81, 'Rural', 3679, 9031, NULL),
(186, 2021, 4433, 8480, 3331, 12061, 'Haouaria', 'Féminin', 2, 24, 123, 194, 140, 57, 15, 19, 18, 141, 1220, 14, 9, 1223, 7, 251, 426, 40, 112, 154, 71, 1, 426, 2986, 29.7, 'Rural', 3679, 9031, NULL),
(187, 1220, 3838, 2219, 1433, 8408, 'Takelsa', 'Masculin', 8, 70, 125, 147, 89, 50, 25, 21, 17, 296, 902, 778, 242, 2061, 109, 688, 56, 15, 439, 465, 149, 60, 8.82, 5643, 73.61, 'Communal', 2999, 5652, NULL),
(188, 1220, 3260, 4922, 1433, 8531, 'Takelsa', 'Féminin', 3, 38, 71, 96, 63, 36, 25, 5, 5, 109, 1334, 12, 10, 1173, 12, 301, 362, 15, 300, 136, 56, 0, 362, 3269, 42.3, 'Communal', 2999, 5652, NULL),
(189, 542, 5860, 5111, 1437, 15796, 'Soliman', 'Masculin', 21, 91, 243, 260, 115, 47, 36, 36, 42, 440, 2438, 1000, 502, 1195, 314, 1602, 153, 46, 1175, 1695, 236, 161, 8.39, 9789, 67.64, 'Communal', 1175, 3154, NULL),
(190, 542, 5761, 10116, 1437, 15766, 'Soliman', 'Féminin', 7, 52, 164, 304, 166, 94, 66, 41, 29, 314, 1821, 11, 67, 316, 36, 1249, 2728, 59, 438, 785, 153, 27, 2728, 4721, 35.83, 'Communal', 1175, 3154, NULL),
(191, 542, 2526, 1256, 1437, 4707, 'Soliman', 'Masculin', 5, 77, 109, 70, 34, 21, 12, 10, 18, 172, 667, 415, 91, 1204, 96, 170, 90, 19, 229, 288, 147, 24, 10.37, 3093, 73.32, 'Rural', 1175, 3154, NULL),
(192, 542, 1939, 2692, 1437, 4486, 'Soliman', 'Féminin', 4, 42, 83, 44, 36, 20, 16, 5, 7, 96, 721, 5, 10, 508, 2, 75, 190, 27, 114, 98, 90, 2, 190, 1537, 39.99, 'Rural', 1175, 3154, NULL),
(193, 1131, 2851, 1959, 3363, 6930, 'Menzel_Bouzelfa', 'Masculin', 5, 40, 129, 104, 70, 20, 13, 19, 19, 240, 885, 567, 170, 920, 146, 655, 59, 20, 804, 469, 82, 72, 8.53, 4547, 71.74, 'Communal', 930, 5424, NULL),
(194, 1131, 2594, 4148, 3363, 7077, 'Menzel_Bouzelfa', 'Féminin', 1, 26, 68, 117, 69, 51, 20, 11, 14, 146, 1381, 10, 21, 44, 17, 564, 488, 10, 310, 204, 59, 15, 488, 2550, 41.37, 'Communal', 930, 5424, NULL),
(195, 1131, 3620, 1691, 3363, 7344, 'Menzel_Bouzelfa', 'Masculin', 1, 60, 98, 82, 35, 15, 14, 14, 14, 161, 656, 885, 181, 2408, 68, 334, 46, 38, 547, 202, 102, 99, 6.01, 5313, 76.97, 'Rural', 930, 5424, NULL),
(196, 1131, 2738, 3805, 3363, 7097, 'Menzel_Bouzelfa', 'Féminin', 4, 25, 51, 68, 42, 24, 7, 7, 4, 68, 1663, 9, 7, 687, 3, 158, 360, 21, 472, 62, 46, 2, 360, 3064, 46.39, 'Rural', 930, 5424, NULL),
(197, 1077, 3327, 2608, 1085, 8738, 'Beni_Khalled', 'Masculin', 6, 57, 126, 145, 62, 29, 11, 12, 30, 252, 1002, 855, 305, 938, 149, 878, 48, 17, 1038, 539, 98, 89, 7.83, 5650, 70.15, 'Communal', 1632, 3794, NULL),
(198, 1077, 3274, 5552, 1085, 8962, 'Beni_Khalled', 'Féminin', 1, 24, 100, 157, 94, 33, 18, 16, 9, 149, 1047, 10, 28, 114, 7, 664, 772, 15, 869, 217, 48, 7, 772, 2957, 38.06, 'Communal', 1632, 3794, NULL),
(199, 1077, 2706, 1517, 1085, 5478, 'Beni_Khalled', 'Masculin', 4, 35, 72, 63, 36, 16, 14, 11, 13, 148, 671, 553, 273, 1134, 85, 291, 47, 8, 500, 212, 82, 59, 6.66, 3697, 72.31, 'Rural', 1632, 3794, NULL),
(200, 1077, 2184, 3233, 1085, 5601, 'Beni_Khalled', 'Féminin', 2, 25, 50, 66, 25, 20, 11, 3, 5, 85, 778, 7, 14, 346, 7, 156, 514, 9, 710, 146, 47, 2, 514, 2161, 42.28, 'Rural', 1632, 3794, NULL),
(201, 2637, 2807, 2793, 1819, 9215, 'Grombalia', 'Masculin', 8, 40, 159, 152, 84, 26, 29, 10, 19, 285, 1991, 415, 275, 154, 226, 1212, 97, 15, 881, 877, 103, 86, 8.14, 5899, 69.7, 'Communal', 6559, 11015, NULL),
(202, 2637, 3039, 5217, 1819, 9467, 'Grombalia', 'Féminin', 9, 22, 117, 246, 159, 47, 32, 27, 24, 226, 1741, 8, 35, 39, 20, 961, 1089, 23, 363, 402, 97, 19, 1089, 3577, 44.89, 'Communal', 6559, 11015, NULL),
(203, 2637, 7919, 4676, 1819, 16238, 'Grombalia', 'Masculin', 8, 199, 293, 263, 160, 85, 63, 40, 57, 556, 3221, 1617, 579, 1406, 297, 912, 229, 105, 1021, 1352, 416, 263, 10.23, 10379, 71.2, 'Rural', 6559, 11015, NULL),
(204, 2637, 6639, 9664, 1819, 16210, 'Grombalia', 'Féminin', 6, 87, 186, 213, 156, 87, 55, 27, 25, 297, 2946, 32, 79, 994, 10, 606, 1164, 101, 408, 626, 229, 8, 1164, 5705, 40.38, 'Rural', 6559, 11015, NULL),
(205, 2010, 1964, 1379, 1836, 4509, 'BouArgoub', 'Masculin', 0, 32, 79, 68, 28, 18, 13, 6, 14, 125, 880, 364, 163, 347, 77, 372, 70, 9, 260, 444, 72, 39, 8.34, 2869, 69.42, 'Communal', 939, 4785, NULL),
(206, 2010, 1777, 3023, 1836, 4457, 'BouArgoub', 'Féminin', 4, 20, 48, 88, 50, 24, 17, 9, 13, 77, 525, 3, 18, 81, 2, 252, 365, 8, 94, 182, 70, 4, 365, 1163, 32.17, 'Communal', 939, 4785, NULL),
(207, 2010, 3276, 2153, 1836, 7263, 'BouArgoub', 'Masculin', 5, 77, 141, 104, 73, 35, 18, 15, 23, 245, 1301, 487, 218, 1084, 103, 450, 97, 23, 341, 619, 183, 111, 9.67, 4616, 70.37, 'Rural', 939, 4785, NULL),
(208, 2010, 2728, 4842, 1836, 7015, 'BouArgoub', 'Féminin', 1, 31, 69, 104, 44, 37, 25, 14, 16, 103, 953, 1, 9, 459, 3, 186, 392, 39, 108, 110, 97, 2, 392, 1829, 30.97, 'Rural', 939, 4785, NULL),
(209, 2240, 10529, 8927, 3682, 29738, 'Hammamet', 'Masculin', 17, 190, 496, 532, 318, 136, 115, 74, 98, 1065, 1519, 2991, 870, 423, 711, 2578, 316, 75, 2538, 7795, 490, 83, 9.6, 18814, 69.98, 'Communal', 1374, 7296, NULL),
(210, 2240, 8615, 17919, 3682, 26890, 'Hammamet', 'Féminin', 21, 92, 367, 615, 378, 221, 121, 78, 56, 711, 813, 38, 53, 86, 64, 2187, 2887, 81, 863, 2962, 316, 11, 2887, 7034, 33.36, 'Communal', 1374, 7296, NULL),
(211, 2240, 4553, 2571, 3682, 9307, 'Hammamet', 'Masculin', 5, 132, 164, 145, 70, 67, 30, 24, 37, 280, 476, 1391, 404, 536, 146, 391, 138, 80, 571, 2184, 282, 98, 10.1, 6056, 72.38, 'Rural', 1374, 7296, NULL),
(212, 2240, 3421, 6686, 3682, 8917, 'Hammamet', 'Féminin', 2, 63, 102, 106, 59, 40, 31, 21, 10, 146, 392, 18, 14, 144, 4, 189, 471, 80, 171, 836, 138, 32, 471, 1798, 25.02, 'Rural', 1374, 7296, NULL),
(213, 3682, 10241, 8016, 17236, 28158, 'Zaghouan', 'Masculin', 15, 316, 670, 553, 356, 174, 114, 98, 108, 1291, 5486, 2343, 798, 727, 858, 4618, 442, 167, 2021, 1283, 638, 429, 12.02, 17720, 71.54, 'Communal', 4768, 25686, NULL),
(214, 3682, 9169, 16380, 17236, 29085, 'Zaghouan', 'Féminin', 13, 177, 442, 619, 439, 233, 142, 95, 82, 858, 6084, 26, 55, 152, 83, 2945, 2687, 239, 582, 550, 442, 47, 2687, 10454, 43.69, 'Communal', 4768, 25686, NULL),
(215, 3682, 15886, 12758, 17236, 36989, 'Zaghouan', 'Masculin', 12, 593, 920, 812, 505, 358, 203, 184, 244, 1689, 3148, 5219, 918, 4984, 801, 3031, 688, 668, 1541, 1094, 1295, 375, 16.13, 20322, 65.51, 'Rural', 4768, 25686, NULL),
(216, 3682, 11420, 27801, 17236, 38117, 'Zaghouan', 'Féminin', 11, 341, 637, 608, 389, 243, 179, 121, 68, 801, 4581, 79, 23, 1474, 42, 934, 1559, 674, 261, 319, 688, 23, 1559, 7705, 27.06, 'Rural', 4768, 25686, NULL),
(217, 656, 2330, 2393, 2370, 7807, 'Zaghouan', 'Masculin', 6, 41, 122, 141, 87, 28, 36, 12, 20, 250, 1249, 432, 219, 184, 163, 1763, 75, 23, 515, 398, 105, 154, 9.12, 4920, 69.35, 'Communal', 1635, 4661, NULL),
(218, 656, 2285, 4532, 2370, 8090, 'Zaghouan', 'Féminin', 4, 21, 98, 170, 112, 47, 24, 13, 21, 163, 1264, 7, 29, 31, 44, 1317, 878, 34, 157, 221, 75, 21, 878, 3051, 43.98, 'Communal', 1635, 4661, NULL),
(219, 656, 3052, 2185, 2370, 6819, 'Zaghouan', 'Masculin', 3, 48, 125, 137, 65, 52, 31, 16, 43, 228, 847, 781, 241, 822, 102, 819, 73, 104, 308, 218, 151, 67, 11.39, 4106, 67.96, 'Rural', 1635, 4661, NULL),
(220, 656, 2158, 4614, 2370, 6723, 'Zaghouan', 'Féminin', 3, 34, 70, 93, 60, 28, 23, 15, 15, 102, 1082, 21, 7, 260, 18, 281, 292, 72, 69, 38, 73, 7, 292, 1768, 31.37, 'Rural', 1635, 4661, NULL),
(221, 545, 1444, 1314, 2378, 4360, 'Ez-Zeriba', 'Masculin', 2, 31, 59, 54, 37, 24, 13, 18, 12, 114, 990, 444, 109, 83, 70, 641, 45, 25, 224, 217, 92, 88, 8.14, 2798, 69.89, 'Communal', 621, 3544, NULL),
(222, 545, 1195, 2339, 2378, 4342, 'Ez-Zeriba', 'Féminin', 3, 12, 39, 58, 46, 21, 21, 9, 7, 70, 1270, 3, 5, 19, 9, 324, 427, 39, 71, 71, 45, 18, 427, 1784, 46.13, 'Communal', 621, 3544, NULL),
(223, 545, 2167, 1691, 2378, 4969, 'Ez-Zeriba', 'Masculin', 4, 56, 86, 89, 44, 32, 19, 20, 20, 168, 601, 827, 127, 410, 55, 435, 58, 43, 172, 193, 137, 138, 11.32, 2907, 65.97, 'Rural', 621, 3544, NULL),
(224, 545, 1512, 3587, 2378, 4924, 'Ez-Zeriba', 'Féminin', 3, 32, 43, 33, 27, 19, 9, 6, 4, 55, 788, 6, 1, 143, 2, 121, 285, 39, 32, 56, 58, 10, 285, 1160, 27.15, 'Rural', 621, 3544, NULL),
(225, 205, 2340, 1334, 2059, 5224, 'Bir_Mchergua', 'Masculin', 2, 103, 167, 101, 75, 31, 21, 18, 23, 302, 1781, 274, 121, 142, 205, 535, 141, 36, 212, 163, 164, 116, 13.98, 3346, 74.46, 'Communal', 540, 2804, NULL),
(226, 205, 1857, 2871, 2059, 4953, 'Bir_Mchergua', 'Féminin', 1, 49, 86, 130, 99, 71, 39, 31, 19, 205, 926, 3, 3, 60, 8, 309, 501, 69, 159, 86, 141, 3, 501, 1550, 42.04, 'Communal', 540, 2804, NULL),
(227, 205, 1893, 1117, 2059, 4089, 'Bir_Mchergua', 'Masculin', 1, 106, 142, 112, 69, 65, 30, 28, 31, 303, 592, 290, 115, 676, 110, 331, 75, 71, 184, 101, 201, 81, 20.22, 2371, 72.68, 'Rural', 540, 2804, NULL),
(228, 205, 1364, 3009, 2059, 4023, 'Bir_Mchergua', 'Féminin', 1, 34, 78, 71, 40, 24, 22, 14, 7, 110, 391, 2, 9, 128, 2, 105, 306, 52, 50, 31, 75, 3, 306, 720, 25.21, 'Rural', 540, 2804, NULL),
(229, 757, 3006, 2321, 4649, 8258, 'Fahs', 'Masculin', 3, 108, 259, 206, 128, 83, 39, 37, 38, 525, 1170, 906, 300, 202, 345, 1182, 134, 52, 804, 388, 215, 66, 15.43, 5021, 71.89, 'Communal', 615, 6021, NULL),
(230, 757, 2913, 5000, 4649, 9040, 'Fahs', 'Féminin', 4, 74, 164, 206, 149, 69, 50, 36, 31, 345, 2190, 11, 17, 36, 19, 699, 534, 72, 150, 140, 134, 4, 534, 3251, 44.7, 'Communal', 615, 6021, NULL),
(231, 757, 3545, 2935, 4649, 8671, 'Fahs', 'Masculin', 2, 128, 243, 195, 130, 75, 47, 40, 58, 454, 557, 1013, 271, 1648, 223, 617, 135, 143, 415, 228, 265, 48, 16.34, 4799, 66.15, 'Rural', 615, 6021, NULL),
(232, 757, 2641, 6598, 4649, 8917, 'Fahs', 'Féminin', 1, 64, 160, 128, 98, 54, 50, 31, 13, 223, 1173, 14, 2, 233, 6, 150, 263, 129, 57, 87, 135, 0, 263, 1717, 26.01, 'Rural', 615, 6021, NULL),
(233, 1167, 1121, 654, 3344, 2509, 'En-Nadhour', 'Masculin', 2, 33, 63, 51, 29, 8, 5, 13, 15, 100, 296, 287, 49, 116, 75, 497, 47, 31, 266, 117, 62, 5, 11.86, 1635, 73.93, 'Communal', 931, 5442, NULL);
INSERT INTO `unemployedpopulation` (`population_id`, `between_1km_2km`, `distribution_of_population`, `inactive_population`, `plus2km`, `population_aged_15_and_plus`, `regions`, `sexe`, `unemployed_15_19_years_age`, `unemployed_20_24_years_age`, `unemployed_25_29_years_age`, `unemployed_30_34_years_age`, `unemployed_35_39_years_age`, `unemployed_40_44_years_age`, `unemployed_45_49_years_age`, `unemployed_50_59_years_age`, `unemployed_60plus_years`, `unemployed_agriculture_fishing`, `unemployed_building_public_works`, `unemployed_commerce`, `unemployed_education_health_administrative_services`, `unemployed_mines_energy`, `unemployed_néant`, `unemployed_other_services`, `unemployed_primary`, `unemployed_secondary`, `unemployed_transport`, `unemployed_undeclared`, `unemployed_faculty`, `unemployed_manufacturing_industry`, `unemployment_rate`, `active_population_occupied`, `activity_rate`, `environment`, `less_than_1km`, `number_houses`, `unemployed_neant`) VALUES
(234, 1167, 919, 1638, 3344, 2660, 'En-Nadhour', 'Féminin', 1, 21, 54, 54, 32, 24, 8, 6, 4, 75, 434, 2, 1, 6, 3, 296, 347, 25, 45, 32, 47, 1, 347, 818, 38.44, 'Communal', 931, 5442, NULL),
(235, 1167, 3178, 3231, 3344, 7806, 'En-Nadhour', 'Masculin', 6, 116, 174, 151, 124, 88, 41, 48, 62, 241, 302, 1353, 112, 1074, 152, 389, 236, 223, 306, 194, 299, 15, 18.01, 3751, 58.6, 'Rural', 931, 5442, NULL),
(236, 1167, 2339, 6256, 3344, 8516, 'En-Nadhour', 'Féminin', 0, 123, 165, 170, 111, 71, 46, 41, 25, 152, 714, 18, 2, 554, 6, 130, 159, 296, 16, 65, 236, 1, 159, 1500, 26.54, 'Rural', 931, 5442, NULL),
(237, 351, 2051, 1599, 2438, 4635, 'Saouaf', 'Masculin', -1, 139, 150, 128, 73, 46, 35, 32, 30, 295, 248, 954, 52, 354, 160, 439, 112, 84, 156, 160, 242, 26, 21.34, 2388, 65.5, 'Rural', 425, 3214, NULL),
(238, 351, 1406, 3737, 2438, 5014, 'Saouaf', 'Féminin', 2, 54, 120, 113, 53, 47, 29, 14, 4, 160, 434, 18, 2, 156, 8, 147, 254, 87, 37, 42, 112, 2, 254, 840, 25.47, 'Rural', 425, 3214, NULL),
(239, 10750, 52305, 50128, 31402, 140047, 'Bizerte', 'Masculin', 151, 934, 2493, 2835, 1593, 783, 433, 298, 402, 5242, 18244, 13328, 5092, 6295, 2789, 19405, 963, 422, 10925, 5414, 2349, 1177, 11, 80031, 64.2, 'Communal', 9829, 51981, NULL),
(240, 10750, 48949, 99983, 31402, 143470, 'Bizerte', 'Féminin', 103, 394, 1622, 2783, 1588, 802, 342, 198, 177, 2789, 17450, 314, 282, 295, 245, 12005, 9073, 318, 2537, 2409, 963, 148, 9073, 35543, 30.31, 'Communal', 9829, 51981, NULL),
(241, 10750, 33264, 25323, 31402, 76474, 'Bizerte', 'Masculin', 51, 820, 1353, 1142, 721, 438, 296, 259, 396, 2343, 6271, 10689, 1856, 16769, 890, 4742, 521, 1010, 3382, 1313, 1803, 538, 10.83, 45611, 66.89, 'Rural', 9829, 51981, NULL),
(242, 10750, 23856, 60333, 31402, 73298, 'Bizerte', 'Féminin', 21, 354, 660, 753, 355, 170, 89, 62, 55, 890, 6325, 193, 40, 1649, 44, 1341, 1970, 348, 462, 385, 521, 28, 1970, 10444, 17.69, 'Rural', 9829, 51981, NULL),
(243, 182, 9322, 12244, 431, 32048, 'Bizerte', 'Masculin', 44, 129, 512, 682, 374, 165, 95, 58, 60, 1093, 3188, 1792, 1721, 461, 614, 5719, 133, 64, 2854, 1654, 356, 281, 10.55, 17714, 61.79, 'Communal', 327, 940, NULL),
(244, 182, 9455, 23294, 431, 33053, 'Bizerte', 'Féminin', 33, 56, 322, 688, 402, 197, 83, 36, 34, 614, 1978, 65, 98, 22, 128, 4259, 1911, 43, 682, 749, 133, 44, 1911, 7930, 29.52, 'Communal', 327, 940, NULL),
(245, 182, 688, 478, 431, 1428, 'Bizerte', 'Masculin', 2, 15, 26, 26, 14, 2, 5, 4, 4, 47, 127, 330, 32, 136, 9, 107, 6, 11, 53, 49, 24, 18, 10.11, 854, 66.53, 'Rural', 327, 940, NULL),
(246, 182, 522, 1114, 431, 1268, 'Bizerte', 'Féminin', 0, 2, 8, 8, 3, 1, 0, 0, 0, 9, 81, 1, 1, 3, 10, 29, 28, 0, 8, 8, 6, 0, 28, 131, 12.21, 'Rural', 327, 940, NULL),
(247, 1349, 3254, 3642, 122, 9386, 'Zarzouna', 'Masculin', 9, 72, 183, 197, 115, 68, 31, 27, 30, 408, 1325, 741, 301, 210, 259, 1269, 80, 24, 687, 400, 181, 69, 12.76, 5011, 61.2, 'Communal', 6396, 7867, NULL),
(248, 1349, 3207, 6803, 122, 9809, 'Zarzouna', 'Féminin', 8, 33, 135, 196, 115, 63, 15, 18, 25, 259, 1273, 14, 13, 6, 11, 672, 1149, 20, 209, 199, 80, 9, 1149, 2403, 30.64, 'Communal', 6396, 7867, NULL),
(249, 1785, 4026, 3190, 3198, 10766, 'Bizerte', 'Masculin', 8, 97, 204, 178, 101, 53, 27, 8, 31, 402, 1149, 1409, 542, 123, 275, 2236, 76, 18, 843, 423, 188, 138, 9.31, 6871, 70.37, 'Communal', 1759, 6742, NULL),
(250, 1785, 3582, 7458, 3198, 10904, 'Bizerte', 'Féminin', 4, 55, 159, 177, 159, 50, 25, 13, 12, 275, 1271, 15, 27, 22, 20, 926, 1622, 24, 207, 301, 76, 19, 1622, 2792, 31.6, 'Communal', 1759, 6742, NULL),
(251, 1785, 5151, 3223, 3198, 10132, 'Bizerte', 'Masculin', 6, 128, 198, 209, 144, 61, 54, 44, 64, 390, 1261, 1726, 321, 1053, 170, 641, 114, 100, 549, 303, 369, 137, 13.2, 5997, 68.19, 'Rural', 1759, 6742, NULL),
(252, 1785, 3685, 7636, 3198, 9574, 'Bizerte', 'Féminin', 1, 57, 98, 132, 85, 31, 23, 9, 8, 170, 1022, 22, 10, 49, 4, 217, 345, 35, 79, 80, 114, 6, 345, 1486, 20.24, 'Rural', 1759, 6742, NULL),
(253, 1049, 692, 670, 7607, 2033, 'Sedjnane', 'Masculin', 6, 14, 35, 49, 20, 2, 6, 4, 5, 86, 86, 108, 53, 82, 56, 607, 30, 4, 171, 90, 26, 24, 9.98, 1227, 67.04, 'Communal', 141, 8797, NULL),
(254, 1049, 735, 1448, 7607, 2089, 'Sedjnane', 'Féminin', 4, 7, 34, 71, 36, 12, 5, 5, 8, 56, 69, 4, 4, 5, 9, 279, 142, 8, 57, 38, 30, 3, 142, 463, 30.68, 'Communal', 141, 8797, NULL),
(255, 1049, 4784, 4872, 7607, 13020, 'Sedjnane', 'Masculin', 5, 175, 280, 203, 150, 122, 77, 85, 133, 415, 288, 2514, 243, 1998, 129, 1046, 65, 404, 578, 162, 378, 38, 15.66, 6872, 62.58, 'Rural', 141, 8797, NULL),
(256, 1049, 3124, 11439, 7607, 12728, 'Sedjnane', 'Féminin', 3, 70, 118, 117, 57, 21, 21, 17, 7, 129, 239, 44, 2, 347, 1, 155, 135, 121, 37, 29, 65, 0, 135, 856, 10.13, 'Rural', 141, 8797, NULL),
(257, 1078, 4185, 4012, 4837, 11008, 'Djoumine', 'Masculin', 9, 104, 192, 167, 85, 52, 33, 28, 39, 342, 296, 1756, 104, 3032, 128, 608, 38, 145, 325, 113, 163, 41, 10.18, 6284, 63.55, 'Rural', 802, 6717, NULL),
(258, 1078, 2945, 10045, 4837, 10970, 'Djoumine', 'Féminin', 2, 34, 97, 112, 33, 17, 4, 2, 3, 128, 187, 45, 3, 106, 10, 163, 98, 32, 36, 77, 38, 1, 98, 620, 8.43, 'Rural', 802, 6717, NULL),
(259, 322, 4224, 4171, 3222, 12250, 'Mateur', 'Masculin', 16, 90, 297, 355, 226, 101, 61, 44, 66, 658, 1763, 790, 396, 578, 289, 1460, 118, 84, 1250, 488, 308, 80, 15.57, 6821, 65.95, 'Communal', 48, 3592, NULL),
(260, 322, 3932, 8553, 3222, 12861, 'Mateur', 'Féminin', 14, 42, 166, 276, 141, 86, 43, 37, 30, 289, 2168, 33, 19, 64, 18, 802, 440, 61, 172, 202, 118, 9, 440, 3483, 33.5, 'Communal', 48, 3592, NULL),
(261, 322, 2624, 1943, 3222, 5749, 'Mateur', 'Masculin', 2, 72, 136, 96, 69, 32, 17, 15, 20, 238, 432, 478, 136, 1676, 99, 295, 41, 51, 227, 67, 156, 29, 12.19, 3342, 66.2, 'Rural', 48, 3592, NULL),
(262, 322, 1809, 4300, 3222, 5485, 'Mateur', 'Féminin', 1, 39, 68, 60, 19, 12, 4, 2, 2, 99, 630, 12, 0, 205, 7, 72, 157, 16, 33, 24, 41, 1, 157, 978, 21.61, 'Rural', 48, 3592, NULL),
(263, 471, 4264, 3897, 4547, 10880, 'Ghezala', 'Masculin', 2, 114, 214, 193, 134, 82, 83, 56, 87, 398, 551, 1602, 173, 2226, 181, 784, 103, 219, 424, 158, 302, 80, 14.08, 6000, 64.18, 'Rural', 1803, 6821, NULL),
(264, 471, 2666, 8104, 4547, 10390, 'Ghezala', 'Féminin', 3, 61, 128, 147, 64, 37, 18, 17, 21, 181, 908, 33, 4, 484, 3, 228, 286, 91, 60, 63, 103, 5, 286, 1788, 22.01, 'Rural', 1803, 6821, NULL),
(265, 713, 8287, 8428, 776, 20676, 'Menzel_Bourguiba', 'Masculin', 21, 160, 445, 535, 356, 198, 106, 87, 102, 1036, 3463, 1402, 486, 222, 530, 2300, 224, 117, 1504, 659, 596, 170, 16.5, 10227, 59.23, 'Communal', 520, 2009, NULL),
(266, 713, 7504, 14830, 776, 21629, 'Menzel_Bourguiba', 'Féminin', 16, 58, 291, 431, 279, 162, 73, 44, 34, 530, 3090, 36, 22, 56, 24, 1508, 561, 74, 337, 334, 224, 22, 561, 5421, 31.44, 'Communal', 520, 2009, NULL),
(267, 713, 1382, 914, 776, 2847, 'Menzel_Bourguiba', 'Masculin', 0, 36, 55, 36, 20, 16, 4, 4, 4, 75, 526, 323, 73, 525, 31, 141, 21, 12, 110, 37, 78, 22, 9.11, 1757, 67.9, 'Rural', 520, 2009, NULL),
(268, 713, 1103, 2027, 776, 2709, 'Menzel_Bourguiba', 'Féminin', 0, 12, 21, 22, 14, 9, 3, 2, 1, 31, 468, 7, 1, 36, 4, 62, 29, 8, 18, 6, 21, 1, 29, 599, 25.18, 'Rural', 520, 2009, NULL),
(269, 58, 3201, 3470, 413, 8297, 'Tinja', 'Masculin', 9, 72, 233, 241, 141, 66, 35, 21, 30, 469, 1368, 547, 224, 175, 202, 1004, 114, 51, 361, 197, 195, 90, 17.65, 3975, 58.18, 'Communal', 123, 594, NULL),
(270, 58, 3074, 5952, 413, 8551, 'Tinja', 'Féminin', 5, 27, 122, 212, 86, 65, 40, 22, 13, 202, 1005, 6, 15, 10, 5, 692, 520, 34, 159, 110, 114, 8, 520, 2010, 30.39, 'Communal', 123, 594, NULL),
(271, 58, 423, 280, 413, 903, 'Tinja', 'Masculin', 4, 15, 18, 28, 17, 10, 3, 2, 3, 43, 142, 82, 33, 149, 9, 51, 5, 8, 44, 10, 41, 9, 15.89, 524, 68.88, 'Rural', 123, 594, NULL),
(272, 58, 286, 666, 413, 843, 'Tinja', 'Féminin', 0, 5, 10, 10, 2, 0, 0, 0, 0, 9, 109, 2, 0, 18, 0, 13, 60, 3, 4, 3, 5, 1, 60, 150, 21.02, 'Rural', 123, 594, NULL),
(273, 983, 2999, 2191, 2587, 7664, 'Utique', 'Masculin', 8, 50, 78, 75, 33, 26, 5, 13, 14, 142, 898, 439, 198, 2485, 46, 476, 51, 42, 444, 146, 87, 79, 5.48, 5173, 71.42, 'Rural', 1425, 4995, NULL),
(274, 983, 2403, 5901, 2587, 7113, 'Utique', 'Féminin', 3, 26, 40, 48, 28, 13, 7, 3, 4, 46, 638, 9, 8, 153, 1, 132, 257, 20, 55, 34, 51, 9, 257, 1041, 17.04, 'Rural', 1425, 4995, NULL),
(275, 727, 1860, 1184, 1427, 3932, 'Ghar_Meleh', 'Masculin', -1, 23, 28, 47, 20, 6, 8, 1, 6, 61, 356, 443, 132, 877, 40, 377, 12, 3, 282, 108, 38, 33, 5.13, 2607, 69.89, 'Communal', 429, 2583, NULL),
(276, 727, 1745, 3035, 1427, 3889, 'Ghar_Meleh', 'Féminin', 2, 7, 40, 50, 26, 15, 5, 1, 1, 40, 396, 10, 12, 15, 6, 188, 197, 4, 43, 40, 12, 3, 197, 709, 21.96, 'Communal', 429, 2583, NULL),
(277, 727, 2082, 840, 1427, 3501, 'Ghar_Meleh', 'Masculin', 3, 25, 35, 25, 11, 6, 2, 1, 0, 51, 198, 124, 264, 1596, 18, 122, 11, 0, 181, 50, 50, 16, 4.02, 2554, 76.01, 'Rural', 429, 2583, NULL),
(278, 727, 1614, 2670, 1427, 3271, 'Ghar_Meleh', 'Féminin', 1, 12, 17, 24, 5, 4, 0, 1, 0, 18, 410, 1, 4, 31, 1, 60, 95, 0, 16, 13, 11, 2, 95, 538, 18.37, 'Rural', 429, 2583, NULL),
(279, 442, 6203, 5248, 762, 15700, 'Menzel_Djemil', 'Masculin', 14, 157, 335, 338, 128, 72, 35, 29, 37, 638, 2158, 2044, 482, 778, 353, 2084, 122, 30, 1081, 530, 278, 132, 10.99, 9303, 66.57, 'Communal', 607, 1811, NULL),
(280, 442, 5722, 10760, 762, 16025, 'Menzel_Djemil', 'Féminin', 6, 57, 186, 377, 177, 86, 40, 18, 17, 353, 2489, 33, 40, 28, 10, 1160, 1692, 25, 303, 229, 122, 15, 1692, 4303, 32.85, 'Communal', 607, 1811, NULL),
(281, 442, 1105, 527, 762, 2260, 'Menzel_Djemil', 'Masculin', 0, 48, 55, 36, 22, 13, 6, 3, 12, 94, 589, 214, 74, 377, 25, 84, 29, 8, 110, 57, 90, 29, 11.48, 1534, 76.64, 'Rural', 607, 1811, NULL),
(282, 442, 854, 1296, 762, 2182, 'Menzel_Djemil', 'Féminin', 0, 18, 14, 22, 11, 7, 0, 3, 7, 25, 546, 2, 2, 134, 1, 50, 221, 6, 58, 12, 29, 0, 221, 804, 40.6, 'Rural', 607, 1811, NULL),
(283, 1254, 2994, 2180, 743, 6708, 'Alia', 'Masculin', 5, 58, 96, 51, 31, 15, 10, 4, 17, 143, 626, 876, 379, 1024, 45, 606, 16, 11, 513, 163, 80, 52, 6.27, 4244, 67.49, 'Communal', 439, 2436, NULL),
(284, 1254, 2538, 5021, 743, 6417, 'Alia', 'Féminin', 1, 12, 44, 91, 41, 18, 4, 2, 0, 45, 634, 14, 11, 23, 4, 368, 202, 8, 91, 33, 16, 7, 202, 1182, 21.75, 'Communal', 439, 2436, NULL),
(285, 1254, 1510, 982, 743, 3267, 'Alia', 'Masculin', 7, 27, 39, 34, 12, 4, 3, 1, 8, 78, 475, 400, 117, 720, 38, 154, 22, 7, 194, 78, 27, 11, 5.65, 2156, 69.94, 'Rural', 439, 2436, NULL),
(286, 1254, 1239, 2224, 743, 3064, 'Alia', 'Féminin', 2, 15, 25, 26, 21, 9, 5, 4, 1, 38, 543, 11, 0, 68, 0, 62, 184, 13, 30, 17, 22, 1, 184, 734, 27.42, 'Rural', 439, 2436, NULL),
(287, 1689, 8242, 5701, 850, 18251, 'RasDjebel', 'Masculin', 18, 62, 124, 161, 81, 37, 19, 15, 18, 249, 2762, 3177, 376, 1765, 126, 1743, 38, 16, 1380, 702, 102, 108, 4.14, 12031, 68.76, 'Communal', 1405, 3944, NULL),
(288, 1689, 7455, 12829, 850, 18243, 'RasDjebel', 'Féminin', 10, 40, 123, 214, 126, 48, 9, 2, 3, 126, 3076, 84, 21, 44, 10, 1152, 637, 17, 277, 174, 38, 9, 637, 4847, 29.68, 'Communal', 1405, 3944, NULL),
(289, 1689, 2067, 1164, 850, 3815, 'RasDjebel', 'Masculin', 2, 11, 26, 13, 10, 12, 4, 3, 8, 30, 488, 702, 88, 796, 7, 233, 15, 2, 143, 83, 37, 29, 3.28, 2564, 69.49, 'Rural', 1405, 3944, NULL),
(290, 1689, 1606, 2911, 850, 3701, 'RasDjebel', 'Féminin', 3, 2, 15, 25, 12, 9, 4, 2, 1, 7, 546, 4, 5, 15, 2, 98, 75, 3, 28, 19, 15, 1, 75, 719, 21.35, 'Rural', 1405, 3944, NULL),
(291, 27107, 65054, 15869, 138948, 43660, 'Nord_Ouest', 'Masculin', 132, 1378, 4372, 4872, 2951, 1486, 866, 700, 1044, 9013, 9721, 14872, 6163, 6337, 6020, 36750, 3098, 1102, 16620, 8475, 4601, 1886, 12.38, 24351, 63.65, 'Communal', 22114, 188169, NULL),
(292, 27107, 56887, 28517, 138948, 46463, 'Nord_Ouest', 'Féminin', 82, 603, 3202, 5659, 3806, 2043, 1198, 850, 724, 6020, 7496, 201, 409, 1535, 623, 25651, 13735, 1384, 3923, 4049, 3098, 283, 13735, 14392, 38.62, 'Communal', 22114, 188169, NULL),
(293, 27107, 112682, 22052, 138948, 58604, 'Nord_Ouest', 'Masculin', 149, 2867, 5273, 5279, 3478, 2310, 1529, 1389, 2326, 9772, 5629, 34904, 5472, 47330, 4561, 18366, 3083, 4348, 10371, 4533, 8974, 1145, 14.72, 31170, 62.37, 'Rural', 22114, 188169, NULL),
(294, 27107, 76592, 46667, 138948, 66057, 'Nord_Ouest', 'Féminin', 66, 1380, 3337, 4164, 2387, 1232, 733, 507, 483, 4561, 4520, 381, 127, 12019, 296, 5997, 6890, 2068, 1344, 1434, 3083, 76, 6890, 15525, 29.35, 'Rural', 22114, 188169, NULL),
(295, 6227, 17316, 16986, 31820, 51103, 'Beja', 'Masculin', 34, 399, 1240, 1190, 721, 380, 240, 157, 253, 2370, 3955, 4241, 1781, 2397, 1738, 9138, 744, 378, 4921, 2458, 1093, 490, 13.78, 29415, 66.76, 'Communal', 6366, 44413, NULL),
(296, 6227, 15194, 35990, 31820, 53246, 'Beja', 'Féminin', 26, 178, 872, 1412, 959, 553, 320, 210, 204, 1738, 3434, 68, 118, 548, 143, 6152, 3646, 356, 985, 1094, 744, 83, 3646, 12508, 32.41, 'Communal', 6366, 44413, NULL),
(297, 6227, 27794, 23923, 31820, 65014, 'Beja', 'Masculin', 46, 673, 1211, 1196, 778, 505, 270, 231, 430, 2145, 1982, 8208, 1426, 14823, 1104, 4778, 751, 943, 2776, 1188, 1922, 360, 13.39, 35587, 63.2, 'Rural', 6366, 44413, NULL),
(298, 6227, 18827, 55130, 31820, 65559, 'Beja', 'Féminin', 19, 351, 812, 857, 565, 312, 185, 135, 137, 1104, 2048, 95, 29, 2854, 59, 1298, 1603, 571, 364, 313, 751, 19, 1603, 7039, 15.91, 'Rural', 6366, 44413, NULL),
(299, 463, 6236, 6218, 4448, 18815, 'Beja', 'Masculin', 12, 150, 497, 490, 295, 180, 88, 64, 116, 992, 1697, 1306, 769, 354, 791, 3474, 338, 114, 2107, 751, 460, 199, 15.31, 10669, 66.95, 'Communal', 585, 5496, NULL),
(300, 463, 5313, 12417, 4448, 19696, 'Beja', 'Féminin', 8, 73, 344, 574, 426, 255, 162, 110, 101, 791, 1527, 22, 56, 83, 73, 2616, 1632, 144, 440, 432, 338, 36, 1632, 5220, 36.96, 'Communal', 585, 5496, NULL),
(301, 463, 4150, 2693, 4448, 8737, 'Beja', 'Masculin', 9, 86, 132, 111, 81, 54, 23, 24, 53, 241, 286, 938, 168, 3189, 141, 430, 92, 94, 316, 106, 215, 15, 9.71, 5457, 69.18, 'Rural', 585, 5496, NULL),
(302, 463, 2577, 6823, 4448, 8567, 'Beja', 'Féminin', 6, 48, 112, 103, 46, 40, 23, 15, 19, 141, 319, 4, 3, 822, 18, 98, 301, 74, 47, 34, 92, 1, 301, 1334, 20.36, 'Rural', 585, 5496, NULL),
(303, 799, 2394, 2709, 2733, 8108, 'Beja', 'Masculin', 5, 61, 176, 170, 117, 60, 45, 21, 27, 368, 614, 582, 289, 315, 253, 1678, 80, 33, 649, 469, 129, 110, 12.74, 4711, 66.58, 'Communal', 1031, 4563, NULL),
(304, 799, 2071, 5424, 2733, 8459, 'Beja', 'Féminin', 6, 34, 116, 221, 159, 77, 41, 27, 18, 253, 544, 13, 28, 101, 28, 1258, 885, 26, 124, 238, 80, 25, 885, 2337, 35.88, 'Communal', 1031, 4563, NULL),
(305, 799, 2868, 2095, 2733, 6648, 'Beja', 'Masculin', 11, 80, 145, 146, 96, 56, 30, 20, 37, 276, 213, 707, 270, 1618, 127, 608, 79, 71, 293, 141, 215, 62, 13.84, 3923, 68.48, 'Rural', 1031, 4563, NULL),
(306, 799, 1889, 5517, 2733, 6799, 'Beja', 'Féminin', 3, 35, 82, 111, 72, 46, 30, 14, 16, 127, 218, 10, 6, 395, 11, 158, 190, 76, 52, 30, 79, 1, 190, 873, 18.86, 'Rural', 1031, 4563, NULL),
(307, 351, 852, 617, 3497, 2022, 'Amdoun', 'Masculin', 0, 14, 42, 28, 27, 14, 5, 4, 5, 83, 109, 224, 51, 150, 41, 437, 33, 3, 180, 90, 34, 19, 10.32, 1260, 69.49, 'Communal', 42, 3890, NULL),
(308, 351, 821, 1550, 3497, 2052, 'Amdoun', 'Féminin', 0, 2, 24, 44, 40, 22, 11, 7, 2, 41, 90, 4, 3, 6, 2, 209, 117, 7, 16, 19, 33, 2, 117, 349, 24.46, 'Communal', 42, 3890, NULL),
(309, 351, 2674, 2645, 3497, 5967, 'Amdoun', 'Masculin', 1, 76, 88, 90, 68, 52, 31, 28, 49, 126, 122, 774, 112, 1301, 54, 294, 41, 146, 154, 43, 192, 20, 15.08, 2821, 55.67, 'Rural', 42, 3890, NULL),
(310, 351, 1542, 5446, 3497, 5989, 'Amdoun', 'Féminin', 2, 34, 57, 70, 38, 12, 8, 2, 1, 54, 118, 9, 0, 87, 7, 73, 58, 46, 10, 20, 41, 1, 58, 320, 9.07, 'Rural', 42, 3890, NULL),
(311, 1999, 831, 971, 8465, 2701, 'Nefza', 'Masculin', 3, 12, 55, 63, 44, 11, 10, 4, 6, 125, 95, 159, 109, 46, 74, 619, 21, 10, 332, 133, 38, 20, 12.37, 1516, 64.07, 'Communal', 826, 11290, NULL),
(312, 1999, 773, 2001, 8465, 2813, 'Nefza', 'Féminin', 2, 1, 31, 89, 60, 25, 8, 7, 3, 74, 73, 4, 5, 10, 7, 364, 209, 5, 68, 54, 21, 7, 209, 587, 28.87, 'Communal', 826, 11290, NULL),
(313, 1999, 5867, 6678, 8465, 15572, 'Nefza', 'Masculin', 10, 137, 239, 259, 160, 105, 53, 50, 108, 406, 338, 3208, 271, 1587, 254, 1090, 178, 271, 805, 348, 387, 57, 13.27, 7714, 57.12, 'Rural', 826, 11290, NULL),
(314, 1999, 4164, 14403, 8465, 16407, 'Nefza', 'Féminin', 4, 84, 201, 199, 128, 61, 40, 44, 35, 254, 361, 34, 7, 324, 7, 297, 170, 176, 69, 98, 178, 4, 170, 1198, 12.21, 'Rural', 826, 11290, NULL),
(315, 338, 1735, 1551, 1771, 4452, 'Teboursouk', 'Masculin', 0, 61, 135, 121, 71, 30, 32, 18, 41, 265, 172, 465, 148, 286, 175, 591, 97, 38, 431, 241, 138, 39, 18.2, 2373, 65.16, 'Communal', 625, 2734, NULL),
(316, 338, 1509, 3549, 1771, 4751, 'Teboursouk', 'Féminin', 4, 16, 95, 133, 67, 59, 32, 19, 31, 175, 61, 4, 4, 141, 11, 395, 164, 39, 68, 60, 97, 6, 164, 743, 25.32, 'Communal', 625, 2734, NULL),
(317, 338, 1765, 1487, 1771, 4066, 'Teboursouk', 'Masculin', 3, 44, 105, 82, 55, 39, 23, 21, 32, 150, 92, 407, 66, 1045, 66, 291, 54, 103, 153, 67, 142, 40, 16.09, 2164, 63.42, 'Rural', 625, 2734, NULL),
(318, 338, 1174, 3474, 1771, 3968, 'Teboursouk', 'Féminin', 1, 26, 61, 54, 25, 15, 6, 3, 8, 66, 51, 5, 0, 151, 1, 63, 118, 30, 17, 8, 54, 0, 118, 296, 12.45, 'Rural', 625, 2734, NULL),
(319, 700, 2023, 1539, 2176, 4048, 'Tibar', 'Masculin', 3, 38, 80, 90, 63, 44, 29, 17, 38, 188, 66, 243, 60, 794, 111, 607, 61, 29, 169, 98, 165, 57, 16.42, 2097, 61.98, 'Rural', 467, 3343, NULL),
(320, 700, 1655, 3619, 2176, 4397, 'Tibar', 'Féminin', 0, 24, 58, 79, 66, 32, 16, 6, 16, 111, 92, 1, 3, 104, 5, 221, 256, 13, 28, 22, 61, 6, 256, 477, 17.67, 'Rural', 467, 3343, NULL),
(321, 687, 1702, 1659, 2710, 4977, 'Testour', 'Masculin', 4, 31, 96, 107, 45, 29, 15, 14, 11, 175, 243, 498, 82, 752, 123, 732, 53, 34, 388, 225, 91, 39, 10.7, 2963, 66.69, 'Communal', 1922, 5319, NULL),
(322, 687, 1516, 3952, 2710, 5148, 'Testour', 'Féminin', 2, 17, 75, 100, 55, 23, 23, 4, 3, 123, 245, 2, 6, 75, 7, 373, 176, 20, 86, 104, 53, 0, 176, 893, 23.23, 'Communal', 1922, 5319, NULL),
(323, 687, 3240, 2834, 2710, 7936, 'Testour', 'Masculin', 2, 106, 187, 181, 112, 68, 45, 31, 56, 331, 234, 799, 149, 2125, 206, 555, 148, 114, 240, 139, 277, 47, 15.92, 4290, 64.29, 'Rural', 1922, 5319, NULL),
(324, 687, 2248, 6189, 2710, 7667, 'Testour', 'Féminin', 1, 53, 136, 128, 90, 63, 42, 37, 26, 206, 310, 19, 3, 310, 4, 152, 225, 99, 57, 41, 148, 3, 225, 896, 19.28, 'Rural', 1922, 5319, NULL),
(325, 136, 598, 480, 2753, 1517, 'Goubellat', 'Masculin', -1, 14, 48, 39, 33, 10, 8, 5, 5, 84, 107, 170, 39, 80, 56, 234, 32, 8, 142, 89, 47, 12, 15.91, 872, 68.36, 'Communal', 92, 2981, NULL),
(326, 136, 557, 1145, 2753, 1539, 'Goubellat', 'Féminin', 0, 5, 35, 45, 33, 21, 5, 6, 9, 56, 51, 7, 5, 20, 0, 114, 55, 10, 22, 15, 32, 0, 55, 234, 25.54, 'Communal', 92, 2981, NULL),
(327, 136, 1966, 1849, 2753, 4447, 'Goubellat', 'Masculin', 1, 60, 101, 116, 75, 56, 27, 32, 44, 184, 85, 466, 69, 902, 63, 207, 45, 94, 273, 53, 212, 10, 20.48, 2066, 58.41, 'Rural', 92, 2981, NULL),
(328, 136, 1249, 3792, 2753, 4388, 'Goubellat', 'Féminin', 1, 27, 38, 56, 46, 20, 8, 7, 8, 63, 53, 2, 1, 236, 0, 62, 57, 38, 19, 7, 45, 1, 57, 382, 13.59, 'Rural', 92, 2981, NULL),
(329, 755, 2968, 2781, 3266, 8511, 'Medjez_El_Bab', 'Masculin', 7, 56, 191, 171, 89, 46, 37, 27, 42, 279, 919, 838, 294, 414, 225, 1374, 90, 138, 693, 460, 156, 52, 11.85, 5051, 67.33, 'Communal', 776, 4797, NULL),
(330, 755, 2634, 5952, 3266, 8788, 'Medjez_El_Bab', 'Féminin', 5, 30, 152, 206, 119, 71, 38, 30, 37, 225, 842, 12, 11, 112, 15, 823, 408, 105, 161, 172, 90, 7, 408, 2145, 32.26, 'Communal', 776, 4797, NULL),
(331, 755, 3241, 2103, 3266, 7593, 'Medjez_El_Bab', 'Masculin', 5, 45, 135, 121, 67, 30, 9, 8, 13, 243, 546, 666, 261, 2262, 83, 697, 54, 21, 373, 193, 117, 52, 7.92, 5055, 72.31, 'Rural', 776, 4797, NULL),
(332, 755, 2329, 5867, 3266, 7377, 'Medjez_El_Bab', 'Féminin', 0, 19, 66, 57, 53, 23, 12, 7, 8, 83, 526, 11, 6, 426, 6, 174, 228, 20, 65, 53, 54, 2, 228, 1263, 20.48, 'Rural', 776, 4797, NULL),
(333, 12597, 15720, 16931, 58342, 46351, 'Jendouba', 'Masculin', 26, 363, 1178, 1474, 956, 493, 240, 214, 315, 2720, 1825, 3094, 1415, 999, 1738, 9406, 893, 227, 4361, 2529, 1381, 422, 18.16, 24077, 63.47, 'Communal', 9829, 80768, NULL),
(334, 12597, 14133, 33887, 58342, 49569, 'Jendouba', 'Féminin', 19, 124, 835, 1764, 1193, 665, 353, 231, 204, 1738, 840, 48, 103, 203, 175, 6855, 3277, 323, 918, 1192, 893, 69, 3277, 10247, 31.63, 'Communal', 9829, 80768, NULL),
(335, 12597, 43682, 46336, 58342, 103555, 'Jendouba', 'Masculin', 52, 1280, 2377, 2548, 1669, 1092, 803, 748, 1296, 4719, 2174, 15588, 2243, 9706, 2194, 7287, 1320, 2353, 4923, 2423, 4116, 490, 21.55, 44886, 55.26, 'Rural', 9829, 80768, NULL),
(336, 12597, 30590, 98052, 58342, 112352, 'Jendouba', 'Féminin', 22, 553, 1486, 2076, 1185, 568, 326, 214, 198, 2194, 991, 147, 60, 2261, 114, 2786, 2251, 802, 592, 732, 1320, 35, 2251, 7626, 12.73, 'Rural', 9829, 80768, NULL),
(337, 1976, 4024, 4479, 4857, 12583, 'Jendouba', 'Masculin', 10, 66, 288, 407, 282, 125, 62, 48, 67, 684, 520, 534, 483, 166, 433, 2768, 194, 34, 1495, 635, 318, 129, 16.83, 6740, 64.4, 'Communal', 3615, 10448, NULL),
(338, 1976, 3849, 8804, 4857, 13513, 'Jendouba', 'Féminin', 8, 35, 187, 508, 301, 162, 73, 36, 45, 433, 237, 14, 46, 13, 61, 2347, 742, 46, 315, 338, 194, 27, 742, 3345, 34.85, 'Communal', 3615, 10448, NULL),
(339, 1976, 6587, 5436, 4857, 14751, 'Jendouba', 'Masculin', 7, 169, 393, 436, 232, 139, 104, 71, 141, 760, 468, 1433, 442, 2087, 399, 1301, 271, 142, 1305, 437, 630, 99, 18.64, 7579, 63.15, 'Rural', 3615, 10448, NULL),
(340, 1976, 4662, 11794, 4857, 15200, 'Jendouba', 'Féminin', 8, 66, 257, 358, 247, 124, 76, 53, 59, 399, 257, 13, 22, 524, 18, 891, 647, 137, 197, 215, 271, 22, 647, 2149, 22.41, 'Rural', 3615, 10448, NULL),
(341, 858, 1656, 1924, 6513, 5045, 'Jendouba', 'Masculin', 1, 54, 170, 194, 112, 53, 36, 29, 37, 414, 198, 330, 195, 32, 250, 974, 125, 26, 413, 233, 164, 39, 22.62, 2415, 61.88, 'Communal', 686, 8057, NULL),
(342, 858, 1460, 3362, 6513, 5178, 'Jendouba', 'Féminin', 0, 9, 134, 240, 130, 83, 46, 31, 35, 250, 96, 3, 9, 2, 8, 731, 639, 45, 103, 139, 125, 12, 639, 1095, 35.07, 'Communal', 686, 8057, NULL),
(343, 858, 4475, 4453, 6513, 10714, 'Jendouba', 'Masculin', 3, 140, 256, 245, 158, 92, 78, 62, 130, 516, 479, 1877, 231, 752, 294, 781, 139, 198, 626, 232, 390, 53, 19.6, 5034, 58.44, 'Rural', 686, 8057, NULL),
(344, 858, 3237, 9682, 6513, 11670, 'Jendouba', 'Féminin', 2, 84, 196, 281, 162, 82, 29, 29, 30, 294, 159, 17, 6, 414, 8, 342, 242, 142, 61, 81, 139, 1, 242, 1083, 17.04, 'Rural', 686, 8057, NULL),
(345, 665, 1960, 1937, 4764, 5493, 'BouSalem', 'Masculin', 3, 54, 162, 192, 109, 55, 37, 34, 42, 347, 327, 354, 127, 254, 227, 946, 197, 32, 562, 234, 184, 44, 19.83, 2851, 64.74, 'Communal', 261, 5690, NULL),
(346, 665, 1645, 3990, 4764, 5918, 'BouSalem', 'Féminin', 2, 14, 127, 206, 157, 86, 71, 62, 55, 227, 137, 5, 9, 91, 40, 684, 243, 73, 70, 134, 197, 6, 243, 1138, 32.58, 'Communal', 261, 5690, NULL),
(347, 665, 3759, 3239, 4764, 7994, 'BouSalem', 'Masculin', 2, 47, 169, 155, 95, 52, 30, 26, 54, 312, 272, 411, 140, 2054, 155, 612, 75, 50, 454, 135, 210, 31, 13.54, 4111, 59.48, 'Rural', 261, 5690, NULL),
(348, 665, 2808, 7305, 4764, 8571, 'BouSalem', 'Féminin', 3, 28, 115, 119, 86, 41, 15, 15, 12, 155, 129, 7, 2, 417, 17, 203, 290, 26, 40, 28, 75, 3, 290, 832, 14.77, 'Rural', 261, 5690, NULL),
(349, 2369, 2571, 2418, 5288, 7399, 'Tabarka', 'Masculin', 6, 72, 209, 234, 173, 79, 30, 37, 46, 498, 241, 611, 255, 226, 352, 1413, 172, 28, 608, 685, 247, 41, 17.97, 4086, 67.31, 'Communal', 1947, 9604, NULL),
(350, 2369, 2234, 5088, 5288, 7574, 'Tabarka', 'Féminin', 3, 31, 135, 275, 209, 149, 66, 54, 27, 352, 103, 5, 16, 13, 32, 933, 592, 60, 159, 291, 172, 9, 592, 1532, 32.82, 'Communal', 1947, 9604, NULL),
(351, 2369, 4361, 4272, 5288, 11038, 'Tabarka', 'Masculin', 2, 199, 344, 363, 244, 186, 104, 106, 140, 804, 302, 1668, 387, 577, 413, 971, 270, 208, 450, 610, 570, 66, 25.61, 5033, 61.3, 'Rural', 1947, 9604, NULL),
(352, 2369, 3289, 9848, 5288, 11838, 'Tabarka', 'Féminin', 1, 114, 214, 306, 199, 120, 83, 42, 20, 413, 178, 14, 10, 49, 6, 338, 274, 108, 143, 144, 270, 5, 274, 882, 16.8, 'Rural', 1947, 9604, NULL),
(353, 857, 1292, 1381, 6635, 3708, 'Ain_Draham', 'Masculin', 2, 16, 88, 99, 82, 62, 28, 22, 35, 218, 88, 230, 89, 31, 127, 949, 57, 23, 253, 218, 126, 28, 18.87, 1888, 62.76, 'Communal', 977, 8469, NULL),
(354, 857, 1174, 2685, 6635, 3986, 'Ain_Draham', 'Féminin', 1, 3, 57, 126, 94, 59, 35, 12, 11, 127, 76, 6, 10, 2, 14, 637, 194, 19, 77, 87, 57, 5, 194, 901, 32.64, 'Communal', 977, 8469, NULL),
(355, 857, 4151, 4940, 6635, 9736, 'Ain_Draham', 'Masculin', 8, 99, 189, 230, 184, 115, 101, 84, 154, 361, 142, 1320, 175, 362, 183, 939, 113, 269, 300, 276, 511, 52, 25.48, 3574, 49.27, 'Rural', 977, 8469, NULL),
(356, 857, 2779, 9500, 6635, 10433, 'Ain_Draham', 'Féminin', 1, 31, 107, 170, 94, 40, 28, 12, 14, 183, 43, 16, 5, 10, 51, 233, 120, 47, 35, 89, 113, 1, 120, 433, 8.94, 'Rural', 977, 8469, NULL),
(357, 1104, 520, 594, 11074, 1628, 'Fernana', 'Masculin', 1, 2, 22, 35, 13, 5, 8, 5, 1, 37, 31, 107, 46, 19, 32, 482, 20, 6, 127, 75, 15, 54, 8.9, 942, 63.51, 'Communal', 244, 12422, NULL),
(358, 1104, 460, 1126, 11074, 1740, 'Fernana', 'Féminin', 1, 2, 23, 58, 54, 15, 5, 2, 2, 32, 8, 3, 5, 6, 2, 353, 183, 8, 33, 39, 20, 3, 183, 451, 35.29, 'Communal', 244, 12422, NULL),
(359, 1104, 6479, 7400, 11074, 14694, 'Fernana', 'Masculin', 9, 194, 242, 236, 149, 107, 82, 98, 199, 418, 128, 2465, 288, 1226, 188, 900, 117, 379, 595, 212, 490, 68, 19.23, 5891, 49.63, 'Rural', 244, 12422, NULL),
(360, 1104, 4421, 15730, 11074, 16998, 'Fernana', 'Féminin', 3, 74, 144, 189, 88, 28, 14, 14, 15, 188, 34, 19, 6, 256, 6, 297, 147, 74, 39, 39, 117, 0, 147, 693, 7.46, 'Rural', 244, 12422, NULL),
(361, 1980, 2701, 3146, 9225, 7189, 'Ghardimaou', 'Masculin', 4, 78, 158, 184, 125, 72, 28, 23, 57, 321, 177, 779, 139, 122, 185, 1131, 67, 56, 584, 327, 238, 38, 18.35, 3301, 56.23, 'Communal', 1102, 12307, NULL),
(362, 1980, 2316, 6592, 9225, 8248, 'Ghardimaou', 'Féminin', 2, 22, 111, 222, 136, 55, 26, 24, 17, 185, 63, 9, 4, 37, 16, 687, 144, 51, 104, 125, 67, 3, 144, 1034, 20.07, 'Communal', 1102, 12307, NULL),
(363, 1980, 6348, 7916, 9225, 16373, 'Ghardimaou', 'Masculin', 7, 217, 300, 372, 244, 170, 142, 131, 219, 597, 106, 3860, 223, 944, 186, 686, 125, 588, 483, 246, 548, 19, 22.27, 6574, 51.65, 'Rural', 1102, 12307, NULL),
(364, 1980, 4410, 16575, 9225, 17768, 'Ghardimaou', 'Féminin', 2, 67, 173, 242, 101, 40, 26, 16, 17, 186, 45, 41, 1, 186, 3, 141, 115, 130, 21, 66, 125, 1, 115, 504, 6.71, 'Rural', 1102, 12307, NULL),
(365, 1466, 316, 270, 2892, 869, 'Oued_Meliz', 'Masculin', 1, 13, 28, 55, 24, 24, 4, 14, 20, 92, 15, 49, 19, 28, 51, 184, 40, 17, 82, 30, 49, 4, 31.22, 412, 68.85, 'Communal', 199, 4557, NULL),
(366, 1466, 329, 653, 2892, 975, 'Oued_Meliz', 'Féminin', 1, 5, 28, 37, 34, 25, 15, 6, 6, 51, 15, 1, 2, 4, 2, 113, 103, 15, 15, 12, 40, 0, 103, 163, 33.03, 'Communal', 199, 4557, NULL),
(367, 1466, 2523, 2347, 2892, 5824, 'Oued_Meliz', 'Masculin', 4, 106, 179, 192, 121, 82, 49, 59, 69, 335, 71, 1007, 130, 687, 112, 355, 90, 185, 206, 106, 286, 21, 25.6, 2587, 59.71, 'Rural', 199, 4557, NULL),
(368, 1466, 1842, 5646, 2892, 6458, 'Oued_Meliz', 'Féminin', 0, 32, 96, 147, 70, 41, 23, 11, 20, 112, 35, 9, 3, 137, 1, 135, 90, 87, 25, 25, 90, 0, 90, 369, 12.57, 'Rural', 199, 4557, NULL),
(369, 1321, 680, 782, 7095, 2437, 'Bou_Aouane', 'Masculin', 2, 8, 53, 74, 36, 18, 7, 2, 10, 109, 227, 99, 62, 121, 81, 559, 21, 5, 236, 91, 40, 45, 12.87, 1442, 67.91, 'Communal', 798, 9214, NULL),
(370, 1321, 666, 1587, 7095, 2437, 'Bou_Aouane', 'Féminin', 1, 3, 33, 92, 78, 31, 16, 4, 6, 81, 105, 2, 2, 35, 0, 371, 437, 6, 42, 26, 21, 4, 437, 588, 34.85, 'Communal', 798, 9214, NULL),
(371, 1321, 4999, 6333, 7095, 12431, 'Bou_Aouane', 'Masculin', 11, 109, 305, 319, 242, 149, 113, 111, 190, 616, 206, 1546, 227, 1017, 263, 742, 120, 334, 504, 169, 481, 81, 26.16, 4503, 49.05, 'Rural', 798, 9214, NULL),
(372, 1321, 3142, 11972, 7095, 13416, 'Bou_Aouane', 'Féminin', 1, 57, 184, 264, 137, 52, 32, 22, 11, 263, 111, 11, 5, 267, 4, 208, 326, 51, 31, 45, 120, 2, 326, 681, 10.76, 'Rural', 798, 9214, NULL),
(373, 3171, 19917, 19017, 24364, 52427, 'Kef', 'Masculin', 45, 396, 1230, 1465, 784, 356, 246, 204, 324, 2569, 2400, 4846, 1739, 1579, 1749, 10201, 927, 234, 4586, 2187, 1353, 684, 15.39, 28267, 63.72, 'Communal', 2278, 29813, NULL),
(374, 3171, 16958, 38327, 24364, 55503, 'Kef', 'Féminin', 27, 163, 939, 1614, 1104, 521, 351, 273, 223, 1749, 1233, 50, 131, 322, 207, 7494, 4086, 361, 1286, 1281, 927, 94, 4086, 11918, 30.95, 'Communal', 2278, 29813, NULL),
(375, 3171, 19848, 14744, 24364, 40961, 'Kef', 'Masculin', 28, 375, 769, 664, 438, 266, 173, 168, 231, 1270, 706, 4378, 789, 12392, 634, 2769, 371, 343, 1305, 486, 1199, 185, 12.13, 23038, 64, 'Rural', 2278, 29813, NULL),
(376, 3171, 12697, 34685, 24364, 41673, 'Kef', 'Féminin', 16, 169, 465, 625, 287, 156, 102, 67, 56, 634, 435, 69, 19, 3125, 67, 877, 1688, 224, 215, 275, 371, 8, 1688, 5039, 16.77, 'Rural', 2278, 29813, NULL),
(377, 546, 3229, 3527, 1094, 10091, 'Kef', 'Masculin', 8, 50, 227, 293, 185, 50, 32, 25, 50, 514, 340, 875, 461, 175, 397, 2371, 200, 30, 776, 482, 179, 142, 14.23, 5630, 65.05, 'Communal', 441, 2081, NULL),
(378, 546, 2982, 6060, 1094, 10346, 'Kef', 'Féminin', 3, 31, 179, 366, 263, 120, 85, 61, 51, 397, 468, 10, 33, 52, 115, 1911, 1278, 73, 288, 313, 200, 39, 1278, 3117, 41.43, 'Communal', 441, 2081, NULL),
(379, 546, 1353, 846, 1094, 2871, 'Kef', 'Masculin', 1, 37, 86, 73, 56, 20, 15, 10, 33, 147, 57, 559, 80, 369, 105, 364, 71, 29, 160, 73, 121, 24, 16.69, 1687, 70.56, 'Rural', 441, 2081, NULL),
(380, 546, 966, 2075, 1094, 2863, 'Kef', 'Féminin', 0, 20, 74, 76, 37, 27, 27, 13, 14, 105, 84, 6, 0, 87, 28, 185, 254, 51, 50, 78, 71, 2, 254, 492, 27.52, 'Rural', 441, 2081, NULL),
(381, 708, 3617, 3900, 2083, 11043, 'Kef', 'Masculin', 16, 77, 243, 325, 161, 67, 45, 37, 49, 527, 393, 860, 404, 200, 420, 2474, 207, 31, 1059, 593, 248, 119, 14.35, 6118, 64.68, 'Communal', 434, 3225, NULL),
(382, 708, 3199, 6986, 2083, 11615, 'Kef', 'Féminin', 7, 32, 180, 302, 295, 126, 85, 58, 54, 420, 281, 12, 47, 50, 32, 2295, 1003, 75, 344, 415, 207, 27, 1003, 3478, 39.86, 'Communal', 434, 3225, NULL),
(383, 708, 2149, 1494, 2083, 4542, 'Kef', 'Masculin', 2, 46, 99, 72, 40, 24, 16, 11, 12, 155, 60, 500, 120, 1248, 110, 462, 67, 24, 186, 93, 98, 48, 10.79, 2719, 67.11, 'Rural', 434, 3225, NULL),
(384, 708, 1546, 3671, 2083, 4679, 'Kef', 'Féminin', 1, 25, 67, 112, 60, 24, 21, 12, 9, 110, 62, 9, 3, 228, 10, 236, 282, 40, 48, 82, 67, 5, 282, 674, 21.53, 'Rural', 434, 3225, NULL),
(385, 449, 799, 632, 4199, 2004, 'Nebeur', 'Masculin', 1, 9, 33, 31, 12, 7, 8, 4, 11, 59, 34, 214, 45, 165, 54, 560, 21, 13, 132, 88, 30, 14, 8.67, 1253, 68.41, 'Communal', 903, 5551, NULL),
(386, 449, 646, 1596, 4199, 2263, 'Nebeur', 'Féminin', 0, 2, 41, 46, 33, 10, 9, 9, 5, 54, 59, 1, 7, 48, 7, 304, 121, 13, 56, 33, 21, 1, 121, 509, 29.49, 'Communal', 903, 5551, NULL),
(387, 449, 3486, 3054, 4199, 7900, 'Nebeur', 'Masculin', 7, 83, 157, 115, 75, 39, 26, 32, 40, 268, 70, 960, 136, 2187, 112, 557, 48, 71, 205, 111, 186, 29, 12.05, 4262, 61.34, 'Rural', 903, 5551, NULL),
(388, 449, 2254, 6965, 4199, 8112, 'Nebeur', 'Féminin', 4, 23, 95, 104, 38, 26, 8, 10, 9, 112, 98, 18, 5, 483, 6, 160, 219, 28, 32, 32, 48, 1, 219, 833, 14.14, 'Rural', 903, 5551, NULL),
(389, 271, 900, 830, 3497, 2269, 'Sakiet_Sidi_Youssef', 'Masculin', 1, 9, 43, 46, 18, 8, 6, 10, 6, 87, 54, 216, 80, 93, 72, 540, 42, 4, 183, 99, 29, 22, 10.49, 1288, 63.42, 'Communal', 6, 3774, NULL),
(390, 271, 871, 1815, 3497, 2586, 'Sakiet_Sidi_Youssef', 'Féminin', 1, 6, 40, 56, 37, 36, 16, 10, 6, 72, 45, 1, 5, 8, 3, 328, 142, 14, 68, 100, 42, 4, 142, 560, 29.81, 'Communal', 6, 3774, NULL),
(391, 271, 2036, 1045, 3497, 4370, 'Sakiet_Sidi_Youssef', 'Masculin', 4, 35, 68, 51, 33, 25, 7, 5, 20, 95, 31, 450, 108, 2048, 44, 239, 26, 26, 139, 42, 103, 9, 7.67, 3070, 76.09, 'Rural', 6, 3774, NULL),
(392, 271, 1263, 2990, 3497, 4394, 'Sakiet_Sidi_Youssef', 'Féminin', 1, 11, 31, 43, 29, 17, 9, 7, 6, 44, 13, 5, 2, 1141, 1, 54, 125, 28, 10, 23, 26, 0, 125, 1249, 31.93, 'Rural', 6, 3774, NULL),
(393, 24, 3005, 2785, 2483, 7469, 'Tajerouine', 'Masculin', 4, 66, 189, 205, 117, 60, 36, 36, 53, 389, 553, 881, 176, 262, 241, 1044, 116, 35, 665, 234, 211, 83, 16.7, 3902, 62.71, 'Communal', 37, 2544, NULL),
(394, 24, 2463, 5907, 2483, 7893, 'Tajerouine', 'Féminin', 7, 29, 151, 250, 128, 79, 44, 30, 28, 241, 117, 10, 11, 30, 13, 735, 474, 41, 167, 155, 116, 8, 474, 1240, 25.15, 'Communal', 37, 2544, NULL),
(395, 24, 1479, 1091, 2483, 3141, 'Tajerouine', 'Masculin', 0, 18, 49, 43, 29, 21, 13, 10, 15, 74, 85, 315, 85, 1053, 35, 178, 24, 28, 92, 26, 77, 7, 10.2, 1841, 65.23, 'Rural', 37, 2544, NULL),
(396, 24, 945, 2715, 2483, 3340, 'Tajerouine', 'Féminin', 1, 16, 30, 46, 14, 17, 9, 6, 1, 35, 81, 5, 3, 325, 4, 39, 104, 18, 18, 14, 24, 0, 104, 486, 18.71, 'Rural', 37, 2544, NULL),
(397, 257, 1481, 1166, 2143, 3057, 'Kalaat_Snan', 'Masculin', 0, 44, 84, 101, 55, 40, 26, 15, 34, 167, 85, 318, 65, 71, 76, 509, 59, 16, 290, 120, 180, 22, 21.73, 1480, 61.86, 'Communal', 7, 2407, NULL),
(398, 257, 1148, 2672, 2143, 3267, 'Kalaat_Snan', 'Féminin', 1, 10, 46, 72, 49, 28, 15, 12, 3, 76, 20, 2, 6, 4, 4, 250, 159, 13, 38, 35, 59, 1, 159, 357, 18.24, 'Communal', 7, 2407, NULL),
(399, 257, 1586, 1284, 2143, 2902, 'Kalaat_Snan', 'Masculin', 3, 23, 51, 52, 37, 30, 23, 24, 25, 84, 24, 293, 28, 710, 21, 183, 20, 20, 63, 26, 144, 16, 16.81, 1346, 55.75, 'Rural', 7, 2407, NULL),
(400, 257, 946, 2729, 2143, 2973, 'Kalaat_Snan', 'Féminin', 0, 10, 18, 28, 15, 4, 6, 6, 1, 21, 9, 3, 1, 95, 3, 31, 125, 6, 6, 10, 20, 0, 125, 155, 8.24, 'Rural', 7, 2407, NULL),
(401, 385, 424, 388, 829, 967, 'Kalaat_Khasbah', 'Masculin', 1, 6, 30, 29, 16, 17, 16, 14, 19, 64, 44, 48, 32, 21, 47, 183, 47, 11, 47, 37, 70, 11, 26.77, 424, 59.98, 'Communal', 72, 1286, NULL),
(402, 385, 343, 776, 829, 1086, 'Kalaat_Khasbah', 'Féminin', 1, 5, 21, 39, 27, 11, 16, 15, 9, 47, 8, 0, 0, 0, 3, 135, 75, 15, 4, 14, 47, 1, 75, 163, 28.55, 'Communal', 72, 1286, NULL),
(403, 385, 664, 756, 829, 1571, 'Kalaat_Khasbah', 'Masculin', 1, 8, 27, 27, 29, 17, 7, 8, 17, 59, 42, 110, 23, 306, 30, 116, 15, 21, 46, 18, 50, 5, 18.16, 667, 51.81, 'Rural', 72, 1286, NULL),
(404, 385, 479, 1546, 829, 1707, 'Kalaat_Khasbah', 'Féminin', 1, 5, 16, 30, 14, 6, 6, 4, 3, 30, 14, 1, 2, 19, 1, 30, 86, 8, 5, 3, 15, 0, 86, 75, 9.43, 'Rural', 72, 1286, NULL),
(405, 1527, 1734, 1737, 903, 3873, 'Djerissa', 'Masculin', 2, 41, 86, 121, 53, 37, 17, 20, 25, 218, 230, 303, 88, 182, 75, 476, 33, 19, 190, 83, 104, 172, 19.19, 1726, 55.15, 'Communal', 959, 3389, NULL),
(406, 1527, 1416, 3490, 903, 4109, 'Djerissa', 'Féminin', 0, 13, 53, 92, 55, 16, 12, 10, 9, 75, 29, 5, 4, 16, 4, 198, 208, 12, 59, 40, 33, 7, 208, 358, 15.06, 'Communal', 959, 3389, NULL),
(407, 93, 883, 696, 2115, 2072, 'Ksour', 'Masculin', -1, 12, 47, 51, 29, 18, 2, 5, 6, 77, 320, 116, 41, 54, 62, 414, 38, 13, 182, 64, 57, 12, 12.65, 1202, 66.41, 'Communal', 39, 2247, NULL),
(408, 93, 675, 1493, 2115, 2126, 'Ksour', 'Féminin', 0, 4, 33, 67, 47, 19, 11, 14, 12, 62, 54, 2, 3, 5, 6, 312, 125, 28, 24, 22, 38, 1, 125, 423, 29.77, 'Communal', 39, 2247, NULL),
(409, 93, 1911, 1514, 2115, 3751, 'Ksour', 'Masculin', 1, 22, 55, 59, 31, 18, 15, 11, 14, 81, 218, 324, 69, 1059, 27, 200, 18, 32, 102, 18, 91, 10, 10.55, 2001, 59.62, 'Rural', 39, 2247, NULL),
(410, 93, 1049, 3324, 2115, 3636, 'Ksour', 'Féminin', 2, 12, 25, 35, 18, 6, 1, 1, 1, 27, 25, 7, 0, 122, 4, 39, 143, 9, 12, 6, 18, 0, 143, 213, 8.58, 'Rural', 39, 2247, NULL),
(411, 273, 1896, 1926, 3086, 5124, 'Dahmani', 'Masculin', 8, 38, 118, 148, 80, 33, 29, 21, 47, 250, 211, 556, 168, 143, 167, 836, 104, 41, 506, 202, 125, 32, 16.76, 2662, 62.41, 'Communal', 330, 3689, NULL),
(412, 273, 1492, 3915, 3086, 5383, 'Dahmani', 'Féminin', 4, 18, 103, 187, 105, 45, 41, 34, 35, 167, 68, 5, 9, 29, 7, 612, 267, 63, 93, 68, 104, 1, 267, 889, 27.27, 'Communal', 330, 3689, NULL),
(413, 273, 2936, 2104, 3086, 5669, 'Dahmani', 'Masculin', 7, 77, 132, 108, 90, 53, 39, 46, 46, 221, 79, 607, 83, 1676, 70, 249, 49, 78, 206, 42, 253, 13, 16.91, 2962, 62.87, 'Rural', 330, 3689, NULL),
(414, 273, 1726, 4920, 3086, 5518, 'Dahmani', 'Féminin', 5, 29, 54, 81, 38, 17, 10, 4, 6, 70, 42, 11, 2, 208, 4, 59, 177, 23, 16, 11, 49, 0, 177, 354, 10.84, 'Rural', 330, 3689, NULL),
(415, 164, 1949, 1430, 2837, 4458, 'Es_Sers', 'Masculin', 6, 44, 129, 114, 58, 19, 29, 17, 24, 217, 136, 458, 179, 213, 137, 794, 59, 21, 556, 185, 120, 55, 14.73, 2582, 67.9, 'Communal', 8, 3009, NULL),
(416, 164, 1723, 3617, 2837, 4829, 'Es_Sers', 'Féminin', 3, 13, 92, 137, 65, 31, 17, 20, 11, 137, 84, 2, 6, 80, 13, 414, 234, 14, 145, 86, 59, 4, 234, 824, 25.08, 'Communal', 8, 3009, NULL),
(417, 164, 2248, 1556, 2837, 4244, 'Es_Sers', 'Masculin', 1, 25, 44, 63, 17, 18, 12, 11, 8, 85, 40, 260, 57, 1737, 81, 221, 33, 14, 106, 37, 75, 24, 7.63, 2483, 63.34, 'Rural', 8, 3009, NULL),
(418, 164, 1523, 3750, 2837, 4451, 'Es_Sers', 'Féminin', 1, 18, 54, 69, 24, 12, 5, 4, 6, 81, 7, 4, 1, 417, 6, 44, 173, 13, 18, 16, 33, 0, 173, 508, 15.75, 'Rural', 8, 3009, NULL),
(419, 5112, 12101, 12050, 24422, 34172, 'Siliana', 'Masculin', 27, 220, 724, 743, 490, 257, 140, 125, 152, 1354, 1541, 2691, 1228, 1362, 795, 8005, 534, 263, 2752, 1301, 774, 290, 13.22, 19197, 64.74, 'Communal', 3641, 33175, NULL),
(420, 5112, 10602, 25364, 24422, 37183, 'Siliana', 'Féminin', 10, 138, 556, 869, 550, 304, 174, 136, 93, 795, 1989, 35, 57, 462, 98, 5150, 2726, 344, 734, 482, 534, 37, 2726, 8956, 31.79, 'Communal', 3641, 33175, NULL),
(421, 5112, 21358, 17813, 24422, 46627, 'Siliana', 'Masculin', 23, 539, 916, 871, 593, 447, 283, 242, 369, 1638, 767, 6730, 1014, 10409, 629, 3532, 641, 709, 1367, 436, 1737, 110, 15.36, 24388, 61.8, 'Rural', 3641, 33175, NULL),
(422, 5112, 14478, 41080, 24422, 49724, 'Siliana', 'Féminin', 9, 307, 574, 606, 350, 196, 120, 91, 92, 629, 1046, 70, 19, 3779, 56, 1036, 1348, 471, 173, 114, 641, 14, 1348, 6260, 17.39, 'Rural', 3641, 33175, NULL),
(423, 296, 2497, 2202, 1836, 7476, 'Siliana', 'Masculin', 10, 39, 171, 164, 88, 39, 26, 18, 28, 281, 562, 595, 293, 196, 180, 2035, 159, 44, 549, 359, 142, 86, 11.17, 4685, 70.55, 'Communal', 13, 2145, NULL),
(424, 296, 2435, 4721, 1836, 8257, 'Siliana', 'Féminin', 2, 27, 126, 228, 121, 74, 47, 35, 27, 180, 984, 15, 15, 30, 52, 1396, 1061, 71, 224, 160, 159, 16, 1061, 2842, 42.82, 'Communal', 13, 2145, NULL),
(425, 296, 1669, 1199, 1836, 3177, 'Siliana', 'Masculin', 4, 29, 83, 52, 32, 33, 21, 10, 27, 128, 74, 360, 62, 817, 39, 244, 41, 24, 76, 36, 112, 11, 14.86, 1684, 62.25, 'Rural', 13, 2145, NULL),
(426, 296, 996, 2755, 1836, 3147, 'Siliana', 'Féminin', 2, 20, 31, 34, 16, 13, 10, 2, 2, 39, 112, 5, 3, 82, 14, 40, 161, 18, 7, 7, 41, 2, 161, 260, 12.46, 'Rural', 13, 2145, NULL),
(427, 615, 1116, 1132, 3637, 3776, 'Siliana', 'Masculin', 1, 17, 70, 81, 42, 24, 6, 8, 7, 120, 251, 297, 126, 98, 83, 1092, 39, 9, 293, 166, 46, 54, 10.06, 2378, 70.04, 'Communal', 1107, 5359, NULL),
(428, 615, 1159, 2207, 3637, 3905, 'Siliana', 'Féminin', 0, 6, 57, 116, 78, 30, 14, 9, 8, 83, 274, 6, 7, 29, 5, 886, 572, 26, 104, 60, 39, 10, 572, 1376, 43.48, 'Communal', 1107, 5359, NULL),
(429, 615, 3547, 2532, 3637, 7426, 'Siliana', 'Masculin', 3, 79, 155, 145, 85, 55, 29, 38, 49, 254, 219, 1605, 165, 1256, 104, 660, 125, 95, 212, 88, 258, 21, 13.59, 4229, 65.9, 'Rural', 1107, 5359, NULL),
(430, 615, 2607, 6266, 3637, 7839, 'Siliana', 'Féminin', 3, 56, 102, 132, 81, 21, 14, 10, 8, 104, 433, 23, 5, 373, 1, 219, 282, 49, 50, 34, 125, 6, 282, 1146, 20.07, 'Rural', 1107, 5359, NULL),
(431, 337, 1896, 1953, 1515, 4931, 'Bou_Arada', 'Masculin', 1, 44, 115, 111, 84, 52, 26, 13, 26, 214, 222, 520, 148, 253, 108, 716, 56, 38, 423, 182, 166, 29, 16.25, 2494, 60.41, 'Communal', 63, 1915, NULL),
(432, 337, 1473, 3786, 1515, 5203, 'Bou_Arada', 'Féminin', 1, 31, 75, 81, 54, 33, 20, 14, 7, 108, 384, 4, 9, 164, 4, 431, 167, 32, 62, 38, 56, 4, 167, 1097, 27.23, 'Communal', 63, 1915, NULL),
(433, 337, 1299, 1255, 1515, 2872, 'Bou_Arada', 'Masculin', 2, 48, 71, 96, 67, 55, 46, 29, 51, 123, 59, 244, 39, 533, 47, 143, 101, 103, 84, 27, 246, 4, 29.81, 1135, 56.3, 'Rural', 63, 1915, NULL),
(434, 337, 742, 2408, 1515, 2859, 'Bou_Arada', 'Féminin', 1, 22, 46, 62, 46, 22, 12, 10, 15, 47, 87, 3, 2, 56, 11, 40, 52, 66, 11, 6, 101, 1, 52, 207, 15.77, 'Rural', 63, 1915, NULL),
(435, 222, 1365, 1551, 1125, 3883, 'Gafour', 'Masculin', 3, 25, 89, 81, 78, 43, 25, 29, 21, 184, 78, 194, 234, 282, 133, 771, 94, 29, 229, 101, 135, 43, 17.02, 1935, 60.06, 'Communal', 514, 1861, NULL),
(436, 222, 1238, 3155, 1125, 4239, 'Gafour', 'Féminin', 0, 15, 68, 100, 65, 55, 29, 24, 17, 133, 71, 2, 8, 103, 4, 398, 196, 35, 80, 41, 94, 1, 196, 704, 25.57, 'Communal', 514, 1861, NULL),
(437, 222, 943, 956, 1125, 2512, 'Gafour', 'Masculin', 0, 28, 41, 54, 28, 20, 14, 11, 19, 106, 59, 283, 37, 638, 39, 187, 16, 28, 91, 23, 67, 15, 14.33, 1333, 61.94, 'Rural', 514, 1861, NULL),
(438, 222, 697, 2261, 1125, 2741, 'Gafour', 'Féminin', 0, 15, 26, 31, 21, 6, 3, 5, 2, 39, 126, 2, 3, 150, 2, 66, 64, 10, 11, 11, 16, 0, 64, 369, 17.51, 'Rural', 514, 1861, NULL),
(439, 504, 1040, 1120, 2169, 2880, 'Krib', 'Masculin', 3, 21, 64, 75, 52, 21, 14, 8, 10, 118, 104, 227, 92, 134, 63, 592, 40, 30, 230, 89, 76, 19, 15.34, 1490, 61.11, 'Communal', 683, 3356, NULL),
(440, 504, 867, 2258, 2169, 3054, 'Krib', 'Féminin', 1, 13, 37, 71, 50, 24, 13, 14, 7, 63, 48, 1, 1, 61, 12, 366, 140, 27, 48, 37, 40, 1, 140, 564, 26.06, 'Communal', 683, 3356, NULL),
(441, 504, 1951, 2053, 2169, 4706, 'Krib', 'Masculin', 3, 37, 76, 88, 70, 48, 33, 33, 30, 132, 50, 341, 96, 1179, 52, 338, 52, 90, 148, 46, 165, 15, 16.47, 2216, 56.39, 'Rural', 683, 3356, NULL),
(442, 504, 1439, 4027, 2169, 4940, 'Krib', 'Féminin', 0, 19, 50, 55, 45, 24, 13, 11, 20, 52, 39, 2, 0, 496, 0, 105, 104, 62, 20, 6, 52, 0, 104, 668, 18.46, 'Rural', 683, 3356, NULL),
(443, 560, 422, 424, 1833, 1118, 'Bourouis', 'Masculin', 1, 13, 25, 39, 37, 15, 15, 14, 18, 81, 36, 64, 27, 24, 28, 243, 33, 25, 77, 37, 58, 3, 26.22, 512, 61.99, 'Communal', 98, 2491, NULL),
(444, 560, 380, 946, 1833, 1324, 'Bourouis', 'Féminin', 0, 6, 26, 36, 22, 19, 15, 10, 6, 28, 33, 1, 3, 31, 0, 130, 39, 42, 23, 11, 33, 1, 39, 233, 28.55, 'Communal', 98, 2491, NULL),
(445, 560, 1609, 1722, 1833, 3678, 'Bourouis', 'Masculin', 5, 67, 105, 96, 70, 51, 35, 24, 40, 248, 49, 432, 81, 476, 97, 262, 43, 51, 100, 44, 178, 5, 25.66, 1454, 53.18, 'Rural', 98, 2491, NULL),
(446, 560, 1011, 3330, 1833, 3776, 'Bourouis', 'Féminin', 0, 29, 64, 55, 25, 22, 5, 8, 5, 97, 43, 3, 2, 94, 2, 76, 78, 27, 7, 6, 43, 0, 78, 231, 11.84, 'Rural', 98, 2491, NULL),
(447, 699, 1711, 1732, 2574, 4680, 'Makthar', 'Masculin', 1, 35, 101, 107, 53, 29, 12, 14, 16, 188, 127, 450, 172, 77, 111, 1050, 65, 26, 513, 156, 65, 28, 12.69, 2574, 62.97, 'Communal', 231, 3504, NULL),
(448, 699, 1315, 3888, 2574, 5254, 'Makthar', 'Féminin', 2, 19, 90, 140, 97, 49, 18, 21, 8, 111, 69, 5, 7, 5, 9, 688, 243, 49, 82, 59, 65, 4, 243, 921, 26, 'Communal', 231, 3504, NULL),
(449, 699, 2461, 2037, 2574, 5662, 'Makthar', 'Masculin', 2, 121, 150, 130, 81, 48, 31, 36, 60, 231, 95, 1229, 143, 1045, 109, 218, 111, 133, 162, 40, 266, 11, 18.76, 2945, 64.02, 'Rural', 231, 3504, NULL),
(450, 699, 1551, 5088, 2574, 5644, 'Makthar', 'Féminin', 0, 84, 96, 74, 32, 21, 23, 18, 20, 109, 35, 16, 0, 41, 4, 58, 91, 100, 12, 10, 111, 2, 91, 174, 9.87, 'Rural', 231, 3504, NULL),
(451, 729, 562, 587, 3906, 1686, 'Er_Rouhia', 'Masculin', 2, 11, 27, 34, 18, 7, 4, 6, 7, 49, 42, 117, 29, 66, 27, 452, 18, 32, 174, 88, 23, 5, 11.28, 975, 65.18, 'Communal', 31, 4666, NULL),
(452, 729, 459, 1210, 3906, 1724, 'Er_Rouhia', 'Féminin', 1, 9, 21, 28, 24, 8, 13, 5, 6, 27, 27, 1, 1, 15, 5, 275, 93, 50, 43, 28, 18, 0, 93, 391, 29.81, 'Communal', 31, 4666, NULL),
(453, 729, 3317, 2246, 3906, 6400, 'Er_Rouhia', 'Masculin', 4, 45, 66, 59, 38, 30, 13, 18, 25, 95, 51, 1040, 178, 1929, 34, 411, 55, 71, 193, 40, 123, 1, 7.39, 3847, 64.9, 'Rural', 31, 4666, NULL),
(454, 729, 2253, 5583, 3906, 7822, 'Er_Rouhia', 'Féminin', 1, 24, 57, 50, 23, 23, 11, 7, 7, 34, 45, 11, 0, 1762, 5, 172, 190, 67, 25, 16, 55, 0, 190, 2032, 28.63, 'Rural', 31, 4666, NULL),
(455, 728, 426, 315, 2520, 946, 'Kesra', 'Masculin', 1, 2, 8, 7, 3, 3, 1, 1, 1, 16, 20, 25, 27, 49, 12, 417, 7, 0, 41, 22, 6, 3, 4.12, 605, 66.7, 'Communal', 365, 3613, NULL),
(456, 728, 351, 780, 2520, 1059, 'Kesra', 'Féminin', 0, 1, 12, 22, 11, 5, 2, 0, 1, 12, 2, 0, 1, 3, 1, 203, 74, 3, 13, 3, 7, 0, 74, 225, 26.35, 'Communal', 365, 3613, NULL),
(457, 728, 1969, 1717, 2520, 4580, 'Kesra', 'Masculin', 2, 27, 39, 25, 17, 22, 8, 11, 10, 53, 71, 838, 112, 903, 24, 559, 16, 28, 168, 39, 56, 6, 5.76, 2698, 62.52, 'Rural', 365, 3613, NULL),
(458, 728, 1434, 4255, 2520, 5191, 'Kesra', 'Féminin', 1, 9, 32, 29, 18, 9, 3, 1, 1, 24, 92, 4, 2, 570, 10, 134, 115, 9, 23, 7, 16, 1, 115, 834, 18.03, 'Rural', 365, 3613, NULL),
(459, 140, 683, 691, 2041, 1786, 'Bargou', 'Masculin', 3, 6, 26, 22, 20, 12, 5, 9, 8, 44, 67, 127, 54, 87, 31, 411, 17, 17, 163, 60, 31, 13, 10.05, 985, 61.34, 'Communal', 37, 2218, NULL),
(460, 140, 581, 1561, 2041, 2016, 'Bargou', 'Féminin', 1, 7, 26, 26, 15, 4, 1, 1, 5, 31, 85, 0, 1, 8, 5, 207, 74, 4, 37, 31, 17, 0, 74, 370, 22.57, 'Communal', 37, 2218, NULL),
(461, 140, 1401, 1000, 2041, 2969, 'Bargou', 'Masculin', 0, 20, 62, 58, 46, 33, 15, 13, 22, 106, 25, 187, 48, 1028, 40, 299, 29, 34, 72, 24, 99, 12, 13.92, 1695, 66.32, 'Rural', 37, 2218, NULL),
(462, 140, 876, 2705, 2041, 2989, 'Bargou', 'Féminin', 0, 6, 36, 40, 21, 17, 11, 7, 4, 40, 19, 1, 0, 70, 4, 42, 74, 26, 1, 6, 29, 0, 74, 139, 9.5, 'Rural', 37, 2218, NULL),
(463, 282, 383, 343, 1266, 1010, 'Aroussa', 'Masculin', 1, 6, 26, 22, 13, 11, 6, 5, 10, 58, 32, 75, 26, 96, 19, 226, 6, 13, 60, 41, 25, 7, 15.44, 564, 66.14, 'Communal', 499, 2047, NULL),
(464, 282, 344, 852, 1266, 1148, 'Aroussa', 'Féminin', 1, 4, 17, 21, 12, 3, 2, 3, 1, 19, 11, 0, 4, 13, 1, 172, 67, 5, 18, 14, 6, 0, 67, 233, 25.85, 'Communal', 499, 2047, NULL),
(465, 282, 1192, 1096, 1266, 2645, 'Aroussa', 'Masculin', 1, 36, 66, 66, 57, 51, 37, 18, 35, 162, 15, 170, 53, 604, 44, 210, 52, 52, 61, 29, 166, 9, 25.63, 1152, 58.56, 'Rural', 499, 2047, NULL),
(466, 282, 872, 2402, 1266, 2776, 'Aroussa', 'Féminin', 1, 22, 33, 44, 21, 18, 15, 12, 8, 44, 15, 0, 2, 85, 3, 84, 137, 37, 6, 5, 52, 2, 137, 200, 13.47, 'Rural', 499, 2047, NULL),
(467, 50570, 261858, 88268, 99265, 256899, 'Centre_Est', 'Masculin', 673, 3894, 9014, 10141, 5118, 2385, 1393, 1051, 1555, 16264, 89030, 72751, 28073, 21090, 10418, 77348, 4631, 1327, 69573, 60752, 8425, 7135, 7.01, 156810, 65.64, 'Communal', 39839, 189674, NULL),
(468, 50570, 239707, 168463, 99265, 242931, 'Centre_Est', 'Féminin', 528, 1895, 7049, 12681, 7808, 3459, 1427, 827, 730, 10418, 85670, 1555, 1893, 2110, 2347, 65517, 71682, 1303, 15851, 26063, 4631, 989, 71682, 61103, 30.65, 'Communal', 39839, 189674, NULL),
(469, 50570, 123256, 57824, 99265, 174794, 'Centre_Est', 'Masculin', 148, 2829, 4313, 4180, 2508, 1675, 1013, 930, 1462, 7637, 20849, 45591, 7278, 22623, 3481, 14915, 2852, 2001, 19560, 13286, 7491, 1575, 12.31, 102576, 66.92, 'Rural', 39839, 189674, NULL),
(470, 50570, 99983, 121373, 99265, 175059, 'Centre_Est', 'Féminin', 104, 1427, 2582, 3352, 1921, 968, 465, 297, 288, 3481, 18702, 620, 197, 5819, 144, 6466, 9997, 1289, 2446, 4003, 2852, 121, 9997, 43139, 30.67, 'Rural', 39839, 189674, NULL),
(471, 10912, 72875, 68043, 13576, 204441, 'Sousse', 'Masculin', 264, 1298, 2990, 3384, 1778, 888, 532, 368, 569, 5751, 22655, 21879, 8524, 2588, 3703, 23001, 1744, 487, 19321, 24282, 3206, 1916, 8.77, 124430, 66.72, 'Communal', 11955, 36443, NULL),
(472, 10912, 66891, 133069, 13576, 207673, 'Sousse', 'Féminin', 187, 632, 2277, 3986, 2558, 1219, 541, 293, 249, 3703, 23927, 474, 791, 276, 894, 20209, 26223, 491, 5401, 11175, 1744, 332, 26223, 62772, 35.92, 'Communal', 11955, 36443, NULL),
(473, 10912, 21732, 15627, 13576, 46538, 'Sousse', 'Masculin', 31, 494, 800, 781, 432, 296, 152, 125, 184, 1440, 4260, 8397, 1607, 2852, 652, 2756, 537, 313, 2837, 4605, 1280, 237, 10.77, 27582, 66.42, 'Rural', 11955, 36443, NULL),
(474, 10912, 17733, 34984, 13576, 46927, 'Sousse', 'Féminin', 19, 246, 440, 546, 333, 183, 96, 60, 71, 652, 5226, 150, 79, 1158, 23, 1442, 1621, 234, 615, 1231, 537, 26, 1621, 9946, 25.45, 'Rural', 11955, 36443, NULL),
(475, 2891, 3682, 5077, 89, 13683, 'Sousse_Medina', 'Masculin', 33, 42, 143, 196, 94, 41, 31, 21, 30, 269, 969, 408, 564, 96, 238, 2198, 75, 43, 1384, 2271, 109, 75, 7.06, 7998, 62.89, 'Communal', 12168, 15148, NULL),
(476, 2891, 3541, 9045, 89, 14049, 'Sousse_Medina', 'Féminin', 9, 29, 113, 226, 144, 76, 47, 29, 19, 238, 473, 21, 95, 2, 557, 1955, 1893, 27, 428, 1314, 75, 18, 1893, 4315, 35.62, 'Communal', 12168, 15148, NULL),
(477, 1427, 7565, 8210, 165, 25238, 'Sousse_Riadh', 'Masculin', 22, 165, 489, 565, 304, 121, 75, 49, 67, 996, 3171, 2138, 1302, 88, 668, 3029, 260, 37, 2466, 2694, 387, 264, 10.89, 15174, 67.47, 'Communal', 19146, 20738, NULL),
(478, 1427, 7524, 14323, 165, 24166, 'Sousse_Riadh', 'Féminin', 27, 119, 390, 587, 454, 193, 75, 41, 41, 668, 3272, 53, 76, 17, 70, 2493, 4604, 47, 813, 1155, 260, 30, 4604, 7936, 40.73, 'Communal', 19146, 20738, NULL);
INSERT INTO `unemployedpopulation` (`population_id`, `between_1km_2km`, `distribution_of_population`, `inactive_population`, `plus2km`, `population_aged_15_and_plus`, `regions`, `sexe`, `unemployed_15_19_years_age`, `unemployed_20_24_years_age`, `unemployed_25_29_years_age`, `unemployed_30_34_years_age`, `unemployed_35_39_years_age`, `unemployed_40_44_years_age`, `unemployed_45_49_years_age`, `unemployed_50_59_years_age`, `unemployed_60plus_years`, `unemployed_agriculture_fishing`, `unemployed_building_public_works`, `unemployed_commerce`, `unemployed_education_health_administrative_services`, `unemployed_mines_energy`, `unemployed_néant`, `unemployed_other_services`, `unemployed_primary`, `unemployed_secondary`, `unemployed_transport`, `unemployed_undeclared`, `unemployed_faculty`, `unemployed_manufacturing_industry`, `unemployment_rate`, `active_population_occupied`, `activity_rate`, `environment`, `less_than_1km`, `number_houses`, `unemployed_neant`) VALUES
(479, 9465, 8921, 11923, 525, 32991, 'Sousse_Jawhara', 'Masculin', 54, 138, 400, 469, 251, 150, 79, 55, 90, 781, 2418, 2118, 1395, 143, 556, 4659, 269, 60, 3030, 5279, 410, 314, 7.87, 19410, 63.86, 'Communal', 19684, 29674, NULL),
(480, 9465, 8592, 20729, 525, 34204, 'Sousse_Jawhara', 'Féminin', 44, 62, 333, 634, 407, 223, 110, 48, 41, 556, 2151, 65, 184, 11, 76, 5147, 5576, 60, 1010, 2911, 269, 76, 5576, 11599, 39.4, 'Communal', 19684, 29674, NULL),
(481, 1802, 8488, 5928, 233, 19630, 'Sousse_Sidi_Abdelhamid', 'Masculin', 18, 222, 428, 450, 251, 138, 101, 69, 87, 881, 2550, 2026, 1063, 224, 593, 1478, 330, 95, 2005, 2228, 608, 339, 12.93, 11931, 69.8, 'Communal', 13154, 15189, NULL),
(482, 1802, 7387, 11788, 233, 19566, 'Sousse_Sidi_Abdelhamid', 'Féminin', 17, 101, 315, 439, 282, 148, 80, 48, 39, 593, 2867, 39, 58, 16, 22, 1246, 3393, 117, 538, 1493, 330, 44, 3393, 6318, 39.75, 'Communal', 13154, 15189, NULL),
(483, 4493, 5734, 5296, 371, 16406, 'Hammam_Sousse', 'Masculin', 24, 55, 161, 192, 103, 55, 27, 20, 19, 314, 1883, 1509, 507, 160, 229, 1976, 73, 17, 1842, 2379, 152, 193, 5.73, 10473, 67.73, 'Communal', 13734, 18598, NULL),
(484, 4493, 5167, 10864, 371, 16727, 'Hammam_Sousse', 'Féminin', 18, 27, 123, 300, 181, 78, 29, 13, 7, 229, 1297, 40, 61, 8, 42, 1902, 2746, 21, 583, 1137, 73, 53, 2746, 5099, 35.05, 'Communal', 13734, 18598, NULL),
(485, 2698, 3575, 3579, 826, 10299, 'Akouda', 'Masculin', 11, 34, 94, 133, 71, 27, 12, 7, 18, 159, 893, 1073, 311, 169, 111, 1089, 69, 15, 997, 1694, 109, 82, 5.97, 6319, 65.26, 'Communal', 1085, 4609, NULL),
(486, 2698, 3434, 6405, 826, 10205, 'Akouda', 'Féminin', 10, 12, 81, 146, 92, 51, 15, 7, 11, 111, 1443, 25, 35, 27, 16, 966, 1140, 17, 245, 613, 69, 14, 1140, 3378, 37.24, 'Communal', 1085, 4609, NULL),
(487, 2698, 992, 968, 826, 2828, 'Akouda', 'Masculin', 7, 20, 27, 26, 19, 8, 1, 2, 5, 53, 187, 333, 84, 156, 32, 213, 19, 4, 186, 574, 32, 8, 6.02, 1748, 65.77, 'Rural', 1085, 4609, NULL),
(488, 2698, 887, 1704, 826, 2670, 'Akouda', 'Féminin', 3, 4, 20, 33, 14, 16, 4, 2, 0, 32, 243, 7, 5, 65, 2, 237, 414, 3, 58, 254, 19, 0, 414, 872, 36.19, 'Rural', 1085, 4609, NULL),
(489, 311, 7944, 6088, 694, 19757, 'Kala_Kebira', 'Masculin', 15, 135, 256, 318, 175, 74, 34, 30, 51, 526, 2031, 3673, 915, 471, 251, 1747, 102, 40, 1546, 2045, 254, 141, 7.94, 12584, 69.19, 'Communal', 320, 1325, NULL),
(490, 311, 6300, 13064, 694, 19106, 'Kala_Kebira', 'Féminin', 10, 65, 179, 355, 201, 85, 32, 15, 11, 251, 3045, 48, 32, 23, 17, 1226, 432, 33, 300, 385, 102, 22, 432, 5091, 31.62, 'Communal', 320, 1325, NULL),
(491, 311, 860, 557, 694, 2056, 'Kala_Kebira', 'Masculin', 2, 9, 17, 20, 11, 5, 1, 2, 5, 27, 170, 404, 64, 417, 15, 89, 16, 17, 120, 146, 23, 15, 4.8, 1427, 72.91, 'Rural', 320, 1325, NULL),
(492, 311, 722, 1604, 694, 2148, 'Kala_Kebira', 'Féminin', 1, 8, 14, 12, 12, 7, 1, 3, 0, 15, 291, 6, 2, 100, 2, 51, 50, 17, 13, 18, 16, 4, 50, 486, 25.33, 'Rural', 320, 1325, NULL),
(493, 539, 1445, 1129, 1573, 3731, 'Sidi_Bou_Ali', 'Masculin', 2, 30, 50, 71, 24, 10, 6, 5, 8, 104, 617, 364, 129, 154, 69, 462, 25, 10, 296, 346, 49, 24, 7.99, 2394, 69.74, 'Communal', 270, 2382, NULL),
(494, 539, 1352, 2477, 1573, 3897, 'Sidi_Bou_Ali', 'Féminin', 1, 15, 46, 65, 49, 20, 6, 2, 2, 69, 614, 15, 10, 30, 10, 328, 248, 7, 125, 87, 25, 4, 248, 1214, 36.46, 'Communal', 270, 2382, NULL),
(495, 539, 1550, 991, 1573, 3420, 'Sidi_Bou_Ali', 'Masculin', 2, 41, 66, 45, 30, 16, 9, 6, 8, 118, 590, 380, 143, 246, 49, 224, 29, 21, 248, 347, 67, 23, 9.3, 2203, 71.02, 'Rural', 270, 2382, NULL),
(496, 539, 1224, 2158, 1573, 3415, 'Sidi_Bou_Ali', 'Féminin', 2, 19, 29, 40, 27, 16, 6, 6, 3, 49, 635, 12, 12, 47, 4, 147, 53, 11, 77, 174, 29, 3, 53, 1109, 36.81, 'Rural', 270, 2382, NULL),
(497, 228, 1208, 922, 60, 2822, 'Hergla', 'Masculin', 3, 26, 51, 62, 28, 18, 17, 6, 12, 86, 228, 200, 207, 112, 34, 284, 54, 14, 178, 456, 98, 7, 11.84, 1675, 67.33, 'Communal', 212, 500, NULL),
(498, 228, 972, 1873, 60, 2870, 'Hergla', 'Féminin', 4, 6, 45, 77, 50, 33, 21, 6, 5, 34, 291, 7, 23, 13, 6, 244, 182, 17, 49, 120, 54, 0, 182, 751, 34.7, 'Communal', 212, 500, NULL),
(499, 228, 355, 223, 60, 702, 'Hergla', 'Masculin', -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 130, 125, 63, 39, 1, 36, 0, 0, 38, 47, 0, 2, 0, 479, 68.23, 'Rural', 212, 500, NULL),
(500, 228, 293, 543, 60, 713, 'Hergla', 'Féminin', 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 130, 3, 2, 2, 0, 11, 67, 1, 13, 4, 0, 3, 67, 168, 23.88, 'Rural', 212, 500, NULL),
(501, 2110, 1537, 1391, 4120, 4104, 'Enfidha', 'Masculin', 3, 37, 110, 91, 46, 37, 11, 9, 17, 203, 648, 223, 193, 98, 128, 486, 39, 11, 270, 394, 84, 37, 13.31, 2352, 66.11, 'Communal', 2803, 9033, NULL),
(502, 2110, 1513, 2902, 4120, 4244, 'Enfidha', 'Féminin', 0, 22, 57, 120, 61, 25, 18, 10, 8, 128, 352, 9, 85, 27, 17, 353, 172, 5, 79, 112, 39, 1, 172, 1018, 31.62, 'Communal', 2803, 9033, NULL),
(503, 2110, 6543, 4807, 4120, 14064, 'Enfidha', 'Masculin', 8, 188, 378, 349, 192, 145, 78, 69, 72, 696, 1313, 3044, 419, 439, 283, 752, 247, 125, 497, 1219, 562, 65, 16.21, 7756, 65.83, 'Rural', 2803, 9033, NULL),
(504, 2110, 5477, 10960, 4120, 14175, 'Enfidha', 'Féminin', 4, 106, 175, 210, 140, 77, 49, 31, 35, 283, 1180, 44, 41, 384, 5, 322, 264, 109, 130, 270, 247, 5, 264, 2380, 22.68, 'Rural', 2803, 9033, NULL),
(505, 996, 1551, 1125, 1438, 3658, 'Bouficha', 'Masculin', 3, 36, 69, 76, 49, 24, 11, 4, 11, 155, 187, 411, 166, 128, 93, 464, 42, 8, 215, 671, 86, 5, 11.17, 2250, 69.22, 'Communal', 1721, 4155, NULL),
(506, 996, 1467, 2674, 1438, 3698, 'Bouficha', 'Féminin', 2, 7, 41, 97, 62, 27, 5, 2, 0, 93, 286, 3, 14, 20, 9, 228, 253, 2, 56, 173, 42, 0, 253, 782, 27.69, 'Communal', 1721, 4155, NULL),
(507, 996, 3340, 2111, 1438, 6248, 'Bouficha', 'Masculin', 3, 78, 111, 115, 62, 42, 24, 13, 36, 169, 185, 835, 259, 398, 68, 322, 81, 58, 430, 1188, 245, 26, 11.87, 3646, 66.21, 'Rural', 1721, 4155, NULL),
(508, 996, 2493, 4632, 1438, 6156, 'Bouficha', 'Féminin', 3, 28, 49, 74, 31, 24, 7, 10, 22, 68, 431, 20, 10, 311, 4, 151, 143, 48, 107, 239, 81, 3, 143, 1275, 24.74, 'Rural', 1721, 4155, NULL),
(509, 654, 555, 387, 586, 1291, 'Kondar', 'Masculin', 0, 29, 52, 34, 22, 11, 15, 8, 9, 80, 126, 139, 44, 47, 33, 133, 41, 24, 95, 137, 75, 2, 20.02, 723, 69.97, 'Communal', 839, 2079, NULL),
(510, 654, 499, 819, 586, 1282, 'Kondar', 'Féminin', 1, 17, 24, 26, 21, 9, 6, 4, 5, 33, 228, 4, 1, 14, 2, 38, 79, 18, 32, 31, 41, 0, 79, 349, 36.12, 'Communal', 839, 2079, NULL),
(511, 654, 1749, 1248, 586, 3471, 'Kondar', 'Masculin', 1, 46, 49, 54, 33, 17, 14, 4, 7, 66, 227, 743, 127, 189, 50, 150, 65, 28, 330, 222, 103, 8, 10.17, 1997, 64.04, 'Rural', 839, 2079, NULL),
(512, 654, 1306, 2460, 586, 3455, 'Kondar', 'Féminin', 1, 46, 32, 37, 20, 11, 2, 2, 4, 50, 612, 16, 0, 40, 0, 74, 44, 19, 42, 51, 65, 2, 44, 838, 28.8, 'Rural', 839, 2079, NULL),
(513, 210, 463, 350, 2307, 935, 'Sidi_Heni', 'Masculin', 0, 10, 12, 18, 11, 6, 4, 2, 3, 33, 103, 149, 12, 56, 9, 93, 5, 2, 57, 44, 28, 2, 11.79, 516, 62.57, 'Communal', 351, 2868, NULL),
(514, 210, 430, 819, 2307, 1033, 'Sidi_Heni', 'Féminin', 0, 2, 7, 10, 7, 4, 1, 2, 0, 9, 121, 2, 2, 1, 6, 37, 60, 1, 9, 9, 5, 0, 60, 181, 20.72, 'Communal', 351, 2868, NULL),
(515, 210, 1811, 1337, 2307, 3747, 'Sidi_Heni', 'Masculin', 2, 49, 45, 58, 29, 25, 12, 9, 13, 104, 305, 841, 96, 361, 33, 190, 22, 13, 178, 191, 107, 4, 10.04, 2168, 64.32, 'Rural', 351, 2868, NULL),
(516, 210, 1529, 3366, 2307, 4201, 'Sidi_Heni', 'Féminin', 3, 12, 30, 33, 9, 6, 3, 1, 1, 33, 506, 11, 0, 121, 0, 57, 162, 7, 14, 27, 22, 0, 162, 739, 19.88, 'Rural', 351, 2868, NULL),
(517, 2731, 10130, 9127, 1722, 25323, 'Msaken', 'Masculin', 35, 130, 312, 318, 152, 81, 50, 44, 86, 529, 3279, 3748, 654, 368, 290, 2517, 117, 33, 2841, 1429, 341, 133, 7.36, 15004, 63.96, 'Communal', 4029, 8482, NULL),
(518, 2731, 10200, 20313, 1722, 28232, 'Msaken', 'Féminin', 22, 53, 241, 447, 250, 113, 30, 25, 18, 290, 3436, 57, 36, 11, 20, 2011, 1743, 20, 535, 613, 117, 17, 1743, 6738, 28.05, 'Communal', 4029, 8482, NULL),
(519, 2731, 3859, 3052, 1722, 8788, 'Msaken', 'Masculin', 8, 59, 98, 103, 55, 35, 12, 20, 35, 194, 1004, 1449, 278, 482, 113, 720, 52, 44, 707, 601, 127, 61, 7.43, 5310, 65.27, 'Rural', 4029, 8482, NULL),
(520, 2731, 3332, 6735, 1722, 8908, 'Msaken', 'Féminin', 3, 20, 82, 92, 72, 24, 21, 5, 6, 113, 1041, 26, 6, 77, 3, 361, 336, 17, 141, 188, 52, 5, 336, 1848, 24.39, 'Rural', 4029, 8482, NULL),
(521, 435, 4949, 4054, 250, 12749, 'Kala_Seghira', 'Masculin', 16, 103, 209, 253, 116, 61, 33, 28, 39, 390, 1414, 1864, 533, 151, 257, 1394, 151, 30, 1057, 1228, 222, 184, 9.82, 7841, 68.2, 'Communal', 325, 1010, NULL),
(522, 435, 4230, 7828, 250, 12749, 'Kala_Seghira', 'Féminin', 18, 49, 155, 269, 190, 92, 43, 30, 24, 257, 1553, 45, 57, 18, 9, 1353, 1657, 50, 385, 602, 151, 35, 1657, 4066, 38.6, 'Communal', 325, 1010, NULL),
(523, 435, 673, 333, 250, 1214, 'Kala_Seghira', 'Masculin', 0, 4, 9, 11, 1, 3, 1, 0, 3, 13, 149, 242, 74, 125, 8, 60, 6, 3, 103, 70, 14, 25, 3.75, 848, 72.57, 'Rural', 325, 1010, NULL),
(524, 435, 470, 822, 250, 1086, 'Kala_Seghira', 'Féminin', 0, 1, 7, 14, 6, 1, 3, 0, 0, 8, 159, 5, 1, 10, 3, 30, 88, 2, 20, 5, 6, 1, 88, 231, 24.31, 'Rural', 325, 1010, NULL),
(525, 2043, 5128, 3457, 281, 11824, 'Zaouia_Ksiba_Thrayet', 'Masculin', 20, 106, 153, 138, 81, 34, 26, 11, 22, 246, 2139, 1837, 529, 123, 144, 993, 92, 48, 1043, 988, 193, 114, 6.94, 7786, 70.76, 'Communal', 6278, 8602, NULL),
(526, 2043, 4283, 7146, 281, 11645, 'Zaouia_Ksiba_Thrayet', 'Féminin', 8, 46, 127, 187, 107, 42, 23, 11, 18, 144, 2497, 41, 22, 38, 15, 680, 2045, 49, 214, 419, 92, 18, 2045, 3937, 38.63, 'Communal', 6278, 8602, NULL),
(527, 39392, 80752, 67461, 9255, 198856, 'Monastir', 'Masculin', 177, 1229, 2580, 2636, 1292, 616, 351, 268, 398, 4361, 30051, 23262, 7509, 7712, 2495, 19455, 1058, 343, 18527, 14023, 2307, 1192, 7.22, 121908, 66.07, 'Communal', 116040, 164687, NULL),
(528, 39392, 73771, 128558, 9255, 204395, 'Monastir', 'Féminin', 185, 536, 1939, 3399, 1947, 790, 311, 185, 154, 2495, 39742, 476, 526, 1055, 397, 16040, 15521, 307, 3392, 4899, 1058, 203, 15521, 66518, 37.1, 'Communal', 116040, 164687, NULL),
(529, 7276, 11771, 15035, 1085, 39453, 'Monastir', 'Masculin', 44, 184, 474, 594, 305, 140, 57, 62, 78, 899, 3798, 3275, 1831, 603, 658, 5708, 214, 53, 3009, 3879, 370, 359, 7.83, 22506, 61.89, 'Communal', 29192, 37553, NULL),
(530, 7276, 11302, 24652, 1085, 40480, 'Monastir', 'Féminin', 37, 76, 382, 742, 484, 221, 93, 40, 33, 658, 4883, 104, 253, 62, 162, 5786, 5826, 38, 840, 1681, 214, 95, 5826, 13741, 39.1, 'Communal', 29192, 37553, NULL),
(531, 1170, 4125, 2517, 456, 7809, 'Ouerdanine', 'Masculin', 13, 101, 151, 87, 54, 27, 31, 25, 26, 235, 954, 871, 368, 348, 119, 655, 73, 24, 821, 716, 213, 36, 9.64, 4782, 67.76, 'Communal', 4686, 6312, NULL),
(532, 1170, 3355, 4989, 456, 7886, 'Ouerdanine', 'Féminin', 10, 41, 68, 138, 81, 22, 11, 6, 6, 119, 1787, 15, 12, 33, 22, 405, 481, 17, 134, 123, 73, 3, 481, 2522, 36.74, 'Communal', 4686, 6312, NULL),
(533, 1226, 4348, 3250, 102, 10186, 'Sahline', 'Masculin', 9, 58, 157, 145, 65, 42, 21, 20, 29, 279, 1283, 1060, 501, 249, 133, 840, 53, 20, 915, 1403, 154, 127, 7.92, 6387, 68.1, 'Communal', 6906, 8234, NULL),
(534, 1226, 3829, 6544, 102, 10355, 'Sahline', 'Féminin', 11, 14, 80, 158, 84, 33, 28, 9, 10, 133, 1971, 29, 45, 37, 9, 710, 1126, 20, 254, 328, 53, 10, 1126, 3395, 36.8, 'Communal', 6906, 8234, NULL),
(535, 2359, 4728, 3833, 1119, 10526, 'Zermadine', 'Masculin', 7, 124, 215, 196, 105, 50, 31, 19, 37, 383, 2364, 738, 284, 225, 165, 1092, 90, 20, 724, 419, 229, 55, 11.73, 5908, 63.59, 'Communal', 4932, 8410, NULL),
(536, 2359, 4027, 7632, 1119, 11073, 'Zermadine', 'Féminin', 5, 35, 149, 230, 148, 40, 20, 14, 7, 165, 2035, 18, 14, 30, 4, 446, 1065, 28, 145, 99, 90, 5, 1065, 2797, 31.08, 'Communal', 4932, 8410, NULL),
(537, 1617, 2080, 1853, 762, 5039, 'Beni_Hassen', 'Masculin', 3, 34, 67, 84, 40, 16, 10, 9, 13, 127, 871, 549, 169, 314, 65, 519, 24, 9, 238, 222, 64, 21, 8.79, 2906, 63.23, 'Communal', 2213, 4592, NULL),
(538, 1617, 1939, 2989, 762, 5030, 'Beni_Hassen', 'Féminin', 2, 10, 58, 94, 39, 17, 2, 10, 4, 65, 1407, 8, 2, 34, 6, 263, 269, 7, 37, 53, 24, 1, 269, 1807, 40.58, 'Communal', 2213, 4592, NULL),
(539, 3410, 10300, 7147, 771, 23160, 'Jammel', 'Masculin', 23, 147, 256, 263, 122, 65, 32, 21, 35, 450, 4656, 3238, 816, 537, 255, 1664, 115, 34, 2955, 1076, 211, 100, 5.92, 15065, 69.14, 'Communal', 14927, 19108, NULL),
(540, 3410, 9498, 15311, 771, 23827, 'Jammel', 'Féminin', 30, 63, 232, 364, 197, 75, 32, 15, 15, 255, 5380, 64, 24, 53, 24, 1242, 1295, 39, 401, 316, 115, 9, 1295, 7519, 35.74, 'Communal', 14927, 19108, NULL),
(541, 1062, 5132, 3758, 112, 11489, 'Bembla', 'Masculin', 12, 71, 116, 116, 64, 37, 17, 10, 17, 197, 2030, 1520, 568, 317, 115, 893, 46, 23, 1105, 774, 134, 57, 5.89, 7276, 67.28, 'Communal', 7121, 8295, NULL),
(542, 1062, 4600, 6783, 112, 11592, 'Bembla', 'Féminin', 10, 30, 94, 151, 86, 22, 4, 8, 7, 115, 3250, 30, 20, 51, 22, 700, 528, 16, 146, 189, 46, 8, 528, 4404, 41.49, 'Communal', 7121, 8295, NULL),
(543, 7069, 14402, 10155, 2492, 31582, 'Moknine', 'Masculin', 24, 252, 461, 418, 220, 106, 73, 50, 78, 728, 4168, 4894, 1117, 1401, 339, 2917, 159, 86, 3419, 1673, 485, 140, 7.81, 19753, 67.84, 'Communal', 13531, 23092, NULL),
(544, 7069, 11937, 20648, 2492, 32121, 'Moknine', 'Féminin', 27, 109, 303, 484, 267, 110, 34, 17, 18, 339, 6405, 71, 49, 375, 30, 1994, 1354, 51, 546, 632, 159, 22, 1354, 10121, 35.72, 'Communal', 13531, 23092, NULL),
(545, 2273, 2625, 2021, 1192, 6773, 'Bekalta', 'Masculin', 1, 16, 62, 68, 31, 7, 6, 3, 3, 72, 540, 870, 182, 1111, 39, 608, 10, 8, 680, 532, 25, 26, 4.25, 4550, 70.16, 'Communal', 2891, 6356, NULL),
(546, 2273, 2327, 4723, 1192, 6568, 'Bekalta', 'Féminin', 1, 10, 47, 97, 46, 25, 5, 1, 3, 39, 721, 11, 13, 225, 11, 422, 331, 5, 84, 127, 10, 7, 331, 1611, 28.11, 'Communal', 2891, 6356, NULL),
(547, 2757, 5989, 4207, 426, 13672, 'Teboulba', 'Masculin', 8, 46, 138, 145, 64, 26, 13, 6, 18, 203, 1998, 1343, 607, 1891, 108, 1035, 39, 13, 1180, 861, 80, 78, 4.9, 9001, 69.23, 'Communal', 7324, 10507, NULL),
(548, 2757, 5620, 9004, 426, 13711, 'Teboulba', 'Féminin', 2, 34, 123, 221, 119, 37, 13, 6, 6, 108, 2666, 26, 30, 78, 24, 876, 636, 15, 183, 278, 39, 5, 636, 4144, 34.33, 'Communal', 7324, 10507, NULL),
(549, 3732, 6886, 5966, 394, 18087, 'Ksar_Helal', 'Masculin', 22, 116, 262, 256, 112, 61, 37, 20, 33, 439, 4181, 2058, 430, 109, 254, 1315, 125, 38, 1908, 1132, 215, 55, 7.52, 11210, 67.01, 'Communal', 10214, 14340, NULL),
(550, 3732, 6702, 11465, 394, 19051, 'Ksar_Helal', 'Féminin', 26, 61, 185, 292, 180, 93, 35, 26, 19, 254, 4426, 53, 20, 48, 50, 1250, 1187, 43, 318, 536, 125, 9, 1187, 6686, 39.82, 'Communal', 10214, 14340, NULL),
(551, 2561, 4786, 4583, 97, 12386, 'Ksibet_Mediouni', 'Masculin', 9, 59, 151, 180, 69, 20, 15, 13, 16, 231, 1923, 1558, 405, 227, 152, 1208, 69, 11, 985, 846, 85, 114, 6.77, 7275, 63, 'Communal', 6900, 9558, NULL),
(552, 2561, 5003, 7982, 97, 12805, 'Ksibet_Mediouni', 'Féminin', 14, 29, 118, 264, 144, 72, 19, 15, 18, 152, 2636, 29, 27, 12, 18, 912, 761, 20, 168, 322, 69, 16, 761, 4136, 37.66, 'Communal', 6900, 9558, NULL),
(553, 2880, 3580, 3136, 247, 8694, 'Bou_Hjar', 'Masculin', 4, 20, 69, 84, 40, 19, 8, 10, 15, 117, 1284, 1287, 231, 380, 93, 1001, 41, 4, 588, 490, 42, 24, 4.84, 5289, 63.92, 'Communal', 5203, 8330, NULL),
(554, 2880, 3632, 5836, 247, 9896, 'Bou_Hjar', 'Féminin', 9, 24, 101, 163, 73, 23, 15, 18, 8, 93, 2176, 18, 17, 17, 15, 1034, 662, 8, 136, 215, 41, 13, 662, 3635, 41.03, 'Communal', 5203, 8330, NULL),
(555, 14648, 27448, 24047, 33529, 66813, 'Mahdia', 'Masculin', 82, 433, 940, 1010, 533, 235, 129, 118, 157, 1641, 4958, 7804, 1721, 4512, 882, 7778, 462, 153, 7123, 4724, 902, 455, 8.44, 39157, 64.01, 'Communal', 8664, 56841, NULL),
(556, 14648, 25251, 51351, 33529, 71572, 'Mahdia', 'Féminin', 54, 184, 645, 1167, 647, 291, 144, 81, 70, 882, 6039, 118, 117, 445, 151, 6770, 4347, 149, 1430, 1938, 462, 62, 4347, 16973, 28.25, 'Communal', 8664, 56841, NULL),
(557, 14648, 37342, 28366, 33529, 74527, 'Mahdia', 'Masculin', 55, 854, 1135, 1049, 659, 482, 320, 302, 456, 2136, 4030, 14256, 1517, 6137, 773, 4329, 505, 453, 7351, 2867, 2159, 222, 11.69, 40764, 61.94, 'Rural', 8664, 56841, NULL),
(558, 14648, 32171, 71203, 33529, 85021, 'Mahdia', 'Féminin', 40, 321, 612, 843, 431, 200, 74, 52, 43, 773, 6275, 193, 36, 2032, 36, 1597, 1643, 229, 539, 501, 505, 13, 1643, 11226, 16.25, 'Rural', 8664, 56841, NULL),
(559, 2292, 8273, 8013, 1095, 23192, 'Mahdia', 'Masculin', 40, 121, 335, 361, 201, 84, 38, 34, 47, 541, 1955, 2591, 672, 1418, 368, 3179, 164, 44, 1590, 2253, 271, 246, 8.14, 13944, 65.45, 'Communal', 1268, 4655, NULL),
(560, 2292, 8026, 15389, 1095, 23873, 'Mahdia', 'Féminin', 20, 64, 224, 476, 263, 110, 66, 38, 29, 368, 2007, 45, 61, 147, 69, 3219, 2287, 50, 551, 1120, 164, 41, 2287, 7211, 35.54, 'Communal', 1268, 4655, NULL),
(561, 2292, 3106, 2104, 1095, 5592, 'Mahdia', 'Masculin', 2, 80, 73, 67, 44, 43, 23, 24, 19, 152, 539, 1015, 125, 506, 59, 301, 41, 23, 249, 350, 169, 20, 10.92, 3107, 62.37, 'Rural', 1268, 4655, NULL),
(562, 2292, 2888, 4930, 1095, 6602, 'Mahdia', 'Féminin', 5, 28, 40, 49, 17, 17, 4, 5, 4, 59, 999, 9, 0, 269, 12, 117, 112, 19, 49, 57, 41, 0, 112, 1505, 25.33, 'Rural', 1268, 4655, NULL),
(563, 970, 1909, 1351, 3088, 4011, 'Bou_Merdes', 'Masculin', 2, 54, 93, 84, 37, 22, 15, 5, 17, 196, 670, 601, 75, 104, 61, 348, 23, 11, 314, 201, 88, 12, 12.52, 2327, 66.32, 'Communal', 935, 4993, NULL),
(564, 970, 1670, 2875, 3088, 4285, 'Bou_Merdes', 'Féminin', 6, 16, 34, 72, 32, 10, 7, 2, 0, 61, 853, 8, 7, 30, 2, 229, 159, 7, 56, 47, 23, 1, 159, 1237, 32.91, 'Communal', 935, 4993, NULL),
(565, 970, 3910, 2451, 3088, 7631, 'Bou_Merdes', 'Masculin', 5, 135, 179, 127, 81, 36, 41, 44, 48, 329, 791, 1458, 200, 407, 106, 407, 67, 36, 834, 356, 279, 17, 13.61, 4475, 67.88, 'Rural', 935, 4993, NULL),
(566, 970, 3330, 5671, 3088, 7834, 'Bou_Merdes', 'Féminin', 5, 53, 86, 119, 43, 17, 9, 0, 3, 106, 1172, 14, 4, 366, 2, 162, 169, 16, 47, 59, 67, 1, 169, 1830, 27.6, 'Rural', 935, 4993, NULL),
(567, 551, 741, 662, 3515, 1551, 'Ouled_Chamekh', 'Masculin', 1, 33, 27, 30, 7, 7, 4, 4, 6, 38, 37, 178, 34, 32, 51, 174, 43, 12, 228, 82, 51, 1, 13.72, 767, 57.28, 'Communal', 249, 4315, NULL),
(568, 551, 718, 1577, 3515, 2058, 'Ouled_Chamekh', 'Féminin', 2, 25, 45, 38, 22, 17, 5, 2, 1, 51, 105, 4, 1, 1, 10, 135, 101, 15, 34, 40, 43, 2, 101, 324, 23.36, 'Communal', 249, 4315, NULL),
(569, 551, 2815, 2593, 3515, 5728, 'Ouled_Chamekh', 'Masculin', 3, 67, 78, 91, 60, 34, 22, 22, 39, 160, 128, 1138, 87, 502, 52, 295, 42, 51, 370, 178, 155, 12, 13.46, 2713, 54.74, 'Rural', 249, 4315, NULL),
(570, 551, 2515, 6719, 3515, 7223, 'Ouled_Chamekh', 'Féminin', 3, 19, 45, 60, 44, 17, 3, 2, 3, 52, 90, 10, 3, 32, 2, 116, 133, 18, 29, 25, 42, 1, 133, 309, 6.98, 'Rural', 249, 4315, NULL),
(571, 882, 960, 738, 4303, 1913, 'Chorbane', 'Masculin', 2, 18, 44, 22, 17, 15, 11, 13, 13, 72, 80, 254, 41, 80, 46, 278, 35, 14, 210, 61, 61, 8, 13.7, 1014, 61.42, 'Communal', 304, 5489, NULL),
(572, 882, 832, 1816, 4303, 2252, 'Chorbane', 'Féminin', 2, 9, 19, 35, 21, 19, 14, 8, 8, 46, 51, 2, 0, 7, 11, 189, 129, 16, 20, 30, 35, 0, 129, 301, 19.32, 'Communal', 304, 5489, NULL),
(573, 882, 3799, 2842, 4303, 6989, 'Chorbane', 'Masculin', 6, 70, 101, 105, 80, 88, 57, 56, 81, 235, 169, 1442, 96, 287, 88, 389, 50, 60, 900, 168, 309, 18, 16.2, 3475, 59.35, 'Rural', 304, 5489, NULL),
(574, 882, 2798, 7087, 4303, 7695, 'Chorbane', 'Féminin', 3, 28, 62, 102, 46, 13, 10, 6, 4, 88, 110, 18, 3, 17, 5, 127, 223, 11, 38, 20, 50, 0, 223, 336, 7.91, 'Rural', 304, 5489, NULL),
(575, 526, 490, 384, 1207, 1101, 'Hebira', 'Masculin', 3, 4, 16, 15, 6, 3, 4, 5, 3, 24, 63, 118, 24, 124, 18, 233, 13, 2, 61, 33, 15, 2, 7.81, 661, 65.12, 'Communal', 412, 2145, NULL),
(576, 526, 505, 854, 1207, 1280, 'Hebira', 'Féminin', 1, 5, 10, 13, 13, 0, 5, 5, 9, 18, 9, 2, 2, 162, 2, 153, 112, 11, 21, 13, 13, 2, 112, 365, 33.26, 'Communal', 412, 2145, NULL),
(577, 526, 1229, 1194, 1207, 2518, 'Hebira', 'Masculin', 2, 13, 23, 23, 8, 9, 9, 9, 6, 51, 43, 345, 44, 408, 17, 191, 13, 8, 140, 41, 40, 5, 7.93, 1219, 52.62, 'Rural', 412, 2145, NULL),
(578, 526, 918, 2565, 1207, 2891, 'Hebira', 'Féminin', 1, 6, 10, 24, 10, 5, 2, 2, 2, 17, 20, 0, 1, 106, 0, 104, 148, 5, 14, 16, 13, 2, 148, 264, 11.28, 'Rural', 412, 2145, NULL),
(579, 2048, 697, 521, 6917, 1739, 'Essouassi', 'Masculin', 3, 30, 63, 37, 21, 6, 2, 6, 9, 87, 103, 142, 37, 14, 36, 339, 39, 9, 223, 171, 48, 10, 14.45, 1042, 70.04, 'Communal', 1189, 10154, NULL),
(580, 2048, 725, 1398, 6917, 2011, 'Essouassi', 'Féminin', 3, 11, 32, 32, 33, 18, 4, 6, 3, 36, 114, 0, 0, 3, 16, 228, 195, 11, 48, 76, 39, 1, 195, 473, 30.45, 'Communal', 1189, 10154, NULL),
(581, 2048, 7556, 5502, 6917, 15441, 'Essouassi', 'Masculin', 20, 144, 234, 174, 108, 73, 36, 35, 68, 354, 832, 2750, 327, 969, 146, 754, 92, 75, 2709, 629, 350, 61, 8.93, 9051, 64.37, 'Rural', 1189, 10154, NULL),
(582, 2048, 6065, 14514, 6917, 16719, 'Essouassi', 'Féminin', 6, 59, 131, 154, 72, 44, 13, 4, 9, 146, 1010, 43, 7, 147, 2, 238, 241, 57, 134, 131, 92, 3, 241, 1719, 13.19, 'Rural', 1189, 10154, NULL),
(583, 2077, 3678, 2531, 3754, 7817, 'Djem', 'Masculin', 12, 65, 112, 116, 76, 38, 15, 11, 6, 190, 574, 669, 163, 149, 92, 577, 55, 29, 2136, 524, 145, 41, 8.34, 4845, 67.63, 'Communal', 1081, 6912, NULL),
(584, 2077, 2830, 6256, 3754, 7853, 'Djem', 'Féminin', 10, 23, 80, 128, 59, 22, 7, 4, 6, 92, 365, 13, 10, 7, 13, 516, 287, 11, 207, 131, 55, 3, 287, 1262, 20.32, 'Communal', 1081, 6912, NULL),
(585, 2077, 4535, 3231, 3754, 9536, 'Djem', 'Masculin', 4, 119, 148, 126, 71, 54, 40, 21, 61, 260, 505, 2486, 165, 536, 127, 646, 98, 68, 933, 332, 252, 36, 10.5, 5643, 66.12, 'Rural', 1081, 6912, NULL),
(586, 2077, 3896, 8834, 3754, 10377, 'Djem', 'Féminin', 3, 66, 101, 125, 64, 34, 14, 22, 10, 127, 535, 48, 5, 137, 1, 241, 173, 58, 76, 59, 98, 2, 173, 1106, 14.87, 'Rural', 1081, 6912, NULL),
(587, 135, 3139, 2965, 378, 8023, 'Chebba', 'Masculin', 14, 38, 67, 102, 45, 17, 9, 15, 16, 135, 397, 708, 181, 1589, 86, 907, 40, 14, 475, 414, 56, 57, 6.25, 4742, 63.04, 'Communal', 324, 837, NULL),
(588, 135, 2862, 6165, 378, 8644, 'Chebba', 'Féminin', 5, 10, 67, 126, 73, 39, 22, 8, 6, 86, 832, 15, 13, 28, 12, 833, 507, 14, 179, 214, 40, 5, 507, 2124, 28.68, 'Communal', 324, 837, NULL),
(589, 135, 339, 322, 378, 811, 'Chebba', 'Masculin', 0, 2, 5, 8, 7, 4, 0, 3, 7, 13, 44, 72, 15, 177, 14, 76, 10, 3, 35, 31, 15, 4, 7.16, 454, 60.3, 'Rural', 324, 837, NULL),
(590, 135, 266, 679, 378, 835, 'Chebba', 'Féminin', 1, 1, 4, 9, 12, 6, 4, 0, 1, 14, 50, 1, 0, 19, 1, 32, 33, 3, 6, 9, 10, 0, 33, 118, 18.56, 'Rural', 324, 837, NULL),
(591, 812, 1100, 1013, 2595, 2343, 'Melloulech', 'Masculin', 0, 9, 23, 30, 25, 8, 3, 2, 6, 46, 90, 199, 52, 408, 14, 242, 7, 2, 130, 93, 23, 7, 8.2, 1221, 56.76, 'Communal', 437, 3844, NULL),
(592, 812, 873, 2292, 2595, 2756, 'Melloulech', 'Féminin', 0, 2, 17, 30, 21, 11, 1, 2, 1, 14, 174, 0, 1, 15, 2, 130, 73, 4, 33, 24, 7, 1, 73, 378, 16.84, 'Communal', 437, 3844, NULL),
(593, 812, 2393, 2172, 2595, 5319, 'Melloulech', 'Masculin', 0, 40, 77, 111, 59, 28, 17, 17, 13, 140, 150, 635, 112, 1038, 47, 394, 19, 27, 254, 183, 108, 14, 11.66, 2780, 59.17, 'Rural', 437, 3844, NULL),
(594, 812, 2013, 4842, 2595, 5795, 'Melloulech', 'Féminin', 5, 13, 31, 76, 41, 19, 5, 4, 0, 47, 295, 4, 6, 269, 5, 128, 91, 12, 22, 34, 19, 0, 91, 763, 16.45, 'Rural', 437, 3844, NULL),
(595, 2112, 1087, 963, 5217, 2548, 'Sidi_Alouane', 'Masculin', 2, 14, 21, 36, 18, 5, 7, 8, 8, 47, 180, 513, 60, 58, 19, 258, 11, 7, 223, 160, 33, 11, 7.57, 1465, 62.17, 'Communal', 795, 8124, NULL),
(596, 2112, 1192, 2140, 5217, 2814, 'Sidi_Alouane', 'Féminin', 0, 4, 20, 29, 16, 1, 1, 1, 1, 19, 366, 13, 4, 2, 3, 150, 111, 0, 35, 31, 11, 0, 111, 601, 23.95, 'Communal', 795, 8124, NULL),
(597, 2112, 4844, 3515, 5217, 9438, 'Sidi_Alouane', 'Masculin', 8, 131, 161, 155, 106, 90, 56, 47, 84, 325, 555, 1886, 213, 872, 67, 536, 49, 64, 637, 350, 379, 21, 14.27, 5078, 62.76, 'Rural', 795, 8124, NULL),
(598, 2112, 4697, 9558, 5217, 12063, 'Sidi_Alouane', 'Féminin', 7, 29, 55, 76, 48, 19, 7, 4, 5, 67, 1471, 26, 5, 482, 0, 172, 209, 18, 52, 44, 49, 2, 209, 2261, 20.76, 'Rural', 795, 8124, NULL),
(599, 2242, 5374, 4906, 1462, 12575, 'Ksour_Essef', 'Masculin', 4, 46, 138, 176, 79, 30, 21, 15, 26, 265, 809, 1831, 382, 535, 89, 1243, 31, 9, 1533, 732, 111, 60, 7.04, 7129, 60.99, 'Communal', 1669, 5373, NULL),
(600, 2242, 5018, 10589, 1462, 13746, 'Ksour_Essef', 'Féminin', 8, 15, 96, 188, 92, 43, 12, 5, 6, 89, 1162, 16, 18, 43, 11, 988, 386, 10, 245, 211, 31, 6, 386, 2697, 22.97, 'Communal', 1669, 5373, NULL),
(601, 2242, 2816, 2440, 1462, 5524, 'Ksour_Essef', 'Masculin', 4, 53, 56, 62, 35, 23, 19, 24, 30, 118, 274, 1030, 133, 435, 50, 340, 24, 38, 290, 249, 104, 14, 10.21, 2769, 55.83, 'Rural', 1669, 5373, NULL),
(602, 2242, 2785, 5804, 1462, 6987, 'Ksour_Essef', 'Féminin', 4, 19, 47, 49, 34, 9, 3, 3, 2, 50, 522, 20, 2, 187, 6, 159, 111, 12, 72, 47, 24, 2, 111, 1015, 16.93, 'Rural', 1669, 5373, NULL),
(603, 25010, 80783, 77796, 52160, 228718, 'Sfax', 'Masculin', 150, 934, 2504, 3111, 1515, 646, 381, 297, 431, 4511, 31366, 19806, 10319, 6278, 3338, 27114, 1367, 344, 24602, 17723, 2010, 3572, 6.62, 140930, 65.99, 'Communal', 19220, 96390, NULL),
(604, 25010, 73794, 163928, 52160, 229531, 'Sfax', 'Féminin', 102, 543, 2188, 4129, 2656, 1159, 431, 268, 257, 3338, 15962, 487, 459, 334, 905, 22498, 25591, 356, 5628, 8051, 1367, 392, 25591, 53913, 28.58, 'Communal', 19220, 96390, NULL),
(605, 25010, 64182, 44561, 52160, 132688, 'Sfax', 'Masculin', 62, 1481, 2378, 2350, 1417, 897, 541, 503, 822, 4061, 12559, 22938, 4154, 13634, 2056, 7830, 1810, 1235, 9372, 5814, 4052, 1116, 12.08, 77479, 66.42, 'Rural', 19220, 96390, NULL),
(606, 25010, 50079, 109642, 52160, 133741, 'Sfax', 'Féminin', 45, 860, 1530, 1963, 1157, 585, 295, 185, 174, 2056, 7201, 277, 82, 2629, 85, 3427, 6733, 826, 1292, 2271, 1810, 82, 6733, 17306, 18.02, 'Rural', 19220, 96390, NULL),
(607, 6247, 11513, 13683, 430, 39004, 'Sfax_Ville', 'Masculin', 31, 133, 389, 468, 259, 103, 78, 49, 72, 697, 4377, 2608, 1760, 443, 525, 5369, 186, 92, 4639, 3891, 267, 626, 6.23, 23744, 64.92, 'Communal', 30705, 37382, NULL),
(608, 6247, 11638, 27459, 430, 40721, 'Sfax_Ville', 'Féminin', 27, 87, 319, 615, 437, 225, 94, 50, 58, 525, 2719, 112, 110, 30, 426, 4884, 4692, 59, 1312, 2094, 186, 78, 4692, 11366, 32.57, 'Communal', 30705, 37382, NULL),
(609, 6788, 13816, 15490, 829, 43202, 'Sfax', 'Masculin', 20, 148, 461, 667, 298, 145, 68, 51, 62, 882, 4914, 3267, 2184, 524, 678, 5758, 218, 51, 4357, 3964, 334, 786, 6.99, 25774, 64.15, 'Communal', 27739, 35356, NULL),
(610, 6788, 13048, 29949, 829, 43058, 'Sfax', 'Féminin', 14, 108, 397, 797, 517, 230, 78, 48, 43, 678, 3017, 96, 119, 33, 114, 4655, 5509, 61, 1101, 1768, 218, 73, 5509, 10876, 30.44, 'Communal', 27739, 35356, NULL),
(611, 994, 10846, 10329, 260, 30362, 'Sakiet_Ezzit', 'Masculin', 21, 85, 227, 293, 141, 54, 33, 29, 49, 364, 5334, 2666, 1378, 385, 307, 3131, 105, 25, 3901, 1958, 164, 338, 4.6, 19112, 65.98, 'Communal', 1031, 2285, NULL),
(612, 994, 9571, 22087, 260, 30159, 'Sakiet_Ezzit', 'Féminin', 9, 48, 235, 491, 352, 116, 45, 26, 20, 307, 2026, 64, 50, 19, 89, 2895, 3916, 21, 754, 877, 105, 40, 3916, 6734, 26.77, 'Communal', 1031, 2285, NULL),
(613, 994, 1559, 687, 260, 2975, 'Sakiet_Ezzit', 'Masculin', 1, 40, 48, 48, 21, 13, 8, 11, 8, 90, 659, 509, 155, 207, 70, 155, 62, 18, 265, 118, 76, 18, 8.78, 2087, 76.91, 'Rural', 1031, 2285, NULL),
(614, 994, 1210, 1844, 260, 2835, 'Sakiet_Ezzit', 'Féminin', 1, 23, 36, 54, 39, 17, 11, 6, 8, 70, 442, 4, 2, 86, 9, 101, 517, 26, 69, 85, 62, 4, 517, 794, 34.94, 'Rural', 1031, 2285, NULL),
(615, 744, 16213, 13416, 518, 41553, 'Sakiet_Eddaier', 'Masculin', 32, 192, 389, 458, 232, 77, 45, 43, 61, 679, 6759, 4302, 1834, 1524, 501, 3924, 217, 40, 4404, 3207, 336, 627, 5.42, 26613, 67.71, 'Communal', 531, 1793, NULL),
(616, 744, 13980, 29557, 518, 40683, 'Sakiet_Eddaier', 'Féminin', 20, 93, 365, 624, 386, 142, 42, 35, 36, 501, 3599, 75, 64, 32, 52, 3323, 4883, 51, 863, 1336, 217, 81, 4883, 9393, 27.35, 'Communal', 531, 1793, NULL),
(617, 744, 1386, 527, 518, 2405, 'Sakiet_Eddaier', 'Masculin', 1, 12, 18, 12, 14, 6, 2, 0, 3, 31, 408, 581, 95, 270, 28, 123, 22, 5, 208, 93, 24, 30, 3.67, 1809, 78.09, 'Rural', 531, 1793, NULL),
(618, 744, 1156, 1712, 518, 2323, 'Sakiet_Eddaier', 'Féminin', 1, 7, 20, 21, 15, 11, 4, 2, 2, 28, 316, 4, 1, 39, 3, 64, 216, 5, 32, 70, 22, 0, 216, 527, 26.3, 'Rural', 531, 1793, NULL),
(619, 3820, 11174, 11274, 2452, 32724, 'Sfax', 'Masculin', 26, 84, 191, 321, 146, 47, 38, 25, 31, 342, 4996, 2980, 1507, 378, 250, 3758, 77, 31, 4046, 2447, 117, 407, 4.22, 20545, 65.55, 'Communal', 3348, 9620, NULL),
(620, 3820, 9925, 23634, 2452, 32059, 'Sfax', 'Féminin', 19, 38, 222, 483, 292, 128, 49, 28, 21, 250, 1634, 84, 47, 12, 105, 3523, 2326, 20, 698, 1089, 77, 54, 2326, 7160, 26.28, 'Communal', 3348, 9620, NULL),
(621, 3820, 7271, 3483, 2452, 13131, 'Sfax', 'Masculin', 16, 115, 172, 153, 77, 42, 18, 15, 34, 232, 2523, 2072, 762, 454, 175, 1054, 169, 40, 1319, 665, 251, 147, 6.59, 9012, 73.47, 'Rural', 3348, 9620, NULL),
(622, 3820, 5578, 8939, 2452, 12668, 'Sfax', 'Féminin', 3, 77, 119, 211, 109, 48, 21, 13, 15, 175, 1577, 26, 20, 68, 5, 610, 1117, 29, 232, 564, 169, 13, 1117, 3113, 29.44, 'Rural', 3348, 9620, NULL),
(623, 3306, 5524, 3501, 1289, 12574, 'Tina', 'Masculin', 7, 98, 215, 221, 103, 46, 15, 17, 40, 397, 2543, 1213, 627, 443, 324, 1270, 182, 29, 1292, 598, 213, 318, 8.4, 8311, 72.15, 'Communal', 3452, 8047, NULL),
(624, 3306, 4879, 8109, 1289, 12174, 'Tina', 'Féminin', 6, 66, 162, 230, 189, 86, 38, 21, 18, 324, 1720, 21, 26, 46, 16, 785, 2152, 43, 351, 269, 182, 28, 2152, 3252, 33.39, 'Communal', 3452, 8047, NULL),
(625, 3306, 5383, 3118, 1289, 11045, 'Tina', 'Masculin', 8, 101, 155, 181, 88, 34, 31, 21, 34, 299, 1800, 1810, 490, 415, 193, 835, 155, 37, 1076, 645, 227, 189, 8.31, 7268, 71.78, 'Rural', 3452, 8047, NULL),
(626, 3306, 4385, 7756, 1289, 10713, 'Tina', 'Féminin', 6, 76, 138, 173, 102, 54, 35, 17, 10, 193, 1047, 16, 18, 107, 5, 567, 2194, 43, 214, 358, 155, 16, 2194, 2349, 27.6, 'Rural', 3452, 8047, NULL),
(627, 2150, 1646, 1378, 4948, 4158, 'Agareb', 'Masculin', 3, 36, 125, 114, 41, 27, 9, 12, 8, 196, 754, 338, 132, 40, 110, 585, 40, 14, 247, 248, 82, 55, 13.6, 2402, 66.86, 'Communal', 1061, 8159, NULL),
(628, 2150, 1451, 3269, 4948, 4195, 'Agareb', 'Féminin', 1, 16, 61, 133, 83, 31, 12, 6, 5, 110, 148, 5, 3, 13, 1, 270, 268, 10, 63, 70, 40, 5, 268, 578, 22.07, 'Communal', 1061, 8159, NULL),
(629, 2150, 5640, 3711, 4948, 10843, 'Agareb', 'Masculin', 5, 171, 269, 224, 133, 89, 73, 79, 135, 425, 1818, 1339, 406, 564, 198, 644, 185, 123, 499, 515, 571, 138, 16.88, 5928, 65.78, 'Rural', 1061, 8159, NULL),
(630, 2150, 4405, 9196, 4948, 10964, 'Agareb', 'Féminin', 4, 96, 144, 169, 110, 62, 20, 9, 16, 198, 567, 21, 4, 66, 8, 228, 367, 65, 82, 164, 185, 4, 367, 1140, 16.13, 'Rural', 1061, 8159, NULL),
(631, 3825, 1076, 810, 4298, 2467, 'Djebeniana', 'Masculin', 0, 26, 45, 48, 25, 19, 15, 5, 15, 82, 135, 160, 77, 67, 75, 421, 70, 4, 368, 208, 74, 18, 12.25, 1454, 67.17, 'Communal', 3543, 11666, NULL),
(632, 3825, 980, 1882, 4298, 2838, 'Djebeniana', 'Féminin', 2, 17, 38, 81, 55, 28, 13, 7, 13, 75, 239, 6, 5, 13, 27, 293, 68, 17, 61, 76, 70, 5, 68, 700, 33.69, 'Communal', 3543, 11666, NULL),
(633, 3825, 7088, 5018, 4298, 15518, 'Djebeniana', 'Masculin', 3, 164, 275, 257, 201, 111, 65, 61, 87, 522, 745, 2576, 322, 2482, 312, 1084, 220, 76, 1220, 758, 438, 57, 11.93, 9247, 67.66, 'Rural', 3543, 11666, NULL),
(634, 3825, 5947, 12555, 4298, 15739, 'Djebeniana', 'Féminin', 2, 89, 178, 280, 180, 98, 44, 31, 27, 312, 439, 38, 3, 946, 9, 501, 303, 84, 153, 164, 220, 4, 303, 2250, 20.22, 'Rural', 3543, 11666, NULL),
(635, 3078, 5165, 3903, 2805, 11281, 'Amra', 'Masculin', 3, 117, 172, 189, 124, 90, 42, 47, 67, 337, 976, 1695, 399, 1233, 187, 790, 171, 76, 867, 490, 317, 59, 11.74, 6512, 65.39, 'Rural', 2650, 8533, NULL),
(636, 3078, 4117, 8769, 2805, 11139, 'Amra', 'Féminin', 2, 72, 119, 187, 131, 68, 27, 22, 21, 187, 654, 20, 12, 211, 2, 380, 485, 77, 174, 252, 171, 6, 485, 1711, 21.27, 'Rural', 2650, 8533, NULL),
(637, 1888, 1186, 891, 8241, 2661, 'Hencha', 'Masculin', 0, 19, 49, 29, 35, 14, 13, 9, 24, 94, 161, 305, 135, 94, 70, 454, 45, 7, 241, 165, 65, 17, 11.19, 1572, 66.52, 'Communal', 938, 11067, NULL),
(638, 1888, 1082, 2061, 8241, 2866, 'Hencha', 'Féminin', 1, 9, 45, 63, 47, 21, 6, 7, 8, 70, 176, 4, 1, 28, 1, 242, 160, 13, 75, 69, 45, 1, 160, 597, 28.05, 'Communal', 938, 11067, NULL),
(639, 1888, 7784, 5020, 8241, 15281, 'Hencha', 'Masculin', 11, 136, 193, 170, 90, 71, 36, 34, 58, 327, 1514, 2984, 438, 1804, 206, 740, 218, 80, 1265, 635, 311, 60, 7.89, 9451, 67.15, 'Rural', 938, 11067, NULL),
(640, 1888, 6060, 12778, 8241, 15395, 'Hencha', 'Féminin', 11, 122, 152, 164, 113, 67, 30, 35, 22, 206, 925, 35, 8, 360, 8, 260, 429, 105, 107, 194, 218, 6, 429, 1906, 17, 'Rural', 938, 11067, NULL),
(641, 1730, 385, 228, 6517, 796, 'Menzel_Chaker', 'Masculin', -1, 8, 12, 8, 4, 7, 3, 3, 1, 22, 56, 58, 21, 66, 20, 221, 21, 5, 42, 43, 16, 14, 8.45, 520, 71.48, 'Communal', 1069, 9316, NULL),
(642, 1730, 347, 584, 6517, 854, 'Menzel_Chaker', 'Féminin', 0, 4, 6, 16, 11, 14, 4, 3, 2, 20, 75, 0, 0, 1, 23, 100, 81, 3, 21, 11, 21, 1, 81, 209, 31.62, 'Communal', 1069, 9316, NULL),
(643, 1730, 6093, 4379, 6517, 12664, 'Menzel_Chaker', 'Masculin', 5, 111, 149, 141, 92, 63, 40, 44, 63, 257, 546, 2504, 309, 2214, 103, 648, 110, 138, 743, 518, 260, 69, 8.8, 7556, 65.43, 'Rural', 1069, 9316, NULL),
(644, 1730, 4480, 11513, 6517, 12994, 'Menzel_Chaker', 'Féminin', 7, 60, 80, 105, 64, 33, 38, 19, 18, 103, 299, 27, 5, 246, 7, 239, 330, 102, 63, 173, 110, 4, 330, 1063, 11.4, 'Rural', 1069, 9316, NULL),
(645, 565, 474, 380, 2399, 1200, 'Ghraiba', 'Masculin', 3, 16, 34, 39, 19, 14, 8, 5, 7, 72, 89, 244, 32, 27, 40, 123, 31, 4, 77, 74, 41, 7, 17.56, 676, 68.33, 'Communal', 180, 3144, NULL),
(646, 565, 480, 896, 2399, 1231, 'Ghraiba', 'Féminin', 0, 6, 28, 50, 33, 16, 10, 5, 4, 40, 68, 2, 2, 2, 2, 73, 95, 13, 14, 22, 31, 0, 95, 183, 27.21, 'Communal', 180, 3144, NULL),
(647, 565, 2283, 1983, 2399, 4860, 'Ghraiba', 'Masculin', 3, 56, 118, 143, 85, 52, 35, 48, 63, 231, 223, 859, 85, 452, 76, 331, 78, 42, 111, 171, 283, 25, 21.45, 2260, 59.21, 'Rural', 180, 3144, NULL),
(648, 565, 1753, 4206, 2399, 4779, 'Ghraiba', 'Féminin', 2, 27, 69, 76, 42, 20, 12, 5, 5, 76, 161, 15, 3, 22, 2, 63, 51, 20, 15, 33, 78, 0, 51, 314, 11.99, 'Rural', 180, 3144, NULL),
(649, 1118, 620, 580, 10443, 1739, 'BirAli_Ben_Kelifa', 'Masculin', 1, 13, 48, 51, 23, 4, 0, 5, 2, 83, 65, 169, 55, 22, 43, 407, 12, 4, 173, 109, 19, 11, 12.68, 1012, 66.65, 'Communal', 578, 12139, NULL),
(650, 1118, 545, 1331, 10443, 1805, 'BirAli_Ben_Kelifa', 'Féminin', 0, 4, 30, 58, 32, 21, 7, 3, 2, 43, 48, 2, 1, 5, 14, 185, 139, 9, 43, 32, 12, 0, 139, 316, 26.26, 'Communal', 578, 12139, NULL),
(651, 1118, 7554, 6828, 10443, 17439, 'BirAli_Ben_Kelifa', 'Masculin', 4, 247, 349, 347, 190, 127, 81, 58, 113, 526, 419, 3730, 384, 1770, 240, 734, 241, 308, 1315, 674, 510, 24, 14.67, 9054, 60.85, 'Rural', 578, 12139, NULL),
(652, 1118, 5877, 16805, 10443, 18625, 'BirAli_Ben_Kelifa', 'Féminin', 4, 131, 254, 270, 147, 62, 31, 14, 19, 240, 350, 44, 3, 115, 15, 215, 331, 169, 63, 94, 241, 0, 331, 888, 9.77, 'Rural', 578, 12139, NULL),
(653, 806, 1751, 1323, 3658, 4286, 'Skhira', 'Masculin', 1, 34, 172, 187, 108, 53, 34, 24, 34, 358, 569, 408, 197, 157, 162, 462, 73, 22, 216, 222, 159, 75, 22.14, 2307, 69.13, 'Communal', 360, 4824, NULL),
(654, 806, 1571, 3385, 3658, 4314, 'Skhira', 'Féminin', 2, 15, 113, 188, 104, 42, 7, 5, 6, 162, 53, 1, 4, 38, 10, 251, 393, 10, 46, 49, 73, 5, 393, 449, 21.53, 'Communal', 360, 4824, NULL),
(655, 806, 3805, 3249, 3658, 8485, 'Skhira', 'Masculin', 2, 114, 286, 286, 185, 121, 46, 39, 51, 482, 622, 1434, 146, 1035, 119, 352, 39, 107, 209, 251, 427, 42, 21.83, 4093, 61.71, 'Rural', 360, 4824, NULL),
(656, 806, 2579, 7802, 3658, 8387, 'Skhira', 'Féminin', 2, 19, 85, 128, 33, 11, 1, 5, 3, 119, 55, 14, 2, 94, 11, 79, 238, 18, 23, 29, 39, 1, 238, 299, 6.97, 'Rural', 360, 4824, NULL),
(657, 985, 2326, 2133, 4332, 5802, 'Mahres', 'Masculin', 1, 32, 89, 114, 46, 28, 18, 18, 23, 170, 477, 792, 175, 298, 174, 679, 75, 16, 381, 360, 105, 127, 10.33, 3290, 63.24, 'Communal', 480, 5797, NULL),
(658, 985, 2302, 4552, 4332, 6355, 'Mahres', 'Féminin', 0, 24, 98, 178, 76, 46, 20, 19, 15, 174, 374, 12, 9, 44, 12, 579, 574, 19, 111, 184, 75, 12, 574, 1325, 28.37, 'Communal', 480, 5797, NULL),
(659, 985, 3171, 2655, 4332, 6761, 'Mahres', 'Masculin', 3, 97, 174, 199, 117, 78, 64, 46, 106, 302, 305, 844, 163, 733, 150, 340, 141, 185, 275, 281, 357, 258, 22.02, 3202, 60.72, 'Rural', 480, 5797, NULL),
(660, 985, 2532, 5767, 4332, 7180, 'Mahres', 'Féminin', -1, 60, 135, 125, 71, 33, 21, 7, 8, 150, 370, 13, 1, 269, 1, 120, 155, 83, 65, 91, 141, 24, 155, 952, 19.68, 'Rural', 480, 5797, NULL),
(661, 2610, 2233, 2380, 2393, 6190, 'Kerkenah', 'Masculin', 1, 10, 57, 93, 34, 8, 4, 2, 2, 74, 138, 297, 205, 1809, 60, 553, 15, 0, 219, 230, 18, 146, 5.56, 3598, 61.55, 'Communal', 2767, 7770, NULL),
(662, 2610, 1995, 5173, 2393, 6219, 'Kerkenah', 'Féminin', 1, 8, 68, 122, 41, 13, 6, 5, 6, 60, 66, 3, 18, 18, 13, 440, 335, 7, 115, 105, 15, 9, 335, 775, 16.82, 'Communal', 2767, 7770, NULL),
(663, 44229, 63487, 20978, 172429, 60082, 'Centre_Ouest', 'Masculin', 142, 1809, 4405, 5664, 3509, 1797, 998, 635, 956, 9477, 9011, 17394, 5542, 3142, 6377, 35792, 3156, 1777, 17930, 7035, 4635, 1516, 13.61, 33782, 65.08, 'Communal', 17446, 234104, NULL),
(664, 44229, 55614, 38605, 172429, 72082, 'Centre_Ouest', 'Féminin', 103, 1106, 3691, 6394, 4136, 2073, 1131, 685, 708, 6377, 5547, 299, 293, 1034, 552, 22621, 13606, 2295, 3190, 2988, 3156, 345, 13606, 26465, 46.44, 'Communal', 17446, 234104, NULL),
(665, 44229, 144808, 187516, 172429, 530376, 'Centre_Ouest', 'Masculin', 256, 3316, 5019, 5064, 3447, 2273, 1464, 1142, 1746, 8054, 5999, 62006, 6683, 52957, 3964, 20973, 3627, 4621, 19910, 4392, 8441, 1419, 11.3, 304102, 64.64, 'Rural', 17446, 234104, NULL),
(666, 44229, 103573, 101354, 172429, 129363, 'Centre_Ouest', 'Féminin', 154, 1849, 3504, 4338, 2424, 1299, 707, 484, 467, 3964, 5562, 1021, 100, 25425, 240, 6157, 6692, 3258, 1508, 1211, 3627, 191, 6692, 21974, 21.65, 'Rural', 17446, 234104, NULL),
(667, 22023, 26100, 25057, 65736, 72272, 'Kairouan', 'Masculin', 18, 664, 1567, 1869, 1104, 596, 343, 202, 319, 3117, 4459, 6666, 2708, 1255, 2039, 12419, 1035, 588, 8759, 3418, 1755, 706, 14.42, 40408, 65.33, 'Communal', 8333, 96092, NULL),
(668, 22023, 23173, 54421, 65736, 76717, 'Kairouan', 'Féminin', 32, 385, 1259, 2219, 1307, 609, 343, 193, 191, 2039, 3192, 72, 123, 435, 237, 8720, 5856, 698, 1588, 1435, 1035, 131, 5856, 15728, 29.06, 'Communal', 8333, 96092, NULL),
(669, 22023, 58191, 49842, 65736, 126759, 'Kairouan', 'Masculin', 56, 1389, 1781, 1718, 1191, 915, 633, 485, 747, 2572, 2564, 23335, 2435, 22569, 1292, 5799, 1633, 2063, 8446, 1890, 3906, 659, 11.91, 67753, 60.68, 'Rural', 8333, 96092, NULL),
(670, 22023, 40557, 118303, 65736, 138346, 'Kairouan', 'Féminin', 33, 778, 1285, 1340, 791, 501, 334, 225, 276, 1292, 2297, 235, 26, 9162, 74, 1702, 2470, 1599, 530, 337, 1633, 31, 2470, 14353, 14.49, 'Rural', 8333, 96092, NULL),
(671, 1069, 10552, 10039, 1672, 30041, 'Kairouan', 'Masculin', 6, 268, 700, 813, 459, 235, 139, 86, 119, 1399, 2196, 3068, 1320, 319, 905, 4406, 368, 232, 4065, 1445, 662, 301, 14.38, 17126, 66.58, 'Communal', 992, 3733, NULL),
(672, 1069, 9309, 21805, 1672, 31309, 'Kairouan', 'Féminin', 11, 150, 564, 942, 582, 257, 130, 71, 63, 905, 1703, 33, 50, 116, 141, 3390, 2464, 275, 722, 649, 368, 57, 2464, 6731, 30.36, 'Communal', 992, 3733, NULL),
(673, 1069, 2310, 1500, 1672, 5006, 'Kairouan', 'Masculin', 13, 36, 65, 44, 24, 23, 14, 11, 9, 78, 371, 1001, 253, 791, 58, 339, 71, 53, 350, 117, 90, 38, 6.65, 3273, 70.04, 'Rural', 992, 3733, NULL),
(674, 1069, 1714, 4145, 1672, 5505, 'Kairouan', 'Féminin', 0, 29, 62, 58, 37, 26, 6, 6, 2, 58, 541, 7, 6, 391, 28, 86, 287, 44, 70, 30, 71, 2, 287, 1133, 24.7, 'Rural', 992, 3733, NULL),
(675, 1591, 7249, 7249, 6883, 20635, 'Kairouan', 'Masculin', 5, 151, 394, 557, 331, 166, 98, 39, 76, 841, 1383, 1809, 878, 185, 590, 3552, 271, 109, 2490, 1052, 465, 194, 13.73, 11548, 64.87, 'Communal', 250, 8724, NULL),
(676, 1591, 6549, 15130, 6883, 21844, 'Kairouan', 'Féminin', 14, 83, 326, 702, 382, 174, 79, 43, 36, 590, 1025, 20, 41, 51, 29, 2767, 2370, 132, 458, 459, 271, 44, 2370, 4879, 30.74, 'Communal', 250, 8724, NULL),
(677, 1591, 6054, 3892, 6883, 12521, 'Kairouan', 'Masculin', 4, 180, 213, 196, 96, 89, 49, 42, 44, 227, 269, 2601, 251, 3017, 117, 478, 195, 203, 799, 248, 457, 27, 10.84, 7694, 68.92, 'Rural', 250, 8724, NULL),
(678, 1591, 4211, 10439, 6883, 13193, 'Kairouan', 'Féminin', 3, 104, 139, 146, 97, 59, 20, 5, 11, 117, 277, 15, 1, 1618, 4, 146, 186, 163, 62, 34, 195, 4, 186, 2160, 20.87, 'Rural', 250, 8724, NULL),
(679, 2725, 438, 345, 4260, 1025, 'Echebika', 'Masculin', 0, 13, 34, 14, 9, 3, 2, 3, 3, 47, 126, 73, 13, 81, 20, 183, 7, 6, 63, 51, 24, 7, 12.21, 597, 66.34, 'Communal', 1764, 8749, NULL),
(680, 2725, 371, 750, 4260, 1039, 'Echebika', 'Féminin', 0, 3, 17, 19, 17, 1, 4, 0, 1, 20, 37, 1, 0, 50, 4, 113, 69, 0, 13, 12, 7, 1, 69, 227, 27.88, 'Communal', 1764, 8749, NULL),
(681, 2725, 5538, 3734, 4260, 11896, 'Echebika', 'Masculin', 5, 128, 173, 180, 120, 86, 52, 38, 61, 282, 501, 1584, 220, 3427, 138, 678, 118, 135, 488, 231, 357, 168, 10.54, 7302, 68.61, 'Rural', 1764, 8749, NULL),
(682, 2725, 3521, 9600, 4260, 11851, 'Echebika', 'Féminin', 3, 57, 113, 152, 68, 39, 32, 17, 23, 138, 118, 13, 4, 1315, 4, 164, 323, 103, 96, 28, 118, 3, 323, 1744, 18.99, 'Rural', 1764, 8749, NULL),
(683, 3309, 1063, 935, 10499, 2858, 'Sbikha', 'Masculin', 0, 31, 65, 84, 55, 32, 14, 10, 27, 119, 103, 232, 73, 81, 57, 656, 60, 52, 277, 124, 114, 45, 17.26, 1591, 67.28, 'Communal', 1879, 15687, NULL),
(684, 3309, 891, 2175, 10499, 3099, 'Sbikha', 'Féminin', 0, 17, 56, 96, 54, 23, 27, 14, 13, 57, 115, 2, 5, 39, 11, 345, 120, 63, 72, 38, 60, 5, 120, 621, 29.82, 'Communal', 1879, 15687, NULL),
(685, 3309, 11095, 7924, 10499, 22077, 'Sbikha', 'Masculin', 10, 235, 304, 339, 231, 188, 113, 88, 121, 457, 370, 3734, 477, 5201, 261, 838, 349, 356, 1439, 329, 733, 92, 11.75, 12490, 64.11, 'Rural', 1879, 15687, NULL),
(686, 3309, 7072, 19023, 10499, 24376, 'Sbikha', 'Féminin', 9, 163, 260, 231, 165, 97, 61, 61, 55, 261, 687, 45, 6, 3127, 3, 206, 467, 321, 93, 52, 349, 5, 467, 4230, 21.96, 'Rural', 1879, 15687, NULL),
(687, 808, 1464, 1422, 5712, 3661, 'Ouslatia', 'Masculin', 0, 36, 88, 81, 60, 32, 26, 23, 27, 147, 87, 430, 70, 163, 91, 656, 49, 59, 282, 118, 126, 51, 17.06, 1857, 61.16, 'Communal', 228, 6748, NULL),
(688, 808, 1238, 3350, 5712, 4176, 'Ouslatia', 'Féminin', 2, 33, 72, 85, 50, 28, 17, 7, 6, 91, 67, 2, 2, 21, 8, 334, 170, 51, 44, 43, 49, 5, 170, 520, 19.76, 'Communal', 228, 6748, NULL),
(689, 808, 3747, 3376, 5712, 8420, 'Ouslatia', 'Masculin', 5, 121, 134, 100, 79, 66, 47, 34, 49, 176, 216, 1612, 155, 1749, 72, 329, 87, 183, 213, 65, 262, 42, 13.05, 4386, 59.9, 'Rural', 228, 6748, NULL),
(690, 808, 2555, 7922, 5712, 8743, 'Ouslatia', 'Féminin', 3, 56, 77, 62, 37, 33, 23, 10, 17, 72, 106, 16, 0, 274, 4, 71, 102, 115, 11, 18, 87, 3, 102, 502, 9.39, 'Rural', 228, 6748, NULL),
(691, 1404, 996, 1088, 5940, 2933, 'Haffouz', 'Masculin', 0, 35, 60, 70, 47, 25, 15, 4, 21, 125, 139, 201, 72, 53, 105, 687, 34, 26, 240, 139, 70, 28, 15.5, 1559, 62.9, 'Communal', 842, 8186, NULL),
(692, 1404, 966, 2275, 5940, 3203, 'Haffouz', 'Féminin', 2, 23, 64, 94, 42, 42, 18, 9, 17, 105, 41, 2, 9, 7, 11, 437, 214, 54, 51, 54, 34, 8, 214, 611, 29, 'Communal', 842, 8186, NULL),
(693, 1404, 4720, 4204, 5940, 11037, 'Haffouz', 'Masculin', 5, 91, 131, 118, 74, 49, 39, 17, 48, 201, 207, 2527, 171, 1647, 109, 529, 109, 115, 896, 124, 212, 138, 8.62, 6244, 61.9, 'Rural', 842, 8186, NULL),
(694, 1404, 3244, 10740, 5940, 11993, 'Haffouz', 'Féminin', 2, 60, 108, 106, 69, 31, 21, 13, 9, 109, 76, 26, 0, 515, 7, 157, 168, 93, 20, 24, 109, 2, 168, 822, 10.45, 'Rural', 842, 8186, NULL),
(695, 1686, 419, 375, 4333, 1102, 'El_Alaa', 'Masculin', 1, 9, 10, 14, 8, 15, 6, 2, 2, 29, 39, 39, 34, 10, 15, 305, 13, 5, 171, 57, 25, 4, 9.22, 660, 65.97, 'Communal', 420, 6439, NULL),
(696, 1686, 404, 909, 4333, 1265, 'El_Alaa', 'Féminin', 1, 3, 11, 25, 10, 7, 4, 3, 4, 15, 23, 1, 1, 2, 3, 204, 64, 12, 16, 35, 13, 1, 64, 284, 28.06, 'Communal', 420, 6439, NULL),
(697, 1686, 3720, 4023, 4333, 8112, 'El_Alaa', 'Masculin', 1, 39, 44, 56, 45, 36, 21, 19, 34, 82, 91, 1483, 148, 336, 57, 498, 64, 63, 1057, 129, 132, 41, 7.46, 3784, 50.41, 'Rural', 420, 6439, NULL),
(698, 1686, 2965, 9183, 4333, 9944, 'El_Alaa', 'Féminin', 4, 35, 49, 70, 43, 22, 16, 7, 8, 57, 158, 28, 0, 41, 3, 190, 197, 50, 46, 35, 64, 4, 197, 506, 7.64, 'Rural', 420, 6439, NULL),
(699, 773, 1490, 1285, 4440, 3688, 'El_Alaa', 'Masculin', 1, 38, 55, 86, 37, 19, 8, 14, 12, 116, 212, 272, 93, 199, 90, 702, 60, 24, 443, 167, 78, 40, 11.4, 2129, 65.16, 'Communal', 419, 5632, NULL),
(700, 773, 1359, 2961, 4440, 4019, 'Hajeb_Ayoun', 'Féminin', 1, 22, 44, 81, 44, 24, 22, 12, 11, 90, 91, 4, 9, 98, 5, 390, 197, 26, 125, 76, 60, 4, 197, 798, 26.32, 'Communal', 419, 5632, NULL),
(701, 773, 3795, 3660, 4440, 8666, 'Hajeb_Ayoun', 'Masculin', 1, 110, 138, 134, 75, 72, 64, 55, 67, 201, 79, 1677, 142, 1484, 110, 369, 121, 194, 386, 78, 308, 37, 15.04, 4253, 57.77, 'Rural', 419, 5632, NULL),
(702, 773, 2617, 8588, 4440, 9520, 'Hajeb_Ayoun', 'Féminin', 2, 69, 87, 96, 46, 38, 27, 26, 26, 110, 50, 13, 4, 277, 7, 120, 116, 123, 15, 22, 121, 4, 116, 507, 9.79, 'Rural', 419, 5632, NULL),
(703, 1556, 1229, 1216, 5335, 3145, 'Nasrallah', 'Masculin', 0, 46, 71, 85, 57, 48, 19, 12, 22, 152, 74, 320, 97, 116, 91, 649, 101, 41, 180, 97, 122, 20, 19.49, 1553, 61.37, 'Communal', 670, 7561, NULL),
(704, 1556, 1046, 2617, 5335, 3497, 'Nasrallah', 'Féminin', 1, 27, 57, 94, 77, 31, 24, 25, 30, 91, 40, 5, 3, 41, 10, 358, 101, 63, 24, 28, 101, 3, 101, 503, 25.16, 'Communal', 670, 7561, NULL),
(705, 1556, 3826, 3689, 5335, 8274, 'Nasrallah', 'Masculin', 1, 82, 138, 139, 108, 71, 56, 42, 90, 215, 70, 1543, 172, 1107, 111, 547, 148, 115, 299, 75, 340, 26, 16.25, 3840, 55.41, 'Rural', 670, 7561, NULL),
(706, 1556, 3055, 8746, 5335, 9898, 'Nasrallah', 'Féminin', 0, 57, 112, 109, 64, 44, 25, 17, 31, 111, 54, 14, 1, 420, 4, 150, 179, 99, 25, 15, 148, 1, 179, 680, 11.64, 'Rural', 670, 7561, NULL),
(707, 2345, 260, 127, 5465, 533, 'Echrarda', 'Masculin', 1, 18, 18, 6, 10, 4, 4, 4, 5, 31, 21, 55, 9, 15, 18, 129, 40, 3, 82, 18, 34, 3, 17.98, 333, 76.17, 'Communal', 253, 8063, NULL),
(708, 2345, 259, 413, 5465, 601, 'Echrarda', 'Féminin', 0, 14, 11, 13, 4, 8, 7, 5, 7, 18, 7, 0, 0, 6, 5, 85, 26, 6, 12, 6, 40, 1, 26, 117, 31.28, 'Communal', 253, 8063, NULL),
(709, 2345, 4138, 3485, 5465, 8425, 'Echrarda', 'Masculin', 4, 99, 86, 91, 91, 64, 46, 54, 82, 192, 134, 1969, 149, 646, 88, 467, 121, 100, 790, 115, 306, 23, 13.02, 4297, 58.64, 'Rural', 253, 8063, NULL),
(710, 2345, 3401, 8917, 5465, 9803, 'Echrarda', 'Féminin', 2, 34, 82, 100, 52, 31, 23, 19, 20, 88, 62, 11, 1, 132, 5, 241, 199, 70, 37, 28, 121, 3, 199, 517, 9.05, 'Rural', 253, 8063, NULL),
(711, 4757, 940, 976, 11197, 2651, 'Bouhajla', 'Masculin', 2, 19, 71, 59, 31, 17, 12, 5, 5, 109, 79, 167, 49, 33, 57, 494, 33, 31, 468, 150, 34, 13, 13.13, 1455, 63.18, 'Communal', 616, 16570, NULL),
(712, 4757, 781, 2036, 11197, 2665, 'Bouhajla', 'Féminin', 0, 10, 36, 66, 44, 14, 11, 4, 3, 57, 42, 2, 3, 4, 10, 299, 61, 16, 50, 35, 33, 2, 61, 437, 23.6, 'Communal', 616, 16570, NULL),
(713, 4757, 9248, 10355, 11197, 22325, 'Bouhajla', 'Masculin', 6, 268, 355, 321, 248, 171, 132, 85, 142, 461, 256, 3605, 297, 3164, 171, 727, 250, 546, 1729, 379, 709, 27, 14.87, 10190, 53.61, 'Rural', 616, 16570, NULL),
(714, 4757, 6202, 21000, 11197, 23520, 'Bouhajla', 'Féminin', 4, 113, 195, 208, 112, 81, 80, 44, 74, 171, 168, 47, 3, 1053, 5, 171, 246, 418, 55, 51, 250, 0, 246, 1552, 10.71, 'Rural', 616, 16570, NULL),
(715, 9228, 23244, 25586, 45321, 69108, 'Kasserine', 'Masculin', 76, 787, 1944, 2422, 1580, 791, 442, 301, 435, 4306, 2827, 7098, 1741, 989, 2795, 13958, 1386, 915, 5322, 2176, 1890, 477, 20.35, 34664, 62.98, 'Communal', 4079, 58628, NULL),
(716, 9228, 20127, 51977, 45321, 72010, 'Kasserine', 'Féminin', 40, 502, 1605, 2564, 1674, 881, 480, 292, 302, 2795, 1343, 145, 100, 223, 185, 8008, 3822, 1053, 860, 876, 1386, 76, 3822, 11671, 27.82, 'Communal', 4079, 58628, NULL),
(717, 9228, 37450, 35315, 45321, 86583, 'Kasserine', 'Masculin', 73, 1027, 1616, 1541, 981, 589, 348, 325, 446, 2467, 1228, 17622, 1808, 11941, 1117, 6499, 928, 1473, 3931, 914, 2179, 213, 13.73, 44229, 59.21, 'Rural', 4079, 58628, NULL),
(718, 9228, 27505, 78487, 45321, 90361, 'Kasserine', 'Féminin', 52, 595, 990, 1210, 619, 308, 144, 95, 59, 1117, 1268, 311, 29, 3627, 110, 1829, 1768, 841, 364, 324, 928, 18, 1768, 7822, 13.14, 'Rural', 4079, 58628, NULL),
(719, 292, 7438, 8378, 280, 23177, 'Kasserine', 'Masculin', 32, 263, 711, 917, 643, 280, 154, 90, 144, 1734, 1113, 2227, 723, 158, 1113, 4983, 532, 213, 1418, 687, 685, 200, 22.02, 11541, 63.85, 'Communal', 176, 748, NULL);
INSERT INTO `unemployedpopulation` (`population_id`, `between_1km_2km`, `distribution_of_population`, `inactive_population`, `plus2km`, `population_aged_15_and_plus`, `regions`, `sexe`, `unemployed_15_19_years_age`, `unemployed_20_24_years_age`, `unemployed_25_29_years_age`, `unemployed_30_34_years_age`, `unemployed_35_39_years_age`, `unemployed_40_44_years_age`, `unemployed_45_49_years_age`, `unemployed_50_59_years_age`, `unemployed_60plus_years`, `unemployed_agriculture_fishing`, `unemployed_building_public_works`, `unemployed_commerce`, `unemployed_education_health_administrative_services`, `unemployed_mines_energy`, `unemployed_néant`, `unemployed_other_services`, `unemployed_primary`, `unemployed_secondary`, `unemployed_transport`, `unemployed_undeclared`, `unemployed_faculty`, `unemployed_manufacturing_industry`, `unemployment_rate`, `active_population_occupied`, `activity_rate`, `environment`, `less_than_1km`, `number_houses`, `unemployed_neant`) VALUES
(720, 292, 6614, 16116, 280, 23781, 'Kasserine', 'Féminin', 11, 177, 578, 897, 641, 361, 189, 111, 119, 1113, 636, 37, 58, 27, 95, 3112, 1777, 350, 334, 325, 532, 26, 1777, 4566, 32.23, 'Communal', 176, 748, NULL),
(721, 292, 527, 347, 280, 1075, 'Kasserine', 'Masculin', 3, 13, 24, 22, 18, 14, 3, 2, 4, 63, 93, 116, 47, 56, 44, 231, 26, 4, 51, 22, 29, 7, 14.01, 626, 67.63, 'Rural', 176, 748, NULL),
(722, 292, 407, 805, 280, 1080, 'Kasserine', 'Féminin', 4, 9, 25, 24, 16, 13, 3, 2, 2, 44, 54, 1, 3, 1, 22, 94, 37, 5, 10, 12, 26, 0, 37, 179, 25.46, 'Rural', 176, 748, NULL),
(723, 1372, 3420, 3193, 3188, 7780, 'Kasserine', 'Masculin', 5, 79, 149, 172, 101, 60, 28, 26, 35, 259, 225, 1330, 164, 631, 105, 1042, 79, 111, 336, 155, 200, 37, 14.43, 3925, 58.96, 'Rural', 779, 5339, NULL),
(724, 1372, 2596, 6648, 3188, 7785, 'Kasserine', 'Féminin', 10, 38, 66, 130, 68, 36, 20, 10, 5, 105, 184, 35, 5, 68, 24, 370, 498, 39, 42, 44, 79, 5, 498, 763, 14.62, 'Rural', 779, 5339, NULL),
(727, 300, 2235, 2568, 3645, 6313, 'Ezzouhour', 'Masculin', 16, 47, 100, 71, 35, 26, 12, 6, 8, 70, 27, 501, 168, 1892, 22, 410, 21, 128, 376, 41, 92, 5, 8.25, 3436, 59.32, 'Rural', 343, 4288, NULL),
(728, 300, 1550, 4765, 3645, 6241, 'Ezzouhour', 'Féminin', 6, 26, 40, 42, 20, 16, 7, 8, 5, 22, 28, 16, 4, 1088, 13, 123, 70, 102, 23, 19, 21, 0, 70, 1307, 23.65, 'Rural', 343, 4288, NULL),
(729, 2636, 2956, 2851, 10112, 8433, 'Sbeitla', 'Masculin', 12, 106, 245, 243, 140, 91, 40, 21, 40, 483, 253, 686, 197, 95, 390, 1996, 208, 53, 959, 389, 225, 54, 16.86, 4641, 66.19, 'Communal', 881, 13629, NULL),
(730, 2636, 2656, 5981, 10112, 8946, 'Sbeitla', 'Féminin', 9, 84, 235, 324, 212, 119, 74, 59, 51, 390, 153, 17, 8, 50, 30, 1243, 439, 174, 156, 156, 208, 8, 439, 1800, 33.14, 'Communal', 881, 13629, NULL),
(731, 2636, 8699, 6863, 10112, 17916, 'Sbeitla', 'Masculin', 10, 276, 342, 301, 204, 120, 98, 63, 126, 535, 297, 4544, 454, 1764, 290, 1177, 273, 279, 1034, 159, 554, 46, 14.19, 9485, 61.7, 'Rural', 881, 13629, NULL),
(732, 2636, 6367, 16032, 10112, 18612, 'Sbeitla', 'Féminin', 16, 170, 246, 257, 144, 66, 38, 16, 13, 290, 357, 66, 7, 665, 10, 374, 317, 169, 75, 62, 273, 0, 317, 1622, 13.86, 'Rural', 881, 13629, NULL),
(733, 1676, 743, 857, 5001, 2287, 'Sbiba', 'Masculin', 3, 18, 32, 44, 29, 14, 7, 3, 7, 62, 61, 173, 36, 142, 28, 497, 6, 20, 277, 77, 22, 7, 10.98, 1273, 62.51, 'Communal', 295, 6972, NULL),
(734, 1676, 652, 1851, 5001, 2356, 'Sbiba', 'Féminin', 1, 6, 32, 55, 34, 9, 2, 0, 3, 28, 23, 0, 1, 11, 7, 277, 134, 8, 31, 20, 6, 1, 134, 365, 21.48, 'Communal', 295, 6972, NULL),
(735, 1676, 5519, 4533, 5001, 11389, 'Sbiba', 'Masculin', 10, 121, 158, 142, 86, 72, 34, 29, 39, 234, 77, 2196, 195, 2476, 116, 447, 90, 146, 601, 131, 231, 22, 10.22, 6155, 60.2, 'Rural', 295, 6972, NULL),
(736, 1676, 4369, 11775, 5001, 12817, 'Sbiba', 'Féminin', 4, 67, 104, 105, 46, 22, 10, 10, 4, 116, 91, 36, 4, 366, 8, 135, 137, 48, 28, 8, 90, 0, 137, 672, 8.13, 'Rural', 295, 6972, NULL),
(737, 356, 552, 571, 1360, 1428, 'Djedeliane', 'Masculin', 0, 13, 36, 48, 26, 13, 9, 6, 9, 73, 8, 151, 24, 46, 39, 394, 19, 12, 33, 29, 39, 10, 18.9, 695, 60.01, 'Communal', 32, 1748, NULL),
(738, 356, 516, 1230, 1360, 1611, 'Djedeliane', 'Féminin', 0, 5, 28, 51, 19, 12, 9, 2, 1, 39, 7, 1, 2, 5, 4, 220, 92, 9, 12, 6, 19, 0, 92, 253, 23.65, 'Communal', 32, 1748, NULL),
(739, 356, 1216, 1057, 1360, 2734, 'Djedeliane', 'Masculin', 0, 18, 38, 41, 23, 6, 0, 0, 2, 56, 43, 578, 46, 628, 16, 157, 13, 9, 86, 7, 34, 2, 7.75, 1547, 61.36, 'Rural', 32, 1748, NULL),
(740, 356, 844, 2834, 1360, 3011, 'Djedeliane', 'Féminin', 1, 9, 16, 27, 11, 1, 1, 0, 1, 16, 8, 3, 0, 45, 2, 47, 42, 5, 6, 1, 13, 0, 42, 111, 5.88, 'Rural', 32, 1748, NULL),
(741, 398, 2430, 2923, 3263, 6766, 'Ayoun', 'Masculin', 11, 113, 137, 180, 101, 62, 30, 36, 55, 218, 58, 1715, 75, 434, 96, 618, 90, 180, 125, 59, 241, 10, 19.2, 3105, 56.8, 'Rural', 419, 4080, NULL),
(742, 398, 1683, 5976, 3263, 6961, 'Ayoun', 'Féminin', 2, 73, 93, 128, 52, 24, 11, 6, 4, 96, 146, 37, 2, 126, 6, 224, 108, 119, 12, 42, 90, 1, 108, 592, 14.15, 'Rural', 419, 4080, NULL),
(743, 932, 2243, 2772, 3366, 6716, 'Thala', 'Masculin', 8, 41, 158, 275, 169, 86, 45, 27, 35, 392, 314, 636, 115, 94, 262, 1085, 137, 69, 546, 262, 145, 35, 21.53, 3095, 58.73, 'Communal', 232, 4530, NULL),
(744, 932, 2025, 5318, 3366, 6955, 'Thala', 'Féminin', 4, 29, 147, 265, 184, 104, 53, 18, 26, 262, 88, 14, 6, 4, 16, 543, 132, 85, 52, 90, 137, 5, 132, 806, 23.54, 'Communal', 232, 4530, NULL),
(745, 932, 2889, 3557, 3366, 7012, 'Thala', 'Masculin', 3, 59, 158, 132, 104, 60, 49, 55, 50, 234, 146, 1335, 75, 412, 114, 482, 70, 149, 218, 63, 222, 21, 20.26, 2755, 49.29, 'Rural', 232, 4530, NULL),
(746, 932, 2009, 6384, 3366, 7041, 'Thala', 'Féminin', 2, 43, 92, 108, 51, 22, 10, 7, 6, 114, 97, 31, 2, 27, 6, 107, 79, 53, 13, 35, 70, 1, 79, 315, 9.33, 'Rural', 232, 4530, NULL),
(747, 54, 482, 526, 1884, 1300, 'Hidra', 'Masculin', 1, 14, 31, 32, 16, 12, 9, 8, 11, 66, 12, 112, 25, 21, 36, 359, 20, 24, 59, 42, 28, 3, 18.09, 634, 59.54, 'Communal', 7, 1945, NULL),
(748, 54, 357, 1121, 1884, 1396, 'Hidra', 'Féminin', 0, 2, 17, 48, 14, 8, 8, 10, 10, 36, 5, 1, 1, 1, 5, 127, 59, 30, 11, 9, 20, 1, 59, 156, 19.7, 'Communal', 7, 1945, NULL),
(749, 54, 887, 1053, 1884, 2273, 'Hidra', 'Masculin', 0, 19, 41, 45, 33, 27, 15, 16, 14, 59, 9, 276, 20, 430, 17, 188, 13, 78, 58, 25, 47, 3, 17.3, 1009, 53.67, 'Rural', 7, 1945, NULL),
(750, 54, 617, 2288, 1884, 2502, 'Hidra', 'Féminin', 1, 6, 15, 34, 12, 5, 3, 1, 1, 17, 13, 2, 0, 66, 1, 29, 104, 9, 8, 16, 13, 1, 104, 136, 8.55, 'Rural', 7, 1945, NULL),
(751, 942, 1024, 873, 6494, 2617, 'Foussana', 'Masculin', 2, 43, 57, 69, 30, 19, 6, 9, 12, 111, 68, 463, 32, 92, 92, 504, 72, 20, 246, 82, 66, 8, 14.16, 1497, 66.68, 'Communal', 741, 8177, NULL),
(752, 942, 933, 2224, 6494, 2942, 'Foussana', 'Féminin', 2, 28, 86, 100, 51, 29, 13, 11, 5, 92, 72, 14, 0, 10, 8, 223, 116, 37, 42, 32, 72, 0, 116, 395, 24.44, 'Communal', 741, 8177, NULL),
(753, 942, 5515, 4583, 6494, 11989, 'Foussana', 'Masculin', 7, 126, 229, 190, 118, 58, 44, 43, 54, 371, 168, 2557, 282, 1532, 133, 1093, 89, 170, 677, 185, 251, 23, 11.91, 6524, 61.76, 'Rural', 741, 8177, NULL),
(754, 942, 4059, 10832, 6494, 12694, 'Foussana', 'Féminin', 6, 56, 109, 161, 73, 50, 18, 14, 12, 133, 252, 44, 2, 675, 12, 241, 233, 121, 85, 56, 89, 6, 233, 1367, 14.67, 'Rural', 741, 8177, NULL),
(755, 104, 4500, 4900, 3351, 12917, 'Feriana', 'Masculin', 11, 163, 352, 416, 233, 141, 89, 63, 77, 697, 647, 1776, 291, 235, 356, 1924, 176, 218, 1150, 329, 362, 87, 19.55, 6450, 62.07, 'Communal', 15, 3470, NULL),
(756, 104, 3600, 10910, 3351, 13442, 'Feriana', 'Féminin', 5, 86, 217, 366, 243, 102, 60, 25, 34, 356, 223, 30, 8, 41, 11, 849, 422, 131, 121, 105, 176, 7, 422, 1389, 18.84, 'Communal', 15, 3470, NULL),
(757, 104, 2259, 1946, 3351, 5285, 'Feriana', 'Masculin', 4, 82, 95, 83, 52, 31, 16, 15, 22, 138, 40, 1373, 167, 863, 41, 272, 74, 67, 177, 29, 154, 11, 12.07, 2936, 63.18, 'Rural', 15, 3470, NULL),
(758, 104, 1422, 4750, 3351, 5121, 'Feriana', 'Féminin', 1, 42, 50, 56, 33, 10, 4, 5, 1, 41, 16, 19, 0, 74, 4, 32, 70, 50, 13, 10, 74, 3, 70, 168, 7.24, 'Rural', 15, 3470, NULL),
(759, 166, 730, 816, 3376, 2369, 'Feriana', 'Masculin', 1, 10, 48, 73, 42, 25, 5, 4, 4, 100, 64, 297, 58, 53, 71, 585, 21, 13, 183, 87, 22, 12, 13.72, 1340, 65.56, 'Communal', 160, 3702, NULL),
(760, 166, 601, 1611, 3376, 2336, 'Feriana', 'Féminin', 1, 5, 52, 137, 72, 25, 9, 7, 10, 71, 7, 6, 2, 51, 3, 294, 203, 16, 24, 19, 21, 1, 203, 405, 31.04, 'Communal', 160, 3702, NULL),
(761, 166, 1854, 2692, 3376, 6051, 'Feriana', 'Masculin', 2, 73, 144, 161, 105, 53, 19, 34, 37, 230, 45, 1102, 115, 824, 122, 382, 90, 152, 192, 38, 124, 26, 18.84, 2726, 55.49, 'Rural', 160, 3702, NULL),
(762, 166, 1582, 5398, 3376, 6496, 'Feriana', 'Féminin', 1, 56, 133, 137, 93, 43, 19, 16, 5, 122, 21, 21, 0, 426, 2, 52, 73, 122, 49, 19, 90, 1, 73, 590, 16.9, 'Rural', 160, 3702, NULL),
(763, 12978, 14143, 15289, 61372, 42226, 'SidiBouzid', 'Masculin', 48, 358, 894, 1373, 825, 410, 213, 132, 202, 2054, 1725, 3630, 1093, 898, 1543, 9415, 735, 274, 3849, 1441, 990, 333, 16.72, 22432, 63.8, 'Communal', 5034, 79384, NULL),
(764, 12978, 12314, 29059, 61372, 43258, 'SidiBouzid', 'Féminin', 31, 219, 827, 1611, 1155, 583, 308, 200, 215, 1543, 1012, 82, 70, 376, 130, 5893, 3928, 544, 742, 677, 735, 138, 3928, 9021, 32.82, 'Communal', 5034, 79384, NULL),
(765, 12978, 49167, 44714, 61372, 115284, 'SidiBouzid', 'Masculin', 127, 900, 1622, 1805, 1275, 769, 483, 332, 553, 3015, 2207, 21049, 2440, 18447, 1555, 8675, 1066, 1085, 7533, 1588, 2356, 547, 11.28, 62613, 61.21, 'Rural', 5034, 79384, NULL),
(766, 12978, 35511, 94438, 61372, 119165, 'SidiBouzid', 'Féminin', 69, 476, 1229, 1788, 1014, 490, 229, 164, 132, 1555, 1997, 475, 45, 12636, 56, 2626, 2454, 818, 614, 550, 1066, 142, 2454, 19154, 20.75, 'Rural', 5034, 79384, NULL),
(767, 2175, 4902, 5490, 4126, 15582, 'SidiBouzid', 'Masculin', 23, 120, 322, 503, 303, 126, 82, 43, 58, 762, 754, 1075, 399, 235, 641, 3586, 246, 52, 1703, 591, 334, 156, 15.56, 8522, 64.76, 'Communal', 1029, 7330, NULL),
(768, 2175, 4296, 9758, 4126, 15665, 'SidiBouzid', 'Féminin', 7, 80, 307, 616, 419, 211, 119, 59, 47, 641, 606, 34, 37, 56, 54, 2649, 1610, 120, 298, 306, 246, 47, 1610, 4040, 37.71, 'Communal', 1029, 7330, NULL),
(769, 2175, 4876, 3430, 4126, 11726, 'SidiBouzid', 'Masculin', 8, 86, 175, 206, 119, 55, 35, 22, 22, 316, 246, 937, 189, 4406, 163, 914, 117, 61, 644, 172, 217, 47, 8.84, 7563, 70.74, 'Rural', 1029, 7330, NULL),
(770, 2175, 3520, 7295, 4126, 11840, 'SidiBouzid', 'Féminin', 4, 51, 130, 170, 90, 53, 16, 14, 16, 163, 285, 24, 2, 3274, 12, 297, 190, 62, 63, 45, 117, 5, 190, 3999, 38.39, 'Rural', 1029, 7330, NULL),
(771, 2456, 767, 675, 8084, 2176, 'SidiBouzid', 'Masculin', 0, 21, 47, 79, 46, 15, 11, 10, 8, 125, 97, 231, 51, 42, 124, 548, 51, 13, 208, 67, 57, 16, 16.06, 1260, 69.01, 'Communal', 601, 11141, NULL),
(772, 2456, 683, 1275, 8084, 2215, 'SidiBouzid', 'Féminin', 4, 21, 45, 88, 77, 40, 19, 22, 18, 124, 114, 2, 1, 34, 14, 349, 645, 39, 36, 42, 51, 26, 645, 608, 42.42, 'Communal', 601, 11141, NULL),
(773, 2456, 6535, 5091, 8084, 15717, 'SidiBouzid', 'Masculin', 10, 188, 341, 313, 234, 137, 85, 43, 101, 704, 495, 2794, 459, 2573, 510, 1485, 292, 127, 973, 222, 407, 127, 14, 9138, 67.61, 'Rural', 601, 11141, NULL),
(774, 2456, 4920, 12109, 8084, 17104, 'SidiBouzid', 'Féminin', 9, 127, 315, 415, 264, 153, 76, 52, 33, 510, 423, 58, 7, 2345, 6, 518, 502, 204, 71, 97, 292, 16, 502, 3544, 29.21, 'Rural', 601, 11141, NULL),
(775, 1201, 764, 833, 5140, 1991, 'Jilma', 'Masculin', 3, 14, 33, 42, 25, 13, 7, 6, 9, 66, 66, 200, 25, 38, 45, 367, 24, 18, 206, 81, 43, 17, 13.39, 1003, 58.16, 'Communal', 623, 6964, NULL),
(776, 1201, 709, 1640, 5140, 2129, 'Jilma', 'Féminin', 2, 6, 21, 52, 28, 23, 8, 7, 8, 45, 25, 7, 1, 8, 5, 215, 84, 20, 39, 31, 24, 5, 84, 333, 22.97, 'Communal', 623, 6964, NULL),
(777, 1201, 5536, 5091, 5140, 11996, 'Jilma', 'Masculin', 15, 107, 144, 129, 97, 53, 39, 30, 52, 196, 135, 2685, 162, 1833, 75, 770, 96, 136, 454, 138, 256, 44, 9.69, 6236, 57.56, 'Rural', 623, 6964, NULL),
(778, 1201, 3922, 10984, 5140, 12510, 'Jilma', 'Féminin', 4, 42, 74, 119, 58, 21, 11, 14, 4, 75, 132, 69, 2, 647, 8, 214, 199, 61, 30, 76, 96, 7, 199, 1181, 12.2, 'Rural', 623, 6964, NULL),
(779, 202, 395, 432, 4142, 1072, 'Cebalet_Ouled_Asker', 'Masculin', -1, 10, 22, 26, 9, 17, 5, 4, 4, 34, 50, 90, 15, 10, 38, 252, 18, 13, 70, 35, 29, 20, 15.47, 541, 59.7, 'Communal', 19, 4363, NULL),
(780, 202, 333, 877, 4142, 1271, 'Cebalet_Ouled_Asker', 'Féminin', 1, 6, 31, 38, 33, 15, 3, 4, 6, 38, 11, 0, 0, 2, 5, 190, 161, 11, 16, 18, 18, 17, 161, 255, 30.97, 'Communal', 19, 4363, NULL),
(781, 202, 2648, 2818, 4142, 6020, 'Cebalet_Ouled_Asker', 'Masculin', 4, 64, 91, 81, 78, 64, 39, 27, 32, 157, 57, 1485, 71, 339, 83, 403, 67, 96, 131, 95, 160, 131, 15.18, 2716, 53.21, 'Rural', 19, 4363, NULL),
(782, 202, 1950, 5484, 4142, 6495, 'Cebalet_Ouled_Asker', 'Féminin', 1, 35, 79, 88, 59, 19, 7, 6, 4, 83, 93, 27, 2, 283, 1, 148, 141, 45, 39, 50, 67, 67, 141, 710, 15.58, 'Rural', 19, 4363, NULL),
(783, 1568, 730, 784, 5889, 2321, 'Bir_Hafey', 'Masculin', 1, 24, 56, 60, 36, 24, 9, 5, 16, 113, 74, 253, 65, 50, 86, 488, 40, 20, 265, 91, 57, 13, 15.42, 1300, 66.26, 'Communal', 370, 7827, NULL),
(784, 1568, 662, 1680, 5889, 2375, 'Bir_Hafey', 'Féminin', 1, 12, 45, 68, 54, 24, 16, 4, 11, 86, 43, 4, 1, 19, 4, 288, 138, 25, 52, 45, 40, 3, 138, 456, 29.26, 'Communal', 370, 7827, NULL),
(785, 1568, 4838, 4499, 5889, 11843, 'Bir_Hafey', 'Masculin', 18, 73, 148, 182, 104, 49, 29, 30, 38, 286, 250, 3109, 248, 1151, 125, 1088, 75, 62, 626, 153, 174, 30, 9.14, 6673, 62.01, 'Rural', 370, 7827, NULL),
(786, 1568, 3429, 9679, 5889, 11856, 'Bir_Hafey', 'Féminin', 8, 37, 98, 159, 90, 28, 15, 10, 8, 125, 223, 75, 3, 988, 1, 295, 290, 31, 68, 67, 75, 4, 290, 1731, 18.36, 'Rural', 370, 7827, NULL),
(787, 455, 1124, 1361, 4418, 3331, 'SidiAli_Ben_Aoun', 'Masculin', 3, 31, 60, 64, 50, 18, 9, 4, 5, 135, 128, 354, 97, 74, 109, 639, 37, 12, 326, 83, 35, 21, 12.44, 1725, 59.17, 'Communal', 39, 4912, NULL),
(788, 455, 953, 2685, 4418, 3382, 'SidiAli_Ben_Aoun', 'Féminin', 1, 22, 65, 110, 67, 31, 17, 2, 1, 109, 37, 4, 3, 7, 4, 246, 172, 16, 42, 38, 37, 2, 172, 380, 20.61, 'Communal', 39, 4912, NULL),
(789, 455, 2898, 3138, 4418, 7058, 'SidiAli_Ben_Aoun', 'Masculin', 9, 81, 105, 104, 100, 51, 33, 24, 23, 185, 112, 1359, 134, 821, 91, 467, 86, 88, 363, 90, 186, 26, 13.75, 3381, 55.53, 'Rural', 39, 4912, NULL),
(790, 455, 2046, 6173, 4418, 7055, 'SidiAli_Ben_Aoun', 'Féminin', 5, 34, 76, 97, 77, 42, 26, 15, 19, 91, 37, 26, 2, 337, 3, 62, 66, 123, 9, 11, 86, 0, 66, 489, 12.5, 'Rural', 39, 4912, NULL),
(791, 748, 880, 1014, 4479, 2578, 'Menzel_Bouzaeenne', 'Masculin', 3, 10, 51, 100, 68, 35, 16, 12, 29, 104, 51, 267, 62, 85, 92, 621, 52, 34, 83, 44, 76, 13, 21.42, 1229, 60.67, 'Communal', 56, 5283, NULL),
(792, 748, 647, 1891, 4479, 2704, 'Menzel_Bouzaeenne', 'Féminin', 2, 7, 62, 125, 113, 55, 25, 20, 33, 92, 25, 5, 3, 32, 2, 245, 113, 69, 34, 15, 52, 2, 113, 363, 30.07, 'Communal', 56, 5283, NULL),
(793, 748, 2342, 3113, 4479, 6728, 'Menzel_Bouzaeenne', 'Masculin', 7, 62, 113, 182, 121, 77, 55, 33, 50, 208, 46, 849, 120, 1139, 106, 506, 78, 122, 189, 43, 166, 12, 19.47, 2911, 53.73, 'Rural', 56, 5283, NULL),
(794, 748, 1575, 5577, 4479, 6938, 'Menzel_Bouzaeenne', 'Féminin', 3, 35, 106, 166, 90, 46, 19, 12, 7, 106, 78, 19, 2, 638, 2, 106, 120, 75, 18, 12, 78, 2, 120, 878, 19.62, 'Rural', 56, 5283, NULL),
(795, 242, 1738, 2315, 1785, 5756, 'Meknassy', 'Masculin', 5, 54, 147, 285, 189, 105, 48, 20, 34, 419, 229, 341, 162, 99, 202, 1190, 131, 47, 307, 161, 162, 40, 26.36, 2534, 59.78, 'Communal', 801, 2828, NULL),
(796, 242, 1439, 4080, 1785, 5752, 'Meknassy', 'Féminin', 6, 19, 103, 259, 209, 105, 56, 43, 42, 202, 58, 13, 13, 33, 18, 592, 247, 91, 69, 38, 131, 2, 247, 824, 29.08, 'Communal', 801, 2828, NULL),
(797, 242, 1232, 1693, 1785, 3611, 'Meknassy', 'Masculin', 7, 25, 72, 86, 71, 44, 33, 10, 33, 179, 76, 406, 90, 417, 70, 338, 42, 30, 98, 84, 89, 20, 19.92, 1536, 53.12, 'Rural', 801, 2828, NULL),
(798, 242, 815, 2922, 1785, 3607, 'Meknassy', 'Féminin', 7, 20, 42, 87, 61, 21, 16, 12, 7, 70, 95, 4, 3, 165, 7, 101, 116, 29, 27, 15, 42, 0, 116, 417, 18.99, 'Rural', 801, 2828, NULL),
(799, 724, 2905, 3706, 3972, 8345, 'Souk_Jedid', 'Masculin', 7, 56, 128, 152, 102, 64, 44, 29, 51, 234, 278, 1379, 181, 466, 85, 1073, 64, 106, 446, 146, 171, 22, 13.82, 3998, 55.59, 'Rural', 373, 5069, NULL),
(800, 724, 2200, 6860, 3972, 8456, 'Souk_Jedid', 'Féminin', 2, 21, 87, 125, 69, 23, 16, 11, 5, 85, 394, 31, 6, 372, 13, 334, 132, 49, 41, 42, 64, 14, 132, 1236, 18.87, 'Rural', 373, 5069, NULL),
(801, 543, 977, 972, 2850, 2549, 'Mezzouna', 'Masculin', 4, 29, 79, 100, 54, 33, 15, 13, 24, 139, 68, 298, 63, 30, 81, 516, 73, 52, 150, 65, 108, 18, 23.15, 1212, 61.89, 'Communal', 223, 3616, NULL),
(802, 543, 906, 1815, 2850, 2667, 'Mezzouna', 'Féminin', 0, 22, 59, 93, 56, 35, 26, 26, 35, 81, 15, 4, 3, 36, 4, 355, 236, 123, 30, 31, 73, 14, 236, 488, 31.95, 'Communal', 223, 3616, NULL),
(803, 543, 2452, 2414, 2850, 6183, 'Mezzouna', 'Masculin', 9, 42, 83, 81, 46, 38, 18, 21, 34, 90, 68, 1893, 121, 679, 29, 285, 29, 160, 217, 99, 77, 15, 10.16, 3386, 60.97, 'Rural', 223, 3616, NULL),
(804, 543, 1793, 5614, 2850, 6462, 'Mezzouna', 'Féminin', 8, 23, 40, 63, 33, 14, 6, 2, 11, 29, 29, 59, 0, 432, 0, 81, 75, 89, 17, 20, 29, 2, 75, 648, 13.12, 'Rural', 223, 3616, NULL),
(805, 2094, 1552, 1105, 11975, 3951, 'Regueb', 'Masculin', 8, 37, 60, 89, 33, 18, 5, 12, 9, 115, 181, 465, 125, 212, 100, 925, 46, 7, 456, 193, 68, 13, 9.42, 2578, 72.01, 'Communal', 726, 14795, NULL),
(806, 2094, 1382, 2734, 11975, 4122, 'Regueb', 'Féminin', 6, 17, 68, 132, 83, 38, 17, 10, 10, 100, 65, 9, 7, 146, 11, 550, 446, 17, 117, 91, 46, 19, 446, 1010, 33.67, 'Communal', 726, 14795, NULL),
(807, 2094, 10036, 7026, 11975, 19356, 'Regueb', 'Masculin', 25, 84, 132, 174, 125, 86, 46, 33, 57, 261, 293, 3171, 548, 3712, 99, 827, 65, 62, 2737, 232, 267, 23, 6.18, 11568, 63.7, 'Rural', 726, 14795, NULL),
(808, 2094, 7218, 16066, 11975, 20119, 'Regueb', 'Féminin', 14, 26, 99, 205, 77, 41, 11, 10, 10, 99, 81, 65, 13, 2857, 1, 278, 468, 41, 172, 75, 65, 17, 468, 3572, 20.15, 'Rural', 726, 14795, NULL),
(809, 570, 314, 308, 4511, 919, 'Ouled_Haffouz', 'Masculin', 0, 8, 16, 26, 11, 6, 6, 3, 6, 42, 27, 56, 29, 23, 25, 282, 17, 6, 75, 30, 21, 6, 13.58, 528, 66.49, 'Communal', 175, 5256, NULL),
(810, 570, 304, 624, 4511, 976, 'Ouled_Haffouz', 'Féminin', 0, 7, 20, 30, 15, 6, 2, 3, 4, 25, 13, 0, 1, 3, 9, 215, 76, 13, 9, 22, 17, 1, 76, 264, 36.1, 'Communal', 175, 5256, NULL),
(811, 570, 2869, 2695, 4511, 6701, 'Ouled_Haffouz', 'Masculin', 8, 32, 90, 115, 78, 51, 27, 30, 60, 198, 151, 982, 117, 911, 119, 519, 55, 35, 655, 114, 185, 50, 12.46, 3507, 59.8, 'Rural', 175, 5256, NULL),
(812, 570, 2123, 5675, 4511, 6723, 'Ouled_Haffouz', 'Féminin', 5, 24, 82, 93, 45, 28, 10, 6, 8, 119, 127, 18, 3, 297, 2, 192, 155, 9, 59, 40, 55, 8, 155, 749, 15.59, 'Rural', 175, 5256, NULL),
(813, 18148, 108413, 26384, 47916, 56311, 'Sud_Est', 'Masculin', 174, 2049, 5248, 5505, 3141, 1447, 713, 538, 809, 10344, 16380, 36262, 10710, 8800, 7154, 33264, 2836, 558, 27459, 21494, 4517, 3928, 20.24, 23869, 53.15, 'Communal', 18147, 84211, NULL),
(814, 18148, 103312, 34974, 47916, 46908, 'Sud_Est', 'Féminin', 121, 825, 4190, 8339, 5502, 2226, 847, 362, 208, 7154, 5578, 445, 663, 961, 867, 21146, 25414, 461, 5953, 6942, 2836, 342, 25414, 7264, 25.44, 'Communal', 18147, 84211, NULL),
(815, 18148, 42373, 15530, 47916, 32647, 'Sud_Est', 'Masculin', 42, 1043, 1927, 2017, 1223, 632, 329, 253, 381, 3723, 3545, 15641, 2346, 8906, 2258, 8544, 1206, 408, 7536, 2602, 2415, 1154, 16.84, 14235, 52.43, 'Rural', 18147, 84211, NULL),
(816, 18148, 39469, 38651, 47916, 51985, 'Sud_Est', 'Féminin', 25, 377, 1729, 2978, 1577, 550, 176, 44, 51, 2258, 1405, 170, 47, 1976, 147, 2806, 4276, 232, 900, 657, 1206, 34, 4276, 10106, 25.65, 'Rural', 18147, 84211, NULL),
(817, 6510, 37860, 34320, 16756, 97096, 'Gabes', 'Masculin', 64, 614, 1994, 2307, 1322, 555, 278, 217, 291, 3773, 9214, 12347, 3299, 3991, 2512, 12489, 999, 252, 8003, 3923, 1735, 1752, 12.26, 55082, 64.65, 'Communal', 8810, 32076, NULL),
(818, 6510, 34329, 76566, 16756, 101265, 'Gabes', 'Féminin', 45, 239, 1499, 3375, 2360, 922, 372, 163, 91, 2512, 2141, 177, 186, 616, 378, 8541, 10173, 245, 2012, 1738, 999, 188, 10173, 15644, 24.39, 'Communal', 8810, 32076, NULL),
(819, 6510, 18343, 15826, 16756, 39625, 'Gabes', 'Masculin', 19, 350, 698, 793, 521, 261, 138, 108, 178, 1358, 1722, 6739, 813, 4503, 723, 3326, 368, 173, 2150, 989, 1050, 438, 13.03, 20699, 60.06, 'Rural', 8810, 32076, NULL),
(820, 6510, 15948, 38282, 16756, 45112, 'Gabes', 'Féminin', 8, 140, 541, 1078, 575, 195, 69, 22, 27, 723, 812, 78, 16, 1491, 29, 1044, 1361, 120, 422, 284, 368, 18, 1361, 4173, 15.14, 'Rural', 8810, 32076, NULL),
(821, 1810, 6947, 6128, 165, 17376, 'Gabes_Medina', 'Masculin', 11, 122, 400, 399, 257, 109, 57, 61, 66, 758, 2165, 1181, 611, 555, 458, 2125, 152, 81, 1867, 896, 341, 350, 13.22, 9761, 64.73, 'Communal', 12114, 14089, NULL),
(822, 1810, 6352, 13727, 165, 18466, 'Gabes_Medina', 'Féminin', 5, 51, 235, 510, 413, 160, 81, 24, 31, 458, 445, 25, 52, 34, 207, 1720, 1855, 34, 471, 426, 152, 47, 1855, 3225, 25.66, 'Communal', 12114, 14089, NULL),
(823, 117, 4606, 3724, 327, 11006, 'Gabes', 'Masculin', 11, 77, 237, 252, 128, 61, 52, 30, 43, 449, 1201, 1735, 477, 289, 305, 1165, 107, 18, 848, 408, 239, 251, 12.32, 6385, 66.16, 'Communal', 109, 553, NULL),
(824, 117, 4120, 8590, 327, 11295, 'Gabes', 'Féminin', 7, 27, 184, 351, 230, 79, 35, 18, 10, 305, 334, 25, 21, 90, 48, 813, 1017, 32, 252, 195, 107, 29, 1017, 1766, 23.95, 'Communal', 109, 553, NULL),
(825, 117, 640, 226, 327, 864, 'Gabes', 'Masculin', 1, 26, 24, 15, 11, 5, 1, 0, 0, 18, 200, 47, 88, 61, 9, 67, 6, 4, 30, 14, 56, 46, 13.17, 554, 73.84, 'Rural', 109, 553, NULL),
(826, 117, 433, 778, 327, 853, 'Gabes', 'Féminin', 1, 2, 3, 9, 3, 4, 0, 0, 0, 9, 5, 0, 0, 2, 3, 8, 19, 1, 17, 20, 6, 0, 19, 53, 8.79, 'Rural', 109, 553, NULL),
(827, 544, 8301, 10246, 629, 26574, 'Gabes', 'Masculin', 23, 127, 525, 695, 374, 137, 68, 43, 59, 1035, 2683, 2250, 924, 490, 750, 4065, 249, 45, 2096, 1241, 376, 504, 12.57, 14276, 61.44, 'Communal', 171, 1344, NULL),
(828, 544, 8249, 18924, 629, 26884, 'Gabes', 'Féminin', 15, 53, 418, 1019, 718, 268, 92, 48, 14, 750, 499, 43, 79, 35, 31, 3347, 5191, 39, 608, 635, 249, 60, 5191, 5321, 29.61, 'Communal', 171, 1344, NULL),
(829, 544, 906, 534, 629, 1769, 'Gabes', 'Masculin', 0, 19, 43, 36, 20, 4, 6, 1, 6, 71, 130, 277, 52, 302, 41, 138, 33, 5, 88, 63, 52, 49, 11.01, 1099, 69.77, 'Rural', 171, 1344, NULL),
(830, 544, 752, 1494, 629, 1899, 'Gabes', 'Féminin', 0, 16, 25, 45, 17, 11, 2, 5, 2, 41, 28, 7, 0, 30, 0, 101, 139, 5, 54, 57, 33, 2, 139, 279, 21.33, 'Rural', 171, 1344, NULL),
(831, 2373, 5318, 2713, 298, 10031, 'Ghanouch', 'Masculin', 4, 41, 98, 121, 67, 13, 2, 7, 10, 158, 1163, 2028, 237, 1713, 53, 668, 24, 11, 670, 198, 90, 274, 4.96, 6955, 72.95, 'Communal', 3158, 5829, NULL),
(832, 2373, 3954, 8199, 298, 9370, 'Ghanouch', 'Féminin', 3, 10, 72, 149, 88, 19, 5, 1, 1, 53, 82, 21, 7, 250, 13, 268, 294, 4, 135, 49, 24, 11, 294, 826, 12.5, 'Communal', 3158, 5829, NULL),
(833, 212, 3208, 2675, 1256, 7426, 'Metouia', 'Masculin', 5, 31, 129, 177, 90, 42, 25, 16, 22, 255, 699, 1247, 247, 82, 173, 932, 53, 13, 613, 242, 116, 144, 11.37, 4211, 63.98, 'Communal', 222, 1690, NULL),
(834, 212, 3132, 5950, 1256, 8034, 'Metouia', 'Féminin', 1, 13, 97, 276, 191, 74, 28, 15, 7, 173, 290, 18, 10, 49, 20, 727, 424, 9, 160, 114, 53, 13, 424, 1382, 25.94, 'Communal', 222, 1690, NULL),
(835, 212, 1369, 861, 1256, 2604, 'Metouia', 'Masculin', 5, 16, 48, 55, 37, 24, 7, 8, 3, 93, 89, 550, 54, 467, 39, 163, 20, 5, 115, 31, 72, 69, 11.47, 1543, 66.94, 'Rural', 222, 1690, NULL),
(836, 212, 1095, 2356, 1256, 2725, 'Metouia', 'Féminin', 0, 8, 36, 47, 22, 12, 3, 0, 0, 39, 26, 4, 0, 147, 0, 33, 72, 6, 21, 8, 20, 2, 72, 241, 13.54, 'Rural', 222, 1690, NULL),
(837, 675, 1715, 972, 1514, 3353, 'Hamma', 'Masculin', 0, 29, 33, 37, 20, 11, 5, 1, 5, 56, 53, 478, 82, 948, 49, 454, 39, 7, 130, 38, 51, 51, 6.17, 2234, 71.03, 'Rural', 431, 2620, NULL),
(838, 675, 1415, 3077, 1514, 4056, 'Hamma', 'Féminin', 0, 16, 54, 77, 35, 17, 8, 2, 1, 49, 118, 7, 2, 500, 5, 111, 166, 14, 22, 8, 39, 0, 166, 768, 24.14, 'Rural', 431, 2620, NULL),
(839, 1390, 5745, 5144, 1526, 15328, 'Hamma', 'Masculin', 4, 153, 430, 469, 291, 138, 50, 39, 54, 778, 778, 2980, 516, 374, 574, 2112, 313, 67, 1094, 550, 410, 119, 16.27, 8527, 66.44, 'Communal', 4138, 7054, NULL),
(840, 1390, 4710, 12173, 1526, 16176, 'Hamma', 'Féminin', 8, 62, 358, 763, 518, 244, 96, 40, 20, 574, 324, 42, 8, 137, 27, 961, 771, 102, 205, 191, 313, 16, 771, 1892, 24.75, 'Communal', 4138, 7054, NULL),
(841, 1390, 5051, 4677, 1526, 12137, 'Matmata', 'Masculin', 3, 138, 285, 319, 204, 83, 33, 29, 46, 508, 550, 2642, 214, 880, 288, 989, 148, 53, 659, 287, 366, 81, 15.48, 6305, 61.46, 'Rural', 4138, 7054, NULL),
(842, 1390, 3902, 9965, 1526, 12513, 'Matmata', 'Féminin', 3, 53, 203, 457, 272, 79, 27, 5, 12, 288, 340, 38, 7, 548, 1, 327, 249, 44, 106, 64, 148, 4, 249, 1437, 20.35, 'Rural', 4138, 7054, NULL),
(846, 217, 416, 1080, 613, 1139, 'Medenine', 'Féminin', 0, 0, 6, 16, 5, 2, 0, 0, 0, 6, 1, 1, 0, 8, 12, 13, 29, 1, 2, 5, 2, 0, 29, 30, 5.18, 'Rural', 368, 1198, NULL),
(847, 422, 1102, 1140, 2442, 2670, 'Medenine', 'Masculin', 0, 16, 65, 67, 40, 16, 7, 7, 16, 117, 180, 287, 74, 51, 50, 357, 50, 7, 205, 95, 63, 40, 15.75, 1289, 57.3, 'Communal', 722, 3586, NULL),
(848, 422, 1079, 2458, 2442, 3077, 'Medenine', 'Féminin', 2, 12, 37, 98, 61, 27, 15, 6, 3, 50, 65, 0, 1, 5, 1, 197, 276, 14, 54, 30, 50, 5, 276, 359, 20.12, 'Communal', 722, 3586, NULL),
(854, 2933, 6961, 16663, 8449, 18857, 'Medenine', 'Féminin', 4, 37, 184, 392, 199, 62, 20, 8, 11, 265, 282, 19, 6, 249, 5, 415, 580, 36, 177, 114, 99, 10, 580, 1276, 11.63, 'Rural', 2649, 14031, NULL),
(855, 8298, 57880, 43193, 21052, 136639, 'Medenine', 'Masculin', 87, 1029, 2037, 2018, 1139, 539, 290, 221, 344, 3968, 5711, 19247, 6538, 4421, 3041, 15511, 1326, 209, 16549, 16447, 1904, 1148, 8.33, 85659, 68.39, 'Communal', 5303, 34653, NULL),
(856, 8298, 55900, 113200, 21052, 144418, 'Beni_Khedech', 'Féminin', 57, 438, 1819, 3381, 2245, 934, 359, 148, 88, 3041, 2917, 229, 433, 313, 382, 9502, 12092, 158, 3391, 4822, 1326, 112, 12092, 21776, 21.61, 'Communal', 5303, 34653, NULL),
(857, 8298, 15730, 11797, 21052, 35105, 'Beni_Khedech', 'Masculin', 19, 337, 640, 689, 401, 194, 93, 82, 97, 1177, 1354, 6322, 1160, 3185, 992, 3277, 611, 144, 3914, 1196, 704, 269, 11.21, 20696, 66.4, 'Rural', 5303, 34653, NULL),
(858, 8298, 15036, 35911, 21052, 41964, 'Beni_Khedech', 'Féminin', 9, 150, 775, 1346, 728, 272, 90, 19, 16, 992, 444, 69, 27, 416, 70, 1022, 1849, 92, 364, 292, 611, 7, 1849, 2650, 14.42, 'Rural', 5303, 34653, NULL),
(859, 1118, 6528, 5384, 1787, 16620, 'Beni_Khedech', 'Masculin', 10, 128, 318, 393, 215, 101, 40, 23, 38, 634, 951, 2184, 717, 138, 482, 2683, 211, 20, 2238, 835, 274, 212, 11.29, 9968, 67.61, 'Communal', 618, 3523, NULL),
(862, 1118, 1187, 2761, 1787, 3306, 'Ben_Guerdane', 'Féminin', 1, 14, 52, 124, 85, 26, 9, 4, 1, 107, 43, 4, 4, 0, 9, 106, 248, 9, 35, 34, 53, 3, 248, 230, 16.49, 'Rural', 618, 3523, NULL),
(863, 2742, 2987, 2732, 5985, 8757, 'Ben_Guerdane', 'Masculin', 11, 78, 205, 241, 117, 47, 27, 12, 18, 371, 427, 839, 447, 61, 342, 2027, 123, 12, 882, 456, 147, 119, 12.55, 5269, 68.8, 'Communal', 1108, 9835, NULL),
(864, 2742, 3242, 6640, 5985, 9730, 'Zarzis', 'Féminin', 8, 31, 219, 430, 283, 104, 39, 14, 6, 342, 210, 9, 25, 1, 68, 1255, 1470, 12, 228, 211, 123, 12, 1470, 1959, 31.76, 'Communal', 1108, 9835, NULL),
(865, 2742, 4656, 3305, 5985, 10320, 'Zarzis', 'Masculin', 5, 84, 178, 219, 132, 50, 28, 25, 23, 368, 485, 1761, 480, 1124, 389, 1001, 189, 27, 1004, 314, 192, 83, 10.81, 6257, 67.97, 'Rural', 1108, 9835, NULL),
(866, 2742, 4473, 9725, 5985, 11890, 'Zarzis', 'Féminin', 2, 46, 258, 484, 268, 99, 34, 5, 7, 389, 165, 14, 13, 106, 8, 428, 748, 17, 131, 102, 189, 2, 748, 963, 18.21, 'Rural', 1108, 9835, NULL),
(867, 1953, 369, 375, 5058, 976, 'Zarzis', 'Masculin', 0, 3, 18, 14, 12, 11, 2, 2, 5, 27, 49, 97, 32, 18, 40, 181, 24, 0, 110, 40, 20, 6, 11.31, 533, 61.58, 'Communal', 1533, 8544, NULL),
(868, 1953, 422, 971, 5058, 1288, 'Djerba_Houmet_Souk', 'Féminin', 1, 3, 18, 40, 35, 13, 6, 4, 2, 40, 12, 3, 2, 1, 10, 132, 69, 3, 25, 17, 24, 1, 69, 194, 24.61, 'Communal', 1533, 8544, NULL),
(869, 1953, 3379, 3145, 5058, 7212, 'Djerba_Houmet_Souk', 'Masculin', 8, 69, 108, 103, 64, 36, 14, 14, 22, 182, 162, 1381, 128, 480, 164, 534, 177, 29, 736, 162, 149, 28, 11.02, 3619, 56.39, 'Rural', 1533, 8544, NULL),
(870, 1953, 3683, 9311, 5058, 10347, 'Djerba_Midoun', 'Féminin', 0, 32, 156, 268, 128, 59, 22, 6, 4, 164, 54, 17, 2, 19, 17, 144, 166, 39, 56, 65, 177, 0, 166, 357, 10.01, 'Rural', 1533, 8544, NULL),
(871, 1101, 9464, 7500, 1682, 24438, 'Djerba_Midoun', 'Masculin', 17, 264, 551, 496, 274, 126, 49, 53, 63, 986, 609, 3683, 911, 979, 552, 3135, 239, 67, 4362, 1176, 456, 155, 11.28, 15027, 69.31, 'Communal', 1056, 3839, NULL),
(872, 1101, 8808, 20849, 1682, 24850, 'Djerba_Ajim', 'Féminin', 8, 82, 389, 710, 445, 200, 48, 18, 9, 552, 282, 42, 11, 35, 41, 1136, 956, 38, 319, 259, 239, 5, 956, 2097, 16.1, 'Communal', 1056, 3839, NULL),
(873, 1101, 2112, 1316, 1682, 4759, 'Djerba_Ajim', 'Masculin', 2, 58, 104, 84, 59, 32, 17, 14, 20, 176, 76, 809, 97, 490, 133, 384, 94, 28, 910, 249, 123, 18, 11.85, 3035, 72.35, 'Rural', 1056, 3839, NULL),
(874, 1101, 1889, 4311, 1682, 5100, 'Tataouine', 'Féminin', 3, 17, 117, 159, 96, 43, 19, 1, 1, 133, 82, 16, 1, 26, 12, 112, 137, 14, 62, 33, 94, 1, 137, 336, 15.47, 'Rural', 1056, 3839, NULL),
(875, 127, 11967, 9444, 345, 25019, 'Tataouine', 'Masculin', 12, 218, 337, 271, 183, 99, 55, 49, 84, 694, 1069, 3735, 1054, 1422, 563, 2252, 224, 66, 1980, 2399, 378, 299, 8.69, 14222, 62.25, 'Communal', 333, 805, NULL),
(876, 127, 11284, 23945, 345, 29004, 'Tataouine', 'Féminin', 14, 91, 308, 543, 338, 152, 72, 24, 16, 563, 573, 36, 43, 34, 38, 1635, 1278, 32, 536, 604, 224, 31, 1278, 3506, 17.44, 'Communal', 333, 805, NULL),
(877, 127, 599, 262, 345, 974, 'Tataouine', 'Masculin', 1, 9, 10, 10, 6, 6, 4, 4, 3, 19, 27, 111, 59, 249, 11, 52, 5, 3, 81, 66, 20, 14, 7.3, 660, 73.2, 'Rural', 333, 805, NULL),
(878, 127, 460, 927, 345, 1020, 'Tataouine', 'Féminin', 2, 2, 13, 21, 10, 2, 0, 1, 0, 11, 3, 0, 0, 4, 7, 16, 63, 0, 10, 8, 5, 0, 63, 43, 9.11, 'Rural', 333, 805, NULL),
(879, 7960, 11466, 8165, 3519, 28367, 'Tataouine', 'Masculin', 20, 157, 292, 301, 162, 69, 56, 30, 58, 611, 1502, 3353, 2194, 709, 578, 2815, 226, 16, 3833, 4435, 251, 193, 5.68, 19054, 71.22, 'Communal', 15842, 27321, NULL),
(880, 7960, 10843, 20719, 3519, 28238, 'Tataouine', 'Féminin', 14, 81, 311, 517, 390, 163, 71, 42, 20, 578, 682, 57, 272, 32, 101, 2282, 2622, 17, 962, 1596, 226, 21, 2622, 5918, 26.63, 'Communal', 15842, 27321, NULL),
(881, 9341, 10811, 6729, 3522, 24124, 'Tataouine', 'Masculin', 16, 140, 248, 233, 148, 72, 45, 43, 66, 518, 732, 3778, 775, 591, 370, 1757, 174, 23, 2163, 6452, 303, 117, 5.83, 16381, 72.11, 'Communal', 12479, 25342, NULL),
(882, 9341, 10047, 18006, 3522, 23092, 'Tataouine', 'Féminin', 10, 50, 199, 346, 270, 107, 48, 16, 18, 370, 404, 53, 39, 131, 53, 1143, 2441, 22, 627, 1613, 174, 8, 2441, 4028, 22.02, 'Communal', 12479, 25342, NULL),
(883, 4102, 4288, 2864, 1068, 8338, 'Tataouine', 'Masculin', 3, 40, 68, 69, 28, 14, 16, 9, 12, 126, 372, 1578, 408, 503, 114, 660, 105, 5, 981, 653, 75, 47, 4.91, 5205, 65.64, 'Communal', 3459, 8629, NULL),
(884, 4102, 4527, 8360, 1068, 9814, 'Tataouine', 'Féminin', 1, 24, 71, 157, 100, 47, 12, 6, 6, 114, 244, 6, 11, 53, 15, 347, 598, 9, 221, 145, 105, 2, 598, 1030, 14.81, 'Communal', 3459, 8629, NULL),
(885, 1256, 3687, 2768, 6195, 8635, 'Tataouine', 'Masculin', 3, 85, 169, 192, 101, 46, 19, 20, 19, 287, 419, 1721, 275, 680, 188, 900, 93, 39, 844, 304, 159, 58, 11.3, 5204, 67.96, 'Rural', 656, 8107, NULL),
(886, 1256, 3344, 8876, 6195, 10301, 'Ghomrassen', 'Féminin', 1, 39, 179, 289, 141, 43, 6, 2, 3, 188, 97, 18, 7, 261, 17, 216, 487, 13, 70, 50, 93, 1, 487, 721, 13.83, 'Rural', 656, 8107, NULL),
(887, 3340, 12673, 11631, 10108, 33676, 'Ghomrassen', 'Masculin', 23, 406, 1217, 1180, 680, 353, 145, 100, 174, 2603, 1455, 4668, 873, 388, 1601, 5264, 511, 97, 2907, 1124, 878, 1028, 19.57, 17730, 65.46, 'Communal', 4034, 17482, NULL),
(888, 3340, 13083, 29317, 10108, 38121, 'Ghomrassen', 'Féminin', 19, 148, 872, 1583, 897, 370, 116, 51, 29, 1601, 520, 39, 44, 32, 107, 3103, 3149, 58, 550, 382, 511, 42, 3149, 4731, 23.09, 'Communal', 4034, 17482, NULL),
(889, 3340, 8300, 6945, 10108, 18122, 'Ghomrassen', 'Masculin', 4, 356, 589, 535, 301, 177, 98, 63, 106, 1188, 469, 2580, 373, 1218, 543, 1941, 227, 91, 1472, 417, 661, 447, 20.18, 8921, 61.68, 'Rural', 4034, 17482, NULL),
(890, 3340, 8485, 19589, 10108, 22227, 'Dhehiba', 'Féminin', 8, 87, 413, 554, 274, 83, 17, 3, 8, 543, 149, 23, 4, 69, 48, 740, 1066, 20, 114, 81, 227, 9, 1066, 1197, 11.87, 'Rural', 4034, 17482, NULL),
(891, 777, 5803, 5467, 3793, 16150, 'Dhehiba', 'Masculin', 12, 167, 505, 528, 262, 119, 37, 30, 56, 1060, 646, 2663, 461, 176, 619, 2392, 140, 26, 1549, 552, 300, 517, 16.05, 8968, 66.15, 'Communal', 602, 5172, NULL),
(892, 777, 5659, 13766, 3793, 17504, 'Remada', 'Féminin', 7, 52, 364, 669, 384, 116, 19, 12, 3, 619, 292, 16, 15, 9, 58, 1299, 1555, 17, 276, 178, 140, 25, 1555, 2117, 21.35, 'Communal', 602, 5172, NULL),
(893, 777, 2517, 2169, 3793, 5459, 'Remada', 'Masculin', 0, 74, 161, 160, 89, 47, 25, 23, 32, 316, 161, 942, 114, 452, 91, 436, 44, 38, 386, 94, 167, 84, 18.88, 2669, 60.27, 'Rural', 602, 5172, NULL),
(894, 777, 2576, 6121, 3793, 6640, 'Remada', 'Féminin', 1, 14, 86, 112, 50, 11, 1, 1, 0, 91, 36, 8, 1, 16, 17, 130, 189, 1, 29, 19, 44, 3, 189, 243, 7.82, 'Rural', 602, 5172, NULL),
(895, 619, 2882, 2777, 1863, 8086, 'Remada', 'Masculin', 1, 96, 344, 324, 212, 110, 41, 15, 32, 715, 307, 840, 267, 58, 442, 1446, 105, 20, 697, 303, 215, 205, 22.32, 4124, 65.66, 'Communal', 1276, 3758, NULL),
(896, 619, 2957, 6503, 1863, 8711, 'Sud_Ouest', 'Féminin', 4, 37, 218, 427, 259, 100, 26, 12, 7, 442, 78, 12, 16, 3, 15, 825, 733, 17, 88, 79, 105, 13, 733, 1118, 25.35, 'Communal', 1276, 3758, NULL),
(897, 619, 1875, 1705, 1863, 4287, 'Sud_Ouest', 'Masculin', 1, 44, 136, 130, 72, 46, 17, 7, 15, 257, 103, 612, 122, 170, 200, 510, 52, 5, 358, 135, 120, 98, 18.32, 2109, 60.23, 'Rural', 1276, 3758, NULL),
(898, 619, 1851, 4321, 1863, 5075, 'Sud_Ouest', 'Féminin', 3, 14, 124, 210, 71, 34, 9, 1, 2, 200, 49, 5, 2, 2, 7, 162, 307, 7, 44, 20, 52, 1, 307, 288, 14.86, 'Rural', 1276, 3758, NULL),
(899, 1156, 2095, 1620, 2336, 4905, 'Sud_Ouest', 'Masculin', 3, 168, 195, 167, 80, 43, 26, 15, 32, 391, 130, 651, 64, 321, 150, 583, 61, 25, 553, 110, 235, 136, 22.34, 2551, 66.97, 'Rural', 744, 4236, NULL),
(900, 1156, 2009, 5095, 2336, 5786, 'Gafsa', 'Féminin', 2, 34, 104, 148, 73, 15, 3, 1, 3, 150, 23, 5, 0, 2, 16, 232, 329, 5, 24, 17, 61, 4, 329, 309, 11.94, 'Rural', 744, 4236, NULL),
(901, 0, 1058, 988, 213, 2692, 'Gafsa', 'Masculin', 2, 21, 68, 74, 45, 15, 8, 1, 23, 129, 278, 398, 36, 65, 160, 341, 74, 7, 183, 107, 51, 30, 15.49, 1440, 63.28, 'Communal', 1, 214, NULL),
(902, 0, 1161, 2560, 213, 3437, 'Gafsa', 'Féminin', 2, 16, 83, 188, 90, 40, 26, 6, 3, 160, 43, 5, 2, 17, 7, 258, 271, 10, 61, 35, 74, 0, 271, 423, 25.52, 'Communal', 1, 214, NULL),
(903, 0, 77, 84, 213, 166, 'Gafsa', 'Masculin', 0, 0, 2, 4, 1, 1, 1, 0, 0, 5, 10, 35, 1, 3, 3, 20, 0, 0, 4, 0, 2, 0, 10.98, 73, 49.4, 'Rural', 1, 214, NULL),
(904, 0, 69, 200, 213, 229, 'Gafsa', 'Féminin', 0, 0, 5, 8, 3, 0, 0, 0, 0, 3, 0, 0, 0, 1, 0, 12, 4, 1, 0, 0, 0, 0, 4, 13, 12.66, 'Rural', 1, 214, NULL),
(905, 538, 1342, 1285, 1032, 2932, 'Gafsa', 'Masculin', 5, 20, 58, 51, 38, 21, 16, 9, 15, 143, 161, 412, 78, 26, 114, 371, 69, 4, 204, 120, 46, 34, 14.33, 1411, 56.19, 'Communal', 1270, 2840, NULL),
(906, 538, 1799, 3440, 1032, 4480, 'Redeyef', 'Féminin', 3, 7, 58, 129, 57, 56, 31, 12, 6, 114, 96, 1, 3, 1, 15, 405, 277, 2, 110, 65, 69, 1, 277, 685, 23.21, 'Communal', 1270, 2840, NULL),
(907, 538, 1031, 889, 1032, 1842, 'Redeyef', 'Masculin', -1, 12, 23, 19, 17, 14, 12, 3, 5, 62, 57, 238, 43, 105, 45, 182, 25, 4, 136, 61, 27, 24, 11.33, 845, 51.68, 'Rural', 1270, 2840, NULL),
(908, 538, 1373, 2569, 1032, 2971, 'Metlaoui', 'Féminin', 0, 12, 49, 41, 38, 7, 3, 0, 2, 45, 41, 3, 0, 36, 3, 135, 187, 3, 15, 20, 25, 0, 187, 250, 13.56, 'Rural', 1270, 2840, NULL),
(909, 251, 650, 391, 27, 1613, 'Metlaoui', 'Masculin', 2, 53, 95, 102, 62, 35, 17, 18, 13, 252, 19, 282, 17, 26, 136, 238, 87, 12, 189, 18, 120, 23, 33.39, 814, 75.76, 'Communal', 708, 986, NULL),
(910, 251, 689, 1199, 27, 1635, 'Metlaoui', 'Féminin', 1, 24, 70, 82, 52, 40, 10, 7, 7, 136, 4, 2, 5, 0, 2, 113, 113, 9, 5, 11, 87, 0, 113, 141, 26.61, 'Communal', 708, 986, NULL),
(911, 251, 938, 723, 871, 2203, 'Metlaoui', 'Masculin', 1, 49, 147, 101, 61, 53, 26, 27, 35, 304, 44, 73, 14, 37, 130, 476, 36, 28, 85, 24, 146, 219, 34.26, 973, 67.15, 'Communal', 140, 1262, NULL),
(912, 251, 818, 1849, 871, 2354, 'Mdhila', 'Féminin', 1, 12, 78, 86, 54, 18, 4, 2, 3, 130, 7, 3, 3, 2, 10, 204, 200, 3, 10, 14, 36, 3, 200, 247, 21.46, 'Communal', 140, 1262, NULL),
(913, 251, 705, 478, 871, 1463, 'Mdhila', 'Masculin', 2, 57, 72, 55, 41, 26, 17, 15, 22, 157, 8, 101, 29, 167, 54, 210, 45, 19, 35, 17, 110, 105, 31.57, 674, 67.4, 'Rural', 140, 1262, NULL),
(914, 251, 607, 1283, 871, 1526, 'Mdhila', 'Féminin', 0, 13, 45, 35, 39, 16, 1, 0, 1, 54, 0, 2, 1, 12, 5, 71, 50, 3, 2, 5, 45, 1, 50, 94, 15.87, 'Rural', 140, 1262, NULL),
(915, 8393, 56232, 19804, 16307, 44656, 'Mdhila', 'Masculin', 205, 1133, 4044, 5139, 3231, 1394, 720, 519, 508, 9019, 4494, 12248, 4722, 6710, 5847, 30676, 1840, 385, 9272, 5410, 3280, 8348, 13.54, 21488, 55.65, 'Communal', 23537, 48237, NULL),
(916, 8393, 51385, 46600, 16307, 66544, 'Mdhila', 'Féminin', 100, 504, 2924, 6240, 4353, 1806, 741, 398, 245, 5847, 2435, 197, 371, 402, 268, 15019, 9672, 412, 3231, 2459, 1840, 825, 9672, 13931, 29.97, 'Communal', 23537, 48237, NULL),
(917, 8393, 27627, 16398, 16307, 36083, 'Tozeur', 'Masculin', 67, 690, 1538, 1670, 1081, 571, 277, 193, 271, 2966, 996, 6592, 1421, 12366, 1599, 11830, 665, 515, 2476, 1267, 1628, 1056, 17.15, 16310, 54.55, 'Rural', 23537, 48237, NULL),
(918, 8393, 22583, 32437, 16307, 45738, 'Tozeur', 'Féminin', 21, 236, 1110, 2056, 1246, 451, 160, 79, 72, 1599, 1490, 315, 136, 3283, 193, 2965, 3095, 364, 570, 425, 665, 79, 3095, 9882, 29.08, 'Rural', 23537, 48237, NULL),
(919, 3863, 32597, 34178, 13708, 93849, 'Tozeur', 'Masculin', 138, 763, 2897, 3784, 2368, 1051, 554, 387, 360, 6643, 2899, 6280, 3015, 848, 4134, 18936, 1294, 294, 5361, 2477, 2348, 7470, 20.52, 47424, 63.58, 'Communal', 4460, 22031, NULL),
(920, 3863, 30402, 71553, 13708, 97106, 'Tozeur', 'Féminin', 60, 358, 2034, 4151, 2945, 1205, 538, 299, 191, 4134, 1783, 82, 194, 151, 136, 8248, 5433, 327, 1240, 1295, 1294, 744, 5433, 13797, 26.32, 'Communal', 4460, 22031, NULL),
(921, 3863, 12477, 11337, 13708, 31189, 'Tozeur', 'Masculin', 29, 342, 695, 729, 499, 281, 139, 102, 148, 1284, 412, 3731, 558, 4487, 699, 5749, 372, 294, 1052, 341, 875, 481, 15.17, 16840, 63.65, 'Rural', 4460, 22031, NULL),
(922, 3863, 9365, 26953, 13708, 33675, 'Tozeur', 'Féminin', 7, 140, 515, 802, 491, 210, 88, 52, 44, 699, 1275, 65, 17, 1764, 159, 964, 1288, 250, 134, 116, 372, 26, 1288, 4368, 19.96, 'Rural', 4460, 22031, NULL),
(923, 434, 1459, 1095, 1673, 3678, 'Tozeur', 'Masculin', 4, 25, 33, 53, 35, 19, 7, 3, 5, 71, 21, 248, 82, 1181, 51, 696, 17, 6, 89, 31, 44, 48, 7.08, 2400, 70.23, 'Rural', 327, 2434, NULL),
(924, 434, 1122, 3050, 1673, 3907, 'Tozeur', 'Féminin', 1, 3, 32, 71, 51, 15, 4, 5, 6, 51, 25, 5, 2, 535, 119, 80, 208, 18, 11, 8, 17, 2, 208, 669, 21.93, 'Rural', 327, 2434, NULL),
(925, 306, 1529, 942, 1437, 3597, 'Degach', 'Masculin', 2, 42, 129, 107, 64, 21, 5, 7, 8, 199, 72, 401, 30, 573, 148, 934, 89, 26, 189, 36, 92, 23, 14.88, 2260, 73.81, 'Rural', 961, 2704, NULL),
(926, 306, 1155, 2479, 1437, 3635, 'Degach', 'Féminin', 0, 29, 86, 136, 89, 50, 31, 15, 15, 148, 22, 4, 1, 389, 0, 226, 239, 55, 26, 34, 89, 1, 239, 703, 31.81, 'Rural', 961, 2704, NULL),
(927, 193, 4332, 4366, 506, 12507, 'Degach', 'Masculin', 14, 103, 345, 488, 314, 135, 84, 47, 34, 835, 531, 988, 684, 229, 548, 2567, 141, 39, 654, 387, 258, 527, 19.16, 6581, 65.09, 'Communal', 39, 738, NULL),
(928, 193, 4029, 9484, 506, 13364, 'Degach', 'Féminin', 6, 49, 230, 526, 435, 186, 68, 35, 21, 548, 337, 6, 44, 39, 12, 1434, 861, 34, 194, 192, 141, 74, 861, 2326, 29.03, 'Communal', 39, 738, NULL),
(929, 193, 509, 287, 506, 1008, 'Tameghza', 'Masculin', 0, 28, 28, 32, 28, 13, 9, 7, 8, 66, 8, 125, 15, 248, 43, 144, 33, 16, 15, 5, 63, 2, 22.05, 562, 71.53, 'Rural', 39, 738, NULL),
(930, 193, 294, 805, 506, 1002, 'Tameghza', 'Féminin', 0, 11, 37, 33, 23, 8, 6, 5, 3, 43, 10, 0, 1, 43, 4, 14, 33, 26, 0, 2, 33, 1, 33, 71, 19.66, 'Rural', 39, 738, NULL),
(931, 88, 12484, 12573, 1369, 35582, 'Tameghza', 'Masculin', 38, 286, 943, 1119, 694, 320, 147, 108, 112, 1933, 1363, 3317, 1371, 392, 1415, 6988, 469, 101, 3268, 1429, 773, 1071, 16.39, 19237, 64.66, 'Communal', 112, 1569, NULL),
(932, 88, 10894, 25208, 1369, 36224, 'Tameghza', 'Féminin', 30, 129, 741, 1475, 1032, 424, 163, 96, 72, 1415, 910, 49, 102, 93, 40, 4053, 2758, 140, 687, 798, 469, 152, 2758, 6874, 30.41, 'Communal', 112, 1569, NULL),
(933, 88, 998, 756, 1369, 2188, 'Nefta', 'Masculin', 1, 53, 73, 65, 39, 24, 21, 9, 9, 128, 58, 326, 23, 363, 81, 257, 27, 41, 68, 17, 98, 22, 20.74, 1135, 65.45, 'Rural', 112, 1569, NULL),
(934, 88, 614, 1591, 1369, 2114, 'Nefta', 'Féminin', 1, 24, 44, 52, 37, 11, 10, 9, 1, 81, 38, 2, 1, 244, 4, 34, 78, 27, 8, 4, 27, 3, 78, 335, 24.74, 'Rural', 112, 1569, NULL),
(935, 304, 2367, 3081, 994, 8031, 'Nefta', 'Masculin', 7, 48, 259, 394, 285, 118, 78, 41, 45, 683, 75, 213, 140, 15, 376, 1848, 140, 37, 189, 76, 189, 1115, 25.7, 3678, 61.65, 'Communal', 124, 1422, NULL),
(936, 304, 2390, 6560, 994, 8431, 'Nefta', 'Féminin', 2, 20, 180, 388, 312, 151, 81, 51, 32, 376, 48, 3, 4, 3, 18, 437, 265, 66, 31, 28, 140, 96, 265, 652, 22.19, 'Communal', 124, 1422, NULL),
(937, 304, 778, 847, 994, 1971, 'Hazoua', 'Masculin', 1, 28, 75, 91, 56, 38, 21, 14, 19, 131, 5, 21, 18, 61, 52, 567, 53, 44, 49, 13, 131, 43, 30.78, 778, 57.03, 'Rural', 124, 1422, NULL),
(938, 304, 563, 1712, 994, 1969, 'Hazoua', 'Féminin', 0, 16, 31, 63, 37, 23, 12, 9, 5, 52, 0, 2, 0, 3, 3, 46, 51, 42, 2, 3, 53, 2, 51, 58, 13.1, 'Rural', 124, 1422, NULL),
(939, 130, 3209, 3612, 265, 9453, 'Kebili', 'Masculin', 28, 105, 424, 552, 364, 155, 86, 78, 66, 1117, 84, 155, 103, 17, 499, 2419, 116, 37, 166, 59, 334, 977, 31.38, 4008, 61.79, 'Communal', 89, 484, NULL),
(940, 130, 3269, 8203, 265, 10056, 'Kebili', 'Féminin', 9, 32, 256, 472, 286, 99, 55, 30, 15, 499, 18, 3, 5, 1, 9, 453, 226, 18, 12, 23, 116, 80, 226, 604, 18.43, 'Communal', 89, 484, NULL),
(947, 102, 1710, 1829, 176, 5071, 'Kebili', 'Masculin', 1, 44, 144, 178, 96, 40, 17, 5, 11, 298, 233, 114, 96, 13, 196, 1157, 70, 20, 78, 51, 80, 962, 16.56, 2705, 63.93, 'Communal', 369, 647, NULL),
(948, 102, 1377, 3629, 176, 4731, 'Kebili', 'Féminin', 2, 17, 86, 179, 132, 68, 34, 17, 12, 196, 48, 1, 6, 3, 0, 326, 267, 29, 43, 37, 70, 88, 267, 554, 23.31, 'Communal', 369, 647, NULL),
(949, 102, 392, 332, 176, 919, 'Kebili', 'Masculin', 0, 3, 24, 28, 29, 15, 6, 2, 2, 53, 32, 22, 34, 13, 23, 191, 7, 3, 17, 5, 22, 163, 18.74, 477, 63.94, 'Rural', 369, 647, NULL),
(950, 102, 321, 775, 176, 909, 'Kebili', 'Féminin', -1, 1, 10, 23, 16, 9, 2, 1, 1, 23, 10, 2, 2, 4, 7, 32, 25, 0, 6, 4, 7, 12, 25, 71, 14.76, 'Rural', 369, 647, NULL),
(951, 698, 2052, 1662, 704, 4927, 'Douz', 'Masculin', 12, 34, 127, 136, 71, 42, 23, 20, 34, 265, 297, 518, 177, 55, 195, 1123, 67, 13, 296, 147, 137, 146, 15.13, 2771, 66.27, 'Communal', 197, 1599, NULL),
(952, 698, 2185, 4126, 704, 5610, 'Douz', 'Féminin', 5, 23, 93, 216, 144, 53, 20, 10, 7, 195, 254, 12, 10, 6, 11, 416, 326, 10, 134, 74, 67, 6, 326, 917, 26.46, 'Communal', 197, 1599, NULL),
(953, 698, 949, 833, 704, 2100, 'Faouar', 'Masculin', 0, 24, 34, 44, 30, 22, 12, 17, 18, 96, 38, 351, 40, 151, 31, 386, 16, 15, 61, 19, 87, 12, 16.5, 1058, 60.33, 'Rural', 197, 1599, NULL),
(954, 698, 736, 2071, 704, 2434, 'Faouar', 'Féminin', 0, 3, 28, 58, 31, 8, 3, 0, 0, 31, 151, 5, 1, 10, 2, 50, 112, 1, 11, 3, 16, 0, 112, 231, 14.91, 'Rural', 197, 1599, NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `batch_job_execution`
--
ALTER TABLE `batch_job_execution`
  ADD CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `batch_job_instance` (`JOB_INSTANCE_ID`);

--
-- Contraintes pour la table `batch_job_execution_context`
--
ALTER TABLE `batch_job_execution_context`
  ADD CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`);

--
-- Contraintes pour la table `batch_job_execution_params`
--
ALTER TABLE `batch_job_execution_params`
  ADD CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`);

--
-- Contraintes pour la table `batch_step_execution`
--
ALTER TABLE `batch_step_execution`
  ADD CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `batch_job_execution` (`JOB_EXECUTION_ID`);

--
-- Contraintes pour la table `batch_step_execution_context`
--
ALTER TABLE `batch_step_execution_context`
  ADD CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `batch_step_execution` (`STEP_EXECUTION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
