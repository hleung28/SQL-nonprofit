-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 08:03 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inverseministries`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendee`
--

CREATE TABLE `attendee` (
  `AttendeeID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `EmailAddress` varchar(45) DEFAULT NULL,
  `CityOfResidence` varchar(45) DEFAULT NULL,
  `MemberStatus` tinyint(4) DEFAULT NULL,
  `Salary` float DEFAULT NULL,
  `DGID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendee`
--

INSERT INTO `attendee` (`AttendeeID`, `Name`, `DateOfBirth`, `PhoneNumber`, `EmailAddress`, `CityOfResidence`, `MemberStatus`, `Salary`, `DGID`) VALUES
(1, 'Jason Lee', '1985-05-28', '714-111-1111', 'jasonlee@gmail.com', 'La Habra', 1, NULL, 1),
(2, 'Jun Chung', '1993-10-05', '714-222-2222', 'jchung@gmail.com', 'La Habra', 1, NULL, 3),
(3, 'Patrick Cho', '1980-07-15', '909-123-1234', 'pcho@gmail.com', 'Diamond Bar', 1, 50000, 1),
(4, 'Joe Suh', '1982-11-02', '714-333-3333', 'jsuh@gmail.com', 'Fullerton', 0, NULL, NULL),
(5, 'DJ Lee', '1991-02-20', '909-777-7777', 'djlee@gmail.com', 'Diamond Bar', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `discipleshipgroup`
--

CREATE TABLE `discipleshipgroup` (
  `DGID` int(11) NOT NULL,
  `City` varchar(45) DEFAULT NULL,
  `MeetingDayOfWeek` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discipleshipgroup`
--

INSERT INTO `discipleshipgroup` (`DGID`, `City`, `MeetingDayOfWeek`) VALUES
(1, 'Diamond Bar', 'Thursday'),
(2, 'La Habra', 'Wednesday'),
(3, 'Brea', 'Tuesday');

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `EquipmentID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Cost` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipmentrental`
--

CREATE TABLE `equipmentrental` (
  `CheckoutDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `MinistryID` int(11) NOT NULL,
  `EquipmentID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `EventID` int(11) NOT NULL,
  `EventName` varchar(45) DEFAULT NULL,
  `EventLeader` varchar(45) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `EventBudget` float DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `EventType` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`EventID`, `EventName`, `EventLeader`, `StartDate`, `EndDate`, `EventBudget`, `Location`, `EventType`) VALUES
(1, 'BBQ Welcome Event', 'Patrick Cho', '2017-12-02', '2017-12-02', 300, 'Craig Regional Park', 'Outreach'),
(2, 'Diamond Bar DG', 'Jason Lee', '2017-11-30', '2017-11-30', NULL, 'Patricks House', 'DG Meeting'),
(3, 'Praise practice', 'Jason Lee', '2017-12-01', '2017-12-01', NULL, 'Main Sanctuary', 'Practice');

-- --------------------------------------------------------

--
-- Table structure for table `eventattendance`
--

CREATE TABLE `eventattendance` (
  `AttendanceType` varchar(45) DEFAULT NULL,
  `EventID` int(11) NOT NULL,
  `AttendeeID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventattendance`
--

INSERT INTO `eventattendance` (`AttendanceType`, `EventID`, `AttendeeID`) VALUES
(NULL, 1, 1),
(NULL, 1, 4),
(NULL, 2, 1),
(NULL, 2, 5),
(NULL, 3, 1),
(NULL, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `ExpenseID` int(11) NOT NULL,
  `ExpenseAmount` float DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Purpose` varchar(45) DEFAULT NULL,
  `AttendeeID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`ExpenseID`, `ExpenseAmount`, `Location`, `Purpose`, `AttendeeID`) VALUES
(1, 50, 'Albertsons', 'Retreat Snacks', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ministry`
--

CREATE TABLE `ministry` (
  `MinistryID` int(11) NOT NULL,
  `MinistryName` varchar(45) DEFAULT NULL,
  `MinistryLeader` varchar(45) DEFAULT NULL,
  `MinistryBudget` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ministry`
--

INSERT INTO `ministry` (`MinistryID`, `MinistryName`, `MinistryLeader`, `MinistryBudget`) VALUES
(1, 'Praise Team', 'Jason Lee', 500),
(2, 'Program Team', 'DJ Lee', 200);

-- --------------------------------------------------------

--
-- Table structure for table `ministryrole`
--

CREATE TABLE `ministryrole` (
  `Role` varchar(45) DEFAULT NULL,
  `AttendeeID` int(11) NOT NULL,
  `MinistryID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ministryrole`
--

INSERT INTO `ministryrole` (`Role`, `AttendeeID`, `MinistryID`) VALUES
('Leader', 1, 1),
('Guitarist', 2, 1),
('Leader', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tithe`
--

CREATE TABLE `tithe` (
  `TitheID` int(11) NOT NULL,
  `TitheDate` date DEFAULT NULL,
  `TitheAmount` float DEFAULT NULL,
  `TitheType` varchar(45) DEFAULT NULL,
  `AttendeeID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tithe`
--

INSERT INTO `tithe` (`TitheID`, `TitheDate`, `TitheAmount`, `TitheType`, `AttendeeID`) VALUES
(1, '2017-11-26', 300, 'Check', 5),
(2, '2017-11-26', 20, 'Cash', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendee`
--
ALTER TABLE `attendee`
  ADD PRIMARY KEY (`AttendeeID`),
  ADD KEY `DGID` (`DGID`);

--
-- Indexes for table `discipleshipgroup`
--
ALTER TABLE `discipleshipgroup`
  ADD PRIMARY KEY (`DGID`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentID`);

--
-- Indexes for table `equipmentrental`
--
ALTER TABLE `equipmentrental`
  ADD PRIMARY KEY (`MinistryID`,`EquipmentID`),
  ADD KEY `EquipmentID` (`EquipmentID`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventID`);

--
-- Indexes for table `eventattendance`
--
ALTER TABLE `eventattendance`
  ADD PRIMARY KEY (`EventID`,`AttendeeID`),
  ADD KEY `AttendeeID` (`AttendeeID`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`ExpenseID`),
  ADD KEY `AttendeeID` (`AttendeeID`);

--
-- Indexes for table `ministry`
--
ALTER TABLE `ministry`
  ADD PRIMARY KEY (`MinistryID`);

--
-- Indexes for table `ministryrole`
--
ALTER TABLE `ministryrole`
  ADD PRIMARY KEY (`AttendeeID`,`MinistryID`),
  ADD KEY `MinistryID` (`MinistryID`);

--
-- Indexes for table `tithe`
--
ALTER TABLE `tithe`
  ADD PRIMARY KEY (`TitheID`),
  ADD KEY `AttendeeID` (`AttendeeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
