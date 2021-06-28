-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2021 at 04:36 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_list_barang`
--

CREATE TABLE `tb_list_barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `catatanPenjual` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_list_barang`
--

INSERT INTO `tb_list_barang` (`id`, `nama`, `harga`, `qty`, `catatanPenjual`) VALUES
(10, 'Headset Gaming', 499990, 100, 'Headset Gaming terbaik di kelasnya'),
(12, 'Earphone Bluetooth', 99000, 200, 'harga murah, terjamin kualitasnya'),
(14, 'BLACKPINK The Album versi 1 - Signed Album', 700000, 10, 'Limited Edition!!'),
(16, 'BLACKPINK The Album versi 2 - Signed Album', 700000, 10, 'Limited Edition, segera beli!'),
(18, 'BLACKPINK The Album versi 3 - Signed Album', 700000, 5, 'Limited Edition, ayo beli!'),
(19, 'BLACKPINK The Album versi 4 - Signed Album', 700000, 5, 'Persediaan terbatas!');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian_barang`
--

CREATE TABLE `tb_pembelian_barang` (
  `id` int(11) NOT NULL,
  `pembeli` varchar(100) NOT NULL,
  `idBarang` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pembelian_barang`
--

INSERT INTO `tb_pembelian_barang` (`id`, `pembeli`, `idBarang`, `qty`, `created_at`) VALUES
(12, 'regita@undiksha.ac.id', 12, 1, '2021-06-27 12:26:16'),
(13, 'regita@undiksha.ac.id', 19, 1, '2021-06-27 00:28:27'),
(14, 'regita@undiksha.ac.id', 10, 1, '2021-06-27 08:39:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_list_barang`
--
ALTER TABLE `tb_list_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pembelian_barang`
--
ALTER TABLE `tb_pembelian_barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBarang` (`idBarang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_list_barang`
--
ALTER TABLE `tb_list_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_pembelian_barang`
--
ALTER TABLE `tb_pembelian_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_pembelian_barang`
--
ALTER TABLE `tb_pembelian_barang`
  ADD CONSTRAINT `tb_pembelian_barang_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `tb_list_barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
