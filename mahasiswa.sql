-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 10:41 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahasiswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `idMhs` varchar(12) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jKelamin` enum('L','P') DEFAULT NULL,
  `asalKota` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`idMhs`, `nama`, `jKelamin`, `asalKota`) VALUES
('200441100000', 'Bobbie', 'P', 'Acaraú'),
('200441100001', 'Alexio', 'L', 'Melíki'),
('200441100002', 'Ceil', 'P', 'Zainsk'),
('200441100003', 'Aharon', 'L', 'Dhaka'),
('200441100004', 'Harman', 'P', 'Muff'),
('200441100005', 'Jennilee', 'L', 'Voskop'),
('200441100006', 'Lewes', 'P', 'Pedrogão'),
('200441100007', 'Kalil', 'P', 'Šimanovci'),
('200441100008', 'Katerine', 'P', 'Mangkon Daja'),
('200441100009', 'Ree', 'L', 'Lugo'),
('200441100010', 'Garth', 'L', 'Jilong'),
('200441100011', 'Osmond', 'P', 'Evansville'),
('200441100012', 'Donny', 'L', 'Huacheng'),
('200441100013', 'Bay', 'L', 'Zhengji'),
('200441100014', 'Byron', 'L', 'Louisville'),
('200441100015', 'Codie', 'P', 'Tangzha'),
('200441100016', 'Nevins', 'L', 'Nanshe'),
('200441100017', 'Mareah', 'P', 'Anse Royale'),
('200441100018', 'Bernie', 'P', 'Ciakar'),
('200441100019', 'Tadeo', 'P', 'Fukuoka-shi');

-- --------------------------------------------------------

--
-- Table structure for table `minat`
--

CREATE TABLE `minat` (
  `id_minat` int(11) NOT NULL,
  `nama_minat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `minat`
--

INSERT INTO `minat` (`id_minat`, `nama_minat`) VALUES
(1, 'Frontend Developer'),
(2, 'Backend Developer'),
(3, 'Fullstack Developer'),
(4, 'Cloud Engineer'),
(5, 'DevOps Engineer'),
(6, 'Android Developer'),
(7, 'iOS Developer'),
(8, 'Desktop App Developer'),
(9, 'Multiplatform App Developer'),
(10, 'Data Engineer'),
(11, 'Machine Learning Engineer'),
(12, 'Data Analyst'),
(13, 'Data Scientist');

-- --------------------------------------------------------

--
-- Table structure for table `minat_mahasiswa`
--

CREATE TABLE `minat_mahasiswa` (
  `id` int(11) NOT NULL,
  `idMhs` varchar(12) NOT NULL,
  `id_minat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `minat_mahasiswa`
--

INSERT INTO `minat_mahasiswa` (`id`, `idMhs`, `id_minat`) VALUES
(1, '200441100000', 6),
(2, '200441100001', 4),
(3, '200441100002', 10),
(4, '200441100003', 7),
(5, '200441100004', 13),
(6, '200441100005', 11),
(7, '200441100006', 4),
(8, '200441100007', 2),
(9, '200441100008', 2),
(10, '200441100009', 3),
(11, '200441100010', 3),
(12, '200441100011', 9),
(13, '200441100012', 6),
(14, '200441100013', 6),
(15, '200441100014', 6),
(16, '200441100015', 4),
(17, '200441100016', 8),
(18, '200441100017', 1),
(19, '200441100018', 11),
(20, '200441100019', 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`idMhs`);

--
-- Indexes for table `minat`
--
ALTER TABLE `minat`
  ADD PRIMARY KEY (`id_minat`);

--
-- Indexes for table `minat_mahasiswa`
--
ALTER TABLE `minat_mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMhs` (`idMhs`),
  ADD KEY `id_minat` (`id_minat`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `minat`
--
ALTER TABLE `minat`
  MODIFY `id_minat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `minat_mahasiswa`
--
ALTER TABLE `minat_mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `minat_mahasiswa`
--
ALTER TABLE `minat_mahasiswa`
  ADD CONSTRAINT `minat_mahasiswa_ibfk_1` FOREIGN KEY (`idMhs`) REFERENCES `mahasiswa` (`idMhs`),
  ADD CONSTRAINT `minat_mahasiswa_ibfk_2` FOREIGN KEY (`id_minat`) REFERENCES `minat` (`id_minat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
