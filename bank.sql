-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2020 at 01:20 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounttable`
--

CREATE TABLE `accounttable` (
  `Id` int(11) NOT NULL,
  `Account_Number` varchar(15) NOT NULL,
  `pin` varchar(10) NOT NULL,
  `Account_Type` varchar(15) NOT NULL,
  `BCode` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Address` varchar(50) NOT NULL,
  `Aadhar` varchar(12) NOT NULL,
  `Balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounttable`
--

INSERT INTO `accounttable` (`Id`, `Account_Number`, `pin`, `Account_Type`, `BCode`, `Name`, `Gender`, `DOB`, `Address`, `Aadhar`, `Balance`) VALUES
(5, 'SBI00410001', '1234', 'Savings', 'SBI004', 'Sachin', 'M', '2020-12-26', 'Mangalore', '213243560026', 8500),
(6, 'SBI00410002', '6739', 'Savings', 'SBI004', 'Ram', 'M', '2012-12-01', 'Kaup Karnataka', '893514238024', 10000),
(7, 'SBI00210001', '7624', 'Demat', 'SBI003', 'John', 'M', '2000-09-03', 'Udupi', '489437862450', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `branchtable`
--

CREATE TABLE `branchtable` (
  `Id` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `BCode` varchar(15) NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `branchtable`
--

INSERT INTO `branchtable` (`Id`, `Name`, `BCode`, `Address`) VALUES
(1, 'SBI Udupi', 'SBI001', 'Udupi'),
(2, 'SBI Kaup', 'SBI002', 'Kaup'),
(3, 'SBI Padubidri', 'SBI003', 'Padubidri'),
(4, 'SBI Mangalore', 'SBI004', 'Mangalore'),
(5, 'SBI Bangalore', 'SBI005', 'Bangalore'),
(6, 'SBI Nitte', 'SBI006', 'Nitte');

-- --------------------------------------------------------

--
-- Table structure for table `servicetable`
--

CREATE TABLE `servicetable` (
  `Date` date NOT NULL,
  `Account_Num` varchar(15) DEFAULT NULL,
  `ServiceName` varchar(100) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `TransactionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicetable`
--

INSERT INTO `servicetable` (`Date`, `Account_Num`, `ServiceName`, `Description`, `Amount`, `TransactionId`) VALUES
('2020-12-01', 'SBI00410001', 'Mutual Fund ', 'Mutual Fund investment', 500, 7),
('2020-12-02', 'SBI00410002', 'Insurance', 'Life Insurance', 400, 8);

-- --------------------------------------------------------

--
-- Table structure for table `transactiontable`
--

CREATE TABLE `transactiontable` (
  `Id` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Account_Num` varchar(15) DEFAULT NULL,
  `Transaction_Type` varchar(15) DEFAULT NULL,
  `Amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactiontable`
--

INSERT INTO `transactiontable` (`Id`, `Date`, `Account_Num`, `Transaction_Type`, `Amount`) VALUES
(2, '2020-12-01', 'SBI00110001', 'Credit', 12000),
(3, '2020-12-09', 'SBI00110001', 'Debit', 2000),
(4, '2020-12-01', 'SBI00410001', 'Credit', 10000),
(5, '2020-12-26', 'SBI00410001', 'Debit', 200),
(6, '2020-12-01', 'SBI00410001', 'Debit', 400),
(7, '2020-12-01', 'SBI00410001', 'Debit', 500),
(8, '2020-12-02', 'SBI00410001', 'Debit', 400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounttable`
--
ALTER TABLE `accounttable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `branchtable`
--
ALTER TABLE `branchtable`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `servicetable`
--
ALTER TABLE `servicetable`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `par_ind` (`TransactionId`);

--
-- Indexes for table `transactiontable`
--
ALTER TABLE `transactiontable`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounttable`
--
ALTER TABLE `accounttable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `branchtable`
--
ALTER TABLE `branchtable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactiontable`
--
ALTER TABLE `transactiontable`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `servicetable`
--
ALTER TABLE `servicetable`
  ADD CONSTRAINT `fk_tranTable` FOREIGN KEY (`TransactionId`) REFERENCES `transactiontable` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
