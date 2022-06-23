-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 23, 2022 lúc 04:11 AM
-- Phiên bản máy phục vụ: 5.7.24
-- Phiên bản PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bitlylinkfun`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `published` int(2) NOT NULL DEFAULT '0',
  `content` text,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `default_campaign` tinyint(1) DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ad_type` int(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 = inter., 2 = banner',
  `status` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=Active, 2=Paused, 3=Canceled, 4=Finished, 5=Under Review, 6=Pending Payment, 7=Invalid Payment, 8=Refunded',
  `payment_method` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) NOT NULL DEFAULT '',
  `website_title` varchar(256) NOT NULL DEFAULT '',
  `website_url` varchar(500) NOT NULL DEFAULT '',
  `banner_name` varchar(256) NOT NULL DEFAULT '',
  `banner_size` tinytext,
  `banner_code` text,
  `price` float(50,6) NOT NULL DEFAULT '0.000000',
  `traffic_source` int(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 = all, 2 = Desktop, 3 = Mobile',
  `transaction_id` varchar(256) NOT NULL DEFAULT '',
  `transaction_details` text,
  `started` datetime DEFAULT NULL,
  `completed` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `campaigns`
--

INSERT INTO `campaigns` (`id`, `default_campaign`, `user_id`, `ad_type`, `status`, `payment_method`, `name`, `website_title`, `website_url`, `banner_name`, `banner_size`, `banner_code`, `price`, `traffic_source`, `transaction_id`, `transaction_details`, `started`, `completed`, `modified`, `created`) VALUES
(1, 1, 2, 1, 1, '', 'game22h', 'Default Campaign', 'https://game22h.com/', '', NULL, NULL, 10.000000, 1, '', '', '2022-06-23 02:32:06', '2022-06-23 02:32:06', '2022-06-23 03:45:36', '2022-06-23 02:32:06'),
(2, 0, 2, 2, 1, '', 'Default Banner Campaign', '', '', 'Default Banner', '468x60', '<a href=\"#\"><img src=\"https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x_r2.png\"></a>', 10.000000, 1, '', '', '2022-06-23 02:32:06', '2022-06-23 02:32:06', '2022-06-23 03:45:15', '2022-06-23 02:32:06'),
(3, 1, 2, 3, 1, '', 'Pop Up Banner Campaign', 'Default Pop Up', 'http://www.facebook.com/', '', NULL, NULL, 10.000000, 1, '', NULL, '2022-06-23 02:32:09', '2022-06-23 02:32:09', '2022-06-23 02:32:09', '2022-06-23 02:32:09'),
(4, 0, 3, 1, 6, 'paypal', 'chiến dịch 1', 'game 22h', 'https://game22h.com', '', NULL, NULL, 15.000000, 1, '', NULL, NULL, NULL, '2022-06-23 03:18:02', '2022-06-23 03:17:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaign_items`
--

CREATE TABLE `campaign_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) NOT NULL DEFAULT '0',
  `country` varchar(3) NOT NULL DEFAULT '',
  `advertiser_price` float(50,6) NOT NULL DEFAULT '0.000000',
  `publisher_price` float(50,6) NOT NULL DEFAULT '0.000000',
  `purchase` int(10) NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `weight` float(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `campaign_items`
--

INSERT INTO `campaign_items` (`id`, `campaign_id`, `country`, `advertiser_price`, `publisher_price`, `purchase`, `views`, `weight`) VALUES
(1, 1, 'all', 1.000000, 0.400000, 10, 0, 0.00),
(2, 2, 'all', 1.000000, 0.400000, 10, 0, 0.00),
(3, 3, 'all', 1.000000, 0.400000, 10, 0, 0.00),
(4, 4, 'all', 1.000000, 0.400000, 1, 0, 0.00),
(5, 4, 'CA', 4.000000, 1.600000, 1, 0, 0.00),
(6, 4, 'GB', 5.000000, 2.000000, 1, 0, 0.00),
(7, 4, 'US', 5.000000, 2.000000, 1, 0, 0.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `i18n`
--

CREATE TABLE `i18n` (
  `id` int(11) UNSIGNED NOT NULL,
  `locale` varchar(6) NOT NULL,
  `model` varchar(255) NOT NULL,
  `foreign_key` int(10) NOT NULL,
  `field` varchar(255) NOT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `links`
--

CREATE TABLE `links` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ad_type` int(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 = inter., 2 = banner',
  `status` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=active, 2=hidden, 3=inactive',
  `url` varchar(500) NOT NULL DEFAULT '',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text,
  `image` varchar(256) NOT NULL DEFAULT '',
  `hits` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `links`
--

INSERT INTO `links` (`id`, `user_id`, `ad_type`, `status`, `url`, `domain`, `alias`, `title`, `description`, `image`, `hits`, `modified`, `created`) VALUES
(1, 2, 1, 1, 'https://www.facebook.com/', '', 'lnZqI', 'Facebook', '', '', 2, '2022-06-23 02:33:42', '2022-06-23 02:33:42'),
(2, 1, 1, 3, 'https://howtocheats.com/nft-coin/top-solana-nfts-to-buy-now-before-opensea-integration-best-solana-nft-projects-2022', '', 'hlrsBM0', 'TOP SOLANA NFTs TO BUY NOW BEFORE OPENSEA INTEGRATION! | Best Solana NFT Projects 2022', 'The time has come. OpenSea has finally announced that they will integrate Solana NFTs for trading on their platform from April onwards.', 'https://howtocheats.com/wp-content/uploads/2022/04/image-10.png', 2, '2022-06-23 02:59:54', '2022-06-23 02:48:12'),
(3, 1, 1, 1, 'https://howtocheats.com/nft-coin/top-solana-nfts-to-buy-now-before-opensea-integration-best-solana-nft-projects-2022', '', 'Zg2Jyse4', 'TOP SOLANA NFTs TO BUY NOW BEFORE OPENSEA INTEGRATION! | Best Solana NFT Projects 2022', 'The time has come. OpenSea has finally announced that they will integrate Solana NFTs for trading on their platform from April onwards.', 'https://howtocheats.com/wp-content/uploads/2022/04/image-10.png', 7, '2022-06-23 03:01:53', '2022-06-23 03:01:53'),
(4, 7, 1, 1, 'https://www.google.com/search?q=share+code+nhac&oq=share+code+nhac&aqs=chrome..69i57j0i22i30.6816j0j4&sourceid=chrome&ie=UTF-8', '', 'OwsuQOm', 'share code nhac - Tìm trên Google', '', '', 4, '2022-06-23 03:43:25', '2022-06-23 03:43:25'),
(5, 7, 1, 1, 'https://www.facebook.com/THU.HOANG.hoatuoi', '', 'iiGAp', 'Facebook', '', '', 0, '2022-06-23 03:49:16', '2022-06-23 03:49:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'installed', '1'),
(2, 'site_name', 'Bitlylink'),
(3, 'description', ''),
(4, 'admin_email', ''),
(5, 'language', 'en_US'),
(6, 'language_direction', 'ltr'),
(7, 'timezone', 'UTC'),
(8, 'head_code', ''),
(9, 'footer_code', ''),
(10, 'after_body_tag_code', ''),
(11, 'reCAPTCHA_site_key', ''),
(12, 'reCAPTCHA_secret_key', ''),
(13, 'disallowed_domains', 'adf.ly,bit.ly,q.gs,j.gs,localhost,127.0.0.1,t.co'),
(14, 'alias_min_length', '4'),
(15, 'alias_max_length', '8'),
(16, 'paypal_sandbox', 'no'),
(17, 'paypal_email', ''),
(18, 'currency_code', 'USD'),
(19, 'facebook_url', 'https://www.facebook.com/'),
(20, 'twitter_url', 'https://twitter.com/'),
(21, 'google_plus_url', 'https://plus.google.com/'),
(22, 'interstitial_price', 'a:240:{s:3:\"all\";a:2:{s:10:\"advertiser\";i:1;s:9:\"publisher\";d:0.40000000000000002;}s:2:\"AF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CA\";a:2:{s:10:\"advertiser\";i:4;s:9:\"publisher\";d:1.6000000000000001;}s:2:\"CV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ER\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ET\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ID\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ML\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"OM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"QA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ST\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ES\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GB\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"US\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"UM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}}'),
(23, 'app_version', '3.5.2'),
(24, 'counter_value', '5'),
(25, 'mass_shrinker_limit', '20'),
(26, 'enable_advertising', 'yes'),
(27, 'email_from', 'no_reply@localhost'),
(28, 'email_method', 'default'),
(29, 'email_smtp_host', ''),
(30, 'email_smtp_port', ''),
(31, 'email_smtp_username', ''),
(32, 'email_smtp_password', ''),
(33, 'email_smtp_tls', 'false'),
(34, 'currency_symbol', '$'),
(35, 'banner_price', 'a:240:{s:3:\"all\";a:2:{s:10:\"advertiser\";i:1;s:9:\"publisher\";d:0.40000000000000002;}s:2:\"AF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CA\";a:2:{s:10:\"advertiser\";i:4;s:9:\"publisher\";d:1.6000000000000001;}s:2:\"CV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ER\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ET\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ID\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ML\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"OM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"QA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ST\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ES\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GB\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"US\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"UM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}}'),
(36, 'banner_728x90', ''),
(37, 'banner_468x60', ''),
(38, 'banner_336x280', ''),
(39, 'referral_percentage', '20'),
(40, 'enable_captcha', 'yes'),
(41, 'enable_captcha_shortlink', 'yes'),
(42, 'enable_captcha_signup', 'yes'),
(43, 'enable_captcha_forgot_password', 'yes'),
(44, 'logo_url', ''),
(45, 'logo_url_alt', ''),
(46, 'ad_member', ''),
(47, 'ad_captcha', ''),
(48, 'paypal_enable', 'yes'),
(49, 'payza_enable', 'no'),
(50, 'payza_email', ''),
(51, 'interstitial_ads', ''),
(52, 'account_activate_email', 'yes'),
(53, 'anonymous_default_advert', '1'),
(54, 'member_default_advert', '1'),
(55, 'enable_interstitial', 'yes'),
(56, 'enable_banner', 'yes'),
(57, 'enable_noadvert', 'yes'),
(58, 'referral_banners_code', ''),
(59, 'auth_head_code', ''),
(60, 'member_head_code', ''),
(61, 'admin_head_code', ''),
(62, 'campaign_paid_views_day', '1'),
(64, 'minimum_withdrawal_amount', '5'),
(65, 'link_info_public', 'yes'),
(66, 'link_info_member', 'yes'),
(67, 'coinbase_enable', 'no'),
(68, 'coinbase_api_key', ''),
(69, 'coinbase_api_secret', ''),
(70, 'coinbase_sandbox', 'no'),
(71, 'banktransfer_enable', 'no'),
(72, 'banktransfer_instructions', '<p>Transfer the money to the bank account below</p>\r\n<table class=\"table table-striped\">\r\n    <tr>\r\n        <td>Account holder</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Bank Name</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>City/Town</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Country</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Account number</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>SWIFT</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>IBAN</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Account currency</td>\r\n        <td>----------</td>\r\n    </tr>\r\n    <tr>\r\n        <td>Reference</td>\r\n        <td>Campaign #[campaign_id]</td>\r\n    </tr>\r\n</table>'),
(73, 'home_shortening', 'yes'),
(74, 'home_shortening_register', 'no'),
(75, 'reserved_usernames', ''),
(76, 'reserved_aliases', ''),
(77, 'currency_position', 'before'),
(78, 'enable_captcha_contact', 'yes'),
(79, 'site_languages', ''),
(80, 'disable_meta_home', 'no'),
(81, 'disable_meta_member', 'no'),
(82, 'disable_meta_api', 'yes'),
(83, 'main_domain', 'dev.bitlylinkfun.com'),
(84, 'default_short_domain', ''),
(85, 'multi_domains', ''),
(86, 'theme', 'CloudTheme'),
(87, 'fake_clicks', '0'),
(88, 'fake_links', '0'),
(89, 'fake_users', '0');
INSERT INTO `options` (`id`, `name`, `value`) VALUES
(90, 'popup_price', 'a:240:{s:3:\"all\";a:2:{s:10:\"advertiser\";i:1;s:9:\"publisher\";d:0.40000000000000002;}s:2:\"AF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"BI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CA\";a:2:{s:10:\"advertiser\";i:4;s:9:\"publisher\";d:1.6000000000000001;}s:2:\"CV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ER\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ET\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"DE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"HU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ID\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"IT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"JO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ML\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MQ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MX\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"FM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"MP\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"NO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"OM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"QA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"RW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"KN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ST\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SL\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SB\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GS\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ES\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"LK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"PM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SD\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"CH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"SY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TJ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TK\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TO\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TT\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TR\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TC\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"TV\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UA\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"AE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"GB\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"US\";a:2:{s:10:\"advertiser\";i:5;s:9:\"publisher\";i:2;}s:2:\"UM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UY\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"UZ\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VN\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VG\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"VI\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"WF\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"EH\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YE\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"YU\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZM\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}s:2:\"ZW\";a:2:{s:10:\"advertiser\";s:0:\"\";s:9:\"publisher\";s:0:\"\";}}'),
(91, 'enable_popup', 'yes'),
(92, 'webmoney_enable', 'yes'),
(93, 'webmoney_merchant_purse', ''),
(94, 'short_link_content', 'no'),
(95, 'social_login_facebook', '0'),
(96, 'social_login_facebook_app_id', ''),
(97, 'social_login_facebook_app_secret', ''),
(98, 'social_login_twitter', '0'),
(99, 'social_login_twitter_api_key', ''),
(100, 'social_login_twitter_api_secret', ''),
(101, 'social_login_google', '0'),
(102, 'social_login_google_client_id', ''),
(103, 'social_login_google_client_secret', ''),
(104, 'blog_enable', '0'),
(105, 'blog_comments_enable', '0'),
(106, 'disqus_shortname', ''),
(107, 'ssl_enable', '0'),
(108, 'google_safe_browsing_key', ''),
(109, 'phishtank_key', ''),
(110, 'close_registration', '0'),
(111, 'enable_captcha_shortlink_anonymous', '0'),
(112, 'skrill_enable', '0'),
(113, 'skrill_email', ''),
(114, 'skrill_secret_word', ''),
(115, 'wallet_enable', '0'),
(116, 'personal_token', NULL),
(117, 'purchase_code', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `published` int(2) NOT NULL DEFAULT '0',
  `content` longtext,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `published`, `content`, `modified`, `created`) VALUES
(1, 'Terms of Use', 'terms', 1, '', '2022-06-23 02:32:06', '2022-06-23 02:32:06'),
(2, 'Privacy Policy', 'privacy', 1, '', '2022-06-23 02:32:06', '2022-06-23 02:32:06'),
(3, 'DMCA', 'dmca', 1, '', '2022-06-23 02:32:06', '2022-06-23 02:32:06'),
(4, 'Advertising Rates', 'advertising-rates', 1, '<p><b>Please find our advertising rate table below. Each visitor you will purchase will meet the following criteria:</b></p>\n\n<ul>\n    <li>Unique within a 24 hour time frame</li>\n    <li>They will have JavaScript enabled</li>\n    <li>They will have Cookies enabled</li>\n    <li>Must view your website for at least 5 seconds</li>\n</ul>\n<p><b>You may receive traffic that does not meet this criteria, but you will never be charged for it.</b></p>\n\n[advertising_rates]\n\n<p>All sites are allowed, except when they contain:</p>\n\n<ul>\n    <li>Frame breaking script</li>\n    <li>Popup any windows on entry or exit of any kind</li>\n    <li>Automatically attempt to download software or change any user settings</li>\n    <li>Adult or Pornographic related</li>\n    <li>Hate, Bigotry, and/or IntoleranceWarez or Software Piracy related</li>\n    <li>Music Piracy RelatedHacking Related</li>\n    <li>Anything related to illegal activity</li>\n</ul>\n\n<p>Please contact us first if you are unsure whether your advertising would be suitable.</p>', '2022-06-23 02:32:06', '2022-06-23 02:32:06'),
(5, 'Publisher Rates', 'payout-rates', 1, '[payout_rates]', '2022-06-23 02:32:06', '2022-06-23 02:32:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phinxlog`
--

CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `phinxlog`
--

INSERT INTO `phinxlog` (`version`, `migration_name`, `start_time`, `end_time`, `breakpoint`) VALUES
(20160626173805, 'Initial', '2022-06-22 19:32:05', '2022-06-22 19:32:06', 0),
(20160626175551, 'AddInitialData', '2022-06-22 19:32:06', '2022-06-22 19:32:06', 0),
(20160704124339, 'Version110', '2022-06-22 19:32:06', '2022-06-22 19:32:06', 0),
(20160708000853, 'Version120', '2022-06-22 19:32:06', '2022-06-22 19:32:06', 0),
(20160710193953, 'Version130', '2022-06-22 19:32:06', '2022-06-22 19:32:06', 0),
(20160712210925, 'Version140', '2022-06-22 19:32:06', '2022-06-22 19:32:06', 0),
(20160715121008, 'Version200', '2022-06-22 19:32:06', '2022-06-22 19:32:07', 0),
(20160805184121, 'Version250', '2022-06-22 19:32:07', '2022-06-22 19:32:07', 0),
(20160824144242, 'Version260', '2022-06-22 19:32:07', '2022-06-22 19:32:07', 0),
(20160914115144, 'Version300', '2022-06-22 19:32:07', '2022-06-22 19:32:07', 0),
(20161001104831, 'Version310', '2022-06-22 19:32:07', '2022-06-22 19:32:07', 0),
(20161112161527, 'Version320', '2022-06-22 19:32:07', '2022-06-22 19:32:09', 0),
(20161203142626, 'Version330', '2022-06-22 19:32:09', '2022-06-22 19:32:09', 0),
(20161226215045, 'Version350', '2022-06-22 19:32:09', '2022-06-22 19:32:09', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `published` int(2) NOT NULL DEFAULT '0',
  `short_description` text,
  `description` longtext,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_profiles`
--

CREATE TABLE `social_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `profile_url` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `birth_day` varchar(255) DEFAULT NULL,
  `birth_month` varchar(255) DEFAULT NULL,
  `birth_year` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statistics`
--

CREATE TABLE `statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `referral_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ad_type` int(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '0=direct, 1=inter., 2=banner',
  `campaign_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `campaign_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `campaign_item_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `country` varchar(6) NOT NULL DEFAULT '',
  `owner_earn` float(50,6) NOT NULL DEFAULT '0.000000',
  `publisher_earn` float(50,6) NOT NULL DEFAULT '0.000000',
  `referral_earn` float(50,6) NOT NULL DEFAULT '0.000000',
  `referer_domain` varchar(256) NOT NULL DEFAULT '',
  `referer` varchar(256) NOT NULL DEFAULT '',
  `user_agent` text,
  `reason` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=Earn, 2=Disabled cookie, 3=Anonymous user, 4=Adblock, 5=Proxy, 6=IP changed, 7=Not unique, 8=Full weight, 9=Default campaign, 10=direct',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `statistics`
--

INSERT INTO `statistics` (`id`, `link_id`, `user_id`, `referral_id`, `ad_type`, `campaign_id`, `campaign_user_id`, `campaign_item_id`, `ip`, `country`, `owner_earn`, `publisher_earn`, `referral_earn`, `referer_domain`, `referer`, `user_agent`, `reason`, `created`) VALUES
(1, 1, 2, 0, 1, 1, 2, 1, '::1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 9, '2022-06-23 02:34:01'),
(2, 1, 2, 0, 1, 1, 2, 1, '::1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 9, '2022-06-23 02:34:43'),
(3, 2, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 02:48:23'),
(4, 2, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 02:48:44'),
(5, 3, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 03:02:06'),
(6, 3, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 03:06:18'),
(7, 3, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 03:06:29'),
(8, 3, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 03:08:17'),
(9, 3, 1, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.0.0 Safari/537.36', 3, '2022-06-23 03:09:29'),
(10, 4, 7, 0, 1, 1, 2, 1, '127.0.0.1', 'Others', 0.000000, 0.000000, 0.000000, 'Direct', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 4, '2022-06-23 03:45:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '',
  `position` varchar(256) NOT NULL DEFAULT '',
  `image` varchar(256) NOT NULL DEFAULT '',
  `published` tinyint(1) DEFAULT '0',
  `content` longtext,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=active, 2=pending, 3=inactive',
  `username` varchar(256) NOT NULL DEFAULT '',
  `password` varchar(256) NOT NULL DEFAULT '',
  `email` varchar(256) NOT NULL DEFAULT '',
  `temp_email` varchar(256) NOT NULL DEFAULT '',
  `role` varchar(20) NOT NULL DEFAULT '',
  `api_token` varchar(40) NOT NULL DEFAULT '',
  `activation_key` varchar(40) NOT NULL DEFAULT '',
  `wallet_money` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `advertiser_balance` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `publisher_earnings` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `referral_earnings` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `referred_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `first_name` varchar(256) NOT NULL DEFAULT '',
  `last_name` varchar(256) NOT NULL DEFAULT '',
  `address1` varchar(256) NOT NULL DEFAULT '',
  `address2` varchar(256) NOT NULL DEFAULT '',
  `city` varchar(256) NOT NULL DEFAULT '',
  `state` varchar(256) NOT NULL DEFAULT '',
  `zip` varchar(256) NOT NULL DEFAULT '',
  `country` varchar(256) NOT NULL DEFAULT '',
  `phone_number` varchar(256) NOT NULL DEFAULT '',
  `withdrawal_method` varchar(256) NOT NULL DEFAULT '',
  `withdrawal_account` text,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `status`, `username`, `password`, `email`, `temp_email`, `role`, `api_token`, `activation_key`, `wallet_money`, `advertiser_balance`, `publisher_earnings`, `referral_earnings`, `referred_by`, `first_name`, `last_name`, `address1`, `address2`, `city`, `state`, `zip`, `country`, `phone_number`, `withdrawal_method`, `withdrawal_account`, `modified`, `created`) VALUES
(2, 1, 'admin', '$2y$10$UTVMkXuwsPw04SU.wTt./OTHvf8hXmiAThcdN72but4gno1X6VQiS', 'admintq@gmail.com', '', 'admin', 'a10b54f0e462b354adc7e4972a547fa94b7607be', '', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 02:32:29', '2022-06-23 02:32:29'),
(3, 1, 'nguyenngoclinh', '$2y$10$Wmhp0Sj6MHR6WPIMFs9RTen9PQckzka43g/7LxSX/RSS1PIQuPfcm', 'nguyencaotailinh@gmail.com', '', 'member', 'fbb958383317ae9dc281d5f44dc55af1fe159e2c', '23ef1bdb1652a0c40bd9e8e57fd091f1f00e88b3', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 03:20:50', '2022-06-23 03:13:05'),
(4, 1, 'phamngocanh', '$2y$10$7A41j3TNi47H4ZtqeXH5ce/4QRUP7tZKjnoFaiGPbA4hJb9McqEIS', 'phamngocanhTQ@gmail.com', '', 'member', 'f747dbaebedad125f3ae2fe0d8a5c488427cbcf0', 'c6a8dd57694021cc9618899279b876d47d1e3db3', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 03:15:44', '2022-06-23 03:14:27'),
(5, 1, 'phamquynhhoa', '$2y$10$Uwduv.GWPKXD0bazSSvaoeyoULfT0DfT.8X1TIGD9G4H.zwfKkNqe', 'phamquynhhoa@gmail.com', '', 'member', '8c9d266163b9058defdd36bddae097098582fbef', 'b0de600d4d5b12b64403a4b711f9aea4c466837a', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 03:33:25', '2022-06-23 03:33:25'),
(6, 1, 'phamvanlinh', '$2y$10$cLXmEa0I1jNUaS2P3UVaLerwg4Jn0oCTspRqgY9QOyV.ixltGJ5l2', 'phamvanlinh@gmail.com', '', 'member', 'e696036e417803bc9490ecdf4ab52d64d466cb67', '75160baa0b369680acaa85e1bf7899eb64414d63', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 03:37:22', '2022-06-23 03:37:22'),
(7, 1, 'jakicaư', '$2y$10$vt70tjnNqL1oSevHkK.VeeQ72lmD5PCdxbgnIhWIPXZ.Q67bmAUfW', 'jakica2530@serosin.com', '', 'member', '09a3c8559968ec2fa1eea10c93eab36a1edb7e4f', '7cf454d15f4901a11e024d4fd5c7ebd38a889161', 0.000000, 0.000000, 0.000000, 0.000000, 0, '', '', '', '', '', '', '', '', '', '', NULL, '2022-06-23 03:40:03', '2022-06-23 03:40:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `status` int(2) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1=Approved, 2=Pending, 3=Complete',
  `publisher_earnings` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `referral_earnings` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `amount` float(50,6) UNSIGNED NOT NULL DEFAULT '0.000000',
  `method` varchar(256) NOT NULL DEFAULT '',
  `transaction_id` varchar(256) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_published_id` (`published`,`id`);

--
-- Chỉ mục cho bảng `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userid` (`user_id`),
  ADD KEY `idx_campaigns` (`default_campaign`,`ad_type`,`status`,`traffic_source`);

--
-- Chỉ mục cho bảng `campaign_items`
--
ALTER TABLE `campaign_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_campaignid` (`campaign_id`);

--
-- Chỉ mục cho bảng `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locale` (`locale`,`model`,`foreign_key`,`field`),
  ADD KEY `model` (`model`,`foreign_key`,`field`);

--
-- Chỉ mục cho bảng `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_alias_status` (`alias`,`status`),
  ADD KEY `idx_userid_status_adtype` (`user_id`,`status`,`ad_type`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_name` (`name`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_slug_published` (`slug`,`published`);

--
-- Chỉ mục cho bảng `phinxlog`
--
ALTER TABLE `phinxlog`
  ADD PRIMARY KEY (`version`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_published_id` (`published`,`id`);

--
-- Chỉ mục cho bảng `social_profiles`
--
ALTER TABLE `social_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userId` (`user_id`);

--
-- Chỉ mục cho bảng `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_userid` (`user_id`),
  ADD KEY `idx_ip` (`ip`),
  ADD KEY `idx_ownerearn` (`owner_earn`),
  ADD KEY `idx_created` (`created`),
  ADD KEY `idx_campaignid_userid` (`campaign_id`,`user_id`),
  ADD KEY `idx_publisherearn_userid` (`publisher_earn`,`user_id`),
  ADD KEY `idx_referralid` (`referral_id`),
  ADD KEY `idx_referralearn_referralid` (`referral_earn`,`referral_id`);

--
-- Chỉ mục cho bảng `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_referredby` (`referred_by`),
  ADD KEY `idx_status_id` (`status`,`id`),
  ADD KEY `idx_apitoken_status` (`api_token`,`status`);

--
-- Chỉ mục cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status_userid` (`status`,`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `campaign_items`
--
ALTER TABLE `campaign_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `social_profiles`
--
ALTER TABLE `social_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
