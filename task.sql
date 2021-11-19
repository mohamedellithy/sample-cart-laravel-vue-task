-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 17 نوفمبر 2021 الساعة 03:58
-- إصدار الخادم: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- بنية الجدول `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2021_11_15_204939_create_products_table', 1),
(13, '2021_11_17_011915_create_orders_table', 2);

-- --------------------------------------------------------

--
-- بنية الجدول `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `transaction_id` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `orders`
--

INSERT INTO `orders` (`id`, `total`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, '481.50', 'ch_3Jwd7qB6XV6ufIly1LZ3GGYZ', '2021-11-16 23:39:50', '2021-11-16 23:39:50'),
(2, '481.50', 'ch_3JwdZDB6XV6ufIly1J23gKO2', '2021-11-17 00:08:07', '2021-11-17 00:08:07'),
(3, '481.50', 'ch_3JwdZmB6XV6ufIly17jfV7nP', '2021-11-17 00:08:42', '2021-11-17 00:08:42'),
(4, '481.50', 'ch_3JwdaFB6XV6ufIly0IxaDwzZ', '2021-11-17 00:09:12', '2021-11-17 00:09:12'),
(5, '481.50', 'ch_3JwdbFB6XV6ufIly1WCKBMj3', '2021-11-17 00:10:13', '2021-11-17 00:10:13'),
(6, '481.50', 'ch_3JwdeFB6XV6ufIly0DXkUnDf', '2021-11-17 00:13:19', '2021-11-17 00:13:19'),
(7, '481.50', 'ch_3JwdhAB6XV6ufIly1NGldWYb', '2021-11-17 00:16:20', '2021-11-17 00:16:20'),
(8, '481.50', 'ch_3JwduiB6XV6ufIly1IenXi2F', '2021-11-17 00:30:21', '2021-11-17 00:30:21'),
(9, '132.30', 'ch_3JwdvTB6XV6ufIly09hePLcA', '2021-11-17 00:31:07', '2021-11-17 00:31:07'),
(10, '7443.00', 'ch_3JwdxgB6XV6ufIly1VHtB5Lo', '2021-11-17 00:33:25', '2021-11-17 00:33:25'),
(11, '7443.00', 'ch_3Jwe6UB6XV6ufIly0bhynffh', '2021-11-17 00:42:30', '2021-11-17 00:42:30'),
(12, '64.80', 'ch_3Jwe8bB6XV6ufIly1fwWogu5', '2021-11-17 00:44:41', '2021-11-17 00:44:41'),
(13, '95.40', 'ch_3JweHgB6XV6ufIly1hmOqUpP', '2021-11-17 00:54:04', '2021-11-17 00:54:04'),
(14, '7443.00', 'ch_3JweYkB6XV6ufIly0S8aRHfO', '2021-11-17 01:11:42', '2021-11-17 01:11:42'),
(15, '7386.30', 'ch_3JweZyB6XV6ufIly1RtnxARv', '2021-11-17 01:12:58', '2021-11-17 01:12:58'),
(16, '7427.70', 'ch_3JwebbB6XV6ufIly1QCoDtdk', '2021-11-17 01:14:39', '2021-11-17 01:14:39'),
(17, '7416.90', 'ch_3JwefQB6XV6ufIly0bbdyYiT', '2021-11-17 01:18:36', '2021-11-17 01:18:36'),
(18, '7375.50', 'ch_3JwegbB6XV6ufIly0izrlWpF', '2021-11-17 01:19:49', '2021-11-17 01:19:49');

-- --------------------------------------------------------

--
-- بنية الجدول `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '10',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- إرجاع أو استيراد بيانات الجدول `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(18, 'Aut ab earum.', 'Id sed numquam saepe quia perspiciatis eum. Eum deleniti dolore officiis est voluptatem ipsum quo. Ea distinctio quis dolore maiores aut eveniet.', '8135.00', 43, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(17, 'Deleniti minus.', 'Quidem dolorem id non excepturi molestias dolor. Voluptatem harum maiores optio consequatur autem hic quisquam. Voluptatem ad voluptate et minus temporibus explicabo alias.', '46.00', 95, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(16, 'Iusto possimus.', 'Animi autem excepturi pariatur at velit blanditiis sed et. Autem ab voluptas porro nihil dolorem ut ut esse.', '89.00', 72, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(15, 'Et culpa corporis.', 'Dolores deleniti odit magni vitae quia minus. Molestiae earum ea laborum voluptate at inventore. Ut atque voluptas et itaque. Earum vero error et quaerat est error provident sunt.', '60.00', 93, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(13, 'Blanditiis quia.', 'Ut fugit rerum et qui qui neque ullam. Sed eos libero soluta eum sint voluptatum maiores. Voluptatum nobis error aut.', '12.00', 39, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(14, 'Dolorum et expedita.', 'Odio cupiditate sequi ab eaque est ducimus nobis. Laboriosam veritatis sunt eum eum aut unde accusantium. Aut rerum voluptatem veniam distinctio dolores rerum consequuntur.', '25.00', 48, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(12, 'Ipsum autem vitae.', 'Repellat quibusdam laboriosam non doloremque recusandae consectetur. Nihil earum pariatur blanditiis non dolore porro impedit.', '75.00', 86, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(11, 'Aliquid corrupti.', 'Blanditiis voluptas quidem tempore est commodi voluptates sit. Ut perferendis ut sed est. Rerum saepe sunt omnis voluptas eum.', '82.00', 93, '2021-11-15 19:42:42', '2021-11-15 19:42:42'),
(10, 'Architecto atque.', 'Totam voluptatum omnis dolorum ducimus. Qui neque asperiores sit omnis. Rerum qui magni sit dolorem quos velit ea. Ab distinctio molestias voluptas eos dolor exercitationem asperiores quae.', '3.00', 52, '2021-11-15 19:42:42', '2021-11-15 19:42:42');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
