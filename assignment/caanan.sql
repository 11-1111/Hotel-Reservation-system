-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2023 at 11:02 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venture`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_cred`
--

CREATE TABLE `admin_cred` (
  `sr_no` int(11) NOT NULL,
  `admin_name` varchar(150) NOT NULL,
  `admin_pass` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_cred`
--

INSERT INTO `admin_cred` (`sr_no`, `admin_name`, `admin_pass`) VALUES
(1, 'brian', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `booking_details`
--

CREATE TABLE `booking_details` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `total_pay` int(11) NOT NULL,
  `room_no` varchar(100) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_details`
--

INSERT INTO `booking_details` (`sr_no`, `booking_id`, `room_name`, `price`, `total_pay`, `room_no`, `user_name`, `phonenum`, `address`) VALUES
(0, 48, 'STAREHE', 2000, 2000, '25', 'Brian', '0105626542', 'Nyamira');

-- --------------------------------------------------------

--
-- Table structure for table `booking_order`
--

CREATE TABLE `booking_order` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `arrival` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) DEFAULT NULL,
  `booking_status` varchar(100) NOT NULL DEFAULT 'pending',
  `order_id` varchar(150) NOT NULL,
  `trans_id` varchar(200) DEFAULT NULL,
  `trans_amt` int(11) NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'pending',
  `trans_msg` varchar(200) DEFAULT NULL,
  `rate_review` int(11) DEFAULT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_order`
--

INSERT INTO `booking_order` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `arrival`, `refund`, `booking_status`, `order_id`, `trans_id`, `trans_amt`, `trans_status`, `trans_msg`, `rate_review`, `datentime`) VALUES
(46, 6, 11, '2023-05-26', '2023-05-30', 0, 0, 'cancelled', '651098769', '6_64706ede51aad', 6000, 'TNX_SUCCESS', 'Your Transaction has been confirmed', NULL, '2023-05-26 11:33:34'),
(47, 8, 11, '2023-09-12', '2023-09-13', 0, 0, 'cancelled', '865039399', '8_6500197aaa9e9', 1500, 'TNX_SUCCESS', 'Your Transaction has been confirmed', NULL, '2023-09-12 10:55:38'),
(48, 8, 13, '2023-09-12', '2023-09-13', 1, NULL, 'booked', '890601148', '8_65001ada644f3', 2500, 'TNX_SUCCESS', 'Your Transaction has been confirmed', 0, '2023-09-12 11:01:30'),
(49, 6, 13, '2023-09-13', '2023-09-20', 0, NULL, 'booked', '612037753', '6_65001fb59bfa9', 17500, 'TNX_SUCCESS', 'Your Transaction has been confirmed', NULL, '2023-09-12 11:22:13'),
(50, 8, 12, '2023-09-13', '2023-09-14', 0, NULL, 'booked', '825841826', '8_650022a00a194', 2000, 'TNX_SUCCESS', 'Your Transaction has been confirmed', NULL, '2023-09-12 11:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `contact_details`
--

CREATE TABLE `contact_details` (
  `sr_no` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gmap` varchar(100) NOT NULL,
  `pn1` bigint(20) NOT NULL,
  `pn2` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb` varchar(100) NOT NULL,
  `insta` varchar(100) NOT NULL,
  `tw` varchar(100) NOT NULL,
  `iframe` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_details`
--

