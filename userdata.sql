-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 31 يوليو 2023 الساعة 20:46
-- إصدار الخادم: 10.6.7-MariaDB-3
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdata`
--

-- --------------------------------------------------------

--
-- بنية الجدول `section`
--

CREATE TABLE `section` (
  `id` int(11) UNSIGNED NOT NULL,
  `section_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `section`
--

INSERT INTO `section` (`id`, `section_name`) VALUES
(1, 'السجل العقاري'),
(2, 'الشؤن القانونية'),
(3, 'المساحة'),
(4, 'الوثائق'),
(5, 'الاراضي'),
(6, 'التحصيل'),
(7, 'خدمة الجمهور'),
(8, 'المستشارين'),
(9, 'مكتب النائب');

-- --------------------------------------------------------

--
-- بنية الجدول `SRC`
--

CREATE TABLE `SRC` (
  `id` int(11) UNSIGNED NOT NULL,
  `Date_add_doc` datetime DEFAULT NULL,
  `NumberDoc` int(11) NOT NULL,
  `NameDoc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TypeDoc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `Table_Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NumPhone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date_registration` date NOT NULL,
  `Date_login` date NOT NULL,
  `time_login` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `work`
--

CREATE TABLE `work` (
  `_ID` int(11) NOT NULL,
  `Doc_id` int(11) UNSIGNED NOT NULL,
  `User_send` int(11) UNSIGNED NOT NULL,
  `Date_send` datetime NOT NULL,
  `User_rec` int(11) UNSIGNED DEFAULT NULL,
  `Date_rec` datetime DEFAULT NULL,
  `tmp_rec` int(11) UNSIGNED DEFAULT NULL,
  `tmp_date_rec` datetime DEFAULT NULL,
  `request_stat` int(11) NOT NULL,
  `request_done` int(11) NOT NULL,
  `type_send` int(11) DEFAULT NULL,
  `bool_set` tinyint(1) DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `SRC`
--
ALTER TABLE `SRC`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD PRIMARY KEY (`_ID`),
  ADD KEY `work_Doc_id_SRC_id` (`Doc_id`),
  ADD KEY `work_send_section_send` (`User_send`),
  ADD KEY `work_rec_section_rec` (`User_rec`),
  ADD KEY `work_rec_section_rec_tmp` (`tmp_rec`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `SRC`
--
ALTER TABLE `SRC`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work`
--
ALTER TABLE `work`
  MODIFY `_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_Doc_id_SRC_id` FOREIGN KEY (`Doc_id`) REFERENCES `SRC` (`id`),
  ADD CONSTRAINT `work_rec_section_rec` FOREIGN KEY (`User_rec`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `work_rec_section_rec_tmp` FOREIGN KEY (`tmp_rec`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `work_send_section_send` FOREIGN KEY (`User_send`) REFERENCES `section` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
