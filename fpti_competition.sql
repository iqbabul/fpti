-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 10, 2022 at 08:36 AM
-- Server version: 10.2.44-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fpti_competition`
--

-- --------------------------------------------------------

--
-- Table structure for table `akses`
--

CREATE TABLE `akses` (
  `id_akses` int(11) NOT NULL,
  `nama_akses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akses`
--

INSERT INTO `akses` (`id_akses`, `nama_akses`) VALUES
(1, 'Pengawas'),
(2, 'Juri'),
(3, 'Manajer');

-- --------------------------------------------------------

--
-- Table structure for table `altet`
--

CREATE TABLE `altet` (
  `id_atlet` int(11) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `nama_atlet` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `kota_asal` varchar(50) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `usia` int(11) NOT NULL,
  `klub` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `kk` varchar(100) NOT NULL,
  `status` enum('0','1','2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `babak`
--

CREATE TABLE `babak` (
  `id_babak` int(11) NOT NULL,
  `nama_babak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `babak`
--

INSERT INTO `babak` (`id_babak`, `nama_babak`) VALUES
(1, 'Penyisihan'),
(2, 'Semifinal'),
(3, 'Final');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id_event`, `nama_event`, `status`) VALUES
(1, 'KEJURNAS XVIII 2022 - Pekalongan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kompetisi`
--

CREATE TABLE `kompetisi` (
  `id_kompetisi` int(11) NOT NULL,
  `id_acara` int(11) NOT NULL,
  `id_pengawas` int(11) NOT NULL,
  `id_juri` int(11) NOT NULL,
  `id_manajer` int(11) NOT NULL,
  `id_atlet` int(11) NOT NULL,
  `id_nomor` int(11) NOT NULL,
  `approve` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_approve`
--

CREATE TABLE `log_approve` (
  `id_log` int(11) NOT NULL,
  `id_juri` int(11) NOT NULL,
  `id_atlet` int(11) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log_login`
--

CREATE TABLE `log_login` (
  `id_log` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `os` varchar(100) NOT NULL,
  `browser` varchar(100) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nomor`
--

CREATE TABLE `nomor` (
  `id_nomor` int(11) NOT NULL,
  `nama_nomor` varchar(50) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nomor`
--

INSERT INTO `nomor` (`id_nomor`, `nama_nomor`, `status`) VALUES
(1, 'Lead Perorangan Pa', '1'),
(2, 'Lead Perorangan Pi', '1'),
(3, 'Lead Tim Pa', '1'),
(4, 'Lead Tim Pi', '1'),
(5, 'Speed WR Perorangan Pa', '1'),
(6, 'Speed WR Perorangan Pi', '1'),
(7, 'Speed WR Tim Pa', '1'),
(8, 'Speed WR Tim Pi', '1');

-- --------------------------------------------------------

--
-- Table structure for table `nomor_event`
--

CREATE TABLE `nomor_event` (
  `id` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_nomor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian`
--

CREATE TABLE `penilaian` (
  `id_nilai` int(11) NOT NULL,
  `id_kompetisi` int(11) NOT NULL,
  `id_babak` int(11) NOT NULL,
  `nilai1` int(11) NOT NULL,
  `nilai2` int(11) NOT NULL,
  `time1` time NOT NULL,
  `time2` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_akses` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_akses`, `username`, `password`, `fullname`, `status`) VALUES
(1, 1, 'triesno', '94fcdf75ee11b8814f10952cb4bacd0b', 'Triesno Agung', 1),
(2, 2, 'babul', '540668872b8499e3f448fbd95d90ff08', 'Muhammad Iqbal', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `altet`
--
ALTER TABLE `altet`
  ADD PRIMARY KEY (`id_atlet`);

--
-- Indexes for table `babak`
--
ALTER TABLE `babak`
  ADD PRIMARY KEY (`id_babak`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `kompetisi`
--
ALTER TABLE `kompetisi`
  ADD PRIMARY KEY (`id_kompetisi`);

--
-- Indexes for table `log_approve`
--
ALTER TABLE `log_approve`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_juri` (`id_juri`) USING BTREE,
  ADD KEY `id_atlet` (`id_atlet`);

--
-- Indexes for table `log_login`
--
ALTER TABLE `log_login`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `nomor`
--
ALTER TABLE `nomor`
  ADD PRIMARY KEY (`id_nomor`);

--
-- Indexes for table `nomor_event`
--
ALTER TABLE `nomor_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_nomor` (`id_nomor`);

--
-- Indexes for table `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_nilai`),
  ADD KEY `id_kompetisi` (`id_kompetisi`),
  ADD KEY `id_babak` (`id_babak`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_akses` (`id_akses`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akses`
--
ALTER TABLE `akses`
  MODIFY `id_akses` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `altet`
--
ALTER TABLE `altet`
  MODIFY `id_atlet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `babak`
--
ALTER TABLE `babak`
  MODIFY `id_babak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kompetisi`
--
ALTER TABLE `kompetisi`
  MODIFY `id_kompetisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_approve`
--
ALTER TABLE `log_approve`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_login`
--
ALTER TABLE `log_login`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nomor`
--
ALTER TABLE `nomor`
  MODIFY `id_nomor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `nomor_event`
--
ALTER TABLE `nomor_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
