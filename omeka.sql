-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 04, 2020 at 06:57 PM
-- Server version: 10.4.12-MariaDB-1:10.4.12+maria~bionic
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `omeka`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(1, 'item_sets', 1, 1, 'Views', 'Views\nviews'),
(1, 'site_pages', 1, 1, 'About', 'Hello! This is the english version of imagineRio.&nbsp;\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.\r\n\r\nProin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.\r\n\r\nFusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.\r\n\r\nFusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.\r\n'),
(2, 'item_sets', 1, 1, 'Plans', 'Plans\nplans'),
(2, 'site_pages', 1, 1, 'Sobre', 'Ol&aacute;! Esse &eacute; o imagineRio em portugu&ecirc;s.\r\n'),
(3, 'item_sets', 1, 1, 'Aerials', 'Aerials\naerials'),
(3, 'site_pages', 1, 1, 'Equipe', 'Aqui vai a equipe\r\n'),
(4, 'item_sets', 1, 1, 'Maps', 'Maps\nmaps'),
(4, 'site_pages', 1, 1, 'Pesquisa', 'Aqui vai a pesquisa\r\n'),
(5, 'site_pages', 1, 1, 'Imprensa', 'Men&ccedil;&otilde;es\r\n'),
(6, 'site_pages', 1, 1, 'Mapa', '\r\n'),
(7, 'site_pages', 1, 1, 'Team', 'Team members.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.\r\n\r\nProin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.\r\n\r\nFusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.\r\n\r\nFusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.\r\n'),
(8, 'site_pages', 1, 1, 'Research', 'Research topics and outcomes.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.\r\n\r\nProin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.\r\n\r\nFusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.\r\n\r\nFusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.\r\n'),
(9, 'site_pages', 1, 1, 'Press', 'Press coverage.\r\n\r\n\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.\r\n	Proin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.\r\n	Fusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.\r\n	Fusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.\r\n\r\n'),
(10, 'site_pages', 1, 1, 'Map', '\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_set`
--

INSERT INTO `item_set` (`id`, `is_open`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mapping`
--

CREATE TABLE `mapping` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `bounds` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mapping_marker`
--

CREATE TABLE `mapping_marker` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `media_id` int(11) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CleanUrl', 0, '3.15.12'),
('CSVImport', 1, '2.1.1'),
('Generic', 1, '3.0.14'),
('IiifServer', 0, '3.6.0'),
('ImageServer', 0, '3.6.0'),
('Mapping', 1, '1.2.0'),
('NumericDataTypes', 1, '1.4.0'),
('UniversalViewer', 0, '3.6.2'),
('UriDereferencer', 1, '1.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `numeric_data_types_duration`
--

CREATE TABLE `numeric_data_types_duration` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `numeric_data_types_integer`
--

CREATE TABLE `numeric_data_types_integer` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `numeric_data_types_interval`
--

CREATE TABLE `numeric_data_types_interval` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL,
  `value2` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `numeric_data_types_timestamp`
--

CREATE TABLE `numeric_data_types_timestamp` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(1, 1, 23, NULL, NULL, 'Views', 1, '2020-02-27 23:44:25', '2020-03-04 18:38:36', 'Omeka\\Entity\\ItemSet'),
(2, 1, 23, NULL, NULL, 'Plans', 1, '2020-02-27 23:44:35', '2020-03-04 18:38:24', 'Omeka\\Entity\\ItemSet'),
(3, 1, 23, NULL, NULL, 'Aerials', 1, '2020-02-27 23:44:43', '2020-03-04 18:38:14', 'Omeka\\Entity\\ItemSet'),
(4, 1, 23, NULL, NULL, 'Maps', 1, '2020-02-27 23:45:22', '2020-03-04 18:38:50', 'Omeka\\Entity\\ItemSet');

-- --------------------------------------------------------

--
-- Table structure for table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, 32, NULL, NULL, 'Document'),
(2, 1, 26, NULL, NULL, 'Image (media)');

-- --------------------------------------------------------

--
-- Table structure for table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(1, 1, 1, NULL, NULL, 2, NULL, 0, 0),
(2, 1, 15, NULL, NULL, 13, 'uri', 0, 0),
(3, 1, 8, 'Type of object', NULL, 8, NULL, 0, 0),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0),
(5, 1, 7, NULL, NULL, 5, 'numeric:timestamp', 0, 0),
(6, 1, 4, NULL, NULL, 3, NULL, 0, 0),
(7, 1, 9, NULL, NULL, 9, NULL, 0, 0),
(9, 1, 40, 'Place', NULL, 7, NULL, 0, 0),
(14, 1, 10, NULL, NULL, 1, NULL, 0, 0),
(20, 1, 41, 'Display Date', NULL, 6, 'numeric:interval', 0, 0),
(21, 2, 1, NULL, NULL, 2, NULL, 0, 0),
(22, 2, 10, NULL, NULL, 1, NULL, 0, 0),
(23, 2, 4, NULL, NULL, 3, NULL, 0, 0),
(24, 1, 28, NULL, NULL, 14, 'uri', 0, 0),
(25, 1, 156, 'Depicts', NULL, 10, 'uri', 0, 0),
(26, 1, 11, NULL, NULL, 11, NULL, 0, 0),
(27, 1, 36, NULL, NULL, 12, NULL, 0, 0),
(28, 1, 25, 'Geometry', NULL, 15, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('65e7c066d75acbd744c98bd506f3f025', 0x5f5f5a467c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313538333334383232362e3337363331393b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223737653961363966373961383136386665393837393339323961303538636535223b7d733a33393a225a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333235353335333b7d733a32393a225a656e645f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313538333335313739363b7d733a34313a225a656e645f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333335313831323b7d733a33343a225a656e645f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333334383837373b7d733a34323a225a656e645f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333335303834313b7d733a35303a225a656e645f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333335313831323b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b5a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223866303436626562333232656238346337303366653565323336383462366335223b733a33323a223861353935643564636262356563633235653637313530653437353364643530223b733a33323a223034316161623636303236366633373133393030643633623132343365333264223b733a33323a223364373437323130306565396131633230613631316431663836343662353034223b733a33323a223962663964663065633734343863646530643933333463653734633930336361223b733a33323a226638653832326230323063626563383165303835333636643962343065656137223b733a33323a223361373766633766373166363264656133333361633338623632666239346361223b733a33323a223230613066373230646631383439396535393730393233623562626531656361223b7d733a343a2268617368223b733a36353a2232306130663732306466313834393965353937303932336235626265316563612d3361373766633766373166363264656133333361633338623632666239346361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f417574687c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a33323837333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3430373a7b733a33323a223261393334373836343630383737363634663463656165386334393162653361223b733a33323a223032663433333563653166646632663364393234333834643334386662363264223b733a33323a226164316534383664303865346330633730313737323966386633376530326431223b733a33323a226431323737373662383131626431363463363435333363653738623633393331223b733a33323a226531663337623461306665373231333936383632393562306366363231646164223b733a33323a223633316232336432396363356661346230643437643839363930313131396232223b733a33323a223939623962343534306466393264643637356262316233646136356361333366223b733a33323a226162653961353830336338633637626535636136326561663535623730366331223b733a33323a223562366330616135393962376535626436316239383734626338636566363965223b733a33323a223537613338306337616464636230643063313039393530343334383662396266223b733a33323a226461326130653135373464326162306135616633373637646461643166333333223b733a33323a223236343437356232343463666332326663386666323233653663366330393839223b733a33323a223164336464313632663239666237313534616236663035643364323735396535223b733a33323a223439626561633031346565633537643437393433643865623236363831623838223b733a33323a226263373263636263363663663039333062373436386538353033653435616266223b733a33323a223862656662316431313265396666656639643737363930396233633762653936223b733a33323a226336383363303566383962353134343761396231313164633333313736626130223b733a33323a226261656633653437373233613036303236353239653866353238313533346265223b733a33323a223534363637396530376333326234613961303339616466653136383162326339223b733a33323a223463636130623163366335653663626431623364353165663637633065633738223b733a33323a223965363365623634333264633339356233326431373264626232383839666238223b733a33323a226361313264336536643335623061303533333331376164383561363532353534223b733a33323a223962373236323264653064393835373736613139626631613363643238373438223b733a33323a226235623962373334613836616364636632386136643134643162353061376164223b733a33323a226137616532343033356432303531383962383438636235613532376466623165223b733a33323a223462633432303734636236356333376465386438333863353166313066373663223b733a33323a223233323864346365396135616266646335656265336633393966643732383135223b733a33323a223065376231656264313735356536373830363131366332613134393838646363223b733a33323a226437663561373831636130623639316231333432313732363132613562346333223b733a33323a223030643161376564326438393365353131643830663031376232376536656462223b733a33323a223766396163363636343531656364643961333331643536313437306663396634223b733a33323a223635383236636461336439643764383563303663383333363764326137386661223b733a33323a226263366433323233326664376430383934363032303665656436373531393635223b733a33323a223764306663643362633364393135386337613635623633386634646436353065223b733a33323a226635373733363830353837346637333563353036393537333338326364393638223b733a33323a223563313031643363396161626431633865373634636536663164623230326530223b733a33323a223433316339326631396533353732363132633738663862333138356466323334223b733a33323a223334316161313533376461656162353432323835383166613666393938333762223b733a33323a223037646139366562343637356464386237373236346461653736626564643862223b733a33323a226230353166653463343062373730633766366263376233646536333638623962223b733a33323a226134633265653533306230653730366636366265333937646237613364643531223b733a33323a226665373431386632396433386330626132616636346635316165393438373735223b733a33323a226162636238393264636433363932363935356433363431666436363534343339223b733a33323a223865656464623035663234346237353334396436303032353564366162396464223b733a33323a226233613562346561623264626166643762353066616130346161643234646235223b733a33323a223933363535613964616366333533366563363338613164373030383736623734223b733a33323a226339373330376534343234333134393036356139346434613832383337383839223b733a33323a223563616436366366353261613032376266343535666133613264373236353436223b733a33323a223036313838316463363836306332393664343761343935383838346163333661223b733a33323a226136633163623562323731626565616539653265356562643363346336663161223b733a33323a223531613439643462363139353236626466393461346166626133646363643438223b733a33323a223766643963383630383035346532323833333232346661663635306163333061223b733a33323a223137383436643666323664366463323637376163303733663262303938333963223b733a33323a223336396363343838653431623165626438376534343266616334666263323565223b733a33323a223437346564643565316131313164333235356466663764663261383135643234223b733a33323a226132336664663766613163336632386431326334616162643132663465316534223b733a33323a223366643462386532616437303761336363386439373237353938316239656132223b733a33323a226235333331393662306565666163386665326430393133653462313639303538223b733a33323a226333386365323633396564373066653334316530646163616439303038383535223b733a33323a223835643964333436383036343362326365323461336562356361303564356132223b733a33323a226139323439343966663464313636383238636634333233333962333065666465223b733a33323a223039313235363066353532356261326662396162376130656331643932346364223b733a33323a223931373961306265333466333439633931653336653063316130313831336131223b733a33323a223666336535373461366463633761313562373236613632613861656232393165223b733a33323a223536633130636364656335646363393738623464336339643461666434376337223b733a33323a226631303031663539363861303335366565636462343939353363663062393839223b733a33323a226132393663376136353632363433363732366461643762356130646137623234223b733a33323a223232663262626233643039303538313230623336653366343662313364356334223b733a33323a223064323162646466353966653231623265623038393965363331353662633065223b733a33323a223731666566623430313930343463376161383330656534383734316336663132223b733a33323a223635383366396363373036626262613433336165653864356561633938616438223b733a33323a223730666233393439613833303732363661313066656239393062386662333535223b733a33323a226139323164633737363861313533346438663238306165323163646134643463223b733a33323a223631613531323838393463353864316266383732313764656131393632663330223b733a33323a223866316234303637636264336139323765313537323933396664306662366137223b733a33323a223235373761323366626130393137333732613730333032336334306634303361223b733a33323a223232663064303765363932663666303331646332616566363261393038326136223b733a33323a226435336561653161333432646232316663306361656635363861633733366163223b733a33323a226163346538383632396435366338666539316135353463343132356633386366223b733a33323a223366396366333463313966316130376635616437316632393662643230393862223b733a33323a226236613530323161363736633836373939323131663739323939323363373436223b733a33323a226166313336623161633961313732623735376336326534623235333131346162223b733a33323a223730353433616263323438306665343338383931613339616637323935653835223b733a33323a223762366161396338666130376265356362303962643334643239366463363165223b733a33323a226365303563353534386238363430336164663735653064663065663031626365223b733a33323a223163626138373666396332343739316139326464386536623934336133643934223b733a33323a226162366231326361323937316231356261633930383336613737366437323930223b733a33323a226631333435383638393236313062373163336236653564303565383531633431223b733a33323a223432663962396134363934663334353137393633313566636135646635396564223b733a33323a223062336565386461333465636435336661303032663130343564316662376165223b733a33323a226433623562393039613134383634613231633762633938326236366630653735223b733a33323a223462376138623134353133343130323865646138313232353235306636313534223b733a33323a223833386162366364363331633134383436303165653630323536346337323763223b733a33323a223766333737363564643165353432346436353934613533353638636633346661223b733a33323a226433643530356132353238646661353638393131373165316437366134336235223b733a33323a223961666561636139656630653436656539613464626337316564333564346536223b733a33323a226135643264363961663232613766326639616635633364626235353762373461223b733a33323a226637663531363835343539313732376437656533356566313039643830613538223b733a33323a223037343433333166323566653266636133346635363839613263356238353239223b733a33323a223239306266326532346135623964656433653434373932636465373036353961223b733a33323a223063653662323936356633353233383638613136353735386332666133353562223b733a33323a223935316661373032666661373636313539346437333433356233376265356565223b733a33323a226236343861373765643937336537323666386236653639366665366631346261223b733a33323a223138333964623663396137316364626431353633393065303235373031626630223b733a33323a223663656466653332663837373262633964386235306561346134613766376638223b733a33323a223063346464326130326631303865633363353636643035636364613965633237223b733a33323a223832313366643735663361653466346264356232663030663332643838656262223b733a33323a223835316366343638663534613762643531656666306434653338306630323633223b733a33323a226437383036663234613231376238383830396463313965383865313036383033223b733a33323a223533666136323962353234336131646563313036363932356539306566343161223b733a33323a223934323065306465653931643261623864366232313131303830613230303865223b733a33323a223738643030323164623436653638306631373065626632346637633666343362223b733a33323a223832393366386463653964313164333039376561636664633539333635626264223b733a33323a223332623237323062666338303630333038633965646662636666396537373164223b733a33323a223936353938393763336334656139363462313036666634373336353431613037223b733a33323a223239616562623834393337636133663032306562666232356362623432666235223b733a33323a226333353436313835356538636332653733663961316434333730633331343332223b733a33323a226262333439353837626466663963393864386532373065336362383763396563223b733a33323a226566316161366665643863623538323366316535383966323233333362653736223b733a33323a223039383933383632353263313466613938363839346134396266313339373463223b733a33323a223633366630653663376237663538396333643635623932623962663361316433223b733a33323a226335366235393564313033313331643166386561366431303633336164313562223b733a33323a226138613963386630613633373363313937353466653439626334306264353638223b733a33323a223261653861643032663139316361313065663537363865316230333865616462223b733a33323a223237373364383433656231633439623031663432613461646666313133396364223b733a33323a223734666562616166336663383238653734326661636536303131653863363064223b733a33323a223762323466346135316339316462386261336434616337383235313938353531223b733a33323a223363363632646630373238313966336231666662663162303062313339343863223b733a33323a226135306630363832613163626531646634653266636265386361343733643538223b733a33323a223466623132343330623134653263373434353761323266346437373262303163223b733a33323a223937363362643165343033393838333063653965623531383137383135346665223b733a33323a226230633761333939313964636165346665643264366137323835613135343339223b733a33323a223433376634303631383061393566356433343765616232383365333434393638223b733a33323a223763376535306630363834393931333631383034663131613630643966653435223b733a33323a226238383536656666306239323133333463306637666661636533346236343539223b733a33323a223538616339353661333835623866336164373234396535646665643735323662223b733a33323a223937343033333439363536396264623863363663383938356264313164636337223b733a33323a223432306633323765373331623436656637366534613834636366613266636130223b733a33323a223162363433323730666365376234336163383934643962396238393931393566223b733a33323a223561333566613761323337643162616135396530313730323736353036366338223b733a33323a223465633536373261333431633938653436336562353262373436396163386564223b733a33323a223933636134393732333566363338393739366337653363353231633566346664223b733a33323a226463356136346166653637363637326132356631333534376633303839356432223b733a33323a223839393339653539383230343737343033323833373562383838316365623539223b733a33323a223630393038633261363139643833363835643539303866376137373861653630223b733a33323a226230306261626662653633393431303739653439363432663361306432376635223b733a33323a223164386639303434343637383766336230336232633362623538333661346339223b733a33323a226434306638653237656362376437366334366539643333393130303136643736223b733a33323a226164343661656166383162623661656130663263323264643431626431343934223b733a33323a223435363836356661633766666639356561383962643430333330656431613830223b733a33323a223239666165356336356531383630666631633530323936643839626666316334223b733a33323a226236656664373936333739356464353931626630616265313930376633306262223b733a33323a226637313834646630633939393831623037376435653437376465346139613232223b733a33323a223264663431313432373362383432323834346233636635323362386630313233223b733a33323a223263353363323265316362386361353065393033333066343463333537626661223b733a33323a223631303236333561636236366661653031643539323331353164393034643038223b733a33323a226131653562363562383735373437653439396463646362666332623063653135223b733a33323a223437313265383866393863313632383537346138313337396133663139366337223b733a33323a223835636264326163643263393638323534663731663533313039386365656363223b733a33323a223038393738363732343662663730353334393031343263343632623436636562223b733a33323a223338356132396237353336336333633638343264373362366538656237666136223b733a33323a226333663139366638633530356635643063646537623264656436653833666134223b733a33323a226233646537616636616465363130313432626635613637623666613131643262223b733a33323a223662633438623534336365346531613431643433613834653062653066333961223b733a33323a223661616130316561383839363536306139343161356535666662313638306263223b733a33323a223364316161656130653462386435326339643435323335373933323732316330223b733a33323a223565376431356463343837666538316430323236653434313465393937653665223b733a33323a223036376134363264623064316231376430633362363239616233636661303266223b733a33323a226338323333383838353666646237646436623636356261323932343330613963223b733a33323a223366366536363266653434653335333439626263336632356332346362656230223b733a33323a226466323635366464366231363333353238373663646432656536616566623864223b733a33323a226431366430393238396533393631336638666232656334313739313063643034223b733a33323a223638363361666431376135393735616133623532393163643133356530373462223b733a33323a223366326333363164643031653435636466663831633331613065366463613632223b733a33323a223036323762333234326635616161303833393164623166613330363338346337223b733a33323a223061353162633461316630373165646564393039633137353861626630353734223b733a33323a223236383430376264383037373662323361396132663239623264623235383031223b733a33323a223563616330636131323365666463396637363033366265616538633462646136223b733a33323a223034336538323361633931326137363663613634356366396438626465646535223b733a33323a223536333662613237626163646462323662326335643766613162353538336561223b733a33323a223636343964373532323133343931663731653064666538383935313839633836223b733a33323a226535373566393265613561323135313066333164363166346237366339643730223b733a33323a223262346164396538326537663138323839373935333963656163373962646562223b733a33323a226537626365303132326333653538623432346362393730303731373662643238223b733a33323a226163316136653135643032393439323562353632396238363131613438313936223b733a33323a226136343137386535653237366465343235383861383036323630636263656437223b733a33323a226266303161323364333538396138613335646339356564653930613462333330223b733a33323a223763613763316562393564313564616231636466396636663233343065383032223b733a33323a223732343338653062653239396561643464323364663533633638653437343237223b733a33323a226334303263666566386466386137326635396563646361633834333737353565223b733a33323a223337663139643939353464376465376163626365343237346235626235336434223b733a33323a226565306263396262323364616662303039356363356538613039313464316136223b733a33323a223232656633303332623831343862336233376334376437633861323135376164223b733a33323a226534636338366439393932643734383834386161303163383762343632366466223b733a33323a223562643266386266306263653862623962363231303764653862336637303230223b733a33323a223736613131643966356134633632373461326462396365646633633539653961223b733a33323a226664643766316666393234363338636334653535663432313733663563633964223b733a33323a223762323631663735393939373066666262613464356337356536353134303064223b733a33323a226430313239323333323366663561333237633532313339636539343231333133223b733a33323a226131303531383264373936623936353036616262323862323663366130343530223b733a33323a226538303764623335396534303664633636326232666163623864393133663262223b733a33323a226463343538323934373034643334633333306234353663383463356462376463223b733a33323a223435363231306630623964383837343966316365633132623362653430313362223b733a33323a223062313961303262633630323732303163386365636130303932643734306263223b733a33323a223365333331656464343265656465306632643964343732306461623732313737223b733a33323a223364363166303139376435386434306231386132646466623035313932653466223b733a33323a223061633431316461373732613731653037326635633939643235623130303162223b733a33323a226637353562353138323862326439363862303163656163316134626635353561223b733a33323a226537306431366164363430316366626538363364653265643262316631373338223b733a33323a223333393537633262373866356462376166613238613764636364396366343335223b733a33323a226331346461616533366661303762663238646432383562366332323638353361223b733a33323a223232316536323532626637623662363238613535363866333539623130363839223b733a33323a223862343038363338383034356134656630636365353039623032656531353638223b733a33323a223932343631303734343534346563303333323064323465343362386133316334223b733a33323a226262393662626637383665643763643637363362316366653964393036616162223b733a33323a223038626631636132313134363132663833396431363034643866323161623234223b733a33323a223236623661636664616465626465343061643731666636393563363437626366223b733a33323a223934656632313864396138383832386534383865303938646462386663313338223b733a33323a226330656634356565633762623761346233363463376461373463646161636231223b733a33323a223530313165616430656232326261343163323236366562653436336136303739223b733a33323a223036363663613765656530336639653062306365323334316630626339373932223b733a33323a226631393131653936623135313234373161366533313463373661363763366265223b733a33323a226266633631633962323262303862643933346230303663353031333564356333223b733a33323a223739336566333634303966316236346138303665356631613338396565356563223b733a33323a226634313134613439636332653135663737373932616332653737643965623362223b733a33323a223434366232393531636163366430373665346630346466313330396139323531223b733a33323a226364396132633063343437663635323031363965663334376264613839393462223b733a33323a226463633863633833356439623233333930613164333938656165393930613538223b733a33323a226633323233343538343437303161306635616435313131323539626464643735223b733a33323a223030616262623166613636373834373439616531363963343833323032313961223b733a33323a223334643464646266613433326234346163383965383639386330393461623537223b733a33323a223362306464623133663331363637376136663461353437646333646163616334223b733a33323a223962336136653937653466643265313833316563643761326232333665323931223b733a33323a223262383431653561373832653666353530613464366135386239396361356366223b733a33323a223738656238353038323532653265363631356165663638333966363532623036223b733a33323a226638386530303063366530663465386263363338306561303634386138323961223b733a33323a223432343032306332663232646135656131653536373138323064376461336631223b733a33323a223265323331316131343833643766313836373534303465353639346635653634223b733a33323a223437663835613462336335646134306533373030623064376364646332356439223b733a33323a223730303739316436393834346665343236336336313463616537663939353332223b733a33323a223734653662626534326133383966633738313039303631363365373562653563223b733a33323a223430616536643361623161306431333836386231663265646163376338653063223b733a33323a223664636565323438303731353839306537626237313065373963653236323966223b733a33323a226532313966343937363031303033613635333439613361623063633364393462223b733a33323a223739386465323231353736353466363565666633373232626538616335336161223b733a33323a226533386338313362623631333466626565656165643164383636626162636633223b733a33323a223461643463396164623831323538666263663938366130303130306663616132223b733a33323a226264636536303938343231666632643633343764633838653366366338353834223b733a33323a223165653837646632613437653366376135653834343930303633386138376239223b733a33323a223863663162623566623338646632303838353961623634616334396530313137223b733a33323a223730373637383032343563393533393135363866363739346538316233343463223b733a33323a226365343736373630653566656232363365336666306535386266366639633662223b733a33323a223366663635393065326662656461666134623764646535353637353861373433223b733a33323a223961623532303536323631353433303433626534313630396434343336383239223b733a33323a226137383532316138346463353732623566326532373132393639313839366434223b733a33323a223336323936666435643665366361636639646531343838626662616632306163223b733a33323a226331376563386637383734656131613035343831306537623766633139323662223b733a33323a223066663931333837653239396362653532356138613131646663393861313236223b733a33323a226635326233326439653831653361653463646238316164353362373038313234223b733a33323a226135653232613965326539336234396563663335336161323539396238306139223b733a33323a223063313439363863653831623630356363616264653238313238623064613264223b733a33323a226465306635336338316331303661613439636662363366323932376137636335223b733a33323a226431316161353339363364303034393664613462656632366531326433373434223b733a33323a223038373032336562656530306131333635653365363336653738303661666161223b733a33323a226633396438663363623661663437306334383433363236653033373235633964223b733a33323a226465336432306433383464336664613566396362326430623465373130633661223b733a33323a226566326138613032636462316265633637383466613861626165633663363463223b733a33323a223035643032643966366539663732373637373032646463643761323865386331223b733a33323a223863366236613264336563313138663366376430643438343534333965363430223b733a33323a223639616330653362363766353462663565396236376135626365313431646430223b733a33323a223237613464353032383163633032646330313634333034616464323438623436223b733a33323a223831303864363166353230383834323564313466346335363234353063646330223b733a33323a226565313166376436366538396633303065613435643530336361643264353736223b733a33323a226530366634623937306333643036666230373430373535396535386662376364223b733a33323a226330396430316430633361353136616166353666393833363962643930313764223b733a33323a223139383864343037366161373438323530616634373139363362316531353066223b733a33323a223738363834313132383266373230653434616433333630623330306361303432223b733a33323a223933666135343236363137663464346433303434613466373438323031633033223b733a33323a223263343462326464653664333932663439356135643162663436623635363566223b733a33323a226138336437313462343437373665363962613435663233316531313138306530223b733a33323a223563366538643165353731626333613761663137363031323339613835643162223b733a33323a226164613335323365333966343765353833363865303961386639336335313337223b733a33323a223364356334356664616338383836393339313836383663343533356138366632223b733a33323a223136303564383735656336613666326564643064316235613936303931653630223b733a33323a226465376238343062303063326537303564383663343433656536383432313630223b733a33323a223236643764643337646534333262653538636636323239313135353935313635223b733a33323a226265373132643635633632333561313837313638386439616164393732333061223b733a33323a226430613733633737373639323036393231353237303631653832303763373935223b733a33323a223639636132623931393364353366323663376663623439383036663833336431223b733a33323a226438663437663232663538663962363230353861326364306139643439643833223b733a33323a223534663738366466626163643631653835343864366236343039633863623764223b733a33323a226630343334626638353464316236306137643063663934643965356263356332223b733a33323a223964393836656564333366353063643639356166343138326434363961623332223b733a33323a226364613666383265613765623833353362613632393730333262313032333130223b733a33323a223533666232643335373432353131376330353336333965663436623930366164223b733a33323a223437393064666162303235653062363339363930643932653063343963613236223b733a33323a223563313830323364383131343932663736326164643230383332343438353938223b733a33323a223532663038613837663136383135356365663539346638643963303962626164223b733a33323a223165616463643563353135663666343064666131393835613534643435303263223b733a33323a226433333665363233646162333539653338306266373836333334326661373639223b733a33323a223237343936653632356136336632646536353337343130353764343032356362223b733a33323a226566376335653435663439386537636538313839656531356333613032346233223b733a33323a223763336332616139306261633462303030656132316533366233656239353561223b733a33323a223235363563383165383765613833616530653231646334356139613064313661223b733a33323a223435613032653361613665323563306532666437306561656563643233643038223b733a33323a226536326133636638366535383464323565646461343931373763393937303263223b733a33323a223964333466333231646638616362343933313166356332326333656133656637223b733a33323a226534393466663439306237316237383432323964396635643933376664363862223b733a33323a226664613833666139383438363636643739633131336439666136323139623063223b733a33323a226438613136376236656563396435646632623561396237623833336238313332223b733a33323a223264663733366436616237636436323930376138346264393264393830313165223b733a33323a223061336166336462333735363436396665313962313035303630653937383934223b733a33323a223165343030303934656263666430333634646166646435373732383736303364223b733a33323a223663376433306137383162333930306463343164623438363738623766613837223b733a33323a223938383533366165353966313163366230623761323862623763376666643939223b733a33323a226534306536646330383535666538323563373337343536663333353161386138223b733a33323a226434396264366530303039366561346534373563646466366563326630373961223b733a33323a226566326434613962366561313566393239393332343139336662663031643962223b733a33323a226330356138353363393061343066343232383431636464366136643233656162223b733a33323a226561646164646366663463313161313434333461306565323330346538396132223b733a33323a223164643935626566346639653635633933613838306337303339386632383630223b733a33323a223732383331313937636438653266636265666433613439353865386266613334223b733a33323a223137346534636663303963663037613238633031363765333064333364343066223b733a33323a223635366163626565323037616364316230363764656361306266343630616432223b733a33323a226533366433666235326332303131366632623533393365333666626537663130223b733a33323a226632303035366634643632373236626135663164366161326164356536343432223b733a33323a226430623439616531313838656361663631363038333236623831663063376534223b733a33323a223233636166316663303734666262393564396561353637316365623931356432223b733a33323a223361316265656464336630333563653738373535616266653261356238356230223b733a33323a223435363531356336666335333230633763316232376534373032623939336465223b733a33323a223033306464343661623835306434326436633639623539643766376436306234223b733a33323a223266326361653366663335376336616438323334616665653164646237613738223b733a33323a226166613836623336643936306563363034656163373330646139646366626438223b733a33323a226663666662383930356338666238633936623937353233323039383331343438223b733a33323a226631343831386135326666366266656364616637633330376135626662376265223b733a33323a223631393262663065346331646538333666393531653862396236363239616539223b733a33323a226332363531336235363536636563373361656663303434336331326533646665223b733a33323a223734303733386562663162373336333664373932323535663634383263313738223b733a33323a223530623435313834323933383734336632663766386432303138306638353933223b733a33323a226137366336613332346131373361393363353166353061653163356538316362223b733a33323a223630613235323735393837623361646530333038373437383566323837326336223b733a33323a223466653633613764343037383731306536323462366635613133333531366563223b733a33323a223438303733626230623366623666633763666461313162663735343034383338223b733a33323a223531306338653430666434303036303762313066333939383238373531666331223b733a33323a223235626562326666663865393164613433366263353733316266613262633238223b733a33323a226238646335383234613735326632363964626236333163623036613439666366223b733a33323a226562643934343338336162333633353431633764316130393536656338333264223b733a33323a226461613536353132636131653132383433333464613931393865306364356334223b733a33323a223537313366636137393633336636306364383064333733383130353636313161223b733a33323a226131316637393161363566353066613936646262336437393463326162383134223b733a33323a223363656435393561356634643738653931396364643663613433643262636266223b733a33323a223863383036356430346138623664663464366535316534633830363162623833223b733a33323a226461653864633332623666356166343736643533346535336366393730303365223b733a33323a223863326236363438653935343236336664643266316163396238656337653366223b733a33323a223766346538383563376237396564626634643966636638623134326332663031223b733a33323a226462353633636263343066663435373439653662623035346339396132386334223b733a33323a226435376466666431343734613165653434386636383566623130326463333735223b733a33323a226463656233653039646533616164313563313963643338666431663339363963223b733a33323a223232363739393330663766623937643165346266373037633738656435386437223b733a33323a226431633437666639656230303733356633333363633231353264613561653665223b733a33323a223138356430313535653531366630343835393531383237323162306236346631223b733a33323a223730646331363266396466366433643035643563666130396464393337616361223b733a33323a223564613866393761323061613432303037643437616164393866373331373635223b733a33323a223534633963353232353235643230663236336432646233333831376139656638223b733a33323a223236633933363464343366396430666263306162613931393631323762373666223b733a33323a223930306130353931386631646636383838613431383166373530646134333430223b733a33323a223266616663633936396335343130306335333762636139386238383738353533223b733a33323a223862333861313934326466396238646363653732386630383432393438323761223b733a33323a223737393732643834323864623664633236656161623136613836386166386237223b733a33323a223236323433646134333566316536663934666233393839376562333231373336223b733a33323a226338376635306131353039623163663063643330616638653634316462626231223b733a33323a223932366237396235626638633233613666646631623462626166316435353335223b733a33323a223630623732653363353061383339623035383539323433353436366263613838223b733a33323a223638373936633162393834373236373962633337343564633434316533383334223b733a33323a226636323132303435386365313865386639643339396437383462616135613731223b733a33323a226334626464316338663330303237663338326233323235376331383830643463223b733a33323a226533623334376538613962646237343633363866343137313832366439393137223b733a33323a223361393965613330613365353335616434326165666634386165356662646430223b733a33323a226437613031343934326134663230663036383939383736336266633430663938223b733a33323a226339336539376534376132373664626532303064333433633633663662303265223b733a33323a226230306661303839616333306430313263356465363030626263366139336461223b733a33323a223932663562346636633661363534313766386138663034663637333337653563223b733a33323a223731656237333931393834653132313033643163336666376431346636616332223b733a33323a223965373036616137356434636664343635353164636262623930613839393833223b733a33323a226163313463636331376662346661646566386533363236663663626262373038223b733a33323a223462393830653635306630313935323032623239376537303135656566353465223b733a33323a226161343730633564363061333136323336306534303230303462616266333131223b733a33323a226430663935663430323164353864656262646136653033336363383938353738223b733a33323a223833313662333338643433366163313730623364656562383562636632313338223b733a33323a226230306230666565376532613536646564653430323936343563623565633332223b733a33323a223663373666303637313633393337613635343861373234613235393931656231223b733a33323a223933646561386265633265363134636263303939353337386433653632346236223b733a33323a226662376362633366666532303032653732616234353339396431663730363636223b733a33323a223231303261643562323637633938313066393461646131396334626233626439223b733a33323a223837373637386332626662663337633466333564393838396433343730333431223b733a33323a223739323230636231363665316234653532653338326433393164346633386365223b733a33323a223136643734623366306163656364303961653532663766613234646436346239223b733a33323a223262656566326161356631303832633866356664366130383333346134643532223b733a33323a223939373831353832376161326135633736353431653235643765303036653135223b733a33323a223530343932653334363866326638316565653438626331333361303438626334223b733a33323a223838656131303930396264646635373961656261666630323565353239333732223b733a33323a223135356464333933316632636630633666613439633731616435663662623363223b733a33323a223633653563386462646336653466366166316431303365316363666436653431223b733a33323a223861613631643966353634613530323064643233656232616466303739383531223b733a33323a223666346263343664636262383439323939643539656633326535613633636639223b733a33323a223630393862663536373561666266303965373338376637656463336136633334223b733a33323a223534353434336538323135313531643738653262656564313731653230626133223b733a33323a226338346232393337333539306433373437633730653530313764656361343333223b733a33323a223765623039393466653734363438663962643236383036623239323831313431223b733a33323a226363323733333334613233653039653366613061366661666432336462663631223b733a33323a223532646135666563336230343632313066383765616134653136303838393332223b733a33323a223962346366643931616438336338346632633532663164366536383239333036223b733a33323a223837386432383838393531346135636433623031616139306639656662376137223b733a33323a223837303561653635303463333639613865643866653938386335666438396531223b733a33323a226337326135623232323965656235663566396662623331366634346465353833223b733a33323a223333326439303630316164383238373638396338316434303531353139663434223b733a33323a226337323563653638343765636263363632326131633639336237323830316131223b733a33323a223534663532626537356565396261636336343132356466393362336663666434223b733a33323a223763633135303237353637623538366361366265646236653965623035663536223b733a33323a226238643933636463303564643536393937343739393433366661386132373562223b733a33323a226330393830373535666365633863633334646133356432663266343330626661223b733a33323a226438386532656361316338306262653538363633643833363334383438323230223b733a33323a223566323965353565653036353364393361393337633738326664316339626561223b733a33323a226531353763326233626233653863646533306430313266623862393065323830223b733a33323a226131663434313035396639653534376139653262363862333461376330303762223b733a33323a223366643635643430393732303261613935323630616432366263396663616338223b733a33323a226437363965323863343931646361646265316564313638616535333565386230223b733a33323a223965363966666438393062396336356439646337336231623161646634356437223b733a33323a226363663534663338303631326430336262653532316262613738623934653263223b733a33323a223939373830393064626262336264653837313735326639666339343763666539223b733a33323a223665373230626233643935396563646138626334386463313330346232633031223b733a33323a223631333062636632316132626239633766336237313566623763363237343131223b733a33323a223263316633653764323861363161313163313835653663613336383234316630223b733a33323a223534633532396534666162363936306132333635346436643437386563316662223b733a33323a226265383266313334333531633938643666393437303930626132313732646432223b733a33323a226636373665373635616137363138633337306362646131323464346564643865223b733a33323a226565373864656665643730343966323362373234393763326631393039643131223b733a33323a226533346233646635623132393265353161373238653661336132636634346464223b733a33323a223761656233623632666435663230643565353838663535643136303236643566223b733a33323a223166646339626230633361373861303435616662373431363538646162356331223b733a33323a223130306236383961623334323530656635333966396439333736633535643766223b733a33323a223639386161353632353431306462303338393639353463343638616434353538223b733a33323a223538633337643663633336333733323432633463353430323138313936313034223b733a33323a223438343431373465623639663964613539306363336263666132376566383832223b733a33323a223335616562623131306562626235366637326261313665353230383431336137223b733a33323a223434306261386162383533323335666633633964663836303263623738643735223b733a33323a226333316465303762663866383835313761356131373831616564623037366435223b733a33323a223963356332653035323463653333313662616631663462626336643065663263223b733a33323a223333376238383835396466313265333265633930383165393839646430326638223b733a33323a223530376233363531316166353230353964333766313830333961373964363631223b733a33323a223038653033623139303534333433373031363233616464363766383835376137223b733a33323a226164343338326636303132326531333262323834663064646561633861323935223b733a33323a226437383738623666313130666561353663396530313365336332313361323166223b733a33323a223162363966346664613330633163353632353764623934656432323465356232223b733a33323a226239333637383138376330386239613030656638336430366634333334303431223b733a33323a226562366361386131626266376436303762653135363933633636343765323830223b733a33323a223765306631343864626665623963396339323933333033343436653564373565223b733a33323a223334303339316439616335346330366631353339653466613939323937663730223b733a33323a223132613462643837313766306133323439663337306330633138363763613362223b733a33323a223835363738643430633264396463623431396264356163303036346636366362223b733a33323a223861313233653137653834376266666530383765303061663564633965343231223b733a33323a223565343331666466363036313466333566393634636436346238366238623062223b733a33323a223064646463363166313537363534333663393037626161326433646431663938223b733a33323a223733346534643061363930343631653762623565393762623139393434326463223b733a33323a226664616433616466376331653566383236633163306435333330623162653964223b733a33323a223562653835393836366263343861306436333030633333623136646633633733223b733a33323a223163313064643530643933613938376532386665353666373134323263333634223b733a33323a226437313630313230383038626636333232616433343161623436623036333764223b733a33323a223137653965306661316238626636623437643037636366333764353565333865223b733a33323a226136363232643730656663646437633236393534316661653965346639353665223b733a33323a226333656665363163656532653635636238303766323834393864323736313662223b733a33323a226564383662646661646133343632633032303738303161333837653564613664223b733a33323a223564333365646436336635353232656130626636613038303962386665396665223b733a33323a226365396465363833366336626536353764623136636337623065326266646430223b733a33323a226361633564306263623330616338313836323535643132346130653731303637223b733a33323a226161373538343830346437643038346564636661363766663834326161376261223b733a33323a223565336332323533336635613838646265343163393665356339663931356465223b733a33323a223238656336366439333738386430643462323664336139346135626438336439223b733a33323a223735323161623534393736343062663638316133326235636666396165333536223b733a33323a223231363431383166366337633938303335333236643332313538323562333435223b733a33323a223733613238323438613565643463343231623830313431326336613336383663223b733a33323a223166373438613265663466393838643039363362373961633738313465316430223b733a33323a223964616630376633653164363434326535633564633139396431343631646335223b733a33323a226432396236643063353437663462646461626566653862313938616231643835223b733a33323a226464666333333263316165313837303234323462636638636166663632613736223b733a33323a226131623731343265666163393936323535363761376138386631643566663061223b733a33323a223737363261306463353030363536656364393435303663333033386661653162223b733a33323a223162633665323263373263326132313830653135363861633934636438303131223b733a33323a223635333333386664343137353764393966343836643136343864663330373536223b733a33323a223739316533363664333661313130373064643339326432633934313031643766223b733a33323a223031343365626331303733626633343135626234663632323736303330633334223b733a33323a223931633437636632663363366262313533383063376432653439373438653339223b733a33323a223131353238633534356365666633326135393931333931363666333166323064223b733a33323a223736383966626166646435323334356563373436326266326365346336653938223b733a33323a226631376662663430633963383466626664393231303062346665363732306534223b733a33323a223861386564386334313133306530623636353762373762636262303562363731223b733a33323a226237646362633633373863626237353330313264383930396534373365376130223b733a33323a223864646434636563643432333965643461623338653461376162633137663134223b733a33323a223934353537656639343663363031363238373930366362333532396339626263223b733a33323a226332653362653666343833383035616431663634623166356136663630663264223b733a33323a226236313561613736323635353965333233356230336666333130373732653433223b733a33323a223962666664373163626538393238633966306466643962333566373030346233223b733a33323a223661643061376236373633326565393239366465383662383631343362373837223b733a33323a223666353531616538653238633032323232626435353438333537646231356466223b733a33323a223737623831643435646335313836313835376536376266353865396464613163223b733a33323a223464646538663737613231323230643434393134626436396538303639666333223b733a33323a226663306436643237646365383832393665323935626133626136303666393466223b733a33323a223334333432396534383335356331386537316362366533356363313138346236223b733a33323a223063396561636234643630363731633765643337613933383632396663666333223b733a33323a223731613365383334623334643566613664323766393939376233313631643335223b733a33323a223861653034666236613033356665323230323538663763346266303038633433223b733a33323a223565616363356233616566363165353137383631643633323061663864653537223b733a33323a223438643337356331633936383732366137336132363830323534616164333535223b733a33323a226464353333323964633264633866333564343531623265633535333434333062223b733a33323a226161636331363834623265383330343333326565303335356430666630323134223b733a33323a223463303262383965386438363139363461343434386539613765633765613839223b733a33323a223230326465363831323539343863343563396563323534396535373161666630223b733a33323a223731366532663230376366666439313661616362666662333531646266366666223b733a33323a226636346563353161623863633030306230666631623038656636343361363134223b733a33323a223966663933326563393066373665383037356338346165643134656237623939223b733a33323a223032356335623932316336373833336365623862333534633036336164626335223b733a33323a226465326238313130303137396662346561653161343663393836333661313032223b733a33323a223033643064313839623364356235623334643738393762613031396639616164223b733a33323a223533356632336464376131316361353232653637613965373763323131353034223b733a33323a226436653333366136346633316531303739376132633364623264623361343861223b733a33323a223435623339343733623831616266333630613862633061613662303033616231223b733a33323a223866393366363565633438323637363137326162623036393731333132666237223b733a33323a226130633638643864353939376434333266613433633935306238313161313761223b733a33323a223730643732646533653865626664343137353737656631616335646235313430223b733a33323a223131653339396237396334373530373535303937623062336233653332303631223b733a33323a226161353734623130343961353335346431623534393732643266643335383163223b733a33323a223162373038353162656337343461303762333466653338383865623633326139223b733a33323a223831323263633639393966366431616365326663383136633633656161636231223b733a33323a223437353161353464613835363934376163323638373065316466383465653636223b733a33323a226534363939386264356239626236613166356130343035356437306636373265223b733a33323a223334613462386136643732663238353136353538316363663861396536303139223b733a33323a223738326636366638346239636434303532323964386130633366306534613838223b733a33323a223863633332666561376366353764323162373665383036653630633963323266223b733a33323a223861636565333434326462313763626362663031356534633632323736313633223b733a33323a223339333738346438366465393636613930366436356339336139393437643034223b733a33323a223937356631363034363962323234623462653063663837636366626334386138223b733a33323a226230323133383665323138613338623631396432306363616632666265366562223b733a33323a226665353563376131663666313231303461313233373630386261333933383535223b733a33323a226533333962653062623863633961643432353130313430656630343837656330223b733a33323a226634326165303365383530656235343039663066383832613530306165303065223b733a33323a223132613461353033663064383565633133306539393164613735616331643161223b733a33323a226261306633613436316163363865383538373932373132383131373130313530223b733a33323a223061396563316436373362356166363362376435323264333838316639613566223b733a33323a223832313533313530343862316239373234656464666334646335363463643164223b733a33323a223237343534316364373133343464613337633936653135616565623965373534223b733a33323a226534616337326636326636373935376633383564363330343034313539346432223b733a33323a223864663735386237363231303262663939646465336664356238666438323235223b733a33323a223661656166653163653535333435373533376239373564633635303331366565223b733a33323a226464333361383331326132633938316132326664363232313630323834386362223b733a33323a226265393135323837616162303739356138343664303363366431343265303932223b733a33323a226164373034383137323632613036353665633261383930336661633163313863223b733a33323a223330383135393364663433303564643132316533663636353134353030353534223b733a33323a223930613565333435356161303439653566633062373131393737316462316434223b733a33323a223835343131306536623230633265343138306538626161633833633037313530223b733a33323a226239656566393634393365323931376166643436373335396136353562626262223b733a33323a223138656236666666383638353330366162326637303734633564636562326338223b733a33323a226432376630636531616634613931383237393766333939356564636263363465223b733a33323a226632393734623064653862613437643733636161373962343266393762313731223b733a33323a226138333733633731643361303965633066323964373238336665396461373965223b733a33323a223937666261356566633366643766313763633865323366666237616230636663223b733a33323a226466643039613063646632373761333939663566336134333366373735346435223b733a33323a223061363430666436306639643165383464373532646665646565663565393861223b733a33323a223133633664333030313036346462626337393030393130313435313937396332223b733a33323a223739383664386439386636623532643763643637343965636331393139646264223b733a33323a223336313037626435393537643564616135343366316562663131616439393065223b733a33323a223231613261313930383964636139316366346236663630373339666338373933223b733a33323a223631363633623334346631633165653638343230653833333862373862383733223b733a33323a223762643666336466373865316465313664303861613563376663613436363231223b733a33323a223336623631383163396666373264303631376162326633313864393064396661223b733a33323a226539303064626630366262656532333164613435636539613632366230306434223b733a33323a223466366338346532616338353431626264356335366133663966306266343138223b733a33323a223465306165333935356131313863623031343335346633623635353733326363223b733a33323a223333643533636239393535306164343036343039316461636636623731663834223b733a33323a223861656263363962643130363266646231363263613032633435346533383532223b733a33323a226638363736613261343230373063356365393432666332366536383062616461223b733a33323a223361636238646564366231643664393136366334653630353234623339313262223b733a33323a226231363665373165393639346238343361353138363065623665356231333466223b733a33323a223136383466356137393139643566343539343034343962333539333666643734223b733a33323a226337383435663166326265663461303434393834396630666566306565636438223b733a33323a226635323633323838376436353066343863353964396134626261663737336538223b733a33323a223561336231633765643333363461623237326136376661353131323239306561223b733a33323a223165336466313131363933346162383430626461383837373732376565343330223b733a33323a223233346465306438333330636532623161326565643961666139336536386165223b733a33323a226531316333663735373362386261613232613134343666303838626534643063223b733a33323a223636306434646563636565343532646464636361343065353034373137346631223b733a33323a223435306263396264323366666230343733363933373739333435636566316363223b733a33323a226535333463623634316466663037303263316261303063366437663138343865223b733a33323a223932303333616161653863643030383037626138633862343864366134663236223b733a33323a223763613830616431643037653435386330303937623362653132303635633363223b733a33323a223561356639333535613033616361353139323262363137393037356663306431223b733a33323a226336633263336662656462626463326533313764356161303366626437613165223b733a33323a226232343834613662393139353938623438323736316333653034346330636637223b733a33323a223339393938376664373332626163326566643437333235656661393566333262223b733a33323a226537663161666232373466383131303935336333313939633464663639633837223b733a33323a226234626666356661396136646363663461653066343131386135343236653162223b733a33323a223932386538613162326136303031633833653439646462396231633532376162223b733a33323a226536393934313630633665383031326636373039343031353237333362366135223b733a33323a223530646162353464666236623436396631376164333864346631666436656132223b733a33323a223231306463376336633261353162356231383731333662616531643330613763223b733a33323a223636346530373162656162383761616130386266363839626139386538313861223b733a33323a223233373136346465666231613361373365323232303437616462393331393862223b733a33323a226463626132363961316661363565393333623065343130666436353561333732223b733a33323a226665643235623031303532613938643333303235343638383964356232313365223b733a33323a223331343138636236373436396661346561633738373338623063343338336433223b733a33323a223863336334636333363634353964313839643866356434663837323033303136223b733a33323a226633323531636666316137633530646463366331306366306566343038303539223b733a33323a223663643739613236306364393963363032646462383066653864343934653230223b733a33323a223237613734366138386464323231323066663934363237666633623332356331223b733a33323a226261633461313732323935623939346237303231646433346165306333303035223b733a33323a223765303539346164373734656433316535653133363636353237373963613766223b733a33323a223032306430646365346565376137613162386530623465646165393362613333223b733a33323a226663333230356230396663306339386664633031323862366464643231666437223b733a33323a223939343163316366636132373831373163396264623964343237623937303765223b733a33323a223464623135333362386437636330613235633231646539636230373836393862223b733a33323a226165353933623830373965333938313964386639636164626365363330393437223b733a33323a223466343837643836323536333736306439316239323664643831646462616562223b733a33323a226437326335376165653930613038623265613761333831366165636338313239223b733a33323a223964313862343839313134613638656666343666626130346564656237653432223b733a33323a223830643032383431633235616535393135303265336339306338636232376632223b733a33323a226265653163393339616139653937653739383265373161353665316664346237223b733a33323a226339373161663039386366333039303766356233323631366233636138306464223b733a33323a223263323865626631383165306438663333363535656366343961653137643237223b733a33323a223933616633656233353230643233396439353431643862336536373738346637223b733a33323a226435363439376137353634363462623435363461656262343738376634313462223b733a33323a226565356134303033386464613866363961373234323439303835373265353131223b733a33323a223462646538376439396432363837376264303237616434313839316136636661223b733a33323a223164633864626335363362346531636539306236616431633035346630616530223b733a33323a223534303137653638373232343639623865626231353663363635396530363236223b733a33323a226463626435373333656437653637613830626330623932363037363737396130223b733a33323a223833386133643738373837646437626234343631666632373661333162666161223b733a33323a223731383465666630326238636636313530613638373862636336656663356462223b733a33323a226238643733333430383436306232643863643535643539613865333332613866223b733a33323a226230346364326237613231326337376537643835616339363239396233613361223b733a33323a223932616231363062323437353335303631663035333235333939346434396263223b733a33323a223739626231356662333233356132653364363038353732393264653130323666223b733a33323a223764643666393835333939616635636430396231393965613735363339353862223b733a33323a226635656363613361393737656666646566376465643164386532356534323838223b733a33323a226238383335333030646634656330663162663364323038366534623362666131223b733a33323a223332303165643835646332623030623564323363303762333838376538343830223b733a33323a223161613736316561366434363933376564353230333030343438373632316130223b733a33323a223130366431666434396465643730356466316264306634626237643434393062223b733a33323a223961653039626532333630386264303934343262336137366338643062343063223b733a33323a223131376133356361306439363832373733373838633366666665343030653331223b733a33323a223863653439616361306534323563396330613963343432313462393063386232223b733a33323a223636653237333033393139343332326264663835376164313734636636353736223b733a33323a226337656335363761393334373732643339343963303538373565323161643639223b733a33323a223736656438313463316634333831613337336265643564383532613933366433223b733a33323a226534363233346364643639613932373063353762353465303863656563363265223b733a33323a223030626564366566386663616561303533356262313130343665633638383832223b733a33323a223634663238643832306261626165363935323534383864646639393465343263223b733a33323a223238653363313232366663356365303163363331336531366634343639303633223b733a33323a223362303339323137356566386531663964373662376461376135363362626131223b733a33323a226338616363623034663230656232653935303162643237646533316663356538223b733a33323a226266303335346633393534346266326533376334616562383265303833313662223b733a33323a226338636635636334313661633137663234666261666637643635363038623036223b733a33323a223335383534616538313032623836393430343161393739663538383037333666223b733a33323a223034653635633235373662636534323731393766646364616430363134306563223b733a33323a226164663833653536333236323838393032303562383438396134333131633162223b733a33323a223837386530373463373664346637633764613063366432633331613930343637223b733a33323a223633663634306462343531656630616564303164643632623362623966626130223b733a33323a223263366336383964383263626636376266326564633366313835373933643131223b733a33323a223534646434353233323038623866666434643964656236663463316163373464223b733a33323a226238383839376333346237313533616531386537653738656164643737666462223b733a33323a223935323531656438386432393265393637366632666163663434656362326164223b733a33323a226432396433636234336135343263396462386434633733613437376335393664223b733a33323a223931386564373937383063626233383039316138643935396562333066396566223b733a33323a223232363730336462383233663333386138663164363763643732323130396539223b733a33323a223665346339633235316461373334646161356230396631373836363730376636223b733a33323a223838626232623538663164326234353833613231623933323530643633353234223b733a33323a226365323932353535623365323030396435613465393063303962646638653864223b733a33323a223638313938393936643936396462613462333265343531613031643866343363223b733a33323a223835333664373963623633373638633236323463393237396436646264626163223b733a33323a226633383736353136376364653764303837663535613761316330313233306666223b733a33323a223736663961613762623434346166623565333636343265363433613565386232223b733a33323a226438616662316334636132656236316430383631393339303439323135613732223b733a33323a223566323232383232336262613161643334623436656337633630383033303361223b733a33323a223562326464396262353233303763343230306265303230356437376234616439223b733a33323a226566333035663336386230373937643234343833336631646333313937643163223b733a33323a223038336466646533393731373933386536366335373565663465666130666235223b733a33323a223730313166636263323863326563356438623330616339383638353063616330223b733a33323a223630313931383262373061663165336531303061386331346132346439663765223b733a33323a223632373335383964343931666165666133613736393332383631373338393233223b733a33323a223963333362356530653930366131393734353766623732613163363932636335223b733a33323a226537376139363932636664643139343635346132623163306263666235383166223b733a33323a223763333831386332613061353533633162636537373637626664316661306631223b733a33323a223334396234613365306132363531373631316130333530306134663861333134223b733a33323a226466643231383763373239613663656336393663303130383765613334663230223b733a33323a223866623031616638663733633733306461373364306663333366656537633066223b733a33323a223461326130306637383535663365663461303337303933303661663961353134223b733a33323a226334623266333262666435383563383064316136616531313834383135656137223b733a33323a226564626432663965323438333963633230636337373264666236383863653361223b733a33323a223430646238326266613662626234653135326266326366613861623364373063223b733a33323a223339326133393461333062363338393062616234326231383633393035333432223b733a33323a226562613230333134616630333939363933316336643766663030383733386234223b733a33323a223239646464386636363465376566663335376362343961633863313533303166223b733a33323a223736333464663437393739396636656232313636396334636430313063363234223b733a33323a226161656234383234643731396134356664366261316261303039353666333130223b733a33323a226166353865383662333965303564326164373234356536336565666236316435223b733a33323a226563323262636663666639646162383837326665333635613934363733643636223b733a33323a226462666333363762633533363537303166613961623863343633623166343463223b733a33323a223337616439356232653035316664313233393436326630393333346166633139223b733a33323a226339616538346236383539623964366263663536633938356462383132393932223b733a33323a223931613734656532396135626462306333626335663231343666353039396463223b733a33323a223563333961613363656233333564666366633639623261363534363135633238223b733a33323a223131313466643630643634633635383535653066366431633933383330646166223b733a33323a226565653435333366313463313932633039646137353264633865376361376239223b733a33323a223432356263373239336465646631613237373662386437363332653161653535223b733a33323a223036633761653536306534613763323861623132633661626632366637306661223b733a33323a226338386437326235666533643237623364393635393838396335633734323063223b733a33323a226238666439316537366663626631633332636534363461616139353833396131223b733a33323a223931653331613437383430336634396134353666383136633332373435626237223b733a33323a223864313061356461623732363162643037343735393063313637663335353437223b733a33323a223730383664626538383736346639616565306364306433666464616134316637223b733a33323a226366393063323132653732313631326465373530346663633330303061613937223b733a33323a226638363535663131323863306262323439363934323065633335323833346230223b733a33323a223836363732376636656130613236643566343738363438373237373965393436223b733a33323a223332613439656165623736653036393333303830613663323563643062643830223b733a33323a223135626639393661313634666132613061393866633532396239633630313164223b733a33323a226161343039663538646331626264343335333263333836346233663266373263223b733a33323a223939626637306338363134366638306332303461353137636363616332313134223b733a33323a226164626237646232363930353739613733663430623639313138333662316161223b733a33323a223363373161636562656361653338303432343432643037373661313964666562223b733a33323a226263306134626164353466303863613537386434613537343239343461383437223b733a33323a226663366631343634343937386466636131323731623964616565613931326234223b733a33323a223039646431383739356536363865393264353330363431393939326461346163223b733a33323a226463656636346666633331613966653765333934626465323832383234656530223b733a33323a226330353961616534386362633136356236373938303036626632376464356562223b733a33323a223666653531623034616537656466333765646232373033393937373533363166223b733a33323a226561376134633538613838386130326630643066646164633837613039616463223b733a33323a226338303138323865313063623038626163346635383366613438653064643839223b733a33323a223535343236343866633438336361316131633133316139383566666437396236223b733a33323a223934373036336261653238383935643531613831386638373864323836613263223b733a33323a223861666333663165356536633537306464376635376437633266623231373334223b733a33323a223335356530383565353934646630373365633233326361366363633537636136223b733a33323a223734303738383338376662656461303765326539623038653039393337613433223b733a33323a223734653832333861386338303634323462333133313436366165306566333165223b733a33323a223362346236646439613932323331343835366136363933336332363636393039223b733a33323a223461666535353638386436643336346365313164313162343561643533336635223b733a33323a226661343431626531636361636631333537346232383336366434386261356239223b733a33323a226166363533666337376338363839656639333439313033633837353835626532223b733a33323a223033363530366466666663353162323835326137656263376132353138626437223b733a33323a226165666234303862346332303339633139393236316530373965316264306431223b733a33323a223731346632396562356238616334343665616133633762383538383235353731223b733a33323a223236366465653366396330333466626263643335376137616636343666636539223b733a33323a223463653034366434306339623033386531643266623334313233646133636639223b733a33323a226135336230393566316362316431316139313766363265386135626165393132223b733a33323a223465366536393365373965386264396634643837343036666438336463663663223b733a33323a223538373933336363616362616437386231313063323937633963646237343861223b733a33323a223561373266613334393732323631616238656266666664356561333862626631223b733a33323a223439666132666637653165373661373738393938666262353261393930653733223b733a33323a223235343663333661643731353839666166336536656639633137643164363066223b733a33323a226336303237306131373737666433346637363838623031313932633733653037223b733a33323a226639643232656631636137316365666233313035356362363062373266636565223b733a33323a223832386331653936616336346363333965663239383164643262333938653630223b733a33323a223462633765663835636464373830623635356362643965353033643361356636223b733a33323a223431613764643462653635666233623461316134356234656461653938633237223b733a33323a223330333462396332663239303065643363656131383866343731656639386139223b733a33323a226436663633393866386565313832373062363262643366666663653463363763223b733a33323a223864363131333662646664356239383633623832393866653639353534613036223b733a33323a223331633261656463376537343330393865643134623738306631396134616364223b733a33323a223461653765313664663735313230343333626532336466323130646166633762223b733a33323a223437343832316638363766613761663136356639623766613632383163306663223b733a33323a223037333535366233376134656464633733643737663135636162373734633133223b733a33323a223061613430633766653938383163396361353165303162626463306135656331223b733a33323a226162353633396135633631316165306436343736663461383536663639633535223b733a33323a226236353265343039303931343663373634613565643134616563306537663530223b733a33323a226331643532636466646631333537323566316635313263616632653433376165223b733a33323a226134383939366335663639646265623537343364383137613731333466346264223b733a33323a223338636133636365363832323132363061643130363434383039383130313564223b733a33323a223536613339613361353735383936346263353263346435333535306334306665223b733a33323a226561336361396236623531646365663633656231623062313261393361643565223b733a33323a226638366230333262353939336631613738343838386334326334393162336437223b733a33323a223761623830613361326466666636383838633233396261346134313661613135223b733a33323a226130393862353230373663376463626262363636366666653166623762393561223b733a33323a226366623164653938656363396166613661333732326666353438323463656538223b733a33323a226361363733353931343735376639616466383163393531343861396666653238223b733a33323a226261396266613665363861383736663936396164663764613639666136633330223b733a33323a223630643736323433396138343431623236656138303938363761616264363166223b733a33323a223866393730623030393539616636353032656266333133366337363065343337223b733a33323a223862616637646238383165396439396264613637613231363434626436653464223b733a33323a223434393766643632303632373033326264636533323664616439396663393539223b733a33323a226537343933656338613833666366363334396364653830353864353764656137223b733a33323a223132643931646537323365663161363264376538366165636339656536626266223b733a33323a223633313435326166663662353664396431353365623234333334633633366239223b733a33323a226332353736646131373434373466393737373238653834346663393035363761223b733a33323a223837663034343836653166393532303763323635613437336335663639373435223b733a33323a223165636635316230623332376537623432393831363033313332633964633730223b733a33323a223461313039383032643438353764643864653139346637356464346562306630223b733a33323a226265333333346531666631366435336532366238326131343334653865623166223b733a33323a226537636631646238306663346339623135336661373661326536663232643936223b733a33323a223434383632333238633733343166383139663832306430613338306639343761223b733a33323a226165323034373836636233616263376238396665666231323331396635346362223b733a33323a223663613566363963323764366433383763386663363933303731643830336133223b733a33323a226634346266306162653864366232643937303430616361303936323737663435223b733a33323a226139323832646336363532653333306532653964633931636131656161663866223b733a33323a223662633834613564336162626466343132653062633933316261383038313466223b733a33323a223163656665663831333138616165363737616266316561616430633636653334223b733a33323a223739353862383930616231353833633931633932393136313439353235393038223b733a33323a223764396539663565643963383265363937363832636336386332343930336233223b733a33323a223763356464663033356530656637316562623137613462326236626564396232223b733a33323a223362323435356133313832616161653537306234653361333063633338303831223b733a33323a223265626430353435636638373639373139393438386336616235363239633037223b733a33323a223932393839613062643833386430353830646166613265383732303266353733223b733a33323a223664636264303432653164616663316461313536346338373364343763316231223b733a33323a223866353562616366386239343463383963656462333832303035343435353537223b733a33323a226430353430363935626265613163313037366264396365393331666534303663223b733a33323a226432316137353732623033626538313939623763313539633433383835383332223b733a33323a223832383162313161653139333630303432396330363636666561333861396439223b733a33323a226235646130666439626264646264373166346361623835356237396139623231223b7d733a343a2268617368223b733a36353a2262356461306664396262646462643731663463616238353562373961396232312d3832383162313161653139333630303432396330363636666561333861396439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a31303339333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3132363a7b733a33323a223361643335323161333266623530313231373966636136633335383339383733223b733a33323a223735336466313166646637356338626235626438663565626639316665326664223b733a33323a223566626263356433326164373137376164636633353639393434346433386433223b733a33323a226165323666303531396135356533643166633265623530333335333335616562223b733a33323a223132616538383461353366306337333065653336663830353839636265633036223b733a33323a226664623033316539336432373861383263646266616265653764663237386231223b733a33323a223461613534653430386138336339316665386132333033383034383636653235223b733a33323a223663346633613364666461313137393638643239633466333932363664623632223b733a33323a226535353262306565393964626662393532303663303538323438326564343337223b733a33323a226661313030306130343864316666343462303664306364306263336466363438223b733a33323a223839623939636430626338613765316562643434393863376432363235346636223b733a33323a223639333130366438363731363031316430326339383533383861373362613738223b733a33323a223763336434616363616638646330363639363862383961643131636231643331223b733a33323a226665373462383064313538376238343834323431376463386266373864353564223b733a33323a226465323635353836633134396261663834623630666639626439636630383036223b733a33323a223365613838346236356633333930393535343132633632363566346531656263223b733a33323a223630656662336333663434633766373733396634366366643961383164663063223b733a33323a223961616138303864303535303266646436373435393731633661386563303134223b733a33323a223863626463333864313934333263306232323734383130623665623137343530223b733a33323a226362316435386232643563313361336634343861386536633762396133363163223b733a33323a223265313163383530633037376464623734303264353733313134373032373234223b733a33323a226365376665343462326136313762333438313463363465356537363339386130223b733a33323a226433623733633033653130616165613965366463313532396635343934623438223b733a33323a223265363266306162393464373933353862346466626362346566646266353038223b733a33323a226466663432616161626537666530333636613566386534653534386230346330223b733a33323a223138666232353036633264323935316435333434643233303132313764313962223b733a33323a223139306239326162643163616535653438613333376462653732346561353636223b733a33323a223964343836383632616531626662353135306239393234626263643763356337223b733a33323a223132333734393533616564633637626630303165353964326262663461623739223b733a33323a226233376130336635643464346633306366333566316237663535303237613633223b733a33323a223239363966666336666433623764616330663461616363376436636139353133223b733a33323a223066636163653030643430626132313430353365313736353730366166353063223b733a33323a226162383632306162323139336634616664303738313764646433353863363932223b733a33323a223663326433396136346230616165353930363335613838356231626231316534223b733a33323a226663643562663334363837313239386339623630623462326537353933383931223b733a33323a223165383830633265363861376533366361616562623639633932616637343338223b733a33323a223665656236313431643539373066323464363866396135333935376234633033223b733a33323a226164393937303037666538386464356638326236643234313965363965613266223b733a33323a223737333566653864373163363766663962373031303232303830643933663533223b733a33323a226533353336303264653831323763653966643263636233313435653436313537223b733a33323a223035393238653963616466366231366461353331626364613339653535326464223b733a33323a226235613337386538653136356132396439343138363133366137336666653433223b733a33323a223837353564353233666632306165396562633137643262393538353365613338223b733a33323a226661613635383161373665386138393431316665336234333663306461643135223b733a33323a226532373637646365313366623066336331646662373764336433353030613133223b733a33323a223338616165363139343064613463393136643438316164613436323634653330223b733a33323a223431666339613537383430396130343437316564633532366464663937376265223b733a33323a226639323335386139633735636332313537396132393631383862613933623261223b733a33323a223166646135653539653037323966643366366266393539613566316464306530223b733a33323a226431653039363264316361383938636164313335643332343565366530376264223b733a33323a226439356137623935623236356533346432356139323763353430326635333738223b733a33323a223634623963373539643264613630393861616138343639626538396639323433223b733a33323a226231323233306237636137613866633736386562353432636437616637666632223b733a33323a223437643361633239336261303038323137366563333935613139353366336361223b733a33323a226535623037663837646538346337616466353330663836313131626464373534223b733a33323a223962323861366561653739333338656634623733386138396239613863336539223b733a33323a226434376139613932373930343832366134616465373239646133613463353332223b733a33323a223934376466653261653731336365326130663062316163633935323936313032223b733a33323a226161353437363433376435643165626563623636336634306661613535316431223b733a33323a226231326135333366353762636664616531656533333763303532626332306338223b733a33323a226631343234363563396139376265653965363134613465616366636535666366223b733a33323a223164363935386639663865666135613362636465353138336337656638396266223b733a33323a223830613339653937653531313132656363666139393336613966666262343066223b733a33323a223430303936646564626131323631333166653538376663333537356536663432223b733a33323a223737353766653238653432633832376235643138656261616534336631303139223b733a33323a223232626465363039333035356134353737383664393233646463336636393337223b733a33323a223631663565613036326235336361663538663133663239633665616431636165223b733a33323a223962646464396366303838336331356165343534653333393237623934643330223b733a33323a223564386137623138666562386635343265653536633232363533386330333135223b733a33323a223963303666383539393439666135373335623639303566653838633962343133223b733a33323a223034383135376231396334303631336561393961623461653535323635346233223b733a33323a223439666638316461653363616532623239313166386362393733653032333561223b733a33323a223364663435316463363661383532346666316262646337653264393866336530223b733a33323a226538663766623565636533386236363032326536333630373833393630323465223b733a33323a223031663336353730376638663737316535373133383164363138303062666263223b733a33323a226462363836623766333266663163356666343333666365343530316363636630223b733a33323a223661336432386331363834306537626638333433626163323562363039353738223b733a33323a226633626564623264623334336339393234613531323965336265363563323062223b733a33323a223565336463313363366536643662316236333866373533666336653831613430223b733a33323a223261333562306437303563646639313131303234356431646235386533363065223b733a33323a223830396664356563356534323030636533336164643764393466663866643137223b733a33323a223664353365373635666430353730353862366538373532356536653864393865223b733a33323a226432363431393734386635383266353932323862643262343733303461663866223b733a33323a226438623430303966386364666433366366653662363031633765303463613932223b733a33323a223533393637653265333365646132626232303038643364366637653562383836223b733a33323a226262663236633937356537343862343066333737623536313334313435616564223b733a33323a223435656166356465356638346161366534636162643631393561333634303765223b733a33323a226434666332326631323864346139623535363861386131303931663538376133223b733a33323a226330623736373033373561646661666561336536363766313235386238366564223b733a33323a223634356661643836623337623862373832376135383533663362303364626566223b733a33323a226334306135313533373961363831313034306239653331636662323064646631223b733a33323a223436323038613434613933663366653062636131386166663435616137626333223b733a33323a223635383966386533633830656635663936326632616138363962313466616130223b733a33323a223366653138643562636562306235363165356238646135323562616663393639223b733a33323a226435313562643433396562313436633136333661356661663932663832613835223b733a33323a223135656136656466646666643662643764356363613435346235346363353335223b733a33323a223431633638373331633133636166313336383637353866633730336166333131223b733a33323a223532316161326566353961616261613439613065303631656362633866346464223b733a33323a223438613437363933656262643237333331653433323736363265663436323964223b733a33323a223563613537366533636464623862663165646465333063616664323232663139223b733a33323a223332373932333739383665343234303131343666663466353930373031326239223b733a33323a223063633566306561383830626163653338633134303361643139663938303962223b733a33323a226162346435313036663835633664303730666366653435323337613263633561223b733a33323a223430363062646661343362656534646434346563333331643232666430323935223b733a33323a226163386236633561346335633538363630376538663434316366303531396534223b733a33323a223035333332343266313665393864613634373466623438313264326432303961223b733a33323a223366313066326332666163373466323032363037396131343138633839323535223b733a33323a226139663931376633626162636130323831333632633063633162323836353233223b733a33323a226335356333646437303239666538643133646461373135653066326261613937223b733a33323a226263653664313233613432656362393435396339376533636462393264336134223b733a33323a223930336536613265616237333262353461316564623461333664356637353162223b733a33323a223131633733376438323731336661383132663463353335366635376361643664223b733a33323a223964636563363732646632663463383436613261323132643162353530663062223b733a33323a226233303535366133386539656562626535353739353163383065343837633231223b733a33323a226537643438613365326537653332353432353032386637663865613932343766223b733a33323a226138636338366264656531383531306433353732633833396135383964386335223b733a33323a226138313463366163303635356338626134343533343866633032643364356633223b733a33323a223636643662613535363134656337616637366161616232363239323433623031223b733a33323a226136386139643331623531636235393237336632623336653266306232323839223b733a33323a226333303663616639303539376264373532303038333732333631376665633735223b733a33323a226335303963333233303530313166366164663639623335316238313063353031223b733a33323a223832333263333639323866346464343562366532336539353230633534383238223b733a33323a223233363933616133656235313661306635623937366138393934326664323065223b733a33323a226230393739663034633030336139346565636562663565333335366231356433223b733a33323a223636646537363937376230323036386338616434643835623835616137623263223b733a33323a223035643464313038363031313161633861633363336164653637653561396538223b733a33323a226662366363383834663065353164326436613936393434316235383662366365223b733a33323a223133303865663835656263313164386132356136646532616564313338663966223b733a33323a226165626630376431336638373034353937333438666665353236353730383731223b733a33323a226138393231623238343733636236633939653162326334633336316339336232223b733a33323a223339623062396464346438646437306433653630336439616364373130373934223b733a33323a223735336633316331636232616535336330346338636664336239326436636634223b733a33323a226466343636623462306230613031333032376138373537623735663735303039223b733a33323a226136313837653162656661643663333565393064666162376564336532373637223b733a33323a223632646430663665643566333563336565386563643438376633616531333734223b733a33323a223239633037363634313235333530383734363465333061303736336161363661223b733a33323a226339666166653063623935306631623661643030393436623730633633666337223b733a33323a223465626133343133313331353661343037613234613035323761623238653034223b733a33323a223133656434303538663833643631666537363530323666363532306434346536223b733a33323a223332393432326436656365333564333461663034333961316264353338386561223b733a33323a223461303061373830313432316138363434393862633731393330646533343034223b733a33323a223065623130313730636431393866326537663561383435326366643837623533223b733a33323a223761363835336339363762373438643931346131666661623531303763646135223b733a33323a226632636465353638363032643062356362663632343431316337333938613464223b733a33323a226639316135323061343539623631653165303531633630613237663035313666223b733a33323a223061626434653436393036346333393661633265633962656531616438323534223b733a33323a226135616261653836323337633032373664353539636233343233616265653730223b733a33323a223633636562373562383532353264626630336164383162653631636361373466223b733a33323a223565386131383338346661623664646164616236346131393262396339343432223b733a33323a226338323761666662353230633134393432363935373236366164326663613535223b733a33323a223164623563656330623032396265373964643238613762366333353333646535223b733a33323a226233373264333937343237613833383266316663636330306632663437376537223b733a33323a226566303162663932326562666431343832396362303061323063363738626634223b733a33323a226534376639316337383538616331393736353039383033633061333835616335223b733a33323a226534336134363461346335353735303261653739643361356236386266383038223b733a33323a226162346530343832353732626663363265613438656536366362363136343062223b733a33323a226565663963393937656165613831383134646162396164353266386435393736223b733a33323a223135626434636339616131646132623139653533336464396636343630343933223b733a33323a223331356137343864303562363335633862323333366561626538356231363735223b733a33323a226233313431613964653534333835633438383331663661343137346564663234223b733a33323a226331616461656135623032353237616130343138643236306666383063646634223b733a33323a223236636662613362386534373662303165393466653738626631656432373364223b733a33323a223362666230343731373134646461373435336339613363373539363166376366223b733a33323a223961356264353766386662363138333039366531346561613234393334346232223b733a33323a226630313430626537613239376163396132383265393762636430376635303837223b733a33323a223332633563333336336539663239356139396639343865363162613232623533223b733a33323a226131336138366531323534353765653161353439663562303334313637646464223b733a33323a223031336563626430306161613436666236343361343864303163306234623163223b733a33323a226230653964653162656665666433636431393261653539353832326138666133223b733a33323a226565653364613439373365653834353365373138633465303764613235663337223b733a33323a223236663733303336333235333635303836643237623565663365616563323565223b733a33323a223432616237333761323533643531633334316431313465643265386264313864223b733a33323a223639656539396465326663316231623933663061346666396161623966613463223b733a33323a226331363134646436376630623131636138373039653933666364633466316630223b733a33323a226133316431663539666132326135343031643032376138333064376632333665223b733a33323a223439326536323537333662346330336665623262313933303464333834623562223b733a33323a226265333938363330613930336539343534356338633336386661653437666439223b733a33323a226433346262343966306638373864323462353265366665613664363132366566223b733a33323a226461646163623138333439396363383639363834363630343864313837663037223b733a33323a226534323231306539306238313764343062316636396631336266373262383138223b733a33323a223035346466353763636638656361363132306633393538346330333162376332223b733a33323a223064656632666265316130353363626537613031656261303966326464336462223b733a33323a226632396231333666666538383730656138356539646134316262623765383039223b733a33323a226462646566623831666532346564323437323634646539376362386239373838223b733a33323a223531386439666563386537613439353864343962353563646332303931393031223b733a33323a223732353566646430353136383839393765343631656639333564343435653964223b733a33323a223761343465363532346463613335363562326466373839313132313363396438223b733a33323a223263316530366637343938303665396461306239373766626632623637613133223b733a33323a223638333233653932376566653334646461306235323532383764363733376464223b733a33323a226164643236626431346466323566656536383663616335373965613137346366223b733a33323a223839346563363433316331303235343064306462663963343561306563373038223b733a33323a226539366133373163353738343931616335646531393836343632323165346232223b733a33323a223230656139663432393839343762386138643261373538643833343263623239223b733a33323a226431396336336362616137333737666466636139646138656538336161616464223b733a33323a226534636632633537393932323864373732646631386130633264636261626537223b733a33323a223534306438386637363464376433323066333763636436656365333538343836223b733a33323a223463633334643866343130636534336139366564343766316237613639373131223b733a33323a223664353437613937393936356238373963386164356462343265666463613561223b733a33323a223837393336333030323764333932303234333264353733326263626136386432223b733a33323a223366313061386164326439633166303337353761643561633237323233663738223b733a33323a226439646264363966363138373364313930383133646563366261376636653030223b733a33323a226461643635396330663433373139613237666361373631303730646133613534223b733a33323a226631343839373361353430663562343335306632373638356564303930326431223b733a33323a223330643761316439643430623532626662633166326136623730663864393033223b733a33323a223931343162643833393063353866336164613264376166306539623265363438223b733a33323a226238343364333964323161643039376266653662393037343931613832343564223b733a33323a223531626638363765643634623538306465376530303434313136366231333534223b733a33323a226362373737653832626562303737373966336565663531356136633532623566223b733a33323a223138653965366264363564336262383837363037313662666362656535343139223b733a33323a223139306536366663353435623736626231373336663235373437346231643962223b733a33323a223739346633653731623539383238396638633932303838343264386261643161223b733a33323a226635643663376164333736346634393838666639326264393763376230373536223b733a33323a223030333035356164323230663936326664376533376532343834613330326431223b733a33323a226662346631376165376632343236613637363638663961646464623765636262223b733a33323a223061326634636462346230336664353837373162623834353638366339346138223b733a33323a223439353065323937313764323262336264323339623930613137393963313763223b733a33323a226263313861613233343164353931376133313661313030336137343064376563223b733a33323a226663383731346561333434343332626336313632313834663334643331626665223b733a33323a226337333234646161373537316237303632653237663539636538646131353063223b733a33323a223137326231323166313932393033616664623962386266623864326164336166223b733a33323a223463343532633865656662656233653233666564653562323462326330373539223b733a33323a223134653962313931306635346136653030613935666566383761363734373163223b733a33323a226166376237393237363538613665323865663134383130353333613535646337223b733a33323a223335623131393935346331656632623136663963663039336333353430366538223b733a33323a226461373763343837626536613336643134646635393231666234386130353362223b733a33323a223233343465663537653538613636313533656432346263643265373239303562223b733a33323a223135616539626236306163386235366431636631333336393430333039626437223b733a33323a226332376134373632323436393332356632323231623132663635356462346633223b733a33323a223564336633383033393131653037386530613634373432626631316435393466223b733a33323a223934396165393862373035383134653463643361666461316535326130316533223b733a33323a223236646536623961373538636435333063363231326266326263316362623737223b733a33323a223238646339373635336635653261376631343133643962333037303434646564223b733a33323a223130373037643337326537303633303462373463343435383036356361633665223b733a33323a223033313263336366323764363931633933316130326563613464323363656537223b733a33323a223661653934353033393061303039636536663438366464633066626630333235223b733a33323a223762333937333564323962303434303035396466363162396336643362393265223b733a33323a223237633536346132396661316433326337326464616631623361353665323037223b733a33323a223734656135616530316137353633316664303865346338336531353435356637223b733a33323a226539343463623930636233326362376637336566373363623934373631386365223b733a33323a226630363330353264313562663965336162636334646564306237343235643963223b733a33323a223735303232323430336537653530386166363233666165306661636664626362223b733a33323a223834646630396637363264646565643636663939616636363733613638666536223b733a33323a226135653538306363666262333539333463353031643564316437363862363139223b733a33323a226163316262346139316261613934333837323439613136343138643965613230223b733a33323a223938323835356138326262373362373761373039343661353761633534343431223b733a33323a226631336538653337396462623033306232336664656362373239646337303965223b733a33323a223963326432643661343662313836663030623163313137323232306464633735223b733a33323a226133343461333364346366353031353630363064663765323630633630643061223b733a33323a223039353532646538386434303439383364306138396634376230323666393064223b733a33323a226435326637666464383732616136373066386239393261663138343436356635223b733a33323a223439373835366432386364616334303637343731623062303561663463613337223b733a33323a223663303165376432326330623461653663353239373031666634636661336664223b7d733a343a2268617368223b733a36353a2236633031653764323263306234616536633532393730316666346366613366642d3439373835366432386364616334303637343731623062303561663463613337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226538636664353665646463613261623238613036663832386130643162396363223b733a33323a223433666162333462653434313463343135343738333932306230376266666639223b733a33323a226537336363343538306436656634313334333861356365346536633164363137223b733a33323a223832333761623839623035616136363762353532346235346439363265363163223b7d733a343a2268617368223b733a36353a2238323337616238396230356161363637623535323462353464393632653631632d6537336363343538306436656634313334333861356365346536633164363137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a323135323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32333a7b733a33323a223161373335346631393831303161396362396561366166376264623137306633223b733a33323a223032616133653666333330313463353332386237303232366261303061653235223b733a33323a223731363237373232363035646365353433346532633464636566333432383661223b733a33323a226261663132373864333739643630373661336631313463346634343535386333223b733a33323a223933633136663038323861653536333830346561633261313239346165326139223b733a33323a226334386462643831613733626461613061303135653135653436333437653761223b733a33323a226337303638323038316162626133636432623733643734623930653161353038223b733a33323a223436616463643139393635373037613166356162343762633931393233626535223b733a33323a226138663637366635383766383330653835383365636363653138326138343161223b733a33323a226335353032373261613761616439626238393166663638336534373433633864223b733a33323a226533333862643036353864353833313031356161353866303235306238643033223b733a33323a226536666363653038643036346235313736653030313763346636343131306433223b733a33323a223433663961383135323764343662653633316234613934616430613433323334223b733a33323a223538333932636465306535323036643234396639613762636135353239643564223b733a33323a226665363066613634663766306436323535663736383438333632316539663631223b733a33323a223537376131346463613066633865366465646236393364396632653666373537223b733a33323a226564626334393463396231663563346264653363633935333732353832313230223b733a33323a223463336238393662333335663434313864376564636330613134653162373637223b733a33323a223866393934653835653233333032343632653933326663623962363230353965223b733a33323a223461623037303938323561636663393063646564353663326334613639663732223b733a33323a226239303263356238326164396431663438656335363436653736373038633331223b733a33323a223339306265366563343430613135333962616238656361383430663835373439223b733a33323a223232643332323565356336333732313236353939323666303232666635336163223b733a33323a223061376162393138303264306433656338356639333565656165666239313433223b733a33323a223739336634356137343431363531646461626266643664383930343637653931223b733a33323a223166353631323731643364643433663039393264623435646235306536326339223b733a33323a223430623363666537616263653839383861373335663639616131373539393033223b733a33323a223665623134303630343062333736393338353766646262633738396537653065223b733a33323a223831616561626533323666653530326231633736386235326430353335333237223b733a33323a223165373233623463313831396237643464316266323731373731666431643838223b733a33323a223238303633626164643436353731383762656436386634653030623835366336223b733a33323a226563623837333366376234336637363734333163643435373130646162653031223b733a33323a223535356133653866373235383035353533383265386363623532323930636561223b733a33323a226164626631643532313836353362653233363361653238643365346161643636223b733a33323a226339356361306138663136316466383132666437613630353633333464346639223b733a33323a223637383636386137353030623137366237363232316162653238316639376637223b733a33323a223238363835653834643533363334623230393633623362656637313332353236223b733a33323a226438346234613066376563363365373866653030346431326636363832316363223b733a33323a226132616538386637373763656335363532373663653730356333333436393565223b733a33323a223738633338643939646431643534643561356339356430386563646238373261223b733a33323a223138306461616163326533386365373964626437333936353261363635393237223b733a33323a223964333535383639323332626463643438656261303964313935346564353965223b733a33323a223263633132356632326639363964636161613664396236396162323962363231223b733a33323a226539626361386564653461656334326639653966336637326434366539363137223b733a33323a223330353764336332333362316233613433633363363664383435623364363866223b733a33323a223061633436353639376661356433393334666234343632643634623433636636223b7d733a343a2268617368223b733a36353a2230616334363536393766613564333933346662343436326436346234336366362d3330353764336332333362316233613433633363363664383435623364363866223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a313539323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31363a7b733a33323a223334383238623332356538316163326333306437373465636238373738303930223b733a33323a223765366237343064353961393936396231346131386630376531396538643737223b733a33323a223134303231326234633164636663383666643662343530336138646335636631223b733a33323a226333636637316332376139303935353264616538623362393437663635346361223b733a33323a223564376238363266613233396331396137396436643131613166356639396434223b733a33323a223165386331663532303432336163353933633036383866366265393961643534223b733a33323a226337386133643031343261616539376430636464616233343939366431323537223b733a33323a223439656531386663626236643034623438373333643765326436316136326637223b733a33323a223139623664613635393535373037663432303662333235373466316438623066223b733a33323a226334373263653365306636303637666562313363306134373533653761376562223b733a33323a226563336532626561383233346464326663376164613733643065656630316365223b733a33323a226432306333373533633833643038643038373364373135316431633063343262223b733a33323a226361373234383931613636666633653035396639373239666537646531613335223b733a33323a226239366164643666623039326330323230633561653861373039656130653434223b733a33323a223431323462633166343765363235373233643935613833613630616337356161223b733a33323a226465626238323964386331333931346330363330373830303732653863363232223b733a33323a223537653730633836363166613631623935343564353632643130643566613837223b733a33323a226238346334316337356366653334303031646562303837653238656561666637223b733a33323a223534373062386139333763316137373837656162356339663864313532323839223b733a33323a226664396231363639633938306235636266343132303639613036383966623535223b733a33323a226131303562303762653232616531313261643533666666373931653438326163223b733a33323a223563363762303331366463376364306365373131353634323735623732323461223b733a33323a226265626563333435346430363335323666393863643661353766383238366634223b733a33323a226666346139656538323433343833623161393535313337633536333632396635223b733a33323a223034316538373962323032386665373633356362626438396661303435633533223b733a33323a223139643563666637376665306162616330373064326336396238356532353139223b733a33323a226538623539363565336337646561666361383064386562616365656330633263223b733a33323a223964333731663761646535643130323462393836636331663363346434616138223b733a33323a223863353636396532333932303765356138653431346564343333666633323635223b733a33323a223737626134323331653533386636366536373762353562373761323962663864223b733a33323a223066383230356164643265653634663736336564323237326565373531313562223b733a33323a223162363933346561393133653331363061336161633433373530396535326234223b7d733a343a2268617368223b733a36353a2231623639333465613931336533313630613361616334333735303965353262342d3066383230356164643265653634663736336564323237326565373531313562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1583348226);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('684484bea297df765b4f2d9cdff77b59', 0x5f5f5a467c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313538333136313933352e3931383839333b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226532616661383134333364326433393931366162633736363739636664363138223b7d733a33393a225a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538323834343939373b7d733a32393a225a656e645f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313538333136353533353b7d733a34313a225a656e645f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538333136353533323b7d733a34323a225a656e645f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538323835323135323b7d733a33343a225a656e645f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313538323835323137363b7d7d5a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223533666166656136306332306130396137363534636161623464666535643038223b733a33323a223736376136323063363138323337336138363130306661643136393438306538223b7d733a343a2268617368223b733a36353a2237363761363230633631383233373361383631303066616431363934383065382d3533666166656136306332306130396137363534636161623464666535643038223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f417574687c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c4e3b5a656e645f56616c696461746f725f437372665f73616c745f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a363633323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37393a7b733a33323a226130333432623964303238313733303362366566633532343335653530366334223b733a33323a226638633234323163633361633531343064353033326634643130326461316132223b733a33323a223965326665633435346332623163643865383766356438623734626465306266223b733a33323a226438313438313661316466363632646131363865636433623138336436326336223b733a33323a223065363363623362663561626362613863363837386131353262353932326630223b733a33323a223238623438646562656664643764623031623139323966653639643138303566223b733a33323a223061316531353161626332643036316231393964623464336132626166363239223b733a33323a223263313736316430663437366134366336656332303834353831663061343238223b733a33323a223365613030383861613437626663653236613739346162343235363131336265223b733a33323a226439383938376666303937653736363530626338626666353338323630613132223b733a33323a223665343439636665383839313961366634303365666266643832663363613133223b733a33323a226235313235336430396630646337636465393532383832646365646332326362223b733a33323a226130323836666363613837306436343834633934396566643238656430653139223b733a33323a226264316430383562663261356236616136646438353465323261303432623931223b733a33323a226565393238663637343361316265383138646239656330646563366461613465223b733a33323a226463343930386336353065653038383535343262356266333337663632313264223b733a33323a226634376661346332323137393732316361636538613731373238313462636262223b733a33323a226331333038616538626663616263653433656364633438313165353338393964223b733a33323a223635656537623339383632623435653466323065346336393063653063623032223b733a33323a223064326166653338356362376135633633303565663134363231336532366635223b733a33323a226163353036663932333431333536393735346332343435356137323536346234223b733a33323a223663656230393535353436623339363636643934653864646564316131396665223b733a33323a223130393933346234343637393464646662373237373634323139356337393736223b733a33323a223435303334393830316563623937663931663234643365626337323935653335223b733a33323a223438383364353835373734666431373231376361316331353434313766623536223b733a33323a223439383666306363313464383764373461303431663138613236353631353134223b733a33323a226134316439303239316130623639633163613932323330636536356536303262223b733a33323a223135613138363130653137626437343537613061366434663866326532383639223b733a33323a223231653137393566356363616232383833613730346332333763316262396533223b733a33323a223738396362613632363336333436643363663730303661313537326334626335223b733a33323a223765336139326166633765346233306562373737313866343338363865626664223b733a33323a226334376139333938373430373135636431313933616538356339386466393035223b733a33323a226532343137613363333061353563613237633836353739643635633564363431223b733a33323a226430303063303065303037333930316530336136343936353232353334373130223b733a33323a223034353865303034303863613066376362326437303734646561336666323564223b733a33323a223834666662636566623231356266636134623732633835666465356432373163223b733a33323a223862616563643535353336356261353766303732616265353039663938613731223b733a33323a226462376230616531343439636336316265313136663738663830376436636431223b733a33323a223236316637633234626630376462323962353166353366343166663137613339223b733a33323a223935656538363264343832333463383063356466343064363565393761643036223b733a33323a223661643864656162313265353463326134313434373031356136346264363565223b733a33323a223236633630383337393433323564623836306339623661373636656162303866223b733a33323a223566633434663961376562646234346563323162613437346162366266633233223b733a33323a226665663433353839336466373163393132313866353963363030353165363262223b733a33323a223533656237623938303464663330323734633034656664633335303461653830223b733a33323a223839333066346639653231653466646633373839373036393365643931303634223b733a33323a223166373736383235363561663062303436636365376263626466343039303762223b733a33323a223337663730323464303437306637346662393735656661373432343030363836223b733a33323a223864353534653161393937353564663835333533326235383563343333666163223b733a33323a223663306365366130363034333039316466393763353834643736656437323538223b733a33323a223134666563653266383338353066363131616231626335623239353535643433223b733a33323a223935393665306232653834613238653166323337306631386663343937323231223b733a33323a223630656238643830366533643662366233613962326261323362306439396539223b733a33323a223230656137393936646336343532323062393961373962333031633363356166223b733a33323a223032643663626466316338616430323662353963613761653963633839653630223b733a33323a223733313534393238643331393862306436636632643432656438353465366362223b733a33323a226339326639366232356433616334656630353936646432623032393932313536223b733a33323a223662666532396539646266636539323664646532663537303433306237343233223b733a33323a226430623632343338396237303237353731616435653435653733653564323566223b733a33323a223934383366333030633830623230376636613735663435623035336234663865223b733a33323a223465613764343132356530656339643635663363346134366639666562303866223b733a33323a223364383630636666643732326462323432346434396361353638343131353534223b733a33323a226431643664636162343761396465653135303734383133303739373465396661223b733a33323a223232613237653134396338656131383366386662303462333038646363643763223b733a33323a226630303763366332633265326335326564666136643134363339313163353537223b733a33323a226535323137643064613937313062663236363664636366653061383661316364223b733a33323a223837333265656234623566656631363132373536643061646337343566303363223b733a33323a223830323235376664376630386630383431303463383434663431373936313265223b733a33323a226661393037393334346336336134643639316231643765366265626138333030223b733a33323a223731666664656530666333326134646433653565323037303133663933353930223b733a33323a226330613261646364356463653930646439303633326136653439333463363037223b733a33323a223635363162363937386430323466323961656138343564323339646634646635223b733a33323a226134353966626362303535633930663330326433393862353131343534306138223b733a33323a226539306632663236356334346533643463346237636431353065356165626565223b733a33323a223537666537653430643838636638393930656136326331366131353537633234223b733a33323a223536333566376437663134373630373339373939396565636265663533316634223b733a33323a223235636463383234323030663832663264376133356331616632396637653731223b733a33323a226466623433363763663039393831666433356438346330366134633634653732223b733a33323a223737363632653830373266353461626663643936303661353331633539623837223b733a33323a223836666463333138323135663431316337333430663736393130343537323337223b733a33323a226432613733373030383935343730336336653937623466383336626464363665223b733a33323a226631333739343231333962333661336264643334616166626239613436386332223b733a33323a223137303532376330653339613830393834346339663864643634396534626438223b733a33323a226539333537393433643630366461303861633037643530666530313961386362223b733a33323a223531306231376563333730376665663962383864376533633736323762363635223b733a33323a226163366533663439363831393663353531386664373963663935616666303530223b733a33323a223866613132343732633461613639306237353165393736303561633530383036223b733a33323a226638333461623662393536313036643137353361333336376330643866336634223b733a33323a223939333664373933306536356264323863666464373961353334646433336631223b733a33323a223037346136366433353333643362323566313539383235656535626638313433223b733a33323a223361666131646631643437626633393234343363646430333464653336323638223b733a33323a223866383533346362616635663537303732383261336234303239653337656238223b733a33323a223237663464356538643530356631363134336461643931366233623062633134223b733a33323a226432313430613363363465336337663465653638356162636632393539303365223b733a33323a223736366566656264623661393231376265386538386231313230363661316136223b733a33323a226464326432383035356664306433316634343438623133343936666666646538223b733a33323a223139663031653938336437323839383632376337336534616639623136626166223b733a33323a226364646436393934306263323330306632373331396231623565363564396165223b733a33323a223933313631643764316532313038316537653963663737626535346439643066223b733a33323a226663366665323661323031396230366435666138333936383863663138613831223b733a33323a223266356163353631323565653533623134656335393335653037663466306661223b733a33323a223262353862356332363333646636636233626333316531396333656436643432223b733a33323a226633666566386630626563323235636165383839633635623036386263633262223b733a33323a226335383332613235383363613238643636646136333932383534363031336361223b733a33323a226134303161323635666635376366626639646563633136343161353062623962223b733a33323a226238316664393536306436333266363330333665663565366231373833646633223b733a33323a223435333730613033323661343930653232346437376161633736633633313663223b733a33323a223464343539316363313235323930666232363436393861613335646438303665223b733a33323a223034663732393930333964666632373263376666366239363362626139366430223b733a33323a223135386530326366353533393563643634393837626131653638333435663237223b733a33323a223937313461343165326466386466366663336664336233353730356232366362223b733a33323a226432623535653736306263343766393837303130336236303166366136306437223b733a33323a226633313032323233616262376462313234363938373730343563636236333233223b733a33323a223738396661663635316366353435373130333639653461306232383362366335223b733a33323a223735383634356663323832386631623031333435383239323063396335663533223b733a33323a226435336231626531386536313661343839616438616335616635366336636632223b733a33323a226631346531333964316635373832646364393832633034356531333464343961223b733a33323a226264393530356239396265613030353134323130353566323864663963616237223b733a33323a226366353131316437346232336430346137346362633735316132366662393866223b733a33323a223230643463656265623763636138336164663136393130653333356437343663223b733a33323a223031333837303730313835653739616465383261373832343738373262313766223b733a33323a223864663264303734623738366133373362653131656335313830623237653931223b733a33323a223837343339363130623462623731303064393837303164303461343639363237223b733a33323a223337633136646432376465633265393162353530336331623333336466353530223b733a33323a223232313533326362313163383466353939353034313837633637663533656363223b733a33323a226366353564323665643038383663356463366666306665373235353832643433223b733a33323a226233393534393839653561346561346266323263383864663233383364323232223b733a33323a223838636133356361356338306464663433623338663136353565376266636261223b733a33323a226461333334356365346665353931633938316531316266323334333132383562223b733a33323a223932323965633836393833343765663734326262623031343538313638343662223b733a33323a223763376630343164623565636539336131323261336530653064663261613839223b733a33323a226239633161623730393234383030323434376136383030396635613631316166223b733a33323a223662623562336237313432316432663361393338653333303239646633656563223b733a33323a226462623632343864623132373061666534373431646531333834373839343066223b733a33323a223733313063343766616266656362626539653633353336353232616539333635223b733a33323a226433356664373335633565373332643735376334646236306237313838376261223b733a33323a223063613835323135666338663238383332353362353937343561656636643435223b733a33323a223339326566383939343336353736336638666236306165313439356433633837223b733a33323a226538643563313737343963643039313433636435623234656337373133363830223b733a33323a223437396537663564386638626436663138343264653136333832303834363338223b733a33323a226463396433306433343961376335383331376262646464333430353633333037223b733a33323a223930656631646663653137343764646233663738396462303061623861343230223b733a33323a226365633230376163396634616634656265336134383438356134373333316334223b733a33323a223864323830626562323039303231666563383537613764326566616436666161223b733a33323a223537306362626538303334363734663966633964323639376134393766623738223b733a33323a223532663361373661386163373131383730396335666437653063353833623562223b733a33323a223962383062353064383266626338656339613638306435656230653837626138223b733a33323a223266336538376338313236313736633861643633633237343839326662653339223b733a33323a223539646139353131366530636566306235373238376335376265633531363438223b733a33323a223362363066313836633765626133376230653362643933653232326161613932223b733a33323a226535656434393730303263616563306431333161353634356536623766666163223b733a33323a226435363239313839356163393261356466386233326164373062383932613233223b733a33323a223134306331353861636131313031386531376262326163333433386334373934223b733a33323a223935643139636131366264393437323230376465343837313634356263303934223b733a33323a223261393331333863343039613930363136343139623733303837393961643564223b733a33323a223266363565333131663633363537373435333635333630623232383165623165223b733a33323a223364636364303764323332376562383138386532633365383264393539323235223b733a33323a223836306533353538393333373564326564613036643736653534326436356261223b7d733a343a2268617368223b733a36353a2238363065333535383933333735643265646130366437366535343264363562612d3364636364303764323332376562383138386532633365383264393539323235223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a313033313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223038393833366633336362623134383565646339643231393436663064343231223b733a33323a223736373137363933633931316230386364373435353034626163323762303465223b733a33323a223665366231343164623236616463303930383734633137646235626631653332223b733a33323a223336366438336662393437393539303637303164653235326261316330623730223b733a33323a223565346232306665323639383561333230386663383339616530626464353231223b733a33323a226239373339633064666139623364393062373232356331643662376165333636223b733a33323a223534386630333132636462643734646438366430613862663762653636626335223b733a33323a223234303036396162393833303263313939653763346465393364666439646236223b733a33323a223837396461333339353831633466316130303239303430376633316666316266223b733a33323a223235396561336530303939313065653137393036323039363937393364663331223b733a33323a223165326530663937366537333031326565396631663031393939646134333736223b733a33323a223761393464663461373035303430323263336439633436303438623138383630223b733a33323a223734336466333839363765353761303534653165373761636330303163666161223b733a33323a223538346366346332613839656165643833303462613332326364336233383564223b733a33323a226636323036386331346438303163323038316533366434353530613439613964223b733a33323a226435303138303564313232393937643131386666633233343130356637336130223b733a33323a226533633436303237383164616361613738333538393131303361633363383463223b733a33323a223331373038323665633735653335646535666630623130303735333435386231223b7d733a343a2268617368223b733a36353a2233313730383236656337356533356465356666306231303037353334353862312d6533633436303237383164616361613738333538393131303361633363383463223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f7369746570616765666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226232353430663339396663383361656432353734353165646163613837356138223b733a33323a223063373933323866663535326333636237303366393439306131653632333363223b733a33323a226564313232366263376535313738366238643463623939383531396339343839223b733a33323a226635643862373535613330303365306264353164343338393065393732616161223b733a33323a223766636661613765343239313634666239613632306232386634646331323864223b733a33323a226235643564363538326535343663323066623731333734363961303761653662223b7d733a343a2268617368223b733a36353a2262356435643635383265353436633230666237313337343639613037616536622d3766636661613765343239313634666239613632306232386634646331323864223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226135663166666438663430623133656261373532623036353261306534373439223b733a33323a223138336164653139353939386437336536653833346532643639303034373032223b733a33323a226539383431366535393338623339316531353364353264653063336538376333223b733a33323a223437343263646631333038623531373231306561623063616461613366336662223b733a33323a223837303636393336393563323139366364663136643239653862353434623434223b733a33323a223063643535303632346239333635366161313937653732643765376632363230223b733a33323a223164386335643639343432343833376435396366393766366437613866363335223b733a33323a223837663535383935353131343735323839333033613462323862303161623764223b733a33323a223031366635663630623138366262333763303230376261636266386138666531223b733a33323a223134323733356133626331656162303365616562336664323064633336383636223b733a33323a223435396131636335316565356338366533643536643463623430393461636534223b733a33323a226162626637323639356365613039313836636265376230393061373336373035223b7d733a343a2268617368223b733a36353a2261626266373236393563656130393138366362653762303930613733363730352d3435396131636335316565356338366533643536643463623430393461636534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1583161935);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"omeka@email.com\"'),
('cleanurl_case_insensitive', '\"0\"'),
('cleanurl_display_admin_show_identifier', '\"1\"'),
('cleanurl_identifier_prefix', '\"\"'),
('cleanurl_identifier_property', '10'),
('cleanurl_identifier_unspace', '\"0\"'),
('cleanurl_item_allowed', '[\"generic\",\"item_set\"]'),
('cleanurl_item_default', '\"generic\"'),
('cleanurl_item_generic', '\"item\\/\"'),
('cleanurl_item_set_generic', '\"generic-item-set-name\\/\"'),
('cleanurl_item_set_regex', '\"views\"'),
('cleanurl_main_path', '\"\"'),
('cleanurl_media_allowed', '[\"generic\",\"item_set_item\"]'),
('cleanurl_media_default', '\"generic\"'),
('cleanurl_media_generic', '\"image\\/\"'),
('cleanurl_use_admin', '\"1\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('iiifserver_manifest_attribution_default', '\"Provided by Example Organization\"'),
('iiifserver_manifest_attribution_property', '\"\"'),
('iiifserver_manifest_collection_properties', '[]'),
('iiifserver_manifest_description_property', '\"dcterms:bibliographicCitation\"'),
('iiifserver_manifest_force_url_from', '\"\"'),
('iiifserver_manifest_force_url_to', '\"\"'),
('iiifserver_manifest_html_descriptive', '\"1\"'),
('iiifserver_manifest_item_properties', '[]'),
('iiifserver_manifest_license_default', '\"http:\\/\\/www.example.org\\/license.html\"'),
('iiifserver_manifest_license_property', '\"dcterms:license\"'),
('iiifserver_manifest_logo_default', '\"\"'),
('iiifserver_manifest_media_properties', '[]'),
('iiifserver_manifest_service_iiifsearch', '\"\"'),
('iiifserver_manifest_service_image', '\"\"'),
('iiifserver_manifest_service_media', '\"\"'),
('iiifserver_manifest_version', '\"3.0\"'),
('imageserver_image_creator', '\"Auto\"'),
('imageserver_image_max_size', '\"10000000\"'),
('imageserver_image_tile_dir', '\"tile\"'),
('imageserver_image_tile_type', '\"deepzoom\"'),
('imageserver_info_version', '\"2.1\"'),
('installation_title', '\"imagineRio\"'),
('locale', '\"en_US\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"America\\/Sao_Paulo\"'),
('universalviewer_manifest_property', '\"\"'),
('version', '\"2.1.0\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navigation` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`) VALUES
(1, 1, 1, 'en', 'imagineRio', 'imagineRio', 'English Version', '[{\"type\":\"page\",\"data\":{\"id\":1,\"label\":\"\"},\"links\":[]},{\"type\":\"page\",\"links\":[],\"data\":{\"id\":7,\"label\":null}},{\"type\":\"page\",\"links\":[],\"data\":{\"id\":8,\"label\":null}},{\"type\":\"page\",\"links\":[],\"data\":{\"id\":9,\"label\":null}},{\"type\":\"page\",\"links\":[],\"data\":{\"id\":10,\"label\":null}}]', '{\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"o:site_item_set\":[{\"o:item_set\":{\"o:id\":\"1\"}},{\"o:item_set\":{\"o:id\":\"3\"}},{\"o:item_set\":{\"o:id\":\"2\"}},{\"o:item_set\":{\"o:id\":\"4\"}}]}', '2020-02-28 00:00:07', '2020-03-03 22:37:35', 1),
(2, NULL, 1, 'pt', 'imagineRio', 'imagineRio', 'Versão em Português', '[{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":2},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":3},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":4},\"links\":[]},{\"type\":\"page\",\"data\":{\"label\":\"\",\"id\":5},\"links\":[]},{\"type\":\"page\",\"data\":{\"id\":6,\"label\":\"\"},\"links\":[]}]', '{\"o:summary\":\"Vers\\u00e3o em Portugu\\u00eas\",\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"site_id\":\"\"}', '2020-03-03 21:52:31', '2020-03-03 22:24:44', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_item_set`
--

INSERT INTO `site_item_set` (`id`, `site_id`, `item_set_id`, `position`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 1, 2, 3),
(4, 1, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `created`, `modified`) VALUES
(1, 1, 'about', 'About', '2020-02-28 00:00:07', '2020-03-04 18:06:23'),
(2, 2, 'about', 'Sobre', '2020-03-03 21:52:31', '2020-03-04 18:39:45'),
(3, 2, 'team', 'Equipe', '2020-03-03 21:57:16', '2020-03-04 18:39:54'),
(4, 2, 'research', 'Pesquisa', '2020-03-03 21:58:38', '2020-03-04 18:40:05'),
(5, 2, 'press', 'Imprensa', '2020-03-03 22:00:46', '2020-03-04 18:40:26'),
(6, 2, 'map', 'Mapa', '2020-03-03 22:03:38', '2020-03-04 18:40:41'),
(7, 1, 'team', 'Team', '2020-03-03 22:36:13', '2020-03-04 18:04:28'),
(8, 1, 'research', 'Research', '2020-03-03 22:36:41', '2020-03-04 18:05:17'),
(9, 1, 'press', 'Press', '2020-03-03 22:37:08', '2020-03-04 18:05:43'),
(10, 1, 'map', 'Map', '2020-03-03 22:37:35', '2020-03-03 22:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_page_block`
--

INSERT INTO `site_page_block` (`id`, `page_id`, `layout`, `data`, `position`) VALUES
(1, 1, 'html', '{\"html\":\"<p>Hello! This is the <u>english<\\/u> version of <strong><em>imagineRio<\\/em><\\/strong>.&nbsp;<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.<\\/p>\\r\\n\\r\\n<p><em>Proin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.<\\/em><\\/p>\\r\\n\\r\\n<p><a href=\\\"#\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.<\\/a><\\/p>\\r\\n\\r\\n<p>Fusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.<\\/p>\\r\\n\\r\\n<p>Fusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.<\\/p>\\r\\n\"}', 1),
(2, 2, 'html', '{\"html\":\"<p>Ol&aacute;! Esse &eacute; o imagineRio em portugu&ecirc;s.<\\/p>\\r\\n\"}', 1),
(3, 3, 'html', '{\"html\":\"<p>Aqui vai a equipe<\\/p>\\r\\n\"}', 1),
(4, 4, 'html', '{\"html\":\"<p>Aqui vai a pesquisa<\\/p>\\r\\n\"}', 1),
(5, 5, 'html', '{\"html\":\"<p>Men&ccedil;&otilde;es<\\/p>\\r\\n\"}', 1),
(6, 6, 'html', '{\"html\":\"<p><iframe allowfullscreen=\\\"\\\" frameborder=\\\"0\\\" height=\\\"700\\\" src=\\\"https:\\/\\/imaginerio.org\\/#pr\\/1565\\/15\\/-22.90910795834581\\/-43.1805181503296\\/all\\/\\\" style=\\\"border:0\\\" width=\\\"100%\\\"><\\/iframe><\\/p>\\r\\n\"}', 1),
(8, 7, 'html', '{\"html\":\"<p>Team members.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.<\\/p>\\r\\n\\r\\n<p>Proin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.<\\/p>\\r\\n\\r\\n<p>Fusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.<\\/p>\\r\\n\\r\\n<p>Fusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.<\\/p>\\r\\n\"}', 1),
(9, 8, 'html', '{\"html\":\"<p>Research topics and outcomes.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.<\\/p>\\r\\n\\r\\n<p>Proin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.<\\/p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.<\\/p>\\r\\n\\r\\n<p>Fusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.<\\/p>\\r\\n\\r\\n<p>Fusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.<\\/p>\\r\\n\"}', 1),
(11, 9, 'html', '{\"html\":\"<p>Press coverage.<\\/p>\\r\\n\\r\\n<ul>\\r\\n\\t<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed finibus lectus mollis lectus tempor varius. Praesent mollis, nisi ut vehicula dapibus, sapien enim facilisis lorem, sed mattis tortor dolor non tortor. Pellentesque sollicitudin libero ut viverra facilisis. Ut a elit mi. Integer elementum fringilla mi eu imperdiet. Nullam et placerat justo. Vivamus ultrices metus eu cursus tempus. Nunc vel rutrum diam. Pellentesque lobortis tellus eu sem viverra, eget egestas magna condimentum.<\\/li>\\r\\n\\t<li>Proin sollicitudin eleifend arcu placerat tincidunt. In hac habitasse platea dictumst. Praesent varius ultrices accumsan. Nulla facilisi. Cras ac arcu pulvinar, posuere lectus in, ultricies elit. Suspendisse quam sem, placerat sed diam sit amet, porttitor pulvinar risus. Cras semper enim ut nibh commodo, quis blandit arcu tempor. Proin dui nisi, volutpat at erat sit amet, accumsan finibus mi. Etiam eleifend elit enim, vitae eleifend nibh venenatis et.<\\/li>\\r\\n\\t<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eget purus accumsan tellus iaculis molestie nec facilisis eros. In mauris leo, finibus vitae eros at, mollis tempor nisl. Suspendisse porta felis ut massa fringilla commodo. Mauris posuere quam id consequat aliquet. Aliquam ut ipsum facilisis, placerat nisi eu, hendrerit purus. Cras nec odio nec purus vestibulum bibendum luctus nec arcu.<\\/li>\\r\\n\\t<li>Fusce viverra dignissim scelerisque. Mauris ut rutrum tellus. Proin ac rhoncus ipsum. Praesent ut fringilla ex. Nunc dictum et justo ut facilisis. Duis dapibus luctus mi. Nunc sed justo blandit eros feugiat varius eget in nisl.<\\/li>\\r\\n\\t<li>Fusce tempus velit et urna ornare, semper accumsan sem vulputate. Sed pretium et libero ut mattis. Aliquam et rhoncus arcu. Fusce pellentesque tellus at maximus porttitor. Morbi pulvinar tellus mauris, sit amet sagittis massa condimentum ac. Maecenas sagittis nibh sed dignissim viverra. Nulla condimentum et quam vel vehicula. Donec molestie, eros vel dignissim pulvinar, nisi orci aliquam lectus, vel pretium neque nibh vel tortor. Curabitur lobortis rhoncus gravida. Aenean vestibulum mauris in fringilla gravida. Phasellus consequat justo condimentum ante malesuada egestas.<\\/li>\\r\\n<\\/ul>\\r\\n\"}', 1),
(12, 10, 'html', '{\"html\":\"<p><iframe allowfullscreen=\\\"\\\" frameborder=\\\"0\\\" height=\\\"700\\\" src=\\\"https:\\/\\/imaginerio.org\\/#en\\/1565\\/15\\/-22.90910795834581\\/-43.1805181503296\\/all\\/\\\" style=\\\"border:0\\\" width=\\\"100%\\\"><\\/iframe><\\/p>\\r\\n\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_permission`
--

INSERT INTO `site_permission` (`id`, `site_id`, `user_id`, `role`) VALUES
(1, 1, 1, 'admin'),
(2, 2, 1, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_setting`
--

INSERT INTO `site_setting` (`id`, `site_id`, `value`) VALUES
('attachment_link_type', 1, '\"item\"'),
('attachment_link_type', 2, '\"item\"'),
('browse_attached_items', 1, '\"0\"'),
('browse_attached_items', 2, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_body_property_term', 2, '\"\"'),
('browse_heading_property_term', 1, '\"\"'),
('browse_heading_property_term', 2, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('disable_jsonld_embed', 2, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('item_media_embed', 2, '\"0\"'),
('locale', 1, '\"en_US\"'),
('locale', 2, '\"pt_BR\"'),
('search_restrict_templates', 1, '\"0\"'),
('search_restrict_templates', 2, '\"0\"'),
('show_page_pagination', 1, '\"0\"'),
('show_page_pagination', 2, '\"0\"'),
('show_user_bar', 1, '\"0\"'),
('show_user_bar', 2, '\"0\"');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'admin@imaginerio.org', 'Admin', '2020-02-27 22:09:56', '2020-02-27 23:46:08', '$2y$10$f18CrlLXvhLAEMiliYAd..55AiGUeIBJmNNvEzRgVLW4hrUu9571O', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('csv_import_automap_check_names_alone', 1, 'false'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"dcterms:identifier\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('locale', 1, '\"en_US\"');

-- --------------------------------------------------------

--
-- Table structure for table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uri` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(1, 1, 1, NULL, 'literal', '', 'Views', NULL, 1),
(2, 2, 1, NULL, 'literal', '', 'Plans', NULL, 1),
(3, 3, 1, NULL, 'literal', '', 'Aerials', NULL, 1),
(4, 4, 1, NULL, 'literal', '', 'Maps', NULL, 1),
(4012, 1, 10, NULL, 'literal', '', 'views', NULL, 1),
(4013, 2, 10, NULL, 'literal', '', 'plans', NULL, 1),
(4014, 3, 10, NULL, 'literal', '', 'aerials', NULL, 1),
(4015, 4, 10, NULL, 'literal', '', 'maps', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Indexes for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Indexes for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Indexes for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Indexes for table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Indexes for table `mapping`
--
ALTER TABLE `mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_49E62C8A126F525E` (`item_id`);

--
-- Indexes for table `mapping_marker`
--
ALTER TABLE `mapping_marker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_667C9244126F525E` (`item_id`),
  ADD KEY `IDX_667C9244EA9FDD75` (`media_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E1B5FC6089329D25` (`resource_id`),
  ADD KEY `IDX_E1B5FC60549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_6D39C79089329D25` (`resource_id`),
  ADD KEY `IDX_6D39C790549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7E2C936B89329D25` (`resource_id`),
  ADD KEY `IDX_7E2C936B549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7367AFAA89329D25` (`resource_id`),
  ADD KEY `IDX_7367AFAA549213EC` (`property_id`),
  ADD KEY `property_value` (`property_id`,`value`),
  ADD KEY `value` (`value`);

--
-- Indexes for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`);

--
-- Indexes for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Indexes for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Indexes for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Indexes for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Indexes for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Indexes for table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Indexes for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Indexes for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Indexes for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Indexes for table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190));

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mapping`
--
ALTER TABLE `mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_marker`
--
ALTER TABLE `mapping_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=596;

--
-- AUTO_INCREMENT for table `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1790;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4016;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `mapping`
--
ALTER TABLE `mapping`
  ADD CONSTRAINT `FK_49E62C8A126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `mapping_marker`
--
ALTER TABLE `mapping_marker`
  ADD CONSTRAINT `FK_667C9244126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_667C9244EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `numeric_data_types_duration`
--
ALTER TABLE `numeric_data_types_duration`
  ADD CONSTRAINT `FK_E1B5FC60549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E1B5FC6089329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `numeric_data_types_integer`
--
ALTER TABLE `numeric_data_types_integer`
  ADD CONSTRAINT `FK_6D39C790549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D39C79089329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `numeric_data_types_interval`
--
ALTER TABLE `numeric_data_types_interval`
  ADD CONSTRAINT `FK_7E2C936B549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7E2C936B89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  ADD CONSTRAINT `FK_7367AFAA549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_7367AFAA89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Constraints for table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Constraints for table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Constraints for table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`);

--
-- Constraints for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
