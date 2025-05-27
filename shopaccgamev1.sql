-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 07, 2025 lúc 09:25 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopgame`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `auto_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `prefix` varchar(255) NOT NULL DEFAULT 'naptien',
  `access_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `bank_name`, `account_name`, `account_number`, `branch`, `note`, `is_active`, `auto_confirm`, `prefix`, `access_token`, `created_at`, `updated_at`) VALUES
(1, 'MBBank', 'Phạm Hoàng Tuấn', '259876543210', 'Mộ Đức, Quảng Ngãi', 'Nạp tự động, cộng tiền trong 1p', 1, 1, 'naptien', NULL, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_deposits`
--

CREATE TABLE `bank_deposits` (
  `transaction_id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `bank` enum('VPBank','TPBank','VietinBank','ACB','BIDV','MBBank','OCB','KienLongBank','MSB') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card_deposits`
--

CREATE TABLE `card_deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `telco` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `received_amount` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `pin` varchar(255) NOT NULL,
  `request_id` bigint(20) NOT NULL,
  `status` enum('success','error','processing') NOT NULL DEFAULT 'processing',
  `response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'TUANORI.VN - Shop Game Ngọc Rồng', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'site_description', 'Shop Ngọc Rồng Online cung cấp tài khoản game chính hãng, giá tốt nhất thị trường. Giao dịch an toàn, nhanh chóng và bảo mật', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'site_keywords', 'shop game, ngọc rồng, tài khoản game, game online, mua bán tài khoản game', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 'site_logo', 'https://imgur.com/hIFVXRo.png', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 'site_logo_footer', 'https://imgur.com/YAwjTGo.png', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(6, 'site_share_image', 'https://i.postimg.cc/wvp3pq7C/474896014-1024022223074598-3821624009370803646-n.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(7, 'site_banner', 'https://123nick.vn/upload-usr/images/8jElw7OK4i_1629517832.gif', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(8, 'site_favicon', 'https://i.postimg.cc/sg1tCBGL/favicon.png', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(9, 'address', 'TPHCM, Việt Nam', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(10, 'phone', '0812665001', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(11, 'email', 'support@tuanori.vn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(12, 'facebook', 'https://facebook.com/tuanori.vn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(13, 'zalo', '0812665001', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(14, 'youtube', 'https://www.youtube.com/@htuanqn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(15, 'discord', 'https://discord.gg/example', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(16, 'telegram', 'https://t.me/example', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(17, 'tiktok', 'https://tiktok.com/@example', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(18, 'working_hours', '8:00 - 22:00', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(19, 'home_notification', 'Chào mừng bạn đến với Shop Bán Acc Game của chúng tôi. Nạp ATM/Momo khuyến mãi 10%, Nạp thẻ cào nhận 100% giá trị thẻ nạp !!', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(20, 'welcome_modal', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(21, 'mail_mailer', 'smtp', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(22, 'mail_host', 'smtp.gmail.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(23, 'mail_port', '587', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(24, 'mail_username', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(25, 'mail_password', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(26, 'mail_encryption', 'tls', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(27, 'mail_from_address', 'support@tuanori.vn', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(28, 'mail_from_name', 'TUANORI.VN - Shop Game Ngọc Rồng', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(29, 'payment.card.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(30, 'payment.card.partner_website', 'thesieure.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(31, 'payment.card.partner_id', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(32, 'payment.card.partner_key', '', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(33, 'payment.card.discount_percent', '20', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(34, 'payment.bank.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(35, 'payment.momo.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(36, 'login_social.google.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(37, 'login_social.google.client_id', '695655624016-tnn916t7g53oqulsiq0d9vvn7bof1568.apps.googleusercontent.com', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(38, 'login_social.google.client_secret', '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', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(39, 'login_social.google.redirect', 'http://localhost:8000/auth/google/callback', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(40, 'login_social.facebook.active', '1', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(41, 'login_social.facebook.client_id', '713944317580357', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(42, 'login_social.facebook.client_secret', '481beed7538a8b7318c45e94401f4e3c', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(43, 'login_social.facebook.redirect', 'http://localhost:8000/auth/facebook/callback', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_codes`
--

CREATE TABLE `discount_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_type` enum('percentage','fixed_amount') NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_value` decimal(10,2) DEFAULT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` enum('1','0') NOT NULL DEFAULT '1',
  `usage_limit` int(11) DEFAULT NULL,
  `usage_count` int(11) NOT NULL DEFAULT 0,
  `per_user_limit` int(11) DEFAULT NULL,
  `applicable_to` enum('account','random_account','service') DEFAULT NULL,
  `item_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_ids`)),
  `expire_date` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount_code_usages`
--

CREATE TABLE `discount_code_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `discount_code_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `context` enum('account','random_account','service') NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `used_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_accounts`
--

CREATE TABLE `game_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_category_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `price` bigint(20) UNSIGNED NOT NULL,
  `status` enum('available','sold') NOT NULL DEFAULT 'available',
  `server` int(11) NOT NULL,
  `registration_type` enum('virtual','real') NOT NULL,
  `planet` enum('earth','namek','xayda') NOT NULL,
  `earring` tinyint(1) NOT NULL DEFAULT 0,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `thumb` text NOT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `game_accounts`
