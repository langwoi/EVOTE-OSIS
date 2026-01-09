-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2026 at 08:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'adminsokasik');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `visi` text NOT NULL,
  `misi` text NOT NULL,
  `votes` int(11) DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `photo`, `visi`, `misi`, `votes`, `vote`) VALUES
(21, 'Kandidat 1', '1767661932_18.jpg', 'Mewujudkan OSIS yang aktif, kreatif, dan bersatu, menjadi wadah gerak siswa yang seru, bermanfaat, dan berdampak positif bagi seluruh sekolah.', '1.	Mendorong budaya saling menghargai dan mendukung. Membuat sekolah menjadi tempat yang ramah, aman, dan nyaman untuk semua siswa.\r\n2.	Menampung dan menyampaikan aspirasi siswa. Agar setiap suara siswa didengar dan diperhatikan.\r\n3.	Mendorong budaya kerja OSIS yang sehat dan suportif. Dengan komunikasi terbuka, kerja tim nyaman, dan koordinasi efektif.\r\n4.	Menyelenggarakan kegiatan kolaborasi antar-ekskul secara rutin. Supaya sekolah lebih hidup dan siswa makin solid.\r\n5. Mengembangkan bakat dan potensi siswa dari segi akademi maupun non akademik agar bisa menjadi siswa yang berprestasi\r\n6. menjaga keharmonisan antar siswa maupun guru di dalam lingkungan sekolah\r\n7. membangun karakter yang disiplin berakhlak mulia serta bertanggung jawab.\r\n8. ⁠Menyediakan alat bantu standar OSIS. Seperti template proposal, laporan, dan checklist, untuk mempermudah pengurus lain.', 0, 132),
(22, 'Kandidat 2', '1767661946_19.jpg', '\"Menjadikan Siswa Siswi Dan OSIS SMK Semen Gresik Yang Inklusif, Religious Dan Berintegritas. Penggerak Utama Kemajuan Sekolah Melalui Program Kerja Yang Positif Dan Konstruktif, Serta Menjalin Kerja Sama Yang Harmonis Antara Siswa, Guru Dan Lingkungan Sekitar. ', '1.	Mewujudkan Program Kerja Positif Dan   Berdampak.\r\n2.	Selalu Patuh Serta Mentaati Segala Aspek Tentang Keagamaan Dan Selelu Memegang Teguh Tuhan Yang Maha Esa.\r\n3.	Meningkatkan Kompetensi Dan Karakter Peserta Didik.\r\n4.	Membangun Budaya Kepemimpinan Melayani.\r\n5.	Mengintegrasikan Aspirasi Peserta Didik.', 0, 208),
(23, 'kandidat 3', '1767661954_20.jpg', 'Mewujudkan OSIS SMK Semen Gresik sebagai jantung sekolah yang aktif, kreatif, dan berdaya guna bagi seluruh warga sekolah serta menjadikan OSIS SMK Semen Gresik yang inovatif, berprestasi, dan menjadikan wadah pengembangan diri siswa yang berkarakter.', 'Menjadikan OSIS sebagai sarana menampung inspirasi dan aspira siswa siswi SMK Semen Gresik\r\n\r\nMeningkatkan kesadaran akan pentingnya menjaga lingkungan area sekolah\r\n', 0, 159);

-- --------------------------------------------------------

--
-- Table structure for table `guru_admin`
--

CREATE TABLE `guru_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `has_voted` tinyint(1) DEFAULT 0,
  `candidate_id` int(11) DEFAULT NULL,
  `voted_at` datetime DEFAULT NULL,
  `mapel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru_admin`
--

INSERT INTO `guru_admin` (`id`, `username`, `password`, `has_voted`, `candidate_id`, `voted_at`, `mapel`) VALUES
(39, 'ADE PRIYO WIDHIKDHO,S.Pd.,M.Eng', '', 1, 23, NULL, 'Guru Produktif Teknik Mesin'),
(40, 'WINHARENDRA PRAMA PUTRA', '', 1, 22, NULL, 'GURU'),
(41, 'ichsan', '', 1, 22, NULL, 'kep sek'),
(42, 'Sabrina Apriliawati Saad', '', 1, 22, NULL, 'Guru Matematika'),
(43, 'siti nurhayati', '', 1, 22, NULL, 'Guru Matematika'),
(44, 'dwi retno indayani', '', 1, 22, NULL, 'Guru Matematika'),
(45, 'gresiana khoirotul badriyah', '', 1, 22, NULL, 'guru produktif kimia industri'),
(46, 'umi karuniawati', '', 1, 22, NULL, 'guru TOI'),
(47, 'JUYANA', '', 1, 22, NULL, 'Guru Kimia Industri'),
(48, 'DWI KRISTIANTO', '', 1, 21, NULL, 'GURU SENI BUDAYA'),
(49, 'Budi Setiawan', '', 1, 22, NULL, 'Guru B. Inggris'),
(50, 'sri wintarti', '', 1, 23, NULL, 'guru bahasa indonesia'),
(51, 'sigit indriawam', '', 1, 22, NULL, 'guru pjok'),
(52, 'Vivi Nur Faidah', '', 1, 22, NULL, 'Guru Bahasa Indonesia'),
(53, 'Wiwik Fibriati', '', 1, 22, NULL, 'Guru IPAS / PKK'),
(54, 'nurkhayadin', '', 1, 22, NULL, 'tata usaha'),
(55, 'RISA ARJANI FATIMAH', '', 1, 22, NULL, 'TU'),
(56, 'indra tri p', '', 1, 23, NULL, 'guru rpl'),
(57, 'Akhmad Junaidi', '', 1, 23, NULL, 'Guru Listrik'),
(58, 'Mohammad Basjir', '', 1, 22, NULL, 'Wakasek U. Sarpras'),
(59, 'RESTI', '', 1, 21, NULL, 'TU'),
(60, 'BILQIS FARIDAH', '', 1, 21, NULL, 'GURU RPL'),
(61, 'ZAM ZAM', '', 1, 22, NULL, 'PAI'),
(62, 'HAFIZH NAUFALIAN', '', 1, 23, NULL, 'GURU'),
(63, 'AMINATUS', '', 1, 23, NULL, 'GURU SINDO'),
(64, 'ETIK WAHYUNI', '', 1, 22, NULL, 'GURU BAHASA iNGGRIS'),
(65, 'HAJAR ALIA RAHMI', '', 1, 23, NULL, 'GURU BAHASA JEPANG'),
(66, 'SARDO', '', 1, 22, NULL, 'SATPAM'),
(67, 'HANASTIEN', '', 1, 22, NULL, 'GURU BHS INGGRIS'),
(68, 'BU RATNA', '', 1, 22, NULL, 'guru bahasa indonesia'),
(69, 'Roikhatul Janah', '', 1, 22, NULL, 'Guru Bhs. Mandarin'),
(70, 'SRI MURNI', '', 1, 23, NULL, 'INFORMATIKA'),
(71, 'Rakhmatika Febrina Dewanti', '', 1, 21, NULL, 'TU Humas'),
(72, 'MOHAMMAD MAHFUD', '', 1, 22, NULL, 'GURU'),
(73, 'ika ravita arvianti', '', 1, 22, NULL, 'guru jurusan perhotelan'),
(74, 'fabrian istika suratno', '', 1, 21, NULL, 'guru produktif tkr'),
(75, 'Ani Setyawati', '', 1, 22, NULL, 'Guru Bimbingan Konseling'),
(76, 'AULIA CITA SISWANTI', '', 1, 22, NULL, 'GURU KIMIA'),
(77, 'PRASETYO BUDI S', '', 1, 22, NULL, 'PERHOTELAN');

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `class` varchar(20) NOT NULL,
  `absen` int(11) DEFAULT NULL,
  `has_voted` tinyint(1) DEFAULT 0,
  `candidate_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `name`, `class`, `absen`, `has_voted`, `candidate_id`, `created_at`) VALUES
