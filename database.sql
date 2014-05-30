-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 22 mei 2014 om 10:57
-- Serverversie: 5.5.37
-- PHP-versie: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+01:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `c7185zrc_bg`
--
CREATE DATABASE `c7185zrc_bg` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c7185zrc_bg`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answerlists`
--

DROP TABLE IF EXISTS `answerlists`;
CREATE TABLE IF NOT EXISTS `answerlists` (
  `answer` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  KEY `question` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answers`
--

DROP TABLE IF EXISTS `answers`;
CREATE TABLE IF NOT EXISTS `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `nr` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `data`
--

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
  `userid` int(11) NOT NULL,
  `questionid` int(11) NOT NULL,
  `answerid` int(11) DEFAULT NULL,
  `answer` text,
  KEY `userid` (`userid`,`questionid`,`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `langs`
--

DROP TABLE IF EXISTS `langs`;
CREATE TABLE IF NOT EXISTS `langs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `flag` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- insert
--

INSERT INTO `langs` (`id`, `name`, `flag`) VALUES
(1, 'Nederlands', 'nl'),
(2, 'Français', 'fr'),
(3, 'English', 'en');



-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lists`
--

DROP TABLE IF EXISTS `lists`;
CREATE TABLE IF NOT EXISTS `lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `language` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `language_2` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionlist` int(11) NOT NULL,
  `nr` smallint(6) NOT NULL,
  `descr` text NOT NULL,
  `title` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionlist` (`questionlist`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `questionlists`
--

DROP TABLE IF EXISTS `questionlists`;
CREATE TABLE IF NOT EXISTS `questionlists` (
  `page` int(11) NOT NULL,
  `question` int(11) NOT NULL,
  KEY `page` (`page`),
  KEY `question` (`question`),
  KEY `question_2` (`question`),
  KEY `page_2` (`page`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `type` int(11) NOT NULL,
  `nr` int(11) NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `answers_possible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Gegevens worden uitgevoerd voor tabel `types`
--

INSERT INTO `types` (`id`, `type`, `answers_possible`) VALUES
(1, 'MESSAGE', 0),
(2, 'COMBOBOX', 1),
(3, 'RADIOBOX', 1),
(4, 'CHECKBOX', 1),
(5, 'TEXTINPUT', 0),
(6, 'DATEINPUT', 0),
(7, 'NUMBERINPUT', 0),
(8, 'TITLE', 0),
(9, 'LINEINPUT', 0),
(10, 'TIMEINPUT', 0);
