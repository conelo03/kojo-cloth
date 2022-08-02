#
# TABLE STRUCTURE FOR: tb_agenda
#

DROP TABLE IF EXISTS `tb_agenda`;

CREATE TABLE `tb_agenda` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `nama_agenda` varchar(100) NOT NULL,
  `tanggal_agenda` date NOT NULL,
  `tenggat_agenda` date NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  PRIMARY KEY (`id_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (2, 'Webinar kojo', '2022-06-27', '2022-06-28', 'SMKN 4 Padalarang', '13:30', 'Pembahasan mengenai pengembangan bisnis', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (3, 'Promosi ke polsub', '2022-06-28', '2022-06-28', 'Polsub', '14:00', 'Sesuai ke dengan kegiatan', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (4, 'promosi di alun-alun', '2022-06-30', '2022-07-01', 'alun-alun', '13:00', 'Cfd', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (6, 'Top', '2022-07-14', '2022-07-30', 'Top', '05:57', 'Floor', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (7, 'Floor GBK', '2022-07-30', '2022-07-31', 'Go', '08:57', 'Go', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (8, 'promo kaos panitia qurban', '2022-07-13', '2022-07-14', 'laman sosial media', '12:00', 'promosi untuk baraya yang ingin membuat kaos panitia qurban', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (9, 'bebas', '2022-07-17', '2022-07-20', 'subang', '10:00', 'bebas', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (10, 'promo kaos panitia qurban', '2022-07-22', '2022-07-23', 'laman sosial media', '09:38', 'promosi untuk baraya yang ingin membuat kaos panitia qurban', 0);
INSERT INTO `tb_agenda` (`id_agenda`, `nama_agenda`, `tanggal_agenda`, `tenggat_agenda`, `tempat`, `waktu`, `keterangan`, `id_pegawai`) VALUES (11, 'promosi 17 agustus', '2022-07-29', '2022-08-01', 'laman sosial media', '20:00', 'lakukan konten mengenai hari kemerdekaan', 0);


#
# TABLE STRUCTURE FOR: tb_akun
#

DROP TABLE IF EXISTS `tb_akun`;

CREATE TABLE `tb_akun` (
  `id_akun` int(11) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` text NOT NULL,
  `role` varchar(100) NOT NULL,
  PRIMARY KEY (`id_akun`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (1, 1, 'admin', '$2y$10$w/xLNGW1t4uT2myN/GpX/O/qFktpGYrOZspdVIqBkcL5aEfIb0IzS', 'Admin');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (5, 4, 'marketing', '$2y$10$tMeHt/kAenFwvubmrCAi3uZdVd6AucOFdYjjPwzYOBufi7UFDQe8C', 'Marketing');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (6, 8, 'keuangan', '$2y$10$N7O.Irk8kIK3OOUpklLsEOpBfWQVmNeKYTTjhsxzWpWWBWbXCL7D2', 'Keuangan');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (7, 9, 'purchase', '$2y$10$yhqIod5blD9Pzl/bIu.x8.pRp3SSo7PKrF2qu1Y4ipqYB4bV/IK5y', 'Purchase');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (8, 10, 'produksi', '$2y$10$hebSQhYZbYYPCRCDImkzfuMEWNDkUaN8cJlZ3ADNo0FNES/4WvwBS', 'Kepala Produksi');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (9, 11, 'k_marketing', '$2y$10$CMAAJtm5CCvnalCvjruSfeCJn/PktC2MOKJb22.mJRcTXlXIPPq0.', 'Kepala Marketing');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (10, 13, 'ceo', '$2y$10$mnSdtsN.wV68jAxMyDWxNuoBd/5EQsbbI8aZbnM1OrfkQVjkybXFm', 'Owner');
INSERT INTO `tb_akun` (`id_akun`, `id_pegawai`, `username`, `password`, `role`) VALUES (13, 16, 'owner', '$2y$10$epYvJwbrSElOvEd0pL29.u9Mh9/lzOvbxMtNCzFGjUSsUBexAeo62', 'Owner');


#
# TABLE STRUCTURE FOR: tb_bordir
#

DROP TABLE IF EXISTS `tb_bordir`;

CREATE TABLE `tb_bordir` (
  `id_bordir` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_bordir` text DEFAULT NULL,
  `catatan_bordir` text DEFAULT NULL,
  `status_bordir` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_bordir`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (1, 4, 1, '5533-15688-1-PB.pdf', 'tes bordir', 2, '2022-04-21 23:25:31');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (2, 5, 1, '', '', 0, '2022-04-27 17:30:53');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (4, 8, 1, '', '', 2, '2022-06-17 13:33:33');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (5, 9, 10, '', '', 2, '2022-06-17 14:59:09');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (8, 7, 1, '', '', 3, '2022-07-12 23:50:49');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (10, 12, 1, '', '', 2, '2022-07-28 13:51:26');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (12, 14, 11, '', 'asd', 3, '2022-07-15 02:37:19');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (14, 17, 1, '', '', 4, '2022-07-16 19:52:06');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (17, 19, 1, '', '', 4, '2022-07-19 13:00:26');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (20, 22, 0, NULL, NULL, 0, '2022-07-19 12:48:56');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (39, 41, 10, '', '', 2, '2022-07-26 19:11:02');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (41, 43, 10, '', '', 2, '2022-07-29 16:59:17');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_bordir` (`id_bordir`, `id_order`, `id_pegawai`, `file_bordir`, `catatan_bordir`, `status_bordir`, `updated_at`) VALUES (43, 45, 10, '', '', 2, '2022-07-29 09:35:18');


#
# TABLE STRUCTURE FOR: tb_centroid_temp
#

DROP TABLE IF EXISTS `tb_centroid_temp`;

CREATE TABLE `tb_centroid_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iterasi` int(11) NOT NULL,
  `c1` varchar(50) NOT NULL,
  `c2` varchar(50) NOT NULL,
  `c3` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (1, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (2, 1, '0', '1', '0');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (3, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (4, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (5, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (6, 1, '0', '1', '0');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (7, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (8, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (9, 1, '0', '0', '1');
INSERT INTO `tb_centroid_temp` (`id`, `iterasi`, `c1`, `c2`, `c3`) VALUES (10, 1, '0', '0', '1');


#
# TABLE STRUCTURE FOR: tb_cutting
#

DROP TABLE IF EXISTS `tb_cutting`;

CREATE TABLE `tb_cutting` (
  `id_cutting` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_cutting` text DEFAULT NULL,
  `catatan_cutting` text DEFAULT NULL,
  `status_cutting` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_cutting`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (1, 4, 1, '3785-12590-1-PB.pdf', 'tes cutting', 4, '2022-04-22 23:20:30');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (2, 5, 1, '', '', 0, '2022-04-27 17:30:47');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (3, 6, 10, '', '', 0, '2022-06-22 20:01:04');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (4, 8, 10, 'AFRAHJPG.jpg', 'segera', 4, '2022-06-17 13:26:07');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (5, 9, 10, '', '', 4, '2022-06-17 14:57:45');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (6, 10, 1, '', '', 0, '2022-07-02 01:41:27');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (8, 7, 1, '', '', 1, '2022-07-13 00:52:03');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (10, 12, 10, 'jaket_hoodie.PNG', 'segera lakukan pemotongan', 3, '2022-07-29 23:32:09');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (12, 14, 11, '', 'untuk proses ini masih dalam pengerjaan produk cutting', 1, '2022-07-15 02:32:29');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (14, 17, 1, '', '', 0, '2022-07-16 19:51:13');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (17, 19, 1, '', '', 4, '2022-07-19 13:00:21');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:12:42');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (39, 41, 10, '', '', 4, '2022-07-27 20:07:50');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (41, 43, 10, '', '', 4, '2022-08-03 00:48:04');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_cutting` (`id_cutting`, `id_order`, `id_pegawai`, `file_cutting`, `catatan_cutting`, `status_cutting`, `updated_at`) VALUES (43, 45, 10, '', '', 4, '2022-07-29 09:34:59');


#
# TABLE STRUCTURE FOR: tb_detail_agenda
#

DROP TABLE IF EXISTS `tb_detail_agenda`;

CREATE TABLE `tb_detail_agenda` (
  `id_detail_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_agenda` int(11) NOT NULL,
  `foto_agenda` text NOT NULL,
  `tautan` text NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_detail_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES (1, 2, 'IMG_20220628_213625.jpg', 'bit.ly/webinarkojo1', 'Agenda dilakukan sesuai dengan yang ditentukan');
INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES (2, 2, 'IMG_20220628_2136251.jpg', 'bit.ly/webinarkojo1', 'Agenda dilakukan sesuai dengan yang ditentukan');
INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES (5, 6, '', 'https://kojo-cloth.elearningpolsub.com/riwayat-order-pelanggan', 'test');
INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES (6, 6, '706389.jpg', '', 'test2');
INSERT INTO `tb_detail_agenda` (`id_detail_agenda`, `id_agenda`, `foto_agenda`, `tautan`, `keterangan`) VALUES (7, 10, 'WhatsApp_Image_2022-06-28_at_21_55_41.jpeg', 'https://www.instagram.com/p/CfBqzvnh4Sl/?igshid=YmMyMTA2M2Y=', 'kegiatan dilaksanakan sesuai dengan tema yang telah di buat');


#
# TABLE STRUCTURE FOR: tb_detail_gaji
#

DROP TABLE IF EXISTS `tb_detail_gaji`;

CREATE TABLE `tb_detail_gaji` (
  `id_detail_gaji` int(11) NOT NULL AUTO_INCREMENT,
  `id_gaji` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `gaji_pokok` double NOT NULL,
  `bonus` double NOT NULL,
  `kasbon` double NOT NULL,
  `total` double NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id_detail_gaji`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (2, 1, 8, '3000000', '0', '0', '3000000', '-');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (3, 1, 4, '2700000', '0', '100000', '2600000', '-');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (4, 3, 1, '3000000', '300000', '0', '3300000', '-');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (9, 9, 1, '400000', '120009', '2', '520007', 'gaji');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (10, 9, 4, '2900000', '0', '0', '2900000', 'gaji');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (12, 12, 1, '1500000', '200000', '15000', '1685000', 'gaji bulan ini');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (13, 12, 4, '2000000', '200000', '0', '2200000', 'gaji');
INSERT INTO `tb_detail_gaji` (`id_detail_gaji`, `id_gaji`, `id_pegawai`, `gaji_pokok`, `bonus`, `kasbon`, `total`, `keterangan`) VALUES (15, 13, 4, '2000000', '120000', '0', '2120000', 'gaji');


#
# TABLE STRUCTURE FOR: tb_detail_gaji_produksi
#

DROP TABLE IF EXISTS `tb_detail_gaji_produksi`;

CREATE TABLE `tb_detail_gaji_produksi` (
  `id_detail_gaji_produksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_gaji_produksi` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `kasbon` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_detail_gaji_produksi`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (7, 4, 5, '59000', '2000', '57000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (8, 4, 12, '78000', '50', '77950');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (9, 5, 5, '250000', '1000', '249000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (13, 7, 5, '250000', '1000', '249000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (14, 7, 6, '300000', '2000', '298000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (15, 7, 7, '200000', '1000', '199000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (16, 8, 5, '59000', '2000', '57000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (17, 8, 12, '78000', '50', '77950');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (24, 16, 5, '85000', '0', '85000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (25, 16, 6, '170000', '0', '170000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (26, 16, 7, '85000', '0', '85000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (27, 17, 5, '85000', '0', '85000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (28, 17, 6, '170000', '0', '170000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (29, 17, 7, '85000', '0', '85000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (30, 18, 5, '160000', '2000', '158000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (31, 18, 6, '220000', '4000', '216000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (32, 18, 7, '85000', '0', '85000');
INSERT INTO `tb_detail_gaji_produksi` (`id_detail_gaji_produksi`, `id_gaji_produksi`, `id_pegawai`, `jumlah`, `kasbon`, `total`) VALUES (33, 19, 5, '100000', '0', '100000');


#
# TABLE STRUCTURE FOR: tb_detail_pengajuan_hpp
#

DROP TABLE IF EXISTS `tb_detail_pengajuan_hpp`;

CREATE TABLE `tb_detail_pengajuan_hpp` (
  `id_detail_pengajuan_hpp` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengajuan_hpp` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `id_detail_vendor` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `vendor` varchar(100) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `jumlah` double NOT NULL,
  `harga` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id_detail_pengajuan_hpp`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `tb_detail_pengajuan_hpp` (`id_detail_pengajuan_hpp`, `id_pengajuan_hpp`, `id_vendor`, `id_detail_vendor`, `nama_bahan`, `vendor`, `satuan`, `jumlah`, `harga`, `total`) VALUES (6, 6, 0, 0, 'Kain  drill', 'PT. Zhiva', 'Meter', '57', '30000', '1710000');
INSERT INTO `tb_detail_pengajuan_hpp` (`id_detail_pengajuan_hpp`, `id_pengajuan_hpp`, `id_vendor`, `id_detail_vendor`, `nama_bahan`, `vendor`, `satuan`, `jumlah`, `harga`, `total`) VALUES (7, 6, 0, 0, 'Kancing Besi Premium', 'PT. Zhiva', 'Buah', '262', '100', '26200');
INSERT INTO `tb_detail_pengajuan_hpp` (`id_detail_pengajuan_hpp`, `id_pengajuan_hpp`, `id_vendor`, `id_detail_vendor`, `nama_bahan`, `vendor`, `satuan`, `jumlah`, `harga`, `total`) VALUES (8, 7, 0, 0, 'Drill', 'PT. Zahra', 'Meter', '60', '50000', '3000000');
INSERT INTO `tb_detail_pengajuan_hpp` (`id_detail_pengajuan_hpp`, `id_pengajuan_hpp`, `id_vendor`, `id_detail_vendor`, `nama_bahan`, `vendor`, `satuan`, `jumlah`, `harga`, `total`) VALUES (9, 7, 0, 0, 'Rib leher', 'PT. Zahra', 'Meter', '125', '5000', '625000');


#
# TABLE STRUCTURE FOR: tb_detail_vendor
#

DROP TABLE IF EXISTS `tb_detail_vendor`;

CREATE TABLE `tb_detail_vendor` (
  `id_detail_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendor` int(11) NOT NULL,
  `nama_bahan` varchar(100) NOT NULL,
  `warna` varchar(20) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_satuan` double NOT NULL,
  PRIMARY KEY (`id_detail_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `tb_detail_vendor` (`id_detail_vendor`, `id_vendor`, `nama_bahan`, `warna`, `satuan`, `harga_satuan`) VALUES (1, 1, 'Drill', 'Merah', 'Meter', '50000');
INSERT INTO `tb_detail_vendor` (`id_detail_vendor`, `id_vendor`, `nama_bahan`, `warna`, `satuan`, `harga_satuan`) VALUES (2, 1, 'Drill', 'Merah', 'Roll', '500000');


#
# TABLE STRUCTURE FOR: tb_gaji
#

DROP TABLE IF EXISTS `tb_gaji`;

CREATE TABLE `tb_gaji` (
  `id_gaji` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_gaji`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (1, '2022-06-02', 'Gaji Karyawan', '5600000', 2);
INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (3, '2022-06-15', 'Gaji Karyawan', '3300000', 2);
INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (8, '2022-07-29', 'gaji', '0', 1);
INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (9, '2022-07-30', 'gaji manajemen', '3420007', 2);
INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (12, '2022-07-16', 'asdfgh', '3885000', 0);
INSERT INTO `tb_gaji` (`id_gaji`, `tanggal`, `keterangan`, `jumlah`, `status`) VALUES (13, '2022-07-31', 'gaji karyawan', '2120000', 0);


#
# TABLE STRUCTURE FOR: tb_gaji_produksi
#

DROP TABLE IF EXISTS `tb_gaji_produksi`;

CREATE TABLE `tb_gaji_produksi` (
  `id_gaji_produksi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_pencairan` date NOT NULL,
  `jumlah` double NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_gaji_produksi`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (4, '2022-04-23', '134950', 'Gaji Mingguan Produksi', 3);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (5, '2022-06-17', '249000', 'gaji cutting', 3);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (7, '2022-06-17', '746000', 'gaji mingguan', 3);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (8, '2022-04-23', '134950', 'gaji mingguan', 1);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (16, '2022-07-30', '340000', 'gaji mingguan', 1);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (17, '2022-07-30', '340000', 'gaji mingguan', 1);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (18, '2022-07-30', '459000', 'Gaji Mingguan Produksi', 1);
INSERT INTO `tb_gaji_produksi` (`id_gaji_produksi`, `tanggal_pencairan`, `jumlah`, `keterangan`, `status`) VALUES (19, '2022-08-06', '100000', 'gaji mingguan produksi', 2);


#
# TABLE STRUCTURE FOR: tb_hasil_centroid
#

DROP TABLE IF EXISTS `tb_hasil_centroid`;

CREATE TABLE `tb_hasil_centroid` (
  `nomor` int(11) NOT NULL AUTO_INCREMENT,
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
  `c3e` varchar(50) NOT NULL,
  PRIMARY KEY (`nomor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tb_hasil_centroid` (`nomor`, `c1a`, `c1b`, `c1c`, `c1d`, `c1e`, `c2a`, `c2b`, `c2c`, `c2d`, `c2e`, `c3a`, `c3b`, `c3c`, `c3d`, `c3e`) VALUES (1, '0', '0', '0', '0', '0', '0', '0', '0', '22.5', '0', '1.75', '0', '26.375', '0.25', '5.25');


#
# TABLE STRUCTURE FOR: tb_hasil_klasterisasi
#

DROP TABLE IF EXISTS `tb_hasil_klasterisasi`;

CREATE TABLE `tb_hasil_klasterisasi` (
  `id_hasil_klasterisasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `instansi` varchar(200) NOT NULL,
  `klaster` varchar(5) NOT NULL,
  PRIMARY KEY (`id_hasil_klasterisasi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# TABLE STRUCTURE FOR: tb_jahit
#

DROP TABLE IF EXISTS `tb_jahit`;

CREATE TABLE `tb_jahit` (
  `id_jahit` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_jahit` text DEFAULT NULL,
  `catatan_jahit` text DEFAULT NULL,
  `status_jahit` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_jahit`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (1, 4, 1, '5533-15688-1-PB.pdf', 'tes jahit', 4, '2022-04-22 23:20:38');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (2, 5, 1, '', '', 0, '2022-04-27 17:30:57');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (4, 8, 10, '', '', 4, '2022-06-17 13:31:39');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (5, 9, 10, '', '', 4, '2022-06-17 15:05:01');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (8, 7, 1, '', '', 4, '2022-07-12 23:50:58');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (10, 12, 1, 'jaket_hoodie.PNG', 'segera', 4, '2022-07-13 12:13:21');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (12, 14, 11, '', 'asd', 1, '2022-07-15 02:38:59');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (14, 17, 0, NULL, NULL, 0, '2022-07-15 04:53:05');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (17, 19, 1, '', '', 4, '2022-07-19 13:00:31');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:10');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (39, 41, 10, '', '', 4, '2022-07-26 19:15:02');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_jahit` (`id_jahit`, `id_order`, `id_pegawai`, `file_jahit`, `catatan_jahit`, `status_jahit`, `updated_at`) VALUES (43, 45, 10, '', '', 4, '2022-07-29 09:36:20');


#
# TABLE STRUCTURE FOR: tb_jenis_pemasukan
#

DROP TABLE IF EXISTS `tb_jenis_pemasukan`;

CREATE TABLE `tb_jenis_pemasukan` (
  `id_jenis_pemasukan` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pemasukan` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jenis_pemasukan`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO `tb_jenis_pemasukan` (`id_jenis_pemasukan`, `jenis_pemasukan`) VALUES (1, 'Pendapatan');
INSERT INTO `tb_jenis_pemasukan` (`id_jenis_pemasukan`, `jenis_pemasukan`) VALUES (4, 'modal pribadi');
INSERT INTO `tb_jenis_pemasukan` (`id_jenis_pemasukan`, `jenis_pemasukan`) VALUES (5, 'investor');


#
# TABLE STRUCTURE FOR: tb_jenis_pengeluaran
#

DROP TABLE IF EXISTS `tb_jenis_pengeluaran`;

CREATE TABLE `tb_jenis_pengeluaran` (
  `id_jenis_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_pengeluaran` varchar(100) NOT NULL,
  PRIMARY KEY (`id_jenis_pengeluaran`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

INSERT INTO `tb_jenis_pengeluaran` (`id_jenis_pengeluaran`, `jenis_pengeluaran`) VALUES (1, 'HPP');
INSERT INTO `tb_jenis_pengeluaran` (`id_jenis_pengeluaran`, `jenis_pengeluaran`) VALUES (2, 'Beban Gaji');
INSERT INTO `tb_jenis_pengeluaran` (`id_jenis_pengeluaran`, `jenis_pengeluaran`) VALUES (3, 'Beban Lain-lain');
INSERT INTO `tb_jenis_pengeluaran` (`id_jenis_pengeluaran`, `jenis_pengeluaran`) VALUES (4, 'pengeluaran dadakan');


#
# TABLE STRUCTURE FOR: tb_keuangan
#

DROP TABLE IF EXISTS `tb_keuangan`;

CREATE TABLE `tb_keuangan` (
  `id_keuangan` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_keuangan` text DEFAULT NULL,
  `catatan_keuangan` text DEFAULT NULL,
  `status_keuangan` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_keuangan`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (2, 4, 1, 'Laporan_Order_-_Ferdi(089123123123)_(1).pdf', 'cefat', 2, '2022-07-13 00:58:31');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (3, 5, 1, '', '', 0, '2022-04-27 17:30:37');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (4, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (5, 8, 1, '', '', 4, '2022-06-17 13:22:49');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (6, 9, 0, NULL, NULL, 0, '2022-06-17 14:47:25');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (7, 10, 8, '', 'udeh', 4, '2022-07-09 01:17:07');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (8, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (9, 7, 1, '', '', 2, '2022-07-13 05:11:51');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (10, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (11, 12, 8, 'jaket_hoodie.PNG', 'segara dikerjakan', 4, '2022-07-15 11:38:22');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (12, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (13, 14, 11, 'contoh.jpg', 'produk sedang dikerjakan oleh team produksi', 1, '2022-07-15 02:23:37');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (14, 15, 8, '', '', 3, '2022-07-15 07:05:46');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (15, 17, 1, '', '', 3, '2022-07-16 14:37:34');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (16, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (17, 18, 10, '', '', 4, '2022-07-18 16:58:20');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (18, 19, 1, '', '', 4, '2022-07-19 13:00:10');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (19, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (20, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (21, 22, 1, 'jaket_bomber.PNG', 'slesai', 4, '2022-07-19 13:11:44');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (22, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (23, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (24, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (25, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (26, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (27, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (28, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (29, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (30, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (31, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (32, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (33, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (34, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (35, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (36, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (37, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (38, 39, 10, '', '', 4, '2022-07-28 14:19:49');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (39, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (40, 41, 8, '', '', 4, '2022-07-27 20:09:00');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (41, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (42, 43, 10, '', '', 4, '2022-07-29 16:57:18');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (43, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_keuangan` (`id_keuangan`, `id_order`, `id_pegawai`, `file_keuangan`, `catatan_keuangan`, `status_keuangan`, `updated_at`) VALUES (44, 45, 0, NULL, NULL, 0, '2022-07-29 08:53:01');


#
# TABLE STRUCTURE FOR: tb_kota
#

DROP TABLE IF EXISTS `tb_kota`;

CREATE TABLE `tb_kota` (
  `id_kota` int(4) NOT NULL AUTO_INCREMENT,
  `nama_kota` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1;

INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (1, 'Kabupaten Aceh Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (2, 'Kabupaten Aceh Barat Daya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (3, 'Kabupaten Aceh Besar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (4, 'Kabupaten Aceh Jaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (5, 'Kabupaten Aceh Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (6, 'Kabupaten Aceh Singkil');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (7, 'Kabupaten Aceh Tamiang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (8, 'Kabupaten Aceh Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (9, 'Kabupaten Aceh Tenggara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (10, 'Kabupaten Aceh Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (11, 'Kabupaten Aceh Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (12, 'Kabupaten Bener Meriah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (13, 'Kabupaten Bireuen');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (14, 'Kabupaten Gayo Lues');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (15, 'Kabupaten Nagan Raya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (16, 'Kabupaten Pidie');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (17, 'Kabupaten Pidie Jaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (18, 'Kabupaten Simeulue');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (19, 'Kota Banda Aceh');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (20, 'Kota Langsa');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (21, 'Kota Lhokseumawe');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (22, 'Kota Sabang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (23, 'Kota Subulussalam');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (24, 'Kabupaten Asahan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (25, 'Kabupaten Batubara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (26, 'Kabupaten Dairi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (27, 'Kabupaten Deli Serdang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (28, 'Kabupaten Humbang Hasundutan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (29, 'Kabupaten Karo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (30, 'Kabupaten Labuhanbatu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (31, 'Kabupaten Labuhanbatu Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (32, 'Kabupaten Labuhanbatu Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (33, 'Kabupaten Langkat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (34, 'Kabupaten Mandailing Natal');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (35, 'Kabupaten Nias');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (36, 'Kabupaten Nias Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (37, 'Kabupaten Nias Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (38, 'Kabupaten Nias Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (39, 'Kabupaten Padang Lawas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (40, 'Kabupaten Padang Lawas Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (41, 'Kabupaten Pakpak Bharat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (42, 'Kabupaten Samosir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (43, 'Kabupaten Serdang Bedagai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (44, 'Kabupaten Simalungun');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (45, 'Kabupaten Tapanuli Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (46, 'Kabupaten Tapanuli Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (47, 'Kabupaten Tapanuli Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (48, 'Kabupaten Toba Samosir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (49, 'Kota Binjai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (50, 'Kota Gunungsitoli');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (51, 'Kota Medan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (52, 'Kota Padangsidempuan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (53, 'Kota Pematangsiantar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (54, 'Kota Sibolga');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (55, 'Kota Tanjungbalai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (56, 'Kota Tebing Tinggi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (57, 'Kabupaten Agam');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (58, 'Kabupaten Dharmasraya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (59, 'Kabupaten Kepulauan Mentawai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (60, 'Kabupaten Lima Puluh Kota');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (61, 'Kabupaten Padang Pariaman');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (62, 'Kabupaten Pasaman');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (63, 'Kabupaten Pasaman Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (64, 'Kabupaten Pesisir Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (65, 'Kabupaten Sijunjung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (66, 'Kabupaten Solok');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (67, 'Kabupaten Solok Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (68, 'Kabupaten Tanah Datar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (69, 'Kota Bukittinggi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (70, 'Kota Padang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (71, 'Kota Padangpanjang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (72, 'Kota Pariaman');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (73, 'Kota Payakumbuh');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (74, 'Kota Sawahlunto');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (75, 'Kota Solok');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (76, 'Kabupaten Bengkalis');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (77, 'Kabupaten Indragiri Hilir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (78, 'Kabupaten Indragiri Hulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (79, 'Kabupaten Kampar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (80, 'Kabupaten Kuantan Singingi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (81, 'Kabupaten Pelalawan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (82, 'Kabupaten Rokan Hilir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (83, 'Kabupaten Rokan Hulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (84, 'Kabupaten Siak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (85, 'Kabupaten Kepulauan Meranti');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (86, 'Kota Dumai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (87, 'Kota Pekanbaru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (88, 'Kabupaten Bintan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (89, 'Kabupaten Karimun');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (90, 'Kabupaten Kepulauan Anambas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (91, 'Kabupaten Lingga');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (92, 'Kabupaten Natuna');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (93, 'Kota Batam');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (94, 'Kota Tanjung Pinang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (95, 'Kabupaten Batanghari');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (96, 'Kabupaten Bungo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (97, 'Kabupaten Kerinci');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (98, 'Kabupaten Merangin');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (99, 'Kabupaten Muaro Jambi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (100, 'Kabupaten Sarolangun');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (101, 'Kabupaten Tanjung Jabung Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (102, 'Kabupaten Tanjung Jabung Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (103, 'Kabupaten Tebo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (104, 'Kota Jambi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (105, 'Kota Sungai Penuh');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (106, 'Kabupaten Bengkulu Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (107, 'Kabupaten Bengkulu Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (108, 'Kabupaten Bengkulu Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (109, 'Kabupaten Kaur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (110, 'Kabupaten Kepahiang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (111, 'Kabupaten Lebong');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (112, 'Kabupaten Mukomuko');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (113, 'Kabupaten Rejang Lebong');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (114, 'Kabupaten Seluma');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (115, 'Kota Bengkulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (116, 'Kabupaten Banyuasin');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (117, 'Kabupaten Empat Lawang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (118, 'Kabupaten Lahat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (119, 'Kabupaten Muara Enim');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (120, 'Kabupaten Musi Banyuasin');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (121, 'Kabupaten Musi Rawas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (122, 'Kabupaten Ogan Ilir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (123, 'Kabupaten Ogan Komering Ilir');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (124, 'Kabupaten Ogan Komering Ulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (125, 'Kabupaten Ogan Komering Ulu Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (126, 'Kabupaten Ogan Komering Ulu Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (127, 'Kota Lubuklinggau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (128, 'Kota Pagar Alam');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (129, 'Kota Palembang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (130, 'Kota Prabumulih');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (131, 'Kabupaten Bangka');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (132, 'Kabupaten Bangka Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (133, 'Kabupaten Bangka Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (134, 'Kabupaten Bangka Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (135, 'Kabupaten Belitung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (136, 'Kabupaten Belitung Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (137, 'Kota Pangkal Pinang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (138, 'Kabupaten Lampung Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (139, 'Kabupaten Lampung Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (140, 'Kabupaten Lampung Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (141, 'Kabupaten Lampung Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (142, 'Kabupaten Lampung Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (143, 'Kabupaten Mesuji');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (144, 'Kabupaten Pesawaran');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (145, 'Kabupaten Pringsewu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (146, 'Kabupaten Tanggamus');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (147, 'Kabupaten Tulang Bawang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (148, 'Kabupaten Tulang Bawang Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (149, 'Kabupaten Way Kanan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (150, 'Kota Bandar Lampung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (151, 'Kota Metro');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (152, 'Kabupaten Tangerang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (153, 'Kabupaten Serang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (154, 'Kabupaten Lebak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (155, 'Kabupaten Pandeglang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (156, 'Kota Tangerang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (157, 'Kota Serang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (158, 'Kota Cilegon');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (159, 'Kota Tangerang Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (160, 'Kabupaten Bandung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (161, 'Kabupaten Bandung Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (162, 'Kabupaten Bekasi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (163, 'Kabupaten Bogor');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (164, 'Kabupaten Ciamis');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (165, 'Kabupaten Cianjur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (166, 'Kabupaten Cirebon');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (167, 'Kabupaten Garut');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (168, 'Kabupaten Indramayu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (169, 'Kabupaten Karawang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (170, 'Kabupaten Kuningan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (171, 'Kabupaten Majalengka');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (172, 'Kabupaten Purwakarta');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (173, 'Kabupaten Subang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (174, 'Kabupaten Sukabumi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (175, 'Kabupaten Sumedang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (176, 'Kabupaten Tasikmalaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (177, 'Kota Bandung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (178, 'Kota Banjar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (179, 'Kota Bekasi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (180, 'Kota Bogor');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (181, 'Kota Cimahi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (182, 'Kota Cirebon');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (183, 'Kota Depok');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (184, 'Kota Sukabumi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (185, 'Kota Tasikmalaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (186, 'Kabupaten Administrasi Kepulauan Seribu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (187, 'Kota Administrasi Jakarta Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (188, 'Kota Administrasi Jakarta Pusat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (189, 'Kota Administrasi Jakarta Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (190, 'Kota Administrasi Jakarta Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (191, 'Kota Administrasi Jakarta Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (192, 'Kabupaten Banjarnegara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (193, 'Kabupaten Banyumas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (194, 'Kabupaten Batang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (195, 'Kabupaten Blora');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (196, 'Kabupaten Boyolali');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (197, 'Kabupaten Brebes');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (198, 'Kabupaten Cilacap');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (199, 'Kabupaten Demak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (200, 'Kabupaten Grobogan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (201, 'Kabupaten Jepara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (202, 'Kabupaten Karanganyar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (203, 'Kabupaten Kebumen');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (204, 'Kabupaten Kendal');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (205, 'Kabupaten Klaten');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (206, 'Kabupaten Kudus');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (207, 'Kabupaten Magelang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (208, 'Kabupaten Pati');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (209, 'Kabupaten Pekalongan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (210, 'Kabupaten Pemalang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (211, 'Kabupaten Purbalingga');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (212, 'Kabupaten Purworejo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (213, 'Kabupaten Rembang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (214, 'Kabupaten Semarang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (215, 'Kabupaten Sragen');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (216, 'Kabupaten Sukoharjo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (217, 'Kabupaten Tegal');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (218, 'Kabupaten Temanggung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (219, 'Kabupaten Wonogiri');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (220, 'Kabupaten Wonosobo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (221, 'Kota Magelang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (222, 'Kota Pekalongan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (223, 'Kota Salatiga');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (224, 'Kota Semarang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (225, 'Kota Surakarta');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (226, 'Kota Tegal');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (227, 'Kabupaten Bangkalan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (228, 'Kabupaten Banyuwangi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (229, 'Kabupaten Blitar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (230, 'Kabupaten Bojonegoro');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (231, 'Kabupaten Bondowoso');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (232, 'Kabupaten Gresik');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (233, 'Kabupaten Jember');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (234, 'Kabupaten Jombang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (235, 'Kabupaten Kediri');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (236, 'Kabupaten Lamongan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (237, 'Kabupaten Lumajang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (238, 'Kabupaten Madiun');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (239, 'Kabupaten Magetan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (240, 'Kabupaten Malang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (241, 'Kabupaten Mojokerto');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (242, 'Kabupaten Nganjuk');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (243, 'Kabupaten Ngawi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (244, 'Kabupaten Pacitan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (245, 'Kabupaten Pamekasan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (246, 'Kabupaten Pasuruan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (247, 'Kabupaten Ponorogo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (248, 'Kabupaten Probolinggo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (249, 'Kabupaten Sampang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (250, 'Kabupaten Sidoarjo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (251, 'Kabupaten Situbondo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (252, 'Kabupaten Sumenep');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (253, 'Kabupaten Trenggalek');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (254, 'Kabupaten Tuban');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (255, 'Kabupaten Tulungagung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (256, 'Kota Batu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (257, 'Kota Blitar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (258, 'Kota Kediri');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (259, 'Kota Madiun');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (260, 'Kota Malang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (261, 'Kota Mojokerto');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (262, 'Kota Pasuruan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (263, 'Kota Probolinggo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (264, 'Kota Surabaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (265, 'Kabupaten Bantul');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (266, 'Kabupaten Gunung Kidul');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (267, 'Kabupaten Kulon Progo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (268, 'Kabupaten Sleman');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (269, 'Kota Yogyakarta');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (270, 'Kabupaten Badung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (271, 'Kabupaten Bangli');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (272, 'Kabupaten Buleleng');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (273, 'Kabupaten Gianyar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (274, 'Kabupaten Jembrana');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (275, 'Kabupaten Karangasem');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (276, 'Kabupaten Klungkung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (277, 'Kabupaten Tabanan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (278, 'Kota Denpasar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (279, 'Kabupaten Bima');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (280, 'Kabupaten Dompu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (281, 'Kabupaten Lombok Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (282, 'Kabupaten Lombok Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (283, 'Kabupaten Lombok Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (284, 'Kabupaten Lombok Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (285, 'Kabupaten Sumbawa');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (286, 'Kabupaten Sumbawa Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (287, 'Kota Bima');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (288, 'Kota Mataram');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (289, 'Kabupaten Alor');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (290, 'Kabupaten Belu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (291, 'Kabupaten Ende');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (292, 'Kabupaten Flores Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (293, 'Kabupaten Kupang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (294, 'Kabupaten Lembata');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (295, 'Kabupaten Manggarai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (296, 'Kabupaten Manggarai Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (297, 'Kabupaten Manggarai Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (298, 'Kabupaten Ngada');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (299, 'Kabupaten Nagekeo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (300, 'Kabupaten Rote Ndao');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (301, 'Kabupaten Sabu Raijua');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (302, 'Kabupaten Sikka');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (303, 'Kabupaten Sumba Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (304, 'Kabupaten Sumba Barat Daya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (305, 'Kabupaten Sumba Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (306, 'Kabupaten Sumba Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (307, 'Kabupaten Timor Tengah Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (308, 'Kabupaten Timor Tengah Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (309, 'Kota Kupang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (310, 'Kabupaten Bengkayang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (311, 'Kabupaten Kapuas Hulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (312, 'Kabupaten Kayong Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (313, 'Kabupaten Ketapang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (314, 'Kabupaten Kubu Raya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (315, 'Kabupaten Landak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (316, 'Kabupaten Melawi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (317, 'Kabupaten Pontianak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (318, 'Kabupaten Sambas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (319, 'Kabupaten Sanggau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (320, 'Kabupaten Sekadau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (321, 'Kabupaten Sintang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (322, 'Kota Pontianak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (323, 'Kota Singkawang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (324, 'Kabupaten Balangan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (325, 'Kabupaten Banjar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (326, 'Kabupaten Barito Kuala');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (327, 'Kabupaten Hulu Sungai Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (328, 'Kabupaten Hulu Sungai Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (329, 'Kabupaten Hulu Sungai Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (330, 'Kabupaten Kotabaru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (331, 'Kabupaten Tabalong');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (332, 'Kabupaten Tanah Bumbu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (333, 'Kabupaten Tanah Laut');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (334, 'Kabupaten Tapin');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (335, 'Kota Banjarbaru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (336, 'Kota Banjarmasin');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (337, 'Kabupaten Barito Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (338, 'Kabupaten Barito Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (339, 'Kabupaten Barito Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (340, 'Kabupaten Gunung Mas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (341, 'Kabupaten Kapuas');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (342, 'Kabupaten Katingan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (343, 'Kabupaten Kotawaringin Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (344, 'Kabupaten Kotawaringin Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (345, 'Kabupaten Lamandau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (346, 'Kabupaten Murung Raya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (347, 'Kabupaten Pulang Pisau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (348, 'Kabupaten Sukamara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (349, 'Kabupaten Seruyan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (350, 'Kota Palangka Raya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (351, 'Kabupaten Berau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (352, 'Kabupaten Bulungan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (353, 'Kabupaten Kutai Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (354, 'Kabupaten Kutai Kartanegara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (355, 'Kabupaten Kutai Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (356, 'Kabupaten Malinau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (357, 'Kabupaten Nunukan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (358, 'Kabupaten Paser');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (359, 'Kabupaten Penajam Paser Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (360, 'Kabupaten Tana Tidung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (361, 'Kota Balikpapan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (362, 'Kota Bontang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (363, 'Kota Samarinda');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (364, 'Kota Tarakan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (365, 'Kabupaten Mahakam Ulu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (366, 'Kabupaten Boalemo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (367, 'Kabupaten Bone Bolango');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (368, 'Kabupaten Gorontalo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (369, 'Kabupaten Gorontalo Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (370, 'Kabupaten Pohuwato');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (371, 'Kota Gorontalo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (372, 'Kabupaten Bantaeng');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (373, 'Kabupaten Barru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (374, 'Kabupaten Bone');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (375, 'Kabupaten Bulukumba');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (376, 'Kabupaten Enrekang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (377, 'Kabupaten Gowa');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (378, 'Kabupaten Jeneponto');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (379, 'Kabupaten Kepulauan Selayar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (380, 'Kabupaten Luwu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (381, 'Kabupaten Luwu Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (382, 'Kabupaten Luwu Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (383, 'Kabupaten Maros');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (384, 'Kabupaten Pangkajene dan Kepulauan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (385, 'Kabupaten Pinrang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (386, 'Kabupaten Sidenreng Rappang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (387, 'Kabupaten Sinjai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (388, 'Kabupaten Soppeng');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (389, 'Kabupaten Takalar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (390, 'Kabupaten Tana Toraja');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (391, 'Kabupaten Toraja Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (392, 'Kabupaten Wajo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (393, 'Kota Makassar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (394, 'Kota Palopo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (395, 'Kota Parepare');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (396, 'Kabupaten Bombana');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (397, 'Kabupaten Buton');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (398, 'Kabupaten Buton Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (399, 'Kabupaten Kolaka');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (400, 'Kabupaten Kolaka Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (401, 'Kabupaten Konawe');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (402, 'Kabupaten Konawe Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (403, 'Kabupaten Konawe Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (404, 'Kabupaten Muna');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (405, 'Kabupaten Wakatobi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (406, 'Kota Bau-Bau');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (407, 'Kota Kendari');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (408, 'Kabupaten Banggai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (409, 'Kabupaten Banggai Kepulauan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (410, 'Kabupaten Buol');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (411, 'Kabupaten Donggala');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (412, 'Kabupaten Morowali');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (413, 'Kabupaten Parigi Moutong');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (414, 'Kabupaten Poso');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (415, 'Kabupaten Tojo Una-Una');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (416, 'Kabupaten Toli-Toli');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (417, 'Kabupaten Sigi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (418, 'Kota Palu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (419, 'Kabupaten Bolaang Mongondow');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (420, 'Kabupaten Bolaang Mongondow Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (421, 'Kabupaten Bolaang Mongondow Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (422, 'Kabupaten Bolaang Mongondow Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (423, 'Kabupaten Kepulauan Sangihe');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (424, 'Kabupaten Kepulauan Siau Tagulandang Biaro');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (425, 'Kabupaten Kepulauan Talaud');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (426, 'Kabupaten Minahasa');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (427, 'Kabupaten Minahasa Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (428, 'Kabupaten Minahasa Tenggara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (429, 'Kabupaten Minahasa Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (430, 'Kota Bitung');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (431, 'Kota Kotamobagu');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (432, 'Kota Manado');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (433, 'Kota Tomohon');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (434, 'Kabupaten Majene');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (435, 'Kabupaten Mamasa');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (436, 'Kabupaten Mamuju');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (437, 'Kabupaten Mamuju Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (438, 'Kabupaten Polewali Mandar');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (439, 'Kabupaten Buru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (440, 'Kabupaten Buru Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (441, 'Kabupaten Kepulauan Aru');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (442, 'Kabupaten Maluku Barat Daya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (443, 'Kabupaten Maluku Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (444, 'Kabupaten Maluku Tenggara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (445, 'Kabupaten Maluku Tenggara Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (446, 'Kabupaten Seram Bagian Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (447, 'Kabupaten Seram Bagian Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (448, 'Kota Ambon');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (449, 'Kota Tual');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (450, 'Kabupaten Halmahera Barat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (451, 'Kabupaten Halmahera Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (452, 'Kabupaten Halmahera Utara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (453, 'Kabupaten Halmahera Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (454, 'Kabupaten Kepulauan Sula');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (455, 'Kabupaten Halmahera Timur');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (456, 'Kabupaten Pulau Morotai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (457, 'Kota Ternate');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (458, 'Kota Tidore Kepulauan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (459, 'Kabupaten Asmat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (460, 'Kabupaten Biak Numfor');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (461, 'Kabupaten Boven Digoel');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (462, 'Kabupaten Deiyai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (463, 'Kabupaten Dogiyai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (464, 'Kabupaten Intan Jaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (465, 'Kabupaten Jayapura');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (466, 'Kabupaten Jayawijaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (467, 'Kabupaten Keerom');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (468, 'Kabupaten Kepulauan Yapen');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (469, 'Kabupaten Lanny Jaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (470, 'Kabupaten Mamberamo Raya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (471, 'Kabupaten Mamberamo Tengah');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (472, 'Kabupaten Mappi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (473, 'Kabupaten Merauke');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (474, 'Kabupaten Mimika');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (475, 'Kabupaten Nabire');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (476, 'Kabupaten Nduga');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (477, 'Kabupaten Paniai');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (478, 'Kabupaten Pegunungan Bintang');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (479, 'Kabupaten Puncak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (480, 'Kabupaten Puncak Jaya');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (481, 'Kabupaten Sarmi');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (482, 'Kabupaten Supiori');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (483, 'Kabupaten Tolikara');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (484, 'Kabupaten Waropen');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (485, 'Kabupaten Yahukimo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (486, 'Kabupaten Yalimo');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (487, 'Kota Jayapura');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (488, 'Kabupaten Fakfak');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (489, 'Kabupaten Kaimana');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (490, 'Kabupaten Manokwari');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (491, 'Kabupaten Maybrat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (492, 'Kabupaten Raja Ampat');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (493, 'Kabupaten Sorong');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (494, 'Kabupaten Sorong Selatan');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (495, 'Kabupaten Tambrauw');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (496, 'Kabupaten Teluk Bintuni');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (497, 'Kabupaten Teluk Wondama');
INSERT INTO `tb_kota` (`id_kota`, `nama_kota`) VALUES (498, 'Kota Sorong');


#
# TABLE STRUCTURE FOR: tb_order
#

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
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
  `design_order` text DEFAULT NULL,
  `catatan` text NOT NULL,
  `status_order` int(11) DEFAULT NULL,
  `progres` varchar(200) DEFAULT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `rate` int(1) DEFAULT NULL,
  `ulasan` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_order`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (12, '2022-07-01', 4, 8, 0, 15, 5, 4, 0, 0, 0, 0, 0, 0, 'jaket_hoodie.PNG', 'desain sudah sesuai', 3, 'Cutting - Ada Masalah', 4, 5, 'sangat baik', '2022-07-13 12:04:14');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (19, '2022-06-01', 5, 2, 5, 5, 5, 2, 0, 0, 0, 0, 0, 0, 'jaket_bomber.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 5, 'bahan baik dan bagus', '2022-07-19 12:44:59');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (20, '2022-06-02', 5, 7, 5, 5, 3, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 3, 'bahan sesuai, namun pada bagian gambar kurang jelas', '2022-07-19 12:46:56');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (21, '2022-06-03', 6, 7, 5, 5, 10, 8, 0, 0, 0, 0, 0, 0, 'kaos_polos1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:47:51');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (22, '2022-06-04', 7, 2, 20, 20, 20, 20, 15, 0, 0, 0, 0, 0, 'jaket_versity.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:48:56');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (23, '2022-06-06', 8, 6, 0, 10, 5, 0, 0, 0, 0, 0, 0, 0, 'kemeja_kerja.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 5, 'produk baik', '2022-07-19 12:50:10');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (24, '2022-06-07', 9, 6, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 'kemeja_kerja1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:51:18');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (25, '2022-07-06', 10, 8, 0, 0, 15, 3, 0, 0, 0, 0, 0, 0, 'jaket_hoodie1.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:52:33');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (26, '2022-07-05', 11, 6, 15, 5, 5, 5, 0, 0, 0, 0, 0, 0, 'kemeja_kerja2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:53:49');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (27, '2022-07-07', 12, 6, 20, 50, 50, 21, 0, 0, 0, 0, 0, 0, 'kemeja_kerja3.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:54:52');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (28, '2022-06-09', 13, 2, 0, 20, 20, 52, 0, 0, 0, 0, 0, 0, 'jaket_coach.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:55:57');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (29, '2022-07-07', 13, 7, 0, 0, 20, 10, 2, 0, 0, 0, 0, 0, 'kaos_polos2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 12:56:54');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (30, '2022-07-08', 14, 5, 10, 2, 2, 0, 0, 0, 0, 0, 0, 0, 'jas_almamater.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 4, 'produk sesuai dengan bahan namun ada sedikit cacat', '2022-07-19 12:58:04');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (31, '2022-07-07', 14, 6, 0, 0, 5, 3, 0, 0, 0, 0, 0, 0, 'kemeja_kerja4.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:00:19');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (32, '2022-07-08', 15, 6, 0, 5, 5, 5, 5, 0, 0, 0, 0, 0, 'kemeja_kerja5.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:01:16');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (33, '2022-07-08', 16, 6, 0, 0, 10, 2, 0, 0, 0, 0, 0, 0, 'kemeja_kerja6.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:03:59');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (34, '2022-07-06', 17, 7, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos3.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:05:06');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (35, '2022-06-09', 18, 6, 50, 50, 50, 50, 86, 0, 0, 0, 0, 0, 'kemeja_kerja7.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:07:16');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (36, '2022-06-09', 19, 7, 0, 0, 20, 20, 0, 0, 0, 0, 0, 0, 'kaos_polo.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:08:20');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (37, '2022-06-10', 20, 8, 0, 5, 5, 10, 6, 0, 0, 0, 0, 0, 'jaket_hoodie2.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, NULL, NULL, '2022-07-19 13:09:24');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (38, '2022-07-07', 5, 7, 0, 10, 3, 0, 0, 0, 0, 0, 0, 0, 'kaos_polos4.PNG', 'desain sudah sesuai', 4, 'Pengiriman - Selesai', 4, 4, 'bahan baik', '2022-07-19 13:10:22');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (43, '2022-07-29', 20, 11, 20, 15, 10, 5, 1, 0, 0, 0, 0, 0, 'kemejaaa.jpg', 'Pesanan segera dibuat', 1, 'Cutting - Selesai', 11, NULL, NULL, '2022-07-29 07:08:47');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (44, '2022-07-29', 6, 13, 10, 10, 5, 5, 3, 0, 0, 0, 0, 0, 'Desain-Baju-Kaos-Karang-Taruna.jpg', 'Ordeer segera diselesaikan', 1, NULL, 11, NULL, NULL, '2022-07-29 08:33:38');
INSERT INTO `tb_order` (`id_order`, `tgl_order`, `id_pelanggan`, `id_produk`, `jumlah_ukuran_s`, `jumlah_ukuran_m`, `jumlah_ukuran_l`, `jumlah_ukuran_xl`, `jumlah_ukuran_xxl`, `jumlah_ukuran_s_p`, `jumlah_ukuran_m_p`, `jumlah_ukuran_l_p`, `jumlah_ukuran_xl_p`, `jumlah_ukuran_xxl_p`, `design_order`, `catatan`, `status_order`, `progres`, `id_pegawai`, `rate`, `ulasan`, `created_at`) VALUES (45, '2022-07-29', 4, 13, 10, 10, 10, 10, 5, 0, 0, 0, 0, 0, 'Desain-Baju-Kaos-Karang-Taruna1.jpg', 'segera diselesaikan', 4, 'Pengiriman - Selesai', 11, NULL, NULL, '2022-07-29 08:53:01');


#
# TABLE STRUCTURE FOR: tb_pegawai
#

DROP TABLE IF EXISTS `tb_pegawai`;

CREATE TABLE `tb_pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `gaji_pokok` int(11) NOT NULL,
  `foto` text NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (1, '1234', 'administrator', 'Administrator', 'subangg', 'subang', '2022-03-01', 'Laki-laki', 3000000, 'user.png');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (4, 'tess', 'Pegawai Marketing', 'Staff Marketing', 'tess', 'tess', '2022-12-31', 'Laki-laki', 5000000, 'aj_(2)7.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (5, '123', 'tes cutting', 'Pegawai Cutting', 'tes', 'tes', '2022-04-21', 'Laki-laki', 2000000, 'aj_(2).jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (6, '123', 'tes pegawai jahit', 'Pegawai Jahit', 'bandun', 'bandung', '2022-04-22', 'Laki-laki', 0, 'aj_(2)1.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (7, '123', 'tes pegawai qc', 'Pegawai QC', 'bandung', 'bandung', '2022-12-31', 'Laki-laki', 0, 'aj_(2)2.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (8, '123', 'kepala Keuangan', 'Staff Keuangan', 'subang', 'subang', '2022-12-31', 'Laki-laki', 2000000, 'aj_(2)3.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (9, '123', 'Pegawai Purchase', 'Staff Purchase', 'subang', 'subang', '2022-12-31', 'Laki-laki', 0, 'aj_(2)4.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (10, '123', 'Kepala Produksi', 'Kepala Produksi', 'subangg', 'subang', '2022-12-31', 'Laki-laki', 0, 'Capture.JPG');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (11, '123', 'Faizal nursodik', 'Kepala Marketing', 'bandung', 'bandung', '2022-12-31', 'Laki-laki', 0, 'WhatsApp_Image_2022-06-28_at_22_05_24.jpeg');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (16, '24536576', 'CEO', 'CEO', 'bandung', 'bandung', '2022-07-15', 'Laki-laki', 0, '1.JPG');
INSERT INTO `tb_pegawai` (`id_pegawai`, `nip`, `nama`, `jabatan`, `alamat`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `gaji_pokok`, `foto`) VALUES (17, '202020', 'hendra', 'staff marketing', 'Bandung', 'Bandung', '1999-02-09', 'Laki-laki', 0, 'WhatsApp_Image_2022-06-28_at_21_47_01.jpeg');


#
# TABLE STRUCTURE FOR: tb_pegawai_cutting
#

DROP TABLE IF EXISTS `tb_pegawai_cutting`;

CREATE TABLE `tb_pegawai_cutting` (
  `id_pegawai_cutting` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_pegawai_cutting`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (1, 4, 5, 7, 5000, 2000, '2022-04-23', 'tess', 'tess', 'tess', '2022-04-21 23:12:08');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (2, 4, 12, 1, 2000, 50, '2022-04-23', '1', '1', '-', '2022-06-03 19:16:46');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (3, 6, 12, 12, 5000, 0, '2022-04-23', '1', '1', '-', '2022-06-03 19:52:30');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (4, 8, 5, 50, 5000, 1000, '2022-06-17', '12345', '200', 'tidak ada', '2022-06-17 13:26:48');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (5, 9, 5, 14, 1000, 0, '2022-06-18', 'ac', 'qw', 'raglan', '2022-06-17 14:57:07');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (8, 7, 5, 5, 5000, 2, '2022-07-08', '12345', '200', 'w', '2022-07-13 04:44:32');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (9, 7, 7, 5, 5000, 2, '2022-07-07', 'potongan', '200', 'w', '2022-07-13 04:45:17');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (10, 12, 5, 15, 5000, 0, '2022-06-09', 'pola luar', 'l 15', 'segera ', '2022-07-13 12:12:46');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (11, 19, 5, 17, 5000, 0, '2022-07-30', '12', '12', '', '2022-07-26 06:20:16');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (12, 41, 5, 5, 5000, 2000, '2022-07-30', 'Pola kojo', 'bebas', 'segera diselesaikan', '2022-07-26 19:03:02');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (13, 39, 5, 10, 5000, 0, '2022-07-30', 'potongan luar', 'bebas', 'data ptoong hari rabu', '2022-07-27 21:13:46');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (14, 43, 5, 20, 5000, 0, '2022-07-29', 'Pola Kojo', 'Ukuran S = 20', 'Sedang dalam pengerjaan', '2022-07-29 08:07:18');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (15, 45, 5, 20, 5000, 0, '2022-08-06', 'Pola Kojo', 'S = 10, M = 10', 'sisa 25 potong', '2022-07-29 09:32:36');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (16, 12, 5, 10, 5000, 0, '2022-07-29', 'Pola luar', 'ukuran', 'pola luar', '2022-07-29 23:12:10');
INSERT INTO `tb_pegawai_cutting` (`id_pegawai_cutting`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `pola_potongan`, `detail_ukuran`, `catatan_potongan`, `created_at`) VALUES (17, 12, 5, 10, 5000, 0, '2022-07-29', 'Pola kojo', '5', 'pola kojo', '2022-07-29 23:14:02');


#
# TABLE STRUCTURE FOR: tb_pegawai_jahit
#

DROP TABLE IF EXISTS `tb_pegawai_jahit`;

CREATE TABLE `tb_pegawai_jahit` (
  `id_pegawai_jahit` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kasbon` int(11) NOT NULL,
  `tgl_cair` date NOT NULL,
  `ukuran_pendek` int(11) NOT NULL,
  `ukuran_panjang` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_pegawai_jahit`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (1, 4, 5, 4, 1000, 0, '2022-04-23', 12, 12, '2022-04-22 23:12:40');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (2, 4, 12, 2, 5000, 0, '2022-04-23', 1, 1, '2022-06-03 19:17:22');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (3, 8, 6, 30, 10000, 2000, '2022-06-17', 20, 10, '2022-06-17 13:31:30');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (4, 9, 6, 3, 5000, 0, '2022-06-18', 0, 0, '2022-06-17 15:04:20');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (5, 7, 1, 5, 100000, 70000, '2001-07-12', 10, 20, '2022-07-13 04:00:09');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (6, 19, 6, 17, 10000, 0, '2022-07-30', 3, 14, '2022-07-26 06:20:53');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (7, 41, 6, 5, 10000, 4000, '2022-07-30', 2, 3, '2022-07-26 19:06:50');
INSERT INTO `tb_pegawai_jahit` (`id_pegawai_jahit`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `created_at`) VALUES (8, 45, 6, 20, 5000, 0, '2022-08-06', 10, 10, '2022-07-29 09:36:09');


#
# TABLE STRUCTURE FOR: tb_pegawai_qc
#

DROP TABLE IF EXISTS `tb_pegawai_qc`;

CREATE TABLE `tb_pegawai_qc` (
  `id_pegawai_qc` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `kasbon` int(11) NOT NULL,
  `tgl_cair` date NOT NULL,
  `ukuran_pendek` int(11) NOT NULL,
  `ukuran_panjang` int(11) NOT NULL,
  `keterangan` enum('Lolos','Tidak Lolos') NOT NULL,
  `catatan_revisi` text NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_pegawai_qc`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (1, 4, 5, 2, 10000, 0, '2022-04-23', 12, 12, 'Lolos', '', '2022-04-22 23:19:21');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (2, 4, 12, 3, 2000, 0, '2022-04-23', 1, 1, 'Lolos', '', '2022-06-03 19:17:58');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (3, 8, 7, 20, 10000, 1000, '2022-06-17', 10, 10, 'Lolos', '', '2022-06-17 13:32:12');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (4, 9, 7, 3, 1000, 0, '2022-06-18', 0, 0, 'Lolos', '', '2022-06-17 15:07:24');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (5, 7, 7, 5, 5000, 1000, '2001-10-01', 10, 20, 'Lolos', '', '2022-07-13 04:25:51');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (6, 19, 7, 17, 5000, 0, '2022-07-30', 3, 14, 'Lolos', '', '2022-07-26 06:21:25');
INSERT INTO `tb_pegawai_qc` (`id_pegawai_qc`, `id_order`, `id_pegawai`, `jumlah`, `harga`, `kasbon`, `tgl_cair`, `ukuran_pendek`, `ukuran_panjang`, `keterangan`, `catatan_revisi`, `created_at`) VALUES (7, 45, 7, 20, 5000, 0, '2022-08-06', 10, 10, 'Lolos', '', '2022-07-29 09:41:53');


#
# TABLE STRUCTURE FOR: tb_pelanggan
#

DROP TABLE IF EXISTS `tb_pelanggan`;

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(200) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `id_kota` int(11) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (4, 'Ivan', 'Laki-laki', '08992548197', 'Bandung', 177, 'Asbuj', 'ivan01', '$2y$10$yb122hmY03AYqQUjhFD.AusULmIDB/R0DRtk1dzrBIktA.8cWFoj6');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (5, 'Eza Raka', 'Laki-laki', '0852120156206', 'taman sari', 177, 'hallyu project', 'ezaraka02', '$2y$10$jGoK/tS9weCw9wBb3DzBqO2rh9QJh6CAfOyFGnzsDZCYNIA5B4KCy');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (6, 'Repan', 'Laki-laki', '085156548425', 'jakarta', 188, 'UPN jakarta', 'repan03', '$2y$10$dqBXcA8cK9pdDS9iVYd0N.3cZmC8HRXitKJEpXj.nD17sDeVP5ePe');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (7, 'Fadia', 'Laki-laki', '085930089630', 'jatinangor', 173, 'HIMA Matematika UNPAD', 'fadia04', '$2y$10$jXb6ZwrCDIcomq1po5P.Te2HZpkACYBV6fyhahbVIwc1Mf/QcqUci');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (8, 'Agnesa', 'Perempuan', '085524892274', 'bandung', 177, 'Radio Station Unpar', 'agnesa05', '$2y$10$se6MUyw7f3H9pmO/UJ5vTeVLmTlRsiuPETmzxEgSw.sC/oloMxeIy');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (9, 'Iqbal Maulana', 'Perempuan', '0858724964296', 'jatinangor', 175, 'Pena Budaya FIB Unpad', 'iqbal06', '$2y$10$TxKlnNIfiQ8X4j1OduLc1e17LEwB8FIP1Jdc.wALiclUoDeMWFkIm');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (10, 'Yandi', 'Laki-laki', '085624046978', 'majalengka', 171, 'Patriot desa majalengka', 'yandi07', '$2y$10$xHtcJKwd/RaNHyP1t8kp4.MKBl.QMvK0njk0rBevkXxVD1BeN/5Vy');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (11, 'Ledy', 'Laki-laki', '082248914065', 'ambon', 448, 'Teknik sipil Politeknik negeri ambon', 'ledy08', '$2y$10$9drvA1thHXm0xIOG14tXbePB07fnGB5sNEM1F3Kpe1PLxBbCW1g12');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (12, 'Hanisa', 'Perempuan', '089658142844', 'Bandung', 177, 'akuntansi UNISBA', 'hanisa09', '$2y$10$U5dIQy4sWmtgJ1i4fYNa9OUcWuYrxol4n.fNNUgZ/OgLJhXmV5Uke');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (13, 'Dede Winda', 'Laki-laki', '081214140932', 'jatinangor', 175, 'Universitas Padjajaran', 'dede010', '$2y$10$S0Po42oePm9/2X14Zc9/qeRpT5kUAAdwknSTjYYilosgTPK2Ayqg6');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (14, 'Adelresa', 'Perempuan', '082218273333', 'Bandung', 177, 'ITENAS', 'adelresa011', '$2y$10$O1Uk3q7UNqrC84tXb9M0r.c3f3Dwrgyis24FgRy2rrTqeqr1MTY4i');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (15, 'Aditya', 'Laki-laki', '08127720947', 'Bandung', 177, 'Distro Foreman', 'aditya012', '$2y$10$jaEOkSFxwi013V5P6ht8zuvkA/tFzii7yp5kDfTkfqHNmu4Th1HM6');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (16, 'Adit Hapsah', 'Laki-laki', '085888806990', 'subang', 173, 'PT. Primafood Internasional', 'adith013', '$2y$10$KU2R8t7kWqTYAlWHcsWdvO1.edtgKIjcck5bvYAa5KeUsyDEG5y9S');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (17, 'Mamin', 'Laki-laki', '085294226415', 'Bandung', 160, 'Toko Mas Cahyani', 'mamin014', '$2y$10$pzf5Ui52SvgrwhmZRgWiyeqMerSuKytqfCn.Y0Pjp4VHQLfQCSf.C');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (18, 'Jaka', 'Laki-laki', '081222451380', 'Bandung', 160, 'BEM FH PMB', 'jaka015', '$2y$10$FhMppCDaAw64cXtOyhNtYOBSniV41gmn9CaVbruQ.0nigAtbljo06');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (19, 'Raymond', 'Laki-laki', '08118122708', 'tarakan', 364, 'Pertamina Kalimantan Utara', 'raymond016', '$2y$10$eULfXDeM9iXK9x9Mm5Lhx.zGNuUBB.3j3rclYqETDEMQ5ydmVHMQu');
INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jenis_kelamin`, `no_telepon`, `alamat`, `id_kota`, `instansi`, `username`, `password`) VALUES (20, 'Farel akbar', 'Laki-laki', '08161891650', 'depok', 183, 'FH UI', 'farel017', '$2y$10$9r.l4.FpXz.hspW3llzl2uRUVfLO0O2dJKsq544o/sCRrhAdcHnMS');


#
# TABLE STRUCTURE FOR: tb_pemasukan
#

DROP TABLE IF EXISTS `tb_pemasukan`;

CREATE TABLE `tb_pemasukan` (
  `id_pemasukan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `id_jenis_pemasukan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `referensi` varchar(100) NOT NULL,
  `jumlah` double NOT NULL,
  PRIMARY KEY (`id_pemasukan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES (1, '2022-06-01', 1, 'Order 1', 'tes', '1200000');
INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES (2, '2022-06-02', 1, 'Order 2', 'ref 2', '2500000');
INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES (6, '2022-06-30', 1, 'Pembayaran Order Jaket - PT. XYZ', '-', '100');
INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES (7, '2022-06-27', 1, 'Pembayaran Order Jaket - PT. XYZ', '-', '700000');
INSERT INTO `tb_pemasukan` (`id_pemasukan`, `tanggal`, `id_jenis_pemasukan`, `keterangan`, `referensi`, `jumlah`) VALUES (8, '2022-08-01', 4, 'modal pribadi', '-', '100000000');


#
# TABLE STRUCTURE FOR: tb_pendapatan_order
#

DROP TABLE IF EXISTS `tb_pendapatan_order`;

CREATE TABLE `tb_pendapatan_order` (
  `id_pendapatan_order` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `bukti_pendapatan` text NOT NULL,
  `keterangan` text NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_pendapatan_order`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pendapatan_order` (`id_pendapatan_order`, `id_order`, `id_pegawai`, `tanggal`, `jumlah`, `bukti_pendapatan`, `keterangan`, `status`) VALUES (3, 4, 4, '2022-06-30', 100, '', 'Pembayaran Order Jaket - PT. XYZ', 1);
INSERT INTO `tb_pendapatan_order` (`id_pendapatan_order`, `id_order`, `id_pegawai`, `tanggal`, `jumlah`, `bukti_pendapatan`, `keterangan`, `status`) VALUES (4, 4, 4, '2022-06-27', 700000, '', 'Pembayaran Order Jaket - PT. XYZ', 1);
INSERT INTO `tb_pendapatan_order` (`id_pendapatan_order`, `id_order`, `id_pegawai`, `tanggal`, `jumlah`, `bukti_pendapatan`, `keterangan`, `status`) VALUES (6, 14, 11, '2022-07-23', 200000, 'rev1.png', 'Pembayaran Order kaos - UPN jakarta', 0);
INSERT INTO `tb_pendapatan_order` (`id_pendapatan_order`, `id_order`, `id_pegawai`, `tanggal`, `jumlah`, `bukti_pendapatan`, `keterangan`, `status`) VALUES (7, 44, 11, '2022-07-31', 500000, 'a_(2).png', 'Order Kaos Olahraga - UPN jakarta', 0);


#
# TABLE STRUCTURE FOR: tb_pengajuan
#

DROP TABLE IF EXISTS `tb_pengajuan`;

CREATE TABLE `tb_pengajuan` (
  `id_pengajuan` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `bukti_pengajuan` text NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_pengajuan`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (5, 1, '2022-06-27', 'beli bahan', '1000000', '', 9, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (6, 3, '2022-06-30', 'acara kampus', '500000', '', 4, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (7, 3, '2022-07-10', 'sedekah', '50000', '', 8, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (8, 3, '2022-07-12', 'gaji jahit', '20000', '', 10, 1);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (9, 1, '2022-07-12', 'tes', '2000000', 'BOM_List_(10).pdf', 1, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (10, 3, '2022-07-14', 'Tyu', '5000', 'Screenshot_20220713_012000.jpg', 11, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (11, 1, '2022-07-30', 'beli bahan', '2000000', '2.png', 8, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (12, 2, '2022-07-16', 'beli bahan', '100000', '21.png', 10, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (13, 3, '2022-07-15', 'bebas', '5000', 'contoh.jpg', 11, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (14, 2, '2022-07-16', 'gaji karyawan', '66666', 'CV_-_Eulis_.pdf', 1, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (15, 4, '2022-07-30', 'transportasi', '200000', 'Capture.PNG', 16, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (16, 4, '2022-07-19', 'transportasi', '150000', 'rev_4.png', 8, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (17, 1, '2022-07-29', 'beliii bahannn', '1000000', 'a_(2).png', 8, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (18, 1, '2022-07-26', 'Beli bahan', '21580000', 'BOM_List_(1).pdf', 10, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (19, 3, '2022-07-28', 'tes', '1000', '2798326-middle.png', 1, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (20, 1, '2022-07-28', 'Pembelian Bahan', '1000', 'BOM_List_(7).pdf', 1, 2);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (21, 1, '2022-07-29', 'Pembelian bahan order kaos olahraga', '3625000', 'BOM_List_(14).pdf', 10, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (25, 3, '2022-07-30', 'tes', '1000', 'aj_(2)3.jpeg', 1, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (26, 4, '2022-08-01', 'transportasi', '400000', '22.png', 8, 0);
INSERT INTO `tb_pengajuan` (`id_pengajuan`, `id_jenis_pengeluaran`, `tanggal`, `keterangan`, `jumlah`, `bukti_pengajuan`, `id_pegawai`, `status`) VALUES (27, 4, '2022-08-03', 'beli pakan', '10000', 'Desain-Baju-Kaos-Karang-Taruna.jpg', 10, 0);


#
# TABLE STRUCTURE FOR: tb_pengajuan_hpp
#

DROP TABLE IF EXISTS `tb_pengajuan_hpp`;

CREATE TABLE `tb_pengajuan_hpp` (
  `id_pengajuan_hpp` int(11) NOT NULL AUTO_INCREMENT,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bank` varchar(20) NOT NULL,
  `no_rekening` varchar(29) NOT NULL,
  `nama_rekening` varchar(100) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `jumlah` double NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_pengajuan_hpp`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pengajuan_hpp` (`id_pengajuan_hpp`, `id_jenis_pengeluaran`, `id_order`, `tanggal`, `bank`, `no_rekening`, `nama_rekening`, `keterangan`, `jumlah`, `id_pegawai`, `status`) VALUES (6, 1, 43, '2022-07-29', 'BCA', '221006xxx', 'A. N Rifki', 'Order Kemeja Himpunan - FH UI', '1736200', 10, 3);
INSERT INTO `tb_pengajuan_hpp` (`id_pengajuan_hpp`, `id_jenis_pengeluaran`, `id_order`, `tanggal`, `bank`, `no_rekening`, `nama_rekening`, `keterangan`, `jumlah`, `id_pegawai`, `status`) VALUES (7, 1, 45, '2022-07-29', 'BNI', '222xxx', 'Ari', 'HPP Order Kaos Olahraga - Asbuj', '3625000', 1, 0);


#
# TABLE STRUCTURE FOR: tb_pengeluaran
#

DROP TABLE IF EXISTS `tb_pengeluaran`;

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `id_jenis_pengeluaran` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `referensi` varchar(100) NOT NULL,
  `jumlah` double NOT NULL,
  PRIMARY KEY (`id_pengeluaran`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (1, '2022-06-02', 1, 'HPP Order 1', 'ref 1', '1000000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (2, '2022-06-01', 1, 'HPP Order 2', 'Ref 2', '2000000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (7, '2022-04-23', 2, 'Gaji Mingguan Produksi', '-', '134950');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (10, '2022-06-17', 2, 'gaji cutting', '-', '249000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (14, '2022-06-27', 1, 'beli bahan', '-', '1000000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (18, '2022-06-30', 3, 'acara kampus', '-', '500000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (19, '2022-07-10', 3, 'sedekah', '-', '50000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (20, '2022-07-30', 2, 'gaji manajemen', '-', '3420007');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (22, '2022-07-12', 1, 'tes', '-', '2000000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (32, '2022-07-28', 1, 'Pembelian Bahan', '-', '1000');
INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tanggal`, `id_jenis_pengeluaran`, `keterangan`, `referensi`, `jumlah`) VALUES (33, '2022-07-29', 1, 'Order Kemeja Himpunan - FH UI', '-', '1736200');


#
# TABLE STRUCTURE FOR: tb_pengiriman
#

DROP TABLE IF EXISTS `tb_pengiriman`;

CREATE TABLE `tb_pengiriman` (
  `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_pengiriman` text DEFAULT NULL,
  `catatan_pengiriman` text DEFAULT NULL,
  `status_pengiriman` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_pengiriman`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (1, 4, 10, 'BOM_List_(2).pdf', 'tes kirim', 4, '2022-07-04 23:26:26');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (2, 5, 1, '', '', 0, '2022-04-27 17:31:05');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (3, 6, 10, '', '', 4, '2022-06-27 20:12:55');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (4, 8, 10, '', '', 4, '2022-06-17 13:32:33');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (5, 9, 10, '', '', 4, '2022-06-17 15:31:48');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (8, 7, 0, NULL, NULL, 0, '2022-07-12 17:34:27');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (10, 12, 1, 'jaket_hoodie.PNG', 'telah dikirim', 4, '2022-07-13 12:14:08');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (12, 14, 11, '', '', 2, '2022-07-15 02:44:12');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (14, 17, 1, '', '', 1, '2022-07-16 19:53:46');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (17, 19, 1, '', '', 4, '2022-07-29 21:57:20');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (18, 20, 1, 'kaos_polos.PNG', 'selesai', 4, '2022-07-19 19:55:54');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (19, 21, 1, 'kaos_polos1.PNG', 'selesai', 4, '2022-07-19 19:57:38');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:51');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (21, 23, 1, 'kemeja_kerja.PNG', 'selesai', 4, '2022-07-19 19:49:28');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (22, 24, 1, 'kemeja_kerja1.PNG', 'selesai', 4, '2022-07-19 19:50:04');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (23, 25, 1, 'jaket_hoodie1.PNG', 'selesai', 4, '2022-07-19 20:04:03');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (24, 26, 1, 'kemeja_kerja2.PNG', 'selesai', 4, '2022-07-19 19:50:35');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (25, 27, 1, 'kemeja_kerja3.PNG', 'selesai', 4, '2022-07-19 19:52:58');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (26, 28, 1, 'jaket_bomber.PNG', 'selesai', 4, '2022-07-19 19:47:38');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (27, 29, 1, 'kaos_polos2.PNG', 'selesai', 4, '2022-07-19 19:59:52');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (28, 30, 1, 'jas_almamater.PNG', 'selesai', 4, '2022-07-19 19:48:38');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (29, 31, 1, 'kemeja_kerja4.PNG', 'selesai', 4, '2022-07-19 19:53:31');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (30, 32, 1, 'kemeja_kerja5.PNG', 'selesai', 4, '2022-07-19 19:54:01');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (31, 33, 1, 'kemeja_kerja6.PNG', 'selesai', 4, '2022-07-19 19:54:37');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (32, 34, 1, 'kaos_polos3.PNG', 'selesai', 4, '2022-07-19 20:01:10');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (33, 35, 1, 'kemeja_kerja7.PNG', 'selesai', 4, '2022-07-19 19:55:15');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (34, 36, 1, 'kaos_polos4.PNG', 'selesai', 4, '2022-07-19 20:02:25');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (35, 37, 1, 'jaket_hoodie2.PNG', 'selesai', 4, '2022-07-19 20:09:05');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (36, 38, 1, 'kaos_polos5.PNG', 'selesai', 4, '2022-07-19 20:03:10');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (39, 41, 10, '', '', 3, '2022-07-28 21:59:05');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_pengiriman` (`id_pengiriman`, `id_order`, `id_pegawai`, `file_pengiriman`, `catatan_pengiriman`, `status_pengiriman`, `updated_at`) VALUES (43, 45, 10, '', 'pengiriman selesai', 4, '2022-07-29 09:42:20');


#
# TABLE STRUCTURE FOR: tb_produk
#

DROP TABLE IF EXISTS `tb_produk`;

CREATE TABLE `tb_produk` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (2, 'Jaket', 'Jaket', 'bahan 1', 'IMG_20220629_185007.jpg', '0.9', '0.93', '0', '0', '0', '0', '0', '0', '0', '0', '20000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (5, 'Jas', 'jas almamater', 'jas', 'jas_almamater.PNG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (6, 'Kemeja', 'kemeja', 'kemeja', 'kemeja_kerja.PNG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (7, 'Kaos', 'kaos', 'kaos', 'kaos_polos.PNG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (8, 'Sweater', 'sweater', 'sweater', 'jaket_hoodie.PNG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (10, 'Jaket Xxx', 'Jaket Bomber', 'Plestisol', 'jaket_bomber.PNG', '5', '6', '7', '8', '9', '0', '0', '0', '0', '0', '10000', '5', '5', '6', '7', '7', '5000', '2', '2', '3', '4', '5', '15000', '1', '1', '2', '2', '2', '5000', '1', '1', '2', '3', '3', '5000');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (11, 'Kemeja', 'Kemeja Himpunan', 'Drill', 'kemejaaa.jpg', '1', '1', '1', '2', '2', '0', '0', '0', '0', '0', '30000', '5', '5', '5', '6', '7', '100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (12, 'Kaos', 'Kaos Karang Taruna', 'Combed 30s', 'Desain-Baju-Kaos-Karang-Taruna.jpg', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '25000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '15000');
INSERT INTO `tb_produk` (`id_produk`, `jenis_produk`, `nama_produk`, `bahan`, `foto_produk`, `pnj_kain_s`, `pnj_kain_m`, `pnj_kain_l`, `pnj_kain_xl`, `pnj_kain_xxl`, `pnj_kain_s_p`, `pnj_kain_m_p`, `pnj_kain_l_p`, `pnj_kain_xl_p`, `pnj_kain_xxl_p`, `harga_kain`, `jml_kancing_s`, `jml_kancing_m`, `jml_kancing_l`, `jml_kancing_xl`, `jml_kancing_xxl`, `harga_kancing`, `pnj_resleting_s`, `pnj_resleting_m`, `pnj_resleting_l`, `pnj_resleting_xl`, `pnj_resleting_xxl`, `harga_resleting`, `jml_prepet_s`, `jml_prepet_m`, `jml_prepet_l`, `jml_prepet_xl`, `jml_prepet_xxl`, `harga_prepet`, `pnj_rib_s`, `pnj_rib_m`, `pnj_rib_l`, `pnj_rib_xl`, `pnj_rib_xxl`, `harga_rib`) VALUES (13, 'Kaos', 'Kaos Olahraga', 'Drill', 'Desain-Baju-Kaos-Karang-Taruna1.jpg', '1', '1', '1', '2', '2', '0', '0', '0', '0', '0', '50000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '2', '3', '4', '5', '5000');


#
# TABLE STRUCTURE FOR: tb_purchase
#

DROP TABLE IF EXISTS `tb_purchase`;

CREATE TABLE `tb_purchase` (
  `id_purchase` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_purchase` text DEFAULT NULL,
  `catatan_purchase` text DEFAULT NULL,
  `status_purchase` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_purchase`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (2, 4, 1, '7__SOAL_UAS-STATISTIKA_SOSIAL-PRODY_NEGARA_KARYAWAN_P2K.pdf', 'tes', 4, '2022-04-22 23:20:23');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (3, 5, 1, '', '', 0, '2022-04-27 17:30:42');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (4, 6, 1, '', '', 1, '2022-06-22 20:01:44');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (5, 8, 1, 'AFRAHJPG.jpg', 'segera', 4, '2022-06-17 13:23:50');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (6, 9, 0, NULL, NULL, 0, '2022-06-17 14:47:25');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (7, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (8, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (9, 7, 1, '', '', 3, '2022-07-13 00:56:44');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (10, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (11, 12, 1, 'jaket_hoodie.PNG', 'bahan segera dibeli', 4, '2022-07-13 12:10:21');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (12, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (13, 14, 11, '', 'ada kendala pemadaman listrik yang menyebabnya terganggu dalam proses produksi', 3, '2022-07-15 02:25:50');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (14, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (15, 17, 1, '', '', 0, '2022-07-16 19:51:43');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (16, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (17, 18, 16, '', '', 0, '2022-07-19 07:04:11');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (18, 19, 1, '', '', 4, '2022-07-19 13:00:15');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (19, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (20, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (21, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:12:19');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (22, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (23, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (24, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (25, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (26, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (27, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (28, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (29, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (30, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (31, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (32, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (33, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (34, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (35, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (36, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (37, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (38, 39, 10, '', '', 4, '2022-07-28 14:20:11');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (39, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (40, 41, 9, 'Laporan_Order_-_Eza_Raka(0852120156206)_.pdf', '', 4, '2022-07-27 20:22:35');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (41, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (42, 43, 10, '', '', 4, '2022-07-29 16:57:32');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (43, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_purchase` (`id_purchase`, `id_order`, `id_pegawai`, `file_purchase`, `catatan_purchase`, `status_purchase`, `updated_at`) VALUES (44, 45, 9, 'Desain-Baju-Kaos-Karang-Taruna.jpg', 'selesai membeli bahan', 4, '2022-07-29 09:25:20');


#
# TABLE STRUCTURE FOR: tb_qc
#

DROP TABLE IF EXISTS `tb_qc`;

CREATE TABLE `tb_qc` (
  `id_qc` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `file_qc` text DEFAULT NULL,
  `catatan_qc` text DEFAULT NULL,
  `status_qc` int(11) NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_qc`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (1, 4, 1, '5533-15688-1-PB.pdf', 'tes qc', 4, '2022-04-22 23:20:47');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (2, 5, 1, '', '', 0, '2022-04-27 17:31:01');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (3, 6, 0, NULL, NULL, 0, '2022-05-29 21:13:32');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (4, 8, 10, '', '', 4, '2022-06-17 13:32:23');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (5, 9, 1, '', '', 4, '2022-06-28 18:16:25');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (6, 10, 0, NULL, NULL, 0, '2022-06-28 18:24:41');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (7, 5, 0, NULL, NULL, 0, '2022-07-12 17:32:29');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (8, 7, 1, '', '', 2, '2022-07-13 05:02:56');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (9, 11, 0, NULL, NULL, 0, '2022-07-12 17:45:03');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (10, 12, 1, 'jaket_hoodie.PNG', 'selesai di packing', 4, '2022-07-13 12:13:46');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (11, 13, 0, NULL, NULL, 0, '2022-07-15 01:49:41');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (12, 14, 11, 'contoh.jpg', 'asd', 2, '2022-07-15 02:41:53');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (13, 15, 0, NULL, NULL, 0, '2022-07-15 02:49:43');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (14, 17, 0, NULL, NULL, 0, '2022-07-15 04:53:05');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (15, 16, 0, NULL, NULL, 0, '2022-07-15 07:23:04');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (16, 18, 0, NULL, NULL, 0, '2022-07-16 20:14:59');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (17, 19, 1, '', '', 4, '2022-07-19 13:00:38');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (18, 20, 0, NULL, NULL, 0, '2022-07-19 12:46:56');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (19, 21, 0, NULL, NULL, 0, '2022-07-19 12:47:51');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (20, 22, 1, 'jaket_versity.PNG', 'selesai', 4, '2022-07-19 13:13:32');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (21, 23, 0, NULL, NULL, 0, '2022-07-19 12:50:10');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (22, 24, 0, NULL, NULL, 0, '2022-07-19 12:51:18');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (23, 25, 0, NULL, NULL, 0, '2022-07-19 12:52:33');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (24, 26, 0, NULL, NULL, 0, '2022-07-19 12:53:49');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (25, 27, 0, NULL, NULL, 0, '2022-07-19 12:54:52');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (26, 28, 0, NULL, NULL, 0, '2022-07-19 12:55:57');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (27, 29, 0, NULL, NULL, 0, '2022-07-19 12:56:54');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (28, 30, 0, NULL, NULL, 0, '2022-07-19 12:58:04');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (29, 31, 0, NULL, NULL, 0, '2022-07-19 13:00:19');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (30, 32, 0, NULL, NULL, 0, '2022-07-19 13:01:16');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (31, 33, 0, NULL, NULL, 0, '2022-07-19 13:03:59');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (32, 34, 0, NULL, NULL, 0, '2022-07-19 13:05:06');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (33, 35, 0, NULL, NULL, 0, '2022-07-19 13:07:16');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (34, 36, 0, NULL, NULL, 0, '2022-07-19 13:08:20');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (35, 37, 0, NULL, NULL, 0, '2022-07-19 13:09:24');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (36, 38, 0, NULL, NULL, 0, '2022-07-19 13:10:22');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (37, 39, 0, NULL, NULL, 0, '2022-07-21 18:26:19');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (38, 40, 0, NULL, NULL, 0, '2022-07-26 17:54:00');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (39, 41, 10, '', '', 4, '2022-07-27 20:07:40');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (40, 42, 0, NULL, NULL, 0, '2022-07-28 14:01:55');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (41, 43, 0, NULL, NULL, 0, '2022-07-29 07:08:47');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (42, 44, 0, NULL, NULL, 0, '2022-07-29 08:33:38');
INSERT INTO `tb_qc` (`id_qc`, `id_order`, `id_pegawai`, `file_qc`, `catatan_qc`, `status_qc`, `updated_at`) VALUES (43, 45, 10, '', '', 4, '2022-07-29 09:42:01');


#
# TABLE STRUCTURE FOR: tb_rekapitulasi
#

DROP TABLE IF EXISTS `tb_rekapitulasi`;

CREATE TABLE `tb_rekapitulasi` (
  `id_rekapitulasi` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `jas` int(11) NOT NULL,
  `jaket` int(11) NOT NULL,
  `kaos` int(11) NOT NULL,
  `kemeja` int(11) NOT NULL,
  `sweater` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  PRIMARY KEY (`id_rekapitulasi`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (1, 5, 0, 17, 13, 0, 0, 30);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (2, 6, 0, 0, 28, 0, 0, 28);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (3, 7, 0, 95, 0, 0, 0, 95);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (4, 8, 0, 0, 0, 15, 0, 15);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (5, 9, 0, 0, 0, 20, 0, 20);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (6, 13, 0, 92, 0, 0, 0, 92);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (7, 18, 0, 0, 0, 286, 0, 286);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (8, 19, 0, 0, 40, 0, 0, 40);
INSERT INTO `tb_rekapitulasi` (`id_rekapitulasi`, `id_pelanggan`, `jas`, `jaket`, `kaos`, `kemeja`, `sweater`, `total`) VALUES (9, 20, 0, 0, 0, 0, 26, 26);


#
# TABLE STRUCTURE FOR: tb_rekening
#

DROP TABLE IF EXISTS `tb_rekening`;

CREATE TABLE `tb_rekening` (
  `id_rekening` int(11) NOT NULL AUTO_INCREMENT,
  `bank` varchar(20) NOT NULL,
  `nama_rekening` varchar(50) NOT NULL,
  `no_rekening` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rekening`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `tb_rekening` (`id_rekening`, `bank`, `nama_rekening`, `no_rekening`) VALUES (2, 'BNI', 'Ari', '222xxx');


#
# TABLE STRUCTURE FOR: tb_upah_cutting
#

DROP TABLE IF EXISTS `tb_upah_cutting`;

CREATE TABLE `tb_upah_cutting` (
  `id_upah_cutting` int(11) NOT NULL AUTO_INCREMENT,
  `upah_cutting` int(11) NOT NULL,
  PRIMARY KEY (`id_upah_cutting`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tb_upah_cutting` (`id_upah_cutting`, `upah_cutting`) VALUES (1, 5000);


#
# TABLE STRUCTURE FOR: tb_upah_jahit
#

DROP TABLE IF EXISTS `tb_upah_jahit`;

CREATE TABLE `tb_upah_jahit` (
  `id_upah_jahit` int(11) NOT NULL AUTO_INCREMENT,
  `upah_jahit` int(11) NOT NULL,
  PRIMARY KEY (`id_upah_jahit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tb_upah_jahit` (`id_upah_jahit`, `upah_jahit`) VALUES (1, 10000);


#
# TABLE STRUCTURE FOR: tb_upah_qc
#

DROP TABLE IF EXISTS `tb_upah_qc`;

CREATE TABLE `tb_upah_qc` (
  `id_upah_qc` int(11) NOT NULL AUTO_INCREMENT,
  `upah_qc` int(11) NOT NULL,
  PRIMARY KEY (`id_upah_qc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tb_upah_qc` (`id_upah_qc`, `upah_qc`) VALUES (1, 5000);


#
# TABLE STRUCTURE FOR: tb_vendor
#

DROP TABLE IF EXISTS `tb_vendor`;

CREATE TABLE `tb_vendor` (
  `id_vendor` int(11) NOT NULL AUTO_INCREMENT,
  `nama_vendor` varchar(200) NOT NULL,
  `alamat_vendor` text NOT NULL,
  `kontak_vendor` varchar(20) NOT NULL,
  `no_rekening_vendor` varchar(20) NOT NULL,
  `nama_rekening_vendor` varchar(50) NOT NULL,
  `bank_vendor` varchar(20) NOT NULL,
  PRIMARY KEY (`id_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO `tb_vendor` (`id_vendor`, `nama_vendor`, `alamat_vendor`, `kontak_vendor`, `no_rekening_vendor`, `nama_rekening_vendor`, `bank_vendor`) VALUES (1, 'Toko 1A Tamim', 'Tes', '081321771653', '1571477900', 'Yo Tong Eng', 'BCA');


