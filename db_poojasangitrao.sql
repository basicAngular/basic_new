-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2019 at 12:17 PM
-- Server version: 10.3.9-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_poojasangitrao`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(10) NOT NULL,
  `key_meta_id` int(10) NOT NULL DEFAULT 0,
  `key_title` varchar(255) NOT NULL,
  `key_value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `key_meta_id`, `key_title`, `key_value`, `created_at`, `updated_at`) VALUES
(1, 2, 'merchant_id', '002', '2019-04-08 06:29:25', '2019-04-08 06:32:55'),
(2, 2, 'publishable_key', 'pk_test_Kgfqic48f5OtXhst6UMgr1oN00Yb6E5poi', '2019-04-08 06:29:25', '2019-04-08 06:33:20'),
(3, 2, 'secret_key', 'sk_test_YfUDmYgaO5W2uP6A6Hb9kdmb00gDZve8g1', '2019-04-08 06:29:25', '2019-04-08 06:29:25'),
(4, 2, 'client_id', '00021', '2019-04-08 06:29:25', '2019-04-08 06:29:25'),
(7, 3, 'merchant_id', '002', '2019-04-08 06:33:32', '2019-04-08 06:33:32'),
(8, 3, 'publishable_key', 'pk_test_Kgfqic48f5OtXhst6UMgr1oN00Yb6E5poi', '2019-04-08 06:33:32', '2019-04-08 06:33:32'),
(9, 3, 'secret_key', 'sk_test_YfUDmYgaO5W2uP6A6Hb9kdmb00gDZve8g1', '2019-04-08 06:33:32', '2019-04-08 06:33:32'),
(10, 3, 'client_id', '00021', '2019-04-08 06:33:32', '2019-04-08 06:33:32'),
(11, 4, 'client_salt', 'qwewew47e4wrr4578', '2019-04-08 06:38:54', '2019-04-08 06:39:08'),
(12, 4, 'secret_key', 'sk_test_YfUDmYgaO5W2uP6A6Hb9kdmb00gDZve8g1', '2019-04-08 06:39:16', '2019-04-08 06:39:16'),
(13, 4, 'merchant_id', '002', '2019-04-08 06:46:56', '2019-04-08 06:46:56'),
(14, 4, 'publishable_key', 'pk_test_Kgfqic48f5OtXhst6UMgr1oN00Yb6E5poi', '2019-04-08 06:46:56', '2019-04-08 06:46:56');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `flag` enum('header_logo_url','fe_footer') NOT NULL,
  `display_title` varchar(255) NOT NULL,
  `original_content` longtext NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `flag`, `display_title`, `original_content`, `content`, `created_at`, `updated_at`) VALUES
