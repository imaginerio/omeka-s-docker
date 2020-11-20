-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Nov 20, 2020 at 06:31 PM
-- Server version: 10.5.8-MariaDB-1:10.5.8+maria~focal
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

--
-- Dumping data for table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 1, 4, 'items'),
(2, 1, 5, 'items'),
(3, 1, 6, 'items'),
(4, 1, 7, 'items'),
(5, 1, 8, 'items'),
(6, 2, 9, 'media'),
(7, 2, 10, 'media'),
(8, 2, 11, 'media'),
(9, 2, 12, 'media'),
(10, 2, 13, 'media');

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

--
-- Dumping data for table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 1, NULL, '', 'items', 0, '{\"added\":{\"items\":5}}'),
(2, 2, NULL, '', 'media', 0, '{\"added\":{\"media\":5}}');

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
(2, 'item_sets', 1, 1, 'Views', 'Views\nVistas\nviews'),
(4, 'items', 1, 1, 'Museu Nacional, antigo Palácio Imperial de São Cristóvão', '0072430cx097-12\nMuseu Nacional, antigo Palácio Imperial de São Cristóvão\nAo longo do tempo, o Paço de São Cristóvão, que abriga hoje o Museu Nacional, sofreu diversas transformações, como a ampliação do palácio feita por D. Pedro II a partir de 1850. Lá ele viveu em um período de longa duração, tornando este edifício testemunha de diversos momentos importantes na História do Brasil.\nMarc Ferrez\n1879/1889 1879 – 1889\nNEGATIVO/ Vidro\nhttp://acervos.ims.com.br/portals/#/detailpage/75361 Instituto Moreira Salles\nhttp://www.wikidata.org/entity/Q65620957 Wikidata\n30.0\n24.0'),
(5, 'items', 1, 1, 'Teatro Municipal', '0072430cx098-08\nTeatro Municipal\nVista do Teatro Municipal, vendo-se a Escola Nacional de Belas Artes ao lado.\nMarc Ferrez\n1905/1915 1905 – 1915\nNEGATIVO/ Vidro\nhttp://acervos.ims.com.br/portals/#/detailpage/75352 Instituto Moreira Salles\nhttp://www.wikidata.org/entity/Q56650144 Wikidata\nhttp://www.wikidata.org/entity/Q1968538 Teatro Municipal\nhttp://www.wikidata.org/entity/Q4828121 Avenida Rio Branco\nhttp://www.wikidata.org/entity/Q55439919 Escola Nacional de Belas Artes\n30.0\n24.0'),
(6, 'items', 1, 1, 'Vista do Rio de Janeiro, tendo o Gasômetro em primeiro plano', '013RJ001004\nVista do Rio de Janeiro, tendo o Gasômetro em primeiro plano\nA fábrica do Barão de Mauá perto do Canal do Mangue chamava-se oficialmente Companhia de Iluminação a Gás, e, em 1865, foi vendida para uma empresa canadense, que assumiu o serviço de gás através da Rio de Janeiro Gas Company Limited. Em 1876 a concessão do abastecimento de gás passou para a empresa belga Société Anonyme du Gaz (SAG) que por sua vez passou a ser controlada pela The Rio de Janeiro Tramway Light and Power Company Limited (Light) a partir de 1910. Para ampliar a produção de gás na cidade, a SAG decidiu construir, em 1911, uma nova fábrica no bairro de São Cristóvão. É esta fábrica que podemos ver na fotografia de Malta.\nAugusto Malta\n1920/1932 1920 – 1932\nFOTOGRAFIA/ Papel\nhttp://acervos.ims.com.br/portals/#/detailpage/78550 Instituto Moreira Salles\nhttp://www.wikidata.org/entity/Q65621019 Wikidata\nhttp://www.wikidata.org/entity/Q2408175 São Cristóvão'),
(7, 'items', 1, 1, 'Substituição da iluminação pública de gás para lâmpadas incandescentes', '013RJ001005\nSubstituição da iluminação pública de gás para lâmpadas incandescentes\nA partir de 1907, quando a empresa canadense Light ganhou a concessão do governo para distribuir energia elétrica para a cidade, é que a iluminação pública começou a ser modificada, transformando a luz à gás para luz incandescente. Conhecida como polvo canadense pela população carioca, a empresa monopolizou não apenas a distribuição elétrica, mas foi aos poucos tomando conta do transporte público dos bondes e das linhas telefônicas.\nAugusto Malta\n1921 1921\nFOTOGRAFIA/ Papel\nhttp://acervos.ims.com.br/portals/#/detailpage/16995 Instituto Moreira Salles\nhttp://www.wikidata.org/entity/Q65621020 Wikidata\nhttp://www.wikidata.org/entity/Q10353330 Praça Mauá\n16.5\n23.0'),
(8, 'items', 1, 1, 'Avenida Vieira Souto - depois da substituição da iluminação pública de gás para lâmpadas incandescentes', '013RJ001009\nAvenida Vieira Souto - depois da substituição da iluminação pública de gás para lâmpadas incandescentes\nAugusto Malta\n1921 1921\nFOTOGRAFIA/ Papel\nhttp://acervos.ims.com.br/portals/#/detailpage/78551 Instituto Moreira Salles\nhttp://www.wikidata.org/entity/Q65621021 Wikidata\nhttp://www.wikidata.org/entity/Q3375097 Avenida Vieira Souto'),
(9, 'media', 1, 1, NULL, '0072430cx097-12'),
(10, 'media', 1, 1, NULL, '0072430cx098-08'),
(11, 'media', 1, 1, NULL, '013RJ001004'),
(12, 'media', 1, 1, NULL, '013RJ001005'),
(13, 'media', 1, 1, NULL, '013RJ001009'),
(14, 'item_sets', 1, 1, 'Smapshot', 'smapshot\nSmapshot\nSmapshot'),
(15, 'item_sets', 1, 1, 'Maps', 'maps\nMaps\nMapas'),
(16, 'item_sets', 1, 1, 'Aerials', 'aerials\nAerials\nImagens aéreas'),
(17, 'item_sets', 1, 1, 'All', 'all\nAll\nTodos'),
(18, 'item_sets', 1, 1, 'Plans', 'plans\nPlans\nPlanos');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`) VALUES
(4),
(5),
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_item_set`
--

INSERT INTO `item_item_set` (`item_id`, `item_set_id`) VALUES
(4, 17),
(5, 17),
(6, 17),
(7, 17),
(8, 17);

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
(2, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_site`
--

INSERT INTO `item_site` (`item_id`, `site_id`) VALUES
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1);

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

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, '58', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"omeka-import-sample-ims.csv\",\"filesize\":\"3955\",\"filepath\":\"\\/tmp\\/omekag3kzp6\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"0\":{\"dcterms:identifier\":10},\"1\":{\"dcterms:title\":1},\"2\":{\"dcterms:description\":4},\"3\":{\"dcterms:creator\":2},\"4\":{\"dcterms:date\":7},\"5\":{\"dcterms:temporal\":41},\"6\":{\"dcterms:type\":8},\"7\":{\"dcterms:rights\":15},\"8\":{\"dcterms:bibliographicCitation\":48},\"9\":{\"dcterms:source\":11},\"10\":{\"dcterms:hasVersion\":28},\"13\":{\"foaf:depicts\":156},\"14\":{\"schema:width\":242},\"15\":{\"schema:height\":799}},\"column-data-type\":[\"literal\",\"literal\",\"literal\",\"literal\",\"numeric:timestamp\",\"numeric:interval\",\"literal\",\"literal\",\"literal\",\"uri\",\"uri\",\"literal\",\"literal\",\"uri\",\"literal\",\"literal\",\"literal\"],\"column-language\":{\"1\":\"pt-br\",\"2\":\"pt-br\"},\"column-map-lat\":{\"11\":\"1\"},\"column-map-lng\":{\"12\":\"1\"},\"column-multivalue\":{\"13\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"mapping-module\":\"default\",\"default-view\":\"default\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":32},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"o:item_set\":[\"2\"],\"multivalue_separator\":\"||\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2020-07-29 17:53:17', '2020-07-29 17:53:17'),
(2, 1, '61', 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"omeka-import-sample-ims.csv\",\"filesize\":\"3955\",\"filepath\":\"\\/tmp\\/omekaih3IJb\",\"media_type\":\"text\\/csv\",\"resource_type\":\"media\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-item\":[\"dcterms:identifier\"],\"column-data-type\":[\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\",\"literal\"],\"column-media_source\":{\"16\":\"tile\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":26},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\"||\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":1,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2020-07-29 17:54:57', '2020-07-29 17:55:58'),
(3, 1, '82', 'completed', 'ImageServer\\Job\\Tiler', '{\"storageId\":\"73b7f49184ef3fe5c5f1f9e9a2d1faf19c4993f2\",\"storagePath\":\"original\\/73b7f49184ef3fe5c5f1f9e9a2d1faf19c4993f2.jpg\",\"storeOriginal\":true,\"type\":\"url\"}', NULL, '2020-07-29 17:55:08', '2020-07-29 18:01:53'),
(4, 1, '105', 'completed', 'ImageServer\\Job\\Tiler', '{\"storageId\":\"bc699722a174c59f6fb3028b06ab57cfe86cea40\",\"storagePath\":\"original\\/bc699722a174c59f6fb3028b06ab57cfe86cea40.jpg\",\"storeOriginal\":true,\"type\":\"url\"}', NULL, '2020-07-29 17:55:21', '2020-07-29 18:02:00'),
(5, 1, '140', 'completed', 'ImageServer\\Job\\Tiler', '{\"storageId\":\"d6d25b9d13553248627f660ee12c0a94c2fc1208\",\"storagePath\":\"original\\/d6d25b9d13553248627f660ee12c0a94c2fc1208.jpg\",\"storeOriginal\":true,\"type\":\"url\"}', NULL, '2020-07-29 17:55:34', '2020-07-29 18:00:37'),
(6, 1, '175', 'completed', 'ImageServer\\Job\\Tiler', '{\"storageId\":\"9263dd1c031fc128a9a429876adbdc9f9be5d3f3\",\"storagePath\":\"original\\/9263dd1c031fc128a9a429876adbdc9f9be5d3f3.jpg\",\"storeOriginal\":true,\"type\":\"url\"}', NULL, '2020-07-29 17:55:47', '2020-07-29 18:00:51'),
(7, 1, '210', 'completed', 'ImageServer\\Job\\Tiler', '{\"storageId\":\"80c697e9285157e0529925b6f0f72fd886a83590\",\"storagePath\":\"original\\/80c697e9285157e0529925b6f0f72fd886a83590.jpg\",\"storeOriginal\":true,\"type\":\"url\"}', NULL, '2020-07-29 17:55:58', '2020-07-29 18:01:51'),
(8, NULL, '26', 'completed', 'Omeka\\Job\\UpdateSiteItems', '{\"sites\":{\"1\":{\"o:summary\":\"\",\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"site_id\":\"\"}},\"action\":\"add\"}', NULL, '2020-11-12 18:25:59', '2020-11-12 18:25:59');

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

--
-- Dumping data for table `mapping_marker`
--

INSERT INTO `mapping_marker` (`id`, `item_id`, `media_id`, `lat`, `lng`, `label`) VALUES
(1, 4, NULL, -22.903364, -43.223602, NULL),
(2, 5, NULL, -22.910046, -43.175833, NULL),
(3, 6, NULL, -22.894799, -43.21669, NULL),
(4, 7, NULL, -22.896965, -43.18003, NULL),
(5, 8, NULL, -22.986784, -43.198543, NULL);

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

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`) VALUES
(9, 4, 'tile', 'tile', '{\"dimensions\":{\"original\":{\"width\":9515,\"height\":7706},\"large\":{\"width\":800,\"height\":648},\"medium\":{\"width\":200,\"height\":162},\"square\":{\"width\":200,\"height\":200}}}', 'https://rioiconography.sfo2.digitaloceanspaces.com/situatedviews/0072430cx097-12.jpg', 'image/jpeg', '73b7f49184ef3fe5c5f1f9e9a2d1faf19c4993f2', 'jpg', '10d9b92c3485fa4891cdb41456f55a80d8f32ecd7a03392bced65556ac9423cc', 13720928, 1, 1, 1, NULL),
(10, 5, 'tile', 'tile', '{\"dimensions\":{\"original\":{\"width\":9343,\"height\":7460},\"large\":{\"width\":800,\"height\":639},\"medium\":{\"width\":200,\"height\":160},\"square\":{\"width\":200,\"height\":200}}}', 'https://rioiconography.sfo2.digitaloceanspaces.com/situatedviews/0072430cx098-08.jpg', 'image/jpeg', 'bc699722a174c59f6fb3028b06ab57cfe86cea40', 'jpg', '1858ac99c3a889741b43ea8354b1f56a6d3d37d6d0375d41309d656696b6c018', 10824033, 1, 1, 1, NULL),
(11, 6, 'tile', 'tile', '{\"dimensions\":{\"original\":{\"width\":9159,\"height\":6327},\"large\":{\"width\":800,\"height\":553},\"medium\":{\"width\":200,\"height\":138},\"square\":{\"width\":200,\"height\":200}}}', 'https://rioiconography.sfo2.digitaloceanspaces.com/situatedviews/013RJ001004.jpg', 'image/jpeg', 'd6d25b9d13553248627f660ee12c0a94c2fc1208', 'jpg', '31a928d773faea572bab8e191f22a634bb448a9efa94129d7e6504923210696d', 6094931, 1, 1, 1, NULL),
(12, 7, 'tile', 'tile', '{\"dimensions\":{\"original\":{\"width\":8986,\"height\":6857},\"large\":{\"width\":800,\"height\":610},\"medium\":{\"width\":200,\"height\":153},\"square\":{\"width\":200,\"height\":200}}}', 'https://rioiconography.sfo2.digitaloceanspaces.com/situatedviews/013RJ001005.jpg', 'image/jpeg', '9263dd1c031fc128a9a429876adbdc9f9be5d3f3', 'jpg', 'a797b1a89e5e10d583b01cd813268aa7aff03c66e0a70f6549be78ee2bd131b7', 4940969, 1, 1, 1, NULL),
(13, 8, 'tile', 'tile', '{\"dimensions\":{\"original\":{\"width\":8999,\"height\":6852},\"large\":{\"width\":800,\"height\":609},\"medium\":{\"width\":200,\"height\":152},\"square\":{\"width\":200,\"height\":200}}}', 'https://rioiconography.sfo2.digitaloceanspaces.com/situatedviews/013RJ001009.jpg', 'image/jpeg', '80c697e9285157e0529925b6f0f72fd886a83590', 'jpg', 'c1fc64aed9979e49de2983ca913bc1de618fb822f42248b3a605f44a8ea3b8b6', 3982196, 1, 1, 1, NULL);

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
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000');

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
('CleanUrl', 1, '3.16.2.3'),
('CSVImport', 1, '2.2.0'),
('IiifServer', 1, '3.6.3.0'),
('ImageServer', 1, '3.6.3.0'),
('Mapping', 1, '1.4.0'),
('NumericDataTypes', 1, '1.5.1'),
('UniversalViewer', 1, '3.6.3.1');

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

--
-- Dumping data for table `numeric_data_types_interval`
--

INSERT INTO `numeric_data_types_interval` (`id`, `resource_id`, `property_id`, `value`, `value2`) VALUES
(1, 4, 41, -2871676800, -2524521601),
(2, 5, 41, -2051222400, -1704153601),
(3, 6, 41, -1577923200, -1167609601);

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

--
-- Dumping data for table `numeric_data_types_timestamp`
--

INSERT INTO `numeric_data_types_timestamp` (`id`, `resource_id`, `property_id`, `value`) VALUES
(1, 7, 7, -1546300800),
(2, 8, 7, -1546300800);

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
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'datePosted', 'datePosted', 'Publication date of an online listing.'),
(186, 1, 5, 'geoOverlaps', 'geoOverlaps', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that geospatially overlaps it, i.e. they have some but not all points in common. As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(187, 1, 5, 'funder', 'funder', 'A person or organization that supports (sponsors) something through some kind of financial contribution.'),
(188, 1, 5, 'character', 'character', 'Fictional person connected with a creative work.'),
(189, 1, 5, 'educationRequirements', 'educationRequirements', 'Educational background needed for the position or Occupation.'),
(190, 1, 5, 'quest', 'quest', 'The task that a player-controlled character, or group of characters may complete in order to gain a reward.'),
(191, 1, 5, 'drug', 'drug', 'Specifying a drug or medicine used in a medication procedure'),
(192, 1, 5, 'yearlyRevenue', 'yearlyRevenue', 'The size of the business in annual revenue.'),
(193, 1, 5, 'storageRequirements', 'storageRequirements', 'Storage requirements (free space required).'),
(194, 1, 5, 'educationalProgramMode', 'educationalProgramMode', 'Similar to courseMode, The medium or means of delivery of the program as a whole. The value may either be a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous ).'),
(195, 1, 5, 'costPerUnit', 'costPerUnit', 'The cost per unit of the drug.'),
(196, 1, 5, 'priceRange', 'priceRange', 'The price range of the business, for example <code>$$$</code>.'),
(197, 1, 5, 'doseValue', 'doseValue', 'The value of the dose, e.g. 500.'),
(198, 1, 5, 'collectionSize', 'collectionSize', 'The number of items in the <a class=\"localLink\" href=\"http://schema.org/Collection\">Collection</a>.'),
(199, 1, 5, 'option', 'option', 'A sub property of object. The options subject to this action.'),
(200, 1, 5, 'acquiredFrom', 'acquiredFrom', 'The organization or person from which the product was acquired.'),
(201, 1, 5, 'follows', 'follows', 'The most generic uni-directional social relation.'),
(202, 1, 5, 'targetName', 'targetName', 'The name of a node in an established educational framework.'),
(203, 1, 5, 'openingHoursSpecification', 'openingHoursSpecification', 'The opening hours of a certain place.'),
(204, 1, 5, 'geoIntersects', 'geoIntersects', 'Represents spatial relations in which two geometries (or the places they represent) have at least one point in common. As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(205, 1, 5, 'expires', 'expires', 'Date the content expires and is no longer useful or available. For example a <a class=\"localLink\" href=\"http://schema.org/VideoObject\">VideoObject</a> or <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> whose availability or relevance is time-limited, or a <a class=\"localLink\" href=\"http://schema.org/ClaimReview\">ClaimReview</a> fact check whose publisher wants to indicate that it may no longer be relevant (or helpful to highlight) after some date.'),
(206, 1, 5, 'sugarContent', 'sugarContent', 'The number of grams of sugar.'),
(207, 1, 5, 'worstRating', 'worstRating', 'The lowest value allowed in this rating system. If worstRating is omitted, 1 is assumed.'),
(208, 1, 5, 'domiciledMortgage', 'domiciledMortgage', 'Whether borrower is a resident of the jurisdiction where the property is located.'),
(209, 1, 5, 'loanPaymentFrequency', 'loanPaymentFrequency', 'Frequency of payments due, i.e. number of months between payments. This is defined as a frequency, i.e. the reciprocal of a period of time.'),
(210, 1, 5, 'feesAndCommissionsSpecification', 'feesAndCommissionsSpecification', 'Description of fees, commissions, and other terms applied either to a class of financial product, or by a financial service organization.'),
(211, 1, 5, 'isUnlabelledFallback', 'isUnlabelledFallback', 'This can be marked \'true\' to indicate that some published <a class=\"localLink\" href=\"http://schema.org/DeliveryTimeSettings\">DeliveryTimeSettings</a> or <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a> are intended to apply to all <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a> published by the same merchant, when referenced by a <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> in those settings. It is not meaningful to use a \'true\' value for this property alongside a transitTimeLabel (for <a class=\"localLink\" href=\"http://schema.org/DeliveryTimeSettings\">DeliveryTimeSettings</a>) or shippingLabel (for <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a>), since this property is for use with unlabelled settings.'),
(212, 1, 5, 'numberOfDoors', 'numberOfDoors', 'The number of doors.<br/><br/>\n\nTypical unit code(s): C62'),
(213, 1, 5, 'inDefinedTermSet', 'inDefinedTermSet', 'A <a class=\"localLink\" href=\"http://schema.org/DefinedTermSet\">DefinedTermSet</a> that contains this term.'),
(214, 1, 5, 'isAvailableGenerically', 'isAvailableGenerically', 'True if the drug is available in a generic form (regardless of name).'),
(215, 1, 5, 'brand', 'brand', 'The brand(s) associated with a product or service, or the brand(s) maintained by an organization or business person.'),
(216, 1, 5, 'offerCount', 'offerCount', 'The number of offers for the product.'),
(217, 1, 5, 'availableIn', 'availableIn', 'The location in which the strength is available.'),
(218, 1, 5, 'requiresSubscription', 'requiresSubscription', 'Indicates if use of the media require a subscription  (either paid or free). Allowed values are <code>true</code> or <code>false</code> (note that an earlier version had \'yes\', \'no\').'),
(219, 1, 5, 'contraindication', 'contraindication', 'A contraindication for this therapy.'),
(220, 1, 5, 'stage', 'stage', 'The stage of the condition, if applicable.'),
(221, 1, 5, 'artworkSurface', 'artworkSurface', 'The supporting materials for the artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(222, 1, 5, 'checkinTime', 'checkinTime', 'The earliest someone may check into a lodging establishment.'),
(223, 1, 5, 'serialNumber', 'serialNumber', 'The serial number or any alphanumeric identifier of a particular product. When attached to an offer, it is a shortcut for the serial number of the product included in the offer.'),
(224, 1, 5, 'transmissionMethod', 'transmissionMethod', 'How the disease spreads, either as a route or vector, for example \'direct contact\', \'Aedes aegypti\', etc.'),
(225, 1, 5, 'accessibilitySummary', 'accessibilitySummary', 'A human-readable summary of specific accessibility features or deficiencies, consistent with the other accessibility metadata but expressing subtleties such as \"short descriptions are present but long descriptions will be needed for non-visual users\" or \"short descriptions are present and no long descriptions are needed.\"'),
(226, 1, 5, 'performTime', 'performTime', 'The length of time it takes to perform instructions or a direction (not including time to prepare the supplies), in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 duration format</a>.'),
(227, 1, 5, 'engineDisplacement', 'engineDisplacement', 'The volume swept by all of the pistons inside the cylinders of an internal combustion engine in a single movement. <br/><br/>\n\nTypical unit code(s): CMQ for cubic centimeter, LTR for liters, INQ for cubic inches\n* Note 1: You can link to information about how the given value has been determined using the <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> property.\n* Note 2: You can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.'),
(228, 1, 5, 'billingIncrement', 'billingIncrement', 'This property specifies the minimal quantity and rounding increment that will be the basis for the billing. The unit of measurement is specified by the unitCode property.'),
(229, 1, 5, 'alternateName', 'alternateName', 'An alias for the item.'),
(230, 1, 5, 'longitude', 'longitude', 'The longitude of a location. For example <code>-122.08585</code> (<a href=\"https://en.wikipedia.org/wiki/World_Geodetic_System\">WGS 84</a>).'),
(231, 1, 5, 'cvdNumC19OverflowPats', 'cvdNumC19OverflowPats', 'numc19overflowpats - ED/OVERFLOW: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed.'),
(232, 1, 5, 'numberedPosition', 'numberedPosition', 'A number associated with a role in an organization, for example, the number on an athlete\'s jersey.'),
(233, 1, 5, 'subTest', 'subTest', 'A component test of the panel.'),
(234, 1, 5, 'textValue', 'textValue', 'Text value being annotated.'),
(235, 1, 5, 'percentile10', 'percentile10', 'The 10th percentile value.'),
(236, 1, 5, 'recordingOf', 'recordingOf', 'The composition this track is a recording of.'),
(237, 1, 5, 'discount', 'discount', 'Any discount applied (to an Order).'),
(238, 1, 5, 'icaoCode', 'icaoCode', 'ICAO identifier for an airport.'),
(239, 1, 5, 'itemCondition', 'itemCondition', 'A predefined value from OfferItemCondition or a textual description of the condition of the product or service, or the products or services included in the offer.'),
(240, 1, 5, 'securityScreening', 'securityScreening', 'The type of security screening the passenger is subject to.'),
(241, 1, 5, 'seatSection', 'seatSection', 'The section location of the reserved seat (e.g. Orchestra).'),
(242, 1, 5, 'width', 'width', 'The width of the item.'),
(243, 1, 5, 'seriousAdverseOutcome', 'seriousAdverseOutcome', 'A possible serious complication and/or serious side effect of this therapy. Serious adverse outcomes include those that are life-threatening; result in death, disability, or permanent damage; require hospitalization or prolong existing hospitalization; cause congenital anomalies or birth defects; or jeopardize the patient and may require medical or surgical intervention to prevent one of the outcomes in this definition.'),
(244, 1, 5, 'diagnosis', 'diagnosis', 'One or more alternative conditions considered in the differential diagnosis process as output of a diagnosis process.'),
(245, 1, 5, 'dietFeatures', 'dietFeatures', 'Nutritional information specific to the dietary plan. May include dietary recommendations on what foods to avoid, what foods to consume, and specific alterations/deviations from the USDA or other regulatory body\'s approved dietary guidelines.'),
(246, 1, 5, 'cookTime', 'cookTime', 'The time it takes to actually cook the dish, in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 duration format</a>.'),
(247, 1, 5, 'programName', 'programName', 'The program providing the membership.'),
(248, 1, 5, 'servicePhone', 'servicePhone', 'The phone number to use to access the service.'),
(249, 1, 5, 'gtin8', 'gtin8', 'The <a href=\"http://apps.gs1.org/GDD/glossary/Pages/GTIN-8.aspx\">GTIN-8</a> code of the product, or the product to which the offer refers. This code is also known as EAN/UCC-8 or 8-digit EAN. See <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GS1 GTIN Summary</a> for more details.'),
(250, 1, 5, 'issueNumber', 'issueNumber', 'Identifies the issue of publication; for example, \"iii\" or \"2\".'),
(251, 1, 5, 'citation', 'citation', 'A citation or reference to another creative work, such as another publication, web page, scholarly article, etc.'),
(252, 1, 5, 'telephone', 'telephone', 'The telephone number.'),
(253, 1, 5, 'additionalProperty', 'additionalProperty', 'A property-value pair representing an additional characteristics of the entitity, e.g. a product feature or another characteristic for which there is no matching property in schema.org.<br/><br/>\n\nNote: Publishers should be aware that applications designed to use specific schema.org properties (e.g. http://schema.org/width, http://schema.org/color, http://schema.org/gtin13, ...) will typically expect such data to be provided using those properties, rather than using the generic property/value mechanism.'),
(254, 1, 5, 'reviews', 'reviews', 'Review of the item.'),
(255, 1, 5, 'typicalCreditsPerTerm', 'typicalCreditsPerTerm', 'The number of credits or units a full-time student would be expected to take in 1 term however \'term\' is defined by the institution.'),
(256, 1, 5, 'homeLocation', 'homeLocation', 'A contact location for a person\'s residence.'),
(257, 1, 5, 'bloodSupply', 'bloodSupply', 'The blood vessel that carries blood from the heart to the muscle.'),
(258, 1, 5, 'coursePrerequisites', 'coursePrerequisites', 'Requirements for taking the Course. May be completion of another <a class=\"localLink\" href=\"http://schema.org/Course\">Course</a> or a textual description like \"permission of instructor\". Requirements may be a pre-requisite competency, referenced using <a class=\"localLink\" href=\"http://schema.org/AlignmentObject\">AlignmentObject</a>.'),
(259, 1, 5, 'endorsers', 'endorsers', 'People or organizations that endorse the plan.'),
(260, 1, 5, 'trailer', 'trailer', 'The trailer of a movie or tv/radio series, season, episode, etc.'),
(261, 1, 5, 'inBroadcastLineup', 'inBroadcastLineup', 'The CableOrSatelliteService offering the channel.'),
(262, 1, 5, 'acceptedAnswer', 'acceptedAnswer', 'The answer(s) that has been accepted as best, typically on a Question/Answer site. Sites vary in their selection mechanisms, e.g. drawing on community opinion and/or the view of the Question author.'),
(263, 1, 5, 'color', 'color', 'The color of the product.'),
(264, 1, 5, 'yearBuilt', 'yearBuilt', 'The year an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a> was constructed. This corresponds to the <a href=\"https://ddwiki.reso.org/display/DDW17/YearBuilt+Field\">YearBuilt field in RESO</a>.'),
(265, 1, 5, 'incentives', 'incentives', 'Description of bonus and commission compensation aspects of the job.'),
(266, 1, 5, 'memoryRequirements', 'memoryRequirements', 'Minimum memory requirements.'),
(267, 1, 5, 'result', 'result', 'The result produced in the action. e.g. John wrote <em>a book</em>.'),
(268, 1, 5, 'recordedAs', 'recordedAs', 'An audio recording of the work.'),
(269, 1, 5, 'deliveryMethod', 'deliveryMethod', 'A sub property of instrument. The method of delivery.'),
(270, 1, 5, 'alumni', 'alumni', 'Alumni of an organization.'),
(271, 1, 5, 'possibleTreatment', 'possibleTreatment', 'A possible treatment to address this condition, sign or symptom.'),
(272, 1, 5, 'subEvents', 'subEvents', 'Events that are a part of this event. For example, a conference event includes many presentations, each subEvents of the conference.'),
(273, 1, 5, 'schemaVersion', 'schemaVersion', 'Indicates (by URL or string) a particular version of a schema used in some CreativeWork. For example, a document could declare a schemaVersion using an URL such as http://schema.org/version/2.0/ if precise indication of schema version was required by some application.'),
(274, 1, 5, 'addOn', 'addOn', 'An additional offer that can only be obtained in combination with the first base offer (e.g. supplements and extensions that are available for a surcharge).'),
(275, 1, 5, 'gameServer', 'gameServer', 'The server on which  it is possible to play the game.'),
(276, 1, 5, 'birthDate', 'birthDate', 'Date of birth.'),
(277, 1, 5, 'videoFrameSize', 'videoFrameSize', 'The frame size of the video.'),
(278, 1, 5, 'roleName', 'roleName', 'A role played, performed or filled by a person or organization. For example, the team of creators for a comic book might fill the roles named \'inker\', \'penciller\', and \'letterer\'; or an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(279, 1, 5, 'servicePostalAddress', 'servicePostalAddress', 'The address for accessing the service by mail.'),
(280, 1, 5, 'priceCurrency', 'priceCurrency', 'The currency of the price, or a price component when attached to <a class=\"localLink\" href=\"http://schema.org/PriceSpecification\">PriceSpecification</a> and its subtypes.<br/><br/>\n\nUse standard formats: <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217 currency format</a> e.g. \"USD\"; <a href=\"https://en.wikipedia.org/wiki/List_of_cryptocurrencies\">Ticker symbol</a> for cryptocurrencies e.g. \"BTC\"; well known names for <a href=\"https://en.wikipedia.org/wiki/Local_exchange_trading_system\">Local Exchange Tradings Systems</a> (LETS) and other currency types e.g. \"Ithaca HOUR\".'),
(281, 1, 5, 'legislationTransposes', 'legislationTransposes', 'Indicates that this legislation (or part of legislation) fulfills the objectives set by another legislation, by passing appropriate implementation measures. Typically, some legislations of European Union\'s member states or regions transpose European Directives. This indicates a legally binding link between the 2 legislations.'),
(282, 1, 5, 'url', 'url', 'URL of the item.'),
(283, 1, 5, 'alignmentType', 'alignmentType', 'A category of alignment between the learning resource and the framework node. Recommended values include: \'requires\', \'textComplexity\', \'readingLevel\', and \'educationalSubject\'.'),
(284, 1, 5, 'maximumVirtualAttendeeCapacity', 'maximumVirtualAttendeeCapacity', 'The maximum physical attendee capacity of an <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> whose <a class=\"localLink\" href=\"http://schema.org/eventAttendanceMode\">eventAttendanceMode</a> is <a class=\"localLink\" href=\"http://schema.org/OnlineEventAttendanceMode\">OnlineEventAttendanceMode</a> (or the online aspects, in the case of a <a class=\"localLink\" href=\"http://schema.org/MixedEventAttendanceMode\">MixedEventAttendanceMode</a>).'),
(285, 1, 5, 'provider', 'provider', 'The service provider, service operator, or service performer; the goods producer. Another party (a seller) may offer those services or goods on behalf of the provider. A provider may also serve as the seller.'),
(286, 1, 5, 'foundingLocation', 'foundingLocation', 'The place where the Organization was founded.'),
(287, 1, 5, 'requiredMaxAge', 'requiredMaxAge', 'Audiences defined by a person\'s maximum age.'),
(288, 1, 5, 'publicTransportClosuresInfo', 'publicTransportClosuresInfo', 'Information about public transport closures.'),
(289, 1, 5, 'insertion', 'insertion', 'The place of attachment of a muscle, or what the muscle moves.'),
(290, 1, 5, 'countriesNotSupported', 'countriesNotSupported', 'Countries for which the application is not supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(291, 1, 5, 'legalStatus', 'legalStatus', 'The drug or supplement\'s legal status, including any controlled substance schedules that apply.'),
(292, 1, 5, 'parentService', 'parentService', 'A broadcast service to which the broadcast service may belong to such as regional variations of a national channel.'),
(293, 1, 5, 'monthlyMinimumRepaymentAmount', 'monthlyMinimumRepaymentAmount', 'The minimum payment is the lowest amount of money that one is required to pay on a credit card statement each month.'),
(294, 1, 5, 'manufacturer', 'manufacturer', 'The manufacturer of the product.'),
(295, 1, 5, 'winner', 'winner', 'A sub property of participant. The winner of the action.'),
(296, 1, 5, 'gtin13', 'gtin13', 'The GTIN-13 code of the product, or the product to which the offer refers. This is equivalent to 13-digit ISBN codes and EAN UCC-13. Former 12-digit UPC codes can be converted into a GTIN-13 code by simply adding a preceeding zero. See <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GS1 GTIN Summary</a> for more details.'),
(297, 1, 5, 'partOfOrder', 'partOfOrder', 'The overall order the items in this delivery were included in.'),
(298, 1, 5, 'reservedTicket', 'reservedTicket', 'A ticket associated with the reservation.'),
(299, 1, 5, 'inverseOf', 'inverseOf', 'Relates a property to a property that is its inverse. Inverse properties relate the same pairs of items to each other, but in reversed direction. For example, the \'alumni\' and \'alumniOf\' properties are inverseOf each other. Some properties don\'t have explicit inverses; in these situations RDFa and JSON-LD syntax for reverse properties can be used.'),
(300, 1, 5, 'numTracks', 'numTracks', 'The number of tracks in this album or playlist.'),
(301, 1, 5, 'readonlyValue', 'readonlyValue', 'Whether or not a property is mutable.  Default is false. Specifying this for a property that also has a value makes it act similar to a \"hidden\" input in an HTML form.'),
(302, 1, 5, 'runsTo', 'runsTo', 'The vasculature the lymphatic structure runs, or efferents, to.'),
(303, 1, 5, 'subOrganization', 'subOrganization', 'A relationship between two organizations where the first includes the second, e.g., as a subsidiary. See also: the more specific \'department\' property.'),
(304, 1, 5, 'emissionsCO2', 'emissionsCO2', 'The CO2 emissions in g/km. When used in combination with a QuantitativeValue, put \"g/km\" into the unitText property of that value, since there is no UN/CEFACT Common Code for \"g/km\".'),
(305, 1, 5, 'permittedUsage', 'permittedUsage', 'Indications regarding the permitted usage of the accommodation.'),
(306, 1, 5, 'sdLicense', 'sdLicense', 'A license document that applies to this structured data, typically indicated by URL.'),
(307, 1, 5, 'hasCategoryCode', 'hasCategoryCode', 'A Category code contained in this code set.'),
(308, 1, 5, 'employmentType', 'employmentType', 'Type of employment (e.g. full-time, part-time, contract, temporary, seasonal, internship).'),
(309, 1, 5, 'carbohydrateContent', 'carbohydrateContent', 'The number of grams of carbohydrates.'),
(310, 1, 5, 'geoContains', 'geoContains', 'Represents a relationship between two geometries (or the places they represent), relating a containing geometry to a contained geometry. \"a contains b iff no points of b lie in the exterior of a, and at least one point of the interior of b lies in the interior of a\". As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(311, 1, 5, 'nonprofitStatus', 'nonprofitStatus', 'nonprofit Status indicates the legal status of a non-profit organization in its primary place of business.'),
(312, 1, 5, 'reservationFor', 'reservationFor', 'The thing -- flight, event, restaurant,etc. being reserved.'),
(313, 1, 5, 'pageStart', 'pageStart', 'The page on which the work starts; for example \"135\" or \"xiii\".'),
(314, 1, 5, 'bed', 'bed', 'The type of bed or beds included in the accommodation. For the single case of just one bed of a certain type, you use bed directly with a text.\n      If you want to indicate the quantity of a certain kind of bed, use an instance of BedDetails. For more detailed information, use the amenityFeature property.'),
(315, 1, 5, 'engineType', 'engineType', 'The type of engine or engines powering the vehicle.'),
(316, 1, 5, 'isbn', 'isbn', 'The ISBN of the book.'),
(317, 1, 5, 'hospitalAffiliation', 'hospitalAffiliation', 'A hospital with which the physician or office is affiliated.'),
(318, 1, 5, 'productionDate', 'productionDate', 'The date of production of the item, e.g. vehicle.'),
(319, 1, 5, 'albumReleaseType', 'albumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(320, 1, 5, 'includedComposition', 'includedComposition', 'Smaller compositions included in this work (e.g. a movement in a symphony).'),
(321, 1, 5, 'valueMaxLength', 'valueMaxLength', 'Specifies the allowed range for number of characters in a literal value.'),
(322, 1, 5, 'costCurrency', 'costCurrency', 'The currency (in 3-letter of the drug cost. See: http://en.wikipedia.org/wiki/ISO_4217'),
(323, 1, 5, 'partOfTrip', 'partOfTrip', 'Identifies that this <a class=\"localLink\" href=\"http://schema.org/Trip\">Trip</a> is a subTrip of another Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(324, 1, 5, 'safetyConsideration', 'safetyConsideration', 'Any potential safety concern associated with the supplement. May include interactions with other drugs and foods, pregnancy, breastfeeding, known adverse reactions, and documented efficacy of the supplement.'),
(325, 1, 5, 'structuralClass', 'structuralClass', 'The name given to how bone physically connects to each other.'),
(326, 1, 5, 'priceComponent', 'priceComponent', 'This property links to all <a class=\"localLink\" href=\"http://schema.org/UnitPriceSpecification\">UnitPriceSpecification</a> nodes that apply in parallel for the <a class=\"localLink\" href=\"http://schema.org/CompoundPriceSpecification\">CompoundPriceSpecification</a> node.'),
(327, 1, 5, 'numberOfBathroomsTotal', 'numberOfBathroomsTotal', 'The total integer number of bathrooms in a some <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>, following real estate conventions as <a href=\"https://ddwiki.reso.org/display/DDW17/BathroomsTotalInteger+Field\">documented in RESO</a>: \"The simple sum of the number of bathrooms. For example for a property with two Full Bathrooms and one Half Bathroom, the Bathrooms Total Integer will be 3.\". See also <a class=\"localLink\" href=\"http://schema.org/numberOfRooms\">numberOfRooms</a>.'),
(328, 1, 5, 'numberOfPlayers', 'numberOfPlayers', 'Indicate how many people can play this game (minimum, maximum, or range).'),
(329, 1, 5, 'educationalUse', 'educationalUse', 'The purpose of a work in the context of education; for example, \'assignment\', \'group work\'.'),
(330, 1, 5, 'interestRate', 'interestRate', 'The interest rate, charged or paid, applicable to the financial product. Note: This is different from the calculated annualPercentageRate.'),
(331, 1, 5, 'requiredQuantity', 'requiredQuantity', 'The required quantity of the item(s).'),
(332, 1, 5, 'cvdNumC19OFMechVentPats', 'cvdNumC19OFMechVentPats', 'numc19ofmechventpats - ED/OVERFLOW and VENTILATED: Patients with suspected or confirmed COVID-19 who are in the ED or any overflow location awaiting an inpatient bed and on a mechanical ventilator.'),
(333, 1, 5, 'events', 'events', 'Upcoming or past events associated with this place or organization.'),
(334, 1, 5, 'realEstateAgent', 'realEstateAgent', 'A sub property of participant. The real estate agent involved in the action.'),
(335, 1, 5, 'torque', 'torque', 'The torque (turning force) of the vehicle\'s engine.<br/><br/>\n\nTypical unit code(s): NU for newton metre (N m), F17 for pound-force per foot, or F48 for pound-force per inch<br/><br/>\n\n<ul>\n<li>Note 1: You can link to information about how the given value has been determined (e.g. reference RPM) using the <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> property.</li>\n<li>Note 2: You can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(336, 1, 5, 'dateReceived', 'dateReceived', 'The date/time the message was received if a single recipient exists.'),
(337, 1, 5, 'alternativeHeadline', 'alternativeHeadline', 'A secondary title of the CreativeWork.'),
(338, 1, 5, 'significance', 'significance', 'The significance associated with the superficial anatomy; as an example, how characteristics of the superficial anatomy can suggest underlying medical conditions or courses of treatment.'),
(339, 1, 5, 'supplyTo', 'supplyTo', 'The area to which the artery supplies blood.'),
(340, 1, 5, 'affectedBy', 'affectedBy', 'Drugs that affect the test\'s results.'),
(341, 1, 5, 'arrivalBusStop', 'arrivalBusStop', 'The stop or station from which the bus arrives.'),
(342, 1, 5, 'quarantineGuidelines', 'quarantineGuidelines', 'Guidelines about quarantine rules, e.g. in the context of a pandemic.'),
(343, 1, 5, 'maxPrice', 'maxPrice', 'The highest price if the price is a range.'),
(344, 1, 5, 'clincalPharmacology', 'clincalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(345, 1, 5, 'albumProductionType', 'albumProductionType', 'Classification of the album by it\'s type of content: soundtrack, live album, studio album, etc.'),
(346, 1, 5, 'episodeNumber', 'episodeNumber', 'Position of the episode within an ordered group of episodes.'),
(347, 1, 5, 'exchangeRateSpread', 'exchangeRateSpread', 'The difference between the price at which a broker or other intermediary buys and sells foreign currency.'),
(348, 1, 5, 'hasPart', 'hasPart', 'Indicates an item or CreativeWork that is part of this item, or CreativeWork (in some sense).'),
(349, 1, 5, 'busNumber', 'busNumber', 'The unique identifier for the bus.'),
(350, 1, 5, 'inAlbum', 'inAlbum', 'The album to which this recording belongs.'),
(351, 1, 5, 'availableStrength', 'availableStrength', 'An available dosage strength for the drug.'),
(352, 1, 5, 'candidate', 'candidate', 'A sub property of object. The candidate subject of this action.'),
(353, 1, 5, 'permissions', 'permissions', 'Permission(s) required to run the app (for example, a mobile app may require full internet access or may run only on wifi).'),
(354, 1, 5, 'stageAsNumber', 'stageAsNumber', 'The stage represented as a number, e.g. 3.'),
(355, 1, 5, 'transitTime', 'transitTime', 'The typical delay the order has been sent for delivery and the goods reach the final customer. Typical properties: minValue, maxValue, unitCode (d for DAY).'),
(356, 1, 5, 'referenceQuantity', 'referenceQuantity', 'The reference quantity for which a certain price applies, e.g. 1 EUR per 4 kWh of electricity. This property is a replacement for unitOfMeasurement for the advanced cases where the price does not relate to a standard unit.'),
(357, 1, 5, 'returnFees', 'returnFees', 'Indicates (via enumerated options) the return fees policy for a MerchantReturnPolicy'),
(358, 1, 5, 'subEvent', 'subEvent', 'An Event that is part of this event. For example, a conference event includes many presentations, each of which is a subEvent of the conference.'),
(359, 1, 5, 'exampleOfWork', 'exampleOfWork', 'A creative work that this work is an example/instance/realization/derivation of.'),
(360, 1, 5, 'vehicleSpecialUsage', 'vehicleSpecialUsage', 'Indicates whether the vehicle has been used for special purposes, like commercial rental, driving school, or as a taxi. The legislation in many countries requires this information to be revealed when offering a car for sale.'),
(361, 1, 5, 'sport', 'sport', 'A type of sport (e.g. Baseball).'),
(362, 1, 5, 'upvoteCount', 'upvoteCount', 'The number of upvotes this question, answer or comment has received from the community.'),
(363, 1, 5, 'hasMap', 'hasMap', 'A URL to a map of the place.'),
(364, 1, 5, 'sodiumContent', 'sodiumContent', 'The number of milligrams of sodium.'),
(365, 1, 5, 'audienceType', 'audienceType', 'The target group associated with a given audience (e.g. veterans, car owners, musicians, etc.).'),
(366, 1, 5, 'activityDuration', 'activityDuration', 'Length of time to engage in the activity.'),
(367, 1, 5, 'serviceOperator', 'serviceOperator', 'The operating organization, if different from the provider.  This enables the representation of services that are provided by an organization, but operated by another organization like a subcontractor.'),
(368, 1, 5, 'geoWithin', 'geoWithin', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to one that contains it, i.e. it is inside (i.e. within) its interior. As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(369, 1, 5, 'rsvpResponse', 'rsvpResponse', 'The response (yes, no, maybe) to the RSVP.'),
(370, 1, 5, 'knowsAbout', 'knowsAbout', 'Of a <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a>, and less typically of an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>, to indicate a topic that is known about - suggesting possible expertise but not implying it. We do not distinguish skill levels here, or relate this to educational content, events, objectives or <a class=\"localLink\" href=\"http://schema.org/JobPosting\">JobPosting</a> descriptions.'),
(371, 1, 5, 'estimatesRiskOf', 'estimatesRiskOf', 'The condition, complication, or symptom whose risk is being estimated.'),
(372, 1, 5, 'deathPlace', 'deathPlace', 'The place where the person died.'),
(373, 1, 5, 'includesAttraction', 'includesAttraction', 'Attraction located at destination.'),
(374, 1, 5, 'typeOfBed', 'typeOfBed', 'The type of bed to which the BedDetail refers, i.e. the type of bed available in the quantity indicated by quantity.'),
(375, 1, 5, 'arrivalStation', 'arrivalStation', 'The station where the train trip ends.'),
(376, 1, 5, 'webFeed', 'webFeed', 'The URL for a feed, e.g. associated with a podcast series, blog, or series of date-stamped updates. This is usually RSS or Atom.'),
(377, 1, 5, 'itemListOrder', 'itemListOrder', 'Type of ordering (e.g. Ascending, Descending, Unordered).'),
(378, 1, 5, 'installUrl', 'installUrl', 'URL at which the app may be installed, if different from the URL of the item.'),
(379, 1, 5, 'sensoryRequirement', 'sensoryRequirement', 'A description of any sensory requirements and levels necessary to function on the job, including hearing and vision. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(380, 1, 5, 'amount', 'amount', 'The amount of money.'),
(381, 1, 5, 'accessibilityFeature', 'accessibilityFeature', 'Content features of the resource, such as accessible media, alternatives and supported enhancements for accessibility (<a href=\"http://www.w3.org/wiki/WebSchemas/Accessibility\">WebSchemas wiki lists possible values</a>).'),
(382, 1, 5, 'validUntil', 'validUntil', 'The date when the item is no longer valid.'),
(383, 1, 5, 'broadcastOfEvent', 'broadcastOfEvent', 'The event being broadcast such as a sporting event or awards ceremony.'),
(384, 1, 5, 'datasetTimeInterval', 'datasetTimeInterval', 'The range of temporal applicability of a dataset, e.g. for a 2011 census dataset, the year 2011 (in ISO 8601 time interval format).'),
(385, 1, 5, 'subtitleLanguage', 'subtitleLanguage', 'Languages in which subtitles/captions are available, in <a href=\"http://tools.ietf.org/html/bcp47\">IETF BCP 47 standard format</a>.'),
(386, 1, 5, 'serviceType', 'serviceType', 'The type of service being offered, e.g. veterans\' benefits, emergency relief, etc.'),
(387, 1, 5, 'activityFrequency', 'activityFrequency', 'How often one should engage in the activity.'),
(388, 1, 5, 'ratingExplanation', 'ratingExplanation', 'A short explanation (e.g. one to two sentences) providing background context and other information that led to the conclusion expressed in the rating. This is particularly applicable to ratings associated with \"fact check\" markup using <a class=\"localLink\" href=\"http://schema.org/ClaimReview\">ClaimReview</a>.'),
(389, 1, 5, 'subStructure', 'subStructure', 'Component (sub-)structure(s) that comprise this anatomical structure.'),
(390, 1, 5, 'map', 'map', 'A URL to a map of the place.'),
(391, 1, 5, 'smokingAllowed', 'smokingAllowed', 'Indicates whether it is allowed to smoke in the place, e.g. in the restaurant, hotel or hotel room.'),
(392, 1, 5, 'driveWheelConfiguration', 'driveWheelConfiguration', 'The drive wheel configuration, i.e. which roadwheels will receive torque from the vehicle\'s engine via the drivetrain.'),
(393, 1, 5, 'multipleValues', 'multipleValues', 'Whether multiple values are allowed for the property.  Default is false.'),
(394, 1, 5, 'addressRegion', 'addressRegion', 'The region in which the locality is, and which is in the country. For example, California or another appropriate first-level <a href=\"https://en.wikipedia.org/wiki/List_of_administrative_divisions_by_country\">Administrative division</a>'),
(395, 1, 5, 'drugClass', 'drugClass', 'The class of drug this belongs to (e.g., statins).'),
(396, 1, 5, 'additionalName', 'additionalName', 'An additional name for a Person, can be used for a middle name.'),
(397, 1, 5, 'executableLibraryName', 'executableLibraryName', 'Library file name e.g., mscorlib.dll, system.web.dll.'),
(398, 1, 5, 'numberOfFullBathrooms', 'numberOfFullBathrooms', 'Number of full bathrooms - The total number of full and ¾ bathrooms in an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>. This corresponds to the <a href=\"https://ddwiki.reso.org/display/DDW17/BathroomsFull+Field\">BathroomsFull field in RESO</a>.'),
(399, 1, 5, 'legislationLegalValue', 'legislationLegalValue', 'The legal value of this legislation file. The same legislation can be written in multiple files with different legal values. Typically a digitally signed PDF have a \"stronger\" legal value than the HTML file of the same act.'),
(400, 1, 5, 'contentUrl', 'contentUrl', 'Actual bytes of the media object, for example the image file or video file.'),
(401, 1, 5, 'sourcedFrom', 'sourcedFrom', 'The neurological pathway that originates the neurons.'),
(402, 1, 5, 'passengerSequenceNumber', 'passengerSequenceNumber', 'The passenger\'s sequence number as assigned by the airline.'),
(403, 1, 5, 'shippingRate', 'shippingRate', 'The shipping rate is the cost of shipping to the specified destination. Typically, the maxValue and currency values (of the <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a>) are most appropriate.'),
(404, 1, 5, 'isBasedOnUrl', 'isBasedOnUrl', 'A resource that was used in the creation of this resource. This term can be repeated for multiple sources. For example, http://example.com/great-multiplication-intro.html.'),
(405, 1, 5, 'appearance', 'appearance', 'Indicates an occurence of a <a class=\"localLink\" href=\"http://schema.org/Claim\">Claim</a> in some <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>.'),
(406, 1, 5, 'specialty', 'specialty', 'One of the domain specialities to which this web page\'s content applies.'),
(407, 1, 5, 'transcript', 'transcript', 'If this MediaObject is an AudioObject or VideoObject, the transcript of that object.'),
(408, 1, 5, 'increasesRiskOf', 'increasesRiskOf', 'The condition, complication, etc. influenced by this factor.'),
(409, 1, 5, 'expertConsiderations', 'expertConsiderations', 'Medical expert advice related to the plan.'),
(410, 1, 5, 'titleEIDR', 'titleEIDR', 'An <a href=\"https://eidr.org/\">EIDR</a> (Entertainment Identifier Registry) <a class=\"localLink\" href=\"http://schema.org/identifier\">identifier</a> representing at the most general/abstract level, a work of film or television.<br/><br/>\n\nFor example, the motion picture known as \"Ghostbusters\" has a titleEIDR of  \"10.5240/7EC7-228A-510A-053E-CBB8-J\". This title (or work) may have several variants, which EIDR calls \"edits\". See <a class=\"localLink\" href=\"http://schema.org/editEIDR\">editEIDR</a>.<br/><br/>\n\nSince schema.org types like <a class=\"localLink\" href=\"http://schema.org/Movie\">Movie</a> and <a class=\"localLink\" href=\"http://schema.org/TVEpisode\">TVEpisode</a> can be used for both works and their multiple expressions, it is possible to use <a class=\"localLink\" href=\"http://schema.org/titleEIDR\">titleEIDR</a> alone (for a general description), or alongside <a class=\"localLink\" href=\"http://schema.org/editEIDR\">editEIDR</a> for a more edit-specific description.'),
(411, 1, 5, 'resultComment', 'resultComment', 'A sub property of result. The Comment created or sent as a result of this action.'),
(412, 1, 5, 'hasMerchantReturnPolicy', 'hasMerchantReturnPolicy', 'Indicates a MerchantReturnPolicy that may be applicable.'),
(413, 1, 5, 'dateSent', 'dateSent', 'The date/time at which the message was sent.'),
(414, 1, 5, 'numberOfAirbags', 'numberOfAirbags', 'The number or type of airbags in the vehicle.'),
(415, 1, 5, 'spatialCoverage', 'spatialCoverage', 'The spatialCoverage of a CreativeWork indicates the place(s) which are the focus of the content. It is a subproperty of\n      contentLocation intended primarily for more technical and detailed materials. For example with a Dataset, it indicates\n      areas that the dataset describes: a dataset of New York weather would have spatialCoverage which was the place: the state of New York.'),
(416, 1, 5, 'orderDate', 'orderDate', 'Date order was placed.'),
(417, 1, 5, 'fromLocation', 'fromLocation', 'A sub property of location. The original location of the object or the agent before the action.'),
(418, 1, 5, 'borrower', 'borrower', 'A sub property of participant. The person that borrows the object being lent.'),
(419, 1, 5, 'associatedPathophysiology', 'associatedPathophysiology', 'If applicable, a description of the pathophysiology associated with the anatomical system, including potential abnormal changes in the mechanical, physical, and biochemical functions of the system.'),
(420, 1, 5, 'cvdNumVent', 'cvdNumVent', 'numvent - MECHANICAL VENTILATORS: Total number of ventilators available.'),
(421, 1, 5, 'geo', 'geo', 'The geo coordinates of the place.'),
(422, 1, 5, 'guideline', 'guideline', 'A medical guideline related to this entity.'),
(423, 1, 5, 'prepTime', 'prepTime', 'The length of time it takes to prepare the items to be used in instructions or a direction, in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 duration format</a>.'),
(424, 1, 5, 'suggestedMaxAge', 'suggestedMaxAge', 'Maximal age recommended for viewing content.'),
(425, 1, 5, 'nerveMotor', 'nerveMotor', 'The neurological pathway extension that involves muscle control.'),
(426, 1, 5, 'usesDevice', 'usesDevice', 'Device used to perform the test.'),
(427, 1, 5, 'educationalAlignment', 'educationalAlignment', 'An alignment to an established educational framework.<br/><br/>\n\nThis property should not be used where the nature of the alignment can be described using a simple property, for example to express that a resource <a class=\"localLink\" href=\"http://schema.org/teaches\">teaches</a> or <a class=\"localLink\" href=\"http://schema.org/assesses\">assesses</a> a competency.'),
(428, 1, 5, 'operatingSystem', 'operatingSystem', 'Operating systems supported (Windows 7, OSX 10.6, Android 1.6).'),
(429, 1, 5, 'publisherImprint', 'publisherImprint', 'The publishing division which published the comic.'),
(430, 1, 5, 'billingAddress', 'billingAddress', 'The billing address for the order.'),
(431, 1, 5, 'riskFactor', 'riskFactor', 'A modifiable or non-modifiable factor that increases the risk of a patient contracting this condition, e.g. age,  coexisting condition.'),
(432, 1, 5, 'pageEnd', 'pageEnd', 'The page on which the work ends; for example \"138\" or \"xvi\".'),
(433, 1, 5, 'trailerWeight', 'trailerWeight', 'The permitted weight of a trailer attached to the vehicle.<br/><br/>\n\nTypical unit code(s): KGM for kilogram, LBR for pound\n* Note 1: You can indicate additional information in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> node.\n* Note 2: You may also link to a <a class=\"localLink\" href=\"http://schema.org/QualitativeValue\">QualitativeValue</a> node that provides additional information using <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a>.\n* Note 3: Note that you can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.'),
(434, 1, 5, 'includesHealthPlanNetwork', 'includesHealthPlanNetwork', 'Networks covered by this plan.'),
(435, 1, 5, 'affiliation', 'affiliation', 'An organization that this person is affiliated with. For example, a school/university, a club, or a team.'),
(436, 1, 5, 'articleSection', 'articleSection', 'Articles may belong to one or more \'sections\' in a magazine or newspaper, such as Sports, Lifestyle, etc.'),
(437, 1, 5, 'costOrigin', 'costOrigin', 'Additional details to capture the origin of the cost data. For example, \'Medicare Part B\'.'),
(438, 1, 5, 'relatedStructure', 'relatedStructure', 'Related anatomical structure(s) that are not part of the system but relate or connect to it, such as vascular bundles associated with an organ system.'),
(439, 1, 5, 'gettingTestedInfo', 'gettingTestedInfo', 'Information about getting tested (for a <a class=\"localLink\" href=\"http://schema.org/MedicalCondition\">MedicalCondition</a>), e.g. in the context of a pandemic.'),
(440, 1, 5, 'actionOption', 'actionOption', 'A sub property of object. The options subject to this action.'),
(441, 1, 5, 'regionDrained', 'regionDrained', 'The anatomical or organ system drained by this vessel; generally refers to a specific part of an organ.'),
(442, 1, 5, 'familyName', 'familyName', 'Family name. In the U.S., the last name of an Person. This can be used along with givenName instead of the name property.'),
(443, 1, 5, 'review', 'review', 'A review of the item.'),
(444, 1, 5, 'includesObject', 'includesObject', 'This links to a node or nodes indicating the exact quantity of the products included in  an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> or <a class=\"localLink\" href=\"http://schema.org/ProductCollection\">ProductCollection</a>.'),
(445, 1, 5, 'accessibilityHazard', 'accessibilityHazard', 'A characteristic of the described resource that is physiologically dangerous to some users. Related to WCAG 2.0 guideline 2.3 (<a href=\"http://www.w3.org/wiki/WebSchemas/Accessibility\">WebSchemas wiki lists possible values</a>).'),
(446, 1, 5, 'mediaAuthenticityCategory', 'mediaAuthenticityCategory', 'Indicates a MediaManipulationRatingEnumeration classification of a media object (in the context of how it was published or shared).'),
(447, 1, 5, 'scheduleTimezone', 'scheduleTimezone', 'Indicates the timezone for which the time(s) indicated in the <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a> are given. The value provided should be among those listed in the IANA Time Zone Database.'),
(448, 1, 5, 'status', 'status', 'The status of the study (enumerated).'),
(449, 1, 5, 'acceptsReservations', 'acceptsReservations', 'Indicates whether a FoodEstablishment accepts reservations. Values can be Boolean, an URL at which reservations can be made or (for backwards compatibility) the strings <code>Yes</code> or <code>No</code>.'),
(450, 1, 5, 'parentOrganization', 'parentOrganization', 'The larger organization that this organization is a <a class=\"localLink\" href=\"http://schema.org/subOrganization\">subOrganization</a> of, if any.'),
(451, 1, 5, 'address', 'address', 'Physical address of the item.'),
(452, 1, 5, 'timeRequired', 'timeRequired', 'Approximate or typical time it takes to work with or through this learning resource for the typical intended target audience, e.g. \'PT30M\', \'PT1H25M\'.'),
(453, 1, 5, 'seasonNumber', 'seasonNumber', 'Position of the season within an ordered group of seasons.'),
(454, 1, 5, 'numAdults', 'numAdults', 'The number of adults staying in the unit.'),
(455, 1, 5, 'possibleComplication', 'possibleComplication', 'A possible unexpected and unfavorable evolution of a medical condition. Complications may include worsening of the signs or symptoms of the disease, extension of the condition to other organ systems, etc.'),
(456, 1, 5, 'publication', 'publication', 'A publication event associated with the item.'),
(457, 1, 5, 'makesOffer', 'makesOffer', 'A pointer to products or services offered by the organization or person.'),
(458, 1, 5, 'infectiousAgentClass', 'infectiousAgentClass', 'The class of infectious agent (bacteria, prion, etc.) that causes the disease.'),
(459, 1, 5, 'specialOpeningHoursSpecification', 'specialOpeningHoursSpecification', 'The special opening hours of a certain place.<br/><br/>\n\nUse this to explicitly override general opening hours brought in scope by <a class=\"localLink\" href=\"http://schema.org/openingHoursSpecification\">openingHoursSpecification</a> or <a class=\"localLink\" href=\"http://schema.org/openingHours\">openingHours</a>.'),
(460, 1, 5, 'yearsInOperation', 'yearsInOperation', 'The age of the business.'),
(461, 1, 5, 'additionalNumberOfGuests', 'additionalNumberOfGuests', 'If responding yes, the number of guests who will attend in addition to the invitee.'),
(462, 1, 5, 'infectiousAgent', 'infectiousAgent', 'The actual infectious agent, such as a specific bacterium.'),
(463, 1, 5, 'cashBack', 'cashBack', 'A cardholder benefit that pays the cardholder a small percentage of their net expenditures.'),
(464, 1, 5, 'isAcceptingNewPatients', 'isAcceptingNewPatients', 'Whether the provider is accepting new patients.'),
(465, 1, 5, 'comment', 'comment', 'Comments, typically from users.'),
(466, 1, 5, 'termsPerYear', 'termsPerYear', 'The number of times terms of study are offered per year. Semesters and quarters are common units for term. For example, if the student can only take 2 semesters for the program in one year, then termsPerYear should be 2.'),
(467, 1, 5, 'parent', 'parent', 'A parent of this person.'),
(468, 1, 5, 'recipeYield', 'recipeYield', 'The quantity produced by the recipe (for example, number of people served, number of servings, etc).'),
(469, 1, 5, 'callSign', 'callSign', 'A <a href=\"https://en.wikipedia.org/wiki/Call_sign\">callsign</a>, as used in broadcasting and radio communications to identify people, radio and TV stations, or vehicles.'),
(470, 1, 5, 'eligibleRegion', 'eligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is valid.<br/><br/>\n\nSee also <a class=\"localLink\" href=\"http://schema.org/ineligibleRegion\">ineligibleRegion</a>.'),
(471, 1, 5, 'procedure', 'procedure', 'A description of the procedure involved in setting up, using, and/or installing the device.'),
(472, 1, 5, 'member', 'member', 'A member of an Organization or a ProgramMembership. Organizations can be members of organizations; ProgramMembership is typically for individuals.'),
(473, 1, 5, 'broadcastDisplayName', 'broadcastDisplayName', 'The name displayed in the channel guide. For many US affiliates, it is the network name.'),
(474, 1, 5, 'howPerformed', 'howPerformed', 'How the procedure is performed.'),
(475, 1, 5, 'item', 'item', 'An entity represented by an entry in a list or data feed (e.g. an \'artist\' in a list of \'artists\')’.'),
(476, 1, 5, 'recipeIngredient', 'recipeIngredient', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(477, 1, 5, 'performerIn', 'performerIn', 'Event that this person is a performer or participant in.'),
(478, 1, 5, 'lyrics', 'lyrics', 'The words in the song.'),
(479, 1, 5, 'steeringPosition', 'steeringPosition', 'The position of the steering wheel or similar device (mostly for cars).'),
(480, 1, 5, 'advanceBookingRequirement', 'advanceBookingRequirement', 'The amount of time that is required between accepting the offer and the actual usage of the resource or service.'),
(481, 1, 5, 'branchOf', 'branchOf', 'The larger organization that this local business is a branch of, if any. Not to be confused with (anatomical)<a class=\"localLink\" href=\"http://schema.org/branch\">branch</a>.'),
(482, 1, 5, 'beneficiaryBank', 'beneficiaryBank', 'A bank or bank’s branch, financial institution or international financial institution operating the beneficiary’s bank account or releasing funds for the beneficiary'),
(483, 1, 5, 'knowsLanguage', 'knowsLanguage', 'Of a <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a>, and less typically of an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>, to indicate a known language. We do not distinguish skill levels or reading/writing/speaking/signing here. Use language codes from the <a href=\"http://tools.ietf.org/html/bcp47\">IETF BCP 47 standard</a>.'),
(484, 1, 5, 'applicableLocation', 'applicableLocation', 'The location in which the status applies.'),
(485, 1, 5, 'repeatFrequency', 'repeatFrequency', 'Defines the frequency at which <a class=\"localLink\" href=\"http://schema.org/Events\">Events</a> will occur according to a schedule <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a>. The intervals between\n      events should be defined as a <a class=\"localLink\" href=\"http://schema.org/Duration\">Duration</a> of time.'),
(486, 1, 5, 'containedIn', 'containedIn', 'The basic containment relation between a place and one that contains it.'),
(487, 1, 5, 'inLanguage', 'inLanguage', 'The language of the content or performance or used in an action. Please use one of the language codes from the <a href=\"http://tools.ietf.org/html/bcp47\">IETF BCP 47 standard</a>. See also <a class=\"localLink\" href=\"http://schema.org/availableLanguage\">availableLanguage</a>.'),
(488, 1, 5, 'menuAddOn', 'menuAddOn', 'Additional menu item(s) such as a side dish of salad or side order of fries that can be added to this menu item. Additionally it can be a menu section containing allowed add-on menu items for this menu item.'),
(489, 1, 5, 'healthPlanCoinsuranceRate', 'healthPlanCoinsuranceRate', 'Whether The rate of coinsurance expressed as a number between 0.0 and 1.0.'),
(490, 1, 5, 'broadcastServiceTier', 'broadcastServiceTier', 'The type of service required to have access to the channel (e.g. Standard or Premium).'),
(491, 1, 5, 'isConsumableFor', 'isConsumableFor', 'A pointer to another product (or multiple products) for which this product is a consumable.'),
(492, 1, 5, 'softwareRequirements', 'softwareRequirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).'),
(493, 1, 5, 'postalCodeBegin', 'postalCodeBegin', 'First postal code in a range (included).'),
(494, 1, 5, 'deliveryStatus', 'deliveryStatus', 'New entry added as the package passes through each leg of its journey (from shipment to final delivery).'),
(495, 1, 5, 'legislationType', 'legislationType', 'The type of the legislation. Examples of values are \"law\", \"act\", \"directive\", \"decree\", \"regulation\", \"statutory instrument\", \"loi organique\", \"règlement grand-ducal\", etc., depending on the country.'),
(496, 1, 5, 'hasOccupation', 'hasOccupation', 'The Person\'s occupation. For past professions, use Role for expressing dates.'),
(497, 1, 5, 'opens', 'opens', 'The opening hour of the place or service on the given day(s) of the week.'),
(498, 1, 5, 'sku', 'sku', 'The Stock Keeping Unit (SKU), i.e. a merchant-specific identifier for a product or service, or the product to which the offer refers.'),
(499, 1, 5, 'observedNode', 'observedNode', 'The observedNode of an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>, often a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>.'),
(500, 1, 5, 'penciler', 'penciler', 'The individual who draws the primary narrative artwork.'),
(501, 1, 5, 'educationalLevel', 'educationalLevel', 'The level in terms of progression through an educational or training context. Examples of educational levels include \'beginner\', \'intermediate\' or \'advanced\', and formal sets of level indicators.'),
(502, 1, 5, 'associatedMedia', 'associatedMedia', 'A media object that encodes this CreativeWork. This property is a synonym for encoding.'),
(503, 1, 5, 'hasDriveThroughService', 'hasDriveThroughService', 'Indicates whether some facility (e.g. <a class=\"localLink\" href=\"http://schema.org/FoodEstablishment\">FoodEstablishment</a>, <a class=\"localLink\" href=\"http://schema.org/CovidTestingFacility\">CovidTestingFacility</a>) offers a service that can be used by driving through in a car. In the case of <a class=\"localLink\" href=\"http://schema.org/CovidTestingFacility\">CovidTestingFacility</a> such facilities could potentially help with social distancing from other potentially-infected users.'),
(504, 1, 5, 'foodEstablishment', 'foodEstablishment', 'A sub property of location. The specific food establishment where the action occurred.'),
(505, 1, 5, 'inSupportOf', 'inSupportOf', 'Qualification, candidature, degree, application that Thesis supports.'),
(506, 1, 5, 'frequency', 'frequency', 'How often the dose is taken, e.g. \'daily\'.'),
(507, 1, 5, 'broadcastFrequencyValue', 'broadcastFrequencyValue', 'The frequency in MHz for a particular broadcast.'),
(508, 1, 5, 'attendee', 'attendee', 'A person or organization attending the event.'),
(509, 1, 5, 'accelerationTime', 'accelerationTime', 'The time needed to accelerate the vehicle from a given start velocity to a given target velocity.<br/><br/>\n\nTypical unit code(s): SEC for seconds<br/><br/>\n\n<ul>\n<li>Note: There are unfortunately no standard unit codes for seconds/0..100 km/h or seconds/0..60 mph. Simply use \"SEC\" for seconds and indicate the velocities in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a>, or use <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> with a <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> of 0..60 mph or 0..100 km/h to specify the reference speeds.</li>\n</ul>\n'),
(510, 1, 5, 'workExample', 'workExample', 'Example/instance/realization/derivation of the concept of this creative work. eg. The paperback edition, first edition, or eBook.'),
(511, 1, 5, 'merchantReturnLink', 'merchantReturnLink', 'Indicates a Web page or service by URL, for product return.'),
(512, 1, 5, 'bankAccountType', 'bankAccountType', 'The type of a bank account.'),
(513, 1, 5, 'gameTip', 'gameTip', 'Links to tips, tactics, etc.'),
(514, 1, 5, 'episodes', 'episodes', 'An episode of a TV/radio series or season.'),
(515, 1, 5, 'awards', 'awards', 'Awards won by or for this item.'),
(516, 1, 5, 'question', 'question', 'A sub property of object. A question.'),
(517, 1, 5, 'typicalAgeRange', 'typicalAgeRange', 'The typical expected age range, e.g. \'7-9\', \'11-\'.'),
(518, 1, 5, 'mealService', 'mealService', 'Description of the meals that will be provided or available for purchase.'),
(519, 1, 5, 'musicGroupMember', 'musicGroupMember', 'A member of a music group&#x2014;for example, John, Paul, George, or Ringo.'),
(520, 1, 5, 'touristType', 'touristType', 'Attraction suitable for type(s) of tourist. eg. Children, visitors from a particular country, etc.'),
(521, 1, 5, 'steps', 'steps', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection (originally misnamed \'steps\'; \'step\' is preferred).'),
(522, 1, 5, 'codeValue', 'codeValue', 'A short textual code that uniquely identifies the value.'),
(523, 1, 5, 'releasedEvent', 'releasedEvent', 'The place and time the release was issued, expressed as a PublicationEvent.'),
(524, 1, 5, 'healthPlanNetworkTier', 'healthPlanNetworkTier', 'The tier(s) for this network.'),
(525, 1, 5, 'contributor', 'contributor', 'A secondary contributor to the CreativeWork or Event.'),
(526, 1, 5, 'numberOfCredits', 'numberOfCredits', 'The number of credits or units awarded by a Course or required to complete an EducationalOccupationalProgram.'),
(527, 1, 5, 'endOffset', 'endOffset', 'The end time of the clip expressed as the number of seconds from the beginning of the work.'),
(528, 1, 5, 'articleBody', 'articleBody', 'The actual body of the article.'),
(529, 1, 5, 'announcementLocation', 'announcementLocation', 'Indicates a specific <a class=\"localLink\" href=\"http://schema.org/CivicStructure\">CivicStructure</a> or <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a> associated with the SpecialAnnouncement. For example, a specific testing facility or business with special opening hours. For a larger geographic region like a quarantine of an entire region, use <a class=\"localLink\" href=\"http://schema.org/spatialCoverage\">spatialCoverage</a>.'),
(530, 1, 5, 'legislationDate', 'legislationDate', 'The date of adoption or signature of the legislation. This is the date at which the text is officially aknowledged to be a legislation, even though it might not even be published or in force.'),
(531, 1, 5, 'clipNumber', 'clipNumber', 'Position of the clip within an ordered group of clips.'),
(532, 1, 5, 'seatNumber', 'seatNumber', 'The location of the reserved seat (e.g., 27).'),
(533, 1, 5, 'cvdNumBedsOcc', 'cvdNumBedsOcc', 'numbedsocc - HOSPITAL INPATIENT BED OCCUPANCY: Total number of staffed inpatient beds that are occupied.'),
(534, 1, 5, 'owns', 'owns', 'Products owned by the organization or person.'),
(535, 1, 5, 'audio', 'audio', 'An embedded audio object.'),
(536, 1, 5, 'mentions', 'mentions', 'Indicates that the CreativeWork contains a reference to, but is not necessarily about a concept.'),
(537, 1, 5, 'itemOffered', 'itemOffered', 'An item being offered (or demanded). The transactional nature of the offer or demand is documented using <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a>, e.g. sell, lease etc. While several common expected types are listed explicitly in this definition, others can be used. Using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.'),
(538, 1, 5, 'applicationSuite', 'applicationSuite', 'The name of the application suite to which the application belongs (e.g. Excel belongs to Office).'),
(539, 1, 5, 'procedureType', 'procedureType', 'The type of procedure, for example Surgical, Noninvasive, or Percutaneous.'),
(540, 1, 5, 'paymentDue', 'paymentDue', 'The date that payment is due.'),
(541, 1, 5, 'partOfSeries', 'partOfSeries', 'The series to which this episode or season belongs.'),
(542, 1, 5, 'businessFunction', 'businessFunction', 'The business function (e.g. sell, lease, repair, dispose) of the offer or component of a bundle (TypeAndQuantityNode). The default is http://purl.org/goodrelations/v1#Sell.'),
(543, 1, 5, 'diet', 'diet', 'A sub property of instrument. The diet used in this action.'),
(544, 1, 5, 'confirmationNumber', 'confirmationNumber', 'A number that confirms the given order or payment has been received.'),
(545, 1, 5, 'previousStartDate', 'previousStartDate', 'Used in conjunction with eventStatus for rescheduled or cancelled events. This property contains the previously scheduled start date. For rescheduled events, the startDate property should be used for the newly scheduled start date. In the (rare) case of an event that has been postponed and rescheduled multiple times, this field may be repeated.'),
(546, 1, 5, 'includedDataCatalog', 'includedDataCatalog', 'A data catalog which contains this dataset (this property was previously \'catalog\', preferred name is now \'includedInDataCatalog\').'),
(547, 1, 5, 'postalCodePrefix', 'postalCodePrefix', 'A defined range of postal codes indicated by a common textual prefix. Used for non-numeric systems such as UK.'),
(548, 1, 5, 'termDuration', 'termDuration', 'The amount of time in a term as defined by the institution. A term is a length of time where students take one or more classes. Semesters and quarters are common units for term.'),
(549, 1, 5, 'numChildren', 'numChildren', 'The number of children staying in the unit.'),
(550, 1, 5, 'shippingDetails', 'shippingDetails', 'Indicates information about the shipping policies and options associated with an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(551, 1, 5, 'serviceAudience', 'serviceAudience', 'The audience eligible for this service.'),
(552, 1, 5, 'medicalSpecialty', 'medicalSpecialty', 'A medical specialty of the provider.'),
(553, 1, 5, 'ownedThrough', 'ownedThrough', 'The date and time of giving up ownership on the product.'),
(554, 1, 5, 'cvdNumC19HospPats', 'cvdNumC19HospPats', 'numc19hosppats - HOSPITALIZED: Patients currently hospitalized in an inpatient care location who have suspected or confirmed COVID-19.'),
(555, 1, 5, 'loanPaymentAmount', 'loanPaymentAmount', 'The amount of money to pay in a single payment.'),
(556, 1, 5, 'claimReviewed', 'claimReviewed', 'A short summary of the specific claims reviewed in a ClaimReview.'),
(557, 1, 5, 'legislationPassedBy', 'legislationPassedBy', 'The person or organization that originally passed or made the law : typically parliament (for primary legislation) or government (for secondary legislation). This indicates the \"legal author\" of the law, as opposed to its physical author.'),
(558, 1, 5, 'diseasePreventionInfo', 'diseasePreventionInfo', 'Information about disease prevention.'),
(559, 1, 5, 'employmentUnit', 'employmentUnit', 'Indicates the department, unit and/or facility where the employee reports and/or in which the job is to be performed.'),
(560, 1, 5, 'jobStartDate', 'jobStartDate', 'The date on which a successful applicant for this job would be expected to start work. Choose a specific date in the future or use the jobImmediateStart property to indicate the position is to be filled as soon as possible.'),
(561, 1, 5, 'aspect', 'aspect', 'An aspect of medical practice that is considered on the page, such as \'diagnosis\', \'treatment\', \'causes\', \'prognosis\', \'etiology\', \'epidemiology\', etc.'),
(562, 1, 5, 'occupationLocation', 'occupationLocation', 'The region/country for which this occupational description is appropriate. Note that educational requirements and qualifications can vary between jurisdictions.'),
(563, 1, 5, 'expectsAcceptanceOf', 'expectsAcceptanceOf', 'An Offer which must be accepted before the user can perform the Action. For example, the user may need to buy a movie before being able to watch it.'),
(564, 1, 5, 'video', 'video', 'An embedded video object.'),
(565, 1, 5, 'downloadUrl', 'downloadUrl', 'If the file can be downloaded, URL to download the binary.'),
(566, 1, 5, 'weight', 'weight', 'The weight of the product or person.'),
(567, 1, 5, 'associatedArticle', 'associatedArticle', 'A NewsArticle associated with the Media Object.'),
(568, 1, 5, 'ticketedSeat', 'ticketedSeat', 'The seat associated with the ticket.'),
(569, 1, 5, 'healthPlanCostSharing', 'healthPlanCostSharing', 'Whether The costs to the patient for services under this network or formulary.'),
(570, 1, 5, 'interactingDrug', 'interactingDrug', 'Another drug that is known to interact with this drug in a way that impacts the effect of this drug or causes a risk to the patient. Note: disease interactions are typically captured as contraindications.'),
(571, 1, 5, 'proteinContent', 'proteinContent', 'The number of grams of protein.'),
(572, 1, 5, 'recipeInstructions', 'recipeInstructions', 'A step in making the recipe, in the form of a single item (document, video, etc.) or an ordered list with HowToStep and/or HowToSection items.'),
(573, 1, 5, 'legislationConsolidates', 'legislationConsolidates', 'Indicates another legislation taken into account in this consolidated legislation (which is usually the product of an editorial process that revises the legislation). This property should be used multiple times to refer to both the original version or the previous consolidated version, and to the legislations making the change.'),
(574, 1, 5, 'productSupported', 'productSupported', 'The product or service this support contact point is related to (such as product support for a particular product line). This can be a specific product or product line (e.g. \"iPhone\") or a general category of products or services (e.g. \"smartphones\").'),
(575, 1, 5, 'weightTotal', 'weightTotal', 'The permitted total weight of the loaded vehicle, including passengers and cargo and the weight of the empty vehicle.<br/><br/>\n\nTypical unit code(s): KGM for kilogram, LBR for pound<br/><br/>\n\n<ul>\n<li>Note 1: You can indicate additional information in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> node.</li>\n<li>Note 2: You may also link to a <a class=\"localLink\" href=\"http://schema.org/QualitativeValue\">QualitativeValue</a> node that provides additional information using <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a>.</li>\n<li>Note 3: Note that you can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(576, 1, 5, 'prescriptionStatus', 'prescriptionStatus', 'Indicates the status of drug prescription eg. local catalogs classifications or whether the drug is available by prescription or over-the-counter, etc.'),
(577, 1, 5, 'strengthValue', 'strengthValue', 'The value of an active ingredient\'s strength, e.g. 325.'),
(578, 1, 5, 'musicBy', 'musicBy', 'The composer of the soundtrack.'),
(579, 1, 5, 'relatedCondition', 'relatedCondition', 'A medical condition associated with this anatomy.'),
(580, 1, 5, 'numberOfAxles', 'numberOfAxles', 'The number of axles.<br/><br/>\n\nTypical unit code(s): C62'),
(581, 1, 5, 'byMonthWeek', 'byMonthWeek', 'Defines the week(s) of the month on which a recurring Event takes place. Specified as an Integer between 1-5. For clarity, byMonthWeek is best used in conjunction with byDay to indicate concepts like the first and third Mondays of a month.'),
(582, 1, 5, 'propertyID', 'propertyID', 'A commonly used identifier for the characteristic represented by the property, e.g. a manufacturer or a standard code for a property. propertyID can be\n(1) a prefixed string, mainly meant to be used with standards for product properties; (2) a site-specific, non-prefixed string (e.g. the primary key of the property or the vendor-specific id of the property), or (3)\na URL indicating the type of the property, either pointing to an external vocabulary, or a Web resource that describes the property (e.g. a glossary entry).\nStandards bodies should promote a standard prefix for the identifiers of properties from their standards.'),
(583, 1, 5, 'copyrightYear', 'copyrightYear', 'The year during which the claimed copyright for the CreativeWork was first asserted.'),
(584, 1, 5, 'duplicateTherapy', 'duplicateTherapy', 'A therapy that duplicates or overlaps this one.'),
(585, 1, 5, 'providesBroadcastService', 'providesBroadcastService', 'The BroadcastService offered on this channel.'),
(586, 1, 5, 'featureList', 'featureList', 'Features or modules provided by this application (and possibly required by other applications).'),
(587, 1, 5, 'boardingGroup', 'boardingGroup', 'The airline-specific indicator of boarding order / preference.'),
(588, 1, 5, 'mainContentOfPage', 'mainContentOfPage', 'Indicates if this web page element is the main subject of the page.'),
(589, 1, 5, 'dateIssued', 'dateIssued', 'The date the ticket was issued.'),
(590, 1, 5, 'addressLocality', 'addressLocality', 'The locality in which the street address is, and which is in the region. For example, Mountain View.'),
(591, 1, 5, 'opponent', 'opponent', 'A sub property of participant. The opponent on this action.'),
(592, 1, 5, 'businessDays', 'businessDays', 'Days of the week when the merchant typically operates, indicated via opening hours markup.'),
(593, 1, 5, 'requirements', 'requirements', 'Component dependency requirements for application. This includes runtime environments and shared libraries that are not included in the application distribution package, but required to run the application (Examples: DirectX, Java or .NET runtime).'),
(594, 1, 5, 'actionStatus', 'actionStatus', 'Indicates the current disposition of the Action.'),
(595, 1, 5, 'maps', 'maps', 'A URL to a map of the place.'),
(596, 1, 5, 'device', 'device', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(597, 1, 5, 'cvdNumC19HOPats', 'cvdNumC19HOPats', 'numc19hopats - HOSPITAL ONSET: Patients hospitalized in an NHSN inpatient care location with onset of suspected or confirmed COVID-19 14 or more days after hospitalization.'),
(598, 1, 5, 'grantee', 'grantee', 'The person, organization, contact point, or audience that has been granted this permission.'),
(599, 1, 5, 'actionPlatform', 'actionPlatform', 'The high level platform(s) where the Action can be performed for the given URL. To specify a specific application or operating system instance, use actionApplication.'),
(600, 1, 5, 'underName', 'underName', 'The person or organization the reservation or ticket is for.'),
(601, 1, 5, 'worksFor', 'worksFor', 'Organizations that the person works for.'),
(602, 1, 5, 'beforeMedia', 'beforeMedia', 'A media object representing the circumstances before performing this direction.'),
(603, 1, 5, 'primaryPrevention', 'primaryPrevention', 'A preventative therapy used to prevent an initial occurrence of the medical condition, such as vaccination.'),
(604, 1, 5, 'validFrom', 'validFrom', 'The date when the item becomes valid.'),
(605, 1, 5, 'credentialCategory', 'credentialCategory', 'The category or type of credential being described, for example \"degree”, “certificate”, “badge”, or more specific term.'),
(606, 1, 5, 'namedPosition', 'namedPosition', 'A position played, performed or filled by a person or organization, as part of an organization. For example, an athlete in a SportsTeam might play in the position named \'Quarterback\'.'),
(607, 1, 5, 'jobTitle', 'jobTitle', 'The job title of the person (for example, Financial Manager).'),
(608, 1, 5, 'preOp', 'preOp', 'A description of the workup, testing, and other preparations required before implanting this device.'),
(609, 1, 5, 'contactPoint', 'contactPoint', 'A contact point for a person or organization.'),
(610, 1, 5, 'accessibilityAPI', 'accessibilityAPI', 'Indicates that the resource is compatible with the referenced accessibility API (<a href=\"http://www.w3.org/wiki/WebSchemas/Accessibility\">WebSchemas wiki lists possible values</a>).'),
(611, 1, 5, 'distribution', 'distribution', 'A downloadable form of this dataset, at a specific location, in a specific format.'),
(612, 1, 5, 'version', 'version', 'The version of the CreativeWork embodied by a specified resource.'),
(613, 1, 5, 'language', 'language', 'A sub property of instrument. The language used on this action.'),
(614, 1, 5, 'endDate', 'endDate', 'The end date and time of the item (in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 date format</a>).'),
(615, 1, 5, 'supportingData', 'supportingData', 'Supporting data for a SoftwareApplication.'),
(616, 1, 5, 'scheduledPaymentDate', 'scheduledPaymentDate', 'The date the invoice is scheduled to be paid.'),
(617, 1, 5, 'diversityPolicy', 'diversityPolicy', 'Statement on diversity policy by an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> e.g. a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>. For a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>, a statement describing the newsroom’s diversity policy on both staffing and sources, typically providing staffing data.'),
(618, 1, 5, 'issuedBy', 'issuedBy', 'The organization issuing the ticket or permit.'),
(619, 1, 5, 'signDetected', 'signDetected', 'A sign detected by the test.'),
(620, 1, 5, 'knows', 'knows', 'The most generic bi-directional social/work relation.'),
(621, 1, 5, 'circle', 'circle', 'A circle is the circular region of a specified radius centered at a specified latitude and longitude. A circle is expressed as a pair followed by a radius in meters.'),
(622, 1, 5, 'vehicleModelDate', 'vehicleModelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(623, 1, 5, 'followup', 'followup', 'Typical or recommended followup care after the procedure is performed.'),
(624, 1, 5, 'archiveHeld', 'archiveHeld', 'Collection, <a href=\"https://en.wikipedia.org/wiki/Fonds\">fonds</a>, or item held, kept or maintained by an <a class=\"localLink\" href=\"http://schema.org/ArchiveOrganization\">ArchiveOrganization</a>.'),
(625, 1, 5, 'availableAtOrFrom', 'availableAtOrFrom', 'The place(s) from which the offer can be obtained (e.g. store locations).'),
(626, 1, 5, 'vehicleIdentificationNumber', 'vehicleIdentificationNumber', 'The Vehicle Identification Number (VIN) is a unique serial number used by the automotive industry to identify individual motor vehicles.'),
(627, 1, 5, 'interactionStatistic', 'interactionStatistic', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication. The most specific child type of InteractionCounter should be used.'),
(628, 1, 5, 'blogPost', 'blogPost', 'A posting that is part of this blog.'),
(629, 1, 5, 'discountCurrency', 'discountCurrency', 'The currency of the discount.<br/><br/>\n\nUse standard formats: <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217 currency format</a> e.g. \"USD\"; <a href=\"https://en.wikipedia.org/wiki/List_of_cryptocurrencies\">Ticker symbol</a> for cryptocurrencies e.g. \"BTC\"; well known names for <a href=\"https://en.wikipedia.org/wiki/Local_exchange_trading_system\">Local Exchange Tradings Systems</a> (LETS) and other currency types e.g. \"Ithaca HOUR\".'),
(630, 1, 5, 'healthPlanDrugTier', 'healthPlanDrugTier', 'The tier(s) of drugs offered by this formulary or insurance plan.'),
(631, 1, 5, 'meetsEmissionStandard', 'meetsEmissionStandard', 'Indicates that the vehicle meets the respective emission standard.'),
(632, 1, 5, 'suggestedAnswer', 'suggestedAnswer', 'An answer (possibly one of several, possibly incorrect) to a Question, e.g. on a Question/Answer site.'),
(633, 1, 5, 'legalName', 'legalName', 'The official name of the organization, e.g. the registered company name.'),
(634, 1, 5, 'backstory', 'backstory', 'For an <a class=\"localLink\" href=\"http://schema.org/Article\">Article</a>, typically a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a>, the backstory property provides a textual summary giving a brief explanation of why and how an article was created. In a journalistic setting this could include information about reporting process, methods, interviews, data sources, etc.'),
(635, 1, 5, 'line', 'line', 'A line is a point-to-point path consisting of two or more points. A line is expressed as a series of two or more point objects separated by space.'),
(636, 1, 5, 'volumeNumber', 'volumeNumber', 'Identifies the volume of publication or multi-part work; for example, \"iii\" or \"2\".'),
(637, 1, 5, 'maintainer', 'maintainer', 'A maintainer of a <a class=\"localLink\" href=\"http://schema.org/Dataset\">Dataset</a>, software package (<a class=\"localLink\" href=\"http://schema.org/SoftwareApplication\">SoftwareApplication</a>), or other <a class=\"localLink\" href=\"http://schema.org/Project\">Project</a>. A maintainer is a <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a> or <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> that manages contributions to, and/or publication of, some (typically complex) artifact. It is common for distributions of software and data to be based on \"upstream\" sources. When <a class=\"localLink\" href=\"http://schema.org/maintainer\">maintainer</a> is applied to a specific version of something e.g. a particular version or packaging of a <a class=\"localLink\" href=\"http://schema.org/Dataset\">Dataset</a>, it is always  possible that the upstream source has a different maintainer. The <a class=\"localLink\" href=\"http://schema.org/isBasedOn\">isBasedOn</a> property can be used to indicate such relationships between datasets to make the different maintenance roles clear. Similarly in the case of software, a package may have dedicated maintainers working on integration into software distributions such as Ubuntu, as well as upstream maintainers of the underlying work.'),
(638, 1, 5, 'composer', 'composer', 'The person or organization who wrote a composition, or who is the composer of a work performed at some event.'),
(639, 1, 5, 'warrantyPromise', 'warrantyPromise', 'The warranty promise(s) included in the offer.'),
(640, 1, 5, 'floorLimit', 'floorLimit', 'A floor limit is the amount of money above which credit card transactions must be authorized.'),
(641, 1, 5, 'departureGate', 'departureGate', 'Identifier of the flight\'s departure gate.'),
(642, 1, 5, 'includedInHealthInsurancePlan', 'includedInHealthInsurancePlan', 'The insurance plans that cover this drug.'),
(643, 1, 5, 'hasDefinedTerm', 'hasDefinedTerm', 'A Defined Term contained in this term set.'),
(644, 1, 5, 'acceptedOffer', 'acceptedOffer', 'The offer(s) -- e.g., product, quantity and price combinations -- included in the order.'),
(645, 1, 5, 'membershipPointsEarned', 'membershipPointsEarned', 'The number of membership points earned by the member. If necessary, the unitText can be used to express the units the points are issued in. (e.g. stars, miles, etc.)'),
(646, 1, 5, 'loanMortgageMandateAmount', 'loanMortgageMandateAmount', 'Amount of mortgage mandate that can be converted into a proper mortgage at a later stage.'),
(647, 1, 5, 'availability', 'availability', 'The availability of this item&#x2014;for example In stock, Out of stock, Pre-order, etc.'),
(648, 1, 5, 'childMaxAge', 'childMaxAge', 'Maximal age of the child.'),
(649, 1, 5, 'departureBoatTerminal', 'departureBoatTerminal', 'The terminal or port from which the boat departs.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(650, 1, 5, 'eventStatus', 'eventStatus', 'An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.'),
(651, 1, 5, 'replacer', 'replacer', 'A sub property of object. The object that replaces.'),
(652, 1, 5, 'coverageStartTime', 'coverageStartTime', 'The time when the live blog will begin covering the Event. Note that coverage may begin before the Event\'s start time. The LiveBlogPosting may also be created before coverage begins.'),
(653, 1, 5, 'screenshot', 'screenshot', 'A link to a screenshot image of the app.'),
(654, 1, 5, 'illustrator', 'illustrator', 'The illustrator of the book.'),
(655, 1, 5, 'fileFormat', 'fileFormat', 'Media type, typically MIME format (see <a href=\"http://www.iana.org/assignments/media-types/media-types.xhtml\">IANA site</a>) of the content e.g. application/zip of a SoftwareApplication binary. In cases where a CreativeWork has several media type representations, \'encoding\' can be used to indicate each MediaObject alongside particular fileFormat information. Unregistered or niche file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia entry.'),
(656, 1, 5, 'speed', 'speed', 'The speed range of the vehicle. If the vehicle is powered by an engine, the upper limit of the speed range (indicated by <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> should be the maximum speed achievable under regular conditions.<br/><br/>\n\nTypical unit code(s): KMH for km/h, HM for mile per hour (0.447 04 m/s), KNT for knot<br/><br/>\n\n*Note 1: Use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate the range. Typically, the minimal value is zero.\n* Note 2: There are many different ways of measuring the speed range. You can link to information about how the given value has been determined using the <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> property.'),
(657, 1, 5, 'skills', 'skills', 'A statement of knowledge, skill, ability, task or any other assertion expressing a competency that is desired or required to fulfill this role or to work in this occupation.'),
(658, 1, 5, 'termCode', 'termCode', 'A code that identifies this <a class=\"localLink\" href=\"http://schema.org/DefinedTerm\">DefinedTerm</a> within a <a class=\"localLink\" href=\"http://schema.org/DefinedTermSet\">DefinedTermSet</a>'),
(659, 1, 5, 'instrument', 'instrument', 'The object that helped the agent perform the action. e.g. John wrote a book with <em>a pen</em>.'),
(660, 1, 5, 'measurementTechnique', 'measurementTechnique', 'A technique or technology used in a <a class=\"localLink\" href=\"http://schema.org/Dataset\">Dataset</a> (or <a class=\"localLink\" href=\"http://schema.org/DataDownload\">DataDownload</a>, <a class=\"localLink\" href=\"http://schema.org/DataCatalog\">DataCatalog</a>),\ncorresponding to the method used for measuring the corresponding variable(s) (described using <a class=\"localLink\" href=\"http://schema.org/variableMeasured\">variableMeasured</a>). This is oriented towards scientific and scholarly dataset publication but may have broader applicability; it is not intended as a full representation of measurement, but rather as a high level summary for dataset discovery.<br/><br/>\n\nFor example, if <a class=\"localLink\" href=\"http://schema.org/variableMeasured\">variableMeasured</a> is: molecule concentration, <a class=\"localLink\" href=\"http://schema.org/measurementTechnique\">measurementTechnique</a> could be: \"mass spectrometry\" or \"nmr spectroscopy\" or \"colorimetry\" or \"immunofluorescence\".<br/><br/>\n\nIf the <a class=\"localLink\" href=\"http://schema.org/variableMeasured\">variableMeasured</a> is \"depression rating\", the <a class=\"localLink\" href=\"http://schema.org/measurementTechnique\">measurementTechnique</a> could be \"Zung Scale\" or \"HAM-D\" or \"Beck Depression Inventory\".<br/><br/>\n\nIf there are several <a class=\"localLink\" href=\"http://schema.org/variableMeasured\">variableMeasured</a> properties recorded for some given data object, use a <a class=\"localLink\" href=\"http://schema.org/PropertyValue\">PropertyValue</a> for each <a class=\"localLink\" href=\"http://schema.org/variableMeasured\">variableMeasured</a> and attach the corresponding <a class=\"localLink\" href=\"http://schema.org/measurementTechnique\">measurementTechnique</a>.'),
(661, 1, 5, 'median', 'median', 'The median value.'),
(662, 1, 5, 'diseaseSpreadStatistics', 'diseaseSpreadStatistics', 'Statistical information about the spread of a disease, either as <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a>, or\n  described directly as a <a class=\"localLink\" href=\"http://schema.org/Dataset\">Dataset</a>, or the specific <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>s in the dataset. When a <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a> URL is\n  provided, the page indicated might also contain more such markup.'),
(663, 1, 5, 'arrivalBoatTerminal', 'arrivalBoatTerminal', 'The terminal or port from which the boat arrives.'),
(664, 1, 5, 'userInteractionCount', 'userInteractionCount', 'The number of interactions for the CreativeWork using the WebSite or SoftwareApplication.'),
(665, 1, 5, 'inProductGroupWithID', 'inProductGroupWithID', 'Indicates the <a class=\"localLink\" href=\"http://schema.org/productGroupID\">productGroupID</a> for a <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a> that this product <a class=\"localLink\" href=\"http://schema.org/isVariantOf\">isVariantOf</a>.'),
(666, 1, 5, 'percentile75', 'percentile75', 'The 75th percentile value.'),
(667, 1, 5, 'gtin14', 'gtin14', 'The GTIN-14 code of the product, or the product to which the offer refers. See <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GS1 GTIN Summary</a> for more details.'),
(668, 1, 5, 'closes', 'closes', 'The closing hour of the place or service on the given day(s) of the week.'),
(669, 1, 5, 'collection', 'collection', 'A sub property of object. The collection target of the action.'),
(670, 1, 5, 'targetUrl', 'targetUrl', 'The URL of a node in an established educational framework.'),
(671, 1, 5, 'trainName', 'trainName', 'The name of the train (e.g. The Orient Express).'),
(672, 1, 5, 'isLiveBroadcast', 'isLiveBroadcast', 'True is the broadcast is of a live event.'),
(673, 1, 5, 'restPeriods', 'restPeriods', 'How often one should break from the activity.'),
(674, 1, 5, 'legislationLegalForce', 'legislationLegalForce', 'Whether the legislation is currently in force, not in force, or partially in force.'),
(675, 1, 5, 'dateDeleted', 'dateDeleted', 'The datetime the item was removed from the DataFeed.'),
(676, 1, 5, 'naics', 'naics', 'The North American Industry Classification System (NAICS) code for a particular organization or business person.'),
(677, 1, 5, 'isResizable', 'isResizable', 'Whether the 3DModel allows resizing. For example, room layout applications often do not allow 3DModel elements to be resized to reflect reality.'),
(678, 1, 5, 'providerMobility', 'providerMobility', 'Indicates the mobility of a provided service (e.g. \'static\', \'dynamic\').'),
(679, 1, 5, 'albums', 'albums', 'A collection of music albums.'),
(680, 1, 5, 'creditedTo', 'creditedTo', 'The group the release is credited to if different than the byArtist. For example, Red and Blue is credited to \"Stefani Germanotta Band\", but by Lady Gaga.'),
(681, 1, 5, 'prescribingInfo', 'prescribingInfo', 'Link to prescribing information for the drug.'),
(682, 1, 5, 'containsSeason', 'containsSeason', 'A season that is part of the media series.'),
(683, 1, 5, 'sender', 'sender', 'A sub property of participant. The participant who is at the sending end of the action.'),
(684, 1, 5, 'screenCount', 'screenCount', 'The number of screens in the movie theater.'),
(685, 1, 5, 'wheelbase', 'wheelbase', 'The distance between the centers of the front and rear wheels.<br/><br/>\n\nTypical unit code(s): CMT for centimeters, MTR for meters, INH for inches, FOT for foot/feet'),
(686, 1, 5, 'eligibleTransactionVolume', 'eligibleTransactionVolume', 'The transaction volume, in a monetary unit, for which the offer or price specification is valid, e.g. for indicating a minimal purchasing volume, to express free shipping above a certain order volume, or to limit the acceptance of credit cards to purchases to a certain minimal amount.'),
(687, 1, 5, 'globalLocationNumber', 'globalLocationNumber', 'The <a href=\"http://www.gs1.org/gln\">Global Location Number</a> (GLN, sometimes also referred to as International Location Number or ILN) of the respective organization, person, or place. The GLN is a 13-digit number used to identify parties and physical locations.'),
(688, 1, 5, 'petsAllowed', 'petsAllowed', 'Indicates whether pets are allowed to enter the accommodation or lodging business. More detailed information can be put in a text value.'),
(689, 1, 5, 'accountMinimumInflow', 'accountMinimumInflow', 'A minimum amount that has to be paid in every month.'),
(690, 1, 5, 'duration', 'duration', 'The duration of the item (movie, audio recording, event, etc.) in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 date format</a>.'),
(691, 1, 5, 'exercisePlan', 'exercisePlan', 'A sub property of instrument. The exercise plan used on this action.'),
(692, 1, 5, 'itemShipped', 'itemShipped', 'Item(s) being shipped.'),
(693, 1, 5, 'observationDate', 'observationDate', 'The observationDate of an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>.'),
(694, 1, 5, 'geoRadius', 'geoRadius', 'Indicates the approximate radius of a GeoCircle (metres unless indicated otherwise via Distance notation).'),
(695, 1, 5, 'representativeOfPage', 'representativeOfPage', 'Indicates whether this image is representative of the content of the page.'),
(696, 1, 5, 'financialAidEligible', 'financialAidEligible', 'A financial aid type or program which students may use to pay for tuition or fees associated with the program.'),
(697, 1, 5, 'expectedPrognosis', 'expectedPrognosis', 'The likely outcome in either the short term or long term of the medical condition.'),
(698, 1, 5, 'text', 'text', 'The textual content of this CreativeWork.'),
(699, 1, 5, 'occupationalCategory', 'occupationalCategory', 'A category describing the job, preferably using a term from a taxonomy such as <a href=\"http://www.onetcenter.org/taxonomy.html\">BLS O*NET-SOC</a>, <a href=\"https://www.ilo.org/public/english/bureau/stat/isco/isco08/\">ISCO-08</a> or similar, with the property repeated for each applicable value. Ideally the taxonomy should be identified, and both the textual label and formal code for the category should be provided.<br/><br/>\n\nNote: for historical reasons, any textual label and formal code provided as a literal may be assumed to be from O*NET-SOC.'),
(700, 1, 5, 'originAddress', 'originAddress', 'Shipper\'s address.'),
(701, 1, 5, 'bookFormat', 'bookFormat', 'The format of the book.'),
(702, 1, 5, 'availabilityEnds', 'availabilityEnds', 'The end of the availability of the product or service included in the offer.'),
(703, 1, 5, 'timeToComplete', 'timeToComplete', 'The expected length of time to complete the program if attending full-time.'),
(704, 1, 5, 'hasDeliveryMethod', 'hasDeliveryMethod', 'Method used for delivery or shipping.'),
(705, 1, 5, 'temporalCoverage', 'temporalCoverage', 'The temporalCoverage of a CreativeWork indicates the period that the content applies to, i.e. that it describes, either as a DateTime or as a textual string indicating a time period in <a href=\"https://en.wikipedia.org/wiki/ISO_8601#Time_intervals\">ISO 8601 time interval format</a>. In\n      the case of a Dataset it will typically indicate the relevant time period in a precise notation (e.g. for a 2011 census dataset, the year 2011 would be written \"2011/2012\"). Other forms of content e.g. ScholarlyArticle, Book, TVSeries or TVEpisode may indicate their temporalCoverage in broader terms - textually or via well-known URL.\n      Written works such as books may sometimes have precise temporal coverage too, e.g. a work set in 1939 - 1945 can be indicated in ISO 8601 interval format format via \"1939/1945\".<br/><br/>\n\nOpen-ended date ranges can be written with \"..\" in place of the end date. For example, \"2015-11/..\" indicates a range beginning in November 2015 and with no specified final date. This is tentative and might be updated in future when ISO 8601 is officially updated.'),
(706, 1, 5, 'identifyingTest', 'identifyingTest', 'A diagnostic test that can identify this sign.'),
(707, 1, 5, 'durationOfWarranty', 'durationOfWarranty', 'The duration of the warranty promise. Common unitCode values are ANN for year, MON for months, or DAY for days.'),
(708, 1, 5, 'partOfInvoice', 'partOfInvoice', 'The order is being paid as part of the referenced Invoice.'),
(709, 1, 5, 'benefits', 'benefits', 'Description of benefits associated with the job.'),
(710, 1, 5, 'numberOfPartialBathrooms', 'numberOfPartialBathrooms', 'Number of partial bathrooms - The total number of half and ¼ bathrooms in an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>. This corresponds to the <a href=\"https://ddwiki.reso.org/display/DDW17/BathroomsPartial+Field\">BathroomsPartial field in RESO</a>.'),
(711, 1, 5, 'usesHealthPlanIdStandard', 'usesHealthPlanIdStandard', 'The standard for interpreting thePlan ID. The preferred is \"HIOS\". See the Centers for Medicare &amp; Medicaid Services for more details.'),
(712, 1, 5, 'floorSize', 'floorSize', 'The size of the accommodation, e.g. in square meter or squarefoot.\nTypical unit code(s): MTK for square meter, FTK for square foot, or YDK for square yard'),
(713, 1, 5, 'roofLoad', 'roofLoad', 'The permitted total weight of cargo and installations (e.g. a roof rack) on top of the vehicle.<br/><br/>\n\nTypical unit code(s): KGM for kilogram, LBR for pound<br/><br/>\n\n<ul>\n<li>Note 1: You can indicate additional information in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> node.</li>\n<li>Note 2: You may also link to a <a class=\"localLink\" href=\"http://schema.org/QualitativeValue\">QualitativeValue</a> node that provides additional information using <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a></li>\n<li>Note 3: Note that you can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(714, 1, 5, 'specialCommitments', 'specialCommitments', 'Any special commitments associated with this job posting. Valid entries include VeteranCommit, MilitarySpouseCommit, etc.'),
(715, 1, 5, 'numberOfEpisodes', 'numberOfEpisodes', 'The number of episodes in this season or series.'),
(716, 1, 5, 'departurePlatform', 'departurePlatform', 'The platform from which the train departs.'),
(717, 1, 5, 'cvdNumBeds', 'cvdNumBeds', 'numbeds - HOSPITAL INPATIENT BEDS: Inpatient beds, including all staffed, licensed, and overflow (surge) beds used for inpatients.'),
(718, 1, 5, 'genre', 'genre', 'Genre of the creative work, broadcast channel or group.'),
(719, 1, 5, 'encodingFormat', 'encodingFormat', 'Media type typically expressed using a MIME format (see <a href=\"http://www.iana.org/assignments/media-types/media-types.xhtml\">IANA site</a> and <a href=\"https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types\">MDN reference</a>) e.g. application/zip for a SoftwareApplication binary, audio/mpeg for .mp3 etc.).<br/><br/>\n\nIn cases where a <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a> has several media type representations, <a class=\"localLink\" href=\"http://schema.org/encoding\">encoding</a> can be used to indicate each <a class=\"localLink\" href=\"http://schema.org/MediaObject\">MediaObject</a> alongside particular <a class=\"localLink\" href=\"http://schema.org/encodingFormat\">encodingFormat</a> information.<br/><br/>\n\nUnregistered or niche encoding and file formats can be indicated instead via the most appropriate URL, e.g. defining Web page or a Wikipedia/Wikidata entry.'),
(720, 1, 5, 'isPartOf', 'isPartOf', 'Indicates an item or CreativeWork that this item, or CreativeWork (in some sense), is part of.'),
(721, 1, 5, 'hoursAvailable', 'hoursAvailable', 'The hours during which this service or contact is available.'),
(722, 1, 5, 'accessCode', 'accessCode', 'Password, PIN, or access code needed for delivery (e.g. from a locker).'),
(723, 1, 5, 'transitTimeLabel', 'transitTimeLabel', 'Label to match an <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a> with a <a class=\"localLink\" href=\"http://schema.org/DeliveryTimeSettings\">DeliveryTimeSettings</a> (within the context of a <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> cross-reference).'),
(724, 1, 5, 'programType', 'programType', 'The type of educational or occupational program. For example, classroom, internship, alternance, etc..'),
(725, 1, 5, 'benefitsSummaryUrl', 'benefitsSummaryUrl', 'The URL that goes directly to the summary of benefits and coverage for the specific standard plan or plan variation.'),
(726, 1, 5, 'materialExtent', 'materialExtent', 'The quantity of the materials being described or an expression of the physical space they occupy.'),
(727, 1, 5, 'encodingType', 'encodingType', 'The supported encoding type(s) for an EntryPoint request.'),
(728, 1, 5, 'valueName', 'valueName', 'Indicates the name of the PropertyValueSpecification to be used in URL templates and form encoding in a manner analogous to HTML\'s input@name.'),
(729, 1, 5, 'interactivityType', 'interactivityType', 'The predominant mode of learning supported by the learning resource. Acceptable values are \'active\', \'expositive\', or \'mixed\'.'),
(730, 1, 5, 'memberOf', 'memberOf', 'An Organization (or ProgramMembership) to which this Person or Organization belongs.'),
(731, 1, 5, 'isVariantOf', 'isVariantOf', 'Indicates the kind of product that this is a variant of. In the case of <a class=\"localLink\" href=\"http://schema.org/ProductModel\">ProductModel</a>, this is a pointer (from a ProductModel) to a base product from which this product is a variant. It is safe to infer that the variant inherits all product features from the base model, unless defined locally. This is not transitive. In the case of a <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a>, the group description also serves as a template, representing a set of Products that vary on explicitly defined, specific dimensions only (so it defines both a set of variants, as well as which values distinguish amongst those variants). When used with <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a>, this property can apply to any <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a> included in the group.'),
(732, 1, 5, 'aircraft', 'aircraft', 'The kind of aircraft (e.g., \"Boeing 747\").'),
(733, 1, 5, 'doesNotShip', 'doesNotShip', 'Indicates when shipping to a particular <a class=\"localLink\" href=\"http://schema.org/shippingDestination\">shippingDestination</a> is not available.'),
(734, 1, 5, 'employerOverview', 'employerOverview', 'A description of the employer, career opportunities and work environment for this position.'),
(735, 1, 5, 'album', 'album', 'A music album.'),
(736, 1, 5, 'isSimilarTo', 'isSimilarTo', 'A pointer to another, functionally similar product (or multiple products).'),
(737, 1, 5, 'cookingMethod', 'cookingMethod', 'The method of cooking, such as Frying, Steaming, ...'),
(738, 1, 5, 'typeOfGood', 'typeOfGood', 'The product that this structured value is referring to.'),
(739, 1, 5, 'isFamilyFriendly', 'isFamilyFriendly', 'Indicates whether this content is family friendly.'),
(740, 1, 5, 'appliesToDeliveryMethod', 'appliesToDeliveryMethod', 'The delivery method(s) to which the delivery charge or payment charge specification applies.'),
(741, 1, 5, 'billingPeriod', 'billingPeriod', 'The time interval used to compute the invoice.'),
(742, 1, 5, 'ineligibleRegion', 'ineligibleRegion', 'The ISO 3166-1 (ISO 3166-1 alpha-2) or ISO 3166-2 code, the place, or the GeoShape for the geo-political region(s) for which the offer or delivery charge specification is not valid, e.g. a region where the transaction is not allowed.<br/><br/>\n\nSee also <a class=\"localLink\" href=\"http://schema.org/eligibleRegion\">eligibleRegion</a>.'),
(743, 1, 5, 'departureTime', 'departureTime', 'The expected departure time.'),
(744, 1, 5, 'serviceSmsNumber', 'serviceSmsNumber', 'The number to access the service by text message.'),
(745, 1, 5, 'firstAppearance', 'firstAppearance', 'Indicates the first known occurence of a <a class=\"localLink\" href=\"http://schema.org/Claim\">Claim</a> in some <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>.'),
(746, 1, 5, 'recipeCategory', 'recipeCategory', 'The category of the recipe—for example, appetizer, entree, etc.'),
(747, 1, 5, 'geographicArea', 'geographicArea', 'The geographic area associated with the audience.'),
(748, 1, 5, 'xpath', 'xpath', 'An XPath, e.g. of a <a class=\"localLink\" href=\"http://schema.org/SpeakableSpecification\">SpeakableSpecification</a> or <a class=\"localLink\" href=\"http://schema.org/WebPageElement\">WebPageElement</a>. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(749, 1, 5, 'downvoteCount', 'downvoteCount', 'The number of downvotes this question, answer or comment has received from the community.'),
(750, 1, 5, 'interactionCount', 'interactionCount', 'This property is deprecated, alongside the UserInteraction types on which it depended.'),
(751, 1, 5, 'entertainmentBusiness', 'entertainmentBusiness', 'A sub property of location. The entertainment business where the action occurred.'),
(752, 1, 5, 'byMonthDay', 'byMonthDay', 'Defines the day(s) of the month on which a recurring <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> takes place. Specified as an <a class=\"localLink\" href=\"http://schema.org/Integer\">Integer</a> between 1-31.'),
(753, 1, 5, 'fuelEfficiency', 'fuelEfficiency', 'The distance traveled per unit of fuel used; most commonly miles per gallon (mpg) or kilometers per liter (km/L).<br/><br/>\n\n<ul>\n<li>Note 1: There are unfortunately no standard unit codes for miles per gallon or kilometers per liter. Use <a class=\"localLink\" href=\"http://schema.org/unitText\">unitText</a> to indicate the unit of measurement, e.g. mpg or km/L.</li>\n<li>Note 2: There are two ways of indicating the fuel consumption, <a class=\"localLink\" href=\"http://schema.org/fuelConsumption\">fuelConsumption</a> (e.g. 8 liters per 100 km) and <a class=\"localLink\" href=\"http://schema.org/fuelEfficiency\">fuelEfficiency</a> (e.g. 30 miles per gallon). They are reciprocal.</li>\n<li>Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> to link the value for the fuel economy to another value.</li>\n</ul>\n'),
(754, 1, 5, 'expectedArrivalFrom', 'expectedArrivalFrom', 'The earliest date the package may arrive.'),
(755, 1, 5, 'isAccessoryOrSparePartFor', 'isAccessoryOrSparePartFor', 'A pointer to another product (or multiple products) for which this product is an accessory or spare part.'),
(756, 1, 5, 'jobBenefits', 'jobBenefits', 'Description of benefits associated with the job.'),
(757, 1, 5, 'includesHealthPlanFormulary', 'includesHealthPlanFormulary', 'Formularies covered by this plan.'),
(758, 1, 5, 'artform', 'artform', 'e.g. Painting, Drawing, Sculpture, Print, Photograph, Assemblage, Collage, etc.'),
(759, 1, 5, 'algorithm', 'algorithm', 'The algorithm or rules to follow to compute the score.'),
(760, 1, 5, 'dissolutionDate', 'dissolutionDate', 'The date that this organization was dissolved.'),
(761, 1, 5, 'commentCount', 'commentCount', 'The number of comments this CreativeWork (e.g. Article, Question or Answer) has received. This is most applicable to works published in Web sites with commenting system; additional comments may exist elsewhere.'),
(762, 1, 5, 'about', 'about', 'The subject matter of the content.'),
(763, 1, 5, 'eligibleDuration', 'eligibleDuration', 'The duration for which the given offer is valid.'),
(764, 1, 5, 'endTime', 'endTime', 'The endTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to end. For actions that span a period of time, when the action was performed. e.g. John wrote a book from January to <em>December</em>. For media, including audio and video, it\'s the time offset of the end of a clip within a larger file.<br/><br/>\n\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(765, 1, 5, 'postalCodeEnd', 'postalCodeEnd', 'Last postal code in the range (included). Needs to be after <a class=\"localLink\" href=\"http://schema.org/postalCodeBegin\">postalCodeBegin</a>.'),
(766, 1, 5, 'numberOfPreviousOwners', 'numberOfPreviousOwners', 'The number of owners of the vehicle, including the current one.<br/><br/>\n\nTypical unit code(s): C62'),
(767, 1, 5, 'track', 'track', 'A music recording (track)&#x2014;usually a single song. If an ItemList is given, the list should contain items of type MusicRecording.'),
(768, 1, 5, 'thumbnailUrl', 'thumbnailUrl', 'A thumbnail image relevant to the Thing.'),
(769, 1, 5, 'bccRecipient', 'bccRecipient', 'A sub property of recipient. The recipient blind copied on a message.'),
(770, 1, 5, 'reviewedBy', 'reviewedBy', 'People or organizations that have reviewed the content on this web page for accuracy and/or completeness.'),
(771, 1, 5, 'additionalType', 'additionalType', 'An additional type for the item, typically used for adding more specific types from external vocabularies in microdata syntax. This is a relationship between something and a class that the thing is in. In RDFa syntax, it is better to use the native RDFa syntax - the \'typeof\' attribute - for multiple types. Schema.org tools may have only weaker understanding of extra types, in particular those defined externally.'),
(772, 1, 5, 'cargoVolume', 'cargoVolume', 'The available volume for cargo or luggage. For automobiles, this is usually the trunk volume.<br/><br/>\n\nTypical unit code(s): LTR for liters, FTQ for cubic foot/feet<br/><br/>\n\nNote: You can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.'),
(773, 1, 5, 'bitrate', 'bitrate', 'The bitrate of the media object.'),
(774, 1, 5, 'costCategory', 'costCategory', 'The category of cost, such as wholesale, retail, reimbursement cap, etc.'),
(775, 1, 5, 'employee', 'employee', 'Someone working for this organization.'),
(776, 1, 5, 'additionalVariable', 'additionalVariable', 'Any additional component of the exercise prescription that may need to be articulated to the patient. This may include the order of exercises, the number of repetitions of movement, quantitative distance, progressions over time, etc.'),
(777, 1, 5, 'uploadDate', 'uploadDate', 'Date when this media object was uploaded to this site.'),
(778, 1, 5, 'vehicleInteriorColor', 'vehicleInteriorColor', 'The color or color combination of the interior of the vehicle.'),
(779, 1, 5, 'paymentMethod', 'paymentMethod', 'The name of the credit card or other method of payment for the order.'),
(780, 1, 5, 'significantLink', 'significantLink', 'One of the more significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(781, 1, 5, 'epidemiology', 'epidemiology', 'The characteristics of associated patients, such as age, gender, race etc.'),
(782, 1, 5, 'pattern', 'pattern', 'A pattern that something has, for example \'polka dot\', \'striped\', \'Canadian flag\'. Values are typically expressed as text, although links to controlled value schemes are also supported.'),
(783, 1, 5, 'category', 'category', 'A category for the item. Greater signs or slashes can be used to informally indicate a category hierarchy.'),
(784, 1, 5, 'employees', 'employees', 'People working for this organization.'),
(785, 1, 5, 'mechanismOfAction', 'mechanismOfAction', 'The specific biochemical interaction through which this drug or supplement produces its pharmacological effect.'),
(786, 1, 5, 'publisher', 'publisher', 'The publisher of the creative work.'),
(787, 1, 5, 'remainingAttendeeCapacity', 'remainingAttendeeCapacity', 'The number of attendee places for an event that remain unallocated.'),
(788, 1, 5, 'sportsTeam', 'sportsTeam', 'A sub property of participant. The sports team that participated on this action.'),
(789, 1, 5, 'authenticator', 'authenticator', 'The Organization responsible for authenticating the user\'s subscription. For example, many media apps require a cable/satellite provider to authenticate your subscription before playing media.'),
(790, 1, 5, 'musicArrangement', 'musicArrangement', 'An arrangement derived from the composition.'),
(791, 1, 5, 'minPrice', 'minPrice', 'The lowest price if the price is a range.'),
(792, 1, 5, 'accountId', 'accountId', 'The identifier for the account the payment will be applied to.'),
(793, 1, 5, 'ratingValue', 'ratingValue', 'The rating for the content.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(794, 1, 5, 'departureAirport', 'departureAirport', 'The airport where the flight originates.'),
(795, 1, 5, 'applicationCategory', 'applicationCategory', 'Type of software application, e.g. \'Game, Multimedia\'.'),
(796, 1, 5, 'arrivalTerminal', 'arrivalTerminal', 'Identifier of the flight\'s arrival terminal.'),
(797, 1, 5, 'studyDesign', 'studyDesign', 'Specifics about the observational study design (enumerated).'),
(798, 1, 5, 'performers', 'performers', 'The main performer or performers of the event&#x2014;for example, a presenter, musician, or actor.'),
(799, 1, 5, 'height', 'height', 'The height of the item.'),
(800, 1, 5, 'departureBusStop', 'departureBusStop', 'The stop or station from which the bus departs.'),
(801, 1, 5, 'currenciesAccepted', 'currenciesAccepted', 'The currency accepted.<br/><br/>\n\nUse standard formats: <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217 currency format</a> e.g. \"USD\"; <a href=\"https://en.wikipedia.org/wiki/List_of_cryptocurrencies\">Ticker symbol</a> for cryptocurrencies e.g. \"BTC\"; well known names for <a href=\"https://en.wikipedia.org/wiki/Local_exchange_trading_system\">Local Exchange Tradings Systems</a> (LETS) and other currency types e.g. \"Ithaca HOUR\".'),
(802, 1, 5, 'department', 'department', 'A relationship between an organization and a department of that organization, also described as an organization (allowing different urls, logos, opening hours). For example: a store with a pharmacy, or a bakery with a cafe.'),
(803, 1, 5, 'branchCode', 'branchCode', 'A short textual code (also called \"store code\") that uniquely identifies a place of business. The code is typically assigned by the parentOrganization and used in structured URLs.<br/><br/>\n\nFor example, in the URL http://www.starbucks.co.uk/store-locator/etc/detail/3047 the code \"3047\" is a branchCode for a particular branch.'),
(804, 1, 5, 'originatesFrom', 'originatesFrom', 'The vasculature the lymphatic structure originates, or afferents, from.'),
(805, 1, 5, 'step', 'step', 'A single step item (as HowToStep, text, document, video, etc.) or a HowToSection.'),
(806, 1, 5, 'bookEdition', 'bookEdition', 'The edition of the book.'),
(807, 1, 5, 'ticketToken', 'ticketToken', 'Reference to an asset (e.g., Barcode, QR code image or PDF) usable for entrance.'),
(808, 1, 5, 'schoolClosuresInfo', 'schoolClosuresInfo', 'Information about school closures.'),
(809, 1, 5, 'hasBroadcastChannel', 'hasBroadcastChannel', 'A broadcast channel of a broadcast service.'),
(810, 1, 5, 'dateRead', 'dateRead', 'The date/time at which the message has been read by the recipient if a single recipient exists.'),
(811, 1, 5, 'minimumPaymentDue', 'minimumPaymentDue', 'The minimum payment required at this time.'),
(812, 1, 5, 'httpMethod', 'httpMethod', 'An HTTP method that specifies the appropriate HTTP method for a request to an HTTP EntryPoint. Values are capitalized strings as used in HTTP.'),
(813, 1, 5, 'measuredProperty', 'measuredProperty', 'The measuredProperty of an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>, either a schema.org property, a property from other RDF-compatible systems e.g. W3C RDF Data Cube, or schema.org extensions such as <a href=\"https://www.gs1.org/voc/?show=properties\">GS1\'s</a>.'),
(814, 1, 5, 'medicineSystem', 'medicineSystem', 'The system of medicine that includes this MedicalEntity, for example \'evidence-based\', \'homeopathic\', \'chiropractic\', etc.'),
(815, 1, 5, 'numberOfLoanPayments', 'numberOfLoanPayments', 'The number of payments contractually required at origination to repay the loan. For monthly paying loans this is the number of months from the contractual first payment date to the maturity date.'),
(816, 1, 5, 'functionalClass', 'functionalClass', 'The degree of mobility the joint allows.'),
(817, 1, 5, 'cvdFacilityId', 'cvdFacilityId', 'Identifier of the NHSN facility that this data record applies to. Use <a class=\"localLink\" href=\"http://schema.org/cvdFacilityCounty\">cvdFacilityCounty</a> to indicate the county. To provide other details, <a class=\"localLink\" href=\"http://schema.org/healthcareReportingData\">healthcareReportingData</a> can be used on a <a class=\"localLink\" href=\"http://schema.org/Hospital\">Hospital</a> entry.'),
(818, 1, 5, 'availableFrom', 'availableFrom', 'When the item is available for pickup from the store, locker, etc.'),
(819, 1, 5, 'healthPlanCopayOption', 'healthPlanCopayOption', 'Whether the copay is before or after deductible, etc. TODO: Is this a closed set?'),
(820, 1, 5, 'paymentUrl', 'paymentUrl', 'The URL for sending a payment.'),
(821, 1, 5, 'numberOfBeds', 'numberOfBeds', 'The quantity of the given bed type available in the HotelRoom, Suite, House, or Apartment.'),
(822, 1, 5, 'ratingCount', 'ratingCount', 'The count of total number of ratings.'),
(823, 1, 5, 'naturalProgression', 'naturalProgression', 'The expected progression of the condition if it is not treated and allowed to progress naturally.'),
(824, 1, 5, 'arrivalGate', 'arrivalGate', 'Identifier of the flight\'s arrival gate.'),
(825, 1, 5, 'jurisdiction', 'jurisdiction', 'Indicates a legal jurisdiction, e.g. of some legislation, or where some government service is based.'),
(826, 1, 5, 'encoding', 'encoding', 'A media object that encodes this CreativeWork. This property is a synonym for associatedMedia.'),
(827, 1, 5, 'countryOfOrigin', 'countryOfOrigin', 'The country of the principal offices of the production company or individual responsible for the movie or program.'),
(828, 1, 5, 'siblings', 'siblings', 'A sibling of the person.'),
(829, 1, 5, 'cvdFacilityCounty', 'cvdFacilityCounty', 'Name of the County of the NHSN facility that this data record applies to. Use <a class=\"localLink\" href=\"http://schema.org/cvdFacilityId\">cvdFacilityId</a> to identify the facility. To provide other details, <a class=\"localLink\" href=\"http://schema.org/healthcareReportingData\">healthcareReportingData</a> can be used on a <a class=\"localLink\" href=\"http://schema.org/Hospital\">Hospital</a> entry.'),
(830, 1, 5, 'sportsEvent', 'sportsEvent', 'A sub property of location. The sports event where this action occurred.'),
(831, 1, 5, 'isAccessibleForFree', 'isAccessibleForFree', 'A flag to signal that the item, event, or place is accessible for free.'),
(832, 1, 5, 'workPresented', 'workPresented', 'The movie presented during this event.'),
(833, 1, 5, 'distance', 'distance', 'The distance travelled, e.g. exercising or travelling.'),
(834, 1, 5, 'seasons', 'seasons', 'A season in a media series.'),
(835, 1, 5, 'geoCoveredBy', 'geoCoveredBy', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that covers it. As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(836, 1, 5, 'leaseLength', 'leaseLength', 'Length of the lease for some <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>, either particular to some <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> or in some cases intrinsic to the property.'),
(837, 1, 5, 'cvdNumC19MechVentPats', 'cvdNumC19MechVentPats', 'numc19mechventpats - HOSPITALIZED and VENTILATED: Patients hospitalized in an NHSN inpatient care location who have suspected or confirmed COVID-19 and are on a mechanical ventilator.'),
(838, 1, 5, 'season', 'season', 'A season in a media series.'),
(839, 1, 5, 'mapType', 'mapType', 'Indicates the kind of Map, from the MapCategoryType Enumeration.'),
(840, 1, 5, 'pregnancyWarning', 'pregnancyWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use during pregnancy.'),
(841, 1, 5, 'mainEntityOfPage', 'mainEntityOfPage', 'Indicates a page (or other CreativeWork) for which this thing is the main entity being described. See <a href=\"/docs/datamodel.html#mainEntityBackground\">background notes</a> for details.'),
(842, 1, 5, 'permitAudience', 'permitAudience', 'The target audience for this permit.'),
(843, 1, 5, 'tourBookingPage', 'tourBookingPage', 'A page providing information on how to book a tour of some <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a>, such as an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a> or <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a> in a real estate setting, as well as other kinds of tours as appropriate.'),
(844, 1, 5, 'playersOnline', 'playersOnline', 'Number of players on the server.'),
(845, 1, 5, 'paymentStatus', 'paymentStatus', 'The status of payment; whether the invoice has been paid or not.'),
(846, 1, 5, 'legislationIdentifier', 'legislationIdentifier', 'An identifier for the legislation. This can be either a string-based identifier, like the CELEX at EU level or the NOR in France, or a web-based, URL/URI identifier, like an ELI (European Legislation Identifier) or an URN-Lex.'),
(847, 1, 5, 'broadcastSignalModulation', 'broadcastSignalModulation', 'The modulation (e.g. FM, AM, etc) used by a particular broadcast service'),
(848, 1, 5, 'softwareHelp', 'softwareHelp', 'Software application help.'),
(849, 1, 5, 'dropoffLocation', 'dropoffLocation', 'Where a rental car can be dropped off.'),
(850, 1, 5, 'numberOfBedrooms', 'numberOfBedrooms', 'The total integer number of bedrooms in a some <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>, <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a> or <a class=\"localLink\" href=\"http://schema.org/FloorPlan\">FloorPlan</a>.'),
(851, 1, 5, 'publishingPrinciples', 'publishingPrinciples', 'The publishingPrinciples property indicates (typically via <a class=\"localLink\" href=\"http://schema.org/URL\">URL</a>) a document describing the editorial principles of an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> (or individual e.g. a <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a> writing a blog) that relate to their activities as a publisher, e.g. ethics or diversity policies. When applied to a <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a> (e.g. <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a>) the principles are those of the party primarily responsible for the creation of the <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>.<br/><br/>\n\nWhile such policies are most typically expressed in natural language, sometimes related information (e.g. indicating a <a class=\"localLink\" href=\"http://schema.org/funder\">funder</a>) can be expressed using schema.org terminology.'),
(852, 1, 5, 'freeShippingThreshold', 'freeShippingThreshold', 'A monetary value above which (or equal to) the shipping rate becomes free. Intended to be used via an <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a> with <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> matching this <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a>.'),
(853, 1, 5, 'sponsor', 'sponsor', 'A person or organization that supports a thing through a pledge, promise, or financial contribution. e.g. a sponsor of a Medical Study or a corporate sponsor of an event.'),
(854, 1, 5, 'workLocation', 'workLocation', 'A contact location for a person\'s place of work.'),
(855, 1, 5, 'serverStatus', 'serverStatus', 'Status of a game server.'),
(856, 1, 5, 'clinicalPharmacology', 'clinicalPharmacology', 'Description of the absorption and elimination of drugs, including their concentration (pharmacokinetics, pK) and biological effects (pharmacodynamics, pD).'),
(857, 1, 5, 'inker', 'inker', 'The individual who traces over the pencil drawings in ink after pencils are complete.'),
(858, 1, 5, 'orderQuantity', 'orderQuantity', 'The number of the item ordered. If the property is not set, assume the quantity is one.'),
(859, 1, 5, 'guidelineSubject', 'guidelineSubject', 'The medical conditions, treatments, etc. that are the subject of the guideline.'),
(860, 1, 5, 'numberOfAvailableAccommodationUnits', 'numberOfAvailableAccommodationUnits', 'Indicates the number of available accommodation units in an <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a>, or the number of accommodation units for a specific <a class=\"localLink\" href=\"http://schema.org/FloorPlan\">FloorPlan</a> (within its specific <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a>). See also <a class=\"localLink\" href=\"http://schema.org/numberOfAccommodationUnits\">numberOfAccommodationUnits</a>.'),
(861, 1, 5, 'speakable', 'speakable', 'Indicates sections of a Web page that are particularly \'speakable\' in the sense of being highlighted as being especially appropriate for text-to-speech conversion. Other sections of a page may also be usefully spoken in particular circumstances; the \'speakable\' property serves to indicate the parts most likely to be generally useful for speech.<br/><br/>\n\nThe <em>speakable</em> property can be repeated an arbitrary number of times, with three kinds of possible \'content-locator\' values:<br/><br/>\n\n1.) <em>id-value</em> URL references - uses <em>id-value</em> of an element in the page being annotated. The simplest use of <em>speakable</em> has (potentially relative) URL values, referencing identified sections of the document concerned.<br/><br/>\n\n2.) CSS Selectors - addresses content in the annotated page, eg. via class attribute. Use the <a class=\"localLink\" href=\"http://schema.org/cssSelector\">cssSelector</a> property.<br/><br/>\n\n3.)  XPaths - addresses content via XPaths (assuming an XML view of the content). Use the <a class=\"localLink\" href=\"http://schema.org/xpath\">xpath</a> property.<br/><br/>\n\nFor more sophisticated markup of speakable sections beyond simple ID references, either CSS selectors or XPath expressions to pick out document section(s) as speakable. For this\nwe define a supporting type, <a class=\"localLink\" href=\"http://schema.org/SpeakableSpecification\">SpeakableSpecification</a>  which is defined to be a possible value of the <em>speakable</em> property.'),
(862, 1, 5, 'toLocation', 'toLocation', 'A sub property of location. The final location of the object or the agent after the action.'),
(863, 1, 5, 'programmingLanguage', 'programmingLanguage', 'The computer programming language.'),
(864, 1, 5, 'recipient', 'recipient', 'A sub property of participant. The participant who is at the receiving end of the action.'),
(865, 1, 5, 'dosageForm', 'dosageForm', 'A dosage form in which this drug/supplement is available, e.g. \'tablet\', \'suspension\', \'injection\'.'),
(866, 1, 5, 'isrcCode', 'isrcCode', 'The International Standard Recording Code for the recording.'),
(867, 1, 5, 'availableOnDevice', 'availableOnDevice', 'Device required to run the application. Used in cases where a specific make/model is required to run the application.'),
(868, 1, 5, 'drainsTo', 'drainsTo', 'The vasculature that the vein drains into.'),
(869, 1, 5, 'rangeIncludes', 'rangeIncludes', 'Relates a property to a class that constitutes (one of) the expected type(s) for values of the property.'),
(870, 1, 5, 'starRating', 'starRating', 'An official rating for a lodging business or food establishment, e.g. from national associations or standards bodies. Use the author property to indicate the rating organization, e.g. as an Organization with name such as (e.g. HOTREC, DEHOGA, WHR, or Hotelstars).'),
(871, 1, 5, 'discussionUrl', 'discussionUrl', 'A link to the page containing the comments of the CreativeWork.'),
(872, 1, 5, 'printSection', 'printSection', 'If this NewsArticle appears in print, this field indicates the print section in which the article appeared.'),
(873, 1, 5, 'currentExchangeRate', 'currentExchangeRate', 'The current price of a currency.'),
(874, 1, 5, 'application', 'application', 'An application that can complete the request.'),
(875, 1, 5, 'isGift', 'isGift', 'Was the offer accepted as a gift for someone other than the buyer.'),
(876, 1, 5, 'hasDigitalDocumentPermission', 'hasDigitalDocumentPermission', 'A permission related to the access to this document (e.g. permission to read or write an electronic document). For a public document, specify a grantee with an Audience with audienceType equal to \"public\".'),
(877, 1, 5, 'price', 'price', 'The offer price of a product, or of a price component when attached to PriceSpecification and its subtypes.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use the <a class=\"localLink\" href=\"http://schema.org/priceCurrency\">priceCurrency</a> property (with standard formats: <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217 currency format</a> e.g. \"USD\"; <a href=\"https://en.wikipedia.org/wiki/List_of_cryptocurrencies\">Ticker symbol</a> for cryptocurrencies e.g. \"BTC\"; well known names for <a href=\"https://en.wikipedia.org/wiki/Local_exchange_trading_system\">Local Exchange Tradings Systems</a> (LETS) and other currency types e.g. \"Ithaca HOUR\") instead of including <a href=\"http://en.wikipedia.org/wiki/Dollar_sign#Currencies_that_use_the_dollar_or_peso_sign\">ambiguous symbols</a> such as \'$\' in the value.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n<li>Note that both <a href=\"http://www.w3.org/TR/xhtml-rdfa-primer/#using-the-content-attribute\">RDFa</a> and Microdata syntax allow the use of a \"content=\" attribute for publishing simple machine-readable values alongside more human-friendly formatting.</li>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n</ul>\n'),
(878, 1, 5, 'workload', 'workload', 'Quantitative measure of the physiologic output of the exercise; also referred to as energy expenditure.'),
(879, 1, 5, 'totalPaymentDue', 'totalPaymentDue', 'The total amount due.'),
(880, 1, 5, 'occupationalCredentialAwarded', 'occupationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other occupational credential awarded as a consequence of successful completion of this course or program.'),
(881, 1, 5, 'course', 'course', 'A sub property of location. The course where this action was taken.'),
(882, 1, 5, 'totalPrice', 'totalPrice', 'The total price for the reservation or ticket, including applicable taxes, shipping, etc.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(883, 1, 5, 'signOrSymptom', 'signOrSymptom', 'A sign or symptom of this condition. Signs are objective or physically observable manifestations of the medical condition while symptoms are the subjective experience of the medical condition.'),
(884, 1, 5, 'vehicleInteriorType', 'vehicleInteriorType', 'The type or material of the interior of the vehicle (e.g. synthetic fabric, leather, wood, etc.). While most interior types are characterized by the material used, an interior type can also be based on vehicle usage or target audience.'),
(885, 1, 5, 'title', 'title', 'The title of the job.'),
(886, 1, 5, 'recommendationStrength', 'recommendationStrength', 'Strength of the guideline\'s recommendation (e.g. \'class I\').');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(887, 1, 5, 'downPayment', 'downPayment', 'a type of payment made in cash during the onset of the purchase of an expensive good/service. The payment typically represents only a percentage of the full purchase price.'),
(888, 1, 5, 'healthPlanNetworkId', 'healthPlanNetworkId', 'Name or unique ID of network. (Networks are often reused across different insurance plans).'),
(889, 1, 5, 'calories', 'calories', 'The number of calories.'),
(890, 1, 5, 'vehicleConfiguration', 'vehicleConfiguration', 'A short text indicating the configuration of the vehicle, e.g. \'5dr hatchback ST 2.5 MT 225 hp\' or \'limited edition\'.'),
(891, 1, 5, 'alcoholWarning', 'alcoholWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of alcohol while taking this drug.'),
(892, 1, 5, 'postalCode', 'postalCode', 'The postal code. For example, 94043.'),
(893, 1, 5, 'minValue', 'minValue', 'The lower value of some characteristic or property.'),
(894, 1, 5, 'dataFeedElement', 'dataFeedElement', 'An item within in a data feed. Data feeds may have many elements.'),
(895, 1, 5, 'accountablePerson', 'accountablePerson', 'Specifies the Person that is legally accountable for the CreativeWork.'),
(896, 1, 5, 'targetPopulation', 'targetPopulation', 'Characteristics of the population for which this is intended, or which typically uses it, e.g. \'adults\'.'),
(897, 1, 5, 'offers', 'offers', 'An offer to provide this item&#x2014;for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a <a class=\"localLink\" href=\"http://schema.org/Demand\">Demand</a>. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.'),
(898, 1, 5, 'duringMedia', 'duringMedia', 'A media object representing the circumstances while performing this direction.'),
(899, 1, 5, 'deliveryLeadTime', 'deliveryLeadTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup.'),
(900, 1, 5, 'shippingDestination', 'shippingDestination', 'indicates (possibly multiple) shipping destinations. These can be defined in several ways e.g. postalCode ranges.'),
(901, 1, 5, 'itinerary', 'itinerary', 'Destination(s) ( <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a> ) that make up a trip. For a trip where destination order is important use <a class=\"localLink\" href=\"http://schema.org/ItemList\">ItemList</a> to specify that order (see examples).'),
(902, 1, 5, 'arterialBranch', 'arterialBranch', 'The branches that comprise the arterial structure.'),
(903, 1, 5, 'attendees', 'attendees', 'A person attending the event.'),
(904, 1, 5, 'equal', 'equal', 'This ordering relation for qualitative values indicates that the subject is equal to the object.'),
(905, 1, 5, 'broadcaster', 'broadcaster', 'The organization owning or operating the broadcast service.'),
(906, 1, 5, 'answerCount', 'answerCount', 'The number of answers this question has received.'),
(907, 1, 5, 'hasCourseInstance', 'hasCourseInstance', 'An offering of the course at a specific time and place or through specific media or mode of study or to a specific section of students.'),
(908, 1, 5, 'cvdNumVentUse', 'cvdNumVentUse', 'numventuse - MECHANICAL VENTILATORS IN USE: Total number of ventilators in use.'),
(909, 1, 5, 'colleagues', 'colleagues', 'A colleague of the person.'),
(910, 1, 5, 'securityClearanceRequirement', 'securityClearanceRequirement', 'A description of any security clearance requirements of the job.'),
(911, 1, 5, 'readBy', 'readBy', 'A person who reads (performs) the audiobook.'),
(912, 1, 5, 'discountCode', 'discountCode', 'Code used to redeem a discount.'),
(913, 1, 5, 'pickupLocation', 'pickupLocation', 'Where a taxi will pick up a passenger or a rental car can be picked up.'),
(914, 1, 5, 'competencyRequired', 'competencyRequired', 'Knowledge, skill, ability or personal attribute that must be demonstrated by a person or other entity.'),
(915, 1, 5, 'carrierRequirements', 'carrierRequirements', 'Specifies specific carrier(s) requirements for the application (e.g. an application may only work on a specific carrier network).'),
(916, 1, 5, 'relatedAnatomy', 'relatedAnatomy', 'Anatomical systems or structures that relate to the superficial anatomy.'),
(917, 1, 5, 'sampleType', 'sampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(918, 1, 5, 'lesser', 'lesser', 'This ordering relation for qualitative values indicates that the subject is lesser than the object.'),
(919, 1, 5, 'currency', 'currency', 'The currency in which the monetary amount is expressed.<br/><br/>\n\nUse standard formats: <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217 currency format</a> e.g. \"USD\"; <a href=\"https://en.wikipedia.org/wiki/List_of_cryptocurrencies\">Ticker symbol</a> for cryptocurrencies e.g. \"BTC\"; well known names for <a href=\"https://en.wikipedia.org/wiki/Local_exchange_trading_system\">Local Exchange Tradings Systems</a> (LETS) and other currency types e.g. \"Ithaca HOUR\".'),
(920, 1, 5, 'imagingTechnique', 'imagingTechnique', 'Imaging technique used.'),
(921, 1, 5, 'seatingCapacity', 'seatingCapacity', 'The number of persons that can be seated (e.g. in a vehicle), both in terms of the physical space available, and in terms of limitations set by law.<br/><br/>\n\nTypical unit code(s): C62 for persons'),
(922, 1, 5, 'study', 'study', 'A medical study or trial related to this entity.'),
(923, 1, 5, 'pathophysiology', 'pathophysiology', 'Changes in the normal mechanical, physical, and biochemical functions that are associated with this activity or condition.'),
(924, 1, 5, 'ingredients', 'ingredients', 'A single ingredient used in the recipe, e.g. sugar, flour or garlic.'),
(925, 1, 5, 'includedInDataCatalog', 'includedInDataCatalog', 'A data catalog which contains this dataset.'),
(926, 1, 5, 'game', 'game', 'Video game which is played on this server.'),
(927, 1, 5, 'contactPoints', 'contactPoints', 'A contact point for a person or organization.'),
(928, 1, 5, 'availableTest', 'availableTest', 'A diagnostic test or procedure offered by this lab.'),
(929, 1, 5, 'nutrition', 'nutrition', 'Nutrition information about the recipe or menu item.'),
(930, 1, 5, 'boardingPolicy', 'boardingPolicy', 'The type of boarding policy used by the airline (e.g. zone-based or group-based).'),
(931, 1, 5, 'reviewCount', 'reviewCount', 'The count of total number of reviews.'),
(932, 1, 5, 'recordLabel', 'recordLabel', 'The label that issued the release.'),
(933, 1, 5, 'contentSize', 'contentSize', 'File size in (mega/kilo) bytes.'),
(934, 1, 5, 'returnPolicyCategory', 'returnPolicyCategory', 'A returnPolicyCategory expresses at most one of several enumerated kinds of return.'),
(935, 1, 5, 'estimatedFlightDuration', 'estimatedFlightDuration', 'The estimated time the flight will take.'),
(936, 1, 5, 'startOffset', 'startOffset', 'The start time of the clip expressed as the number of seconds from the beginning of the work.'),
(937, 1, 5, 'publicAccess', 'publicAccess', 'A flag to signal that the <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a> is open to public visitors.  If this property is omitted there is no assumed default boolean value'),
(938, 1, 5, 'ownershipFundingInfo', 'ownershipFundingInfo', 'For an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> (often but not necessarily a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>), a description of organizational ownership structure; funding and grants. In a news/media setting, this is with particular reference to editorial independence.   Note that the <a class=\"localLink\" href=\"http://schema.org/funder\">funder</a> is also available and can be used to make basic funder information machine-readable.'),
(939, 1, 5, 'bodyType', 'bodyType', 'Indicates the design and body style of the vehicle (e.g. station wagon, hatchback, etc.).'),
(940, 1, 5, 'produces', 'produces', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(941, 1, 5, 'actors', 'actors', 'An actor, e.g. in tv, radio, movie, video games etc. Actors can be associated with individual items or with a series, episode, clip.'),
(942, 1, 5, 'lodgingUnitDescription', 'lodgingUnitDescription', 'A full description of the lodging unit.'),
(943, 1, 5, 'percentile25', 'percentile25', 'The 25th percentile value.'),
(944, 1, 5, 'estimatedSalary', 'estimatedSalary', 'An estimated salary for a job posting or occupation, based on a variety of variables including, but not limited to industry, job title, and location. Estimated salaries  are often computed by outside organizations rather than the hiring organization, who may not have committed to the estimated value.'),
(945, 1, 5, 'fuelType', 'fuelType', 'The type of fuel suitable for the engine or engines of the vehicle. If the vehicle has only one engine, this property can be attached directly to the vehicle.'),
(946, 1, 5, 'physiologicalBenefits', 'physiologicalBenefits', 'Specific physiologic benefits associated to the plan.'),
(947, 1, 5, 'programPrerequisites', 'programPrerequisites', 'Prerequisites for enrolling in the program.'),
(948, 1, 5, 'contactOption', 'contactOption', 'An option available on this contact point (e.g. a toll-free number or support for hearing-impaired callers).'),
(949, 1, 5, 'normalRange', 'normalRange', 'Range of acceptable values for a typical patient, when applicable.'),
(950, 1, 5, 'breadcrumb', 'breadcrumb', 'A set of links that can help a user understand and navigate a website hierarchy.'),
(951, 1, 5, 'workTranslation', 'workTranslation', 'A work that is a translation of the content of this work. e.g. 西遊記 has an English workTranslation “Journey to the West”,a German workTranslation “Monkeys Pilgerfahrt” and a Vietnamese  translation Tây du ký bình khảo.'),
(952, 1, 5, 'fileSize', 'fileSize', 'Size of the application / package (e.g. 18MB). In the absence of a unit (MB, KB etc.), KB will be assumed.'),
(953, 1, 5, 'value', 'value', 'The value of the quantitative value or property value node.<br/><br/>\n\n<ul>\n<li>For <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> and <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a>, the recommended type for values is \'Number\'.</li>\n<li>For <a class=\"localLink\" href=\"http://schema.org/PropertyValue\">PropertyValue</a>, it can be \'Text;\', \'Number\', \'Boolean\', or \'StructuredValue\'.</li>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(954, 1, 5, 'broadcastChannelId', 'broadcastChannelId', 'The unique address by which the BroadcastService can be identified in a provider lineup. In US, this is typically a number.'),
(955, 1, 5, 'free', 'free', 'A flag to signal that the item, event, or place is accessible for free.'),
(956, 1, 5, 'totalTime', 'totalTime', 'The total time required to perform instructions or a direction (including time to prepare the supplies), in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 duration format</a>.'),
(957, 1, 5, 'containedInPlace', 'containedInPlace', 'The basic containment relation between a place and one that contains it.'),
(958, 1, 5, 'bodyLocation', 'bodyLocation', 'Location in the body of the anatomical structure.'),
(959, 1, 5, 'branch', 'branch', 'The branches that delineate from the nerve bundle. Not to be confused with <a class=\"localLink\" href=\"http://schema.org/branchOf\">branchOf</a>.'),
(960, 1, 5, 'serviceOutput', 'serviceOutput', 'The tangible thing generated by the service, e.g. a passport, permit, etc.'),
(961, 1, 5, 'vatID', 'vatID', 'The Value-added Tax ID of the organization or person.'),
(962, 1, 5, 'containsPlace', 'containsPlace', 'The basic containment relation between a place and another that it contains.'),
(963, 1, 5, 'replyToUrl', 'replyToUrl', 'The URL at which a reply may be posted to the specified UserComment.'),
(964, 1, 5, 'medicalAudience', 'medicalAudience', 'Medical audience for page.'),
(965, 1, 5, 'rxcui', 'rxcui', 'The RxCUI drug identifier from RXNORM.'),
(966, 1, 5, 'parentItem', 'parentItem', 'The parent of a question, answer or item in general.'),
(967, 1, 5, 'honorificPrefix', 'honorificPrefix', 'An honorific prefix preceding a Person\'s name such as Dr/Mrs/Mr.'),
(968, 1, 5, 'hostingOrganization', 'hostingOrganization', 'The organization (airline, travelers\' club, etc.) the membership is made with.'),
(969, 1, 5, 'datePublished', 'datePublished', 'Date of first broadcast/publication.'),
(970, 1, 5, 'previousItem', 'previousItem', 'A link to the ListItem that preceeds the current one.'),
(971, 1, 5, 'nerve', 'nerve', 'The underlying innervation associated with the muscle.'),
(972, 1, 5, 'hasVariant', 'hasVariant', 'Indicates a <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a> that is a member of this <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a> (or <a class=\"localLink\" href=\"http://schema.org/ProductModel\">ProductModel</a>).'),
(973, 1, 5, 'itemReviewed', 'itemReviewed', 'The item that is being reviewed/rated.'),
(974, 1, 5, 'temporal', 'temporal', 'The \"temporal\" property can be used in cases where more specific properties\n(e.g. <a class=\"localLink\" href=\"http://schema.org/temporalCoverage\">temporalCoverage</a>, <a class=\"localLink\" href=\"http://schema.org/dateCreated\">dateCreated</a>, <a class=\"localLink\" href=\"http://schema.org/dateModified\">dateModified</a>, <a class=\"localLink\" href=\"http://schema.org/datePublished\">datePublished</a>) are not known to be appropriate.'),
(975, 1, 5, 'healthPlanId', 'healthPlanId', 'The 14-character, HIOS-generated Plan ID number. (Plan IDs must be unique, even across different markets.)'),
(976, 1, 5, 'polygon', 'polygon', 'A polygon is the area enclosed by a point-to-point path for which the starting and ending points are the same. A polygon is expressed as a series of four or more space delimited points where the first and final points are identical.'),
(977, 1, 5, 'object', 'object', 'The object upon which the action is carried out, whose state is kept intact or changed. Also known as the semantic roles patient, affected or undergoer (which change their state) or theme (which doesn\'t). e.g. John read <em>a book</em>.'),
(978, 1, 5, 'postalCodeRange', 'postalCodeRange', 'A defined range of postal codes.'),
(979, 1, 5, 'dateline', 'dateline', 'A <a href=\"https://en.wikipedia.org/wiki/Dateline\">dateline</a> is a brief piece of text included in news articles that describes where and when the story was written or filed though the date is often omitted. Sometimes only a placename is provided.<br/><br/>\n\nStructured representations of dateline-related information can also be expressed more explicitly using <a class=\"localLink\" href=\"http://schema.org/locationCreated\">locationCreated</a> (which represents where a work was created e.g. where a news report was written).  For location depicted or described in the content, use <a class=\"localLink\" href=\"http://schema.org/contentLocation\">contentLocation</a>.<br/><br/>\n\nDateline summaries are oriented more towards human readers than towards automated processing, and can vary substantially. Some examples: \"BEIRUT, Lebanon, June 2.\", \"Paris, France\", \"December 19, 2017 11:43AM Reporting from Washington\", \"Beijing/Moscow\", \"QUEZON CITY, Philippines\".'),
(980, 1, 5, 'adverseOutcome', 'adverseOutcome', 'A possible complication and/or side effect of this therapy. If it is known that an adverse outcome is serious (resulting in death, disability, or permanent damage; requiring hospitalization; or is otherwise life-threatening or requires immediate medical attention), tag it as a seriouseAdverseOutcome instead.'),
(981, 1, 5, 'creativeWorkStatus', 'creativeWorkStatus', 'The status of a creative work in terms of its stage in a lifecycle. Example terms include Incomplete, Draft, Published, Obsolete. Some organizations define a set of terms for the stages of their publication lifecycle.'),
(982, 1, 5, 'documentation', 'documentation', 'Further documentation describing the Web API in more detail.'),
(983, 1, 5, 'educationalRole', 'educationalRole', 'An educationalRole of an EducationalAudience.'),
(984, 1, 5, 'accessibilityControl', 'accessibilityControl', 'Identifies input methods that are sufficient to fully control the described resource (<a href=\"http://www.w3.org/wiki/WebSchemas/Accessibility\">WebSchemas wiki lists possible values</a>).'),
(985, 1, 5, 'nationality', 'nationality', 'Nationality of the person.'),
(986, 1, 5, 'sourceOrganization', 'sourceOrganization', 'The Organization on whose behalf the creator was working.'),
(987, 1, 5, 'isPlanForApartment', 'isPlanForApartment', 'Indicates some accommodation that this floor plan describes.'),
(988, 1, 5, 'diversityStaffingReport', 'diversityStaffingReport', 'For an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> (often but not necessarily a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>), a report on staffing diversity issues. In a news context this might be for example ASNE or RTDNA (US) reports, or self-reported.'),
(989, 1, 5, 'highPrice', 'highPrice', 'The highest price of all offers available.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(990, 1, 5, 'reservationStatus', 'reservationStatus', 'The current status of the reservation.'),
(991, 1, 5, 'cvdNumTotBeds', 'cvdNumTotBeds', 'numtotbeds - ALL HOSPITAL BEDS: Total number of all Inpatient and outpatient beds, including all staffed,ICU, licensed, and overflow (surge) beds used for inpatients or outpatients.'),
(992, 1, 5, 'relevantSpecialty', 'relevantSpecialty', 'If applicable, a medical specialty in which this entity is relevant.'),
(993, 1, 5, 'availableChannel', 'availableChannel', 'A means of accessing the service (e.g. a phone bank, a web site, a location, etc.).'),
(994, 1, 5, 'potentialAction', 'potentialAction', 'Indicates a potential Action, which describes an idealized action in which this thing would play an \'object\' role.'),
(995, 1, 5, 'broadcastSubChannel', 'broadcastSubChannel', 'The subchannel used for the broadcast.'),
(996, 1, 5, 'occupancy', 'occupancy', 'The allowed total occupancy for the accommodation in persons (including infants etc). For individual accommodations, this is not necessarily the legal maximum but defines the permitted usage as per the contractual agreement (e.g. a double room used by a single person).\nTypical unit code(s): C62 for person'),
(997, 1, 5, 'availableDeliveryMethod', 'availableDeliveryMethod', 'The delivery method(s) available for this offer.'),
(998, 1, 5, 'slogan', 'slogan', 'A slogan or motto associated with the item.'),
(999, 1, 5, 'logo', 'logo', 'An associated logo.'),
(1000, 1, 5, 'domainIncludes', 'domainIncludes', 'Relates a property to a class that is (one of) the type(s) the property is expected to be used on.'),
(1001, 1, 5, 'publicationType', 'publicationType', 'The type of the medical article, taken from the US NLM MeSH publication type catalog. See also <a href=\"http://www.nlm.nih.gov/mesh/pubtypes.html\">MeSH documentation</a>.'),
(1002, 1, 5, 'subTrip', 'subTrip', 'Identifies a <a class=\"localLink\" href=\"http://schema.org/Trip\">Trip</a> that is a subTrip of this Trip.  For example Day 1, Day 2, etc. of a multi-day trip.'),
(1003, 1, 5, 'deliveryAddress', 'deliveryAddress', 'Destination address.'),
(1004, 1, 5, 'relatedTo', 'relatedTo', 'The most generic familial relation.'),
(1005, 1, 5, 'warrantyScope', 'warrantyScope', 'The scope of the warranty promise.'),
(1006, 1, 5, 'editEIDR', 'editEIDR', 'An <a href=\"https://eidr.org/\">EIDR</a> (Entertainment Identifier Registry) <a class=\"localLink\" href=\"http://schema.org/identifier\">identifier</a> representing a specific edit / edition for a work of film or television.<br/><br/>\n\nFor example, the motion picture known as \"Ghostbusters\" whose <a class=\"localLink\" href=\"http://schema.org/titleEIDR\">titleEIDR</a> is \"10.5240/7EC7-228A-510A-053E-CBB8-J\", has several edits e.g. \"10.5240/1F2A-E1C5-680A-14C6-E76B-I\" and \"10.5240/8A35-3BEE-6497-5D12-9E4F-3\".<br/><br/>\n\nSince schema.org types like <a class=\"localLink\" href=\"http://schema.org/Movie\">Movie</a> and <a class=\"localLink\" href=\"http://schema.org/TVEpisode\">TVEpisode</a> can be used for both works and their multiple expressions, it is possible to use <a class=\"localLink\" href=\"http://schema.org/titleEIDR\">titleEIDR</a> alone (for a general description), or alongside <a class=\"localLink\" href=\"http://schema.org/editEIDR\">editEIDR</a> for a more edit-specific description.'),
(1007, 1, 5, 'salaryCurrency', 'salaryCurrency', 'The currency (coded using <a href=\"http://en.wikipedia.org/wiki/ISO_4217\">ISO 4217</a> ) used for the main salary information in this job posting or for this employee.'),
(1008, 1, 5, 'ethicsPolicy', 'ethicsPolicy', 'Statement about ethics policy, e.g. of a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a> regarding journalistic and publishing practices, or of a <a class=\"localLink\" href=\"http://schema.org/Restaurant\">Restaurant</a>, a page describing food source policies. In the case of a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>, an ethicsPolicy is typically a statement describing the personal, organizational, and corporate standards of behavior expected by the organization.'),
(1009, 1, 5, 'primaryImageOfPage', 'primaryImageOfPage', 'Indicates the main image on the page.'),
(1010, 1, 5, 'contentReferenceTime', 'contentReferenceTime', 'The specific time described by a creative work, for works (e.g. articles, video objects etc.) that emphasise a particular moment within an Event.'),
(1011, 1, 5, 'secondaryPrevention', 'secondaryPrevention', 'A preventative therapy used to prevent reoccurrence of the medical condition after an initial episode of the condition.'),
(1012, 1, 5, 'phoneticText', 'phoneticText', 'Representation of a text <a class=\"localLink\" href=\"http://schema.org/textValue\">textValue</a> using the specified <a class=\"localLink\" href=\"http://schema.org/speechToTextMarkup\">speechToTextMarkup</a>. For example the city name of Houston in IPA: /ˈhjuːstən/.'),
(1013, 1, 5, 'postOfficeBoxNumber', 'postOfficeBoxNumber', 'The post office box number for PO box addresses.'),
(1014, 1, 5, 'homeTeam', 'homeTeam', 'The home team in a sports event.'),
(1015, 1, 5, 'model', 'model', 'The model of the product. Use with the URL of a ProductModel or a textual representation of the model identifier. The URL of the ProductModel can be from an external source. It is recommended to additionally provide strong product identifiers via the gtin8/gtin13/gtin14 and mpn properties.'),
(1016, 1, 5, 'award', 'award', 'An award won by or for this item.'),
(1017, 1, 5, 'byMonth', 'byMonth', 'Defines the month(s) of the year on which a recurring <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> takes place. Specified as an <a class=\"localLink\" href=\"http://schema.org/Integer\">Integer</a> between 1-12. January is 1.'),
(1018, 1, 5, 'yield', 'yield', 'The quantity that results by performing instructions. For example, a paper airplane, 10 personalized candles.'),
(1019, 1, 5, 'videoFormat', 'videoFormat', 'The type of screening or video broadcast used (e.g. IMAX, 3D, SD, HD, etc.).'),
(1020, 1, 5, 'serviceUrl', 'serviceUrl', 'The website to access the service.'),
(1021, 1, 5, 'valuePattern', 'valuePattern', 'Specifies a regular expression for testing literal values according to the HTML spec.'),
(1022, 1, 5, 'sensoryUnit', 'sensoryUnit', 'The neurological pathway extension that inputs and sends information to the brain or spinal cord.'),
(1023, 1, 5, 'sibling', 'sibling', 'A sibling of the person.'),
(1024, 1, 5, 'recipeCuisine', 'recipeCuisine', 'The cuisine of the recipe (for example, French or Ethiopian).'),
(1025, 1, 5, 'typicalTest', 'typicalTest', 'A medical test typically performed given this condition.'),
(1026, 1, 5, 'encodings', 'encodings', 'A media object that encodes this CreativeWork.'),
(1027, 1, 5, 'releaseNotes', 'releaseNotes', 'Description of what changed in this version.'),
(1028, 1, 5, 'unitCode', 'unitCode', 'The unit of measurement given using the UN/CEFACT Common Code (3 characters) or a URL. Other codes than the UN/CEFACT Common Code may be used with a prefix followed by a colon.'),
(1029, 1, 5, 'applicantLocationRequirements', 'applicantLocationRequirements', 'The location(s) applicants can apply from. This is usually used for telecommuting jobs where the applicant does not need to be in a physical office. Note: This should not be used for citizenship or work visa requirements.'),
(1030, 1, 5, 'workFeatured', 'workFeatured', 'A work featured in some event, e.g. exhibited in an ExhibitionEvent.\n       Specific subproperties are available for workPerformed (e.g. a play), or a workPresented (a Movie at a ScreeningEvent).'),
(1031, 1, 5, 'repetitions', 'repetitions', 'Number of times one should repeat the activity.'),
(1032, 1, 5, 'broker', 'broker', 'An entity that arranges for an exchange between a buyer and a seller.  In most cases a broker never acquires or releases ownership of a product or service involved in an exchange.  If it is not clear whether an entity is a broker, seller, or buyer, the latter two terms are preferred.'),
(1033, 1, 5, 'estimatedCost', 'estimatedCost', 'The estimated cost of the supply or supplies consumed when performing instructions.'),
(1034, 1, 5, 'variantCover', 'variantCover', 'A description of the variant cover\n        for the issue, if the issue is a variant printing. For example, \"Bryan Hitch\n        Variant Cover\" or \"2nd Printing Variant\".'),
(1035, 1, 5, 'trainNumber', 'trainNumber', 'The unique identifier for the train.'),
(1036, 1, 5, 'requiredMinAge', 'requiredMinAge', 'Audiences defined by a person\'s minimum age.'),
(1037, 1, 5, 'fuelCapacity', 'fuelCapacity', 'The capacity of the fuel tank or in the case of electric cars, the battery. If there are multiple components for storage, this should indicate the total of all storage of the same type.<br/><br/>\n\nTypical unit code(s): LTR for liters, GLL of US gallons, GLI for UK / imperial gallons, AMH for ampere-hours (for electrical vehicles).'),
(1038, 1, 5, 'reviewAspect', 'reviewAspect', 'This Review or Rating is relevant to this part or facet of the itemReviewed.'),
(1039, 1, 5, 'fatContent', 'fatContent', 'The number of grams of fat.'),
(1040, 1, 5, 'departureTerminal', 'departureTerminal', 'Identifier of the flight\'s departure terminal.'),
(1041, 1, 5, 'printColumn', 'printColumn', 'The number of the column in which the NewsArticle appears in the print edition.'),
(1042, 1, 5, 'availableService', 'availableService', 'A medical service available from this provider.'),
(1043, 1, 5, 'floorLevel', 'floorLevel', 'The floor level for an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a> in a multi-storey building. Since counting\n  systems <a href=\"https://en.wikipedia.org/wiki/Storey#Consecutive_number_floor_designations\">vary internationally</a>, the local system should be used where possible.'),
(1044, 1, 5, 'maxValue', 'maxValue', 'The upper value of some characteristic or property.'),
(1045, 1, 5, 'query', 'query', 'A sub property of instrument. The query used on this action.'),
(1046, 1, 5, 'paymentAccepted', 'paymentAccepted', 'Cash, Credit Card, Cryptocurrency, Local Exchange Tradings System, etc.'),
(1047, 1, 5, 'gtin12', 'gtin12', 'The GTIN-12 code of the product, or the product to which the offer refers. The GTIN-12 is the 12-digit GS1 Identification Key composed of a U.P.C. Company Prefix, Item Reference, and Check Digit used to identify trade items. See <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GS1 GTIN Summary</a> for more details.'),
(1048, 1, 5, 'eligibleCustomerType', 'eligibleCustomerType', 'The type(s) of customers for which the given offer is valid.'),
(1049, 1, 5, 'serviceLocation', 'serviceLocation', 'The location (e.g. civic structure, local business, etc.) where a person can go to access the service.'),
(1050, 1, 5, 'processingTime', 'processingTime', 'Estimated processing time for the service using this channel.'),
(1051, 1, 5, 'relevantOccupation', 'relevantOccupation', 'The Occupation for the JobPosting.'),
(1052, 1, 5, 'parents', 'parents', 'A parents of the person.'),
(1053, 1, 5, 'nonProprietaryName', 'nonProprietaryName', 'The generic name of this drug or supplement.'),
(1054, 1, 5, 'offeredBy', 'offeredBy', 'A pointer to the organization or person making the offer.'),
(1055, 1, 5, 'totalJobOpenings', 'totalJobOpenings', 'The number of positions open for this job posting. Use a positive integer. Do not use if the number of positions is unclear or not known.'),
(1056, 1, 5, 'geoDisjoint', 'geoDisjoint', 'Represents spatial relations in which two geometries (or the places they represent) are topologically disjoint: they have no point in common. They form a set of disconnected geometries.\" (a symmetric relationship, as defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>)'),
(1057, 1, 5, 'applicationDeadline', 'applicationDeadline', 'The date at which the program stops collecting applications for the next enrollment cycle.'),
(1058, 1, 5, 'maximumIntake', 'maximumIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(1059, 1, 5, 'providesService', 'providesService', 'The service provided by this channel.'),
(1060, 1, 5, 'orderDelivery', 'orderDelivery', 'The delivery of the parcel related to this order or order item.'),
(1061, 1, 5, 'ticketNumber', 'ticketNumber', 'The unique identifier for the ticket.'),
(1062, 1, 5, 'contactlessPayment', 'contactlessPayment', 'A secure method for consumers to purchase products or services via debit, credit or smartcards by using RFID or NFC technology.'),
(1063, 1, 5, 'significantLinks', 'significantLinks', 'The most significant URLs on the page. Typically, these are the non-navigation links that are clicked on the most.'),
(1064, 1, 5, 'valueReference', 'valueReference', 'A pointer to a secondary value that provides additional information on the original value, e.g. a reference temperature.'),
(1065, 1, 5, 'orderNumber', 'orderNumber', 'The identifier of the transaction.'),
(1066, 1, 5, 'studySubject', 'studySubject', 'A subject of the study, i.e. one of the medical conditions, therapies, devices, drugs, etc. investigated by the study.'),
(1067, 1, 5, 'releaseOf', 'releaseOf', 'The album this is a release of.'),
(1068, 1, 5, 'legislationDateVersion', 'legislationDateVersion', 'The point-in-time at which the provided description of the legislation is valid (e.g. : when looking at the law on the 2016-04-07 (= dateVersion), I get the consolidation of 2015-04-12 of the \"National Insurance Contributions Act 2015\")'),
(1069, 1, 5, 'gracePeriod', 'gracePeriod', 'The period of time after any due date that the borrower has to fulfil its obligations before a default (failure to pay) is deemed to have occurred.'),
(1070, 1, 5, 'validThrough', 'validThrough', 'The date after when the item is not valid. For example the end of an offer, salary period, or a period of opening hours.'),
(1071, 1, 5, 'letterer', 'letterer', 'The individual who adds lettering, including speech balloons and sound effects, to artwork.'),
(1072, 1, 5, 'foodEvent', 'foodEvent', 'A sub property of location. The specific food event where the action occurred.'),
(1073, 1, 5, 'requiredGender', 'requiredGender', 'Audiences defined by a person\'s gender.'),
(1074, 1, 5, 'byArtist', 'byArtist', 'The artist that performed this album or recording.'),
(1075, 1, 5, 'accommodationCategory', 'accommodationCategory', 'Category of an <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>, following real estate conventions e.g. RESO (see <a href=\"https://ddwiki.reso.org/display/DDW17/PropertySubType+Field\">PropertySubType</a>, and <a href=\"https://ddwiki.reso.org/display/DDW17/PropertyType+Field\">PropertyType</a> fields  for suggested values).'),
(1076, 1, 5, 'openingHours', 'openingHours', 'The general opening hours for a business. Opening hours can be specified as a weekly time range, starting with days, then times per day. Multiple days can be listed with commas \',\' separating each day. Day or time ranges are specified using a hyphen \'-\'.<br/><br/>\n\n<ul>\n<li>Days are specified using the following two-letter combinations: <code>Mo</code>, <code>Tu</code>, <code>We</code>, <code>Th</code>, <code>Fr</code>, <code>Sa</code>, <code>Su</code>.</li>\n<li>Times are specified using 24:00 time. For example, 3pm is specified as <code>15:00</code>. </li>\n<li>Here is an example: <code>&lt;time itemprop=\"openingHours\" datetime=&quot;Tu,Th 16:00-20:00&quot;&gt;Tuesdays and Thursdays 4-8pm&lt;/time&gt;</code>.</li>\n<li>If a business is open 7 days a week, then it can be specified as <code>&lt;time itemprop=&quot;openingHours&quot; datetime=&quot;Mo-Su&quot;&gt;Monday through Sunday, all day&lt;/time&gt;</code>.</li>\n</ul>\n'),
(1077, 1, 5, 'dropoffTime', 'dropoffTime', 'When a rental car can be dropped off.'),
(1078, 1, 5, 'proficiencyLevel', 'proficiencyLevel', 'Proficiency needed for this content; expected values: \'Beginner\', \'Expert\'.'),
(1079, 1, 5, 'gender', 'gender', 'Gender of something, typically a <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a>, but possibly also fictional characters, animals, etc. While http://schema.org/Male and http://schema.org/Female may be used, text strings are also acceptable for people who do not identify as a binary gender. The <a class=\"localLink\" href=\"http://schema.org/gender\">gender</a> property can also be used in an extended sense to cover e.g. the gender of sports teams. As with the gender of individuals, we do not try to enumerate all possibilities. A mixed-gender <a class=\"localLink\" href=\"http://schema.org/SportsTeam\">SportsTeam</a> can be indicated with a text value of \"Mixed\".'),
(1080, 1, 5, 'directors', 'directors', 'A director of e.g. tv, radio, movie, video games etc. content. Directors can be associated with individual items or with a series, episode, clip.'),
(1081, 1, 5, 'maximumPhysicalAttendeeCapacity', 'maximumPhysicalAttendeeCapacity', 'The maximum physical attendee capacity of an <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> whose <a class=\"localLink\" href=\"http://schema.org/eventAttendanceMode\">eventAttendanceMode</a> is <a class=\"localLink\" href=\"http://schema.org/OfflineEventAttendanceMode\">OfflineEventAttendanceMode</a> (or the offline aspects, in the case of a <a class=\"localLink\" href=\"http://schema.org/MixedEventAttendanceMode\">MixedEventAttendanceMode</a>).'),
(1082, 1, 5, 'passengerPriorityStatus', 'passengerPriorityStatus', 'The priority status assigned to a passenger for security or boarding (e.g. FastTrack or Priority).'),
(1083, 1, 5, 'knownVehicleDamages', 'knownVehicleDamages', 'A textual description of known damages, both repaired and unrepaired.'),
(1084, 1, 5, 'loser', 'loser', 'A sub property of participant. The loser of the action.'),
(1085, 1, 5, 'healthCondition', 'healthCondition', 'Specifying the health condition(s) of a patient, medical study, or other target audience.'),
(1086, 1, 5, 'taxID', 'taxID', 'The Tax / Fiscal ID of the organization or person, e.g. the TIN in the US or the CIF/NIF in Spain.'),
(1087, 1, 5, 'annualPercentageRate', 'annualPercentageRate', 'The annual rate that is charged for borrowing (or made by investing), expressed as a single percentage number that represents the actual yearly cost of funds over the term of a loan. This includes any fees or additional costs associated with the transaction.'),
(1088, 1, 5, 'cvdCollectionDate', 'cvdCollectionDate', 'collectiondate - Date for which patient counts are reported.'),
(1089, 1, 5, 'warning', 'warning', 'Any FDA or other warnings about the drug (text or URL).'),
(1090, 1, 5, 'target', 'target', 'Indicates a target EntryPoint for an Action.'),
(1091, 1, 5, 'artist', 'artist', 'The primary artist for a work\n        in a medium other than pencils or digital line art--for example, if the\n        primary artwork is done in watercolors or digital paints.'),
(1092, 1, 5, 'offersPrescriptionByMail', 'offersPrescriptionByMail', 'Whether prescriptions can be delivered by mail.'),
(1093, 1, 5, 'birthPlace', 'birthPlace', 'The place where the person was born.'),
(1094, 1, 5, 'exerciseCourse', 'exerciseCourse', 'A sub property of location. The course where this action was taken.'),
(1095, 1, 5, 'awayTeam', 'awayTeam', 'The away team in a sports event.'),
(1096, 1, 5, 'unsaturatedFatContent', 'unsaturatedFatContent', 'The number of grams of unsaturated fat.'),
(1097, 1, 5, 'industry', 'industry', 'The industry associated with the job position.'),
(1098, 1, 5, 'processorRequirements', 'processorRequirements', 'Processor architecture required to run the application (e.g. IA64).'),
(1099, 1, 5, 'codeSampleType', 'codeSampleType', 'What type of code sample: full (compile ready) solution, code snippet, inline code, scripts, template.'),
(1100, 1, 5, 'reservationId', 'reservationId', 'A unique identifier for the reservation.'),
(1101, 1, 5, 'seeks', 'seeks', 'A pointer to products or services sought by the organization or person (demand).'),
(1102, 1, 5, 'renegotiableLoan', 'renegotiableLoan', 'Whether the terms for payment of interest can be renegotiated during the life of the loan.'),
(1103, 1, 5, 'mileageFromOdometer', 'mileageFromOdometer', 'The total distance travelled by the particular vehicle since its initial production, as read from its odometer.<br/><br/>\n\nTypical unit code(s): KMT for kilometers, SMI for statute miles'),
(1104, 1, 5, 'mainEntity', 'mainEntity', 'Indicates the primary entity described in some page or other CreativeWork.'),
(1105, 1, 5, 'targetProduct', 'targetProduct', 'Target Operating System / Product to which the code applies.  If applies to several versions, just the product name can be used.'),
(1106, 1, 5, 'merchantReturnDays', 'merchantReturnDays', 'The merchantReturnDays property indicates the number of days (from purchase) within which relevant merchant return policy is applicable.'),
(1107, 1, 5, 'lowPrice', 'lowPrice', 'The lowest price of all offers available.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(1108, 1, 5, 'regionsAllowed', 'regionsAllowed', 'The regions where the media is allowed. If not specified, then it\'s assumed to be allowed everywhere. Specify the countries in <a href=\"http://en.wikipedia.org/wiki/ISO_3166\">ISO 3166 format</a>.'),
(1109, 1, 5, 'dateVehicleFirstRegistered', 'dateVehicleFirstRegistered', 'The date of the first registration of the vehicle with the respective public authorities.'),
(1110, 1, 5, 'cvdNumC19Died', 'cvdNumC19Died', 'numc19died - DEATHS: Patients with suspected or confirmed COVID-19 who died in the hospital, ED, or any overflow location.'),
(1111, 1, 5, 'eligibilityToWorkRequirement', 'eligibilityToWorkRequirement', 'The legal requirements such as citizenship, visa and other documentation required for an applicant to this job.'),
(1112, 1, 5, 'description', 'description', 'A description of the item.'),
(1113, 1, 5, 'supply', 'supply', 'A sub-property of instrument. A supply consumed when performing instructions or a direction.'),
(1114, 1, 5, 'hasMenu', 'hasMenu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(1115, 1, 5, 'flightNumber', 'flightNumber', 'The unique identifier for a flight including the airline IATA code. For example, if describing United flight 110, where the IATA code for United is \'UA\', the flightNumber is \'UA110\'.'),
(1116, 1, 5, 'maximumAttendeeCapacity', 'maximumAttendeeCapacity', 'The total number of individuals that may attend an event or venue.'),
(1117, 1, 5, 'educationalCredentialAwarded', 'educationalCredentialAwarded', 'A description of the qualification, award, certificate, diploma or other educational credential awarded as a consequence of successful completion of this course or program.'),
(1118, 1, 5, 'cvdNumICUBedsOcc', 'cvdNumICUBedsOcc', 'numicubedsocc - ICU BED OCCUPANCY: Total number of staffed inpatient ICU beds that are occupied.'),
(1119, 1, 5, 'suggestedGender', 'suggestedGender', 'The gender of the person or audience.'),
(1120, 1, 5, 'vehicleSeatingCapacity', 'vehicleSeatingCapacity', 'The number of passengers that can be seated in the vehicle, both in terms of the physical space available, and in terms of limitations set by law.<br/><br/>\n\nTypical unit code(s): C62 for persons.'),
(1121, 1, 5, 'dayOfWeek', 'dayOfWeek', 'The day of the week for which these opening hours are valid.'),
(1122, 1, 5, 'name', 'name', 'The name of the item.'),
(1123, 1, 5, 'videoQuality', 'videoQuality', 'The quality of the video.'),
(1124, 1, 5, 'salaryUponCompletion', 'salaryUponCompletion', 'The expected salary upon completing the training.'),
(1125, 1, 5, 'isBasedOn', 'isBasedOn', 'A resource from which this work is derived or from which it is a modification or adaption.'),
(1126, 1, 5, 'copyrightHolder', 'copyrightHolder', 'The party holding the legal copyright to the CreativeWork.'),
(1127, 1, 5, 'lender', 'lender', 'A sub property of participant. The person that lends the object being borrowed.'),
(1128, 1, 5, 'acrissCode', 'acrissCode', 'The ACRISS Car Classification Code is a code used by many car rental companies, for classifying vehicles. ACRISS stands for Association of Car Rental Industry Systems and Standards.'),
(1129, 1, 5, 'codeRepository', 'codeRepository', 'Link to the repository where the un-compiled, human readable code and related code is located (SVN, github, CodePlex).'),
(1130, 1, 5, 'numberOfAccommodationUnits', 'numberOfAccommodationUnits', 'Indicates the total (available plus unavailable) number of accommodation units in an <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a>, or the number of accommodation units for a specific <a class=\"localLink\" href=\"http://schema.org/FloorPlan\">FloorPlan</a> (within its specific <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a>). See also <a class=\"localLink\" href=\"http://schema.org/numberOfAvailableAccommodationUnits\">numberOfAvailableAccommodationUnits</a>.'),
(1131, 1, 5, 'headline', 'headline', 'Headline of the article.'),
(1132, 1, 5, 'unnamedSourcesPolicy', 'unnamedSourcesPolicy', 'For an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> (typically a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>), a statement about policy on use of unnamed sources and the decision process required.'),
(1133, 1, 5, 'dependencies', 'dependencies', 'Prerequisites needed to fulfill steps in article.'),
(1134, 1, 5, 'teaches', 'teaches', 'The item being described is intended to help a person learn the competency or learning outcome defined by the referenced term.'),
(1135, 1, 5, 'purchaseDate', 'purchaseDate', 'The date the item e.g. vehicle was purchased by the current owner.'),
(1136, 1, 5, 'shippingLabel', 'shippingLabel', 'Label to match an <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a> with a <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a> (within the context of a <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> cross-reference).'),
(1137, 1, 5, 'geoMidpoint', 'geoMidpoint', 'Indicates the GeoCoordinates at the centre of a GeoShape e.g. GeoCircle.'),
(1138, 1, 5, 'comprisedOf', 'comprisedOf', 'Specifying something physically contained by something else. Typically used here for the underlying anatomical structures, such as organs, that comprise the anatomical system.'),
(1139, 1, 5, 'eventSchedule', 'eventSchedule', 'Associates an <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> with a <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a>. There are circumstances where it is preferable to share a schedule for a series of\n      repeating events rather than data on the individual events themselves. For example, a website or application might prefer to publish a schedule for a weekly\n      gym class rather than provide data on every event. A schedule could be processed by applications to add forthcoming events to a calendar. An <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> that\n      is associated with a <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a> using this property should not have <a class=\"localLink\" href=\"http://schema.org/startDate\">startDate</a> or <a class=\"localLink\" href=\"http://schema.org/endDate\">endDate</a> properties. These are instead defined within the associated\n      <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a>, this avoids any ambiguity for clients using the data. The property might have repeated values to specify different schedules, e.g. for different months\n      or seasons.'),
(1140, 1, 5, 'nsn', 'nsn', 'Indicates the <a href=\"https://en.wikipedia.org/wiki/NATO_Stock_Number\">NATO stock number</a> (nsn) of a <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a>.'),
(1141, 1, 5, 'validFor', 'validFor', 'The duration of validity of a permit or similar thing.'),
(1142, 1, 5, 'box', 'box', 'A box is the area enclosed by the rectangle formed by two points. The first point is the lower corner, the second point is the upper corner. A box is expressed as two points separated by a space character.'),
(1143, 1, 5, 'buyer', 'buyer', 'A sub property of participant. The participant/person/organization that bought the object.'),
(1144, 1, 5, 'workPerformed', 'workPerformed', 'A work performed in some event, for example a play performed in a TheaterEvent.'),
(1145, 1, 5, 'flightDistance', 'flightDistance', 'The distance of the flight.'),
(1146, 1, 5, 'dateCreated', 'dateCreated', 'The date on which the CreativeWork was created or the item was added to a DataFeed.'),
(1147, 1, 5, 'vehicleTransmission', 'vehicleTransmission', 'The type of component used for transmitting the power from a rotating power source to the wheels or other relevant component(s) (\"gearbox\" for cars).'),
(1148, 1, 5, 'error', 'error', 'For failed actions, more information on the cause of the failure.'),
(1149, 1, 5, 'validIn', 'validIn', 'The geographic area where a permit or similar thing is valid.'),
(1150, 1, 5, 'orderItemNumber', 'orderItemNumber', 'The identifier of the order item.'),
(1151, 1, 5, 'defaultValue', 'defaultValue', 'The default value of the input.  For properties that expect a literal, the default is a literal value, for properties that expect an object, it\'s an ID reference to one of the current values.'),
(1152, 1, 5, 'landlord', 'landlord', 'A sub property of participant. The owner of the real estate property.'),
(1153, 1, 5, 'catalogNumber', 'catalogNumber', 'The catalog number for the release.'),
(1154, 1, 5, 'trainingSalary', 'trainingSalary', 'The estimated salary earned while in the program.'),
(1155, 1, 5, 'license', 'license', 'A license document that applies to this content, typically indicated by URL.'),
(1156, 1, 5, 'bookingTime', 'bookingTime', 'The date and time the reservation was booked.'),
(1157, 1, 5, 'leiCode', 'leiCode', 'An organization identifier that uniquely identifies a legal entity as defined in ISO 17442.'),
(1158, 1, 5, 'availableThrough', 'availableThrough', 'After this date, the item will no longer be available for pickup.'),
(1159, 1, 5, 'orderedItem', 'orderedItem', 'The item ordered.'),
(1160, 1, 5, 'speechToTextMarkup', 'speechToTextMarkup', 'Form of markup used. eg. <a href=\"https://www.w3.org/TR/speech-synthesis11\">SSML</a> or <a href=\"https://www.wikidata.org/wiki/Property:P898\">IPA</a>.'),
(1161, 1, 5, 'courseWorkload', 'courseWorkload', 'The amount of work expected of students taking the course, often provided as a figure per week or per month, and may be broken down by type. For example, \"2 hours of lectures, 1 hour of lab work and 3 hours of independent study per week\".'),
(1162, 1, 5, 'doseUnit', 'doseUnit', 'The unit of the dose, e.g. \'mg\'.'),
(1163, 1, 5, 'partySize', 'partySize', 'Number of people the reservation should accommodate.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1164, 1, 5, 'enginePower', 'enginePower', 'The power of the vehicle\'s engine.\n    Typical unit code(s): KWT for kilowatt, BHP for brake horsepower, N12 for metric horsepower (PS, with 1 PS = 735,49875 W)<br/><br/>\n\n<ul>\n<li>Note 1: There are many different ways of measuring an engine\'s power. For an overview, see  <a href=\"http://en.wikipedia.org/wiki/Horsepower#Engine_power_test_codes\">http://en.wikipedia.org/wiki/Horsepower#Engine<em>power</em>test_codes</a>.</li>\n<li>Note 2: You can link to information about how the given value has been determined using the <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> property.</li>\n<li>Note 3: You can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(1165, 1, 5, 'geoTouches', 'geoTouches', 'Represents spatial relations in which two geometries (or the places they represent) touch: they have at least one boundary point in common, but no interior points.\" (a symmetric relationship, as defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a> )'),
(1166, 1, 5, 'dataset', 'dataset', 'A dataset contained in this catalog.'),
(1167, 1, 5, 'codingSystem', 'codingSystem', 'The coding system, e.g. \'ICD-10\'.'),
(1168, 1, 5, 'hasOfferCatalog', 'hasOfferCatalog', 'Indicates an OfferCatalog listing for this Organization, Person, or Service.'),
(1169, 1, 5, 'recordedIn', 'recordedIn', 'The CreativeWork that captured all or part of this Event.'),
(1170, 1, 5, 'fundedItem', 'fundedItem', 'Indicates an item funded or sponsored through a <a class=\"localLink\" href=\"http://schema.org/Grant\">Grant</a>.'),
(1171, 1, 5, 'size', 'size', 'A standardized size of a product or creative work, often simplifying richer information into a simple textual string, either through referring to named sizes or (in the case of product markup), by adopting conventional simplifications. Use of QuantitativeValue with a unitCode or unitText can add more structure; in other cases, the /width, /height, /depth and /weight properties may be more applicable.'),
(1172, 1, 5, 'educationalFramework', 'educationalFramework', 'The framework to which the resource being described is aligned.'),
(1173, 1, 5, 'translationOfWork', 'translationOfWork', 'The work that this work has been translated from. e.g. 物种起源 is a translationOf “On the Origin of Species”'),
(1174, 1, 5, 'exerciseType', 'exerciseType', 'Type(s) of exercise or activity, such as strength training, flexibility training, aerobics, cardiac rehabilitation, etc.'),
(1175, 1, 5, 'spokenByCharacter', 'spokenByCharacter', 'The (e.g. fictional) character, Person or Organization to whom the quotation is attributed within the containing CreativeWork.'),
(1176, 1, 5, 'loanTerm', 'loanTerm', 'The duration of the loan or credit agreement.'),
(1177, 1, 5, 'includedRiskFactor', 'includedRiskFactor', 'A modifiable or non-modifiable risk factor included in the calculation, e.g. age, coexisting condition.'),
(1178, 1, 5, 'amenityFeature', 'amenityFeature', 'An amenity feature (e.g. a characteristic or service) of the Accommodation. This generic property does not make a statement about whether the feature is included in an offer for the main accommodation or available at extra costs.'),
(1179, 1, 5, 'paymentMethodId', 'paymentMethodId', 'An identifier for the method of payment used (e.g. the last 4 digits of the credit card).'),
(1180, 1, 5, 'afterMedia', 'afterMedia', 'A media object representing the circumstances after performing this direction.'),
(1181, 1, 5, 'jobLocation', 'jobLocation', 'A (typically single) geographic location associated with the job position.'),
(1182, 1, 5, 'founder', 'founder', 'A person who founded this organization.'),
(1183, 1, 5, 'subjectOf', 'subjectOf', 'A CreativeWork or Event about this Thing.'),
(1184, 1, 5, 'itemLocation', 'itemLocation', 'Current location of the item.'),
(1185, 1, 5, 'faxNumber', 'faxNumber', 'The fax number.'),
(1186, 1, 5, 'gameLocation', 'gameLocation', 'Real or fictional location of the game (or part of game).'),
(1187, 1, 5, 'valueAddedTaxIncluded', 'valueAddedTaxIncluded', 'Specifies whether the applicable value-added tax (VAT) is included in the price specification or not.'),
(1188, 1, 5, 'shippingSettingsLink', 'shippingSettingsLink', 'Link to a page containing <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a> and <a class=\"localLink\" href=\"http://schema.org/DeliveryTimeSettings\">DeliveryTimeSettings</a> details.'),
(1189, 1, 5, 'interactionType', 'interactionType', 'The Action representing the type of interaction. For up votes, +1s, etc. use <a class=\"localLink\" href=\"http://schema.org/LikeAction\">LikeAction</a>. For down votes use <a class=\"localLink\" href=\"http://schema.org/DislikeAction\">DislikeAction</a>. Otherwise, use the most specific Action.'),
(1190, 1, 5, 'accountOverdraftLimit', 'accountOverdraftLimit', 'An overdraft is an extension of credit from a lending institution when an account reaches zero. An overdraft allows the individual to continue withdrawing money even if the account has no funds in it. Basically the bank allows people to borrow a set amount of money.'),
(1191, 1, 5, 'broadcastAffiliateOf', 'broadcastAffiliateOf', 'The media network(s) whose content is broadcast on this station.'),
(1192, 1, 5, 'contentRating', 'contentRating', 'Official rating of a piece of content&#x2014;for example,\'MPAA PG-13\'.'),
(1193, 1, 5, 'eligibleQuantity', 'eligibleQuantity', 'The interval and unit of measurement of ordering quantities for which the offer or price specification is valid. This allows e.g. specifying that a certain freight charge is valid only for a certain quantity.'),
(1194, 1, 5, 'correctionsPolicy', 'correctionsPolicy', 'For an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> (e.g. <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>), a statement describing (in news media, the newsroom’s) disclosure and correction policy for errors.'),
(1195, 1, 5, 'foodWarning', 'foodWarning', 'Any precaution, guidance, contraindication, etc. related to consumption of specific foods while taking this drug.'),
(1196, 1, 5, 'resultReview', 'resultReview', 'A sub property of result. The review that resulted in the performing of the action.'),
(1197, 1, 5, 'targetPlatform', 'targetPlatform', 'Type of app development: phone, Metro style, desktop, XBox, etc.'),
(1198, 1, 5, 'expectedArrivalUntil', 'expectedArrivalUntil', 'The latest date the package may arrive.'),
(1199, 1, 5, 'streetAddress', 'streetAddress', 'The street address. For example, 1600 Amphitheatre Pkwy.'),
(1200, 1, 5, 'referencesOrder', 'referencesOrder', 'The Order(s) related to this Invoice. One or more Orders may be combined into a single Invoice.'),
(1201, 1, 5, 'healthPlanMarketingUrl', 'healthPlanMarketingUrl', 'The URL that goes directly to the plan brochure for the specific standard plan or plan variation.'),
(1202, 1, 5, 'children', 'children', 'A child of the person.'),
(1203, 1, 5, 'intensity', 'intensity', 'Quantitative measure gauging the degree of force involved in the exercise, for example, heartbeats per minute. May include the velocity of the movement.'),
(1204, 1, 5, 'availabilityStarts', 'availabilityStarts', 'The beginning of the availability of the product or service included in the offer.'),
(1205, 1, 5, 'servesCuisine', 'servesCuisine', 'The cuisine of the restaurant.'),
(1206, 1, 5, 'event', 'event', 'Upcoming or past event associated with this place, organization, or action.'),
(1207, 1, 5, 'cutoffTime', 'cutoffTime', 'Order cutoff time allows merchants to describe the time after which they will no longer process orders received on that day. For orders processed after cutoff time, one day gets added to the delivery time estimate. This property is expected to be most typically used via the <a class=\"localLink\" href=\"http://schema.org/ShippingRateSettings\">ShippingRateSettings</a> publication pattern. The time is indicated using the ISO-8601 Time format, e.g. \"23:30:00-05:00\" would represent 6:30 pm Eastern Standard Time (EST) which is 5 hours behind Coordinated Universal Time (UTC).'),
(1208, 1, 5, 'loanType', 'loanType', 'The type of a loan or credit.'),
(1209, 1, 5, 'surface', 'surface', 'A material used as a surface in some artwork, e.g. Canvas, Paper, Wood, Board, etc.'),
(1210, 1, 5, 'populationType', 'populationType', 'Indicates the populationType common to all members of a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>.'),
(1211, 1, 5, 'healthPlanCoinsuranceOption', 'healthPlanCoinsuranceOption', 'Whether the coinsurance applies before or after deductible, etc. TODO: Is this a closed set?'),
(1212, 1, 5, 'givenName', 'givenName', 'Given name. In the U.S., the first name of a Person. This can be used along with familyName instead of the name property.'),
(1213, 1, 5, 'lesserOrEqual', 'lesserOrEqual', 'This ordering relation for qualitative values indicates that the subject is lesser than or equal to the object.'),
(1214, 1, 5, 'conditionsOfAccess', 'conditionsOfAccess', 'Conditions that affect the availability of, or method(s) of access to, an item. Typically used for real world items such as an <a class=\"localLink\" href=\"http://schema.org/ArchiveComponent\">ArchiveComponent</a> held by an <a class=\"localLink\" href=\"http://schema.org/ArchiveOrganization\">ArchiveOrganization</a>. This property is not suitable for use as a general Web access control mechanism. It is expressed only in natural language.<br/><br/>\n\nFor example \"Available by appointment from the Reading Room\" or \"Accessible only from logged-in accounts \".'),
(1215, 1, 5, 'doorTime', 'doorTime', 'The time admission will commence.'),
(1216, 1, 5, 'childMinAge', 'childMinAge', 'Minimal age of the child.'),
(1217, 1, 5, 'abstract', 'abstract', 'An abstract is a short description that summarizes a <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>.'),
(1218, 1, 5, 'programmingModel', 'programmingModel', 'Indicates whether API is managed or unmanaged.'),
(1219, 1, 5, 'contentLocation', 'contentLocation', 'The location depicted or described in the content. For example, the location in a photograph or painting.'),
(1220, 1, 5, 'linkRelationship', 'linkRelationship', 'Indicates the relationship type of a Web link.'),
(1221, 1, 5, 'applicationContact', 'applicationContact', 'Contact details for further information relevant to this job posting.'),
(1222, 1, 5, 'newsUpdatesAndGuidelines', 'newsUpdatesAndGuidelines', 'Indicates a page with news updates and guidelines. This could often be (but is not required to be) the main page containing <a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a> markup on a site.'),
(1223, 1, 5, 'sharedContent', 'sharedContent', 'A CreativeWork such as an image, video, or audio clip shared as part of this posting.'),
(1224, 1, 5, 'latitude', 'latitude', 'The latitude of a location. For example <code>37.42242</code> (<a href=\"https://en.wikipedia.org/wiki/World_Geodetic_System\">WGS 84</a>).'),
(1225, 1, 5, 'deathDate', 'deathDate', 'Date of death.'),
(1226, 1, 5, 'musicReleaseFormat', 'musicReleaseFormat', 'Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).'),
(1227, 1, 5, 'keywords', 'keywords', 'Keywords or tags used to describe this content. Multiple entries in a keywords list are typically delimited by commas.'),
(1228, 1, 5, 'supersededBy', 'supersededBy', 'Relates a term (i.e. a property, class or enumeration) to one that supersedes it.'),
(1229, 1, 5, 'artEdition', 'artEdition', 'The number of copies when multiple copies of a piece of artwork are produced - e.g. for a limited edition of 20 prints, \'artEdition\' refers to the total number of copies (in this example \"20\").'),
(1230, 1, 5, 'membershipNumber', 'membershipNumber', 'A unique identifier for the membership.'),
(1231, 1, 5, 'competitor', 'competitor', 'A competitor in a sports event.'),
(1232, 1, 5, 'suitableForDiet', 'suitableForDiet', 'Indicates a dietary restriction or guideline for which this recipe or menu item is suitable, e.g. diabetic, halal etc.'),
(1233, 1, 5, 'valueRequired', 'valueRequired', 'Whether the property must be filled in to complete the action.  Default is false.'),
(1234, 1, 5, 'tongueWeight', 'tongueWeight', 'The permitted vertical load (TWR) of a trailer attached to the vehicle. Also referred to as Tongue Load Rating (TLR) or Vertical Load Rating (VLR)<br/><br/>\n\nTypical unit code(s): KGM for kilogram, LBR for pound<br/><br/>\n\n<ul>\n<li>Note 1: You can indicate additional information in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> node.</li>\n<li>Note 2: You may also link to a <a class=\"localLink\" href=\"http://schema.org/QualitativeValue\">QualitativeValue</a> node that provides additional information using <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a>.</li>\n<li>Note 3: Note that you can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(1235, 1, 5, 'wordCount', 'wordCount', 'The number of words in the text of the Article.'),
(1236, 1, 5, 'physicalRequirement', 'physicalRequirement', 'A description of the types of physical activity associated with the job. Defined terms such as those in O*net may be used, but note that there is no way to specify the level of ability as well as its nature when using a defined term.'),
(1237, 1, 5, 'applicationStartDate', 'applicationStartDate', 'The date at which the program begins collecting applications for the next enrollment cycle.'),
(1238, 1, 5, 'exceptDate', 'exceptDate', 'Defines a <a class=\"localLink\" href=\"http://schema.org/Date\">Date</a> or <a class=\"localLink\" href=\"http://schema.org/DateTime\">DateTime</a> during which a scheduled <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> will not take place. The property allows exceptions to\n      a <a class=\"localLink\" href=\"http://schema.org/Schedule\">Schedule</a> to be specified. If an exception is specified as a <a class=\"localLink\" href=\"http://schema.org/DateTime\">DateTime</a> then only the event that would have started at that specific date and time\n      should be excluded from the schedule. If an exception is specified as a <a class=\"localLink\" href=\"http://schema.org/Date\">Date</a> then any event that is scheduled for that 24 hour period should be\n      excluded from the schedule. This allows a whole day to be excluded from the schedule without having to itemise every scheduled event.'),
(1239, 1, 5, 'responsibilities', 'responsibilities', 'Responsibilities associated with this role or Occupation.'),
(1240, 1, 5, 'lyricist', 'lyricist', 'The person who wrote the words.'),
(1241, 1, 5, 'sdPublisher', 'sdPublisher', 'Indicates the party responsible for generating and publishing the current structured data markup, typically in cases where the structured data is derived automatically from existing published content but published on a different site. For example, student projects and open data initiatives often re-publish existing content with more explicitly structured metadata. The\n<a class=\"localLink\" href=\"http://schema.org/sdPublisher\">sdPublisher</a> property helps make such practices more explicit.'),
(1242, 1, 5, 'overdosage', 'overdosage', 'Any information related to overdose on a drug, including signs or symptoms, treatments, contact information for emergency response.'),
(1243, 1, 5, 'eventAttendanceMode', 'eventAttendanceMode', 'The eventAttendanceMode of an event indicates whether it occurs online, offline, or a mix.'),
(1244, 1, 5, 'netWorth', 'netWorth', 'The total financial value of the person as calculated by subtracting assets from liabilities.'),
(1245, 1, 5, 'gameItem', 'gameItem', 'An item is an object within the game world that can be collected by a player or, occasionally, a non-player character.'),
(1246, 1, 5, 'hasHealthAspect', 'hasHealthAspect', 'Indicates the aspect or aspects specifically addressed in some <a class=\"localLink\" href=\"http://schema.org/HealthTopicContent\">HealthTopicContent</a>. For example, that the content is an overview, or that it talks about treatment, self-care, treatments or their side-effects.'),
(1247, 1, 5, 'instructor', 'instructor', 'A person assigned to instruct or provide instructional assistance for the <a class=\"localLink\" href=\"http://schema.org/CourseInstance\">CourseInstance</a>.'),
(1248, 1, 5, 'healthPlanDrugOption', 'healthPlanDrugOption', 'TODO.'),
(1249, 1, 5, 'evidenceOrigin', 'evidenceOrigin', 'Source of the data used to formulate the guidance, e.g. RCT, consensus opinion, etc.'),
(1250, 1, 5, 'partOfSeason', 'partOfSeason', 'The season to which this episode belongs.'),
(1251, 1, 5, 'jobImmediateStart', 'jobImmediateStart', 'An indicator as to whether a position is available for an immediate start.'),
(1252, 1, 5, 'applicationSubCategory', 'applicationSubCategory', 'Subcategory of the application, e.g. \'Arcade Game\'.'),
(1253, 1, 5, 'sdDatePublished', 'sdDatePublished', 'Indicates the date on which the current structured data was generated / published. Typically used alongside <a class=\"localLink\" href=\"http://schema.org/sdPublisher\">sdPublisher</a>'),
(1254, 1, 5, 'jobLocationType', 'jobLocationType', 'A description of the job location (e.g TELECOMMUTE for telecommute jobs).'),
(1255, 1, 5, 'assemblyVersion', 'assemblyVersion', 'Associated product/technology version. e.g., .NET Framework 4.5.'),
(1256, 1, 5, 'doseSchedule', 'doseSchedule', 'A dosing schedule for the drug for a given population, either observed, recommended, or maximum dose based on the type used.'),
(1257, 1, 5, 'accessModeSufficient', 'accessModeSufficient', 'A list of single or combined accessModes that are sufficient to understand all the intellectual content of a resource. Expected values include:  auditory, tactile, textual, visual.'),
(1258, 1, 5, 'variableMeasured', 'variableMeasured', 'The variableMeasured property can indicate (repeated as necessary) the  variables that are measured in some dataset, either described as text or as pairs of identifier and description using PropertyValue.'),
(1259, 1, 5, 'pickupTime', 'pickupTime', 'When a taxi will pickup a passenger or a rental car can be picked up.'),
(1260, 1, 5, 'organizer', 'organizer', 'An organizer of an Event.'),
(1261, 1, 5, 'ccRecipient', 'ccRecipient', 'A sub property of recipient. The recipient copied on a message.'),
(1262, 1, 5, 'permissionType', 'permissionType', 'The type of permission granted the person, organization, or audience.'),
(1263, 1, 5, 'bookingAgent', 'bookingAgent', '\'bookingAgent\' is an out-dated term indicating a \'broker\' that serves as a booking agent.'),
(1264, 1, 5, 'cvdNumICUBeds', 'cvdNumICUBeds', 'numicubeds - ICU BEDS: Total number of staffed inpatient intensive care unit (ICU) beds.'),
(1265, 1, 5, 'softwareVersion', 'softwareVersion', 'Version of the software instance.'),
(1266, 1, 5, 'evidenceLevel', 'evidenceLevel', 'Strength of evidence of the data used to formulate the guideline (enumerated).'),
(1267, 1, 5, 'participant', 'participant', 'Other co-agents that participated in the action indirectly. e.g. John wrote a book with <em>Steve</em>.'),
(1268, 1, 5, 'valueMinLength', 'valueMinLength', 'Specifies the minimum allowed range for number of characters in a literal value.'),
(1269, 1, 5, 'seatRow', 'seatRow', 'The row location of the reserved seat (e.g., B).'),
(1270, 1, 5, 'labelDetails', 'labelDetails', 'Link to the drug\'s label details.'),
(1271, 1, 5, 'playMode', 'playMode', 'Indicates whether this game is multi-player, co-op or single-player.  The game can be marked as multi-player, co-op and single-player at the same time.'),
(1272, 1, 5, 'publishedOn', 'publishedOn', 'A broadcast service associated with the publication event.'),
(1273, 1, 5, 'numberOfForwardGears', 'numberOfForwardGears', 'The total number of forward gears available for the transmission system of the vehicle.<br/><br/>\n\nTypical unit code(s): C62'),
(1274, 1, 5, 'issn', 'issn', 'The International Standard Serial Number (ISSN) that identifies this serial publication. You can repeat this property to identify different formats of, or the linking ISSN (ISSN-L) for, this serial publication.'),
(1275, 1, 5, 'musicalKey', 'musicalKey', 'The key, mode, or scale this composition uses.'),
(1276, 1, 5, 'sameAs', 'sameAs', 'URL of a reference Web page that unambiguously indicates the item\'s identity. E.g. the URL of the item\'s Wikipedia page, Wikidata entry, or official website.'),
(1277, 1, 5, 'correction', 'correction', 'Indicates a correction to a <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>, either via a <a class=\"localLink\" href=\"http://schema.org/CorrectionComment\">CorrectionComment</a>, textually or in another document.'),
(1278, 1, 5, 'drugUnit', 'drugUnit', 'The unit in which the drug is measured, e.g. \'5 mg tablet\'.'),
(1279, 1, 5, 'members', 'members', 'A member of this organization.'),
(1280, 1, 5, 'actionAccessibilityRequirement', 'actionAccessibilityRequirement', 'A set of requirements that a must be fulfilled in order to perform an Action. If more than one value is specied, fulfilling one set of requirements will allow the Action to be performed.'),
(1281, 1, 5, 'playerType', 'playerType', 'Player type required&#x2014;for example, Flash or Silverlight.'),
(1282, 1, 5, 'priceType', 'priceType', 'A short text or acronym indicating multiple price specifications for the same offer, e.g. SRP for the suggested retail price or INVOICE for the invoice price, mostly used in the car industry.'),
(1283, 1, 5, 'requiredCollateral', 'requiredCollateral', 'Assets required to secure loan or credit repayments. It may take form of third party pledge, goods, financial instruments (cash, securities, etc.)'),
(1284, 1, 5, 'relatedLink', 'relatedLink', 'A link related to this web page, for example to other related web pages.'),
(1285, 1, 5, 'transFatContent', 'transFatContent', 'The number of grams of trans fat.'),
(1286, 1, 5, 'hasCredential', 'hasCredential', 'A credential awarded to the Person or Organization.'),
(1287, 1, 5, 'broadcastFrequency', 'broadcastFrequency', 'The frequency used for over-the-air broadcasts. Numeric values or simple ranges e.g. 87-99. In addition a shortcut idiom is supported for frequences of AM and FM radio channels, e.g. \"87 FM\".'),
(1288, 1, 5, 'availableLanguage', 'availableLanguage', 'A language someone may use with or at the item, service or place. Please use one of the language codes from the <a href=\"http://tools.ietf.org/html/bcp47\">IETF BCP 47 standard</a>. See also <a class=\"localLink\" href=\"http://schema.org/inLanguage\">inLanguage</a>'),
(1289, 1, 5, 'subStageSuffix', 'subStageSuffix', 'The substage, e.g. \'a\' for Stage IIIa.'),
(1290, 1, 5, 'healthPlanCopay', 'healthPlanCopay', 'Whether The copay amount.'),
(1291, 1, 5, 'iataCode', 'iataCode', 'IATA identifier for an airline or airport.'),
(1292, 1, 5, 'preparation', 'preparation', 'Typical preparation that a patient must undergo before having the procedure performed.'),
(1293, 1, 5, 'tracks', 'tracks', 'A music recording (track)&#x2014;usually a single song.'),
(1294, 1, 5, 'timeOfDay', 'timeOfDay', 'The time of day the program normally runs. For example, \"evenings\".'),
(1295, 1, 5, 'dateModified', 'dateModified', 'The date on which the CreativeWork was most recently modified or when the item\'s entry was modified within a DataFeed.'),
(1296, 1, 5, 'inStoreReturnsOffered', 'inStoreReturnsOffered', 'Are in-store returns offered?'),
(1297, 1, 5, 'distinguishingSign', 'distinguishingSign', 'One of a set of signs and symptoms that can be used to distinguish this diagnosis from others in the differential diagnosis.'),
(1298, 1, 5, 'encodesCreativeWork', 'encodesCreativeWork', 'The CreativeWork encoded by this media object.'),
(1299, 1, 5, 'identifier', 'identifier', 'The identifier property represents any kind of identifier for any kind of <a class=\"localLink\" href=\"http://schema.org/Thing\">Thing</a>, such as ISBNs, GTIN codes, UUIDs etc. Schema.org provides dedicated properties for representing many of these, either as textual strings or as URL (URI) links. See <a href=\"/docs/datamodel.html#identifierBg\">background notes</a> for more details.'),
(1300, 1, 5, 'isRelatedTo', 'isRelatedTo', 'A pointer to another, somehow related product (or multiple products).'),
(1301, 1, 5, 'trialDesign', 'trialDesign', 'Specifics about the trial design (enumerated).'),
(1302, 1, 5, 'webCheckinTime', 'webCheckinTime', 'The time when a passenger can check into the flight online.'),
(1303, 1, 5, 'usageInfo', 'usageInfo', 'The schema.org <a class=\"localLink\" href=\"http://schema.org/usageInfo\">usageInfo</a> property indicates further information about a <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>. This property is applicable both to works that are freely available and to those that require payment or other transactions. It can reference additional information e.g. community expectations on preferred linking and citation conventions, as well as purchasing details. For something that can be commercially licensed, usageInfo can provide detailed, resource-specific information about licensing options.<br/><br/>\n\nThis property can be used alongside the license property which indicates license(s) applicable to some piece of content. The usageInfo property can provide information about other licensing options, e.g. acquiring commercial usage rights for an image that is also available under non-commercial creative commons licenses.'),
(1304, 1, 5, 'issuedThrough', 'issuedThrough', 'The service through with the permit was granted.'),
(1305, 1, 5, 'liveBlogUpdate', 'liveBlogUpdate', 'An update to the LiveBlog.'),
(1306, 1, 5, 'activeIngredient', 'activeIngredient', 'An active ingredient, typically chemical compounds and/or biologic substances.'),
(1307, 1, 5, 'associatedAnatomy', 'associatedAnatomy', 'The anatomy of the underlying organ system or structures associated with this entity.'),
(1308, 1, 5, 'email', 'email', 'Email address.'),
(1309, 1, 5, 'inventoryLevel', 'inventoryLevel', 'The current approximate inventory level for the item or items.'),
(1310, 1, 5, 'director', 'director', 'A director of e.g. tv, radio, movie, video gaming etc. content, or of an event. Directors can be associated with individual items or with a series, episode, clip.'),
(1311, 1, 5, 'agent', 'agent', 'The direct performer or driver of the action (animate or inanimate). e.g. <em>John</em> wrote a book.'),
(1312, 1, 5, 'isProprietary', 'isProprietary', 'True if this item\'s name is a proprietary/brand name (vs. generic name).'),
(1313, 1, 5, 'geoEquals', 'geoEquals', 'Represents spatial relations in which two geometries (or the places they represent) are topologically equal, as defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>. \"Two geometries are topologically equal if their interiors intersect and no part of the interior or boundary of one geometry intersects the exterior of the other\" (a symmetric relationship)'),
(1314, 1, 5, 'legislationJurisdiction', 'legislationJurisdiction', 'The jurisdiction from which the legislation originates.'),
(1315, 1, 5, 'itemListElement', 'itemListElement', 'For itemListElement values, you can use simple strings (e.g. \"Peter\", \"Paul\", \"Mary\"), existing entities, or use ListItem.<br/><br/>\n\nText values are best if the elements in the list are plain strings. Existing entities are best for a simple, unordered list of existing things in your data. ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.<br/><br/>\n\nNote: The order of elements in your mark-up is not sufficient for indicating the order or elements.  Use ListItem with a \'position\' property in such cases.'),
(1316, 1, 5, 'paymentDueDate', 'paymentDueDate', 'The date that payment is due.'),
(1317, 1, 5, 'caption', 'caption', 'The caption for this object. For downloadable machine formats (closed caption, subtitles etc.) use MediaObject and indicate the <a class=\"localLink\" href=\"http://schema.org/encodingFormat\">encodingFormat</a>.'),
(1318, 1, 5, 'cholesterolContent', 'cholesterolContent', 'The number of milligrams of cholesterol.'),
(1319, 1, 5, 'priceSpecification', 'priceSpecification', 'One or more detailed price specifications, indicating the unit price and delivery or payment charges.'),
(1320, 1, 5, 'courseMode', 'courseMode', 'The medium or means of delivery of the course instance or the mode of study, either as a text label (e.g. \"online\", \"onsite\" or \"blended\"; \"synchronous\" or \"asynchronous\"; \"full-time\" or \"part-time\") or as a URL reference to a term from a controlled vocabulary (e.g. https://ceds.ed.gov/element/001311#Asynchronous ).'),
(1321, 1, 5, 'hasPOS', 'hasPOS', 'Points-of-Sales operated by the organization or person.'),
(1322, 1, 5, 'episode', 'episode', 'An episode of a tv, radio or game media within a series or season.'),
(1323, 1, 5, 'workHours', 'workHours', 'The typical working hours for this job (e.g. 1st shift, night shift, 8am-5pm).'),
(1324, 1, 5, 'editor', 'editor', 'Specifies the Person who edited the CreativeWork.'),
(1325, 1, 5, 'seller', 'seller', 'An entity which offers (sells / leases / lends / loans) the services / goods.  A seller may also be a provider.'),
(1326, 1, 5, 'greater', 'greater', 'This ordering relation for qualitative values indicates that the subject is greater than the object.'),
(1327, 1, 5, 'numConstraints', 'numConstraints', 'Indicates the number of constraints (not counting <a class=\"localLink\" href=\"http://schema.org/populationType\">populationType</a>) defined for a particular <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>. This helps applications understand if they have access to a sufficiently complete description of a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>.'),
(1328, 1, 5, 'biomechnicalClass', 'biomechnicalClass', 'The biomechanical properties of the bone.'),
(1329, 1, 5, 'unitText', 'unitText', 'A string or text indicating the unit of measurement. Useful if you cannot provide a standard unit code for\n<a href=\'unitCode\'>unitCode</a>.'),
(1330, 1, 5, 'translator', 'translator', 'Organization or person who adapts a creative work to different languages, regional differences and technical requirements of a target market, or that translates during some event.'),
(1331, 1, 5, 'carrier', 'carrier', '\'carrier\' is an out-dated term indicating the \'provider\' for parcel delivery and flights.'),
(1332, 1, 5, 'productionCompany', 'productionCompany', 'The production company or studio responsible for the item e.g. series, video game, episode etc.'),
(1333, 1, 5, 'characterName', 'characterName', 'The name of a character played in some acting or performing role, i.e. in a PerformanceRole.'),
(1334, 1, 5, 'priceValidUntil', 'priceValidUntil', 'The date after which the price is no longer available.'),
(1335, 1, 5, 'loanRepaymentForm', 'loanRepaymentForm', 'A form of paying back money previously borrowed from a lender. Repayment usually takes the form of periodic payments that normally include part principal plus interest in each payment.'),
(1336, 1, 5, 'departureStation', 'departureStation', 'The station from which the train departs.'),
(1337, 1, 5, 'numberOfRooms', 'numberOfRooms', 'The number of rooms (excluding bathrooms and closets) of the accommodation or lodging business.\nTypical unit code(s): ROM for room or C62 for no unit. The type of room can be put in the unitText property of the QuantitativeValue.'),
(1338, 1, 5, 'administrationRoute', 'administrationRoute', 'A route by which this drug may be administered, e.g. \'oral\'.'),
(1339, 1, 5, 'foundingDate', 'foundingDate', 'The date that this organization was founded.'),
(1340, 1, 5, 'merchant', 'merchant', '\'merchant\' is an out-dated term for \'seller\'.'),
(1341, 1, 5, 'serviceArea', 'serviceArea', 'The geographic area where the service is provided.'),
(1342, 1, 5, 'inCodeSet', 'inCodeSet', 'A <a class=\"localLink\" href=\"http://schema.org/CategoryCodeSet\">CategoryCodeSet</a> that contains this category code.'),
(1343, 1, 5, 'healthcareReportingData', 'healthcareReportingData', 'Indicates data describing a hospital, e.g. a CDC <a class=\"localLink\" href=\"http://schema.org/CDCPMDRecord\">CDCPMDRecord</a> or as some kind of <a class=\"localLink\" href=\"http://schema.org/Dataset\">Dataset</a>.'),
(1344, 1, 5, 'busName', 'busName', 'The name of the bus (e.g. Bolt Express).'),
(1345, 1, 5, 'inPlaylist', 'inPlaylist', 'The playlist to which this recording belongs.'),
(1346, 1, 5, 'menu', 'menu', 'Either the actual menu as a structured representation, as text, or a URL of the menu.'),
(1347, 1, 5, 'targetCollection', 'targetCollection', 'A sub property of object. The collection target of the action.'),
(1348, 1, 5, 'followee', 'followee', 'A sub property of object. The person or organization being followed.'),
(1349, 1, 5, 'gamePlatform', 'gamePlatform', 'The electronic systems used to play <a href=\"http://en.wikipedia.org/wiki/Category:Video_game_platforms\">video games</a>.'),
(1350, 1, 5, 'postOp', 'postOp', 'A description of the postoperative procedures, care, and/or followups for this device.'),
(1351, 1, 5, 'position', 'position', 'The position of an item in a series or sequence of items.'),
(1352, 1, 5, 'refundType', 'refundType', 'A refundType, from an enumerated list.'),
(1353, 1, 5, 'holdingArchive', 'holdingArchive', '<a class=\"localLink\" href=\"http://schema.org/ArchiveOrganization\">ArchiveOrganization</a> that holds, keeps or maintains the <a class=\"localLink\" href=\"http://schema.org/ArchiveComponent\">ArchiveComponent</a>.'),
(1354, 1, 5, 'musicCompositionForm', 'musicCompositionForm', 'The type of composition (e.g. overture, sonata, symphony, etc.).'),
(1355, 1, 5, 'code', 'code', 'A medical code for the entity, taken from a controlled vocabulary or ontology such as ICD-9, DiseasesDB, MeSH, SNOMED-CT, RxNorm, etc.'),
(1356, 1, 5, 'relatedTherapy', 'relatedTherapy', 'A medical therapy related to this anatomy.'),
(1357, 1, 5, 'hasMenuItem', 'hasMenuItem', 'A food or drink item contained in a menu or menu section.'),
(1358, 1, 5, 'connectedTo', 'connectedTo', 'Other anatomical structures to which this structure is connected.'),
(1359, 1, 5, 'coverageEndTime', 'coverageEndTime', 'The time when the live blog will stop covering the Event. Note that coverage may continue after the Event concludes.'),
(1360, 1, 5, 'depth', 'depth', 'The depth of the item.'),
(1361, 1, 5, 'strengthUnit', 'strengthUnit', 'The units of an active ingredient\'s strength, e.g. mg.'),
(1362, 1, 5, 'spouse', 'spouse', 'The person\'s spouse.'),
(1363, 1, 5, 'spatial', 'spatial', 'The \"spatial\" property can be used in cases when more specific properties\n(e.g. <a class=\"localLink\" href=\"http://schema.org/locationCreated\">locationCreated</a>, <a class=\"localLink\" href=\"http://schema.org/spatialCoverage\">spatialCoverage</a>, <a class=\"localLink\" href=\"http://schema.org/contentLocation\">contentLocation</a>) are not known to be appropriate.'),
(1364, 1, 5, 'blogPosts', 'blogPosts', 'The postings that are part of this blog.'),
(1365, 1, 5, 'hasMenuSection', 'hasMenuSection', 'A subgrouping of the menu (by dishes, course, serving time period, etc.).'),
(1366, 1, 5, 'actor', 'actor', 'An actor, e.g. in tv, radio, movie, video games etc., or in an event. Actors can be associated with individual items or with a series, episode, clip.'),
(1367, 1, 5, 'cheatCode', 'cheatCode', 'Cheat codes to the game.'),
(1368, 1, 5, 'vehicleEngine', 'vehicleEngine', 'Information about the engine or engines of the vehicle.'),
(1369, 1, 5, 'programMembershipUsed', 'programMembershipUsed', 'Any membership in a frequent flyer, hotel loyalty program, etc. being applied to the reservation.'),
(1370, 1, 5, 'recognizedBy', 'recognizedBy', 'An organization that acknowledges the validity, value or utility of a credential. Note: recognition may include a process of quality assurance or accreditation.'),
(1371, 1, 5, 'reportNumber', 'reportNumber', 'The number or other unique designator assigned to a Report by the publishing organization.'),
(1372, 1, 5, 'partOfTVSeries', 'partOfTVSeries', 'The TV series to which this episode or season belongs.'),
(1373, 1, 5, 'arrivalAirport', 'arrivalAirport', 'The airport where the flight terminates.'),
(1374, 1, 5, 'assembly', 'assembly', 'Library file name e.g., mscorlib.dll, system.web.dll.'),
(1375, 1, 5, 'legislationResponsible', 'legislationResponsible', 'An individual or organization that has some kind of responsibility for the legislation. Typically the ministry who is/was in charge of elaborating the legislation, or the adressee for potential questions about the legislation once it is published.'),
(1376, 1, 5, 'gtin', 'gtin', 'A Global Trade Item Number (<a href=\"https://www.gs1.org/standards/id-keys/gtin\">GTIN</a>). GTINs identify trade items, including products and services, using numeric identification codes. The <a class=\"localLink\" href=\"http://schema.org/gtin\">gtin</a> property generalizes the earlier <a class=\"localLink\" href=\"http://schema.org/gtin8\">gtin8</a>, <a class=\"localLink\" href=\"http://schema.org/gtin12\">gtin12</a>, <a class=\"localLink\" href=\"http://schema.org/gtin13\">gtin13</a>, and <a class=\"localLink\" href=\"http://schema.org/gtin14\">gtin14</a> properties. The GS1 <a href=\"https://www.gs1.org/standards/Digital-Link/\">digital link specifications</a> express GTINs as URLs. A correct <a class=\"localLink\" href=\"http://schema.org/gtin\">gtin</a> value should be a valid GTIN, which means that it should be an all-numeric string of either 8, 12, 13 or 14 digits, or a \"GS1 Digital Link\" URL based on such a string. The numeric component should also have a <a href=\"https://www.gs1.org/services/check-digit-calculator\">valid GS1 check digit</a> and meet the other rules for valid GTINs. See also <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GS1\'s GTIN Summary</a> and <a href=\"https://en.wikipedia.org/wiki/Global_Trade_Item_Number\">Wikipedia</a> for more details. Left-padding of the gtin values is not required or encouraged.'),
(1377, 1, 5, 'albumRelease', 'albumRelease', 'A release of this album.'),
(1378, 1, 5, 'aggregateRating', 'aggregateRating', 'The overall rating, based on a collection of reviews or ratings, of the item.'),
(1379, 1, 5, 'accessMode', 'accessMode', 'The human sensory perceptual system or cognitive faculty through which a person may process or perceive information. Expected values include: auditory, tactile, textual, visual, colorDependent, chartOnVisual, chemOnVisual, diagramOnVisual, mathOnVisual, musicOnVisual, textOnVisual.'),
(1380, 1, 5, 'greaterOrEqual', 'greaterOrEqual', 'This ordering relation for qualitative values indicates that the subject is greater than or equal to the object.'),
(1381, 1, 5, 'location', 'location', 'The location of for example where the event is happening, an organization is located, or where an action takes place.'),
(1382, 1, 5, 'reviewRating', 'reviewRating', 'The rating given in this review. Note that reviews can themselves be rated. The <code>reviewRating</code> applies to rating given by the review. The <a class=\"localLink\" href=\"http://schema.org/aggregateRating\">aggregateRating</a> property applies to the review itself, as a creative work.'),
(1383, 1, 5, 'byDay', 'byDay', 'Defines the day(s) of the week on which a recurring <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> takes place. May be specified using either <a class=\"localLink\" href=\"http://schema.org/DayOfWeek\">DayOfWeek</a>, or alternatively <a class=\"localLink\" href=\"http://schema.org/Text\">Text</a> conforming to iCal\'s syntax for byDay recurrence rules'),
(1384, 1, 5, 'seatingType', 'seatingType', 'The type/class of the seat.'),
(1385, 1, 5, 'relatedDrug', 'relatedDrug', 'Any other drug related to this one, for example commonly-prescribed alternatives.'),
(1386, 1, 5, 'ownedFrom', 'ownedFrom', 'The date and time of obtaining the product.'),
(1387, 1, 5, 'productID', 'productID', 'The product identifier, such as ISBN. For example: <code>meta itemprop=\"productID\" content=\"isbn:123-456-789\"</code>.'),
(1388, 1, 5, 'partOfEpisode', 'partOfEpisode', 'The episode to which this clip belongs.'),
(1389, 1, 5, 'termsOfService', 'termsOfService', 'Human-readable terms of service documentation.'),
(1390, 1, 5, 'deliveryTime', 'deliveryTime', 'The total delay between the receipt of the order and the goods reaching the final customer.'),
(1391, 1, 5, 'suggestedMinAge', 'suggestedMinAge', 'Minimal age recommended for viewing content.'),
(1392, 1, 5, 'colorist', 'colorist', 'The individual who adds color to inked drawings.'),
(1393, 1, 5, 'identifyingExam', 'identifyingExam', 'A physical examination that can identify this sign.'),
(1394, 1, 5, 'repeatCount', 'repeatCount', 'Defines the number of times a recurring <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> will take place'),
(1395, 1, 5, 'actionApplication', 'actionApplication', 'An application that can complete the request.'),
(1396, 1, 5, 'colleague', 'colleague', 'A colleague of the person.'),
(1397, 1, 5, 'thumbnail', 'thumbnail', 'Thumbnail image for an image or video.'),
(1398, 1, 5, 'exifData', 'exifData', 'exif data for this object.'),
(1399, 1, 5, 'learningResourceType', 'learningResourceType', 'The predominant type or kind characterizing the learning resource. For example, \'presentation\', \'handout\'.'),
(1400, 1, 5, 'author', 'author', 'The author of this content or rating. Please note that author is special in that HTML 5 provides a special mechanism for indicating authorship via the rel tag. That is equivalent to this and may be used interchangeably.'),
(1401, 1, 5, 'legislationApplies', 'legislationApplies', 'Indicates that this legislation (or part of a legislation) somehow transfers another legislation in a different legislative context. This is an informative link, and it has no legal value. For legally-binding links of transposition, use the <a href=\"/legislationTransposes\">legislationTransposes</a> property. For example an informative consolidated law of a European Union\'s member state \"applies\" the consolidated version of the European Directive implemented in it.'),
(1402, 1, 5, 'checkoutTime', 'checkoutTime', 'The latest someone may check out of a lodging establishment.'),
(1403, 1, 5, 'experienceRequirements', 'experienceRequirements', 'Description of skills and experience needed for the position or Occupation.'),
(1404, 1, 5, 'modelDate', 'modelDate', 'The release date of a vehicle model (often used to differentiate versions of the same make and model).'),
(1405, 1, 5, 'embedUrl', 'embedUrl', 'A URL pointing to a player for a specific video. In general, this is the information in the <code>src</code> element of an <code>embed</code> tag and should not be the same as the content of the <code>loc</code> tag.'),
(1406, 1, 5, 'coach', 'coach', 'A person that acts in a coaching role for a sports team.'),
(1407, 1, 5, 'causeOf', 'causeOf', 'The condition, complication, symptom, sign, etc. caused.'),
(1408, 1, 5, 'replacee', 'replacee', 'A sub property of object. The object that is being replaced.'),
(1409, 1, 5, 'antagonist', 'antagonist', 'The muscle whose action counteracts the specified muscle.'),
(1410, 1, 5, 'verificationFactCheckingPolicy', 'verificationFactCheckingPolicy', 'Disclosure about verification and fact-checking processes for a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a> or other fact-checking <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>.'),
(1411, 1, 5, 'abridged', 'abridged', 'Indicates whether the book is an abridged edition.'),
(1412, 1, 5, 'studyLocation', 'studyLocation', 'The location in which the study is taking/took place.'),
(1413, 1, 5, 'breastfeedingWarning', 'breastfeedingWarning', 'Any precaution, guidance, contraindication, etc. related to this drug\'s use by breastfeeding mothers.'),
(1414, 1, 5, 'mpn', 'mpn', 'The Manufacturer Part Number (MPN) of the product, or the product to which the offer refers.'),
(1415, 1, 5, 'startDate', 'startDate', 'The start date and time of the item (in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 date format</a>).'),
(1416, 1, 5, 'marginOfError', 'marginOfError', 'A marginOfError for an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>.'),
(1417, 1, 5, 'sportsActivityLocation', 'sportsActivityLocation', 'A sub property of location. The sports activity location where this action occurred.'),
(1418, 1, 5, 'diagram', 'diagram', 'An image containing a diagram that illustrates the structure and/or its component substructures and/or connections with other structures.'),
(1419, 1, 5, 'commentTime', 'commentTime', 'The time at which the UserComment was made.'),
(1420, 1, 5, 'honorificSuffix', 'honorificSuffix', 'An honorific suffix preceding a Person\'s name such as M.D. /PhD/MSCSW.'),
(1421, 1, 5, 'areaServed', 'areaServed', 'The geographic area where a service or offered item is provided.'),
(1422, 1, 5, 'trackingNumber', 'trackingNumber', 'Shipper tracking number.'),
(1423, 1, 5, 'producer', 'producer', 'The person or organization who produced the work (e.g. music album, movie, tv/radio series etc.).'),
(1424, 1, 5, 'alumniOf', 'alumniOf', 'An organization that the person is an alumni of.'),
(1425, 1, 5, 'numberOfEmployees', 'numberOfEmployees', 'The number of employees in an organization e.g. business.'),
(1426, 1, 5, 'acceptedPaymentMethod', 'acceptedPaymentMethod', 'The payment method(s) accepted by seller for this offer.'),
(1427, 1, 5, 'runtimePlatform', 'runtimePlatform', 'Runtime platform or script interpreter dependencies (Example - Java v1, Python2.3, .Net Framework 3.0).'),
(1428, 1, 5, 'commentText', 'commentText', 'The text of the UserComment.'),
(1429, 1, 5, 'softwareAddOn', 'softwareAddOn', 'Additional content for a software application.'),
(1430, 1, 5, 'contactType', 'contactType', 'A person or organization can have different contact points, for different purposes. For example, a sales contact point, a PR contact point and so on. This property is used to specify the kind of contact point.'),
(1431, 1, 5, 'photo', 'photo', 'A photograph of this place.'),
(1432, 1, 5, 'performer', 'performer', 'A performer at the event&#x2014;for example, a presenter, musician, musical group or actor.'),
(1433, 1, 5, 'legislationChanges', 'legislationChanges', 'Another legislation that this legislation changes. This encompasses the notions of amendment, replacement, correction, repeal, or other types of change. This may be a direct change (textual or non-textual amendment) or a consequential or indirect change. The property is to be used to express the existence of a change relationship between two acts rather than the existence of a consolidated version of the text that shows the result of the change. For consolidation relationships, use the <a href=\"/legislationConsolidates\">legislationConsolidates</a> property.'),
(1434, 1, 5, 'arrivalTime', 'arrivalTime', 'The expected arrival time.'),
(1435, 1, 5, 'addressCountry', 'addressCountry', 'The country. For example, USA. You can also provide the two-letter <a href=\"http://en.wikipedia.org/wiki/ISO_3166-1\">ISO 3166-1 alpha-2 country code</a>.'),
(1436, 1, 5, 'orderItemStatus', 'orderItemStatus', 'The current status of the order item.'),
(1437, 1, 5, 'differentialDiagnosis', 'differentialDiagnosis', 'One of a set of differential diagnoses for the condition. Specifically, a closely-related or competing diagnosis typically considered later in the cognitive process whereby this medical condition is distinguished from others most likely responsible for a similar collection of signs and symptoms to reach the most parsimonious diagnosis or diagnoses in a patient.'),
(1438, 1, 5, 'actionableFeedbackPolicy', 'actionableFeedbackPolicy', 'For a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a> or other news-related <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>, a statement about public engagement activities (for news media, the newsroom’s), including involving the public - digitally or otherwise -- in coverage decisions, reporting and activities after publication.'),
(1439, 1, 5, 'variesBy', 'variesBy', 'Indicates the property or properties by which the variants in a <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a> vary, e.g. their size, color etc. Schema.org properties can be referenced by their short name e.g. \"color\"; terms defined elsewhere can be referenced with their URIs.'),
(1440, 1, 5, 'saturatedFatContent', 'saturatedFatContent', 'The number of grams of saturated fat.'),
(1441, 1, 5, 'artMedium', 'artMedium', 'The material used. (e.g. Oil, Watercolour, Acrylic, Linoprint, Marble, Cyanotype, Digital, Lithograph, DryPoint, Intaglio, Pastel, Woodcut, Pencil, Mixed Media, etc.)'),
(1442, 1, 5, 'isicV4', 'isicV4', 'The International Standard of Industrial Classification of All Economic Activities (ISIC), Revision 4 code for a particular organization, business person, or place.');
INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1443, 1, 5, 'disambiguatingDescription', 'disambiguatingDescription', 'A sub property of description. A short description of the item used to disambiguate from other, similar items. Information from other properties (in particular, name) may be necessary for the description to be useful for disambiguation.'),
(1444, 1, 5, 'discusses', 'discusses', 'Specifies the CreativeWork associated with the UserComment.'),
(1445, 1, 5, 'tickerSymbol', 'tickerSymbol', 'The exchange traded instrument associated with a Corporation object. The tickerSymbol is expressed as an exchange and an instrument name separated by a space character. For the exchange component of the tickerSymbol attribute, we recommend using the controlled vocabulary of Market Identifier Codes (MIC) specified in ISO15022.'),
(1446, 1, 5, 'courseCode', 'courseCode', 'The identifier for the <a class=\"localLink\" href=\"http://schema.org/Course\">Course</a> used by the course <a class=\"localLink\" href=\"http://schema.org/provider\">provider</a> (e.g. CS101 or 6.001).'),
(1447, 1, 5, 'handlingTime', 'handlingTime', 'The typical delay between the receipt of the order and the goods either leaving the warehouse or being prepared for pickup, in case the delivery method is on site pickup. Typical properties: minValue, maxValue, unitCode (d for DAY).  This is by common convention assumed to mean business days (if a unitCode is used, coded as \"d\"), i.e. only counting days when the business normally operates.'),
(1448, 1, 5, 'masthead', 'masthead', 'For a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>, a link to the masthead page or a page listing top editorial management.'),
(1449, 1, 5, 'travelBans', 'travelBans', 'Information about travel bans, e.g. in the context of a pandemic.'),
(1450, 1, 5, 'trackingUrl', 'trackingUrl', 'Tracking url for the parcel delivery.'),
(1451, 1, 5, 'warranty', 'warranty', 'The warranty promise(s) included in the offer.'),
(1452, 1, 5, 'reviewBody', 'reviewBody', 'The actual body of the review.'),
(1453, 1, 5, 'partOfSystem', 'partOfSystem', 'The anatomical or organ system that this structure is part of.'),
(1454, 1, 5, 'founders', 'founders', 'A person who founded this organization.'),
(1455, 1, 5, 'creator', 'creator', 'The creator/author of this CreativeWork. This is the same as the Author property for CreativeWork.'),
(1456, 1, 5, 'healthPlanPharmacyCategory', 'healthPlanPharmacyCategory', 'The category or type of pharmacy associated with this cost sharing.'),
(1457, 1, 5, 'countriesSupported', 'countriesSupported', 'Countries for which the application is supported. You can also provide the two-letter ISO 3166-1 alpha-2 country code.'),
(1458, 1, 5, 'tributary', 'tributary', 'The anatomical or organ system that the vein flows into; a larger structure that the vein connects to.'),
(1459, 1, 5, 'payload', 'payload', 'The permitted weight of passengers and cargo, EXCLUDING the weight of the empty vehicle.<br/><br/>\n\nTypical unit code(s): KGM for kilogram, LBR for pound<br/><br/>\n\n<ul>\n<li>Note 1: Many databases specify the permitted TOTAL weight instead, which is the sum of <a class=\"localLink\" href=\"http://schema.org/weight\">weight</a> and <a class=\"localLink\" href=\"http://schema.org/payload\">payload</a></li>\n<li>Note 2: You can indicate additional information in the <a class=\"localLink\" href=\"http://schema.org/name\">name</a> of the <a class=\"localLink\" href=\"http://schema.org/QuantitativeValue\">QuantitativeValue</a> node.</li>\n<li>Note 3: You may also link to a <a class=\"localLink\" href=\"http://schema.org/QualitativeValue\">QualitativeValue</a> node that provides additional information using <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a>.</li>\n<li>Note 4: Note that you can use <a class=\"localLink\" href=\"http://schema.org/minValue\">minValue</a> and <a class=\"localLink\" href=\"http://schema.org/maxValue\">maxValue</a> to indicate ranges.</li>\n</ul>\n'),
(1460, 1, 5, 'measuredValue', 'measuredValue', 'The measuredValue of an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>.'),
(1461, 1, 5, 'publishedBy', 'publishedBy', 'An agent associated with the publication event.'),
(1462, 1, 5, 'iswcCode', 'iswcCode', 'The International Standard Musical Work Code for the composition.'),
(1463, 1, 5, 'hiringOrganization', 'hiringOrganization', 'Organization offering the job position.'),
(1464, 1, 5, 'vendor', 'vendor', '\'vendor\' is an earlier term for \'seller\'.'),
(1465, 1, 5, 'arrivalPlatform', 'arrivalPlatform', 'The platform where the train arrives.'),
(1466, 1, 5, 'orderStatus', 'orderStatus', 'The current status of the order.'),
(1467, 1, 5, 'scheduledTime', 'scheduledTime', 'The time the object is scheduled to.'),
(1468, 1, 5, 'locationCreated', 'locationCreated', 'The location where the CreativeWork was created, which may not be the same as the location depicted in the CreativeWork.'),
(1469, 1, 5, 'recognizingAuthority', 'recognizingAuthority', 'If applicable, the organization that officially recognizes this entity as part of its endorsed system of medicine.'),
(1470, 1, 5, 'governmentBenefitsInfo', 'governmentBenefitsInfo', 'governmentBenefitsInfo provides information about government benefits associated with a SpecialAnnouncement.'),
(1471, 1, 5, 'muscleAction', 'muscleAction', 'The movement the muscle generates.'),
(1472, 1, 5, 'maximumEnrollment', 'maximumEnrollment', 'The maximum number of students who may be enrolled in the program.'),
(1473, 1, 5, 'noBylinesPolicy', 'noBylinesPolicy', 'For a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a> or other news-related <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>, a statement explaining when authors of articles are not named in bylines.'),
(1474, 1, 5, 'customer', 'customer', 'Party placing the order or paying the invoice.'),
(1475, 1, 5, 'stepValue', 'stepValue', 'The stepValue attribute indicates the granularity that is expected (and required) of the value in a PropertyValueSpecification.'),
(1476, 1, 5, 'lastReviewed', 'lastReviewed', 'Date on which the content on this web page was last reviewed for accuracy and/or completeness.'),
(1477, 1, 5, 'fiberContent', 'fiberContent', 'The number of grams of fiber.'),
(1478, 1, 5, 'amountOfThisGood', 'amountOfThisGood', 'The quantity of the goods included in the offer.'),
(1479, 1, 5, 'nonEqual', 'nonEqual', 'This ordering relation for qualitative values indicates that the subject is not equal to the object.'),
(1480, 1, 5, 'accommodationFloorPlan', 'accommodationFloorPlan', 'A floorplan of some <a class=\"localLink\" href=\"http://schema.org/Accommodation\">Accommodation</a>.'),
(1481, 1, 5, 'catalog', 'catalog', 'A data catalog which contains this dataset.'),
(1482, 1, 5, 'numberOfItems', 'numberOfItems', 'The number of items in an ItemList. Note that some descriptions might not fully describe all items in a list (e.g., multi-page pagination); in such cases, the numberOfItems would be for the entire list.'),
(1483, 1, 5, 'photos', 'photos', 'Photographs of this place.'),
(1484, 1, 5, 'audience', 'audience', 'An intended audience, i.e. a group for whom something was created.'),
(1485, 1, 5, 'recourseLoan', 'recourseLoan', 'The only way you get the money back in the event of default is the security. Recourse is where you still have the opportunity to go back to the borrower for the rest of the money.'),
(1486, 1, 5, 'qualifications', 'qualifications', 'Specific qualifications required for this role or Occupation.'),
(1487, 1, 5, 'exerciseRelatedDiet', 'exerciseRelatedDiet', 'A sub property of instrument. The diet used in this action.'),
(1488, 1, 5, 'cssSelector', 'cssSelector', 'A CSS selector, e.g. of a <a class=\"localLink\" href=\"http://schema.org/SpeakableSpecification\">SpeakableSpecification</a> or <a class=\"localLink\" href=\"http://schema.org/WebPageElement\">WebPageElement</a>. In the latter case, multiple matches within a page can constitute a single conceptual \"Web page element\".'),
(1489, 1, 5, 'recipe', 'recipe', 'A sub property of instrument. The recipe/instructions used to perform the action.'),
(1490, 1, 5, 'percentile90', 'percentile90', 'The 90th percentile value.'),
(1491, 1, 5, 'appliesToPaymentMethod', 'appliesToPaymentMethod', 'The payment method(s) to which the payment charge specification applies.'),
(1492, 1, 5, 'tool', 'tool', 'A sub property of instrument. An object used (but not consumed) when performing instructions or a direction.'),
(1493, 1, 5, 'tissueSample', 'tissueSample', 'The type of tissue sample required for the test.'),
(1494, 1, 5, 'recommendedIntake', 'recommendedIntake', 'Recommended intake of this supplement for a given population as defined by a specific recommending authority.'),
(1495, 1, 5, 'printPage', 'printPage', 'If this NewsArticle appears in print, this field indicates the name of the page on which the article is found. Please note that this field is intended for the exact page name (e.g. A5, B18).'),
(1496, 1, 5, 'elevation', 'elevation', 'The elevation of a location (<a href=\"https://en.wikipedia.org/wiki/World_Geodetic_System\">WGS 84</a>). Values may be of the form \'NUMBER UNIT<em>OF</em>MEASUREMENT\' (e.g., \'1,000 m\', \'3,200 ft\') while numbers alone should be assumed to be a value in meters.'),
(1497, 1, 5, 'characterAttribute', 'characterAttribute', 'A piece of data that represents a particular aspect of a fictional character (skill, power, character points, advantage, disadvantage).'),
(1498, 1, 5, 'urlTemplate', 'urlTemplate', 'An url template (RFC6570) that will be used to construct the target of the execution of the action.'),
(1499, 1, 5, 'numberOfSeasons', 'numberOfSeasons', 'The number of seasons in this series.'),
(1500, 1, 5, 'modifiedTime', 'modifiedTime', 'The date and time the reservation was modified.'),
(1501, 1, 5, 'predecessorOf', 'predecessorOf', 'A pointer from a previous, often discontinued variant of the product to its newer variant.'),
(1502, 1, 5, 'startTime', 'startTime', 'The startTime of something. For a reserved event or service (e.g. FoodEstablishmentReservation), the time that it is expected to start. For actions that span a period of time, when the action was performed. e.g. John wrote a book from <em>January</em> to December. For media, including audio and video, it\'s the time offset of the start of a clip within a larger file.<br/><br/>\n\nNote that Event uses startDate/endDate instead of startTime/endTime, even when describing dates with times. This situation may be clarified in future revisions.'),
(1503, 1, 5, 'risks', 'risks', 'Specific physiologic risks associated to the diet plan.'),
(1504, 1, 5, 'targetDescription', 'targetDescription', 'The description of a node in an established educational framework.'),
(1505, 1, 5, 'baseSalary', 'baseSalary', 'The base salary of the job or of an employee in an EmployeeRole.'),
(1506, 1, 5, 'bestRating', 'bestRating', 'The highest value allowed in this rating system. If bestRating is omitted, 5 is assumed.'),
(1507, 1, 5, 'endorsee', 'endorsee', 'A sub property of participant. The person/organization being supported.'),
(1508, 1, 5, 'geoCovers', 'geoCovers', 'Represents a relationship between two geometries (or the places they represent), relating a covering geometry to a covered geometry. \"Every point of b is a point of (the interior or boundary of) a\". As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(1509, 1, 5, 'runtime', 'runtime', 'Runtime platform or script interpreter dependencies (Example - Java v1, Python2.3, .Net Framework 3.0).'),
(1510, 1, 5, 'lodgingUnitType', 'lodgingUnitType', 'Textual description of the unit type (including suite vs. room, size of bed, etc.).'),
(1511, 1, 5, 'broadcastTimezone', 'broadcastTimezone', 'The timezone in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 format</a> for which the service bases its broadcasts'),
(1512, 1, 5, 'image', 'image', 'An image of the item. This can be a <a class=\"localLink\" href=\"http://schema.org/URL\">URL</a> or a fully described <a class=\"localLink\" href=\"http://schema.org/ImageObject\">ImageObject</a>.'),
(1513, 1, 5, 'numberOfPages', 'numberOfPages', 'The number of pages in the book.'),
(1514, 1, 5, 'pregnancyCategory', 'pregnancyCategory', 'Pregnancy category of this drug.'),
(1515, 1, 5, 'usedToDiagnose', 'usedToDiagnose', 'A condition the test is used to diagnose.'),
(1516, 1, 5, 'messageAttachment', 'messageAttachment', 'A CreativeWork attached to the message.'),
(1517, 1, 5, 'releaseDate', 'releaseDate', 'The release date of a product or product model. This can be used to distinguish the exact variant of a product.'),
(1518, 1, 5, 'fuelConsumption', 'fuelConsumption', 'The amount of fuel consumed for traveling a particular distance or temporal duration with the given vehicle (e.g. liters per 100 km).<br/><br/>\n\n<ul>\n<li>Note 1: There are unfortunately no standard unit codes for liters per 100 km.  Use <a class=\"localLink\" href=\"http://schema.org/unitText\">unitText</a> to indicate the unit of measurement, e.g. L/100 km.</li>\n<li>Note 2: There are two ways of indicating the fuel consumption, <a class=\"localLink\" href=\"http://schema.org/fuelConsumption\">fuelConsumption</a> (e.g. 8 liters per 100 km) and <a class=\"localLink\" href=\"http://schema.org/fuelEfficiency\">fuelEfficiency</a> (e.g. 30 miles per gallon). They are reciprocal.</li>\n<li>Note 3: Often, the absolute value is useful only when related to driving speed (\"at 80 km/h\") or usage pattern (\"city traffic\"). You can use <a class=\"localLink\" href=\"http://schema.org/valueReference\">valueReference</a> to link the value for the fuel consumption to another value.</li>\n</ul>\n'),
(1519, 1, 5, 'toRecipient', 'toRecipient', 'A sub property of recipient. The recipient who was directly sent the message.'),
(1520, 1, 5, 'successorOf', 'successorOf', 'A pointer from a newer variant of a product  to its previous, often discontinued predecessor.'),
(1521, 1, 5, 'geoCrosses', 'geoCrosses', 'Represents a relationship between two geometries (or the places they represent), relating a geometry to another that crosses it: \"a crosses b: they have some but not all interior points in common, and the dimension of the intersection is less than that of at least one of them\". As defined in <a href=\"https://en.wikipedia.org/wiki/DE-9IM\">DE-9IM</a>.'),
(1522, 1, 5, 'acquireLicensePage', 'acquireLicensePage', 'Indicates a page documenting how licenses can be purchased or otherwise acquired, for the current item.'),
(1523, 1, 5, 'assesses', 'assesses', 'The item being described is intended to assess the competency or learning outcome defined by the referenced term.'),
(1524, 1, 5, 'recordedAt', 'recordedAt', 'The Event where the CreativeWork was recorded. The CreativeWork may capture all or part of the event.'),
(1525, 1, 5, 'nextItem', 'nextItem', 'A link to the ListItem that follows the current one.'),
(1526, 1, 5, 'earlyPrepaymentPenalty', 'earlyPrepaymentPenalty', 'The amount to be paid as a penalty in the event of early payment of the loan.'),
(1527, 1, 5, 'proprietaryName', 'proprietaryName', 'Proprietary name given to the diet plan, typically by its originator or creator.'),
(1528, 1, 5, 'incentiveCompensation', 'incentiveCompensation', 'Description of bonus and commission compensation aspects of the job.'),
(1529, 1, 5, 'printEdition', 'printEdition', 'The edition of the print product in which the NewsArticle appears.'),
(1530, 1, 5, 'subReservation', 'subReservation', 'The individual reservations included in the package. Typically a repeated property.'),
(1531, 1, 5, 'browserRequirements', 'browserRequirements', 'Specifies browser requirements in human-readable text. For example, \'requires HTML5 support\'.'),
(1532, 1, 5, 'missionCoveragePrioritiesPolicy', 'missionCoveragePrioritiesPolicy', 'For a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a>, a statement on coverage priorities, including any public agenda or stance on issues.'),
(1533, 1, 5, 'servingSize', 'servingSize', 'The serving size, in terms of the number of volume or mass.'),
(1534, 1, 5, 'guidelineDate', 'guidelineDate', 'Date on which this guideline\'s recommendation was made.'),
(1535, 1, 5, 'material', 'material', 'A material that something is made from, e.g. leather, wool, cotton, paper.'),
(1536, 1, 5, 'contentType', 'contentType', 'The supported content type(s) for an EntryPoint response.'),
(1537, 1, 5, 'pagination', 'pagination', 'Any description of pages that is not separated into pageStart and pageEnd; for example, \"1-6, 9, 55\" or \"10-12, 46-49\".'),
(1538, 1, 5, 'constrainingProperty', 'constrainingProperty', 'Indicates a property used as a constraint to define a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a> with respect to the set of entities\n  corresponding to an indicated type (via <a class=\"localLink\" href=\"http://schema.org/populationType\">populationType</a>).'),
(1539, 1, 5, 'duns', 'duns', 'The Dun &amp; Bradstreet DUNS number for identifying an organization or business person.'),
(1540, 1, 5, 'area', 'area', 'The area within which users can expect to reach the broadcast service.'),
(1541, 1, 5, 'athlete', 'athlete', 'A person that acts as performing member of a sports team; a player as opposed to a coach.'),
(1542, 1, 5, 'productGroupID', 'productGroupID', 'Indicates a textual identifier for a ProductGroup.'),
(1543, 1, 5, 'firstPerformance', 'firstPerformance', 'The date and place the work was first performed.'),
(1544, 1, 5, 'superEvent', 'superEvent', 'An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.'),
(1545, 1, 5, 'interactionService', 'interactionService', 'The WebSite or SoftwareApplication where the interactions took place.');

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
(2, 1, 23, NULL, NULL, 'Views', 1, '2020-07-29 17:34:45', '2020-07-29 17:34:45', 'Omeka\\Entity\\ItemSet'),
(4, 1, 32, 2, NULL, 'Museu Nacional, antigo Palácio Imperial de São Cristóvão', 1, '2020-07-29 17:53:17', '2020-11-20 18:29:45', 'Omeka\\Entity\\Item'),
(5, 1, 32, 2, NULL, 'Teatro Municipal', 1, '2020-07-29 17:53:17', '2020-11-20 18:29:45', 'Omeka\\Entity\\Item'),
(6, 1, 32, 2, NULL, 'Vista do Rio de Janeiro, tendo o Gasômetro em primeiro plano', 1, '2020-07-29 17:53:17', '2020-11-20 18:29:45', 'Omeka\\Entity\\Item'),
(7, 1, 32, 2, NULL, 'Substituição da iluminação pública de gás para lâmpadas incandescentes', 1, '2020-07-29 17:53:17', '2020-11-20 18:29:45', 'Omeka\\Entity\\Item'),
(8, 1, 32, 2, NULL, 'Avenida Vieira Souto - depois da substituição da iluminação pública de gás para lâmpadas incandescentes', 1, '2020-07-29 17:53:17', '2020-11-20 18:29:45', 'Omeka\\Entity\\Item'),
(9, 1, 26, 3, NULL, NULL, 1, '2020-07-29 17:54:57', '2020-11-13 00:07:35', 'Omeka\\Entity\\Media'),
(10, 1, 26, 3, NULL, NULL, 1, '2020-07-29 17:55:08', '2020-11-13 00:02:15', 'Omeka\\Entity\\Media'),
(11, 1, 26, 3, NULL, NULL, 1, '2020-07-29 17:55:21', '2020-11-13 00:04:35', 'Omeka\\Entity\\Media'),
(12, 1, 26, 3, NULL, NULL, 1, '2020-07-29 17:55:34', '2020-11-13 00:07:01', 'Omeka\\Entity\\Media'),
(13, 1, 26, 3, NULL, NULL, 1, '2020-07-29 17:55:47', '2020-11-13 00:06:31', 'Omeka\\Entity\\Media'),
(14, 1, 23, 3, NULL, 'Smapshot', 1, '2020-11-12 22:03:11', '2020-11-13 00:57:54', 'Omeka\\Entity\\ItemSet'),
(15, 1, 23, 4, NULL, 'Maps', 1, '2020-11-13 00:10:20', '2020-11-13 00:57:44', 'Omeka\\Entity\\ItemSet'),
(16, 1, 23, 4, NULL, 'Aerials', 1, '2020-11-13 00:15:11', '2020-11-13 00:57:36', 'Omeka\\Entity\\ItemSet'),
(17, 1, 23, 4, NULL, 'All', 1, '2020-11-13 00:17:26', '2020-11-13 00:57:25', 'Omeka\\Entity\\ItemSet'),
(18, 1, 23, 4, NULL, 'Plans', 1, '2020-11-13 00:19:57', '2020-11-13 00:57:14', 'Omeka\\Entity\\ItemSet');

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
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'ClaimReview', 'ClaimReview', 'A fact-checking review of claims made (or reported) in some creative work (referenced via itemReviewed).'),
(107, 1, 5, 'EventReservation', 'EventReservation', 'A reservation for an event like a concert, sporting event, or lecture.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(108, 1, 5, 'Plumber', 'Plumber', 'A plumbing service.'),
(109, 1, 5, 'PodcastSeries', 'PodcastSeries', 'A podcast is an episodic series of digital audio or video files which a user can download and listen to.'),
(110, 1, 5, 'ExchangeRateSpecification', 'ExchangeRateSpecification', 'A structured value representing exchange rate.'),
(111, 1, 5, 'ComicSeries', 'ComicSeries', 'A sequential publication of comic stories under a\n        unifying title, for example \"The Amazing Spider-Man\" or \"Groo the\n        Wanderer\".'),
(112, 1, 5, 'FindAction', 'FindAction', 'The act of finding an object.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/SearchAction\">SearchAction</a>: FindAction is generally lead by a SearchAction, but not necessarily.</li>\n</ul>\n'),
(113, 1, 5, 'TieAction', 'TieAction', 'The act of reaching a draw in a competitive activity.'),
(114, 1, 5, 'ConvenienceStore', 'ConvenienceStore', 'A convenience store.'),
(115, 1, 5, 'TVEpisode', 'TVEpisode', 'A TV episode which can be part of a series or season.'),
(116, 1, 5, 'RVPark', 'RVPark', 'A place offering space for \"Recreational Vehicles\", Caravans, mobile homes and the like.'),
(117, 1, 5, 'MoneyTransfer', 'MoneyTransfer', 'The act of transferring money from one place to another place. This may occur electronically or physically.'),
(118, 1, 5, 'SiteNavigationElement', 'SiteNavigationElement', 'A navigation element of the page.'),
(119, 1, 5, 'ItemAvailability', 'ItemAvailability', 'A list of possible product availability options.'),
(120, 1, 5, 'SingleFamilyResidence', 'SingleFamilyResidence', 'Residence type: Single-family home.'),
(121, 1, 5, 'Quantity', 'Quantity', 'Quantities such as distance, time, mass, weight, etc. Particular instances of say Mass are entities like \'3 Kg\' or \'4 milligrams\'.'),
(122, 1, 5, 'BroadcastService', 'BroadcastService', 'A delivery service through which content is provided via broadcast over the air or online.'),
(123, 1, 5, 'Action', 'Action', 'An action performed by a direct agent and indirect participants upon a direct object. Optionally happens at a location with the help of an inanimate instrument. The execution of the action may produce a result. Specific action sub-type documentation specifies the exact expectation of each argument/role.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/04/announcing-schemaorg-actions.html\">blog post</a> and <a href=\"http://schema.org/docs/actions.html\">Actions overview document</a>.'),
(124, 1, 5, 'ArchiveComponent', 'ArchiveComponent', 'An intangible type to be applied to any archive content, carrying with it a set of properties required to describe archival items and collections.'),
(125, 1, 5, 'ClothingStore', 'ClothingStore', 'A clothing store.'),
(126, 1, 5, 'DateTime', 'DateTime', 'A combination of date and time of day in the form [-]CCYY-MM-DDThh:mm:ss[Z|(+|-)hh:mm] (see Chapter 5.4 of ISO 8601).'),
(127, 1, 5, 'Diet', 'Diet', 'A strategy of regulating the intake of food to achieve or maintain a specific health-related goal.'),
(128, 1, 5, 'NewsArticle', 'NewsArticle', 'A NewsArticle is an article whose content reports news, or provides background context and supporting materials for understanding the news.<br/><br/>\n\nA more detailed overview of <a href=\"/docs/news.html\">schema.org News markup</a> is also available.'),
(129, 1, 5, 'SkiResort', 'SkiResort', 'A ski resort.'),
(130, 1, 5, 'HowToItem', 'HowToItem', 'An item used as either a tool or supply when performing the instructions for how to to achieve a result.'),
(131, 1, 5, 'WearAction', 'WearAction', 'The act of dressing oneself in clothing.'),
(132, 1, 5, 'DrugClass', 'DrugClass', 'A class of medical drugs, e.g., statins. Classes can represent general pharmacological class, common mechanisms of action, common physiological effects, etc.'),
(133, 1, 5, 'Corporation', 'Corporation', 'Organization: A business corporation.'),
(134, 1, 5, 'MedicalGuideline', 'MedicalGuideline', 'Any recommendation made by a standard society (e.g. ACC/AHA) or consensus statement that denotes how to diagnose and treat a particular condition. Note: this type should be used to tag the actual guideline recommendation; if the guideline recommendation occurs in a larger scholarly article, use MedicalScholarlyArticle to tag the overall article, not this type. Note also: the organization making the recommendation should be captured in the recognizingAuthority base property of MedicalEntity.'),
(135, 1, 5, 'SchoolDistrict', 'SchoolDistrict', 'A School District is an administrative area for the administration of schools.'),
(136, 1, 5, 'PerformingArtsTheater', 'PerformingArtsTheater', 'A theater or other performing art center.'),
(137, 1, 5, 'Quotation', 'Quotation', 'A quotation. Often but not necessarily from some written work, attributable to a real world author and - if associated with a fictional character - to any fictional Person. Use <a class=\"localLink\" href=\"http://schema.org/isBasedOn\">isBasedOn</a> to link to source/origin. The <a class=\"localLink\" href=\"http://schema.org/recordedIn\">recordedIn</a> property can be used to reference a Quotation from an <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a>.'),
(138, 1, 5, 'DiscoverAction', 'DiscoverAction', 'The act of discovering/finding an object.'),
(139, 1, 5, 'OrderAction', 'OrderAction', 'An agent orders an object/product/service to be delivered/sent.'),
(140, 1, 5, 'Observation', 'Observation', 'Instances of the class <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a> are used to specify observations about an entity (which may or may not be an instance of a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>), at a particular time. The principal properties of an <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a> are <a class=\"localLink\" href=\"http://schema.org/observedNode\">observedNode</a>, <a class=\"localLink\" href=\"http://schema.org/measuredProperty\">measuredProperty</a>, <a class=\"localLink\" href=\"http://schema.org/measuredValue\">measuredValue</a> (or <a class=\"localLink\" href=\"http://schema.org/median\">median</a>, etc.) and <a class=\"localLink\" href=\"http://schema.org/observationDate\">observationDate</a> (<a class=\"localLink\" href=\"http://schema.org/measuredProperty\">measuredProperty</a> properties can, but need not always, be W3C RDF Data Cube \"measure properties\", as in the <a href=\"https://www.w3.org/TR/vocab-data-cube/#dsd-example\">lifeExpectancy example</a>).\nSee also <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a>, and the <a href=\"/docs/data-and-datasets.html\">data and datasets</a> overview for more details.'),
(141, 1, 5, 'AutoPartsStore', 'AutoPartsStore', 'An auto parts store.'),
(142, 1, 5, 'TreatmentIndication', 'TreatmentIndication', 'An indication for treating an underlying condition, symptom, etc.'),
(143, 1, 5, 'Residence', 'Residence', 'The place where a person lives.'),
(144, 1, 5, 'InvestmentOrDeposit', 'InvestmentOrDeposit', 'A type of financial product that typically requires the client to transfer funds to a financial service in return for potential beneficial financial return.'),
(145, 1, 5, 'OrganizationRole', 'OrganizationRole', 'A subclass of Role used to describe roles within organizations.'),
(146, 1, 5, 'DigitalDocumentPermissionType', 'DigitalDocumentPermissionType', 'A type of permission which can be granted for accessing a digital document.'),
(147, 1, 5, 'MedicalAudienceType', 'MedicalAudienceType', 'Target audiences types for medical web pages. Enumerated type.'),
(148, 1, 5, 'HotelRoom', 'HotelRoom', 'A hotel room is a single room in a hotel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(149, 1, 5, 'MedicalCode', 'MedicalCode', 'A code for a medical entity.'),
(150, 1, 5, 'Suite', 'Suite', 'A suite in a hotel or other public accommodation, denotes a class of luxury accommodations, the key feature of which is multiple rooms (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Suite_(hotel)\">http://en.wikipedia.org/wiki/Suite_(hotel)</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(151, 1, 5, 'Specialty', 'Specialty', 'Any branch of a field in which people typically develop specific expertise, usually after significant study, time, and effort.'),
(152, 1, 5, 'Drawing', 'Drawing', 'A picture or diagram made with a pencil, pen, or crayon rather than paint.'),
(153, 1, 5, 'MonetaryGrant', 'MonetaryGrant', 'A monetary grant.'),
(154, 1, 5, 'Permit', 'Permit', 'A permit issued by an organization, e.g. a parking pass.'),
(155, 1, 5, 'EmploymentAgency', 'EmploymentAgency', 'An employment agency.'),
(156, 1, 5, 'PerformAction', 'PerformAction', 'The act of participating in performance arts.'),
(157, 1, 5, 'HowToDirection', 'HowToDirection', 'A direction indicating a single action to do in the instructions for how to achieve a result.'),
(158, 1, 5, 'SpeakableSpecification', 'SpeakableSpecification', 'A SpeakableSpecification indicates (typically via <a class=\"localLink\" href=\"http://schema.org/xpath\">xpath</a> or <a class=\"localLink\" href=\"http://schema.org/cssSelector\">cssSelector</a>) sections of a document that are highlighted as particularly <a class=\"localLink\" href=\"http://schema.org/speakable\">speakable</a>. Instances of this type are expected to be used primarily as values of the <a class=\"localLink\" href=\"http://schema.org/speakable\">speakable</a> property.'),
(159, 1, 5, 'TaxiStand', 'TaxiStand', 'A taxi stand.'),
(160, 1, 5, 'RecommendedDoseSchedule', 'RecommendedDoseSchedule', 'A recommended dosing schedule for a drug or supplement as prescribed or recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(161, 1, 5, 'LiquorStore', 'LiquorStore', 'A shop that sells alcoholic drinks such as wine, beer, whisky and other spirits.'),
(162, 1, 5, 'BusStation', 'BusStation', 'A bus station.'),
(163, 1, 5, 'GameServerStatus', 'GameServerStatus', 'Status of a game server.'),
(164, 1, 5, 'CourseInstance', 'CourseInstance', 'An instance of a <a class=\"localLink\" href=\"http://schema.org/Course\">Course</a> which is distinct from other instances because it is offered at a different time or location or through different media or modes of study or to a specific section of students.'),
(165, 1, 5, 'VisualArtsEvent', 'VisualArtsEvent', 'Event type: Visual arts event.'),
(166, 1, 5, 'USNonprofitType', 'USNonprofitType', 'USNonprofitType: Non-profit organization type originating from the United States.'),
(167, 1, 5, 'PathologyTest', 'PathologyTest', 'A medical test performed by a laboratory that typically involves examination of a tissue sample by a pathologist.'),
(168, 1, 5, 'BookFormatType', 'BookFormatType', 'The publication format of the book.'),
(169, 1, 5, 'ProductModel', 'ProductModel', 'A datasheet or vendor specification of a product (in the sense of a prototypical description).'),
(170, 1, 5, 'SportsTeam', 'SportsTeam', 'Organization: Sports team.'),
(171, 1, 5, 'ProgramMembership', 'ProgramMembership', 'Used to describe membership in a loyalty programs (e.g. \"StarAliance\"), traveler clubs (e.g. \"AAA\"), purchase clubs (\"Safeway Club\"), etc.'),
(172, 1, 5, 'UserPageVisits', 'UserPageVisits', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(173, 1, 5, 'ScreeningEvent', 'ScreeningEvent', 'A screening of a movie or other video.'),
(174, 1, 5, 'PhysicalActivity', 'PhysicalActivity', 'Any bodily activity that enhances or maintains physical fitness and overall health and wellness. Includes activity that is part of daily living and routine, structured exercise, and exercise prescribed as part of a medical treatment or recovery plan.'),
(175, 1, 5, 'ArchiveOrganization', 'ArchiveOrganization', 'An organization with archival holdings. An organization which keeps and preserves archival material and typically makes it accessible to the public.'),
(176, 1, 5, 'PostalAddress', 'PostalAddress', 'The mailing address.'),
(177, 1, 5, 'EntertainmentBusiness', 'EntertainmentBusiness', 'A business providing entertainment.'),
(178, 1, 5, 'ChildCare', 'ChildCare', 'A Childcare center.'),
(179, 1, 5, 'ItemListOrderType', 'ItemListOrderType', 'Enumerated for values for itemListOrder for indicating how an ordered ItemList is organized.'),
(180, 1, 5, 'LakeBodyOfWater', 'LakeBodyOfWater', 'A lake (for example, Lake Pontrachain).'),
(181, 1, 5, 'BrokerageAccount', 'BrokerageAccount', 'An account that allows an investor to deposit funds and place investment orders with a licensed broker or brokerage firm.'),
(182, 1, 5, 'EventStatusType', 'EventStatusType', 'EventStatusType is an enumeration type whose instances represent several states that an Event may be in.'),
(183, 1, 5, 'MusicVideoObject', 'MusicVideoObject', 'A music video file.'),
(184, 1, 5, 'SomeProducts', 'SomeProducts', 'A placeholder for multiple similar products of the same kind.'),
(185, 1, 5, 'UserInteraction', 'UserInteraction', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(186, 1, 5, 'Park', 'Park', 'A park.'),
(187, 1, 5, 'WholesaleStore', 'WholesaleStore', 'A wholesale store.'),
(188, 1, 5, 'CheckoutPage', 'CheckoutPage', 'Web page type: Checkout page.'),
(189, 1, 5, 'HousePainter', 'HousePainter', 'A house painting service.'),
(190, 1, 5, 'TaxiReservation', 'TaxiReservation', 'A reservation for a taxi.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(191, 1, 5, 'EducationalOccupationalProgram', 'EducationalOccupationalProgram', 'A program offered by an institution which determines the learning progress to achieve an outcome, usually a credential like a degree or certificate. This would define a discrete set of opportunities (e.g., job, courses) that together constitute a program with a clear start, end, set of requirements, and transition to a new occupational opportunity (e.g., a job), or sometimes a higher educational opportunity (e.g., an advanced degree).'),
(192, 1, 5, 'Campground', 'Campground', 'A camping site, campsite, or <a class=\"localLink\" href=\"http://schema.org/Campground\">Campground</a> is a place used for overnight stay in the outdoors, typically containing individual <a class=\"localLink\" href=\"http://schema.org/CampingPitch\">CampingPitch</a> locations. <br/><br/>\n\nIn British English a campsite is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites (Source: Wikipedia see <a href=\"https://en.wikipedia.org/wiki/Campsite\">https://en.wikipedia.org/wiki/Campsite</a>).<br/><br/>\n\nSee also the dedicated <a href=\"/docs/hotels.html\">document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(193, 1, 5, 'MedicalRiskFactor', 'MedicalRiskFactor', 'A risk factor is anything that increases a person\'s likelihood of developing or contracting a disease, medical condition, or complication.'),
(194, 1, 5, 'PaymentCard', 'PaymentCard', 'A payment method using a credit, debit, store or other card to associate the payment with an account.'),
(195, 1, 5, 'Barcode', 'Barcode', 'An image of a visual machine-readable code such as a barcode or QR code.'),
(196, 1, 5, 'TrainReservation', 'TrainReservation', 'A reservation for train travel.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(197, 1, 5, 'ShortStory', 'ShortStory', 'Short story or tale. A brief work of literature, usually written in narrative prose.'),
(198, 1, 5, 'ReturnFeesEnumeration', 'ReturnFeesEnumeration', 'ReturnFeesEnumeration expresses policies for return fees.'),
(199, 1, 5, 'LymphaticVessel', 'LymphaticVessel', 'A type of blood vessel that specifically carries lymph fluid unidirectionally toward the heart.'),
(200, 1, 5, 'AmusementPark', 'AmusementPark', 'An amusement park.'),
(201, 1, 5, 'StructuredValue', 'StructuredValue', 'Structured values are used when the value of a property has a more complex structure than simply being a textual value or a reference to another thing.'),
(202, 1, 5, 'NewsMediaOrganization', 'NewsMediaOrganization', 'A News/Media organization such as a newspaper or TV station.'),
(203, 1, 5, 'GiveAction', 'GiveAction', 'The act of transferring ownership of an object to a destination. Reciprocal of TakeAction.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/TakeAction\">TakeAction</a>: Reciprocal of GiveAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/SendAction\">SendAction</a>: Unlike SendAction, GiveAction implies that ownership is being transferred (e.g. I may send my laptop to you, but that doesn\'t mean I\'m giving it to you).</li>\n</ul>\n'),
(204, 1, 5, 'TravelAction', 'TravelAction', 'The act of traveling from an fromLocation to a destination by a specified mode of transport, optionally with participants.'),
(205, 1, 5, 'Place', 'Place', 'Entities that have a somewhat fixed, physical extension.'),
(206, 1, 5, 'OfferShippingDetails', 'OfferShippingDetails', 'OfferShippingDetails represents information about shipping destinations.<br/><br/>\n\nMultiple of these entities can be used to represent different shipping rates for different destinations:<br/><br/>\n\nOne entity for Alaska/Hawaii. A different one for continental US.A different one for all France.<br/><br/>\n\nMultiple of these entities can be used to represent different shipping costs and delivery times.<br/><br/>\n\nTwo entities that are identical but differ in rate and time:<br/><br/>\n\ne.g. Cheaper and slower: $5 in 5-7days\nor Fast and expensive: $15 in 1-2 days'),
(207, 1, 5, 'Hospital', 'Hospital', 'A hospital.'),
(208, 1, 5, 'BroadcastChannel', 'BroadcastChannel', 'A unique instance of a BroadcastService on a CableOrSatelliteService lineup.'),
(209, 1, 5, 'BoatTerminal', 'BoatTerminal', 'A terminal for boats, ships, and other water vessels.'),
(210, 1, 5, 'Answer', 'Answer', 'An answer offered to a question; perhaps correct, perhaps opinionated or wrong.'),
(211, 1, 5, 'VideoObject', 'VideoObject', 'A video file.'),
(212, 1, 5, 'DataFeedItem', 'DataFeedItem', 'A single item within a larger data feed.'),
(213, 1, 5, 'DoseSchedule', 'DoseSchedule', 'A specific dosing schedule for a drug or supplement.'),
(214, 1, 5, 'Ticket', 'Ticket', 'Used to describe a ticket to an event, a flight, a bus ride, etc.'),
(215, 1, 5, 'IgnoreAction', 'IgnoreAction', 'The act of intentionally disregarding the object. An agent ignores an object.'),
(216, 1, 5, 'Atlas', 'Atlas', 'A collection or bound volume of maps, charts, plates or tables, physical or in media form illustrating any subject.'),
(217, 1, 5, 'LoanOrCredit', 'LoanOrCredit', 'A financial product for the loaning of an amount of money under agreed terms and charges.'),
(218, 1, 5, 'VitalSign', 'VitalSign', 'Vital signs are measures of various physiological functions in order to assess the most basic body functions.'),
(219, 1, 5, 'MusicPlaylist', 'MusicPlaylist', 'A collection of music tracks in playlist form.'),
(220, 1, 5, 'ComicStory', 'ComicStory', 'The term \"story\" is any indivisible, re-printable\n        unit of a comic, including the interior stories, covers, and backmatter. Most\n        comics have at least two stories: a cover (ComicCoverArt) and an interior story.'),
(221, 1, 5, 'AcceptAction', 'AcceptAction', 'The act of committing to/adopting an object.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/RejectAction\">RejectAction</a>: The antonym of AcceptAction.</li>\n</ul>\n'),
(222, 1, 5, 'CommunicateAction', 'CommunicateAction', 'The act of conveying information to another person via a communication medium (instrument) such as speech, email, or telephone conversation.'),
(223, 1, 5, 'RoofingContractor', 'RoofingContractor', 'A roofing contractor.'),
(224, 1, 5, 'Poster', 'Poster', 'A large, usually printed placard, bill, or announcement, often illustrated, that is posted to advertise or publicize something.'),
(225, 1, 5, 'MovieTheater', 'MovieTheater', 'A movie theater.'),
(226, 1, 5, 'MedicalObservationalStudy', 'MedicalObservationalStudy', 'An observational study is a type of medical study that attempts to infer the possible effect of a treatment through observation of a cohort of subjects over a period of time. In an observational study, the assignment of subjects into treatment groups versus control groups is outside the control of the investigator. This is in contrast with controlled studies, such as the randomized controlled trials represented by MedicalTrial, where each subject is randomly assigned to a treatment group or a control group before the start of the treatment.'),
(227, 1, 5, 'Organization', 'Organization', 'An organization such as a school, NGO, corporation, club, etc.'),
(228, 1, 5, 'HealthPlanFormulary', 'HealthPlanFormulary', 'For a given health insurance plan, the specification for costs and coverage of prescription drugs.'),
(229, 1, 5, 'PublicToilet', 'PublicToilet', 'A public toilet is a room or small building containing one or more toilets (and possibly also urinals) which is available for use by the general public, or by customers or employees of certain businesses.'),
(230, 1, 5, 'BusStop', 'BusStop', 'A bus stop.'),
(231, 1, 5, 'CookAction', 'CookAction', 'The act of producing/preparing food.'),
(232, 1, 5, 'AskAction', 'AskAction', 'The act of posing a question / favor to someone.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ReplyAction\">ReplyAction</a>: Appears generally as a response to AskAction.</li>\n</ul>\n'),
(233, 1, 5, 'RsvpResponseType', 'RsvpResponseType', 'RsvpResponseType is an enumeration type whose instances represent responding to an RSVP request.'),
(234, 1, 5, 'FlightReservation', 'FlightReservation', 'A reservation for air travel.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(235, 1, 5, 'ReviewAction', 'ReviewAction', 'The act of producing a balanced opinion about the object for an audience. An agent reviews an object with participants resulting in a review.'),
(236, 1, 5, 'ReturnAction', 'ReturnAction', 'The act of returning to the origin that which was previously received (concrete objects) or taken (ownership).'),
(237, 1, 5, 'Optician', 'Optician', 'A store that sells reading glasses and similar devices for improving vision.'),
(238, 1, 5, 'PerformanceRole', 'PerformanceRole', 'A PerformanceRole is a Role that some entity places with regard to a theatrical performance, e.g. in a Movie, TVSeries etc.'),
(239, 1, 5, 'InviteAction', 'InviteAction', 'The act of asking someone to attend an event. Reciprocal of RsvpAction.'),
(240, 1, 5, 'Conversation', 'Conversation', 'One or more messages between organizations or people on a particular topic. Individual messages can be linked to the conversation with isPartOf or hasPart properties.'),
(241, 1, 5, 'MedicalTherapy', 'MedicalTherapy', 'Any medical intervention designed to prevent, treat, and cure human diseases and medical conditions, including both curative and palliative therapies. Medical therapies are typically processes of care relying upon pharmacotherapy, behavioral therapy, supportive therapy (with fluid or nutrition for example), or detoxification (e.g. hemodialysis) aimed at improving or preventing a health condition.'),
(242, 1, 5, 'Report', 'Report', 'A Report generated by governmental or non-governmental organization.'),
(243, 1, 5, 'CheckInAction', 'CheckInAction', 'The act of an agent communicating (service provider, social media, etc) their arrival by registering/confirming for a previously reserved service (e.g. flight check in) or at a place (e.g. hotel), possibly resulting in a result (boarding pass, etc).<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/CheckOutAction\">CheckOutAction</a>: The antonym of CheckInAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/ArriveAction\">ArriveAction</a>: Unlike ArriveAction, CheckInAction implies that the agent is informing/confirming the start of a previously reserved service.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/ConfirmAction\">ConfirmAction</a>: Unlike ConfirmAction, CheckInAction implies that the agent is informing/confirming the <em>start</em> of a previously reserved service rather than its validity/existence.</li>\n</ul>\n'),
(244, 1, 5, 'Collection', 'Collection', 'A collection of items e.g. creative works or products.'),
(245, 1, 5, 'RadioStation', 'RadioStation', 'A radio station.'),
(246, 1, 5, 'PhysicalTherapy', 'PhysicalTherapy', 'A process of progressive physical care and rehabilitation aimed at improving a health condition.'),
(247, 1, 5, 'AdministrativeArea', 'AdministrativeArea', 'A geographical region, typically under the jurisdiction of a particular government.'),
(248, 1, 5, 'DeliveryTimeSettings', 'DeliveryTimeSettings', 'A DeliveryTimeSettings represents re-usable pieces of shipping information, relating to timing. It is designed for publication on an URL that may be referenced via the <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> property of a <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a>. Several occurrences can be published, distinguished (and identified/referenced) by their different values for <a class=\"localLink\" href=\"http://schema.org/transitTimeLabel\">transitTimeLabel</a>.'),
(249, 1, 5, 'House', 'House', 'A house is a building or structure that has the ability to be occupied for habitation by humans or other creatures (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/House\">http://en.wikipedia.org/wiki/House</a>).'),
(250, 1, 5, 'Sculpture', 'Sculpture', 'A piece of sculpture.'),
(251, 1, 5, 'SendAction', 'SendAction', 'The act of physically/electronically dispatching an object for transfer from an origin to a destination.Related actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ReceiveAction\">ReceiveAction</a>: The reciprocal of SendAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/GiveAction\">GiveAction</a>: Unlike GiveAction, SendAction does not imply the transfer of ownership (e.g. I can send you my laptop, but I\'m not necessarily giving it to you).</li>\n</ul>\n'),
(252, 1, 5, 'Event', 'Event', 'An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the <a class=\"localLink\" href=\"http://schema.org/offers\">offers</a> property. Repeated events may be structured as separate Event objects.'),
(253, 1, 5, 'ReplyAction', 'ReplyAction', 'The act of responding to a question/message asked/sent by the object. Related to <a class=\"localLink\" href=\"http://schema.org/AskAction\">AskAction</a><br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/AskAction\">AskAction</a>: Appears generally as an origin of a ReplyAction.</li>\n</ul>\n'),
(254, 1, 5, 'SoftwareApplication', 'SoftwareApplication', 'A software application.'),
(255, 1, 5, 'InvestmentFund', 'InvestmentFund', 'A company or fund that gathers capital from a number of investors to create a pool of money that is then re-invested into stocks, bonds and other assets.'),
(256, 1, 5, 'RepaymentSpecification', 'RepaymentSpecification', 'A structured value representing repayment.'),
(257, 1, 5, 'ApplyAction', 'ApplyAction', 'The act of registering to an organization/service without the guarantee to receive it.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/RegisterAction\">RegisterAction</a>: Unlike RegisterAction, ApplyAction has no guarantees that the application will be accepted.</li>\n</ul>\n'),
(258, 1, 5, 'BusinessAudience', 'BusinessAudience', 'A set of characteristics belonging to businesses, e.g. who compose an item\'s target audience.'),
(259, 1, 5, 'SportsOrganization', 'SportsOrganization', 'Represents the collection of all sports organizations, including sports teams, governing bodies, and sports associations.'),
(260, 1, 5, 'PostOffice', 'PostOffice', 'A post office.'),
(261, 1, 5, 'AccountingService', 'AccountingService', 'Accountancy business.<br/><br/>\n\nAs a <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a> it can be described as a <a class=\"localLink\" href=\"http://schema.org/provider\">provider</a> of one or more <a class=\"localLink\" href=\"http://schema.org/Service\">Service</a>(s).'),
(262, 1, 5, 'LendAction', 'LendAction', 'The act of providing an object under an agreement that it will be returned at a later date. Reciprocal of BorrowAction.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/BorrowAction\">BorrowAction</a>: Reciprocal of LendAction.</li>\n</ul>\n'),
(263, 1, 5, 'ProfilePage', 'ProfilePage', 'Web page type: Profile page.'),
(264, 1, 5, 'MedicalTestPanel', 'MedicalTestPanel', 'Any collection of tests commonly ordered together.'),
(265, 1, 5, 'Notary', 'Notary', 'A notary.'),
(266, 1, 5, 'DDxElement', 'DDxElement', 'An alternative, closely-related condition typically considered later in the differential diagnosis process along with the signs that are used to distinguish it.'),
(267, 1, 5, 'ActionStatusType', 'ActionStatusType', 'The status of an Action.'),
(268, 1, 5, 'LearningResource', 'LearningResource', 'The LearningResource type can be used to indicate <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>s (whether physical or digital) that have a particular and explicit orientation towards learning, education, skill acquisition, and other educational purposes.<br/><br/>\n\n<a class=\"localLink\" href=\"http://schema.org/LearningResource\">LearningResource</a> is expected to be used as an addition to a primary type such as <a class=\"localLink\" href=\"http://schema.org/Book\">Book</a>, <a class=\"localLink\" href=\"http://schema.org/Video\">Video</a>, <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a> etc.<br/><br/>\n\n<a class=\"localLink\" href=\"http://schema.org/EducationEvent\">EducationEvent</a> serves a similar purpose for event-like things (e.g. a <a class=\"localLink\" href=\"http://schema.org/Trip\">Trip</a>). A <a class=\"localLink\" href=\"http://schema.org/LearningResource\">LearningResource</a> may be created as a result of an <a class=\"localLink\" href=\"http://schema.org/EducationEvent\">EducationEvent</a>, for example by recording one.'),
(269, 1, 5, 'Claim', 'Claim', 'A <a class=\"localLink\" href=\"http://schema.org/Claim\">Claim</a> in Schema.org represents a specific, factually-oriented claim that could be the <a class=\"localLink\" href=\"http://schema.org/itemReviewed\">itemReviewed</a> in a <a class=\"localLink\" href=\"http://schema.org/ClaimReview\">ClaimReview</a>. The content of a claim can be summarized with the <a class=\"localLink\" href=\"http://schema.org/text\">text</a> property. Variations on well known claims can have their common identity indicated via <a class=\"localLink\" href=\"http://schema.org/sameAs\">sameAs</a> links, and summarized with a <a class=\"localLink\" href=\"http://schema.org/name\">name</a>. Ideally, a <a class=\"localLink\" href=\"http://schema.org/Claim\">Claim</a> description includes enough contextual information to minimize the risk of ambiguity or inclarity. In practice, many claims are better understood in the context in which they appear or the interpretations provided by claim reviews.<br/><br/>\n\nBeyond <a class=\"localLink\" href=\"http://schema.org/ClaimReview\">ClaimReview</a>, the Claim type can be associated with related creative works - for example a <a class=\"localLink\" href=\"http://schema.org/ScholaryArticle\">ScholaryArticle</a> or <a class=\"localLink\" href=\"http://schema.org/Question\">Question</a> might be <a class=\"localLink\" href=\"http://schema.org/about\">about</a> some <a class=\"localLink\" href=\"http://schema.org/Claim\">Claim</a>.<br/><br/>\n\nAt this time, Schema.org does not define any types of relationship between claims. This is a natural area for future exploration.'),
(270, 1, 5, 'ElementarySchool', 'ElementarySchool', 'An elementary school.'),
(271, 1, 5, 'DefinedTermSet', 'DefinedTermSet', 'A set of defined terms for example a set of categories or a classification scheme, a glossary, dictionary or enumeration.'),
(272, 1, 5, 'CampingPitch', 'CampingPitch', 'A <a class=\"localLink\" href=\"http://schema.org/CampingPitch\">CampingPitch</a> is an individual place for overnight stay in the outdoors, typically being part of a larger camping site, or <a class=\"localLink\" href=\"http://schema.org/Campground\">Campground</a>.<br/><br/>\n\nIn British English a campsite, or campground, is an area, usually divided into a number of pitches, where people can camp overnight using tents or camper vans or caravans; this British English use of the word is synonymous with the American English expression campground. In American English the term campsite generally means an area where an individual, family, group, or military unit can pitch a tent or park a camper; a campground may contain many campsites.\n(Source: Wikipedia see <a href=\"https://en.wikipedia.org/wiki/Campsite\">https://en.wikipedia.org/wiki/Campsite</a>).<br/><br/>\n\nSee also the dedicated <a href=\"/docs/hotels.html\">document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(273, 1, 5, 'Service', 'Service', 'A service provided by an organization, e.g. delivery service, print services, etc.'),
(274, 1, 5, 'CatholicChurch', 'CatholicChurch', 'A Catholic church.'),
(275, 1, 5, 'LeaveAction', 'LeaveAction', 'An agent leaves an event / group with participants/friends at a location.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/JoinAction\">JoinAction</a>: The antonym of LeaveAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/UnRegisterAction\">UnRegisterAction</a>: Unlike UnRegisterAction, LeaveAction implies leaving a group/team of people rather than a service.</li>\n</ul>\n'),
(276, 1, 5, 'DonateAction', 'DonateAction', 'The act of providing goods, services, or money without compensation, often for philanthropic reasons.'),
(277, 1, 5, 'UserCheckins', 'UserCheckins', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(278, 1, 5, 'DepartmentStore', 'DepartmentStore', 'A department store.'),
(279, 1, 5, 'Beach', 'Beach', 'Beach.'),
(280, 1, 5, 'Hackathon', 'Hackathon', 'A <a href=\"https://en.wikipedia.org/wiki/Hackathon\">hackathon</a> event.'),
(281, 1, 5, 'MedicalTest', 'MedicalTest', 'Any medical test, typically performed for diagnostic purposes.'),
(282, 1, 5, 'AnalysisNewsArticle', 'AnalysisNewsArticle', 'An AnalysisNewsArticle is a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> that, while based on factual reporting, incorporates the expertise of the author/producer, offering interpretations and conclusions.'),
(283, 1, 5, 'TouristTrip', 'TouristTrip', 'A tourist trip. A created itinerary of visits to one or more places of interest (<a class=\"localLink\" href=\"http://schema.org/TouristAttraction\">TouristAttraction</a>/<a class=\"localLink\" href=\"http://schema.org/TouristDestination\">TouristDestination</a>) often linked by a similar theme, geographic area, or interest to a particular <a class=\"localLink\" href=\"http://schema.org/touristType\">touristType</a>. The <a href=\"http://www2.unwto.org/\">UNWTO</a> defines tourism trip as the Trip taken by visitors.\n  (See examples below).'),
(284, 1, 5, 'SeaBodyOfWater', 'SeaBodyOfWater', 'A sea (for example, the Caspian sea).');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(285, 1, 5, 'MedicalTrialDesign', 'MedicalTrialDesign', 'Design models for medical trials. Enumerated type.'),
(286, 1, 5, 'MedicalProcedureType', 'MedicalProcedureType', 'An enumeration that describes different types of medical procedures.'),
(287, 1, 5, 'Audience', 'Audience', 'Intended audience for an item, i.e. the group for whom the item was created.'),
(288, 1, 5, 'Class', 'Class', 'A class, also often called a \'Type\'; equivalent to rdfs:Class.'),
(289, 1, 5, 'DeliveryChargeSpecification', 'DeliveryChargeSpecification', 'The price for the delivery of an offer using a particular delivery method.'),
(290, 1, 5, 'TransferAction', 'TransferAction', 'The act of transferring/moving (abstract or concrete) animate or inanimate objects from one place to another.'),
(291, 1, 5, 'PoliceStation', 'PoliceStation', 'A police station.'),
(292, 1, 5, 'MedicalConditionStage', 'MedicalConditionStage', 'A stage of a medical condition, such as \'Stage IIIa\'.'),
(293, 1, 5, 'DataFeed', 'DataFeed', 'A single feed providing structured information about one or more entities or topics.'),
(294, 1, 5, 'MedicalEvidenceLevel', 'MedicalEvidenceLevel', 'Level of evidence for a medical guideline. Enumerated type.'),
(295, 1, 5, 'PodcastEpisode', 'PodcastEpisode', 'A single episode of a podcast series.'),
(296, 1, 5, 'EducationalOccupationalCredential', 'EducationalOccupationalCredential', 'An educational or occupational credential. A diploma, academic degree, certification, qualification, badge, etc., that may be awarded to a person or other entity that meets the requirements defined by the credentialer.'),
(297, 1, 5, 'MedicalClinic', 'MedicalClinic', 'A facility, often associated with a hospital or medical school, that is devoted to the specific diagnosis and/or healthcare. Previously limited to outpatients but with evolution it may be open to inpatients as well.'),
(298, 1, 5, 'CheckAction', 'CheckAction', 'An agent inspects, determines, investigates, inquires, or examines an object\'s accuracy, quality, condition, or state.'),
(299, 1, 5, 'RentAction', 'RentAction', 'The act of giving money in return for temporary use, but not ownership, of an object such as a vehicle or property. For example, an agent rents a property from a landlord in exchange for a periodic payment.'),
(300, 1, 5, 'WarrantyScope', 'WarrantyScope', 'A range of of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#Labor-BringIn</li>\n<li>http://purl.org/goodrelations/v1#PartsAndLabor-BringIn</li>\n<li>http://purl.org/goodrelations/v1#PartsAndLabor-PickUp</li>\n</ul>\n'),
(301, 1, 5, 'ListItem', 'ListItem', 'An list item, e.g. a step in a checklist or how-to description.'),
(302, 1, 5, 'MerchantReturnPolicy', 'MerchantReturnPolicy', 'A MerchantReturnPolicy provides information about product return policies associated with an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> or <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a>.'),
(303, 1, 5, 'Restaurant', 'Restaurant', 'A restaurant.'),
(304, 1, 5, 'NailSalon', 'NailSalon', 'A nail salon.'),
(305, 1, 5, 'LiteraryEvent', 'LiteraryEvent', 'Event type: Literary event.'),
(306, 1, 5, 'SocialMediaPosting', 'SocialMediaPosting', 'A post to a social media platform, including blog posts, tweets, Facebook posts, etc.'),
(307, 1, 5, 'OpinionNewsArticle', 'OpinionNewsArticle', 'An <a class=\"localLink\" href=\"http://schema.org/OpinionNewsArticle\">OpinionNewsArticle</a> is a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> that primarily expresses opinions rather than journalistic reporting of news and events. For example, a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> consisting of a column or <a class=\"localLink\" href=\"http://schema.org/Blog\">Blog</a>/<a class=\"localLink\" href=\"http://schema.org/BlogPosting\">BlogPosting</a> entry in the Opinions section of a news publication.'),
(308, 1, 5, 'VoteAction', 'VoteAction', 'The act of expressing a preference from a fixed/finite/structured set of choices/options.'),
(309, 1, 5, 'EmployerAggregateRating', 'EmployerAggregateRating', 'An aggregate rating of an Organization related to its role as an employer.'),
(310, 1, 5, 'OrganizeAction', 'OrganizeAction', 'The act of manipulating/administering/supervising/controlling one or more objects.'),
(311, 1, 5, 'ResumeAction', 'ResumeAction', 'The act of resuming a device or application which was formerly paused (e.g. resume music playback or resume a timer).'),
(312, 1, 5, 'ChooseAction', 'ChooseAction', 'The act of expressing a preference from a set of options or a large or unbounded set of choices/options.'),
(313, 1, 5, 'Aquarium', 'Aquarium', 'Aquarium.'),
(314, 1, 5, 'DrugPregnancyCategory', 'DrugPregnancyCategory', 'Categories that represent an assessment of the risk of fetal injury due to a drug or pharmaceutical used as directed by the mother during pregnancy.'),
(315, 1, 5, 'PublicationVolume', 'PublicationVolume', 'A part of a successively published publication such as a periodical or multi-volume work, often numbered. It may represent a time span, such as a year.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html\">blog post</a>.'),
(316, 1, 5, 'WPFooter', 'WPFooter', 'The footer section of the page.'),
(317, 1, 5, 'LandmarksOrHistoricalBuildings', 'LandmarksOrHistoricalBuildings', 'An historical landmark or building.'),
(318, 1, 5, 'EducationEvent', 'EducationEvent', 'Event type: Education event.'),
(319, 1, 5, 'VeterinaryCare', 'VeterinaryCare', 'A vet\'s office.'),
(320, 1, 5, 'AnatomicalStructure', 'AnatomicalStructure', 'Any part of the human body, typically a component of an anatomical system. Organs, tissues, and cells are all anatomical structures.'),
(321, 1, 5, 'FollowAction', 'FollowAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates polled from.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/BefriendAction\">BefriendAction</a>: Unlike BefriendAction, FollowAction implies that the connection is <em>not</em> necessarily reciprocal.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/SubscribeAction\">SubscribeAction</a>: Unlike SubscribeAction, FollowAction implies that the follower acts as an active agent constantly/actively polling for updates.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/RegisterAction\">RegisterAction</a>: Unlike RegisterAction, FollowAction implies that the agent is interested in continuing receiving updates from the object.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/JoinAction\">JoinAction</a>: Unlike JoinAction, FollowAction implies that the agent is interested in getting updates from the object.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/TrackAction\">TrackAction</a>: Unlike TrackAction, FollowAction refers to the polling of updates of all aspects of animate objects rather than the location of inanimate objects (e.g. you track a package, but you don\'t follow it).</li>\n</ul>\n'),
(322, 1, 5, 'Consortium', 'Consortium', 'A Consortium is a membership <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> whose members are typically Organizations.'),
(323, 1, 5, 'MedicalImagingTechnique', 'MedicalImagingTechnique', 'Any medical imaging modality typically used for diagnostic purposes. Enumerated type.'),
(324, 1, 5, 'FinancialProduct', 'FinancialProduct', 'A product provided to consumers and businesses by financial institutions such as banks, insurance companies, brokerage firms, consumer finance companies, and investment companies which comprise the financial services industry.'),
(325, 1, 5, 'EndorsementRating', 'EndorsementRating', 'An EndorsementRating is a rating that expresses some level of endorsement, for example inclusion in a \"critic\'s pick\" blog, a\n\"Like\" or \"+1\" on a social network. It can be considered the <a class=\"localLink\" href=\"http://schema.org/result\">result</a> of an <a class=\"localLink\" href=\"http://schema.org/EndorseAction\">EndorseAction</a> in which the <a class=\"localLink\" href=\"http://schema.org/object\">object</a> of the action is rated positively by\nsome <a class=\"localLink\" href=\"http://schema.org/agent\">agent</a>. As is common elsewhere in schema.org, it is sometimes more useful to describe the results of such an action without explicitly describing the <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>.<br/><br/>\n\nAn <a class=\"localLink\" href=\"http://schema.org/EndorsementRating\">EndorsementRating</a> may be part of a numeric scale or organized system, but this is not required: having an explicit type for indicating a positive,\nendorsement rating is particularly useful in the absence of numeric scales as it helps consumers understand that the rating is broadly positive.'),
(326, 1, 5, 'DriveWheelConfigurationValue', 'DriveWheelConfigurationValue', 'A value indicating which roadwheels will receive torque.'),
(327, 1, 5, 'Audiobook', 'Audiobook', 'An audiobook.'),
(328, 1, 5, 'ListenAction', 'ListenAction', 'The act of consuming audio content.'),
(329, 1, 5, 'MusicAlbumProductionType', 'MusicAlbumProductionType', 'Classification of the album by it\'s type of content: soundtrack, live album, studio album, etc.'),
(330, 1, 5, 'GolfCourse', 'GolfCourse', 'A golf course.'),
(331, 1, 5, 'MensClothingStore', 'MensClothingStore', 'A men\'s clothing store.'),
(332, 1, 5, 'WPHeader', 'WPHeader', 'The header section of the page.'),
(333, 1, 5, 'MedicalSign', 'MedicalSign', 'Any physical manifestation of a person\'s medical condition discoverable by objective diagnostic tests or physical examination.'),
(334, 1, 5, 'CurrencyConversionService', 'CurrencyConversionService', 'A service to convert funds from one currency to another currency.'),
(335, 1, 5, 'Mass', 'Mass', 'Properties that take Mass as values are of the form \'&lt;Number&gt; &lt;Mass unit of measure&gt;\'. E.g., \'7 kg\'.'),
(336, 1, 5, 'InstallAction', 'InstallAction', 'The act of installing an application.'),
(337, 1, 5, 'Motorcycle', 'Motorcycle', 'A motorcycle or motorbike is a single-track, two-wheeled motor vehicle.'),
(338, 1, 5, 'CreativeWorkSeason', 'CreativeWorkSeason', 'A media season e.g. tv, radio, video game etc.'),
(339, 1, 5, 'AutoWash', 'AutoWash', 'A car wash business.'),
(340, 1, 5, 'Code', 'Code', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(341, 1, 5, 'MiddleSchool', 'MiddleSchool', 'A middle school (typically for children aged around 11-14, although this varies somewhat).'),
(342, 1, 5, 'AboutPage', 'AboutPage', 'Web page type: About page.'),
(343, 1, 5, 'CovidTestingFacility', 'CovidTestingFacility', 'A CovidTestingFacility is a <a class=\"localLink\" href=\"http://schema.org/MedicalClinic\">MedicalClinic</a> where testing for the COVID-19 Coronavirus\n      disease is available. If the facility is being made available from an established <a class=\"localLink\" href=\"http://schema.org/Pharmacy\">Pharmacy</a>, <a class=\"localLink\" href=\"http://schema.org/Hotel\">Hotel</a>, or other\n      non-medical organization, multiple types can be listed. This makes it easier to re-use existing schema.org information\n      about that place e.g. contact info, address, opening hours. Note that in an emergency, such information may not always be reliable.'),
(344, 1, 5, 'MaximumDoseSchedule', 'MaximumDoseSchedule', 'The maximum dosing schedule considered safe for a drug or supplement as recommended by an authority or by the drug/supplement\'s manufacturer. Capture the recommending authority in the recognizingAuthority property of MedicalEntity.'),
(345, 1, 5, 'EmergencyService', 'EmergencyService', 'An emergency service, such as a fire station or ER.'),
(346, 1, 5, 'MusicEvent', 'MusicEvent', 'Event type: Music event.'),
(347, 1, 5, 'StatisticalPopulation', 'StatisticalPopulation', 'A StatisticalPopulation is a set of instances of a certain given type that satisfy some set of constraints. The property <a class=\"localLink\" href=\"http://schema.org/populationType\">populationType</a> is used to specify the type. Any property that can be used on instances of that type can appear on the statistical population. For example, a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a> representing all <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a>s with a <a class=\"localLink\" href=\"http://schema.org/homeLocation\">homeLocation</a> of East Podunk California, would be described by applying the appropriate <a class=\"localLink\" href=\"http://schema.org/homeLocation\">homeLocation</a> and <a class=\"localLink\" href=\"http://schema.org/populationType\">populationType</a> properties to a <a class=\"localLink\" href=\"http://schema.org/StatisticalPopulation\">StatisticalPopulation</a> item that stands for that set of people.\nThe properties <a class=\"localLink\" href=\"http://schema.org/numConstraints\">numConstraints</a> and <a class=\"localLink\" href=\"http://schema.org/constrainingProperties\">constrainingProperties</a> are used to specify which of the populations properties are used to specify the population. Note that the sense of \"population\" used here is the general sense of a statistical\npopulation, and does not imply that the population consists of people. For example, a <a class=\"localLink\" href=\"http://schema.org/populationType\">populationType</a> of <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> or <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> could be used. See also <a class=\"localLink\" href=\"http://schema.org/Observation\">Observation</a>, and the <a href=\"/docs/data-and-datasets.html\">data and datasets</a> overview for more details.'),
(348, 1, 5, 'Order', 'Order', 'An order is a confirmation of a transaction (a receipt), which can contain multiple line items, each represented by an Offer that has been accepted by the customer.'),
(349, 1, 5, 'QualitativeValue', 'QualitativeValue', 'A predefined value for a product characteristic, e.g. the power cord plug type \'US\' or the garment sizes \'S\', \'M\', \'L\', and \'XL\'.'),
(350, 1, 5, 'Menu', 'Menu', 'A structured representation of food or drink items available from a FoodEstablishment.'),
(351, 1, 5, 'LibrarySystem', 'LibrarySystem', 'A <a class=\"localLink\" href=\"http://schema.org/LibrarySystem\">LibrarySystem</a> is a collaborative system amongst several libraries.'),
(352, 1, 5, 'RadioSeason', 'RadioSeason', 'Season dedicated to radio broadcast and associated online delivery.'),
(353, 1, 5, 'Winery', 'Winery', 'A winery.'),
(354, 1, 5, 'SearchResultsPage', 'SearchResultsPage', 'Web page type: Search results page.'),
(355, 1, 5, 'ActivateAction', 'ActivateAction', 'The act of starting or activating a device or application (e.g. starting a timer or turning on a flashlight).'),
(356, 1, 5, 'WorkBasedProgram', 'WorkBasedProgram', 'A program with both an educational and employment component. Typically based at a workplace and structured around work-based learning, with the aim of instilling competencies related to an occupation. WorkBasedProgram is used to distinguish programs such as apprenticeships from school, college or other classroom based educational programs.'),
(357, 1, 5, 'NightClub', 'NightClub', 'A nightclub or discotheque.'),
(358, 1, 5, 'DrugCostCategory', 'DrugCostCategory', 'Enumerated categories of medical drug costs.'),
(359, 1, 5, 'UserReview', 'UserReview', 'A review created by an end-user (e.g. consumer, purchaser, attendee etc.), in contrast with <a class=\"localLink\" href=\"http://schema.org/CriticReview\">CriticReview</a>.'),
(360, 1, 5, 'AutoDealer', 'AutoDealer', 'An car dealership.'),
(361, 1, 5, 'Drug', 'Drug', 'A chemical or biologic substance, used as a medical therapy, that has a physiological effect on an organism. Here the term drug is used interchangeably with the term medicine although clinical knowledge make a clear difference between them.'),
(362, 1, 5, 'MedicalAudience', 'MedicalAudience', 'Target audiences for medical web pages.'),
(363, 1, 5, 'AlignmentObject', 'AlignmentObject', 'An intangible item that describes an alignment between a learning resource and a node in an educational framework.<br/><br/>\n\nShould not be used where the nature of the alignment can be described using a simple property, for example to express that a resource <a class=\"localLink\" href=\"http://schema.org/teaches\">teaches</a> or <a class=\"localLink\" href=\"http://schema.org/assesses\">assesses</a> a competency.'),
(364, 1, 5, 'MedicalProcedure', 'MedicalProcedure', 'A process of care used in either a diagnostic, therapeutic, preventive or palliative capacity that relies on invasive (surgical), non-invasive, or other techniques.'),
(365, 1, 5, 'Legislation', 'Legislation', 'A legal document such as an act, decree, bill, etc. (enforceable or not) or a component of a legal act (like an article).'),
(366, 1, 5, 'MedicalEnumeration', 'MedicalEnumeration', 'Enumerations related to health and the practice of medicine: A concept that is used to attribute a quality to another concept, as a qualifier, a collection of items or a listing of all of the elements of a set in medicine practice.'),
(367, 1, 5, 'ImageObject', 'ImageObject', 'An image file.'),
(368, 1, 5, 'City', 'City', 'A city or town.'),
(369, 1, 5, 'Artery', 'Artery', 'A type of blood vessel that specifically carries blood away from the heart.'),
(370, 1, 5, 'BankOrCreditUnion', 'BankOrCreditUnion', 'Bank or credit union.'),
(371, 1, 5, 'MerchantReturnEnumeration', 'MerchantReturnEnumeration', 'MerchantReturnEnumeration enumerates several kinds of product return policy. Note that this structure may not capture all aspects of the policy.'),
(372, 1, 5, 'EventVenue', 'EventVenue', 'An event venue.'),
(373, 1, 5, 'PlanAction', 'PlanAction', 'The act of planning the execution of an event/task/action/reservation/plan to a future date.'),
(374, 1, 5, 'AutoBodyShop', 'AutoBodyShop', 'Auto body shop.'),
(375, 1, 5, 'Chapter', 'Chapter', 'One of the sections into which a book is divided. A chapter usually has a section number or a name.'),
(376, 1, 5, 'AgreeAction', 'AgreeAction', 'The act of expressing a consistency of opinion with the object. An agent agrees to/about an object (a proposition, topic or theme) with participants.'),
(377, 1, 5, 'Museum', 'Museum', 'A museum.'),
(378, 1, 5, 'DrugCost', 'DrugCost', 'The cost per unit of a medical drug. Note that this type is not meant to represent the price in an offer of a drug for sale; see the Offer type for that. This type will typically be used to tag wholesale or average retail cost of a drug, or maximum reimbursable cost. Costs of medical drugs vary widely depending on how and where they are paid for, so while this type captures some of the variables, costs should be used with caution by consumers of this schema\'s markup.'),
(379, 1, 5, 'DiagnosticProcedure', 'DiagnosticProcedure', 'A medical procedure intended primarily for diagnostic, as opposed to therapeutic, purposes.'),
(380, 1, 5, 'Courthouse', 'Courthouse', 'A courthouse.'),
(381, 1, 5, 'ComedyClub', 'ComedyClub', 'A comedy club.'),
(382, 1, 5, 'Crematorium', 'Crematorium', 'A crematorium.'),
(383, 1, 5, 'ArtGallery', 'ArtGallery', 'An art gallery.'),
(384, 1, 5, 'Trip', 'Trip', 'A trip or journey. An itinerary of visits to one or more places.'),
(385, 1, 5, 'VideoGameClip', 'VideoGameClip', 'A short segment/part of a video game.'),
(386, 1, 5, 'ElectronicsStore', 'ElectronicsStore', 'An electronics store.'),
(387, 1, 5, 'EndorseAction', 'EndorseAction', 'An agent approves/certifies/likes/supports/sanction an object.'),
(388, 1, 5, 'PropertyValue', 'PropertyValue', 'A property-value pair, e.g. representing a feature of a product or place. Use the \'name\' property for the name of the property. If there is an additional human-readable version of the value, put that into the \'description\' property.<br/><br/>\n\nAlways use specific schema.org properties when a) they exist and b) you can populate them. Using PropertyValue as a substitute will typically not trigger the same effect as using the original, specific property.'),
(389, 1, 5, 'IndividualProduct', 'IndividualProduct', 'A single, identifiable product instance (e.g. a laptop with a particular serial number).'),
(390, 1, 5, 'Map', 'Map', 'A map.'),
(391, 1, 5, 'Recommendation', 'Recommendation', '<a class=\"localLink\" href=\"http://schema.org/Recommendation\">Recommendation</a> is a type of <a class=\"localLink\" href=\"http://schema.org/Review\">Review</a> that suggests or proposes something as the best option or best course of action. Recommendations may be for products or services, or other concrete things, as in the case of a ranked list or product guide. A <a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> may list multiple recommendations for different categories. For example, in a <a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> about which TVs to buy, the author may have several <a class=\"localLink\" href=\"http://schema.org/Recommendation\">Recommendation</a>s.'),
(392, 1, 5, 'DrugStrength', 'DrugStrength', 'A specific strength in which a medical drug is available in a specific country.'),
(393, 1, 5, 'SearchAction', 'SearchAction', 'The act of searching for an object.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/FindAction\">FindAction</a>: SearchAction generally leads to a FindAction, but not necessarily.</li>\n</ul>\n'),
(394, 1, 5, 'UserComments', 'UserComments', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(395, 1, 5, 'WPAdBlock', 'WPAdBlock', 'An advertising section of the page.'),
(396, 1, 5, 'MedicalIntangible', 'MedicalIntangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things in the medical space.'),
(397, 1, 5, 'TipAction', 'TipAction', 'The act of giving money voluntarily to a beneficiary in recognition of services rendered.'),
(398, 1, 5, 'CorrectionComment', 'CorrectionComment', 'A <a class=\"localLink\" href=\"http://schema.org/comment\">comment</a> that corrects <a class=\"localLink\" href=\"http://schema.org/CreativeWork\">CreativeWork</a>.'),
(399, 1, 5, 'Episode', 'Episode', 'A media episode (e.g. TV, radio, video game) which can be part of a series or season.'),
(400, 1, 5, 'GeoCircle', 'GeoCircle', 'A GeoCircle is a GeoShape representing a circular geographic area. As it is a GeoShape\n          it provides the simple textual property \'circle\', but also allows the combination of postalCode alongside geoRadius.\n          The center of the circle can be indicated via the \'geoMidpoint\' property, or more approximately using \'address\', \'postalCode\'.'),
(401, 1, 5, 'Mountain', 'Mountain', 'A mountain, like Mount Whitney or Mount Everest.'),
(402, 1, 5, 'MusicStore', 'MusicStore', 'A music store.'),
(403, 1, 5, 'WantAction', 'WantAction', 'The act of expressing a desire about the object. An agent wants an object.'),
(404, 1, 5, 'Joint', 'Joint', 'The anatomical location at which two or more bones make contact.'),
(405, 1, 5, 'ReservationPackage', 'ReservationPackage', 'A group of multiple reservations with common values for all sub-reservations.'),
(406, 1, 5, 'SpreadsheetDigitalDocument', 'SpreadsheetDigitalDocument', 'A spreadsheet file.'),
(407, 1, 5, 'OfferItemCondition', 'OfferItemCondition', 'A list of possible conditions for the item.'),
(408, 1, 5, 'ReadAction', 'ReadAction', 'The act of consuming written content.'),
(409, 1, 5, 'WinAction', 'WinAction', 'The act of achieving victory in a competitive activity.'),
(410, 1, 5, 'ChildrensEvent', 'ChildrensEvent', 'Event type: Children\'s event.'),
(411, 1, 5, 'MonetaryAmountDistribution', 'MonetaryAmountDistribution', 'A statistical distribution of monetary amounts.'),
(412, 1, 5, 'MedicalRiskEstimator', 'MedicalRiskEstimator', 'Any rule set or interactive tool for estimating the risk of developing a complication or condition.'),
(413, 1, 5, 'ConfirmAction', 'ConfirmAction', 'The act of notifying someone that a future event/action is going to happen as expected.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/CancelAction\">CancelAction</a>: The antonym of ConfirmAction.</li>\n</ul>\n'),
(414, 1, 5, 'LegalForceStatus', 'LegalForceStatus', 'A list of possible statuses for the legal force of a legislation.'),
(415, 1, 5, 'LiveBlogPosting', 'LiveBlogPosting', 'A blog post intended to provide a rolling textual coverage of an ongoing event through continuous updates.'),
(416, 1, 5, 'InfectiousAgentClass', 'InfectiousAgentClass', 'Classes of agents or pathogens that transmit infectious diseases. Enumerated type.'),
(417, 1, 5, 'PayAction', 'PayAction', 'An agent pays a price to a participant.'),
(418, 1, 5, 'PlayAction', 'PlayAction', 'The act of playing/exercising/training/performing for enjoyment, leisure, recreation, Competition or exercise.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ListenAction\">ListenAction</a>: Unlike ListenAction (which is under ConsumeAction), PlayAction refers to performing for an audience or at an event, rather than consuming music.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/WatchAction\">WatchAction</a>: Unlike WatchAction (which is under ConsumeAction), PlayAction refers to showing/displaying for an audience or at an event, rather than consuming visual content.</li>\n</ul>\n'),
(419, 1, 5, 'GovernmentPermit', 'GovernmentPermit', 'A permit issued by a government agency.'),
(420, 1, 5, 'GovernmentBuilding', 'GovernmentBuilding', 'A government building.'),
(421, 1, 5, 'MedicalContraindication', 'MedicalContraindication', 'A condition or factor that serves as a reason to withhold a certain medical therapy. Contraindications can be absolute (there are no reasonable circumstances for undertaking a course of action) or relative (the patient is at higher risk of complications, but that these risks may be outweighed by other considerations or mitigated by other measures).'),
(422, 1, 5, 'MedicalDevice', 'MedicalDevice', 'Any object used in a medical capacity, such as to diagnose or treat a patient.'),
(423, 1, 5, 'Patient', 'Patient', 'A patient is any person recipient of health care services.'),
(424, 1, 5, 'Accommodation', 'Accommodation', 'An accommodation is a place that can accommodate human beings, e.g. a hotel room, a camping pitch, or a meeting room. Many accommodations are for overnight stays, but this is not a mandatory requirement.\nFor more specific types of accommodations not defined in schema.org, one can use additionalType with external vocabularies.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(425, 1, 5, 'SatiricalArticle', 'SatiricalArticle', 'An <a class=\"localLink\" href=\"http://schema.org/Article\">Article</a> whose content is primarily <a href=\"https://en.wikipedia.org/wiki/Satire\">[satirical]</a> in nature, i.e. unlikely to be literally true. A satirical article is sometimes but not necessarily also a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a>. <a class=\"localLink\" href=\"http://schema.org/ScholarlyArticle\">ScholarlyArticle</a>s are also sometimes satirized.'),
(426, 1, 5, 'BuyAction', 'BuyAction', 'The act of giving money to a seller in exchange for goods or services rendered. An agent buys an object, product, or service from a seller for a price. Reciprocal of SellAction.'),
(427, 1, 5, 'Blog', 'Blog', 'A blog.'),
(428, 1, 5, 'RecyclingCenter', 'RecyclingCenter', 'A recycling center.'),
(429, 1, 5, 'BuddhistTemple', 'BuddhistTemple', 'A Buddhist temple.'),
(430, 1, 5, 'ContactPointOption', 'ContactPointOption', 'Enumerated options related to a ContactPoint.'),
(431, 1, 5, 'DrawAction', 'DrawAction', 'The act of producing a visual/graphical representation of an object, typically with a pen/pencil and paper as instruments.'),
(432, 1, 5, 'CableOrSatelliteService', 'CableOrSatelliteService', 'A service which provides access to media programming like TV or radio. Access may be via cable or satellite.'),
(433, 1, 5, 'Role', 'Role', 'Represents additional information about a relationship or property. For example a Role can be used to say that a \'member\' role linking some SportsTeam to a player occurred during a particular time period. Or that a Person\'s \'actor\' role in a Movie was for some particular characterName. Such properties can be attached to a Role entity, which is then associated with the main entities using ordinary properties like \'member\' or \'actor\'.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/06/introducing-role.html\">blog post</a>.'),
(434, 1, 5, 'MedicalEntity', 'MedicalEntity', 'The most generic type of entity related to health and the practice of medicine.'),
(435, 1, 5, 'DeactivateAction', 'DeactivateAction', 'The act of stopping or deactivating a device or application (e.g. stopping a timer or turning off a flashlight).'),
(436, 1, 5, 'TaxiService', 'TaxiService', 'A service for a vehicle for hire with a driver for local travel. Fares are usually calculated based on distance traveled.'),
(437, 1, 5, 'MusicComposition', 'MusicComposition', 'A musical composition.'),
(438, 1, 5, 'PerformingGroup', 'PerformingGroup', 'A performance group, such as a band, an orchestra, or a circus.'),
(439, 1, 5, 'RadiationTherapy', 'RadiationTherapy', 'A process of care using radiation aimed at improving a health condition.'),
(440, 1, 5, 'AuthorizeAction', 'AuthorizeAction', 'The act of granting permission to an object.'),
(441, 1, 5, 'Airport', 'Airport', 'An airport.'),
(442, 1, 5, 'LikeAction', 'LikeAction', 'The act of expressing a positive sentiment about the object. An agent likes an object (a proposition, topic or theme) with participants.'),
(443, 1, 5, 'GasStation', 'GasStation', 'A gas station.'),
(444, 1, 5, 'ReservationStatusType', 'ReservationStatusType', 'Enumerated status values for Reservation.'),
(445, 1, 5, 'WebApplication', 'WebApplication', 'Web applications.'),
(446, 1, 5, 'CivicStructure', 'CivicStructure', 'A public structure, such as a town hall or concert hall.'),
(447, 1, 5, 'BoatTrip', 'BoatTrip', 'A trip on a commercial ferry line.'),
(448, 1, 5, 'EventAttendanceModeEnumeration', 'EventAttendanceModeEnumeration', 'An EventAttendanceModeEnumeration value is one of potentially several modes of organising an event, relating to whether it is online or offline.'),
(449, 1, 5, 'BookmarkAction', 'BookmarkAction', 'An agent bookmarks/flags/labels/tags/marks an object.'),
(450, 1, 5, 'EmailMessage', 'EmailMessage', 'An email message.'),
(451, 1, 5, 'Course', 'Course', 'A description of an educational course which may be offered as distinct instances at which take place at different times or take place at different locations, or be offered through different media or modes of study. An educational course is a sequence of one or more educational events and/or creative works which aims to build knowledge, competence or ability of learners.'),
(452, 1, 5, 'BeautySalon', 'BeautySalon', 'Beauty salon.'),
(453, 1, 5, 'ComedyEvent', 'ComedyEvent', 'Event type: Comedy event.'),
(454, 1, 5, 'MedicalTrial', 'MedicalTrial', 'A medical trial is a type of medical study that uses scientific process used to compare the safety and efficacy of medical therapies or medical procedures. In general, medical trials are controlled and subjects are allocated at random to the different treatment and/or control groups.'),
(455, 1, 5, 'BookSeries', 'BookSeries', 'A series of books. Included books can be indicated with the hasPart property.'),
(456, 1, 5, 'Hostel', 'Hostel', 'A hostel - cheap accommodation, often in shared dormitories.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(457, 1, 5, 'Invoice', 'Invoice', 'A statement of the money due for goods or services; a bill.'),
(458, 1, 5, 'HealthInsurancePlan', 'HealthInsurancePlan', 'A US-style health insurance plan, including PPOs, EPOs, and HMOs.'),
(459, 1, 5, 'ArriveAction', 'ArriveAction', 'The act of arriving at a place. An agent arrives at a destination from a fromLocation, optionally with participants.'),
(460, 1, 5, 'Synagogue', 'Synagogue', 'A synagogue.'),
(461, 1, 5, 'DaySpa', 'DaySpa', 'A day spa.'),
(462, 1, 5, 'EducationalOrganization', 'EducationalOrganization', 'An educational organization.'),
(463, 1, 5, 'Electrician', 'Electrician', 'An electrician.'),
(464, 1, 5, 'ShoppingCenter', 'ShoppingCenter', 'A shopping center or mall.'),
(465, 1, 5, 'Flight', 'Flight', 'An airline flight.'),
(466, 1, 5, 'TheaterGroup', 'TheaterGroup', 'A theater group or company, for example, the Royal Shakespeare Company or Druid Theatre.'),
(467, 1, 5, 'AddAction', 'AddAction', 'The act of editing by adding an object to a collection.'),
(468, 1, 5, 'PawnShop', 'PawnShop', 'A shop that will buy, or lend money against the security of, personal possessions.'),
(469, 1, 5, 'WebContent', 'WebContent', 'WebContent is a type representing all <a class=\"localLink\" href=\"http://schema.org/WebPage\">WebPage</a>, <a class=\"localLink\" href=\"http://schema.org/WebSite\">WebSite</a> and <a class=\"localLink\" href=\"http://schema.org/WebPageElement\">WebPageElement</a> content. It is sometimes the case that detailed distinctions between Web pages, sites and their parts is not always important or obvious. The  <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a> type makes it easier to describe Web-addressable content without requiring such distinctions to always be stated. (The intent is that the existing types <a class=\"localLink\" href=\"http://schema.org/WebPage\">WebPage</a>, <a class=\"localLink\" href=\"http://schema.org/WebSite\">WebSite</a> and <a class=\"localLink\" href=\"http://schema.org/WebPageElement\">WebPageElement</a> will eventually be declared as subtypes of <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a>.)'),
(470, 1, 5, 'FoodEvent', 'FoodEvent', 'Event type: Food event.'),
(471, 1, 5, 'BusinessFunction', 'BusinessFunction', 'The business function specifies the type of activity or access (i.e., the bundle of rights) offered by the organization or business person through the offer. Typical are sell, rental or lease, maintenance or repair, manufacture / produce, recycle / dispose, engineering / construction, or installation. Proprietary specifications of access rights are also instances of this class.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#ConstructionInstallation</li>\n<li>http://purl.org/goodrelations/v1#Dispose</li>\n<li>http://purl.org/goodrelations/v1#LeaseOut</li>\n<li>http://purl.org/goodrelations/v1#Maintain</li>\n<li>http://purl.org/goodrelations/v1#ProvideService</li>\n<li>http://purl.org/goodrelations/v1#Repair</li>\n<li>http://purl.org/goodrelations/v1#Sell</li>\n<li>http://purl.org/goodrelations/v1#Buy</li>\n</ul>\n'),
(472, 1, 5, 'OccupationalTherapy', 'OccupationalTherapy', 'A treatment of people with physical, emotional, or social problems, using purposeful activity to help them overcome or learn to deal with their problems.'),
(473, 1, 5, 'TrainTrip', 'TrainTrip', 'A trip on a commercial train line.'),
(474, 1, 5, 'Seat', 'Seat', 'Used to describe a seat, such as a reserved seat in an event reservation.'),
(475, 1, 5, 'DigitalDocument', 'DigitalDocument', 'An electronic file or document.'),
(476, 1, 5, 'Hotel', 'Hotel', 'A hotel is an establishment that provides lodging paid on a short-term basis (Source: Wikipedia, the free encyclopedia, see http://en.wikipedia.org/wiki/Hotel).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(477, 1, 5, 'ScholarlyArticle', 'ScholarlyArticle', 'A scholarly article.'),
(478, 1, 5, 'EducationalAudience', 'EducationalAudience', 'An EducationalAudience.'),
(479, 1, 5, 'HealthPlanNetwork', 'HealthPlanNetwork', 'A US-style health insurance plan network.'),
(480, 1, 5, 'TVSeries', 'TVSeries', 'CreativeWorkSeries dedicated to TV broadcast and associated online delivery.'),
(481, 1, 5, 'Duration', 'Duration', 'Quantity: Duration (use <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 duration format</a>).'),
(482, 1, 5, 'ParentAudience', 'ParentAudience', 'A set of characteristics describing parents, who can be interested in viewing some content.'),
(483, 1, 5, 'Date', 'Date', 'A date value in <a href=\"http://en.wikipedia.org/wiki/ISO_8601\">ISO 8601 date format</a>.'),
(484, 1, 5, 'SaleEvent', 'SaleEvent', 'Event type: Sales event.'),
(485, 1, 5, 'PriceSpecification', 'PriceSpecification', 'A structured value representing a price or price range. Typically, only the subclasses of this type are used for markup. It is recommended to use <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a> to describe independent amounts of money such as a salary, credit card limits, etc.'),
(486, 1, 5, 'DanceEvent', 'DanceEvent', 'Event type: A social dance.'),
(487, 1, 5, 'ServiceChannel', 'ServiceChannel', 'A means for accessing a service, e.g. a government office location, web site, or phone number.'),
(488, 1, 5, 'GeospatialGeometry', 'GeospatialGeometry', '(Eventually to be defined as) a supertype of GeoShape designed to accommodate definitions from Geo-Spatial best practices.'),
(489, 1, 5, 'WarrantyPromise', 'WarrantyPromise', 'A structured value representing the duration and scope of services that will be provided to a customer free of charge in case of a defect or malfunction of a product.'),
(490, 1, 5, 'ApprovedIndication', 'ApprovedIndication', 'An indication for a medical therapy that has been formally specified or approved by a regulatory body that regulates use of the therapy; for example, the US FDA approves indications for most drugs in the US.'),
(491, 1, 5, 'SurgicalProcedure', 'SurgicalProcedure', 'A medical procedure involving an incision with instruments; performed for diagnose, or therapeutic purposes.'),
(492, 1, 5, 'Room', 'Room', 'A room is a distinguishable space within a structure, usually separated from other spaces by interior walls. (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Room\">http://en.wikipedia.org/wiki/Room</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(493, 1, 5, 'CarUsageType', 'CarUsageType', 'A value indicating a special usage of a car, e.g. commercial rental, driving school, or as a taxi.'),
(494, 1, 5, 'Dentist', 'Dentist', 'A dentist.'),
(495, 1, 5, 'Brand', 'Brand', 'A brand is a name used by an organization or business person for labeling a product, product group, or similar.'),
(496, 1, 5, 'ImagingTest', 'ImagingTest', 'Any medical imaging modality typically used for diagnostic purposes.'),
(497, 1, 5, 'HVACBusiness', 'HVACBusiness', 'A business that provide Heating, Ventilation and Air Conditioning services.'),
(498, 1, 5, 'TattooParlor', 'TattooParlor', 'A tattoo parlor.'),
(499, 1, 5, 'HowTo', 'HowTo', 'Instructions that explain how to achieve a result by performing a sequence of steps.'),
(500, 1, 5, 'TrainStation', 'TrainStation', 'A train station.'),
(501, 1, 5, 'ParcelDelivery', 'ParcelDelivery', 'The delivery of a parcel either via the postal service or a commercial service.'),
(502, 1, 5, 'CompoundPriceSpecification', 'CompoundPriceSpecification', 'A compound price specification is one that bundles multiple prices that all apply in combination for different dimensions of consumption. Use the name property of the attached unit price specification for indicating the dimension of a price component (e.g. \"electricity\" or \"final cleaning\").'),
(503, 1, 5, 'CategoryCodeSet', 'CategoryCodeSet', 'A set of Category Code values.'),
(504, 1, 5, 'TennisComplex', 'TennisComplex', 'A tennis complex.'),
(505, 1, 5, 'MovieClip', 'MovieClip', 'A short segment/part of a movie.'),
(506, 1, 5, 'RadioSeries', 'RadioSeries', 'CreativeWorkSeries dedicated to radio broadcast and associated online delivery.'),
(507, 1, 5, 'AnimalShelter', 'AnimalShelter', 'Animal shelter.'),
(508, 1, 5, 'VideoGallery', 'VideoGallery', 'Web page type: Video gallery page.'),
(509, 1, 5, 'BusinessEvent', 'BusinessEvent', 'Event type: Business event.'),
(510, 1, 5, 'MedicalStudyStatus', 'MedicalStudyStatus', 'The status of a medical study. Enumerated type.'),
(511, 1, 5, 'RadioClip', 'RadioClip', 'A short radio program or a segment/part of a radio program.'),
(512, 1, 5, 'WebPage', 'WebPage', 'A web page. Every web page is implicitly assumed to be declared to be of type WebPage, so the various properties about that webpage, such as <code>breadcrumb</code> may be used. We recommend explicit declaration if these properties are specified, but if they are found outside of an itemscope, they will be assumed to be about the page.'),
(513, 1, 5, 'GardenStore', 'GardenStore', 'A garden store.'),
(514, 1, 5, 'Grant', 'Grant', 'A grant, typically financial or otherwise quantifiable, of resources. Typically a <a class=\"localLink\" href=\"http://schema.org/funder\">funder</a> sponsors some <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a> to an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> or <a class=\"localLink\" href=\"http://schema.org/Person\">Person</a>,\n    sometimes not necessarily via a dedicated or long-lived <a class=\"localLink\" href=\"http://schema.org/Project\">Project</a>, resulting in one or more outputs, or <a class=\"localLink\" href=\"http://schema.org/fundedItem\">fundedItem</a>s. For financial sponsorship, indicate the <a class=\"localLink\" href=\"http://schema.org/funder\">funder</a> of a <a class=\"localLink\" href=\"http://schema.org/MonetaryGrant\">MonetaryGrant</a>. For non-financial support, indicate <a class=\"localLink\" href=\"http://schema.org/sponsor\">sponsor</a> of <a class=\"localLink\" href=\"http://schema.org/Grant\">Grant</a>s of resources (e.g. office space).<br/><br/>\n\nGrants support  activities directed towards some agreed collective goals, often but not always organized as <a class=\"localLink\" href=\"http://schema.org/Project\">Project</a>s. Long-lived projects are sometimes sponsored by a variety of grants over time, but it is also common for a project to be associated with a single grant.<br/><br/>\n\nThe amount of a <a class=\"localLink\" href=\"http://schema.org/Grant\">Grant</a> is represented using <a class=\"localLink\" href=\"http://schema.org/amount\">amount</a> as a <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a>.'),
(515, 1, 5, 'HealthPlanCostSharingSpecification', 'HealthPlanCostSharingSpecification', 'A description of costs to the patient under a given network or formulary.'),
(516, 1, 5, 'MapCategoryType', 'MapCategoryType', 'An enumeration of several kinds of Map.'),
(517, 1, 5, 'DownloadAction', 'DownloadAction', 'The act of downloading an object.'),
(518, 1, 5, 'FilmAction', 'FilmAction', 'The act of capturing sound and moving images on film, video, or digitally.'),
(519, 1, 5, 'Project', 'Project', 'An enterprise (potentially individual but typically collaborative), planned to achieve a particular aim.\nUse properties from <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a>, <a class=\"localLink\" href=\"http://schema.org/subOrganization\">subOrganization</a>/<a class=\"localLink\" href=\"http://schema.org/parentOrganization\">parentOrganization</a> to indicate project sub-structures.'),
(520, 1, 5, 'SocialEvent', 'SocialEvent', 'Event type: Social event.'),
(521, 1, 5, 'SportsActivityLocation', 'SportsActivityLocation', 'A sports location, such as a playing field.'),
(522, 1, 5, 'GameServer', 'GameServer', 'Server that provides game interaction in a multiplayer game.'),
(523, 1, 5, 'Substance', 'Substance', 'Any matter of defined composition that has discrete existence, whose origin may be biological, mineral or chemical.'),
(524, 1, 5, 'Country', 'Country', 'A country.'),
(525, 1, 5, 'DrugPrescriptionStatus', 'DrugPrescriptionStatus', 'Indicates whether this drug is available by prescription or over-the-counter.'),
(526, 1, 5, 'PaymentService', 'PaymentService', 'A Service to transfer funds from a person or organization to a beneficiary person or organization.'),
(527, 1, 5, 'AdvertiserContentArticle', 'AdvertiserContentArticle', 'An <a class=\"localLink\" href=\"http://schema.org/Article\">Article</a> that an external entity has paid to place or to produce to its specifications. Includes <a href=\"https://en.wikipedia.org/wiki/Advertorial\">advertorials</a>, sponsored content, native advertising and other paid content.'),
(528, 1, 5, 'MediaGallery', 'MediaGallery', 'Web page type: Media gallery page. A mixed-media page that can contains media such as images, videos, and other multimedia.'),
(529, 1, 5, 'FMRadioChannel', 'FMRadioChannel', 'A radio channel that uses FM.'),
(530, 1, 5, 'PhotographAction', 'PhotographAction', 'The act of capturing still images of objects using a camera.'),
(531, 1, 5, 'ActionAccessSpecification', 'ActionAccessSpecification', 'A set of requirements that a must be fulfilled in order to perform an Action.'),
(532, 1, 5, 'MusicVenue', 'MusicVenue', 'A music venue.'),
(533, 1, 5, 'TravelAgency', 'TravelAgency', 'A travel agency.'),
(534, 1, 5, 'Landform', 'Landform', 'A landform or physical feature.  Landform elements include mountains, plains, lakes, rivers, seascape and oceanic waterbody interface features such as bays, peninsulas, seas and so forth, including sub-aqueous terrain features such as submersed mountain ranges, volcanoes, and the great ocean basins.'),
(535, 1, 5, 'ExerciseGym', 'ExerciseGym', 'A gym.'),
(536, 1, 5, 'ItemList', 'ItemList', 'A list of items of any sort&#x2014;for example, Top 10 Movies About Weathermen, or Top 100 Party Songs. Not to be confused with HTML lists, which are often used only for formatting.'),
(537, 1, 5, 'MotorizedBicycle', 'MotorizedBicycle', 'A motorized bicycle is a bicycle with an attached motor used to power the vehicle, or to assist with pedaling.'),
(538, 1, 5, 'IceCreamShop', 'IceCreamShop', 'An ice cream shop.'),
(539, 1, 5, 'LodgingBusiness', 'LodgingBusiness', 'A lodging business, such as a motel, hotel, or inn.'),
(540, 1, 5, 'ProfessionalService', 'ProfessionalService', 'Original definition: \"provider of professional services.\"<br/><br/>\n\nThe general <a class=\"localLink\" href=\"http://schema.org/ProfessionalService\">ProfessionalService</a> type for local businesses was deprecated due to confusion with <a class=\"localLink\" href=\"http://schema.org/Service\">Service</a>. For reference, the types that it included were: <a class=\"localLink\" href=\"http://schema.org/Dentist\">Dentist</a>,\n        <a class=\"localLink\" href=\"http://schema.org/AccountingService\">AccountingService</a>, <a class=\"localLink\" href=\"http://schema.org/Attorney\">Attorney</a>, <a class=\"localLink\" href=\"http://schema.org/Notary\">Notary</a>, as well as types for several kinds of <a class=\"localLink\" href=\"http://schema.org/HomeAndConstructionBusiness\">HomeAndConstructionBusiness</a>: <a class=\"localLink\" href=\"http://schema.org/Electrician\">Electrician</a>, <a class=\"localLink\" href=\"http://schema.org/GeneralContractor\">GeneralContractor</a>,\n        <a class=\"localLink\" href=\"http://schema.org/HousePainter\">HousePainter</a>, <a class=\"localLink\" href=\"http://schema.org/Locksmith\">Locksmith</a>, <a class=\"localLink\" href=\"http://schema.org/Plumber\">Plumber</a>, <a class=\"localLink\" href=\"http://schema.org/RoofingContractor\">RoofingContractor</a>. <a class=\"localLink\" href=\"http://schema.org/LegalService\">LegalService</a> was introduced as a more inclusive supertype of <a class=\"localLink\" href=\"http://schema.org/Attorney\">Attorney</a>.'),
(541, 1, 5, 'ResearchProject', 'ResearchProject', 'A Research project.'),
(542, 1, 5, 'Intangible', 'Intangible', 'A utility class that serves as the umbrella for a number of \'intangible\' things such as quantities, structured values, etc.'),
(543, 1, 5, 'VisualArtwork', 'VisualArtwork', 'A work of art that is primarily visual in character.'),
(544, 1, 5, 'HowToTip', 'HowToTip', 'An explanation in the instructions for how to achieve a result. It provides supplementary information about a technique, supply, author\'s preference, etc. It can explain what could be done, or what should not be done, but doesn\'t specify what should be done (see HowToDirection).'),
(545, 1, 5, 'MedicalCondition', 'MedicalCondition', 'Any condition of the human body that affects the normal functioning of a person, whether physically or mentally. Includes diseases, injuries, disabilities, disorders, syndromes, etc.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(546, 1, 5, 'HealthTopicContent', 'HealthTopicContent', '<a class=\"localLink\" href=\"http://schema.org/HealthTopicContent\">HealthTopicContent</a> is <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a> that is about some aspect of a health topic, e.g. a condition, its symptoms or treatments. Such content may be comprised of several parts or sections and use different types of media. Multiple instances of <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a> (and hence <a class=\"localLink\" href=\"http://schema.org/HealthTopicContent\">HealthTopicContent</a>) can be related using <a class=\"localLink\" href=\"http://schema.org/hasPart\">hasPart</a> / <a class=\"localLink\" href=\"http://schema.org/isPartOf\">isPartOf</a> where there is some kind of content hierarchy, and their content described with <a class=\"localLink\" href=\"http://schema.org/about\">about</a> and <a class=\"localLink\" href=\"http://schema.org/mentions\">mentions</a> e.g. building upon the existing <a class=\"localLink\" href=\"http://schema.org/MedicalCondition\">MedicalCondition</a> vocabulary.'),
(547, 1, 5, 'RealEstateListing', 'RealEstateListing', 'A <a class=\"localLink\" href=\"http://schema.org/RealEstateListing\">RealEstateListing</a> is a listing that describes one or more real-estate <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>s (whose <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> is typically to lease out, or to sell).\n  The <a class=\"localLink\" href=\"http://schema.org/RealEstateListing\">RealEstateListing</a> type itself represents the overall listing, as manifested in some <a class=\"localLink\" href=\"http://schema.org/WebPage\">WebPage</a>.'),
(548, 1, 5, 'Car', 'Car', 'A car is a wheeled, self-powered motor vehicle used for transportation.'),
(549, 1, 5, 'Photograph', 'Photograph', 'A photograph.'),
(550, 1, 5, 'Continent', 'Continent', 'One of the continents (for example, Europe or Africa).'),
(551, 1, 5, 'InsertAction', 'InsertAction', 'The act of adding at a specific location in an ordered collection.'),
(552, 1, 5, 'SuperficialAnatomy', 'SuperficialAnatomy', 'Anatomical features that can be observed by sight (without dissection), including the form and proportions of the human body as well as surface landmarks that correspond to deeper subcutaneous structures. Superficial anatomy plays an important role in sports medicine, phlebotomy, and other medical specialties as underlying anatomical structures can be identified through surface palpation. For example, during back surgery, superficial anatomy can be used to palpate and count vertebrae to find the site of incision. Or in phlebotomy, superficial anatomy can be used to locate an underlying vein; for example, the median cubital vein can be located by palpating the borders of the cubital fossa (such as the epicondyles of the humerus) and then looking for the superficial signs of the vein, such as size, prominence, ability to refill after depression, and feel of surrounding tissue support. As another example, in a subluxation (dislocation) of the glenohumeral joint, the bony structure becomes pronounced with the deltoid muscle failing to cover the glenohumeral joint allowing the edges of the scapula to be superficially visible. Here, the superficial anatomy is the visible edges of the scapula, implying the underlying dislocation of the joint (the related anatomical structure).'),
(553, 1, 5, 'FoodEstablishmentReservation', 'FoodEstablishmentReservation', 'A reservation to dine at a food-related business.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(554, 1, 5, 'OceanBodyOfWater', 'OceanBodyOfWater', 'An ocean (for example, the Pacific).'),
(555, 1, 5, 'MedicalSymptom', 'MedicalSymptom', 'Any complaint sensed and expressed by the patient (therefore defined as subjective)  like stomachache, lower-back pain, or fatigue.'),
(556, 1, 5, 'APIReference', 'APIReference', 'Reference documentation for application programming interfaces (APIs).'),
(557, 1, 5, 'TouristInformationCenter', 'TouristInformationCenter', 'A tourist information center.'),
(558, 1, 5, 'FundingAgency', 'FundingAgency', 'A FundingAgency is an organization that implements one or more <a class=\"localLink\" href=\"http://schema.org/FundingScheme\">FundingScheme</a>s and manages\n    the granting process (via <a class=\"localLink\" href=\"http://schema.org/Grant\">Grant</a>s, typically <a class=\"localLink\" href=\"http://schema.org/MonetaryGrant\">MonetaryGrant</a>s).\n    A funding agency is not always required for grant funding, e.g. philanthropic giving, corporate sponsorship etc.<br/><br/>\n\n<pre><code>Examples of funding agencies include ERC, REA, NIH, Bill and Melinda Gates Foundation...\n</code></pre>\n'),
(559, 1, 5, 'Dataset', 'Dataset', 'A body of structured information describing some topic(s) of interest.'),
(560, 1, 5, 'QuantitativeValueDistribution', 'QuantitativeValueDistribution', 'A statistical distribution of values.'),
(561, 1, 5, 'ToyStore', 'ToyStore', 'A toy store.'),
(562, 1, 5, 'CafeOrCoffeeShop', 'CafeOrCoffeeShop', 'A cafe or coffee shop.'),
(563, 1, 5, 'MovingCompany', 'MovingCompany', 'A moving company.'),
(564, 1, 5, 'Quiz', 'Quiz', 'Quiz: A test of knowledge, skills and abilities.'),
(565, 1, 5, 'Bakery', 'Bakery', 'A bakery.'),
(566, 1, 5, 'CreditCard', 'CreditCard', 'A card payment method of a particular brand or name.  Used to mark up a particular payment method and/or the financial product/service that supplies the card account.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#AmericanExpress</li>\n<li>http://purl.org/goodrelations/v1#DinersClub</li>\n<li>http://purl.org/goodrelations/v1#Discover</li>\n<li>http://purl.org/goodrelations/v1#JCB</li>\n<li>http://purl.org/goodrelations/v1#MasterCard</li>\n<li>http://purl.org/goodrelations/v1#VISA</li>\n</ul>\n'),
(567, 1, 5, 'DiscussionForumPosting', 'DiscussionForumPosting', 'A posting to a discussion forum.'),
(568, 1, 5, 'HobbyShop', 'HobbyShop', 'A store that sells materials useful or necessary for various hobbies.'),
(569, 1, 5, 'Property', 'Property', 'A property, used to indicate attributes and relationships of some Thing; equivalent to rdf:Property.'),
(570, 1, 5, 'TypeAndQuantityNode', 'TypeAndQuantityNode', 'A structured value indicating the quantity, unit of measurement, and business function of goods included in a bundle offer.'),
(571, 1, 5, 'DefenceEstablishment', 'DefenceEstablishment', 'A defence establishment, such as an army or navy base.'),
(572, 1, 5, 'AskPublicNewsArticle', 'AskPublicNewsArticle', 'A <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> expressing an open call by a <a class=\"localLink\" href=\"http://schema.org/NewsMediaOrganization\">NewsMediaOrganization</a> asking the public for input, insights, clarifications, anecdotes, documentation, etc., on an issue, for reporting purposes.'),
(573, 1, 5, 'UserDownloads', 'UserDownloads', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(574, 1, 5, 'EntryPoint', 'EntryPoint', 'An entry point, within some Web-based protocol.'),
(575, 1, 5, 'GovernmentOrganization', 'GovernmentOrganization', 'A governmental organization or agency.'),
(576, 1, 5, 'DepositAccount', 'DepositAccount', 'A type of Bank Account with a main purpose of depositing funds to gain interest or other benefits.'),
(577, 1, 5, 'HowToSection', 'HowToSection', 'A sub-grouping of steps in the instructions for how to achieve a result (e.g. steps for making a pie crust within a pie recipe).'),
(578, 1, 5, 'ApartmentComplex', 'ApartmentComplex', 'Residence type: Apartment complex.'),
(579, 1, 5, 'MedicalCause', 'MedicalCause', 'The causative agent(s) that are responsible for the pathophysiologic process that eventually results in a medical condition, symptom or sign. In this schema, unless otherwise specified this is meant to be the proximate cause of the medical condition, symptom or sign. The proximate cause is defined as the causative agent that most directly results in the medical condition, symptom or sign. For example, the HIV virus could be considered a cause of AIDS. Or in a diagnostic context, if a patient fell and sustained a hip fracture and two days later sustained a pulmonary embolism which eventuated in a cardiac arrest, the cause of the cardiac arrest (the proximate cause) would be the pulmonary embolism and not the fall. Medical causes can include cardiovascular, chemical, dermatologic, endocrine, environmental, gastroenterologic, genetic, hematologic, gynecologic, iatrogenic, infectious, musculoskeletal, neurologic, nutritional, obstetric, oncologic, otolaryngologic, pharmacologic, psychiatric, pulmonary, renal, rheumatologic, toxic, traumatic, or urologic causes; medical conditions can be causes as well.'),
(580, 1, 5, 'CommentAction', 'CommentAction', 'The act of generating a comment about a subject.'),
(581, 1, 5, 'InteractionCounter', 'InteractionCounter', 'A summary of how users have interacted with this CreativeWork. In most cases, authors will use a subtype to specify the specific type of interaction.'),
(582, 1, 5, 'Vehicle', 'Vehicle', 'A vehicle is a device that is designed or used to transport people or cargo over land, water, air, or through space.'),
(583, 1, 5, 'ScheduleAction', 'ScheduleAction', 'Scheduling future actions, events, or tasks.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ReserveAction\">ReserveAction</a>: Unlike ReserveAction, ScheduleAction allocates future actions (e.g. an event, a task, etc) towards a time slot / spatial allocation.</li>\n</ul>\n'),
(584, 1, 5, 'NGO', 'NGO', 'Organization: Non-governmental Organization.'),
(585, 1, 5, 'Preschool', 'Preschool', 'A preschool.'),
(586, 1, 5, 'AutomatedTeller', 'AutomatedTeller', 'ATM/cash machine.'),
(587, 1, 5, 'ContactPage', 'ContactPage', 'Web page type: Contact page.'),
(588, 1, 5, 'FoodEstablishment', 'FoodEstablishment', 'A food-related business.'),
(589, 1, 5, 'AssessAction', 'AssessAction', 'The act of forming one\'s opinion, reaction or sentiment.'),
(590, 1, 5, 'CDCPMDRecord', 'CDCPMDRecord', 'A CDCPMDRecord is a data structure representing a record in a CDC tabular data format\n      used for hospital data reporting. See <a href=\"/docs/cdc-covid.html\">documentation</a> for details, and the linked CDC materials for authoritative\n      definitions used as the source here.'),
(591, 1, 5, 'Enumeration', 'Enumeration', 'Lists or enumerations—for example, a list of cuisines or music genres, etc.'),
(592, 1, 5, 'Store', 'Store', 'A retail good store.'),
(593, 1, 5, 'TVClip', 'TVClip', 'A short TV program or a segment/part of a TV program.'),
(594, 1, 5, 'RegisterAction', 'RegisterAction', 'The act of registering to be a user of a service, product or web page.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/JoinAction\">JoinAction</a>: Unlike JoinAction, RegisterAction implies you are registering to be a user of a service, <em>not</em> a group/team of people.</li>\n<li>[FollowAction]]: Unlike FollowAction, RegisterAction doesn\'t imply that the agent is expecting to poll for updates from the object.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/SubscribeAction\">SubscribeAction</a>: Unlike SubscribeAction, RegisterAction doesn\'t imply that the agent is expecting updates from the object.</li>\n</ul>\n'),
(595, 1, 5, 'Movie', 'Movie', 'A movie.'),
(596, 1, 5, 'MedicalDevicePurpose', 'MedicalDevicePurpose', 'Categories of medical devices, organized by the purpose or intended use of the device.'),
(597, 1, 5, 'School', 'School', 'A school.'),
(598, 1, 5, 'GroceryStore', 'GroceryStore', 'A grocery store.'),
(599, 1, 5, 'BrainStructure', 'BrainStructure', 'Any anatomical structure which pertains to the soft nervous tissue functioning as the coordinating center of sensation and intellectual and nervous activity.'),
(600, 1, 5, 'ViewAction', 'ViewAction', 'The act of consuming static visual content.'),
(601, 1, 5, 'DeleteAction', 'DeleteAction', 'The act of editing a recipient by removing one of its objects.'),
(602, 1, 5, 'RiverBodyOfWater', 'RiverBodyOfWater', 'A river (for example, the broad majestic Shannon).'),
(603, 1, 5, 'BefriendAction', 'BefriendAction', 'The act of forming a personal connection with someone (object) mutually/bidirectionally/symmetrically.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/FollowAction\">FollowAction</a>: Unlike FollowAction, BefriendAction implies that the connection is reciprocal.</li>\n</ul>\n'),
(604, 1, 5, 'FurnitureStore', 'FurnitureStore', 'A furniture store.'),
(605, 1, 5, 'HighSchool', 'HighSchool', 'A high school.'),
(606, 1, 5, 'MediaManipulationRatingEnumeration', 'MediaManipulationRatingEnumeration', '(editorial work in progress, this definition is incomplete and unreviewed) MediaManipulationRatingEnumeration classifies a number of ways in which a media item (video, image, audio) can be manipulated, taking into account the context within which they are published or presented.'),
(607, 1, 5, 'Reservation', 'Reservation', 'Describes a reservation for travel, dining or an event. Some reservations require tickets. <br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, restaurant reservations, flights, or rental cars, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(608, 1, 5, 'FastFoodRestaurant', 'FastFoodRestaurant', 'A fast-food restaurant.'),
(609, 1, 5, 'DeliveryEvent', 'DeliveryEvent', 'An event involving the delivery of an item.'),
(610, 1, 5, 'GamePlayMode', 'GamePlayMode', 'Indicates whether this game is multi-player, co-op or single-player.'),
(611, 1, 5, 'BookStore', 'BookStore', 'A bookstore.'),
(612, 1, 5, 'ComicIssue', 'ComicIssue', 'Individual comic issues are serially published as\n        part of a larger series. For the sake of consistency, even one-shot issues\n        belong to a series comprised of a single issue. All comic issues can be\n        uniquely identified by: the combination of the name and volume number of the\n        series to which the issue belongs; the issue number; and the variant\n        description of the issue (if any).'),
(613, 1, 5, 'Newspaper', 'Newspaper', 'A publication containing information about varied topics that are pertinent to general information, a geographic area, or a specific subject matter (i.e. business, culture, education). Often published daily.'),
(614, 1, 5, 'OrderStatus', 'OrderStatus', 'Enumerated status values for Order.'),
(615, 1, 5, 'MedicalGuidelineRecommendation', 'MedicalGuidelineRecommendation', 'A guideline recommendation that is regarded as efficacious and where quality of the data supporting the recommendation is sound.'),
(616, 1, 5, 'Attorney', 'Attorney', 'Professional service: Attorney. <br/><br/>\n\nThis type is deprecated - <a class=\"localLink\" href=\"http://schema.org/LegalService\">LegalService</a> is more inclusive and less ambiguous.'),
(617, 1, 5, 'GeoCoordinates', 'GeoCoordinates', 'The geographic coordinates of a place or event.'),
(618, 1, 5, 'QuoteAction', 'QuoteAction', 'An agent quotes/estimates/appraises an object/product/service with a price at a location/store.'),
(619, 1, 5, 'GeoShape', 'GeoShape', 'The geographic shape of a place. A GeoShape can be described using several properties whose values are based on latitude/longitude pairs. Either whitespace or commas can be used to separate latitude and longitude; whitespace should be used when writing a list of several such points.'),
(620, 1, 5, 'Nerve', 'Nerve', 'A common pathway for the electrochemical nerve impulses that are transmitted along each of the axons.'),
(621, 1, 5, 'FireStation', 'FireStation', 'A fire station. With firemen.'),
(622, 1, 5, 'BlogPosting', 'BlogPosting', 'A blog post.'),
(623, 1, 5, 'ShippingRateSettings', 'ShippingRateSettings', 'A ShippingRateSettings represents re-usable pieces of shipping information. It is designed for publication on an URL that may be referenced via the <a class=\"localLink\" href=\"http://schema.org/shippingSettingsLink\">shippingSettingsLink</a> property of an <a class=\"localLink\" href=\"http://schema.org/OfferShippingDetails\">OfferShippingDetails</a>. Several occurrences can be published, distinguished and matched (i.e. identified/referenced) by their different values for <a class=\"localLink\" href=\"http://schema.org/shippingLabel\">shippingLabel</a>.'),
(624, 1, 5, 'EmployeeRole', 'EmployeeRole', 'A subclass of OrganizationRole used to describe employee relationships.'),
(625, 1, 5, 'RadioChannel', 'RadioChannel', 'A unique instance of a radio BroadcastService on a CableOrSatelliteService lineup.'),
(626, 1, 5, 'Language', 'Language', 'Natural languages such as Spanish, Tamil, Hindi, English, etc. Formal language code tags expressed in <a href=\"https://en.wikipedia.org/wiki/IETF_language_tag\">BCP 47</a> can be used via the <a class=\"localLink\" href=\"http://schema.org/alternateName\">alternateName</a> property. The Language type previously also covered programming languages such as Scheme and Lisp, which are now best represented using <a class=\"localLink\" href=\"http://schema.org/ComputerLanguage\">ComputerLanguage</a>.'),
(627, 1, 5, 'Comment', 'Comment', 'A comment on an item - for example, a comment on a blog post. The comment\'s content is expressed via the <a class=\"localLink\" href=\"http://schema.org/text\">text</a> property, and its topic via <a class=\"localLink\" href=\"http://schema.org/about\">about</a>, properties shared with all CreativeWorks.'),
(628, 1, 5, 'WPSideBar', 'WPSideBar', 'A sidebar section of the page.'),
(629, 1, 5, 'DeliveryMethod', 'DeliveryMethod', 'A delivery method is a standardized procedure for transferring the product or service to the destination of fulfillment chosen by the customer. Delivery methods are characterized by the means of transportation used, and by the organization or group that is the contracting party for the sending organization or person.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#DeliveryModeDirectDownload</li>\n<li>http://purl.org/goodrelations/v1#DeliveryModeFreight</li>\n<li>http://purl.org/goodrelations/v1#DeliveryModeMail</li>\n<li>http://purl.org/goodrelations/v1#DeliveryModeOwnFleet</li>\n<li>http://purl.org/goodrelations/v1#DeliveryModePickUp</li>\n<li>http://purl.org/goodrelations/v1#DHL</li>\n<li>http://purl.org/goodrelations/v1#FederalExpress</li>\n<li>http://purl.org/goodrelations/v1#UPS</li>\n</ul>\n'),
(630, 1, 5, 'InfectiousDisease', 'InfectiousDisease', 'An infectious disease is a clinically evident human disease resulting from the presence of pathogenic microbial agents, like pathogenic viruses, pathogenic bacteria, fungi, protozoa, multicellular parasites, and prions. To be considered an infectious disease, such pathogens are known to be able to cause this disease.'),
(631, 1, 5, 'Thing', 'Thing', 'The most generic type of item.'),
(632, 1, 5, 'JewelryStore', 'JewelryStore', 'A jewelry store.'),
(633, 1, 5, 'Waterfall', 'Waterfall', 'A waterfall, like Niagara.'),
(634, 1, 5, 'Florist', 'Florist', 'A florist.'),
(635, 1, 5, '3DModel', '3DModel', 'A 3D model represents some kind of 3D content, which may have <a class=\"localLink\" href=\"http://schema.org/encoding\">encoding</a>s in one or more <a class=\"localLink\" href=\"http://schema.org/MediaObject\">MediaObject</a>s. Many 3D formats are available (e.g. see <a href=\"https://en.wikipedia.org/wiki/Category:3D_graphics_file_formats\">Wikipedia</a>); specific encoding formats can be represented using the <a class=\"localLink\" href=\"http://schema.org/encodingFormat\">encodingFormat</a> property applied to the relevant <a class=\"localLink\" href=\"http://schema.org/MediaObject\">MediaObject</a>. For the\ncase of a single file published after Zip compression, the convention of appending \'+zip\' to the <a class=\"localLink\" href=\"http://schema.org/encodingFormat\">encodingFormat</a> can be used. Geospatial, AR/VR, artistic/animation, gaming, engineering and scientific content can all be represented using <a class=\"localLink\" href=\"http://schema.org/3DModel\">3DModel</a>.'),
(636, 1, 5, 'LinkRole', 'LinkRole', 'A Role that represents a Web link e.g. as expressed via the \'url\' property. Its linkRelationship property can indicate URL-based and plain textual link types e.g. those in IANA link registry or others such as \'amphtml\'. This structure provides a placeholder where details from HTML\'s link element can be represented outside of HTML, e.g. in JSON-LD feeds.'),
(637, 1, 5, 'EmployerReview', 'EmployerReview', 'An <a class=\"localLink\" href=\"http://schema.org/EmployerReview\">EmployerReview</a> is a review of an <a class=\"localLink\" href=\"http://schema.org/Organization\">Organization</a> regarding its role as an employer, written by a current or former employee of that organization.'),
(638, 1, 5, 'VideoGameSeries', 'VideoGameSeries', 'A video game series.'),
(639, 1, 5, 'AdultEntertainment', 'AdultEntertainment', 'An adult entertainment establishment.'),
(640, 1, 5, 'CssSelectorType', 'CssSelectorType', 'Text representing a CSS selector.'),
(641, 1, 5, 'Embassy', 'Embassy', 'An embassy.'),
(642, 1, 5, 'Library', 'Library', 'A library.'),
(643, 1, 5, 'CancelAction', 'CancelAction', 'The act of asserting that a future event/action is no longer going to happen.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ConfirmAction\">ConfirmAction</a>: The antonym of CancelAction.</li>\n</ul>\n'),
(644, 1, 5, 'FoodService', 'FoodService', 'A food service, like breakfast, lunch, or dinner.'),
(645, 1, 5, 'MedicalGuidelineContraindication', 'MedicalGuidelineContraindication', 'A guideline contraindication that designates a process as harmful and where quality of the data supporting the contraindication is sound.'),
(646, 1, 5, 'BusReservation', 'BusReservation', 'A reservation for bus travel. <br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(647, 1, 5, 'VideoGame', 'VideoGame', 'A video game is an electronic game that involves human interaction with a user interface to generate visual feedback on a video device.'),
(648, 1, 5, 'RsvpAction', 'RsvpAction', 'The act of notifying an event organizer as to whether you expect to attend the event.'),
(649, 1, 5, 'AnatomicalSystem', 'AnatomicalSystem', 'An anatomical system is a group of anatomical structures that work together to perform a certain task. Anatomical systems, such as organ systems, are one organizing principle of anatomy, and can includes circulatory, digestive, endocrine, integumentary, immune, lymphatic, muscular, nervous, reproductive, respiratory, skeletal, urinary, vestibular, and other systems.'),
(650, 1, 5, 'CreativeWorkSeries', 'CreativeWorkSeries', 'A CreativeWorkSeries in schema.org is a group of related items, typically but not necessarily of the same kind. CreativeWorkSeries are usually organized into some order, often chronological. Unlike <a class=\"localLink\" href=\"http://schema.org/ItemList\">ItemList</a> which is a general purpose data structure for lists of things, the emphasis with CreativeWorkSeries is on published materials (written e.g. books and periodicals, or media such as tv, radio and games).<br/><br/>\n\nSpecific subtypes are available for describing <a class=\"localLink\" href=\"http://schema.org/TVSeries\">TVSeries</a>, <a class=\"localLink\" href=\"http://schema.org/RadioSeries\">RadioSeries</a>, <a class=\"localLink\" href=\"http://schema.org/MovieSeries\">MovieSeries</a>, <a class=\"localLink\" href=\"http://schema.org/BookSeries\">BookSeries</a>, <a class=\"localLink\" href=\"http://schema.org/Periodical\">Periodical</a> and <a class=\"localLink\" href=\"http://schema.org/VideoGameSeries\">VideoGameSeries</a>. In each case, the <a class=\"localLink\" href=\"http://schema.org/hasPart\">hasPart</a> / <a class=\"localLink\" href=\"http://schema.org/isPartOf\">isPartOf</a> properties can be used to relate the CreativeWorkSeries to its parts. The general CreativeWorkSeries type serves largely just to organize these more specific and practical subtypes.<br/><br/>\n\nIt is common for properties applicable to an item from the series to be usefully applied to the containing group. Schema.org attempts to anticipate some of these cases, but publishers should be free to apply properties of the series parts to the series as a whole wherever they seem appropriate.'),
(651, 1, 5, 'LegalValueLevel', 'LegalValueLevel', 'A list of possible levels for the legal validity of a legislation.'),
(652, 1, 5, 'NLNonprofitType', 'NLNonprofitType', 'NLNonprofitType: Non-profit organization type originating from the Netherlands.'),
(653, 1, 5, 'LodgingReservation', 'LodgingReservation', 'A reservation for lodging at a hotel, motel, inn, etc.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(654, 1, 5, 'DataType', 'DataType', 'The basic data types such as Integers, Strings, etc.'),
(655, 1, 5, 'QuantitativeValue', 'QuantitativeValue', 'A point value or interval for product characteristics and other purposes.'),
(656, 1, 5, 'MedicalRiskScore', 'MedicalRiskScore', 'A simple system that adds up the number of risk factors to yield a score that is associated with prognosis, e.g. CHAD score, TIMI risk score.'),
(657, 1, 5, 'PaymentMethod', 'PaymentMethod', 'A payment method is a standardized procedure for transferring the monetary amount for a purchase. Payment methods are characterized by the legal and technical structures used, and by the organization or group carrying out the transaction.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#ByBankTransferInAdvance</li>\n<li>http://purl.org/goodrelations/v1#ByInvoice</li>\n<li>http://purl.org/goodrelations/v1#Cash</li>\n<li>http://purl.org/goodrelations/v1#CheckInAdvance</li>\n<li>http://purl.org/goodrelations/v1#COD</li>\n<li>http://purl.org/goodrelations/v1#DirectDebit</li>\n<li>http://purl.org/goodrelations/v1#GoogleCheckout</li>\n<li>http://purl.org/goodrelations/v1#PayPal</li>\n<li>http://purl.org/goodrelations/v1#PaySwarm</li>\n</ul>\n'),
(658, 1, 5, 'ControlAction', 'ControlAction', 'An agent controls a device or application.'),
(659, 1, 5, 'BorrowAction', 'BorrowAction', 'The act of obtaining an object under an agreement to return it at a later date. Reciprocal of LendAction.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/LendAction\">LendAction</a>: Reciprocal of BorrowAction.</li>\n</ul>\n'),
(660, 1, 5, 'AutoRental', 'AutoRental', 'A car rental business.'),
(661, 1, 5, 'JoinAction', 'JoinAction', 'An agent joins an event/group with participants/friends at a location.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/RegisterAction\">RegisterAction</a>: Unlike RegisterAction, JoinAction refers to joining a group/team of people.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/SubscribeAction\">SubscribeAction</a>: Unlike SubscribeAction, JoinAction does not imply that you\'ll be receiving updates.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/FollowAction\">FollowAction</a>: Unlike FollowAction, JoinAction does not imply that you\'ll be polling for updates.</li>\n</ul>\n'),
(662, 1, 5, 'TechArticle', 'TechArticle', 'A technical article - Example: How-to (task) topics, step-by-step, procedural troubleshooting, specifications, etc.'),
(663, 1, 5, 'Bridge', 'Bridge', 'A bridge.'),
(664, 1, 5, 'Ligament', 'Ligament', 'A short band of tough, flexible, fibrous connective tissue that functions to connect multiple bones, cartilages, and structurally support joints.'),
(665, 1, 5, 'CompleteDataFeed', 'CompleteDataFeed', 'A <a class=\"localLink\" href=\"http://schema.org/CompleteDataFeed\">CompleteDataFeed</a> is a <a class=\"localLink\" href=\"http://schema.org/DataFeed\">DataFeed</a> whose standard representation includes content for every item currently in the feed.<br/><br/>\n\nThis is the equivalent of Atom\'s element as defined in Feed Paging and Archiving <a href=\"https://tools.ietf.org/html/rfc5005\">RFC 5005</a>, For example (and as defined for Atom), when using data from a feed that represents a collection of items that varies over time (e.g. \"Top Twenty Records\") there is no need to have newer entries mixed in alongside older, obsolete entries. By marking this feed as a CompleteDataFeed, old entries can be safely discarded when the feed is refreshed, since we can assume the feed has provided descriptions for all current items.'),
(666, 1, 5, 'AutomotiveBusiness', 'AutomotiveBusiness', 'Car repair, sales, or parts.'),
(667, 1, 5, 'MedicalScholarlyArticle', 'MedicalScholarlyArticle', 'A scholarly article in the medical domain.'),
(668, 1, 5, 'SportsEvent', 'SportsEvent', 'Event type: Sports event.'),
(669, 1, 5, 'TelevisionChannel', 'TelevisionChannel', 'A unique instance of a television BroadcastService on a CableOrSatelliteService lineup.'),
(670, 1, 5, 'AutoRepair', 'AutoRepair', 'Car repair business.'),
(671, 1, 5, 'TherapeuticProcedure', 'TherapeuticProcedure', 'A medical procedure intended primarily for therapeutic purposes, aimed at improving a health condition.'),
(672, 1, 5, 'HomeGoodsStore', 'HomeGoodsStore', 'A home goods store.'),
(673, 1, 5, 'GeneralContractor', 'GeneralContractor', 'A general contractor.'),
(674, 1, 5, 'RealEstateAgent', 'RealEstateAgent', 'A real-estate agent.'),
(675, 1, 5, 'Recipe', 'Recipe', 'A recipe. For dietary restrictions covered by the recipe, a few common restrictions are enumerated via <a class=\"localLink\" href=\"http://schema.org/suitableForDiet\">suitableForDiet</a>. The <a class=\"localLink\" href=\"http://schema.org/keywords\">keywords</a> property can also be used to add more detail.'),
(676, 1, 5, 'DryCleaningOrLaundry', 'DryCleaningOrLaundry', 'A dry-cleaning business.'),
(677, 1, 5, 'DataDownload', 'DataDownload', 'A dataset in downloadable form.'),
(678, 1, 5, 'PhysicalExam', 'PhysicalExam', 'A type of physical examination of a patient performed by a physician.'),
(679, 1, 5, 'SheetMusic', 'SheetMusic', 'Printed music, as opposed to performed or recorded music.'),
(680, 1, 5, 'Taxi', 'Taxi', 'A taxi.'),
(681, 1, 5, 'PaymentStatusType', 'PaymentStatusType', 'A specific payment status. For example, PaymentDue, PaymentComplete, etc.'),
(682, 1, 5, 'Game', 'Game', 'The Game type represents things which are games. These are typically rule-governed recreational activities, e.g. role-playing games in which players assume the role of characters in a fictional setting.'),
(683, 1, 5, 'DislikeAction', 'DislikeAction', 'The act of expressing a negative sentiment about the object. An agent dislikes an object (a proposition, topic or theme) with participants.'),
(684, 1, 5, 'PostalCodeRangeSpecification', 'PostalCodeRangeSpecification', 'Indicates a range of postalcodes, usually defined as the set of valid codes between <a class=\"localLink\" href=\"http://schema.org/postalCodeBegin\">postalCodeBegin</a> and <a class=\"localLink\" href=\"http://schema.org/postalCodeEnd\">postalCodeEnd</a>, inclusively.'),
(685, 1, 5, 'TakeAction', 'TakeAction', 'The act of gaining ownership of an object from an origin. Reciprocal of GiveAction.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/GiveAction\">GiveAction</a>: The reciprocal of TakeAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/ReceiveAction\">ReceiveAction</a>: Unlike ReceiveAction, TakeAction implies that ownership has been transfered.</li>\n</ul>\n'),
(686, 1, 5, 'BusinessEntityType', 'BusinessEntityType', 'A business entity type is a conceptual entity representing the legal form, the size, the main line of business, the position in the value chain, or any combination thereof, of an organization or business person.<br/><br/>\n\nCommonly used values:<br/><br/>\n\n<ul>\n<li>http://purl.org/goodrelations/v1#Business</li>\n<li>http://purl.org/goodrelations/v1#Enduser</li>\n<li>http://purl.org/goodrelations/v1#PublicInstitution</li>\n<li>http://purl.org/goodrelations/v1#Reseller</li>\n</ul>\n'),
(687, 1, 5, 'Occupation', 'Occupation', 'A profession, may involve prolonged training and/or a formal qualification.'),
(688, 1, 5, 'ReportageNewsArticle', 'ReportageNewsArticle', 'The <a class=\"localLink\" href=\"http://schema.org/ReportageNewsArticle\">ReportageNewsArticle</a> type is a subtype of <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> representing\n news articles which are the result of journalistic news reporting conventions.<br/><br/>\n\nIn practice many news publishers produce a wide variety of article types, many of which might be considered a <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> but not a <a class=\"localLink\" href=\"http://schema.org/ReportageNewsArticle\">ReportageNewsArticle</a>. For example, opinion pieces, reviews, analysis, sponsored or satirical articles, or articles that combine several of these elements.<br/><br/>\n\nThe <a class=\"localLink\" href=\"http://schema.org/ReportageNewsArticle\">ReportageNewsArticle</a> type is based on a stricter ideal for \"news\" as a work of journalism, with articles based on factual information either observed or verified by the author, or reported and verified from knowledgeable sources.  This often includes perspectives from multiple viewpoints on a particular issue (distinguishing news reports from public relations or propaganda).  News reports in the <a class=\"localLink\" href=\"http://schema.org/ReportageNewsArticle\">ReportageNewsArticle</a> sense de-emphasize the opinion of the author, with commentary and value judgements typically expressed elsewhere.<br/><br/>\n\nA <a class=\"localLink\" href=\"http://schema.org/ReportageNewsArticle\">ReportageNewsArticle</a> which goes deeper into analysis can also be marked with an additional type of <a class=\"localLink\" href=\"http://schema.org/AnalysisNewsArticle\">AnalysisNewsArticle</a>.'),
(689, 1, 5, 'Boolean', 'Boolean', 'Boolean: True or False.'),
(690, 1, 5, 'LegislativeBuilding', 'LegislativeBuilding', 'A legislative building&#x2014;for example, the state capitol.'),
(691, 1, 5, 'PsychologicalTreatment', 'PsychologicalTreatment', 'A process of care relying upon counseling, dialogue and communication  aimed at improving a mental health condition without use of drugs.'),
(692, 1, 5, 'InsuranceAgency', 'InsuranceAgency', 'An Insurance agency.'),
(693, 1, 5, 'DefinedTerm', 'DefinedTerm', 'A word, name, acronym, phrase, etc. with a formal definition. Often used in the context of category or subject classification, glossaries or dictionaries, product or creative work types, etc. Use the name property for the term being defined, use termCode if the term has an alpha-numeric code allocated, use description to provide the definition of the term.'),
(694, 1, 5, 'TrackAction', 'TrackAction', 'An agent tracks an object for updates.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/FollowAction\">FollowAction</a>: Unlike FollowAction, TrackAction refers to the interest on the location of innanimates objects.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/SubscribeAction\">SubscribeAction</a>: Unlike SubscribeAction, TrackAction refers to  the interest on the location of innanimate objects.</li>\n</ul>\n'),
(695, 1, 5, 'MedicineSystem', 'MedicineSystem', 'Systems of medical practice.'),
(696, 1, 5, 'EngineSpecification', 'EngineSpecification', 'Information about the engine of the vehicle. A vehicle can have multiple engines represented by multiple engine specification entities.'),
(697, 1, 5, 'Series', 'Series', 'A Series in schema.org is a group of related items, typically but not necessarily of the same kind. See also <a class=\"localLink\" href=\"http://schema.org/CreativeWorkSeries\">CreativeWorkSeries</a>, <a class=\"localLink\" href=\"http://schema.org/EventSeries\">EventSeries</a>.'),
(698, 1, 5, 'DrinkAction', 'DrinkAction', 'The act of swallowing liquids.'),
(699, 1, 5, 'MonetaryAmount', 'MonetaryAmount', 'A monetary value or range. This type can be used to describe an amount of money such as $50 USD, or a range as in describing a bank account being suitable for a balance between £1,000 and £1,000,000 GBP, or the value of a salary, etc. It is recommended to use <a class=\"localLink\" href=\"http://schema.org/PriceSpecification\">PriceSpecification</a> Types to describe the price of an Offer, Invoice, etc.'),
(700, 1, 5, 'MedicalIndication', 'MedicalIndication', 'A condition or factor that indicates use of a medical therapy, including signs, symptoms, risk factors, anatomical states, etc.'),
(701, 1, 5, 'HealthAndBeautyBusiness', 'HealthAndBeautyBusiness', 'Health and beauty.'),
(702, 1, 5, 'LoseAction', 'LoseAction', 'The act of being defeated in a competitive activity.'),
(703, 1, 5, 'NutritionInformation', 'NutritionInformation', 'Nutritional information about the recipe.'),
(704, 1, 5, 'Question', 'Question', 'A specific question - e.g. from a user seeking answers online, or collected in a Frequently Asked Questions (FAQ) document.'),
(705, 1, 5, 'Physician', 'Physician', 'A doctor\'s office.'),
(706, 1, 5, 'SoftwareSourceCode', 'SoftwareSourceCode', 'Computer programming source code. Example: Full (compile ready) solutions, code snippet samples, scripts, templates.'),
(707, 1, 5, 'OfferForLease', 'OfferForLease', 'An <a class=\"localLink\" href=\"http://schema.org/OfferForLease\">OfferForLease</a> in Schema.org represents an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> to lease out something, i.e. an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> whose\n  <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> is <a href=\"http://purl.org/goodrelations/v1#LeaseOut.\">lease out</a>. See <a href=\"https://en.wikipedia.org/wiki/GoodRelations\">Good Relations</a> for\n  background on the underlying concepts.'),
(708, 1, 5, 'WriteAction', 'WriteAction', 'The act of authoring written creative content.'),
(709, 1, 5, 'DayOfWeek', 'DayOfWeek', 'The day of the week, e.g. used to specify to which day the opening hours of an OpeningHoursSpecification refer.<br/><br/>\n\nOriginally, URLs from <a href=\"http://purl.org/goodrelations/v1\">GoodRelations</a> were used (for <a class=\"localLink\" href=\"http://schema.org/Monday\">Monday</a>, <a class=\"localLink\" href=\"http://schema.org/Tuesday\">Tuesday</a>, <a class=\"localLink\" href=\"http://schema.org/Wednesday\">Wednesday</a>, <a class=\"localLink\" href=\"http://schema.org/Thursday\">Thursday</a>, <a class=\"localLink\" href=\"http://schema.org/Friday\">Friday</a>, <a class=\"localLink\" href=\"http://schema.org/Saturday\">Saturday</a>, <a class=\"localLink\" href=\"http://schema.org/Sunday\">Sunday</a> plus a special entry for <a class=\"localLink\" href=\"http://schema.org/PublicHolidays\">PublicHolidays</a>); these have now been integrated directly into schema.org.'),
(710, 1, 5, 'MobileApplication', 'MobileApplication', 'A software application designed specifically to work well on a mobile device such as a telephone.'),
(711, 1, 5, 'Airline', 'Airline', 'An organization that provides flights for passengers.'),
(712, 1, 5, 'Bone', 'Bone', 'Rigid connective tissue that comprises up the skeletal structure of the human body.'),
(713, 1, 5, 'MediaSubscription', 'MediaSubscription', 'A subscription which allows a user to access media including audio, video, books, etc.'),
(714, 1, 5, 'Muscle', 'Muscle', 'A muscle is an anatomical structure consisting of a contractile form of tissue that animals use to effect movement.'),
(715, 1, 5, 'PhysicalActivityCategory', 'PhysicalActivityCategory', 'Categories of physical activity, organized by physiologic classification.'),
(716, 1, 5, 'LocalBusiness', 'LocalBusiness', 'A particular physical business or branch of an organization. Examples of LocalBusiness include a restaurant, a particular branch of a restaurant chain, a branch of a bank, a medical practice, a club, a bowling alley, etc.'),
(717, 1, 5, 'Review', 'Review', 'A review of an item - for example, of a restaurant, movie, or store.'),
(718, 1, 5, 'Person', 'Person', 'A person (alive, dead, undead, or fictional).'),
(719, 1, 5, 'UpdateAction', 'UpdateAction', 'The act of managing by changing/editing the state of the object.'),
(720, 1, 5, 'ReactAction', 'ReactAction', 'The act of responding instinctively and emotionally to an object, expressing a sentiment.'),
(721, 1, 5, 'VirtualLocation', 'VirtualLocation', 'An online or virtual location for attending events. For example, one may attend an online seminar or educational event. While a virtual location may be used as the location of an event, virtual locations should not be confused with physical locations in the real world.'),
(722, 1, 5, 'MediaObject', 'MediaObject', 'A media object, such as an image, video, or audio object embedded in a web page or a downloadable dataset i.e. DataDownload. Note that a creative work may have many media objects associated with it on the same web page. For example, a page about a single song (MusicRecording) may have a music video (VideoObject), and a high and low bandwidth audio stream (2 AudioObject\'s).'),
(723, 1, 5, 'MobilePhoneStore', 'MobilePhoneStore', 'A store that sells mobile phones and related accessories.'),
(724, 1, 5, 'HardwareStore', 'HardwareStore', 'A hardware store.'),
(725, 1, 5, 'Time', 'Time', 'A point in time recurring on multiple days in the form hh:mm:ss[Z|(+|-)hh:mm] (see <a href=\"http://www.w3.org/TR/xmlschema-2/#time\">XML schema for details</a>).'),
(726, 1, 5, 'OfficeEquipmentStore', 'OfficeEquipmentStore', 'An office equipment store.'),
(727, 1, 5, 'PaintAction', 'PaintAction', 'The act of producing a painting, typically with paint and canvas as instruments.'),
(728, 1, 5, 'Offer', 'Offer', 'An offer to transfer some rights to an item or to provide a service — for example, an offer to sell tickets to an event, to rent the DVD of a movie, to stream a TV show over the internet, to repair a motorcycle, or to loan a book.<br/><br/>\n\nNote: As the <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> property, which identifies the form of offer (e.g. sell, lease, repair, dispose), defaults to http://purl.org/goodrelations/v1#Sell; an Offer without a defined businessFunction value can be assumed to be an offer to sell.<br/><br/>\n\nFor <a href=\"http://www.gs1.org/barcodes/technical/idkeys/gtin\">GTIN</a>-related fields, see <a href=\"http://www.gs1.org/barcodes/support/check_digit_calculator\">Check Digit calculator</a> and <a href=\"http://www.gs1us.org/resources/standards/gtin-validation-guide\">validation guide</a> from <a href=\"http://www.gs1.org/\">GS1</a>.'),
(729, 1, 5, 'Brewery', 'Brewery', 'Brewery.'),
(730, 1, 5, 'AudioObject', 'AudioObject', 'An audio file.'),
(731, 1, 5, 'MusicAlbum', 'MusicAlbum', 'A collection of music tracks.'),
(732, 1, 5, 'RestrictedDiet', 'RestrictedDiet', 'A diet restricted to certain foods or preparations for cultural, religious, health or lifestyle reasons.'),
(733, 1, 5, 'BankAccount', 'BankAccount', 'A product or service offered by a bank whereby one may deposit, withdraw or transfer money and in some cases be paid interest.'),
(734, 1, 5, 'Season', 'Season', 'A media season e.g. tv, radio, video game etc.'),
(735, 1, 5, 'MusicRelease', 'MusicRelease', 'A MusicRelease is a specific release of a music album.'),
(736, 1, 5, 'RadioBroadcastService', 'RadioBroadcastService', 'A delivery service through which radio content is provided via broadcast over the air or online.'),
(737, 1, 5, 'BikeStore', 'BikeStore', 'A bike store.'),
(738, 1, 5, 'LegalService', 'LegalService', 'A LegalService is a business that provides legally-oriented services, advice and representation, e.g. law firms.<br/><br/>\n\nAs a <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a> it can be described as a <a class=\"localLink\" href=\"http://schema.org/provider\">provider</a> of one or more <a class=\"localLink\" href=\"http://schema.org/Service\">Service</a>(s).'),
(739, 1, 5, 'DanceGroup', 'DanceGroup', 'A dance group&#x2014;for example, the Alvin Ailey Dance Theater or Riverdance.'),
(740, 1, 5, 'HowToStep', 'HowToStep', 'A step in the instructions for how to achieve a result. It is an ordered list with HowToDirection and/or HowToTip items.'),
(741, 1, 5, 'PreOrderAction', 'PreOrderAction', 'An agent orders a (not yet released) object/product/service to be delivered/sent.'),
(742, 1, 5, 'MortgageLoan', 'MortgageLoan', 'A loan in which property or real estate is used as collateral. (A loan securitized against some real estate.)'),
(743, 1, 5, 'ReviewNewsArticle', 'ReviewNewsArticle', 'A <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> and <a class=\"localLink\" href=\"http://schema.org/CriticReview\">CriticReview</a> providing a professional critic\'s assessment of a service, product, performance, or artistic or literary work.'),
(744, 1, 5, 'TouristDestination', 'TouristDestination', 'A tourist destination. In principle any <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a> can be a <a class=\"localLink\" href=\"http://schema.org/TouristDestination\">TouristDestination</a> from a <a class=\"localLink\" href=\"http://schema.org/City\">City</a>, <a class=\"localLink\" href=\"http://schema.org/Region\">Region</a> or <a class=\"localLink\" href=\"http://schema.org/Country\">Country</a> to an <a class=\"localLink\" href=\"http://schema.org/AmusementPark\">AmusementPark</a> or <a class=\"localLink\" href=\"http://schema.org/Hotel\">Hotel</a>. This Type can be used on its own to describe a general <a class=\"localLink\" href=\"http://schema.org/TouristDestination\">TouristDestination</a>, or be used as an <a class=\"localLink\" href=\"http://schema.org/additionalType\">additionalType</a> to add tourist relevant properties to any other <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a>.  A <a class=\"localLink\" href=\"http://schema.org/TouristDestination\">TouristDestination</a> is defined as a <a class=\"localLink\" href=\"http://schema.org/Place\">Place</a> that contains, or is colocated with, one or more <a class=\"localLink\" href=\"http://schema.org/TouristAttraction\">TouristAttraction</a>s, often linked by a similar theme or interest to a particular <a class=\"localLink\" href=\"http://schema.org/touristType\">touristType</a>. The <a href=\"http://www2.unwto.org/\">UNWTO</a> defines Destination (main destination of a tourism trip) as the place visited that is central to the decision to take the trip.\n  (See examples below).'),
(745, 1, 5, 'ComputerStore', 'ComputerStore', 'A computer store.'),
(746, 1, 5, 'ComputerLanguage', 'ComputerLanguage', 'This type covers computer programming languages such as Scheme and Lisp, as well as other language-like computer representations. Natural languages are best represented with the <a class=\"localLink\" href=\"http://schema.org/Language\">Language</a> type.'),
(747, 1, 5, 'FinancialService', 'FinancialService', 'Financial services business.'),
(748, 1, 5, 'StatusEnumeration', 'StatusEnumeration', 'Lists or enumerations dealing with status types.'),
(749, 1, 5, 'AggregateOffer', 'AggregateOffer', 'When a single product is associated with multiple offers (for example, the same pair of shoes is offered by different merchants), then AggregateOffer can be used.<br/><br/>\n\nNote: AggregateOffers are normally expected to associate multiple offers that all share the same defined <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> value, or default to http://purl.org/goodrelations/v1#Sell if businessFunction is not explicitly defined.'),
(750, 1, 5, 'Vessel', 'Vessel', 'A component of the human body circulatory system comprised of an intricate network of hollow tubes that transport blood throughout the entire body.'),
(751, 1, 5, 'Float', 'Float', 'Data type: Floating number.'),
(752, 1, 5, 'PresentationDigitalDocument', 'PresentationDigitalDocument', 'A file containing slides or used for a presentation.'),
(753, 1, 5, 'MusicReleaseFormatType', 'MusicReleaseFormatType', 'Format of this release (the type of recording media used, ie. compact disc, digital media, LP, etc.).'),
(754, 1, 5, 'MusicAlbumReleaseType', 'MusicAlbumReleaseType', 'The kind of release which this album is: single, EP or album.'),
(755, 1, 5, 'Mosque', 'Mosque', 'A mosque.'),
(756, 1, 5, 'Reservoir', 'Reservoir', 'A reservoir of water, typically an artificially created lake, like the Lake Kariba reservoir.'),
(757, 1, 5, 'MusicGroup', 'MusicGroup', 'A musical group, such as a band, an orchestra, or a choir. Can also be a solo musician.'),
(758, 1, 5, 'Festival', 'Festival', 'Event type: Festival.'),
(759, 1, 5, 'EatAction', 'EatAction', 'The act of swallowing solid objects.'),
(760, 1, 5, 'TelevisionStation', 'TelevisionStation', 'A television station.');
INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(761, 1, 5, 'OfferForPurchase', 'OfferForPurchase', 'An <a class=\"localLink\" href=\"http://schema.org/OfferForPurchase\">OfferForPurchase</a> in Schema.org represents an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> to sell something, i.e. an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a> whose\n  <a class=\"localLink\" href=\"http://schema.org/businessFunction\">businessFunction</a> is <a href=\"http://purl.org/goodrelations/v1#Sell.\">sell</a>. See <a href=\"https://en.wikipedia.org/wiki/GoodRelations\">Good Relations</a> for\n  background on the underlying concepts.'),
(762, 1, 5, 'Periodical', 'Periodical', 'A publication in any medium issued in successive parts bearing numerical or chronological designations and intended, such as a magazine, scholarly journal, or newspaper to continue indefinitely.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html\">blog post</a>.'),
(763, 1, 5, 'UserPlays', 'UserPlays', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(764, 1, 5, 'CityHall', 'CityHall', 'A city hall.'),
(765, 1, 5, 'ReportedDoseSchedule', 'ReportedDoseSchedule', 'A patient-reported or observed dosing schedule for a drug or supplement.'),
(766, 1, 5, 'UserTweets', 'UserTweets', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(767, 1, 5, 'Rating', 'Rating', 'A rating is an evaluation on a numeric scale, such as 1 to 5 stars.'),
(768, 1, 5, 'PreventionIndication', 'PreventionIndication', 'An indication for preventing an underlying condition, symptom, etc.'),
(769, 1, 5, 'CreateAction', 'CreateAction', 'The act of deliberately creating/producing/generating/building a result out of the agent.'),
(770, 1, 5, 'LocationFeatureSpecification', 'LocationFeatureSpecification', 'Specifies a location feature by providing a structured value representing a feature of an accommodation as a property-value pair of varying degrees of formality.'),
(771, 1, 5, 'HealthClub', 'HealthClub', 'A health club.'),
(772, 1, 5, 'SubwayStation', 'SubwayStation', 'A subway station.'),
(773, 1, 5, 'ComicCoverArt', 'ComicCoverArt', 'The artwork on the cover of a comic.'),
(774, 1, 5, 'MoveAction', 'MoveAction', 'The act of an agent relocating to a place.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/TransferAction\">TransferAction</a>: Unlike TransferAction, the subject of the move is a living Person or Organization rather than an inanimate object.</li>\n</ul>\n'),
(775, 1, 5, 'DataCatalog', 'DataCatalog', 'A collection of datasets.'),
(776, 1, 5, 'Vein', 'Vein', 'A type of blood vessel that specifically carries blood to the heart.'),
(777, 1, 5, 'UserPlusOnes', 'UserPlusOnes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(778, 1, 5, 'Cemetery', 'Cemetery', 'A graveyard.'),
(779, 1, 5, 'PeopleAudience', 'PeopleAudience', 'A set of characteristics belonging to people, e.g. who compose an item\'s target audience.'),
(780, 1, 5, 'MovieRentalStore', 'MovieRentalStore', 'A movie rental store.'),
(781, 1, 5, 'OfferCatalog', 'OfferCatalog', 'An OfferCatalog is an ItemList that contains related Offers and/or further OfferCatalogs that are offeredBy the same provider.'),
(782, 1, 5, 'Message', 'Message', 'A single message from a sender to one or more organizations or people.'),
(783, 1, 5, 'Casino', 'Casino', 'A casino.'),
(784, 1, 5, 'AllocateAction', 'AllocateAction', 'The act of organizing tasks/objects/events by associating resources to it.'),
(785, 1, 5, 'Pond', 'Pond', 'A pond.'),
(786, 1, 5, 'TouristAttraction', 'TouristAttraction', 'A tourist attraction.  In principle any Thing can be a <a class=\"localLink\" href=\"http://schema.org/TouristAttraction\">TouristAttraction</a>, from a <a class=\"localLink\" href=\"http://schema.org/Mountain\">Mountain</a> and <a class=\"localLink\" href=\"http://schema.org/LandmarksOrHistoricalBuildings\">LandmarksOrHistoricalBuildings</a> to a <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a>.  This Type can be used on its own to describe a general <a class=\"localLink\" href=\"http://schema.org/TouristAttraction\">TouristAttraction</a>, or be used as an <a class=\"localLink\" href=\"http://schema.org/additionalType\">additionalType</a> to add tourist attraction properties to any other type.  (See examples below)'),
(787, 1, 5, 'UKNonprofitType', 'UKNonprofitType', 'UKNonprofitType: Non-profit organization type originating from the United Kingdom.'),
(788, 1, 5, 'AggregateRating', 'AggregateRating', 'The average rating based on multiple ratings or reviews.'),
(789, 1, 5, 'BowlingAlley', 'BowlingAlley', 'A bowling alley.'),
(790, 1, 5, 'TireShop', 'TireShop', 'A tire shop.'),
(791, 1, 5, 'MedicalSignOrSymptom', 'MedicalSignOrSymptom', 'Any feature associated or not with a medical condition. In medicine a symptom is generally subjective while a sign is objective.'),
(792, 1, 5, 'TradeAction', 'TradeAction', 'The act of participating in an exchange of goods and services for monetary compensation. An agent trades an object, product or service with a participant in exchange for a one time or periodic payment.'),
(793, 1, 5, 'FAQPage', 'FAQPage', 'A <a class=\"localLink\" href=\"http://schema.org/FAQPage\">FAQPage</a> is a <a class=\"localLink\" href=\"http://schema.org/WebPage\">WebPage</a> presenting one or more \"<a href=\"https://en.wikipedia.org/wiki/FAQ\">Frequently asked questions</a>\" (see also <a class=\"localLink\" href=\"http://schema.org/QAPage\">QAPage</a>).'),
(794, 1, 5, 'BedType', 'BedType', 'A type of bed. This is used for indicating the bed or beds available in an accommodation.'),
(795, 1, 5, 'PronounceableText', 'PronounceableText', 'Data type: PronounceableText.'),
(796, 1, 5, 'State', 'State', 'A state or province of a country.'),
(797, 1, 5, 'GovernmentService', 'GovernmentService', 'A service provided by a government organization, e.g. food stamps, veterans benefits, etc.'),
(798, 1, 5, 'HinduTemple', 'HinduTemple', 'A Hindu temple.'),
(799, 1, 5, 'MeetingRoom', 'MeetingRoom', 'A meeting room, conference room, or conference hall is a room provided for singular events such as business conferences and meetings (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Conference_hall\">http://en.wikipedia.org/wiki/Conference_hall</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(800, 1, 5, 'Guide', 'Guide', '<a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> is a page or article that recommend specific products or services, or aspects of a thing for a user to consider. A <a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> may represent a Buying Guide and detail aspects of products or services for a user to consider. A <a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> may represent a Product Guide and recommend specific products or services. A <a class=\"localLink\" href=\"http://schema.org/Guide\">Guide</a> may represent a Ranked List and recommend specific products or services with ranking.'),
(801, 1, 5, 'DepartAction', 'DepartAction', 'The act of  departing from a place. An agent departs from an fromLocation for a destination, optionally with participants.'),
(802, 1, 5, 'WebPageElement', 'WebPageElement', 'A web page element, like a table or an image.'),
(803, 1, 5, 'Schedule', 'Schedule', 'A schedule defines a repeating time period used to describe a regularly occurring <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a>. At a minimum a schedule will specify <a class=\"localLink\" href=\"http://schema.org/repeatFrequency\">repeatFrequency</a> which describes the interval between occurences of the event. Additional information can be provided to specify the schedule more precisely.\n      This includes identifying the day(s) of the week or month when the recurring event will take place, in addition to its start and end time. Schedules may also\n      have start and end dates to indicate when they are active, e.g. to define a limited calendar of events.'),
(804, 1, 5, 'PalliativeProcedure', 'PalliativeProcedure', 'A medical procedure intended primarily for palliative purposes, aimed at relieving the symptoms of an underlying health condition.'),
(805, 1, 5, 'ItemPage', 'ItemPage', 'A page devoted to a single item, such as a particular product or hotel.'),
(806, 1, 5, 'Zoo', 'Zoo', 'A zoo.'),
(807, 1, 5, 'Volcano', 'Volcano', 'A volcano, like Fuji san.'),
(808, 1, 5, 'SteeringPositionValue', 'SteeringPositionValue', 'A value indicating a steering position.'),
(809, 1, 5, 'MediaReview', 'MediaReview', '(editorial work in progress, this definition is incomplete and unreviewed)\n    A <a class=\"localLink\" href=\"http://schema.org/MediaReview\">MediaReview</a> is a more specialized form of Review dedicated to the evaluation of media content online, typically in the context of fact-checking and misinformation.\n    For more general reviews of media in the broader sense, use <a class=\"localLink\" href=\"http://schema.org/UserReview\">UserReview</a>, <a class=\"localLink\" href=\"http://schema.org/CriticReview\">CriticReview</a> or other <a class=\"localLink\" href=\"http://schema.org/Review\">Review</a> types.'),
(810, 1, 5, 'SuspendAction', 'SuspendAction', 'The act of momentarily pausing a device or application (e.g. pause music playback or pause a timer).'),
(811, 1, 5, 'BusTrip', 'BusTrip', 'A trip on a commercial bus line.'),
(812, 1, 5, 'ReplaceAction', 'ReplaceAction', 'The act of editing a recipient by replacing an old object with a new object.'),
(813, 1, 5, 'DietarySupplement', 'DietarySupplement', 'A product taken by mouth that contains a dietary ingredient intended to supplement the diet. Dietary ingredients may include vitamins, minerals, herbs or other botanicals, amino acids, and substances such as enzymes, organ tissues, glandulars and metabolites.'),
(814, 1, 5, 'MedicalBusiness', 'MedicalBusiness', 'A particular physical or virtual business of an organization for medical purposes. Examples of MedicalBusiness include differents business run by health professionals.'),
(815, 1, 5, 'JobPosting', 'JobPosting', 'A listing that describes a job opening in a certain organization.'),
(816, 1, 5, 'Text', 'Text', 'Data type: Text.'),
(817, 1, 5, 'RadioEpisode', 'RadioEpisode', 'A radio episode which can be part of a series or season.'),
(818, 1, 5, 'GovernmentBenefitsType', 'GovernmentBenefitsType', 'GovernmentBenefitsType enumerates several kinds of government benefits to support the COVID-19 situation. Note that this structure may not capture all benefits offered.'),
(819, 1, 5, 'BodyOfWater', 'BodyOfWater', 'A body of water, such as a sea, ocean, or lake.'),
(820, 1, 5, 'Demand', 'Demand', 'A demand entity represents the public, not necessarily binding, not necessarily exclusive, announcement by an organization or person to seek a certain type of goods or services. For describing demand using this type, the very same properties used for Offer apply.'),
(821, 1, 5, 'NonprofitType', 'NonprofitType', 'NonprofitType enumerates several kinds of official non-profit types of which a non-profit organization can be.'),
(822, 1, 5, 'Manuscript', 'Manuscript', 'A book, document, or piece of music written by hand rather than typed or printed.'),
(823, 1, 5, 'LifestyleModification', 'LifestyleModification', 'A process of care involving exercise, changes to diet, fitness routines, and other lifestyle changes aimed at improving a health condition.'),
(824, 1, 5, 'Distillery', 'Distillery', 'A distillery.'),
(825, 1, 5, 'UnitPriceSpecification', 'UnitPriceSpecification', 'The price asked for a given offer by the respective organization or person.'),
(826, 1, 5, 'BackgroundNewsArticle', 'BackgroundNewsArticle', 'A <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> providing historical context, definition and detail on a specific topic (aka \"explainer\" or \"backgrounder\"). For example, an in-depth article or frequently-asked-questions (<a href=\"https://en.wikipedia.org/wiki/FAQ\">FAQ</a>) document on topics such as Climate Change or the European Union. Other kinds of background material from a non-news setting are often described using <a class=\"localLink\" href=\"http://schema.org/Book\">Book</a> or <a class=\"localLink\" href=\"http://schema.org/Article\">Article</a>, in particular <a class=\"localLink\" href=\"http://schema.org/ScholarlyArticle\">ScholarlyArticle</a>. See also <a class=\"localLink\" href=\"http://schema.org/NewsArticle\">NewsArticle</a> for related vocabulary from a learning/education perspective.'),
(827, 1, 5, 'EventSeries', 'EventSeries', 'A series of <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a>s. Included events can relate with the series using the <a class=\"localLink\" href=\"http://schema.org/superEvent\">superEvent</a> property.<br/><br/>\n\nAn EventSeries is a collection of events that share some unifying characteristic. For example, \"The Olympic Games\" is a series, which\nis repeated regularly. The \"2012 London Olympics\" can be presented both as an <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a> in the series \"Olympic Games\", and as an\n<a class=\"localLink\" href=\"http://schema.org/EventSeries\">EventSeries</a> that included a number of sporting competitions as Events.<br/><br/>\n\nThe nature of the association between the events in an <a class=\"localLink\" href=\"http://schema.org/EventSeries\">EventSeries</a> can vary, but typical examples could\ninclude a thematic event series (e.g. topical meetups or classes), or a series of regular events that share a location, attendee group and/or organizers.<br/><br/>\n\nEventSeries has been defined as a kind of Event to make it easy for publishers to use it in an Event context without\nworrying about which kinds of series are really event-like enough to call an Event. In general an EventSeries\nmay seem more Event-like when the period of time is compact and when aspects such as location are fixed, but\nit may also sometimes prove useful to describe a longer-term series as an Event.'),
(828, 1, 5, 'ProductCollection', 'ProductCollection', 'A set of products (either <a class=\"localLink\" href=\"http://schema.org/ProductGroup\">ProductGroup</a>s or specific variants) that are listed together e.g. in an <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(829, 1, 5, 'BarOrPub', 'BarOrPub', 'A bar or pub.'),
(830, 1, 5, 'Play', 'Play', 'A play is a form of literature, usually consisting of dialogue between characters, intended for theatrical performance rather than just reading. Note the peformance of a Play would be a <a class=\"localLink\" href=\"http://schema.org/TheaterEvent\">TheaterEvent</a> - the <em>Play</em> being the <a class=\"localLink\" href=\"http://schema.org/workPerformed\">workPerformed</a>.'),
(831, 1, 5, 'GenderType', 'GenderType', 'An enumeration of genders.'),
(832, 1, 5, 'ProductGroup', 'ProductGroup', 'A ProductGroup represents a group of <a class=\"localLink\" href=\"http://schema.org/Product\">Product</a>s that vary only in certain well-described ways, such as by <a class=\"localLink\" href=\"http://schema.org/size\">size</a>, <a class=\"localLink\" href=\"http://schema.org/color\">color</a>, <a class=\"localLink\" href=\"http://schema.org/material\">material</a> etc.<br/><br/>\n\nWhile a ProductGroup itself is not directly offered for sale, the various varying products that it represents can be. The ProductGroup serves as a prototype or template, standing in for all of the products who have an <a class=\"localLink\" href=\"http://schema.org/isVariantOf\">isVariantOf</a> relationship to it. As such, properties (including additional types) can be applied to the ProductGroup to represent characteristics shared by each of the (possibly very many) variants. Properties that reference a ProductGroup are not included in this mechanism; neither are the following specific properties <a class=\"localLink\" href=\"http://schema.org/variesBy\">variesBy</a>, <a class=\"localLink\" href=\"http://schema.org/hasVariant\">hasVariant</a>, <a class=\"localLink\" href=\"http://schema.org/url\">url</a>.'),
(833, 1, 5, 'InteractAction', 'InteractAction', 'The act of interacting with another person or organization.'),
(834, 1, 5, 'AppendAction', 'AppendAction', 'The act of inserting at the end if an ordered collection.'),
(835, 1, 5, 'BusOrCoach', 'BusOrCoach', 'A bus (also omnibus or autobus) is a road vehicle designed to carry passengers. Coaches are luxury busses, usually in service for long distance travel.'),
(836, 1, 5, 'GatedResidenceCommunity', 'GatedResidenceCommunity', 'Residence type: Gated community.'),
(837, 1, 5, 'PodcastSeason', 'PodcastSeason', 'A single season of a podcast. Many podcasts do not break down into separate seasons. In that case, PodcastSeries should be used.'),
(838, 1, 5, 'UserLikes', 'UserLikes', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(839, 1, 5, 'MusicRecording', 'MusicRecording', 'A music recording (track), usually a single song.'),
(840, 1, 5, 'BoardingPolicyType', 'BoardingPolicyType', 'A type of boarding policy used by an airline.'),
(841, 1, 5, 'PetStore', 'PetStore', 'A pet store.'),
(842, 1, 5, 'QAPage', 'QAPage', 'A QAPage is a WebPage focussed on a specific Question and its Answer(s), e.g. in a question answering site or documenting Frequently Asked Questions (FAQs).'),
(843, 1, 5, 'OwnershipInfo', 'OwnershipInfo', 'A structured value providing information about when a certain organization or person owned a certain product.'),
(844, 1, 5, 'NoteDigitalDocument', 'NoteDigitalDocument', 'A file containing a note, primarily for the author.'),
(845, 1, 5, 'CreativeWork', 'CreativeWork', 'The most generic kind of creative work, including books, movies, photographs, software programs, etc.'),
(846, 1, 5, 'InformAction', 'InformAction', 'The act of notifying someone of information pertinent to them, with no expectation of a response.'),
(847, 1, 5, 'OnDemandEvent', 'OnDemandEvent', 'A publication event e.g. catch-up TV or radio podcast, during which a program is available on-demand.'),
(848, 1, 5, 'StadiumOrArena', 'StadiumOrArena', 'A stadium.'),
(849, 1, 5, 'MotorcycleDealer', 'MotorcycleDealer', 'A motorcycle dealer.'),
(850, 1, 5, 'Locksmith', 'Locksmith', 'A locksmith.'),
(851, 1, 5, 'Integer', 'Integer', 'Data type: Integer.'),
(852, 1, 5, 'SubscribeAction', 'SubscribeAction', 'The act of forming a personal connection with someone/something (object) unidirectionally/asymmetrically to get updates pushed to.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/FollowAction\">FollowAction</a>: Unlike FollowAction, SubscribeAction implies that the subscriber acts as a passive agent being constantly/actively pushed for updates.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/RegisterAction\">RegisterAction</a>: Unlike RegisterAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/JoinAction\">JoinAction</a>: Unlike JoinAction, SubscribeAction implies that the agent is interested in continuing receiving updates from the object.</li>\n</ul>\n'),
(853, 1, 5, 'TheaterEvent', 'TheaterEvent', 'Event type: Theater performance.'),
(854, 1, 5, 'Canal', 'Canal', 'A canal, like the Panama Canal.'),
(855, 1, 5, 'MotorcycleRepair', 'MotorcycleRepair', 'A motorcycle repair shop.'),
(856, 1, 5, 'PrependAction', 'PrependAction', 'The act of inserting at the beginning if an ordered collection.'),
(857, 1, 5, 'UnRegisterAction', 'UnRegisterAction', 'The act of un-registering from a service.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/RegisterAction\">RegisterAction</a>: antonym of UnRegisterAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/LeaveAction\">LeaveAction</a>: Unlike LeaveAction, UnRegisterAction implies that you are unregistering from a service you werer previously registered, rather than leaving a team/group of people.</li>\n</ul>\n'),
(858, 1, 5, 'SellAction', 'SellAction', 'The act of taking money from a buyer in exchange for goods or services rendered. An agent sells an object, product, or service to a buyer for a price. Reciprocal of BuyAction.'),
(859, 1, 5, 'Thesis', 'Thesis', 'A thesis or dissertation document submitted in support of candidature for an academic degree or professional qualification.'),
(860, 1, 5, 'CollectionPage', 'CollectionPage', 'Web page type: Collection page.'),
(861, 1, 5, 'RefundTypeEnumeration', 'RefundTypeEnumeration', 'RefundTypeEnumeration enumerates several kinds of product return refund types.'),
(862, 1, 5, 'MedicalOrganization', 'MedicalOrganization', 'A medical organization (physical or not), such as hospital, institution or clinic.'),
(863, 1, 5, 'HowToTool', 'HowToTool', 'A tool used (but not consumed) when performing instructions for how to achieve a result.'),
(864, 1, 5, 'MovieSeries', 'MovieSeries', 'A series of movies. Included movies can be indicated with the hasPart property.'),
(865, 1, 5, 'SpecialAnnouncement', 'SpecialAnnouncement', 'A SpecialAnnouncement combines a simple date-stamped textual information update\n      with contextualized Web links and other structured data.  It represents an information update made by a\n      locally-oriented organization, for example schools, pharmacies, healthcare providers,  community groups, police,\n      local government.<br/><br/>\n\nFor work in progress guidelines on Coronavirus-related markup see <a href=\"https://docs.google.com/document/d/14ikaGCKxo50rRM7nvKSlbUpjyIk2WMQd3IkB1lItlrM/edit#\">this doc</a>.<br/><br/>\n\nThe motivating scenario for SpecialAnnouncement is the <a href=\"https://en.wikipedia.org/wiki/2019%E2%80%9320_coronavirus_pandemic\">Coronavirus pandemic</a>, and the initial vocabulary is oriented to this urgent situation. Schema.org\nexpect to improve the markup iteratively as it is deployed and as feedback emerges from use. In addition to our\nusual <a href=\"https://github.com/schemaorg/schemaorg/issues/2490\">Github entry</a>, feedback comments can also be provided in <a href=\"https://docs.google.com/document/d/1fpdFFxk8s87CWwACs53SGkYv3aafSxz_DTtOQxMrBJQ/edit#\">this document</a>.<br/><br/>\n\nWhile this schema is designed to communicate urgent crisis-related information, it is not the same as an emergency warning technology like <a href=\"https://en.wikipedia.org/wiki/Common_Alerting_Protocol\">CAP</a>, although there may be overlaps. The intent is to cover\nthe kinds of everyday practical information being posted to existing websites during an emergency situation.<br/><br/>\n\nSeveral kinds of information can be provided:<br/><br/>\n\nWe encourage the provision of \"name\", \"text\", \"datePosted\", \"expires\" (if appropriate), \"category\" and\n\"url\" as a simple baseline. It is important to provide a value for \"category\" where possible, most ideally as a well known\nURL from Wikipedia or Wikidata. In the case of the 2019-2020 Coronavirus pandemic, this should be \"https://en.wikipedia.org/w/index.php?title=2019-20_coronavirus_pandemic\" or \"https://www.wikidata.org/wiki/Q81068910\".<br/><br/>\n\nFor many of the possible properties, values can either be simple links or an inline description, depending on whether a summary is available. For a link, provide just the URL of the appropriate page as the property\'s value. For an inline description, use a <a class=\"localLink\" href=\"http://schema.org/WebContent\">WebContent</a> type, and provide the url as a property of that, alongside at least a simple \"<a class=\"localLink\" href=\"http://schema.org/text\">text</a>\" summary of the page. It is\nunlikely that a single SpecialAnnouncement will need all of the possible properties simultaneously.<br/><br/>\n\nWe expect that in many cases the page referenced might contain more specialized structured data, e.g. contact info, <a class=\"localLink\" href=\"http://schema.org/openingHours\">openingHours</a>, <a class=\"localLink\" href=\"http://schema.org/Event\">Event</a>, <a class=\"localLink\" href=\"http://schema.org/FAQPage\">FAQPage</a> etc. By linking to those pages from a <a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a> you can help make it clearer that the events are related to the situation (e.g. Coronavirus) indicated by the <a class=\"localLink\" href=\"http://schema.org/category\">category</a> property of the <a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a>.<br/><br/>\n\nMany <a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a>s will relate to particular regions and to identifiable local organizations. Use <a class=\"localLink\" href=\"http://schema.org/spatialCoverage\">spatialCoverage</a> for the region, and <a class=\"localLink\" href=\"http://schema.org/announcementLocation\">announcementLocation</a> to indicate specific <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a>es and <a class=\"localLink\" href=\"http://schema.org/CivicStructures\">CivicStructures</a>. If the announcement affects both a particular region and a specific location (for example, a library closure that serves an entire region), use both <a class=\"localLink\" href=\"http://schema.org/spatialCoverage\">spatialCoverage</a> and <a class=\"localLink\" href=\"http://schema.org/announcementLocation\">announcementLocation</a>.<br/><br/>\n\nThe <a class=\"localLink\" href=\"http://schema.org/about\">about</a> property can be used to indicate entities that are the focus of the announcement. We now recommend using <a class=\"localLink\" href=\"http://schema.org/about\">about</a> only\nfor representing non-location entities (e.g. a <a class=\"localLink\" href=\"http://schema.org/Course\">Course</a> or a <a class=\"localLink\" href=\"http://schema.org/RadioStation\">RadioStation</a>). For places, use <a class=\"localLink\" href=\"http://schema.org/announcementLocation\">announcementLocation</a> and <a class=\"localLink\" href=\"http://schema.org/spatialCoverage\">spatialCoverage</a>. Consumers of this markup should be aware that the initial design encouraged the use of /about for locations too.<br/><br/>\n\nThe basic content of <a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a> is similar to that of an <a href=\"https://en.wikipedia.org/wiki/RSS\">RSS</a> or <a href=\"https://en.wikipedia.org/wiki/Atom_(Web_standard)\">Atom</a> feed. For publishers without such feeds, basic feed-like information can be shared by posting\n<a class=\"localLink\" href=\"http://schema.org/SpecialAnnouncement\">SpecialAnnouncement</a> updates in a page, e.g. using JSON-LD. For sites with Atom/RSS functionality, you can point to a feed\nwith the <a class=\"localLink\" href=\"http://schema.org/webFeed\">webFeed</a> property. This can be a simple URL, or an inline <a class=\"localLink\" href=\"http://schema.org/DataFeed\">DataFeed</a> object, with <a class=\"localLink\" href=\"http://schema.org/encodingFormat\">encodingFormat</a> providing\nmedia type information e.g. \"application/rss+xml\" or \"application/atom+xml\".'),
(866, 1, 5, 'CheckOutAction', 'CheckOutAction', 'The act of an agent communicating (service provider, social media, etc) their departure of a previously reserved service (e.g. flight check in) or place (e.g. hotel).<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/CheckInAction\">CheckInAction</a>: The antonym of CheckOutAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/DepartAction\">DepartAction</a>: Unlike DepartAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/CancelAction\">CancelAction</a>: Unlike CancelAction, CheckOutAction implies that the agent is informing/confirming the end of a previously reserved service.</li>\n</ul>\n'),
(867, 1, 5, 'HowToSupply', 'HowToSupply', 'A supply consumed when performing the instructions for how to achieve a result.'),
(868, 1, 5, 'SelfStorage', 'SelfStorage', 'A self-storage facility.'),
(869, 1, 5, 'MedicalRiskCalculator', 'MedicalRiskCalculator', 'A complex mathematical calculation requiring an online calculator, used to assess prognosis. Note: use the url property of Thing to record any URLs for online calculators.'),
(870, 1, 5, 'BoatReservation', 'BoatReservation', 'A reservation for boat travel.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations. For offers of tickets, use <a class=\"localLink\" href=\"http://schema.org/Offer\">Offer</a>.'),
(871, 1, 5, 'MedicalWebPage', 'MedicalWebPage', 'A web page that provides medical information.'),
(872, 1, 5, 'PublicSwimmingPool', 'PublicSwimmingPool', 'A public swimming pool.'),
(873, 1, 5, 'TextDigitalDocument', 'TextDigitalDocument', 'A file composed primarily of text.'),
(874, 1, 5, 'Apartment', 'Apartment', 'An apartment (in American English) or flat (in British English) is a self-contained housing unit (a type of residential real estate) that occupies only part of a building (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Apartment\">http://en.wikipedia.org/wiki/Apartment</a>).'),
(875, 1, 5, 'HairSalon', 'HairSalon', 'A hair salon.'),
(876, 1, 5, 'PublicationEvent', 'PublicationEvent', 'A PublicationEvent corresponds indifferently to the event of publication for a CreativeWork of any type e.g. a broadcast event, an on-demand event, a book/journal publication via a variety of delivery media.'),
(877, 1, 5, 'MenuSection', 'MenuSection', 'A sub-grouping of food or drink items in a menu. E.g. courses (such as \'Dinner\', \'Breakfast\', etc.), specific type of dishes (such as \'Meat\', \'Vegan\', \'Drinks\', etc.), or some other classification made by the menu provider.'),
(878, 1, 5, 'BloodTest', 'BloodTest', 'A medical test performed on a sample of a patient\'s blood.'),
(879, 1, 5, 'ReserveAction', 'ReserveAction', 'Reserving a concrete object.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/ScheduleAction\">ScheduleAction</a></a>: Unlike ScheduleAction, ReserveAction reserves concrete objects (e.g. a table, a hotel) towards a time slot / spatial allocation.</li>\n</ul>\n'),
(880, 1, 5, 'AMRadioChannel', 'AMRadioChannel', 'A radio channel that uses AM.'),
(881, 1, 5, 'URL', 'URL', 'Data type: URL.'),
(882, 1, 5, 'OrderItem', 'OrderItem', 'An order item is a line of an order. It includes the quantity and shipping details of a bought offer.'),
(883, 1, 5, 'ShippingDeliveryTime', 'ShippingDeliveryTime', 'ShippingDeliveryTime provides various pieces of information about delivery times for shipping.'),
(884, 1, 5, 'Energy', 'Energy', 'Properties that take Energy as values are of the form \'&lt;Number&gt; &lt;Energy unit of measure&gt;\'.'),
(885, 1, 5, 'GovernmentOffice', 'GovernmentOffice', 'A government office&#x2014;for example, an IRS or DMV office.'),
(886, 1, 5, 'DrugLegalStatus', 'DrugLegalStatus', 'The legal availability status of a medical drug.'),
(887, 1, 5, 'ExhibitionEvent', 'ExhibitionEvent', 'Event type: Exhibition event, e.g. at a museum, library, archive, tradeshow, ...'),
(888, 1, 5, 'UserBlocks', 'UserBlocks', 'UserInteraction and its subtypes is an old way of talking about users interacting with pages. It is generally better to use <a class=\"localLink\" href=\"http://schema.org/Action\">Action</a>-based vocabulary, alongside types such as <a class=\"localLink\" href=\"http://schema.org/Comment\">Comment</a>.'),
(889, 1, 5, 'Product', 'Product', 'Any offered product or service. For example: a pair of shoes; a concert ticket; the rental of a car; a haircut; or an episode of a TV show streamed online.'),
(890, 1, 5, 'Number', 'Number', 'Data type: Number.<br/><br/>\n\nUsage guidelines:<br/><br/>\n\n<ul>\n<li>Use values from 0123456789 (Unicode \'DIGIT ZERO\' (U+0030) to \'DIGIT NINE\' (U+0039)) rather than superficially similiar Unicode symbols.</li>\n<li>Use \'.\' (Unicode \'FULL STOP\' (U+002E)) rather than \',\' to indicate a decimal point. Avoid using these symbols as a readability separator.</li>\n</ul>\n'),
(891, 1, 5, 'FundingScheme', 'FundingScheme', 'A FundingScheme combines organizational, project and policy aspects of grant-based funding\n    that sets guidelines, principles and mechanisms to support other kinds of projects and activities.\n    Funding is typically organized via <a class=\"localLink\" href=\"http://schema.org/Grant\">Grant</a> funding. Examples of funding schemes: Swiss Priority Programmes (SPPs); EU Framework 7 (FP7); Horizon 2020; the NIH-R01 Grant Program; Wellcome institutional strategic support fund. For large scale public sector funding, the management and administration of grant awards is often handled by other, dedicated, organizations - <a class=\"localLink\" href=\"http://schema.org/FundingAgency\">FundingAgency</a>s such as ERC, REA, ...'),
(892, 1, 5, 'PlaceOfWorship', 'PlaceOfWorship', 'Place of worship, such as a church, synagogue, or mosque.'),
(893, 1, 5, 'CriticReview', 'CriticReview', 'A <a class=\"localLink\" href=\"http://schema.org/CriticReview\">CriticReview</a> is a more specialized form of Review written or published by a source that is recognized for its reviewing activities. These can include online columns, travel and food guides, TV and radio shows, blogs and other independent Web sites. <a class=\"localLink\" href=\"http://schema.org/CriticReview\">CriticReview</a>s are typically more in-depth and professionally written. For simpler, casually written user/visitor/viewer/customer reviews, it is more appropriate to use the <a class=\"localLink\" href=\"http://schema.org/UserReview\">UserReview</a> type. Review aggregator sites such as Metacritic already separate out the site\'s user reviews from selected critic reviews that originate from third-party sources.'),
(894, 1, 5, 'AchieveAction', 'AchieveAction', 'The act of accomplishing something via previous efforts. It is an instantaneous action rather than an ongoing process.'),
(895, 1, 5, 'ConsumeAction', 'ConsumeAction', 'The act of ingesting information/resources/food.'),
(896, 1, 5, 'OutletStore', 'OutletStore', 'An outlet store.'),
(897, 1, 5, 'ExercisePlan', 'ExercisePlan', 'Fitness-related activity designed for a specific health-related purpose, including defined exercise routines as well as activity prescribed by a clinician.'),
(898, 1, 5, 'DatedMoneySpecification', 'DatedMoneySpecification', 'A DatedMoneySpecification represents monetary values with optional start and end dates. For example, this could represent an employee\'s salary over a specific period of time. <strong>Note:</strong> This type has been superseded by <a class=\"localLink\" href=\"http://schema.org/MonetaryAmount\">MonetaryAmount</a> use of that type is recommended'),
(899, 1, 5, 'MedicalSpecialty', 'MedicalSpecialty', 'Any specific branch of medical science or practice. Medical specialities include clinical specialties that pertain to particular organ systems and their respective disease states, as well as allied health specialties. Enumerated type.'),
(900, 1, 5, 'PublicationIssue', 'PublicationIssue', 'A part of a successively published publication such as a periodical or publication volume, often numbered, usually containing a grouping of works such as articles.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html\">blog post</a>.'),
(901, 1, 5, 'BroadcastFrequencySpecification', 'BroadcastFrequencySpecification', 'The frequency in MHz and the modulation used for a particular BroadcastService.'),
(902, 1, 5, 'ExerciseAction', 'ExerciseAction', 'The act of participating in exertive activity for the purposes of improving health and fitness.'),
(903, 1, 5, 'WorkersUnion', 'WorkersUnion', 'A Workers Union (also known as a Labor Union, Labour Union, or Trade Union) is an organization that promotes the interests of its worker members by collectively bargaining with management, organizing, and political lobbying.'),
(904, 1, 5, 'ShoeStore', 'ShoeStore', 'A shoe store.'),
(905, 1, 5, 'FloorPlan', 'FloorPlan', 'A FloorPlan is an explicit representation of a collection of similar accommodations, allowing the provision of common information (room counts, sizes, layout diagrams) and offers for rental or sale. In typical use, some <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a> has an <a class=\"localLink\" href=\"http://schema.org/accommodationFloorPlan\">accommodationFloorPlan</a> which is a <a class=\"localLink\" href=\"http://schema.org/FloorPlan\">FloorPlan</a>.  A FloorPlan is always in the context of a particular place, either a larger <a class=\"localLink\" href=\"http://schema.org/ApartmentComplex\">ApartmentComplex</a> or a single <a class=\"localLink\" href=\"http://schema.org/Apartment\">Apartment</a>. The visual/spatial aspects of a floor plan (i.e. room layout, <a href=\"https://en.wikipedia.org/wiki/Floor_plan\">see wikipedia</a>) can be indicated using <a class=\"localLink\" href=\"http://schema.org/image\">image</a>.'),
(906, 1, 5, 'Article', 'Article', 'An article, such as a news article or piece of investigative report. Newspapers and magazines have articles of many different types and this is intended to cover them all.<br/><br/>\n\nSee also <a href=\"http://blog.schema.org/2014/09/schemaorg-support-for-bibliographic_2.html\">blog post</a>.'),
(907, 1, 5, 'Motel', 'Motel', 'A motel.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(908, 1, 5, 'Pharmacy', 'Pharmacy', 'A pharmacy or drugstore.'),
(909, 1, 5, 'XPathType', 'XPathType', 'Text representing an XPath (typically but not necessarily version 1.0).'),
(910, 1, 5, 'MenuItem', 'MenuItem', 'A food or drink item listed in a menu or menu section.'),
(911, 1, 5, 'RejectAction', 'RejectAction', 'The act of rejecting to/adopting an object.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/AcceptAction\">AcceptAction</a>: The antonym of RejectAction.</li>\n</ul>\n'),
(912, 1, 5, 'BedAndBreakfast', 'BedAndBreakfast', 'Bed and breakfast.\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(913, 1, 5, 'BedDetails', 'BedDetails', 'An entity holding detailed information about the available bed types, e.g. the quantity of twin beds for a hotel room. For the single case of just one bed of a certain type, you can use bed directly with a text. See also <a class=\"localLink\" href=\"http://schema.org/BedType\">BedType</a> (under development).'),
(914, 1, 5, 'WatchAction', 'WatchAction', 'The act of consuming dynamic/moving visual content.'),
(915, 1, 5, 'SportsClub', 'SportsClub', 'A sports club.'),
(916, 1, 5, 'PropertyValueSpecification', 'PropertyValueSpecification', 'A Property value specification.'),
(917, 1, 5, 'DiagnosticLab', 'DiagnosticLab', 'A medical laboratory that offers on-site or off-site diagnostic services.'),
(918, 1, 5, 'RentalCarReservation', 'RentalCarReservation', 'A reservation for a rental car.<br/><br/>\n\nNote: This type is for information about actual reservations, e.g. in confirmation emails or HTML pages with individual confirmations of reservations.'),
(919, 1, 5, 'CategoryCode', 'CategoryCode', 'A Category Code.'),
(920, 1, 5, 'DigitalDocumentPermission', 'DigitalDocumentPermission', 'A permission for a particular person or group to access a particular file.'),
(921, 1, 5, 'CoverArt', 'CoverArt', 'The artwork on the outer surface of a CreativeWork.'),
(922, 1, 5, 'DisagreeAction', 'DisagreeAction', 'The act of expressing a difference of opinion with the object. An agent disagrees to/about an object (a proposition, topic or theme) with participants.'),
(923, 1, 5, 'UseAction', 'UseAction', 'The act of applying an object to its intended purpose.'),
(924, 1, 5, 'SportingGoodsStore', 'SportingGoodsStore', 'A sporting goods store.'),
(925, 1, 5, 'ParkingFacility', 'ParkingFacility', 'A parking lot or other parking facility.'),
(926, 1, 5, 'Church', 'Church', 'A church.'),
(927, 1, 5, 'ImageGallery', 'ImageGallery', 'Web page type: Image gallery page.'),
(928, 1, 5, 'DefinedRegion', 'DefinedRegion', 'A DefinedRegion is a geographic area defined by potentially arbitrary (rather than political, administrative or natural geographical) criteria. Properties are provided for defining a region by reference to sets of postal codes.<br/><br/>\n\nExamples: a delivery destination when shopping. Region where regional pricing is configured.<br/><br/>\n\nRequirement 1:\nCountry: US\nStates: \"NY\", \"CA\"<br/><br/>\n\nRequirement 2:\nCountry: US\nPostalCode Set: { [94000-94585], [97000, 97999], [13000, 13599]}\n{ [12345, 12345], [78945, 78945], }\nRegion = state, canton, prefecture, autonomous community...'),
(929, 1, 5, 'Painting', 'Painting', 'A painting.'),
(930, 1, 5, 'Book', 'Book', 'A book.'),
(931, 1, 5, 'ContactPoint', 'ContactPoint', 'A contact point&#x2014;for example, a Customer Complaints department.'),
(932, 1, 5, 'ReceiveAction', 'ReceiveAction', 'The act of physically/electronically taking delivery of an object thathas been transferred from an origin to a destination. Reciprocal of SendAction.<br/><br/>\n\nRelated actions:<br/><br/>\n\n<ul>\n<li><a class=\"localLink\" href=\"http://schema.org/SendAction\">SendAction</a>: The reciprocal of ReceiveAction.</li>\n<li><a class=\"localLink\" href=\"http://schema.org/TakeAction\">TakeAction</a>: Unlike TakeAction, ReceiveAction does not imply that the ownership has been transfered (e.g. I can receive a package, but it does not mean the package is now mine).</li>\n</ul>\n'),
(933, 1, 5, 'HealthAspectEnumeration', 'HealthAspectEnumeration', 'HealthAspectEnumeration enumerates several aspects of health content online, each of which might be described using <a class=\"localLink\" href=\"http://schema.org/hasHealthAspect\">hasHealthAspect</a> and <a class=\"localLink\" href=\"http://schema.org/HealthTopicContent\">HealthTopicContent</a>.'),
(934, 1, 5, 'MedicalStudy', 'MedicalStudy', 'A medical study is an umbrella type covering all kinds of research studies relating to human medicine or health, including observational studies and interventional trials and registries, randomized, controlled or not. When the specific type of study is known, use one of the extensions of this type, such as MedicalTrial or MedicalObservationalStudy. Also, note that this type should be used to mark up data that describes the study itself; to tag an article that publishes the results of a study, use MedicalScholarlyArticle. Note: use the code property of MedicalEntity to store study IDs, e.g. clinicaltrials.gov ID.'),
(935, 1, 5, 'InternetCafe', 'InternetCafe', 'An internet cafe.'),
(936, 1, 5, 'Table', 'Table', 'A table on a Web page.'),
(937, 1, 5, 'Clip', 'Clip', 'A short TV or radio program or a segment/part of a program.'),
(938, 1, 5, 'Resort', 'Resort', 'A resort is a place used for relaxation or recreation, attracting visitors for holidays or vacations. Resorts are places, towns or sometimes commercial establishment operated by a single company (Source: Wikipedia, the free encyclopedia, see <a href=\"http://en.wikipedia.org/wiki/Resort\">http://en.wikipedia.org/wiki/Resort</a>).\n<br /><br />\nSee also the <a href=\"/docs/hotels.html\">dedicated document on the use of schema.org for marking up hotels and other forms of accommodations</a>.'),
(939, 1, 5, 'LegislationObject', 'LegislationObject', 'A specific object or file containing a Legislation. Note that the same Legislation can be published in multiple files. For example, a digitally signed PDF, a plain PDF and an HTML version.'),
(940, 1, 5, 'BroadcastEvent', 'BroadcastEvent', 'An over the air or online broadcast event.'),
(941, 1, 5, 'CollegeOrUniversity', 'CollegeOrUniversity', 'A college, university, or other third-level educational institution.'),
(942, 1, 5, 'HomeAndConstructionBusiness', 'HomeAndConstructionBusiness', 'A construction business.<br/><br/>\n\nA HomeAndConstructionBusiness is a <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a> that provides services around homes and buildings.<br/><br/>\n\nAs a <a class=\"localLink\" href=\"http://schema.org/LocalBusiness\">LocalBusiness</a> it can be described as a <a class=\"localLink\" href=\"http://schema.org/provider\">provider</a> of one or more <a class=\"localLink\" href=\"http://schema.org/Service\">Service</a>(s).'),
(943, 1, 5, 'OpeningHoursSpecification', 'OpeningHoursSpecification', 'A structured value providing information about the opening hours of a place or a certain service inside a place.<br/><br/>\n\nThe place is <strong>open</strong> if the <a class=\"localLink\" href=\"http://schema.org/opens\">opens</a> property is specified, and <strong>closed</strong> otherwise.<br/><br/>\n\nIf the value for the <a class=\"localLink\" href=\"http://schema.org/closes\">closes</a> property is less than the value for the <a class=\"localLink\" href=\"http://schema.org/opens\">opens</a> property then the hour range is assumed to span over the next day.'),
(944, 1, 5, 'TVSeason', 'TVSeason', 'Season dedicated to TV broadcast and associated online delivery.'),
(945, 1, 5, 'MedicalObservationalStudyDesign', 'MedicalObservationalStudyDesign', 'Design models for observational medical studies. Enumerated type.'),
(946, 1, 5, 'AssignAction', 'AssignAction', 'The act of allocating an action/event/task to some destination (someone or something).'),
(947, 1, 5, 'Playground', 'Playground', 'A playground.'),
(948, 1, 5, 'WebSite', 'WebSite', 'A WebSite is a set of related web pages and other items typically served from a single web domain and accessible via URLs.'),
(949, 1, 5, 'PaymentChargeSpecification', 'PaymentChargeSpecification', 'The costs of settling the payment using a particular payment method.'),
(950, 1, 5, 'MarryAction', 'MarryAction', 'The act of marrying a person.'),
(951, 1, 5, 'BreadcrumbList', 'BreadcrumbList', 'A BreadcrumbList is an ItemList consisting of a chain of linked Web pages, typically described using at least their URL and their name, and typically ending with the current page.<br/><br/>\n\nThe <a class=\"localLink\" href=\"http://schema.org/position\">position</a> property is used to reconstruct the order of the items in a BreadcrumbList The convention is that a breadcrumb list has an <a class=\"localLink\" href=\"http://schema.org/itemListOrder\">itemListOrder</a> of <a class=\"localLink\" href=\"http://schema.org/ItemListOrderAscending\">ItemListOrderAscending</a> (lower values listed first), and that the first items in this list correspond to the \"top\" or beginning of the breadcrumb trail, e.g. with a site or section homepage. The specific values of \'position\' are not assigned meaning for a BreadcrumbList, but they should be integers, e.g. beginning with \'1\' for the first item in the list.'),
(952, 1, 5, 'Distance', 'Distance', 'Properties that take Distances as values are of the form \'&lt;Number&gt; &lt;Length unit of measure&gt;\'. E.g., \'7 ft\'.'),
(953, 1, 5, 'ShareAction', 'ShareAction', 'The act of distributing content to people for their amusement or edification.'),
(954, 1, 5, 'WebAPI', 'WebAPI', 'An application programming interface accessible over Web/Internet technologies.');

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
(2, 1, 32, NULL, NULL, 'Document'),
(3, 1, 26, NULL, NULL, 'Image'),
(4, 1, 23, NULL, NULL, 'Collection');

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
  `data_type` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`) VALUES
(21, 2, 10, NULL, NULL, 1, NULL, 1, 0),
(22, 2, 1, NULL, NULL, 2, NULL, 0, 0),
(23, 2, 4, NULL, NULL, 3, NULL, 0, 0),
(24, 2, 2, NULL, NULL, 4, NULL, 0, 0),
(25, 2, 7, NULL, NULL, 5, '[\"numeric:timestamp\"]', 0, 0),
(26, 2, 41, 'Date (Circa)', NULL, 6, '[\"numeric:interval\"]', 0, 0),
(27, 2, 8, NULL, NULL, 7, NULL, 0, 0),
(28, 2, 11, NULL, NULL, 10, NULL, 0, 0),
(29, 2, 48, 'Attribution', NULL, 11, NULL, 0, 0),
(30, 2, 15, NULL, NULL, 12, NULL, 0, 0),
(31, 2, 28, 'See Also', NULL, 13, '[\"uri\"]', 0, 0),
(32, 2, 156, 'Depicts', NULL, 14, '[\"uri\"]', 0, 0),
(33, 2, 242, 'Width', NULL, 8, NULL, 0, 0),
(34, 2, 799, 'Height', NULL, 9, NULL, 0, 0),
(35, 3, 10, NULL, NULL, 1, NULL, 1, 0),
(38, 4, 10, NULL, NULL, 1, NULL, 1, 0),
(39, 4, 1, NULL, NULL, 2, NULL, 0, 0),
(40, 4, 4, NULL, NULL, 3, NULL, 0, 0);

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
('22873f4e8d686d659a395802a9256947', 0x5f5f4c616d696e61737c613a31303a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353232363834352e3136383532373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226261663530373032633336626363666632306338626163643437373337646361223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353230393136303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353233303434353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353233303433313b7d733a36303a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496969665365727665725f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353232393638353b7d733a35383a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f436c65616e55726c5f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353232393434313b7d733a33373a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353232323034303b7d733a36313a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496d6167655365727665725f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353232393335343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353232393331353b7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223061643732623338313233383331363430316337626362306533633161303462223b733a33323a223461636531316532633030333333383063333466376161333139646434393237223b7d733a343a2268617368223b733a36353a2234616365313165326330303333333830633334663761613331396464343932372d3061643732623338313233383331363430316337626362306533633161303462223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a373237323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a38373a7b733a33323a223836663465336333366362333531353838643935376337643939343231666465223b733a33323a226362393934323066623934666363666637343637393933333037646465303030223b733a33323a226638393931653338383862386665393431623034666539623330383435346365223b733a33323a223232373031663464626161656166646633326663353866633439303761643735223b733a33323a223966353562623331313261306634353939336663383339386532613766656538223b733a33323a226539623436643638353236343764643466343730653733313938326561343238223b733a33323a223135626165623731333837303637326561636562643438623037333962353863223b733a33323a223561623032313133623831393165623335323266386234613030353163396437223b733a33323a223135613662623365393262633238663735653265373738376334656261366465223b733a33323a223062346161356633346431303365363761663633376137356237303064376333223b733a33323a223531313737636630623563323265323337353564323163313034643862623030223b733a33323a223839643333623437323933646239373632373736323636613161336238336639223b733a33323a223762333336613062653963663663613132373864323732316134353264343036223b733a33323a223036303763316230323933373361643735366233343661323436306462376330223b733a33323a226435636566636164386264353163393936343662396634623030666263643363223b733a33323a223431623934396334393066356336376331333033366339636663653832363061223b733a33323a226531653634623762366263313766303134396563326331613736653132323364223b733a33323a226532306165383264623435313933343038616236623661643637323065653335223b733a33323a223462316662613336653166653434333662306563363333363264353939313938223b733a33323a226636646464383736373163316532656662323834303361393263343630643262223b733a33323a223361323133316432323833313433343265383135343764363066623366393866223b733a33323a223531653036666638663064373635626363376166393264366331623535383239223b733a33323a223037633536653431383331623433336330393336633438383232383439653866223b733a33323a223939396661623464303639336531303464666631633938373932353531303132223b733a33323a223737333063343030303132373764343261386464316134373066343566653166223b733a33323a226334653262343934363132343661663334373063386365623066386439313036223b733a33323a226363663634356363636236666333313134353634643563366531663937393634223b733a33323a223939313262306537316530366264616133366261376162646635306630613437223b733a33323a223563383037353031633266616562663435333630643832386236623138383831223b733a33323a223232313461353535386533386133356238643230613064353432356466353830223b733a33323a226563316665666134623362323633336534646333343537633431303538343232223b733a33323a223130323264633966646266646337353334643737663762333131653136646264223b733a33323a223565656234393331633838313662303864303233646637373565613064663163223b733a33323a223436613063663836366330373438646365326633306461376637373739343837223b733a33323a223933343837303936353930373166393465303637656565346665326464316432223b733a33323a226632353231616533396230383435366230363664326530663635303866343664223b733a33323a226366373137326534343835646435656364633262333661636561613133653430223b733a33323a226666393562636139333536373238636561373034613863393937353133656632223b733a33323a223433633664343164616663653639396530666435333861346165646362306665223b733a33323a223039373365656563633432313637323236646361653932366237323963313166223b733a33323a226437633235663632303166663334343539633430666533323531663932376364223b733a33323a223636636536323834626531656134323736656138633066326138646261356330223b733a33323a223764313237626261626636653337313131383335656334643432333662616166223b733a33323a223231303364666334346433373535336530653334313339643535306666326364223b733a33323a223236626639333530323935316537303431363838386236313461313561386536223b733a33323a223333336639336466306335303637623838383161343630626336636438323133223b733a33323a226433316638323635616233323830356161323331373238343836346431303436223b733a33323a223334363961323138366437316162643434303963666266623936363337383835223b733a33323a223734353935346535343564326135363865383064396136376539643963383564223b733a33323a226263323031393531383833343939666133316235636134366161323964356166223b733a33323a223861396166373132653734663236616161353763303138303933623237636433223b733a33323a223939396235363163376636376238313661343434353338353462336136616166223b733a33323a226561656136393831356131346530623934613662633565396365386366393031223b733a33323a223833303131656265306266393433623130663035333564613732363961656634223b733a33323a223363386630393963636461643362643062643565346130333438623933353930223b733a33323a226337636263663162393965336631313463643735353330396432303536383337223b733a33323a226135633339393934363235323261666665653535643837653033633464323231223b733a33323a223964343035373765303236656662653666633931326663356662656232303863223b733a33323a223466393639383236326335373466313030656239613239636431613937346564223b733a33323a223939383937373734326131353061333763646166616566626564333463306364223b733a33323a226364383636393737373730376437303865646266333733656263366461613261223b733a33323a223130376236623336343666373132383664393165653066653266313839396335223b733a33323a223330353431386166353862336561356332646134366331353334373637643035223b733a33323a226561626462393930623766343463666639643230383732346534373966636136223b733a33323a223863313865333038653661356465323264653136663733316261643637386432223b733a33323a226562326663326334663264396665666565646665626333643932393034663436223b733a33323a226439386636633932373363623136636432646531656538633861663830336666223b733a33323a223461303739393561633766353131346464393963353231323331326464393030223b733a33323a226630376161613961313734633634306635343164323062393534323435373036223b733a33323a226232333462326634616266316565366366643034383533643637646636376465223b733a33323a226434643663633738343839303633323238303864366231623032613139636465223b733a33323a223132656362383230613434656634663835333064346436373231633032623730223b733a33323a223334393936333830333163346462656464636166376161346132633230316665223b733a33323a226462333431306364623837613465646532396161383165663634303532653139223b733a33323a226562663264386366346139356438646664303831623534623838623135313336223b733a33323a223330663163343438356232636134373366376462636463333335333734623264223b733a33323a223266393563343431643064613434613762663532393137313236666564623338223b733a33323a223232653133396233323763616264386439323361653138383963653463386162223b733a33323a226537313934653362653364613434393332663233363636306264643738643166223b733a33323a223864626236346265636438376361663833333339633466663839376331623661223b733a33323a223661316535323032343564313132366136346663613463616637663538396631223b733a33323a226633376138363631306338656564653432666432353663646538366233623334223b733a33323a223764633939343433383337356233306163626265643436343131393762633139223b733a33323a223836323033343163373763323831616533626432396536353361373936626264223b733a33323a226431356535343232653061386533336437623963393536303966323138633365223b733a33323a226262616239343462303132656537626464343365353039616236663663636361223b733a33323a223137376662616639653633653738336637393966326338393136363666383863223b733a33323a223165363833336638646164666634383966363735636234666335643835623832223b733a33323a223266386634323162343039313261376330313437626537343165316336353263223b733a33323a223531373266353336626530613435393331633566316331643733333366303561223b733a33323a223233383563386438643733346235633638313630623735633365623938623265223b733a33323a223039623231646336343866383839623635626334656562326135646364323838223b733a33323a226133626261353861663236653533663039316638383531396462636139666661223b733a33323a226437353235366339653033326232386262373136346233663961656336646565223b733a33323a223337396365386237316161323836343933646630613036356537346438633563223b733a33323a223566393636663430323534666266626365343062383236306537323835303531223b733a33323a226532323638646532326637666161653739393564336566366538316533363731223b733a33323a223362396433356465336335623132326566633336306639633934646665623366223b733a33323a226130333863373963306139646337616634323936646432393435613135306134223b733a33323a223833396364373561646532623262313633643533346235663636643236353430223b733a33323a226165336336333162663437326662623633393865383239623636646661613236223b733a33323a223765393263376166396133666635666233623735646237303735343261303635223b733a33323a223633316363363832386464373233663761323032333064636165386666643630223b733a33323a226331326535363232636264666366626431643134303332303761323838313063223b733a33323a226430313033646537353536666466643237303761656661666537646135303065223b733a33323a223435303931313063306432326539646465353265643736383835653963356361223b733a33323a226530396438663461366137313537643864386635663065376237316164623262223b733a33323a223233613739356261316465626538386139643262306439333538356537613761223b733a33323a223665353065343065626263303034633630386335393730313130666239386664223b733a33323a223933323463616631643433313762323965613733613532623631303032343038223b733a33323a223061303432346366326337633063666533333764333836323635653439643464223b733a33323a226639366532306365343832363632636534326536663538656436343064626530223b733a33323a226437313834363030303939373961623931333334333636343834393463343939223b733a33323a223934663763373165316232383962633562386361396235363364636431656433223b733a33323a226432356133663331363561356162336463626238376138643163393530316538223b733a33323a223863613931633237333062613566343161653163633265353137643930353663223b733a33323a223635616231353234383865643565653538363337363033623130656464346135223b733a33323a226663633839366564376564626566363439643739613266623639353061373932223b733a33323a226265336565353430663961326236353563396362333936363533336238633662223b733a33323a226232336439386136373637356363663766393338653038613464636139646564223b733a33323a223131336330353235383834323237383336373964643938626531393739343336223b733a33323a223765653534313266643761646563636431383034646161373531313839636263223b733a33323a223535623561346435653031356334666338366638353261636563643637363961223b733a33323a223830303933326139356365623639666462323062346264616565363166393034223b733a33323a223734356365326231376365646236313365636532623237656234323861363134223b733a33323a223063636265633939316636313539626535663765336132323933353139633564223b733a33323a223333326535663465373836376639623839323037373038623539326330653632223b733a33323a226338366634353833313162393536643565633261353962343264363336643938223b733a33323a223531363733643630653362333062353635326361663866653137626634346431223b733a33323a223735656266353961626565366566626661383635663638633237653365373735223b733a33323a223333616337353131353535623164393961646434613561303930653966616263223b733a33323a223861376133643331643134353632366335373061396431343063376462396362223b733a33323a223763663630623532323864636430643362663062636132626136623866343336223b733a33323a226337303164396533623562616334663564313161393933356431346334343539223b733a33323a223464396336353138383335373266623765343365333636363135663663303638223b733a33323a223765643366383936396466656536643065373133373265343432313564316330223b733a33323a223933353963653064366561323766616433346236353134616361383961363163223b733a33323a226233656433353532666262643036363131623861653633313462613136356138223b733a33323a226462656635616139653962303836313064623137646433363036646334643134223b733a33323a226130313233326262366632376264626335303331636539353066643861306364223b733a33323a223230666563653161303165376337323435383637346466373734653665643330223b733a33323a226632396466333961653561323866626439623434623635336663383363643131223b733a33323a226531333233323364646633313261613738386263346137313164386335313333223b733a33323a226338623936373036656538643630336238386462616366326338343431306365223b733a33323a226535636266336462343936346137363834386666323538366330393664323466223b733a33323a223734626531353432363163616533643637633231363536386564396137653037223b733a33323a223636633464666331303830383032343362373436633166306338356361313637223b733a33323a223534326164623737623064306432396631303934353366626665663538383561223b733a33323a223539373930643734373635366161646631333331633538346635643335383262223b733a33323a223037323562363635313030353666363132356462303838636263666464346535223b733a33323a223237613161386337613062396466363733366632663663623661346236333234223b733a33323a223234643035666562393465363738343339343662386532356534373961373836223b733a33323a223162366533303562376134393962346162356237343466333537333739633637223b733a33323a223662383762323062623434616561316336376538313136353434613865303130223b733a33323a223961373536343936613066666234376136623966663237383237333432646232223b733a33323a226330636236383937383063663734643731663339386330376532333261626331223b733a33323a226162376239633335373136663361353035343539333166363138333331616661223b733a33323a223838306462623863326263353734343639303861396232616166623434323563223b733a33323a226338316332613565633931343332343936346234313933633335373236343139223b733a33323a226666666139636530343733333165393763363537353863303238363664353239223b733a33323a223937363436353039326330616438633862393563656265363639366561326436223b733a33323a226561653937333232316634393862653136666139396464626335376263376634223b733a33323a226434653139653833633133313062363432643639393838356632363938623664223b733a33323a223733653731626161353534656237353062623664613661316232643466613035223b733a33323a226438353331303864633965383536643534343438393239353033623366393733223b733a33323a223963613762656665623036383730376266313630333665356161333330386465223b733a33323a223637636362333234343335613166663035616637346361633734646164366362223b733a33323a223539666562333763616365323439626164373265373433306632333832376666223b733a33323a226232623633663565666532623335646537646634633833383030323566666663223b733a33323a223961393363343133386463383639353534653335366665313865626263363861223b733a33323a223964643166643733633033353038656137373039306533653165656130353765223b733a33323a226232353734613034376434313963626537646334303638346636346462666466223b733a33323a226131303762633765343232346332366563316433643534643938386333313061223b733a33323a223236653561656136663436623161303136373464393137323530613265613536223b7d733a343a2268617368223b733a36353a2232366535616561366634366231613031363734643931373235306132656135362d6131303762633765343232346332366563316433643534643938386333313061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a31323935333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3135383a7b733a33323a226238646237326630323864356665336262633737376537356437313830363035223b733a33323a226665363739613230623963303231373933663533663730653439363064626239223b733a33323a223463616633646563666361393630666639346539643334656533393731313433223b733a33323a223630383362653232356635313936363336353366633065653764346366366238223b733a33323a223564373764656233663333366130333161643939636431636566353232336130223b733a33323a223433316537613234316265393565323936643536646331323437336237626134223b733a33323a226239643364613231343963373137393234643165623966646135363665386633223b733a33323a223163323934343762393135333263663665376563336463373631353930336238223b733a33323a223330396138333666636235353666623662306634353735663136393937353363223b733a33323a223766323439343563623465623636363734383330303534656538383536363932223b733a33323a226432306433616462623337306431663466373761663439643531343533373835223b733a33323a226638326664626638393931636262326638323739303633613039373333313237223b733a33323a223662386464393235346665396437323163633564313064393264376264633835223b733a33323a226432333637633634656266363161383564343139336530626462303537346436223b733a33323a223262623366646531356664356233333231656361643432336631386463623634223b733a33323a226238343065396330366239666463306466393461613164336436353134363135223b733a33323a223134363739623939323734613135663538306634303138373366643834626461223b733a33323a226666393663646639623363336437613836316632363962306337633032313938223b733a33323a223936346137653238623262663235323431386236633566653164636662623133223b733a33323a223831633664396636363938633464393062366663646562303764323238383761223b733a33323a223766636562393664303631633464353565646535333939393339306365306463223b733a33323a226566303032393535343638366235366630366366306336663861346535643430223b733a33323a223263346231316230313131396434373561393434646536643438306464386139223b733a33323a226135303763326662623665393734653066353538623861346664326432626632223b733a33323a226134643937353334336334313639303836343431393638353435383134323638223b733a33323a223037373862363664383366323338663231666134393536376364383330316366223b733a33323a226235643866316534626662373563373835396438646238303138336438386336223b733a33323a223931646635656366393166313266373561396263393838396533633436613266223b733a33323a223664383862636563656431353563653032633366373361623436643930373234223b733a33323a223932373330633134396336336632333030383339313964343435316361366462223b733a33323a226365356538653132346665333234333136346636306463653836333137616434223b733a33323a223636663434383835626336303164366533653536336164333330393666343065223b733a33323a223635616565386135336339336434306237313932623766326566323865613334223b733a33323a223432366633373431653231613763393031373762636265333734366331663030223b733a33323a223132323766383666373738633064663733636661366466613535316666653132223b733a33323a223731666431396136663330313234643966333633313737343466396639393763223b733a33323a223065313765376134616437343935623831393664626532656339636635373233223b733a33323a226337613761366562643031326637316135656130353536376263313334323461223b733a33323a226338663963663963303532326663633030346232353762373133666266643334223b733a33323a223664373966333137313630396565303330633861616232666564613433346631223b733a33323a223032613933623430386439643430323763633465313638623761373534393439223b733a33323a226332396137313938376634656438303939306264666531616464323134353730223b733a33323a223731326339366438373336363163333161303936353531646239343333666437223b733a33323a226361623037323637646436323132663836613931323663643437306330643430223b733a33323a226634363234656664396631366265613032663261363963303263356533366636223b733a33323a226365663263313864343933396539666262623736636364623333373164653933223b733a33323a223362386532343137336539616238613162333164343939623336636662343865223b733a33323a223834336430336438333234353234366332613538643939346161356336633334223b733a33323a223036643535613832396661663331643561383639306433363638393935323962223b733a33323a223863653430626131666334303364346461616630623738613935663237623266223b733a33323a226161396263343830333532323537633566333830613164646461366663333839223b733a33323a226439343039663135616139633039326436643962356435636435323630376465223b733a33323a226466623338636263646437623732323736336663633836383563303535313266223b733a33323a223536643735346361343932343062363537373437636232363036306362363736223b733a33323a226535643632623034343662643435346137363733343061383264653831306533223b733a33323a223439373139373631363565303262383734356337383761303263376463653264223b733a33323a223737323433663962333538393536616132653936656330343464613732383265223b733a33323a226335316330663634626461346233386634353033663265313666363864646466223b733a33323a223463623738383863323563343030313361626561633761306466663661383064223b733a33323a223263616664323564343263643164313464643533613735346337396130393062223b733a33323a223665376335633838626537353139363935333930653036333861646334643434223b733a33323a223864323365323136616466373236393836396262306632303866373738663463223b733a33323a223030376463363961396336656238346263623664656534613664303736323031223b733a33323a223632343136346139663837646261333639396135386462393363313062303532223b733a33323a223536666538623639616634333237646161356361616463663761303830316332223b733a33323a223433343161346336633961656539653236393930383033333339663261366161223b733a33323a226435656436316333313534616561613062643261353632306331643135666136223b733a33323a223164613866353133613665636130623565376538353366343137323035393132223b733a33323a223363623064363133373730303661633831656231323139326163633263373364223b733a33323a223730643763363639366638663933323132383336623062623533376233633734223b733a33323a223139373761623861393361656531663163366439636461376264333130656565223b733a33323a223537313835643830613537373532313763373937306132643566383665353235223b733a33323a223336623961383335373436643461303864363634623135663632336139386565223b733a33323a223235383863633439633534616163313062636531633861396334366135666134223b733a33323a223133306230393035643761383732333962326136393030353861393836623937223b733a33323a223265666638386262333632616239383733353839613632663934313866393735223b733a33323a223737376163333463303263653466303835386337313137333139313331303330223b733a33323a223633353364653735393561653630623230616635663530653065396633303834223b733a33323a223266643762303761653439303932613336323736383136366636663838326439223b733a33323a226166363736616234623365353233633962363330326538623638346530393735223b733a33323a226432363133666634336561336662343631373632316563303964646631336639223b733a33323a223265656663643361313731386264663937383534353339313764616231396366223b733a33323a223039363132393938626537336338316232366564613533653135393330366632223b733a33323a226638393266636361343334643533626364623565623837313761393966303639223b733a33323a226130323362393731646364343861303436643935633762656237383762356530223b733a33323a223337333635306165393738653930343661623937303964393134373234653161223b733a33323a223666613237613663366235306235326662303734396665363736336136323965223b733a33323a223831363963396165303932316333353561663232393539623530616165383039223b733a33323a223166343132303964333330653530396633383031366434666634343935666363223b733a33323a223864626465323936333038313263663937303132353832313536653361303665223b733a33323a226331653264396130363835623537346233643961376431313435343635343331223b733a33323a223031336633656463346330323731633637313234653936343230323331393333223b733a33323a226165616437643439303634343231343861366635376431353536653838643836223b733a33323a223639613066326130636236646463333339386530623337616333363135373239223b733a33323a226431363461623937393637366666633837343232383863366530323935636165223b733a33323a226635643732366638346361623430613563383739303334383462373566383964223b733a33323a226131333664323030666265333733383232313734633130333064646232636437223b733a33323a226330663466396139613336393265633962326530653538396339363132613666223b733a33323a223433326266366230313662646132653761343632393966633934363733333638223b733a33323a223637313666333131643263323835363566613731396231303538316561393466223b733a33323a223238326466666663663834633039333737346666633039323034613835356362223b733a33323a226166336462323735373935366462333837643164393564363335356539646264223b733a33323a223634336334303633303730643634663436383936316539613862303530306231223b733a33323a223262363362343638373735663563383862613730366562353432333936373137223b733a33323a223831373564616333636633343938636662396630323164333530313162366264223b733a33323a223932653566633134356465343438383337373933333033643635356436383338223b733a33323a226464326437356363376162313566363636383561616135306165303136353830223b733a33323a226630623765366636393832616633366162346337633438396433656430353661223b733a33323a223862376266656438386165376436333535376139313166393435353938653366223b733a33323a226338336661353361353430393536663965383237363339653265643562353166223b733a33323a226137366631653035646230303338643235313961333563393131653565306463223b733a33323a223738646365306362383336656134376362636264303266363962306631396430223b733a33323a223131313934346466313938333037656465316138646131383836353230363335223b733a33323a223338303666323164333436613637616235613765623265646332316334393837223b733a33323a223037366238353564366234613861326337306437303835623639663265383833223b733a33323a223263376239313934306533303535626231616231653538666262613561333862223b733a33323a223862393431393362386462656462346234343264616636326437386139316338223b733a33323a226566346139666664356135333933633737386235376132633836643530373431223b733a33323a226231613064396461356364663837653037323261623764356666313262623531223b733a33323a223364366265386238656336343532376138336433623634383132376534613466223b733a33323a223234663434323962663438313136373631613964313066326561616131323537223b733a33323a223932623434636332356364656337356162663032366265353863636134306439223b733a33323a223935633062373533326462636362313165383436616137313534653266633437223b733a33323a223334363233326631626435613565616333316530383939646162633565383061223b733a33323a223361373638656439666539363530626339303837613630303034376466343164223b733a33323a223164366237666438373931643261636135313233626163626237613030636138223b733a33323a223565326638393665313735613564396631383237356662346263363065333737223b733a33323a223766356434393961343233333938613030306230343464666266666662613365223b733a33323a226662336139323634343761353930383433316465646434623434633039633333223b733a33323a223365306535393532343039393466633339313530363733383436396539333262223b733a33323a226361346331386335316636303762643362373762663236393762646537303634223b733a33323a223464333362326164316162616137373364353763626464613135633134353064223b733a33323a226266346639666565363930346238343736663239613166656634303136306337223b733a33323a226536626565326466313966623364333434363833323066656263303635343535223b733a33323a226263613034306663613234303739653635323938663631386131626366663063223b733a33323a226134366562666464376139363732396533306163613961653736356532326664223b733a33323a226634636636646534656365373135316335613161363835333530306631633261223b733a33323a223665363638643238303931333766616665303866656237333363653138336363223b733a33323a226463643433303764366232636432633661306539656639313638326430303934223b733a33323a223861383739656534343938626230646161393362326132383162623265633935223b733a33323a226561643633663462656131663932636561363732663532353666383934313362223b733a33323a226661663863343037623339383133353665346164353231373163326131336263223b733a33323a223264393431383636386136366139626432386134653034353134336634303734223b733a33323a223336316334303538376238343639373638346432316265313230613135383663223b733a33323a223639626136613230333666356436666438373138623231383064373731326432223b733a33323a223266623061616266363230363065353836393166633365306635336235633465223b733a33323a223166396163366661636264353536326531346264633564636133363761376163223b733a33323a223537376531616431633765343934616332386132393636323366616262373932223b733a33323a226634373336393238376565333336663033396239396362303334383963356437223b733a33323a223466623863333938363066656334313931343539356539386661343130386433223b733a33323a223664326637383164613639356338373332373966643566323939336334346263223b733a33323a223764326165356165356332323664313237306239656561343033643935353463223b733a33323a226366623362623465656531353762663535343864393234633664396437316339223b733a33323a223432383139313764356235383134656364396539353634626365643734363061223b733a33323a226237353933643865666532323264363764373132643839613836336264316534223b733a33323a223664313466323536666362346563396134306635653230323433666136626437223b733a33323a226666336136316131343666376664646130373936623533643164613738363261223b733a33323a223038386564373438363933316439363566356437393831636638663734336136223b733a33323a223631306433376535653532636238353136383461356138353539336236333033223b733a33323a226366313035626432333135616335303733336666323064386462303963656439223b733a33323a223332326562666334326537383631636261373231616238613036666566373434223b733a33323a223130386634363363663432313564623462623963376663363535626630396464223b733a33323a226431386430306238626430373963626434306265306164326339353232373362223b733a33323a223761663863393963616333346137343831653233633230386338393230346330223b733a33323a223332653139373535616537316263306261653635376232653535396631386437223b733a33323a226439643236656639336465616463343766623462363863346363643666343332223b733a33323a226466656561336264633036323936393137656130363532626635666333663231223b733a33323a226562326165306130653337373236386533646132336432653835656562366636223b733a33323a226466323333383034623062383533353036393064323964356562666534653334223b733a33323a226361323938653063393635613430653136656230386437633130316664313335223b733a33323a223862353565396533313432343262336562343362646666666465333966663866223b733a33323a226165383438633530373364386136633666643933323863333331393339386633223b733a33323a223666616163396663326633663631366165626531346161396136653034366238223b733a33323a223664653838363536313332376534643636396464363339313164363935623032223b733a33323a223036653131323831663230306636326661386537396631383764666232313232223b733a33323a226365306237333439666164316137303231666136653339343032386266633837223b733a33323a223962343465616439613836666430346161303061663662343865376164636132223b733a33323a223533313261323835313039306434623433316364663536306161303635386134223b733a33323a223634333563636330643337336566643736383962636530393963643839633137223b733a33323a223337326566653062306432653633643361366136393734366661366633303864223b733a33323a223437316662323531653435303161346537333064343265323966316632353065223b733a33323a226164306662636664386664353365633832663238373363396439383936396634223b733a33323a223333643064656264383132663134353532333438383361383162666136613764223b733a33323a223230356666633264626430306162646133313066376236363133363236633739223b733a33323a223363303963663735656263656236333533383636383030393736346163666230223b733a33323a223964306132366430616461616331663662613034313531653637656436326533223b733a33323a223630353438306138633237323830363331376264343734386231366161376630223b733a33323a223265646139333135346634653037373933643961616266643763353431643564223b733a33323a223862393932653034333363663765643939393662333737363637376665376331223b733a33323a226538306463623534656636326239333937373562323338386566366437633337223b733a33323a223564633735303237646336643034626130333764383732616161613233626335223b733a33323a223162616437643134346430333465653333636336306633353230656533343532223b733a33323a223964343933383263613632646631303133353162653430393265366364643262223b733a33323a226237646631393066393937346339643333393961333135383463346130303462223b733a33323a226434323331663835326638396565653335303032623435616466346462633763223b733a33323a223937623234616665383465623264363134336136323463386465613633306139223b733a33323a223633326466633831666566386431363934333739653337653037303063656239223b733a33323a223336326164343033343431396433336334333430613761376537326661656163223b733a33323a226438386561333339613765663639666337383566336336316134643437383134223b733a33323a223238346630376336663938326461666437303163396161326635636631326238223b733a33323a223338646636353331363334386163633631623361393330383836326130633965223b733a33323a226562653666643536663033343631653238643163323337393433306161613731223b733a33323a223838626330306237306239336232383738313830316663623965636236356531223b733a33323a223931653964366263643665383264663862363363326231646333323730623461223b733a33323a226430303930306638326338313962383666643864316432336237393464623863223b733a33323a226631633932643539313938303234346632376165386437653962353561666239223b733a33323a223763616161653461366435343466366264376162326233336235623738633835223b733a33323a223531663964306333383836396639353763396435633763613431646236323166223b733a33323a223635393463633937386539656335336633643935373132666534386465343566223b733a33323a223439346536353537623436306637656632653233656435663061326164643765223b733a33323a223063643636343532393339653637663131636362346439666130373566336230223b733a33323a226638363732633662643434313930376439353837353163396230323761616336223b733a33323a223861396535333631303366633531313631643339613562643437343661363034223b733a33323a223266373063323366656662643765396230366137336631626666386162613832223b733a33323a223864346366373237663434356265386439356536633130616536306139356238223b733a33323a223764386462626330666364313461333231343734623631306637646539363030223b733a33323a223032636261663039356262636532656439626161613464353730353635656430223b733a33323a226662336437303630313930336133616233326439613261653835313934303862223b733a33323a223362373934343336636537616563396565356435316265383961396537653233223b733a33323a223433333861653761363330333462656231646264333565613861623563633163223b733a33323a223965333238326633383066323434363564656335306433643432386539636464223b733a33323a226432613337616333646265346430633038356465376637373264373238373862223b733a33323a226363356134336366306234653530646533643939376563633766376462666162223b733a33323a226663333761303636653137336534656535386664356161663730333235323638223b733a33323a223434363164393930643532396661653261613930396632313237376366363931223b733a33323a226338373965333439313165303434656331623263323330633336623763336631223b733a33323a226464636465323834633039356664343032343237303732373965663736343362223b733a33323a226231653265373533303334663833653731373539343630623132623434613164223b733a33323a223537656230343931626462386136646464656330303430303337353532373436223b733a33323a223332393736663931383938623832613264313765663665653062366562313834223b733a33323a226336646665393532343464316439616336363066636230626632373962333730223b733a33323a223934346565333332633034353666356537333564633264333030316431396163223b733a33323a223733376336653237393534393935313037303731316161643639323138643830223b733a33323a223435643965386363323936646330323932383930343863656462393137353834223b733a33323a223761326163323530313839643563313730643961363330373063616434366439223b733a33323a226361313663396533613036616238623465343563346135353433626163333636223b733a33323a226333633131383262386262656239666137383262383734396437323831353034223b733a33323a226134653132323965646566333331663136316564386338643564646362633839223b733a33323a226136666561663130366166646330363838366562306334373161363766306539223b733a33323a223166363533633534336266336430356464386661396436313765636363336639223b733a33323a223565393765336239643361393261366231383239336162616163396664363734223b733a33323a223932643432356530376138646262386434346639616365363331626130633236223b733a33323a226536623561386664333931623261646633353637636461666432646532646262223b733a33323a223236366663396435323435363366343836646533373136393138356131356363223b733a33323a226431633430306636663835636261393531303837663337326632396335656439223b733a33323a223565613434393632613238636539663334313132646164303837363330376266223b733a33323a226265663135303439666434633138386535333734653261386235373738306630223b733a33323a226366653130656666313837613866666166353363643364386333613432323264223b733a33323a223432346637393738366239613631303131646134613836363830336237393230223b733a33323a226262366665346439343466303536636539376130663632623561333935643464223b733a33323a226534373763656662633330653661656466636463366463633531343137323461223b733a33323a223937366338323030353032666234393034613839386235623335313738656135223b733a33323a226538623532343836353637343137613964616530333138396262393366393836223b733a33323a223663393130623932383134376361646130343138356263643364626136376633223b733a33323a223131383666306661363639633830336465363235313238623539343932313237223b733a33323a223564336337303035633933616338633061653432313031663730663838646639223b733a33323a226533326264336432343061623665623735323961383462363362356562623331223b733a33323a223735363331356535633464366130636233333133313431643837316633356132223b733a33323a223064653463613363396339633361356363653764303066313238393737303362223b733a33323a226233663735356339356366636564313639633563633431663337633739363134223b733a33323a226665306232356639626137396335393133643933653539376562356234613234223b733a33323a226365623165396236643563353536623339303864373336333934383230363833223b733a33323a223563346538346432666564336163623437623333376264363066656137396235223b733a33323a226539386135633135663332386339623062623163383961613165366439313831223b733a33323a223230303432643164356530373265663733633937376533386434373535623937223b733a33323a226230393438386234386530353637366438393438623265366633663161633739223b733a33323a223738313365393138393164646662366137663535623639656638636566313036223b733a33323a226237343538346531336366313034633666313563656665653263663966303366223b733a33323a223261633437343363366161633665313534636466613933666637363835333336223b733a33323a226630356561633861333132353130386564346136306363326361353964363834223b733a33323a223632303839353864303033633530656465656136623666613032353338353934223b733a33323a226337343665613230336331623661306533313935383234333435346139343038223b733a33323a223936646463653466326333626230313933306664653866306462313864386663223b733a33323a226630336431656435623066306533663565366462303362653230353761356438223b733a33323a226636623262366232366261383836346634343430393564353266303332653264223b733a33323a223435396562653461363332373032383163386532653430663632326164623435223b733a33323a226437623235306565356336343236656466646431343063393733303466313466223b733a33323a223431653036393964323536663663393939333335353363656132336163373966223b733a33323a226661656434653232376639643931393639373935396636303663663334386465223b733a33323a226533333234383134623366353761623632373662366433626137643564653637223b733a33323a223166356637383363363532326435653362613862613437306262663763303264223b733a33323a226334356363323638323634663563336333646538323739396566343364623166223b733a33323a223361613065393236393330613134373331336466666635323134396138356265223b733a33323a226666636631633835623038333565346665306465363764303835313561613265223b733a33323a226532626232663265366631356336343533366265643533613339623662323833223b733a33323a223439643233336166623166663530383232626432633566376463303663353734223b733a33323a226234333964326663663135653430626165386161376530626238663166656338223b733a33323a226265373163336161363761356236323062356538666435653235336365323962223b733a33323a226339616139323765616533663737666539613737613331333331323530373863223b733a33323a223865333133633634636534396233653339323536323734303631646239643737223b733a33323a223334376438643731363633356230303666343937313865666438663066653861223b733a33323a223565373430363235313433663338626532333639333564356133653431336563223b733a33323a226366663963376332663364383531616366636136383939373737633766366339223b733a33323a223333653262303931363166383066373461356536353133353832313836643237223b733a33323a226431333533663638333437633338326336346166663462306133343037366163223b733a33323a226533616633336436623632323136343931613332343937323431333161663365223b733a33323a223130663039313433383465333033323461643165626262376130353936643537223b733a33323a223366633238356635313831393161373332303363393362646330623038363733223b733a33323a223235633138653565313534363335396137653564393035363065303037373535223b733a33323a226238633734323436366430616334373935343664366334326435353361313037223b733a33323a223733656138313435663531313536366464633434386439353139633635313038223b733a33323a223366366339353334623834306537303661636139373761303632656433336134223b733a33323a226166326539343062356131666364313937316563313437393163353036363865223b733a33323a223136626631303639633263386532343139333764373663653537613633656164223b733a33323a223439643739396139663435383564313336376262616564623239663530373835223b733a33323a226462383637303439313133333330376662636333653535633736373965653531223b733a33323a223064656630633437346439343364396461663666623562316137663731373861223b733a33323a223666613665316266613037643537306364623739343737653730333537616138223b733a33323a223361313863346238386666333166343531373465313535373232366465376538223b733a33323a223864666335643163356265646134366434336563643831356261326263393233223b733a33323a223130343133343135623031646361363239336639623435343164356261323865223b733a33323a223661623339616537653036326666373430336361363432373931633539376262223b733a33323a223263343939383231373235343039616562616432623963636566373663373138223b733a33323a226262316634303761613535663432353863616363363736333566383563633336223b733a33323a226632646563303639623365353133666233613830346162643439346562363337223b733a33323a226138656339303764666663653332663664613332303330633032303063663466223b7d733a343a2268617368223b733a36353a2261386563393037646666636533326636646133323033306330323030636634662d6632646563303639623365353133666233613830346162643439346562363337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496969665365727665725f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3535313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226266636436646437653739396139323730643438333865616339343936633562223b733a33323a223562633631376564623762363438393361393762343932396231353365663839223b733a33323a223564383637646565363334326633643430306235353961353930653437653733223b733a33323a223165393961313832663338366461623764393065336330303037623132353565223b733a33323a223135333338623763343730353439336430373861343266343239373637613464223b733a33323a223966326432646438393633663539646532646430393063303566333838393830223b7d733a343a2268617368223b733a36353a2239663264326464383936336635396465326464303930633035663338383938302d3135333338623763343730353439336430373861343266343239373637613464223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f436c65616e55726c5f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223230373166656365386566326565663435626334353639323338666635663163223b733a33323a223164663866363138653664313264366232623230653538343566653138313062223b7d733a343a2268617368223b733a36353a2231646638663631386536643132643662326232306535383435666531383130622d3230373166656365386566326565663435626334353639323338666635663163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223963393666326335613138393164663663346462623562336236303231383962223b733a33323a223161646637666335343137326137343733663639663562373166303464636465223b733a33323a226561396434653465633366393135623266366536333461393531613337396534223b733a33323a223739626132333962643332323063323233623964656334663061376337356563223b7d733a343a2268617368223b733a36353a2237396261323339626433323230633232336239646563346630613763373565632d6561396434653465633366393135623266366536333461393531613337396534223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496d6167655365727665725f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3633313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223463363231323961353335333465386163633961613463363663393563643136223b733a33323a226336366133626461336362393664613830333931366161346364323466643963223b733a33323a223665366466613130393533613038356662653939336530326337623066313037223b733a33323a223833663061666434363162636631323139636436663463356564343139353233223b733a33323a223933663534376431626566306535356561313933386334643339653730316436223b733a33323a223863633664323064343636393564343632383830666366633330316433616230223b733a33323a226462353934383231346230633164393166623361376336356332646665656666223b733a33323a223365313565653530326336303236376233383563353963363638393263623865223b7d733a343a2268617368223b733a36353a2233653135656535303263363032363762333835633539633636383932636238652d6462353934383231346230633164393166623361376336356332646665656666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3731313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223735356533333965633330666366333632303637396534383235663764303765223b733a33323a223964653135646166316265666434366432663233623239633132303464353132223b733a33323a223139336431363161613562653833313130653534373262623663323061393439223b733a33323a223237306564656632313837386334656637386263636538316366663664623562223b733a33323a226664373061653132613665346431623739386537633738303464656466613731223b733a33323a226164663434356534363466653166323636636535646361636663356136663339223b733a33323a223632316533306331613332313538643962646135633432323063386465636638223b733a33323a223839323564653264623866376662366638653037373430616535636333633135223b733a33323a226433643937663135316138643562633836653134336263633230636134633934223b733a33323a223637636361396131616662366232636465633230666436353962356162643039223b7d733a343a2268617368223b733a36353a2236376363613961316166623662326364656332306664363539623561626430392d6433643937663135316138643562633836653134336263633230636134633934223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605226845);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('7429677aba32b09c764b183b58764f6f', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353839373039312e3731353630353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a226466313939646636636339303633663237316365353137333061303962363833223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353838383635373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353930303636373b7d733a35383a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f436c65616e55726c5f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353930303539393b7d733a36303a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496969665365727665725f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353930303636393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353930303630363b7d733a36313a224c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496d6167655365727665725f636f6e6669677572655f63737266223b613a313a7b733a363a22455850495245223b693a313630353930303439383b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226364383161363764346639353939626661316163653764613061646238336433223b733a33323a223436326262623066393265613130383831616161336366623434353038346636223b7d733a343a2268617368223b733a36353a2234363262626230663932656131303838316161613363666234343530383466362d6364383161363764346639353939626661316163653764613061646238336433223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a393539333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3131363a7b733a33323a223065336535326536333031353561313035623531303239666461623861393730223b733a33323a223733316632663335393835653162333061623635393230386163343537653634223b733a33323a226130643030333232623166366131353233613662616264383035323430393364223b733a33323a223034356331393863626539623639613430613735326665313035636264343031223b733a33323a226165633530396437313063646139386336323737316534663533353763653464223b733a33323a223961313933666236306566383333333030613633363431323033373763393765223b733a33323a226137636139336435393336656164333762636165656461333639303066366461223b733a33323a223964306432366232396136386563346564663237346466313165386430373332223b733a33323a223130383237643362373761656237346335616338653536386663646266646331223b733a33323a223038376465643363346461313462656664396134626437333130313831333966223b733a33323a223233303537373836316639386131356462353636376135376563616439613736223b733a33323a226230353130303938366233643064306561396238663132343836323032656631223b733a33323a223637323366343338353036623239396365313766343639636138316430393933223b733a33323a226135376235666135633966653632656637343162306635666266353365356161223b733a33323a226165383438313233356339373864656164373132383037326639643665616161223b733a33323a223234356635626639633261643438326365613661653030323666383363643262223b733a33323a223931396634346332653761366437636461633632303032383363643561646261223b733a33323a223866626133613535613662353133643832623736666666323439633136636133223b733a33323a223263653138323162613333393430343435613161326662343366613835366464223b733a33323a223332646537346636336130306137643463316261326662336466646261616566223b733a33323a223333326535326361353466643930303935626335313261336363376661613935223b733a33323a223537613863323433626431316539616666376264353535656431373437376263223b733a33323a223436643139303862333664356263343431613535643035336636363130333636223b733a33323a223139633164323061373031633031633535646233663133306562356137663966223b733a33323a226462343137363262633232636531353534626434616137303537326666363163223b733a33323a223562373961393465316666386436623930323766386637313532633639343066223b733a33323a226133326163653631663236623335363438396233313930636439636666316431223b733a33323a226562346535653632346261616665656364393163346336376238353232393237223b733a33323a226130316263643035383532323630383034666661363737333937366438616238223b733a33323a226633373363623337343261323731626365656530663764343266346666326438223b733a33323a223466306531613964636130646564376230313061316437336331336131356137223b733a33323a226661386561373834356136613061306466653930343235363839386239346663223b733a33323a223734356336313032343834633831303262353661663265396633343530626330223b733a33323a223136323937356331343430303938633236643131653239323936343635356533223b733a33323a223939333430633665626534653437313862383736353638666339353630306165223b733a33323a226464373538356632633235383837343464396434643066613662646634656437223b733a33323a223037623335663238313863646265313530666362323130363838366634626433223b733a33323a223331353737643562376334396264613664346333633234306334373437643839223b733a33323a226662356365633339633734646366373966386662613665623230626664616234223b733a33323a223332306662373966323661303435333932366131343234373731623664393734223b733a33323a226535646237323465353764383030343139363734353935633262323336636665223b733a33323a223832323061653239346463363332386438353939666565616237663335623333223b733a33323a223431346166646662353237646335316264663361383463623461656466663737223b733a33323a223234316161306334633737373061656232663836313931363434643665396165223b733a33323a223630646235336163343833333333363233313431396134616163346530323466223b733a33323a223861376566363035363235643837666239323634303639376531623839626265223b733a33323a223036613530393534663264383735336438376530613339323537326265626362223b733a33323a226564303438326436626638366537633066333465323738636137386233613837223b733a33323a223535326161353638656630303930356563316266323465613765613933656330223b733a33323a223062636231363762623538373662633237313366373164646466383038373139223b733a33323a223434386233336532663731646533313730663563356361656237393263653131223b733a33323a223433653830623763653539393364393266613034653830666637346166386463223b733a33323a223665346365393966323361303238363865353137663632353236356534336663223b733a33323a223033376562366430653730343239633562663231343564373737343130313065223b733a33323a226339313164346664616666623739356131653335623061383930326530653532223b733a33323a223639376634343134653433353462326235616663663561643964353832326666223b733a33323a223739653932316238636430363535383963396531346332316230633663373462223b733a33323a226161376330353136316335326337633332383635643062396363396534376239223b733a33323a223966303932306339366635386530643931303434303731333163346262306431223b733a33323a223532383734303537616534366165353639313265316335313530383939636430223b733a33323a223465353230396636623663313165663938346166656164306136313261386662223b733a33323a226136366137306664346539636465653864663866313437636131613834386337223b733a33323a226130623165616362343465336566626361636665363630373763383933306331223b733a33323a223430646537393561633635616564636432376262363061626337663035343266223b733a33323a223039653466626264626431363165346438336630323261393061626264343362223b733a33323a223532656461623732623239366437366238313137306266383934616435356638223b733a33323a226435313263373036623566376537653331396466353732326163313065373430223b733a33323a226166666463656132626637326662616165663137633837323436653662383234223b733a33323a226138393831343930616664303732316438386432363736306230393637323262223b733a33323a226466316231623238366266653463626132653739653136316339336166663434223b733a33323a223762313464363334626562623962343234363462353063663639366336313730223b733a33323a223436663130363466303933656430333737323335306134626433356535323233223b733a33323a223332393762316562363832363062613139616463376130336666376137333936223b733a33323a223862313930383330313565333137323931313937333839353631366631346332223b733a33323a223434316266643365613565643734383964643336346363313263303362636334223b733a33323a226632313262633337356439306265643739383534626430323261313536336337223b733a33323a223961393863333137633037626633626462393734313266333865326363613138223b733a33323a223038383766386232636261333234663932663934303535663230663665663236223b733a33323a223736323533646161363166353263333866323264623036656465663765323661223b733a33323a226164623939366665343430616363626161306132396332633463663834323964223b733a33323a223733316263626431643033653230323630323332616438373462356362366262223b733a33323a223065353230666233303932353031643462636463306232623333373739356431223b733a33323a226231373736646233353432363834643566393032313034613731306130666266223b733a33323a223838343637656538633166656533646639343061343162326637333361326461223b733a33323a223332653639616537306264663238346539336262333065323430633839343165223b733a33323a226264333338306261643934323533343765626339653731353535303536613862223b733a33323a223837646161316630326138336336393934383861346536663437396439383636223b733a33323a223131363934323162636435363038626536633533646133383336383132373762223b733a33323a223138336135366361363337303365326462646362313334313162373563623838223b733a33323a226663303434656565633334323764303139396265313734366638313937656333223b733a33323a226239653466383361313861336538646237616431323837653833376561346264223b733a33323a226366333334333537613361393436636632646631363838393363656330313132223b733a33323a223563393938633138653235653661636430363262346531636433313533353634223b733a33323a223639333733373039646561646139663664326632303866306333383061316266223b733a33323a223432363232323833623131363164646232326339323037363639366566303133223b733a33323a223635356131353132393962646439353862313465356436333066336232346330223b733a33323a226664323265613065666232623566386532326337313462336561663435383366223b733a33323a223635386238303535613732663931336366386339623166616431353931303266223b733a33323a223039306466616664613933623134623961303531393732303963613135393134223b733a33323a223065303133306462306466313332383263666264306532663264666530393430223b733a33323a223832383431303263663631346535316530346161333932633935613934376632223b733a33323a223333393666633534393162376438386435316364376135633063616631303562223b733a33323a223634663734396461653564323237393936313533343038363066353733633031223b733a33323a223136333036636561333237663236666634316466636134666538326130646465223b733a33323a226434626533393038363832643465303039636566646362363631623430356135223b733a33323a223765386364623837366564613166636234323834393937353062663133396435223b733a33323a223363633833646666663839383130393839393030376461623637333638636636223b733a33323a223733393563323630333361396331653265633633353637333739623730316437223b733a33323a223830343537323130643831333937646362393966643938356238393637616136223b733a33323a223664363964663330643562343234343135653134636330363163336165343665223b733a33323a223832386330353133326464363838386339353137633162346639636338323561223b733a33323a223938623136306165613764346165313364386261633132646639393264663131223b733a33323a223864623330656637383364656634613031393161353239303930633935343536223b733a33323a223861623431643265613232353339326661666331376231383239306533656665223b733a33323a226532343565623834393434636138643466323739333431663162643537643563223b733a33323a226265333232326365633531303030646330323164336666333538316366396339223b733a33323a223532386137396139316331383366333761306139636661386466313135616134223b733a33323a223866366166343134396165306430376133316264316136613961353866636264223b733a33323a223662363332656431336264343931326562663537376263613837306661356361223b733a33323a223732626339626361323061616663303230666637653366343938623630653134223b733a33323a223432666134343234636638313933616566306538633765393837613532393134223b733a33323a223464653530313037393836356230643736616438613033343066663566373632223b733a33323a226465633261666665396464303531376164383464653664633535333731663339223b733a33323a223639396465353661316363313239653136363233333236653833663232646232223b733a33323a226364633864663937616439653338643731376537366333663863376537616433223b733a33323a223434636162643236366538643434393231663762613938386666653736653662223b733a33323a226531306462386330643035383138366634383731313862376330346635633763223b733a33323a223631626535383038313738343465613536366263343930643831356339373730223b733a33323a226132373533653838343564323864626330353430346635316234373738633535223b733a33323a226232393931346231663731636437626238656362613434326439326539326562223b733a33323a223239353333616465306437663764333465616637366264376538633262343030223b733a33323a226664336437373236393438316335373333373733303430343765333932623832223b733a33323a226638623935316661633532373963336634323336656562643461366135373739223b733a33323a226238383465396536643166646432303566323966633366316331663937353836223b733a33323a223864316531336561666636646662323837643732636533376332363564616331223b733a33323a226161653930373065653531323832383561333538363436646336373033656238223b733a33323a226438663933643262386533326362656134356534333737323835643664363661223b733a33323a226364613466636133373862613664383134643061366664306634613232626666223b733a33323a226436353963336639653363373532616236646364356463613038623733626630223b733a33323a223139343937336333323335333839653038373466613837343332373138353965223b733a33323a223030333636633137633265303736333036643231613762663038373664353336223b733a33323a223137353735656634613461663466653465363932646263326338306531363332223b733a33323a223430383937376164643562393038383162633632643932653738353835323131223b733a33323a223338616261306536333130316464343864316263663333633138633366346262223b733a33323a223737393039623962386635373232353537613139313661316136356263313862223b733a33323a223462636262373130303032376164363863663836646239363034633730353461223b733a33323a223235663536383430383536313236363732636466303231666630636361313835223b733a33323a223162393432326232326263366663383965366630363737343639623966373735223b733a33323a226666356636633064313037643939663965623664346662363361343135303731223b733a33323a226430373661616539636136393132663931346537393665623361656334363138223b733a33323a226161663935653161333437393565633938336262636362363534336462336437223b733a33323a223536633065663235663936653964323831366461656132343063646430366461223b733a33323a223961313961306563306636613065633363613538623230313534663866656464223b733a33323a226661333833393336363566336539623633363161393639343636343433316137223b733a33323a226231323437363436333730623066646464313332663463323163373936303031223b733a33323a223133623234646135326231613438363264376530616639303039323034343931223b733a33323a223837353339643734306235643661666136353533373831656334353564643632223b733a33323a223835653664336338306164386332613635373837663234313336663965396164223b733a33323a223534393138346335303863396430386237346363376131353662626164636634223b733a33323a226633363030386263386632303835306233326530333766653237386638343663223b733a33323a223762323533386665616666343839376335303061666563353536653236643163223b733a33323a223465663536353364353436313965613936346430366135313232336635326630223b733a33323a223334393235626366376365616666373364646136373837636261626135323732223b733a33323a223435373037336436333764383533353761623862663265313830373061396361223b733a33323a223936366661623836383765643931663831616562636334636430336131643265223b733a33323a226432636361353136353239363566343831616165316164353165363030653532223b733a33323a226232353939383435343235336136393363646432303233636334663934653363223b733a33323a226335363933386461383938373239653566316163623533633462333263653865223b733a33323a226164366263323535356437386637333735656665626364623337306333323638223b733a33323a223336363632633861633962666435623036663933646261623963366438616231223b733a33323a223031326264306330656534313038616433363835373765353836353133656233223b733a33323a226535633265303861643437303966633137653964656232643437393561343635223b733a33323a226263666534303237663962333964336561623239633239613432626131653338223b733a33323a223462353062376562343932333035363536363336353464356266613166373432223b733a33323a223963323263383763666661666437666630333639613562383533653830313561223b733a33323a226634386163336665346261303339616466313565336530663061663132623233223b733a33323a226562353533346163643039373939373463323738633636376366373661633566223b733a33323a223237326561616330643635323433336264643134333361656466646634343432223b733a33323a223430333334333632643535326233363733343963613161363061663831353864223b733a33323a226536346434383432346465363139386565633162383535643932643764333532223b733a33323a226165626638326434356366363265653263636564636331643238313936303032223b733a33323a223032616563386639316265383935636233623639656137643137633861323838223b733a33323a223433386231333235366633373261656162356431343666623439393937623465223b733a33323a223431396265613637386236626534313835633266333230373464353862333033223b733a33323a226131643965393533643530616331373638376637333164306336303236366332223b733a33323a223162343839313738346365353237393736333265313037343434343039636535223b733a33323a226337656138363133313939346564326266333530396466316530306237646232223b733a33323a223939663236323439353830326266363565653238633839643234386262373765223b733a33323a226439633039306364363838356563383963323563376430393434363661313266223b733a33323a223138333761383931626437383462373836333163386136396463376166316564223b733a33323a223033343237396134636630643264356636313732656337383237623938306634223b733a33323a223131356434323163363261303439643365373938316663616464373036356263223b733a33323a223063326630323364613031653664306336353136343639643538326539326136223b733a33323a223461313661646637306238353039643665616337663631623062356565613166223b733a33323a223434356238326665356264303333303931346537336161373730396431623733223b733a33323a223564643461313165353931626439663833623831326333353865383935653161223b733a33323a223461303536653036626564303531396539326664353564623936333762666333223b733a33323a223462343139383462303966373638336235373730306136346134633965366539223b733a33323a223134323430396438346430393261323735306566333465626339383565633965223b733a33323a226563373834323362333031623463323363646261653362636461353634653834223b733a33323a226233303236353433336634383162633263313933333939646332363731383837223b733a33323a223339373263613161333435663066316166323932636164386561353866643463223b733a33323a223734663839353661386633313666636663323433323865656535656563616664223b733a33323a226334613133616163663734376536663932353534623834643734643162663735223b733a33323a223164363562313139393339316664373965666531326263633934313666336333223b733a33323a226566663537653938356462643834336165356434363431323363376439323331223b733a33323a226231343438653863306230306465653062333362353837333934323563346132223b733a33323a226137643632663331306333643837663261313639333364663465646631373937223b733a33323a223663663233313534646537663462336537316166383264396362626332316531223b733a33323a223233636333323135313436306134653066363239613138326165376431323964223b733a33323a226532643466633837353562346664376239373766636636383461303734663263223b733a33323a226135373130343336376330373866646336306462363962323837313131356636223b733a33323a223934643061323331646139353537633934626139653565666137653166666432223b733a33323a226664313739656337386461386532373765326161376136353531383730643338223b733a33323a226265363237623761303834643239346138303964343238616464656564383965223b733a33323a223061663930336637633530643166316536646332303531623261323933353130223b733a33323a223666663330393236663162363266663134316332613932343964633666356266223b733a33323a223338656261323734393363313462303339373638323562396666353562366234223b733a33323a223233323232306336363539336238623063323464366535326330346566666338223b733a33323a226266316136653032303537313435633138323066323164623863383961346562223b733a33323a223730376539386530323233623563323633663439663465326237383033313164223b733a33323a226539356633616639373539333037666361663264363564356366333239616532223b733a33323a226534313838376363663237356366313331323561386534393938383666393839223b733a33323a223335353132666632326231613165343863386333303131653132313238633039223b733a33323a223932373936623066616137643432386430643935656131626239623534383763223b733a33323a223035656364343061623430363465663232303061343561343039623464323665223b733a33323a223063313261333332376263646565626231373039346362386565316433326530223b733a33323a223435663239373833323163393162393939326136366266613263373162356636223b733a33323a223336323430343730316539343562383764303334343934316561363839313464223b733a33323a226135656231303265613361653232326332656531616466333965393165366530223b733a33323a226434663039623436313335663261373765653835656532376265383965353631223b733a33323a226339383763303762646462376463303438666264313061343335636263363637223b7d733a343a2268617368223b733a36353a2263393837633037626464623764633034386662643130613433356362633636372d6434663039623436313335663261373765653835656532376265383965353631223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f436c65616e55726c5f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223832353839366239376666393632353530626165396139643666633131383566223b733a33323a226431373736383532653138633237316161656333636334313339343134353165223b7d733a343a2268617368223b733a36353a2264313737363835326531386332373161616563336363343133393431343531652d3832353839366239376666393632353530626165396139643666633131383566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496969665365727665725f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226264653562663832363364353638613763633062653365386434623730623839223b733a33323a223464333931303164333661616264636166336432356261663631646562663937223b733a33323a223030356238626666613264356566633331613538636438313637626563616165223b733a33323a223637663538396335373665633033616137373936383430303434616433633231223b7d733a343a2268617368223b733a36353a2236376635383963353736656330336161373739363834303034346164336332312d3030356238626666613264356566633331613538636438313637626563616165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323535323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32383a7b733a33323a223462333661316362323661313264646561386437383463643661303865666138223b733a33323a223230363931356339326336396365353635643235623936613232633536316336223b733a33323a226564343631653561396666376566393234636235653061656363306130323161223b733a33323a223335383335663534353036653263366461313431306337613832363061653762223b733a33323a223339373832643338386631396361323564663461363564323937663764623731223b733a33323a226434303230656236653966383238363538643739336531623366613163396437223b733a33323a223162636438353533623131336334633534303163666566356136383365306165223b733a33323a226130336465313766613434303737323066666533653530613438316531313032223b733a33323a223761326631653933643162663730376237366365636534663730656364376137223b733a33323a226632376263646232373130363335363631316634316531663333623265306436223b733a33323a223730666335636665373362393765643431306332656139353133396633653966223b733a33323a223566316462383361326635656562666439623266393762633566353138356534223b733a33323a223338646466383864343438396466313162366162333061323234643835393138223b733a33323a226463643138643865633834393630383265373466643431396565346130663863223b733a33323a226633663632323535363064626432353863326335626464623764383966353034223b733a33323a223564396161623836613939393063393163313436363261656134646336336665223b733a33323a223739343939323538613837646461343964333466646437653066393766396339223b733a33323a223037383463336137303637383661343333386637613633373235393334316237223b733a33323a223135323635383562623037653937326633303462333363333734623865366130223b733a33323a223164626239383561656234393938646530366434363232326335646535626631223b733a33323a223134656266633538346230303462623732636339393661663564663335306365223b733a33323a226538316562356661366161333533666361643735653933333733306564393837223b733a33323a223864373461336566633535386634326263393835623761363365646136356232223b733a33323a223661346535383263386133313539393636626465303032623631376230353138223b733a33323a223035396133633632626162393665656531353630613038623839353637613864223b733a33323a223430383432616538323137316431663538626637666661323666643238326633223b733a33323a223465636631333464326131346265346632646633366437343962316364373164223b733a33323a223264303563616336623663353461623838343465333564376137663039303763223b733a33323a223965393732393339363464396135323533333234326232383130623863636566223b733a33323a223838653237356334656232636464363331343837303038396466323661343038223b733a33323a223033633438663765383865353536616566633631363531326164356662613966223b733a33323a223933663232626466616135616561326362343939336639633561353339656363223b733a33323a226239623761636461393035633566393464303733396234623433343939326134223b733a33323a226239616233356361373639653762333739306330646630323935636135306132223b733a33323a226436653266626665366461643839643732616230383235653965356164323661223b733a33323a223339626363633162323130363531623831323963643239316364383035656335223b733a33323a223232336236323431613138363536646664626335306666383335393733306634223b733a33323a223361353735366234336538646563346337393833343661303966343039343632223b733a33323a226138393464633535303437633337623535333663346338313066653239646263223b733a33323a223035333762376330346139346536396262316539663062313138633839356364223b733a33323a223034336662336230643964623466303363323137646434623365383565663463223b733a33323a223066636330666364376464393333333638373963356636336164613031343564223b733a33323a223035363361646364636336323234633564363732646463383262626230373335223b733a33323a226430636135356330343632623464633338393265393738316431643336656237223b733a33323a226237343961333735373434373836306461663836373532656334343766396331223b733a33323a223137336532363336633633646438323139326164343339313536313839333133223b733a33323a223866393166623063333033396431363532313038363432663566353032323733223b733a33323a226531393630336632643030663437313061343537393833666535633962306537223b733a33323a226235393738336161643636356466343432353464393363356162323566666333223b733a33323a223531363862613066343638323733656330646136383137366563366266633435223b733a33323a226364313135633034386264353830633334393832373365343830363162303765223b733a33323a226438313531353032633939363565663331666532313331643061623564383636223b733a33323a223238393434353833303462626662666431346466666561636461663133343061223b733a33323a223139643438356262346637356264313236643536376666313739396533616464223b733a33323a226436333563353764643064303033343236353463663434336663393064626630223b733a33323a223866623162663239363838613033356439663131373535346239333536346636223b7d733a343a2268617368223b733a36353a2238666231626632393638386130333564396631313735353462393335363466362d6436333563353764643064303033343236353463663434336663393064626630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6d6f64756c655f496d6167655365727665725f636f6e6669677572655f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223835343132393734373935333733306361343931353134336130613063396538223b733a33323a223637373033333136613366613730613834383039363464393539393330363034223b7d733a343a2268617368223b733a36353a2236373730333331366133666137306138343830393634643935393933303630342d3835343132393734373935333733306361343931353134336130613063396538223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605897091),
('842a1ed725a03940c77a31ed4d05f503', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313630353232393039312e34373130333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a33323a223061616462376432306231653932653839653964313538666534366232393434223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353233323631373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313630353233323638343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313630353233323637383b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226230613838633961343837373631643732333834656466633861383034356166223b733a33323a223033653161393533653532336463366466633239636435393164396362313230223b7d733a343a2268617368223b733a36353a2230336531613935336535323364633664666332396364353931643963623132302d6230613838633961343837373631643732333834656466633861383034356166223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f417574687c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a323037323a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32323a7b733a33323a226337313963373331346162646634633035646438636163333164323234366364223b733a33323a223339656262616464663563626165613861346531663630396165303461313466223b733a33323a223837323666303936343536326538393038393464633934343262623962303836223b733a33323a226534646362396532653437363461303163316335353730396331646530316634223b733a33323a223430313965623861383266643135373864663761643832306538306336383666223b733a33323a226132353137656235333834626266616330393332376666633461366232373739223b733a33323a226636323939633732376331333665386265346639623430323261656165343562223b733a33323a223431356537383633333333643264333735386463343539653365363832653435223b733a33323a223230663334646638663430636465313736303163653263373830616365353730223b733a33323a226632326265643439633935656366386261306336656633626564666665373033223b733a33323a223635383964333531343132616663363361303239343664666562643032333030223b733a33323a226633616562376165343433653163663038646235313861393530313466623662223b733a33323a226137393561653035316331636664326566373165623339373166353261306432223b733a33323a223138353863323161303235646139653164643735373865343463383132383863223b733a33323a223834336132363232393935356538353735393530343736653330626165373866223b733a33323a223031383839643032356637313231653833303938363038326636376436396234223b733a33323a223535666661636563633036316536613539616130393034653934316538646632223b733a33323a226266616566336533303262643332623566313331633631303461303533396662223b733a33323a223665353539393664376136383537613936313132636238323835393631343536223b733a33323a226630663064383034303736363735376364613237303661323862646463383436223b733a33323a223363636165386266343865323934636239346230343631336134393836333666223b733a33323a226266353434336665346230306431663363363466646534353138303234363466223b733a33323a223765666561663237363636356637356130346338643139336530653438353737223b733a33323a226361323031643664316136343131383739376638343062633534343938623938223b733a33323a223336343533636436346438636636643035383566333763636231636263643366223b733a33323a226464343366383931303564393638633432653239363765343463373137396131223b733a33323a223538363132373135653139326662643937393633363764366138616335643330223b733a33323a223931663034623730386430393463326431306664366530356362353034346364223b733a33323a223833333232333331323831336630313230643161353037363034653631666530223b733a33323a223530356163373431393566643038363363363862326139356630623361623165223b733a33323a223835623666386634393139626534616337316539663832326237363163393337223b733a33323a223936336662396631646630383433316234373532306437326563373266306331223b733a33323a223735643035616530666331373865356335613465363637313736396266636331223b733a33323a223064366663313134643364396438303231633766626432356439653031613937223b733a33323a223362636430363536613837373032343434623334333036613131626365626233223b733a33323a226239306563303537646133613533663231376236366664613531366439343534223b733a33323a223937663934623863353761343633346435613231383536333439303865313765223b733a33323a223765326230663563643935323338336562646437653535376530303837326265223b733a33323a223665343566386433343663663431363635653430346431376166613438336665223b733a33323a223064383232336662326366373762373963656666613630346439343830306536223b733a33323a226430306438393539383035633637376334666236663436623865363436343963223b733a33323a223761643531663736393136303932363237643261316663343662386261656236223b733a33323a226333396430363938633537366238363338336139363239663235613063333031223b733a33323a223864333066336137396166336439386438393462373235626363303366623861223b7d733a343a2268617368223b733a36353a2238643330663361373961663364393864383934623732356263633033666238612d6333396430363938633537366238363338336139363239663235613063333031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c433a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a3739313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223662333431343262373438383963383831666239306538623438306530636562223b733a33323a226330343031653561306232343463353336393736303932636162363966643137223b733a33323a226132633537316564346430343062653266336361393264613866313264376330223b733a33323a226161336431646336396532616366623033646239313831663262653864333966223b733a33323a226565656437343430633364646162356665613465346236653161353763663561223b733a33323a226133653066323563626436663566373461373561313333303237636664333838223b733a33323a223665303632633234653439333365636264356561633735653233336630623931223b733a33323a223263366363633263303862303631653461353838613066393036636166386230223b733a33323a223865616133333639323331653538656663636138316539633035313130373236223b733a33323a223761343262313735643166366630613937326336396534653437336431356137223b733a33323a223538323034663764613163613566366432333532306335653638396361353938223b733a33323a223133663266373464656264333739623236623266393337323365376361616663223b7d733a343a2268617368223b733a36353a2231336632663734646562643337396232366232663933373233653763616166632d3538323034663764613163613566366432333532306335653638396361353938223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1605229091);

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
('administrator_email', '\"admin@imaginerio.org\"'),
('cleanurl_admin_reserved', '[]'),
('cleanurl_admin_show_identifier', '\"1\"'),
('cleanurl_admin_use', '\"1\"'),
('cleanurl_item', '{\"default\":\"document\\/{item_identifier}\",\"short\":\"\",\"paths\":[],\"pattern\":\"[a-zA-Z0-9_-]+\",\"pattern_short\":\"\",\"property\":10,\"prefix\":\"\",\"prefix_part_of\":false,\"keep_slash\":false,\"case_sensitive\":true}'),
('cleanurl_item_set', '{\"default\":\"collection\\/{item_set_identifier}\",\"short\":\"\",\"paths\":[],\"pattern\":\"[a-zA-Z0-9_-]+\",\"pattern_short\":\"\",\"property\":10,\"prefix\":\"\",\"prefix_part_of\":false,\"keep_slash\":false,\"case_sensitive\":true}'),
('cleanurl_media', '{\"default\":\"document\\/{item_identifier}\\/{media_id}\",\"short\":\"\",\"paths\":[],\"pattern\":\"[a-zA-Z0-9_-]+\",\"pattern_short\":\"\",\"property\":10,\"prefix\":\"\",\"prefix_part_of\":false,\"keep_slash\":false,\"case_sensitive\":true}'),
('cleanurl_page_slug', '\"page\\/\"'),
('cleanurl_settings', '{\"routes\":{\"cleanurl_item_set_admin_1\":{\"resource_path\":\"collection\\/{item_set_identifier}\",\"resource_type\":\"item_sets\",\"resource_identifier\":\"item_set_identifier\",\"context\":\"admin\",\"regex\":\"\\/admin\\/collection\\/(?P<item_set_identifier>[a-zA-Z0-9_-]+)\",\"spec\":\"\\/admin\\/collection\\/%item_set_identifier%\",\"parts\":[\"item_set_identifier\"],\"route_name\":\"cleanurl_item_set_admin_1\",\"defaults\":{\"__NAMESPACE__\":\"CleanUrl\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"CleanUrlController\",\"action\":\"item-set\",\"site-slug\":null,\"forward_route_name\":\"admin\\/default\",\"forward\":{\"__NAMESPACE__\":\"Omeka\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"Omeka\\\\Controller\\\\Admin\\\\ItemSet\",\"action\":\"show\",\"id\":null,\"__CONTROLLER__\":\"item-set\",\"cleanurl_route\":\"item-set\"}},\"options\":{\"keep_slash\":false}},\"cleanurl_item_admin_2\":{\"resource_path\":\"document\\/{item_identifier}\",\"resource_type\":\"items\",\"resource_identifier\":\"item_identifier\",\"context\":\"admin\",\"regex\":\"\\/admin\\/document\\/(?P<item_identifier>[a-zA-Z0-9_-]+)\",\"spec\":\"\\/admin\\/document\\/%item_identifier%\",\"parts\":[\"item_identifier\"],\"route_name\":\"cleanurl_item_admin_2\",\"defaults\":{\"__NAMESPACE__\":\"CleanUrl\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"CleanUrlController\",\"action\":\"item\",\"site-slug\":null,\"forward_route_name\":\"admin\\/default\",\"forward\":{\"__NAMESPACE__\":\"Omeka\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"Omeka\\\\Controller\\\\Admin\\\\Item\",\"action\":\"show\",\"id\":null,\"__CONTROLLER__\":\"item\",\"cleanurl_route\":\"item\"}},\"options\":{\"keep_slash\":false},\"item_set_identifier\":null},\"cleanurl_media_admin_3\":{\"resource_path\":\"document\\/{item_identifier}\\/{media_id}\",\"resource_type\":\"media\",\"resource_identifier\":\"media_id\",\"context\":\"admin\",\"regex\":\"\\/admin\\/document\\/(?P<item_identifier>[a-zA-Z0-9_-]+)\\/(?P<media_id>\\\\d+)\",\"spec\":\"\\/admin\\/document\\/%item_identifier%\\/%media_id%\",\"parts\":[\"item_identifier\",\"media_id\"],\"route_name\":\"cleanurl_media_admin_3\",\"defaults\":{\"__NAMESPACE__\":\"CleanUrl\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"CleanUrlController\",\"action\":\"item-media\",\"site-slug\":null,\"forward_route_name\":\"admin\\/default\",\"forward\":{\"__NAMESPACE__\":\"Omeka\\\\Controller\\\\Admin\",\"__ADMIN__\":true,\"controller\":\"Omeka\\\\Controller\\\\Admin\\\\Media\",\"action\":\"show\",\"id\":null,\"__CONTROLLER__\":\"media\",\"cleanurl_route\":\"item-media\"}},\"options\":{\"keep_slash\":false},\"item_set_identifier\":null,\"item_identifier\":\"item_identifier\"}},\"route_aliases\":{\"admin\":{\"item-set\":[\"cleanurl_item_set_admin_1\"],\"item\":[\"cleanurl_item_admin_2\"],\"item-media\":[\"cleanurl_media_admin_3\"],\"media\":[\"cleanurl_media_admin_3\"],\"item-set-short\":[\"cleanurl_item_set_admin_1\"],\"item-short\":[\"cleanurl_item_admin_2\"],\"media-short\":[\"cleanurl_media_admin_3\"]}}}'),
('cleanurl_site_skip_main', '\"0\"'),
('cleanurl_site_slug', '\"s\\/\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('iiifserver_identifier_clean', '\"1\"'),
('iiifserver_identifier_prefix', '\"\"'),
('iiifserver_identifier_raw', '\"0\"'),
('iiifserver_manifest_attribution_default', '\"Hosted by imagineRio\"'),
('iiifserver_manifest_attribution_property', '\"dcterms:bibliographicCitation\"'),
('iiifserver_manifest_behavior_default', '[\"none\"]'),
('iiifserver_manifest_behavior_property', '\"\"'),
('iiifserver_manifest_canvas_label', '\"position\"'),
('iiifserver_manifest_canvas_label_property', '\"dcterms:identifier\"'),
('iiifserver_manifest_collection_properties', '[]'),
('iiifserver_manifest_default_version', '\"3\"'),
('iiifserver_manifest_description_property', '\"dcterms:description\"'),
('iiifserver_manifest_external_property', '\"dcterms:hasFormat\"'),
('iiifserver_manifest_homepage', '\"property\"'),
('iiifserver_manifest_homepage_property', '\"dcterms:source\"'),
('iiifserver_manifest_html_descriptive', '\"1\"'),
('iiifserver_manifest_item_properties', '[]'),
('iiifserver_manifest_logo_default', '\"https:\\/\\/logopond.com\\/logos\\/48689efb9786ce3ea33162ca109473b6.png\"'),
('iiifserver_manifest_media_properties', '[]'),
('iiifserver_manifest_rights', '\"property_or_url\"'),
('iiifserver_manifest_rights_property', '\"dcterms:rights\"'),
('iiifserver_manifest_rights_text', '\"\"'),
('iiifserver_manifest_rights_url', '\"https:\\/\\/rightsstatements.org\\/page\\/CNE\\/1.0\\/\"'),
('iiifserver_manifest_seealso_property', '\"dcterms:hasVersion\"'),
('iiifserver_manifest_viewing_direction_default', '\"left-to-right\"'),
('iiifserver_manifest_viewing_direction_property', '\"\"'),
('iiifserver_url_force_from', '\"\"'),
('iiifserver_url_force_to', '\"\"'),
('iiifserver_url_service_image', '\"\"'),
('iiifserver_url_service_media', '\"\"'),
('iiifserver_url_version_add', '\"1\"'),
('imageserver_image_creator', '\"Auto\"'),
('imageserver_image_max_size', '\"100000000\"'),
('imageserver_image_tile_dir', '\"tile\"'),
('imageserver_image_tile_type', '\"deepzoom\"'),
('imageserver_info_default_version', '\"3\"'),
('imageserver_info_rights', '\"property\"'),
('imageserver_info_rights_property', '\"dcterms:rights\"'),
('imageserver_info_rights_text', '\"\"'),
('imageserver_info_rights_url', '\"http:\\/\\/rightsstatements.org\\/vocab\\/CNE\\/1.0\\/\"'),
('imageserver_info_version_append', '\"1\"'),
('installation_title', '\"imagineRio\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('version', '\"3.0.1\"'),
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
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`id`, `homepage_id`, `owner_id`, `slug`, `theme`, `title`, `summary`, `navigation`, `item_pool`, `created`, `modified`, `is_public`, `assign_new_items`) VALUES
(1, NULL, 1, 'imaginerio', 'default', 'imagineRio', NULL, '[{\"type\":\"browse\",\"data\":{\"label\":\"Browse\",\"query\":\"\"},\"links\":[]},{\"type\":\"page\",\"data\":{\"id\":1,\"label\":\"\"},\"links\":[]}]', '{\"o:summary\":\"\",\"fulltext_search\":\"\",\"property\":[{\"joiner\":\"and\",\"property\":\"\",\"type\":\"eq\",\"text\":\"\"}],\"resource_class_id\":[\"\"],\"resource_template_id\":[\"\"],\"item_set_id\":[\"\"],\"site_id\":\"\"}', '2020-07-29 17:32:01', '2020-11-12 22:00:40', 1, 0);

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

-- --------------------------------------------------------

--
-- Table structure for table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_page`
--

INSERT INTO `site_page` (`id`, `site_id`, `slug`, `title`, `is_public`, `created`, `modified`) VALUES
(1, 1, 'welcome', 'Welcome', 1, '2020-07-29 17:32:01', '2020-07-29 17:32:01');

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
(1, 1, 'html', '{\"html\":\"Welcome to your new site. This is an example page.\"}', 1);

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
(1, 1, 1, 'admin');

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
('browse_attached_items', 1, '\"0\"'),
('browse_body_property_term', 1, '\"\"'),
('browse_heading_property_term', 1, '\"\"'),
('disable_jsonld_embed', 1, '\"0\"'),
('item_media_embed', 1, '\"0\"'),
('locale', 1, '\"\"'),
('search_resource_names', 1, '[\"site_pages\",\"items\"]'),
('search_restrict_templates', 1, '\"0\"'),
('search_type', 1, '\"sitewide\"'),
('show_attached_pages', 1, '\"1\"'),
('show_page_pagination', 1, '\"1\"'),
('show_user_bar', 1, '\"0\"');

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
(1, 'admin@imaginerio.org', 'Admin', '2020-07-29 17:19:27', '2020-07-29 17:19:27', '$2y$10$C9SqS/cPqSIjd/G1IcW.vuDyUT2CCSHEaDZUnI5Jz2yoPKJwhvQBy', 'global_admin', 1);

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
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\"||\"'),
('csv_import_rows_by_batch', 1, '1');

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
(3, 2, 1, NULL, 'literal', 'en-us', 'Views', NULL, 1),
(4, 2, 1, NULL, 'literal', 'pt-br', 'Vistas', NULL, 1),
(5, 2, 10, NULL, 'literal', '', 'views', NULL, 1),
(7, 4, 10, NULL, 'literal', NULL, '0072430cx097-12', NULL, 1),
(8, 4, 1, NULL, 'literal', 'pt-br', 'Museu Nacional, antigo Palácio Imperial de São Cristóvão', NULL, 1),
(9, 4, 4, NULL, 'literal', 'pt-br', 'Ao longo do tempo, o Paço de São Cristóvão, que abriga hoje o Museu Nacional, sofreu diversas transformações, como a ampliação do palácio feita por D. Pedro II a partir de 1850. Lá ele viveu em um período de longa duração, tornando este edifício testemunha de diversos momentos importantes na História do Brasil.', NULL, 1),
(10, 4, 2, NULL, 'literal', NULL, 'Marc Ferrez', NULL, 1),
(11, 4, 41, NULL, 'numeric:interval', NULL, '1879/1889', NULL, 1),
(12, 4, 8, NULL, 'literal', NULL, 'NEGATIVO/ Vidro', NULL, 1),
(13, 4, 11, NULL, 'uri', NULL, 'Instituto Moreira Salles', 'http://acervos.ims.com.br/portals/#/detailpage/75361', 1),
(14, 4, 28, NULL, 'uri', NULL, 'Wikidata', 'http://www.wikidata.org/entity/Q65620957', 1),
(15, 4, 242, NULL, 'literal', NULL, '30.0', NULL, 1),
(16, 4, 799, NULL, 'literal', NULL, '24.0', NULL, 1),
(17, 5, 10, NULL, 'literal', NULL, '0072430cx098-08', NULL, 1),
(18, 5, 1, NULL, 'literal', 'pt-br', 'Teatro Municipal', NULL, 1),
(19, 5, 4, NULL, 'literal', 'pt-br', 'Vista do Teatro Municipal, vendo-se a Escola Nacional de Belas Artes ao lado.', NULL, 1),
(20, 5, 2, NULL, 'literal', NULL, 'Marc Ferrez', NULL, 1),
(21, 5, 41, NULL, 'numeric:interval', NULL, '1905/1915', NULL, 1),
(22, 5, 8, NULL, 'literal', NULL, 'NEGATIVO/ Vidro', NULL, 1),
(23, 5, 11, NULL, 'uri', NULL, 'Instituto Moreira Salles', 'http://acervos.ims.com.br/portals/#/detailpage/75352', 1),
(24, 5, 28, NULL, 'uri', NULL, 'Wikidata', 'http://www.wikidata.org/entity/Q56650144', 1),
(25, 5, 156, NULL, 'uri', NULL, 'Teatro Municipal', 'http://www.wikidata.org/entity/Q1968538', 1),
(26, 5, 156, NULL, 'uri', NULL, 'Avenida Rio Branco', 'http://www.wikidata.org/entity/Q4828121', 1),
(27, 5, 156, NULL, 'uri', NULL, 'Escola Nacional de Belas Artes', 'http://www.wikidata.org/entity/Q55439919', 1),
(28, 5, 242, NULL, 'literal', NULL, '30.0', NULL, 1),
(29, 5, 799, NULL, 'literal', NULL, '24.0', NULL, 1),
(30, 6, 10, NULL, 'literal', NULL, '013RJ001004', NULL, 1),
(31, 6, 1, NULL, 'literal', 'pt-br', 'Vista do Rio de Janeiro, tendo o Gasômetro em primeiro plano', NULL, 1),
(32, 6, 4, NULL, 'literal', 'pt-br', 'A fábrica do Barão de Mauá perto do Canal do Mangue chamava-se oficialmente Companhia de Iluminação a Gás, e, em 1865, foi vendida para uma empresa canadense, que assumiu o serviço de gás através da Rio de Janeiro Gas Company Limited. Em 1876 a concessão do abastecimento de gás passou para a empresa belga Société Anonyme du Gaz (SAG) que por sua vez passou a ser controlada pela The Rio de Janeiro Tramway Light and Power Company Limited (Light) a partir de 1910. Para ampliar a produção de gás na cidade, a SAG decidiu construir, em 1911, uma nova fábrica no bairro de São Cristóvão. É esta fábrica que podemos ver na fotografia de Malta.', NULL, 1),
(33, 6, 2, NULL, 'literal', NULL, 'Augusto Malta', NULL, 1),
(34, 6, 41, NULL, 'numeric:interval', NULL, '1920/1932', NULL, 1),
(35, 6, 8, NULL, 'literal', NULL, 'FOTOGRAFIA/ Papel', NULL, 1),
(36, 6, 11, NULL, 'uri', NULL, 'Instituto Moreira Salles', 'http://acervos.ims.com.br/portals/#/detailpage/78550', 1),
(37, 6, 28, NULL, 'uri', NULL, 'Wikidata', 'http://www.wikidata.org/entity/Q65621019', 1),
(38, 6, 156, NULL, 'uri', NULL, 'São Cristóvão', 'http://www.wikidata.org/entity/Q2408175', 1),
(39, 7, 10, NULL, 'literal', NULL, '013RJ001005', NULL, 1),
(40, 7, 1, NULL, 'literal', 'pt-br', 'Substituição da iluminação pública de gás para lâmpadas incandescentes', NULL, 1),
(41, 7, 4, NULL, 'literal', 'pt-br', 'A partir de 1907, quando a empresa canadense Light ganhou a concessão do governo para distribuir energia elétrica para a cidade, é que a iluminação pública começou a ser modificada, transformando a luz à gás para luz incandescente. Conhecida como polvo canadense pela população carioca, a empresa monopolizou não apenas a distribuição elétrica, mas foi aos poucos tomando conta do transporte público dos bondes e das linhas telefônicas.', NULL, 1),
(42, 7, 2, NULL, 'literal', NULL, 'Augusto Malta', NULL, 1),
(43, 7, 7, NULL, 'numeric:timestamp', NULL, '1921', NULL, 1),
(44, 7, 8, NULL, 'literal', NULL, 'FOTOGRAFIA/ Papel', NULL, 1),
(45, 7, 11, NULL, 'uri', NULL, 'Instituto Moreira Salles', 'http://acervos.ims.com.br/portals/#/detailpage/16995', 1),
(46, 7, 28, NULL, 'uri', NULL, 'Wikidata', 'http://www.wikidata.org/entity/Q65621020', 1),
(47, 7, 156, NULL, 'uri', NULL, 'Praça Mauá', 'http://www.wikidata.org/entity/Q10353330', 1),
(48, 7, 242, NULL, 'literal', NULL, '16.5', NULL, 1),
(49, 7, 799, NULL, 'literal', NULL, '23.0', NULL, 1),
(50, 8, 10, NULL, 'literal', NULL, '013RJ001009', NULL, 1),
(51, 8, 1, NULL, 'literal', 'pt-br', 'Avenida Vieira Souto - depois da substituição da iluminação pública de gás para lâmpadas incandescentes', NULL, 1),
(52, 8, 2, NULL, 'literal', NULL, 'Augusto Malta', NULL, 1),
(53, 8, 7, NULL, 'numeric:timestamp', NULL, '1921', NULL, 1),
(54, 8, 8, NULL, 'literal', NULL, 'FOTOGRAFIA/ Papel', NULL, 1),
(55, 8, 11, NULL, 'uri', NULL, 'Instituto Moreira Salles', 'http://acervos.ims.com.br/portals/#/detailpage/78551', 1),
(56, 8, 28, NULL, 'uri', NULL, 'Wikidata', 'http://www.wikidata.org/entity/Q65621021', 1),
(57, 8, 156, NULL, 'uri', NULL, 'Avenida Vieira Souto', 'http://www.wikidata.org/entity/Q3375097', 1),
(58, 14, 10, NULL, 'literal', '', 'smapshot', NULL, 1),
(59, 14, 1, NULL, 'literal', 'pt-br', 'Smapshot', NULL, 1),
(60, 14, 1, NULL, 'literal', 'en-us', 'Smapshot', NULL, 1),
(63, 10, 10, NULL, 'literal', '', '0072430cx098-08', NULL, 1),
(64, 11, 10, NULL, 'literal', '', '013RJ001004', NULL, 1),
(65, 13, 10, NULL, 'literal', '', '013RJ001009', NULL, 1),
(66, 12, 10, NULL, 'literal', '', '013RJ001005', NULL, 1),
(67, 9, 10, NULL, 'literal', '', '0072430cx097-12', NULL, 1),
(68, 15, 10, NULL, 'literal', '', 'maps', NULL, 1),
(69, 15, 1, NULL, 'literal', 'en-us', 'Maps', NULL, 1),
(70, 15, 1, NULL, 'literal', 'pt-br', 'Mapas', NULL, 1),
(73, 16, 10, NULL, 'literal', '', 'aerials', NULL, 1),
(74, 16, 1, NULL, 'literal', 'en-us', 'Aerials', NULL, 1),
(75, 16, 1, NULL, 'literal', 'pt-br', 'Imagens aéreas', NULL, 1),
(78, 17, 10, NULL, 'literal', '', 'all', NULL, 1),
(79, 17, 1, NULL, 'literal', 'en-us', 'All', NULL, 1),
(80, 17, 1, NULL, 'literal', 'pt-br', 'Todos', NULL, 1),
(83, 18, 10, NULL, 'literal', '', 'plans', NULL, 1),
(84, 18, 1, NULL, 'literal', 'en-us', 'Plans', NULL, 1),
(85, 18, 1, NULL, 'literal', 'pt-br', 'Planos', NULL, 1);

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
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://schema.org/', 'schema', 'Schema.org', '');

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
-- Indexes for table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mapping`
--
ALTER TABLE `mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_marker`
--
ALTER TABLE `mapping_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `numeric_data_types_timestamp`
--
ALTER TABLE `numeric_data_types_timestamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1546;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=955;

--
-- AUTO_INCREMENT for table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

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
