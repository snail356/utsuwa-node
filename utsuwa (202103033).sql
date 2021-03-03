-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-03-03 10:59:31
-- 伺服器版本： 10.4.17-MariaDB
-- PHP 版本： 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `utsuwa`
--

-- --------------------------------------------------------

--
-- 資料表結構 `address_book`
--

CREATE TABLE `address_book` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `star` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `address_book`
--

INSERT INTO `address_book` (`sid`, `name`, `email`, `mobile`, `birthday`, `address`, `created_at`, `star`) VALUES
(1, 'asd', 'asd@gmail.com', '0312345678', '2021-02-08', '台北', '2021-02-07 06:03:46', NULL),
(3, 'esdfs', 'abc@gmail.com', 'sd', '2021-02-21', 'sdfs', '2021-02-07 06:20:31', NULL),
(4, 'esdfs', 'abc@gmail.com', 'sd', '2021-02-21', 'sdfs', '2021-02-07 06:20:53', NULL),
(6, 'sd1234561', 'abc@gmail.com', '0912-201-985', '2021-02-24', '123', '2021-02-07 06:54:32', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `admins`
--

CREATE TABLE `admins` (
  `sid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `admins`
--

INSERT INTO `admins` (`sid`, `account`, `password`, `created_at`, `avatar`, `nickname`) VALUES
(1, 'shin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-02-09 10:56:24', NULL, NULL),
(0, 'test123', '123', '2021-02-05 10:18:24', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `bidding_chang`
--

CREATE TABLE `bidding_chang` (
  `bid_id` int(11) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `bid_add_money` int(11) NOT NULL,
  `bid_sum_money` int(11) DEFAULT NULL,
  `bid_created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `bidding_chang`
--

INSERT INTO `bidding_chang` (`bid_id`, `sid`, `product_id`, `bid_add_money`, `bid_sum_money`, `bid_created_time`) VALUES
(1, '1', 1, 100, 100, '2021-02-25 11:30:54'),
(2, '2', 2, 100, 200, '2021-02-25 11:32:06'),
(3, '2', 3, 200, 400, '2021-02-25 11:33:54'),
(4, '1', 4, 100, 100, '2021-02-25 11:30:54'),
(5, '1', 5, 100, 200, '2021-02-25 11:32:06'),
(6, '2', 6, 200, 400, '2021-02-25 11:33:54'),
(7, '1', 7, 100, 100, '2021-02-25 11:30:54'),
(8, '1', 8, 100, 200, '2021-02-25 11:32:06'),
(9, '2', 9, 200, 400, '2021-02-25 11:33:54'),
(10, '2', 10, 100, 500, '2021-02-25 18:18:16'),
(68, '1', 1, 10, 210, '2021-03-01 21:26:16'),
(70, '1', 1, 50, 260, '2021-03-01 21:32:30'),
(71, '1', 1, 50, 310, '2021-03-01 21:32:49');

-- --------------------------------------------------------

--
-- 資料表結構 `calendar_snail`
--

CREATE TABLE `calendar_snail` (
  `sid` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `calendar_snail`
--

INSERT INTO `calendar_snail` (`sid`, `product_name`, `category_id`, `price`, `photo`, `introduction`, `time`) VALUES
(1, '捏陶課程', 0, 0, NULL, NULL, '0000-00-00 00:00:00'),
(2, '拉胚課程', 0, 0, NULL, NULL, '0000-00-00 00:00:00'),
(3, '押花課程', 0, 0, NULL, NULL, '0000-00-00 00:00:00'),
(4, '捏陶課程', 0, 0, NULL, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `parent_key` int(11) NOT NULL,
  `en` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `parent_key`, `en`) VALUES
(1, '杯具', 0, 'cup'),
(2, '餐盤', 0, 'dish'),
(3, '飯碗', 0, 'bowl'),
(4, '花器', 0, 'flower'),
(5, '筷架', 0, 'chopsticks'),
(6, '客製', 0, 'customization'),
(7, '[ 初級 ] 拉胚課程', 1, ''),
(8, '[ 初級 ] 捏陶課程', 1, ''),
(9, '[ 中級 ] 拉胚課程', 1, ''),
(10, '[ 中級 ] 捏陶課程', 1, ''),
(11, '[ 體驗DIY ] 療癒系手捏陶', 1, ''),
(12, '[ 體驗DIY ] 彩繪陶瓷容器 ', 1, ''),
(13, '[ 體驗DIY ] 壓紋拓印陶盤', 1, ''),
(14, '[ 線上課程 ] 捏陶課程', 1, ''),
(15, '[ 線上課程 ] 拉胚課程', 1, ''),
(16, '[ 線上課程 ] 壓紋課程', 1, '');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `sid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `member_sid` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`sid`, `name`, `price`, `code`, `member_sid`, `date`) VALUES
(25, '新用戶優惠券', 60, 'NewAccount', 1, '2021-03-18');

-- --------------------------------------------------------

--
-- 資料表結構 `course_snail`
--

CREATE TABLE `course_snail` (
  `sid` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `course_snail`
--

INSERT INTO `course_snail` (`sid`, `product_name`, `category_id`, `price`, `photo`, `introduction`, `time`) VALUES
(0, '[ 線上課程 ]捏陶課程', 14, 4500, 'on-course-3.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '2021-03-11 22:52:24'),
(1, '[ 初級 ]拉胚', 7, 5800, '', '從未用雙手觸摸過陶土的人，一定對陶充滿好奇。專業的零元老師，將一步步帶領大家了解陶土，以及製陶原理。', '2021-03-21 00:00:00'),
(2, '[ 初級 ]捏陶', 8, 5800, '', '從未用雙手觸摸過陶土的人，一定對陶充滿好奇。專業的零元老師，將一步步帶領大家了解陶土，以及製陶原理。', '2021-03-22 00:00:00'),
(3, '[ 中級 ]拉胚', 9, 6000, '', '從未用雙手觸摸過陶土的人，一定對陶充滿好奇。專業的零元老師，將一步步帶領大家了解陶土，以及製陶原理。', '2021-03-23 00:00:00'),
(4, '[ 中級 ]捏陶', 10, 6000, '', '從未用雙手觸摸過陶土的人，一定對陶充滿好奇。專業的零元老師，將一步步帶領大家了解陶土，以及製陶原理。', '2021-03-24 00:00:00'),
(5, '[ 體驗DIY ]療癒系手捏陶', 11, 1200, '', '還記得第一次捏陶土就像玩泥巴一樣的有趣觸感嗎？利用創作力創作出的陶土器皿因為其溫潤的特質而顯得獨一無二，無論是陶杯、陶盤還是陶碗，除了實用性之外，還多了一分溫暖之感。', '2021-03-13 10:00:00'),
(6, '[ 體驗DIY ]彩繪陶瓷容器 ', 12, 1000, '', '對於陶製品的想像，除了手捏陶土外，還可以彩繪陶製品唷！發揮創作力及想像力，以初步坯形為基底的彩繪陶杯，因為陶土溫潤的特性，在實用性之外，還多了一分溫暖之感。', '2021-03-14 10:00:00'),
(7, '[ 體驗DIY ]壓紋拓印陶盤', 13, 1100, '', '對於陶製品的想像，除了手捏陶土外，還可以彩繪陶製品唷！發揮創作力及想像力，以初步坯形為基底的彩繪陶杯，因為陶土溫潤的特性，在實用性之外，還多了一分溫暖之感。', '2021-03-28 10:00:00'),
(9, '[ 線上課程 ]拉胚課程', 14, 4800, 'on-course-2.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00'),
(10, '[ 線上課程 ]壓紋課程', 14, 950, 'on-course-1.jpg', '陶藝的魅力，來自其質樸的氣息，來一段片刻的寧靜體驗，感受土地獨有的豐潤手感。', '0000-00-00 00:00:00'),
(11, '[ 體驗DIY ]療癒系手捏陶', 11, 1200, NULL, '還記得第一次捏陶土就像玩泥巴一樣的有趣觸感嗎？利用創作力創作出的陶土器皿因為其溫潤的特質而顯得獨一無二，無論是陶杯、陶盤還是陶碗，除了實用性之外，還多了一分溫暖之感。', '2021-03-20 14:30:00'),
(12, '[ 體驗DIY ]壓紋拓印陶盤', 13, 1100, NULL, '對於陶製品的想像，除了手捏陶土外，還可以彩繪陶製品唷！發揮創作力及想像力，以初步坯形為基底的彩繪陶杯，因為陶土溫潤的特性，在實用性之外，還多了一分溫暖之感。', '2021-03-07 13:30:00'),
(13, '[ 體驗DIY ]壓紋拓印陶盤', 13, 1100, NULL, '對於陶製品的想像，除了手捏陶土外，還可以彩繪陶製品唷！發揮創作力及想像力，以初步坯形為基底的彩繪陶杯，因為陶土溫潤的特性，在實用性之外，還多了一分溫暖之感。', '2021-03-20 09:00:00'),
(14, '[ 線上課程 ]拉胚課程', 14, 950, 'on-course-2.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00'),
(15, '[ 線上課程 ]彩繪陶瓷容器', 14, 950, 'on-course-4.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00'),
(16, '[ 線上課程 ]拉胚課程', 14, 950, 'on-course-5.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00'),
(17, '[ 線上課程 ]拉胚課程', 14, 950, 'on-course-6.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00'),
(18, '[ 線上課程 ]拉胚課程', 14, 950, 'on-course-2.jpg', '不需在陶藝教室也能享受手做陶的樂趣，創造充滿手捏特色的生活陶器 !', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `sid` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT 'profileImg.jpeg',
  `name` varchar(255) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `uuid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`sid`, `avatar`, `name`, `account`, `email`, `password`, `mobile`, `address`, `birth`, `created_at`, `uuid`) VALUES
(1, 'profileImg.jpeg', '王小明', 'amanda', 'a2214159@g.pccu.edu.tw', '123456', '09165555', '台北市大安區', '2021-03-17', '2021-02-04 17:43:55', '48570351-5c92-40fe-a83d-e3044aadc206'),
(3, '1.jpg', '王大明', 'charles', 'test@test.com', '123456', '0911234567', '台北市大安區', '2021-02-10', '2021-02-08 14:57:59', NULL),
(4, '2.jpg', '葉小明', 'erica', 'testt@test.com', '123456', '0918123456', '台北市大安區', '2021-02-17', '2021-02-08 15:27:58', NULL),
(5, '3.jpg', '莊小欣', 'julia', 'test@test.com', '123456', '0911234567', '台北市大安區', '2021-01-08', '2021-02-17 11:43:12', NULL),
(6, '14.jpg', '張小洛', 'yvette', 'test@test.com', '123456', '0912345678', '台北市大安區', '2021-03-02', '2021-02-17 16:53:26', NULL),
(19, '5.jpg', '莊小穎', 'vivian', 'test@test.com', '123456', '0911234567', '台北市大安區', '2021-03-10', '2021-03-02 18:12:41', NULL),
(20, '4.jpg', '蘇小甯', 'supermomo', 'su830918@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:35:55', NULL),
(21, '6.jpg', '小甯', 'ning0918', 'su830918@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:36:18', NULL),
(22, '7.jpg', '小蝸', 'snail', 'jyc356@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:38:01', NULL),
(23, '8.jpg', '蝸牛', 'snail356', 'jyc356@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:38:16', NULL),
(24, '9.jpg', '蝸牛牛', 'snail789', 'jyc356@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:38:20', NULL),
(25, '10.jpg', '維尼', 'winnie1', '11@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:40:03', NULL),
(26, '11.jpg', '小寧', 'winnie2', '22@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:40:38', NULL),
(27, '12.jpg', '小張', 'chang', 'asd@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:43:16', NULL),
(28, '13.jpg', '小慈', 'chang2', 'asd2@gmail.com', '123456', NULL, NULL, NULL, '2021-03-03 16:43:32', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `message_snail`
--

CREATE TABLE `message_snail` (
  `message_sid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `message_created_time` datetime DEFAULT NULL,
  `message_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `message_snail`
--

INSERT INTO `message_snail` (`message_sid`, `sid`, `category_id`, `message`, `star`, `message_created_time`, `message_photo`) VALUES
(1, 1, 11, '55555', 3, '2021-03-03 12:00:09', '4459ec6a-939d-48c1-b4af-95bc31309e6b.jpg'),
(2, 1, 11, '12132', 3, '2021-03-03 17:10:10', 'd338b425-5723-4b84-948b-3a4ea5863d37.jpg'),
(3, 1, 11, '第一次來上陶藝課，環境舒服，老師人很親切，課程的自由度很高，可以照著自己的想像捏出心中的作品，老師所教的捏陶技巧也都十分清楚簡單，完全不用擔心沒有經驗，很期待烤好的作品～～', 5, '2021-03-03 17:45:45', '16402ff7-c952-404e-906e-13586c625968.jpg'),
(4, 22, 11, '很自由的課程，可以做自己想要的作品👍🏼', 4, '2021-03-03 17:48:18', 'd11d14af-9f30-44d4-90e9-680c20f39619.jpg'),
(5, 21, 11, '很自由的課程，可以做自己想要的作品👍🏼', 4, '2021-03-03 17:52:08', 'f52b38b2-6721-4314-9975-48fee91fe719.jpg');

-- --------------------------------------------------------

--
-- 資料表結構 `ning_order`
--

CREATE TABLE `ning_order` (
  `order_id` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `customize` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `totals` int(11) DEFAULT NULL,
  `selectpay` varchar(255) DEFAULT NULL,
  `selecttransform` varchar(255) DEFAULT NULL,
  `orderDay` varchar(255) DEFAULT NULL,
  `orderName` varchar(255) DEFAULT NULL,
  `orderTel` varchar(255) DEFAULT NULL,
  `orderEmail` varchar(255) DEFAULT NULL,
  `orderRecipient` varchar(255) DEFAULT NULL,
  `orderRecipientAddress` varchar(255) DEFAULT NULL,
  `orderRecipientTel` varchar(255) DEFAULT NULL,
  `ordercreditcard` varchar(255) DEFAULT NULL,
  `ordercreditcardcheck` varchar(255) DEFAULT NULL,
  `ordercreditcardmonth` varchar(255) DEFAULT NULL,
  `ordercreditcardname` varchar(255) DEFAULT NULL,
  `ordercreditcardyear` varchar(255) DEFAULT NULL,
  `orderinvoice` varchar(255) DEFAULT NULL,
  `orderinvoicearea` varchar(255) DEFAULT NULL,
  `orderinvoicetype` varchar(255) DEFAULT NULL,
  `orderarrivaladdress` varchar(255) DEFAULT NULL,
  `orderarrivaldate` varchar(255) DEFAULT NULL,
  `orderarrivaltime` varchar(255) DEFAULT NULL,
  `shippingStatus` varchar(255) DEFAULT NULL,
  `member_sid` int(11) DEFAULT NULL,
  `ordernum` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `ning_order`
--

INSERT INTO `ning_order` (`order_id`, `sid`, `product_name`, `price`, `amount`, `color`, `size`, `introduction`, `customize`, `discount`, `totals`, `selectpay`, `selecttransform`, `orderDay`, `orderName`, `orderTel`, `orderEmail`, `orderRecipient`, `orderRecipientAddress`, `orderRecipientTel`, `ordercreditcard`, `ordercreditcardcheck`, `ordercreditcardmonth`, `ordercreditcardname`, `ordercreditcardyear`, `orderinvoice`, `orderinvoicearea`, `orderinvoicetype`, `orderarrivaladdress`, `orderarrivaldate`, `orderarrivaltime`, `shippingStatus`, `member_sid`, `ordernum`) VALUES
(434, 5, '鵝黃淺口杯', 540, 1, '黃', '120mm*68mm', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。', NULL, -60, 5220, '銀行轉帳', '宅配到府', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '1326165417514567', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030315'),
(435, 1, '象牙白咖啡杯', 690, 1, '白', '80mm*100mm', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。', NULL, -60, 5220, '銀行轉帳', '宅配到府', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '1326165417514567', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030315'),
(436, 2, '綠松石杯', 690, 1, '綠', '80mm*100mm', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。', NULL, -60, 5220, '銀行轉帳', '宅配到府', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '1326165417514567', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030315'),
(437, 52, '客製商品', 1080, 3, '藍', '200mm*200mm', '此商品承載著您特製的心意，非常適合作為禮物。', '1324564948', -60, 5220, '銀行轉帳', '宅配到府', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '1326165417514567', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030315'),
(441, 5, '鵝黃淺口杯', 540, 1, '黃', '120mm*68mm', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。', NULL, -60, 4260, '信用卡', '超商取貨', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '5698+78678678+67', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030337'),
(442, 3, '深灰手作陶瓷杯', 420, 1, '灰', '105mm*105mm', '希望通過豐富的色彩變化為日常生活著色的日子。', NULL, -60, 4260, '信用卡', '超商取貨', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '5698+78678678+67', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030337'),
(443, 52, '客製商品', 1080, 3, '藍', '200mm*200mm', '此商品承載著您特製的心意，非常適合作為禮物。', '1324564948', -60, 4260, '信用卡', '超商取貨', '2021/3/3', '王小明', '', 'aaaadmin@test.com', '管理者', 'aaaadmin@test.com', '', '5698+78678678+67', '', '', '', '', '', NULL, '', '', '', '', '已出貨', 1, '2021030337');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `sid` int(11) NOT NULL,
  `member_sid` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `orders`
--

INSERT INTO `orders` (`sid`, `member_sid`, `amount`, `order_date`) VALUES
(1, 1, 590, '2021-02-09 10:56:24'),
(2, 1, 450, '2021-02-12 10:05:24');

-- --------------------------------------------------------

--
-- 資料表結構 `product_chang`
--

CREATE TABLE `product_chang` (
  `product_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `bid_product_number` varchar(255) NOT NULL,
  `bid_deadline` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `product_chang`
--

INSERT INTO `product_chang` (`product_id`, `sid`, `photo`, `bid_product_number`, `bid_deadline`) VALUES
(1, 1, '1.jpeg', 'Bowl Dog Siberian husky', 100000),
(2, 2, '4.jpeg', 'Bowl Cat Blue', 30000),
(3, 3, '5.jpeg', 'Bowl Dog Labrador', 68875757),
(4, 4, '6.jpeg', 'Katakuchi Bowl Akae', 34534535),
(5, 5, '7.jpeg', 'Rice Bowl Green Holibut', 453345343),
(6, 6, '8.jpeg', 'Rice Bowl Red Snapper', 47833453),
(7, 7, '9.jpeg', 'Rice Bowl Blue Crab', 534334),
(8, 8, '10.jpeg', 'Rice Bowl Shiba Pink', 3435434),
(9, 9, '11.jpeg', 'Rice Bowl', 4534534),
(10, 10, '12.jpg', 'Matcha Bowl', 3753345),
(11, 11, '13.jpg', 'Rice Bowl', 3434345),
(12, 12, '2.jpeg', 'Rice Bowl', 34345454);

-- --------------------------------------------------------

--
-- 資料表結構 `product_winnie`
--

CREATE TABLE `product_winnie` (
  `sid` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `introduction` varchar(255) CHARACTER SET utf16 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `product_winnie`
--

INSERT INTO `product_winnie` (`sid`, `product_name`, `category_id`, `price`, `color`, `size`, `photo`, `introduction`) VALUES
(1, '象牙白咖啡杯', 1, 690, '白', '80mm*100mm', '[\"1.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(2, '綠松石杯', 1, 690, '綠', '80mm*100mm', '[\"2.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(3, '深灰手作陶瓷杯', 1, 420, '灰', '105mm*105mm', '[\"3.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。'),
(4, '墨黑淺杯', 1, 540, '黑', '120mm*68mm', '[\"4.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(5, '鵝黃淺口杯', 1, 540, '黃', '120mm*68mm', '[\"5.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(6, '天空藍淺口杯', 1, 540, '藍', '120mm*68mm', '[\"6.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(7, '深藍馬克杯', 1, 780, '藍', '105mm*105mm', '[\"7.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(8, '深黑馬克杯', 1, 850, '黑', '120mm*68mm', '[\"8.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(9, '象牙白馬克杯', 1, 830, '白', '120mm*68mm', '[\"9.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(10, '湖水綠咖啡杯', 1, 760, '綠', '80mm*100mm', '[\"10.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(11, '純白咖啡杯', 1, 760, '白', '80mm*100mm', '[\"11.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(12, '淺灰馬克杯', 1, 780, '灰', '105mm*105mm', '[\"12.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
(13, '大理石花紋圓盤', 2, 980, '綠', '172mm*123mm', '[\"13.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(14, '墨黑圓盤', 2, 750, '黑', '200mm*30mm', '[\"14.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(15, '雪點花紋圓盤', 2, 780, '白', '202mm*202mm', '[\"15.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(16, '深藍邊圓盤', 2, 760, '藍', '202mm*202mm', '[\"16.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(17, '綠邊圓盤', 2, 760, '綠', '202mm*202mm', '[\"17.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(18, '綠松石圓盤', 2, 750, '綠', '200mm*30mm', '[\"18.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '該系列的藍色令人印象深刻，但邊緣是裸露的。 您可以感覺到原料的質地。'),
(19, '海軍藍圓盤', 2, 890, '藍', '172mm*123mm', '[\"19-1.jpg\",\"19-2.jpg\",\"19-3.jpg\"]', '以美麗源於美味的品牌理念，顏色，外觀，質地，功能，重視容器的所有元素。'),
(20, '象牙白圓盤', 2, 750, '白', '202mm*202mm', '[\"20-1.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。 此商品特別注重光滑的磨砂質感和輪輞邊緣。'),
(21, '天空藍圓盤', 2, 750, '藍', '202mm*202mm', '[\"21-1.jpg\",\"21-2.jpg\",\"21-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。 此商品特別注重光滑的磨砂質感和輪輞邊緣。'),
(22, '粉色圓盤', 2, 750, '粉', '202mm*202mm', '[\"22.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。 此商品特別注重光滑的磨砂質感和輪輞邊緣。'),
(23, '淺灰圓盤', 2, 750, '灰', '202mm*202mm', '[\"23.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。 此商品特別注重光滑的磨砂質感和輪輞邊緣。'),
(24, '鵝黃圓盤', 2, 750, '黃', '202mm*202mm', '[\"24-1.jpg\",\"24-2.jpg\",\"24-3.jpg\"]', '希望通過豐富的色彩變化為日常生活著色的日子。 此商品特別注重光滑的磨砂質感和輪輞邊緣。'),
(25, '淺綠飯碗', 3, 590, '綠', '100mm*48mm', '[\"25.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(26, '桃粉飯碗', 3, 570, '粉', '100mm*48mm', '[\"26.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(27, '銅色飯碗', 3, 630, '銅', '100mm*48mm', '[\"27.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(28, '白色壓紋飯碗', 3, 590, '白', '100mm*48mm', '[\"28.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(29, '象牙白飯碗', 3, 590, '白', '100mm*48mm', '[\"29.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(30, '黑圖騰飯碗', 3, 680, '黑', '100mm*48mm', '[\"30.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(31, '棕色飯碗', 3, 590, '宗', '100mm*48mm', '[\"31.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(32, '咖啡色壓紋飯碗', 3, 590, '咖', '100mm*48mm', '[\"32.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(33, '墨黑飯碗', 3, 630, '黑', '100mm*48mm', '[\"33.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(34, '炫藍色飯碗', 3, 650, '藍', '100mm*48mm', '[\"34.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(35, '綠圖騰飯碗', 3, 680, '綠', '100mm*48mm', '[\"35.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(36, '棕色日式禪風花器', 4, 590, '棕', '92mm*150mm', '[\"36.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '簡約現代陶瓷花瓶，該系列具有器皿本身的優美外觀。'),
(37, '純白日式禪風花器', 4, 590, '白', '92mm*150mm', '[\"37.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '簡約現代陶瓷花瓶，該系列具有器皿本身的優美外觀。'),
(38, '磚紅日式禪風花器', 4, 590, '紅', '92mm*150mm', '[\"38.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '簡約現代陶瓷花瓶，該系列具有器皿本身的優美外觀。'),
(39, '天空藍典雅花器', 4, 890, '藍', '95mm*155mm', '[\"39.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '簡約現代陶瓷花瓶，該系列具有器皿本身的優美外觀。'),
(40, '手作棕色花器', 4, 980, '棕', '95mm*155mm', '[\"40.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '簡約現代陶瓷花瓶，該系列具有器皿本身的優美外觀。'),
(41, '珊瑚紅富士筷架', 5, 280, '紅', '85mm*114mm', '[\"41.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品手工精心製作，下著雪的富士山非常可愛，非常適合作為禮物。'),
(42, '天空藍富士筷架', 5, 280, '藍', '85mm*114mm', '[\"42.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品手工精心製作，下著雪的富士山非常可愛，非常適合作為禮物。'),
(43, '湖水藍富士筷架', 5, 280, '藍', '85mm*114mm', '[\"43.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品手工精心製作，下著雪的富士山非常可愛，非常適合作為禮物。'),
(44, '子守犬筷架', 5, 270, '白', '45mm*20mm', '[\"44.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '在日本子守犬為守護家中孩童的監護犬據說能使家庭圓滿，是一款獨具匠心的筷子架。'),
(45, '招財貓筷架', 5, 250, '白', '20mm*45mm', '[\"45.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '招財筷架(?就算只是在那裡也使餐桌變得有趣。'),
(46, '貓頭鷹筷架', 5, 180, '白', '20mm*40mm', '[\"46.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '貓頭鷹筷架靜靜陪您享用美食，就算只是在那裡也使餐桌變得有趣。'),
(47, '小魚筷架', 5, 150, '白', '30mm*40mm', '[\"47.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '小魚筷架靜靜陪您享用美食，就算只是在那裡也使餐桌變得有趣。'),
(48, '蝴蝶筷架', 5, 260, '黃', '30mm*40mm', '[\"48.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '蝴蝶筷架靜靜陪您享用美食，就算只是在那裡也使餐桌變得有趣。'),
(49, '鐵瓶筷架', 5, 220, '棕', '45mm*33mm', '[\"49.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '鐵瓶筷架靜靜陪你享用美食，就算只是在那裡也使餐桌變得有趣。'),
(50, '客製商品', 6, 1080, '黃', '200mm*200mm', '[\"50.png\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(51, '客製商品', 6, 1080, '靛', '200mm*200mm', '[\"51.png\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(52, '客製商品', 6, 1080, '藍', '200mm*200mm', '[\"52.png\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(53, '客製商品', 6, 1080, '綠', '200mm*200mm', '[\"53.png\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(54, '客製商品', 6, 1080, '粉', '200mm*200mm', '[\"54.png\",\"20-2.jpg\",\"20-3.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(57, '深綠飯碗', 3, 590, '綠', '100mm*48mm', '[\"25.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(58, '深黑飯碗', 3, 630, '黑', '100mm*48mm', '[\"33.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。'),
(59, '乳白色壓紋飯碗', 3, 590, '白', '100mm*48mm', '[\"28.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '通過將各種創作者的表情放置在同一形狀的容器上，進一步強調了這些特徵。');

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('-vAqhWMWpHowhJMGk0rSbp7awYyjAv2Q', 1614766673, '{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2021-03-03T10:17:53.496Z\",\"httpOnly\":true,\"path\":\"/\"},\"member\":{\"sid\":22,\"avatar\":\"7.jpg\",\"name\":\"小蝸\",\"account\":\"snail\",\"email\":\"jyc356@gmail.com\",\"password\":\"123456\",\"mobile\":null,\"address\":null,\"birth\":null,\"created_at\":\"2021-03-03T08:38:01.000Z\",\"uuid\":null}}'),
('J67Y4nK_FnWcmBL9ceROcss1a9yxb7IZ', 1614766794, '{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2021-03-03T10:19:54.315Z\",\"httpOnly\":true,\"path\":\"/\"},\"member\":{\"sid\":3,\"avatar\":\"1.jpg\",\"name\":\"王大明\",\"account\":\"charles\",\"email\":\"test@test.com\",\"password\":\"123456\",\"mobile\":\"0911234567\",\"address\":\"台北市大安區\",\"birth\":\"2021-02-09T16:00:00.000Z\",\"created_at\":\"2021-02-08T06:57:59.000Z\",\"uuid\":null}}'),
('gobrsbjKmV1vwwj5zRFpFyifx7q_-2Ug', 1614766897, '{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2021-03-03T10:21:36.671Z\",\"httpOnly\":true,\"path\":\"/\"},\"member\":{\"sid\":21,\"avatar\":\"6.jpg\",\"name\":\"小甯\",\"account\":\"ning0918\",\"email\":\"su830918@gmail.com\",\"password\":\"123456\",\"mobile\":null,\"address\":null,\"birth\":null,\"created_at\":\"2021-03-03T08:36:18.000Z\",\"uuid\":null}}'),
('ppLo5eTY7Ipewc2pJtMoERKt5KwRDr_k', 1614766859, '{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2021-03-03T10:20:58.702Z\",\"httpOnly\":true,\"path\":\"/\"},\"member\":{\"sid\":6,\"avatar\":\"14.jpg\",\"name\":\"張小洛\",\"account\":\"yvette\",\"email\":\"test@test.com\",\"password\":\"123456\",\"mobile\":\"0912345678\",\"address\":\"台北市大安區\",\"birth\":\"2021-03-01T16:00:00.000Z\",\"created_at\":\"2021-02-17T08:53:26.000Z\",\"uuid\":null}}');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `address_book`
--
ALTER TABLE `address_book`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `bidding_chang`
--
ALTER TABLE `bidding_chang`
  ADD PRIMARY KEY (`bid_id`);

--
-- 資料表索引 `calendar_snail`
--
ALTER TABLE `calendar_snail`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `course_snail`
--
ALTER TABLE `course_snail`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `members`
--
ALTER TABLE `members`
  ADD UNIQUE KEY `sid` (`sid`) USING BTREE;

--
-- 資料表索引 `message_snail`
--
ALTER TABLE `message_snail`
  ADD PRIMARY KEY (`message_sid`);

--
-- 資料表索引 `ning_order`
--
ALTER TABLE `ning_order`
  ADD PRIMARY KEY (`order_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `product_chang`
--
ALTER TABLE `product_chang`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `product_winnie`
--
ALTER TABLE `product_winnie`
  ADD PRIMARY KEY (`sid`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `address_book`
--
ALTER TABLE `address_book`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `bidding_chang`
--
ALTER TABLE `bidding_chang`
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `calendar_snail`
--
ALTER TABLE `calendar_snail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `coupon`
--
ALTER TABLE `coupon`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `course_snail`
--
ALTER TABLE `course_snail`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `members`
--
ALTER TABLE `members`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `message_snail`
--
ALTER TABLE `message_snail`
  MODIFY `message_sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `ning_order`
--
ALTER TABLE `ning_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `orders`
--
ALTER TABLE `orders`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_chang`
--
ALTER TABLE `product_chang`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_winnie`
--
ALTER TABLE `product_winnie`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