INSERT INTO `contact_details` (`sr_no`, `address`, `gmap`, `pn1`, `pn2`, `email`, `fb`, `insta`, `tw`, `iframe`) VALUES
(1, 'Nyamira', 'https://goo.gl/maps/8CFe9Bt4jb7TJied7', 254701303198, 254741217182, 'brianobaigwa83@gmail.com', 'https://www.facebook.com', 'instagram.com', 'twitter.com', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d266.0930636653276!2d34.936595985936!3d-0.5652779197640662!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x182b191b82f1498d:0x541ba7f5714e3f38!2sCanaan Restaurant!5e0!3m2!1sen!2ske!4v1694438972717!5m2!1sen!2ske');

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `id` int(11) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`id`, `icon`, `name`, `description`) VALUES
(4, 'IMG_86765.svg', 'wifi', 'Obtain the hotel&#039;s wireless network name and password when you check in. Open your device&#039;s Wi-Fi settings, choose the hotel&#039;s network, and select Connect. Enter the password to browse.'),
(5, 'IMG_16549.svg', 'Television', 'We&#039;re pleased to offer in-room entertainment options, so you can unwind and enjoy your favorite shows during your stay.'),
(6, 'IMG_25194.svg', 'Room heater', 'We understand that a comfortable temperature is essential to a good night&#039;s sleep. That&#039;s why we&#039;re pleased to offer a room heater in each of our guest rooms, so you can adjust the temperature to your liking.'),
(7, 'IMG_22573.svg', 'Geyser', 'We understand the importance of a hot shower to start your day or to relax after a long day of exploring. That&#039;s why we provide a geyser (hot water heater) in each of our guest rooms to ensure a comfortable and relaxing stay. '),
(8, 'IMG_31482.svg', 'Air Conditioner', 'Stay cool during your stay with our air-conditioned rooms. Enjoy a comfortable temperature indoors no matter the weather outside. Book now to experience a comfortable stay with us.'),
(9, 'IMG_80208.svg', 'Spa', 'Relax and rejuvenate at our on-site spa. Choose from a range of treatments, including massages, facials, and more. Book your stay now to enjoy the ultimate in relaxation during your stay with us.');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `name`) VALUES
(1, 'bedroom'),
(2, 'balcony'),
(3, 'kitchen');

-- --------------------------------------------------------

--
-- Table structure for table `rating_review`
--

CREATE TABLE `rating_review` (
  `sr_no` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(200) NOT NULL,
  `seen` varchar(200) NOT NULL DEFAULT '0',
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `area` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `adult` int(11) NOT NULL,
  `children` int(11) NOT NULL,
  `description` varchar(350) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `removed` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `area`, `price`, `quantity`, `adult`, `children`, `description`, `status`, `removed`) VALUES
