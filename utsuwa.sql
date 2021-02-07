-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2021-02-07 04:48:42
-- 伺服器版本： 10.4.16-MariaDB
-- PHP 版本： 7.3.24

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
(1, 'shin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2021-02-09 10:56:24', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `bidding_chang`
--

CREATE TABLE `bidding_chang` (
  `bid_id` int(11) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `bid_product_number` varchar(255) NOT NULL,
  `bid_add_money` int(11) NOT NULL,
  `bid_sum_money` int(11) NOT NULL,
  `bid_created_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `bidding_chang`
--

INSERT INTO `bidding_chang` (`bid_id`, `sid`, `bid_product_number`, `bid_add_money`, `bid_sum_money`, `bid_created_time`) VALUES
(0, '1gk12345', 'a001', 88888, 2000, '2021-02-26 00:00:00'),
(2, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(3, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(4, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(5, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(6, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(7, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(8, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(9, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(10, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(11, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(12, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(13, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(14, '1', 'a001', 1000, 2000, '2021-02-16 06:40:05'),
(15, '1', 'a00112345', 1000, 2000, '2021-02-07 00:00:00'),
(16, '1', 'a001123', 1000, 2000, '2021-02-23 00:00:00'),
(18, '123456', 'a001', 100, 2000, '2021-02-07 11:22:30');

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
(1, '拉胚', 7, 5800, '', '', '2021-03-21 00:00:00'),
(2, '捏陶', 8, 5800, '', '', '2021-03-22 00:00:00'),
(3, '拉胚', 9, 6000, '', '', '2021-03-23 00:00:00'),
(4, '捏陶', 10, 6000, '', '', '2021-03-24 00:00:00'),
(5, '療癒系手捏陶', 11, 1200, '', '', '2021-03-25 00:00:00'),
(6, '彩繪陶瓷容器 ', 12, 1000, '', '', '2021-03-26 00:00:00'),
(7, '壓紋拓印陶盤', 13, 1100, '', '', '2021-03-27 00:00:00'),
(8, '捏陶', 14, 4500, '', '', '0000-00-00 00:00:00'),
(9, '拉胚', 15, 4800, '', '', '0000-00-00 00:00:00'),
(10, '壓紋', 16, 950, '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `members`
--

CREATE TABLE `members` (
  `sid` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `members`
--

INSERT INTO `members` (`sid`, `avatar`, `account`, `email`, `password`, `mobile`, `address`, `birthday`, `created_at`) VALUES
(1, NULL, 'admin', 'admin@test.com', 'admin', NULL, NULL, NULL, '2021-02-04 17:43:55');

-- --------------------------------------------------------

--
-- 資料表結構 `message_snail`
--

CREATE TABLE `message_snail` (
  `sid` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `massege` varchar(255) NOT NULL,
  `star` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `message_snail`
--

INSERT INTO `message_snail` (`sid`, `avatar`, `account`, `category_id`, `massege`, `star`) VALUES
(1, '', 'A', 1, '好難', 3),
(2, '', 'A', 6, '有趣', 5),
(3, '', 'B', 8, '教學詳細', 4);

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

-- --------------------------------------------------------

--
-- 資料表結構 `order_details`
--

CREATE TABLE `order_details` (
  `sid` int(11) NOT NULL,
  `order_sid` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `order_details`
--

INSERT INTO `order_details` (`sid`, `order_sid`, `product_sid`, `price`, `quantity`) VALUES
(1, 4, 25, 590, 1),
(2, 4, 2, 690, 2),
(3, 4, 13, 980, 1),
(4, 5, 16, 580, 1),
(5, 5, 17, 620, 2),
(6, 9, 6, 450, 1),
(7, 9, 8, 520, 2),
(8, 9, 14, 580, 1),
(9, 10, 1, 560, 1),
(10, 10, 2, 420, 1),
(11, 10, 3, 480, 1),
(12, 11, 5, 540, 2),
(13, 11, 15, 650, 1),
(14, 13, 10, 580, 1),
(15, 13, 15, 490, 1),
(16, 13, 12, 580, 1),
(17, 14, 17, 750, 6),
(18, 14, 13, 580, 4),
(19, 14, 1, 590, 3),
(20, 14, 5, 580, 1),
(21, 15, 7, 520, 1),
(22, 16, 9, 520, 1),
(23, 17, 5, 580, 1),
(24, 18, 1, 280, 1),
(25, 18, 23, 520, 1),
(26, 18, 21, 490, 1),
(27, 19, 23, 520, 1),
(28, 19, 22, 580, 1),
(29, 20, 1, 280, 1),
(30, 21, 23, 520, 1),
(31, 22, 5, 890, 3),
(32, 22, 3, 260, 1),
(33, 23, 2, 220, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `product_winnie`
--

CREATE TABLE `product_winnie` (
  `sid` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
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
(4, '墨黑淺口杯', 1, 540, '黑', '120mm*68mm', '[\"4.jpg\",\"20-2.jpg\",\"20-3.jpg\"]', '擁有此商品可以每天早晨選擇杯子的顏色，就像選擇襯衫的顏色一樣。'),
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
(50, '客製商品', 6, 1080, '黃', '200mm*200mm', '[\"50.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(51, '客製商品', 6, 1080, '深藍', '200mm*200mm', '[\"51.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(52, '客製商品', 6, 1080, '天空藍', '200mm*200mm', '[\"52.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(53, '客製商品', 6, 1080, '綠', '200mm*200mm', '[\"53.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。'),
(54, '客製商品', 6, 1080, '粉', '200mm*200mm', '[\"54.jpg\"]', '此商品承載著您特製的心意，非常適合作為禮物。');

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
('LiXWkoO4RysN6rQH6KIt_GgYnh9cuXCx', 1612670392, '{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2021-02-07T03:48:36.440Z\",\"httpOnly\":true,\"path\":\"/\"},\"admin\":{\"sid\":1,\"account\":\"shin\",\"password\":\"7c4a8d09ca3762af61e59520943dc26494f8941b\",\"created_at\":\"2021-02-09T02:56:24.000Z\",\"avatar\":null,\"nickname\":null}}');

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
  MODIFY `bid_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
