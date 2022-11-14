-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 03:01 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kojo_cloth`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_agenda`
--

CREATE TABLE `tb_agenda` (
  `id_agenda` int(11) NOT NULL,
  `nama_agenda` varchar(100) NOT NULL,
  `tanggal_agenda` date NOT NULL,
  `tenggat_agenda` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_agenda`
--

INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES
(2, 'Webinar kojo', '2022-06-27', '2022-06-28', 'SMKN 4 Padalarang', '13:30', 'Pembahasan mengenai pengembangan bisnis', 0),
(3, 'Promosi ke polsub', '2022-06-28', '2022-06-28', 'Polsub', '14:00', 'Sesuai ke dengan kegiatan', 0),
(4, 'promosi di alun-alun', '2022-06-30', '2022-07-01', 'alun-alun', '13:00', 'Cfd', 0),
(6, 'Top', '2022-07-14', '2022-07-30', 'Top', '05:57', 'Floor', 0),
(7, 'Floor GBK', '2022-07-30', '2022-07-31', 'Go', '08:57', 'Go', 0),
(8, 'promo kaos panitia qurban', '2022-07-13', '2022-07-14', 'laman sosial media', '12:00', 'promosi untuk baraya yang ingin membuat kaos panitia qurban', 0),
(9, 'bebas', '2022-07-17', '2022-07-20', 'subang', '10:00', 'bebas', 0),
(10, 'promo kaos panitia qurban', '2022-07-22', '2022-07-23', 'laman sosial media', '09:38', 'promosi untuk baraya yang ingin membuat kaos panitia qurban', 0),
(11, 'promosi 17 agustus', '2022-07-29', '2022-08-01', 'laman sosial media', '20:00', 'lakukan konten mengenai hari kemerdekaan', 0),
(12, 'webinar kojo', '2022-08-04', '2022-08-05', 'Zoom Meeting', '08:00', 'langkah konkrit memulai bisnis', 17),
(14, 'promo kaos panitia qurban', '2022-07-28', '2022-07-29', 'laman sosial media', '08:30', 'promosi untuk baraya yang ingin membuat kaos panitia qurban', 4),
(15, 'webinar kojo', '2022-08-04', '2022-08-05', 'Zoom Meeting', '09:43', 'langkah konkrit memulai bisnis', 18),
(16, 'promosi pembuatan jaket', '2022-10-19', '2022-10-22', 'laman sosial media', '08:00', 'promosi perusahaan', 4),
(17, 'promosi', '2022-10-21', '2022-10-21', 'kampus polsub', '10:40', 'langkah konkrit memulai bisnis', 4);

-- --------------------------------------------------------

--
-- Table structure for table `tb_akun`
--

CREATE TABLE `tb_akun` (
  `id_akun` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_akun`
--

INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES
(1, 1, 'admin', '$2y$10$w/xLNGW1t4uT2myN/GpX/O/qFktpGYrOZspdVIqBkcL5aEfIb0IzS', 'Admin'),
(5, 4, 'malik', '$2y$10$EhuBwLui0K2aEbaZu8LzN./ovQPQfkOkpHA0PrKG8nASdijtkMdFu', 'Marketing'),
(6, 8, 'keuangan', '$2y$10$N7O.Irk8kIK3OOUpklLsEOpBfWQVmNeKYTTjhsxzWpWWBWbXCL7D2', 'Keuangan'),
(7, 9, 'purchase', '$2y$10$yhqIod5blD9Pzl/bIu.x8.pRp3SSo7PKrF2qu1Y4ipqYB4bV/IK5y', 'Purchase'),
(8, 10, 'produksi', '$2y$10$hebSQhYZbYYPCRCDImkzfuMEWNDkUaN8cJlZ3ADNo0FNES/4WvwBS', 'Kepala Produksi'),
(9, 11, 'k_marketing', '$2y$10$CMAAJtm5CCvnalCvjruSfeCJn/PktC2MOKJb22.mJRcTXlXIPPq0.', 'Kepala Marketing'),
(10, 13, 'ceo', '$2y$10$mnSdtsN.wV68jAxMyDWxNuoBd/5EQsbbI8aZbnM1OrfkQVjkybXFm', 'Owner'),
(13, 16, 'owner', '$2y$10$epYvJwbrSElOvEd0pL29.u9Mh9/lzOvbxMtNCzFGjUSsUBexAeo62', 'Owner'),
(14, 18, 'hendra', '$2y$10$nx0sJvKK9/ugOfhPkJz20.jyjmDiEJHuBKtT82isdLXGjjfBgj9lS', 'Marketing');

-- --------------------------------------------------------

--
-- Table structure for table `tb_bordir`
--

CREATE TABLE `tb_bordir` (
  `id_bordir` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_bordir` text,
  `catatan_bordir` text,
  `status_bordir` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bordir`
--

INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES
(1, 4, 1, '5533-15688-1-PB.pdf', 'tes bordir', 2, '2022-04-21 23:25:31'),
(2, 5, 1, '', '', 0, '2022-04-27 17:30:53'),
(3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32'),
(4, 8, 1, '', '', 2, '2022-06-17 13:33:33'),
(5, 9, 10, '', '', 2, '2022-06-17 14:59:09'),
(6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41'),
(7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(8, 7, 1, '', '', 3, '2022-07-12 23:50:49'),
(9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(10, 12, 1, '', '', 2, '2022-07-28 13:51:26'),
(11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(12, 14, 11, '', 'asd', 3, '2022-07-15 02:37:19'),
(13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(14, 17, 1, '', '', 4, '2022-07-16 19:52:06'),
(15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59'),
(17, 19, 1, '', '', 4, '2022-07-19 13:00:26'),
(18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(20, 22, 0, NULL, NULL, 0, '2022-07-19 12:48:56'),
(21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19'),
(38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(39, 41, 10, '', '', 2, '2022-07-26 19:11:02'),
(40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(41, 43, 10, '', '', 2, '2022-07-29 16:59:17'),
(42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(43, 45, 10, '', '', 2, '2022-07-29 09:35:18'),
(44, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(45, 47, 1, '', '', 2, '2022-08-03 12:55:12'),
(46, 48, 10, '', '', 2, '2022-08-04 08:41:50'),
(47, 49, 0, NULL, NULL, 0, '2022-08-09 17:13:06'),
(48, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_centroid_temp`
--

CREATE TABLE `tb_centroid_temp` (
  `id` int(11) NOT NULL,
  `iterasi` int(11) NOT NULL,
  `c1` varchar(50) NOT NULL,
  `c2` varchar(50) NOT NULL,
  `c3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_centroid_temp`
--

INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES
(1, 1, '0', '0', '1'),
(2, 1, '0', '1', '0'),
(3, 1, '0', '0', '1'),
(4, 1, '0', '0', '1'),
(5, 1, '0', '0', '1'),
(6, 1, '0', '1', '0'),
(7, 1, '0', '0', '1'),
(8, 1, '0', '0', '1'),
(9, 1, '0', '0', '1'),
(10, 1, '0', '0', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_cutting`
--

CREATE TABLE `tb_cutting` (
  `id_cutting` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_cutting` text,
  `catatan_cutting` text,
  `status_cutting` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_cutting`
--

INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES
(1, 4, 1, '3785-12590-1-PB.pdf', 'tes cutting', 4, '2022-04-22 23:20:30'),
(2, 5, 1, '', '', 0, '2022-04-27 17:30:47'),
(3, 6, 10, '', '', 0, '2022-06-22 20:01:04'),
(4, 8, 10, 'AFRAHJPG.jpg', 'segera', 4, '2022-06-17 13:26:07'),
(5, 9, 10, '', '', 4, '2022-06-17 14:57:45'),
(6, 10, 1, '', '', 0, '2022-07-02 01:41:27'),
(7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(8, 7, 1, '', '', 1, '2022-07-13 00:52:03'),
(9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(10, 12, 10, 'jaket_hoodie.PNG', 'segera lakukan pemotongan', 3, '2022-07-29 23:32:09'),
(11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(12, 14, 11, '', 'untuk proses ini masih dalam pengerjaan produk cutting', 1, '2022-07-15 02:32:29'),
(13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(14, 17, 1, '', '', 0, '2022-07-16 19:51:13'),
(15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59'),
(17, 19, 1, '', '', 4, '2022-07-19 13:00:21'),
(18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:12:42'),
(21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19'),
(38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(39, 41, 10, '', '', 4, '2022-07-27 20:07:50'),
(40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(41, 43, 10, '', '', 4, '2022-08-03 00:48:04'),
(42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(43, 45, 10, '', '', 4, '2022-07-29 09:34:59'),
(44, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(45, 47, 10, '', '', 4, '2022-08-08 19:23:34'),
(46, 48, 10, '', '', 4, '2022-08-09 08:26:40'),
(47, 49, 10, '', '', 1, '2022-08-09 22:05:56'),
(48, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_agenda`
--

CREATE TABLE `tb_detail_agenda` (
  `id_detail_agenda` int(11) NOT NULL,
  `id_agenda` int(11) NOT NULL,
  `foto_agenda` text NOT NULL,
  `tautan` text NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_agenda`
--

INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES
(1, 2, 'IMG_20220628_213625.jpg', 'bit.ly/webinarkojo1', 'Agenda dilakukan sesuai dengan yang ditentukan'),
(2, 2, 'IMG_20220628_2136251.jpg', 'bit.ly/webinarkojo1', 'Agenda dilakukan sesuai dengan yang ditentukan'),
(5, 6, '', 'https://kojo-cloth.elearningpolsub.com/riwayat-order-pelanggan', 'test'),
(6, 6, '706389.jpg', '', 'test2'),
(7, 10, 'WhatsApp_Image_2022-06-28_at_21_55_41.jpeg', 'https://www.instagram.com/p/CfBqzvnh4Sl/?igshid=YmMyMTA2M2Y=', 'kegiatan dilaksanakan sesuai dengan tema yang telah di buat'),
(8, 12, 'WhatsApp_Image_2022-06-28_at_21_41_12.jpeg', 'bit.ly/WebinarKojo1', 'kegiatan dilaksanakan sesuai dengan tema yang telah di buat'),
(9, 16, 'kemeja_kerja.PNG', 'https://www.instagram.com/p/CfBqzvnh4Sl/?igshid=YmMyMTA2M2Y=', 'kegiatan dilaksanakan sesuai dengan tema yang telah di buat');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_gaji`
--

CREATE TABLE `tb_detail_gaji` (
  `id_detail_gaji` int(11) NOT NULL,
  `id_gaji` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `gaji_pokok` double NOT NULL,
  `bonus` double NOT NULL,
  `kasbon` double NOT NULL,
  `total` double NOT NULL,
  `keterangan` text NOT NULL,
  `rekening_penerima` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_gaji`
--

INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`, `rekening_penerima`) VALUES
(15, 13, 4, 2000000, 120000, 0, 2120000, 'gaji', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_gaji_produksi`
--

CREATE TABLE `tb_detail_gaji_produksi` (
  `id_detail_gaji_produksi` int(11) NOT NULL,
  `id_gaji_produksi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `kasbon` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_gaji_produksi`
--

INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES
(45, 25, 5, 75000, 0, 75000),
(46, 25, 7, 12500, 0, 12500),
(47, 25, 19, 10000, 0, 10000),
(48, 25, 20, 35000, 0, 35000),
(49, 25, 21, 30000, 0, 30000),
(63, 30, 5, 105000, 20000, 85000),
(64, 30, 7, 12500, 0, 12500),
(65, 30, 19, 10000, 0, 10000),
(66, 30, 20, 35000, 0, 35000),
(67, 30, 21, 30000, 0, 30000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pengajuan_hpp`
--

CREATE TABLE `tb_detail_pengajuan_hpp` (
  `id_detail_pengajuan_hpp` int(11) NOT NULL,
  `id_pengajuan_hpp` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_detail_vendor` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `vendor` varchar(100) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_pengajuan_hpp`
--

INSERT INTO `tb_detail_pengajuan_hpp` (`id_detail_pengajuan_hpp`, `id_pengajuan_hpp`, `id_vendor`, `id_detail_vendor`, `nama_bahan`, `vendor`, `satuan`, `jumlah`, `harga`, `total`) VALUES
(6, 6, 0, 0, 'Kain  drill', 'PT. Zhiva', 'Meter', 57, 30000, 1710000),
(7, 6, 0, 0, 'Kancing Besi Premium', 'PT. Zhiva', 'Buah', 262, 100, 26200),
(8, 7, 0, 0, 'Drill', 'PT. Zahra', 'Meter', 60, 50000, 3000000),
(9, 7, 0, 0, 'Rib leher', 'PT. Zahra', 'Meter', 125, 5000, 625000),
(10, 7, 1, 1, 'Drill - Merah', 'Toko 1A Tamim', 'Meter', 20, 50000, 1000000),
(11, 8, 1, 1, 'Drill - Merah', 'Toko 1A Tamim', 'Meter', 59, 50000, 2950000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_vendor`
--

CREATE TABLE `tb_detail_vendor` (
  `id_detail_vendor` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_satuan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_vendor`
--

INSERT INTO `tb_detail_vendor` (`id_detail_vendor`, `id_vendor`, `nama_bahan`, `warna`, `satuan`, `harga_satuan`) VALUES
(1, 1, 'Drill', 'Merah', 'Meter', 50000),
(2, 1, 'Drill', 'Merah', 'Roll', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji`
--

CREATE TABLE `tb_gaji` (
  `id_gaji` int(11) NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_gaji`
--

INSERT INTO `tb_gaji` (`id_gaji`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES
(13, 2, '2022-07-31', 'gaji karyawan', 2120000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji_produksi`
--

CREATE TABLE `tb_gaji_produksi` (
  `id_gaji_produksi` int(11) NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `tanggal_pencairan` date NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_gaji_produksi`
--

INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `id_jenis_pengeluaran`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES
(30, 1, '2022-08-06', 172500, 'Gaji Karyawan Produksi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_centroid`
--

CREATE TABLE `tb_hasil_centroid` (
  `nomor` int(11) NOT NULL,
  `c1a` varchar(50) NOT NULL,
  `c1b` varchar(50) NOT NULL,
  `c1c` varchar(50) NOT NULL,
  `c1d` varchar(50) NOT NULL,
  `c1e` varchar(50) NOT NULL,
  `c2a` varchar(50) NOT NULL,
  `c2b` varchar(50) NOT NULL,
  `c2c` varchar(50) NOT NULL,
  `c2d` varchar(50) NOT NULL,
  `c2e` varchar(50) NOT NULL,
  `c3a` varchar(50) NOT NULL,
  `c3b` varchar(50) NOT NULL,
  `c3c` varchar(50) NOT NULL,
  `c3d` varchar(50) NOT NULL,
  `c3e` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_hasil_centroid`
--

INSERT INTO `tb_hasil_centroid` (`nomor`, `c1a`, `c1b`, `c1c`, `c1d`, `c1e`, `c2a`, `c2b`, `c2c`, `c2d`, `c2e`, `c3a`, `c3b`, `c3c`, `c3d`, `c3e`) VALUES
(1, '0', '0', '0', '0', '0', '0', '0', '0', '22.5', '0', '1.75', '0', '26.375', '0.25', '5.25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_hasil_klasterisasi`
--

CREATE TABLE `tb_hasil_klasterisasi` (
  `id_hasil_klasterisasi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `instansi` varchar(200) NOT NULL,
  `klaster` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jahit`
--

CREATE TABLE `tb_jahit` (
  `id_jahit` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_jahit` text,
  `catatan_jahit` text,
  `status_jahit` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jahit`
--

INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES
(1, 4, 1, '5533-15688-1-PB.pdf', 'tes jahit', 4, '2022-04-22 23:20:38'),
(2, 5, 1, '', '', 0, '2022-04-27 17:30:57'),
(3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32'),
(4, 8, 10, '', '', 4, '2022-06-17 13:31:39'),
(5, 9, 10, '', '', 4, '2022-06-17 15:05:01'),
(6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41'),
(7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(8, 7, 1, '', '', 4, '2022-07-12 23:50:58'),
(9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(10, 12, 1, 'jaket_hoodie.PNG', 'segera', 4, '2022-07-13 12:13:21'),
(11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(12, 14, 11, '', 'asd', 1, '2022-07-15 02:38:59'),
(13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(14, 17, 0, NULL, NULL, 0, '2022-07-15 04:53:05'),
(15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59'),
(17, 19, 1, '', '', 4, '2022-07-19 13:00:31'),
(18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:10'),
(21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19'),
(38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(39, 41, 10, '', '', 4, '2022-07-26 19:15:02'),
(40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47'),
(42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(43, 45, 10, '', '', 4, '2022-07-29 09:36:20'),
(44, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(45, 47, 10, '', '', 4, '2022-08-08 19:23:44'),
(46, 48, 10, '', '', 4, '2022-08-08 19:36:59'),
(47, 49, 1, '', '', 1, '2022-08-09 22:20:11'),
(48, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_pemasukan`
--

CREATE TABLE `tb_jenis_pemasukan` (
  `id_jenis_pemasukan` int(11) NOT NULL,
  `jenis_pemasukan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_pemasukan`
--

INSERT INTO `tb_jenis_pemasukan` (`id_jenis_pemasukan`, `jenis_pemasukan`) VALUES
(1, 'Pendapatan'),
(4, 'Modal Pribadi'),
(5, 'Investor');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_pengeluaran`
--

CREATE TABLE `tb_jenis_pengeluaran` (
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `jenis_pengeluaran` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_pengeluaran`
--

INSERT INTO `tb_jenis_pengeluaran` (`id_jenis_pengeluaran`, `jenis_pengeluaran`) VALUES
(1, 'HPP'),
(2, 'Beban Gaji'),
(3, 'Beban Lain-lain'),
(4, 'pengeluaran dadakan'),
(5, 'beban tenaga kerja langsung');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_produk`
--

CREATE TABLE `tb_jenis_produk` (
  `id_jenis_produk` int(11) NOT NULL,
  `jenis_produk` varchar(100) NOT NULL,
  `kebutuhan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_produk`
--

INSERT INTO `tb_jenis_produk` (`id_jenis_produk`, `jenis_produk`, `kebutuhan`) VALUES
(1, 'Kaos', 'kain,rib'),
(2, 'Jas', 'kain'),
(3, 'Kemeja', 'kain,kancing'),
(4, 'Jaket', 'kain'),
(5, 'Sweater', 'kain,kancing');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keuangan`
--

CREATE TABLE `tb_keuangan` (
  `id_keuangan` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_keuangan` text,
  `catatan_keuangan` text,
  `status_keuangan` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_keuangan`
--

INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES
(2, 4, 1, 'Laporan_Order_-_Ferdi(089123123123)_(1).pdf', 'cefat', 2, '2022-07-13 00:58:31'),
(3, 5, 1, '', '', 0, '2022-04-27 17:30:37'),
(4, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32'),
(5, 8, 1, '', '', 4, '2022-06-17 13:22:49'),
(6, 9, 0, NULL, NULL, 0, '2022-06-17 14:47:25'),
(7, 10, 8, '', 'udeh', 4, '2022-07-09 01:17:07'),
(8, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(9, 7, 1, '', '', 2, '2022-07-13 05:11:51'),
(10, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(11, 12, 8, 'jaket_hoodie.PNG', 'segara dikerjakan', 4, '2022-07-15 11:38:22'),
(12, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(13, 14, 11, 'contoh.jpg', 'produk sedang dikerjakan oleh team produksi', 1, '2022-07-15 02:23:37'),
(14, 15, 8, '', '', 3, '2022-07-15 07:05:46'),
(15, 17, 1, '', '', 3, '2022-07-16 14:37:34'),
(16, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(17, 18, 10, '', '', 4, '2022-07-18 16:58:20'),
(18, 19, 1, '', '', 4, '2022-07-19 13:00:10'),
(19, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(20, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(21, 22, 1, 'jaket_bomber.PNG', 'slesai', 4, '2022-07-19 13:11:44'),
(22, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(23, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(24, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(25, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(26, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(27, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(28, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(29, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(30, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(31, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(32, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(33, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(34, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(35, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(36, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(37, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(38, 39, 10, '', '', 4, '2022-07-28 14:19:49'),
(39, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(40, 41, 8, '', '', 4, '2022-07-27 20:09:00'),
(41, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(42, 43, 10, '', '', 4, '2022-07-29 16:57:18'),
(43, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(44, 45, 0, NULL, NULL, 0, '2022-07-29 08:53:01'),
(45, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(46, 47, 1, '', '', 4, '2022-08-03 12:51:37'),
(47, 48, 0, NULL, NULL, 0, '2022-08-04 08:28:38'),
(48, 49, 10, 'a_(2).png', 'DP 500.000', 4, '2022-08-09 17:13:53'),
(49, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kota`
--

CREATE TABLE `tb_kota` (
  `id_kota` int(4) NOT NULL,
  `nama_kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kota`
--

INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES
(1, 'Kabupaten Aceh Barat'),
(2, 'Kabupaten Aceh Barat Daya'),
(3, 'Kabupaten Aceh Besar'),
(4, 'Kabupaten Aceh Jaya'),
(5, 'Kabupaten Aceh Selatan'),
(6, 'Kabupaten Aceh Singkil'),
(7, 'Kabupaten Aceh Tamiang'),
(8, 'Kabupaten Aceh Tengah'),
(9, 'Kabupaten Aceh Tenggara'),
(10, 'Kabupaten Aceh Timur'),
(11, 'Kabupaten Aceh Utara'),
(12, 'Kabupaten Bener Meriah'),
(13, 'Kabupaten Bireuen'),
(14, 'Kabupaten Gayo Lues'),
(15, 'Kabupaten Nagan Raya'),
(16, 'Kabupaten Pidie'),
(17, 'Kabupaten Pidie Jaya'),
(18, 'Kabupaten Simeulue'),
(19, 'Kota Banda Aceh'),
(20, 'Kota Langsa'),
(21, 'Kota Lhokseumawe'),
(22, 'Kota Sabang'),
(23, 'Kota Subulussalam'),
(24, 'Kabupaten Asahan'),
(25, 'Kabupaten Batubara'),
(26, 'Kabupaten Dairi'),
(27, 'Kabupaten Deli Serdang'),
(28, 'Kabupaten Humbang Hasundutan'),
(29, 'Kabupaten Karo'),
(30, 'Kabupaten Labuhanbatu'),
(31, 'Kabupaten Labuhanbatu Selatan'),
(32, 'Kabupaten Labuhanbatu Utara'),
(33, 'Kabupaten Langkat'),
(34, 'Kabupaten Mandailing Natal'),
(35, 'Kabupaten Nias'),
(36, 'Kabupaten Nias Barat'),
(37, 'Kabupaten Nias Selatan'),
(38, 'Kabupaten Nias Utara'),
(39, 'Kabupaten Padang Lawas'),
(40, 'Kabupaten Padang Lawas Utara'),
(41, 'Kabupaten Pakpak Bharat'),
(42, 'Kabupaten Samosir'),
(43, 'Kabupaten Serdang Bedagai'),
(44, 'Kabupaten Simalungun'),
(45, 'Kabupaten Tapanuli Selatan'),
(46, 'Kabupaten Tapanuli Tengah'),
(47, 'Kabupaten Tapanuli Utara'),
(48, 'Kabupaten Toba Samosir'),
(49, 'Kota Binjai'),
(50, 'Kota Gunungsitoli'),
(51, 'Kota Medan'),
(52, 'Kota Padangsidempuan'),
(53, 'Kota Pematangsiantar'),
(54, 'Kota Sibolga'),
(55, 'Kota Tanjungbalai'),
(56, 'Kota Tebing Tinggi'),
(57, 'Kabupaten Agam'),
(58, 'Kabupaten Dharmasraya'),
(59, 'Kabupaten Kepulauan Mentawai'),
(60, 'Kabupaten Lima Puluh Kota'),
(61, 'Kabupaten Padang Pariaman'),
(62, 'Kabupaten Pasaman'),
(63, 'Kabupaten Pasaman Barat'),
(64, 'Kabupaten Pesisir Selatan'),
(65, 'Kabupaten Sijunjung'),
(66, 'Kabupaten Solok'),
(67, 'Kabupaten Solok Selatan'),
(68, 'Kabupaten Tanah Datar'),
(69, 'Kota Bukittinggi'),
(70, 'Kota Padang'),
(71, 'Kota Padangpanjang'),
(72, 'Kota Pariaman'),
(73, 'Kota Payakumbuh'),
(74, 'Kota Sawahlunto'),
(75, 'Kota Solok'),
(76, 'Kabupaten Bengkalis'),
(77, 'Kabupaten Indragiri Hilir'),
(78, 'Kabupaten Indragiri Hulu'),
(79, 'Kabupaten Kampar'),
(80, 'Kabupaten Kuantan Singingi'),
(81, 'Kabupaten Pelalawan'),
(82, 'Kabupaten Rokan Hilir'),
(83, 'Kabupaten Rokan Hulu'),
(84, 'Kabupaten Siak'),
(85, 'Kabupaten Kepulauan Meranti'),
(86, 'Kota Dumai'),
(87, 'Kota Pekanbaru'),
(88, 'Kabupaten Bintan'),
(89, 'Kabupaten Karimun'),
(90, 'Kabupaten Kepulauan Anambas'),
(91, 'Kabupaten Lingga'),
(92, 'Kabupaten Natuna'),
(93, 'Kota Batam'),
(94, 'Kota Tanjung Pinang'),
(95, 'Kabupaten Batanghari'),
(96, 'Kabupaten Bungo'),
(97, 'Kabupaten Kerinci'),
(98, 'Kabupaten Merangin'),
(99, 'Kabupaten Muaro Jambi'),
(100, 'Kabupaten Sarolangun'),
(101, 'Kabupaten Tanjung Jabung Barat'),
(102, 'Kabupaten Tanjung Jabung Timur'),
(103, 'Kabupaten Tebo'),
(104, 'Kota Jambi'),
(105, 'Kota Sungai Penuh'),
(106, 'Kabupaten Bengkulu Selatan'),
(107, 'Kabupaten Bengkulu Tengah'),
(108, 'Kabupaten Bengkulu Utara'),
(109, 'Kabupaten Kaur'),
(110, 'Kabupaten Kepahiang'),
(111, 'Kabupaten Lebong'),
(112, 'Kabupaten Mukomuko'),
(113, 'Kabupaten Rejang Lebong'),
(114, 'Kabupaten Seluma'),
(115, 'Kota Bengkulu'),
(116, 'Kabupaten Banyuasin'),
(117, 'Kabupaten Empat Lawang'),
(118, 'Kabupaten Lahat'),
(119, 'Kabupaten Muara Enim'),
(120, 'Kabupaten Musi Banyuasin'),
(121, 'Kabupaten Musi Rawas'),
(122, 'Kabupaten Ogan Ilir'),
(123, 'Kabupaten Ogan Komering Ilir'),
(124, 'Kabupaten Ogan Komering Ulu'),
(125, 'Kabupaten Ogan Komering Ulu Selatan'),
(126, 'Kabupaten Ogan Komering Ulu Timur'),
(127, 'Kota Lubuklinggau'),
(128, 'Kota Pagar Alam'),
(129, 'Kota Palembang'),
(130, 'Kota Prabumulih'),
(131, 'Kabupaten Bangka'),
(132, 'Kabupaten Bangka Barat'),
(133, 'Kabupaten Bangka Selatan'),
(134, 'Kabupaten Bangka Tengah'),
(135, 'Kabupaten Belitung'),
(136, 'Kabupaten Belitung Timur'),
(137, 'Kota Pangkal Pinang'),
(138, 'Kabupaten Lampung Barat'),
(139, 'Kabupaten Lampung Selatan'),
(140, 'Kabupaten Lampung Tengah'),
(141, 'Kabupaten Lampung Timur'),
(142, 'Kabupaten Lampung Utara'),
(143, 'Kabupaten Mesuji'),
(144, 'Kabupaten Pesawaran'),
(145, 'Kabupaten Pringsewu'),
(146, 'Kabupaten Tanggamus'),
(147, 'Kabupaten Tulang Bawang'),
(148, 'Kabupaten Tulang Bawang Barat'),
(149, 'Kabupaten Way Kanan'),
(150, 'Kota Bandar Lampung'),
(151, 'Kota Metro'),
(152, 'Kabupaten Tangerang'),
(153, 'Kabupaten Serang'),
(154, 'Kabupaten Lebak'),
(155, 'Kabupaten Pandeglang'),
(156, 'Kota Tangerang'),
(157, 'Kota Serang'),
(158, 'Kota Cilegon'),
(159, 'Kota Tangerang Selatan'),
(160, 'Kabupaten Bandung'),
(161, 'Kabupaten Bandung Barat'),
(162, 'Kabupaten Bekasi'),
(163, 'Kabupaten Bogor'),
(164, 'Kabupaten Ciamis'),
(165, 'Kabupaten Cianjur'),
(166, 'Kabupaten Cirebon'),
(167, 'Kabupaten Garut'),
(168, 'Kabupaten Indramayu'),
(169, 'Kabupaten Karawang'),
(170, 'Kabupaten Kuningan'),
(171, 'Kabupaten Majalengka'),
(172, 'Kabupaten Purwakarta'),
(173, 'Kabupaten Subang'),
(174, 'Kabupaten Sukabumi'),
(175, 'Kabupaten Sumedang'),
(176, 'Kabupaten Tasikmalaya'),
(177, 'Kota Bandung'),
(178, 'Kota Banjar'),
(179, 'Kota Bekasi'),
(180, 'Kota Bogor'),
(181, 'Kota Cimahi'),
(182, 'Kota Cirebon'),
(183, 'Kota Depok'),
(184, 'Kota Sukabumi'),
(185, 'Kota Tasikmalaya'),
(186, 'Kabupaten Administrasi Kepulauan Seribu'),
(187, 'Kota Administrasi Jakarta Barat'),
(188, 'Kota Administrasi Jakarta Pusat'),
(189, 'Kota Administrasi Jakarta Selatan'),
(190, 'Kota Administrasi Jakarta Timur'),
(191, 'Kota Administrasi Jakarta Utara'),
(192, 'Kabupaten Banjarnegara'),
(193, 'Kabupaten Banyumas'),
(194, 'Kabupaten Batang'),
(195, 'Kabupaten Blora'),
(196, 'Kabupaten Boyolali'),
(197, 'Kabupaten Brebes'),
(198, 'Kabupaten Cilacap'),
(199, 'Kabupaten Demak'),
(200, 'Kabupaten Grobogan'),
(201, 'Kabupaten Jepara'),
(202, 'Kabupaten Karanganyar'),
(203, 'Kabupaten Kebumen'),
(204, 'Kabupaten Kendal'),
(205, 'Kabupaten Klaten'),
(206, 'Kabupaten Kudus'),
(207, 'Kabupaten Magelang'),
(208, 'Kabupaten Pati'),
(209, 'Kabupaten Pekalongan'),
(210, 'Kabupaten Pemalang'),
(211, 'Kabupaten Purbalingga'),
(212, 'Kabupaten Purworejo'),
(213, 'Kabupaten Rembang'),
(214, 'Kabupaten Semarang'),
(215, 'Kabupaten Sragen'),
(216, 'Kabupaten Sukoharjo'),
(217, 'Kabupaten Tegal'),
(218, 'Kabupaten Temanggung'),
(219, 'Kabupaten Wonogiri'),
(220, 'Kabupaten Wonosobo'),
(221, 'Kota Magelang'),
(222, 'Kota Pekalongan'),
(223, 'Kota Salatiga'),
(224, 'Kota Semarang'),
(225, 'Kota Surakarta'),
(226, 'Kota Tegal'),
(227, 'Kabupaten Bangkalan'),
(228, 'Kabupaten Banyuwangi'),
(229, 'Kabupaten Blitar'),
(230, 'Kabupaten Bojonegoro'),
(231, 'Kabupaten Bondowoso'),
(232, 'Kabupaten Gresik'),
(233, 'Kabupaten Jember'),
(234, 'Kabupaten Jombang'),
(235, 'Kabupaten Kediri'),
(236, 'Kabupaten Lamongan'),
(237, 'Kabupaten Lumajang'),
(238, 'Kabupaten Madiun'),
(239, 'Kabupaten Magetan'),
(240, 'Kabupaten Malang'),
(241, 'Kabupaten Mojokerto'),
(242, 'Kabupaten Nganjuk'),
(243, 'Kabupaten Ngawi'),
(244, 'Kabupaten Pacitan'),
(245, 'Kabupaten Pamekasan'),
(246, 'Kabupaten Pasuruan'),
(247, 'Kabupaten Ponorogo'),
(248, 'Kabupaten Probolinggo'),
(249, 'Kabupaten Sampang'),
(250, 'Kabupaten Sidoarjo'),
(251, 'Kabupaten Situbondo'),
(252, 'Kabupaten Sumenep'),
(253, 'Kabupaten Trenggalek'),
(254, 'Kabupaten Tuban'),
(255, 'Kabupaten Tulungagung'),
(256, 'Kota Batu'),
(257, 'Kota Blitar'),
(258, 'Kota Kediri'),
(259, 'Kota Madiun'),
(260, 'Kota Malang'),
(261, 'Kota Mojokerto'),
(262, 'Kota Pasuruan'),
(263, 'Kota Probolinggo'),
(264, 'Kota Surabaya'),
(265, 'Kabupaten Bantul'),
(266, 'Kabupaten Gunung Kidul'),
(267, 'Kabupaten Kulon Progo'),
(268, 'Kabupaten Sleman'),
(269, 'Kota Yogyakarta'),
(270, 'Kabupaten Badung'),
(271, 'Kabupaten Bangli'),
(272, 'Kabupaten Buleleng'),
(273, 'Kabupaten Gianyar'),
(274, 'Kabupaten Jembrana'),
(275, 'Kabupaten Karangasem'),
(276, 'Kabupaten Klungkung'),
(277, 'Kabupaten Tabanan'),
(278, 'Kota Denpasar'),
(279, 'Kabupaten Bima'),
(280, 'Kabupaten Dompu'),
(281, 'Kabupaten Lombok Barat'),
(282, 'Kabupaten Lombok Tengah'),
(283, 'Kabupaten Lombok Timur'),
(284, 'Kabupaten Lombok Utara'),
(285, 'Kabupaten Sumbawa'),
(286, 'Kabupaten Sumbawa Barat'),
(287, 'Kota Bima'),
(288, 'Kota Mataram'),
(289, 'Kabupaten Alor'),
(290, 'Kabupaten Belu'),
(291, 'Kabupaten Ende'),
(292, 'Kabupaten Flores Timur'),
(293, 'Kabupaten Kupang'),
(294, 'Kabupaten Lembata'),
(295, 'Kabupaten Manggarai'),
(296, 'Kabupaten Manggarai Barat'),
(297, 'Kabupaten Manggarai Timur'),
(298, 'Kabupaten Ngada'),
(299, 'Kabupaten Nagekeo'),
(300, 'Kabupaten Rote Ndao'),
(301, 'Kabupaten Sabu Raijua'),
(302, 'Kabupaten Sikka'),
(303, 'Kabupaten Sumba Barat'),
(304, 'Kabupaten Sumba Barat Daya'),
(305, 'Kabupaten Sumba Tengah'),
(306, 'Kabupaten Sumba Timur'),
(307, 'Kabupaten Timor Tengah Selatan'),
(308, 'Kabupaten Timor Tengah Utara'),
(309, 'Kota Kupang'),
(310, 'Kabupaten Bengkayang'),
(311, 'Kabupaten Kapuas Hulu'),
(312, 'Kabupaten Kayong Utara'),
(313, 'Kabupaten Ketapang'),
(314, 'Kabupaten Kubu Raya'),
(315, 'Kabupaten Landak'),
(316, 'Kabupaten Melawi'),
(317, 'Kabupaten Pontianak'),
(318, 'Kabupaten Sambas'),
(319, 'Kabupaten Sanggau'),
(320, 'Kabupaten Sekadau'),
(321, 'Kabupaten Sintang'),
(322, 'Kota Pontianak'),
(323, 'Kota Singkawang'),
(324, 'Kabupaten Balangan'),
(325, 'Kabupaten Banjar'),
(326, 'Kabupaten Barito Kuala'),
(327, 'Kabupaten Hulu Sungai Selatan'),
(328, 'Kabupaten Hulu Sungai Tengah'),
(329, 'Kabupaten Hulu Sungai Utara'),
(330, 'Kabupaten Kotabaru'),
(331, 'Kabupaten Tabalong'),
(332, 'Kabupaten Tanah Bumbu'),
(333, 'Kabupaten Tanah Laut'),
(334, 'Kabupaten Tapin'),
(335, 'Kota Banjarbaru'),
(336, 'Kota Banjarmasin'),
(337, 'Kabupaten Barito Selatan'),
(338, 'Kabupaten Barito Timur'),
(339, 'Kabupaten Barito Utara'),
(340, 'Kabupaten Gunung Mas'),
(341, 'Kabupaten Kapuas'),
(342, 'Kabupaten Katingan'),
(343, 'Kabupaten Kotawaringin Barat'),
(344, 'Kabupaten Kotawaringin Timur'),
(345, 'Kabupaten Lamandau'),
(346, 'Kabupaten Murung Raya'),
(347, 'Kabupaten Pulang Pisau'),
(348, 'Kabupaten Sukamara'),
(349, 'Kabupaten Seruyan'),
(350, 'Kota Palangka Raya'),
(351, 'Kabupaten Berau'),
(352, 'Kabupaten Bulungan'),
(353, 'Kabupaten Kutai Barat'),
(354, 'Kabupaten Kutai Kartanegara'),
(355, 'Kabupaten Kutai Timur'),
(356, 'Kabupaten Malinau'),
(357, 'Kabupaten Nunukan'),
(358, 'Kabupaten Paser'),
(359, 'Kabupaten Penajam Paser Utara'),
(360, 'Kabupaten Tana Tidung'),
(361, 'Kota Balikpapan'),
(362, 'Kota Bontang'),
(363, 'Kota Samarinda'),
(364, 'Kota Tarakan'),
(365, 'Kabupaten Mahakam Ulu'),
(366, 'Kabupaten Boalemo'),
(367, 'Kabupaten Bone Bolango'),
(368, 'Kabupaten Gorontalo'),
(369, 'Kabupaten Gorontalo Utara'),
(370, 'Kabupaten Pohuwato'),
(371, 'Kota Gorontalo'),
(372, 'Kabupaten Bantaeng'),
(373, 'Kabupaten Barru'),
(374, 'Kabupaten Bone'),
(375, 'Kabupaten Bulukumba'),
(376, 'Kabupaten Enrekang'),
(377, 'Kabupaten Gowa'),
(378, 'Kabupaten Jeneponto'),
(379, 'Kabupaten Kepulauan Selayar'),
(380, 'Kabupaten Luwu'),
(381, 'Kabupaten Luwu Timur'),
(382, 'Kabupaten Luwu Utara'),
(383, 'Kabupaten Maros'),
(384, 'Kabupaten Pangkajene dan Kepulauan'),
(385, 'Kabupaten Pinrang'),
(386, 'Kabupaten Sidenreng Rappang'),
(387, 'Kabupaten Sinjai'),
(388, 'Kabupaten Soppeng'),
(389, 'Kabupaten Takalar'),
(390, 'Kabupaten Tana Toraja'),
(391, 'Kabupaten Toraja Utara'),
(392, 'Kabupaten Wajo'),
(393, 'Kota Makassar'),
(394, 'Kota Palopo'),
(395, 'Kota Parepare'),
(396, 'Kabupaten Bombana'),
(397, 'Kabupaten Buton'),
(398, 'Kabupaten Buton Utara'),
(399, 'Kabupaten Kolaka'),
(400, 'Kabupaten Kolaka Utara'),
(401, 'Kabupaten Konawe'),
(402, 'Kabupaten Konawe Selatan'),
(403, 'Kabupaten Konawe Utara'),
(404, 'Kabupaten Muna'),
(405, 'Kabupaten Wakatobi'),
(406, 'Kota Bau-Bau'),
(407, 'Kota Kendari'),
(408, 'Kabupaten Banggai'),
(409, 'Kabupaten Banggai Kepulauan'),
(410, 'Kabupaten Buol'),
(411, 'Kabupaten Donggala'),
(412, 'Kabupaten Morowali'),
(413, 'Kabupaten Parigi Moutong'),
(414, 'Kabupaten Poso'),
(415, 'Kabupaten Tojo Una-Una'),
(416, 'Kabupaten Toli-Toli'),
(417, 'Kabupaten Sigi'),
(418, 'Kota Palu'),
(419, 'Kabupaten Bolaang Mongondow'),
(420, 'Kabupaten Bolaang Mongondow Selatan'),
(421, 'Kabupaten Bolaang Mongondow Timur'),
(422, 'Kabupaten Bolaang Mongondow Utara'),
(423, 'Kabupaten Kepulauan Sangihe'),
(424, 'Kabupaten Kepulauan Siau Tagulandang Biaro'),
(425, 'Kabupaten Kepulauan Talaud'),
(426, 'Kabupaten Minahasa'),
(427, 'Kabupaten Minahasa Selatan'),
(428, 'Kabupaten Minahasa Tenggara'),
(429, 'Kabupaten Minahasa Utara'),
(430, 'Kota Bitung'),
(431, 'Kota Kotamobagu'),
(432, 'Kota Manado'),
(433, 'Kota Tomohon'),
(434, 'Kabupaten Majene'),
(435, 'Kabupaten Mamasa'),
(436, 'Kabupaten Mamuju'),
(437, 'Kabupaten Mamuju Utara'),
(438, 'Kabupaten Polewali Mandar'),
(439, 'Kabupaten Buru'),
(440, 'Kabupaten Buru Selatan'),
(441, 'Kabupaten Kepulauan Aru'),
(442, 'Kabupaten Maluku Barat Daya'),
(443, 'Kabupaten Maluku Tengah'),
(444, 'Kabupaten Maluku Tenggara'),
(445, 'Kabupaten Maluku Tenggara Barat'),
(446, 'Kabupaten Seram Bagian Barat'),
(447, 'Kabupaten Seram Bagian Timur'),
(448, 'Kota Ambon'),
(449, 'Kota Tual'),
(450, 'Kabupaten Halmahera Barat'),
(451, 'Kabupaten Halmahera Tengah'),
(452, 'Kabupaten Halmahera Utara'),
(453, 'Kabupaten Halmahera Selatan'),
(454, 'Kabupaten Kepulauan Sula'),
(455, 'Kabupaten Halmahera Timur'),
(456, 'Kabupaten Pulau Morotai'),
(457, 'Kota Ternate'),
(458, 'Kota Tidore Kepulauan'),
(459, 'Kabupaten Asmat'),
(460, 'Kabupaten Biak Numfor'),
(461, 'Kabupaten Boven Digoel'),
(462, 'Kabupaten Deiyai'),
(463, 'Kabupaten Dogiyai'),
(464, 'Kabupaten Intan Jaya'),
(465, 'Kabupaten Jayapura'),
(466, 'Kabupaten Jayawijaya'),
(467, 'Kabupaten Keerom'),
(468, 'Kabupaten Kepulauan Yapen'),
(469, 'Kabupaten Lanny Jaya'),
(470, 'Kabupaten Mamberamo Raya'),
(471, 'Kabupaten Mamberamo Tengah'),
(472, 'Kabupaten Mappi'),
(473, 'Kabupaten Merauke'),
(474, 'Kabupaten Mimika'),
(475, 'Kabupaten Nabire'),
(476, 'Kabupaten Nduga'),
(477, 'Kabupaten Paniai'),
(478, 'Kabupaten Pegunungan Bintang'),
(479, 'Kabupaten Puncak'),
(480, 'Kabupaten Puncak Jaya'),
(481, 'Kabupaten Sarmi'),
(482, 'Kabupaten Supiori'),
(483, 'Kabupaten Tolikara'),
(484, 'Kabupaten Waropen'),
(485, 'Kabupaten Yahukimo'),
(486, 'Kabupaten Yalimo'),
(487, 'Kota Jayapura'),
(488, 'Kabupaten Fakfak'),
(489, 'Kabupaten Kaimana'),
(490, 'Kabupaten Manokwari'),
(491, 'Kabupaten Maybrat'),
(492, 'Kabupaten Raja Ampat'),
(493, 'Kabupaten Sorong'),
(494, 'Kabupaten Sorong Selatan'),
(495, 'Kabupaten Tambrauw'),
(496, 'Kabupaten Teluk Bintuni'),
(497, 'Kabupaten Teluk Wondama'),
(498, 'Kota Sorong');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `tgl_order` date NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_ukuran_s` int(11) NOT NULL,
  `jumlah_ukuran_m` int(11) NOT NULL,
  `jumlah_ukuran_l` int(11) NOT NULL,
  `jumlah_ukuran_xl` int(11) NOT NULL,
  `jumlah_ukuran_xxl` int(11) NOT NULL,
  `jumlah_ukuran_s_p` int(11) NOT NULL,
  `jumlah_ukuran_m_p` int(11) NOT NULL,
  `jumlah_ukuran_l_p` int(11) NOT NULL,
  `jumlah_ukuran_xl_p` int(11) NOT NULL,
  `jumlah_ukuran_xxl_p` int(11) NOT NULL,
  `design_order` text,
  `catatan` text NOT NULL,
  `status_order` int(11) DEFAULT NULL,
  `progres` varchar(200) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `rate` int(1) DEFAULT NULL,
  `ulasan` text,
  `total_harga_bomlist` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `total_harga_bomlist`, `created_at`) VALUES
(12, '2022-07-01', 4, 8, 0, 15, 5, 4, 0, 0, 0, 0, 0, 0, 'jaket_hoodie.PNG', 'desain sudah sesuai', 3, 'Cutting - Ada Masalah', 4, 5, 'sangat baik', 0, '2022-07-13 12:04:14'),
(19, '2022-06-01', 5, 2, 5, 5, 5, 2, 0, 0, 0, 0, 0, 0, 'jaket_bomber.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 5, 'bahan baik dan bagus', 0, '2022-07-19 12:44:59'),
(20, '2022-06-02', 5, 7, 5, 5, 3, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 3, 'bahan sesuai, namun pada bagian gambar kurang jelas', 0, '2022-07-19 12:46:56'),
(21, '2022-06-03', 6, 7, 5, 5, 10, 8, 0, 0, 0, 0, 0, 0, 'kaos_polos1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:47:51'),
(22, '2022-06-04', 7, 2, 20, 20, 20, 20, 15, 0, 0, 0, 0, 0, 'jaket_versity.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:48:56'),
(23, '2022-06-06', 8, 6, 0, 10, 5, 0, 0, 0, 0, 0, 0, 0, 'kemeja_kerja.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 5, 'produk baik', 0, '2022-07-19 12:50:10'),
(24, '2022-06-07', 9, 6, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 'kemeja_kerja1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:51:18'),
(25, '2022-07-06', 10, 8, 0, 0, 15, 3, 0, 0, 0, 0, 0, 0, 'jaket_hoodie1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:52:33'),
(26, '2022-07-05', 11, 6, 15, 5, 5, 5, 0, 0, 0, 0, 0, 0, 'kemeja_kerja2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:53:49'),
(27, '2022-07-07', 12, 6, 20, 50, 50, 21, 0, 0, 0, 0, 0, 0, 'kemeja_kerja3.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:54:52'),
(28, '2022-06-09', 13, 2, 0, 20, 20, 52, 0, 0, 0, 0, 0, 0, 'jaket_coach.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:55:57'),
(29, '2022-07-07', 13, 7, 0, 0, 20, 10, 2, 0, 0, 0, 0, 0, 'kaos_polos2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 12:56:54'),
(30, '2022-07-08', 14, 5, 10, 2, 2, 0, 0, 0, 0, 0, 0, 0, 'jas_almamater.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 4, 'produk sesuai dengan bahan namun ada sedikit cacat', 0, '2022-07-19 12:58:04'),
(31, '2022-07-07', 14, 6, 0, 0, 5, 3, 0, 0, 0, 0, 0, 0, 'kemeja_kerja4.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:00:19'),
(32, '2022-07-08', 15, 6, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 'kemeja_kerja5.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:01:16'),
(33, '2022-07-08', 16, 6, 0, 0, 10, 2, 0, 0, 0, 0, 0, 0, 'kemeja_kerja6.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:03:59'),
(34, '2022-07-06', 17, 7, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos3.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:05:06'),
(35, '2022-06-09', 18, 6, 50, 50, 50, 50, 86, 0, 0, 0, 0, 0, 'kemeja_kerja7.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:07:16'),
(36, '2022-06-09', 19, 7, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 'kaos_polo.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:08:20'),
(37, '2022-06-10', 20, 8, 0, 5, 5, 10, 6, 0, 0, 0, 0, 0, 'jaket_hoodie2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, 0, '2022-07-19 13:09:24'),
(38, '2022-07-07', 5, 7, 0, 10, 3, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos4.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 4, 'bahan baik', 0, '2022-07-19 13:10:22'),
(43, '2022-07-29', 20, 11, 20, 15, 10, 5, 1, 0, 0, 0, 0, 0, 'kemejaaa.jpg', 'Pesanan segera dibuat', 1, 'Cutting - Selesai', 11, NULL, NULL, 0, '2022-07-29 07:08:47'),
(44, '2022-07-29', 6, 13, 10, 10, 5, 5, 3, 0, 0, 0, 0, 0, 'Desain-Baju-Kaos-Karang-Taruna.jpg', 'Ordeer segera diselesaikan', 1, NULL, 11, NULL, NULL, 0, '2022-07-29 08:33:38'),
(45, '2022-07-29', 4, 13, 10, 10, 10, 10, 5, 0, 0, 0, 0, 0, 'Desain-Baju-Kaos-Karang-Taruna1.jpg', 'segera diselesaikan', 4, 'Pengiriman - Selesai', 11, NULL, NULL, 0, '2022-07-29 08:53:01'),
(47, '2022-08-03', 6, 14, 5, 0, 0, 5, 10, 0, 10, 15, 0, 0, 'design_kaos_oblong1.jpg', 'segera diselesaikan', 0, 'Jahit - Selesai', 10, NULL, NULL, 0, '2022-08-03 12:35:20'),
(48, '2022-08-04', 9, 14, 10, 5, 15, 10, 5, 0, 0, 5, 5, 0, 'jaket_bomber_kulit.jpg', 'diselesaokan segera', 0, 'Cutting - Selesai', 10, NULL, NULL, 0, '2022-08-04 08:28:38'),
(49, '2022-08-13', 8, 13, 10, 10, 10, 0, 0, 0, 0, 0, 10, 10, '31.JPG', 'segera selesaikan', 0, 'Jahit - Sedang Dikerjakan', 10, NULL, NULL, 0, '2022-08-09 17:13:06'),
(53, '2022-10-19', 4, 7, 10, 1, 12, 14, 1, 0, 0, 0, 0, 0, 'kaos_polo1.PNG', 'desain sudah sesuai', 0, NULL, 4, NULL, NULL, 0, '2022-10-19 23:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `rekening_pegawai` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai`
--

INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `rekening_pegawai`, `foto`) VALUES
(1, '1234', 'administrator', 'Administrator', 'subangg', 'subang', '2022-03-01', 'Laki-laki', 3000000, '', 'user.png'),
(4, 'tess', 'M malik', 'Staff Marketing', 'Bandung', 'Bandung', '1999-06-16', 'Laki-laki', 5000000, '', 'WhatsApp_Image_2022-06-28_at_22_05_241.jpeg'),
(5, '123', 'Andi Maulana', 'Pegawai Produksi', 'tes', 'tes', '2022-04-21', 'Laki-laki', 0, '', 'aj_(2).jpeg'),
(6, '123', 'adi', 'Pegawai Produksi', 'bandung', 'bandung', '2022-04-22', 'Laki-laki', 0, '', 'aj_(2)1.jpeg'),
(7, '123', 'udin', 'Pegawai Produksi', 'bandung', 'bandung', '2022-12-31', 'Laki-laki', 0, '', 'aj_(2)2.jpeg'),
(8, '123', 'kepala Keuangan', 'Staff Keuangan', 'subang', 'subang', '2022-12-31', 'Laki-laki', 2000000, '', 'aj_(2)3.jpeg'),
(9, '123', 'Pegawai Purchase', 'Staff Purchase', 'subang', 'subang', '2022-12-31', 'Laki-laki', 0, '', 'aj_(2)4.jpeg'),
(10, '123', 'Kepala Produksi', 'Kepala Produksi', 'subangg', 'subang', '2022-12-31', 'Laki-laki', 0, '', 'Capture.JPG'),
(11, '123', 'Faizal nursodik', 'Kepala Marketing', 'bandung', 'bandung', '2022-12-31', 'Laki-laki', 0, '', 'WhatsApp_Image_2022-06-28_at_22_05_24.jpeg'),
(16, '24536576', 'CEO', 'CEO', 'bandung', 'bandung', '2022-07-15', 'Laki-laki', 0, '', '1.JPG'),
(18, '202020', 'hendra', 'staff marketing', 'Bandung', 'Bandung', '1998-08-20', 'Laki-laki', 0, '', 'WhatsApp_Image_2022-06-28_at_21_47_011.jpeg'),
(19, '1234567890', 'jajang', 'Pegawai Produksi', 'bandung', 'bandung', '2022-08-08', 'Laki-laki', 0, '', 'ih.png'),
(20, '1234567891', 'ucup', 'Pegawai Produksi', 'bandung', 'bandung', '2022-08-09', 'Laki-laki', 0, '', 'ih1.png'),
(21, '12345678902', 'asep', 'Pegawai Produksi', 'bandung', 'bandung', '2022-08-10', 'Laki-laki', 0, '', 'kemeja.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai_cutting`
--

CREATE TABLE `tb_pegawai_cutting` (
  `id_pegawai_cutting` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kasbon` int(11) NOT NULL,
  `tgl_cair` date NOT NULL,
  `pola_potongan` varchar(100) NOT NULL,
  `detail_ukuran` varchar(100) NOT NULL,
  `catatan_potongan` text NOT NULL,
  `created_at` datetime NOT NULL,
  `id_pengajuan_kasbon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai_cutting`
--

INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`, `id_pengajuan_kasbon`) VALUES
(18, 47, 5, 15, 5000, 0, '2022-08-06', 'Pola Kojo', 'L', 'segera diselesaikan', '2022-08-03 12:53:33', 0),
(28, 47, 6, 5, 3000, 0, '2022-08-13', 'Pola Kojo', 'S', 'segera selesaikan', '2022-08-08 19:17:30', 0),
(29, 47, 19, 10, 3000, 0, '2022-08-13', 'Pola Kojo', 'M', '', '2022-08-08 19:18:04', 0),
(30, 47, 20, 5, 3000, 0, '2022-08-06', 'Pola Kojo', 'XL', 'segera selesaikan', '2022-08-08 19:18:58', 0),
(31, 47, 20, 10, 3000, 0, '2022-08-13', 'Pola Kojo', 'XXL', 'segera selesaikan', '2022-08-08 19:19:35', 0),
(32, 48, 6, 10, 3000, 0, '2022-08-20', 'Pola Kojo', 'S', 'segera selesaikan', '2022-08-08 19:30:37', 0),
(33, 48, 7, 5, 3000, 0, '2022-08-20', 'Pola Kojo', 'M', 'segera selesaikan', '2022-08-08 19:31:09', 0),
(34, 48, 19, 20, 3000, 0, '2022-08-27', 'Pola Kojo', 'L', 'seger selesaikan', '2022-08-08 19:31:44', 0),
(35, 48, 19, 15, 3000, 0, '2022-08-27', 'Pola Kojo', 'XL', 'segera selesaikan', '2022-08-08 19:32:20', 0),
(36, 48, 20, 5, 3000, 0, '2022-08-27', 'Pola Kojo', 'XXL', 'segera selesaikan', '2022-08-08 19:32:49', 0),
(37, 49, 5, 10, 3000, 20000, '2022-08-06', 'Pola Kojo', 'S', 'selesaikan', '2022-08-09 22:05:45', 6),
(38, 49, 5, 10, 3000, 30000, '2022-08-13', 'Pola Kojo', 'M', '-', '2022-08-10 01:12:22', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai_jahit`
--

CREATE TABLE `tb_pegawai_jahit` (
  `id_pegawai_jahit` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kasbon` int(11) NOT NULL,
  `tgl_cair` date NOT NULL,
  `ukuran_pendek` int(11) NOT NULL,
  `ukuran_panjang` int(11) NOT NULL,
  `detail_ukuran` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `id_pengajuan_kasbon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai_jahit`
--

INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `detail_ukuran`, `created_at`, `id_pengajuan_kasbon`) VALUES
(14, 47, 6, 5, 2000, 0, '2022-08-13', 5, 0, 'S', '2022-08-08 19:20:39', 0),
(15, 47, 7, 10, 2000, 0, '2022-08-13', 0, 10, 'M', '2022-08-08 19:21:18', 0),
(16, 47, 21, 15, 2000, 0, '2022-08-06', 0, 15, 'L', '2022-08-08 19:21:59', 0),
(17, 47, 19, 5, 2000, 0, '2022-08-06', 5, 0, 'XL', '2022-08-08 19:22:28', 0),
(18, 47, 20, 10, 2000, 0, '2022-08-06', 10, 0, 'XXL', '2022-08-08 19:23:13', 0),
(19, 48, 7, 10, 2000, 0, '2022-08-20', 10, 0, 'S', '2022-08-08 19:34:01', 0),
(20, 48, 7, 5, 2000, 0, '2022-08-20', 5, 0, 'M', '2022-08-08 19:34:46', 0),
(21, 48, 7, 20, 2000, 0, '2022-08-27', 15, 5, 'L', '2022-08-08 19:35:37', 0),
(22, 48, 6, 15, 2000, 0, '2022-08-27', 10, 5, 'XL', '2022-08-08 19:36:13', 0),
(23, 48, 19, 5, 2000, 0, '2022-08-27', 5, 0, 'XXL', '2022-08-08 19:36:41', 0),
(24, 49, 5, 10, 2000, 0, '2022-08-20', 10, 0, 'S', '2022-08-09 22:22:18', 0),
(25, 49, 5, 10, 2000, 0, '2022-08-27', 0, 10, 'XXL', '2022-08-09 22:25:19', 0),
(26, 49, 6, 10, 2000, 10000, '2022-08-13', 10, 0, 'L', '2022-08-10 08:10:16', 8),
(27, 49, 5, 10, 2000, 10000, '2022-08-13', 0, 10, 'XL', '2022-08-10 11:10:50', 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai_qc`
--

CREATE TABLE `tb_pegawai_qc` (
  `id_pegawai_qc` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kasbon` int(11) NOT NULL,
  `tgl_cair` date NOT NULL,
  `ukuran_pendek` int(11) NOT NULL,
  `ukuran_panjang` int(11) NOT NULL,
  `detail_ukuran` varchar(10) NOT NULL,
  `keterangan` enum('Lolos','Tidak Lolos') NOT NULL,
  `catatan_revisi` text NOT NULL,
  `created_at` datetime NOT NULL,
  `id_pengajuan_kasbon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pegawai_qc`
--

INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `detail_ukuran`, `keterangan`, `catatan_revisi`, `created_at`, `id_pengajuan_kasbon`) VALUES
(9, 48, 19, 10, 2500, 0, '2022-08-04', 10, 0, 'L', 'Lolos', 'kirim', '2022-08-08 14:50:42', 0),
(10, 48, 21, 5, 2500, 0, '2022-08-13', 5, 0, 'S', 'Lolos', 'tidak ada', '2022-08-08 16:55:20', 0),
(12, 47, 7, 5, 2500, 0, '2022-08-06', 5, 0, 'XXL', 'Tidak Lolos', 'Defect Ganti', '2022-08-08 19:26:24', 0),
(13, 47, 19, 5, 2500, 0, '2022-08-13', 5, 0, 'XXL', 'Lolos', 'lolos 5', '2022-08-08 19:28:09', 0),
(14, 48, 19, 5, 2500, 0, '2022-08-20', 5, 0, 'XL', 'Tidak Lolos', 'revisi 5', '2022-08-08 19:38:20', 0),
(15, 48, 7, 5, 2500, 0, '2022-08-20', 5, 0, 'XL', 'Lolos', 'lolos 5', '2022-08-08 19:39:48', 0),
(16, 47, 7, 5, 2500, 0, '2022-08-13', 5, 0, 'XL', 'Lolos', 'lolos', '2022-08-09 22:26:30', 0),
(17, 47, 21, 5, 2500, 0, '2022-08-13', 5, 0, 'XXL', 'Lolos', 'lolos 5', '2022-08-09 22:27:44', 0),
(18, 47, 20, 5, 2500, 0, '2022-08-13', 5, 0, 'S', 'Lolos', 'lolos 5', '2022-08-09 22:29:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(200) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES
(4, 'Ivan', 'Laki-laki', '08992548197', 'Bandung', 177, 'Asbuj', 'ivan01', '$2y$10$yb122hmY03AYqQUjhFD.AusULmIDB/R0DRtk1dzrBIktA.8cWFoj6'),
(5, 'Eza Raka', 'Laki-laki', '0852120156206', 'taman sari', 177, 'hallyu project', 'ezaraka02', '$2y$10$jGoK/tS9weCw9wBb3DzBqO2rh9QJh6CAfOyFGnzsDZCYNIA5B4KCy'),
(6, 'Repan', 'Laki-laki', '085156548425', 'jakarta', 188, 'UPN jakarta', 'repan03', '$2y$10$dqBXcA8cK9pdDS9iVYd0N.3cZmC8HRXitKJEpXj.nD17sDeVP5ePe'),
(7, 'Fadia', 'Laki-laki', '085930089630', 'jatinangor', 173, 'HIMA Matematika UNPAD', 'fadia04', '$2y$10$jXb6ZwrCDIcomq1po5P.Te2HZpkACYBV6fyhahbVIwc1Mf/QcqUci'),
(8, 'Agnesa', 'Perempuan', '085524892274', 'bandung', 177, 'Radio Station Unpar', 'agnesa05', '$2y$10$se6MUyw7f3H9pmO/UJ5vTeVLmTlRsiuPETmzxEgSw.sC/oloMxeIy'),
(9, 'Iqbal Maulana', 'Perempuan', '0858724964296', 'jatinangor', 175, 'Pena Budaya FIB Unpad', 'iqbal06', '$2y$10$TxKlnNIfiQ8X4j1OduLc1e17LEwB8FIP1Jdc.wALiclUoDeMWFkIm'),
(10, 'Yandi', 'Laki-laki', '085624046978', 'majalengka', 171, 'Patriot desa majalengka', 'yandi07', '$2y$10$xHtcJKwd/RaNHyP1t8kp4.MKBl.QMvK0njk0rBevkXxVD1BeN/5Vy'),
(11, 'Ledy', 'Laki-laki', '082248914065', 'ambon', 448, 'Teknik sipil Politeknik negeri ambon', 'ledy08', '$2y$10$9drvA1thHXm0xIOG14tXbePB07fnGB5sNEM1F3Kpe1PLxBbCW1g12'),
(12, 'Hanisa', 'Perempuan', '089658142844', 'Bandung', 177, 'akuntansi UNISBA', 'hanisa09', '$2y$10$U5dIQy4sWmtgJ1i4fYNa9OUcWuYrxol4n.fNNUgZ/OgLJhXmV5Uke'),
(13, 'Dede Winda', 'Laki-laki', '081214140932', 'jatinangor', 175, 'Universitas Padjajaran', 'dede010', '$2y$10$S0Po42oePm9/2X14Zc9/qeRpT5kUAAdwknSTjYYilosgTPK2Ayqg6'),
(14, 'Adelresa', 'Perempuan', '082218273333', 'Bandung', 177, 'ITENAS', 'adelresa011', '$2y$10$O1Uk3q7UNqrC84tXb9M0r.c3f3Dwrgyis24FgRy2rrTqeqr1MTY4i'),
(15, 'Aditya', 'Laki-laki', '08127720947', 'Bandung', 177, 'Distro Foreman', 'aditya012', '$2y$10$jaEOkSFxwi013V5P6ht8zuvkA/tFzii7yp5kDfTkfqHNmu4Th1HM6'),
(16, 'Adit Hapsah', 'Laki-laki', '085888806990', 'subang', 173, 'PT. Primafood Internasional', 'adith013', '$2y$10$KU2R8t7kWqTYAlWHcsWdvO1.edtgKIjcck5bvYAa5KeUsyDEG5y9S'),
(17, 'Mamin', 'Laki-laki', '085294226415', 'Bandung', 160, 'Toko Mas Cahyani', 'mamin014', '$2y$10$pzf5Ui52SvgrwhmZRgWiyeqMerSuKytqfCn.Y0Pjp4VHQLfQCSf.C'),
(18, 'Jaka', 'Laki-laki', '081222451380', 'Bandung', 160, 'BEM FH PMB', 'jaka015', '$2y$10$FhMppCDaAw64cXtOyhNtYOBSniV41gmn9CaVbruQ.0nigAtbljo06'),
(19, 'Raymond', 'Laki-laki', '08118122708', 'tarakan', 364, 'Pertamina Kalimantan Utara', 'raymond016', '$2y$10$eULfXDeM9iXK9x9Mm5Lhx.zGNuUBB.3j3rclYqETDEMQ5ydmVHMQu'),
(20, 'Farel akbar', 'Laki-laki', '08161891650', 'depok', 183, 'FH UI', 'farel017', '$2y$10$9r.l4.FpXz.hspW3llzl2uRUVfLO0O2dJKsq544o/sCRrhAdcHnMS');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemasukan`
--

CREATE TABLE `tb_pemasukan` (
  `id_pemasukan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_jenis_pemasukan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `referensi` varchar(100) NOT NULL,
  `jumlah` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pemasukan`
--

INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES
(7, '2022-06-27', 1, 'Pembayaran Order Jaket - PT. XYZ', '-', 700000),
(8, '2022-08-01', 4, 'modal pribadi', '-', 100000000),
(9, '2022-07-31', 1, 'Order Kaos Olahraga - UPN jakarta', '-', 500000),
(10, '2022-06-01', 1, 'Order Oblong - Pena Budaya FIB Unpad', '-', 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendapatan_order`
--

CREATE TABLE `tb_pendapatan_order` (
  `id_pendapatan_order` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bukti_pendapatan` text NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pendapatan_order`
--

INSERT INTO `tb_pendapatan_order` (`id_pendapatan_order`, `id_order`, `id_pegawai`, `tanggal`, `jumlah`, `bukti_pendapatan`, `keterangan`, `status`) VALUES
(3, 4, 4, '2022-06-30', 100, '', 'Pembayaran Order Jaket - PT. XYZ', 1),
(4, 4, 4, '2022-06-27', 700000, '', 'Pembayaran Order Jaket - PT. XYZ', 1),
(6, 14, 11, '2022-07-23', 200000, 'rev1.png', 'Pembayaran Order kaos - UPN jakarta', 0),
(7, 44, 11, '2022-07-31', 500000, 'a_(2).png', 'Order Kaos Olahraga - UPN jakarta', 1),
(8, 48, 8, '2022-06-01', 1200000, 'new-file-icon.png', 'Order Oblong - Pena Budaya FIB Unpad', 1),
(9, 43, 11, '2022-08-13', 500000, 'a_(2)1.png', 'Order Kemeja Himpunan - FH UI', 1),
(10, 49, 8, '2022-08-11', 100000, 'a_(2)2.png', 'Order Kaos Olahraga - Radio Station Unpar (DP)', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan`
--

CREATE TABLE `tb_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `bukti_pengajuan` text NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `no_rekening` varchar(20) NOT NULL,
  `nama_rekening` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengajuan`
--

INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `bank`, `no_rekening`, `nama_rekening`, `status`) VALUES
(5, 1, '2022-06-27', 'beli bahan', 1000000, '', 9, 'BNI', '222xxx', 'Ari', 2),
(9, 1, '2022-07-12', 'tes', 2000000, 'BOM_List_(10).pdf', 1, 'BNI', '222xxx', 'Ari', 2),
(10, 3, '2022-07-14', 'Tyu', 5000, 'Screenshot_20220713_012000.jpg', 11, 'BNI', '222xxx', 'Ari', 0),
(11, 1, '2022-07-30', 'beli bahan', 2000000, '2.png', 8, 'BNI', '222xxx', 'Ari', 2),
(13, 3, '2022-07-15', 'bebas', 5000, 'contoh.jpg', 11, 'BNI', '222xxx', 'Ari', 0),
(15, 4, '2022-07-30', 'transportasi', 200000, 'Capture.PNG', 16, 'BNI', '222xxx', 'Ari', 0),
(17, 1, '2022-07-29', 'beliii bahannn', 1000000, 'a_(2).png', 8, 'BNI', '222xxx', 'Ari', 2),
(18, 1, '2022-07-26', 'Beli bahan', 21580000, 'BOM_List_(1).pdf', 10, 'BNI', '222xxx', 'Ari', 2),
(19, 3, '2022-07-28', 'tes', 1000, '2798326-middle.png', 1, 'BNI', '222xxx', 'Ari', 0),
(20, 1, '2022-07-28', 'Pembelian Bahan', 1000, 'BOM_List_(7).pdf', 1, 'BNI', '222xxx', 'Ari', 2),
(21, 1, '2022-07-29', 'Pembelian bahan order kaos olahraga', 3625000, 'BOM_List_(14).pdf', 10, 'BNI', '222xxx', 'Ari', 0),
(25, 3, '2022-07-30', 'tes', 1000, 'aj_(2)3.jpeg', 1, 'BNI', '222xxx', 'Ari', 0),
(27, 4, '2022-08-03', 'beli pakan', 10000, 'Desain-Baju-Kaos-Karang-Taruna.jpg', 10, 'BNI', '222xxx', 'Ari', 0),
(29, 4, '2022-08-03', 'Rapat di luar', 250000, '1E21F7A3-3670-4A0A-B0E9-733C8EC71827.jpeg', 16, 'BNI', '222xxx', 'Ari', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan_hpp`
--

CREATE TABLE `tb_pengajuan_hpp` (
  `id_pengajuan_hpp` int(11) NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bank` varchar(20) NOT NULL,
  `no_rekening` varchar(29) NOT NULL,
  `nama_rekening` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `jumlah` double NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengajuan_hpp`
--

INSERT INTO `tb_pengajuan_hpp` (`id_pengajuan_hpp`, `id_jenis_pengeluaran`, `id_order`, `tanggal`, `bank`, `no_rekening`, `nama_rekening`, `keterangan`, `jumlah`, `id_pegawai`, `status`) VALUES
(6, 1, 43, '2022-07-29', 'BCA', '221006xxx', 'A. N Rifki', 'Order Kemeja Himpunan - FH UI', 1736200, 10, 3),
(7, 1, 45, '2022-07-29', 'BNI', '222xxx', 'Ari', 'HPP Order Kaos Olahraga - Asbuj', 4625000, 1, 0),
(8, 1, 47, '2022-08-04', 'BNI', '12345678765438', 'Ari', 'Order Oblong - UPN jakarta', 2950000, 10, 1),
(9, 1, 49, '2022-08-13', 'BNI', '12345678765438', 'Ari', 'Order Kaos Olahraga - Radio Station Unpar', 0, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengajuan_kasbon`
--

CREATE TABLE `tb_pengajuan_kasbon` (
  `id_pengajuan_kasbon` int(11) NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` int(11) NOT NULL,
  `sisa` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengajuan_kasbon`
--

INSERT INTO `tb_pengajuan_kasbon` (`id_pengajuan_kasbon`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `sisa`, `id_pegawai`, `status`) VALUES
(6, 1, '2022-08-03', 'kasbon', 200000, 140000, 5, 2),
(8, 1, '2022-08-10', 'kasbon adi', 50000, 40000, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `referensi` varchar(100) NOT NULL,
  `jumlah` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES
(19, '2022-07-10', 3, 'sedekah', '-', 50000),
(36, '2022-08-03', 4, 'beli kertas hvs', '-', 20000),
(42, '2022-07-29', 1, 'Order Kemeja Himpunan - FH UI', '-', 1736200),
(46, '2022-08-09', 1, 'kasbon', '-', 200000),
(48, '2022-08-10', 1, 'kasbon adi', '-', 50000),
(49, '2022-08-06', 1, 'Gaji Karyawan Produksi', '-', 172500);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengiriman`
--

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_pengiriman` text,
  `catatan_pengiriman` text,
  `status_pengiriman` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengiriman`
--

INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES
(1, 4, 10, 'BOM_List_(2).pdf', 'tes kirim', 4, '2022-07-04 23:26:26'),
(2, 5, 1, '', '', 0, '2022-04-27 17:31:05'),
(3, 6, 10, '', '', 4, '2022-06-27 20:12:55'),
(4, 8, 10, '', '', 4, '2022-06-17 13:32:33'),
(5, 9, 10, '', '', 4, '2022-06-17 15:31:48'),
(6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41'),
(7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(8, 7, 0, NULL, NULL, 0, '2022-07-12 17:34:27'),
(9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(10, 12, 1, 'jaket_hoodie.PNG', 'telah dikirim', 4, '2022-07-13 12:14:08'),
(11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(12, 14, 11, '', '', 2, '2022-07-15 02:44:12'),
(13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(14, 17, 1, '', '', 1, '2022-07-16 19:53:46'),
(15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59'),
(17, 19, 1, '', '', 4, '2022-07-29 21:57:20'),
(18, 20, 1, 'kaos_polos.PNG', 'selesai', 4, '2022-07-19 19:55:54'),
(19, 21, 1, 'kaos_polos1.PNG', 'selesai', 4, '2022-07-19 19:57:38'),
(20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:51'),
(21, 23, 1, 'kemeja_kerja.PNG', 'selesai', 4, '2022-07-19 19:49:28'),
(22, 24, 1, 'kemeja_kerja1.PNG', 'selesai', 4, '2022-07-19 19:50:04'),
(23, 25, 1, 'jaket_hoodie1.PNG', 'selesai', 4, '2022-07-19 20:04:03'),
(24, 26, 1, 'kemeja_kerja2.PNG', 'selesai', 4, '2022-07-19 19:50:35'),
(25, 27, 1, 'kemeja_kerja3.PNG', 'selesai', 4, '2022-07-19 19:52:58'),
(26, 28, 1, 'jaket_bomber.PNG', 'selesai', 4, '2022-07-19 19:47:38'),
(27, 29, 1, 'kaos_polos2.PNG', 'selesai', 4, '2022-07-19 19:59:52'),
(28, 30, 1, 'jas_almamater.PNG', 'selesai', 4, '2022-07-19 19:48:38'),
(29, 31, 1, 'kemeja_kerja4.PNG', 'selesai', 4, '2022-07-19 19:53:31'),
(30, 32, 1, 'kemeja_kerja5.PNG', 'selesai', 4, '2022-07-19 19:54:01'),
(31, 33, 1, 'kemeja_kerja6.PNG', 'selesai', 4, '2022-07-19 19:54:37'),
(32, 34, 1, 'kaos_polos3.PNG', 'selesai', 4, '2022-07-19 20:01:10'),
(33, 35, 1, 'kemeja_kerja7.PNG', 'selesai', 4, '2022-07-19 19:55:15'),
(34, 36, 1, 'kaos_polos4.PNG', 'selesai', 4, '2022-07-19 20:02:25'),
(35, 37, 1, 'jaket_hoodie2.PNG', 'selesai', 4, '2022-07-19 20:09:05'),
(36, 38, 1, 'kaos_polos5.PNG', 'selesai', 4, '2022-07-19 20:03:10'),
(37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19'),
(38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(39, 41, 10, '', '', 3, '2022-07-28 21:59:05'),
(40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47'),
(42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(43, 45, 10, '', 'pengiriman selesai', 4, '2022-07-29 09:42:20'),
(44, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(45, 47, 0, NULL, NULL, 0, '2022-08-03 12:35:20'),
(46, 48, 0, NULL, NULL, 0, '2022-08-04 08:28:38'),
(47, 49, 0, NULL, NULL, 0, '2022-08-09 17:13:06'),
(48, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_produk`
--

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL,
  `jenis_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `bahan` varchar(200) NOT NULL,
  `foto_produk` text NOT NULL,
  `pnj_kain_s` double NOT NULL,
  `pnj_kain_m` double NOT NULL,
  `pnj_kain_l` double NOT NULL,
  `pnj_kain_xl` double NOT NULL,
  `pnj_kain_xxl` double NOT NULL,
  `pnj_kain_s_p` double NOT NULL,
  `pnj_kain_m_p` double NOT NULL,
  `pnj_kain_l_p` double NOT NULL,
  `pnj_kain_xl_p` double NOT NULL,
  `pnj_kain_xxl_p` double NOT NULL,
  `harga_kain` double NOT NULL,
  `jml_kancing_s` double NOT NULL,
  `jml_kancing_m` double NOT NULL,
  `jml_kancing_l` double NOT NULL,
  `jml_kancing_xl` double NOT NULL,
  `jml_kancing_xxl` double NOT NULL,
  `harga_kancing` double NOT NULL,
  `pnj_resleting_s` double NOT NULL,
  `pnj_resleting_m` double NOT NULL,
  `pnj_resleting_l` double NOT NULL,
  `pnj_resleting_xl` double NOT NULL,
  `pnj_resleting_xxl` double NOT NULL,
  `harga_resleting` double NOT NULL,
  `jml_prepet_s` double NOT NULL,
  `jml_prepet_m` double NOT NULL,
  `jml_prepet_l` double NOT NULL,
  `jml_prepet_xl` double NOT NULL,
  `jml_prepet_xxl` double NOT NULL,
  `harga_prepet` double NOT NULL,
  `pnj_rib_s` double NOT NULL,
  `pnj_rib_m` double NOT NULL,
  `pnj_rib_l` double NOT NULL,
  `pnj_rib_xl` double NOT NULL,
  `pnj_rib_xxl` double NOT NULL,
  `harga_rib` double NOT NULL,
  `jml_benang` double NOT NULL,
  `harga_benang` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_produk`
--

INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`, `jml_benang`, `harga_benang`) VALUES
(2, 'Jaket', 'Jaket', 'bahan 1', 'IMG_20220629_185007.jpg', 0.9, 0.93, 0, 0, 0, 0, 0, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 'Jas', 'jas almamater', 'jas', 'jas_almamater.PNG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Kemeja', 'kemeja', 'kemeja', 'kemeja_kerja.PNG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 'Kaos', 'kaos', 'kaos', 'kaos_polos.PNG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 'Sweater', 'sweater', 'sweater', 'jaket_hoodie.PNG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 'Jaket', 'Jaket Bomber', 'Plestisol', 'jaket_bomber.PNG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 'Kemeja', 'Kemeja Himpunan', 'Drill', 'kemejaaa.jpg', 1, 1, 1, 2, 2, 0, 0, 0, 0, 0, 30000, 5, 5, 5, 6, 7, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 'Kaos', 'Kaos Karang Taruna', 'Combed 30s', 'Desain-Baju-Kaos-Karang-Taruna.jpg', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 15000, 0, 0),
(13, 'Kaos', 'Kaos Olahraga', 'Drill', 'Desain-Baju-Kaos-Karang-Taruna1.jpg', 1, 1, 1, 2, 2, 0, 0, 0, 0, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 5000, 0, 0),
(14, 'Kaos', 'Oblong', 'Combed 30s', 'design_kaos_oblong.jpg', 0.93, 0.965, 1, 1.035, 1.095, 1.32, 1.355, 1.39, 1.425, 1.485, 97500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.93, 0.965, 1, 1.035, 1.095, 5000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_purchase`
--

CREATE TABLE `tb_purchase` (
  `id_purchase` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_purchase` text,
  `catatan_purchase` text,
  `status_purchase` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_purchase`
--

INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES
(2, 4, 1, '7__SOAL_UAS-STATISTIKA_SOSIAL-PRODY_NEGARA_KARYAWAN_P2K.pdf', 'tes', 4, '2022-04-22 23:20:23'),
(3, 5, 1, '', '', 0, '2022-04-27 17:30:42'),
(4, 6, 1, '', '', 1, '2022-06-22 20:01:44'),
(5, 8, 1, 'AFRAHJPG.jpg', 'segera', 4, '2022-06-17 13:23:50'),
(6, 9, 0, NULL, NULL, 0, '2022-06-17 14:47:25'),
(7, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41'),
(8, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(9, 7, 1, '', '', 3, '2022-07-13 00:56:44'),
(10, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(11, 12, 1, 'jaket_hoodie.PNG', 'bahan segera dibeli', 4, '2022-07-13 12:10:21'),
(12, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(13, 14, 11, '', 'ada kendala pemadaman listrik yang menyebabnya terganggu dalam proses produksi', 3, '2022-07-15 02:25:50'),
(14, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(15, 17, 1, '', '', 0, '2022-07-16 19:51:43'),
(16, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(17, 18, 16, '', '', 0, '2022-07-19 07:04:11'),
(18, 19, 1, '', '', 4, '2022-07-19 13:00:15'),
(19, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(20, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(21, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:12:19'),
(22, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(23, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(24, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(25, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(26, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(27, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(28, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(29, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(30, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(31, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(32, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(33, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(34, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(35, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(36, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(37, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(38, 39, 10, '', '', 4, '2022-07-28 14:20:11'),
(39, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(40, 41, 9, 'Laporan_Order_-_Eza_Raka(0852120156206)_.pdf', '', 4, '2022-07-27 20:22:35'),
(41, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(42, 43, 10, '', '', 4, '2022-07-29 16:57:32'),
(43, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(44, 45, 9, 'Desain-Baju-Kaos-Karang-Taruna.jpg', 'selesai membeli bahan', 4, '2022-07-29 09:25:20'),
(45, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(46, 47, 1, '', '', 4, '2022-08-03 12:51:56'),
(47, 48, 9, '', '', 4, '2022-08-04 08:37:09'),
(48, 49, 0, NULL, NULL, 0, '2022-08-09 17:13:06'),
(49, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_qc`
--

CREATE TABLE `tb_qc` (
  `id_qc` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_qc` text,
  `catatan_qc` text,
  `status_qc` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_qc`
--

INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES
(1, 4, 1, '5533-15688-1-PB.pdf', 'tes qc', 4, '2022-04-22 23:20:47'),
(2, 5, 1, '', '', 0, '2022-04-27 17:31:01'),
(3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32'),
(4, 8, 10, '', '', 4, '2022-06-17 13:32:23'),
(5, 9, 1, '', '', 4, '2022-06-28 18:16:25'),
(6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41'),
(7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29'),
(8, 7, 1, '', '', 2, '2022-07-13 05:02:56'),
(9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03'),
(10, 12, 1, 'jaket_hoodie.PNG', 'selesai di packing', 4, '2022-07-13 12:13:46'),
(11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41'),
(12, 14, 11, 'contoh.jpg', 'asd', 2, '2022-07-15 02:41:53'),
(13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43'),
(14, 17, 0, NULL, NULL, 0, '2022-07-15 04:53:05'),
(15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04'),
(16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59'),
(17, 19, 1, '', '', 4, '2022-07-19 13:00:38'),
(18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56'),
(19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51'),
(20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:32'),
(21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10'),
(22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18'),
(23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33'),
(24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49'),
(25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52'),
(26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57'),
(27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54'),
(28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04'),
(29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19'),
(30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16'),
(31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59'),
(32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06'),
(33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16'),
(34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20'),
(35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24'),
(36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22'),
(37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19'),
(38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00'),
(39, 41, 10, '', '', 4, '2022-07-27 20:07:40'),
(40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55'),
(41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47'),
(42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38'),
(43, 45, 10, '', '', 4, '2022-07-29 09:42:01'),
(44, 46, 0, NULL, NULL, 0, '2022-08-03 12:27:57'),
(45, 47, 1, '', '', 3, '2022-08-03 14:16:12'),
(46, 48, 10, '', '', 3, '2022-08-08 19:42:50'),
(47, 49, 0, NULL, NULL, 0, '2022-08-09 17:13:06'),
(48, 53, 0, NULL, NULL, 0, '2022-10-21 10:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekapitulasi`
--

CREATE TABLE `tb_rekapitulasi` (
  `id_rekapitulasi` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `jas` int(11) NOT NULL,
  `jaket` int(11) NOT NULL,
  `kaos` int(11) NOT NULL,
  `kemeja` int(11) NOT NULL,
  `sweater` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rekapitulasi`
--

INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES
(1, 4, 0, 0, 38, 0, 0, 38);

-- --------------------------------------------------------

--
-- Table structure for table `tb_rekening`
--

CREATE TABLE `tb_rekening` (
  `id_rekening` int(11) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `nama_rekening` varchar(50) NOT NULL,
  `no_rekening` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_rekening`
--

INSERT INTO `tb_rekening` (`id_rekening`, `bank`, `nama_rekening`, `no_rekening`) VALUES
(2, 'BNI', 'Ari', '12345678765438'),
(3, 'BRI', 'Dani', '123456789098'),
(4, 'Mandiri', 'Faizal', '0987654321234'),
(5, 'BNI', 'Malik', '6543218909871'),
(6, 'BRI', 'Asep', '6543214567890'),
(7, 'Mandiri', 'Rafif', '09876543212345');

-- --------------------------------------------------------

--
-- Table structure for table `tb_survey`
--

CREATE TABLE `tb_survey` (
  `id_survey` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `tanggal_survey` date NOT NULL,
  `keseluruhan` varchar(20) NOT NULL,
  `aspek_tanggal` varchar(20) NOT NULL,
  `aspek_lokasi` varchar(20) NOT NULL,
  `aspek_sesi` varchar(20) NOT NULL,
  `pembicara` varchar(20) NOT NULL,
  `kali_pertama` varchar(10) NOT NULL,
  `kemungkinan_memesan_produk` int(11) NOT NULL,
  `merekomendasikan_ke_orang_lain` int(11) NOT NULL,
  `pertama_kali_tahu` varchar(20) NOT NULL,
  `rekomendasi_tema` varchar(20) NOT NULL,
  `saran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_survey`
--

INSERT INTO `tb_survey` (`id_survey`, `id_pelanggan`, `tanggal_survey`, `keseluruhan`, `aspek_tanggal`, `aspek_lokasi`, `aspek_sesi`, `pembicara`, `kali_pertama`, `kemungkinan_memesan_produk`, `merekomendasikan_ke_orang_lain`, `pertama_kali_tahu`, `rekomendasi_tema`, `saran`) VALUES
(1, 4, '2022-11-14', 'Biasa', 'Puas', 'Tidak Puas', 'Biasa', 'Puas', 'Tidak', 6, 6, 'Radio', 'Edukasi', 'test saran edit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upah_cutting`
--

CREATE TABLE `tb_upah_cutting` (
  `id_upah_cutting` int(11) NOT NULL,
  `upah_cutting` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upah_cutting`
--

INSERT INTO `tb_upah_cutting` (`id_upah_cutting`, `upah_cutting`) VALUES
(1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_upah_jahit`
--

CREATE TABLE `tb_upah_jahit` (
  `id_upah_jahit` int(11) NOT NULL,
  `upah_jahit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upah_jahit`
--

INSERT INTO `tb_upah_jahit` (`id_upah_jahit`, `upah_jahit`) VALUES
(1, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_upah_produksi`
--

CREATE TABLE `tb_upah_produksi` (
  `id_upah_produksi` int(11) NOT NULL,
  `jenis_produk` varchar(50) NOT NULL,
  `jenis_pekerjaan` varchar(50) NOT NULL,
  `upah` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upah_produksi`
--

INSERT INTO `tb_upah_produksi` (`id_upah_produksi`, `jenis_produk`, `jenis_pekerjaan`, `upah`, `status`, `created_by`, `created_at`) VALUES
(1, 'Jaket', 'Cutting', 5000, 0, 'Administrator', '2022-08-07 00:00:00'),
(2, 'Jaket', 'Jahit', 20000, 1, 'Administrator', '2022-08-07 00:00:00'),
(3, 'Jaket', 'QC', 5000, 1, 'Administrator', '2022-08-07 00:00:00'),
(4, 'Jas', 'Cutting', 5000, 1, 'administrator', '2022-08-07 19:58:46'),
(6, 'Jaket', 'Cutting', 4000, 1, 'administrator', '2022-08-07 20:06:17'),
(7, 'Jas', 'Jahit', 5000, 1, 'Kepala Produksi', '2022-08-07 22:55:24'),
(8, 'Kaos', 'Cutting', 3000, 1, 'Kepala Produksi', '2022-08-08 13:59:24'),
(9, 'Kaos', 'Jahit', 2000, 1, 'Kepala Produksi', '2022-08-08 13:59:40'),
(10, 'Kaos', 'Jahit', 2000, 0, 'Kepala Produksi', '2022-08-08 13:59:40'),
(11, 'Kaos', 'QC', 2500, 1, 'Kepala Produksi', '2022-08-08 14:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upah_qc`
--

CREATE TABLE `tb_upah_qc` (
  `id_upah_qc` int(11) NOT NULL,
  `upah_qc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upah_qc`
--

INSERT INTO `tb_upah_qc` (`id_upah_qc`, `upah_qc`) VALUES
(1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_vendor`
--

CREATE TABLE `tb_vendor` (
  `id_vendor` int(11) NOT NULL,
  `nama_vendor` varchar(200) NOT NULL,
  `alamat_vendor` text NOT NULL,
  `kontak_vendor` varchar(20) NOT NULL,
  `no_rekening_vendor` varchar(20) NOT NULL,
  `nama_rekening_vendor` varchar(50) NOT NULL,
  `bank_vendor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_vendor`
--

INSERT INTO `tb_vendor` (`id_vendor`, `nama_vendor`, `alamat_vendor`, `kontak_vendor`, `no_rekening_vendor`, `nama_rekening_vendor`, `bank_vendor`) VALUES
(1, 'Toko 1A Tamim', 'Tes', '081321771653', '1571477900', 'Yo Tong Eng', 'BCA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_agenda`
--
ALTER TABLE `tb_agenda`
  ADD PRIMARY KEY (`id_agenda`);

--
-- Indexes for table `tb_akun`
--
ALTER TABLE `tb_akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indexes for table `tb_bordir`
--
ALTER TABLE `tb_bordir`
  ADD PRIMARY KEY (`id_bordir`);

--
-- Indexes for table `tb_centroid_temp`
--
ALTER TABLE `tb_centroid_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_cutting`
--
ALTER TABLE `tb_cutting`
  ADD PRIMARY KEY (`id_cutting`);

--
-- Indexes for table `tb_detail_agenda`
--
ALTER TABLE `tb_detail_agenda`
  ADD PRIMARY KEY (`id_detail_agenda`);

--
-- Indexes for table `tb_detail_gaji`
--
ALTER TABLE `tb_detail_gaji`
  ADD PRIMARY KEY (`id_detail_gaji`);

--
-- Indexes for table `tb_detail_gaji_produksi`
--
ALTER TABLE `tb_detail_gaji_produksi`
  ADD PRIMARY KEY (`id_detail_gaji_produksi`);

--
-- Indexes for table `tb_detail_pengajuan_hpp`
--
ALTER TABLE `tb_detail_pengajuan_hpp`
  ADD PRIMARY KEY (`id_detail_pengajuan_hpp`);

--
-- Indexes for table `tb_detail_vendor`
--
ALTER TABLE `tb_detail_vendor`
  ADD PRIMARY KEY (`id_detail_vendor`);

--
-- Indexes for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD PRIMARY KEY (`id_gaji`);

--
-- Indexes for table `tb_gaji_produksi`
--
ALTER TABLE `tb_gaji_produksi`
  ADD PRIMARY KEY (`id_gaji_produksi`);

--
-- Indexes for table `tb_hasil_centroid`
--
ALTER TABLE `tb_hasil_centroid`
  ADD PRIMARY KEY (`nomor`);

--
-- Indexes for table `tb_hasil_klasterisasi`
--
ALTER TABLE `tb_hasil_klasterisasi`
  ADD PRIMARY KEY (`id_hasil_klasterisasi`);

--
-- Indexes for table `tb_jahit`
--
ALTER TABLE `tb_jahit`
  ADD PRIMARY KEY (`id_jahit`);

--
-- Indexes for table `tb_jenis_pemasukan`
--
ALTER TABLE `tb_jenis_pemasukan`
  ADD PRIMARY KEY (`id_jenis_pemasukan`);

--
-- Indexes for table `tb_jenis_pengeluaran`
--
ALTER TABLE `tb_jenis_pengeluaran`
  ADD PRIMARY KEY (`id_jenis_pengeluaran`);

--
-- Indexes for table `tb_jenis_produk`
--
ALTER TABLE `tb_jenis_produk`
  ADD PRIMARY KEY (`id_jenis_produk`);

--
-- Indexes for table `tb_keuangan`
--
ALTER TABLE `tb_keuangan`
  ADD PRIMARY KEY (`id_keuangan`);

--
-- Indexes for table `tb_kota`
--
ALTER TABLE `tb_kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tb_pegawai_cutting`
--
ALTER TABLE `tb_pegawai_cutting`
  ADD PRIMARY KEY (`id_pegawai_cutting`);

--
-- Indexes for table `tb_pegawai_jahit`
--
ALTER TABLE `tb_pegawai_jahit`
  ADD PRIMARY KEY (`id_pegawai_jahit`);

--
-- Indexes for table `tb_pegawai_qc`
--
ALTER TABLE `tb_pegawai_qc`
  ADD PRIMARY KEY (`id_pegawai_qc`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pemasukan`
--
ALTER TABLE `tb_pemasukan`
  ADD PRIMARY KEY (`id_pemasukan`);

--
-- Indexes for table `tb_pendapatan_order`
--
ALTER TABLE `tb_pendapatan_order`
  ADD PRIMARY KEY (`id_pendapatan_order`);

--
-- Indexes for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `tb_pengajuan_hpp`
--
ALTER TABLE `tb_pengajuan_hpp`
  ADD PRIMARY KEY (`id_pengajuan_hpp`);

--
-- Indexes for table `tb_pengajuan_kasbon`
--
ALTER TABLE `tb_pengajuan_kasbon`
  ADD PRIMARY KEY (`id_pengajuan_kasbon`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  ADD PRIMARY KEY (`id_pengiriman`);

--
-- Indexes for table `tb_produk`
--
ALTER TABLE `tb_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `tb_purchase`
--
ALTER TABLE `tb_purchase`
  ADD PRIMARY KEY (`id_purchase`);

--
-- Indexes for table `tb_qc`
--
ALTER TABLE `tb_qc`
  ADD PRIMARY KEY (`id_qc`);

--
-- Indexes for table `tb_rekapitulasi`
--
ALTER TABLE `tb_rekapitulasi`
  ADD PRIMARY KEY (`id_rekapitulasi`);

--
-- Indexes for table `tb_rekening`
--
ALTER TABLE `tb_rekening`
  ADD PRIMARY KEY (`id_rekening`);

--
-- Indexes for table `tb_survey`
--
ALTER TABLE `tb_survey`
  ADD PRIMARY KEY (`id_survey`);

--
-- Indexes for table `tb_upah_cutting`
--
ALTER TABLE `tb_upah_cutting`
  ADD PRIMARY KEY (`id_upah_cutting`);

--
-- Indexes for table `tb_upah_jahit`
--
ALTER TABLE `tb_upah_jahit`
  ADD PRIMARY KEY (`id_upah_jahit`);

--
-- Indexes for table `tb_upah_produksi`
--
ALTER TABLE `tb_upah_produksi`
  ADD PRIMARY KEY (`id_upah_produksi`);

--
-- Indexes for table `tb_upah_qc`
--
ALTER TABLE `tb_upah_qc`
  ADD PRIMARY KEY (`id_upah_qc`);

--
-- Indexes for table `tb_vendor`
--
ALTER TABLE `tb_vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_agenda`
--
ALTER TABLE `tb_agenda`
  MODIFY `id_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_akun`
--
ALTER TABLE `tb_akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_bordir`
--
ALTER TABLE `tb_bordir`
  MODIFY `id_bordir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_centroid_temp`
--
ALTER TABLE `tb_centroid_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_cutting`
--
ALTER TABLE `tb_cutting`
  MODIFY `id_cutting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_detail_agenda`
--
ALTER TABLE `tb_detail_agenda`
  MODIFY `id_detail_agenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_detail_gaji`
--
ALTER TABLE `tb_detail_gaji`
  MODIFY `id_detail_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_detail_gaji_produksi`
--
ALTER TABLE `tb_detail_gaji_produksi`
  MODIFY `id_detail_gaji_produksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `tb_detail_pengajuan_hpp`
--
ALTER TABLE `tb_detail_pengajuan_hpp`
  MODIFY `id_detail_pengajuan_hpp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_detail_vendor`
--
ALTER TABLE `tb_detail_vendor`
  MODIFY `id_detail_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  MODIFY `id_gaji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_gaji_produksi`
--
ALTER TABLE `tb_gaji_produksi`
  MODIFY `id_gaji_produksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `tb_hasil_centroid`
--
ALTER TABLE `tb_hasil_centroid`
  MODIFY `nomor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_hasil_klasterisasi`
--
ALTER TABLE `tb_hasil_klasterisasi`
  MODIFY `id_hasil_klasterisasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_jahit`
--
ALTER TABLE `tb_jahit`
  MODIFY `id_jahit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_jenis_pemasukan`
--
ALTER TABLE `tb_jenis_pemasukan`
  MODIFY `id_jenis_pemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_jenis_pengeluaran`
--
ALTER TABLE `tb_jenis_pengeluaran`
  MODIFY `id_jenis_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_jenis_produk`
--
ALTER TABLE `tb_jenis_produk`
  MODIFY `id_jenis_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_keuangan`
--
ALTER TABLE `tb_keuangan`
  MODIFY `id_keuangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_kota`
--
ALTER TABLE `tb_kota`
  MODIFY `id_kota` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=499;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_pegawai_cutting`
--
ALTER TABLE `tb_pegawai_cutting`
  MODIFY `id_pegawai_cutting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_pegawai_jahit`
--
ALTER TABLE `tb_pegawai_jahit`
  MODIFY `id_pegawai_jahit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tb_pegawai_qc`
--
ALTER TABLE `tb_pegawai_qc`
  MODIFY `id_pegawai_qc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_pemasukan`
--
ALTER TABLE `tb_pemasukan`
  MODIFY `id_pemasukan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_pendapatan_order`
--
ALTER TABLE `tb_pendapatan_order`
  MODIFY `id_pendapatan_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_pengajuan`
--
ALTER TABLE `tb_pengajuan`
  MODIFY `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tb_pengajuan_hpp`
--
ALTER TABLE `tb_pengajuan_hpp`
  MODIFY `id_pengajuan_hpp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_pengajuan_kasbon`
--
ALTER TABLE `tb_pengajuan_kasbon`
  MODIFY `id_pengajuan_kasbon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_pengiriman`
--
ALTER TABLE `tb_pengiriman`
  MODIFY `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_produk`
--
ALTER TABLE `tb_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_purchase`
--
ALTER TABLE `tb_purchase`
  MODIFY `id_purchase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_qc`
--
ALTER TABLE `tb_qc`
  MODIFY `id_qc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tb_rekapitulasi`
--
ALTER TABLE `tb_rekapitulasi`
  MODIFY `id_rekapitulasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_rekening`
--
ALTER TABLE `tb_rekening`
  MODIFY `id_rekening` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_survey`
--
ALTER TABLE `tb_survey`
  MODIFY `id_survey` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_upah_cutting`
--
ALTER TABLE `tb_upah_cutting`
  MODIFY `id_upah_cutting` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_upah_jahit`
--
ALTER TABLE `tb_upah_jahit`
  MODIFY `id_upah_jahit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_upah_produksi`
--
ALTER TABLE `tb_upah_produksi`
  MODIFY `id_upah_produksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_upah_qc`
--
ALTER TABLE `tb_upah_qc`
  MODIFY `id_upah_qc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_vendor`
--
ALTER TABLE `tb_vendor`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