--

INSERT INTO `game_accounts` (`id`, `game_category_id`, `account_name`, `password`, `price`, `status`, `server`, `registration_type`, `planet`, `earring`, `buyer_id`, `note`, `thumb`, `images`, `created_at`, `updated_at`) VALUES
(1, 1, 'player1', '123456', 100000, 'available', 1, 'virtual', 'earth', 1, NULL, 'Tài khoản VIP', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 1, 'player2', '123456', 150000, 'sold', 2, 'real', 'namek', 1, 3, 'Đã bán cho user 3', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 1, 'player3', '123456', 200000, 'available', 3, 'virtual', 'xayda', 1, NULL, 'Tài khoản mới', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 1, 'player4', '123456', 50000, 'sold', 4, 'real', 'earth', 1, 2, 'Người chơi cấp 10', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 1, 'player5', '123456', 120000, 'available', 5, 'virtual', 'namek', 1, NULL, 'Tài khoản mạnh', 'https://i.postimg.cc/8kJvtYgW/20250328090315screenshot-2025-03-26-091731.jpg', '[\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\",\"https:\\/\\/i.postimg.cc\\/8kJvtYgW\\/20250328090315screenshot-2025-03-26-091731.jpg\"]', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_categories`
--

CREATE TABLE `game_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `game_categories`
--

INSERT INTO `game_categories` (`id`, `name`, `slug`, `thumbnail`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'NICK HỒI SINH NGỌC RỒNG', 'nick-hoi-sinh-ngoc-rong', 'https://i.postimg.cc/qq3pynYh/20240215164859nickhsnr.jpg', 'Danh mục tài khoản hồi sinh trong Ngọc Rồng Online.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'SƠ SINH + WIN DOANH TRẠI + ZIN', 'so-sinh-win-doanh-trai-zin', 'https://i.postimg.cc/qq3pynYh/20240215164859nickhsnr.jpg', 'Danh mục tài khoản sơ sinh với khả năng chiến thắng trong doanh trại.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'NGỌC RỒNG NICK TẦM TRUNG', 'ngoc-rong-nick-tam-trung', 'https://i.postimg.cc/qq3pynYh/20240215164859nickhsnr.jpg', 'Danh mục tài khoản Ngọc Rồng tầm trung, phù hợp cho người chơi mới.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 'SHOP VẬT PHẨM', 'shop-vat-pham', 'https://i.postimg.cc/Jzc4pNhj/NRO-ITEM.png', 'Danh mục cửa hàng vật phẩm trong Ngọc Rồng Online.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 'NICK CÓ ĐỆ SKILL 2 + THOÁT SƠ SINH', 'nick-co-de-skill-2-thoat-so-sinh', 'https://i.postimg.cc/Jzc4pNhj/NRO-ITEM.png', 'Danh mục tài khoản có đệ skill 2, phù hợp cho người chơi nâng cao.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `game_services`
--

CREATE TABLE `game_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('gold','gem','leveling') NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `game_services`
--

INSERT INTO `game_services` (`id`, `name`, `slug`, `thumbnail`, `description`, `type`, `active`, `created_at`, `updated_at`) VALUES
(1, 'ÚP BÍ KIẾP', 'up-bi-kiep', 'https://i.postimg.cc/g0WLJcxH/NRO-UBK.png', 'Dịch vụ up bí kiếp chuyên nghiệp, hỗ trợ mọi loại tài khoản', 'leveling', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'SĂN ĐỆ TỬ', 'san-de-tu', 'https://i.postimg.cc/prpp7pSR/NRO-SDT.png', 'Dịch vụ săn đệ tử, giúp người chơi tìm kiếm và thu phục đệ tử mạnh mẽ.', 'leveling', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'UP SỨC MẠNH ĐỆ TỬ', 'up-suc-manh-de-tu', 'https://i.postimg.cc/sXnMwpwT/NRO-USMDT.png', 'Dịch vụ nâng cấp sức mạnh cho đệ tử, giúp họ trở nên mạnh mẽ hơn.', 'leveling', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 'LÀM NHIỆM VỤ', 'lam-nhiem-vu', 'https://i.postimg.cc/nzVs4dYs/NRO-LNV.png', 'Dịch vụ hỗ trợ hoàn thành nhiệm vụ trong game, giúp người chơi nhanh chóng đạt được mục tiêu.', 'leveling', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lucky_wheels`
--

CREATE TABLE `lucky_wheels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `wheel_image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `rules` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `price_per_spin` bigint(20) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`config`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lucky_wheels`
--

INSERT INTO `lucky_wheels` (`id`, `name`, `slug`, `thumbnail`, `wheel_image`, `description`, `rules`, `active`, `price_per_spin`, `config`, `created_at`, `updated_at`) VALUES
(1, 'Vòng Quay Vàng', 'vong-quay-vang', 'https://i.postimg.cc/xTNX3NHP/u-KLBf-Y8j-Wr-1630159016.gif', 'https://img.upanh.tv/2025/04/03/LVNwJbtFqU_1599464163-removebg-preview6c5e709413be5b98.png', 'Bạn có thể tham gia vòng quay để có cơ hội nhận được vàng hoặc ngọc. Mỗi lần bạn quay sẽ tốn 10,000 VNĐ, và đây là một cơ hội tuyệt vời để thử vận may của mình. Hãy tham gia ngay để không bỏ lỡ những phần thưởng hấp dẫn đang chờ đón bạn.', '<p>Quay để nhận vàng hoặc ngọc. Mỗi lần quay tốn 10,000 VNĐ.</p>', 1, 10000, '[{\"type\":\"gold\",\"content\":\"Tr\\u00fang 1 t\\u1ef7 v\\u00e0ng\",\"amount\":1000000000,\"probability\":10},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 50 tri\\u1ec7u v\\u00e0ng\",\"amount\":50000000,\"probability\":15},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 75 tri\\u1ec7u v\\u00e0ng\",\"amount\":75000000,\"probability\":20},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 100 tri\\u1ec7u v\\u00e0ng\",\"amount\":100000000,\"probability\":25},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 130 tri\\u1ec7u v\\u00e0ng\",\"amount\":130000000,\"probability\":10},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 200 tri\\u1ec7u v\\u00e0ng\",\"amount\":200000000,\"probability\":5},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 250 tri\\u1ec7u v\\u00e0ng\",\"amount\":250000000,\"probability\":5},{\"type\":\"gold\",\"content\":\"Tr\\u00fang 500 tri\\u1ec7u v\\u00e0ng\",\"amount\":500000000,\"probability\":10}]', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'Vòng Quay Ngọc', 'vong-quay-ngoc', 'https://i.postimg.cc/vZWDpR0g/z5986105444643-1bf089311b9e3a012cb4659a7e46fd7c.gif', 'https://i.postimg.cc/vmbDyPKP/spinTYOI.png', 'Quay để nhận vàng hoặc ngọc. Mỗi lần quay sẽ tốn 10,000 VNĐ. Hãy tham gia để có cơ hội nhận được những phần thưởng giá trị từ vòng quay này. Mỗi lượt quay sẽ mang đến cho bạn những trải nghiệm thú vị và cơ hội trúng thưởng hấp dẫn.', '<p>Quay để nhận vàng hoặc ngọc. Mỗi lần quay tốn 10,000 VNĐ.</p>', 1, 10000, '[{\"type\":\"gem\",\"content\":\"Tr\\u00fang 5000 ng\\u1ecdc\",\"amount\":5000,\"probability\":10},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 50 ng\\u1ecdc\",\"amount\":50,\"probability\":15},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 100 ng\\u1ecdc\",\"amount\":100,\"probability\":20},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 150 ng\\u1ecdc\",\"amount\":150,\"probability\":25},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 200 ng\\u1ecdc\",\"amount\":200,\"probability\":10},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 300 ng\\u1ecdc\",\"amount\":300,\"probability\":10},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 500 ng\\u1ecdc\",\"amount\":500,\"probability\":5},{\"type\":\"gem\",\"content\":\"Tr\\u00fang 1000 ng\\u1ecdc\",\"amount\":1000,\"probability\":5}]', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lucky_wheel_histories`
--

CREATE TABLE `lucky_wheel_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `lucky_wheel_id` bigint(20) UNSIGNED NOT NULL,
  `spin_count` int(11) NOT NULL,
  `total_cost` bigint(20) NOT NULL,
  `reward_type` enum('gold','gem') NOT NULL,
  `reward_amount` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `lucky_wheel_histories`
--

INSERT INTO `lucky_wheel_histories` (`id`, `user_id`, `lucky_wheel_id`, `spin_count`, `total_cost`, `reward_type`, `reward_amount`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 30000, 'gold', 500, 'Trúng 500 vàng', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 2, 2, 1, 10000, 'gem', 50, 'Trúng 50 ngọc', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2025_03_28_181908_create_users_table', 1),
(3, '2025_03_28_181914_create_game_categories_table', 1),
(4, '2025_03_28_181917_create_game_accounts_table', 1),
(5, '2025_03_28_181929_create_purchase_history_table', 1),
(6, '2025_03_28_181932_create_money_transactions_table', 1),
(7, '2025_03_29_015110_create_card_deposits_table', 1),
(8, '2025_03_29_154334_create_game_services_table', 1),
(9, '2025_03_29_154343_create_service_packages_table', 1),
(10, '2025_03_29_154350_create_service_histories_table', 1),
(11, '2025_03_30_231218_create_configs_table', 1),
(12, '2025_03_31_050014_create_bank_deposits_table', 1),
(13, '2025_03_31_065843_create_bank_accounts_table', 1),
(14, '2025_04_01_031303_create_random_categories_table', 1),
(15, '2025_04_01_031307_create_random_category_accounts_table', 1),
(16, '2025_04_01_035918_create_discount_codes_table', 1),
(17, '2025_04_01_040223_create_discount_code_usages_table', 1),
(18, '2025_04_02_060346_create_lucky_wheels_table', 1),
(19, '2025_04_02_060438_create_lucky_wheel_histories_table', 1),
(20, '2025_04_02_060504_create_withdrawal_histories_table', 1),
(21, '2025_04_04_043941_create_money_withdrawal_histories_table', 1),
(22, '2025_04_05_101214_create_notifications_table', 1),
(23, '2025_04_07_022109_create_password_reset_tokens_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `money_transactions`
--

CREATE TABLE `money_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('deposit','withdraw','purchase','refund') NOT NULL,
  `amount` bigint(20) NOT NULL,
  `balance_before` bigint(20) NOT NULL,
  `balance_after` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `reference_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `money_withdrawal_histories`
--

CREATE TABLE `money_withdrawal_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `user_note` text DEFAULT NULL,
  `admin_note` text DEFAULT NULL,
  `status` enum('processing','success','error') NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `money_withdrawal_histories`
--

INSERT INTO `money_withdrawal_histories` (`id`, `user_id`, `amount`, `user_note`, `admin_note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 500000, 'Rút tiền về tài khoản Vietcombank', 'Đã chuyển khoản thành công', 'success', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 2, 1000000, 'Rút tiền về Momo', NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 3, 300000, 'Rút tiền về Techcombank', 'Lỗi hệ thống ngân hàng', 'error', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_favicon` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `class_favicon`, `content`, `created_at`, `updated_at`) VALUES
(1, 'fa-user-circle', 'Tài khoản Ngọc Rồng chất lượng, đa dạng mức giá', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'fa-credit-card', 'Nạp thẻ tỷ lệ 1:1 (nhận 100% giá trị thẻ)', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'fa-money-bill-wave', 'Nạp ATM/Momo khuyến mãi 10%', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 'fa-headset', 'Hỗ trợ 24/7, giải quyết mọi vấn đề nhanh chóng', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase_history`
--

CREATE TABLE `purchase_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_account_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `account_details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_categories`
--

CREATE TABLE `random_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `random_categories`
--

INSERT INTO `random_categories` (`id`, `name`, `slug`, `thumbnail`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'THỬ VẬN MAY NGỌC RỒNG VIP 1', 'thu-van-may-ngoc-rong-vip-1', 'https://i.postimg.cc/htqt8yKS/Th-V-n-May-Ng-c-R-ng-Vip-1.jpg', 'Danh mục chứa tài khoản thử vận may Ngọc Rồng VIP 1.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 'THỬ VẬN MAY NGỌC RỒNG VIP 2', 'thu-van-may-ngoc-rong-vip-2', 'https://i.postimg.cc/8PvC6QQK/Th-V-n-May-Ng-c-R-ng-Vip-2.jpg', 'Danh mục chứa tài khoản thử vận may Ngọc Rồng VIP 2.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'THỬ VẬN MAY NGỌC RỒNG VIP 3', 'thu-van-may-ngoc-rong-vip-3', 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', 'Danh mục chứa tài khoản thử vận may Ngọc Rồng VIP 3.', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `random_category_accounts`
--

CREATE TABLE `random_category_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `random_category_id` bigint(20) UNSIGNED NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `status` enum('available','sold') NOT NULL DEFAULT 'available',
  `server` int(11) NOT NULL,
  `buyer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `note_buyer` text DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `random_category_accounts`
--

INSERT INTO `random_category_accounts` (`id`, `random_category_id`, `account_name`, `password`, `price`, `status`, `server`, `buyer_id`, `note`, `note_buyer`, `thumbnail`, `created_at`, `updated_at`) VALUES
(1, 1, 'player1', 'pass123', 500000, 'available', 1, NULL, 'Tài khoản cấp 50.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 1, 'player2', 'pass456', 750000, 'sold', 2, 1, 'Tài khoản có skin hiếm.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 1, 'player3', 'pass789', 300000, 'available', 3, NULL, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 1, NULL, NULL, 1000000, 'available', 4, NULL, 'Tài khoản đặc biệt.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 1, 'player5', 'pass101', 450000, 'sold', 5, 2, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(6, 1, 'player6', 'pass202', 600000, 'available', 6, NULL, 'Tài khoản VIP.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(7, 1, 'player7', 'pass303', 800000, 'available', 7, NULL, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(8, 1, 'player8', 'pass404', 250000, 'sold', 8, 3, 'Tài khoản đã qua sử dụng.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(9, 1, 'player9', 'pass505', 350000, 'available', 9, NULL, NULL, NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpg', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(10, 1, 'player10', 'pass606', 900000, 'available', 10, NULL, 'Tài khoản cao cấp nhất.', NULL, 'https://i.postimg.cc/d3kV6g70/Th-V-n-May-Ng-c-R-ng-Vip-3.jpgg', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_histories`
--

CREATE TABLE `service_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `game_service_id` bigint(20) UNSIGNED NOT NULL,
  `service_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `game_account` varchar(255) NOT NULL,
  `game_password` varchar(255) NOT NULL,
  `server` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT 0,
  `price` bigint(20) NOT NULL,
  `discount_code` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','processing','completed','cancelled') NOT NULL DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service_packages`
--

CREATE TABLE `service_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `game_service_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` bigint(20) NOT NULL,
  `estimated_time` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `service_packages`
--

INSERT INTO `service_packages` (`id`, `game_service_id`, `name`, `price`, `estimated_time`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tiêu Diệt Fide', 40000, 60, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 1, 'Apk 13, 14, 15', 40000, 60, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 1, 'Apk 19, 20', 60000, 90, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(4, 1, 'Plc, Poc, King Kong', 60000, 90, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(5, 1, 'Xbh 1, 2, hoàn thiện', 100000, 120, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(6, 1, 'Tiểu Đội Sát Thủ', 100000, 120, 'Cứ thuê acc như thế nào cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(7, 1, 'Siêu bọ hung', 120000, 150, 'Cứ thuê acc như thế nào shop cũng làm được', 1, '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `role` enum('member','admin') NOT NULL DEFAULT 'member',
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `total_deposited` bigint(20) NOT NULL DEFAULT 0,
  `gold` bigint(20) NOT NULL DEFAULT 0,
  `gem` bigint(20) NOT NULL DEFAULT 0,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `ip_address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `google_id`, `facebook_id`, `role`, `balance`, `total_deposited`, `gold`, `gem`, `banned`, `ip_address`, `remember_token`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$KLjfjkm2ZyWu5GOsbDcnY.QSsHzGtsBn.AXYwsPRJfnnFXQc/Jt6a', 'example@example.com', NULL, NULL, 'admin', 1000000, 5000000, 0, 0, 0, '192.168.1.1', 'lRaoXja369', '2025-04-07 07:25:36', '2025-04-07 07:25:36', '2025-04-07 07:25:36'),
(2, 'moderator', '$2y$12$CxLo6hCEZd1RvstM5WydguSj.y91QbkP/QXO/ReZnXgG4x94Z1EB2', 'moderator@example.com', NULL, NULL, 'admin', 1000000, 5000000, 0, 0, 0, '192.168.1.1', '8bnvSMHGTd', '2025-04-07 07:25:37', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(3, 'staff', '$2y$12$uMtrfctT9TmhDS7jYxLScekgnVyhDoPU1frrKT743Rl78VAvjptbC', 'staff@example.com', NULL, NULL, 'admin', 1000000, 5000000, 0, 0, 0, '192.168.1.1', 'DJsz7k22qZ', '2025-04-07 07:25:37', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdrawal_histories`
--

CREATE TABLE `withdrawal_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `type` enum('gold','gem') NOT NULL,
  `character_name` varchar(255) NOT NULL,
  `server` int(11) NOT NULL,
  `user_note` varchar(255) DEFAULT NULL,
  `admin_note` varchar(255) DEFAULT NULL,
  `status` enum('success','error','processing') NOT NULL DEFAULT 'processing',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `withdrawal_histories`
--

INSERT INTO `withdrawal_histories` (`id`, `user_id`, `amount`, `type`, `character_name`, `server`, `user_note`, `admin_note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1000, 'gold', 'Hero123', 1, NULL, NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37'),
(2, 2, 200, 'gem', 'MageXYZ', 2, NULL, NULL, 'processing', '2025-04-07 07:25:37', '2025-04-07 07:25:37');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bank_deposits`
--
ALTER TABLE `bank_deposits`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `bank_deposits_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_deposits_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `configs_key_unique` (`key`);

--
-- Chỉ mục cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `discount_codes_code_unique` (`code`);

--
-- Chỉ mục cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_code_usages_discount_code_id_foreign` (`discount_code_id`),
  ADD KEY `discount_code_usages_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_accounts_game_category_id_foreign` (`game_category_id`),
  ADD KEY `game_accounts_buyer_id_foreign` (`buyer_id`);

--
-- Chỉ mục cho bảng `game_categories`
--
ALTER TABLE `game_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `game_services`
--
ALTER TABLE `game_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game_services_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `lucky_wheels`
--
ALTER TABLE `lucky_wheels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lucky_wheels_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `lucky_wheel_histories`
--
ALTER TABLE `lucky_wheel_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lucky_wheel_histories_user_id_foreign` (`user_id`),
  ADD KEY `lucky_wheel_histories_lucky_wheel_id_foreign` (`lucky_wheel_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `money_transactions_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `money_withdrawal_histories_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_history_user_id_foreign` (`user_id`),
  ADD KEY `purchase_history_game_account_id_foreign` (`game_account_id`);

--
-- Chỉ mục cho bảng `random_categories`
--
ALTER TABLE `random_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `random_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `random_category_accounts_random_category_id_foreign` (`random_category_id`),
  ADD KEY `random_category_accounts_buyer_id_foreign` (`buyer_id`);

--
-- Chỉ mục cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_histories_user_id_foreign` (`user_id`),
  ADD KEY `service_histories_game_service_id_foreign` (`game_service_id`),
  ADD KEY `service_histories_service_package_id_foreign` (`service_package_id`);

--
-- Chỉ mục cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_packages_game_service_id_foreign` (`game_service_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdrawal_histories_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT cho bảng `discount_codes`
--
ALTER TABLE `discount_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `game_categories`
--
ALTER TABLE `game_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `game_services`
--
ALTER TABLE `game_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `lucky_wheels`
--
ALTER TABLE `lucky_wheels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `lucky_wheel_histories`
--
ALTER TABLE `lucky_wheel_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `random_categories`
--
ALTER TABLE `random_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bank_deposits`
--
ALTER TABLE `bank_deposits`
  ADD CONSTRAINT `bank_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `card_deposits`
--
ALTER TABLE `card_deposits`
  ADD CONSTRAINT `card_deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `discount_code_usages`
--
ALTER TABLE `discount_code_usages`
  ADD CONSTRAINT `discount_code_usages_discount_code_id_foreign` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discount_code_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `game_accounts`
--
ALTER TABLE `game_accounts`
  ADD CONSTRAINT `game_accounts_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `game_accounts_game_category_id_foreign` FOREIGN KEY (`game_category_id`) REFERENCES `game_categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `lucky_wheel_histories`
--
ALTER TABLE `lucky_wheel_histories`
  ADD CONSTRAINT `lucky_wheel_histories_lucky_wheel_id_foreign` FOREIGN KEY (`lucky_wheel_id`) REFERENCES `lucky_wheels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lucky_wheel_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `money_transactions`
--
ALTER TABLE `money_transactions`
  ADD CONSTRAINT `money_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `money_withdrawal_histories`
--
ALTER TABLE `money_withdrawal_histories`
  ADD CONSTRAINT `money_withdrawal_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD CONSTRAINT `purchase_history_game_account_id_foreign` FOREIGN KEY (`game_account_id`) REFERENCES `game_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `random_category_accounts`
--
ALTER TABLE `random_category_accounts`
  ADD CONSTRAINT `random_category_accounts_buyer_id_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `random_category_accounts_random_category_id_foreign` FOREIGN KEY (`random_category_id`) REFERENCES `random_categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `service_histories`
--
ALTER TABLE `service_histories`
  ADD CONSTRAINT `service_histories_game_service_id_foreign` FOREIGN KEY (`game_service_id`) REFERENCES `game_services` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_histories_service_package_id_foreign` FOREIGN KEY (`service_package_id`) REFERENCES `service_packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `service_packages`
--
ALTER TABLE `service_packages`
  ADD CONSTRAINT `service_packages_game_service_id_foreign` FOREIGN KEY (`game_service_id`) REFERENCES `game_services` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `withdrawal_histories`
--
ALTER TABLE `withdrawal_histories`
  ADD CONSTRAINT `withdrawal_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
