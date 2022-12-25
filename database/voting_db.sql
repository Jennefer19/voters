-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 22, 2022 at 02:57 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voting_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `category`) VALUES
(1, 'President'),
(3, 'Vice Presindent'),
(4, 'Secretary'),
(5, 'Sub-Secretary'),
(6, 'Treasurer'),
(7, 'Sub-Treasurer'),
(8, 'Auditor'),
(9, 'P.R.O'),
(10, 'Business_Manager'),
(11, 'Adonis'),
(12, 'Muse'),
(13, '1st_Year_Representative'),
(14, '2nd_Year_Representative'),
(15, '3rd_Year_Representative'),
(16, '4th_Year_Representative');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `lastname` varchar(200) DEFAULT NULL,
  `firstname` varchar(200) DEFAULT NULL,
  `middlename` varchar(200) DEFAULT NULL,
  `program` varchar(200) DEFAULT NULL,
  `yearlevel` varchar(200) DEFAULT NULL,
  `votestatus` varchar(200) DEFAULT NULL,
  `voterskey` varchar(200) DEFAULT NULL,
  `date_and_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `studentId`, `lastname`, `firstname`, `middlename`, `program`, `yearlevel`, `votestatus`, `voterskey`, `date_and_time`) VALUES
(4, 754444, 'bnjn', 'bhjn', 'vuhjjkbn', 'yghbn', '8jnjik', 'y87u', 'gyuhbj', '2022-11-22 20:41:26'),
(5, 23456, 'drhgjghggc', 'ghfghh', 'hjhjv', 'dfghjk', '43gf', '5565', 'ftyfhhjj', '2022-11-23 14:38:59'),
(6, 31021, 'Catalan', 'Jennefer', 'Guttierez', 'BSIT', '8jnjik', '23', 'ggggg', '2022-12-07 08:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `sid` int(10) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `program` varchar(50) NOT NULL,
  `year` int(50) NOT NULL,
  `vstatus` varchar(50) NOT NULL,
  `vkey` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1+admin , 2 = users'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `sid`, `lname`, `name`, `mname`, `program`, `year`, `vstatus`, `vkey`, `username`, `password`, `type`) VALUES
(1, 123456, 'Admin', 'Administrator', 'Admin', 'BSIT', 3, 'active', 'Admin-3Active', 'admin', 'admin123', 1),
(2, 31021, 'catalan', 'Jennefer', 'Guttierez', 'BSIT', 3, 'admin', 'jennefer-3Admin', 'jennefer', 'jennefer123', 1),
(5, 31022, 'studentno1', 'studentno1', 'studentno1', 'BSIT', 3, 'student', 'studentno1-3Student', 'studentno1', 'studentno1', 2),
(6, 31023, 'studentno2', 'studentno2', 'studentno2', 'BSIT', 3, 'student', 'studentno2-3Student', 'studentno2', 'studentno2', 2),
(7, 31024, 'studentno3', 'studentno3', 'studentno3', 'BSIT', 2, 'student', 'studentno3-2Student', 'studentno3', 'studentno3', 2);

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `voting_opt_id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `voting_id`, `category_id`, `voting_opt_id`, `user_id`) VALUES
(1, 1, 1, 1, 3),
(2, 1, 3, 5, 3),
(3, 1, 4, 6, 3),
(4, 1, 4, 7, 3),
(5, 1, 4, 8, 3),
(6, 1, 4, 9, 3),
(7, 1, 1, 3, 4),
(8, 1, 3, 12, 4),
(9, 1, 4, 6, 4),
(10, 1, 4, 8, 4),
(11, 1, 4, 10, 4),
(12, 1, 4, 11, 4),
(13, 1, 1, 14, 5),
(14, 1, 3, 46, 5),
(15, 1, 4, 44, 5),
(16, 1, 5, 42, 5),
(17, 1, 6, 40, 5),
(18, 1, 7, 38, 5),
(19, 1, 8, 35, 5),
(20, 1, 8, 36, 5),
(21, 1, 9, 31, 5),
(22, 1, 9, 48, 5),
(23, 1, 10, 27, 5),
(24, 1, 10, 30, 5),
(25, 1, 11, 26, 5),
(26, 1, 12, 23, 5),
(27, 1, 13, 22, 5),
(28, 1, 14, 19, 5),
(29, 1, 15, 17, 5),
(30, 1, 16, 15, 5),
(31, 1, 1, 13, 6),
(32, 1, 3, 45, 6),
(33, 1, 4, 43, 6),
(34, 1, 5, 41, 6),
(35, 1, 6, 39, 6),
(36, 1, 7, 37, 6),
(37, 1, 8, 34, 6),
(38, 1, 8, 35, 6),
(39, 1, 9, 31, 6),
(40, 1, 9, 32, 6),
(41, 1, 10, 27, 6),
(42, 1, 10, 28, 6),
(43, 1, 11, 25, 6),
(44, 1, 12, 23, 6),
(45, 1, 13, 21, 6),
(46, 1, 14, 19, 6),
(47, 1, 15, 17, 6),
(48, 1, 16, 15, 6);

