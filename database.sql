-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Machine: localhost
-- Genereertijd: 22 mei 2014 om 10:57
-- Serverversie: 5.5.37
-- PHP-versie: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


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
(9, 'LINEINPUT', 0);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `answerlists`
--
ALTER TABLE `answerlists`
  ADD CONSTRAINT `answerlists_ibfk_1` FOREIGN KEY (`question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `page_ibfk_1` FOREIGN KEY (`questionlist`) REFERENCES `lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `questionlists`
--
ALTER TABLE `questionlists`
  ADD CONSTRAINT `questionlists_ibfk_1` FOREIGN KEY (`page`) REFERENCES `page` (`id`) ON DELETE CASCADE;
--
-- Databank: `c7185zrc_book`
--
CREATE DATABASE `c7185zrc_book` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c7185zrc_book`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_layerslider`
--

DROP TABLE IF EXISTS `wp_layerslider`;
CREATE TABLE IF NOT EXISTS `wp_layerslider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `data` mediumtext NOT NULL,
  `date_c` int(10) NOT NULL,
  `date_m` int(11) NOT NULL,
  `flag_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `flag_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_options`
--

DROP TABLE IF EXISTS `wp_options`;
CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32395 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4824 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3731 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_termmeta`
--

DROP TABLE IF EXISTS `wp_termmeta`;
CREATE TABLE IF NOT EXISTS `wp_termmeta` (
  `meta_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=77 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `wp_users`
--

DROP TABLE IF EXISTS `wp_users`;
CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;
--
-- Databank: `c7185zrc_d0`
--
CREATE DATABASE `c7185zrc_d0` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c7185zrc_d0`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_admin_login_logs`
--

DROP TABLE IF EXISTS `d71b_admin_login_logs`;
CREATE TABLE IF NOT EXISTS `d71b_admin_login_logs` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_ip_address` varchar(46) NOT NULL DEFAULT '0.0.0.0',
  `admin_username` varchar(40) NOT NULL DEFAULT '',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_success` int(1) unsigned NOT NULL DEFAULT '0',
  `admin_post_details` text,
  PRIMARY KEY (`admin_id`),
  KEY `admin_ip_address` (`admin_ip_address`),
  KEY `admin_time` (`admin_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=81 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_admin_logs`
--

DROP TABLE IF EXISTS `d71b_admin_logs`;
CREATE TABLE IF NOT EXISTS `d71b_admin_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `ctime` int(10) DEFAULT '0',
  `note` text,
  `ip_address` varchar(46) DEFAULT NULL,
  `appcomponent` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(255) NOT NULL DEFAULT '',
  `do` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=612 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_admin_permission_rows`
--

DROP TABLE IF EXISTS `d71b_admin_permission_rows`;
CREATE TABLE IF NOT EXISTS `d71b_admin_permission_rows` (
  `row_id` int(8) NOT NULL,
  `row_id_type` varchar(13) NOT NULL DEFAULT 'member',
  `row_perm_cache` mediumtext,
  `row_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`row_id`,`row_id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_announcements`
--

DROP TABLE IF EXISTS `d71b_announcements`;
CREATE TABLE IF NOT EXISTS `d71b_announcements` (
  `announce_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `announce_title` varchar(255) NOT NULL DEFAULT '',
  `announce_post` text NOT NULL,
  `announce_forum` text,
  `announce_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `announce_html_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `announce_nlbr_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `announce_views` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_start` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_end` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_active` tinyint(1) NOT NULL DEFAULT '1',
  `announce_seo_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`announce_id`),
  KEY `announce_end` (`announce_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_api_log`
--

DROP TABLE IF EXISTS `d71b_api_log`;
CREATE TABLE IF NOT EXISTS `d71b_api_log` (
  `api_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_log_key` varchar(32) NOT NULL,
  `api_log_ip` varchar(46) NOT NULL,
  `api_log_date` int(10) NOT NULL,
  `api_log_query` text NOT NULL,
  `api_log_allowed` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`api_log_id`),
  KEY `api_log_date` (`api_log_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_api_users`
--

DROP TABLE IF EXISTS `d71b_api_users`;
CREATE TABLE IF NOT EXISTS `d71b_api_users` (
  `api_user_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `api_user_key` char(32) NOT NULL,
  `api_user_name` varchar(32) NOT NULL,
  `api_user_perms` text NOT NULL,
  `api_user_ip` varchar(46) NOT NULL,
  PRIMARY KEY (`api_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_attachments`
--

DROP TABLE IF EXISTS `d71b_attachments`;
CREATE TABLE IF NOT EXISTS `d71b_attachments` (
  `attach_id` int(10) NOT NULL AUTO_INCREMENT,
  `attach_ext` varchar(10) NOT NULL DEFAULT '',
  `attach_file` varchar(250) NOT NULL DEFAULT '',
  `attach_location` varchar(250) NOT NULL DEFAULT '',
  `attach_thumb_location` varchar(250) NOT NULL DEFAULT '',
  `attach_thumb_width` smallint(5) NOT NULL DEFAULT '0',
  `attach_thumb_height` smallint(5) NOT NULL DEFAULT '0',
  `attach_is_image` tinyint(1) NOT NULL DEFAULT '0',
  `attach_hits` int(10) NOT NULL DEFAULT '0',
  `attach_date` int(10) NOT NULL DEFAULT '0',
  `attach_post_key` varchar(32) NOT NULL DEFAULT '0',
  `attach_member_id` int(8) NOT NULL DEFAULT '0',
  `attach_filesize` int(10) NOT NULL DEFAULT '0',
  `attach_rel_id` int(10) NOT NULL DEFAULT '0',
  `attach_rel_module` varchar(100) NOT NULL DEFAULT '0',
  `attach_img_width` int(5) NOT NULL DEFAULT '0',
  `attach_img_height` int(5) NOT NULL DEFAULT '0',
  `attach_parent_id` int(11) NOT NULL DEFAULT '0',
  `attach_is_archived` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `attach_pid` (`attach_rel_id`),
  KEY `attach_post_key` (`attach_post_key`),
  KEY `attach_mid_size` (`attach_member_id`,`attach_rel_module`,`attach_filesize`),
  KEY `attach_parent_id` (`attach_parent_id`,`attach_rel_module`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_attachments_type`
--

DROP TABLE IF EXISTS `d71b_attachments_type`;
CREATE TABLE IF NOT EXISTS `d71b_attachments_type` (
  `atype_id` int(10) NOT NULL AUTO_INCREMENT,
  `atype_extension` varchar(18) NOT NULL DEFAULT '',
  `atype_mimetype` varchar(255) NOT NULL DEFAULT '',
  `atype_post` tinyint(1) NOT NULL DEFAULT '1',
  `atype_img` text,
  PRIMARY KEY (`atype_id`),
  KEY `atype` (`atype_post`),
  KEY `atype_extension` (`atype_extension`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_backup_log`
--

DROP TABLE IF EXISTS `d71b_backup_log`;
CREATE TABLE IF NOT EXISTS `d71b_backup_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_row_count` int(10) NOT NULL DEFAULT '0',
  `log_result` text,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_backup_queue`
--

DROP TABLE IF EXISTS `d71b_backup_queue`;
CREATE TABLE IF NOT EXISTS `d71b_backup_queue` (
  `queue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue_entry_date` int(10) NOT NULL DEFAULT '0',
  `queue_entry_type` int(1) NOT NULL DEFAULT '0',
  `queue_entry_table` varchar(255) NOT NULL DEFAULT '',
  `queue_entry_key` varchar(255) NOT NULL DEFAULT '',
  `queue_entry_value` varchar(255) NOT NULL DEFAULT '',
  `queue_entry_sql` mediumtext,
  PRIMARY KEY (`queue_id`),
  KEY `date` (`queue_entry_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_backup_vars`
--

DROP TABLE IF EXISTS `d71b_backup_vars`;
CREATE TABLE IF NOT EXISTS `d71b_backup_vars` (
  `backup_var_key` varchar(255) NOT NULL DEFAULT '',
  `backup_var_value` text,
  PRIMARY KEY (`backup_var_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_badwords`
--

DROP TABLE IF EXISTS `d71b_badwords`;
CREATE TABLE IF NOT EXISTS `d71b_badwords` (
  `wid` int(3) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL DEFAULT '',
  `swop` varchar(250) DEFAULT NULL,
  `m_exact` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_banfilters`
--

DROP TABLE IF EXISTS `d71b_banfilters`;
CREATE TABLE IF NOT EXISTS `d71b_banfilters` (
  `ban_id` int(10) NOT NULL AUTO_INCREMENT,
  `ban_type` varchar(10) NOT NULL DEFAULT 'ip',
  `ban_content` text,
  `ban_date` int(10) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `ban_content` (`ban_content`(200))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_bbcode_mediatag`
--

DROP TABLE IF EXISTS `d71b_bbcode_mediatag`;
CREATE TABLE IF NOT EXISTS `d71b_bbcode_mediatag` (
  `mediatag_id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `mediatag_name` varchar(255) NOT NULL,
  `mediatag_match` text,
  `mediatag_replace` text,
  `mediatag_position` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mediatag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_bulk_mail`
--

DROP TABLE IF EXISTS `d71b_bulk_mail`;
CREATE TABLE IF NOT EXISTS `d71b_bulk_mail` (
  `mail_id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mail_content` mediumtext NOT NULL,
  `mail_groups` mediumtext,
  `mail_opts` mediumtext,
  `mail_start` int(10) NOT NULL DEFAULT '0',
  `mail_updated` int(10) NOT NULL DEFAULT '0',
  `mail_sentto` int(10) NOT NULL DEFAULT '0',
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_pergo` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_id`),
  KEY `mail_start` (`mail_start`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_cache_simple`
--

DROP TABLE IF EXISTS `d71b_cache_simple`;
CREATE TABLE IF NOT EXISTS `d71b_cache_simple` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_perm_key` varchar(32) NOT NULL DEFAULT '',
  `cache_time` int(10) NOT NULL DEFAULT '0',
  `cache_data` mediumtext,
  UNIQUE KEY `lookup` (`cache_id`,`cache_perm_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_cache_store`
--

DROP TABLE IF EXISTS `d71b_cache_store`;
CREATE TABLE IF NOT EXISTS `d71b_cache_store` (
  `cs_key` varchar(255) NOT NULL DEFAULT '',
  `cs_value` mediumtext,
  `cs_array` tinyint(1) NOT NULL DEFAULT '0',
  `cs_updated` int(10) NOT NULL DEFAULT '0',
  `cs_rebuild` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cs_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_captcha`
--

DROP TABLE IF EXISTS `d71b_captcha`;
CREATE TABLE IF NOT EXISTS `d71b_captcha` (
  `captcha_unique_id` varchar(32) NOT NULL DEFAULT '',
  `captcha_string` varchar(100) NOT NULL DEFAULT '',
  `captcha_ipaddress` varchar(46) NOT NULL DEFAULT '',
  `captcha_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`captcha_unique_id`),
  KEY `captcha_date` (`captcha_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_attachments_map`
--

DROP TABLE IF EXISTS `d71b_ccs_attachments_map`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_attachments_map` (
  `map_id` int(11) NOT NULL AUTO_INCREMENT,
  `map_attach_id` int(11) NOT NULL DEFAULT '0',
  `map_database_id` mediumint(9) NOT NULL DEFAULT '0',
  `map_field_id` int(11) NOT NULL DEFAULT '0',
  `map_record_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`),
  KEY `map_database_id` (`map_database_id`,`map_record_id`),
  KEY `map_attach_id` (`map_attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_block_wizard`
--

DROP TABLE IF EXISTS `d71b_ccs_block_wizard`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_block_wizard` (
  `wizard_id` varchar(32) NOT NULL,
  `wizard_step` smallint(6) NOT NULL DEFAULT '0',
  `wizard_type` varchar(32) DEFAULT NULL,
  `wizard_name` varchar(255) DEFAULT NULL,
  `wizard_config` longtext,
  `wizard_started` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wizard_id`),
  KEY `wizard_started` (`wizard_started`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_blocks`
--

DROP TABLE IF EXISTS `d71b_ccs_blocks`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_blocks` (
  `block_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `block_active` tinyint(1) NOT NULL DEFAULT '0',
  `block_name` varchar(255) NOT NULL,
  `block_description` text,
  `block_key` varchar(255) NOT NULL,
  `block_template` int(11) NOT NULL DEFAULT '0',
  `block_type` varchar(32) NOT NULL,
  `block_config` text,
  `block_content` mediumtext,
  `block_cache_ttl` varchar(10) NOT NULL DEFAULT '0',
  `block_cache_last` int(11) NOT NULL DEFAULT '0',
  `block_cache_output` mediumtext,
  `block_position` mediumint(9) NOT NULL DEFAULT '0',
  `block_category` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`block_id`),
  KEY `block_cache_ttl` (`block_cache_ttl`),
  KEY `block_active` (`block_active`),
  KEY `block_key` (`block_key`),
  KEY `block_category` (`block_category`),
  KEY `block_template` (`block_template`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_containers`
--

DROP TABLE IF EXISTS `d71b_ccs_containers`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_containers` (
  `container_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_name` varchar(255) DEFAULT NULL,
  `container_type` varchar(32) NOT NULL,
  `container_order` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`container_id`),
  KEY `container_type` (`container_type`,`container_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_custom_database_1`
--

DROP TABLE IF EXISTS `d71b_ccs_custom_database_1`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_custom_database_1` (
  `primary_id_field` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `record_saved` int(10) NOT NULL DEFAULT '0',
  `record_updated` int(10) NOT NULL DEFAULT '0',
  `post_key` varchar(32) NOT NULL DEFAULT '0',
  `rating_real` smallint(6) NOT NULL DEFAULT '0',
  `rating_hits` mediumint(9) NOT NULL DEFAULT '0',
  `rating_value` mediumint(9) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `record_locked` tinyint(1) NOT NULL DEFAULT '0',
  `record_comments` mediumint(9) NOT NULL DEFAULT '0',
  `record_comments_queued` mediumint(9) NOT NULL DEFAULT '0',
  `record_views` mediumint(9) NOT NULL DEFAULT '0',
  `record_approved` tinyint(1) NOT NULL DEFAULT '0',
  `record_pinned` tinyint(1) NOT NULL DEFAULT '0',
  `record_dynamic_furl` varchar(255) DEFAULT NULL,
  `record_static_furl` varchar(255) DEFAULT NULL,
  `record_meta_keywords` text,
  `record_meta_description` text,
  `record_template` int(11) NOT NULL DEFAULT '0',
  `record_topicid` int(11) NOT NULL DEFAULT '0',
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  PRIMARY KEY (`primary_id_field`),
  KEY `record_approved` (`record_approved`),
  KEY `record_static_furl` (`record_static_furl`),
  KEY `record_topicid` (`record_topicid`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_categories`
--

DROP TABLE IF EXISTS `d71b_ccs_database_categories`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_database_id` mediumint(9) NOT NULL DEFAULT '0',
  `category_name` varchar(255) DEFAULT NULL,
  `category_parent_id` int(11) NOT NULL DEFAULT '0',
  `category_last_record_id` int(11) NOT NULL DEFAULT '0',
  `category_last_record_date` int(11) NOT NULL DEFAULT '0',
  `category_last_record_member` int(11) NOT NULL DEFAULT '0',
  `category_last_record_name` varchar(255) DEFAULT NULL,
  `category_last_record_seo_name` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_position` int(11) NOT NULL DEFAULT '0',
  `category_records` int(11) NOT NULL DEFAULT '0',
  `category_records_queued` int(11) NOT NULL DEFAULT '0',
  `category_record_comments` int(11) NOT NULL DEFAULT '0',
  `category_record_comments_queued` int(11) NOT NULL DEFAULT '0',
  `category_has_perms` tinyint(1) NOT NULL DEFAULT '0',
  `category_show_records` tinyint(1) NOT NULL DEFAULT '1',
  `category_rss` int(11) NOT NULL DEFAULT '0',
  `category_rss_cache` mediumtext,
  `category_rss_cached` int(11) NOT NULL DEFAULT '0',
  `category_rss_exclude` tinyint(4) NOT NULL DEFAULT '0',
  `category_furl_name` varchar(255) DEFAULT NULL,
  `category_meta_keywords` text,
  `category_meta_description` text,
  `category_template` int(11) NOT NULL DEFAULT '0',
  `category_forum_override` tinyint(1) NOT NULL DEFAULT '0',
  `category_forum_record` tinyint(1) NOT NULL DEFAULT '0',
  `category_forum_comments` tinyint(1) NOT NULL DEFAULT '0',
  `category_forum_delete` tinyint(1) NOT NULL DEFAULT '0',
  `category_forum_forum` mediumint(9) NOT NULL DEFAULT '0',
  `category_forum_prefix` varchar(255) DEFAULT NULL,
  `category_forum_suffix` varchar(255) DEFAULT NULL,
  `category_page_title` varchar(255) DEFAULT NULL,
  `category_tags_override` tinyint(4) NOT NULL DEFAULT '0',
  `category_tags_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `category_tags_noprefixes` tinyint(4) NOT NULL DEFAULT '0',
  `category_tags_predefined` text,
  PRIMARY KEY (`category_id`),
  KEY `category_database_id` (`category_database_id`),
  KEY `category_template` (`category_template`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_comments`
--

DROP TABLE IF EXISTS `d71b_ccs_database_comments`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user` int(11) NOT NULL DEFAULT '0',
  `comment_database_id` mediumint(9) NOT NULL DEFAULT '0',
  `comment_record_id` int(11) NOT NULL DEFAULT '0',
  `comment_date` int(11) NOT NULL DEFAULT '0',
  `comment_ip_address` varchar(46) NOT NULL DEFAULT '0',
  `comment_post` text,
  `comment_approved` tinyint(1) NOT NULL DEFAULT '0',
  `comment_author` varchar(255) DEFAULT NULL,
  `comment_edit_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `comment_user` (`comment_user`),
  KEY `comment_database_id` (`comment_database_id`,`comment_record_id`,`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_fields`
--

DROP TABLE IF EXISTS `d71b_ccs_database_fields`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_fields` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_database_id` mediumint(9) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `field_description` text,
  `field_key` varchar(255) NOT NULL,
  `field_type` varchar(255) DEFAULT NULL,
  `field_required` tinyint(1) NOT NULL DEFAULT '0',
  `field_user_editable` tinyint(1) NOT NULL DEFAULT '0',
  `field_position` int(11) NOT NULL DEFAULT '0',
  `field_max_length` mediumint(9) NOT NULL DEFAULT '0',
  `field_extra` text,
  `field_html` tinyint(4) NOT NULL DEFAULT '0',
  `field_is_numeric` tinyint(1) NOT NULL DEFAULT '0',
  `field_truncate` mediumint(9) NOT NULL DEFAULT '100',
  `field_default_value` text,
  `field_display_listing` tinyint(1) NOT NULL DEFAULT '1',
  `field_display_display` tinyint(1) NOT NULL DEFAULT '1',
  `field_format_opts` text,
  `field_validator` text,
  `field_topic_format` text,
  PRIMARY KEY (`field_id`),
  KEY `field_database_id` (`field_database_id`),
  KEY `field_key` (`field_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_moderators`
--

DROP TABLE IF EXISTS `d71b_ccs_database_moderators`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_moderators` (
  `moderator_id` int(11) NOT NULL AUTO_INCREMENT,
  `moderator_database_id` int(11) NOT NULL DEFAULT '0',
  `moderator_type` varchar(16) DEFAULT NULL,
  `moderator_type_id` int(11) NOT NULL DEFAULT '0',
  `moderator_delete_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_edit_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_lock_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_unlock_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_delete_comment` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_approve_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_approve_comment` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_pin_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_add_record` tinyint(1) NOT NULL DEFAULT '0',
  `moderator_edit_comment` tinyint(4) NOT NULL DEFAULT '0',
  `moderator_restore_revision` tinyint(4) NOT NULL DEFAULT '0',
  `moderator_extras` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moderator_id`),
  KEY `moderator_database_id` (`moderator_database_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_modqueue`
--

DROP TABLE IF EXISTS `d71b_ccs_database_modqueue`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_modqueue` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_database` int(11) NOT NULL DEFAULT '0',
  `mod_record` int(11) NOT NULL DEFAULT '0',
  `mod_comment` int(11) NOT NULL DEFAULT '0',
  `mod_poster` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mod_id`),
  KEY `mod_database` (`mod_database`,`mod_record`,`mod_comment`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_ratings`
--

DROP TABLE IF EXISTS `d71b_ccs_database_ratings`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating_user_id` int(11) NOT NULL DEFAULT '0',
  `rating_database_id` mediumint(9) NOT NULL DEFAULT '0',
  `rating_record_id` int(11) NOT NULL DEFAULT '0',
  `rating_rating` int(11) NOT NULL DEFAULT '0',
  `rating_added` int(11) NOT NULL DEFAULT '0',
  `rating_ip_address` varchar(46) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  KEY `rating_user_id` (`rating_user_id`,`rating_database_id`,`rating_record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_database_revisions`
--

DROP TABLE IF EXISTS `d71b_ccs_database_revisions`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_database_revisions` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_database_id` mediumint(9) NOT NULL,
  `revision_record_id` int(11) NOT NULL,
  `revision_data` longtext,
  `revision_date` varchar(13) NOT NULL DEFAULT '0',
  `revision_member_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`revision_id`),
  KEY `revision_database_id` (`revision_database_id`,`revision_record_id`),
  KEY `revision_member_id` (`revision_member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_databases`
--

DROP TABLE IF EXISTS `d71b_ccs_databases`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_databases` (
  `database_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `database_name` varchar(255) NOT NULL,
  `database_key` varchar(255) NOT NULL,
  `database_database` varchar(255) DEFAULT NULL,
  `database_description` text,
  `database_field_count` mediumint(9) NOT NULL DEFAULT '0',
  `database_record_count` mediumint(9) NOT NULL DEFAULT '0',
  `database_template_listing` mediumint(9) NOT NULL DEFAULT '0',
  `database_template_display` mediumint(9) NOT NULL DEFAULT '0',
  `database_template_categories` mediumint(9) NOT NULL DEFAULT '0',
  `database_all_editable` tinyint(1) NOT NULL DEFAULT '0',
  `database_revisions` tinyint(1) NOT NULL DEFAULT '0',
  `database_field_title` varchar(255) DEFAULT NULL,
  `database_field_sort` varchar(255) DEFAULT NULL,
  `database_field_direction` varchar(4) NOT NULL DEFAULT 'desc',
  `database_field_perpage` smallint(6) NOT NULL DEFAULT '25',
  `database_comment_approve` tinyint(1) NOT NULL DEFAULT '0',
  `database_record_approve` tinyint(1) NOT NULL DEFAULT '0',
  `database_rss` int(11) NOT NULL DEFAULT '0',
  `database_rss_cache` mediumtext,
  `database_rss_cached` int(11) NOT NULL DEFAULT '0',
  `database_field_content` varchar(255) DEFAULT NULL,
  `database_lang_sl` varchar(255) NOT NULL DEFAULT '',
  `database_lang_pl` varchar(255) NOT NULL DEFAULT '',
  `database_lang_su` varchar(255) NOT NULL DEFAULT '',
  `database_lang_pu` varchar(255) NOT NULL DEFAULT '',
  `database_comment_bump` tinyint(1) NOT NULL DEFAULT '0',
  `database_featured_article` int(11) NOT NULL DEFAULT '0',
  `database_is_articles` tinyint(1) NOT NULL DEFAULT '0',
  `database_forum_record` tinyint(1) NOT NULL DEFAULT '0',
  `database_forum_comments` tinyint(1) NOT NULL DEFAULT '0',
  `database_forum_delete` tinyint(1) NOT NULL DEFAULT '0',
  `database_forum_forum` mediumint(9) NOT NULL DEFAULT '0',
  `database_forum_prefix` varchar(255) DEFAULT NULL,
  `database_forum_suffix` varchar(255) DEFAULT NULL,
  `database_search` tinyint(1) NOT NULL DEFAULT '0',
  `database_tags_enabled` tinyint(4) NOT NULL DEFAULT '0',
  `database_tags_noprefixes` tinyint(4) NOT NULL DEFAULT '0',
  `database_tags_predefined` text,
  PRIMARY KEY (`database_id`),
  UNIQUE KEY `database_key` (`database_key`),
  KEY `database_is_articles` (`database_is_articles`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_folders`
--

DROP TABLE IF EXISTS `d71b_ccs_folders`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_folders` (
  `folder_path` text,
  `last_modified` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_menus`
--

DROP TABLE IF EXISTS `d71b_ccs_menus`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_menus` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent_id` int(11) NOT NULL DEFAULT '0',
  `menu_title` varchar(255) DEFAULT NULL,
  `menu_url` text,
  `menu_submenu` int(11) NOT NULL DEFAULT '0',
  `menu_position` varchar(255) NOT NULL DEFAULT '0',
  `menu_description` text,
  `menu_attributes` text,
  `menu_permissions` text,
  PRIMARY KEY (`menu_id`),
  KEY `menu_parent_id` (`menu_parent_id`,`menu_position`),
  KEY `menu_position` (`menu_position`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_page_templates`
--

DROP TABLE IF EXISTS `d71b_ccs_page_templates`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_page_templates` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) DEFAULT NULL,
  `template_desc` text,
  `template_key` varchar(32) NOT NULL,
  `template_content` mediumtext NOT NULL,
  `template_updated` int(11) NOT NULL DEFAULT '0',
  `template_position` mediumint(9) NOT NULL DEFAULT '0',
  `template_category` mediumint(9) NOT NULL DEFAULT '0',
  `template_database` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `template_key` (`template_key`),
  KEY `template_category` (`template_category`),
  KEY `template_database` (`template_database`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_page_wizard`
--

DROP TABLE IF EXISTS `d71b_ccs_page_wizard`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_page_wizard` (
  `wizard_id` varchar(32) NOT NULL,
  `wizard_step` smallint(6) NOT NULL DEFAULT '0',
  `wizard_edit_id` int(11) NOT NULL DEFAULT '0',
  `wizard_name` varchar(255) DEFAULT NULL,
  `wizard_folder` varchar(255) DEFAULT NULL,
  `wizard_type` varchar(32) DEFAULT NULL,
  `wizard_template` int(11) NOT NULL DEFAULT '0',
  `wizard_content` mediumtext,
  `wizard_cache_ttl` varchar(10) NOT NULL DEFAULT '0',
  `wizard_perms` text,
  `wizard_seo_name` varchar(255) DEFAULT NULL,
  `wizard_content_only` tinyint(1) NOT NULL DEFAULT '0',
  `wizard_meta_keywords` text,
  `wizard_meta_description` text,
  `wizard_started` int(11) NOT NULL DEFAULT '0',
  `wizard_previous_type` varchar(32) DEFAULT NULL,
  `wizard_ipb_wrapper` tinyint(1) NOT NULL DEFAULT '0',
  `wizard_omit_filename` tinyint(1) NOT NULL DEFAULT '0',
  `wizard_page_title` varchar(255) DEFAULT NULL,
  `wizard_page_quicknav` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`wizard_id`),
  KEY `wizard_started` (`wizard_started`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_pages`
--

DROP TABLE IF EXISTS `d71b_ccs_pages`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_name` varchar(255) DEFAULT NULL,
  `page_seo_name` varchar(255) DEFAULT NULL,
  `page_folder` varchar(255) DEFAULT NULL,
  `page_type` varchar(32) DEFAULT NULL,
  `page_last_edited` int(11) NOT NULL DEFAULT '0',
  `page_template_used` int(11) NOT NULL DEFAULT '0',
  `page_content` mediumtext,
  `page_cache` mediumtext,
  `page_view_perms` text,
  `page_cache_ttl` varchar(10) NOT NULL DEFAULT '0',
  `page_cache_last` int(11) NOT NULL DEFAULT '0',
  `page_content_only` tinyint(1) NOT NULL DEFAULT '0',
  `page_meta_keywords` text,
  `page_meta_description` text,
  `page_content_type` varchar(32) NOT NULL DEFAULT 'page',
  `page_template` mediumtext,
  `page_ipb_wrapper` tinyint(1) NOT NULL DEFAULT '0',
  `page_omit_filename` tinyint(1) NOT NULL DEFAULT '0',
  `page_title` varchar(255) DEFAULT NULL,
  `page_quicknav` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`page_id`),
  KEY `page_seo_name` (`page_seo_name`(100),`page_folder`(100)),
  KEY `page_template_used` (`page_template_used`),
  KEY `page_folder` (`page_folder`),
  KEY `page_content_type` (`page_content_type`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_revisions`
--

DROP TABLE IF EXISTS `d71b_ccs_revisions`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_revisions` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_type` varchar(32) NOT NULL,
  `revision_type_id` int(11) NOT NULL,
  `revision_content` mediumtext,
  `revision_other` mediumtext,
  `revision_date` int(11) NOT NULL DEFAULT '0',
  `revision_member` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`revision_id`),
  KEY `revision_type` (`revision_type`,`revision_type_id`,`revision_date`),
  KEY `revision_member` (`revision_member`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_slug_memory`
--

DROP TABLE IF EXISTS `d71b_ccs_slug_memory`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_slug_memory` (
  `memory_id` int(11) NOT NULL AUTO_INCREMENT,
  `memory_url` varchar(255) DEFAULT NULL,
  `memory_type` varchar(32) DEFAULT NULL,
  `memory_type_id` int(11) NOT NULL DEFAULT '0',
  `memory_type_id_2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`memory_id`),
  KEY `memory_url` (`memory_url`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_template_blocks`
--

DROP TABLE IF EXISTS `d71b_ccs_template_blocks`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_template_blocks` (
  `tpb_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpb_name` varchar(255) DEFAULT NULL,
  `tpb_params` text,
  `tpb_content` mediumtext,
  `tpb_human_name` varchar(255) DEFAULT NULL,
  `tpb_app_type` varchar(30) DEFAULT NULL,
  `tpb_content_type` varchar(30) DEFAULT NULL,
  `tpb_image` varchar(255) DEFAULT NULL,
  `tpb_position` int(11) NOT NULL DEFAULT '0',
  `tpb_protected` tinyint(4) NOT NULL DEFAULT '0',
  `tpb_desc` text,
  PRIMARY KEY (`tpb_id`),
  KEY `tpb_name` (`tpb_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ccs_template_cache`
--

DROP TABLE IF EXISTS `d71b_ccs_template_cache`;
CREATE TABLE IF NOT EXISTS `d71b_ccs_template_cache` (
  `cache_id` int(11) NOT NULL AUTO_INCREMENT,
  `cache_type` varchar(16) NOT NULL,
  `cache_type_id` int(11) NOT NULL DEFAULT '0',
  `cache_content` mediumtext,
  PRIMARY KEY (`cache_id`),
  UNIQUE KEY `cache_type` (`cache_type`,`cache_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_content_cache_posts`
--

DROP TABLE IF EXISTS `d71b_content_cache_posts`;
CREATE TABLE IF NOT EXISTS `d71b_content_cache_posts` (
  `cache_content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_content` mediumtext,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_content_id`),
  KEY `date_index` (`cache_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_content_cache_sigs`
--

DROP TABLE IF EXISTS `d71b_content_cache_sigs`;
CREATE TABLE IF NOT EXISTS `d71b_content_cache_sigs` (
  `cache_content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_content` mediumtext,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_content_id`),
  KEY `date_index` (`cache_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_applications`
--

DROP TABLE IF EXISTS `d71b_core_applications`;
CREATE TABLE IF NOT EXISTS `d71b_core_applications` (
  `app_id` int(10) NOT NULL AUTO_INCREMENT,
  `app_title` varchar(255) NOT NULL DEFAULT '',
  `app_public_title` varchar(255) NOT NULL DEFAULT '',
  `app_description` varchar(255) NOT NULL DEFAULT '',
  `app_author` varchar(255) NOT NULL DEFAULT '',
  `app_version` varchar(255) NOT NULL DEFAULT '',
  `app_long_version` int(10) NOT NULL DEFAULT '10000',
  `app_directory` varchar(255) NOT NULL DEFAULT '',
  `app_added` int(10) NOT NULL DEFAULT '0',
  `app_position` int(2) NOT NULL DEFAULT '0',
  `app_protected` int(1) NOT NULL DEFAULT '0',
  `app_enabled` int(1) NOT NULL DEFAULT '0',
  `app_location` varchar(32) NOT NULL DEFAULT '',
  `app_hide_tab` tinyint(1) NOT NULL DEFAULT '0',
  `app_tab_groups` text,
  `app_website` varchar(255) DEFAULT NULL,
  `app_update_check` varchar(255) DEFAULT NULL,
  `app_global_caches` varchar(255) DEFAULT NULL,
  `app_tab_attributes` text,
  `app_tab_description` text,
  PRIMARY KEY (`app_id`),
  KEY `app_directory` (`app_directory`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_archive_log`
--

DROP TABLE IF EXISTS `d71b_core_archive_log`;
CREATE TABLE IF NOT EXISTS `d71b_core_archive_log` (
  `archlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `archlog_app` varchar(255) NOT NULL DEFAULT '0',
  `archlog_date` int(10) NOT NULL DEFAULT '0',
  `archlog_ids` mediumtext,
  `archlog_count` int(10) NOT NULL DEFAULT '0',
  `archlog_is_restore` int(1) NOT NULL DEFAULT '0',
  `archlog_is_error` int(1) NOT NULL DEFAULT '0',
  `archlog_msg` text,
  PRIMARY KEY (`archlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_archive_restore`
--

DROP TABLE IF EXISTS `d71b_core_archive_restore`;
CREATE TABLE IF NOT EXISTS `d71b_core_archive_restore` (
  `restore_min_tid` int(10) NOT NULL DEFAULT '0',
  `restore_max_tid` int(10) NOT NULL DEFAULT '0',
  `restore_manual_tids` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_archive_rules`
--

DROP TABLE IF EXISTS `d71b_core_archive_rules`;
CREATE TABLE IF NOT EXISTS `d71b_core_archive_rules` (
  `archive_key` char(32) NOT NULL DEFAULT '',
  `archive_app` varchar(32) NOT NULL DEFAULT 'core',
  `archive_field` varchar(255) NOT NULL DEFAULT '',
  `archive_value` varchar(255) NOT NULL DEFAULT '',
  `archive_text` text NOT NULL,
  `archive_unit` varchar(255) NOT NULL DEFAULT '',
  `archive_skip` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`archive_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_editor_autosave`
--

DROP TABLE IF EXISTS `d71b_core_editor_autosave`;
CREATE TABLE IF NOT EXISTS `d71b_core_editor_autosave` (
  `eas_key` char(32) NOT NULL,
  `eas_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `eas_app` varchar(50) NOT NULL DEFAULT '',
  `eas_section` varchar(100) NOT NULL DEFAULT '',
  `eas_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `eas_content` mediumtext,
  UNIQUE KEY `eas_key` (`eas_key`),
  KEY `eas_member_lookup` (`eas_member_id`,`eas_app`,`eas_section`),
  KEY `eas_updated` (`eas_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_geolocation_cache`
--

DROP TABLE IF EXISTS `d71b_core_geolocation_cache`;
CREATE TABLE IF NOT EXISTS `d71b_core_geolocation_cache` (
  `geocache_key` varchar(32) NOT NULL,
  `geocache_lat` varchar(100) NOT NULL,
  `geocache_lon` varchar(100) NOT NULL,
  `geocache_raw` text,
  `geocache_country` varchar(255) NOT NULL DEFAULT '',
  `geocache_district` varchar(255) NOT NULL DEFAULT '',
  `geocache_district2` varchar(255) NOT NULL DEFAULT '',
  `geocache_locality` varchar(255) NOT NULL DEFAULT '',
  `geocache_type` varchar(255) NOT NULL DEFAULT '',
  `geocache_engine` varchar(255) NOT NULL DEFAULT '',
  `geocache_added` int(10) NOT NULL DEFAULT '0',
  `geocache_short` text,
  PRIMARY KEY (`geocache_key`),
  KEY `geo_lat_lon` (`geocache_lat`,`geocache_lon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_hooks`
--

DROP TABLE IF EXISTS `d71b_core_hooks`;
CREATE TABLE IF NOT EXISTS `d71b_core_hooks` (
  `hook_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `hook_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `hook_name` varchar(255) DEFAULT NULL,
  `hook_desc` text,
  `hook_author` varchar(255) DEFAULT NULL,
  `hook_email` varchar(255) DEFAULT NULL,
  `hook_website` text,
  `hook_update_check` text,
  `hook_requirements` text,
  `hook_version_human` varchar(32) DEFAULT NULL,
  `hook_version_long` varchar(32) NOT NULL DEFAULT '0',
  `hook_installed` int(11) NOT NULL DEFAULT '0',
  `hook_updated` int(11) NOT NULL DEFAULT '0',
  `hook_position` mediumint(9) NOT NULL DEFAULT '0',
  `hook_extra_data` text,
  `hook_key` varchar(128) DEFAULT NULL,
  `hook_global_caches` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hook_id`),
  KEY `hook_enabled` (`hook_enabled`,`hook_position`),
  KEY `hook_key` (`hook_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_hooks_files`
--

DROP TABLE IF EXISTS `d71b_core_hooks_files`;
CREATE TABLE IF NOT EXISTS `d71b_core_hooks_files` (
  `hook_file_id` int(10) NOT NULL AUTO_INCREMENT,
  `hook_hook_id` int(10) NOT NULL DEFAULT '0',
  `hook_file_stored` varchar(255) DEFAULT NULL,
  `hook_file_real` varchar(255) DEFAULT NULL,
  `hook_type` varchar(32) DEFAULT NULL,
  `hook_classname` varchar(255) DEFAULT NULL,
  `hook_data` text,
  `hooks_source` longtext,
  PRIMARY KEY (`hook_file_id`),
  KEY `hook_hook_id` (`hook_hook_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_incoming_email_log`
--

DROP TABLE IF EXISTS `d71b_core_incoming_email_log`;
CREATE TABLE IF NOT EXISTS `d71b_core_incoming_email_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_email` varchar(255) DEFAULT NULL,
  `log_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_incoming_emails`
--

DROP TABLE IF EXISTS `d71b_core_incoming_emails`;
CREATE TABLE IF NOT EXISTS `d71b_core_incoming_emails` (
  `rule_id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_criteria_field` varchar(4) NOT NULL,
  `rule_criteria_type` varchar(4) NOT NULL,
  `rule_criteria_value` text NOT NULL,
  `rule_app` varchar(255) NOT NULL,
  `rule_added_by` mediumint(8) NOT NULL,
  `rule_added_date` int(10) NOT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_inline_messages`
--

DROP TABLE IF EXISTS `d71b_core_inline_messages`;
CREATE TABLE IF NOT EXISTS `d71b_core_inline_messages` (
  `inline_msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `inline_msg_date` int(10) NOT NULL DEFAULT '0',
  `inline_msg_content` text,
  PRIMARY KEY (`inline_msg_id`),
  KEY `inline_msg_date` (`inline_msg_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=226 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_item_markers`
--

DROP TABLE IF EXISTS `d71b_core_item_markers`;
CREATE TABLE IF NOT EXISTS `d71b_core_item_markers` (
  `item_key` char(32) NOT NULL,
  `item_member_id` int(8) NOT NULL DEFAULT '0',
  `item_app` varchar(255) NOT NULL DEFAULT 'core',
  `item_last_update` int(10) NOT NULL DEFAULT '0',
  `item_last_saved` int(10) NOT NULL DEFAULT '0',
  `item_unread_count` int(5) NOT NULL DEFAULT '0',
  `item_read_array` mediumtext,
  `item_global_reset` int(10) NOT NULL DEFAULT '0',
  `item_app_key_1` int(10) NOT NULL DEFAULT '0',
  `item_app_key_2` int(10) NOT NULL DEFAULT '0',
  `item_app_key_3` int(10) NOT NULL DEFAULT '0',
  `item_is_deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `combo_key` (`item_key`,`item_member_id`,`item_app`),
  KEY `marker_index` (`item_member_id`,`item_app`,`item_app_key_1`),
  KEY `item_last_saved` (`item_last_saved`),
  KEY `item_member_id` (`item_is_deleted`,`item_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_item_markers_storage`
--

DROP TABLE IF EXISTS `d71b_core_item_markers_storage`;
CREATE TABLE IF NOT EXISTS `d71b_core_item_markers_storage` (
  `item_member_id` int(8) NOT NULL DEFAULT '0',
  `item_markers` mediumtext,
  `item_last_updated` int(10) NOT NULL DEFAULT '0',
  `item_last_saved` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_member_id`),
  KEY `item_last_saved` (`item_last_saved`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_like`
--

DROP TABLE IF EXISTS `d71b_core_like`;
CREATE TABLE IF NOT EXISTS `d71b_core_like` (
  `like_id` varchar(32) NOT NULL DEFAULT '',
  `like_lookup_id` varchar(32) DEFAULT NULL,
  `like_lookup_area` varchar(32) NOT NULL DEFAULT '',
  `like_app` varchar(150) NOT NULL DEFAULT '',
  `like_area` varchar(200) NOT NULL DEFAULT '',
  `like_rel_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `like_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `like_is_anon` int(1) NOT NULL DEFAULT '0',
  `like_added` int(10) unsigned NOT NULL DEFAULT '0',
  `like_notify_do` int(1) NOT NULL DEFAULT '0',
  `like_notify_meta` text,
  `like_notify_freq` varchar(200) NOT NULL DEFAULT '',
  `like_notify_sent` int(10) unsigned NOT NULL DEFAULT '0',
  `like_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`like_id`),
  KEY `find_rel_likes` (`like_lookup_id`,`like_visible`,`like_is_anon`,`like_added`),
  KEY `like_member_id` (`like_member_id`,`like_visible`,`like_added`),
  KEY `notification_task` (`like_notify_do`,`like_app`(50),`like_area`(50),`like_visible`,`like_notify_sent`,`like_notify_freq`(50)),
  KEY `like_lookup_area` (`like_lookup_area`,`like_visible`,`like_added`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_like_cache`
--

DROP TABLE IF EXISTS `d71b_core_like_cache`;
CREATE TABLE IF NOT EXISTS `d71b_core_like_cache` (
  `like_cache_id` varchar(32) NOT NULL DEFAULT '',
  `like_cache_app` varchar(150) NOT NULL DEFAULT '',
  `like_cache_area` varchar(200) NOT NULL DEFAULT '',
  `like_cache_rel_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `like_cache_data` text,
  `like_cache_expire` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`like_cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_rss_imported`
--

DROP TABLE IF EXISTS `d71b_core_rss_imported`;
CREATE TABLE IF NOT EXISTS `d71b_core_rss_imported` (
  `rss_guid` char(32) NOT NULL,
  `rss_foreign_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`rss_guid`),
  KEY `rss_grabber` (`rss_guid`,`rss_foreign_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_share_links`
--

DROP TABLE IF EXISTS `d71b_core_share_links`;
CREATE TABLE IF NOT EXISTS `d71b_core_share_links` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_title` varchar(255) NOT NULL DEFAULT '',
  `share_key` varchar(50) NOT NULL DEFAULT '',
  `share_enabled` int(1) NOT NULL DEFAULT '0',
  `share_position` int(3) NOT NULL DEFAULT '0',
  `share_canonical` int(1) NOT NULL DEFAULT '1',
  `share_groups` text,
  PRIMARY KEY (`share_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_share_links_log`
--

DROP TABLE IF EXISTS `d71b_core_share_links_log`;
CREATE TABLE IF NOT EXISTS `d71b_core_share_links_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `log_date` int(10) NOT NULL DEFAULT '0',
  `log_member_id` int(10) NOT NULL DEFAULT '0',
  `log_url` text,
  `log_title` text,
  `log_share_key` varchar(50) NOT NULL DEFAULT '',
  `log_data_app` varchar(50) NOT NULL DEFAULT '',
  `log_data_type` varchar(50) NOT NULL DEFAULT '',
  `log_data_primary_id` int(10) NOT NULL DEFAULT '0',
  `log_data_secondary_id` int(10) NOT NULL DEFAULT '0',
  `log_ip_address` varchar(46) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `findstuff` (`log_data_app`,`log_data_type`,`log_data_primary_id`),
  KEY `log_date` (`log_date`),
  KEY `log_member_id` (`log_member_id`),
  KEY `log_share_key` (`log_share_key`),
  KEY `log_ip_address` (`log_ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12905 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_soft_delete_log`
--

DROP TABLE IF EXISTS `d71b_core_soft_delete_log`;
CREATE TABLE IF NOT EXISTS `d71b_core_soft_delete_log` (
  `sdl_id` int(10) NOT NULL AUTO_INCREMENT,
  `sdl_obj_id` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_key` varchar(20) NOT NULL DEFAULT '',
  `sdl_obj_member_id` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_date` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_reason` text,
  `sdl_locked` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sdl_id`),
  KEY `look_up` (`sdl_obj_id`,`sdl_obj_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_bookmarks`
--

DROP TABLE IF EXISTS `d71b_core_sys_bookmarks`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_bookmarks` (
  `bookmark_id` int(10) NOT NULL AUTO_INCREMENT,
  `bookmark_member_id` int(10) NOT NULL DEFAULT '0',
  `bookmark_title` varchar(255) NOT NULL DEFAULT '',
  `bookmark_url` varchar(255) NOT NULL DEFAULT '',
  `bookmark_home` int(1) NOT NULL DEFAULT '0',
  `bookmark_pos` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bookmark_id`),
  KEY `bookmark_member_id` (`bookmark_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_conf_settings`
--

DROP TABLE IF EXISTS `d71b_core_sys_conf_settings`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_conf_settings` (
  `conf_id` int(10) NOT NULL AUTO_INCREMENT,
  `conf_title` varchar(255) NOT NULL DEFAULT '',
  `conf_description` text,
  `conf_group` smallint(3) NOT NULL DEFAULT '0',
  `conf_type` varchar(255) NOT NULL DEFAULT '',
  `conf_key` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text,
  `conf_default` text,
  `conf_extra` text,
  `conf_evalphp` text,
  `conf_protected` tinyint(1) NOT NULL DEFAULT '0',
  `conf_position` smallint(3) NOT NULL DEFAULT '0',
  `conf_start_group` varchar(255) NOT NULL DEFAULT '',
  `conf_add_cache` tinyint(1) NOT NULL DEFAULT '1',
  `conf_keywords` text,
  PRIMARY KEY (`conf_id`),
  KEY `conf_key` (`conf_key`),
  KEY `conf_group` (`conf_group`,`conf_position`,`conf_title`),
  KEY `conf_add_cache` (`conf_add_cache`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=441 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_cp_sessions`
--

DROP TABLE IF EXISTS `d71b_core_sys_cp_sessions`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_cp_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_ip_address` varchar(46) NOT NULL DEFAULT '',
  `session_member_name` varchar(255) NOT NULL DEFAULT '',
  `session_member_id` mediumint(8) NOT NULL DEFAULT '0',
  `session_member_login_key` varchar(32) NOT NULL DEFAULT '',
  `session_location` varchar(64) NOT NULL DEFAULT '',
  `session_log_in_time` int(10) NOT NULL DEFAULT '0',
  `session_running_time` int(10) NOT NULL DEFAULT '0',
  `session_url` text,
  `session_app_data` text,
  PRIMARY KEY (`session_id`),
  KEY `session_running_time` (`session_running_time`),
  KEY `session_member_id` (`session_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_lang`
--

DROP TABLE IF EXISTS `d71b_core_sys_lang`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_lang` (
  `lang_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `lang_short` varchar(32) NOT NULL DEFAULT '',
  `lang_title` varchar(255) NOT NULL DEFAULT '',
  `lang_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang_isrtl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang_protected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_short` (`lang_short`),
  KEY `lang_default` (`lang_default`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_lang_words`
--

DROP TABLE IF EXISTS `d71b_core_sys_lang_words`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_lang_words` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` mediumint(4) unsigned NOT NULL,
  `word_app` varchar(255) NOT NULL,
  `word_pack` varchar(255) NOT NULL,
  `word_key` varchar(64) NOT NULL,
  `word_default` text NOT NULL,
  `word_custom` text,
  `word_default_version` varchar(10) NOT NULL DEFAULT '1',
  `word_custom_version` varchar(10) DEFAULT NULL,
  `word_js` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  KEY `word_js` (`word_js`),
  KEY `word_find` (`lang_id`,`word_app`(32),`word_pack`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16676 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_login`
--

DROP TABLE IF EXISTS `d71b_core_sys_login`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_login` (
  `sys_login_id` int(8) NOT NULL DEFAULT '0',
  `sys_cookie` mediumtext,
  `sys_bookmarks` mediumtext,
  PRIMARY KEY (`sys_login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_module`
--

DROP TABLE IF EXISTS `d71b_core_sys_module`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_module` (
  `sys_module_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `sys_module_title` varchar(32) NOT NULL DEFAULT '',
  `sys_module_application` varchar(32) NOT NULL DEFAULT '',
  `sys_module_key` varchar(32) NOT NULL DEFAULT '',
  `sys_module_description` varchar(100) NOT NULL DEFAULT '',
  `sys_module_version` varchar(32) NOT NULL DEFAULT '',
  `sys_module_protected` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sys_module_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sys_module_position` int(5) NOT NULL DEFAULT '0',
  `sys_module_admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sys_module_id`),
  KEY `sys_module_application` (`sys_module_application`),
  KEY `sys_module_visible` (`sys_module_visible`),
  KEY `sys_module_key` (`sys_module_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_sys_settings_titles`
--

DROP TABLE IF EXISTS `d71b_core_sys_settings_titles`;
CREATE TABLE IF NOT EXISTS `d71b_core_sys_settings_titles` (
  `conf_title_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `conf_title_title` varchar(255) NOT NULL DEFAULT '',
  `conf_title_desc` text,
  `conf_title_count` smallint(3) NOT NULL DEFAULT '0',
  `conf_title_noshow` tinyint(1) NOT NULL DEFAULT '0',
  `conf_title_keyword` varchar(200) NOT NULL DEFAULT '',
  `conf_title_app` varchar(200) NOT NULL DEFAULT '',
  `conf_title_tab` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`conf_title_id`),
  KEY `conf_title_keyword` (`conf_title_keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=53 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_tags`
--

DROP TABLE IF EXISTS `d71b_core_tags`;
CREATE TABLE IF NOT EXISTS `d71b_core_tags` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_aai_lookup` char(32) NOT NULL DEFAULT '',
  `tag_aap_lookup` char(32) NOT NULL DEFAULT '',
  `tag_meta_app` varchar(200) NOT NULL DEFAULT '',
  `tag_meta_area` varchar(200) NOT NULL DEFAULT '',
  `tag_meta_id` int(10) NOT NULL DEFAULT '0',
  `tag_meta_parent_id` int(10) NOT NULL DEFAULT '0',
  `tag_member_id` int(10) NOT NULL DEFAULT '0',
  `tag_added` int(10) NOT NULL DEFAULT '0',
  `tag_prefix` int(1) NOT NULL DEFAULT '0',
  `tag_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `tag_aai_lookup` (`tag_aai_lookup`),
  KEY `tag_app` (`tag_meta_app`(100),`tag_meta_area`(100)),
  KEY `tag_member_id` (`tag_member_id`),
  KEY `tag_aap_lookup` (`tag_aap_lookup`,`tag_text`(200)),
  KEY `tag_added` (`tag_added`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_tags_cache`
--

DROP TABLE IF EXISTS `d71b_core_tags_cache`;
CREATE TABLE IF NOT EXISTS `d71b_core_tags_cache` (
  `tag_cache_key` char(32) NOT NULL DEFAULT '',
  `tag_cache_text` text,
  `tag_cache_date` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `tag_cache_key` (`tag_cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_tags_perms`
--

DROP TABLE IF EXISTS `d71b_core_tags_perms`;
CREATE TABLE IF NOT EXISTS `d71b_core_tags_perms` (
  `tag_perm_aai_lookup` char(32) NOT NULL DEFAULT '',
  `tag_perm_aap_lookup` char(32) NOT NULL DEFAULT '',
  `tag_perm_text` varchar(255) NOT NULL DEFAULT '',
  `tag_perm_visible` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `tag_perm_aai_lookup` (`tag_perm_aai_lookup`),
  KEY `tag_perm_aap_lookup` (`tag_perm_aap_lookup`),
  KEY `tag_lookup` (`tag_perm_text`,`tag_perm_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_uagent_groups`
--

DROP TABLE IF EXISTS `d71b_core_uagent_groups`;
CREATE TABLE IF NOT EXISTS `d71b_core_uagent_groups` (
  `ugroup_id` int(10) NOT NULL AUTO_INCREMENT,
  `ugroup_title` varchar(255) NOT NULL DEFAULT '',
  `ugroup_array` mediumtext,
  PRIMARY KEY (`ugroup_id`),
  KEY `ugroup_title` (`ugroup_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_core_uagents`
--

DROP TABLE IF EXISTS `d71b_core_uagents`;
CREATE TABLE IF NOT EXISTS `d71b_core_uagents` (
  `uagent_id` int(10) NOT NULL AUTO_INCREMENT,
  `uagent_key` varchar(200) NOT NULL DEFAULT '',
  `uagent_name` varchar(200) NOT NULL DEFAULT '',
  `uagent_regex` text,
  `uagent_regex_capture` int(1) NOT NULL DEFAULT '0',
  `uagent_type` varchar(200) NOT NULL DEFAULT '',
  `uagent_position` int(10) NOT NULL DEFAULT '0',
  `uagent_default_regex` text,
  PRIMARY KEY (`uagent_id`),
  KEY `uagent_key` (`uagent_key`),
  KEY `ordering` (`uagent_position`,`uagent_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=171 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_custom_bbcode`
--

DROP TABLE IF EXISTS `d71b_custom_bbcode`;
CREATE TABLE IF NOT EXISTS `d71b_custom_bbcode` (
  `bbcode_id` int(10) NOT NULL AUTO_INCREMENT,
  `bbcode_title` varchar(255) NOT NULL DEFAULT '',
  `bbcode_desc` text,
  `bbcode_tag` varchar(255) NOT NULL DEFAULT '',
  `bbcode_replace` text,
  `bbcode_useoption` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_example` text,
  `bbcode_switch_option` int(1) NOT NULL DEFAULT '0',
  `bbcode_menu_option_text` varchar(200) NOT NULL DEFAULT '',
  `bbcode_menu_content_text` varchar(200) NOT NULL DEFAULT '',
  `bbcode_single_tag` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_groups` varchar(255) DEFAULT NULL,
  `bbcode_sections` varchar(255) DEFAULT NULL,
  `bbcode_php_plugin` varchar(255) DEFAULT NULL,
  `bbcode_no_parsing` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_protected` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_aliases` varchar(255) DEFAULT NULL,
  `bbcode_optional_option` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_image` varchar(255) DEFAULT NULL,
  `bbcode_app` varchar(50) NOT NULL DEFAULT '',
  `bbcode_custom_regex` text,
  PRIMARY KEY (`bbcode_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_dnames_change`
--

DROP TABLE IF EXISTS `d71b_dnames_change`;
CREATE TABLE IF NOT EXISTS `d71b_dnames_change` (
  `dname_id` int(10) NOT NULL AUTO_INCREMENT,
  `dname_member_id` int(8) NOT NULL DEFAULT '0',
  `dname_date` int(10) NOT NULL DEFAULT '0',
  `dname_ip_address` varchar(46) NOT NULL DEFAULT '',
  `dname_previous` varchar(255) NOT NULL DEFAULT '',
  `dname_current` varchar(255) NOT NULL DEFAULT '',
  `dname_discount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dname_id`),
  KEY `dname_member_id` (`dname_member_id`),
  KEY `date_id` (`dname_member_id`,`dname_date`),
  KEY `dname_ip_address` (`dname_ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_emoticons`
--

DROP TABLE IF EXISTS `d71b_emoticons`;
CREATE TABLE IF NOT EXISTS `d71b_emoticons` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `typed` varchar(32) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `clickable` smallint(2) NOT NULL DEFAULT '1',
  `emo_set` varchar(64) NOT NULL DEFAULT 'default',
  `emo_position` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emo_set` (`emo_set`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_error_logs`
--

DROP TABLE IF EXISTS `d71b_error_logs`;
CREATE TABLE IF NOT EXISTS `d71b_error_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_member` int(11) NOT NULL DEFAULT '0',
  `log_date` int(11) NOT NULL DEFAULT '0',
  `log_error` text,
  `log_error_code` varchar(24) NOT NULL DEFAULT '0',
  `log_ip_address` varchar(46) DEFAULT NULL,
  `log_request_uri` text,
  PRIMARY KEY (`log_id`),
  KEY `log_date` (`log_date`),
  KEY `log_ip_address` (`log_ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_faq`
--

DROP TABLE IF EXISTS `d71b_faq`;
CREATE TABLE IF NOT EXISTS `d71b_faq` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `text` text,
  `description` text,
  `position` smallint(3) NOT NULL DEFAULT '0',
  `app` varchar(32) NOT NULL DEFAULT 'core',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_forum_perms`
--

DROP TABLE IF EXISTS `d71b_forum_perms`;
CREATE TABLE IF NOT EXISTS `d71b_forum_perms` (
  `perm_id` int(10) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`perm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_forums`
--

DROP TABLE IF EXISTS `d71b_forums`;
CREATE TABLE IF NOT EXISTS `d71b_forums` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `topics` mediumint(6) DEFAULT NULL,
  `posts` mediumint(6) DEFAULT NULL,
  `last_post` int(10) DEFAULT NULL,
  `last_poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_poster_name` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `description` text,
  `position` int(5) unsigned DEFAULT '0',
  `use_ibc` tinyint(1) DEFAULT NULL,
  `use_html` tinyint(1) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `password_override` varchar(255) DEFAULT NULL,
  `last_title` varchar(250) DEFAULT NULL,
  `last_id` int(10) DEFAULT NULL,
  `sort_key` varchar(32) DEFAULT NULL,
  `sort_order` varchar(32) DEFAULT NULL,
  `prune` tinyint(3) DEFAULT NULL,
  `topicfilter` varchar(32) NOT NULL DEFAULT 'all',
  `show_rules` tinyint(1) DEFAULT NULL,
  `preview_posts` tinyint(1) DEFAULT NULL,
  `allow_poll` tinyint(1) NOT NULL DEFAULT '1',
  `allow_pollbump` tinyint(1) NOT NULL DEFAULT '0',
  `inc_postcount` tinyint(1) NOT NULL DEFAULT '1',
  `skin_id` int(10) DEFAULT NULL,
  `parent_id` mediumint(5) DEFAULT '-1',
  `redirect_url` varchar(250) DEFAULT '',
  `redirect_on` tinyint(1) NOT NULL DEFAULT '0',
  `redirect_hits` int(10) NOT NULL DEFAULT '0',
  `rules_title` varchar(255) NOT NULL DEFAULT '',
  `rules_text` text,
  `notify_modq_emails` text,
  `sub_can_post` tinyint(1) DEFAULT '1',
  `permission_custom_error` text,
  `permission_showtopic` tinyint(1) NOT NULL DEFAULT '0',
  `queued_topics` mediumint(6) NOT NULL DEFAULT '0',
  `queued_posts` mediumint(6) NOT NULL DEFAULT '0',
  `forum_allow_rating` tinyint(1) NOT NULL DEFAULT '0',
  `forum_last_deletion` int(10) NOT NULL DEFAULT '0',
  `newest_title` varchar(250) DEFAULT NULL,
  `newest_id` int(10) NOT NULL DEFAULT '0',
  `min_posts_post` int(10) unsigned NOT NULL,
  `min_posts_view` int(10) unsigned NOT NULL,
  `can_view_others` tinyint(1) NOT NULL DEFAULT '1',
  `hide_last_info` tinyint(1) NOT NULL DEFAULT '0',
  `name_seo` varchar(255) DEFAULT NULL,
  `seo_last_title` varchar(255) NOT NULL DEFAULT '',
  `seo_last_name` varchar(255) NOT NULL DEFAULT '',
  `last_x_topic_ids` text,
  `forums_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `disable_sharelinks` int(1) NOT NULL DEFAULT '0',
  `deleted_posts` int(10) NOT NULL DEFAULT '0',
  `deleted_topics` int(10) NOT NULL DEFAULT '0',
  `tag_predefined` text,
  `archived_topics` int(10) NOT NULL DEFAULT '0',
  `archived_posts` int(10) NOT NULL DEFAULT '0',
  `viglink` tinyint(1) NOT NULL DEFAULT '1',
  `ipseo_priority` varchar(3) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `position` (`position`,`parent_id`),
  KEY `last_poster_id` (`last_poster_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_forums_archive_posts`
--

DROP TABLE IF EXISTS `d71b_forums_archive_posts`;
CREATE TABLE IF NOT EXISTS `d71b_forums_archive_posts` (
  `archive_id` int(10) NOT NULL DEFAULT '0',
  `archive_author_id` int(10) NOT NULL DEFAULT '0',
  `archive_author_name` varchar(255) NOT NULL DEFAULT '0',
  `archive_ip_address` varchar(46) NOT NULL DEFAULT '',
  `archive_content_date` int(10) NOT NULL DEFAULT '0',
  `archive_content` mediumtext,
  `archive_queued` int(1) NOT NULL DEFAULT '1',
  `archive_topic_id` int(10) NOT NULL DEFAULT '0',
  `archive_is_first` int(1) NOT NULL DEFAULT '0',
  `archive_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `archive_attach_key` char(32) NOT NULL DEFAULT '',
  `archive_html_mode` int(1) NOT NULL DEFAULT '0',
  `archive_show_signature` int(1) NOT NULL DEFAULT '0',
  `archive_show_emoticons` int(1) NOT NULL DEFAULT '0',
  `archive_show_edited_by` int(1) NOT NULL DEFAULT '0',
  `archive_edit_time` int(10) NOT NULL DEFAULT '0',
  `archive_edit_name` varchar(255) NOT NULL DEFAULT '',
  `archive_edit_reason` varchar(255) NOT NULL DEFAULT '',
  `archive_added` int(10) NOT NULL DEFAULT '0',
  `archive_restored` int(1) NOT NULL DEFAULT '0',
  `archive_forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`archive_id`),
  KEY `archive_topic_id` (`archive_topic_id`,`archive_queued`,`archive_content_date`),
  KEY `archive_author_id` (`archive_author_id`),
  KEY `archive_restored` (`archive_restored`),
  KEY `archive_content_date` (`archive_content_date`,`archive_topic_id`),
  FULLTEXT KEY `archive_content` (`archive_content`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_forums_recent_posts`
--

DROP TABLE IF EXISTS `d71b_forums_recent_posts`;
CREATE TABLE IF NOT EXISTS `d71b_forums_recent_posts` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_topic_id` int(10) NOT NULL DEFAULT '0',
  `post_forum_id` int(10) NOT NULL DEFAULT '0',
  `post_author_id` int(10) NOT NULL DEFAULT '0',
  `post_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `group_lookup` (`post_author_id`,`post_forum_id`,`post_date`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_groups`
--

DROP TABLE IF EXISTS `d71b_groups`;
CREATE TABLE IF NOT EXISTS `d71b_groups` (
  `g_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `g_view_board` tinyint(1) DEFAULT NULL,
  `g_mem_info` tinyint(1) DEFAULT NULL,
  `g_other_topics` tinyint(1) DEFAULT NULL,
  `g_use_search` tinyint(1) DEFAULT NULL,
  `g_edit_profile` tinyint(1) DEFAULT NULL,
  `g_post_new_topics` tinyint(1) DEFAULT NULL,
  `g_reply_own_topics` tinyint(1) DEFAULT NULL,
  `g_reply_other_topics` tinyint(1) DEFAULT NULL,
  `g_edit_posts` tinyint(1) DEFAULT NULL,
  `g_delete_own_posts` tinyint(1) DEFAULT NULL,
  `g_open_close_posts` tinyint(1) DEFAULT NULL,
  `g_delete_own_topics` tinyint(1) DEFAULT NULL,
  `g_post_polls` tinyint(1) DEFAULT NULL,
  `g_vote_polls` tinyint(1) DEFAULT NULL,
  `g_use_pm` tinyint(1) DEFAULT '0',
  `g_is_supmod` tinyint(1) DEFAULT NULL,
  `g_access_cp` tinyint(1) DEFAULT NULL,
  `g_title` varchar(32) NOT NULL DEFAULT '',
  `g_append_edit` tinyint(1) DEFAULT NULL,
  `g_access_offline` tinyint(1) DEFAULT NULL,
  `g_avoid_q` tinyint(1) DEFAULT NULL,
  `g_avoid_flood` tinyint(1) DEFAULT NULL,
  `g_icon` text,
  `g_attach_max` bigint(20) DEFAULT NULL,
  `prefix` varchar(250) DEFAULT NULL,
  `suffix` varchar(250) DEFAULT NULL,
  `g_max_messages` int(5) DEFAULT '50',
  `g_max_mass_pm` int(5) DEFAULT '0',
  `g_search_flood` mediumint(6) DEFAULT '20',
  `g_edit_cutoff` int(10) DEFAULT '0',
  `g_promotion` varchar(10) DEFAULT '-1&-1',
  `g_hide_from_list` tinyint(1) DEFAULT '0',
  `g_post_closed` tinyint(1) DEFAULT '0',
  `g_perm_id` varchar(255) NOT NULL DEFAULT '',
  `g_photo_max_vars` varchar(200) DEFAULT '100:200:300',
  `g_dohtml` tinyint(1) NOT NULL DEFAULT '0',
  `g_edit_topic` tinyint(1) NOT NULL DEFAULT '0',
  `g_bypass_badwords` tinyint(1) NOT NULL DEFAULT '0',
  `g_can_msg_attach` tinyint(1) NOT NULL DEFAULT '0',
  `g_attach_per_post` int(10) NOT NULL DEFAULT '0',
  `g_topic_rate_setting` smallint(2) NOT NULL DEFAULT '0',
  `g_dname_changes` int(3) NOT NULL DEFAULT '0',
  `g_dname_date` int(5) NOT NULL DEFAULT '0',
  `g_mod_preview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `g_rep_max_positive` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `g_rep_max_negative` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `g_signature_limits` varchar(255) DEFAULT NULL,
  `g_can_add_friends` tinyint(1) NOT NULL DEFAULT '1',
  `g_hide_online_list` tinyint(1) NOT NULL DEFAULT '0',
  `g_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `g_pm_perday` smallint(6) NOT NULL DEFAULT '0',
  `g_mod_post_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_ppd_limit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_ppd_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_displayname_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_sig_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_pm_flood_mins` int(5) unsigned NOT NULL DEFAULT '0',
  `g_max_notifications` mediumint(9) NOT NULL DEFAULT '0',
  `g_max_bgimg_upload` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_ignored_users`
--

DROP TABLE IF EXISTS `d71b_ignored_users`;
CREATE TABLE IF NOT EXISTS `d71b_ignored_users` (
  `ignore_id` int(10) NOT NULL AUTO_INCREMENT,
  `ignore_owner_id` int(8) NOT NULL DEFAULT '0',
  `ignore_ignore_id` int(8) NOT NULL DEFAULT '0',
  `ignore_messages` int(1) NOT NULL DEFAULT '0',
  `ignore_topics` int(1) NOT NULL DEFAULT '0',
  `ignore_signatures` int(1) NOT NULL DEFAULT '0',
  `ignore_chats` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ignore_id`),
  KEY `ignore_owner_id` (`ignore_owner_id`),
  KEY `ignore_ignore_id` (`ignore_ignore_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_inline_notifications`
--

DROP TABLE IF EXISTS `d71b_inline_notifications`;
CREATE TABLE IF NOT EXISTS `d71b_inline_notifications` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_to_id` int(11) NOT NULL DEFAULT '0',
  `notify_sent` int(10) NOT NULL DEFAULT '0',
  `notify_read` int(10) NOT NULL DEFAULT '0',
  `notify_title` text,
  `notify_text` text,
  `notify_from_id` int(11) NOT NULL DEFAULT '0',
  `notify_type_key` varchar(255) DEFAULT NULL,
  `notify_url` text,
  `notify_meta_app` varchar(50) DEFAULT NULL,
  `notify_meta_area` varchar(100) DEFAULT NULL,
  `notify_meta_id` int(10) NOT NULL DEFAULT '0',
  `notify_meta_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `notify_to_id` (`notify_to_id`,`notify_sent`),
  KEY `grabber` (`notify_to_id`,`notify_read`,`notify_sent`),
  KEY `notify_meta_key` (`notify_meta_key`),
  KEY `notify_from_id` (`notify_from_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_login_methods`
--

DROP TABLE IF EXISTS `d71b_login_methods`;
CREATE TABLE IF NOT EXISTS `d71b_login_methods` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_title` varchar(255) NOT NULL DEFAULT '',
  `login_description` varchar(255) NOT NULL DEFAULT '',
  `login_folder_name` varchar(255) NOT NULL DEFAULT '',
  `login_maintain_url` varchar(255) NOT NULL DEFAULT '',
  `login_register_url` varchar(255) NOT NULL DEFAULT '',
  `login_alt_login_html` text,
  `login_alt_acp_html` text,
  `login_settings` int(1) NOT NULL DEFAULT '0',
  `login_enabled` int(1) NOT NULL DEFAULT '0',
  `login_safemode` int(1) NOT NULL DEFAULT '0',
  `login_replace_form` int(1) NOT NULL DEFAULT '0',
  `login_user_id` varchar(255) NOT NULL DEFAULT 'username',
  `login_login_url` varchar(255) NOT NULL DEFAULT '',
  `login_logout_url` varchar(255) NOT NULL DEFAULT '',
  `login_order` smallint(3) NOT NULL DEFAULT '0',
  `login_custom_config` text,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mail_error_logs`
--

DROP TABLE IF EXISTS `d71b_mail_error_logs`;
CREATE TABLE IF NOT EXISTS `d71b_mail_error_logs` (
  `mlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `mlog_date` int(10) NOT NULL DEFAULT '0',
  `mlog_to` varchar(250) NOT NULL DEFAULT '',
  `mlog_from` varchar(250) NOT NULL DEFAULT '',
  `mlog_subject` varchar(250) NOT NULL DEFAULT '',
  `mlog_content` varchar(250) NOT NULL DEFAULT '',
  `mlog_msg` text,
  `mlog_code` varchar(200) NOT NULL DEFAULT '',
  `mlog_smtp_msg` text,
  PRIMARY KEY (`mlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mail_queue`
--

DROP TABLE IF EXISTS `d71b_mail_queue`;
CREATE TABLE IF NOT EXISTS `d71b_mail_queue` (
  `mail_id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_date` int(10) NOT NULL DEFAULT '0',
  `mail_to` varchar(255) NOT NULL DEFAULT '',
  `mail_from` varchar(255) NOT NULL DEFAULT '',
  `mail_subject` text,
  `mail_content` text,
  `mail_html_on` int(1) NOT NULL DEFAULT '0',
  `mail_cc` text,
  `mail_html_content` mediumtext,
  PRIMARY KEY (`mail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_member_status_actions`
--

DROP TABLE IF EXISTS `d71b_member_status_actions`;
CREATE TABLE IF NOT EXISTS `d71b_member_status_actions` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `action_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_reply_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_date` int(10) unsigned NOT NULL DEFAULT '0',
  `action_key` varchar(200) NOT NULL DEFAULT '',
  `action_status_owner` int(10) unsigned NOT NULL DEFAULT '0',
  `action_app` varchar(255) NOT NULL DEFAULT 'members',
  `action_custom_text` text,
  `action_custom` int(1) NOT NULL DEFAULT '0',
  `action_custom_url` text,
  PRIMARY KEY (`action_id`),
  KEY `action_status_id` (`action_status_id`),
  KEY `action_member_id` (`action_member_id`,`action_date`),
  KEY `action_date` (`action_date`),
  KEY `action_custom` (`action_custom`,`action_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_member_status_replies`
--

DROP TABLE IF EXISTS `d71b_member_status_replies`;
CREATE TABLE IF NOT EXISTS `d71b_member_status_replies` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_date` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_content` text,
  PRIMARY KEY (`reply_id`),
  KEY `reply_status_id` (`reply_status_id`),
  KEY `reply_member_id` (`reply_member_id`),
  KEY `reply_status_count` (`reply_status_id`,`reply_member_id`),
  KEY `reply_date` (`reply_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_member_status_updates`
--

DROP TABLE IF EXISTS `d71b_member_status_updates`;
CREATE TABLE IF NOT EXISTS `d71b_member_status_updates` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT,
  `status_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status_content` text,
  `status_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `status_last_ids` text,
  `status_is_latest` int(1) NOT NULL DEFAULT '0',
  `status_is_locked` int(1) NOT NULL DEFAULT '0',
  `status_hash` varchar(32) NOT NULL DEFAULT '',
  `status_imported` int(1) NOT NULL DEFAULT '0',
  `status_creator` varchar(100) NOT NULL DEFAULT '',
  `status_author_id` int(10) NOT NULL DEFAULT '0',
  `status_author_ip` varchar(46) NOT NULL DEFAULT '',
  `status_approved` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`),
  KEY `status_date` (`status_date`),
  KEY `s_hash` (`status_member_id`,`status_hash`,`status_date`),
  KEY `status_is_latest` (`status_is_latest`,`status_date`),
  KEY `status_author_lookup` (`status_author_id`,`status_member_id`,`status_date`),
  KEY `status_member_id` (`status_member_id`,`status_approved`,`status_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_members`
--

DROP TABLE IF EXISTS `d71b_members`;
CREATE TABLE IF NOT EXISTS `d71b_members` (
  `member_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `member_group_id` smallint(3) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '',
  `joined` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `posts` mediumint(7) DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `allow_admin_mails` tinyint(1) DEFAULT NULL,
  `time_offset` varchar(10) DEFAULT NULL,
  `skin` smallint(5) DEFAULT NULL,
  `warn_level` int(10) DEFAULT NULL,
  `warn_lastwarn` int(10) NOT NULL DEFAULT '0',
  `language` mediumint(4) DEFAULT NULL,
  `last_post` int(10) DEFAULT NULL,
  `restrict_post` varchar(100) NOT NULL DEFAULT '0',
  `view_sigs` tinyint(1) DEFAULT '1',
  `view_img` tinyint(1) DEFAULT '1',
  `bday_day` int(2) DEFAULT NULL,
  `bday_month` int(2) DEFAULT NULL,
  `bday_year` int(4) DEFAULT NULL,
  `msg_count_new` int(2) NOT NULL DEFAULT '0',
  `msg_count_total` int(3) NOT NULL DEFAULT '0',
  `msg_count_reset` int(1) NOT NULL DEFAULT '0',
  `msg_show_notification` int(1) NOT NULL DEFAULT '0',
  `misc` varchar(128) DEFAULT NULL,
  `last_visit` int(10) DEFAULT '0',
  `last_activity` int(10) DEFAULT '0',
  `dst_in_use` tinyint(1) DEFAULT '0',
  `coppa_user` tinyint(1) DEFAULT '0',
  `mod_posts` varchar(100) NOT NULL DEFAULT '0',
  `auto_track` varchar(50) DEFAULT '0',
  `temp_ban` varchar(100) DEFAULT '0',
  `login_anonymous` char(3) NOT NULL DEFAULT '0&0',
  `ignored_users` text,
  `mgroup_others` varchar(255) NOT NULL DEFAULT '',
  `org_perm_id` varchar(255) NOT NULL DEFAULT '',
  `member_login_key` varchar(32) NOT NULL DEFAULT '',
  `member_login_key_expire` int(10) NOT NULL DEFAULT '0',
  `has_blog` text,
  `blogs_recache` tinyint(1) DEFAULT NULL,
  `has_gallery` tinyint(1) NOT NULL DEFAULT '0',
  `members_auto_dst` tinyint(1) NOT NULL DEFAULT '1',
  `members_display_name` varchar(255) NOT NULL DEFAULT '',
  `members_seo_name` varchar(255) NOT NULL DEFAULT '',
  `members_created_remote` tinyint(1) NOT NULL DEFAULT '0',
  `members_cache` mediumtext,
  `members_disable_pm` int(1) NOT NULL DEFAULT '0',
  `members_l_display_name` varchar(255) NOT NULL DEFAULT '',
  `members_l_username` varchar(255) NOT NULL DEFAULT '',
  `failed_logins` text,
  `failed_login_count` smallint(3) NOT NULL DEFAULT '0',
  `members_profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `members_pass_hash` varchar(32) NOT NULL DEFAULT '',
  `members_pass_salt` varchar(5) NOT NULL DEFAULT '',
  `member_banned` tinyint(1) NOT NULL DEFAULT '0',
  `member_uploader` varchar(32) NOT NULL DEFAULT 'default',
  `members_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `fb_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fb_emailhash` varchar(60) NOT NULL DEFAULT '',
  `fb_lastsync` int(10) NOT NULL DEFAULT '0',
  `members_day_posts` varchar(32) NOT NULL DEFAULT '0,0',
  `live_id` varchar(32) DEFAULT NULL,
  `twitter_id` varchar(255) NOT NULL DEFAULT '',
  `twitter_token` varchar(255) NOT NULL DEFAULT '',
  `twitter_secret` varchar(255) NOT NULL DEFAULT '',
  `notification_cnt` mediumint(9) NOT NULL DEFAULT '0',
  `tc_lastsync` int(10) NOT NULL DEFAULT '0',
  `fb_session` varchar(200) NOT NULL DEFAULT '',
  `fb_token` text,
  `ips_mobile_token` varchar(64) DEFAULT NULL,
  `unacknowledged_warnings` tinyint(1) DEFAULT NULL,
  `ipsconnect_id` int(10) NOT NULL DEFAULT '0',
  `ipsconnect_revalidate_url` text,
  PRIMARY KEY (`member_id`),
  KEY `members_l_display_name` (`members_l_display_name`),
  KEY `members_l_username` (`members_l_username`),
  KEY `mgroup` (`member_group_id`,`member_id`),
  KEY `member_groups` (`member_group_id`,`mgroup_others`),
  KEY `bday_day` (`bday_day`),
  KEY `bday_month` (`bday_month`),
  KEY `member_banned` (`member_banned`),
  KEY `members_bitoptions` (`members_bitoptions`),
  KEY `ip_address` (`ip_address`),
  KEY `failed_login_count` (`failed_login_count`),
  KEY `joined` (`joined`),
  KEY `fb_uid` (`fb_uid`),
  KEY `twitter_id` (`twitter_id`),
  KEY `email` (`email`),
  KEY `blogs_recache` (`blogs_recache`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_members_partial`
--

DROP TABLE IF EXISTS `d71b_members_partial`;
CREATE TABLE IF NOT EXISTS `d71b_members_partial` (
  `partial_id` int(10) NOT NULL AUTO_INCREMENT,
  `partial_member_id` int(8) NOT NULL DEFAULT '0',
  `partial_date` int(10) NOT NULL DEFAULT '0',
  `partial_email_ok` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`partial_id`),
  KEY `partial_member_id` (`partial_member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_members_warn_actions`
--

DROP TABLE IF EXISTS `d71b_members_warn_actions`;
CREATE TABLE IF NOT EXISTS `d71b_members_warn_actions` (
  `wa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wa_points` int(32) DEFAULT NULL,
  `wa_mq` int(2) DEFAULT NULL,
  `wa_mq_unit` char(1) DEFAULT NULL,
  `wa_rpa` int(2) DEFAULT NULL,
  `wa_rpa_unit` char(1) DEFAULT NULL,
  `wa_suspend` int(2) DEFAULT NULL,
  `wa_suspend_unit` char(1) DEFAULT NULL,
  `wa_ban_group` tinyint(1) DEFAULT NULL,
  `wa_override` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`wa_id`),
  KEY `wa_points` (`wa_points`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_members_warn_logs`
--

DROP TABLE IF EXISTS `d71b_members_warn_logs`;
CREATE TABLE IF NOT EXISTS `d71b_members_warn_logs` (
  `wl_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wl_member` mediumint(8) DEFAULT NULL,
  `wl_moderator` mediumint(8) DEFAULT NULL,
  `wl_date` int(10) DEFAULT NULL,
  `wl_reason` int(10) DEFAULT NULL,
  `wl_points` int(5) DEFAULT NULL,
  `wl_note_member` text,
  `wl_note_mods` text,
  `wl_mq` int(2) DEFAULT NULL,
  `wl_mq_unit` char(1) DEFAULT NULL,
  `wl_rpa` int(2) DEFAULT NULL,
  `wl_rpa_unit` char(1) DEFAULT NULL,
  `wl_suspend` int(2) DEFAULT NULL,
  `wl_suspend_unit` char(1) DEFAULT NULL,
  `wl_ban_group` tinyint(1) DEFAULT NULL,
  `wl_expire` int(2) DEFAULT NULL,
  `wl_expire_unit` char(1) DEFAULT NULL,
  `wl_acknowledged` tinyint(1) DEFAULT NULL,
  `wl_content_app` varchar(32) DEFAULT NULL,
  `wl_content_id1` varchar(32) DEFAULT NULL,
  `wl_content_id2` varchar(32) DEFAULT NULL,
  `wl_expire_date` int(10) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  KEY `wl_member` (`wl_member`),
  KEY `wl_moderator` (`wl_moderator`),
  KEY `wl_date` (`wl_member`,`wl_date`),
  KEY `content` (`wl_content_app`,`wl_content_id1`,`wl_content_id2`),
  KEY `wl_expire_date` (`wl_expire_date`),
  KEY `wl_expire` (`wl_expire`,`wl_expire_date`,`wl_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_members_warn_reasons`
--

DROP TABLE IF EXISTS `d71b_members_warn_reasons`;
CREATE TABLE IF NOT EXISTS `d71b_members_warn_reasons` (
  `wr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wr_name` varchar(255) DEFAULT NULL,
  `wr_points` float DEFAULT NULL,
  `wr_points_override` tinyint(1) DEFAULT NULL,
  `wr_remove` int(2) DEFAULT NULL,
  `wr_remove_unit` char(1) DEFAULT NULL,
  `wr_remove_override` tinyint(1) DEFAULT NULL,
  `wr_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_order` (`wr_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_message_posts`
--

DROP TABLE IF EXISTS `d71b_message_posts`;
CREATE TABLE IF NOT EXISTS `d71b_message_posts` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_topic_id` int(10) NOT NULL DEFAULT '0',
  `msg_date` int(10) DEFAULT NULL,
  `msg_post` text,
  `msg_post_key` varchar(32) NOT NULL DEFAULT '0',
  `msg_author_id` mediumint(8) NOT NULL DEFAULT '0',
  `msg_ip_address` varchar(46) NOT NULL DEFAULT '0',
  `msg_is_first_post` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `msg_topic_id` (`msg_topic_id`),
  KEY `msg_date` (`msg_date`),
  KEY `msg_ip_address` (`msg_ip_address`),
  KEY `msg_author_id` (`msg_author_id`),
  FULLTEXT KEY `msg_post` (`msg_post`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_message_topic_user_map`
--

DROP TABLE IF EXISTS `d71b_message_topic_user_map`;
CREATE TABLE IF NOT EXISTS `d71b_message_topic_user_map` (
  `map_id` int(10) NOT NULL AUTO_INCREMENT,
  `map_user_id` int(10) NOT NULL DEFAULT '0',
  `map_topic_id` int(10) NOT NULL DEFAULT '0',
  `map_folder_id` varchar(32) NOT NULL DEFAULT '',
  `map_read_time` int(10) NOT NULL DEFAULT '0',
  `map_user_active` int(1) NOT NULL DEFAULT '0',
  `map_user_banned` int(1) NOT NULL DEFAULT '0',
  `map_has_unread` int(1) NOT NULL DEFAULT '0',
  `map_is_system` int(1) NOT NULL DEFAULT '0',
  `map_is_starter` int(1) NOT NULL DEFAULT '0',
  `map_left_time` int(10) NOT NULL DEFAULT '0',
  `map_ignore_notification` int(1) NOT NULL DEFAULT '0',
  `map_last_topic_reply` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `map_main` (`map_user_id`,`map_topic_id`),
  KEY `map_user` (`map_user_id`,`map_folder_id`,`map_last_topic_reply`),
  KEY `map_topic_id` (`map_topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_message_topics`
--

DROP TABLE IF EXISTS `d71b_message_topics`;
CREATE TABLE IF NOT EXISTS `d71b_message_topics` (
  `mt_id` int(10) NOT NULL AUTO_INCREMENT,
  `mt_date` int(10) NOT NULL DEFAULT '0',
  `mt_title` varchar(255) NOT NULL DEFAULT '',
  `mt_hasattach` smallint(5) NOT NULL DEFAULT '0',
  `mt_starter_id` int(10) NOT NULL DEFAULT '0',
  `mt_start_time` int(10) NOT NULL DEFAULT '0',
  `mt_last_post_time` int(10) NOT NULL DEFAULT '0',
  `mt_invited_members` text,
  `mt_to_count` int(3) NOT NULL DEFAULT '0',
  `mt_to_member_id` int(10) NOT NULL DEFAULT '0',
  `mt_replies` int(10) NOT NULL DEFAULT '0',
  `mt_last_msg_id` int(10) NOT NULL DEFAULT '0',
  `mt_first_msg_id` int(10) NOT NULL DEFAULT '0',
  `mt_is_draft` int(1) NOT NULL DEFAULT '0',
  `mt_is_deleted` int(1) NOT NULL DEFAULT '0',
  `mt_is_system` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mt_id`),
  KEY `mt_date` (`mt_date`),
  KEY `mt_starter_id` (`mt_starter_id`),
  FULLTEXT KEY `mt_title` (`mt_title`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mobile_app_style`
--

DROP TABLE IF EXISTS `d71b_mobile_app_style`;
CREATE TABLE IF NOT EXISTS `d71b_mobile_app_style` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `hasRetina` tinyint(1) NOT NULL DEFAULT '0',
  `isInUse` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdated` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mobile_device_map`
--

DROP TABLE IF EXISTS `d71b_mobile_device_map`;
CREATE TABLE IF NOT EXISTS `d71b_mobile_device_map` (
  `token` varchar(64) NOT NULL DEFAULT '',
  `member_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mobile_notifications`
--

DROP TABLE IF EXISTS `d71b_mobile_notifications`;
CREATE TABLE IF NOT EXISTS `d71b_mobile_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notify_title` text NOT NULL,
  `notify_date` int(10) unsigned NOT NULL,
  `member_id` mediumint(8) unsigned NOT NULL,
  `notify_sent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `notify_url` text,
  PRIMARY KEY (`id`),
  KEY `notify_sent` (`notify_sent`,`notify_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_mod_queued_items`
--

DROP TABLE IF EXISTS `d71b_mod_queued_items`;
CREATE TABLE IF NOT EXISTS `d71b_mod_queued_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT 'post',
  `type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_moderator_logs`
--

DROP TABLE IF EXISTS `d71b_moderator_logs`;
CREATE TABLE IF NOT EXISTS `d71b_moderator_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `forum_id` int(5) DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `post_id` int(10) DEFAULT NULL,
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `member_name` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(46) NOT NULL DEFAULT '0',
  `http_referer` text,
  `ctime` int(10) DEFAULT NULL,
  `topic_title` text,
  `action` text,
  `query_string` text,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=322 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_moderators`
--

DROP TABLE IF EXISTS `d71b_moderators`;
CREATE TABLE IF NOT EXISTS `d71b_moderators` (
  `mid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `forum_id` text,
  `member_name` varchar(32) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `edit_post` tinyint(1) DEFAULT NULL,
  `edit_topic` tinyint(1) DEFAULT NULL,
  `delete_post` tinyint(1) DEFAULT NULL,
  `delete_topic` tinyint(1) DEFAULT NULL,
  `view_ip` tinyint(1) DEFAULT NULL,
  `open_topic` tinyint(1) DEFAULT NULL,
  `close_topic` tinyint(1) DEFAULT NULL,
  `mass_move` tinyint(1) DEFAULT NULL,
  `mass_prune` tinyint(1) DEFAULT NULL,
  `move_topic` tinyint(1) DEFAULT NULL,
  `pin_topic` tinyint(1) DEFAULT NULL,
  `unpin_topic` tinyint(1) DEFAULT NULL,
  `post_q` tinyint(1) DEFAULT NULL,
  `topic_q` tinyint(1) DEFAULT NULL,
  `allow_warn` tinyint(1) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT '0',
  `group_id` smallint(3) DEFAULT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `split_merge` tinyint(1) DEFAULT '0',
  `can_mm` tinyint(1) NOT NULL DEFAULT '0',
  `mod_can_set_open_time` tinyint(1) NOT NULL DEFAULT '0',
  `mod_can_set_close_time` tinyint(1) NOT NULL DEFAULT '0',
  `mod_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `group_id` (`group_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_permission_index`
--

DROP TABLE IF EXISTS `d71b_permission_index`;
CREATE TABLE IF NOT EXISTS `d71b_permission_index` (
  `perm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `perm_type` varchar(32) NOT NULL,
  `perm_type_id` int(10) unsigned NOT NULL,
  `perm_view` text NOT NULL,
  `perm_2` text,
  `perm_3` text,
  `perm_4` text,
  `perm_5` text,
  `perm_6` text,
  `perm_7` text,
  `owner_only` tinyint(1) NOT NULL DEFAULT '0',
  `friend_only` tinyint(1) NOT NULL DEFAULT '0',
  `authorized_users` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`perm_id`),
  KEY `perm_index` (`perm_type`,`perm_type_id`),
  KEY `perm_type` (`app`,`perm_type`,`perm_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_pfields_content`
--

DROP TABLE IF EXISTS `d71b_pfields_content`;
CREATE TABLE IF NOT EXISTS `d71b_pfields_content` (
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  `field_10` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_pfields_data`
--

DROP TABLE IF EXISTS `d71b_pfields_data`;
CREATE TABLE IF NOT EXISTS `d71b_pfields_data` (
  `pf_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `pf_title` varchar(250) NOT NULL DEFAULT '',
  `pf_desc` varchar(250) NOT NULL DEFAULT '',
  `pf_content` text,
  `pf_type` varchar(250) NOT NULL DEFAULT '',
  `pf_not_null` tinyint(1) NOT NULL DEFAULT '0',
  `pf_member_hide` tinyint(1) NOT NULL DEFAULT '0',
  `pf_max_input` smallint(6) NOT NULL DEFAULT '0',
  `pf_member_edit` tinyint(1) NOT NULL DEFAULT '0',
  `pf_position` smallint(6) NOT NULL DEFAULT '0',
  `pf_show_on_reg` tinyint(1) NOT NULL DEFAULT '0',
  `pf_input_format` text,
  `pf_admin_only` tinyint(1) NOT NULL DEFAULT '0',
  `pf_topic_format` text,
  `pf_group_id` mediumint(4) unsigned NOT NULL,
  `pf_icon` varchar(255) DEFAULT NULL,
  `pf_key` varchar(255) DEFAULT NULL,
  `pf_search_type` varchar(5) NOT NULL DEFAULT 'loose',
  `pf_filtering` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_pfields_groups`
--

DROP TABLE IF EXISTS `d71b_pfields_groups`;
CREATE TABLE IF NOT EXISTS `d71b_pfields_groups` (
  `pf_group_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pf_group_name` varchar(255) NOT NULL,
  `pf_group_key` varchar(255) NOT NULL,
  PRIMARY KEY (`pf_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_polls`
--

DROP TABLE IF EXISTS `d71b_polls`;
CREATE TABLE IF NOT EXISTS `d71b_polls` (
  `pid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL DEFAULT '0',
  `start_date` int(10) DEFAULT NULL,
  `choices` text,
  `starter_id` mediumint(8) NOT NULL DEFAULT '0',
  `votes` smallint(5) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `poll_question` varchar(255) DEFAULT NULL,
  `poll_only` tinyint(1) NOT NULL DEFAULT '0',
  `poll_view_voters` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_posts`
--

DROP TABLE IF EXISTS `d71b_posts`;
CREATE TABLE IF NOT EXISTS `d71b_posts` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `append_edit` tinyint(1) DEFAULT '0',
  `edit_time` int(10) DEFAULT NULL,
  `author_id` mediumint(8) NOT NULL DEFAULT '0',
  `author_name` varchar(255) DEFAULT NULL,
  `use_sig` tinyint(1) NOT NULL DEFAULT '0',
  `use_emo` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `post_date` int(10) DEFAULT NULL,
  `post` mediumtext,
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `new_topic` tinyint(1) DEFAULT '0',
  `edit_name` varchar(255) DEFAULT NULL,
  `post_key` varchar(32) NOT NULL DEFAULT '0',
  `post_htmlstate` smallint(1) NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) NOT NULL DEFAULT '',
  `post_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `pdelete_time` int(11) NOT NULL DEFAULT '0',
  `post_field_int` int(10) NOT NULL DEFAULT '0',
  `post_field_t1` text,
  `post_field_t2` text,
  PRIMARY KEY (`pid`),
  KEY `topic_id` (`topic_id`,`queued`,`pid`,`post_date`),
  KEY `author_id` (`author_id`,`post_date`,`queued`),
  KEY `post_date` (`post_date`),
  KEY `ip_address` (`ip_address`),
  KEY `post_key` (`post_key`),
  KEY `queued` (`queued`,`pdelete_time`),
  FULLTEXT KEY `post` (`post`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_profile_friends`
--

DROP TABLE IF EXISTS `d71b_profile_friends`;
CREATE TABLE IF NOT EXISTS `d71b_profile_friends` (
  `friends_id` int(10) NOT NULL AUTO_INCREMENT,
  `friends_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_approved` tinyint(1) NOT NULL DEFAULT '0',
  `friends_added` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`friends_id`),
  KEY `my_friends` (`friends_member_id`,`friends_friend_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_profile_friends_flood`
--

DROP TABLE IF EXISTS `d71b_profile_friends_flood`;
CREATE TABLE IF NOT EXISTS `d71b_profile_friends_flood` (
  `friends_id` int(10) NOT NULL AUTO_INCREMENT,
  `friends_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_removed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`friends_id`),
  KEY `my_friends` (`friends_member_id`,`friends_friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_profile_portal`
--

DROP TABLE IF EXISTS `d71b_profile_portal`;
CREATE TABLE IF NOT EXISTS `d71b_profile_portal` (
  `pp_member_id` int(10) NOT NULL DEFAULT '0',
  `pp_last_visitors` text,
  `pp_rating_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_rating_value` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_rating_real` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_main_photo` varchar(255) NOT NULL DEFAULT '',
  `pp_main_width` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_main_height` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_thumb_photo` varchar(255) NOT NULL DEFAULT '',
  `pp_thumb_width` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_thumb_height` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_setting_moderate_comments` tinyint(1) NOT NULL DEFAULT '0',
  `pp_setting_moderate_friends` tinyint(1) NOT NULL DEFAULT '0',
  `pp_setting_count_friends` int(2) NOT NULL DEFAULT '0',
  `pp_setting_count_comments` int(2) NOT NULL DEFAULT '0',
  `pp_setting_count_visitors` tinyint(1) NOT NULL DEFAULT '0',
  `pp_about_me` mediumtext,
  `pp_reputation_points` int(10) NOT NULL DEFAULT '0',
  `pp_gravatar` varchar(255) NOT NULL DEFAULT '',
  `pp_photo_type` varchar(20) NOT NULL DEFAULT '',
  `signature` text,
  `avatar_location` varchar(255) DEFAULT NULL,
  `avatar_size` varchar(9) NOT NULL DEFAULT '0',
  `avatar_type` varchar(15) DEFAULT NULL,
  `pconversation_filters` text,
  `fb_photo` text,
  `fb_photo_thumb` text,
  `fb_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `tc_last_sid_import` varchar(50) DEFAULT '0',
  `tc_photo` text,
  `tc_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_customization` mediumtext,
  `pp_profile_update` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pp_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_profile_portal_views`
--

DROP TABLE IF EXISTS `d71b_profile_portal_views`;
CREATE TABLE IF NOT EXISTS `d71b_profile_portal_views` (
  `views_member_id` int(10) NOT NULL DEFAULT '0',
  KEY `views_member_id` (`views_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_profile_ratings`
--

DROP TABLE IF EXISTS `d71b_profile_ratings`;
CREATE TABLE IF NOT EXISTS `d71b_profile_ratings` (
  `rating_id` int(10) NOT NULL AUTO_INCREMENT,
  `rating_for_member_id` int(10) NOT NULL DEFAULT '0',
  `rating_by_member_id` int(10) NOT NULL DEFAULT '0',
  `rating_ip_address` varchar(46) NOT NULL DEFAULT '',
  `rating_value` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  KEY `rating_for_member_id` (`rating_for_member_id`),
  KEY `rating_ip_address` (`rating_ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_question_and_answer`
--

DROP TABLE IF EXISTS `d71b_question_and_answer`;
CREATE TABLE IF NOT EXISTS `d71b_question_and_answer` (
  `qa_id` int(11) NOT NULL AUTO_INCREMENT,
  `qa_question` text,
  `qa_answers` text,
  PRIMARY KEY (`qa_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_classes`
--

DROP TABLE IF EXISTS `d71b_rc_classes`;
CREATE TABLE IF NOT EXISTS `d71b_rc_classes` (
  `com_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `onoff` tinyint(1) NOT NULL DEFAULT '0',
  `class_title` varchar(255) NOT NULL DEFAULT '',
  `class_desc` text NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_url` varchar(255) NOT NULL DEFAULT '',
  `pversion` varchar(255) NOT NULL DEFAULT '',
  `my_class` varchar(100) NOT NULL DEFAULT '',
  `group_can_report` text,
  `mod_group_perm` text,
  `extra_data` text NOT NULL,
  `lockd` tinyint(1) NOT NULL DEFAULT '0',
  `app` varchar(32) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `onoff` (`onoff`,`mod_group_perm`(255))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_comments`
--

DROP TABLE IF EXISTS `d71b_rc_comments`;
CREATE TABLE IF NOT EXISTS `d71b_rc_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `comment_by` mediumint(8) NOT NULL DEFAULT '0',
  `comment_date` int(10) NOT NULL DEFAULT '0',
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  `edit_date` int(11) NOT NULL DEFAULT '0',
  `author_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_comments` (`rid`,`approved`,`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_modpref`
--

DROP TABLE IF EXISTS `d71b_rc_modpref`;
CREATE TABLE IF NOT EXISTS `d71b_rc_modpref` (
  `mem_id` mediumint(8) NOT NULL DEFAULT '0',
  `rss_key` varchar(32) NOT NULL DEFAULT '',
  `rss_cache` mediumtext NOT NULL,
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_reports`
--

DROP TABLE IF EXISTS `d71b_rc_reports`;
CREATE TABLE IF NOT EXISTS `d71b_rc_reports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `report` mediumtext NOT NULL,
  `report_by` mediumint(8) NOT NULL DEFAULT '0',
  `date_reported` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_reports_index`
--

DROP TABLE IF EXISTS `d71b_rc_reports_index`;
CREATE TABLE IF NOT EXISTS `d71b_rc_reports_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(2) NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL DEFAULT '',
  `img_preview` varchar(255) NOT NULL DEFAULT '',
  `rc_class` smallint(3) NOT NULL DEFAULT '0',
  `updated_by` mediumint(8) NOT NULL DEFAULT '0',
  `date_updated` int(10) NOT NULL DEFAULT '0',
  `date_created` int(10) NOT NULL DEFAULT '0',
  `exdat1` int(10) NOT NULL DEFAULT '0',
  `exdat2` int(10) NOT NULL DEFAULT '0',
  `exdat3` int(10) NOT NULL DEFAULT '0',
  `num_reports` smallint(4) NOT NULL DEFAULT '0',
  `num_comments` smallint(4) NOT NULL DEFAULT '0',
  `seoname` varchar(255) DEFAULT NULL,
  `seotemplate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_status`
--

DROP TABLE IF EXISTS `d71b_rc_status`;
CREATE TABLE IF NOT EXISTS `d71b_rc_status` (
  `status` tinyint(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `points_per_report` smallint(4) NOT NULL DEFAULT '1',
  `minutes_to_apoint` double NOT NULL DEFAULT '5',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rorder` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rc_status_sev`
--

DROP TABLE IF EXISTS `d71b_rc_status_sev`;
CREATE TABLE IF NOT EXISTS `d71b_rc_status_sev` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `points` smallint(4) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `is_png` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(3) NOT NULL DEFAULT '16',
  `height` smallint(3) NOT NULL DEFAULT '16',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`points`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_reputation_cache`
--

DROP TABLE IF EXISTS `d71b_reputation_cache`;
CREATE TABLE IF NOT EXISTS `d71b_reputation_cache` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `rep_points` int(10) NOT NULL DEFAULT '0',
  `rep_like_cache` mediumtext,
  `cache_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app` (`app`,`type`,`type_id`),
  KEY `cache_date` (`cache_date`),
  KEY `type` (`type`,`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6559 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_reputation_index`
--

DROP TABLE IF EXISTS `d71b_reputation_index`;
CREATE TABLE IF NOT EXISTS `d71b_reputation_index` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL,
  `app` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `rep_date` int(10) unsigned NOT NULL,
  `rep_msg` text NOT NULL,
  `rep_rating` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app` (`app`,`type`,`type_id`,`member_id`),
  KEY `member_rep` (`member_id`,`rep_rating`,`rep_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_reputation_levels`
--

DROP TABLE IF EXISTS `d71b_reputation_levels`;
CREATE TABLE IF NOT EXISTS `d71b_reputation_levels` (
  `level_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `level_points` int(10) NOT NULL,
  `level_title` varchar(255) NOT NULL,
  `level_image` varchar(255) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_reputation_totals`
--

DROP TABLE IF EXISTS `d71b_reputation_totals`;
CREATE TABLE IF NOT EXISTS `d71b_reputation_totals` (
  `rt_key` char(32) NOT NULL,
  `rt_app_type` char(32) NOT NULL,
  `rt_total` int(10) NOT NULL DEFAULT '0',
  `rt_type_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rt_key`),
  KEY `rt_app_type` (`rt_app_type`,`rt_total`),
  KEY `rt_type_id` (`rt_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rss_export`
--

DROP TABLE IF EXISTS `d71b_rss_export`;
CREATE TABLE IF NOT EXISTS `d71b_rss_export` (
  `rss_export_id` int(10) NOT NULL AUTO_INCREMENT,
  `rss_export_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rss_export_title` varchar(255) NOT NULL DEFAULT '',
  `rss_export_desc` varchar(255) NOT NULL DEFAULT '',
  `rss_export_image` varchar(255) NOT NULL DEFAULT '',
  `rss_export_forums` text,
  `rss_export_include_post` tinyint(1) NOT NULL DEFAULT '0',
  `rss_export_count` smallint(3) NOT NULL DEFAULT '0',
  `rss_export_cache_time` smallint(3) NOT NULL DEFAULT '30',
  `rss_export_cache_last` int(10) NOT NULL DEFAULT '0',
  `rss_export_cache_content` mediumtext,
  `rss_export_sort` varchar(4) NOT NULL DEFAULT 'DESC',
  `rss_export_order` varchar(20) NOT NULL DEFAULT 'start_date',
  PRIMARY KEY (`rss_export_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rss_import`
--

DROP TABLE IF EXISTS `d71b_rss_import`;
CREATE TABLE IF NOT EXISTS `d71b_rss_import` (
  `rss_import_id` int(10) NOT NULL AUTO_INCREMENT,
  `rss_import_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_title` varchar(255) NOT NULL DEFAULT '',
  `rss_import_url` varchar(255) NOT NULL DEFAULT '',
  `rss_import_forum_id` int(10) NOT NULL DEFAULT '0',
  `rss_import_mid` mediumint(8) NOT NULL DEFAULT '0',
  `rss_import_pergo` smallint(3) NOT NULL DEFAULT '0',
  `rss_import_time` smallint(3) NOT NULL DEFAULT '0',
  `rss_import_last_import` int(10) NOT NULL DEFAULT '0',
  `rss_import_showlink` varchar(255) NOT NULL DEFAULT '0',
  `rss_import_topic_open` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_topic_hide` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_topic_pre` varchar(50) NOT NULL DEFAULT '',
  `rss_import_allow_html` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_auth` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_auth_user` varchar(255) NOT NULL DEFAULT 'Not Needed',
  `rss_import_auth_pass` varchar(255) NOT NULL DEFAULT 'Not Needed',
  PRIMARY KEY (`rss_import_id`),
  KEY `rss_grab` (`rss_import_enabled`,`rss_import_last_import`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_rss_imported`
--

DROP TABLE IF EXISTS `d71b_rss_imported`;
CREATE TABLE IF NOT EXISTS `d71b_rss_imported` (
  `rss_imported_guid` char(32) NOT NULL DEFAULT '0',
  `rss_imported_tid` int(10) NOT NULL DEFAULT '0',
  `rss_imported_impid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rss_imported_guid`),
  KEY `rss_imported_impid` (`rss_imported_impid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_search_keywords`
--

DROP TABLE IF EXISTS `d71b_search_keywords`;
CREATE TABLE IF NOT EXISTS `d71b_search_keywords` (
  `keyword` varchar(250) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_keyword_unq` (`keyword`),
  KEY `idx_kw_cnt` (`keyword`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_search_sessions`
--

DROP TABLE IF EXISTS `d71b_search_sessions`;
CREATE TABLE IF NOT EXISTS `d71b_search_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_created` int(10) NOT NULL DEFAULT '0',
  `session_updated` int(10) NOT NULL DEFAULT '0',
  `session_member_id` int(10) NOT NULL DEFAULT '0',
  `session_data` mediumtext,
  PRIMARY KEY (`session_id`),
  KEY `session_updated` (`session_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_search_visitors`
--

DROP TABLE IF EXISTS `d71b_search_visitors`;
CREATE TABLE IF NOT EXISTS `d71b_search_visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member` int(11) DEFAULT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `engine` varchar(50) NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `url` varchar(2048) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_date_engine` (`date`,`engine`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_seo_acronyms`
--

DROP TABLE IF EXISTS `d71b_seo_acronyms`;
CREATE TABLE IF NOT EXISTS `d71b_seo_acronyms` (
  `a_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_short` varchar(255) DEFAULT NULL,
  `a_long` varchar(255) DEFAULT NULL,
  `a_semantic` tinyint(1) DEFAULT NULL,
  `a_casesensitive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`a_id`),
  KEY `a_short` (`a_short`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_seo_meta`
--

DROP TABLE IF EXISTS `d71b_seo_meta`;
CREATE TABLE IF NOT EXISTS `d71b_seo_meta` (
  `url` text,
  `name` varchar(50) NOT NULL DEFAULT '',
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_sessions`
--

DROP TABLE IF EXISTS `d71b_sessions`;
CREATE TABLE IF NOT EXISTS `d71b_sessions` (
  `id` varchar(60) NOT NULL DEFAULT '0',
  `member_name` varchar(255) DEFAULT NULL,
  `seo_name` varchar(255) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) DEFAULT NULL,
  `browser` varchar(200) NOT NULL DEFAULT '',
  `running_time` int(10) DEFAULT NULL,
  `login_type` tinyint(1) DEFAULT '0',
  `member_group` smallint(3) DEFAULT NULL,
  `in_error` tinyint(1) NOT NULL DEFAULT '0',
  `location_1_type` varchar(255) NOT NULL DEFAULT '',
  `location_1_id` int(10) NOT NULL DEFAULT '0',
  `location_2_type` varchar(255) NOT NULL DEFAULT '',
  `location_2_id` int(10) NOT NULL DEFAULT '0',
  `location_3_type` varchar(255) NOT NULL DEFAULT '',
  `location_3_id` int(10) NOT NULL DEFAULT '0',
  `current_appcomponent` varchar(100) NOT NULL DEFAULT '',
  `current_module` varchar(100) NOT NULL DEFAULT '',
  `current_section` varchar(100) NOT NULL DEFAULT '',
  `uagent_key` varchar(200) NOT NULL DEFAULT '',
  `uagent_version` varchar(100) NOT NULL DEFAULT '',
  `uagent_type` varchar(200) NOT NULL DEFAULT '',
  `uagent_bypass` int(1) NOT NULL DEFAULT '0',
  `search_thread_id` int(11) NOT NULL DEFAULT '0',
  `search_thread_time` int(11) NOT NULL DEFAULT '0',
  `session_msg_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location1` (`location_1_type`,`location_1_id`),
  KEY `location2` (`location_2_type`,`location_2_id`),
  KEY `location3` (`location_3_type`,`location_3_id`),
  KEY `running_time` (`running_time`),
  KEY `member_id` (`member_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_cache`
--

DROP TABLE IF EXISTS `d71b_skin_cache`;
CREATE TABLE IF NOT EXISTS `d71b_skin_cache` (
  `cache_id` int(10) NOT NULL AUTO_INCREMENT,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  `cache_type` varchar(200) NOT NULL DEFAULT '',
  `cache_set_id` int(10) NOT NULL DEFAULT '0',
  `cache_key_1` varchar(200) NOT NULL DEFAULT '',
  `cache_value_1` varchar(200) NOT NULL DEFAULT '',
  `cache_key_2` varchar(200) NOT NULL DEFAULT '',
  `cache_value_2` varchar(200) NOT NULL DEFAULT '',
  `cache_value_3` varchar(200) NOT NULL DEFAULT '',
  `cache_content` mediumtext NOT NULL,
  `cache_key_3` varchar(200) NOT NULL DEFAULT '',
  `cache_key_4` varchar(200) NOT NULL DEFAULT '',
  `cache_value_4` varchar(200) NOT NULL DEFAULT '',
  `cache_key_5` varchar(200) NOT NULL DEFAULT '',
  `cache_value_5` varchar(200) NOT NULL DEFAULT '',
  `cache_key_6` varchar(200) NOT NULL DEFAULT '',
  `cache_value_6` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`cache_id`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_set_id` (`cache_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2746 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_collections`
--

DROP TABLE IF EXISTS `d71b_skin_collections`;
CREATE TABLE IF NOT EXISTS `d71b_skin_collections` (
  `set_id` int(10) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(200) NOT NULL DEFAULT '',
  `set_key` varchar(100) NOT NULL DEFAULT '',
  `set_parent_id` int(5) NOT NULL DEFAULT '-1',
  `set_parent_array` mediumtext,
  `set_child_array` mediumtext,
  `set_permissions` text,
  `set_is_default` int(1) NOT NULL DEFAULT '0',
  `set_author_name` varchar(255) NOT NULL DEFAULT '',
  `set_author_url` varchar(255) NOT NULL DEFAULT '',
  `set_image_dir` varchar(255) NOT NULL DEFAULT 'default',
  `set_emo_dir` varchar(255) NOT NULL DEFAULT 'default',
  `set_css_inline` int(1) NOT NULL DEFAULT '0',
  `set_css_groups` text,
  `set_added` int(10) NOT NULL DEFAULT '0',
  `set_updated` int(10) NOT NULL DEFAULT '0',
  `set_output_format` varchar(200) NOT NULL DEFAULT 'html',
  `set_locked_uagent` mediumtext,
  `set_hide_from_list` int(1) NOT NULL DEFAULT '0',
  `set_minify` int(1) NOT NULL DEFAULT '0',
  `set_master_key` varchar(100) NOT NULL DEFAULT '',
  `set_order` int(10) NOT NULL,
  `set_by_skin_gen` int(1) NOT NULL DEFAULT '0',
  `set_skin_gen_data` mediumtext,
  PRIMARY KEY (`set_id`),
  KEY `parent_set_id` (`set_parent_id`,`set_id`),
  KEY `set_is_default` (`set_is_default`),
  KEY `set_order` (`set_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_css`
--

DROP TABLE IF EXISTS `d71b_skin_css`;
CREATE TABLE IF NOT EXISTS `d71b_skin_css` (
  `css_id` int(10) NOT NULL AUTO_INCREMENT,
  `css_set_id` int(10) NOT NULL DEFAULT '0',
  `css_updated` int(10) NOT NULL DEFAULT '0',
  `css_group` varchar(255) NOT NULL DEFAULT '0',
  `css_content` mediumtext,
  `css_position` int(10) NOT NULL DEFAULT '0',
  `css_added_to` int(10) NOT NULL DEFAULT '0',
  `css_app` varchar(200) NOT NULL DEFAULT '0',
  `css_app_hide` int(1) NOT NULL DEFAULT '0',
  `css_attributes` text,
  `css_modules` varchar(250) NOT NULL DEFAULT '',
  `css_removed` int(1) NOT NULL DEFAULT '0',
  `css_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`css_id`),
  KEY `css_set_id` (`css_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=330 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_css_previous`
--

DROP TABLE IF EXISTS `d71b_skin_css_previous`;
CREATE TABLE IF NOT EXISTS `d71b_skin_css_previous` (
  `p_css_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_css_group` varchar(255) NOT NULL DEFAULT '0',
  `p_css_content` mediumtext,
  `p_css_app` varchar(200) NOT NULL DEFAULT '0',
  `p_css_attributes` text,
  `p_css_modules` varchar(250) NOT NULL DEFAULT '',
  `p_css_master_key` varchar(100) NOT NULL DEFAULT '',
  `p_css_long_version` varchar(100) NOT NULL DEFAULT '',
  `p_css_human_version` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`p_css_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_generator_sessions`
--

DROP TABLE IF EXISTS `d71b_skin_generator_sessions`;
CREATE TABLE IF NOT EXISTS `d71b_skin_generator_sessions` (
  `sg_session_id` varchar(32) NOT NULL DEFAULT '',
  `sg_member_id` int(10) NOT NULL DEFAULT '0',
  `sg_skin_set_id` int(10) NOT NULL DEFAULT '0',
  `sg_date_start` int(10) NOT NULL DEFAULT '0',
  `sg_data` mediumtext,
  PRIMARY KEY (`sg_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_merge_changes`
--

DROP TABLE IF EXISTS `d71b_skin_merge_changes`;
CREATE TABLE IF NOT EXISTS `d71b_skin_merge_changes` (
  `change_id` int(10) NOT NULL AUTO_INCREMENT,
  `change_key` varchar(255) NOT NULL DEFAULT '',
  `change_session_id` int(10) NOT NULL DEFAULT '0',
  `change_updated` int(10) NOT NULL DEFAULT '0',
  `change_data_group` varchar(255) NOT NULL DEFAULT '',
  `change_data_title` varchar(255) NOT NULL DEFAULT '',
  `change_data_content` mediumtext,
  `change_data_type` varchar(10) NOT NULL DEFAULT 'template',
  `change_is_new` int(1) NOT NULL DEFAULT '0',
  `change_is_diff` int(1) NOT NULL DEFAULT '0',
  `change_can_merge` int(1) NOT NULL DEFAULT '0',
  `change_merge_content` mediumtext,
  `change_is_conflict` int(1) NOT NULL DEFAULT '0',
  `change_final_content` mediumtext,
  `change_changes_applied` int(1) NOT NULL DEFAULT '0',
  `change_original_content` mediumtext,
  PRIMARY KEY (`change_id`),
  KEY `change_key` (`change_key`,`change_data_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_merge_session`
--

DROP TABLE IF EXISTS `d71b_skin_merge_session`;
CREATE TABLE IF NOT EXISTS `d71b_skin_merge_session` (
  `merge_id` int(10) NOT NULL AUTO_INCREMENT,
  `merge_date` int(10) NOT NULL DEFAULT '0',
  `merge_set_id` int(10) NOT NULL DEFAULT '0',
  `merge_master_key` varchar(200) NOT NULL DEFAULT '',
  `merge_old_version` varchar(200) NOT NULL DEFAULT '',
  `merge_new_version` varchar(200) NOT NULL DEFAULT '',
  `merge_templates_togo` int(10) NOT NULL DEFAULT '0',
  `merge_css_togo` int(10) NOT NULL DEFAULT '0',
  `merge_templates_done` int(10) NOT NULL DEFAULT '0',
  `merge_css_done` int(10) NOT NULL DEFAULT '0',
  `merge_m_templates_togo` int(10) NOT NULL DEFAULT '0',
  `merge_m_css_togo` int(10) NOT NULL DEFAULT '0',
  `merge_m_templates_done` int(10) NOT NULL DEFAULT '0',
  `merge_m_css_done` int(10) NOT NULL DEFAULT '0',
  `merge_diff_done` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`merge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_replacements`
--

DROP TABLE IF EXISTS `d71b_skin_replacements`;
CREATE TABLE IF NOT EXISTS `d71b_skin_replacements` (
  `replacement_id` int(10) NOT NULL AUTO_INCREMENT,
  `replacement_key` varchar(255) NOT NULL DEFAULT '',
  `replacement_content` text,
  `replacement_set_id` int(10) NOT NULL DEFAULT '0',
  `replacement_added_to` int(10) NOT NULL DEFAULT '0',
  `replacement_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`replacement_id`),
  KEY `replacement_set_id` (`replacement_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=187 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_templates`
--

DROP TABLE IF EXISTS `d71b_skin_templates`;
CREATE TABLE IF NOT EXISTS `d71b_skin_templates` (
  `template_id` int(10) NOT NULL AUTO_INCREMENT,
  `template_set_id` int(10) NOT NULL DEFAULT '0',
  `template_group` varchar(255) NOT NULL DEFAULT '',
  `template_content` mediumtext,
  `template_name` varchar(255) DEFAULT NULL,
  `template_data` text,
  `template_updated` int(10) NOT NULL DEFAULT '0',
  `template_removable` int(4) NOT NULL DEFAULT '0',
  `template_added_to` int(10) NOT NULL DEFAULT '0',
  `template_user_added` int(11) NOT NULL DEFAULT '0',
  `template_user_edited` int(11) NOT NULL DEFAULT '0',
  `template_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  KEY `template_set_id` (`template_set_id`),
  KEY `template_master_key` (`template_master_key`),
  KEY `template_name` (`template_name`(100),`template_group`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7277 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_templates_cache`
--

DROP TABLE IF EXISTS `d71b_skin_templates_cache`;
CREATE TABLE IF NOT EXISTS `d71b_skin_templates_cache` (
  `template_id` varchar(32) NOT NULL DEFAULT '',
  `template_group_name` varchar(255) NOT NULL DEFAULT '',
  `template_group_content` mediumtext,
  `template_set_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_set_id` (`template_set_id`),
  KEY `template_group_name` (`template_group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_templates_previous`
--

DROP TABLE IF EXISTS `d71b_skin_templates_previous`;
CREATE TABLE IF NOT EXISTS `d71b_skin_templates_previous` (
  `p_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_template_group` varchar(255) NOT NULL DEFAULT '',
  `p_template_content` mediumtext,
  `p_template_name` varchar(255) DEFAULT NULL,
  `p_template_data` text,
  `p_template_master_key` varchar(100) NOT NULL DEFAULT '',
  `p_template_long_version` varchar(100) NOT NULL DEFAULT '',
  `p_template_human_version` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`p_template_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=875 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_skin_url_mapping`
--

DROP TABLE IF EXISTS `d71b_skin_url_mapping`;
CREATE TABLE IF NOT EXISTS `d71b_skin_url_mapping` (
  `map_id` int(10) NOT NULL AUTO_INCREMENT,
  `map_title` varchar(200) NOT NULL DEFAULT '',
  `map_match_type` varchar(10) NOT NULL DEFAULT 'contains',
  `map_url` varchar(200) NOT NULL DEFAULT '',
  `map_skin_set_id` int(10) unsigned NOT NULL DEFAULT '0',
  `map_date_added` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_spam_service_log`
--

DROP TABLE IF EXISTS `d71b_spam_service_log`;
CREATE TABLE IF NOT EXISTS `d71b_spam_service_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` int(10) unsigned NOT NULL,
  `log_code` smallint(1) unsigned NOT NULL,
  `log_msg` varchar(32) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `ip_address` varchar(46) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_spider_logs`
--

DROP TABLE IF EXISTS `d71b_spider_logs`;
CREATE TABLE IF NOT EXISTS `d71b_spider_logs` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `bot` varchar(255) NOT NULL DEFAULT '',
  `query_string` text,
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `request_addr` text,
  PRIMARY KEY (`sid`),
  KEY `entry_date` (`entry_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59904 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_tags_index`
--

DROP TABLE IF EXISTS `d71b_tags_index`;
CREATE TABLE IF NOT EXISTS `d71b_tags_index` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` bigint(10) unsigned NOT NULL,
  `type_2` varchar(32) NOT NULL,
  `type_id_2` bigint(10) unsigned NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `member_id` mediumint(8) unsigned NOT NULL,
  `tag_hidden` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `app` (`app`),
  KEY `tag_grab` (`app`,`type`,`type_id`,`type_2`,`type_id_2`,`tag_hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_tapatalk_push_data`
--

DROP TABLE IF EXISTS `d71b_tapatalk_push_data`;
CREATE TABLE IF NOT EXISTS `d71b_tapatalk_push_data` (
  `push_id` int(10) NOT NULL AUTO_INCREMENT,
  `author` varchar(100) NOT NULL,
  `user_id` int(10) NOT NULL,
  `data_type` char(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `data_id` int(10) NOT NULL,
  `create_time` int(10) NOT NULL,
  `sub_id` int(10) DEFAULT '0',
  `author_id` int(10) DEFAULT '0',
  PRIMARY KEY (`push_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_tapatalk_users`
--

DROP TABLE IF EXISTS `d71b_tapatalk_users`;
CREATE TABLE IF NOT EXISTS `d71b_tapatalk_users` (
  `userid` int(10) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_task_logs`
--

DROP TABLE IF EXISTS `d71b_task_logs`;
CREATE TABLE IF NOT EXISTS `d71b_task_logs` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(255) NOT NULL DEFAULT '',
  `log_date` int(10) NOT NULL DEFAULT '0',
  `log_ip` varchar(46) NOT NULL DEFAULT '0',
  `log_desc` text,
  PRIMARY KEY (`log_id`),
  KEY `log_date` (`log_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7369 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_task_manager`
--

DROP TABLE IF EXISTS `d71b_task_manager`;
CREATE TABLE IF NOT EXISTS `d71b_task_manager` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_title` varchar(255) NOT NULL DEFAULT '',
  `task_file` varchar(255) NOT NULL DEFAULT '',
  `task_next_run` int(10) NOT NULL DEFAULT '0',
  `task_week_day` smallint(1) NOT NULL DEFAULT '-1',
  `task_month_day` smallint(2) NOT NULL DEFAULT '-1',
  `task_hour` smallint(2) NOT NULL DEFAULT '-1',
  `task_minute` smallint(2) NOT NULL DEFAULT '-1',
  `task_cronkey` varchar(32) NOT NULL DEFAULT '',
  `task_log` tinyint(1) NOT NULL DEFAULT '0',
  `task_description` text,
  `task_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `task_key` varchar(30) NOT NULL DEFAULT '',
  `task_safemode` tinyint(1) NOT NULL DEFAULT '0',
  `task_locked` int(10) NOT NULL DEFAULT '0',
  `task_application` varchar(100) NOT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `task_key` (`task_application`,`task_key`),
  KEY `task_next_run` (`task_enabled`,`task_next_run`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_template_sandr`
--

DROP TABLE IF EXISTS `d71b_template_sandr`;
CREATE TABLE IF NOT EXISTS `d71b_template_sandr` (
  `sandr_session_id` int(10) NOT NULL AUTO_INCREMENT,
  `sandr_set_id` int(10) NOT NULL DEFAULT '0',
  `sandr_search_only` int(1) NOT NULL DEFAULT '0',
  `sandr_search_all` int(1) NOT NULL DEFAULT '0',
  `sandr_search_for` text,
  `sandr_replace_with` text,
  `sandr_is_regex` int(1) NOT NULL DEFAULT '0',
  `sandr_template_count` int(5) NOT NULL DEFAULT '0',
  `sandr_template_processed` int(5) NOT NULL DEFAULT '0',
  `sandr_results` mediumtext,
  `sandr_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sandr_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_titles`
--

DROP TABLE IF EXISTS `d71b_titles`;
CREATE TABLE IF NOT EXISTS `d71b_titles` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `posts` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `pips` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts` (`posts`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_topic_mmod`
--

DROP TABLE IF EXISTS `d71b_topic_mmod`;
CREATE TABLE IF NOT EXISTS `d71b_topic_mmod` (
  `mm_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `mm_title` varchar(250) NOT NULL DEFAULT '',
  `mm_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `topic_state` varchar(10) NOT NULL DEFAULT 'leave',
  `topic_pin` varchar(10) NOT NULL DEFAULT 'leave',
  `topic_move` smallint(5) NOT NULL DEFAULT '0',
  `topic_move_link` tinyint(1) NOT NULL DEFAULT '0',
  `topic_title_st` varchar(250) NOT NULL DEFAULT '',
  `topic_title_end` varchar(250) NOT NULL DEFAULT '',
  `topic_reply` tinyint(1) NOT NULL DEFAULT '0',
  `topic_reply_content` text,
  `topic_reply_postcount` tinyint(1) NOT NULL DEFAULT '0',
  `mm_forums` text,
  `topic_approve` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_topic_ratings`
--

DROP TABLE IF EXISTS `d71b_topic_ratings`;
CREATE TABLE IF NOT EXISTS `d71b_topic_ratings` (
  `rating_id` int(10) NOT NULL AUTO_INCREMENT,
  `rating_tid` int(10) NOT NULL DEFAULT '0',
  `rating_member_id` mediumint(8) NOT NULL DEFAULT '0',
  `rating_value` smallint(6) NOT NULL DEFAULT '0',
  `rating_ip_address` varchar(46) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`),
  KEY `rating_tid` (`rating_tid`,`rating_member_id`),
  KEY `rating_ip_address` (`rating_ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_topic_views`
--

DROP TABLE IF EXISTS `d71b_topic_views`;
CREATE TABLE IF NOT EXISTS `d71b_topic_views` (
  `views_tid` int(10) NOT NULL DEFAULT '0',
  KEY `views_tid` (`views_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_topics`
--

DROP TABLE IF EXISTS `d71b_topics`;
CREATE TABLE IF NOT EXISTS `d71b_topics` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(8) DEFAULT NULL,
  `posts` int(10) DEFAULT NULL,
  `starter_id` mediumint(8) NOT NULL DEFAULT '0',
  `start_date` int(10) DEFAULT NULL,
  `last_poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_post` int(10) DEFAULT NULL,
  `starter_name` varchar(255) DEFAULT NULL,
  `last_poster_name` varchar(255) DEFAULT NULL,
  `poll_state` varchar(8) DEFAULT NULL,
  `last_vote` int(10) DEFAULT NULL,
  `views` int(10) DEFAULT NULL,
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `author_mode` tinyint(1) DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT NULL,
  `moved_to` varchar(64) DEFAULT NULL,
  `topic_hasattach` smallint(5) NOT NULL DEFAULT '0',
  `topic_firstpost` int(10) NOT NULL DEFAULT '0',
  `topic_queuedposts` int(10) NOT NULL DEFAULT '0',
  `topic_open_time` int(10) NOT NULL DEFAULT '0',
  `topic_close_time` int(10) NOT NULL DEFAULT '0',
  `topic_rating_total` smallint(5) unsigned NOT NULL DEFAULT '0',
  `topic_rating_hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title_seo` varchar(250) NOT NULL DEFAULT '',
  `seo_last_name` varchar(255) NOT NULL DEFAULT '',
  `seo_first_name` varchar(255) NOT NULL DEFAULT '',
  `topic_deleted_posts` int(10) NOT NULL DEFAULT '0',
  `tdelete_time` int(11) NOT NULL DEFAULT '0',
  `moved_on` int(11) NOT NULL DEFAULT '0',
  `topic_archive_status` int(1) NOT NULL DEFAULT '0',
  `last_real_post` int(10) NOT NULL DEFAULT '0',
  `topic_answered_pid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `topic_firstpost` (`topic_firstpost`),
  KEY `last_post` (`forum_id`,`pinned`,`last_post`,`state`),
  KEY `forum_id` (`forum_id`,`pinned`,`approved`),
  KEY `starter_id` (`starter_id`,`forum_id`,`approved`,`start_date`),
  KEY `last_post_sorting` (`last_post`,`forum_id`),
  KEY `start_date` (`start_date`),
  KEY `last_x_topics` (`forum_id`,`approved`,`start_date`),
  KEY `approved` (`approved`,`tdelete_time`),
  KEY `moved_redirects` (`moved_on`,`moved_to`,`pinned`),
  KEY `topic_archive_status` (`topic_archive_status`,`forum_id`),
  KEY `last_poster_id` (`last_poster_id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_twitter_connect`
--

DROP TABLE IF EXISTS `d71b_twitter_connect`;
CREATE TABLE IF NOT EXISTS `d71b_twitter_connect` (
  `t_key` varchar(32) NOT NULL DEFAULT '',
  `t_token` varchar(255) NOT NULL DEFAULT '',
  `t_secret` varchar(255) NOT NULL DEFAULT '',
  `t_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_upgrade_history`
--

DROP TABLE IF EXISTS `d71b_upgrade_history`;
CREATE TABLE IF NOT EXISTS `d71b_upgrade_history` (
  `upgrade_id` int(10) NOT NULL AUTO_INCREMENT,
  `upgrade_version_id` int(10) NOT NULL DEFAULT '0',
  `upgrade_version_human` varchar(200) NOT NULL DEFAULT '',
  `upgrade_date` int(10) NOT NULL DEFAULT '0',
  `upgrade_mid` int(10) NOT NULL DEFAULT '0',
  `upgrade_notes` text,
  `upgrade_app` varchar(32) NOT NULL DEFAULT 'core',
  PRIMARY KEY (`upgrade_id`),
  KEY `upgrades` (`upgrade_app`,`upgrade_version_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_upgrade_sessions`
--

DROP TABLE IF EXISTS `d71b_upgrade_sessions`;
CREATE TABLE IF NOT EXISTS `d71b_upgrade_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_member_id` int(10) NOT NULL DEFAULT '0',
  `session_member_key` varchar(32) NOT NULL DEFAULT '',
  `session_start_time` int(10) NOT NULL DEFAULT '0',
  `session_current_time` int(10) NOT NULL DEFAULT '0',
  `session_ip_address` varchar(46) NOT NULL DEFAULT '',
  `session_section` varchar(32) NOT NULL DEFAULT '',
  `session_post` text,
  `session_get` text,
  `session_data` text,
  `session_extra` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_validating`
--

DROP TABLE IF EXISTS `d71b_validating`;
CREATE TABLE IF NOT EXISTS `d71b_validating` (
  `vid` varchar(32) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `real_group` smallint(3) NOT NULL DEFAULT '0',
  `temp_group` smallint(3) NOT NULL DEFAULT '0',
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `coppa_user` tinyint(1) NOT NULL DEFAULT '0',
  `lost_pass` tinyint(1) NOT NULL DEFAULT '0',
  `new_reg` tinyint(1) NOT NULL DEFAULT '0',
  `email_chg` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '0',
  `user_verified` tinyint(1) NOT NULL DEFAULT '0',
  `prev_email` varchar(150) NOT NULL DEFAULT '0',
  `spam_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `new_reg` (`new_reg`),
  KEY `ip_address` (`ip_address`),
  KEY `lost_pass` (`lost_pass`),
  KEY `coppa_user` (`coppa_user`),
  KEY `spam_flag` (`spam_flag`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_voters`
--

DROP TABLE IF EXISTS `d71b_voters`;
CREATE TABLE IF NOT EXISTS `d71b_voters` (
  `vid` int(10) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `vote_date` int(10) NOT NULL DEFAULT '0',
  `tid` int(10) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `member_choices` text,
  PRIMARY KEY (`vid`),
  KEY `tid` (`tid`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `d71b_warn_logs`
--

DROP TABLE IF EXISTS `d71b_warn_logs`;
CREATE TABLE IF NOT EXISTS `d71b_warn_logs` (
  `wlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `wlog_mid` mediumint(8) NOT NULL DEFAULT '0',
  `wlog_notes` text,
  `wlog_contact` varchar(250) NOT NULL DEFAULT 'none',
  `wlog_contact_content` text,
  `wlog_date` int(10) NOT NULL DEFAULT '0',
  `wlog_type` varchar(6) NOT NULL DEFAULT 'pos',
  `wlog_addedby` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wlog_id`),
  KEY `wlog_mid` (`wlog_mid`,`wlog_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_admin_login_logs`
--

DROP TABLE IF EXISTS `x2_admin_login_logs`;
CREATE TABLE IF NOT EXISTS `x2_admin_login_logs` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_ip_address` varchar(46) NOT NULL DEFAULT '0.0.0.0',
  `admin_username` varchar(40) NOT NULL DEFAULT '',
  `admin_time` int(10) unsigned NOT NULL DEFAULT '0',
  `admin_success` int(1) unsigned NOT NULL DEFAULT '0',
  `admin_post_details` text,
  PRIMARY KEY (`admin_id`),
  KEY `admin_ip_address` (`admin_ip_address`),
  KEY `admin_time` (`admin_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_admin_logs`
--

DROP TABLE IF EXISTS `x2_admin_logs`;
CREATE TABLE IF NOT EXISTS `x2_admin_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `ctime` int(10) DEFAULT '0',
  `note` text,
  `ip_address` varchar(46) DEFAULT NULL,
  `appcomponent` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(255) NOT NULL DEFAULT '',
  `do` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_admin_permission_rows`
--

DROP TABLE IF EXISTS `x2_admin_permission_rows`;
CREATE TABLE IF NOT EXISTS `x2_admin_permission_rows` (
  `row_id` int(8) NOT NULL,
  `row_id_type` varchar(13) NOT NULL DEFAULT 'member',
  `row_perm_cache` mediumtext,
  `row_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`row_id`,`row_id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_announcements`
--

DROP TABLE IF EXISTS `x2_announcements`;
CREATE TABLE IF NOT EXISTS `x2_announcements` (
  `announce_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `announce_title` varchar(255) NOT NULL DEFAULT '',
  `announce_post` text NOT NULL,
  `announce_forum` text,
  `announce_member_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `announce_html_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `announce_nlbr_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `announce_views` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_start` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_end` int(10) unsigned NOT NULL DEFAULT '0',
  `announce_active` tinyint(1) NOT NULL DEFAULT '1',
  `announce_seo_title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`announce_id`),
  KEY `announce_end` (`announce_end`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_api_log`
--

DROP TABLE IF EXISTS `x2_api_log`;
CREATE TABLE IF NOT EXISTS `x2_api_log` (
  `api_log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `api_log_key` varchar(32) NOT NULL,
  `api_log_ip` varchar(46) NOT NULL,
  `api_log_date` int(10) NOT NULL,
  `api_log_query` text NOT NULL,
  `api_log_allowed` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`api_log_id`),
  KEY `api_log_date` (`api_log_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_api_users`
--

DROP TABLE IF EXISTS `x2_api_users`;
CREATE TABLE IF NOT EXISTS `x2_api_users` (
  `api_user_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `api_user_key` char(32) NOT NULL,
  `api_user_name` varchar(32) NOT NULL,
  `api_user_perms` text NOT NULL,
  `api_user_ip` varchar(46) NOT NULL,
  PRIMARY KEY (`api_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_attachments`
--

DROP TABLE IF EXISTS `x2_attachments`;
CREATE TABLE IF NOT EXISTS `x2_attachments` (
  `attach_id` int(10) NOT NULL AUTO_INCREMENT,
  `attach_ext` varchar(10) NOT NULL DEFAULT '',
  `attach_file` varchar(250) NOT NULL DEFAULT '',
  `attach_location` varchar(250) NOT NULL DEFAULT '',
  `attach_thumb_location` varchar(250) NOT NULL DEFAULT '',
  `attach_thumb_width` smallint(5) NOT NULL DEFAULT '0',
  `attach_thumb_height` smallint(5) NOT NULL DEFAULT '0',
  `attach_is_image` tinyint(1) NOT NULL DEFAULT '0',
  `attach_hits` int(10) NOT NULL DEFAULT '0',
  `attach_date` int(10) NOT NULL DEFAULT '0',
  `attach_post_key` varchar(32) NOT NULL DEFAULT '0',
  `attach_member_id` int(8) NOT NULL DEFAULT '0',
  `attach_filesize` int(10) NOT NULL DEFAULT '0',
  `attach_rel_id` int(10) NOT NULL DEFAULT '0',
  `attach_rel_module` varchar(100) NOT NULL DEFAULT '0',
  `attach_img_width` int(5) NOT NULL DEFAULT '0',
  `attach_img_height` int(5) NOT NULL DEFAULT '0',
  `attach_parent_id` int(11) NOT NULL DEFAULT '0',
  `attach_is_archived` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `attach_pid` (`attach_rel_id`),
  KEY `attach_post_key` (`attach_post_key`),
  KEY `attach_mid_size` (`attach_member_id`,`attach_rel_module`,`attach_filesize`),
  KEY `attach_parent_id` (`attach_parent_id`,`attach_rel_module`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_attachments_type`
--

DROP TABLE IF EXISTS `x2_attachments_type`;
CREATE TABLE IF NOT EXISTS `x2_attachments_type` (
  `atype_id` int(10) NOT NULL AUTO_INCREMENT,
  `atype_extension` varchar(18) NOT NULL DEFAULT '',
  `atype_mimetype` varchar(255) NOT NULL DEFAULT '',
  `atype_post` tinyint(1) NOT NULL DEFAULT '1',
  `atype_img` text,
  PRIMARY KEY (`atype_id`),
  KEY `atype` (`atype_post`),
  KEY `atype_extension` (`atype_extension`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_badwords`
--

DROP TABLE IF EXISTS `x2_badwords`;
CREATE TABLE IF NOT EXISTS `x2_badwords` (
  `wid` int(3) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL DEFAULT '',
  `swop` varchar(250) DEFAULT NULL,
  `m_exact` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_banfilters`
--

DROP TABLE IF EXISTS `x2_banfilters`;
CREATE TABLE IF NOT EXISTS `x2_banfilters` (
  `ban_id` int(10) NOT NULL AUTO_INCREMENT,
  `ban_type` varchar(10) NOT NULL DEFAULT 'ip',
  `ban_content` text,
  `ban_date` int(10) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ban_id`),
  KEY `ban_content` (`ban_content`(200))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_bbcode_mediatag`
--

DROP TABLE IF EXISTS `x2_bbcode_mediatag`;
CREATE TABLE IF NOT EXISTS `x2_bbcode_mediatag` (
  `mediatag_id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `mediatag_name` varchar(255) NOT NULL,
  `mediatag_match` text,
  `mediatag_replace` text,
  `mediatag_position` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mediatag_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_bulk_mail`
--

DROP TABLE IF EXISTS `x2_bulk_mail`;
CREATE TABLE IF NOT EXISTS `x2_bulk_mail` (
  `mail_id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mail_content` mediumtext NOT NULL,
  `mail_groups` mediumtext,
  `mail_opts` mediumtext,
  `mail_start` int(10) NOT NULL DEFAULT '0',
  `mail_updated` int(10) NOT NULL DEFAULT '0',
  `mail_sentto` int(10) NOT NULL DEFAULT '0',
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_pergo` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_id`),
  KEY `mail_start` (`mail_start`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_cache_simple`
--

DROP TABLE IF EXISTS `x2_cache_simple`;
CREATE TABLE IF NOT EXISTS `x2_cache_simple` (
  `cache_id` varchar(32) NOT NULL DEFAULT '',
  `cache_perm_key` varchar(32) NOT NULL DEFAULT '',
  `cache_time` int(10) NOT NULL DEFAULT '0',
  `cache_data` mediumtext,
  UNIQUE KEY `lookup` (`cache_id`,`cache_perm_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_cache_store`
--

DROP TABLE IF EXISTS `x2_cache_store`;
CREATE TABLE IF NOT EXISTS `x2_cache_store` (
  `cs_key` varchar(255) NOT NULL DEFAULT '',
  `cs_value` mediumtext,
  `cs_array` tinyint(1) NOT NULL DEFAULT '0',
  `cs_updated` int(10) NOT NULL DEFAULT '0',
  `cs_rebuild` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cs_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_captcha`
--

DROP TABLE IF EXISTS `x2_captcha`;
CREATE TABLE IF NOT EXISTS `x2_captcha` (
  `captcha_unique_id` varchar(32) NOT NULL DEFAULT '',
  `captcha_string` varchar(100) NOT NULL DEFAULT '',
  `captcha_ipaddress` varchar(46) NOT NULL DEFAULT '',
  `captcha_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`captcha_unique_id`),
  KEY `captcha_date` (`captcha_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_content_cache_posts`
--

DROP TABLE IF EXISTS `x2_content_cache_posts`;
CREATE TABLE IF NOT EXISTS `x2_content_cache_posts` (
  `cache_content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_content` mediumtext,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_content_id`),
  KEY `date_index` (`cache_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_content_cache_sigs`
--

DROP TABLE IF EXISTS `x2_content_cache_sigs`;
CREATE TABLE IF NOT EXISTS `x2_content_cache_sigs` (
  `cache_content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache_content` mediumtext,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_content_id`),
  KEY `date_index` (`cache_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_converge_local`
--

DROP TABLE IF EXISTS `x2_converge_local`;
CREATE TABLE IF NOT EXISTS `x2_converge_local` (
  `converge_api_code` varchar(32) NOT NULL DEFAULT '',
  `converge_product_id` int(10) NOT NULL DEFAULT '0',
  `converge_added` int(10) NOT NULL DEFAULT '0',
  `converge_ip_address` varchar(46) NOT NULL DEFAULT '',
  `converge_url` varchar(255) NOT NULL DEFAULT '',
  `converge_active` int(1) NOT NULL DEFAULT '0',
  `converge_http_user` varchar(255) NOT NULL DEFAULT '',
  `converge_http_pass` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`converge_api_code`),
  KEY `converge_active` (`converge_active`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_applications`
--

DROP TABLE IF EXISTS `x2_core_applications`;
CREATE TABLE IF NOT EXISTS `x2_core_applications` (
  `app_id` int(10) NOT NULL AUTO_INCREMENT,
  `app_title` varchar(255) NOT NULL DEFAULT '',
  `app_public_title` varchar(255) NOT NULL DEFAULT '',
  `app_description` varchar(255) NOT NULL DEFAULT '',
  `app_author` varchar(255) NOT NULL DEFAULT '',
  `app_version` varchar(255) NOT NULL DEFAULT '',
  `app_long_version` int(10) NOT NULL DEFAULT '10000',
  `app_directory` varchar(255) NOT NULL DEFAULT '',
  `app_added` int(10) NOT NULL DEFAULT '0',
  `app_position` int(2) NOT NULL DEFAULT '0',
  `app_protected` int(1) NOT NULL DEFAULT '0',
  `app_enabled` int(1) NOT NULL DEFAULT '0',
  `app_location` varchar(32) NOT NULL DEFAULT '',
  `app_hide_tab` tinyint(1) NOT NULL DEFAULT '0',
  `app_tab_groups` text,
  `app_website` varchar(255) DEFAULT NULL,
  `app_update_check` varchar(255) DEFAULT NULL,
  `app_global_caches` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_id`),
  KEY `app_directory` (`app_directory`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_archive_log`
--

DROP TABLE IF EXISTS `x2_core_archive_log`;
CREATE TABLE IF NOT EXISTS `x2_core_archive_log` (
  `archlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `archlog_app` varchar(255) NOT NULL DEFAULT '0',
  `archlog_date` int(10) NOT NULL DEFAULT '0',
  `archlog_ids` mediumtext,
  `archlog_count` int(10) NOT NULL DEFAULT '0',
  `archlog_is_restore` int(1) NOT NULL DEFAULT '0',
  `archlog_is_error` int(1) NOT NULL DEFAULT '0',
  `archlog_msg` text,
  PRIMARY KEY (`archlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_archive_restore`
--

DROP TABLE IF EXISTS `x2_core_archive_restore`;
CREATE TABLE IF NOT EXISTS `x2_core_archive_restore` (
  `restore_min_tid` int(10) NOT NULL DEFAULT '0',
  `restore_max_tid` int(10) NOT NULL DEFAULT '0',
  `restore_manual_tids` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_archive_rules`
--

DROP TABLE IF EXISTS `x2_core_archive_rules`;
CREATE TABLE IF NOT EXISTS `x2_core_archive_rules` (
  `archive_key` char(32) NOT NULL DEFAULT '',
  `archive_app` varchar(32) NOT NULL DEFAULT 'core',
  `archive_field` varchar(255) NOT NULL DEFAULT '',
  `archive_value` varchar(255) NOT NULL DEFAULT '',
  `archive_text` text NOT NULL,
  `archive_unit` varchar(255) NOT NULL DEFAULT '',
  `archive_skip` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`archive_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_editor_autosave`
--

DROP TABLE IF EXISTS `x2_core_editor_autosave`;
CREATE TABLE IF NOT EXISTS `x2_core_editor_autosave` (
  `eas_key` char(32) NOT NULL,
  `eas_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `eas_app` varchar(50) NOT NULL DEFAULT '',
  `eas_section` varchar(100) NOT NULL DEFAULT '',
  `eas_updated` int(10) unsigned NOT NULL DEFAULT '0',
  `eas_content` mediumtext,
  UNIQUE KEY `eas_key` (`eas_key`),
  KEY `eas_member_lookup` (`eas_member_id`,`eas_app`,`eas_section`),
  KEY `eas_updated` (`eas_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_geolocation_cache`
--

DROP TABLE IF EXISTS `x2_core_geolocation_cache`;
CREATE TABLE IF NOT EXISTS `x2_core_geolocation_cache` (
  `geocache_key` varchar(32) NOT NULL,
  `geocache_lat` varchar(100) NOT NULL,
  `geocache_lon` varchar(100) NOT NULL,
  `geocache_raw` text,
  `geocache_country` varchar(255) NOT NULL DEFAULT '',
  `geocache_district` varchar(255) NOT NULL DEFAULT '',
  `geocache_district2` varchar(255) NOT NULL DEFAULT '',
  `geocache_locality` varchar(255) NOT NULL DEFAULT '',
  `geocache_type` varchar(255) NOT NULL DEFAULT '',
  `geocache_engine` varchar(255) NOT NULL DEFAULT '',
  `geocache_added` int(10) NOT NULL DEFAULT '0',
  `geocache_short` text,
  PRIMARY KEY (`geocache_key`),
  KEY `geo_lat_lon` (`geocache_lat`,`geocache_lon`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_hooks`
--

DROP TABLE IF EXISTS `x2_core_hooks`;
CREATE TABLE IF NOT EXISTS `x2_core_hooks` (
  `hook_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `hook_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `hook_name` varchar(255) DEFAULT NULL,
  `hook_desc` text,
  `hook_author` varchar(255) DEFAULT NULL,
  `hook_email` varchar(255) DEFAULT NULL,
  `hook_website` text,
  `hook_update_check` text,
  `hook_requirements` text,
  `hook_version_human` varchar(32) DEFAULT NULL,
  `hook_version_long` varchar(32) NOT NULL DEFAULT '0',
  `hook_installed` int(11) NOT NULL DEFAULT '0',
  `hook_updated` int(11) NOT NULL DEFAULT '0',
  `hook_position` mediumint(9) NOT NULL DEFAULT '0',
  `hook_extra_data` text,
  `hook_key` varchar(32) DEFAULT NULL,
  `hook_global_caches` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hook_id`),
  KEY `hook_enabled` (`hook_enabled`,`hook_position`),
  KEY `hook_key` (`hook_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_hooks_files`
--

DROP TABLE IF EXISTS `x2_core_hooks_files`;
CREATE TABLE IF NOT EXISTS `x2_core_hooks_files` (
  `hook_file_id` int(10) NOT NULL AUTO_INCREMENT,
  `hook_hook_id` int(10) NOT NULL DEFAULT '0',
  `hook_file_stored` varchar(255) DEFAULT NULL,
  `hook_file_real` varchar(255) DEFAULT NULL,
  `hook_type` varchar(32) DEFAULT NULL,
  `hook_classname` varchar(255) DEFAULT NULL,
  `hook_data` text,
  `hooks_source` longtext,
  PRIMARY KEY (`hook_file_id`),
  KEY `hook_hook_id` (`hook_hook_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_incoming_email_log`
--

DROP TABLE IF EXISTS `x2_core_incoming_email_log`;
CREATE TABLE IF NOT EXISTS `x2_core_incoming_email_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_email` varchar(255) DEFAULT NULL,
  `log_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_incoming_emails`
--

DROP TABLE IF EXISTS `x2_core_incoming_emails`;
CREATE TABLE IF NOT EXISTS `x2_core_incoming_emails` (
  `rule_id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_criteria_field` varchar(4) NOT NULL,
  `rule_criteria_type` varchar(4) NOT NULL,
  `rule_criteria_value` text NOT NULL,
  `rule_app` varchar(255) NOT NULL,
  `rule_added_by` mediumint(8) NOT NULL,
  `rule_added_date` int(10) NOT NULL,
  PRIMARY KEY (`rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_inline_messages`
--

DROP TABLE IF EXISTS `x2_core_inline_messages`;
CREATE TABLE IF NOT EXISTS `x2_core_inline_messages` (
  `inline_msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `inline_msg_date` int(10) NOT NULL DEFAULT '0',
  `inline_msg_content` text,
  PRIMARY KEY (`inline_msg_id`),
  KEY `inline_msg_date` (`inline_msg_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_item_markers`
--

DROP TABLE IF EXISTS `x2_core_item_markers`;
CREATE TABLE IF NOT EXISTS `x2_core_item_markers` (
  `item_key` char(32) NOT NULL,
  `item_member_id` int(8) NOT NULL DEFAULT '0',
  `item_app` varchar(255) NOT NULL DEFAULT 'core',
  `item_last_update` int(10) NOT NULL DEFAULT '0',
  `item_last_saved` int(10) NOT NULL DEFAULT '0',
  `item_unread_count` int(5) NOT NULL DEFAULT '0',
  `item_read_array` mediumtext,
  `item_global_reset` int(10) NOT NULL DEFAULT '0',
  `item_app_key_1` int(10) NOT NULL DEFAULT '0',
  `item_app_key_2` int(10) NOT NULL DEFAULT '0',
  `item_app_key_3` int(10) NOT NULL DEFAULT '0',
  `item_is_deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `combo_key` (`item_key`,`item_member_id`,`item_app`),
  KEY `marker_index` (`item_member_id`,`item_app`,`item_app_key_1`),
  KEY `item_last_saved` (`item_last_saved`),
  KEY `item_member_id` (`item_is_deleted`,`item_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_item_markers_storage`
--

DROP TABLE IF EXISTS `x2_core_item_markers_storage`;
CREATE TABLE IF NOT EXISTS `x2_core_item_markers_storage` (
  `item_member_id` int(8) NOT NULL DEFAULT '0',
  `item_markers` mediumtext,
  `item_last_updated` int(10) NOT NULL DEFAULT '0',
  `item_last_saved` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_member_id`),
  KEY `item_last_saved` (`item_last_saved`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_like`
--

DROP TABLE IF EXISTS `x2_core_like`;
CREATE TABLE IF NOT EXISTS `x2_core_like` (
  `like_id` varchar(32) NOT NULL DEFAULT '',
  `like_lookup_id` varchar(32) DEFAULT NULL,
  `like_lookup_area` varchar(32) NOT NULL DEFAULT '',
  `like_app` varchar(150) NOT NULL DEFAULT '',
  `like_area` varchar(200) NOT NULL DEFAULT '',
  `like_rel_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `like_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `like_is_anon` int(1) NOT NULL DEFAULT '0',
  `like_added` int(10) unsigned NOT NULL DEFAULT '0',
  `like_notify_do` int(1) NOT NULL DEFAULT '0',
  `like_notify_meta` text,
  `like_notify_freq` varchar(200) NOT NULL DEFAULT '',
  `like_notify_sent` int(10) unsigned NOT NULL DEFAULT '0',
  `like_visible` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`like_id`),
  KEY `find_rel_likes` (`like_lookup_id`,`like_visible`,`like_is_anon`,`like_added`),
  KEY `like_member_id` (`like_member_id`,`like_visible`,`like_added`),
  KEY `like_lookup_area` (`like_lookup_area`,`like_visible`),
  KEY `notification_task` (`like_notify_do`,`like_app`(50),`like_area`(50),`like_visible`,`like_notify_sent`,`like_notify_freq`(50))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_like_cache`
--

DROP TABLE IF EXISTS `x2_core_like_cache`;
CREATE TABLE IF NOT EXISTS `x2_core_like_cache` (
  `like_cache_id` varchar(32) NOT NULL DEFAULT '',
  `like_cache_app` varchar(150) NOT NULL DEFAULT '',
  `like_cache_area` varchar(200) NOT NULL DEFAULT '',
  `like_cache_rel_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `like_cache_data` text,
  `like_cache_expire` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`like_cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_rss_imported`
--

DROP TABLE IF EXISTS `x2_core_rss_imported`;
CREATE TABLE IF NOT EXISTS `x2_core_rss_imported` (
  `rss_guid` char(32) NOT NULL,
  `rss_foreign_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`rss_guid`),
  KEY `rss_grabber` (`rss_guid`,`rss_foreign_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_share_links`
--

DROP TABLE IF EXISTS `x2_core_share_links`;
CREATE TABLE IF NOT EXISTS `x2_core_share_links` (
  `share_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_title` varchar(255) NOT NULL DEFAULT '',
  `share_key` varchar(50) NOT NULL DEFAULT '',
  `share_enabled` int(1) NOT NULL DEFAULT '0',
  `share_position` int(3) NOT NULL DEFAULT '0',
  `share_canonical` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`share_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_share_links_caches`
--

DROP TABLE IF EXISTS `x2_core_share_links_caches`;
CREATE TABLE IF NOT EXISTS `x2_core_share_links_caches` (
  `cache_id` int(10) NOT NULL AUTO_INCREMENT,
  `cache_key` varchar(255) NOT NULL DEFAULT '',
  `cache_data` mediumtext,
  `cache_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_share_links_log`
--

DROP TABLE IF EXISTS `x2_core_share_links_log`;
CREATE TABLE IF NOT EXISTS `x2_core_share_links_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `log_date` int(10) NOT NULL DEFAULT '0',
  `log_member_id` int(10) NOT NULL DEFAULT '0',
  `log_url` text,
  `log_title` text,
  `log_share_key` varchar(50) NOT NULL DEFAULT '',
  `log_data_app` varchar(50) NOT NULL DEFAULT '',
  `log_data_type` varchar(50) NOT NULL DEFAULT '',
  `log_data_primary_id` int(10) NOT NULL DEFAULT '0',
  `log_data_secondary_id` int(10) NOT NULL DEFAULT '0',
  `log_ip_address` varchar(46) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`),
  KEY `findstuff` (`log_data_app`,`log_data_type`,`log_data_primary_id`),
  KEY `log_date` (`log_date`),
  KEY `log_member_id` (`log_member_id`),
  KEY `log_share_key` (`log_share_key`),
  KEY `log_ip_address` (`log_ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_soft_delete_log`
--

DROP TABLE IF EXISTS `x2_core_soft_delete_log`;
CREATE TABLE IF NOT EXISTS `x2_core_soft_delete_log` (
  `sdl_id` int(10) NOT NULL AUTO_INCREMENT,
  `sdl_obj_id` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_key` varchar(20) NOT NULL DEFAULT '',
  `sdl_obj_member_id` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_date` int(10) NOT NULL DEFAULT '0',
  `sdl_obj_reason` text,
  `sdl_locked` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sdl_id`),
  KEY `look_up` (`sdl_obj_id`,`sdl_obj_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_conf_settings`
--

DROP TABLE IF EXISTS `x2_core_sys_conf_settings`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_conf_settings` (
  `conf_id` int(10) NOT NULL AUTO_INCREMENT,
  `conf_title` varchar(255) NOT NULL DEFAULT '',
  `conf_description` text,
  `conf_group` smallint(3) NOT NULL DEFAULT '0',
  `conf_type` varchar(255) NOT NULL DEFAULT '',
  `conf_key` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text,
  `conf_default` text,
  `conf_extra` text,
  `conf_evalphp` text,
  `conf_protected` tinyint(1) NOT NULL DEFAULT '0',
  `conf_position` smallint(3) NOT NULL DEFAULT '0',
  `conf_start_group` varchar(255) NOT NULL DEFAULT '',
  `conf_add_cache` tinyint(1) NOT NULL DEFAULT '1',
  `conf_keywords` text,
  PRIMARY KEY (`conf_id`),
  KEY `conf_key` (`conf_key`),
  KEY `conf_group` (`conf_group`,`conf_position`,`conf_title`),
  KEY `conf_add_cache` (`conf_add_cache`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=305 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_cp_sessions`
--

DROP TABLE IF EXISTS `x2_core_sys_cp_sessions`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_cp_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_ip_address` varchar(46) NOT NULL DEFAULT '',
  `session_member_name` varchar(255) NOT NULL DEFAULT '',
  `session_member_id` mediumint(8) NOT NULL DEFAULT '0',
  `session_member_login_key` varchar(32) NOT NULL DEFAULT '',
  `session_location` varchar(64) NOT NULL DEFAULT '',
  `session_log_in_time` int(10) NOT NULL DEFAULT '0',
  `session_running_time` int(10) NOT NULL DEFAULT '0',
  `session_url` text,
  `session_app_data` text,
  PRIMARY KEY (`session_id`),
  KEY `session_running_time` (`session_running_time`),
  KEY `session_member_id` (`session_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_lang`
--

DROP TABLE IF EXISTS `x2_core_sys_lang`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_lang` (
  `lang_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `lang_short` varchar(32) NOT NULL DEFAULT '',
  `lang_title` varchar(255) NOT NULL DEFAULT '',
  `lang_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang_isrtl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang_protected` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_short` (`lang_short`),
  KEY `lang_default` (`lang_default`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_lang_words`
--

DROP TABLE IF EXISTS `x2_core_sys_lang_words`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_lang_words` (
  `word_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang_id` mediumint(4) unsigned NOT NULL,
  `word_app` varchar(255) NOT NULL,
  `word_pack` varchar(255) NOT NULL,
  `word_key` varchar(64) NOT NULL,
  `word_default` text NOT NULL,
  `word_custom` text,
  `word_default_version` varchar(10) NOT NULL DEFAULT '1',
  `word_custom_version` varchar(10) DEFAULT NULL,
  `word_js` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`word_id`),
  KEY `word_js` (`word_js`),
  KEY `word_find` (`lang_id`,`word_app`(32),`word_pack`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9838 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_login`
--

DROP TABLE IF EXISTS `x2_core_sys_login`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_login` (
  `sys_login_id` int(8) NOT NULL DEFAULT '0',
  `sys_cookie` mediumtext,
  PRIMARY KEY (`sys_login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_module`
--

DROP TABLE IF EXISTS `x2_core_sys_module`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_module` (
  `sys_module_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `sys_module_title` varchar(32) NOT NULL DEFAULT '',
  `sys_module_application` varchar(32) NOT NULL DEFAULT '',
  `sys_module_key` varchar(32) NOT NULL DEFAULT '',
  `sys_module_description` varchar(100) NOT NULL DEFAULT '',
  `sys_module_version` varchar(32) NOT NULL DEFAULT '',
  `sys_module_protected` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sys_module_visible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sys_module_position` int(5) NOT NULL DEFAULT '0',
  `sys_module_admin` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sys_module_id`),
  KEY `sys_module_application` (`sys_module_application`),
  KEY `sys_module_visible` (`sys_module_visible`),
  KEY `sys_module_key` (`sys_module_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_sys_settings_titles`
--

DROP TABLE IF EXISTS `x2_core_sys_settings_titles`;
CREATE TABLE IF NOT EXISTS `x2_core_sys_settings_titles` (
  `conf_title_id` smallint(3) NOT NULL AUTO_INCREMENT,
  `conf_title_title` varchar(255) NOT NULL DEFAULT '',
  `conf_title_desc` text,
  `conf_title_count` smallint(3) NOT NULL DEFAULT '0',
  `conf_title_noshow` tinyint(1) NOT NULL DEFAULT '0',
  `conf_title_keyword` varchar(200) NOT NULL DEFAULT '',
  `conf_title_app` varchar(200) NOT NULL DEFAULT '',
  `conf_title_tab` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`conf_title_id`),
  KEY `conf_title_keyword` (`conf_title_keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_tags`
--

DROP TABLE IF EXISTS `x2_core_tags`;
CREATE TABLE IF NOT EXISTS `x2_core_tags` (
  `tag_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_aai_lookup` char(32) NOT NULL DEFAULT '',
  `tag_aap_lookup` char(32) NOT NULL DEFAULT '',
  `tag_meta_app` varchar(200) NOT NULL DEFAULT '',
  `tag_meta_area` varchar(200) NOT NULL DEFAULT '',
  `tag_meta_id` int(10) NOT NULL DEFAULT '0',
  `tag_meta_parent_id` int(10) NOT NULL DEFAULT '0',
  `tag_member_id` int(10) NOT NULL DEFAULT '0',
  `tag_added` int(10) NOT NULL DEFAULT '0',
  `tag_prefix` int(1) NOT NULL DEFAULT '0',
  `tag_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `tag_aai_lookup` (`tag_aai_lookup`),
  KEY `tag_app` (`tag_meta_app`(100),`tag_meta_area`(100)),
  KEY `tag_member_id` (`tag_member_id`),
  KEY `tag_aap_lookup` (`tag_aap_lookup`,`tag_text`(200)),
  KEY `tag_added` (`tag_added`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_tags_cache`
--

DROP TABLE IF EXISTS `x2_core_tags_cache`;
CREATE TABLE IF NOT EXISTS `x2_core_tags_cache` (
  `tag_cache_key` char(32) NOT NULL DEFAULT '',
  `tag_cache_text` text,
  `tag_cache_date` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `tag_cache_key` (`tag_cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_tags_perms`
--

DROP TABLE IF EXISTS `x2_core_tags_perms`;
CREATE TABLE IF NOT EXISTS `x2_core_tags_perms` (
  `tag_perm_aai_lookup` char(32) NOT NULL DEFAULT '',
  `tag_perm_aap_lookup` char(32) NOT NULL DEFAULT '',
  `tag_perm_text` varchar(255) NOT NULL DEFAULT '',
  `tag_perm_visible` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `tag_perm_aai_lookup` (`tag_perm_aai_lookup`),
  KEY `tag_perm_aap_lookup` (`tag_perm_aap_lookup`),
  KEY `tag_lookup` (`tag_perm_text`,`tag_perm_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_uagent_groups`
--

DROP TABLE IF EXISTS `x2_core_uagent_groups`;
CREATE TABLE IF NOT EXISTS `x2_core_uagent_groups` (
  `ugroup_id` int(10) NOT NULL AUTO_INCREMENT,
  `ugroup_title` varchar(255) NOT NULL DEFAULT '',
  `ugroup_array` mediumtext,
  PRIMARY KEY (`ugroup_id`),
  KEY `ugroup_title` (`ugroup_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_core_uagents`
--

DROP TABLE IF EXISTS `x2_core_uagents`;
CREATE TABLE IF NOT EXISTS `x2_core_uagents` (
  `uagent_id` int(10) NOT NULL AUTO_INCREMENT,
  `uagent_key` varchar(200) NOT NULL DEFAULT '',
  `uagent_name` varchar(200) NOT NULL DEFAULT '',
  `uagent_regex` text,
  `uagent_regex_capture` int(1) NOT NULL DEFAULT '0',
  `uagent_type` varchar(200) NOT NULL DEFAULT '',
  `uagent_position` int(10) NOT NULL DEFAULT '0',
  `uagent_default_regex` text,
  PRIMARY KEY (`uagent_id`),
  KEY `uagent_key` (`uagent_key`),
  KEY `ordering` (`uagent_position`,`uagent_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=55 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_custom_bbcode`
--

DROP TABLE IF EXISTS `x2_custom_bbcode`;
CREATE TABLE IF NOT EXISTS `x2_custom_bbcode` (
  `bbcode_id` int(10) NOT NULL AUTO_INCREMENT,
  `bbcode_title` varchar(255) NOT NULL DEFAULT '',
  `bbcode_desc` text,
  `bbcode_tag` varchar(255) NOT NULL DEFAULT '',
  `bbcode_replace` text,
  `bbcode_useoption` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_example` text,
  `bbcode_switch_option` int(1) NOT NULL DEFAULT '0',
  `bbcode_menu_option_text` varchar(200) NOT NULL DEFAULT '',
  `bbcode_menu_content_text` varchar(200) NOT NULL DEFAULT '',
  `bbcode_single_tag` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_groups` varchar(255) DEFAULT NULL,
  `bbcode_sections` varchar(255) DEFAULT NULL,
  `bbcode_php_plugin` varchar(255) DEFAULT NULL,
  `bbcode_no_parsing` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_protected` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_aliases` varchar(255) DEFAULT NULL,
  `bbcode_optional_option` tinyint(1) NOT NULL DEFAULT '0',
  `bbcode_image` varchar(255) DEFAULT NULL,
  `bbcode_app` varchar(50) NOT NULL DEFAULT '',
  `bbcode_custom_regex` text,
  PRIMARY KEY (`bbcode_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_dnames_change`
--

DROP TABLE IF EXISTS `x2_dnames_change`;
CREATE TABLE IF NOT EXISTS `x2_dnames_change` (
  `dname_id` int(10) NOT NULL AUTO_INCREMENT,
  `dname_member_id` int(8) NOT NULL DEFAULT '0',
  `dname_date` int(10) NOT NULL DEFAULT '0',
  `dname_ip_address` varchar(46) NOT NULL DEFAULT '',
  `dname_previous` varchar(255) NOT NULL DEFAULT '',
  `dname_current` varchar(255) NOT NULL DEFAULT '',
  `dname_discount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dname_id`),
  KEY `dname_member_id` (`dname_member_id`),
  KEY `date_id` (`dname_member_id`,`dname_date`),
  KEY `dname_ip_address` (`dname_ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_emoticons`
--

DROP TABLE IF EXISTS `x2_emoticons`;
CREATE TABLE IF NOT EXISTS `x2_emoticons` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `typed` varchar(32) NOT NULL DEFAULT '',
  `image` varchar(128) NOT NULL DEFAULT '',
  `clickable` smallint(2) NOT NULL DEFAULT '1',
  `emo_set` varchar(64) NOT NULL DEFAULT 'default',
  `emo_position` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emo_set` (`emo_set`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_error_logs`
--

DROP TABLE IF EXISTS `x2_error_logs`;
CREATE TABLE IF NOT EXISTS `x2_error_logs` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_member` int(11) NOT NULL DEFAULT '0',
  `log_date` int(11) NOT NULL DEFAULT '0',
  `log_error` text,
  `log_error_code` varchar(24) NOT NULL DEFAULT '0',
  `log_ip_address` varchar(46) DEFAULT NULL,
  `log_request_uri` text,
  PRIMARY KEY (`log_id`),
  KEY `log_date` (`log_date`),
  KEY `log_ip_address` (`log_ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_faq`
--

DROP TABLE IF EXISTS `x2_faq`;
CREATE TABLE IF NOT EXISTS `x2_faq` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `text` text,
  `description` text,
  `position` smallint(3) NOT NULL DEFAULT '0',
  `app` varchar(32) NOT NULL DEFAULT 'core',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_forum_perms`
--

DROP TABLE IF EXISTS `x2_forum_perms`;
CREATE TABLE IF NOT EXISTS `x2_forum_perms` (
  `perm_id` int(10) NOT NULL AUTO_INCREMENT,
  `perm_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`perm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_forums`
--

DROP TABLE IF EXISTS `x2_forums`;
CREATE TABLE IF NOT EXISTS `x2_forums` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `topics` mediumint(6) DEFAULT NULL,
  `posts` mediumint(6) DEFAULT NULL,
  `last_post` int(10) DEFAULT NULL,
  `last_poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_poster_name` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `description` text,
  `position` int(5) unsigned DEFAULT '0',
  `use_ibc` tinyint(1) DEFAULT NULL,
  `use_html` tinyint(1) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `password_override` varchar(255) DEFAULT NULL,
  `last_title` varchar(250) DEFAULT NULL,
  `last_id` int(10) DEFAULT NULL,
  `sort_key` varchar(32) DEFAULT NULL,
  `sort_order` varchar(32) DEFAULT NULL,
  `prune` tinyint(3) DEFAULT NULL,
  `topicfilter` varchar(32) NOT NULL DEFAULT 'all',
  `show_rules` tinyint(1) DEFAULT NULL,
  `preview_posts` tinyint(1) DEFAULT NULL,
  `allow_poll` tinyint(1) NOT NULL DEFAULT '1',
  `allow_pollbump` tinyint(1) NOT NULL DEFAULT '0',
  `inc_postcount` tinyint(1) NOT NULL DEFAULT '1',
  `skin_id` int(10) DEFAULT NULL,
  `parent_id` mediumint(5) DEFAULT '-1',
  `redirect_url` varchar(250) DEFAULT '',
  `redirect_on` tinyint(1) NOT NULL DEFAULT '0',
  `redirect_hits` int(10) NOT NULL DEFAULT '0',
  `rules_title` varchar(255) NOT NULL DEFAULT '',
  `rules_text` text,
  `notify_modq_emails` text,
  `sub_can_post` tinyint(1) DEFAULT '1',
  `permission_custom_error` text,
  `permission_showtopic` tinyint(1) NOT NULL DEFAULT '0',
  `queued_topics` mediumint(6) NOT NULL DEFAULT '0',
  `queued_posts` mediumint(6) NOT NULL DEFAULT '0',
  `forum_allow_rating` tinyint(1) NOT NULL DEFAULT '0',
  `forum_last_deletion` int(10) NOT NULL DEFAULT '0',
  `newest_title` varchar(250) DEFAULT NULL,
  `newest_id` int(10) NOT NULL DEFAULT '0',
  `min_posts_post` int(10) unsigned NOT NULL,
  `min_posts_view` int(10) unsigned NOT NULL,
  `can_view_others` tinyint(1) NOT NULL DEFAULT '1',
  `hide_last_info` tinyint(1) NOT NULL DEFAULT '0',
  `name_seo` varchar(255) DEFAULT NULL,
  `seo_last_title` varchar(255) NOT NULL DEFAULT '',
  `seo_last_name` varchar(255) NOT NULL DEFAULT '',
  `last_x_topic_ids` text,
  `forums_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `disable_sharelinks` int(1) NOT NULL DEFAULT '0',
  `deleted_posts` int(10) NOT NULL DEFAULT '0',
  `deleted_topics` int(10) NOT NULL DEFAULT '0',
  `rules_raw_html` tinyint(1) NOT NULL DEFAULT '0',
  `tag_predefined` text,
  `archived_topics` int(10) NOT NULL DEFAULT '0',
  `archived_posts` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `position` (`position`,`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_forums_archive_posts`
--

DROP TABLE IF EXISTS `x2_forums_archive_posts`;
CREATE TABLE IF NOT EXISTS `x2_forums_archive_posts` (
  `archive_id` int(10) NOT NULL DEFAULT '0',
  `archive_author_id` int(10) NOT NULL DEFAULT '0',
  `archive_author_name` varchar(255) NOT NULL DEFAULT '0',
  `archive_ip_address` varchar(46) NOT NULL DEFAULT '',
  `archive_content_date` int(10) NOT NULL DEFAULT '0',
  `archive_content` mediumtext,
  `archive_queued` int(1) NOT NULL DEFAULT '1',
  `archive_topic_id` int(10) NOT NULL DEFAULT '0',
  `archive_is_first` int(1) NOT NULL DEFAULT '0',
  `archive_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `archive_attach_key` char(32) NOT NULL DEFAULT '',
  `archive_html_mode` int(1) NOT NULL DEFAULT '0',
  `archive_show_signature` int(1) NOT NULL DEFAULT '0',
  `archive_show_emoticons` int(1) NOT NULL DEFAULT '0',
  `archive_show_edited_by` int(1) NOT NULL DEFAULT '0',
  `archive_edit_time` int(10) NOT NULL DEFAULT '0',
  `archive_edit_name` varchar(255) NOT NULL DEFAULT '',
  `archive_edit_reason` varchar(255) NOT NULL DEFAULT '',
  `archive_added` int(10) NOT NULL DEFAULT '0',
  `archive_restored` int(1) NOT NULL DEFAULT '0',
  `archive_forum_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`archive_id`),
  KEY `archive_topic_id` (`archive_topic_id`,`archive_queued`,`archive_content_date`),
  KEY `archive_author_id` (`archive_author_id`),
  KEY `archive_restored` (`archive_restored`),
  KEY `archive_content_date` (`archive_content_date`,`archive_topic_id`),
  FULLTEXT KEY `archive_content` (`archive_content`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_forums_recent_posts`
--

DROP TABLE IF EXISTS `x2_forums_recent_posts`;
CREATE TABLE IF NOT EXISTS `x2_forums_recent_posts` (
  `post_id` int(10) NOT NULL DEFAULT '0',
  `post_topic_id` int(10) NOT NULL DEFAULT '0',
  `post_forum_id` int(10) NOT NULL DEFAULT '0',
  `post_author_id` int(10) NOT NULL DEFAULT '0',
  `post_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  KEY `group_lookup` (`post_author_id`,`post_forum_id`,`post_date`,`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_groups`
--

DROP TABLE IF EXISTS `x2_groups`;
CREATE TABLE IF NOT EXISTS `x2_groups` (
  `g_id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `g_view_board` tinyint(1) DEFAULT NULL,
  `g_mem_info` tinyint(1) DEFAULT NULL,
  `g_other_topics` tinyint(1) DEFAULT NULL,
  `g_use_search` tinyint(1) DEFAULT NULL,
  `g_edit_profile` tinyint(1) DEFAULT NULL,
  `g_post_new_topics` tinyint(1) DEFAULT NULL,
  `g_reply_own_topics` tinyint(1) DEFAULT NULL,
  `g_reply_other_topics` tinyint(1) DEFAULT NULL,
  `g_edit_posts` tinyint(1) DEFAULT NULL,
  `g_delete_own_posts` tinyint(1) DEFAULT NULL,
  `g_open_close_posts` tinyint(1) DEFAULT NULL,
  `g_delete_own_topics` tinyint(1) DEFAULT NULL,
  `g_post_polls` tinyint(1) DEFAULT NULL,
  `g_vote_polls` tinyint(1) DEFAULT NULL,
  `g_use_pm` tinyint(1) DEFAULT '0',
  `g_is_supmod` tinyint(1) DEFAULT NULL,
  `g_access_cp` tinyint(1) DEFAULT NULL,
  `g_title` varchar(32) NOT NULL DEFAULT '',
  `g_append_edit` tinyint(1) DEFAULT NULL,
  `g_access_offline` tinyint(1) DEFAULT NULL,
  `g_avoid_q` tinyint(1) DEFAULT NULL,
  `g_avoid_flood` tinyint(1) DEFAULT NULL,
  `g_icon` text,
  `g_attach_max` bigint(20) DEFAULT NULL,
  `prefix` varchar(250) DEFAULT NULL,
  `suffix` varchar(250) DEFAULT NULL,
  `g_max_messages` int(5) DEFAULT '50',
  `g_max_mass_pm` int(5) DEFAULT '0',
  `g_search_flood` mediumint(6) DEFAULT '20',
  `g_edit_cutoff` int(10) DEFAULT '0',
  `g_promotion` varchar(10) DEFAULT '-1&-1',
  `g_hide_from_list` tinyint(1) DEFAULT '0',
  `g_post_closed` tinyint(1) DEFAULT '0',
  `g_perm_id` varchar(255) NOT NULL DEFAULT '',
  `g_photo_max_vars` varchar(200) DEFAULT '100:200:300',
  `g_dohtml` tinyint(1) NOT NULL DEFAULT '0',
  `g_edit_topic` tinyint(1) NOT NULL DEFAULT '0',
  `g_bypass_badwords` tinyint(1) NOT NULL DEFAULT '0',
  `g_can_msg_attach` tinyint(1) NOT NULL DEFAULT '0',
  `g_attach_per_post` int(10) NOT NULL DEFAULT '0',
  `g_topic_rate_setting` smallint(2) NOT NULL DEFAULT '0',
  `g_dname_changes` int(3) NOT NULL DEFAULT '0',
  `g_dname_date` int(5) NOT NULL DEFAULT '0',
  `g_mod_preview` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `g_rep_max_positive` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `g_rep_max_negative` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `g_signature_limits` varchar(255) DEFAULT NULL,
  `g_can_add_friends` tinyint(1) NOT NULL DEFAULT '1',
  `g_hide_online_list` tinyint(1) NOT NULL DEFAULT '0',
  `g_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `g_pm_perday` smallint(6) NOT NULL DEFAULT '0',
  `g_mod_post_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_ppd_limit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_ppd_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_displayname_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_sig_unit` int(5) unsigned NOT NULL DEFAULT '0',
  `g_pm_flood_mins` int(5) unsigned NOT NULL DEFAULT '0',
  `g_max_notifications` mediumint(9) NOT NULL DEFAULT '0',
  `g_max_bgimg_upload` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`g_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_ignored_users`
--

DROP TABLE IF EXISTS `x2_ignored_users`;
CREATE TABLE IF NOT EXISTS `x2_ignored_users` (
  `ignore_id` int(10) NOT NULL AUTO_INCREMENT,
  `ignore_owner_id` int(8) NOT NULL DEFAULT '0',
  `ignore_ignore_id` int(8) NOT NULL DEFAULT '0',
  `ignore_messages` int(1) NOT NULL DEFAULT '0',
  `ignore_topics` int(1) NOT NULL DEFAULT '0',
  `ignore_signatures` int(1) NOT NULL DEFAULT '0',
  `ignore_chats` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ignore_id`),
  KEY `ignore_owner_id` (`ignore_owner_id`),
  KEY `ignore_ignore_id` (`ignore_ignore_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_inline_notifications`
--

DROP TABLE IF EXISTS `x2_inline_notifications`;
CREATE TABLE IF NOT EXISTS `x2_inline_notifications` (
  `notify_id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_to_id` int(11) NOT NULL DEFAULT '0',
  `notify_sent` int(10) NOT NULL DEFAULT '0',
  `notify_read` int(10) NOT NULL DEFAULT '0',
  `notify_title` text,
  `notify_text` text,
  `notify_from_id` int(11) NOT NULL DEFAULT '0',
  `notify_type_key` varchar(255) DEFAULT NULL,
  `notify_url` text,
  `notify_meta_app` varchar(50) DEFAULT NULL,
  `notify_meta_area` varchar(100) DEFAULT NULL,
  `notify_meta_id` int(10) NOT NULL DEFAULT '0',
  `notify_meta_key` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`notify_id`),
  KEY `notify_to_id` (`notify_to_id`,`notify_sent`),
  KEY `grabber` (`notify_to_id`,`notify_read`,`notify_sent`),
  KEY `notify_meta_key` (`notify_meta_key`),
  KEY `notify_from_id` (`notify_from_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_login_methods`
--

DROP TABLE IF EXISTS `x2_login_methods`;
CREATE TABLE IF NOT EXISTS `x2_login_methods` (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `login_title` varchar(255) NOT NULL DEFAULT '',
  `login_description` varchar(255) NOT NULL DEFAULT '',
  `login_folder_name` varchar(255) NOT NULL DEFAULT '',
  `login_maintain_url` varchar(255) NOT NULL DEFAULT '',
  `login_register_url` varchar(255) NOT NULL DEFAULT '',
  `login_alt_login_html` text,
  `login_alt_acp_html` text,
  `login_settings` int(1) NOT NULL DEFAULT '0',
  `login_enabled` int(1) NOT NULL DEFAULT '0',
  `login_safemode` int(1) NOT NULL DEFAULT '0',
  `login_replace_form` int(1) NOT NULL DEFAULT '0',
  `login_user_id` varchar(255) NOT NULL DEFAULT 'username',
  `login_login_url` varchar(255) NOT NULL DEFAULT '',
  `login_logout_url` varchar(255) NOT NULL DEFAULT '',
  `login_order` smallint(3) NOT NULL DEFAULT '0',
  `login_custom_config` text,
  PRIMARY KEY (`login_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mail_error_logs`
--

DROP TABLE IF EXISTS `x2_mail_error_logs`;
CREATE TABLE IF NOT EXISTS `x2_mail_error_logs` (
  `mlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `mlog_date` int(10) NOT NULL DEFAULT '0',
  `mlog_to` varchar(250) NOT NULL DEFAULT '',
  `mlog_from` varchar(250) NOT NULL DEFAULT '',
  `mlog_subject` varchar(250) NOT NULL DEFAULT '',
  `mlog_content` varchar(250) NOT NULL DEFAULT '',
  `mlog_msg` text,
  `mlog_code` varchar(200) NOT NULL DEFAULT '',
  `mlog_smtp_msg` text,
  PRIMARY KEY (`mlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mail_queue`
--

DROP TABLE IF EXISTS `x2_mail_queue`;
CREATE TABLE IF NOT EXISTS `x2_mail_queue` (
  `mail_id` int(10) NOT NULL AUTO_INCREMENT,
  `mail_date` int(10) NOT NULL DEFAULT '0',
  `mail_to` varchar(255) NOT NULL DEFAULT '',
  `mail_from` varchar(255) NOT NULL DEFAULT '',
  `mail_subject` text,
  `mail_content` text,
  `mail_html_on` int(1) NOT NULL DEFAULT '0',
  `mail_cc` text,
  PRIMARY KEY (`mail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_member_status_actions`
--

DROP TABLE IF EXISTS `x2_member_status_actions`;
CREATE TABLE IF NOT EXISTS `x2_member_status_actions` (
  `action_id` int(10) NOT NULL AUTO_INCREMENT,
  `action_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_reply_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `action_date` int(10) unsigned NOT NULL DEFAULT '0',
  `action_key` varchar(200) NOT NULL DEFAULT '',
  `action_status_owner` int(10) unsigned NOT NULL DEFAULT '0',
  `action_app` varchar(255) NOT NULL DEFAULT 'members',
  `action_custom_text` text,
  `action_custom` int(1) NOT NULL DEFAULT '0',
  `action_custom_url` text,
  PRIMARY KEY (`action_id`),
  KEY `action_status_id` (`action_status_id`),
  KEY `action_member_id` (`action_member_id`,`action_date`),
  KEY `action_date` (`action_date`),
  KEY `action_custom` (`action_custom`,`action_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_member_status_replies`
--

DROP TABLE IF EXISTS `x2_member_status_replies`;
CREATE TABLE IF NOT EXISTS `x2_member_status_replies` (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_status_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_date` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_content` text,
  PRIMARY KEY (`reply_id`),
  KEY `reply_status_id` (`reply_status_id`),
  KEY `reply_member_id` (`reply_member_id`),
  KEY `reply_status_count` (`reply_status_id`,`reply_member_id`),
  KEY `reply_date` (`reply_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_member_status_updates`
--

DROP TABLE IF EXISTS `x2_member_status_updates`;
CREATE TABLE IF NOT EXISTS `x2_member_status_updates` (
  `status_id` int(10) NOT NULL AUTO_INCREMENT,
  `status_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status_date` int(10) unsigned NOT NULL DEFAULT '0',
  `status_content` text,
  `status_replies` int(10) unsigned NOT NULL DEFAULT '0',
  `status_last_ids` text,
  `status_is_latest` int(1) NOT NULL DEFAULT '0',
  `status_is_locked` int(1) NOT NULL DEFAULT '0',
  `status_hash` varchar(32) NOT NULL DEFAULT '',
  `status_imported` int(1) NOT NULL DEFAULT '0',
  `status_creator` varchar(100) NOT NULL DEFAULT '',
  `status_author_id` int(10) NOT NULL DEFAULT '0',
  `status_author_ip` varchar(46) NOT NULL DEFAULT '',
  `status_approved` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`status_id`),
  KEY `status_date` (`status_date`),
  KEY `s_hash` (`status_member_id`,`status_hash`,`status_date`),
  KEY `status_is_latest` (`status_is_latest`,`status_date`),
  KEY `status_author_lookup` (`status_author_id`,`status_member_id`,`status_date`),
  KEY `status_member_id` (`status_member_id`,`status_approved`,`status_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_members`
--

DROP TABLE IF EXISTS `x2_members`;
CREATE TABLE IF NOT EXISTS `x2_members` (
  `member_id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `member_group_id` smallint(3) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '',
  `joined` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `posts` mediumint(7) DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `allow_admin_mails` tinyint(1) DEFAULT NULL,
  `time_offset` varchar(10) DEFAULT NULL,
  `skin` smallint(5) DEFAULT NULL,
  `warn_level` int(10) DEFAULT NULL,
  `warn_lastwarn` int(10) NOT NULL DEFAULT '0',
  `language` mediumint(4) DEFAULT NULL,
  `last_post` int(10) DEFAULT NULL,
  `restrict_post` varchar(100) NOT NULL DEFAULT '0',
  `view_sigs` tinyint(1) DEFAULT '1',
  `view_img` tinyint(1) DEFAULT '1',
  `bday_day` int(2) DEFAULT NULL,
  `bday_month` int(2) DEFAULT NULL,
  `bday_year` int(4) DEFAULT NULL,
  `msg_count_new` int(2) NOT NULL DEFAULT '0',
  `msg_count_total` int(3) NOT NULL DEFAULT '0',
  `msg_count_reset` int(1) NOT NULL DEFAULT '0',
  `msg_show_notification` int(1) NOT NULL DEFAULT '0',
  `misc` varchar(128) DEFAULT NULL,
  `last_visit` int(10) DEFAULT '0',
  `last_activity` int(10) DEFAULT '0',
  `dst_in_use` tinyint(1) DEFAULT '0',
  `coppa_user` tinyint(1) DEFAULT '0',
  `mod_posts` varchar(100) NOT NULL DEFAULT '0',
  `auto_track` varchar(50) DEFAULT '0',
  `temp_ban` varchar(100) DEFAULT '0',
  `login_anonymous` char(3) NOT NULL DEFAULT '0&0',
  `ignored_users` text,
  `mgroup_others` varchar(255) NOT NULL DEFAULT '',
  `org_perm_id` varchar(255) NOT NULL DEFAULT '',
  `member_login_key` varchar(32) NOT NULL DEFAULT '',
  `member_login_key_expire` int(10) NOT NULL DEFAULT '0',
  `has_blog` text,
  `blogs_recache` tinyint(1) DEFAULT NULL,
  `has_gallery` tinyint(1) NOT NULL DEFAULT '0',
  `members_auto_dst` tinyint(1) NOT NULL DEFAULT '1',
  `members_display_name` varchar(255) NOT NULL DEFAULT '',
  `members_seo_name` varchar(255) NOT NULL DEFAULT '',
  `members_created_remote` tinyint(1) NOT NULL DEFAULT '0',
  `members_cache` mediumtext,
  `members_disable_pm` int(1) NOT NULL DEFAULT '0',
  `members_l_display_name` varchar(255) NOT NULL DEFAULT '',
  `members_l_username` varchar(255) NOT NULL DEFAULT '',
  `failed_logins` text,
  `failed_login_count` smallint(3) NOT NULL DEFAULT '0',
  `members_profile_views` int(10) unsigned NOT NULL DEFAULT '0',
  `members_pass_hash` varchar(32) NOT NULL DEFAULT '',
  `members_pass_salt` varchar(5) NOT NULL DEFAULT '',
  `member_banned` tinyint(1) NOT NULL DEFAULT '0',
  `member_uploader` varchar(32) NOT NULL DEFAULT 'default',
  `members_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `fb_uid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fb_emailhash` varchar(60) NOT NULL DEFAULT '',
  `fb_lastsync` int(10) NOT NULL DEFAULT '0',
  `members_day_posts` varchar(32) NOT NULL DEFAULT '0,0',
  `live_id` varchar(32) DEFAULT NULL,
  `twitter_id` varchar(255) NOT NULL DEFAULT '',
  `twitter_token` varchar(255) NOT NULL DEFAULT '',
  `twitter_secret` varchar(255) NOT NULL DEFAULT '',
  `notification_cnt` mediumint(9) NOT NULL DEFAULT '0',
  `tc_lastsync` int(10) NOT NULL DEFAULT '0',
  `fb_session` varchar(200) NOT NULL DEFAULT '',
  `fb_token` text,
  `ips_mobile_token` varchar(64) DEFAULT NULL,
  `unacknowledged_warnings` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `members_l_display_name` (`members_l_display_name`),
  KEY `members_l_username` (`members_l_username`),
  KEY `mgroup` (`member_group_id`,`member_id`),
  KEY `member_groups` (`member_group_id`,`mgroup_others`),
  KEY `bday_day` (`bday_day`),
  KEY `bday_month` (`bday_month`),
  KEY `member_banned` (`member_banned`),
  KEY `members_bitoptions` (`members_bitoptions`),
  KEY `ip_address` (`ip_address`),
  KEY `failed_login_count` (`failed_login_count`),
  KEY `joined` (`joined`),
  KEY `fb_uid` (`fb_uid`),
  KEY `twitter_id` (`twitter_id`),
  KEY `email` (`email`),
  KEY `blogs_recache` (`blogs_recache`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_members_partial`
--

DROP TABLE IF EXISTS `x2_members_partial`;
CREATE TABLE IF NOT EXISTS `x2_members_partial` (
  `partial_id` int(10) NOT NULL AUTO_INCREMENT,
  `partial_member_id` int(8) NOT NULL DEFAULT '0',
  `partial_date` int(10) NOT NULL DEFAULT '0',
  `partial_email_ok` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`partial_id`),
  KEY `partial_member_id` (`partial_member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_members_warn_actions`
--

DROP TABLE IF EXISTS `x2_members_warn_actions`;
CREATE TABLE IF NOT EXISTS `x2_members_warn_actions` (
  `wa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wa_points` int(32) DEFAULT NULL,
  `wa_mq` int(2) DEFAULT NULL,
  `wa_mq_unit` char(1) DEFAULT NULL,
  `wa_rpa` int(2) DEFAULT NULL,
  `wa_rpa_unit` char(1) DEFAULT NULL,
  `wa_suspend` int(2) DEFAULT NULL,
  `wa_suspend_unit` char(1) DEFAULT NULL,
  `wa_ban_group` tinyint(1) DEFAULT NULL,
  `wa_override` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`wa_id`),
  KEY `wa_points` (`wa_points`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_members_warn_logs`
--

DROP TABLE IF EXISTS `x2_members_warn_logs`;
CREATE TABLE IF NOT EXISTS `x2_members_warn_logs` (
  `wl_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wl_member` mediumint(8) DEFAULT NULL,
  `wl_moderator` mediumint(8) DEFAULT NULL,
  `wl_date` int(10) DEFAULT NULL,
  `wl_reason` int(10) DEFAULT NULL,
  `wl_points` int(5) DEFAULT NULL,
  `wl_note_member` text,
  `wl_note_mods` text,
  `wl_mq` int(2) DEFAULT NULL,
  `wl_mq_unit` char(1) DEFAULT NULL,
  `wl_rpa` int(2) DEFAULT NULL,
  `wl_rpa_unit` char(1) DEFAULT NULL,
  `wl_suspend` int(2) DEFAULT NULL,
  `wl_suspend_unit` char(1) DEFAULT NULL,
  `wl_ban_group` tinyint(1) DEFAULT NULL,
  `wl_expire` int(2) DEFAULT NULL,
  `wl_expire_unit` char(1) DEFAULT NULL,
  `wl_acknowledged` tinyint(1) DEFAULT NULL,
  `wl_content_app` varchar(32) DEFAULT NULL,
  `wl_content_id1` varchar(32) DEFAULT NULL,
  `wl_content_id2` varchar(32) DEFAULT NULL,
  `wl_expire_date` int(10) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  KEY `wl_member` (`wl_member`),
  KEY `wl_moderator` (`wl_moderator`),
  KEY `wl_date` (`wl_member`,`wl_date`),
  KEY `content` (`wl_content_app`,`wl_content_id1`,`wl_content_id2`),
  KEY `wl_expire_date` (`wl_expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_members_warn_reasons`
--

DROP TABLE IF EXISTS `x2_members_warn_reasons`;
CREATE TABLE IF NOT EXISTS `x2_members_warn_reasons` (
  `wr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wr_name` varchar(255) DEFAULT NULL,
  `wr_points` float DEFAULT NULL,
  `wr_points_override` tinyint(1) DEFAULT NULL,
  `wr_remove` int(2) DEFAULT NULL,
  `wr_remove_unit` char(1) DEFAULT NULL,
  `wr_remove_override` tinyint(1) DEFAULT NULL,
  `wr_order` int(10) DEFAULT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `wr_order` (`wr_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_message_posts`
--

DROP TABLE IF EXISTS `x2_message_posts`;
CREATE TABLE IF NOT EXISTS `x2_message_posts` (
  `msg_id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_topic_id` int(10) NOT NULL DEFAULT '0',
  `msg_date` int(10) DEFAULT NULL,
  `msg_post` text,
  `msg_post_key` varchar(32) NOT NULL DEFAULT '0',
  `msg_author_id` mediumint(8) NOT NULL DEFAULT '0',
  `msg_ip_address` varchar(46) NOT NULL DEFAULT '0',
  `msg_is_first_post` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `msg_topic_id` (`msg_topic_id`),
  KEY `msg_date` (`msg_date`),
  KEY `msg_ip_address` (`msg_ip_address`),
  KEY `msg_author_id` (`msg_author_id`),
  FULLTEXT KEY `msg_post` (`msg_post`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_message_topic_user_map`
--

DROP TABLE IF EXISTS `x2_message_topic_user_map`;
CREATE TABLE IF NOT EXISTS `x2_message_topic_user_map` (
  `map_id` int(10) NOT NULL AUTO_INCREMENT,
  `map_user_id` int(10) NOT NULL DEFAULT '0',
  `map_topic_id` int(10) NOT NULL DEFAULT '0',
  `map_folder_id` varchar(32) NOT NULL DEFAULT '',
  `map_read_time` int(10) NOT NULL DEFAULT '0',
  `map_user_active` int(1) NOT NULL DEFAULT '0',
  `map_user_banned` int(1) NOT NULL DEFAULT '0',
  `map_has_unread` int(1) NOT NULL DEFAULT '0',
  `map_is_system` int(1) NOT NULL DEFAULT '0',
  `map_is_starter` int(1) NOT NULL DEFAULT '0',
  `map_left_time` int(10) NOT NULL DEFAULT '0',
  `map_ignore_notification` int(1) NOT NULL DEFAULT '0',
  `map_last_topic_reply` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`),
  UNIQUE KEY `map_main` (`map_user_id`,`map_topic_id`),
  KEY `map_user` (`map_user_id`,`map_folder_id`,`map_last_topic_reply`),
  KEY `map_topic_id` (`map_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_message_topics`
--

DROP TABLE IF EXISTS `x2_message_topics`;
CREATE TABLE IF NOT EXISTS `x2_message_topics` (
  `mt_id` int(10) NOT NULL AUTO_INCREMENT,
  `mt_date` int(10) NOT NULL DEFAULT '0',
  `mt_title` varchar(255) NOT NULL DEFAULT '',
  `mt_hasattach` smallint(5) NOT NULL DEFAULT '0',
  `mt_starter_id` int(10) NOT NULL DEFAULT '0',
  `mt_start_time` int(10) NOT NULL DEFAULT '0',
  `mt_last_post_time` int(10) NOT NULL DEFAULT '0',
  `mt_invited_members` text,
  `mt_to_count` int(3) NOT NULL DEFAULT '0',
  `mt_to_member_id` int(10) NOT NULL DEFAULT '0',
  `mt_replies` int(10) NOT NULL DEFAULT '0',
  `mt_last_msg_id` int(10) NOT NULL DEFAULT '0',
  `mt_first_msg_id` int(10) NOT NULL DEFAULT '0',
  `mt_is_draft` int(1) NOT NULL DEFAULT '0',
  `mt_is_deleted` int(1) NOT NULL DEFAULT '0',
  `mt_is_system` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mt_id`),
  KEY `mt_date` (`mt_date`),
  KEY `mt_starter_id` (`mt_starter_id`),
  FULLTEXT KEY `mt_title` (`mt_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mobile_app_style`
--

DROP TABLE IF EXISTS `x2_mobile_app_style`;
CREATE TABLE IF NOT EXISTS `x2_mobile_app_style` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `hasRetina` tinyint(1) NOT NULL DEFAULT '0',
  `isInUse` tinyint(1) NOT NULL DEFAULT '0',
  `lastUpdated` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mobile_device_map`
--

DROP TABLE IF EXISTS `x2_mobile_device_map`;
CREATE TABLE IF NOT EXISTS `x2_mobile_device_map` (
  `token` varchar(64) NOT NULL DEFAULT '',
  `member_id` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mobile_notifications`
--

DROP TABLE IF EXISTS `x2_mobile_notifications`;
CREATE TABLE IF NOT EXISTS `x2_mobile_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notify_title` text NOT NULL,
  `notify_date` int(10) unsigned NOT NULL,
  `member_id` mediumint(8) unsigned NOT NULL,
  `notify_sent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `notify_url` text,
  PRIMARY KEY (`id`),
  KEY `notify_sent` (`notify_sent`,`notify_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_mod_queued_items`
--

DROP TABLE IF EXISTS `x2_mod_queued_items`;
CREATE TABLE IF NOT EXISTS `x2_mod_queued_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT 'post',
  `type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_moderator_logs`
--

DROP TABLE IF EXISTS `x2_moderator_logs`;
CREATE TABLE IF NOT EXISTS `x2_moderator_logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `forum_id` int(5) DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `post_id` int(10) DEFAULT NULL,
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `member_name` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(46) NOT NULL DEFAULT '0',
  `http_referer` text,
  `ctime` int(10) DEFAULT NULL,
  `topic_title` text,
  `action` text,
  `query_string` text,
  PRIMARY KEY (`id`),
  KEY `ctime` (`ctime`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_moderators`
--

DROP TABLE IF EXISTS `x2_moderators`;
CREATE TABLE IF NOT EXISTS `x2_moderators` (
  `mid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `forum_id` text,
  `member_name` varchar(32) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `edit_post` tinyint(1) DEFAULT NULL,
  `edit_topic` tinyint(1) DEFAULT NULL,
  `delete_post` tinyint(1) DEFAULT NULL,
  `delete_topic` tinyint(1) DEFAULT NULL,
  `view_ip` tinyint(1) DEFAULT NULL,
  `open_topic` tinyint(1) DEFAULT NULL,
  `close_topic` tinyint(1) DEFAULT NULL,
  `mass_move` tinyint(1) DEFAULT NULL,
  `mass_prune` tinyint(1) DEFAULT NULL,
  `move_topic` tinyint(1) DEFAULT NULL,
  `pin_topic` tinyint(1) DEFAULT NULL,
  `unpin_topic` tinyint(1) DEFAULT NULL,
  `post_q` tinyint(1) DEFAULT NULL,
  `topic_q` tinyint(1) DEFAULT NULL,
  `allow_warn` tinyint(1) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT '0',
  `group_id` smallint(3) DEFAULT NULL,
  `group_name` varchar(200) DEFAULT NULL,
  `split_merge` tinyint(1) DEFAULT '0',
  `can_mm` tinyint(1) NOT NULL DEFAULT '0',
  `mod_can_set_open_time` tinyint(1) NOT NULL DEFAULT '0',
  `mod_can_set_close_time` tinyint(1) NOT NULL DEFAULT '0',
  `mod_bitoptions` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `group_id` (`group_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_permission_index`
--

DROP TABLE IF EXISTS `x2_permission_index`;
CREATE TABLE IF NOT EXISTS `x2_permission_index` (
  `perm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `perm_type` varchar(32) NOT NULL,
  `perm_type_id` int(10) unsigned NOT NULL,
  `perm_view` text NOT NULL,
  `perm_2` text,
  `perm_3` text,
  `perm_4` text,
  `perm_5` text,
  `perm_6` text,
  `perm_7` text,
  `owner_only` tinyint(1) NOT NULL DEFAULT '0',
  `friend_only` tinyint(1) NOT NULL DEFAULT '0',
  `authorized_users` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`perm_id`),
  KEY `perm_index` (`perm_type`,`perm_type_id`),
  KEY `perm_type` (`app`,`perm_type`,`perm_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_pfields_content`
--

DROP TABLE IF EXISTS `x2_pfields_content`;
CREATE TABLE IF NOT EXISTS `x2_pfields_content` (
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `field_1` text,
  `field_2` text,
  `field_3` text,
  `field_4` text,
  `field_5` text,
  `field_6` text,
  `field_7` text,
  `field_8` text,
  `field_9` text,
  `field_10` text,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_pfields_data`
--

DROP TABLE IF EXISTS `x2_pfields_data`;
CREATE TABLE IF NOT EXISTS `x2_pfields_data` (
  `pf_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `pf_title` varchar(250) NOT NULL DEFAULT '',
  `pf_desc` varchar(250) NOT NULL DEFAULT '',
  `pf_content` text,
  `pf_type` varchar(250) NOT NULL DEFAULT '',
  `pf_not_null` tinyint(1) NOT NULL DEFAULT '0',
  `pf_member_hide` tinyint(1) NOT NULL DEFAULT '0',
  `pf_max_input` smallint(6) NOT NULL DEFAULT '0',
  `pf_member_edit` tinyint(1) NOT NULL DEFAULT '0',
  `pf_position` smallint(6) NOT NULL DEFAULT '0',
  `pf_show_on_reg` tinyint(1) NOT NULL DEFAULT '0',
  `pf_input_format` text,
  `pf_admin_only` tinyint(1) NOT NULL DEFAULT '0',
  `pf_topic_format` text,
  `pf_group_id` mediumint(4) unsigned NOT NULL,
  `pf_icon` varchar(255) DEFAULT NULL,
  `pf_key` varchar(255) DEFAULT NULL,
  `pf_search_type` varchar(5) NOT NULL DEFAULT 'loose',
  `pf_filtering` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_pfields_groups`
--

DROP TABLE IF EXISTS `x2_pfields_groups`;
CREATE TABLE IF NOT EXISTS `x2_pfields_groups` (
  `pf_group_id` mediumint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pf_group_name` varchar(255) NOT NULL,
  `pf_group_key` varchar(255) NOT NULL,
  PRIMARY KEY (`pf_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_polls`
--

DROP TABLE IF EXISTS `x2_polls`;
CREATE TABLE IF NOT EXISTS `x2_polls` (
  `pid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL DEFAULT '0',
  `start_date` int(10) DEFAULT NULL,
  `choices` text,
  `starter_id` mediumint(8) NOT NULL DEFAULT '0',
  `votes` smallint(5) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `poll_question` varchar(255) DEFAULT NULL,
  `poll_only` tinyint(1) NOT NULL DEFAULT '0',
  `poll_view_voters` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_posts`
--

DROP TABLE IF EXISTS `x2_posts`;
CREATE TABLE IF NOT EXISTS `x2_posts` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `append_edit` tinyint(1) DEFAULT '0',
  `edit_time` int(10) DEFAULT NULL,
  `author_id` mediumint(8) NOT NULL DEFAULT '0',
  `author_name` varchar(255) DEFAULT NULL,
  `use_sig` tinyint(1) NOT NULL DEFAULT '0',
  `use_emo` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `post_date` int(10) DEFAULT NULL,
  `post` mediumtext,
  `queued` tinyint(1) NOT NULL DEFAULT '0',
  `topic_id` int(10) NOT NULL DEFAULT '0',
  `new_topic` tinyint(1) DEFAULT '0',
  `edit_name` varchar(255) DEFAULT NULL,
  `post_key` varchar(32) NOT NULL DEFAULT '0',
  `post_htmlstate` smallint(1) NOT NULL DEFAULT '0',
  `post_edit_reason` varchar(255) NOT NULL DEFAULT '',
  `post_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `pdelete_time` int(11) NOT NULL DEFAULT '0',
  `post_field_int` int(10) NOT NULL DEFAULT '0',
  `post_field_t1` text,
  `post_field_t2` text,
  PRIMARY KEY (`pid`),
  KEY `topic_id` (`topic_id`,`queued`,`pid`,`post_date`),
  KEY `author_id` (`author_id`,`post_date`,`queued`),
  KEY `post_date` (`post_date`),
  KEY `ip_address` (`ip_address`),
  KEY `post_key` (`post_key`),
  KEY `queued` (`queued`,`pdelete_time`),
  FULLTEXT KEY `post` (`post`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_profile_friends`
--

DROP TABLE IF EXISTS `x2_profile_friends`;
CREATE TABLE IF NOT EXISTS `x2_profile_friends` (
  `friends_id` int(10) NOT NULL AUTO_INCREMENT,
  `friends_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_approved` tinyint(1) NOT NULL DEFAULT '0',
  `friends_added` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`friends_id`),
  KEY `my_friends` (`friends_member_id`,`friends_friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_profile_friends_flood`
--

DROP TABLE IF EXISTS `x2_profile_friends_flood`;
CREATE TABLE IF NOT EXISTS `x2_profile_friends_flood` (
  `friends_id` int(10) NOT NULL AUTO_INCREMENT,
  `friends_member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_friend_id` int(10) unsigned NOT NULL DEFAULT '0',
  `friends_removed` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`friends_id`),
  KEY `my_friends` (`friends_member_id`,`friends_friend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_profile_portal`
--

DROP TABLE IF EXISTS `x2_profile_portal`;
CREATE TABLE IF NOT EXISTS `x2_profile_portal` (
  `pp_member_id` int(10) NOT NULL DEFAULT '0',
  `pp_last_visitors` text,
  `pp_rating_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_rating_value` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_rating_real` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_main_photo` varchar(255) NOT NULL DEFAULT '',
  `pp_main_width` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_main_height` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_thumb_photo` varchar(255) NOT NULL DEFAULT '',
  `pp_thumb_width` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_thumb_height` int(5) unsigned NOT NULL DEFAULT '0',
  `pp_setting_moderate_comments` tinyint(1) NOT NULL DEFAULT '0',
  `pp_setting_moderate_friends` tinyint(1) NOT NULL DEFAULT '0',
  `pp_setting_count_friends` int(2) NOT NULL DEFAULT '0',
  `pp_setting_count_comments` int(2) NOT NULL DEFAULT '0',
  `pp_setting_count_visitors` tinyint(1) NOT NULL DEFAULT '0',
  `pp_about_me` mediumtext,
  `pp_reputation_points` int(10) NOT NULL DEFAULT '0',
  `pp_gravatar` varchar(255) NOT NULL DEFAULT '',
  `pp_photo_type` varchar(20) NOT NULL DEFAULT '',
  `signature` text,
  `avatar_location` varchar(255) DEFAULT NULL,
  `avatar_size` varchar(9) NOT NULL DEFAULT '0',
  `avatar_type` varchar(15) DEFAULT NULL,
  `pconversation_filters` text,
  `fb_photo` text,
  `fb_photo_thumb` text,
  `fb_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `tc_last_sid_import` varchar(50) DEFAULT '0',
  `tc_photo` text,
  `tc_bwoptions` int(10) unsigned NOT NULL DEFAULT '0',
  `pp_customization` mediumtext,
  `pp_profile_update` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pp_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_profile_portal_views`
--

DROP TABLE IF EXISTS `x2_profile_portal_views`;
CREATE TABLE IF NOT EXISTS `x2_profile_portal_views` (
  `views_member_id` int(10) NOT NULL DEFAULT '0',
  KEY `views_member_id` (`views_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_profile_ratings`
--

DROP TABLE IF EXISTS `x2_profile_ratings`;
CREATE TABLE IF NOT EXISTS `x2_profile_ratings` (
  `rating_id` int(10) NOT NULL AUTO_INCREMENT,
  `rating_for_member_id` int(10) NOT NULL DEFAULT '0',
  `rating_by_member_id` int(10) NOT NULL DEFAULT '0',
  `rating_ip_address` varchar(46) NOT NULL DEFAULT '',
  `rating_value` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rating_id`),
  KEY `rating_for_member_id` (`rating_for_member_id`),
  KEY `rating_ip_address` (`rating_ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_question_and_answer`
--

DROP TABLE IF EXISTS `x2_question_and_answer`;
CREATE TABLE IF NOT EXISTS `x2_question_and_answer` (
  `qa_id` int(11) NOT NULL AUTO_INCREMENT,
  `qa_question` text,
  `qa_answers` text,
  PRIMARY KEY (`qa_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_classes`
--

DROP TABLE IF EXISTS `x2_rc_classes`;
CREATE TABLE IF NOT EXISTS `x2_rc_classes` (
  `com_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `onoff` tinyint(1) NOT NULL DEFAULT '0',
  `class_title` varchar(255) NOT NULL DEFAULT '',
  `class_desc` text NOT NULL,
  `author` varchar(255) NOT NULL DEFAULT '',
  `author_url` varchar(255) NOT NULL DEFAULT '',
  `pversion` varchar(255) NOT NULL DEFAULT '',
  `my_class` varchar(100) NOT NULL DEFAULT '',
  `group_can_report` text,
  `mod_group_perm` text,
  `extra_data` text NOT NULL,
  `lockd` tinyint(1) NOT NULL DEFAULT '0',
  `app` varchar(32) NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `onoff` (`onoff`,`mod_group_perm`(255))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_comments`
--

DROP TABLE IF EXISTS `x2_rc_comments`;
CREATE TABLE IF NOT EXISTS `x2_rc_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `comment_by` mediumint(8) NOT NULL DEFAULT '0',
  `comment_date` int(10) NOT NULL DEFAULT '0',
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  `edit_date` int(11) NOT NULL DEFAULT '0',
  `author_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_comments` (`rid`,`approved`,`comment_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_modpref`
--

DROP TABLE IF EXISTS `x2_rc_modpref`;
CREATE TABLE IF NOT EXISTS `x2_rc_modpref` (
  `mem_id` mediumint(8) NOT NULL DEFAULT '0',
  `rss_key` varchar(32) NOT NULL DEFAULT '',
  `rss_cache` mediumtext NOT NULL,
  PRIMARY KEY (`mem_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_reports`
--

DROP TABLE IF EXISTS `x2_rc_reports`;
CREATE TABLE IF NOT EXISTS `x2_rc_reports` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(11) NOT NULL DEFAULT '0',
  `report` mediumtext NOT NULL,
  `report_by` mediumint(8) NOT NULL DEFAULT '0',
  `date_reported` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_reports_index`
--

DROP TABLE IF EXISTS `x2_rc_reports_index`;
CREATE TABLE IF NOT EXISTS `x2_rc_reports_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `status` smallint(2) NOT NULL DEFAULT '1',
  `url` varchar(255) NOT NULL DEFAULT '',
  `img_preview` varchar(255) NOT NULL DEFAULT '',
  `rc_class` smallint(3) NOT NULL DEFAULT '0',
  `updated_by` mediumint(8) NOT NULL DEFAULT '0',
  `date_updated` int(10) NOT NULL DEFAULT '0',
  `date_created` int(10) NOT NULL DEFAULT '0',
  `exdat1` int(10) NOT NULL DEFAULT '0',
  `exdat2` int(10) NOT NULL DEFAULT '0',
  `exdat3` int(10) NOT NULL DEFAULT '0',
  `num_reports` smallint(4) NOT NULL DEFAULT '0',
  `num_comments` smallint(4) NOT NULL DEFAULT '0',
  `seoname` varchar(255) DEFAULT NULL,
  `seotemplate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_status`
--

DROP TABLE IF EXISTS `x2_rc_status`;
CREATE TABLE IF NOT EXISTS `x2_rc_status` (
  `status` tinyint(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `points_per_report` smallint(4) NOT NULL DEFAULT '1',
  `minutes_to_apoint` double NOT NULL DEFAULT '5',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_complete` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `rorder` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rc_status_sev`
--

DROP TABLE IF EXISTS `x2_rc_status_sev`;
CREATE TABLE IF NOT EXISTS `x2_rc_status_sev` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `points` smallint(4) NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `is_png` tinyint(1) NOT NULL DEFAULT '0',
  `width` smallint(3) NOT NULL DEFAULT '16',
  `height` smallint(3) NOT NULL DEFAULT '16',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`points`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_reputation_cache`
--

DROP TABLE IF EXISTS `x2_reputation_cache`;
CREATE TABLE IF NOT EXISTS `x2_reputation_cache` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `rep_points` int(10) NOT NULL DEFAULT '0',
  `rep_like_cache` mediumtext,
  `cache_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `app` (`app`,`type`,`type_id`),
  KEY `cache_date` (`cache_date`),
  KEY `type` (`type`,`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_reputation_index`
--

DROP TABLE IF EXISTS `x2_reputation_index`;
CREATE TABLE IF NOT EXISTS `x2_reputation_index` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL,
  `app` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `rep_date` int(10) unsigned NOT NULL,
  `rep_msg` text NOT NULL,
  `rep_rating` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app` (`app`,`type`,`type_id`,`member_id`),
  KEY `member_rep` (`member_id`,`rep_rating`,`rep_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_reputation_levels`
--

DROP TABLE IF EXISTS `x2_reputation_levels`;
CREATE TABLE IF NOT EXISTS `x2_reputation_levels` (
  `level_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `level_points` int(10) NOT NULL,
  `level_title` varchar(255) NOT NULL,
  `level_image` varchar(255) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_reputation_totals`
--

DROP TABLE IF EXISTS `x2_reputation_totals`;
CREATE TABLE IF NOT EXISTS `x2_reputation_totals` (
  `rt_key` char(32) NOT NULL,
  `rt_app_type` char(32) NOT NULL,
  `rt_total` int(10) NOT NULL DEFAULT '0',
  `rt_type_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rt_key`),
  KEY `rt_app_type` (`rt_app_type`,`rt_total`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rss_export`
--

DROP TABLE IF EXISTS `x2_rss_export`;
CREATE TABLE IF NOT EXISTS `x2_rss_export` (
  `rss_export_id` int(10) NOT NULL AUTO_INCREMENT,
  `rss_export_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rss_export_title` varchar(255) NOT NULL DEFAULT '',
  `rss_export_desc` varchar(255) NOT NULL DEFAULT '',
  `rss_export_image` varchar(255) NOT NULL DEFAULT '',
  `rss_export_forums` text,
  `rss_export_include_post` tinyint(1) NOT NULL DEFAULT '0',
  `rss_export_count` smallint(3) NOT NULL DEFAULT '0',
  `rss_export_cache_time` smallint(3) NOT NULL DEFAULT '30',
  `rss_export_cache_last` int(10) NOT NULL DEFAULT '0',
  `rss_export_cache_content` mediumtext,
  `rss_export_sort` varchar(4) NOT NULL DEFAULT 'DESC',
  `rss_export_order` varchar(20) NOT NULL DEFAULT 'start_date',
  PRIMARY KEY (`rss_export_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rss_import`
--

DROP TABLE IF EXISTS `x2_rss_import`;
CREATE TABLE IF NOT EXISTS `x2_rss_import` (
  `rss_import_id` int(10) NOT NULL AUTO_INCREMENT,
  `rss_import_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_title` varchar(255) NOT NULL DEFAULT '',
  `rss_import_url` varchar(255) NOT NULL DEFAULT '',
  `rss_import_forum_id` int(10) NOT NULL DEFAULT '0',
  `rss_import_mid` mediumint(8) NOT NULL DEFAULT '0',
  `rss_import_pergo` smallint(3) NOT NULL DEFAULT '0',
  `rss_import_time` smallint(3) NOT NULL DEFAULT '0',
  `rss_import_last_import` int(10) NOT NULL DEFAULT '0',
  `rss_import_showlink` varchar(255) NOT NULL DEFAULT '0',
  `rss_import_topic_open` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_topic_hide` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_topic_pre` varchar(50) NOT NULL DEFAULT '',
  `rss_import_allow_html` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_auth` tinyint(1) NOT NULL DEFAULT '0',
  `rss_import_auth_user` varchar(255) NOT NULL DEFAULT 'Not Needed',
  `rss_import_auth_pass` varchar(255) NOT NULL DEFAULT 'Not Needed',
  PRIMARY KEY (`rss_import_id`),
  KEY `rss_grab` (`rss_import_enabled`,`rss_import_last_import`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_rss_imported`
--

DROP TABLE IF EXISTS `x2_rss_imported`;
CREATE TABLE IF NOT EXISTS `x2_rss_imported` (
  `rss_imported_guid` char(32) NOT NULL DEFAULT '0',
  `rss_imported_tid` int(10) NOT NULL DEFAULT '0',
  `rss_imported_impid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rss_imported_guid`),
  KEY `rss_imported_impid` (`rss_imported_impid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_search_sessions`
--

DROP TABLE IF EXISTS `x2_search_sessions`;
CREATE TABLE IF NOT EXISTS `x2_search_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_created` int(10) NOT NULL DEFAULT '0',
  `session_updated` int(10) NOT NULL DEFAULT '0',
  `session_member_id` int(10) NOT NULL DEFAULT '0',
  `session_data` mediumtext,
  PRIMARY KEY (`session_id`),
  KEY `session_updated` (`session_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_sessions`
--

DROP TABLE IF EXISTS `x2_sessions`;
CREATE TABLE IF NOT EXISTS `x2_sessions` (
  `id` varchar(60) NOT NULL DEFAULT '0',
  `member_name` varchar(255) DEFAULT NULL,
  `seo_name` varchar(255) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) DEFAULT NULL,
  `browser` varchar(200) NOT NULL DEFAULT '',
  `running_time` int(10) DEFAULT NULL,
  `login_type` tinyint(1) DEFAULT '0',
  `member_group` smallint(3) DEFAULT NULL,
  `in_error` tinyint(1) NOT NULL DEFAULT '0',
  `location_1_type` varchar(255) NOT NULL DEFAULT '',
  `location_1_id` int(10) NOT NULL DEFAULT '0',
  `location_2_type` varchar(255) NOT NULL DEFAULT '',
  `location_2_id` int(10) NOT NULL DEFAULT '0',
  `location_3_type` varchar(255) NOT NULL DEFAULT '',
  `location_3_id` int(10) NOT NULL DEFAULT '0',
  `current_appcomponent` varchar(100) NOT NULL DEFAULT '',
  `current_module` varchar(100) NOT NULL DEFAULT '',
  `current_section` varchar(100) NOT NULL DEFAULT '',
  `uagent_key` varchar(200) NOT NULL DEFAULT '',
  `uagent_version` varchar(100) NOT NULL DEFAULT '',
  `uagent_type` varchar(200) NOT NULL DEFAULT '',
  `uagent_bypass` int(1) NOT NULL DEFAULT '0',
  `search_thread_id` int(11) NOT NULL DEFAULT '0',
  `search_thread_time` int(11) NOT NULL DEFAULT '0',
  `session_msg_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `location1` (`location_1_type`,`location_1_id`),
  KEY `location2` (`location_2_type`,`location_2_id`),
  KEY `location3` (`location_3_type`,`location_3_id`),
  KEY `running_time` (`running_time`),
  KEY `member_id` (`member_id`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_cache`
--

DROP TABLE IF EXISTS `x2_skin_cache`;
CREATE TABLE IF NOT EXISTS `x2_skin_cache` (
  `cache_id` int(10) NOT NULL AUTO_INCREMENT,
  `cache_updated` int(10) NOT NULL DEFAULT '0',
  `cache_type` varchar(200) NOT NULL DEFAULT '',
  `cache_set_id` int(10) NOT NULL DEFAULT '0',
  `cache_key_1` varchar(200) NOT NULL DEFAULT '',
  `cache_value_1` varchar(200) NOT NULL DEFAULT '',
  `cache_key_2` varchar(200) NOT NULL DEFAULT '',
  `cache_value_2` varchar(200) NOT NULL DEFAULT '',
  `cache_value_3` varchar(200) NOT NULL DEFAULT '',
  `cache_content` mediumtext NOT NULL,
  `cache_key_3` varchar(200) NOT NULL DEFAULT '',
  `cache_key_4` varchar(200) NOT NULL DEFAULT '',
  `cache_value_4` varchar(200) NOT NULL DEFAULT '',
  `cache_key_5` varchar(200) NOT NULL DEFAULT '',
  `cache_value_5` varchar(200) NOT NULL DEFAULT '',
  `cache_key_6` varchar(200) NOT NULL DEFAULT '',
  `cache_value_6` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`cache_id`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_set_id` (`cache_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=875 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_collections`
--

DROP TABLE IF EXISTS `x2_skin_collections`;
CREATE TABLE IF NOT EXISTS `x2_skin_collections` (
  `set_id` int(10) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(200) NOT NULL DEFAULT '',
  `set_key` varchar(100) NOT NULL DEFAULT '',
  `set_parent_id` int(5) NOT NULL DEFAULT '-1',
  `set_parent_array` mediumtext,
  `set_child_array` mediumtext,
  `set_permissions` text,
  `set_is_default` int(1) NOT NULL DEFAULT '0',
  `set_author_name` varchar(255) NOT NULL DEFAULT '',
  `set_author_url` varchar(255) NOT NULL DEFAULT '',
  `set_image_dir` varchar(255) NOT NULL DEFAULT 'default',
  `set_emo_dir` varchar(255) NOT NULL DEFAULT 'default',
  `set_css_inline` int(1) NOT NULL DEFAULT '0',
  `set_css_groups` text,
  `set_added` int(10) NOT NULL DEFAULT '0',
  `set_updated` int(10) NOT NULL DEFAULT '0',
  `set_output_format` varchar(200) NOT NULL DEFAULT 'html',
  `set_locked_uagent` mediumtext,
  `set_hide_from_list` int(1) NOT NULL DEFAULT '0',
  `set_minify` int(1) NOT NULL DEFAULT '0',
  `set_master_key` varchar(100) NOT NULL DEFAULT '',
  `set_order` int(10) NOT NULL,
  `set_by_skin_gen` int(1) NOT NULL DEFAULT '0',
  `set_skin_gen_data` mediumtext,
  PRIMARY KEY (`set_id`),
  KEY `parent_set_id` (`set_parent_id`,`set_id`),
  KEY `set_is_default` (`set_is_default`),
  KEY `set_order` (`set_order`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_css`
--

DROP TABLE IF EXISTS `x2_skin_css`;
CREATE TABLE IF NOT EXISTS `x2_skin_css` (
  `css_id` int(10) NOT NULL AUTO_INCREMENT,
  `css_set_id` int(10) NOT NULL DEFAULT '0',
  `css_updated` int(10) NOT NULL DEFAULT '0',
  `css_group` varchar(255) NOT NULL DEFAULT '0',
  `css_content` mediumtext,
  `css_position` int(10) NOT NULL DEFAULT '0',
  `css_added_to` int(10) NOT NULL DEFAULT '0',
  `css_app` varchar(200) NOT NULL DEFAULT '0',
  `css_app_hide` int(1) NOT NULL DEFAULT '0',
  `css_attributes` text,
  `css_modules` varchar(250) NOT NULL DEFAULT '',
  `css_removed` int(1) NOT NULL DEFAULT '0',
  `css_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`css_id`),
  KEY `css_set_id` (`css_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_css_previous`
--

DROP TABLE IF EXISTS `x2_skin_css_previous`;
CREATE TABLE IF NOT EXISTS `x2_skin_css_previous` (
  `p_css_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_css_group` varchar(255) NOT NULL DEFAULT '0',
  `p_css_content` mediumtext,
  `p_css_app` varchar(200) NOT NULL DEFAULT '0',
  `p_css_attributes` text,
  `p_css_modules` varchar(250) NOT NULL DEFAULT '',
  `p_css_master_key` varchar(100) NOT NULL DEFAULT '',
  `p_css_long_version` varchar(100) NOT NULL DEFAULT '',
  `p_css_human_version` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`p_css_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_generator_sessions`
--

DROP TABLE IF EXISTS `x2_skin_generator_sessions`;
CREATE TABLE IF NOT EXISTS `x2_skin_generator_sessions` (
  `sg_session_id` varchar(32) NOT NULL DEFAULT '',
  `sg_member_id` int(10) NOT NULL DEFAULT '0',
  `sg_skin_set_id` int(10) NOT NULL DEFAULT '0',
  `sg_date_start` int(10) NOT NULL DEFAULT '0',
  `sg_data` mediumtext,
  PRIMARY KEY (`sg_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_merge_changes`
--

DROP TABLE IF EXISTS `x2_skin_merge_changes`;
CREATE TABLE IF NOT EXISTS `x2_skin_merge_changes` (
  `change_id` int(10) NOT NULL AUTO_INCREMENT,
  `change_key` varchar(255) NOT NULL DEFAULT '',
  `change_session_id` int(10) NOT NULL DEFAULT '0',
  `change_updated` int(10) NOT NULL DEFAULT '0',
  `change_data_group` varchar(255) NOT NULL DEFAULT '',
  `change_data_title` varchar(255) NOT NULL DEFAULT '',
  `change_data_content` mediumtext,
  `change_data_type` varchar(10) NOT NULL DEFAULT 'template',
  `change_is_new` int(1) NOT NULL DEFAULT '0',
  `change_is_diff` int(1) NOT NULL DEFAULT '0',
  `change_can_merge` int(1) NOT NULL DEFAULT '0',
  `change_merge_content` mediumtext,
  `change_is_conflict` int(1) NOT NULL DEFAULT '0',
  `change_final_content` mediumtext,
  `change_changes_applied` int(1) NOT NULL DEFAULT '0',
  `change_original_content` mediumtext,
  PRIMARY KEY (`change_id`),
  KEY `change_key` (`change_key`,`change_data_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_merge_session`
--

DROP TABLE IF EXISTS `x2_skin_merge_session`;
CREATE TABLE IF NOT EXISTS `x2_skin_merge_session` (
  `merge_id` int(10) NOT NULL AUTO_INCREMENT,
  `merge_date` int(10) NOT NULL DEFAULT '0',
  `merge_set_id` int(10) NOT NULL DEFAULT '0',
  `merge_master_key` varchar(200) NOT NULL DEFAULT '',
  `merge_old_version` varchar(200) NOT NULL DEFAULT '',
  `merge_new_version` varchar(200) NOT NULL DEFAULT '',
  `merge_templates_togo` int(10) NOT NULL DEFAULT '0',
  `merge_css_togo` int(10) NOT NULL DEFAULT '0',
  `merge_templates_done` int(10) NOT NULL DEFAULT '0',
  `merge_css_done` int(10) NOT NULL DEFAULT '0',
  `merge_m_templates_togo` int(10) NOT NULL DEFAULT '0',
  `merge_m_css_togo` int(10) NOT NULL DEFAULT '0',
  `merge_m_templates_done` int(10) NOT NULL DEFAULT '0',
  `merge_m_css_done` int(10) NOT NULL DEFAULT '0',
  `merge_diff_done` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`merge_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_replacements`
--

DROP TABLE IF EXISTS `x2_skin_replacements`;
CREATE TABLE IF NOT EXISTS `x2_skin_replacements` (
  `replacement_id` int(10) NOT NULL AUTO_INCREMENT,
  `replacement_key` varchar(255) NOT NULL DEFAULT '',
  `replacement_content` text,
  `replacement_set_id` int(10) NOT NULL DEFAULT '0',
  `replacement_added_to` int(10) NOT NULL DEFAULT '0',
  `replacement_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`replacement_id`),
  KEY `replacement_set_id` (`replacement_set_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=280 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_templates`
--

DROP TABLE IF EXISTS `x2_skin_templates`;
CREATE TABLE IF NOT EXISTS `x2_skin_templates` (
  `template_id` int(10) NOT NULL AUTO_INCREMENT,
  `template_set_id` int(10) NOT NULL DEFAULT '0',
  `template_group` varchar(255) NOT NULL DEFAULT '',
  `template_content` mediumtext,
  `template_name` varchar(255) DEFAULT NULL,
  `template_data` text,
  `template_updated` int(10) NOT NULL DEFAULT '0',
  `template_removable` int(4) NOT NULL DEFAULT '0',
  `template_added_to` int(10) NOT NULL DEFAULT '0',
  `template_user_added` int(11) NOT NULL DEFAULT '0',
  `template_user_edited` int(11) NOT NULL DEFAULT '0',
  `template_master_key` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`template_id`),
  KEY `template_set_id` (`template_set_id`),
  KEY `template_master_key` (`template_master_key`),
  KEY `template_name` (`template_name`(100),`template_group`(100))
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=789 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_templates_cache`
--

DROP TABLE IF EXISTS `x2_skin_templates_cache`;
CREATE TABLE IF NOT EXISTS `x2_skin_templates_cache` (
  `template_id` varchar(32) NOT NULL DEFAULT '',
  `template_group_name` varchar(255) NOT NULL DEFAULT '',
  `template_group_content` mediumtext,
  `template_set_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_set_id` (`template_set_id`),
  KEY `template_group_name` (`template_group_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_templates_previous`
--

DROP TABLE IF EXISTS `x2_skin_templates_previous`;
CREATE TABLE IF NOT EXISTS `x2_skin_templates_previous` (
  `p_template_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_template_group` varchar(255) NOT NULL DEFAULT '',
  `p_template_content` mediumtext,
  `p_template_name` varchar(255) DEFAULT NULL,
  `p_template_data` text,
  `p_template_master_key` varchar(100) NOT NULL DEFAULT '',
  `p_template_long_version` varchar(100) NOT NULL DEFAULT '',
  `p_template_human_version` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`p_template_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_skin_url_mapping`
--

DROP TABLE IF EXISTS `x2_skin_url_mapping`;
CREATE TABLE IF NOT EXISTS `x2_skin_url_mapping` (
  `map_id` int(10) NOT NULL AUTO_INCREMENT,
  `map_title` varchar(200) NOT NULL DEFAULT '',
  `map_match_type` varchar(10) NOT NULL DEFAULT 'contains',
  `map_url` varchar(200) NOT NULL DEFAULT '',
  `map_skin_set_id` int(10) unsigned NOT NULL DEFAULT '0',
  `map_date_added` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_spam_service_log`
--

DROP TABLE IF EXISTS `x2_spam_service_log`;
CREATE TABLE IF NOT EXISTS `x2_spam_service_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_date` int(10) unsigned NOT NULL,
  `log_code` smallint(1) unsigned NOT NULL,
  `log_msg` varchar(32) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `ip_address` varchar(46) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_spider_logs`
--

DROP TABLE IF EXISTS `x2_spider_logs`;
CREATE TABLE IF NOT EXISTS `x2_spider_logs` (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `bot` varchar(255) NOT NULL DEFAULT '',
  `query_string` text,
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `request_addr` text,
  PRIMARY KEY (`sid`),
  KEY `entry_date` (`entry_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_tags_index`
--

DROP TABLE IF EXISTS `x2_tags_index`;
CREATE TABLE IF NOT EXISTS `x2_tags_index` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `type_id` bigint(10) unsigned NOT NULL,
  `type_2` varchar(32) NOT NULL,
  `type_id_2` bigint(10) unsigned NOT NULL,
  `updated` int(10) unsigned NOT NULL,
  `member_id` mediumint(8) unsigned NOT NULL,
  `tag_hidden` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `app` (`app`),
  KEY `tag_grab` (`app`,`type`,`type_id`,`type_2`,`type_id_2`,`tag_hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_task_logs`
--

DROP TABLE IF EXISTS `x2_task_logs`;
CREATE TABLE IF NOT EXISTS `x2_task_logs` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `log_title` varchar(255) NOT NULL DEFAULT '',
  `log_date` int(10) NOT NULL DEFAULT '0',
  `log_ip` varchar(46) NOT NULL DEFAULT '0',
  `log_desc` text,
  PRIMARY KEY (`log_id`),
  KEY `log_date` (`log_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=163 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_task_manager`
--

DROP TABLE IF EXISTS `x2_task_manager`;
CREATE TABLE IF NOT EXISTS `x2_task_manager` (
  `task_id` int(10) NOT NULL AUTO_INCREMENT,
  `task_title` varchar(255) NOT NULL DEFAULT '',
  `task_file` varchar(255) NOT NULL DEFAULT '',
  `task_next_run` int(10) NOT NULL DEFAULT '0',
  `task_week_day` smallint(1) NOT NULL DEFAULT '-1',
  `task_month_day` smallint(2) NOT NULL DEFAULT '-1',
  `task_hour` smallint(2) NOT NULL DEFAULT '-1',
  `task_minute` smallint(2) NOT NULL DEFAULT '-1',
  `task_cronkey` varchar(32) NOT NULL DEFAULT '',
  `task_log` tinyint(1) NOT NULL DEFAULT '0',
  `task_description` text,
  `task_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `task_key` varchar(30) NOT NULL DEFAULT '',
  `task_safemode` tinyint(1) NOT NULL DEFAULT '0',
  `task_locked` int(10) NOT NULL DEFAULT '0',
  `task_application` varchar(100) NOT NULL,
  PRIMARY KEY (`task_id`),
  UNIQUE KEY `task_key` (`task_application`,`task_key`),
  KEY `task_next_run` (`task_enabled`,`task_next_run`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_template_sandr`
--

DROP TABLE IF EXISTS `x2_template_sandr`;
CREATE TABLE IF NOT EXISTS `x2_template_sandr` (
  `sandr_session_id` int(10) NOT NULL AUTO_INCREMENT,
  `sandr_set_id` int(10) NOT NULL DEFAULT '0',
  `sandr_search_only` int(1) NOT NULL DEFAULT '0',
  `sandr_search_all` int(1) NOT NULL DEFAULT '0',
  `sandr_search_for` text,
  `sandr_replace_with` text,
  `sandr_is_regex` int(1) NOT NULL DEFAULT '0',
  `sandr_template_count` int(5) NOT NULL DEFAULT '0',
  `sandr_template_processed` int(5) NOT NULL DEFAULT '0',
  `sandr_results` mediumtext,
  `sandr_updated` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sandr_session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_titles`
--

DROP TABLE IF EXISTS `x2_titles`;
CREATE TABLE IF NOT EXISTS `x2_titles` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `posts` int(10) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `pips` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts` (`posts`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_topic_mmod`
--

DROP TABLE IF EXISTS `x2_topic_mmod`;
CREATE TABLE IF NOT EXISTS `x2_topic_mmod` (
  `mm_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `mm_title` varchar(250) NOT NULL DEFAULT '',
  `mm_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `topic_state` varchar(10) NOT NULL DEFAULT 'leave',
  `topic_pin` varchar(10) NOT NULL DEFAULT 'leave',
  `topic_move` smallint(5) NOT NULL DEFAULT '0',
  `topic_move_link` tinyint(1) NOT NULL DEFAULT '0',
  `topic_title_st` varchar(250) NOT NULL DEFAULT '',
  `topic_title_end` varchar(250) NOT NULL DEFAULT '',
  `topic_reply` tinyint(1) NOT NULL DEFAULT '0',
  `topic_reply_content` text,
  `topic_reply_postcount` tinyint(1) NOT NULL DEFAULT '0',
  `mm_forums` text,
  `topic_approve` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_topic_ratings`
--

DROP TABLE IF EXISTS `x2_topic_ratings`;
CREATE TABLE IF NOT EXISTS `x2_topic_ratings` (
  `rating_id` int(10) NOT NULL AUTO_INCREMENT,
  `rating_tid` int(10) NOT NULL DEFAULT '0',
  `rating_member_id` mediumint(8) NOT NULL DEFAULT '0',
  `rating_value` smallint(6) NOT NULL DEFAULT '0',
  `rating_ip_address` varchar(46) NOT NULL DEFAULT '',
  PRIMARY KEY (`rating_id`),
  KEY `rating_tid` (`rating_tid`,`rating_member_id`),
  KEY `rating_ip_address` (`rating_ip_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_topic_views`
--

DROP TABLE IF EXISTS `x2_topic_views`;
CREATE TABLE IF NOT EXISTS `x2_topic_views` (
  `views_tid` int(10) NOT NULL DEFAULT '0',
  KEY `views_tid` (`views_tid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_topics`
--

DROP TABLE IF EXISTS `x2_topics`;
CREATE TABLE IF NOT EXISTS `x2_topics` (
  `tid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL DEFAULT '',
  `state` varchar(8) DEFAULT NULL,
  `posts` int(10) DEFAULT NULL,
  `starter_id` mediumint(8) NOT NULL DEFAULT '0',
  `start_date` int(10) DEFAULT NULL,
  `last_poster_id` mediumint(8) NOT NULL DEFAULT '0',
  `last_post` int(10) DEFAULT NULL,
  `starter_name` varchar(255) DEFAULT NULL,
  `last_poster_name` varchar(255) DEFAULT NULL,
  `poll_state` varchar(8) DEFAULT NULL,
  `last_vote` int(10) DEFAULT NULL,
  `views` int(10) DEFAULT NULL,
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `author_mode` tinyint(1) DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT NULL,
  `moved_to` varchar(64) DEFAULT NULL,
  `topic_hasattach` smallint(5) NOT NULL DEFAULT '0',
  `topic_firstpost` int(10) NOT NULL DEFAULT '0',
  `topic_queuedposts` int(10) NOT NULL DEFAULT '0',
  `topic_open_time` int(10) NOT NULL DEFAULT '0',
  `topic_close_time` int(10) NOT NULL DEFAULT '0',
  `topic_rating_total` smallint(5) unsigned NOT NULL DEFAULT '0',
  `topic_rating_hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title_seo` varchar(250) NOT NULL DEFAULT '',
  `seo_last_name` varchar(255) NOT NULL DEFAULT '',
  `seo_first_name` varchar(255) NOT NULL DEFAULT '',
  `topic_deleted_posts` int(10) NOT NULL DEFAULT '0',
  `tdelete_time` int(11) NOT NULL DEFAULT '0',
  `moved_on` int(11) NOT NULL DEFAULT '0',
  `topic_archive_status` int(1) NOT NULL DEFAULT '0',
  `last_real_post` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `topic_firstpost` (`topic_firstpost`),
  KEY `last_post` (`forum_id`,`pinned`,`last_post`,`state`),
  KEY `forum_id` (`forum_id`,`pinned`,`approved`),
  KEY `starter_id` (`starter_id`,`forum_id`,`approved`,`start_date`),
  KEY `last_post_sorting` (`last_post`,`forum_id`),
  KEY `start_date` (`start_date`),
  KEY `last_x_topics` (`forum_id`,`approved`,`start_date`),
  KEY `approved` (`approved`,`tdelete_time`),
  KEY `moved_redirects` (`moved_on`,`moved_to`,`pinned`),
  KEY `topic_archive_status` (`topic_archive_status`,`forum_id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_twitter_connect`
--

DROP TABLE IF EXISTS `x2_twitter_connect`;
CREATE TABLE IF NOT EXISTS `x2_twitter_connect` (
  `t_key` varchar(32) NOT NULL DEFAULT '',
  `t_token` varchar(255) NOT NULL DEFAULT '',
  `t_secret` varchar(255) NOT NULL DEFAULT '',
  `t_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`t_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_upgrade_history`
--

DROP TABLE IF EXISTS `x2_upgrade_history`;
CREATE TABLE IF NOT EXISTS `x2_upgrade_history` (
  `upgrade_id` int(10) NOT NULL AUTO_INCREMENT,
  `upgrade_version_id` int(10) NOT NULL DEFAULT '0',
  `upgrade_version_human` varchar(200) NOT NULL DEFAULT '',
  `upgrade_date` int(10) NOT NULL DEFAULT '0',
  `upgrade_mid` int(10) NOT NULL DEFAULT '0',
  `upgrade_notes` text,
  `upgrade_app` varchar(32) NOT NULL DEFAULT 'core',
  PRIMARY KEY (`upgrade_id`),
  KEY `upgrades` (`upgrade_app`,`upgrade_version_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_upgrade_sessions`
--

DROP TABLE IF EXISTS `x2_upgrade_sessions`;
CREATE TABLE IF NOT EXISTS `x2_upgrade_sessions` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `session_member_id` int(10) NOT NULL DEFAULT '0',
  `session_member_key` varchar(32) NOT NULL DEFAULT '',
  `session_start_time` int(10) NOT NULL DEFAULT '0',
  `session_current_time` int(10) NOT NULL DEFAULT '0',
  `session_ip_address` varchar(46) NOT NULL DEFAULT '',
  `session_section` varchar(32) NOT NULL DEFAULT '',
  `session_post` text,
  `session_get` text,
  `session_data` text,
  `session_extra` text,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_validating`
--

DROP TABLE IF EXISTS `x2_validating`;
CREATE TABLE IF NOT EXISTS `x2_validating` (
  `vid` varchar(32) NOT NULL DEFAULT '',
  `member_id` mediumint(8) NOT NULL DEFAULT '0',
  `real_group` smallint(3) NOT NULL DEFAULT '0',
  `temp_group` smallint(3) NOT NULL DEFAULT '0',
  `entry_date` int(10) NOT NULL DEFAULT '0',
  `coppa_user` tinyint(1) NOT NULL DEFAULT '0',
  `lost_pass` tinyint(1) NOT NULL DEFAULT '0',
  `new_reg` tinyint(1) NOT NULL DEFAULT '0',
  `email_chg` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(46) NOT NULL DEFAULT '0',
  `user_verified` tinyint(1) NOT NULL DEFAULT '0',
  `prev_email` varchar(150) NOT NULL DEFAULT '0',
  `spam_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `new_reg` (`new_reg`),
  KEY `ip_address` (`ip_address`),
  KEY `lost_pass` (`lost_pass`),
  KEY `coppa_user` (`coppa_user`),
  KEY `spam_flag` (`spam_flag`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_voters`
--

DROP TABLE IF EXISTS `x2_voters`;
CREATE TABLE IF NOT EXISTS `x2_voters` (
  `vid` int(10) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(46) NOT NULL DEFAULT '',
  `vote_date` int(10) NOT NULL DEFAULT '0',
  `tid` int(10) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `forum_id` smallint(5) NOT NULL DEFAULT '0',
  `member_choices` text,
  PRIMARY KEY (`vid`),
  KEY `tid` (`tid`),
  KEY `ip_address` (`ip_address`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `x2_warn_logs`
--

DROP TABLE IF EXISTS `x2_warn_logs`;
CREATE TABLE IF NOT EXISTS `x2_warn_logs` (
  `wlog_id` int(10) NOT NULL AUTO_INCREMENT,
  `wlog_mid` mediumint(8) NOT NULL DEFAULT '0',
  `wlog_notes` text,
  `wlog_contact` varchar(250) NOT NULL DEFAULT 'none',
  `wlog_contact_content` text,
  `wlog_date` int(10) NOT NULL DEFAULT '0',
  `wlog_type` varchar(6) NOT NULL DEFAULT 'pos',
  `wlog_addedby` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wlog_id`),
  KEY `wlog_mid` (`wlog_mid`,`wlog_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Databank: `c7185zrc_db`
--
CREATE DATABASE `c7185zrc_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c7185zrc_db`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_banner`
--

DROP TABLE IF EXISTS `jos_banner`;
CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_bannerclient`
--

DROP TABLE IF EXISTS `jos_bannerclient`;
CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_bannertrack`
--

DROP TABLE IF EXISTS `jos_bannertrack`;
CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_components`
--

DROP TABLE IF EXISTS `jos_components`;
CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=178 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_acl_aro`
--

DROP TABLE IF EXISTS `jos_core_acl_aro`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_acl_aro_groups`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_acl_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_acl_aro_sections`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_acl_groups_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;
CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_log_items`
--

DROP TABLE IF EXISTS `jos_core_log_items`;
CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_dbcache`
--

DROP TABLE IF EXISTS `jos_dbcache`;
CREATE TABLE IF NOT EXISTS `jos_dbcache` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `groupname` varchar(32) NOT NULL DEFAULT '',
  `expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` mediumblob NOT NULL,
  PRIMARY KEY (`id`,`groupname`),
  KEY `expire` (`expire`,`groupname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_forme_config`
--

DROP TABLE IF EXISTS `jos_forme_config`;
CREATE TABLE IF NOT EXISTS `jos_forme_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL DEFAULT '',
  `setting_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_forme_data`
--

DROP TABLE IF EXISTS `jos_forme_data`;
CREATE TABLE IF NOT EXISTS `jos_forme_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uip` varchar(15) NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_forme_fields`
--

DROP TABLE IF EXISTS `jos_forme_fields`;
CREATE TABLE IF NOT EXISTS `jos_forme_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `fieldstyle` text NOT NULL,
  `description` text NOT NULL,
  `inputtype` varchar(255) NOT NULL DEFAULT 'text',
  `default_value` text NOT NULL,
  `params` text NOT NULL,
  `validation_rule` varchar(50) NOT NULL DEFAULT '',
  `validation_message` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_forme_forms`
--

DROP TABLE IF EXISTS `jos_forme_forms`;
CREATE TABLE IF NOT EXISTS `jos_forme_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `formstyle` text NOT NULL,
  `fieldstyle` text NOT NULL,
  `thankyou` text NOT NULL,
  `email` text NOT NULL,
  `emailto` text NOT NULL,
  `emailfrom` varchar(255) NOT NULL DEFAULT '',
  `emailfromname` varchar(255) NOT NULL DEFAULT '',
  `emailsubject` varchar(255) NOT NULL DEFAULT '',
  `emailmode` tinyint(4) NOT NULL DEFAULT '1',
  `return_url` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lang` varchar(10) NOT NULL,
  `script_process` text NOT NULL,
  `script_display` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_groups`
--

DROP TABLE IF EXISTS `jos_groups`;
CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsantileech`
--

DROP TABLE IF EXISTS `jos_hwdvidsantileech`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsantileech` (
  `index` int(8) NOT NULL AUTO_INCREMENT,
  `expiration` varchar(32) NOT NULL DEFAULT '',
  `count` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidscategories`
--

DROP TABLE IF EXISTS `jos_hwdvidscategories`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidscategories` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `parent` int(50) NOT NULL DEFAULT '0',
  `category_name` varchar(250) DEFAULT NULL,
  `category_description` text,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_b_v` tinyint(1) NOT NULL DEFAULT '0',
  `access_u_r` varchar(7) NOT NULL DEFAULT 'RECURSE',
  `access_v_r` varchar(7) NOT NULL DEFAULT 'RECURSE',
  `access_u` int(11) NOT NULL DEFAULT '-2',
  `access_lev_u` varchar(250) NOT NULL DEFAULT '0,1',
  `access_v` int(11) NOT NULL DEFAULT '-2',
  `access_lev_v` varchar(250) NOT NULL DEFAULT '0,1',
  `thumbnail` text NOT NULL,
  `num_vids` int(50) NOT NULL DEFAULT '0',
  `num_subcats` int(50) NOT NULL DEFAULT '0',
  `order_by` varchar(15) NOT NULL DEFAULT '0',
  `ordering` int(50) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidschannels`
--

DROP TABLE IF EXISTS `jos_hwdvidschannels`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidschannels` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `channel_name` text,
  `channel_description` text,
  `channel_thumbnail` text NOT NULL,
  `public_private` varchar(250) NOT NULL DEFAULT 'public',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(50) DEFAULT NULL,
  `views` int(50) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `channel_name` (`channel_name`,`channel_description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsfavorites`
--

DROP TABLE IF EXISTS `jos_hwdvidsfavorites`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsfavorites` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) DEFAULT NULL,
  `videoid` int(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsflagged_groups`
--

DROP TABLE IF EXISTS `jos_hwdvidsflagged_groups`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsflagged_groups` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) DEFAULT NULL,
  `groupid` int(50) DEFAULT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'Unread',
  `ignore` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsflagged_videos`
--

DROP TABLE IF EXISTS `jos_hwdvidsflagged_videos`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsflagged_videos` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) DEFAULT NULL,
  `videoid` int(50) DEFAULT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'Unread',
  `ignore` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsgroup_membership`
--

DROP TABLE IF EXISTS `jos_hwdvidsgroup_membership`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsgroup_membership` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `memberid` int(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `groupid` int(50) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsgroup_videos`
--

DROP TABLE IF EXISTS `jos_hwdvidsgroup_videos`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsgroup_videos` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `videoid` int(50) DEFAULT NULL,
  `groupid` int(50) DEFAULT NULL,
  `memberid` int(50) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsgroups`
--

DROP TABLE IF EXISTS `jos_hwdvidsgroups`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsgroups` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `group_name` text,
  `public_private` varchar(250) NOT NULL DEFAULT 'public',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `require_approval` tinyint(1) NOT NULL DEFAULT '0',
  `group_description` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` int(50) DEFAULT NULL,
  `thumbnail` text NOT NULL,
  `total_members` int(50) DEFAULT '0',
  `total_videos` int(50) DEFAULT '0',
  `ordering` int(50) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `group_name` (`group_name`,`group_description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsgs`
--

DROP TABLE IF EXISTS `jos_hwdvidsgs`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsgs` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `setting` varchar(250) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=275 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidslogs_archive`
--

DROP TABLE IF EXISTS `jos_hwdvidslogs_archive`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidslogs_archive` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `videoid` varchar(250) DEFAULT NULL,
  `views` int(50) NOT NULL DEFAULT '0',
  `number_of_votes` int(50) NOT NULL DEFAULT '0',
  `sum_of_votes` int(50) NOT NULL DEFAULT '0',
  `rating` int(50) NOT NULL DEFAULT '0',
  `favours` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidslogs_favours`
--

DROP TABLE IF EXISTS `jos_hwdvidslogs_favours`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidslogs_favours` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `videoid` int(50) NOT NULL DEFAULT '0',
  `userid` int(50) NOT NULL DEFAULT '0',
  `favour` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_videoid` (`videoid`),
  KEY `idx_date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidslogs_views`
--

DROP TABLE IF EXISTS `jos_hwdvidslogs_views`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidslogs_views` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `videoid` int(50) NOT NULL DEFAULT '0',
  `userid` int(50) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_videoid` (`videoid`),
  KEY `idx_date` (`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3013 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidslogs_votes`
--

DROP TABLE IF EXISTS `jos_hwdvidslogs_votes`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidslogs_votes` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `videoid` int(50) NOT NULL DEFAULT '0',
  `userid` int(50) NOT NULL DEFAULT '0',
  `vote` int(50) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_videoid` (`videoid`),
  KEY `idx_date` (`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1717 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsplaylists`
--

DROP TABLE IF EXISTS `jos_hwdvidsplaylists`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsplaylists` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `playlist_name` text,
  `playlist_description` text,
  `playlist_data` text,
  `public_private` varchar(250) NOT NULL DEFAULT 'public',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(50) DEFAULT NULL,
  `thumbnail` text NOT NULL,
  `total_videos` int(50) DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `playlist_name` (`playlist_name`,`playlist_description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsrating`
--

DROP TABLE IF EXISTS `jos_hwdvidsrating`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsrating` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) DEFAULT NULL,
  `videoid` int(50) DEFAULT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '192.168.100.1',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=347 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsss`
--

DROP TABLE IF EXISTS `jos_hwdvidsss`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsss` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `setting` varchar(250) DEFAULT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidssubs`
--

DROP TABLE IF EXISTS `jos_hwdvidssubs`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidssubs` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `userid` int(50) NOT NULL DEFAULT '0',
  `memberid` int(50) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsvideo_category`
--

DROP TABLE IF EXISTS `jos_hwdvidsvideo_category`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsvideo_category` (
  `videoid` int(50) NOT NULL DEFAULT '0',
  `categoryid` int(50) NOT NULL DEFAULT '0',
  KEY `idx_videoid` (`videoid`),
  KEY `idx_categoryid` (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_hwdvidsvideos`
--

DROP TABLE IF EXISTS `jos_hwdvidsvideos`;
CREATE TABLE IF NOT EXISTS `jos_hwdvidsvideos` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `video_type` varchar(250) DEFAULT NULL,
  `video_id` text,
  `title` text,
  `description` text,
  `tags` text,
  `category_id` int(50) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `video_length` varchar(250) DEFAULT NULL,
  `allow_comments` tinyint(1) NOT NULL DEFAULT '0',
  `allow_embedding` tinyint(1) NOT NULL DEFAULT '0',
  `allow_ratings` tinyint(1) NOT NULL DEFAULT '0',
  `rating_number_votes` int(50) DEFAULT '0',
  `rating_total_points` int(50) DEFAULT '0',
  `updated_rating` float(4,2) DEFAULT '0.00',
  `public_private` varchar(250) DEFAULT NULL,
  `thumb_snap` varchar(7) DEFAULT '0:00:00',
  `thumbnail` text NOT NULL,
  `approved` varchar(250) DEFAULT NULL,
  `number_of_views` int(50) DEFAULT '0',
  `number_of_comments` int(50) DEFAULT '0',
  `age_check` int(50) DEFAULT '-1',
  `user_id` int(50) DEFAULT NULL,
  `password` varchar(100) NOT NULL DEFAULT '',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(50) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`,`tags`,`description`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_jf_content`
--

DROP TABLE IF EXISTS `jos_jf_content`;
CREATE TABLE IF NOT EXISTS `jos_jf_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `reference_id` int(11) NOT NULL DEFAULT '0',
  `reference_table` varchar(100) NOT NULL DEFAULT '',
  `reference_field` varchar(100) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `original_value` varchar(255) DEFAULT NULL,
  `original_text` mediumtext NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `combo` (`reference_id`,`reference_field`,`reference_table`),
  KEY `jfContent` (`language_id`,`reference_id`,`reference_table`),
  KEY `jfContentLanguage` (`reference_id`,`reference_field`,`reference_table`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3089 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_jf_languages_ext`
--

DROP TABLE IF EXISTS `jos_jf_languages_ext`;
CREATE TABLE IF NOT EXISTS `jos_jf_languages_ext` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_ext` varchar(100) DEFAULT NULL,
  `fallback_code` varchar(20) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_jf_tableinfo`
--

DROP TABLE IF EXISTS `jos_jf_tableinfo`;
CREATE TABLE IF NOT EXISTS `jos_jf_tableinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joomlatablename` varchar(100) NOT NULL DEFAULT '',
  `tablepkID` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20790 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery`
--

DROP TABLE IF EXISTS `jos_joomgallery`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `imgtitle` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imgauthor` varchar(50) DEFAULT NULL,
  `imgtext` text NOT NULL,
  `imgdate` datetime NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `imgvotes` int(11) NOT NULL DEFAULT '0',
  `imgvotesum` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `imgfilename` varchar(100) NOT NULL DEFAULT '',
  `imgthumbname` varchar(100) NOT NULL DEFAULT '',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) unsigned NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `useruploaded` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_catid` (`catid`),
  KEY `idx_owner` (`owner`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=543 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_catg`
--

DROP TABLE IF EXISTS `jos_joomgallery_catg`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_catg` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `parent` int(11) NOT NULL DEFAULT '0',
  `description` text,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `in_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `catimage` varchar(100) DEFAULT NULL,
  `img_position` int(10) DEFAULT '0',
  `catpath` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `idx_parent` (`parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_comments`
--

DROP TABLE IF EXISTS `jos_joomgallery_comments`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_comments` (
  `cmtid` int(11) NOT NULL AUTO_INCREMENT,
  `cmtpic` int(11) NOT NULL DEFAULT '0',
  `cmtip` varchar(15) NOT NULL DEFAULT '',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `cmtname` varchar(50) NOT NULL DEFAULT '',
  `cmttext` text NOT NULL,
  `cmtdate` datetime NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cmtid`),
  KEY `idx_cmtpic` (`cmtpic`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_config`
--

DROP TABLE IF EXISTS `jos_joomgallery_config`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_config` (
  `id` int(1) NOT NULL DEFAULT '0',
  `jg_pathimages` varchar(50) NOT NULL,
  `jg_pathoriginalimages` varchar(50) NOT NULL,
  `jg_paththumbs` varchar(50) NOT NULL,
  `jg_pathftpupload` varchar(50) NOT NULL,
  `jg_pathtemp` varchar(50) NOT NULL,
  `jg_wmpath` varchar(50) NOT NULL,
  `jg_wmfile` varchar(50) NOT NULL,
  `jg_use_real_paths` int(1) NOT NULL,
  `jg_dateformat` varchar(50) NOT NULL,
  `jg_checkupdate` int(1) NOT NULL,
  `jg_filenamewithjs` int(1) NOT NULL,
  `jg_filenamesearch` varchar(50) NOT NULL,
  `jg_filenamereplace` varchar(50) NOT NULL,
  `jg_thumbcreation` varchar(5) NOT NULL,
  `jg_fastgd2thumbcreation` int(1) NOT NULL,
  `jg_impath` varchar(50) NOT NULL,
  `jg_resizetomaxwidth` int(1) NOT NULL,
  `jg_maxwidth` int(5) NOT NULL,
  `jg_picturequality` int(3) NOT NULL,
  `jg_useforresizedirection` int(1) NOT NULL,
  `jg_cropposition` int(1) NOT NULL,
  `jg_thumbwidth` int(5) NOT NULL,
  `jg_thumbheight` int(5) NOT NULL,
  `jg_thumbquality` int(3) NOT NULL,
  `jg_uploadorder` int(1) NOT NULL,
  `jg_useorigfilename` int(1) NOT NULL,
  `jg_filenamenumber` int(1) NOT NULL,
  `jg_delete_original` int(1) NOT NULL,
  `jg_wrongvaluecolor` varchar(10) NOT NULL,
  `jg_msg_upload_type` int(1) NOT NULL,
  `jg_msg_upload_recipients` text NOT NULL,
  `jg_msg_download_type` int(1) NOT NULL,
  `jg_msg_download_recipients` text NOT NULL,
  `jg_msg_zipdownload` int(1) NOT NULL,
  `jg_msg_comment_type` int(1) NOT NULL,
  `jg_msg_comment_recipients` text NOT NULL,
  `jg_msg_comment_toowner` int(1) NOT NULL,
  `jg_msg_nametag_type` int(1) NOT NULL,
  `jg_msg_nametag_recipients` text NOT NULL,
  `jg_msg_nametag_totaggeduser` int(1) NOT NULL,
  `jg_msg_nametag_toowner` int(1) NOT NULL,
  `jg_msg_report_type` int(1) NOT NULL,
  `jg_msg_report_recipients` text NOT NULL,
  `jg_msg_report_toowner` int(1) NOT NULL,
  `jg_realname` int(1) NOT NULL,
  `jg_cooliris` int(1) NOT NULL,
  `jg_coolirislink` int(1) NOT NULL,
  `jg_contentpluginsenabled` int(1) NOT NULL,
  `jg_itemid` varchar(10) NOT NULL,
  `jg_userspace` int(1) NOT NULL,
  `jg_approve` int(1) NOT NULL,
  `jg_usercat` int(1) NOT NULL,
  `jg_maxusercat` int(5) NOT NULL,
  `jg_userowncatsupload` int(1) NOT NULL,
  `jg_maxuserimage` int(9) NOT NULL,
  `jg_maxfilesize` int(9) NOT NULL,
  `jg_category` text NOT NULL,
  `jg_usercategory` text NOT NULL,
  `jg_usermaincat` int(1) NOT NULL,
  `jg_usercatacc` int(1) NOT NULL,
  `jg_useruploadsingle` int(1) NOT NULL,
  `jg_maxuploadfields` int(3) NOT NULL,
  `jg_useruploadbatch` int(1) NOT NULL,
  `jg_useruploadjava` int(1) NOT NULL,
  `jg_useruseorigfilename` int(1) NOT NULL,
  `jg_useruploadnumber` int(1) NOT NULL,
  `jg_special_gif_upload` int(1) NOT NULL,
  `jg_delete_original_user` int(1) NOT NULL,
  `jg_newpiccopyright` int(1) NOT NULL,
  `jg_newpicnote` int(1) NOT NULL,
  `jg_redirect_after_upload` int(1) NOT NULL,
  `jg_showrating` int(1) NOT NULL,
  `jg_maxvoting` int(1) NOT NULL,
  `jg_ratingcalctype` int(1) NOT NULL,
  `jg_ratingdisplaytype` int(1) NOT NULL,
  `jg_ajaxrating` int(1) NOT NULL,
  `jg_onlyreguservotes` int(1) NOT NULL,
  `jg_showcomment` int(1) NOT NULL,
  `jg_anoncomment` int(1) NOT NULL,
  `jg_namedanoncomment` int(1) NOT NULL,
  `jg_approvecom` int(1) NOT NULL,
  `jg_bbcodesupport` int(1) NOT NULL,
  `jg_smiliesupport` int(1) NOT NULL,
  `jg_anismilie` int(1) NOT NULL,
  `jg_smiliescolor` varchar(10) NOT NULL,
  `jg_anchors` int(1) NOT NULL,
  `jg_tooltips` int(1) NOT NULL,
  `jg_dyncrop` int(1) NOT NULL,
  `jg_dyncropposition` int(1) NOT NULL,
  `jg_dyncropwidth` int(5) NOT NULL,
  `jg_dyncropheight` int(5) NOT NULL,
  `jg_dyncropbgcol` char(6) NOT NULL,
  `jg_hideemptycats` int(1) NOT NULL,
  `jg_imgalign` int(3) NOT NULL,
  `jg_firstorder` varchar(20) NOT NULL,
  `jg_secondorder` varchar(20) NOT NULL,
  `jg_thirdorder` varchar(20) NOT NULL,
  `jg_pagetitle_cat` text NOT NULL,
  `jg_pagetitle_detail` text NOT NULL,
  `jg_showgalleryhead` int(1) NOT NULL,
  `jg_showpathway` int(1) NOT NULL,
  `jg_completebreadcrumbs` int(1) NOT NULL,
  `jg_search` int(1) NOT NULL,
  `jg_searchcols` int(1) NOT NULL,
  `jg_searchthumbalign` int(1) NOT NULL,
  `jg_searchtextalign` int(1) NOT NULL,
  `jg_showsearchdownload` int(1) NOT NULL,
  `jg_showsearchfavourite` int(1) NOT NULL,
  `jg_search_report_images` int(1) NOT NULL,
  `jg_showsearcheditorlinks` int(1) NOT NULL,
  `jg_showallpics` int(1) NOT NULL,
  `jg_showallhits` int(1) NOT NULL,
  `jg_showbacklink` int(1) NOT NULL,
  `jg_suppresscredits` int(1) NOT NULL,
  `jg_showuserpanel` int(1) NOT NULL,
  `jg_showallpicstoadmin` int(1) NOT NULL,
  `jg_showminithumbs` int(1) NOT NULL,
  `jg_openjs_padding` int(3) NOT NULL,
  `jg_openjs_background` varchar(10) NOT NULL,
  `jg_dhtml_border` varchar(10) NOT NULL,
  `jg_show_title_in_dhtml` int(1) NOT NULL,
  `jg_show_description_in_dhtml` int(1) NOT NULL,
  `jg_lightbox_speed` int(3) NOT NULL,
  `jg_lightbox_slide_all` int(1) NOT NULL,
  `jg_resize_js_image` int(1) NOT NULL,
  `jg_disable_rightclick_original` int(1) NOT NULL,
  `jg_showgallerysubhead` int(1) NOT NULL,
  `jg_showallcathead` int(1) NOT NULL,
  `jg_colcat` int(1) NOT NULL,
  `jg_catperpage` int(1) NOT NULL,
  `jg_ordercatbyalpha` int(1) NOT NULL,
  `jg_showgallerypagenav` int(1) NOT NULL,
  `jg_showcatcount` int(1) NOT NULL,
  `jg_showcatthumb` int(1) NOT NULL,
  `jg_showrandomcatthumb` int(1) NOT NULL,
  `jg_ctalign` int(1) NOT NULL,
  `jg_showtotalcatimages` int(1) NOT NULL,
  `jg_showtotalcathits` int(1) NOT NULL,
  `jg_showcatasnew` int(1) NOT NULL,
  `jg_catdaysnew` int(3) NOT NULL,
  `jg_showdescriptioningalleryview` int(1) NOT NULL,
  `jg_rmsm` int(1) NOT NULL,
  `jg_showrmsmcats` int(1) NOT NULL,
  `jg_showsubsingalleryview` int(1) NOT NULL,
  `jg_category_rss` int(9) NOT NULL,
  `jg_showcathead` int(1) NOT NULL,
  `jg_usercatorder` int(1) NOT NULL,
  `jg_usercatorderlist` varchar(50) NOT NULL,
  `jg_showcatdescriptionincat` int(1) NOT NULL,
  `jg_showpagenav` int(1) NOT NULL,
  `jg_showpiccount` int(1) NOT NULL,
  `jg_perpage` int(3) NOT NULL,
  `jg_catthumbalign` int(1) NOT NULL,
  `jg_colnumb` int(3) NOT NULL,
  `jg_detailpic_open` int(1) NOT NULL,
  `jg_lightboxbigpic` int(1) NOT NULL,
  `jg_showtitle` int(1) NOT NULL,
  `jg_showpicasnew` int(1) NOT NULL,
  `jg_daysnew` int(3) NOT NULL,
  `jg_showhits` int(1) NOT NULL,
  `jg_showauthor` int(1) NOT NULL,
  `jg_showowner` int(1) NOT NULL,
  `jg_showcatcom` int(1) NOT NULL,
  `jg_showcatrate` int(1) NOT NULL,
  `jg_showcatdescription` int(1) NOT NULL,
  `jg_showcategorydownload` int(1) NOT NULL,
  `jg_showcategoryfavourite` int(1) NOT NULL,
  `jg_category_report_images` int(1) NOT NULL,
  `jg_showcategoryeditorlinks` int(1) NOT NULL,
  `jg_showsubcathead` int(1) NOT NULL,
  `jg_showsubcatcount` int(1) NOT NULL,
  `jg_colsubcat` int(3) NOT NULL,
  `jg_subperpage` int(3) NOT NULL,
  `jg_showpagenavsubs` int(1) NOT NULL,
  `jg_subcatthumbalign` int(1) NOT NULL,
  `jg_showsubthumbs` int(1) NOT NULL,
  `jg_showrandomsubthumb` int(1) NOT NULL,
  `jg_showdescriptionincategoryview` int(1) NOT NULL,
  `jg_ordersubcatbyalpha` int(1) NOT NULL,
  `jg_showtotalsubcatimages` int(1) NOT NULL,
  `jg_showtotalsubcathits` int(1) NOT NULL,
  `jg_showdetailpage` int(1) NOT NULL,
  `jg_disabledetailpage` int(1) NOT NULL,
  `jg_showdetailnumberofpics` int(1) NOT NULL,
  `jg_cursor_navigation` int(1) NOT NULL,
  `jg_disable_rightclick_detail` int(1) NOT NULL,
  `jg_detail_report_images` int(1) NOT NULL,
  `jg_report_images_notauth` int(1) NOT NULL,
  `jg_showdetaileditorlinks` int(1) NOT NULL,
  `jg_showdetailtitle` int(1) NOT NULL,
  `jg_showdetail` int(1) NOT NULL,
  `jg_showdetailaccordion` int(1) NOT NULL,
  `jg_showdetaildescription` int(1) NOT NULL,
  `jg_showdetaildatum` int(1) NOT NULL,
  `jg_showdetailhits` int(1) NOT NULL,
  `jg_showdetailrating` int(1) NOT NULL,
  `jg_showdetailfilesize` int(1) NOT NULL,
  `jg_showdetailauthor` int(1) NOT NULL,
  `jg_showoriginalfilesize` int(1) NOT NULL,
  `jg_showdetaildownload` int(1) NOT NULL,
  `jg_downloadfile` int(1) NOT NULL,
  `jg_downloadwithwatermark` int(1) NOT NULL,
  `jg_watermark` int(1) NOT NULL,
  `jg_watermarkpos` int(1) NOT NULL,
  `jg_bigpic` int(1) NOT NULL,
  `jg_bigpic_open` int(1) NOT NULL,
  `jg_bbcodelink` int(1) NOT NULL,
  `jg_showcommentsunreg` int(1) NOT NULL,
  `jg_showcommentsarea` int(1) NOT NULL,
  `jg_send2friend` int(1) NOT NULL,
  `jg_minis` int(1) NOT NULL,
  `jg_motionminis` int(1) NOT NULL,
  `jg_motionminiWidth` int(3) NOT NULL,
  `jg_motionminiHeight` int(3) NOT NULL,
  `jg_miniWidth` int(3) NOT NULL,
  `jg_miniHeight` int(3) NOT NULL,
  `jg_minisprop` int(1) NOT NULL,
  `jg_nameshields` int(1) NOT NULL,
  `jg_nameshields_others` int(1) NOT NULL,
  `jg_nameshields_unreg` int(1) NOT NULL,
  `jg_show_nameshields_unreg` int(1) NOT NULL,
  `jg_nameshields_height` int(3) NOT NULL,
  `jg_nameshields_width` int(3) NOT NULL,
  `jg_slideshow` int(1) NOT NULL,
  `jg_slideshow_timer` int(3) NOT NULL,
  `jg_slideshow_transition` int(1) NOT NULL,
  `jg_slideshow_transtime` int(3) NOT NULL,
  `jg_slideshow_maxdimauto` int(1) NOT NULL,
  `jg_slideshow_width` int(3) NOT NULL,
  `jg_slideshow_heigth` int(3) NOT NULL,
  `jg_slideshow_infopane` int(1) NOT NULL,
  `jg_slideshow_carousel` int(1) NOT NULL,
  `jg_slideshow_arrows` int(1) NOT NULL,
  `jg_slideshow_repeat` int(1) NOT NULL,
  `jg_showexifdata` int(1) NOT NULL,
  `jg_geotagging` text NOT NULL,
  `jg_subifdtags` text NOT NULL,
  `jg_ifdotags` text NOT NULL,
  `jg_gpstags` text NOT NULL,
  `jg_showiptcdata` int(1) NOT NULL,
  `jg_iptctags` text NOT NULL,
  `jg_showtoplist` int(1) NOT NULL,
  `jg_toplist` int(3) NOT NULL,
  `jg_topthumbalign` int(1) NOT NULL,
  `jg_toptextalign` int(1) NOT NULL,
  `jg_toplistcols` int(3) NOT NULL,
  `jg_whereshowtoplist` int(1) NOT NULL,
  `jg_showrate` int(1) NOT NULL,
  `jg_showlatest` int(1) NOT NULL,
  `jg_showcom` int(1) NOT NULL,
  `jg_showthiscomment` int(1) NOT NULL,
  `jg_showmostviewed` int(1) NOT NULL,
  `jg_showtoplistdownload` int(1) NOT NULL,
  `jg_showtoplistfavourite` int(1) NOT NULL,
  `jg_toplist_report_images` int(1) NOT NULL,
  `jg_showtoplisteditorlinks` int(1) NOT NULL,
  `jg_favourites` int(1) NOT NULL,
  `jg_showdetailfavourite` int(1) NOT NULL,
  `jg_favouritesshownotauth` int(1) NOT NULL,
  `jg_maxfavourites` int(5) NOT NULL,
  `jg_zipdownload` int(1) NOT NULL,
  `jg_usefavouritesforpubliczip` int(1) NOT NULL,
  `jg_usefavouritesforzip` int(1) NOT NULL,
  `jg_showfavouritesdownload` int(1) NOT NULL,
  `jg_showfavouriteseditorlinks` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_countstop`
--

DROP TABLE IF EXISTS `jos_joomgallery_countstop`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_countstop` (
  `cspicid` int(11) NOT NULL DEFAULT '0',
  `csip` varchar(20) NOT NULL,
  `cssessionid` varchar(200) DEFAULT NULL,
  `cstime` datetime DEFAULT NULL,
  KEY `idx_cspicid` (`cspicid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_maintenance`
--

DROP TABLE IF EXISTS `jos_joomgallery_maintenance`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_maintenance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `title` text NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `orig` varchar(255) NOT NULL,
  `thumborphan` int(11) NOT NULL,
  `imgorphan` int(11) NOT NULL,
  `origorphan` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_nameshields`
--

DROP TABLE IF EXISTS `jos_joomgallery_nameshields`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_nameshields` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `npicid` int(11) NOT NULL DEFAULT '0',
  `nuserid` int(11) unsigned NOT NULL DEFAULT '0',
  `nxvalue` int(11) NOT NULL DEFAULT '0',
  `nyvalue` int(11) NOT NULL DEFAULT '0',
  `by` int(11) NOT NULL DEFAULT '0',
  `nuserip` varchar(15) NOT NULL DEFAULT '0',
  `ndate` datetime NOT NULL,
  `nzindex` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `idx_picid` (`npicid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_orphans`
--

DROP TABLE IF EXISTS `jos_joomgallery_orphans`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_orphans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullpath` varchar(255) NOT NULL,
  `type` varchar(7) NOT NULL,
  `refid` int(11) NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_users`
--

DROP TABLE IF EXISTS `jos_joomgallery_users`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uuserid` int(11) NOT NULL DEFAULT '0',
  `piclist` text,
  `layout` int(1) NOT NULL,
  `time` datetime NOT NULL,
  `zipname` varchar(70) NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `idx_uid` (`uuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_joomgallery_votes`
--

DROP TABLE IF EXISTS `jos_joomgallery_votes`;
CREATE TABLE IF NOT EXISTS `jos_joomgallery_votes` (
  `voteid` int(11) NOT NULL AUTO_INCREMENT,
  `picid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) unsigned NOT NULL DEFAULT '0',
  `userip` varchar(15) NOT NULL DEFAULT '0',
  `datevoted` datetime NOT NULL,
  `vote` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`voteid`),
  KEY `idx_picid` (`picid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_languages`
--

DROP TABLE IF EXISTS `jos_languages`;
CREATE TABLE IF NOT EXISTS `jos_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_menu_types`
--

DROP TABLE IF EXISTS `jos_menu_types`;
CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_migration_backlinks`
--

DROP TABLE IF EXISTS `jos_migration_backlinks`;
CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_plugins`
--

DROP TABLE IF EXISTS `jos_plugins`;
CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_poll_data`
--

DROP TABLE IF EXISTS `jos_poll_data`;
CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_poll_date`
--

DROP TABLE IF EXISTS `jos_poll_date`;
CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_poll_menu`
--

DROP TABLE IF EXISTS `jos_poll_menu`;
CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_sections`
--

DROP TABLE IF EXISTS `jos_sections`;
CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_stats_agents`
--

DROP TABLE IF EXISTS `jos_stats_agents`;
CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_templates_menu`
--

DROP TABLE IF EXISTS `jos_templates_menu`;
CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `jos_wf_profiles`
--

DROP TABLE IF EXISTS `jos_wf_profiles`;
CREATE TABLE IF NOT EXISTS `jos_wf_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `users` text NOT NULL,
  `types` varchar(255) NOT NULL,
  `components` text NOT NULL,
  `area` tinyint(3) NOT NULL,
  `rows` text NOT NULL,
  `plugins` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `ordering` int(11) NOT NULL,
  `checked_out` tinyint(3) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
--
-- Databank: `c7185zrc_isis`
--
CREATE DATABASE `c7185zrc_isis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c7185zrc_isis`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `login` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Website login';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ap_info`
--

DROP TABLE IF EXISTS `ap_info`;
CREATE TABLE IF NOT EXISTS `ap_info` (
  `wifi_network` varchar(33) NOT NULL,
  `caption` varchar(50) NOT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `channel` tinyint(4) DEFAULT NULL,
  `mac_adress` varchar(20) NOT NULL DEFAULT '',
  `encryption` varchar(50) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `wifi_key` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci';

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assignments`
--

DROP TABLE IF EXISTS `assignments`;
CREATE TABLE IF NOT EXISTS `assignments` (
  `assignments_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(50) DEFAULT '',
  `caption` varchar(50) NOT NULL,
  `parameter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`assignments_id`),
  KEY `FK_units` (`caption`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='latin1_swedish_ci' AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `caption` varchar(50) NOT NULL DEFAULT 'pi',
  `location` varchar(50) NOT NULL,
  `time_added` timestamp NULL DEFAULT NULL,
  `last_seen` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `caption` (`caption`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Beperkingen voor gedumpte tabellen
--

--
-- Beperkingen voor tabel `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `FK_units` FOREIGN KEY (`caption`) REFERENCES `units` (`caption`);
--
-- Databank: `information_schema`
--
CREATE DATABASE `information_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `information_schema`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `CHARACTER_SETS`
--

DROP TABLE IF EXISTS `CHARACTER_SETS`;
CREATE TEMPORARY TABLE `CHARACTER_SETS` (
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATE_NAME` varchar(32) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(60) NOT NULL DEFAULT '',
  `MAXLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `COLLATIONS`
--

DROP TABLE IF EXISTS `COLLATIONS`;
CREATE TEMPORARY TABLE `COLLATIONS` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `ID` bigint(11) NOT NULL DEFAULT '0',
  `IS_DEFAULT` varchar(3) NOT NULL DEFAULT '',
  `IS_COMPILED` varchar(3) NOT NULL DEFAULT '',
  `SORTLEN` bigint(3) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `COLLATION_CHARACTER_SET_APPLICABILITY`
--

DROP TABLE IF EXISTS `COLLATION_CHARACTER_SET_APPLICABILITY`;
CREATE TEMPORARY TABLE `COLLATION_CHARACTER_SET_APPLICABILITY` (
  `COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `COLUMNS`
--

DROP TABLE IF EXISTS `COLUMNS`;
CREATE TEMPORARY TABLE `COLUMNS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT` longtext,
  `IS_NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_PRECISION` bigint(21) unsigned DEFAULT NULL,
  `NUMERIC_SCALE` bigint(21) unsigned DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(32) DEFAULT NULL,
  `COLLATION_NAME` varchar(32) DEFAULT NULL,
  `COLUMN_TYPE` longtext NOT NULL,
  `COLUMN_KEY` varchar(3) NOT NULL DEFAULT '',
  `EXTRA` varchar(27) NOT NULL DEFAULT '',
  `PRIVILEGES` varchar(80) NOT NULL DEFAULT '',
  `COLUMN_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `COLUMN_PRIVILEGES`
--

DROP TABLE IF EXISTS `COLUMN_PRIVILEGES`;
CREATE TEMPORARY TABLE `COLUMN_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ENGINES`
--

DROP TABLE IF EXISTS `ENGINES`;
CREATE TEMPORARY TABLE `ENGINES` (
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `SUPPORT` varchar(8) NOT NULL DEFAULT '',
  `COMMENT` varchar(80) NOT NULL DEFAULT '',
  `TRANSACTIONS` varchar(3) DEFAULT NULL,
  `XA` varchar(3) DEFAULT NULL,
  `SAVEPOINTS` varchar(3) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `EVENTS`
--

DROP TABLE IF EXISTS `EVENTS`;
CREATE TEMPORARY TABLE `EVENTS` (
  `EVENT_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `EVENT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `TIME_ZONE` varchar(64) NOT NULL DEFAULT '',
  `EVENT_BODY` varchar(8) NOT NULL DEFAULT '',
  `EVENT_DEFINITION` longtext NOT NULL,
  `EVENT_TYPE` varchar(9) NOT NULL DEFAULT '',
  `EXECUTE_AT` datetime DEFAULT NULL,
  `INTERVAL_VALUE` varchar(256) DEFAULT NULL,
  `INTERVAL_FIELD` varchar(18) DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `STARTS` datetime DEFAULT NULL,
  `ENDS` datetime DEFAULT NULL,
  `STATUS` varchar(18) NOT NULL DEFAULT '',
  `ON_COMPLETION` varchar(12) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `EVENT_COMMENT` varchar(64) NOT NULL DEFAULT '',
  `ORIGINATOR` bigint(10) NOT NULL DEFAULT '0',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `FILES`
--

DROP TABLE IF EXISTS `FILES`;
CREATE TEMPORARY TABLE `FILES` (
  `FILE_ID` bigint(4) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(64) DEFAULT NULL,
  `FILE_TYPE` varchar(20) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL,
  `TABLE_CATALOG` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `TABLE_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NUMBER` bigint(4) DEFAULT NULL,
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `FULLTEXT_KEYS` varchar(64) DEFAULT NULL,
  `DELETED_ROWS` bigint(4) DEFAULT NULL,
  `UPDATE_COUNT` bigint(4) DEFAULT NULL,
  `FREE_EXTENTS` bigint(4) DEFAULT NULL,
  `TOTAL_EXTENTS` bigint(4) DEFAULT NULL,
  `EXTENT_SIZE` bigint(4) NOT NULL DEFAULT '0',
  `INITIAL_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `CREATION_TIME` datetime DEFAULT NULL,
  `LAST_UPDATE_TIME` datetime DEFAULT NULL,
  `LAST_ACCESS_TIME` datetime DEFAULT NULL,
  `RECOVER_TIME` bigint(4) DEFAULT NULL,
  `TRANSACTION_COUNTER` bigint(4) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `STATUS` varchar(20) NOT NULL DEFAULT '',
  `EXTRA` varchar(255) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `GLOBAL_STATUS`
--

DROP TABLE IF EXISTS `GLOBAL_STATUS`;
CREATE TEMPORARY TABLE `GLOBAL_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `GLOBAL_VARIABLES`
--

DROP TABLE IF EXISTS `GLOBAL_VARIABLES`;
CREATE TEMPORARY TABLE `GLOBAL_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `KEY_COLUMN_USAGE`
--

DROP TABLE IF EXISTS `KEY_COLUMN_USAGE`;
CREATE TEMPORARY TABLE `KEY_COLUMN_USAGE` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` bigint(10) NOT NULL DEFAULT '0',
  `POSITION_IN_UNIQUE_CONSTRAINT` bigint(10) DEFAULT NULL,
  `REFERENCED_TABLE_SCHEMA` varchar(64) DEFAULT NULL,
  `REFERENCED_TABLE_NAME` varchar(64) DEFAULT NULL,
  `REFERENCED_COLUMN_NAME` varchar(64) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PARAMETERS`
--

DROP TABLE IF EXISTS `PARAMETERS`;
CREATE TEMPORARY TABLE `PARAMETERS` (
  `SPECIFIC_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `SPECIFIC_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ORDINAL_POSITION` int(21) NOT NULL DEFAULT '0',
  `PARAMETER_MODE` varchar(5) DEFAULT NULL,
  `PARAMETER_NAME` varchar(64) DEFAULT NULL,
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext NOT NULL,
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PARTITIONS`
--

DROP TABLE IF EXISTS `PARTITIONS`;
CREATE TEMPORARY TABLE `PARTITIONS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PARTITION_NAME` varchar(64) DEFAULT NULL,
  `SUBPARTITION_NAME` varchar(64) DEFAULT NULL,
  `PARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `SUBPARTITION_ORDINAL_POSITION` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_METHOD` varchar(18) DEFAULT NULL,
  `SUBPARTITION_METHOD` varchar(12) DEFAULT NULL,
  `PARTITION_EXPRESSION` longtext,
  `SUBPARTITION_EXPRESSION` longtext,
  `PARTITION_DESCRIPTION` longtext,
  `TABLE_ROWS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `AVG_ROW_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_FREE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `PARTITION_COMMENT` varchar(80) NOT NULL DEFAULT '',
  `NODEGROUP` varchar(12) NOT NULL DEFAULT '',
  `TABLESPACE_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PLUGINS`
--

DROP TABLE IF EXISTS `PLUGINS`;
CREATE TEMPORARY TABLE `PLUGINS` (
  `PLUGIN_NAME` varchar(64) NOT NULL DEFAULT '',
  `PLUGIN_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_STATUS` varchar(10) NOT NULL DEFAULT '',
  `PLUGIN_TYPE` varchar(80) NOT NULL DEFAULT '',
  `PLUGIN_TYPE_VERSION` varchar(20) NOT NULL DEFAULT '',
  `PLUGIN_LIBRARY` varchar(64) DEFAULT NULL,
  `PLUGIN_LIBRARY_VERSION` varchar(20) DEFAULT NULL,
  `PLUGIN_AUTHOR` varchar(64) DEFAULT NULL,
  `PLUGIN_DESCRIPTION` longtext,
  `PLUGIN_LICENSE` varchar(80) DEFAULT NULL,
  `LOAD_OPTION` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PROCESSLIST`
--

DROP TABLE IF EXISTS `PROCESSLIST`;
CREATE TEMPORARY TABLE `PROCESSLIST` (
  `ID` bigint(4) NOT NULL DEFAULT '0',
  `USER` varchar(16) NOT NULL DEFAULT '',
  `HOST` varchar(64) NOT NULL DEFAULT '',
  `DB` varchar(64) DEFAULT NULL,
  `COMMAND` varchar(16) NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT '0',
  `STATE` varchar(64) DEFAULT NULL,
  `INFO` longtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `PROFILING`
--

DROP TABLE IF EXISTS `PROFILING`;
CREATE TEMPORARY TABLE `PROFILING` (
  `QUERY_ID` int(20) NOT NULL DEFAULT '0',
  `SEQ` int(20) NOT NULL DEFAULT '0',
  `STATE` varchar(30) NOT NULL DEFAULT '',
  `DURATION` decimal(9,6) NOT NULL DEFAULT '0.000000',
  `CPU_USER` decimal(9,6) DEFAULT NULL,
  `CPU_SYSTEM` decimal(9,6) DEFAULT NULL,
  `CONTEXT_VOLUNTARY` int(20) DEFAULT NULL,
  `CONTEXT_INVOLUNTARY` int(20) DEFAULT NULL,
  `BLOCK_OPS_IN` int(20) DEFAULT NULL,
  `BLOCK_OPS_OUT` int(20) DEFAULT NULL,
  `MESSAGES_SENT` int(20) DEFAULT NULL,
  `MESSAGES_RECEIVED` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MAJOR` int(20) DEFAULT NULL,
  `PAGE_FAULTS_MINOR` int(20) DEFAULT NULL,
  `SWAPS` int(20) DEFAULT NULL,
  `SOURCE_FUNCTION` varchar(30) DEFAULT NULL,
  `SOURCE_FILE` varchar(20) DEFAULT NULL,
  `SOURCE_LINE` int(20) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `REFERENTIAL_CONSTRAINTS`
--

DROP TABLE IF EXISTS `REFERENTIAL_CONSTRAINTS`;
CREATE TEMPORARY TABLE `REFERENTIAL_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `UNIQUE_CONSTRAINT_NAME` varchar(64) DEFAULT NULL,
  `MATCH_OPTION` varchar(64) NOT NULL DEFAULT '',
  `UPDATE_RULE` varchar(64) NOT NULL DEFAULT '',
  `DELETE_RULE` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `REFERENCED_TABLE_NAME` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ROUTINES`
--

DROP TABLE IF EXISTS `ROUTINES`;
CREATE TEMPORARY TABLE `ROUTINES` (
  `SPECIFIC_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `ROUTINE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ROUTINE_TYPE` varchar(9) NOT NULL DEFAULT '',
  `DATA_TYPE` varchar(64) NOT NULL DEFAULT '',
  `CHARACTER_MAXIMUM_LENGTH` int(21) DEFAULT NULL,
  `CHARACTER_OCTET_LENGTH` int(21) DEFAULT NULL,
  `NUMERIC_PRECISION` int(21) DEFAULT NULL,
  `NUMERIC_SCALE` int(21) DEFAULT NULL,
  `CHARACTER_SET_NAME` varchar(64) DEFAULT NULL,
  `COLLATION_NAME` varchar(64) DEFAULT NULL,
  `DTD_IDENTIFIER` longtext,
  `ROUTINE_BODY` varchar(8) NOT NULL DEFAULT '',
  `ROUTINE_DEFINITION` longtext,
  `EXTERNAL_NAME` varchar(64) DEFAULT NULL,
  `EXTERNAL_LANGUAGE` varchar(64) DEFAULT NULL,
  `PARAMETER_STYLE` varchar(8) NOT NULL DEFAULT '',
  `IS_DETERMINISTIC` varchar(3) NOT NULL DEFAULT '',
  `SQL_DATA_ACCESS` varchar(64) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(64) DEFAULT NULL,
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CREATED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_ALTERED` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `ROUTINE_COMMENT` longtext NOT NULL,
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SCHEMATA`
--

DROP TABLE IF EXISTS `SCHEMATA`;
CREATE TEMPORARY TABLE `SCHEMATA` (
  `CATALOG_NAME` varchar(512) NOT NULL DEFAULT '',
  `SCHEMA_NAME` varchar(64) NOT NULL DEFAULT '',
  `DEFAULT_CHARACTER_SET_NAME` varchar(32) NOT NULL DEFAULT '',
  `DEFAULT_COLLATION_NAME` varchar(32) NOT NULL DEFAULT '',
  `SQL_PATH` varchar(512) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SCHEMA_PRIVILEGES`
--

DROP TABLE IF EXISTS `SCHEMA_PRIVILEGES`;
CREATE TEMPORARY TABLE `SCHEMA_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SESSION_STATUS`
--

DROP TABLE IF EXISTS `SESSION_STATUS`;
CREATE TEMPORARY TABLE `SESSION_STATUS` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `SESSION_VARIABLES`
--

DROP TABLE IF EXISTS `SESSION_VARIABLES`;
CREATE TEMPORARY TABLE `SESSION_VARIABLES` (
  `VARIABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VARIABLE_VALUE` varchar(1024) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `STATISTICS`
--

DROP TABLE IF EXISTS `STATISTICS`;
CREATE TEMPORARY TABLE `STATISTICS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `NON_UNIQUE` bigint(1) NOT NULL DEFAULT '0',
  `INDEX_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `INDEX_NAME` varchar(64) NOT NULL DEFAULT '',
  `SEQ_IN_INDEX` bigint(2) NOT NULL DEFAULT '0',
  `COLUMN_NAME` varchar(64) NOT NULL DEFAULT '',
  `COLLATION` varchar(1) DEFAULT NULL,
  `CARDINALITY` bigint(21) DEFAULT NULL,
  `SUB_PART` bigint(3) DEFAULT NULL,
  `PACKED` varchar(10) DEFAULT NULL,
  `NULLABLE` varchar(3) NOT NULL DEFAULT '',
  `INDEX_TYPE` varchar(16) NOT NULL DEFAULT '',
  `COMMENT` varchar(16) DEFAULT NULL,
  `INDEX_COMMENT` varchar(1024) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TABLES`
--

DROP TABLE IF EXISTS `TABLES`;
CREATE TEMPORARY TABLE `TABLES` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) DEFAULT NULL,
  `VERSION` bigint(21) unsigned DEFAULT NULL,
  `ROW_FORMAT` varchar(10) DEFAULT NULL,
  `TABLE_ROWS` bigint(21) unsigned DEFAULT NULL,
  `AVG_ROW_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `MAX_DATA_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `INDEX_LENGTH` bigint(21) unsigned DEFAULT NULL,
  `DATA_FREE` bigint(21) unsigned DEFAULT NULL,
  `AUTO_INCREMENT` bigint(21) unsigned DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `CHECK_TIME` datetime DEFAULT NULL,
  `TABLE_COLLATION` varchar(32) DEFAULT NULL,
  `CHECKSUM` bigint(21) unsigned DEFAULT NULL,
  `CREATE_OPTIONS` varchar(255) DEFAULT NULL,
  `TABLE_COMMENT` varchar(2048) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TABLESPACES`
--

DROP TABLE IF EXISTS `TABLESPACES`;
CREATE TEMPORARY TABLE `TABLESPACES` (
  `TABLESPACE_NAME` varchar(64) NOT NULL DEFAULT '',
  `ENGINE` varchar(64) NOT NULL DEFAULT '',
  `TABLESPACE_TYPE` varchar(64) DEFAULT NULL,
  `LOGFILE_GROUP_NAME` varchar(64) DEFAULT NULL,
  `EXTENT_SIZE` bigint(21) unsigned DEFAULT NULL,
  `AUTOEXTEND_SIZE` bigint(21) unsigned DEFAULT NULL,
  `MAXIMUM_SIZE` bigint(21) unsigned DEFAULT NULL,
  `NODEGROUP_ID` bigint(21) unsigned DEFAULT NULL,
  `TABLESPACE_COMMENT` varchar(2048) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TABLE_CONSTRAINTS`
--

DROP TABLE IF EXISTS `TABLE_CONSTRAINTS`;
CREATE TEMPORARY TABLE `TABLE_CONSTRAINTS` (
  `CONSTRAINT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `CONSTRAINT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_NAME` varchar(64) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `CONSTRAINT_TYPE` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TABLE_PRIVILEGES`
--

DROP TABLE IF EXISTS `TABLE_PRIVILEGES`;
CREATE TEMPORARY TABLE `TABLE_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TRIGGERS`
--

DROP TABLE IF EXISTS `TRIGGERS`;
CREATE TEMPORARY TABLE `TRIGGERS` (
  `TRIGGER_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TRIGGER_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TRIGGER_NAME` varchar(64) NOT NULL DEFAULT '',
  `EVENT_MANIPULATION` varchar(6) NOT NULL DEFAULT '',
  `EVENT_OBJECT_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `EVENT_OBJECT_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `EVENT_OBJECT_TABLE` varchar(64) NOT NULL DEFAULT '',
  `ACTION_ORDER` bigint(4) NOT NULL DEFAULT '0',
  `ACTION_CONDITION` longtext,
  `ACTION_STATEMENT` longtext NOT NULL,
  `ACTION_ORIENTATION` varchar(9) NOT NULL DEFAULT '',
  `ACTION_TIMING` varchar(6) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_OLD_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_NEW_TABLE` varchar(64) DEFAULT NULL,
  `ACTION_REFERENCE_OLD_ROW` varchar(3) NOT NULL DEFAULT '',
  `ACTION_REFERENCE_NEW_ROW` varchar(3) NOT NULL DEFAULT '',
  `CREATED` datetime DEFAULT NULL,
  `SQL_MODE` varchar(8192) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT '',
  `DATABASE_COLLATION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `USER_PRIVILEGES`
--

DROP TABLE IF EXISTS `USER_PRIVILEGES`;
CREATE TEMPORARY TABLE `USER_PRIVILEGES` (
  `GRANTEE` varchar(81) NOT NULL DEFAULT '',
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `PRIVILEGE_TYPE` varchar(64) NOT NULL DEFAULT '',
  `IS_GRANTABLE` varchar(3) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VIEWS`
--

DROP TABLE IF EXISTS `VIEWS`;
CREATE TEMPORARY TABLE `VIEWS` (
  `TABLE_CATALOG` varchar(512) NOT NULL DEFAULT '',
  `TABLE_SCHEMA` varchar(64) NOT NULL DEFAULT '',
  `TABLE_NAME` varchar(64) NOT NULL DEFAULT '',
  `VIEW_DEFINITION` longtext NOT NULL,
  `CHECK_OPTION` varchar(8) NOT NULL DEFAULT '',
  `IS_UPDATABLE` varchar(3) NOT NULL DEFAULT '',
  `DEFINER` varchar(77) NOT NULL DEFAULT '',
  `SECURITY_TYPE` varchar(7) NOT NULL DEFAULT '',
  `CHARACTER_SET_CLIENT` varchar(32) NOT NULL DEFAULT '',
  `COLLATION_CONNECTION` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_BUFFER_PAGE`
--

DROP TABLE IF EXISTS `INNODB_BUFFER_PAGE`;
CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `BLOCK_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_STATE` varchar(64) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_TRX`
--

DROP TABLE IF EXISTS `INNODB_TRX`;
CREATE TEMPORARY TABLE `INNODB_TRX` (
  `trx_id` varchar(18) NOT NULL DEFAULT '',
  `trx_state` varchar(13) NOT NULL DEFAULT '',
  `trx_started` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `trx_requested_lock_id` varchar(81) DEFAULT NULL,
  `trx_wait_started` datetime DEFAULT NULL,
  `trx_weight` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_mysql_thread_id` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_query` varchar(1024) DEFAULT NULL,
  `trx_operation_state` varchar(64) DEFAULT NULL,
  `trx_tables_in_use` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_tables_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_structs` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_lock_memory_bytes` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_locked` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_rows_modified` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_concurrency_tickets` bigint(21) unsigned NOT NULL DEFAULT '0',
  `trx_isolation_level` varchar(16) NOT NULL DEFAULT '',
  `trx_unique_checks` int(1) NOT NULL DEFAULT '0',
  `trx_foreign_key_checks` int(1) NOT NULL DEFAULT '0',
  `trx_last_foreign_key_error` varchar(256) DEFAULT NULL,
  `trx_adaptive_hash_latched` int(1) NOT NULL DEFAULT '0',
  `trx_adaptive_hash_timeout` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_BUFFER_POOL_STATS`
--

DROP TABLE IF EXISTS `INNODB_BUFFER_POOL_STATS`;
CREATE TEMPORARY TABLE `INNODB_BUFFER_POOL_STATS` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `POOL_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FREE_BUFFERS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLD_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `MODIFIED_DATABASE_PAGES` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_DECOMPRESS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_READS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LRU` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PENDING_FLUSH_LIST` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_NOT_MADE_YOUNG` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_MADE_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `PAGES_MADE_NOT_YOUNG_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_CREATED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_WRITTEN` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGES_READ_RATE` double NOT NULL DEFAULT '0',
  `PAGES_CREATE_RATE` double NOT NULL DEFAULT '0',
  `PAGES_WRITTEN_RATE` double NOT NULL DEFAULT '0',
  `NUMBER_PAGES_GET` bigint(21) unsigned NOT NULL DEFAULT '0',
  `HIT_RATE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NOT_YOUNG_MAKE_PER_THOUSAND_GETS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_PAGES_READ_AHEAD` bigint(21) unsigned NOT NULL DEFAULT '0',
  `NUMBER_READ_AHEAD_EVICTED` bigint(21) unsigned NOT NULL DEFAULT '0',
  `READ_AHEAD_RATE` double NOT NULL DEFAULT '0',
  `READ_AHEAD_EVICTED_RATE` double NOT NULL DEFAULT '0',
  `LRU_IO_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_IO_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_TOTAL` bigint(21) unsigned NOT NULL DEFAULT '0',
  `UNCOMPRESS_CURRENT` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_LOCK_WAITS`
--

DROP TABLE IF EXISTS `INNODB_LOCK_WAITS`;
CREATE TEMPORARY TABLE `INNODB_LOCK_WAITS` (
  `requesting_trx_id` varchar(18) NOT NULL DEFAULT '',
  `requested_lock_id` varchar(81) NOT NULL DEFAULT '',
  `blocking_trx_id` varchar(18) NOT NULL DEFAULT '',
  `blocking_lock_id` varchar(81) NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_CMPMEM`
--

DROP TABLE IF EXISTS `INNODB_CMPMEM`;
CREATE TEMPORARY TABLE `INNODB_CMPMEM` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_CMP`
--

DROP TABLE IF EXISTS `INNODB_CMP`;
CREATE TEMPORARY TABLE `INNODB_CMP` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_LOCKS`
--

DROP TABLE IF EXISTS `INNODB_LOCKS`;
CREATE TEMPORARY TABLE `INNODB_LOCKS` (
  `lock_id` varchar(81) NOT NULL DEFAULT '',
  `lock_trx_id` varchar(18) NOT NULL DEFAULT '',
  `lock_mode` varchar(32) NOT NULL DEFAULT '',
  `lock_type` varchar(32) NOT NULL DEFAULT '',
  `lock_table` varchar(1024) NOT NULL DEFAULT '',
  `lock_index` varchar(1024) DEFAULT NULL,
  `lock_space` bigint(21) unsigned DEFAULT NULL,
  `lock_page` bigint(21) unsigned DEFAULT NULL,
  `lock_rec` bigint(21) unsigned DEFAULT NULL,
  `lock_data` varchar(8192) DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_CMPMEM_RESET`
--

DROP TABLE IF EXISTS `INNODB_CMPMEM_RESET`;
CREATE TEMPORARY TABLE `INNODB_CMPMEM_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `buffer_pool_instance` int(11) NOT NULL DEFAULT '0',
  `pages_used` int(11) NOT NULL DEFAULT '0',
  `pages_free` int(11) NOT NULL DEFAULT '0',
  `relocation_ops` bigint(21) NOT NULL DEFAULT '0',
  `relocation_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_CMP_RESET`
--

DROP TABLE IF EXISTS `INNODB_CMP_RESET`;
CREATE TEMPORARY TABLE `INNODB_CMP_RESET` (
  `page_size` int(5) NOT NULL DEFAULT '0',
  `compress_ops` int(11) NOT NULL DEFAULT '0',
  `compress_ops_ok` int(11) NOT NULL DEFAULT '0',
  `compress_time` int(11) NOT NULL DEFAULT '0',
  `uncompress_ops` int(11) NOT NULL DEFAULT '0',
  `uncompress_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `INNODB_BUFFER_PAGE_LRU`
--

DROP TABLE IF EXISTS `INNODB_BUFFER_PAGE_LRU`;
CREATE TEMPORARY TABLE `INNODB_BUFFER_PAGE_LRU` (
  `POOL_ID` bigint(21) unsigned NOT NULL DEFAULT '0',
  `LRU_POSITION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `SPACE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_NUMBER` bigint(21) unsigned NOT NULL DEFAULT '0',
  `PAGE_TYPE` varchar(64) DEFAULT NULL,
  `FLUSH_TYPE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `FIX_COUNT` bigint(21) unsigned NOT NULL DEFAULT '0',
  `IS_HASHED` varchar(3) DEFAULT NULL,
  `NEWEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `OLDEST_MODIFICATION` bigint(21) unsigned NOT NULL DEFAULT '0',
  `ACCESS_TIME` bigint(21) unsigned NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(1024) DEFAULT NULL,
  `INDEX_NAME` varchar(1024) DEFAULT NULL,
  `NUMBER_RECORDS` bigint(21) unsigned NOT NULL DEFAULT '0',
  `DATA_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED_SIZE` bigint(21) unsigned NOT NULL DEFAULT '0',
  `COMPRESSED` varchar(3) DEFAULT NULL,
  `IO_FIX` varchar(64) DEFAULT NULL,
  `IS_OLD` varchar(3) DEFAULT NULL,
  `FREE_PAGE_CLOCK` bigint(21) unsigned NOT NULL DEFAULT '0'
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
--
-- Databank: `test`
--
CREATE DATABASE `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
