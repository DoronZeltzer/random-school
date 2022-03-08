-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 08 mrt 2022 om 13:57
-- Serverversie: 10.4.18-MariaDB
-- PHP-versie: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lapdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikels`
--

DROP TABLE IF EXISTS `artikels`;
CREATE TABLE `artikels` (
  `anr` char(3) NOT NULL,
  `anaam` char(20) DEFAULT NULL,
  `kleur` char(20) DEFAULT NULL,
  `gewicht` int(11) DEFAULT NULL,
  `plaats` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `artikels`
--

INSERT INTO `artikels` (`anr`, `anaam`, `kleur`, `gewicht`, `plaats`) VALUES
('A1', 'Moer', 'Rood', 12, 'Brussel'),
('A2', 'Bout', 'Groen', 17, 'Antwerpen'),
('A3', 'Schroef', 'Blauw', 17, 'Leuven'),
('A4', 'Schroef', 'Rood', 14, 'Brussel'),
('A5', 'Nagel', 'Blauw', 12, 'Antwerpen'),
('A6', 'Plug', 'Rood', 19, 'Brussel');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveranciers`
--

DROP TABLE IF EXISTS `leveranciers`;
CREATE TABLE `leveranciers` (
  `lnr` char(3) NOT NULL,
  `lnaam` char(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `plaats` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `leveranciers`
--

INSERT INTO `leveranciers` (`lnr`, `lnaam`, `STATUS`, `plaats`) VALUES
('L1', 'Smith', 20, 'Brussel'),
('L2', 'Jones', 10, 'Antwerpen'),
('L3', 'Blake', 30, 'Antwerpen'),
('L4', 'Clark', 20, 'Brussel'),
('L5', 'Adams', 30, 'Gent');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leveringen`
--

DROP TABLE IF EXISTS `leveringen`;
CREATE TABLE `leveringen` (
  `lnr` char(3) NOT NULL,
  `anr` char(3) NOT NULL,
  `pnr` char(3) NOT NULL,
  `hoev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `leveringen`
--

INSERT INTO `leveringen` (`lnr`, `anr`, `pnr`, `hoev`) VALUES
('L1', 'A1', 'P1', 200),
('L1', 'A1', 'P4', 700),
('L2', 'A3', 'P1', 400),
('L2', 'A3', 'P2', 200),
('L2', 'A3', 'P3', 200),
('L2', 'A3', 'P4', 500),
('L2', 'A3', 'P5', 600),
('L2', 'A3', 'P6', 400),
('L2', 'A3', 'P7', 800),
('L2', 'A5', 'P2', 100),
('L3', 'A3', 'P1', 200),
('L3', 'A4', 'P2', 500),
('L4', 'A6', 'P3', 300),
('L4', 'A6', 'P7', 300),
('L5', 'A1', 'P4', 100),
('L5', 'A2', 'P2', 200),
('L5', 'A2', 'P4', 100),
('L5', 'A3', 'P4', 200),
('L5', 'A4', 'P4', 800),
('L5', 'A5', 'P4', 400),
('L5', 'A5', 'P5', 500),
('L5', 'A5', 'P7', 100),
('L5', 'A6', 'P2', 200),
('L5', 'A6', 'P4', 500);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projecten`
--

DROP TABLE IF EXISTS `projecten`;
CREATE TABLE `projecten` (
  `pnr` char(3) NOT NULL,
  `pnaam` char(20) DEFAULT NULL,
  `plaats` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `projecten`
--

INSERT INTO `projecten` (`pnr`, `pnaam`, `plaats`) VALUES
('P1', 'Sorter', 'Antwerpen'),
('P2', 'Display', 'Leuven'),
('P3', 'OCR', 'Gent'),
('P4', 'Console', 'Gent'),
('P5', 'RAID', 'Brussel'),
('P6', 'EDS', 'Namen'),
('P7', 'Tape', 'Brussel');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikels`
--
ALTER TABLE `artikels`
  ADD PRIMARY KEY (`anr`);

--
-- Indexen voor tabel `leveranciers`
--
ALTER TABLE `leveranciers`
  ADD PRIMARY KEY (`lnr`);

--
-- Indexen voor tabel `leveringen`
--
ALTER TABLE `leveringen`
  ADD PRIMARY KEY (`lnr`,`anr`,`pnr`),
  ADD KEY `fk2_leveringen` (`anr`),
  ADD KEY `fk3_leveringen` (`pnr`);

--
-- Indexen voor tabel `projecten`
--
ALTER TABLE `projecten`
  ADD PRIMARY KEY (`pnr`);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `leveringen`
--
ALTER TABLE `leveringen`
  ADD CONSTRAINT `fk1_leveringen` FOREIGN KEY (`lnr`) REFERENCES `leveranciers` (`lnr`),
  ADD CONSTRAINT `fk2_leveringen` FOREIGN KEY (`anr`) REFERENCES `artikels` (`anr`),
  ADD CONSTRAINT `fk3_leveringen` FOREIGN KEY (`pnr`) REFERENCES `projecten` (`pnr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