(4, 'fe_footer', 'Footer Bottom Section', 'Copyrights 2019. UGC management Tools. All Rights Reserved.', 'Copyrights 2019. UGC management Tools. All Rights Reserved.', '2019-02-07 00:00:00', '2019-02-07 00:00:00'),
(11, 'header_logo_url', 'Dynamic display title', 'assets/images/logo.png', 'assets/images/logo.png', '2019-04-02 00:00:00', '2019-04-04 06:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nicename` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`, `created_at`, `updated_at`) VALUES
(1, '1', 'demo', 'demo', '1', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_desc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `title`, `subject`, `template`, `tag_desc`, `created_at`, `updated_at`) VALUES
(1, 'change_password', 'XXXXX : Password changed successfully.', '<p>Dear {{$name}},</p>\n\n<p>Your password has been changed successfully.</p>', '[\r\n\r\n	{\"tag\" : \"{{$name}}\", \"desc\" : \"To display User Name\"}\r\n\r\n]', '2018-09-25 13:00:00', '2019-03-15 02:57:27'),
(2, 'reset_password', 'XXXXX : Password Reset Link.', '<html>\n<head>\n	<title></title>\n</head>\n<body>\n<p>Dear User,</p>\n\n<p>Click on the below link to reset Password</p>\n\n<p><br />\n{{$url}}</p>\n</body>\n</html>', '[\r\n	{\"tag\" : \"{{$url}}\", \"desc\" : \"To display password reset link\"}\r\n]', '0000-00-00 00:00:00', '2019-03-10 21:26:43'),
(4, 'new_registration', 'XXXXX : Registered Successfully.', '<tr>\r\n    <td bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif; color: #777777;  padding: 10px 30px;\">\r\n        <p>Dear {{$name}},</p>\r\n        <p>Thanks for registering an account to <span style=\"color: #2b9fe0;\">XXXXXX</span>. </p>\r\n        <p style=\"padding: 10px 0;\">To begin using UPS services, you will need to enter your User ID and Password*.</p>\r\n        <p>Below you will find more information about your user registration to XXXXXX.</p>\r\n    </td>\r\n</tr>\r\n\r\n<tr>\r\n<tr>\r\n    <td bgcolor=\"#262626\" style=\"font-size: 15.24px;font-family: \'Montserrat\', sans-serif;color: #eaeaea;padding: 10px 30px;\">\r\n        <p>Email: {{$email}}</p>\r\n        <p>Full Name: {{$name}}</p>\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif;color: #777777;padding: 10px 30px;\">\r\n        <p>* Click on <span style=\"color: #2b9fe0;\">verify email buttom</span> below, to verify your email and activate acount</p>\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td align=\"center\" bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif;color: #777777;padding: 10px 30px;\">\r\n        {{$confirmation_link}}\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif;color: #777777;padding: 10px 30px;\">\r\n        <p>* Your User ID and Password are case sensitive. If you forget your password, visit <span style=\"color: #2b9fe0;\">Forgot Password</span> on XXXXXXX.com</p>\r\n    </td>\r\n</tr>', '[\r\n	{\"tag\" : \"{{$name}}\", \"desc\" : \"To display user full name\"},\r\n	{\"tag\" : \"{{$user_name}}\", \"desc\" : \"To display user name used for login purpose like : Email Id\"}\r\n]', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'subscriber_news_letters', 'XXXXX : News Letters', '<tr>\r\n    <td bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif;color: #777777;padding: 10px 30px;    text-align: justify;\">\r\n        <div style=\"padding-top: 10px;\">Dear Subscriber,</div>\r\n        <p>You are subscribed with us by {{$email1}} Id.</p>\r\n        <p style=\"padding: 10px 0;\">You are our subscribed user. And you will get benefit of it with regular updates.</p>\r\n        <p>Here are some latest product at our site:-</p>\r\n        <p>For any further information, you can reach us at:</p>\r\n        <div>Tel: {{$telephone1}}</div>\r\n        <div style=\"padding: 10px 0;\">Tel: {{$telephone2}}</div>\r\n        <p style=\"    margin: 0;padding-bottom: 20px;\">{{$email2}}</p>\r\n        <p>We will respond to your enquiries from 9:00am to 5:00pm.</p>\r\n        <p>Thank you once again for your order and best wishes.</p>\r\n    </td>\r\n</tr>\r\n<tr>\r\n    <td>\r\n        <table bgcolor=\"#ffffff\" cellspacing=\"0\" cellpadding=\"0\" style=\"width: 100%;    padding: 10px 0;\">\r\n            <thead>\r\n                <tr style=\"padding: 10px 30px; text-align: left; background: #eee;font-size: 15px; font-family: \'Montserrat\', sans-serif;\">\r\n                    <th></th>\r\n                    <th>Product Title</th>\r\n                    <th style=\"padding: 10px 30px;\">Price</th>\r\n                    <th>Action</th>\r\n                </tr>\r\n            </thead>\r\n            <tbody>\r\n                {{$rowData}}\r\n            </tbody>\r\n            <tfoot>\r\n                <tr style=\"padding: 10px 30px; text-align: left; background: #eee;font-size: 15px; font-family: \'Montserrat\', sans-serif;\">\r\n                    <td colspan=\"4\" align=\"center\">{{$unsubscribe_link}}</td>\r\n                </tr>\r\n            </tfoot>\r\n        </table>                                        \r\n    </td>\r\n</tr>', '[\r\n	{\"tag\" : \"{{$email1}}\", \"desc\" : \"To display user email id\"},\r\n	{\"tag\" : \"{{$telephone1}}\", \"desc\" : \"To display portal contact number\"},\r\n	{\"tag\" : \"{{$telephone2}}\", \"desc\" : \"To display portal contact number\"},\r\n	{\"tag\" : \"{{$email2}}\", \"desc\" : \"To display portal contact Email Id\"},\r\n	{\"tag\" : \"{{$rowData}}\", \"desc\" : \"To display product list\"},\r\n	{\"tag\" : \"{{$unsubscribe_link}}\", \"desc\" : \"To display Unsuscribe link\"}\r\n]', '2018-11-20 07:19:14', '2018-11-19 13:00:00'),
(10, 'newsletter_welcome', 'XXXXX : Successfully subscribed to the newsletter service.', '<tr>\r\n    <td bgcolor=\"#ffffff\" style=\" font-size: 13px;font-family: \'Lato\', sans-serif;color: #777777;padding: 10px 30px;    text-align: justify;\">\r\n        <div style=\"padding-top: 10px;\">Dear User,</div>\r\n        <p>You are subscribed to our newsletter service.</p>\r\n        <p style=\"padding: 10px 0;\">You will recieve promotional emails about our offers and sale.</p>\r\n    </td>\r\n</tr>', NULL, '2019-01-06 13:00:00', '2019-01-06 13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_details`
--

CREATE TABLE `gateway_details` (
  `id` int(10) NOT NULL,
  `name` varchar(255) DEFAULT 'NULL',
  `merchant_id` varchar(255) DEFAULT NULL,
  `publishable_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `live_api_key` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gateway_details`
--

INSERT INTO `gateway_details` (`id`, `name`, `merchant_id`, `publishable_key`, `secret_key`, `live_api_key`, `created_at`, `updated_at`, `active`) VALUES
(1, 'Stripe', '12345', 'pk_test_Kgfqic48f5OtXhst6UMgr1oN00Yb6E5TJJ', 'sk_test_YfUDmYgaO5W2uP6A6Hb9kdmb00gDZve8g1', NULL, '2019-04-04 10:06:37', '2019-04-04 10:06:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `key_meta`
--

CREATE TABLE `key_meta` (
  `id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title_key` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `key_meta`
--

INSERT INTO `key_meta` (`id`, `title`, `created_at`, `updated_at`, `title_key`) VALUES
(2, 'google_maps', '2019-04-05 03:21:37', '2019-04-05 03:21:37', ''),
(4, 'Google maps demo 12323213', '2019-04-05 07:09:47', '2019-04-05 07:09:47', 'google_maps_demo_12323213'),
(5, 'google_recapcha', '2019-04-08 01:12:40', '2019-04-08 01:12:40', 'google_recapcha'),
(6, 'google_recapcha7', '2019-04-08 01:13:28', '2019-04-08 01:13:28', 'google_recapcha7');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_02_19_104616_alter_table_add_col_rol_id', 1),
(9, '2019_02_20_070643_create_roles_table', 1),
(10, '2019_02_20_102751_create_table_email_templates', 1),
(11, '2019_02_20_103601_create_jobs_table', 1),
(12, '2019_02_25_070234_alter_tbl_password_reset', 1),
(13, '2019_03_01_114720_create_tbl_countries', 1),
(14, '2019_03_01_115634_alter_tbl_users', 1),
(15, '2019_03_11_121850_create_cms_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('039f96401dc9b68aaf2e467853998e1e9eddd09927a07ebf16a7a554cdaca189725627b839dbdd93', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:34:11', '2019-04-03 04:34:11', '2020-04-03 10:04:11'),
('043b1c505c6bd3c9ef41f5988b270526fa229f183d351a26a435dd9dd47aea10174450c498cc30cf', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:44:12', '2019-04-03 03:44:12', '2020-04-03 09:14:12'),
('0572f4be902c88a0cde82b224d9214f960f64c05863014e71ea1e6df7f94441f48b2b641748534a0', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:36:37', '2019-04-08 06:36:37', '2020-04-08 12:06:37'),
('07f7480365b57fdb7c9a3fe2c53c701e836e353d3c45e6a7f36c2836ad7cd14df79cd1f2106a64a4', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:56:30', '2019-04-03 03:56:30', '2020-04-03 09:26:30'),
('0972c315282f7ba8b4c24dadf3d92bfaa49dab6a7fa77bea3292d746521bf07699d96e0f4f80a1f6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:37:06', '2019-04-03 03:37:06', '2020-04-03 09:07:06'),
('0de4cd861adf3d1be667ce49cbbc2a01b7670992303ef454504ea9d26fc88a475ff115c61008a34f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:20:35', '2019-04-03 05:20:35', '2020-04-03 10:50:35'),
('0fcc061556659692de40cff4304b07c50ef6860156aa2bace4c6b19668729e0ed6c5675e3d703e04', 3, 2, NULL, '[\"*\"]', 0, '2019-04-09 06:16:09', '2019-04-09 06:16:09', '2020-04-09 11:46:09'),
('10e78a79ec17a1536c2f40aa0a2c879ecb6f343cbc47a7af04f9fcc952ce8b16716f08c1c21cde69', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:43:45', '2019-04-08 06:43:45', '2020-04-08 12:13:45'),
('186f8dff8a99181601ee5a62b86f34a23b8e135602fd9ad520e756bc05ad7d7eeee1564c5ec0426c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:33:38', '2019-04-03 04:33:38', '2020-04-03 10:03:38'),
('196a3dd276b23d3965d659887f90a3e5a91a9e3ac8b16bfd6ef4371044ad9c8de9af9b2ed1563e34', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:15:45', '2019-04-08 04:15:45', '2020-04-08 09:45:45'),
('1a24502761b2fee9e9ed433f3ee1005568e0d5f1d9dd30bb641f2445960cb8b4d67bb3d687b444ee', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:36:25', '2019-04-03 04:36:25', '2020-04-03 10:06:25'),
('1b1719bdfdfc825d34816ca215fb5d26e12cc600e3b458810235a8526c78fcbf9feae206f485719f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:58:04', '2019-04-03 03:58:04', '2020-04-03 09:28:04'),
('1d02d53a8dc5fedd99aab1a9923bbc450fe83455cba739242326cbca9396edf929105bca7d857ac0', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:37:06', '2019-04-08 06:37:06', '2020-04-08 12:07:06'),
('1dd8b810c5efbfe49b8a194f4346812d8afd6f48de36d67cc88592a32adea6a81b212031d9d5d00f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:41:20', '2019-04-08 06:41:20', '2020-04-08 12:11:20'),
('2366867cb6a1c7a9904dc63b2e96ffa24853ca3e56e7010f93055d1164ee9749d0809ec21dbbb699', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:28:37', '2019-04-08 03:28:37', '2020-04-08 08:58:37'),
('244522ff165fa219ab31b2adfae40d60ea028c39a280e33e7ff9960bc7b228b9709f0997dc756207', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:32:36', '2019-04-08 04:32:36', '2020-04-08 10:02:36'),
('260dc4a2803c9eea68ba63ed0d318c48cec6da6f71b7de301edf44dd7bc902081b00de0c81e1c78c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:34:48', '2019-04-08 06:34:48', '2020-04-08 12:04:48'),
('27638e4aa358d28bd1dc51236750fe9255b0a7e000fb7bee0125dd0316de8f3d646c54c4b7a85efe', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:58:29', '2019-04-03 04:58:29', '2020-04-03 10:28:29'),
('28488550d5c02b4635f79629b81a376bf2e3159c55dce43d69fa0d55b39ec3a341ffd475e93d6162', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:31:50', '2019-04-03 04:31:50', '2020-04-03 10:01:50'),
('28c864a827a9601a199a900b2831233bc9eaf082adfd9fa58cd8bd99429e3cd82918b6a41ee0fe2b', 3, 2, NULL, '[\"*\"]', 0, '2019-04-04 00:25:07', '2019-04-04 00:25:07', '2020-04-04 05:55:07'),
('292d09c6c0afe8a99eea68e8388fc4c0a79589ed53602e4f2c89c14b8f9c944fe525e7f44559ec0a', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:51:16', '2019-04-03 03:51:16', '2020-04-03 09:21:16'),
('2975aff4cd4ebaf6e2ebae074d40822036cc704c9f78952f492634c4cdd8ce3c2ea6b199d9f2cc93', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:34:02', '2019-04-08 03:34:02', '2020-04-08 09:04:02'),
('29d4ffcc9389921266f1ebc8445f720a690295ab41beef962dcf338df57602fe552e7ac03879006d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:47:51', '2019-04-03 03:47:51', '2020-04-03 09:17:51'),
('2ad4bb9436e6ad57223db1c934516f91883f52b104e1ed1af34ef7cc223bfe5bc32c8eb3208ac056', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:38:06', '2019-04-08 06:38:06', '2020-04-08 12:08:06'),
('2cc9182b9d2e46540de89c27b0d23a8b85a3676c5fd53e7f20d374961ba5d8b327f1089eddef6d6a', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:17:26', '2019-04-08 04:17:26', '2020-04-08 09:47:26'),
('2e6c286c574f8ff55ebf13cbe6f374c10ab147c4fb4ed50eeaa6d8a6c23acba5e8d2e2946bc8c84c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:43:07', '2019-04-08 04:43:07', '2020-04-08 10:13:07'),
('2f1be2aadf37bec1f1b178807f21dd506b629a8541b4397dd7736c9c3597ce5d68f691802ce6d64b', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:12:11', '2019-04-08 03:12:11', '2020-04-08 08:42:11'),
('33b91694ab424670691cbdcc28f2bfe709acd13b692151dd3bb6aeff6b6e5e9988916c901bc2ee99', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:16:59', '2019-04-03 05:16:59', '2020-04-03 10:46:59'),
('348febbb790c3d7723d7bea10e33e8c9fc599e2fa28c7320e8b9c5c3f6785b0bc9bb5c70c3838d41', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:00:01', '2019-04-03 05:00:01', '2020-04-03 10:30:01'),
('36ea74e325c054016522c1ce66468105323ba7d83216f806ad8b191c53864e2be67c5bedeb2dff0f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:50:58', '2019-04-08 03:50:58', '2020-04-08 09:20:58'),
('372e533f18e5e288d2712a4dd83b96ec3a13671ba4bc06b50c513eb1260d6ac13e6d885ce822ed09', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:36:36', '2019-04-03 03:36:36', '2020-04-03 09:06:36'),
('3a8c8439cc77546f045c778dd9812c2bc2d0dd724c34397ff07f9da4659844725a4f9e90ef0d64a8', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:14:31', '2019-04-03 04:14:31', '2020-04-03 09:44:31'),
('3af366dfef3cb7506f007821a91f94b187327d64ec823d0fe82e52497b1087f435b136e03b95c186', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:41:26', '2019-04-08 04:41:26', '2020-04-08 10:11:26'),
('3ee4813045afb24744211c7ea806f1bf4dc640c0b0ba3f5b59a1b047f2a2435c345b68261a69862c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:35:20', '2019-04-08 04:35:20', '2020-04-08 10:05:20'),
('3ff90cfb0a4fcb692c6bcba0c1fcad9b7140276109a5d889f02c3207e4335dd2170c2794cdf163f4', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:07:27', '2019-04-03 04:07:27', '2020-04-03 09:37:27'),
('4ba4de3069a6dd4b5eb30b4d1ed187e03530fb3bd57dd07c339c6c5e3c3df4e6a3a48296098ee40e', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:29:07', '2019-04-08 03:29:07', '2020-04-08 08:59:07'),
('4cc44541953a8e8637a3f58f2d3df91a11bc7bc017b819215409f7e7bc19ba63b33b9273e7b2ff2d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:13:50', '2019-04-08 04:13:50', '2020-04-08 09:43:50'),
('4d95d4d8120169aae770b114b53d524a254e952365b1770f36954ec9626a1b5d31f2e743ab17e7f3', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 05:10:53', '2019-04-08 05:10:53', '2020-04-08 10:40:53'),
('4eb831d25e7c40afd44fc23583f8f8d8e65fefc578620cf4cd0e6268ba226f37453115ce64e36491', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:57:37', '2019-04-03 03:57:37', '2020-04-03 09:27:37'),
('4f29f9aae9bda15e606f6bbc965cc74f4c312985082baff2fa8dae4826a17b69189f52c131776bc6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:13:59', '2019-04-08 04:13:59', '2020-04-08 09:43:59'),
('50b9cf5c4515d82c8ce3e982f484f0a09ed94beb449b1e8297e602decd80b43db141b1c7375e306d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:00:43', '2019-04-03 04:00:43', '2020-04-03 09:30:43'),
('54a194a7a819c17fe68ddf7b16b7cc25338a7faec12f7760fb878cdc1c284da6c3db555d0acd3ae3', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:46:04', '2019-04-08 03:46:04', '2020-04-08 09:16:04'),
('56d5770f26cca873337e45c6be916c02bf6e6d0e01ac7b6ac7a6e5918f9fabdc53c3d938ccbf4cb2', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:42:35', '2019-04-03 04:42:35', '2020-04-03 10:12:35'),
('58165fa9c6a5a50a1ce83cb0f93594dbbc17b07385d7917b94eddd8bc0a19a50efd4fc72de894769', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:55:33', '2019-04-03 04:55:33', '2020-04-03 10:25:33'),
('5b5217c8a754517e8bf356e5977cccdafd9898c014d9d3b74dd96cf8e1c48c84974d814bc6fd4733', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:47:27', '2019-04-08 03:47:27', '2020-04-08 09:17:27'),
('5c80e4d57448d7d1d709bd4911ea402f5a2eb357881fa530d5d3571058dfba8d8dd9c38722da410b', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:01:30', '2019-04-03 05:01:30', '2020-04-03 10:31:30'),
('5dc4966eb9236bdec3de12f96c0559b812a0bc89e7ba76b8d4b8bac90b2396c676ea5bb20e0d4f70', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:12:14', '2019-04-03 04:12:14', '2020-04-03 09:42:14'),
('5eb4a9e4b26084534a38e0860330ee507df60ea1feb8062c6556f68c8a3b5e0c3182a6701f529785', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:59:06', '2019-04-08 04:59:06', '2020-04-08 10:29:06'),
('622ce0f86161caa5a1912c4c383c22be39aa5e9f815163fa6cc4f3485897b040bc2df3870ecaea02', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:28:25', '2019-04-03 04:28:25', '2020-04-03 09:58:25'),
('640247b0401c094d71c155143d0f6d54bcb191dc480434da5ef958aa107804b246e38008c2bacae6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-04 00:40:28', '2019-04-04 00:40:28', '2020-04-04 06:10:28'),
('6650f08ff467ddc0414acd2a294cf2171fb1eb258280ba9c58300f7602b6a6efdd9ed4fe76990c03', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:00:51', '2019-04-03 05:00:51', '2020-04-03 10:30:51'),
('667c4ce7054ab86c91fa654d1c41cca219711a179ae82756da5f88e0c6dfa1283d2d08a4f309410c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:35:15', '2019-04-08 06:35:15', '2020-04-08 12:05:15'),
('6cdc831b5f844cadeee389ffbb6ac6beb1a2f143181c95418b0938bdf0b85f31f79af3179ea119f7', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:40:09', '2019-04-03 04:40:09', '2020-04-03 10:10:09'),
('6f63b5f8a8da1017f0af0cfdda7cb92c0442c97fe0ccff09925f54ef1522fe13d79255831ce36efe', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:03:53', '2019-04-03 05:03:53', '2020-04-03 10:33:53'),
('706942c2a03b3bf8cb6e7928ab9b1183b13f5c05361ed89909be8e9fecd85a50bea63a25da62243d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:41:48', '2019-04-08 04:41:48', '2020-04-08 10:11:48'),
('7122a63b8dad2cda07fce24646d1a16043a19b82e03614bc1381207d9995b9f774f13c89abc26ce0', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:18:44', '2019-04-03 04:18:44', '2020-04-03 09:48:44'),
('73275523cb152c9c3cfb6863010d7fcf6214626beb3eb07abb7ba79c20da82f70389734ba3f649f6', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:30:03', '2019-04-03 03:30:03', '2020-04-03 09:00:03'),
('7a485737a0dbc351814c2e9881158c15498e23aeee7553e2986143afb951026fbef38a02d4a9bfc1', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:43:11', '2019-04-08 06:43:11', '2020-04-08 12:13:11'),
('7d158ae72fe00988acaf0876fac0e9751030203b1bddb6b619be406adbc993ecda3d7ebe56fa8e1f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:15:27', '2019-04-08 03:15:27', '2020-04-08 08:45:27'),
('808c2d5005d340fd2d294ef166a97e06de170ccfde6ecb99c6ebfb44752a7d447b8b02e3eaaf7d6c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:29:52', '2019-04-03 04:29:52', '2020-04-03 09:59:52'),
('81a135e384fba00501418ca6247c38674a2844411530cc10b4f4418bd879d8778d48e4dddb1be997', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:12:38', '2019-04-03 04:12:38', '2020-04-03 09:42:38'),
('81a9792fe789c8674d4f5588547d1f6fa2b824f8360536cfedc8e4afaa29334c9be32e5bde78d46b', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:29:36', '2019-04-08 03:29:36', '2020-04-08 08:59:36'),
('82ea8286e93af1ff72daa2586349b4d9452a19a083703b332a03b04700fb39a19afe50a4b1379b43', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:54:38', '2019-04-03 03:54:38', '2020-04-03 09:24:38'),
('82ecc28dbe407229c5b143f396bb9f5801b31cf03a523b07089bde9407dbd0dfcb13c1b689712c2f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:13:54', '2019-04-03 04:13:54', '2020-04-03 09:43:54'),
('835e2abecdda56e4d2c2875733c655c7fd24fa1941833f3ee1668d546998759e4dfeaf6cb9d28e9e', 3, 2, NULL, '[\"*\"]', 0, '2019-04-05 02:03:51', '2019-04-05 02:03:51', '2020-04-05 07:33:51'),
('8603b28794800b4da98ef75e537d555f4a618c866cfe5229b00894964d1c3889e9331fd3c2ca0550', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:13:52', '2019-04-08 03:13:52', '2020-04-08 08:43:52'),
('86a2008f4dcbcb39965dc6cba1e9e4ea8914c1775fa13820c05334c895018fb14a948c7eb3e62bc2', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:46:53', '2019-04-03 04:46:53', '2020-04-03 10:16:53'),
('87533bd5421331ded24a3b6d17acd99232e659a40709b7e394f4326c352282e8bf760878b6259726', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:15:10', '2019-04-08 04:15:10', '2020-04-08 09:45:10'),
('88e6c5d982acfc7af1d49c565ec7e84d7b379650ae541fac116924bff5587f84165af539d5cb3372', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:49:57', '2019-04-03 04:49:57', '2020-04-03 10:19:57'),
('8a53f781adbbde0fa941f3cda2fd7ff83d73c21c562ac19714645608ffdcf7a2d7a159e350403602', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:59:23', '2019-04-03 04:59:23', '2020-04-03 10:29:23'),
('8ad553eb1693042d7f5189f5cef0262b8aeedea2b78c48e451d470bf5b01d3a7aa08dc5b79e40f55', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:40:43', '2019-04-08 06:40:43', '2020-04-08 12:10:43'),
('8c43db0f326a05537225448c6699c53699ce73d4ae5d4eabb6781e0231ed9a27544197fbf8ba7316', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:31:09', '2019-04-08 03:31:09', '2020-04-08 09:01:09'),
('8c540159f20eff6a924f6e4d8a956a502c1bcec23f12519d202542b20904240d5a5a7f5b15fc80e0', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:57:16', '2019-04-03 04:57:16', '2020-04-03 10:27:16'),
('8d73879091f9410b01a69fe30c0b06176a7e12470f0e45d90f75cdf5afd8f929f87c02583512befb', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:13:20', '2019-04-08 03:13:20', '2020-04-08 08:43:20'),
('8f7ed9acf00a02de820fbde62d83e37585e6ec1b9aa8e5f2a69b5ec9c14c6549d42761cef7359823', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:28:00', '2019-04-08 03:28:00', '2020-04-08 08:58:00'),
('901081e8d8550e61d0d0a4cb8e265e1b13846edc23cd655fac01203838a61bfb63b88b3c5ddf5f6a', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:29:57', '2019-04-08 03:29:57', '2020-04-08 08:59:57'),
('90de4334b55516c650f759077c1c02181e9ad3b4f261af90a7c81dc4423751627f4dad60ed0d8283', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:17:56', '2019-04-03 05:17:56', '2020-04-03 10:47:56'),
('93b1ab905f8c466610265dd9222ce5f91fd56724a344da0e8a3f0c95cc6fd173341eae4e20735054', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:28:38', '2019-04-08 04:28:38', '2020-04-08 09:58:38'),
('95450307db76876bca896b2f26da20438ffa41ecdbd99e3446e5aa46a62f16d49346fb8037c0aea2', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:14:31', '2019-04-03 05:14:31', '2020-04-03 10:44:31'),
('98402e62203c36dade930f03a206c57e739b4d33859871a5197b36e0fa59bc63aeff53b398e71a46', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:11:43', '2019-04-03 04:11:43', '2020-04-03 09:41:43'),
('988f4607233b66f543ab5dca52acf1b24f243b297acb9889d54ed327250d4eb2c26d786285769855', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:39:22', '2019-04-03 04:39:22', '2020-04-03 10:09:22'),
('996003183b02efdb68e55cf90664b599ebb735e1288b639a3b9587eaac055c7a9bc7be52758ab3fa', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:52:26', '2019-04-03 04:52:26', '2020-04-03 10:22:26'),
('9c1c7250c203207298f825095dbe208ebcd6df3ae4981d63981e1208f8636bd3ed3992c98388cbed', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:45:42', '2019-04-03 04:45:42', '2020-04-03 10:15:42'),
('9e2bd64af4f765b770efd896c0cded66f3a047a36bf4b7573284cbb26efa4c075ee35206ae43d5c1', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:59:40', '2019-04-08 04:59:40', '2020-04-08 10:29:40'),
('9f7679876e1c945e2d436b1be64af9cc763146c1a5730386e486c0476a420477d4803d974a1ba6c4', 3, 2, NULL, '[\"*\"]', 0, '2019-04-09 06:12:59', '2019-04-09 06:12:59', '2020-04-09 11:42:59'),
('a1bff3b67603e043619a190d2608f885af90f29e3ed5bfe16293506002791b6a6fe3dc974fc46315', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:57:10', '2019-04-08 03:57:10', '2020-04-08 09:27:10'),
('a26044f8295356d1bd5896f209b954d1d7635853834cd41ca5f273284270727550b495da7a85dd14', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:34:54', '2019-04-03 04:34:54', '2020-04-03 10:04:54'),
('a3a95d4e1be78304919aa3cfddaab96e7b8e94382cd692e1badc2698e90035483baef85f19fccef5', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:39:50', '2019-04-08 04:39:50', '2020-04-08 10:09:50'),
('a8fba9b40c6695c274bc48d2b8c30fc6af74603cf054dcda7bd2b943a71b2d9edb659dcf9931281f', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:30:34', '2019-04-03 03:30:34', '2020-04-03 09:00:34'),
('b0d44095b9e1a0a8ac52638574c1642f161b69c023edb0ed8dcb60eddd317aeaa0b4da78596d08a7', 3, 2, NULL, '[\"*\"]', 0, '2019-04-09 06:15:13', '2019-04-09 06:15:13', '2020-04-09 11:45:13'),
('b609242a0fa479fba7fec7515dba9a5c5435a42451a665e93b72c10a01bc2a92b9b4babb92717198', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:07:58', '2019-04-03 04:07:58', '2020-04-03 09:37:58'),
('b60f13e1dd6b21d215ba3e725fa09f2cfb625960ddef376c82dbc775dbe997e16f39e8ec29385280', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:37:15', '2019-04-08 03:37:15', '2020-04-08 09:07:15'),
('b660a3352bd698697acced9c74641831d0b3c7808837bc0a34f4c25c1186e147fb99af96161cddc6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-09 06:32:53', '2019-04-09 06:32:53', '2020-04-09 12:02:53'),
('b939ba1555f44db22fcf79c650ecd1650c58ee7646fb8215d428a4f1a497ba4e55682983172f5e26', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:47:09', '2019-04-03 03:47:09', '2020-04-03 09:17:09'),
('b9efa282116a4a609d1f52d94f170adb18937bc17822fbfb90cb036b4ef1744c1c5f163c4f74cc31', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:38:32', '2019-04-03 03:38:32', '2020-04-03 09:08:32'),
('ba9bb29488070ca9a2b7dcd80972faf14569c46a2fa5b37363fada24af7d936825ec0108f6c87b14', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:45:18', '2019-04-08 04:45:18', '2020-04-08 10:15:18'),
('bb474c09c6dcf42a4f56352b9600dce14a3edabda7e78f1fbc8ef79c5b8e47f925e0e5b769ad4a18', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:50:30', '2019-04-08 03:50:30', '2020-04-08 09:20:30'),
('bc56ea73c0a613c8271900bb509c43b2eb2261f5dd91a42eefea02d40ab4bb80236556a43d44108d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:35:11', '2019-04-03 04:35:11', '2020-04-03 10:05:11'),
('befddebececffb364fb34dc37178e1e9fb88caadf8ec667eb11e404dfae4adff380db5d2ca9410a6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:45:21', '2019-04-03 04:45:21', '2020-04-03 10:15:21'),
('c343bd4fd388558b158b3b32d49c950e2362ea32cac9ea2d7612984829177ec438b56e82a23f6adf', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:33:18', '2019-04-08 03:33:18', '2020-04-08 09:03:18'),
('c450fa75fe44d07b85ec425cee3d66f36e5b917ee45e1009de0abdeeefe1424cfbbf398262cd8ec6', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:07:36', '2019-04-03 05:07:36', '2020-04-03 10:37:36'),
('c4f88f5f7de4655a8f740401b2938f56a2994b8c0b393a6a9e6afd8b973f056a62dbb8bc453de7f0', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:26:45', '2019-04-08 04:26:45', '2020-04-08 09:56:45'),
('c5e47770d1f1e9158827fe6ba5970e3edccab0217d821bc5870d20548f68982284c39c663cb64ca7', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:49:57', '2019-04-03 03:49:57', '2020-04-03 09:19:57'),
('c78c42b473a6af421fbbc62fc86740446c67032a73d452d3b7c450e83dbf2b46aaa4735d86aa94af', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:30:51', '2019-04-03 04:30:51', '2020-04-03 10:00:51'),
('cc9ff61dbf94f58bd2e8bd8400e5d5a8d3777d75d4b989ba05639b95335fcf6d8f95c4b234589f27', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:20:14', '2019-04-03 04:20:14', '2020-04-03 09:50:14'),
('cf3a6253ca548eb907d0c81073e5e2de72eba287bd0e8c48e6f90b9b0ce503bb02497ad17005c4bd', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:42:18', '2019-04-08 04:42:18', '2020-04-08 10:12:18'),
('d367d3954e53f98059813442d4e52f8c40b6bbfa9f86975bcaa7beaa815866fb105ea88d2388d8fe', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 05:00:51', '2019-04-08 05:00:51', '2020-04-08 10:30:51'),
('d3c19411019bef87e8d5bc2a829dd24c0d1046d9deadef780fb15fc087f2f45b346a05a02525173e', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:28:54', '2019-04-03 04:28:54', '2020-04-03 09:58:54'),
('d55431b69949f8ca8f58fb863d24d81eae7b888d9cb883676b0d4fe688b54ff42c2ba948eda8f5e8', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 04:29:47', '2019-04-08 04:29:47', '2020-04-08 09:59:47'),
('d832b8013176ccec0ffe20f088b869a805c29dbdb0c27bdded3a81ff1cea2b5e7ebb16b7fba4b69c', 3, 2, NULL, '[\"*\"]', 0, '2019-04-09 06:37:24', '2019-04-09 06:37:24', '2020-04-09 12:07:24'),
('d8e009fb24db75a152a74a6a0fed6467b70a84e673e25ff3d34ce8b4b6a5ce30650facebdcb5d57e', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:42:48', '2019-04-08 06:42:48', '2020-04-08 12:12:48'),
('dae825b8661d1a922a84531f4909012e99fd7410adc029f3ebf2d916f32aaaebaf014a73f6609043', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:39:04', '2019-04-08 06:39:04', '2020-04-08 12:09:04'),
('de6d144df0de81f687b5178c9139a05ba7bc783ae136b1ba97c6b9eec6e85488399c79f415374743', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:47:55', '2019-04-03 04:47:55', '2020-04-03 10:17:55'),
('e040f0003073e2a763b22b722908f52bfd181be8880f0c1d86e16963e7ef97d4f6ad901887cdfbe1', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:49:31', '2019-04-03 04:49:31', '2020-04-03 10:19:31'),
('e14b7fadfa4daa246312ef3e79f96ffe649a590f08b3df372cec00b774b674e1f4b6cb9300f5dda1', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:53:14', '2019-04-03 04:53:14', '2020-04-03 10:23:14'),
('e691c134839d068ffedaa6cfd20934e1e8cc813999d244b70afc2e9e78899bef704cb6ca4579b508', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:46:21', '2019-04-03 03:46:21', '2020-04-03 09:16:21'),
('e6a2e536d4af7bc0641bb68105f694ca82be10e396214adaff8d7f17a112ebc3de53d0b687ea1496', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:13:23', '2019-04-03 04:13:23', '2020-04-03 09:43:23'),
('e8b0ec97657a7091f3b29057ecfec93ed015f9c15270a5365feaec6607bb787eebebcebc5610af0e', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 03:48:00', '2019-04-08 03:48:00', '2020-04-08 09:18:00'),
('ec10c44d6936250b432ac360ecee5457f27398447d1b5389512f45c7002dd792ce0266d36b99ded1', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:54:25', '2019-04-03 04:54:25', '2020-04-03 10:24:25'),
('ef5e2d08a2831540525f39557df159cb41de5bc6502558f6b90055435e2323009f66a61136373e85', 6, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:39:15', '2019-04-03 03:39:15', '2020-04-03 09:09:15'),
('f04f2b84137af4211ff60be195e666bd1d22e1799a4d3fa83bb0ec5d3fcc8133463ad843b7969c7f', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:57:39', '2019-04-08 06:57:39', '2020-04-08 12:27:39'),
('f052ffe70c6615bf303b86bb788a3d8e609585f0b2463b8aba37a6866496a382b27e2f1f04ff8294', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:54:49', '2019-04-08 06:54:49', '2020-04-08 12:24:49'),
('f248ba53318ebd73ffff3c405ef61a6b1b98c3e0c2103ea7072b444758a47a3975ef48057bbd17d4', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:39:03', '2019-04-03 04:39:03', '2020-04-03 10:09:03'),
('f249e13c0eec783be89a622a28a605bd0d18a374dc4f2a7b1f97d0d3c3de0808b09958477352bf0b', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:44:27', '2019-04-08 06:44:27', '2020-04-08 12:14:27'),
('f63cb74faa985314c166085aa052839621da1e8cb7d73365e981fa06c2a61d6e3209eb74c4a20486', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 05:07:33', '2019-04-03 05:07:33', '2020-04-03 10:37:33'),
('f847bf5fcf9730fa84bbdf724d24be06a9b17be1fb9843e8507ea50b410c2c23e17c578be909af2d', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 03:50:35', '2019-04-03 03:50:35', '2020-04-03 09:20:35'),
('f8accc21a182c0e436f907ddbd7c7bd45358ac8ca6b545eda86d530f8c60b33f4ff1aa030c34a3cd', 3, 2, NULL, '[\"*\"]', 0, '2019-04-03 04:23:19', '2019-04-03 04:23:19', '2020-04-03 09:53:19'),
('fcfef055d246d9a10447e7f318bcccfbf56c0fe06b6d3ff17f23cea5b552d56d310a070f76bfb328', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:50:58', '2019-04-08 06:50:58', '2020-04-08 12:20:58'),
('fd310ccb93d407153c9f6b461b9095a76f4ecaa33dec4612c28560b107115ef8ab350f09b2d66151', 3, 2, NULL, '[\"*\"]', 0, '2019-04-08 06:55:45', '2019-04-08 06:55:45', '2020-04-08 12:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'WyxZketmtWtzL9LCh59y3e76XkzMpjuLYjIUa7mw', 'http://localhost', 1, 0, 0, '2019-02-19 19:08:29', '2019-02-19 19:08:29'),
(2, NULL, 'Laravel Password Grant Client', 'A44tDDu5QyaEtOGi1qWY564MsAxz6PrRLAcragZQ', 'http://localhost', 0, 1, 0, '2019-02-19 19:08:29', '2019-02-19 19:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('1cd620a2e3c7bd236eac06b7d738bd8dee404ca67993da2791fb25293647b24704c9eee6c696ebab', 'd832b8013176ccec0ffe20f088b869a805c29dbdb0c27bdded3a81ff1cea2b5e7ebb16b7fba4b69c', 0, '2020-04-09 12:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Stripe', 1, '2019-04-04 14:29:00', '2019-04-04 14:29:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` smallint(6) DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` enum('0','1') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_code` smallint(6) DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `is_active`, `image`, `ip_address`, `email`, `email_verified_at`, `mobile_code`, `mobile`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 2, 'Andrew', 'Singh', '1', NULL, '172.10.36.74', 'pooja.sangitrao@smartdatainc.net', '2019-04-01 18:30:00', 91, '7894561320', '$2y$10$HLN3DdqT.Gq3DWEi44DMc.Znwh0nCuG1BzQI63dOJEBMiYZz0P5LG', NULL, '2019-04-02 23:40:36', '2019-04-02 23:40:36'),
(6, 2, 'Andrew', 'Singh', '0', NULL, '172.10.36.74', 'test@yopmail.com', NULL, 91, '7894561320', '$2y$10$eXGTJ68BMRHUahG73QVyhux72weDopOpfFAIEaErSN7G.OJmWcGhy', NULL, '2019-04-03 03:29:39', '2019-04-03 03:29:39'),
(7, NULL, 'Buma', 'Nikki', '0', NULL, '192.168.2.1', 'pjs@yahoo.com', NULL, 92, '9874561230', NULL, NULL, '2019-04-03 06:15:27', '2019-04-03 06:15:27'),
(9, NULL, 'Buma', 'Nikki', '0', NULL, NULL, 'pjs1@yahoo.com', NULL, 92, '9874561230', NULL, NULL, '2019-04-03 06:20:57', '2019-04-03 06:20:57'),
(10, NULL, NULL, NULL, '0', '1554294899.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-03 07:04:59', '2019-04-03 07:04:59'),
(12, 1, 'Admin', 'Test', '0', NULL, NULL, 'admin2@gmail.com', '2019-04-04 00:27:49', 91, '321456098', '$2y$10$kktlUdIxqdMVXaD55zsitOigjoY2G6rvZSrRehmgco3HSx6Nf2haC', NULL, '2019-04-04 00:27:49', '2019-04-04 00:27:49'),
(13, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:27', '2019-04-07 23:39:27'),
(14, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:27', '2019-04-07 23:39:27'),
(15, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:27', '2019-04-07 23:39:27'),
(16, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:27', '2019-04-07 23:39:27'),
(17, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:47', '2019-04-07 23:39:47'),
(18, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:47', '2019-04-07 23:39:47'),
(19, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:47', '2019-04-07 23:39:47'),
(20, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:47', '2019-04-07 23:39:47'),
(21, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:57', '2019-04-07 23:39:57'),
(22, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:57', '2019-04-07 23:39:57'),
(23, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:58', '2019-04-07 23:39:58'),
(24, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:39:58', '2019-04-07 23:39:58'),
(25, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:12', '2019-04-07 23:40:12'),
(26, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:12', '2019-04-07 23:40:12'),
(27, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:12', '2019-04-07 23:40:12'),
(28, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:12', '2019-04-07 23:40:12'),
(29, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:40', '2019-04-07 23:40:40'),
(30, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:40', '2019-04-07 23:40:40'),
(31, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:40', '2019-04-07 23:40:40'),
(32, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-07 23:40:40', '2019-04-07 23:40:40'),
(33, 1, 'Admin', 'Test', '0', NULL, NULL, 'admin@gmail.com', '2019-04-07 23:42:11', 91, '321456098', '$2y$10$gdjYwUoMVnWudwExJEcTMua16JzQY4Z9h3IAkuOxUjLCe2AKdgUfO', NULL, '2019-04-07 23:42:11', '2019-04-07 23:42:11'),
(34, 1, 'Admin', 'Test', '0', NULL, NULL, 'admin3@gmail.com', '2019-04-07 23:43:26', 91, '321456098', '$2y$10$qf/8MICsZtKBJxB544Mn4OCoESVrlOIRVD/4qykR5qY1horwpOyZm', NULL, '2019-04-07 23:43:26', '2019-04-07 23:43:26'),
(35, NULL, 'Buma', 'Nikki', '0', NULL, NULL, 'pjs123@yahoo.com', NULL, 92, '9874561230', NULL, NULL, '2019-04-07 23:46:56', '2019-04-07 23:46:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_templates_title_index` (`title`);

--
-- Indexes for table `gateway_details`
--
ALTER TABLE `gateway_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `key_meta`
--
ALTER TABLE `key_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gateway_details`
--
ALTER TABLE `gateway_details`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `key_meta`
--
ALTER TABLE `key_meta`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
