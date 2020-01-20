-- phpMyAdmin SQL Dump
-- version 5.0.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 20, 2020 at 11:13 AM
-- Server version: 10.4.11-MariaDB-1:10.4.11+maria~bionic
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
-- Table structure for table `custom_vocab`
--

CREATE TABLE `custom_vocab` (
  `id` int(11) NOT NULL,
  `item_set_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
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
('BulkEdit', 1, '3.0.9'),
('CleanUrl', 1, '3.15.12'),
('CSVImport', 1, '2.1.1'),
('CustomVocab', 1, '1.2.0'),
('FileSideload', 1, '1.3.0'),
('Generic', 1, '3.0.12'),
('IiifServer', 1, '3.5.15'),
('Mapping', 1, '1.2.0'),
('MetadataBrowse', 1, '1.3.0'),
('NumericDataTypes', 1, '1.4.0'),
('UriDereferencer', 1, '1.0.0'),
('ValueSuggest', 1, '1.4.1');

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
(95, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(96, NULL, 4, 'Document', 'Document', 'A document.'),
(97, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(98, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
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
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 32, NULL, NULL, 'Document');

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
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0),
(21, 2, 10, NULL, NULL, 1, 'literal', 1, 0),
(22, 2, 1, NULL, NULL, 2, 'literal', 0, 0),
(23, 2, 4, NULL, NULL, 3, 'literal', 0, 0),
(24, 2, 2, NULL, NULL, 4, NULL, 0, 0),
(25, 2, 7, NULL, NULL, 5, NULL, 0, 0),
(26, 2, 41, 'Display Date', NULL, 6, NULL, 0, 0),
(27, 2, 8, 'Type of object', 'Photograph, lithograph,  watercolor, etc.', 7, NULL, 0, 0),
(28, 2, 9, NULL, 'The dimensions of the document.', 8, 'literal', 0, 0),
(29, 2, 11, NULL, 'Institution holding the item.', 9, NULL, 0, 0),
(30, 2, 36, NULL, 'Citation in a book, or specific credit line.', 10, NULL, 0, 0),
(31, 2, 15, 'Rights Statement', NULL, 11, 'uri', 0, 0),
(32, 2, 156, 'Depicts', NULL, 12, NULL, 0, 0),
(33, 2, 28, 'See Also', 'Equivalent item in other databases (Wikidata, Brasiliana, etc)', 13, 'uri', 0, 0);

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
('01489776b781f65a17e6070cefc2788a', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537383636333737302e3335383236353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223031343839373736623738316636356131376536303730636566633237383861223b7d7d, 1578663770),
('04cf11eeea0b639aa650e1240e4a29c3', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393436393933322e3937343039353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223034636631316565656130623633396161363530653132343065346132396333223b7d7d, 1579469932),
('29007ee5e8fbd78b14225cd348c08d1b', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537383636333738362e3733393234363b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223239303037656535653866626437386231343232356364333438633038643162223b7d7d, 1578663786),
('612714b5f8a9edd56769940a98e993e3', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393437373936312e3234323637313b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223631323731346235663861396564643536373639393430613938653939336533223b7d7d, 1579477961),
('616a76d7fc0b5d7fa990548b889afed7', 0x5f5f5a467c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537383636333833312e3930363532373b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223935303161666662353266386134623065313162363935393330336565653430223b7d733a33393a225a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313537383636373430333b7d733a32393a225a656e645f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313537383636373431373b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b5a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226233636136323634373131373864386137316130656230363537316464346366223b733a33323a226463356138336163353330646533316139616161353633313331386265646538223b7d733a343a2268617368223b733a36353a2264633561383361633533306465333161396161613536333133313862656465382d6233636136323634373131373864386137316130656230363537316464346366223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f417574687c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3437313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226366393037626337326163633638336464326564616134316337376236383365223b733a33323a226136313962636536373633643230396134653063313536633935643964343730223b733a33323a223133666139623330313764373463343732396337396439333232343930356365223b733a33323a223737326333386133356566353463323532643635633762373265646130636138223b7d733a343a2268617368223b733a36353a2237373263333861333565663534633235326436356337623732656461306361382d3133666139623330313764373463343732396337396439333232343930356365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1578663832),
('616f4bc6c6bcc5bfad700e0939b0cbf0', 0x5f5f5a467c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537383636343131332e3538323631333b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223431313031646337356664376535653936306635366564326161663463333363223b7d733a33393a225a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313537383636373639323b7d733a32393a225a656e645f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313537383636373730303b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b5a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226663656539653936396134663537373838346638373730393666383062373965223b733a33323a223139346166303034623064373461363465643538323936636463393561656131223b7d733a343a2268617368223b733a36353a2231393461663030346230643734613634656435383239366364633935616561312d6663656539653936396134663537373838346638373730393666383062373965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f417574687c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223932376636363839343632383833393763356231303831393966613832626266223b733a33323a223234316630393630643136636331353262303436363262346266326264663863223b7d733a343a2268617368223b733a36353a2232343166303936306431366363313532623034363632623462663262646638632d3932376636363839343632383833393763356231303831393966613832626266223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1578664113),
('a1d2b01b7ec4a1bc7103d630655212d7', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393436393933322e3938313837353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226131643262303162376563346131626337313033643633303635353231326437223b7d7d, 1579469933),
('aa805e8f85483e20f7ca28d746d6f8aa', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393238303337392e3932353638353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226161383035653866383534383365323066376361323864373436643666386161223b7d7d, 1579280380),
('ac191ec45676932ab91a60a5e26b20fd', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393530323430362e3931313237353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226163313931656334353637363933326162393161363061356532366232306664223b7d7d, 1579502406),
('bbc311af36a3ccf7f4426ed0316b6484', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393530323430362e39333831323b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226262633331316166333661336363663766343432366564303331366236343834223b7d7d, 1579502406),
('bfde25d565ca7b4789fdfa0b678acf03', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393238303337392e3934363734313b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226266646532356435363563613762343738396664666130623637386163663033223b7d7d, 1579280380),
('d4d7dbbb643a1cd972f09ec50e11ba55', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393530323430362e3930313238333b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226434643764626262363433613163643937326630396563353065313162613535223b7d7d, 1579502406),
('d944c8aea7458403b3596dc6a0deeec2', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393436393933322e3938383031383b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226439343463386165613734353834303362333539366463366130646565656332223b7d7d, 1579469933);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ec91f6386c63877321af0ae930b1d267', 0x5f5f5a467c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393531383736392e3234303337363b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a223265393132653163306361373262373966646535393163303430353135393836223b7d733a33393a225a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313537393531383537393b7d733a32393a225a656e645f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313537393532323336393b7d7d72656469726563745f75726c7c733a32323a22687474703a2f2f6c6f63616c686f73742f61646d696e223b5a656e645f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3339313a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223432303362636430633962303230383763333061343137333834383730326162223b733a33323a223937323435373063336231363364393435346235393037396462386664323765223b7d733a343a2268617368223b733a36353a2239373234353730633362313633643934353462353930373964623866643237652d3432303362636430633962303230383763333061343137333834383730326162223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f417574687c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3232333a7b613a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d4f6d656b614d657373656e6765727c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a3230353a7b613a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d5a656e645f56616c696461746f725f437372665f73616c745f637372667c433a32333a225a656e645c5374646c69625c41727261794f626a656374223a32313131333a7b613a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3236303a7b733a33323a226265633035396334663036303030343030613734666434636366353663656130223b733a33323a223237623037396130343036613833663338636433383264336531363834666463223b733a33323a223336613165666162656566376534356565313566306337653065366165383235223b733a33323a223136303564343561656132363265306162303264333739343663653061613732223b733a33323a223532323732383238396637353339373265376162636536396131363165383336223b733a33323a223636346137336336643334613637643062393266633137313336616130393063223b733a33323a226230663030386331336537346364656164613664653831333432313862623337223b733a33323a223739393633333132613335653764386537656535383665653262306161376263223b733a33323a223331373365633963613333373231653264333263666433393632303561666632223b733a33323a226461336132363866376130303662363763646365663830343234343435626539223b733a33323a226265376664303035326265376364643237333039303734663561663061383738223b733a33323a226236393262656630393039333336623333363864323632373333613331393564223b733a33323a223330653139636533386462376530386431326661386436343261616636313139223b733a33323a223835376331333035306566363531316130323232313632373266636633393337223b733a33323a226362323666336235306463633132636333663061613538366239306439373863223b733a33323a226336383638363437636134333635623134613538373932393062393466363533223b733a33323a223531366236363763336138383663613664326337396435356362616565396330223b733a33323a226431363265363338643664656266386234636237633238303535613637343237223b733a33323a226337653866386261373262336631626638316561623062393762633961656662223b733a33323a223439636562623736393132373064653962383633343764396136356163646363223b733a33323a223661633933653137323363663833393834633063306532663230393134323032223b733a33323a226662303732356135653138663335663664393862303838626430326133356266223b733a33323a223364383131393235633639343062646530343431376665316565643139373231223b733a33323a226137373066613637653631336666373930633936383766656131313539363137223b733a33323a223733373932383762386536356235343063643933363930353432633036663435223b733a33323a223635633737656566343561653436626231356134303335626634326465303764223b733a33323a223465656431393731643463383039323365363036303432383166633235346232223b733a33323a223165313738376134363037373863393837633034323632306138613935653964223b733a33323a223430373337643636396361313466636439633936363966626561393766383364223b733a33323a223933323130666536343430376233636632613534356538643831326638646665223b733a33323a223937613033343131313064363232326162343461336261616536383030376464223b733a33323a223961646136623836303632366562353437316464646466383935653339643063223b733a33323a223635376531363061646564646334383631336231306133386463663766646436223b733a33323a223834356433303865363038616565326164323466383165306435613266326530223b733a33323a223464626239323836386565653465376262653136363866356536653466663562223b733a33323a223931636532613631663663343735653732646264373836643536323863336661223b733a33323a223735333138636332653435656438303635653763336366663338353132333838223b733a33323a223338616136323035393733343461333933343031383835316639383530316166223b733a33323a223763346535376239373232613130663430653238373639396134303761393130223b733a33323a226235313332383435343837616466343039363837643437633833646234646261223b733a33323a226663316439303462666562653163373132376131656361663533643037316436223b733a33323a223231393763363764373432633134353963643136396438633139326462663064223b733a33323a223261643839623036326234303939356461346637636536383437616636613136223b733a33323a223332633134353261643265636439643834613735336535613463613132383430223b733a33323a226133653565303736393361653431326635343265383832623038313239373730223b733a33323a223464613936626263663236376565373635393633323965383961303635366530223b733a33323a226131623235643833346262653536653539323130636162323933633663663364223b733a33323a226631393065643137343732326538656537306339383561336136663532363437223b733a33323a226333663333623965373631323062326439366230383536393563313837663035223b733a33323a223434353438353932336163643430636362323333316166626333383863333165223b733a33323a226435643731386237373564313431636539376364363038373264353131353365223b733a33323a226232646130333936383839323635373930323065353031666436653037643863223b733a33323a223839343136353364316335313436643062613761386337316665343131323931223b733a33323a226266623366396331313065333165636232646131303937313131636632623861223b733a33323a223437336331306164363036623462363162356537363538353266646531363234223b733a33323a223761303466323731383732366236316663333233383636613631633236633637223b733a33323a223962626339623039613563613830363930353966363462323333366238343235223b733a33323a223134656664333463663736303965383439386464336235306236653035353830223b733a33323a223437326135366539326163333062346637373235363331306134633533363034223b733a33323a223837363339353262623263363234313732313862373765376134313662363832223b733a33323a223861336434336663383439623732623465396534646464623332613133633234223b733a33323a223837316232633136356362373735653434373238306365633234393534623831223b733a33323a226461303136393734633236316133633637623465386636386132646365656433223b733a33323a226331306431316462323937326661653963393233326134373334353032626131223b733a33323a226161376632343061373339653632306362346531393432666235306135623966223b733a33323a226530383735313562323035653962636261376535326132376364643133623339223b733a33323a223263643436396336336363353232373733633862303939663230386262343966223b733a33323a223838613438343530313063393733386331353636366334393033646433383734223b733a33323a226637656164393637336166393362336535343939323739663333363637333263223b733a33323a226130396231666634316665646139646232663537626133623331323931326662223b733a33323a226266626234343837623064313933396138626231386366626664623032313166223b733a33323a226363336466653535633836643435623535343134336638303237663930393165223b733a33323a223839306564643561633166633064393465326133393232616265333231393734223b733a33323a226365633063336437613037653464373638336664393038336434346364303061223b733a33323a223962343430326536346232666562353234616531343632636531373131366633223b733a33323a226336396337616337326466366265313331633339633239333735336335383565223b733a33323a223737333038306139336662343839663965383463386561633433353563386333223b733a33323a226138316136393735396137316439363033666166656433303664653062396235223b733a33323a226339613337633637353563653632613431636165656333306464346637326664223b733a33323a226335613038633136396138343334636532383631313130373966643164616533223b733a33323a226565663932613838363530626132663839643837613630353533633062333363223b733a33323a226632346338636162653861613161633063393136383061383933373931396537223b733a33323a223564386231323966393565343337373432666165333236656362346330333136223b733a33323a223831303763303665646534663639326464316232633231333361333764643334223b733a33323a223132366136373365333435353537363964383138353837626532623837323030223b733a33323a223534326365373834613935306636643032613330666439336666613037666365223b733a33323a226464336336303739616536626533613861653635393130366631373832393334223b733a33323a223566613637383036646332303039653633663763666332333561643534663435223b733a33323a223038396631373365363531646166613037663262346535656637303735336434223b733a33323a223834383961333937303537376234336663363536313839363065386463643933223b733a33323a223632373539353339323161343733653130643161613637326264656438306137223b733a33323a223635613366313133356238616232393930306433396263373136343061333139223b733a33323a223536323335363935656666356365373961303636303362656230646461613730223b733a33323a223163313234623862616364336131613734363961343162613035343936623563223b733a33323a223463366635663530323231636335636334653630623661623735663266663263223b733a33323a226333366166616239383366666236396434613933313631626237326466313734223b733a33323a226532646236633861383164326231353265333037653632643730626231323861223b733a33323a223335376366343433636561303566663365346632656162313635643965366562223b733a33323a223666313532326131343530613134353361366162326263383866333734663633223b733a33323a223538356432633063623735396539666138653638386562653562356130303735223b733a33323a223636326262326136323463646330343934303236363837333530343831376431223b733a33323a226439313938393033653365363430623938396436316538353364666433383364223b733a33323a223430346639356261343736646562366264303132616435366537396430393464223b733a33323a226661333134633439316563623633643135626533643535376530383735653139223b733a33323a223232356138353634346234333865316436623863623833613265663831346166223b733a33323a223339326235313036366238613230303462386664356561623234623963613934223b733a33323a223237633963366463303630373636623733396565646665613562386561333763223b733a33323a223765383732326364643832666361386337363532313431393231646330353566223b733a33323a226132626234613338326230353233356163623163613566303934363635646234223b733a33323a223864353965383239396532643831353337653962383837653463613665323065223b733a33323a223831373834343931333162353532343037353431363936666135363365303233223b733a33323a226565383037633433653338393237386364633132613738353561343839393038223b733a33323a226632663030636239643732373866386465663332356630323363323637623166223b733a33323a226434633936383435363631653030623931613866653039363335643965363661223b733a33323a223533376130616433313261383162343838323032636564646362313535306434223b733a33323a223965353435616665303732316336393936623931643433323933303138373532223b733a33323a223836363036353565383235353237343532376461666630373161663336623239223b733a33323a223562656162373963363635666562626236663835653438356139353636613263223b733a33323a223636623334383939303762646536613561346261363465383365333532356164223b733a33323a223530313034333266343563323637343464356333666234393735613961306235223b733a33323a226131613536373061353535623164383264343464363163396139646133643637223b733a33323a226632303261636331663437643861373333316135656234643637653831626461223b733a33323a226566333661373865613465346537393033656132333333653962656632633238223b733a33323a226637383932363532323261646432363038373966333665346363303564623130223b733a33323a226161643833393039383234376535373331393732663865366661353738336666223b733a33323a223061626131663732656665633231636431643863396463343239383661333938223b733a33323a223531313264636533336639383964303738396562333233333736326435356636223b733a33323a223332336664323366333436306264396162323961626262653131386161613139223b733a33323a226238613031643962373733323431303334353063663233316265363037653939223b733a33323a226539343862353866323832303364373062363633363233363461376465613966223b733a33323a226165306433363039656166333862653265336365666238376233313130386335223b733a33323a226430353262663037336534656636386365663935343035626564383731343263223b733a33323a226334633432326364323765333530643330663666313666343765306238346562223b733a33323a223163616537376138666465346639393062396236663865653237643937653634223b733a33323a226430636537393130633838323438353936636261393332383236326534303161223b733a33323a223261386132393439373462376263643864633735636663396634613534383034223b733a33323a223334366635373333363033613434373562616264373362383936396639373931223b733a33323a223664376236666332333234613563626431313432313139643663366439663261223b733a33323a223638303638343435343962343238386534643933316362356139643962333134223b733a33323a226530306166333266333933613137333962336333383665326266633633643134223b733a33323a226666396231383661343239643433353664303066353766316237303338663234223b733a33323a223935366361353966323230626338613134613336636363663765633139653734223b733a33323a226661393039313635326133346465613439353134383263663535313634353962223b733a33323a226134626564386663346438666433313262323839343333323562633435616238223b733a33323a226561376164626434383161363232343034643732316536326461643061383732223b733a33323a223937393839346336303438373932663435396661306366366361303736306431223b733a33323a223930623934646231373435366239336162386131393431653531323963306339223b733a33323a223634616131343133623861306163353335623336343761323133623833316231223b733a33323a223666626534373932626564613536346635346130333936393661663363623063223b733a33323a226137396337343335653438633033303237656339313761663163303065636662223b733a33323a223763313031653331653564383930623639623861646362376139323339656463223b733a33323a226166323139326131323033353764363130653435383732343233613761333237223b733a33323a223665313436363933646164396664343335653235623036626131626533316566223b733a33323a223439383632643031666438323335303133336430666663313432623464313230223b733a33323a223964666535326536626130613333356332633263343238313765313431363339223b733a33323a223037393537663165623561356439383162306466653339393064636138326161223b733a33323a226133386232333931376539383731353064356166613662653535373139623665223b733a33323a226138386636373537396132353564663061353963393234313863313439303630223b733a33323a226538303331646133303438336162303030326336633539636130316334306434223b733a33323a226337393830353234653335303563383965313436393561353431313134313439223b733a33323a223761306630393465613139613130633835386262336332633737383737383832223b733a33323a223864373634366135373261643134613438313061303864396462316331383662223b733a33323a223166363261653963626161313764643037336133663335636235363164623466223b733a33323a223266313162666466353564333430396366356137386633313336636161623766223b733a33323a226161316434353738643539666237366438623731363064663331326163636239223b733a33323a223263316133363036623763333036393830366631313764313535616135303763223b733a33323a223336353637386535383635326331663932636666353930376538366438643738223b733a33323a223464643435373730353030386163643632363563303334353338626432643564223b733a33323a226165376336313465643333353033316439336630626334613530383766313266223b733a33323a223137313666376535636664366663303633336236353331346664313737653932223b733a33323a223465633434316132353139333664323661306432346533393233386238343063223b733a33323a223433356565343034343031313736303135636661633432353363393632373039223b733a33323a223631653265613833646238666236616535303239636431306166623164313535223b733a33323a223632356565633661303632333664666331353665366161353737306161353036223b733a33323a226162343334393839613936343438346439373239326435663530386632303835223b733a33323a223934653636613462306663346163666561383338333166343136333639396264223b733a33323a226538623638356663313132653866623235636139663437366535633766306163223b733a33323a223636363864343137376534626530653564643636313035373366303335383832223b733a33323a223464313166633833613762376539656363386563306630323064376161323861223b733a33323a226662323433663339373262303433616561613664323163353731326463393165223b733a33323a223363373766383935373366333931346636303534386233303633383636646263223b733a33323a223637656537323866643731326461336634633038616434346636373734666662223b733a33323a223731383133636133633831366463373032623363336330326331333535633333223b733a33323a223966666662356238343137316366336639313564316362363233613565373435223b733a33323a223230336362313332316163353466363334396132386363613161346131323766223b733a33323a223430653030396465616334323666323135313061613338636533333465306134223b733a33323a223163666563356562656138393163353466616334613837373461373639346466223b733a33323a226138616261366562623231663730386435323738616166666665656437636534223b733a33323a226439383330386364343839653735633137356535663862663061356434616164223b733a33323a223331363633326631633730363639373664653261363965616138613363646566223b733a33323a223935393662343266636533643039643330636437336332383439623861613035223b733a33323a226331643432663764633162613966313161313861373565613461643464356130223b733a33323a223261333837613833323638383463353934656636383938666362366231653835223b733a33323a223864383634363835343764636130653862313237386435666139316235373031223b733a33323a226437353839356561366462376233613338316235313639393430363832306234223b733a33323a223538323561333234393530643939653562396239633866303639613130643331223b733a33323a223432643534373639326237663436313338356562393662643964626663376339223b733a33323a226233646465353431323435626534626432373439303663653261383932633037223b733a33323a223165393335663062356231363234653134316363316630666434643531393865223b733a33323a226562626438393139353962346662386463363062323433303636333265363764223b733a33323a223961366239396266326130653666313032616435356465643137626134383730223b733a33323a223863323362363038653338646139333066616235373562653933633562353339223b733a33323a226531326366346237643962323966343666363961353030613363666331373032223b733a33323a226332306634303734646436643561303931636265313663626565306162386335223b733a33323a223938393232396331386534353736373439383935376661303731393737386536223b733a33323a223261353565356438383638313936386666313236626362303439326364316330223b733a33323a226637646531343233643565666538666561373934636234306565356132646639223b733a33323a226333353833323934336661336362366336356139363361396537663235366136223b733a33323a223665346233343264393437643963333638656337393838346234646162366430223b733a33323a226235666233393934373838653930383765396666323638313264623361343636223b733a33323a226133626236333337343465636439346666346632373133396338373134613534223b733a33323a226638663766633135613935373065323836333033353462323564386330633233223b733a33323a226563613730373566666666323165356264306137396239353566376637616465223b733a33323a223032316631623961643630656666616139653630636130663661306632613833223b733a33323a223762326530646134366362323136346432386538316332316139623133363036223b733a33323a226536373765393838353764623164363565613561303032616532363431346136223b733a33323a223465326361383863613963373763386466633636663565313732376632633233223b733a33323a223239613132343137343636333937363330313637333433363433623962393964223b733a33323a223933636437653234303236313231393733663636383936643364306362666166223b733a33323a226132623937623932356663303031316236383664383066346462336330633539223b733a33323a226534613338656538343133643431326632383037623532383339343434653634223b733a33323a226438356133323436313832386534363037643662623633326330643961353561223b733a33323a223463646265663135393535396533663039323663323232626462353064663738223b733a33323a226234353634663534316435343362363735383665343165633036623163373366223b733a33323a226662363735393066313763343333616461313238356432383235346235633663223b733a33323a226337653039653838333130613536656334626132323138646461626335343566223b733a33323a223032316262323265346533656663636438346438383966373432306536356533223b733a33323a226361633032653462356663373130366433306237366430383233643862326134223b733a33323a223739323562323738363434636637396261646365623764643836656565306364223b733a33323a226461656238663937303866316561393032653665613338666535323662346632223b733a33323a223730333031323665626238323236663635356133393064386137643161303962223b733a33323a223535386532626339643565653037666439303664313363306332353736333136223b733a33323a223031653063616162356632313039333134636235633163346365623035626561223b733a33323a223230343339376262323233353634323336386636613230613536636633353366223b733a33323a223739626163306331303137616666633637366662646162303537313531333139223b733a33323a223461633265616464646462633836306534333736303338666361636534346263223b733a33323a226465373861623262396431626162613138646564613231343531356332373961223b733a33323a226137313435663862386134383261663365646132333237633338323932356434223b733a33323a226465663239333738613166356663623336333866323062363735326333333838223b733a33323a226131323634306638346565656135623439656563363661616366316462353334223b733a33323a226661616233653461653435346465346162613734373237623464313836306436223b733a33323a223234656439656434636334333138353165633134613839626435643435333530223b733a33323a223035356365646531386537613062303366313739626363326232343463623063223b733a33323a223335363965343835333762653566656435353338383262343734626233353334223b733a33323a226136646561323036643963643532623530333530363863356338346630376362223b733a33323a223564626333353238633938613438316634636561613938613862643461633061223b733a33323a226232613363363636313135616563383637616464376638663738343062383663223b733a33323a223438656133666666363936393162306131393362313362656134636563326333223b733a33323a226562393534343637316434316330303937656438613763633832336239396562223b733a33323a223166383564376432316432653236633438316336613361633731313363656432223b733a33323a223637336234363865366566393362656464343336303435306235323164303666223b733a33323a226362663935396631303132383931303462643561663932363639386333393364223b733a33323a223365636262613534393130636137373166326534613066346336303436323835223b733a33323a223866653631393864353565623437346263353430643065343134623735353839223b733a33323a223434376632316266623762323366343565373735643035613735353662376265223b733a33323a226464623565623936326664386461323063366530366631363663356137373230223b733a33323a223865306634306365393230326635316330323234363365353035326435653433223b733a33323a223565393461373932306564613164333264323834613330303337366464356539223b733a33323a226333303537353539383436396534633638353330386165356138663366663735223b733a33323a226534623631333135323731363862303162643931636365643862346630313266223b733a33323a223735373662643031393062393433343038336134643962383030653839373766223b733a33323a223535356435656163306166653230363265303331303363303564393666336137223b733a33323a223161396438393531333564343230363239333962336435383139653637623466223b733a33323a223938363837366331393738323539336462386333323236643965653536623533223b733a33323a223534303964373838663561653463373161663337313030316364343561623432223b733a33323a226135333339313963383836316434343363393435346465363464363461313630223b733a33323a226265663837313965313861313936323865663735366638353461376166376264223b733a33323a223334366163663335313063316138616130343236386364613234626562376139223b733a33323a226561313236346135396462353432346335363465646134306166323931333931223b733a33323a223865616631393332643339613737373363643164353239653831346330646234223b733a33323a226663303962303930633038343933313538366634303932636562306230396530223b733a33323a223461383566333562316430323836363239636438393561663063393666396431223b733a33323a223633353639393965373431316264343230313537303934666533393033663466223b733a33323a226164333962306631633061333037396632323265303833313764323061366565223b733a33323a223733383663623364653963666562363134316330313236626162336536306463223b733a33323a226564333233366632336462613765343166306163366466626532396532643761223b733a33323a226564386237303230646135333161663831393738666530633035313862663735223b733a33323a223763333138616131613361356231373464643339656536613338656632643838223b733a33323a223038643637303636333765376563343837386235356661636332633763626533223b733a33323a223961343939393262613932383136646433613366303231346336356462333161223b733a33323a226332343237383136653363353063363133393732393765613135663038343035223b733a33323a223935303137346666316133666463646535633439346166346263313238393739223b733a33323a223738663062383032616662373338376431336539356262306266656338373934223b733a33323a223266663831643932336632366535306638396165613966306531306266663134223b733a33323a223266336464663832393438653637373734613464613866386361613936656536223b733a33323a223065306138333864636334303236393931623965336430306139336162626636223b733a33323a223632383531346135313565386464396135376333316536613736663265386236223b733a33323a226666383039386163633163623737313635623235323961383939386336623034223b733a33323a226465336234626236313863326139353937336462303936636464373235356334223b733a33323a226465356237333264316438333139393962656334623165663535376665336164223b733a33323a223736393261316637613238323334326238383532616664623335646638353261223b733a33323a223032333332333066383166316334633761646464316636313239393562663764223b733a33323a226430353062386161376236316434376433306537613066346537386265626637223b733a33323a226630663237326536306266393961373133396535363330313565623961316664223b733a33323a226133373430326437616236356332396363393638656430623161613636656338223b733a33323a223262386434396138393834663864643438653335363861313762313938336233223b733a33323a226232333363636234383262636235626133623266356531343135333236666161223b733a33323a223562356136656166633830396165303965363561346564646263353837623333223b733a33323a223735633033353766633635643865373365666339663738653432366635646163223b733a33323a223832666664643637383836343161376637633331643339396339643536626136223b733a33323a226261333035303661373864346535633032643166373235373834353839303430223b733a33323a223365636231616530313436396266326465363731376163636537663139373737223b733a33323a223239663732666236306361316234643239356237323635303535396533613762223b733a33323a226634386665633663346363383263636165643963363630333866363836363633223b733a33323a226139643839373963306336393436623134316562343466623132366134623433223b733a33323a223131303261303833346334623239356536636561303161656637323162626362223b733a33323a226631666333336337366465383461623938623833663962333165336266363962223b733a33323a223639373438373266333238356565616339376466623936366165396165333163223b733a33323a226662633832303433326333353036336532313333323230326231613364623664223b733a33323a226533656465336563326165373230366163663566626364343532653564313334223b733a33323a223634343063636435663337356363343961316136616261373435356163393230223b733a33323a223864303436363361663132333961646333333836643530386335636634396236223b733a33323a223836383762376636373161333036383330326433383831386164353664343866223b733a33323a226631396137666433316562623532343736373064633636333262346565333738223b733a33323a223135366132346261623837346439663133653039646531356361356465623436223b733a33323a223761323531346566336565383961386137663236356561333363656661373834223b733a33323a226461373634333463656166623964323466356434306266636638353463396362223b733a33323a223266326233393432366132383637316161616237383462393763633261663835223b733a33323a223331663362616633643961653864303536396432626536626130313664623364223b733a33323a223733346533366462343932373532633230333535613765656162623461633537223b733a33323a223935643164393735353030356265626132383131363366323636373732653963223b733a33323a223732336239326434386135626638326339626531386138646230393861366637223b733a33323a223034666635356236376532613462373831363664626666313035333335636163223b733a33323a223530363130643037666335343030646339306136373332663937343736333136223b733a33323a223165303834386439646132333930653933323836306339316265356364386239223b733a33323a223265393837353337346136393266326238366534303333393437363865383762223b733a33323a226632646261616261393632313938336635613934313934393865326239306333223b733a33323a226634613562643233643863333633386436353839396435323363303432326531223b733a33323a223166363665303761646639363065383566373736656164333763666436616461223b733a33323a226437353830346230373932656533336561306437346633386139326132336235223b733a33323a223165613133663937363864326232323436356364663739633335633234376636223b733a33323a226630373265353533373939616165313031613962316564333933623166666230223b733a33323a223661303065396265353763666335363236303263373666643665333932353239223b733a33323a223266646333346533643365386464663731306432643962376639376231376133223b733a33323a226434626165376365373564643530323861643330646564366462623536323935223b733a33323a226366356261613931323062613235346636633161323161313034376337636235223b733a33323a223364653765356236653235353966333034613737306464643764366565613862223b733a33323a223636396263646666643434313830383663316633633134336230623939343563223b733a33323a223333386437373337396365386538363639383434333135613737323839643532223b733a33323a226536666665666137666432383039353339616139306166303264653166326162223b733a33323a223863386565363765663236646163666363333762653336616462393330366564223b733a33323a223862666563616264616335663839306635383739663563316666303739353033223b733a33323a223634386530353963616235613564316637633961346437656433343137373362223b733a33323a223234383836646637346461373365343239336461376364373461636433663435223b733a33323a223138336166353531333261373564626332663065623563646264336234396132223b733a33323a223030613434363238333961396262613632393961646364366464383734636333223b733a33323a223837646330343665646139323335623832363764343638663464353135666332223b733a33323a223664356431663438623737393263323462663238343934333131386138316461223b733a33323a223039393239316238613264343865333332373635656233363230636138343863223b733a33323a223462326366326236613963313330366335343834303831656566613966306639223b733a33323a226234646237363961373031323564396664316332376335633333613664376566223b733a33323a223333353762333136386239653631623533393033373737393536633963393565223b733a33323a226535633033613065623166613864643139343638346561666335626265333036223b733a33323a223837633132613434393737356430373366373830626535383136326339643336223b733a33323a223531353138386630626564376132353665383532333839336565646462646635223b733a33323a226664343133383665373532623665313265616435313035633430303864633438223b733a33323a223830643537343733356461393038313239396364366430306330303963343234223b733a33323a223630313130376531666533376666663939623330306231333530653832373235223b733a33323a223035643434306334653863303331643839383538396565656138303138376634223b733a33323a223035376333343163376131656366383034373331336563353861323731363436223b733a33323a223165653666353830626638643132613332353539366563303266633665643331223b733a33323a223334316132366331373239396364333939623534326436643861666331366336223b733a33323a223037383435636333643336313463366331333331663964383832373634383865223b733a33323a226361383632396535316232326531623363643466306235623462656661313239223b733a33323a223964383637303134633131383139393938346563346266343966333761626338223b733a33323a226233653632646164633133653339623764653034363464343838333934373536223b733a33323a223139393230636239626265376438633636343138336466363364643237393062223b733a33323a223733373139666262333233366363653239396165656532646136363563663634223b733a33323a223435653564356162363161653866663739613665393563316163613138353532223b733a33323a226163626636613165343561356338306464343431623033623663306631313961223b733a33323a223236303162323635323265616333313332396630343634663435393064316230223b733a33323a223938333831326438636230356666393766643936366631356637633063623736223b733a33323a226232353039306630323839636138353462383933303137616261303138653063223b733a33323a223362343035303263303364663139363764643134396663333234666436313363223b733a33323a223737613766653939353932663266656264643238336664613361306165383936223b733a33323a223534306337383762373132306365383861353839323633343634373132653730223b733a33323a223334326333363930376662303132306466643930393732333261666434623864223b733a33323a223730653266633066373336613435363163333438353139323366303230333262223b733a33323a226566346335343461323832386631336162393862376437326666656161383963223b733a33323a223532656539386138633735373432643131313066353431366230303465383032223b733a33323a223264333763373961396365343061323930653634666336313031653037383861223b733a33323a226533323134366266633066396430343463306334316337343637633333333232223b733a33323a223662636261623337323062313864373533336663643564303539386631376364223b733a33323a226138346134643966323765363966383764366261646630366139343965306231223b733a33323a223631366564316132643233393536646364653633333035303463646362346630223b733a33323a223463373163646235323531363565313433376261356365383737343531346234223b733a33323a223263333937623230373062616130343838346365313362623737656132663565223b733a33323a223935306363373238393133623662313433383665623734626361356165383339223b733a33323a226139653738386466356433353034633335366366326430326665663930656134223b733a33323a223461616238313533626462303465326632643037386461623164306434626331223b733a33323a223639363166643634356430353232393939633762633633646362363633313863223b733a33323a223139356238386531393838303934303837326234353430653061363338323337223b733a33323a223232353535396435613132343234373832356563336435663564306263363763223b733a33323a226232343833653365643264326538373564306634653230333634363765666330223b733a33323a223366353835353964383535663166613562633631396630306532363433316531223b733a33323a223934306234366134353231633036393563663434653562386336653432636666223b733a33323a226430323536396233336462383437623830316433356132336132363763393364223b733a33323a223536623636353563383763363230326362363134623831313134393462613130223b733a33323a226166366534653938616162376230383839336236653365353233353466666461223b733a33323a223561663638363463343565326263343331303632626432336165386536306362223b733a33323a226165343663643138343236393465303264383265646362373737616235613338223b733a33323a226565663132623830396165623136363461626564346437326634383562346237223b733a33323a223238316561393733313636386261356461643335333164316432343039386430223b733a33323a223034306363623131323831373739353632663034393636356131623964333630223b733a33323a223463666631343363633663623737316466623137383033316530343266353463223b733a33323a226264616631613463646465356533653835646330646430366562303862616663223b733a33323a223634666538663466643236666265363564346539353035326533643266613036223b733a33323a223937303735613138636564383933653838646539343231316630633931306137223b733a33323a226433616666373433383866613334386663393265363830333762623037353937223b733a33323a223635633632393337616364653663336238333333633830636333376535653737223b733a33323a223461353364393530653639636634303831363966383830383831306664373866223b733a33323a223838336433623335663463333864643830393839323230643833626537666335223b733a33323a223339393163326636656338383666633939653765326265346536373634383536223b733a33323a223462663962356430366136356664376363316431393166356430363231356566223b733a33323a223662656132643965633462306364636162306236623832386462356164376331223b733a33323a223536363863656161393237366264656564306235636337313734663363383139223b733a33323a223365343136393066653236326366623331356234373531373839633633323637223b733a33323a223732613139363133353963666235376564633461653332303532663165623066223b733a33323a226138376632353065303736306531313536316137383739633565383261356561223b733a33323a223662613533656364666366343631313132393232653935373533636339336362223b733a33323a223533306666373161613833333039333436356530653738353233663636363234223b733a33323a223537333663373930353138633765643839626434353439623534396263386661223b733a33323a223237363666636439616634653962383930313263343336323933396132383739223b733a33323a226365393734396431373563653365346233333265646437313665303736656531223b733a33323a226234653863633233353462343939383333353261643164363664616665653063223b733a33323a223630666333653839373733633637396236646132646362333536323563653862223b733a33323a223061333066656637636435316165613136343439353662373330356236386433223b733a33323a223633396334353030336232316434353233343130316534313434356531393130223b733a33323a226433643662653037636433383666623831346166376536633639623663373338223b733a33323a223233396538376266343738326166333666363163643430633565336236303937223b733a33323a223963663765323763373561613839616432333137353564343130396232313136223b733a33323a226631356535336139356366376136336263303730323661383366356665316637223b733a33323a223436666234353438313738376663643033316338303835623535636334353536223b733a33323a223564366437613435313834393037666133313731643234346163613534613938223b733a33323a223937623833353537393239646134373032623363663861383839333361353536223b733a33323a223535636437643065663530653731396135316235323231373030643663656562223b733a33323a223539316565633038623837393861363266653638656634323666396135323633223b733a33323a223135623334663233353562353839353165656333356431363561376366323230223b733a33323a226630323333303931383132353466396638363935366335353532613162326639223b733a33323a223961646431643737366461336132666239323964396538363036366331303537223b733a33323a223931653063386531626161393663356162666162353136663736383137663764223b733a33323a223161303965643336343537613261633733313965663031336362306537396335223b733a33323a226234646131336565353736383865643437333830336133646433346433333734223b733a33323a223231353866613063393961366465306338326439376163376537393931383435223b733a33323a226261623932626366336162383132346331366334613165653163303563376136223b733a33323a223338616132326562316237306132333264666133393031343265623962613665223b733a33323a223665313139376130626563363236333733346530323135386136343331346439223b733a33323a226261356266306235666538653466383064373539393861336365303233636363223b733a33323a226633333265373337333432376337363035316136666163396262343865653538223b733a33323a226166313264653839656231313461326538626335613539363534313631613732223b733a33323a223538333034613733376163323739323532323337633531613061616432346337223b733a33323a226135306634326663346330386238643234393966653436626466333062643066223b733a33323a223162316134373036333461396133313262383337643434626235623534393362223b733a33323a223132383964366337666535643966663138396532333838626231363635306333223b733a33323a226337636365633830386363383432353830363738316363656330653932663736223b733a33323a223965393065386565663161663134323164373233383866323861346536303365223b733a33323a223736396332326633346433353938343333666161393536396538656431346332223b733a33323a226539333536656134333965356536343831666563653333333261336562363637223b733a33323a223138373233346339393763303438336538333339626639376237366232616337223b733a33323a223138316431383937323930363364303439396531323433613966356235616337223b733a33323a223630346232366163316661386239333932333831653437323766393031353966223b733a33323a223234663861366638343366366435663231653963363138303366373839313536223b733a33323a223932353935303362313362366539646232383561333236383137333262393637223b733a33323a226364316435616166303335366330346339623233353938383965623065336364223b733a33323a226663653939656630393266353335366336383434633130353534656233376335223b733a33323a223065633066353964633839666331666338373862363333663337393632333637223b733a33323a223762383539353065336364613132346563383738393838363236646139373138223b733a33323a226232373938333035653764313635396530383831636431613638386235303339223b733a33323a226634343465636232336335383535396530336562303438393963616535303535223b733a33323a223435303664653362656561353265633765303938393832353462303834383261223b733a33323a223235346165353330373262376335363634353636666463306134663433383732223b733a33323a223333343034623964636165356464363461363466323434363132323265373135223b733a33323a226533356335656533653033633437623530333163626339613366623364383437223b733a33323a226638363633616133363430656330323132316466646636376533343061306261223b733a33323a223132623930346133376134656230353066373432643737623161353532393333223b733a33323a223537353330663163326633336563663337393839656530333630346434313530223b733a33323a223836386666633533363333653964393135333665383066633134356130383537223b733a33323a223131326432353563303865616331623536303035336131653338386263346264223b733a33323a223730356666373366303166356638313039336136663163353563353266373834223b733a33323a223934363866613331633730633536396233373761383430663063636434626634223b733a33323a223264313539653663396333316536633539303539303432396338353766373262223b733a33323a223635303839666265393864343133343134383334343537393235393763313335223b733a33323a223862316565376266633836346561386332326434383738643730623865636336223b733a33323a226131346130643339386663303062616637393963393038643365366539353533223b733a33323a223536313236353939336261373031626161666566383664353665343863346134223b733a33323a223366633166393537353466386662343937366264346432303532363837303062223b733a33323a223236323064343133336263346635366665356534643864633137383262386133223b733a33323a226139613839663763323739636466346434343531336164366335623232633335223b733a33323a223737383861636434643639313833616335346533313430316566376438396330223b733a33323a223431646266363632363131613539363238393461343338626437363236373632223b733a33323a223563646164366361616136303265383532636562623961326431336663303534223b733a33323a223234306138616239333539316630666461656232323865613738376463623130223b733a33323a223534313831373835623662393230613665313865663563633561663564336566223b733a33323a223038373332336133356266333238313739633965626562646236653835333033223b733a33323a226136656234653035633732306535316337626332633534636530306537613666223b733a33323a226537643231613135333838643136613532336662653236373531613130373962223b733a33323a223532366530636561316261623631353333363366636464633162316162353039223b733a33323a223666353866346136653438656465616261373966343134303466343837623839223b733a33323a226436666133656131636361663761316538633338356166383131346666333334223b733a33323a223831366439316362373563313130616339623663303431663538323637643064223b733a33323a223736646565333132363630383530353739366166626230316438643364623764223b733a33323a226339653832343738373534633734626234393936303537323661346165653561223b733a33323a223133336639623631383834356662663436353336333338343736386336326634223b733a33323a223961373161346230653230323465386264373031386361656533656335663136223b733a33323a223637666630386630636262356264333239633662336566316439666234383539223b733a33323a223431383733386266353539653766616665616565646636376434316231303665223b733a33323a223537333830353066393439653539313466633263656531313031633632343535223b733a33323a223463346532653862623066323161303833346631623835353530346438363036223b733a33323a226136643863666433336566643935376539393465653535643632396237346137223b733a33323a226432626535323461633761656266616532633766336230353437346262613730223b733a33323a223532393461343836353862633033316263386263376439663135343535663664223b733a33323a223065356131636639653762616239336333613038386235303563613737626631223b733a33323a223933323533333264366563376633326430343164393138656338373766383864223b733a33323a223030636365323033646662386634373738313166373837356230613132643136223b733a33323a223236313161363863353633626639646633663237363338333930376130323838223b733a33323a226438346337623035323065336564643731396636383134656434613462346535223b733a33323a223965353431366230336633363532353834633534623539613839313431373465223b733a33323a223866613338633039616232366232633438333034636538633466333063646436223b733a33323a223131356164313835633365313338363234396461386437396137623336303562223b733a33323a223865643935383035366332623730363538653930323963643935313538636561223b7d733a343a2268617368223b733a36353a2238656439353830353663326237303635386539303239636439353135386365612d3131356164313835633365313338363234396461386437396137623336303562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d7d, 1579518769),
('f5c53aaea9548bebda99ced61a8245f9', 0x5f5f5a467c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313537393238303337392e3932353638353b733a363a225f56414c4944223b613a313a7b733a32353a225a656e645c53657373696f6e5c56616c696461746f725c4964223b733a33323a226635633533616165613935343862656264613939636564363161383234356639223b7d7d, 1579280380);

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
('administrator_email', '\"dave@axismaps.com\"'),
('cleanurl_case_insensitive', 'false'),
('cleanurl_display_admin_show_identifier', 'true'),
('cleanurl_identifier_prefix', '\"document:\"'),
('cleanurl_identifier_property', '10'),
('cleanurl_identifier_unspace', 'false'),
('cleanurl_item_allowed', '[\"generic\",\"item_set\"]'),
('cleanurl_item_default', '\"generic\"'),
('cleanurl_item_generic', '\"document\\/\"'),
('cleanurl_item_set_generic', '\"\"'),
('cleanurl_item_set_regex', '\"\"'),
('cleanurl_main_path', '\"\"'),
('cleanurl_media_allowed', '[\"generic\",\"item_set_item\"]'),
('cleanurl_media_default', '\"generic\"'),
('cleanurl_media_generic', '\"medium\\/\"'),
('cleanurl_use_admin', 'true'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('iiifserver_image_creator', '\"Auto\"'),
('iiifserver_image_max_size', '10000000'),
('iiifserver_image_tile_dir', '\"tile\"'),
('iiifserver_image_tile_type', '\"deepzoom\"'),
('iiifserver_manifest_attribution_default', '\"Provided by Example Organization\"'),
('iiifserver_manifest_attribution_property', '\"\"'),
('iiifserver_manifest_description_property', '\"dcterms:bibliographicCitation\"'),
('iiifserver_manifest_force_url_from', '\"\"'),
('iiifserver_manifest_force_url_to', '\"\"'),
('iiifserver_manifest_html_descriptive', 'true'),
('iiifserver_manifest_license_default', '\"http:\\/\\/www.example.org\\/license.html\"'),
('iiifserver_manifest_license_property', '\"dcterms:license\"'),
('iiifserver_manifest_logo_default', '\"\"'),
('iiifserver_manifest_properties_collection', '[]'),
('iiifserver_manifest_properties_item', '[]'),
('iiifserver_manifest_properties_media', '[]'),
('iiifserver_manifest_service_iiifsearch', '\"\"'),
('installation_title', '\"SituatedViews\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"UTC\"'),
('version', '\"2.0.2\"'),
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
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'dave@axismaps.com', 'David Heyman', '2020-01-02 22:22:01', '2020-01-02 22:22:01', '$2y$10$CA6T9cwIHX/2zeAK9lyoNePoYYjzd3lnX2zsGY.DM3aQ17jeKwoFC', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `custom_vocab`
--
ALTER TABLE `custom_vocab`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8533D2A5EA750E8` (`label`),
  ADD KEY `IDX_8533D2A5960278D7` (`item_set_id`),
  ADD KEY `IDX_8533D2A57E3C61F9` (`owner_id`);

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
-- AUTO_INCREMENT for table `custom_vocab`
--
ALTER TABLE `custom_vocab`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping`
--
ALTER TABLE `mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapping_marker`
--
ALTER TABLE `mapping_marker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `custom_vocab`
--
ALTER TABLE `custom_vocab`
  ADD CONSTRAINT `FK_8533D2A57E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8533D2A5960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE SET NULL;

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

