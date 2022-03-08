-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 08 mrt 2022 om 14:01
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
-- Database: `lesdb`
--
CREATE DATABASE IF NOT EXISTS `lesdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lesdb`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `functies`
--

DROP TABLE IF EXISTS `functies`;
CREATE TABLE `functies` (
  `ftienaam` char(20) NOT NULL,
  `minsal` int(11) DEFAULT NULL,
  `maxsal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `functies`
--

INSERT INTO `functies` (`ftienaam`, `minsal`, `maxsal`) VALUES
('Analist', 45000, 60000),
('DBA', 65000, 85000),
('Directeur', 100000, 140000),
('Lesgever', 55000, 80000),
('Onderdirecteur', 75000, 100000),
('Programmeur', 32000, 44000),
('Technicus', 30000, 37000),
('Vertegenwoordiger', 30000, 40000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vervangingen`
--

DROP TABLE IF EXISTS `vervangingen`;
CREATE TABLE `vervangingen` (
  `wnr` int(11) NOT NULL,
  `vervangernr` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `vervangingen`
--

INSERT INTO `vervangingen` (`wnr`, `vervangernr`) VALUES
(1, 2),
(3, 6),
(4, 5),
(5, 4),
(6, 7),
(7, 6),
(8, 9),
(8, 10),
(9, 10),
(10, 9),
(14, 11),
(16, 17),
(17, 16),
(18, 19),
(19, 18),
(20, 15);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vestigingen`
--

DROP TABLE IF EXISTS `vestigingen`;
CREATE TABLE `vestigingen` (
  `vesnaam` char(20) NOT NULL,
  `branche` char(20) DEFAULT NULL,
  `plaats` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `vestigingen`
--

INSERT INTO `vestigingen` (`vesnaam`, `branche`, `plaats`) VALUES
('BrugIT', 'Opleiding', 'Brugge'),
('Computerland', 'Verkoop', 'Brussel'),
('Leasing', 'Verhuur', 'Antwerpen'),
('Paradise', 'Verkoop', 'Gent'),
('Technica', 'Verkoop', 'Antwerpen'),
('Training', 'Opleiding', 'Antwerpen');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `werknemers`
--

DROP TABLE IF EXISTS `werknemers`;
CREATE TABLE `werknemers` (
  `wnr` int(11) NOT NULL,
  `wnaam` char(20) DEFAULT NULL,
  `afdeling` char(2) DEFAULT NULL,
  `ftienaam` char(20) DEFAULT NULL,
  `salaris` int(11) DEFAULT NULL,
  `vesnaam` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `werknemers`
--

INSERT INTO `werknemers` (`wnr`, `wnaam`, `afdeling`, `ftienaam`, `salaris`, `vesnaam`) VALUES
(1, 'Buylaert', 'B3', 'Vertegenwoordiger', 40000, 'Computerland'),
(2, 'Vervekke', 'B3', 'Vertegenwoordiger', 42000, 'Computerland'),
(3, 'Janssens', 'B1', 'Directeur', 100000, 'Computerland'),
(4, 'Lievens', 'B2', 'Analist', 55000, 'Computerland'),
(5, 'Lutenberg', 'B2', 'Analist', 60000, 'Computerland'),
(6, 'Jens', 'A1', 'Directeur', 150000, 'Technica'),
(7, 'Timan', 'A1', 'Onderdirecteur', 120000, 'Technica'),
(8, 'Imbrecht', 'A2', 'Programmeur', 35000, 'Technica'),
(9, 'Pieters', 'A2', 'Analist', 43000, 'Technica'),
(10, 'Peeters', 'A2', 'Analist', 50000, 'Technica'),
(11, 'Mansaert', 'A2', 'DBA', 70000, 'Technica'),
(12, 'Lutenberg', 'G1', 'Onderdirecteur', 85000, 'Paradise'),
(13, 'Klerk', 'G3', 'Vertegenwoordiger', 28000, 'Paradise'),
(14, 'Konings', 'G2', 'Analist', 45000, 'Paradise'),
(15, 'Dingens', 'A1', 'Directeur', 80000, 'Training'),
(16, 'Van Loo', 'A4', 'Lesgever', 81000, 'Training'),
(17, 'Van Snit', 'A4', 'Lesgever', 60000, 'Training'),
(18, 'Van Meer', 'A3', 'Technicus', 43000, 'Leasing'),
(19, 'Meesen', 'A3', 'Technicus', 37000, 'Leasing'),
(20, 'Delmot', 'A1', 'Onderdirecteur', 83000, 'Leasing');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `functies`
--
ALTER TABLE `functies`
  ADD PRIMARY KEY (`ftienaam`);

--
-- Indexen voor tabel `vervangingen`
--
ALTER TABLE `vervangingen`
  ADD PRIMARY KEY (`wnr`,`vervangernr`),
  ADD KEY `fk2_vervangingen` (`vervangernr`);

--
-- Indexen voor tabel `vestigingen`
--
ALTER TABLE `vestigingen`
  ADD PRIMARY KEY (`vesnaam`);

--
-- Indexen voor tabel `werknemers`
--
ALTER TABLE `werknemers`
  ADD PRIMARY KEY (`wnr`),
  ADD KEY `fk1_werknemers` (`vesnaam`),
  ADD KEY `fk2_werknemers` (`ftienaam`);

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `vervangingen`
--
ALTER TABLE `vervangingen`
  ADD CONSTRAINT `fk1_vervangingen` FOREIGN KEY (`wnr`) REFERENCES `werknemers` (`wnr`),
  ADD CONSTRAINT `fk2_vervangingen` FOREIGN KEY (`vervangernr`) REFERENCES `werknemers` (`wnr`);

--
-- Beperkingen voor tabel `werknemers`
--
ALTER TABLE `werknemers`
  ADD CONSTRAINT `fk1_werknemers` FOREIGN KEY (`vesnaam`) REFERENCES `vestigingen` (`vesnaam`),
  ADD CONSTRAINT `fk2_werknemers` FOREIGN KEY (`ftienaam`) REFERENCES `functies` (`ftienaam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