(8, 'rais', 654, 4, 2, 44, 44, 'free', 1, 1),
(9, 'ALMACK', 767, 4500, 1, 8, 8, 'wuueh', 1, 1),
(10, 'simple', 2145, 3622, 23, 23, 2, 'dwell', 1, 1),
(11, 'ALMACK', 250, 1500, 10, 5, 3, 'Standard Room Favourite for everyone', 1, 0),
(12, 'STAREHE', 300, 2000, 2, 3, 2, 'Executive room designed for business travelers who need to work during their stay.', 1, 0),
(13, 'Jamu Court', 600, 2500, 5, 8, 6, 'Suite that is larger and more luxurious than standard rooms. They often include a separate living area, a bedroom, and a bathroom.', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `room_facilities`
--

CREATE TABLE `room_facilities` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_facilities`
--

INSERT INTO `room_facilities` (`sr_no`, `room_id`, `facilities_id`) VALUES
(59, 11, 4),
(60, 11, 5),
(61, 11, 6),
(62, 11, 8),
(63, 11, 9),
(64, 12, 4),
(65, 12, 5),
(66, 12, 7),
(67, 12, 8),
(68, 12, 9),
(69, 13, 4),
(70, 13, 5),
(71, 13, 8),
(72, 13, 9);

-- --------------------------------------------------------

--
-- Table structure for table `room_features`
--

CREATE TABLE `room_features` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `features_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_features`
--

INSERT INTO `room_features` (`sr_no`, `room_id`, `features_id`) VALUES
(38, 11, 1),
(39, 11, 2),
(40, 11, 3),
(41, 12, 1),
(42, 12, 2),
(43, 12, 3),
(44, 13, 1),
(45, 13, 2),
(46, 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `room_images`
--

CREATE TABLE `room_images` (
  `sr_no` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `thumb` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_images`
--

INSERT INTO `room_images` (`sr_no`, `room_id`, `image`, `thumb`) VALUES
(15, 11, 'IMG_11732.png', 0),
(16, 11, 'IMG_54948.png', 1),
(17, 12, 'IMG_71765.png', 0),
(18, 12, 'IMG_36988.png', 1),
(19, 13, 'IMG_43387.png', 0),
(20, 13, 'IMG_56736.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sr_no` int(11) NOT NULL,
  `site_title` varchar(50) NOT NULL,
  `site_about` varchar(250) NOT NULL,
  `shutdown` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sr_no`, `site_title`, `site_about`, `shutdown`) VALUES
(1, 'CAANAN HOTEL', 'During your stay at our Hotel, you get Great dishes, accomodation and hot seat for Nyamira Politics. Visit for Delicious meals within Nyamira Town.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_details`
--

CREATE TABLE `team_details` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `picture` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_cred`
--

CREATE TABLE `user_cred` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(120) NOT NULL,
  `phonenum` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `dob` int(11) NOT NULL,
  `profile` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `token` varchar(200) DEFAULT NULL,
  `t_expire` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `datentime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_cred`
--

INSERT INTO `user_cred` (`id`, `name`, `email`, `address`, `phonenum`, `pincode`, `dob`, `profile`, `password`, `is_verified`, `token`, `t_expire`, `status`, `datentime`) VALUES
(6, 'Slam Dunk', 'slamdunk029@gmail.com', 'Chuka', '0721152390', 11056, 2023, 'IMG_34894.jpeg', '$2y$10$M6QYVghpVX7cEBjKJpc10.8qHnTIGz9127s/wkG/u0ABWeQ8fO6Qq', 0, 'b9d34c8d6f07fa2a06b01a171d086a62', NULL, 1, '2023-04-01 16:41:01'),
(8, 'Brian', 'brian@gmail.com', 'Nyamira', '0105626542', 40500, 2023, 'IMG_94366.jpeg', '$2y$10$aoupl1WylRnggJxoJu7J/uPwlQ99cwMobWE/AAZjqrpgy/gOErbe.', 1, '7b63db6698eab0882d5272f69f0f3728', NULL, 1, '2023-09-12 10:54:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_queries`
--

CREATE TABLE `user_queries` (
  `sr_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datentime` datetime NOT NULL DEFAULT current_timestamp(),
  `seen` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_cred`
--
ALTER TABLE `admin_cred`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `booking_details`
--
ALTER TABLE `booking_details`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `facilities id` (`facilities_id`),
  ADD KEY `room id` (`room_id`);

--
-- Indexes for table `room_features`
--
ALTER TABLE `room_features`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `rm id` (`room_id`),
  ADD KEY `features id` (`features_id`) USING BTREE;

--
-- Indexes for table `room_images`
--
ALTER TABLE `room_images`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `room_images_ibfk_1` (`room_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `team_details`
--
ALTER TABLE `team_details`
  ADD PRIMARY KEY (`sr_no`);

--
-- Indexes for table `user_cred`
--
ALTER TABLE `user_cred`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_queries`
--
ALTER TABLE `user_queries`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_cred`
--
ALTER TABLE `admin_cred`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_details`
--
ALTER TABLE `booking_details`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `booking_order`
--
ALTER TABLE `booking_order`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `rating_review`
--
ALTER TABLE `rating_review`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `room_facilities`
--
ALTER TABLE `room_facilities`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `room_features`
--
ALTER TABLE `room_features`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `room_images`
--
ALTER TABLE `room_images`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_details`
--
ALTER TABLE `team_details`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_cred`
--
ALTER TABLE `user_cred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_queries`
--
ALTER TABLE `user_queries`
  MODIFY `sr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_order`
--
ALTER TABLE `booking_order`
  ADD CONSTRAINT `booking_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`),
  ADD CONSTRAINT `booking_order_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rating_review`
--
ALTER TABLE `rating_review`
  ADD CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking_order` (`booking_id`),
  ADD CONSTRAINT `rating_review_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `rating_review_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_cred` (`id`);

--
-- Constraints for table `room_facilities`
--
ALTER TABLE `room_facilities`
  ADD CONSTRAINT `facilities id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `room id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_features`
--
ALTER TABLE `room_features`
  ADD CONSTRAINT `feature id` FOREIGN KEY (`features_id`) REFERENCES `features` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `rm id` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `room_images`
--
ALTER TABLE `room_images`
  ADD CONSTRAINT `room_images_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