-- --------------------------------------------------------

--
-- Table structure for table `voting_cat_settings`
--

CREATE TABLE `voting_cat_settings` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `max_selection` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voting_cat_settings`
--

INSERT INTO `voting_cat_settings` (`id`, `voting_id`, `category_id`, `max_selection`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 1, 4, 1),
(4, 1, 8, 2),
(5, 1, 9, 2),
(6, 1, 10, 2),
(7, 3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `voting_list`
--

CREATE TABLE `voting_list` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voting_list`
--

INSERT INTO `voting_list` (`id`, `title`, `description`, `is_default`) VALUES
(1, 'PHILCST CSS VOTING', 'start Voting', 1),
(3, 'Test Voting', 'Test Only', 0);

-- --------------------------------------------------------

--
-- Table structure for table `voting_opt`
--

CREATE TABLE `voting_opt` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `image_path` text NOT NULL,
  `opt_txt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `voting_opt`
--

INSERT INTO `voting_opt` (`id`, `voting_id`, `category_id`, `image_path`, `opt_txt`) VALUES
(13, 1, 1, '1670384700_President.jpg', 'ADRIAN KEN ROSARIO'),
(14, 1, 1, '1670384700_2.jpg', 'JAHNELLE MENOR'),
(15, 1, 16, '1670384760_1.jpg', 'LAURYNZ IDOS'),
(16, 1, 16, '1670384760_4.jpg', 'JESSA FRIAS'),
(17, 1, 15, '1670384820_3.jpg', 'PATRICK DENIEVA'),
(18, 1, 15, '1670384820_adonis.jpg', 'ADRIEL ANTHONY FERRER'),
(19, 1, 14, '1670384880_auditor.jpg', 'JOANA ROSE LIMPIN'),
(20, 1, 14, '1670384880_auditors.jpg', 'MIGUEL ALLEN LABRADOR'),
(21, 1, 13, '1670384940_busm.jpg', 'EMMANUEL TRIMIDAL'),
(22, 1, 13, '1670384940_sec.jpeg', 'JENAN MUYARGAS'),
(23, 1, 12, '1670385000_muse.webp', 'JULLIANE PONIO'),
(24, 1, 12, '1670385000_subsec.jpg', 'EDELYN MALILLIN'),
(25, 1, 11, '1670385000_busms.jpg', 'SHAWN MICHAEL DE LIMA'),
(26, 1, 11, '1670385060_pro.jpg', 'RANDRE CABANSAG'),
(27, 1, 10, '1670385060_subtr.jpg', 'MERY LOVELY JANA LU'),
(28, 1, 10, '1670385120_pros.webp', 'KERSTEN SEAN CALIMLIM'),
(29, 1, 10, '1670385120_vp.webp', 'JOHN ALLEN VILLAMIN'),
(30, 1, 10, '1670385180_1.jpg', 'ERNESTO DELA CRUZ'),
(31, 1, 9, '1670385180_3.jpg', 'JAYSON LAFORTEZA'),
(32, 1, 9, '1670385240_adonis.jpg', 'ARCHIE BOLINAS'),
(33, 1, 9, '1670385240_auditors.jpg', 'RYMYR POSERIO'),
(34, 1, 8, '1670385300_tr.jpeg', 'CHRISTINE ANGEL AGUILAR'),
(35, 1, 8, '1670385300_busm.jpg', 'CZAR LUNA'),
(36, 1, 8, '1670385300_busms.jpg', 'JAY-R JOVES'),
(37, 1, 7, '1670385360_w.png', 'DIANE NICOLE TUMANAN'),
(38, 1, 7, '1670385360_2.jpg', 'STEFANNY DAMACIN'),
(39, 1, 6, '1670385420_4.jpg', 'HANNAH PATRICIA CASTRO'),
(40, 1, 6, '1670385420_auditor.jpg', 'MARISOL DE LEON'),
(41, 1, 5, '1670385480_muse.webp', 'JHYNIECEL MAYNIGO'),
(42, 1, 5, '1670385480_sec.jpeg', 'NICHOLLE ARENAS'),
(43, 1, 4, '1670385540_subsec.jpg', 'KIM ALEXIS DE GUZMAN'),
(44, 1, 4, '1670385540_subtr.jpg', 'MARJORIE MAYNIGO'),
(45, 1, 3, '1670385600_w.png', 'KIM KYLE MARQUEZ'),
(46, 1, 3, '1670385600_pros.webp', 'TIMOTHY JARED TANDOC'),
(47, 1, 8, '1670386320_subsec.jpg', 'JEMARIE TULAO CRUZ'),
(48, 1, 9, '1670386380_vp.webp', 'CARLO CARASI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_list`
--
ALTER TABLE `voting_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_opt`
--
ALTER TABLE `voting_opt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `voting_list`
--
ALTER TABLE `voting_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `voting_opt`
--
ALTER TABLE `voting_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
