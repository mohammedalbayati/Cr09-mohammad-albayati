-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Feb 2018 um 10:05
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_mohammed_albayati_carrental`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addition`
--

CREATE TABLE `addition` (
  `addition_id` int(11) NOT NULL,
  `fk_return_location_id` int(11) DEFAULT NULL,
  `fatura` int(11) DEFAULT NULL,
  `credit_card` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `addition`
--

INSERT INTO `addition` (`addition_id`, `fk_return_location_id`, `fatura`, `credit_card`) VALUES
(1, NULL, 350, 21312312),
(2, NULL, 121, 321321);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `car_type` varchar(55) DEFAULT NULL,
  `car_model` year(4) DEFAULT NULL,
  `car_color` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_id`, `fk_reservation_id`, `car_type`, `car_model`, `car_color`) VALUES
(1, NULL, 'BMW', 2017, 'Red');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `credit_card` int(11) DEFAULT NULL,
  `username` varchar(55) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `credit_card`, `username`, `name`) VALUES
(0, 1321313, 'johndoe', 'John Doe'),
(2, 3333, 'mobayati', 'mohammed albayati'),
(3, 5454545, 'ali', 'Ali Bayati'),
(4, 32443, 'grn', 'Mr. Goran');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fatura` int(11) DEFAULT NULL,
  `tottal_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `fk_reservation_id`, `fatura`, `tottal_time`) VALUES
(1, NULL, 250, '2018-02-22 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_reservation_id` int(11) DEFAULT NULL,
  `fk_start_id` int(11) DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL,
  `adress` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `fk_reservation_id`, `fk_start_id`, `fk_return_id`, `adress`) VALUES
(1, NULL, NULL, NULL, 'Vorgartenstrasse'),
(2, NULL, NULL, NULL, 'Karlsplatz'),
(3, NULL, NULL, NULL, 'Meidlinger Haupstrasse'),
(4, NULL, NULL, NULL, 'Praterstern'),
(5, NULL, NULL, NULL, 'Simmiring');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_invoice_id` int(11) DEFAULT NULL,
  `fk_car_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_location`
--

CREATE TABLE `return_location` (
  `return_location_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_addition_id` int(11) DEFAULT NULL,
  `adress` varchar(55) DEFAULT NULL,
  `drop_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `return_location`
--

INSERT INTO `return_location` (`return_location_id`, `fk_location_id`, `fk_addition_id`, `adress`, `drop_time`) VALUES
(1, NULL, NULL, 'Wien', '2018-02-02 02:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `start_location`
--

CREATE TABLE `start_location` (
  `start_location_id` int(11) NOT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `adress` varchar(55) DEFAULT NULL,
  `pick_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `start_location`
--

INSERT INTO `start_location` (`start_location_id`, `fk_location_id`, `adress`, `pick_date`) VALUES
(1, NULL, 'Frankfurt', '2018-02-01 03:00:00'),
(2, NULL, 'Tirol', '2018-02-02 06:00:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `addition`
--
ALTER TABLE `addition`
  ADD PRIMARY KEY (`addition_id`),
  ADD KEY `fk_return_location_id` (`fk_return_location_id`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_reservation_id` (`fk_reservation_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD PRIMARY KEY (`return_location_id`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indizes für die Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD PRIMARY KEY (`start_location_id`),
  ADD KEY `location` (`fk_location_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `addition`
--
ALTER TABLE `addition`
  ADD CONSTRAINT `addition_ibfk_1` FOREIGN KEY (`fk_return_location_id`) REFERENCES `return_location` (`return_location_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_reservation_id`) REFERENCES `reservation` (`reservation_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `return_location`
--
ALTER TABLE `return_location`
  ADD CONSTRAINT `return_location_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `start_location`
--
ALTER TABLE `start_location`
  ADD CONSTRAINT `location` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
