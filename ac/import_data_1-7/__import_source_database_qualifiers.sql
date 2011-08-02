-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2011 at 01:13 PM
-- Server version: 5.5.9
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `base_scheme_2011_20`
--

-- --------------------------------------------------------

--
-- Table structure for table `__import_source_database_qualifiers`
--

CREATE TABLE `__import_source_database_qualifiers` (
  `source_database_name` varchar(255) NOT NULL,
  `coverage` varchar(255) NOT NULL,
  `completeness` int(3) NOT NULL,
  `confidence` int(2) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `__import_source_database_qualifiers`
--

INSERT INTO `__import_source_database_qualifiers` VALUES('3i Cicadellinae', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('3i Typhlocybinae', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('AFD (Pulmonata)', '', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('AlgaeBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('AnnonBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('AphidSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('BIOS', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('BlattodeaSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Brassicaceae', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('CCW', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ChiloBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('CIPA', 'Regional (N & S Americas)', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Conifer Database', 'Global', 100, 5, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('COOL', 'Global', 94, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('CunaxidBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Dothideomycetes', 'Global', 18, 3, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Droseraceae Database', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ELPT', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('EmbiopteraSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ETI WBD (Euphausiacea)', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('FishBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('FLOW', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('FWCrabs', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('GCC', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('GloBIS (GART)', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Glomeromycota', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Hexacorals', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ICTV_MSL', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ILDIS', 'Global', 98, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('IOPI-GPC', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ITIS', '', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ITIS Bees', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('LDL Neuropterida', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('LecyPages', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('LepIndex', 'Global', 0, 1, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('LHD', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('LIAS', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('MantodeaSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('MBB', 'Global', 35, 5, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('MOST', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('MOWD', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Nomen.eumycetozoa.com', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('NZIB', 'Regional (New Zealand)', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Odonata', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('OlogamasidBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('OrthopteraSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Parhost', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('PhasmidaSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Phyllachorales', 'Global', 98, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('PhytoseiidBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('PlecopteraSF', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Psyllist', 'Global', 80, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('RhodacaridBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Rhytismatales', 'Global', 95, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('RJB Geranium', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Rotifera', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Saccharomycetes', 'Global', 95, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('SalticidDB', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ScaleNet', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Scarabs', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Solanaceae Source', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Species 2000 Common Names', '', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Species Fungorum', 'Global', 46, 2, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('SpidCat', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('SpmWeb', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('SysMyr', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Systema Dipterorum', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Taxapad Ichneumonoidea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('TenuipalpidBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('TicksBase', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('TIGR Reptiles', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Tineidae NHM', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('TITAN', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Trichomycetes', 'Global', 98, 4, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('UCD', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('URMO', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WCSP', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('World Gracillariidae', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Asteroidea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Bochusacea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Brachiopoda & Phoronida', 'Global', 100, 5, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Brachypoda', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Bryozoa', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Cumacea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Isopoda', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Mystacocarida', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Nemertea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Oligochaeta', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Ophiuroidea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Polychaeta', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Porifera', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Proseriata & Kalyptorhynchia', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Remipedia', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Tantulocarida', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Thermosbaenacea', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WoRMS Xenoturbellida', 'Global', 100, 5, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('WTaxa', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Xylariaceae', 'Global', 28, 3, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('ZOBODAT (Vespoidea)', 'Global', 0, 0, '0000-00-00 00:00:00');
INSERT INTO `__import_source_database_qualifiers` VALUES('Zygomycetes', 'Global', 98, 4, '0000-00-00 00:00:00');