(164, 'DWI AGUNG W', 'X TPM 2', 6, 1, 21, '2026-01-06 01:19:01'),
(165, 'MUHAMMAHD NASIRUL ILMI', 'X TPM 2', 18, 1, 21, '2026-01-06 01:19:19'),
(166, 'ACHMAD FAQIH', 'X TPM 2', 1, 1, 22, '2026-01-06 01:19:54'),
(167, 'Rangga Indra Saputra', 'X TPM 2', 24, 1, 22, '2026-01-06 01:20:26'),
(168, 'DAMAR ADJI PANGESTU', 'X TPM 2', 5, 1, 21, '2026-01-06 01:20:31'),
(169, 'M.RAFFI FACHRI A', 'X TPM 2', 19, 1, 22, '2026-01-06 01:21:02'),
(170, 'MUHAMMAD HILMI AZMI', 'X TPM 2', 14, 1, 21, '2026-01-06 01:21:53'),
(171, 'M.Alif Firdaus', 'X TPM 2', 12, 1, 21, '2026-01-06 01:22:13'),
(172, 'M.KEVIN ALDIANO', 'X TPM 2', 15, 1, 22, '2026-01-06 01:22:17'),
(173, 'ANANDA RISKY M', 'X TPM 2', 3, 1, 21, '2026-01-06 01:23:00'),
(174, 'm raisa naufal w', 'X TPM 2', 20, 1, 23, '2026-01-06 01:23:29'),
(175, 'M ROMADHONI B.W', 'X TPM 2', 10, 1, 22, '2026-01-06 01:23:33'),
(176, 'MUHAMMAD KEVIN MAULANA REZA', 'X TPM 2', 16, 1, 21, '2026-01-06 01:24:00'),
(177, 'PRAYUDA IBNU SANJAYA', 'X TPM 2', 23, 1, 22, '2026-01-06 01:24:20'),
(178, 'MUHAMMAD ALVIAN CAHYA ARDHANI', 'X TPM 2', 13, 1, 21, '2026-01-06 01:24:57'),
(179, 'REVANO ADI AL EZRA', 'X TPM 2', 25, 1, 22, '2026-01-06 01:25:20'),
(180, 'muhammad maulana dilbar', 'X TPM 2', 17, 1, 22, '2026-01-06 01:25:39'),
(181, 'MOH MISBACHUL RIZKY C', 'X TPM 2', 8, 1, 22, '2026-01-06 01:26:11'),
(182, 'FEDRICO RIZKY Z', 'X TPM 2', 7, 1, 21, '2026-01-06 01:26:28'),
(183, 'RIZQULLAH DWI ARIFIAM PUTRA', 'XI TP', 11, 1, 23, '2026-01-06 01:27:29'),
(184, 'MUCHAMMAD KELFIN NAUFAL', 'XI TP', 5, 1, 23, '2026-01-06 01:28:39'),
(185, 'M Maulana Ghofar Siddiq', 'XI TP', 4, 1, 22, '2026-01-06 01:28:40'),
(186, 'M.RIZQY RADITYA', 'XI TP', 9, 1, 23, '2026-01-06 01:28:41'),
(187, 'MUHAMMAD ABDUL ZAID', 'XI TPM 1', 15, 1, 22, '2026-01-06 01:34:10'),
(188, 'BILLY ADITHYA GUNAWAN', 'XI TPM 1', 6, 1, 21, '2026-01-06 01:34:16'),
(189, 'A. Syahriel Al Bukhori', 'XI TPM 1', 2, 1, 23, '2026-01-06 01:34:49'),
(190, 'M FERDI ARDIANSYAH', 'XI TPM 1', 11, 1, 22, '2026-01-06 01:35:31'),
(191, 'FAHRI RAISSA RAMADHAN', 'XI TPM 1', 9, 1, 21, '2026-01-06 01:35:38'),
(192, 'fadilatur romdoniyah', 'XI TPM 1', 8, 1, 22, '2026-01-06 01:36:10'),
(193, 'MUHAMMAD ANDRE TEGAR IRAWAN', 'XI TPM 1', 16, 1, 21, '2026-01-06 01:36:43'),
(194, 'MUHAMMAD ZACKI ZULFAQQAR', 'XI TPM 1', 22, 1, 23, '2026-01-06 01:37:07'),
(195, 'nur fachjri aqsan', 'XI TPM 1', 25, 1, 22, '2026-01-06 01:37:34'),
(196, 'MUHAMMAD ARYA BUDI SETIAWAN', 'X TITL 2', 15, 1, 22, '2026-01-06 01:40:16'),
(197, 'mUHAMMAD BALAPATI ARKA', 'X TITL 2', 16, 1, 21, '2026-01-06 01:40:18'),
(198, 'Habib Achmad Al Farizy', 'X TITL 2', 8, 1, 23, '2026-01-06 01:41:08'),
(199, 'MUHAMMAD REYHAN ALIFANSYAH', 'X TITL 2', 19, 1, 22, '2026-01-06 01:41:14'),
(200, 'SYAMSUDIN ASYARI', 'X TITL 2', 26, 1, 23, '2026-01-06 01:41:31'),
(201, 'PANDU AGUSTIAN', 'X TITL 2', 23, 1, 23, '2026-01-06 01:42:56'),
(202, 'RAVIANO NAUFAL', 'X TITL 2', 25, 1, 21, '2026-01-06 01:44:08'),
(203, 'M.LUTFIE ANDRIANSYAH', 'X TITL 2', 12, 1, 22, '2026-01-06 01:44:19'),
(204, 'ARYA BOGA PRADITIA', 'X TITL 2', 4, 1, 23, '2026-01-06 01:45:24'),
(205, 'JUNIOR BIMO IRWANSYAH', 'X TITL 2', 9, 1, 23, '2026-01-06 01:45:46'),
(206, 'DIANO OCTAVIAN FAREZKY', 'X TITL 2', 6, 1, 23, '2026-01-06 01:46:59'),
(207, 'YUUDAI ATHAYA MAHESA', 'X TITL 2', 27, 1, 23, '2026-01-06 01:47:28'),
(208, 'achmad hafiz fairuz multazam', 'X TITL 2', 2, 1, 23, '2026-01-06 01:47:50'),
(209, 'M. SYAFI\'UL UMAM', 'X TITL 2', 21, 1, 23, '2026-01-06 01:48:22'),
(210, 'MUHAMMAD FIRMAN SYAH', 'XI TITL 2', 17, 1, 22, '2026-01-06 01:48:27'),
(211, 'AHMAD IKHYA ULUMUDDIN', 'X TITL 2', 3, 1, 23, '2026-01-06 01:49:21'),
(212, 'M.NAZRIL ERVANO PUTRA', 'X TITL 2', 13, 1, 22, '2026-01-06 01:49:44'),
(213, 'ach alland arya ardhani', 'X TITL 2', 1, 1, 22, '2026-01-06 01:49:47'),
(214, 'MUHAMMAD ABID ABIYANTO', 'X TITL 2', 14, 1, 22, '2026-01-06 01:50:28'),
(215, 'MUHAMMAD MAULAN ROMADHONI', 'X TITL 2', 18, 1, 22, '2026-01-06 01:50:50'),
(216, 'rafid andika putra diva', 'X TITL 2', 24, 1, 23, '2026-01-06 01:51:10'),
(217, 'FABIAN MAULANA PRADITA', 'X TITL 2', 7, 1, 23, '2026-01-06 01:51:19'),
(218, 'MOH TRISTAN MAULANA PUTRA', 'XI PH', 8, 1, 22, '2026-01-06 01:52:44'),
(219, 'LILI MAUDHOFAH', 'XI PH', 7, 1, 22, '2026-01-06 01:52:49'),
(220, 'Hanifa Azizah Rahma', 'XI PH', 5, 1, 22, '2026-01-06 01:53:15'),
(221, 'HUMAIRA MUALIMAH MUNADZIROH', 'XI PH', 6, 1, 23, '2026-01-06 01:53:52'),
(222, 'aurellia fitri ramadhani', 'XI PH', 3, 1, 22, '2026-01-06 01:54:34'),
(223, 'FLOREAN RADITHA MALVALENA', 'XI PH', 4, 1, 22, '2026-01-06 01:54:35'),
(224, 'AISYAH SEKAR DEWI', 'XI PH', 1, 1, 22, '2026-01-06 01:54:50'),
(225, 'DEVINTA IMANDA SARI', 'X PH', 6, 1, 23, '2026-01-06 01:55:43'),
(226, 'LUNA RIZKI PRABOWO', 'X PH', 9, 1, 23, '2026-01-06 01:55:49'),
(227, 'linda safira clarista', 'X PH', 8, 1, 22, '2026-01-06 01:56:15'),
(228, 'GADIS AYU VALENTINA', 'X PH', 7, 1, 23, '2026-01-06 01:56:49'),
(229, 'SHAFA SYARANI MAULIDDINA', 'X PH', 12, 1, 22, '2026-01-06 01:57:16'),
(230, 'amel dwi rismawati', 'X PH', 3, 1, 23, '2026-01-06 01:57:33'),
(231, 'Adinda Tri Habsari', 'X PH', 2, 1, 23, '2026-01-06 01:57:55'),
(232, 'MUHAMMAD MAZIDAN MAULANA', 'X PH', 10, 1, 22, '2026-01-06 01:58:16'),
(233, 'chaesar wahyu surya dinata', 'X PH', 4, 1, 22, '2026-01-06 01:59:02'),
(234, 'M.Rafa dwi andhika', 'X PH', 11, 1, 22, '2026-01-06 01:59:22'),
(235, 'ACHMAD GHATHFAN NAJIF AZAMI', 'X PH', 1, 1, 22, '2026-01-06 01:59:33'),
(236, 'ahmad rezza abiyachsa', 'XI TOI', 1, 1, 21, '2026-01-06 02:00:28'),
(237, 'DHAVIN ALIEF ILHAMSYAH', 'XI TOI', 4, 1, 23, '2026-01-06 02:00:41'),
(238, 'ZIKO SHELLE', 'XI TOI', 13, 1, 23, '2026-01-06 02:01:26'),
(239, 'muhammad pasha aditya', 'XI TOI', 10, 1, 23, '2026-01-06 02:01:29'),
(240, 'reza aurillo vito n.a', 'X PH', 14, 1, 22, '2026-01-06 02:01:31'),
(241, 'MUHAMMAD ADI SURYA ALFAFA', 'XI TOI', 8, 1, 23, '2026-01-06 02:02:25'),
(242, 'm.abdul khayyi m.u', 'XI TOI', 7, 1, 22, '2026-01-06 02:02:29'),
(243, 'SATRYA AKHMADY', 'XI TOI', 11, 1, 21, '2026-01-06 02:03:15'),
(244, 'FISABILLI AL HABIB', 'XI TOI', 5, 1, 23, '2026-01-06 02:03:16'),
(245, 'M Ghaisan Akmal A', 'XI TOI', 9, 1, 22, '2026-01-06 02:04:13'),
(246, 'MAHARDIKA ALIEF PRASETYA', 'XII TOI', 6, 1, 22, '2026-01-06 02:05:00'),
(247, 'MUHAMMAD MARWAN SHOLAHUDDIN FIRDAUS', 'XII TOI', 11, 1, 23, '2026-01-06 02:05:06'),
(248, 'MUHAMMAD FAIQ AL BAIHQI', 'XII TOI', 10, 1, 21, '2026-01-06 02:05:16'),
(249, 'MOCH NAZARUDDIN JOHANSYAH', 'X TOI', 10, 1, 22, '2026-01-06 02:05:51'),
(250, 'ARYA WIDYA ATMAJAYA', 'X TOI', 2, 1, 22, '2026-01-06 02:06:43'),
(251, 'Andi cahyo prasnanto', 'X TOI', 1, 1, 22, '2026-01-06 02:06:49'),
(252, 'RAVALINO RADITYA ARDIANSYAH', 'X TOI', 22, 1, 21, '2026-01-06 02:07:14'),
(253, 'AZIZ MAULANA WIDODO', 'X TOI', 3, 1, 22, '2026-01-06 02:07:36'),
(254, 'muhammad davis pradana', 'X TOI', 15, 1, 21, '2026-01-06 02:07:46'),
(255, 'Fandi Achmad', 'X TOI', 5, 1, 22, '2026-01-06 02:08:35'),
(256, 'MOHAMMAD FAHMI CAHYA  ALFARABI', 'X TOI', 13, 1, 23, '2026-01-06 02:08:45'),
(257, 'ZEVIN SAQUILLE ATHASAKHI', 'X TOI', 23, 1, 22, '2026-01-06 02:08:50'),
(258, 'DAHLAN IKSAN RIVANTO', 'X TOI', 4, 1, 22, '2026-01-06 02:09:42'),
(259, 'muhammad kresna arya cahya samudra', 'X TOI', 19, 1, 23, '2026-01-06 02:09:50'),
(260, 'MUHAMMAD IZAAZ APRILLIO', 'X TOI', 18, 1, 21, '2026-01-06 02:10:54'),
(261, 'GHANDY WALYYUL HAQ', 'X TOI', 6, 1, 23, '2026-01-06 02:11:03'),
(262, 'muhammad arga nugraha', 'X TOI', 14, 1, 21, '2026-01-06 02:11:04'),
(263, 'mohammad ali akbar al faruq', 'X TOI', 11, 1, 21, '2026-01-06 02:12:21'),
(264, 'MOHAMMAD CHOIRUL AZZAM', 'X TOI', 12, 1, 23, '2026-01-06 02:12:31'),
(265, 'KEMAL ALVAHT IBNU HIDAYAT', 'X TOI', 7, 1, 23, '2026-01-06 02:12:48'),
(266, 'KRISNA TOHARI', 'X TOI', 9, 1, 21, '2026-01-06 02:13:29'),
(267, 'M.SUMUSUL MADANI', 'X TOI', 21, 1, 23, '2026-01-06 02:13:32'),
(268, 'muhammad gathan athallah', 'X TOI', 17, 1, 23, '2026-01-06 02:14:13'),
(269, 'MUHAMMAD FAHRI AZIZY', 'X TOI', 16, 1, 21, '2026-01-06 02:14:34'),
(270, 'muhammad nawal tamam', 'X TOI', 20, 1, 22, '2026-01-06 02:15:07'),
(271, 'BUNGA MAULIDYAH CANDRIKA', 'XII PH', 1, 1, 21, '2026-01-06 02:15:50'),
(272, 'hidayaturrohmah maulidiyah', 'XII PH', 2, 1, 23, '2026-01-06 02:16:04'),
(273, 'kiki nabilla', 'XII PH', 5, 1, 21, '2026-01-06 02:16:27'),
(274, 'sintha virnanda', 'XII PH', 10, 1, 22, '2026-01-06 02:17:04'),
(275, 'Satria Hafis Ramadhani', 'XII RPL 1', 25, 1, 21, '2026-01-06 02:17:34'),
(276, 'nabilatul islamiyah', 'XII PH', 7, 1, 22, '2026-01-06 02:18:19'),
(277, 'Farira Fridia Sari', 'XII RPL 1', 11, 1, 23, '2026-01-06 02:18:22'),
(278, 'saylendra surya agung', 'XII RPL 1', 26, 1, 23, '2026-01-06 02:19:00'),
(279, 'MUHAMMAD RAMDHAN MAULANA YUSUF', 'XII RPL 1', 19, 1, 22, '2026-01-06 02:19:18'),
(280, 'MUHAMMAD AULIA AKBAR NURDIANSYAH', 'XII RPL 1', 16, 1, 23, '2026-01-06 02:19:29'),
(281, 'Aditya firmansyah', 'XII RPL 1', 2, 1, 21, '2026-01-06 02:19:59'),
(282, 'DEWA SATRIA MUDHOSENO', 'XII RPL 1', 8, 1, 23, '2026-01-06 02:20:21'),
(283, 'Farel Alif Van Mahmudi', 'XII RPL 1', 10, 1, 22, '2026-01-06 02:20:33'),
(284, 'Muhammad Alevian Alkhafi', 'XII RPL 1', 15, 1, 23, '2026-01-06 02:20:52'),
(285, 'Rizky Faesya Ramadhan', 'XII RPL 1', 23, 1, 21, '2026-01-06 02:22:01'),
(286, 'muhammad fuad al farisi', 'XII RPL 1', 18, 1, 22, '2026-01-06 02:22:21'),
(287, 'bintang adiyatma', 'XII RPL 1', 7, 1, 22, '2026-01-06 02:22:43'),
(288, 'M.DERIEL REKSADINATA', 'XII RPL 1', 17, 1, 23, '2026-01-06 02:22:53'),
(289, 'zaidan murtadho klazema', 'XII RPL 1', 27, 1, 23, '2026-01-06 02:23:34'),
(291, 'afhinza keyzo ariengga putraa', 'XII RPL 1', 3, 1, 23, '2026-01-06 02:24:20'),
(292, 'ABI KENDA YOSI', 'XII RPL 1', 1, 1, 21, '2026-01-06 02:24:47'),
(293, 'm farid masudy', 'XII RPL 1', 14, 1, 23, '2026-01-06 02:24:48'),
(294, 'andi sylmi najwa farahdina', 'XI TKI', 3, 1, 21, '2026-01-06 02:26:11'),
(295, 'MUHAMMAD RIFQY ZAMZAMI', 'XII RPL 1', 20, 1, 22, '2026-01-06 02:26:29'),
(296, 'mohammad ferdiansyah nuruudin', 'XII RPL 1', 28, 1, 22, '2026-01-06 02:26:44'),
(297, 'cheysya afra irwanda', 'XI TKI', 4, 1, 23, '2026-01-06 02:27:02'),
(298, 'dinda ayu kusuma dewi', 'XI TKI', 8, 1, 21, '2026-01-06 02:27:38'),
(299, 'Lita Aulia Cahaya Ningrum', 'XI TKI', 11, 1, 21, '2026-01-06 02:28:03'),
(300, 'NASYWA AZZARIA SALSABILA EKA PUTRI', 'XI TKI', 14, 1, 21, '2026-01-06 02:28:12'),
(301, 'Aisyah Syafa Farizka', 'XI TKI', 1, 1, 21, '2026-01-06 02:28:53'),
(302, 'siti fatimah', 'XI TKI', 17, 1, 21, '2026-01-06 02:29:09'),
(303, 'YASMINE FADHILLAH ALLIATUZZAHRA', 'XI TKI', 19, 1, 21, '2026-01-06 02:29:23'),
(304, 'Diana Sasmitasari', 'XI TKI', 6, 1, 21, '2026-01-06 02:30:13'),
(305, 'Neisya putri anggraini', 'XI TKI', 15, 1, 23, '2026-01-06 02:30:17'),
(306, 'Desya madilika', 'XI TKI', 5, 1, 21, '2026-01-06 02:30:27'),
(307, 'faraj fauzi faraj ubaidi', 'XI TKI', 9, 1, 23, '2026-01-06 02:30:59'),
(308, 'stefany franceska natalia', 'XI TKI', 18, 1, 23, '2026-01-06 02:31:18'),
(309, 'mochammad iqbal fahlevi', 'XI TKI', 12, 1, 21, '2026-01-06 02:31:36'),
(310, 'nafisah charissa putri', 'X TKI', 20, 1, 21, '2026-01-06 02:32:01'),
(311, 'm.al ichsan nur rochim', 'XI TKI', 13, 1, 21, '2026-01-06 02:32:03'),
(312, 'RAKHMAD ALVIAN QOWIYYUL AZZAM', 'XI TKI', 16, 1, 23, '2026-01-06 02:33:13'),
(313, 'diaz lana f', 'XI TKI', 7, 1, 21, '2026-01-06 02:33:41'),
(314, 'Muhammaad Firdaus Alansyah', 'X TKI', 16, 1, 22, '2026-01-06 02:34:20'),
(315, 'ninimas sekar arum', 'X TKI', 21, 1, 21, '2026-01-06 02:34:39'),
(316, 'chintya karunia putri', 'X TKI', 6, 1, 22, '2026-01-06 02:35:06'),
(317, 'carissa kamil khaerani', 'X TKI', 4, 1, 21, '2026-01-06 02:36:00'),
(318, 'carisma arnie lalassa', 'X TKI', 2, 1, 23, '2026-01-06 02:36:11'),
(319, 'queenta adzani putri para mitha', 'X TKI', 24, 1, 22, '2026-01-06 02:36:11'),
(320, 'selena faradisa putri anggraini tamam', 'X TKI', 26, 1, 22, '2026-01-06 02:37:36'),
(321, 'Dhiya Ulchaq Maula Rahmat', 'XII RPL 1', 9, 1, 22, '2026-01-06 02:37:40'),
(322, 'cinta suci ayu wulandari', 'X TKI', 7, 1, 23, '2026-01-06 02:37:50'),
(323, 'carissa bertha amelia', 'X TKI', 3, 1, 22, '2026-01-06 02:38:29'),
(324, 'nafisa azzahro putri', 'X TKI', 19, 1, 21, '2026-01-06 02:38:45'),
(325, 'tyara zagita aurelia', 'X TKI', 28, 1, 22, '2026-01-06 02:39:04'),
(326, 'cecilia putri dwi cantika', 'X TKI', 5, 1, 23, '2026-01-06 02:39:38'),
(327, 'm fachri abdillah', 'X TKI', 15, 1, 21, '2026-01-06 02:39:52'),
(328, 'M.Rizal rizky p', 'X TKI', 18, 1, 22, '2026-01-06 02:40:35'),
(329, 'RAFQI ARGYA RUDIYANTO', 'X TKI', 25, 1, 22, '2026-01-06 02:40:48'),
(330, 'Danar Ahmad Septiansyah', 'X TKI', 9, 1, 22, '2026-01-06 02:40:49'),
(331, 'SYAHRUL RAMADHAN ALFAJRI', 'X TKI', 27, 1, 22, '2026-01-06 02:41:49'),
(332, 'm. dwi nurul s', 'X TKI', 14, 1, 21, '2026-01-06 02:41:58'),
(333, 'dhiaz putra adi nur utama', 'X TKI', 11, 1, 22, '2026-01-06 02:42:06'),
(334, 'MUHAMMAD IQBAL NUR FAIZIN', 'X TKI', 17, 1, 21, '2026-01-06 02:42:56'),
(335, 'merdinsyah fairuz zalfa', 'X TKI', 12, 1, 21, '2026-01-06 02:43:05'),
(336, 'ABID RAZIQ SETYO WAHONO', 'X TPM 1', 1, 1, 21, '2026-01-06 02:46:50'),
(337, 'm yahya rama dhan', 'X TPM 1', 22, 1, 21, '2026-01-06 02:47:19'),
(338, 'a rahid alfa rizki', 'X TPM 1', 2, 1, 23, '2026-01-06 02:47:34'),
(339, 'ARFA MAULANA DIANURRAHMAN', 'X TPM 1', 4, 1, 23, '2026-01-06 02:48:14'),
(340, 'm fatchu rohman', 'X TPM 1', 14, 1, 21, '2026-01-06 02:48:25'),
(341, 'ahmad dwi sasmitho', 'X TPM 1', 3, 1, 21, '2026-01-06 02:48:54'),
(342, 'mohammad naufal wanib afkar', 'X TPM 1', 12, 1, 21, '2026-01-06 02:49:58'),
(343, 'MUHAMMAD HAFIEZUR ROHMAN', 'X TPM 1', 16, 1, 22, '2026-01-06 02:50:01'),
(344, 'Dika Nawalla Darmawan', 'X TPM 1', 6, 1, 21, '2026-01-06 02:50:08'),
(345, 'NAUFAL TSAQIIF A', 'X TPM 1', 23, 1, 22, '2026-01-06 02:51:12'),
(346, 'fahmi ahmad baihaqy', 'X TPM 1', 8, 1, 21, '2026-01-06 02:51:19'),
(347, 'eggo tri saputro', 'X TPM 1', 7, 1, 23, '2026-01-06 02:51:21'),
(348, 'fahri raffa ibrahim', 'X TPM 1', 9, 1, 21, '2026-01-06 02:52:22'),
(349, 'bayu dewantara', 'X TPM 1', 5, 1, 22, '2026-01-06 02:52:27'),
(350, 'M MALIK ABDUL AZIZ', 'X TPM 1', 19, 1, 21, '2026-01-06 02:52:35'),
(351, 'Qais Akbar Maulana', 'X TPM 1', 24, 1, 21, '2026-01-06 02:53:30'),
(352, 'hafid ilham rosyidi', 'X TPM 1', 10, 1, 22, '2026-01-06 02:53:52'),
(353, 'Muh Brillian Erlanga Al Faroby', 'X TPM 1', 15, 1, 21, '2026-01-06 02:53:56'),
(354, 'muhammmad ganendra bayu ishaqi', 'X TPM 1', 17, 1, 22, '2026-01-06 02:54:55'),
(355, 'm.arrafa bayu surgawi', 'X TPM 1', 32, 1, 21, '2026-01-06 02:55:56'),
(356, 'muhammad catur febrianto', 'X TPM 1', 27, 1, 22, '2026-01-06 02:55:59'),
(357, 'm.salman al farisi', 'X TPM 1', 21, 1, 22, '2026-01-06 02:56:18'),
(358, 'alif vidiansyah', 'X TITL 1', 6, 1, 23, '2026-01-06 02:57:24'),
(359, 'Toim sasmita', 'X TITL 1', 27, 1, 22, '2026-01-06 02:57:38'),
(360, 'm.rafka meisiano', 'X TITL 1', 15, 1, 21, '2026-01-06 02:57:44'),
(361, 'achmad fathoni al jabbar', 'X TITL 1', 1, 1, 21, '2026-01-06 02:59:04'),
(362, 'atha nur ramaadhani', 'X TITL 1', 7, 1, 22, '2026-01-06 02:59:11'),
(363, 'moh alfin mubarok', 'X TITL 1', 16, 1, 22, '2026-01-06 02:59:16'),
(364, 'm.fachry.ramdhan', 'X TITL 1', 19, 1, 22, '2026-01-06 03:00:21'),
(365, 'm fakhry maulana zanuarta', 'X TITL 1', 12, 1, 23, '2026-01-06 03:00:26'),
(366, 'raditya evan putra afandi', 'X TITL 1', 21, 1, 22, '2026-01-06 03:01:31'),
(367, 'sahal mahfudz alfarizi', 'X TITL 1', 25, 1, 22, '2026-01-06 03:01:35'),
(368, 'ridho luthfi alvano', 'X TITL 1', 23, 1, 23, '2026-01-06 03:01:47'),
(369, 'moch zaky firmansyah', 'X TITL 1', 13, 1, 23, '2026-01-06 03:02:49'),
(370, 'tirta shafa nugraha', 'X TITL 1', 26, 1, 21, '2026-01-06 03:03:00'),
(371, 'zaky athiro putra sanjaya', 'X TITL 1', 28, 1, 21, '2026-01-06 03:03:36'),
(372, 'davit wahyu pangestu', 'X TITL 1', 10, 1, 23, '2026-01-06 03:04:29'),
(373, 'Ahmad Rhiduwan', 'X TITL 1', 4, 1, 23, '2026-01-06 03:04:50'),
(374, 'mudrika iefa watti', 'X TITL 1', 18, 1, 23, '2026-01-06 03:05:05'),
(375, 'a zuaim muddin', 'X TITL 1', 3, 1, 22, '2026-01-06 03:05:39'),
(376, 'bernad farel rivano', 'X TITL 1', 9, 1, 21, '2026-01-06 03:06:44'),
(377, 'izzun nadhif', 'X TITL 1', 11, 1, 23, '2026-01-06 03:06:54'),
(378, 'ragil rahmat syaifudin', 'X TITL 1', 24, 1, 23, '2026-01-06 03:07:04'),
(379, 'Achmad al varizzi', 'X TITL 1', 2, 1, 23, '2026-01-06 03:08:46'),
(380, 'ezza fatma giantari', 'X RPL 1', 10, 1, 22, '2026-01-06 03:09:18'),
(381, 'ganitio adithia', 'XI TITL 1', 10, 1, 22, '2026-01-06 03:10:14'),
(382, 'arvian bayu wijaya', 'XI TITL 1', 5, 1, 22, '2026-01-06 03:10:20'),
(383, 'Ahmad Baligu Ayat', 'XI TITL 1', 3, 1, 22, '2026-01-06 03:10:22'),
(384, 'Abdul aziz hamdani', 'XI TITL 1', 1, 1, 22, '2026-01-06 03:10:33'),
(385, 'm viqar rabbani wicaksono', 'XI TITL 1', 16, 1, 22, '2026-01-06 03:11:36'),
(386, 'YORGA PUTRA ANGGARA', 'XI TITL 1', 20, 1, 21, '2026-01-06 03:11:36'),
(387, 'muhammad ainul yaqin', 'XI TITL 1', 12, 1, 22, '2026-01-06 03:11:54'),
(388, 'bintangindranovanto', 'X TP', 2, 1, 22, '2026-01-06 03:14:47'),
(389, 'alfiyan syah farezi', 'X TP', 1, 1, 23, '2026-01-06 03:14:50'),
(390, 'FARREL RAGIL', 'X TP', 3, 1, 23, '2026-01-06 03:15:10'),
(391, 'MUBAROKALLAH', 'X TP', 6, 1, 21, '2026-01-06 03:16:01'),
(392, 'Harun Rizqullah', 'X TP', 4, 1, 21, '2026-01-06 03:16:11'),
(393, 'nufal tri setiono', 'X TP', 11, 1, 23, '2026-01-06 03:16:17'),
(394, 'm.nazriel ar rojabi', 'X TP', 5, 1, 23, '2026-01-06 03:16:31'),
(395, 'MUHAMMAD AKBAR MAULANA', 'X TP', 7, 1, 23, '2026-01-06 03:17:04'),
(396, 'muhammad bariq ramadhan herlambang', 'X TP', 9, 1, 22, '2026-01-06 03:17:24'),
(397, 'yafi rivaanno caesarean', 'X TP', -12, 1, 23, '2026-01-06 03:17:40'),
(398, 'm.raihan adinda putra', 'X TP', 10, 1, 23, '2026-01-06 03:18:13'),
(399, 'm.ali zaaenal abidin', 'X RPL 2', 16, 1, 22, '2026-01-06 03:18:45'),
(400, 'Bhisma Muria Denta', 'X RPL 2', 5, 1, 22, '2026-01-06 03:18:47'),
(401, 'MUHAMAD ARRAFA FIRDAU ZAMZAMY', 'X TP', 8, 1, 21, '2026-01-06 03:18:51'),
(402, 'm. zaidan alfiano r.', 'X RPL 2', 15, 1, 22, '2026-01-06 03:19:13'),
(403, 'evo pratama bima sakti', 'X RPL 2', 7, 1, 22, '2026-01-06 03:19:50'),
(404, 'FATIMAH AZZAHRA', 'X RPL 2', 10, 1, 23, '2026-01-06 03:19:58'),
(405, 'Paulina Azzahra', 'X RPL 2', 22, 1, 23, '2026-01-06 03:20:15'),
(406, 'grycia anindya', 'X RPL 2', 11, 1, 23, '2026-01-06 03:20:40'),
(407, 'Yo Michael', 'X RPL 2', 27, 1, 22, '2026-01-06 03:20:52'),
(408, 'ADDELIO ALVARO ALHAIDAR', 'X RPL 2', 2, 1, 23, '2026-01-06 03:20:58'),
(409, 'rischo ade hernanda', 'X RPL 2', 25, 1, 23, '2026-01-06 03:21:13'),
(410, 'M Fairus Abadi Santoso', 'X RPL 2', 18, 1, 22, '2026-01-06 03:21:50'),
(411, 'fachni sultony alfarisyi', 'X RPL 2', 8, 1, 21, '2026-01-06 03:21:56'),
(412, 'juab valentino allen', 'X RPL 2', 12, 1, 23, '2026-01-06 03:22:09'),
(413, 'aBIM ARDHANI MAULANA DERYS', 'X RPL 2', 1, 1, 22, '2026-01-06 03:22:18'),
(414, 'andy kelvin koro', 'X RPL 1', 4, 1, 23, '2026-01-06 03:22:59'),
(415, 'muhammad kevin saverio muslim', 'X RPL 1', 20, 1, 23, '2026-01-06 03:23:12'),
(416, 'Muhammad Athallah Athief', 'X RPL 1', 19, 1, 22, '2026-01-06 03:23:14'),
(417, 'Revan Oktaviano Hamdaningsyah', 'X RPL 1', 24, 1, 21, '2026-01-06 03:23:21'),
(418, 'Fachri Akmal Sany', 'X RPL 1', 11, 1, 23, '2026-01-06 03:24:02'),
(419, 'Raffi Nabighah Satrio Wibowo', 'X RPL 1', 23, 1, 22, '2026-01-06 03:24:12'),
(420, 'Achmad Faisal Abdillah', 'X RPL 1', 2, 1, 23, '2026-01-06 03:24:20'),
(421, 'devlin birizqi fahlavi', 'X RPL 1', 9, 1, 23, '2026-01-06 03:24:22'),
(422, 'ferdi adi nugroho', 'X RPL 1', 13, 1, 21, '2026-01-06 03:25:10'),
(423, 'Kevin Nathanael', 'X RPL 1', 15, 1, 21, '2026-01-06 03:25:17'),
(424, 'maulana ibra fabiansyah', 'X RPL 1', 16, 1, 23, '2026-01-06 03:25:17'),
(425, 'syalom hRYO BIMO', 'X RPL 1', 26, 1, 21, '2026-01-06 03:26:01'),
(426, 'faisal', 'X RPL 1', 12, 1, 23, '2026-01-06 03:26:13'),
(427, 'muhammad nadhif hilmawan', 'X RPL 1', 21, 1, 23, '2026-01-06 03:26:33'),
(428, 'muhammad abdul qodir jailani', 'X RPL 1', 18, 1, 23, '2026-01-06 03:27:00'),
(429, 'abhista khalfani', 'X RPL 1', 1, 1, 23, '2026-01-06 03:27:05'),
(430, 'ricky aldi firmansyah', 'X RPL 1', 25, 1, 23, '2026-01-06 03:28:09'),
(431, 'muchammad bagus pradana', 'X RPL 1', 17, 1, 21, '2026-01-06 03:28:13'),
(432, 'iftina asyabiya', 'X RPL 1', 29, 1, 21, '2026-01-06 03:28:14'),
(433, 'ardelia', 'X RPL 1', 30, 0, NULL, '2026-01-06 03:28:58'),
(434, 'Krishna Dewantara Al Ishany', 'X RPL 2', 13, 1, 23, '2026-01-06 03:29:01'),
(435, 'm.hafid azuan rizqullah', 'X RPL 2', 19, 1, 22, '2026-01-06 03:29:18'),
(436, 'm.renaldi arrojabi', 'X RPL 2', 20, 1, 23, '2026-01-06 03:29:28'),
(437, 'Mohammad Raffa Nashoihul Ibad', 'X RPL 2', 14, 1, 23, '2026-01-06 03:29:56'),
(438, 'ach galuh novianto', 'XI TKRO', 2, 1, 21, '2026-01-06 03:30:31'),
(439, 'rasid', 'X RPL 2', 24, 1, 23, '2026-01-06 03:30:31'),
(440, 'fadhil hilmi', 'X RPL 2', 9, 1, 22, '2026-01-06 03:30:47'),
(441, 'ACHMAD Fareza syabani', 'XI TKRO', 1, 1, 22, '2026-01-06 03:30:56'),
(442, 'fahmi andika saputra', 'XI TKRO', 9, 1, 23, '2026-01-06 03:31:55'),
(443, 'm abid abdullah', 'XI TKRO', 15, 1, 23, '2026-01-06 03:32:12'),
(444, 'arga dwi saputra', 'XI TKRO', 4, 1, 22, '2026-01-06 03:32:47'),
(445, 'm zainudin', 'XI TKRO', 20, 1, 21, '2026-01-06 03:33:07'),
(446, 'army arkan setiawan', 'XI TKRO', 6, 1, 23, '2026-01-06 03:33:19'),
(447, 'iben abdullah toru ukawa', 'XI TKRO', 11, 1, 23, '2026-01-06 03:33:36'),
(448, 'valen zeen lathiif', 'XI TKRO', 21, 1, 21, '2026-01-06 03:34:00'),
(449, 'm.davin surya pangestu', 'XI TKRO', 16, 1, 23, '2026-01-06 03:34:59'),
(450, 'm. zafif musthofa', 'XI TKRO', 13, 1, 23, '2026-01-06 03:35:03'),
(451, 'revin bagas', 'XI TKRO', 12, 1, 23, '2026-01-06 03:35:18'),
(452, 'M Farikh AL Janabi', 'XI TKRO', 17, 1, 22, '2026-01-06 03:35:28'),
(453, 'davin ramadhani', 'XI TKRO', 7, 1, 22, '2026-01-06 03:36:06'),
(454, 'fariz irham', 'XI TKRO', 10, 1, 21, '2026-01-06 03:36:34'),
(455, 'muhammad rizqi nur rochim', 'XI TKRO', 18, 1, 22, '2026-01-06 03:36:35'),
(456, 'alief miftakhul mufin', 'XI TKRO', 3, 1, 22, '2026-01-06 03:36:44'),
(457, 'm fathul beri', 'XI TKRO', 14, 1, 23, '2026-01-06 03:37:15'),
(458, 'airlangga rizqy putra mardianto', 'X RPL 1', 3, 1, 21, '2026-01-06 03:37:36'),
(459, 'Dennis Bagus Jatmiko', 'XI TKRO', 8, 1, 23, '2026-01-06 03:38:05'),
(460, 'firzatul ainiyah', 'XI RPL 2', 11, 1, 22, '2026-01-06 03:38:14'),
(461, 'nining ulul azmi rahmadani', 'XI RPL 2', 26, 1, 21, '2026-01-06 03:38:15'),
(462, 'Alika Dea Nurmalsari', 'XI RPL 2', 3, 1, 21, '2026-01-06 03:38:41'),
(463, 'Jibril Al Maliki', 'XI RPL 2', 13, 1, 22, '2026-01-06 03:39:19'),
(464, 'tsaabit azka ilyasa\'', 'XI RPL 2', 28, 1, 21, '2026-01-06 03:39:28'),
(465, 'erica prestisia', 'XI RPL 2', 10, 1, 21, '2026-01-06 03:39:31'),
(466, 'Machiko Kenzie Zenda Qin', 'XI RPL 2', 15, 1, 21, '2026-01-06 03:39:56'),
(467, 'Hikaru Ahmad Reza Pratama', 'XI RPL 2', 12, 1, 22, '2026-01-06 03:40:30'),
(468, 'kakha ari pradipta', 'XI RPL 2', 14, 1, 21, '2026-01-06 03:40:36'),
(469, 'brillian ahmaddinejad', 'XI RPL 2', 7, 1, 22, '2026-01-06 03:40:53'),
(470, 'muhammad fakhri ramadhan', 'XI RPL 2', 20, 1, 23, '2026-01-06 03:41:11'),
(471, 'muhammad raihan zuhrufillah', 'XI RPL 2', 23, 1, 21, '2026-01-06 03:41:31'),
(472, 'angger wardhana', 'XI RPL 2', 6, 1, 21, '2026-01-06 03:41:37'),
(473, 'MUCHAMMAD HANIF ZAMZAMI', 'XI RPL 2', 18, 1, 21, '2026-01-06 03:41:39'),
(474, 'alvian delius nahaniel', 'XI RPL 2', 4, 1, 22, '2026-01-06 03:42:23'),
(475, 'alvino delius nathaniel', 'XI RPL 2', 5, 1, 22, '2026-01-06 03:42:24'),
(476, 'yosua cristofer adfeno rahardjo', 'XI RPL 2', 29, 1, 22, '2026-01-06 03:42:35'),
(477, 'Reyhan kesya Alfaridzi', 'XI RPL 2', 27, 1, 22, '2026-01-06 03:43:05'),
(478, 'Maulana Jalaludin Rumi', 'XI RPL 2', 17, 1, 21, '2026-01-06 03:43:20'),
(479, 'yeni amilia', 'XII TKI', 21, 1, 22, '2026-01-06 03:43:37'),
(480, 'davina nasywa putri auri', 'XII TKI', 6, 1, 22, '2026-01-06 03:43:55'),
(481, 'Na\'ilah Amelia Febriansyah', 'XII TKI', 13, 1, 22, '2026-01-06 03:44:54'),
(482, 'amirotus salwa arrosyda', 'XII TKI', 1, 1, 23, '2026-01-06 03:45:02'),
(483, 'yesicca dwi ayu agustina', 'XII TKI', 22, 1, 23, '2026-01-06 03:45:22'),
(484, 'ANTARIKSA HOKY', 'XII TKI', 2, 1, 23, '2026-01-06 03:45:57'),
(485, 'fitri yani latifah', 'XII TKI', 8, 1, 23, '2026-01-06 03:46:05'),
(486, 'novallia rossi', 'XII TKI', 16, 1, 23, '2026-01-06 03:46:27'),
(487, 'beryl', 'XI TITL 2', 11, 1, 23, '2026-01-06 03:48:41'),
(488, 'Handaru praba shabiyyan', 'XI TITL 2', 6, 1, 23, '2026-01-06 03:48:42'),
(489, 'muhamad alfa robi maulana', 'XI TITL 2', 12, 1, 23, '2026-01-06 03:48:52'),
(490, 'dimas adi rachmadhani', 'XII TKI', 7, 1, 22, '2026-01-06 03:49:51'),
(491, 'm.aiys allauddin r.', 'XI TITL 2', 13, 1, 23, '2026-01-06 03:50:05'),
(492, 'muhammad refan alfarizi', 'XII TKI', 12, 1, 22, '2026-01-06 03:50:11'),
(493, 'ahmad fathir an nafasy', 'XI TITL 2', 2, 1, 23, '2026-01-06 03:50:56'),
(494, 'muhammad robith fiqhany', 'XI TITL 2', 19, 1, 23, '2026-01-06 03:51:03'),
(495, 'm.farrel habriansyah', 'XI TITL 2', 9, 1, 23, '2026-01-06 03:51:09'),
(496, 'farrel fernanda ramadhan', 'XI TITL 2', 5, 1, 23, '2026-01-06 03:52:12'),
(497, 'm.lutfi hatta syahroni', 'XI TITL 2', 18, 1, 23, '2026-01-06 03:52:16'),
(498, 'makayla rahma jaya ningtyas', 'XII TKI', 10, 1, 21, '2026-01-06 03:52:20'),
(499, 'Cika putri anjani', 'XII TKI', 5, 1, 21, '2026-01-06 03:52:25'),
(500, 'jihan naila salsabila', 'XII TKI', 9, 1, 21, '2026-01-06 03:53:18'),
(501, 'Rahel Ika Yuliana', 'XII TKI', 18, 1, 23, '2026-01-06 03:53:32'),
(502, 'Nadine Naylya Esteva', 'XII TKI', 14, 1, 21, '2026-01-06 03:53:33'),
(503, 'nur azizah', 'XII TKI', 17, 1, 23, '2026-01-06 03:53:44'),
(504, 'ahmad dava setiawan', 'XII TPM', 1, 1, 22, '2026-01-06 03:54:37'),
(505, 'muhammad fazril reyansyah', 'XII TPM', 16, 1, 22, '2026-01-06 03:55:01'),
(506, 'aryasatya khomeini hadi', 'X RPL 1', 6, 1, 23, '2026-01-06 03:57:31'),
(507, 'febrian kusuma wardani', 'X TKRO', 7, 1, 22, '2026-01-06 04:04:55'),
(508, 'aldiano nur huda', 'X TKRO', 3, 1, 21, '2026-01-06 04:05:03'),
(509, 'MARVELINO VRIZKY VIANDRA SAPUTRA', 'X TKRO', 10, 1, 22, '2026-01-06 04:05:25'),
(510, 'rachmat hidayat', 'X TKRO', 16, 1, 21, '2026-01-06 04:06:11'),
(511, 'rasyapraditya', 'X TKRO', 17, 1, 21, '2026-01-06 04:06:30'),
(512, 'MUHAMMAD HAYKAL FAIRUZ ZABADI', 'X TKRO', 14, 1, 22, '2026-01-06 04:06:34'),
(513, 'Ahmad Ardiansyah Hariadi', 'X TKRO', 2, 1, 23, '2026-01-06 04:06:47'),
(514, 'abdulloh balya ali', 'X TKRO', 1, 1, 21, '2026-01-06 04:07:15'),
(515, 'PRADIPTAGALANGKUUMA', 'X TKRO', 15, 1, 22, '2026-01-06 04:07:38'),
(516, 'vino rizjy putra adi darma', 'X TKRO', 18, 1, 22, '2026-01-06 04:07:42'),
(517, 'moch.fazrul nevano', 'X TKRO', 11, 1, 22, '2026-01-06 04:08:13'),
(518, 'KHUSAINI AHMAD SAMPURNA', 'X TKRO', 9, 1, 21, '2026-01-06 04:08:48'),
(519, 'winto pratama', 'X TKRO', 19, 1, 22, '2026-01-06 04:09:03'),
(520, 'ismail bambang sutejo', 'X TKRO', 8, 1, 22, '2026-01-06 04:09:19'),
(521, 'Davin Akmal Mirdani', 'X TKRO', 5, 1, 21, '2026-01-06 04:09:25'),
(522, 'DIRLY YUSUF RIZALY', 'X TKRO', 6, 1, 22, '2026-01-06 04:09:49'),
(523, 'alvin adryan syach', 'X TKRO', 4, 1, 22, '2026-01-06 04:10:34'),
(524, 'Michell Ibrahim Mulyono', 'XII TPM', 10, 1, 22, '2026-01-06 04:12:12'),
(525, 'muhammad rifqi farrel andriyanto', 'XII TPM', 20, 1, 23, '2026-01-06 04:12:20'),
(526, 'ridho bintang alfarizi', 'XII TPM', 25, 1, 22, '2026-01-06 04:12:29'),
(527, 'Muhammad Zaidan Irsyad', 'XII TPM', 21, 1, 22, '2026-01-06 04:12:32'),
(528, 'deo maulana putra', 'XII TPM', 5, 1, 21, '2026-01-06 04:13:20'),
(529, 'muhammad luqman zakaria', 'XII TPM', 17, 1, 23, '2026-01-06 04:13:27'),
(530, 'jovianto dimas airlangga', 'XII TPM', 8, 1, 21, '2026-01-06 04:13:48'),
(531, 'FAQIH GIBRAN PRAMUDYA', 'XII TPM', 6, 1, 23, '2026-01-06 04:14:30'),
(532, 'mohammad andrean sya\'bani', 'XII TPM', 13, 1, 21, '2026-01-06 04:14:37'),
(533, 'Bagus Anugrah Prasetya', 'XII TPM', 3, 1, 21, '2026-01-06 04:14:54'),
(534, 'MOHAMAD DAFI RIZKY ARIF RAHMANSYAH', 'XII TPM', 12, 1, 23, '2026-01-06 04:15:32'),
(535, 'ahmad nur alfian mukarrom', 'XII TKRO', 1, 1, 22, '2026-01-06 04:15:53'),
(536, 'mohammad naufal al farisi', 'XII TPM', 18, 1, 23, '2026-01-06 04:16:06'),
(537, 'M AUFFAR RIGAN DINKY', 'XII TKRO', 9, 1, 22, '2026-01-06 04:16:31'),
(538, 'dony fawaz yuliandioni', 'XII TKRO', 4, 1, 23, '2026-01-06 04:17:17'),
(539, 'farrel joan ananta', 'XII TITL 2', 6, 1, 22, '2026-01-06 04:17:22'),
(540, 'M RIZKY PUTRA TSALASA', 'XII TKRO', 10, 1, 23, '2026-01-06 04:17:27'),
(541, 'muhammad jimmy alfajri dhafie putra', 'XII TPM', 15, 1, 22, '2026-01-06 04:18:22'),
(542, 'FACHRIZAL BAYU ATHIYYA RAHMAN', 'XII TITL 2', 4, 1, 22, '2026-01-06 04:18:25'),
(543, 'muhammad akbar ainul yaqin', 'XII TITL 2', 10, 1, 21, '2026-01-06 04:18:25'),
(544, 'm.ali fairuz alsyibly', 'XII TITL 2', 12, 1, 23, '2026-01-06 04:18:50'),
(545, 'muhammad aqiilah rachmadani', 'XII TITL 2', 13, 1, 22, '2026-01-06 04:19:21'),
(546, 'saif ali', 'XII TITL 2', 18, 1, 22, '2026-01-06 04:19:31'),
(547, 'hilmi', 'XII TITL 2', 7, 1, 23, '2026-01-06 04:19:53'),
(548, 'DIDIK', 'XII TITL 2', 5, 1, 23, '2026-01-06 04:19:58'),
(549, 'Anisah Salma Nabilah zamri', 'XII TITL 1', 5, 1, 21, '2026-01-06 04:20:17'),
(550, 'umar khafid', 'XII TITL 2', 21, 1, 22, '2026-01-06 04:20:44'),
(551, 'ALIF FAUZIYAH', 'XII TITL 1', 4, 1, 22, '2026-01-06 04:20:54'),
(552, 'Akbar Mahendra Arrahman Aras', 'XII RPL 2', 2, 1, 23, '2026-01-06 04:21:16'),
(553, 'IMAM TIMBERLAE', 'XII TITL 2', 3, 1, 22, '2026-01-06 04:21:22'),
(554, 'Muhammad alif firliendra', 'XII RPL 2', 14, 1, 23, '2026-01-06 04:21:42'),
(555, 'DENIS DWI ANDHIKA SAPUTRA', 'XII RPL 2', 6, 1, 23, '2026-01-06 04:22:07'),
(556, 'rizky ranaya putra', 'XII RPL 2', 22, 1, 23, '2026-01-06 04:22:39'),
(557, 'MUHAMAMAD ILHAM DEAN PRATAMA', 'XII RPL 2', 15, 1, 21, '2026-01-06 04:22:45'),
(558, 'Dzakwan Sajid Rabbani', 'XII RPL 2', 7, 1, 22, '2026-01-06 04:23:06'),
(559, 'm alif akbar maua', 'XII TITL 2', 11, 1, 22, '2026-01-06 04:23:07'),
(560, 'Nico Okta Arysandi', 'XII RPL 2', 20, 1, 23, '2026-01-06 04:23:52'),
(561, 'muhammad fathir canang kelana', 'XII RPL 2', 27, 1, 21, '2026-01-06 04:23:57'),
(562, 'Achmad Alief Rabbani', 'XII RPL 2', 1, 1, 21, '2026-01-06 04:24:37'),
(563, 'rovvio suci hati romli', 'XII RPL 2', 23, 1, 22, '2026-01-06 04:25:10'),
(564, 'indah nur milatika', 'XII RPL 2', 12, 1, 22, '2026-01-06 04:25:13'),
(565, 'ZULAIKHA AWALIYAH RAHMA', 'XII RPL 2', 26, 1, 22, '2026-01-06 04:25:26'),
(566, 'bagas candra pratama', 'XII RPL 2', 5, 1, 23, '2026-01-06 04:25:34'),
(567, 'ragil fajar indra pramana', 'XII RPL 2', 21, 1, 22, '2026-01-06 04:26:13'),
(568, 'MUHAMMAD FARREL PRATAMA', 'XII RPL 2', 17, 1, 22, '2026-01-06 04:26:14'),
(569, 'Fairuzian Yonda Wijaya', 'XII RPL 2', 8, 1, 23, '2026-01-06 04:26:45'),
(570, 'm.nazrihalarsyan', 'XII RPL 2', 18, 1, 23, '2026-01-06 04:26:54'),
(571, 'steven diaz maulana', 'XII RPL 2', 24, 1, 21, '2026-01-06 04:27:06'),
(572, 'MUHAMMAD ALIF AKMAL NOVIANSYAH', 'XII RPL 2', 16, 1, 22, '2026-01-06 04:27:12'),
(573, 'gieovani pratama', 'XII RPL 2', 9, 1, 22, '2026-01-06 04:27:47'),
(574, 'moh.agustian as sya\'bani', 'XII RPL 2', 13, 1, 23, '2026-01-06 04:28:02'),
(575, 'ATREYU RAHMADIANZAH', 'XII RPL 2', 4, 1, 21, '2026-01-06 04:28:04'),
(576, 'M Adutya Maulana F', 'XII TPM', 14, 1, 22, '2026-01-06 04:29:45'),
(577, 'RASYA AHMAD MAULANA', 'XII TPM', 24, 1, 22, '2026-01-06 04:29:47'),
(578, 'ABDUL ROHMAN ARAFI', 'XII TITL 1', 1, 1, 22, '2026-01-06 04:30:56'),
(579, 'FACHNICHO RAMADHAN PUTRA HANANTO', 'XII TITL 1', 8, 1, 21, '2026-01-06 04:31:19'),
(580, 'MUHAMMAD FAISHAL ARIF', 'XII TITL 1', 16, 1, 23, '2026-01-06 04:31:19'),
(581, 'bima bayu pratama', 'XII TITL 1', 7, 1, 22, '2026-01-06 04:31:21'),
(582, 'RIZKI KURNIAWAN', 'XII TITL 1', 22, 1, 22, '2026-01-06 04:32:13'),
(583, 'MUHAMMAD RIZKY ADRYANSYAH', 'XII TITL 1', 18, 1, 22, '2026-01-06 04:32:41'),
(584, 'muhammad rasya ardian', 'XII TITL 1', 17, 1, 22, '2026-01-06 04:33:02'),
(585, 'GESYA SHEVANA', 'XI TKI', 10, 1, 21, '2026-01-06 04:34:54'),
(586, 'ILYAS AINUR MAULANA', 'XII RPL 2', 10, 1, 23, '2026-01-06 04:36:16'),
(587, 'Nakeysha Sava Aira R.', 'X RPL 1', 22, 1, 22, '2026-01-06 04:46:41'),
(588, 'alexa bilqis rike soetanto', 'X RPL 2', 3, 1, 23, '2026-01-06 04:52:27'),
(589, 'muhammad azwa', 'XI PH', 9, 1, 21, '2026-01-06 04:55:17'),
(590, 'Marsaniswa Dwi Sania', 'XI RPL 2', 16, 1, 23, '2026-01-06 04:55:50'),
(591, 'almira nasha putri avrilivia', 'X TKI', 1, 1, 21, '2026-01-06 04:56:03'),
(592, 'Nano okta amauri', 'X TPM 2', 22, 1, 21, '2026-01-06 04:56:24'),
(593, 'Annisa Syifa Nurani', 'X RPL 2', 4, 1, 22, '2026-01-06 04:56:28'),
(594, 'syabima putra', 'XI TITL 2', 21, 1, 22, '2026-01-06 04:56:51'),
(595, 'Muhammad Zanuar Rasyid', 'XI RPL 1', 21, 1, 23, '2026-01-06 05:41:25'),
(596, 'SAFIRA EKA RAMADHANI', 'XI RPL 1', 27, 1, 21, '2026-01-06 05:56:06'),
(597, 'Nina Agus Saputri', 'XI RPL 1', 24, 1, 23, '2026-01-06 05:56:19'),
(598, 'belinda irsa amalia', 'XI RPL 1', -6, 1, 22, '2026-01-06 05:56:27'),
(599, 'DEBY HECILYA PUTRI ARISANDI', 'XI RPL 1', 7, 1, 23, '2026-01-06 05:57:09'),
(600, 'ekky wahyu p.f', 'XI RPL 1', 10, 1, 22, '2026-01-06 05:58:23'),
(601, 'Fathimah Azzahrah Romadhona', 'XI RPL 1', 12, 1, 22, '2026-01-06 05:58:29'),
(602, 'M.Septian Ramadhani', 'XI RPL 1', 22, 1, 21, '2026-01-06 05:58:38'),
(603, 'gia cinta sabrina b', 'XI RPL 1', 13, 1, 22, '2026-01-06 05:59:27'),
(604, 'aldan maulana h', 'XI RPL 1', 3, 1, 21, '2026-01-06 05:59:35'),
(605, 'farrel dwiangga kusuma', 'XI RPL 1', 11, 1, 22, '2026-01-06 06:00:14'),
(606, 'andi jabir trilaksana', 'XI RPL 1', 5, 1, 22, '2026-01-06 06:00:17'),
(607, 'yusuf fahrel amir', 'XI RPL 1', 29, 1, 22, '2026-01-06 06:01:05'),
(608, 'm.akmal yusuf', 'XI RPL 1', 15, 1, 22, '2026-01-06 06:01:30'),
(609, 'muhammad angga pratama', 'XI RPL 1', 16, 1, 21, '2026-01-06 06:01:57'),
(610, 'dennis setia ramadhan', 'XI RPL 1', 8, 1, 21, '2026-01-06 06:02:13'),
(611, 'Zaki Sugih Prasojo', 'XI RPL 1', 30, 1, 22, '2026-01-06 06:02:25'),
(612, 'wishnu gian maha putra', 'XI RPL 1', 28, 1, 22, '2026-01-06 06:02:46'),
(613, 'kemas satria wijaya', 'XI RPL 1', 14, 1, 22, '2026-01-06 06:02:57'),
(614, 'm.iqbal maulana', 'XI RPL 1', 23, 1, 22, '2026-01-06 06:03:20'),
(615, 'Pandu Surya Winata', 'XI RPL 1', 25, 1, 22, '2026-01-06 06:03:42'),
(616, 'M.Rafly.Andriansyah', 'XI RPL 1', 19, 1, 22, '2026-01-06 06:04:09'),
(617, 'cherelya maulidah', 'X RPL 1', 8, 1, 22, '2026-01-06 06:07:25'),
(618, 'Junaidi', 'XII TITL 1', 10, 1, 22, '2026-01-06 07:00:00'),
(619, 'Galang Cipta Ramadhan', 'XII RPL 1', 12, 1, 23, '2026-01-06 07:00:33'),
(620, 'Sylvia Nurhidayanti', 'XII RPL 2', 25, 1, 21, '2026-01-06 07:01:20'),
(621, 'amirah shafa', 'XI TKI', 2, 1, 21, '2026-01-06 07:02:48'),
(622, 'ahmad rizqi nus syifa\'', 'XII RPL 1', 4, 1, 22, '2026-01-06 07:04:14'),
(623, 'moh nazril khairi ali utomo', 'X TITL 1', 17, 1, 22, '2026-01-06 07:05:08'),
(624, 'Eldrick Joshua Ezekiel', 'XI RPL 2', 9, 1, 22, '2026-01-06 07:06:01');

-- --------------------------------------------------------

--
-- Table structure for table `vote_guru`
--

CREATE TABLE `vote_guru` (
  `id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL,
  `kandidat_id` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guru_admin`
--
ALTER TABLE `guru_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vote_guru`
--
ALTER TABLE `vote_guru`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `guru_id` (`guru_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `guru_admin`
--
ALTER TABLE `guru_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=625;

--
-- AUTO_INCREMENT for table `vote_guru`
--
ALTER TABLE `vote_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
