-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Янв 13 2021 г., 08:01
-- Версия сервера: 8.0.22
-- Версия PHP: 7.3.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `m_seller8`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint UNSIGNED NOT NULL,
  `attribute_id` bigint UNSIGNED NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'notebook', 'notebook', NULL, NULL),
(2, NULL, 1, 'для уборки', '', NULL, NULL),
(3, 2, 1, 'Пылесосы', 'Пылесосы', '2020-03-07 10:10:58', '2020-03-07 10:10:58'),
(4, 3, 2, 'обычные', 'обычные', '2020-03-07 10:11:36', '2020-03-07 10:11:36'),
(5, 3, 1, 'моющие', 'моющие', NULL, NULL),
(6, NULL, 1, 'Товары для кухни', 'Товары для кухни', NULL, NULL),
(7, 6, 1, 'Приготовление пищи', 'Приготовление пищи', NULL, NULL),
(8, 7, 1, 'Микроволновые печи', 'Микроволновые печи', NULL, NULL),
(9, 7, 1, 'Мультиварки', 'Мультиварки', NULL, NULL),
(10, 7, 1, 'Фритюрницы', 'Фритюрницы', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '{}', 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'order_number', 'text', 'Order Number', 1, 1, 1, 1, 1, 1, '{}', 3),
(58, 7, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(59, 7, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"options\":{\"pending\":\"Pending\",\"processing\":\"Processing\",\"completed\":\"Completed\",\"decline\":\"Decline\"}}', 4),
(60, 7, 'grand_total', 'text', 'Grand Total', 1, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'item_count', 'text', 'Item Count', 1, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'is_paid', 'checkbox', 'Is Paid', 1, 1, 1, 1, 1, 1, '{\"on\":\"Paid\",\"off\":\"Not Paid\",\"checked\":true}', 7),
(63, 7, 'payment_method', 'select_dropdown', 'Payment Method', 1, 1, 1, 1, 1, 1, '{\"options\":{\"cash_on_delivery\":\"Cash on Delivery\",\"paypal\":\"Paypal\",\"stripe\":\"Stripe\",\"card\":\"Card\"}}', 8),
(64, 7, 'shipping_fullname', 'text', 'Shipping Fullname', 1, 1, 1, 1, 1, 1, '{}', 9),
(65, 7, 'shipping_address', 'text', 'Shipping Address', 1, 1, 1, 1, 1, 1, '{}', 10),
(66, 7, 'shipping_city', 'text', 'Shipping City', 1, 0, 1, 1, 1, 1, '{}', 11),
(67, 7, 'shipping_state', 'text', 'Shipping State', 1, 0, 1, 1, 1, 1, '{}', 12),
(68, 7, 'shipping_zipcode', 'text', 'Shipping Zipcode', 1, 0, 1, 1, 1, 1, '{}', 13),
(69, 7, 'shipping_phone', 'text', 'Shipping Phone', 1, 0, 1, 1, 1, 1, '{}', 14),
(70, 7, 'notes', 'text_area', 'Notes', 0, 0, 1, 1, 1, 1, '{}', 15),
(71, 7, 'billing_fullname', 'text', 'Billing Fullname', 1, 0, 1, 1, 1, 1, '{}', 16),
(72, 7, 'billing_address', 'text', 'Billing Address', 1, 0, 1, 1, 1, 1, '{}', 17),
(73, 7, 'billing_city', 'text', 'Billing City', 1, 0, 1, 1, 1, 1, '{}', 18),
(74, 7, 'billing_state', 'text', 'Billing State', 1, 0, 1, 1, 1, 1, '{}', 19),
(75, 7, 'billing_zipcode', 'text', 'Billing Zipcode', 1, 0, 1, 1, 1, 1, '{}', 20),
(76, 7, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 1, '{}', 21),
(77, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 22),
(78, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 23),
(79, 7, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 24),
(80, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(81, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(82, 8, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(83, 8, 'is_active', 'checkbox', 'Is Active', 1, 1, 1, 1, 1, 1, '{\"on\":\"Active\",\"off\":\"InActive\"}', 4),
(84, 8, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
(85, 8, 'rating', 'text', 'Rating', 0, 1, 1, 1, 1, 1, '{}', 6),
(86, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(87, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(88, 8, 'shop_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 9),
(89, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 3),
(91, 9, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '{}', 4),
(92, 9, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(93, 9, 'cover_img', 'image', 'Cover Img', 0, 1, 1, 1, 1, 1, '{}', 6),
(94, 9, 'shop_id', 'text', 'Shop Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(95, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(96, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(97, 9, 'product_belongsto_shop_relationship', 'relationship', 'shops', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Shop\",\"table\":\"shops\",\"type\":\"belongsTo\",\"column\":\"shop_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(98, 9, 'product_belongstomany_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_categories\",\"pivot\":\"1\",\"taggable\":\"on\"}', 10),
(99, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(100, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(101, 10, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 3),
(102, 10, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 4),
(103, 10, 'value', 'text', 'Value', 1, 1, 1, 1, 1, 1, '{}', 5),
(104, 10, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 6),
(105, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(106, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(109, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(110, 13, 'sub_order_id', 'text', 'Sub Order Id', 1, 1, 0, 1, 1, 1, '{}', 2),
(111, 13, 'transaction_id', 'text', 'Transaction Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(112, 13, 'amount_paid', 'text', 'Amount Paid', 1, 1, 1, 1, 1, 1, '{}', 4),
(113, 13, 'commission', 'text', 'Commission', 1, 1, 1, 1, 1, 1, '{}', 5),
(114, 13, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 6),
(115, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(116, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(117, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 0),
(118, 14, 'order_id', 'text', 'Order Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(119, 14, 'seller_id', 'text', 'Seller Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(120, 14, 'status', 'text', 'Status', 1, 1, 1, 1, 1, 1, '{}', 4),
(121, 14, 'grand_total', 'text', 'Grand Total', 1, 1, 1, 1, 1, 1, '{}', 5),
(122, 14, 'item_count', 'text', 'Item Count', 1, 1, 1, 1, 1, 1, '{}', 6),
(123, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(124, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-02-10 19:10:11', '2020-02-19 12:28:01'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(7, 'orders', 'orders', 'Order', 'Orders', 'voyager-buy', 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-10 19:22:34', '2020-02-12 20:06:26'),
(8, 'shops', 'shops', 'Shop', 'Shops', 'voyager-bag', 'App\\Shop', 'App\\Policies\\ShopPolicy', 'App\\Http\\Controllers\\Admin\\ShopController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-19 12:15:37', '2020-02-19 12:16:25'),
(9, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', 'App\\Policies\\ProductPolicy', 'App\\Http\\Controllers\\Admin\\ProductController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-02-19 12:18:39', '2020-02-19 13:23:32'),
(10, 'coupons', 'coupons', 'Coupon', 'Coupons', NULL, 'App\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(13, 'transactions', 'transactions', 'Transaction', 'Transactions', NULL, 'App\\Transaction', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-15 13:02:27', '2020-08-15 13:36:32'),
(14, 'sub_orders', 'sub-orders', 'Sub Order', 'Sub Orders', NULL, 'App\\SubOrder', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-08-15 13:03:17', '2020-08-15 13:03:17');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-02-10 19:10:11', '2020-02-10 19:10:11');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-02-10 19:10:11', '2020-02-10 19:10:11', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-02-10 19:10:11', '2020-02-10 19:10:11', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-02-10 19:10:14', '2020-02-10 19:10:14', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-02-10 19:10:14', '2020-02-10 19:10:14', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-02-10 19:10:14', '2020-02-10 19:10:14', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-02-10 19:10:14', '2020-02-10 19:10:14', 'voyager.hooks', NULL),
(15, 1, 'Orders', '', '_self', 'voyager-buy', NULL, NULL, 15, '2020-02-10 19:22:34', '2020-02-10 19:22:34', 'voyager.orders.index', NULL),
(16, 1, 'Shops', '', '_self', 'voyager-shop', '#000000', NULL, 16, '2020-02-19 12:15:37', '2020-02-19 12:20:29', 'voyager.shops.index', 'null'),
(17, 1, 'Products', '', '_self', 'voyager-bag', '#000000', NULL, 17, '2020-02-19 12:18:39', '2020-02-19 12:20:44', 'voyager.products.index', 'null'),
(18, 1, 'Coupons', '', '_self', NULL, NULL, NULL, 18, '2020-04-04 04:11:42', '2020-04-04 04:11:42', 'voyager.coupons.index', NULL),
(19, 1, 'Order Management', '/seller/orders', '_self', 'voyager-boat', '#000000', NULL, 19, '2020-08-14 13:39:38', '2020-08-14 13:40:27', NULL, ''),
(20, 1, 'Transactions', '', '_self', NULL, NULL, NULL, 20, '2020-08-15 13:02:27', '2020-08-15 13:02:27', 'voyager.transactions.index', NULL),
(21, 1, 'Sub Orders', '', '_self', NULL, NULL, NULL, 21, '2020-08-15 13:03:17', '2020-08-15 13:03:17', 'voyager.sub-orders.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2020_02_01_064736_create_shops_table', 1),
(29, '2020_02_02_070326_create_products_table', 1),
(30, '2020_02_06_174602_create_orders_table', 1),
(31, '2020_02_06_181800_create_order_items_table', 1),
(32, '2020_03_14_095509_create_product_categories_table', 1),
(33, '2020_04_04_090325_create_coupons_table', 1),
(34, '2020_08_15_170110_create_sub_orders_table', 1),
(35, '2020_08_15_170139_create_sub_order_items_table', 1),
(36, '2020_08_15_175106_create_transactions_table', 1),
(37, '2020_10_31_170002_create_attributes_table', 1),
(38, '2020_10_31_170037_create_attribute_values_table', 1),
(39, '2020_10_31_170931_add_attribute_column_to_products_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `grand_total` double(8,2) NOT NULL,
  `item_count` int NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method` enum('cash_on_delivery','paypal','stripe','card') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash_on_delivery',
  `shipping_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-02-10 19:10:14', '2020-02-10 19:10:14');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(2, 'browse_bread', NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(3, 'browse_database', NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(4, 'browse_media', NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(5, 'browse_compass', NULL, '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(6, 'browse_menus', 'menus', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(7, 'read_menus', 'menus', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(8, 'edit_menus', 'menus', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(9, 'add_menus', 'menus', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(10, 'delete_menus', 'menus', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(11, 'browse_roles', 'roles', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(12, 'read_roles', 'roles', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(13, 'edit_roles', 'roles', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(14, 'add_roles', 'roles', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(15, 'delete_roles', 'roles', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(16, 'browse_users', 'users', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(17, 'read_users', 'users', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(18, 'edit_users', 'users', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(19, 'add_users', 'users', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(20, 'delete_users', 'users', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(21, 'browse_settings', 'settings', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(22, 'read_settings', 'settings', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(23, 'edit_settings', 'settings', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(24, 'add_settings', 'settings', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(25, 'delete_settings', 'settings', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(26, 'browse_categories', 'categories', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(27, 'read_categories', 'categories', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(28, 'edit_categories', 'categories', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(29, 'add_categories', 'categories', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(30, 'delete_categories', 'categories', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(31, 'browse_posts', 'posts', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(32, 'read_posts', 'posts', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(33, 'edit_posts', 'posts', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(34, 'add_posts', 'posts', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(35, 'delete_posts', 'posts', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(36, 'browse_pages', 'pages', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(37, 'read_pages', 'pages', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(38, 'edit_pages', 'pages', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(39, 'add_pages', 'pages', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(40, 'delete_pages', 'pages', '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(41, 'browse_hooks', NULL, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(42, 'browse_orders', 'orders', '2020-02-10 19:22:34', '2020-02-10 19:22:34'),
(43, 'read_orders', 'orders', '2020-02-10 19:22:34', '2020-02-10 19:22:34'),
(44, 'edit_orders', 'orders', '2020-02-10 19:22:34', '2020-02-10 19:22:34'),
(45, 'add_orders', 'orders', '2020-02-10 19:22:34', '2020-02-10 19:22:34'),
(46, 'delete_orders', 'orders', '2020-02-10 19:22:34', '2020-02-10 19:22:34'),
(47, 'browse_shops', 'shops', '2020-02-19 12:15:37', '2020-02-19 12:15:37'),
(48, 'read_shops', 'shops', '2020-02-19 12:15:37', '2020-02-19 12:15:37'),
(49, 'edit_shops', 'shops', '2020-02-19 12:15:37', '2020-02-19 12:15:37'),
(50, 'add_shops', 'shops', '2020-02-19 12:15:37', '2020-02-19 12:15:37'),
(51, 'delete_shops', 'shops', '2020-02-19 12:15:37', '2020-02-19 12:15:37'),
(52, 'browse_products', 'products', '2020-02-19 12:18:39', '2020-02-19 12:18:39'),
(53, 'read_products', 'products', '2020-02-19 12:18:39', '2020-02-19 12:18:39'),
(54, 'edit_products', 'products', '2020-02-19 12:18:39', '2020-02-19 12:18:39'),
(55, 'add_products', 'products', '2020-02-19 12:18:39', '2020-02-19 12:18:39'),
(56, 'delete_products', 'products', '2020-02-19 12:18:39', '2020-02-19 12:18:39'),
(57, 'browse_coupons', 'coupons', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(58, 'read_coupons', 'coupons', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(59, 'edit_coupons', 'coupons', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(60, 'add_coupons', 'coupons', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(61, 'delete_coupons', 'coupons', '2020-04-04 04:11:42', '2020-04-04 04:11:42'),
(62, 'browse_transactions', 'transactions', '2020-08-15 13:02:27', '2020-08-15 13:02:27'),
(63, 'read_transactions', 'transactions', '2020-08-15 13:02:27', '2020-08-15 13:02:27'),
(64, 'edit_transactions', 'transactions', '2020-08-15 13:02:27', '2020-08-15 13:02:27'),
(65, 'add_transactions', 'transactions', '2020-08-15 13:02:27', '2020-08-15 13:02:27'),
(66, 'delete_transactions', 'transactions', '2020-08-15 13:02:27', '2020-08-15 13:02:27'),
(67, 'browse_sub_orders', 'sub_orders', '2020-08-15 13:03:17', '2020-08-15 13:03:17'),
(68, 'read_sub_orders', 'sub_orders', '2020-08-15 13:03:17', '2020-08-15 13:03:17'),
(69, 'edit_sub_orders', 'sub_orders', '2020-08-15 13:03:17', '2020-08-15 13:03:17'),
(70, 'add_sub_orders', 'sub_orders', '2020-08-15 13:03:17', '2020-08-15 13:03:17'),
(71, 'delete_sub_orders', 'sub_orders', '2020-08-15 13:03:17', '2020-08-15 13:03:17');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(50, 3),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(55, 3),
(56, 1),
(56, 3),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n<h2>We can use all kinds of format!</h2>\n<p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-10 19:10:14', '2020-02-10 19:10:14'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-02-10 19:10:14', '2020-02-10 19:10:14');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_attributes` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `cover_img`, `shop_id`, `created_at`, `updated_at`, `product_attributes`) VALUES
(1, '17.3\" Ноутбук MSI GF75 9SCSR-453XRU черный', '[1920x1080, IPS, Intel Core i7 9750H, 6 х 2.6 ГГц, RAM 16 ГБ, SSD 512 ГБ, GeForce GTX 1650 Ti 4 Гб, Wi-Fi, DOS]', 1067.00, 'msi1.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(2, '17.3\" Ноутбук Lenovo IdeaPad 3 17ADA05 серый', '[1600x900, TN+film, AMD Athlon Silver 3050U, 2 х 2.3 ГГц, RAM 4 ГБ, SSD 256 ГБ, Radeon Vega 2 , Wi-Fi, DOS]', 467.00, 'lenovo.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(3, '15.6\" Ноутбук Lenovo IdeaPad 3 15IIL05 серый', '[1920x1080, IPS, Intel Core i3 1005G1, 2 х 1.2 ГГц, RAM 8 ГБ, SSD 256 ГБ, Intel UHD , Wi-Fi, DOS]', 533.00, 'lenove2.jpg\r\n', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(4, '15.6\" Ноутбук Lenovo Ideapad S145-15AST черный', '[1920x1080, TN+film, AMD A6 9225, 2 х 2.6 ГГц, RAM 4 ГБ, SSD 256 ГБ, Radeon R4 , Wi-Fi, Windows 10 Home]', 467.00, 'lenove1.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(5, '15.6\" Ультрабук Huawei MateBook D 15 BohL-WDQ9 серый', '[1920x1080, IPS, AMD Ryzen 5 4500U, 6 х 2.3 ГГц, RAM 8 ГБ, SSD 512 ГБ, Radeon Vega 6 , Wi-Fi, Windows 10 Home]', 799.00, 'huawei1.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(6, '14\" Ультрабук Huawei MateBook D 14 Nbl-WAQ9R серый', '[1920x1080, IPS, AMD Ryzen 5 3500U, 4 х 2.1 ГГц, RAM 8 ГБ, SSD 512 ГБ, Radeon Vega 8 , Wi-Fi, Windows 10 Home]', 693.00, 'huawei.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(7, '15.6\" Ноутбук HP 15s-eq0056ur серый', '[1920x1080, IPS, AMD Ryzen 5 3500U, 4 х 2.1 ГГц, RAM 8 ГБ, SSD 256 ГБ, Radeon Vega 8 , Wi-Fi, DOS]', 573.00, 'hp1.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(8, '17.3\" Ноутбук ASUS ROG Strix G GL731GT-H7118 черный', '[1920x1080, IPS, Intel Core i7 9750H, 6 х 2.6 ГГц, RAM 16 ГБ, SSD 512 ГБ, GeForce GTX 1650 4 Гб, Wi-Fi, BT, DOS]', 1199.00, 'asus4.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(9, '14\" Ноутбук ASUS ZenBook UM425IA-AM025 черный', '[1920x1080, IPS, AMD Ryzen 5 4500U, 6 х 2.3 ГГц, RAM 8 ГБ, SSD 256 ГБ, Radeon Vega 6 , Wi-Fi, DOS]', 667.00, 'asus3.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(10, '15.6\" Ноутбук ASUS Laptop F509FA-BR916T серебристый\r\n', '[1366x768, TN+film, Intel Pentium Gold 5405U, 2 х 2.3 ГГц, RAM 8 ГБ, SSD 256 ГБ, Intel UHD , Wi-Fi, Windows 10 Home]', 479.00, 'asus2.jpg', 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(11, '15.6\" Ноутбук ASUS Laptop K540BA-GQ613 черный\r\n', '[1366x768, TN+film, AMD A4 9125, 2 х 2.3 ГГц, RAM 4 ГБ, SSD 256 ГБ, Radeon R3 , Wi-Fi, BT, UNIX-подобная]', 387.00, 'asus.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(12, '13.3\" Ноутбук Apple MacBook Air (MQD32RU/A) серебристый\r\n', '[1440x900, TN+film, Intel Core i5, 2 х 1.8 ГГц, RAM 8 ГБ, SSD 128 ГБ, Intel HD 6000 , Wi-Fi, BT, macOS]', 999.00, 'apple1.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(13, '16\" Ноутбук Apple MacBook Pro Retina TB (MVVK2RU/A) серый\r\n', '[3072x1920, IPS, Intel Core i9, 8 х 2.3 ГГц, RAM 16 ГБ, SSD 1024 ГБ, Radeon Pro 5500M 4 Гб, Wi-Fi, macOS]', 3799.00, 'apple.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(14, '15.6\" Ноутбук Acer Aspire 3 A315-22-45S5 черный', '[1366x768, TN+film, AMD A4 9120e, 2 х 1.5 ГГц, RAM 8 ГБ, SSD 256 ГБ, Radeon R3 , Wi-Fi, Windows 10 Home]', 453.00, 'acer2.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(15, '15.6\" Ноутбук Acer Nitro 5 AN515-54-584Q черный\r\n', '[1920x1080, IPS, Intel Core i5 9300H, 4 х 2.4 ГГц, RAM 16 ГБ, SSD 512 ГБ, GeForce GTX 1650 4 Гб, Wi-Fi, Windows 10 Home]', 973.00, 'acer1.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(16, 'Пылесос Tefal ', 'Пылесос Tefal TW4886EA коричневый\r\n[550 Вт, уборка: сухая, пылесборник - контейнер, 2.5 л]', 133.00, 'tefal.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(17, 'Samsung VC4100 ', 'Пылесос Samsung VC4100 (SC15K4169HD) черный\r\n[1500 Вт, уборка: сухая, пылесборник - контейнер, 1.3 л].', 147.00, 'samsung.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(18, 'Пылесос EuroStek EVC-HJ05C коричневый\r\n', '[2600 Вт, уборка: сухая, пылесборник - контейнер, 3 л]', 69.00, 'eurostek.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(19, 'Пылесос Bosch BGS412000 синий\r\n', '[2000 Вт, уборка: сухая, пылесборник - контейнер]', 199.00, 'bosch.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(20, 'Пылесос MARTA MT-1362 синий\r\n', '[1800 Вт, уборка: сухая, пылесборник - контейнер, 2 л]', 47.00, 'marta.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(21, 'Пылесос Polaris PVC 1836 красный\r\n', '[1800 Вт, уборка: сухая, пылесборник - контейнер, 2.5 л]', 67.00, 'polaris.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(22, 'Пылесос Centek CT-2536 черный\r\n', '[2400 Вт, уборка: сухая, пылесборник - контейнер, 2 л]', 61.00, 'centek.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(23, 'Пылесос GiNZZU VS731 синий\r\n', '[2100 Вт, уборка: влажная, сухая, пылесборник - мешок/аквафильтр, 18 л]', 127.00, 'ginzzu.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(24, 'Пылесос Thomas Twin Puma черный\r\n', '[1600 Вт, уборка: влажная, сухая, пылесборник - контейнер, 6 л]', 173.00, 'thomas.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(25, 'Пылесос Thomas 788549 TWIN LEOPARD оранжевый\r\n', '[1600 Вт, уборка: влажная, сухая, пылесборник - мешок, 6 л]', 187.00, 'thomas1.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(26, 'Пылесос Thomas Twin Tiger оранжевый\r\n', '[1600 Вт, уборка: сухая, влажная, пылесборник - аквафильтр, 4 л]', 239.00, 'thomas2.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(27, 'Пылесос Bosch BWD41740 фиолетовый\r\n', '[1700 Вт, уборка: влажная, сухая, пылесборник - мешок/аквафильтр]', 223.00, 'bosch.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(28, 'Пылесос Sencor SVC 5001YL желтый\r\n', '[1600 Вт, уборка: влажная, сухая, пылесборник - аквафильтр]', 249.00, 'sencor.jpg', 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(29, 'Rem quisquam consequatur.', 'Consequuntur optio doloremque numquam inventore eaque nobis earum itaque possimus quas nobis aut quod illo consequatur praesentium incidunt id aut facilis laborum voluptatum.', 2761.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(30, 'Quas aut sit.', 'Recusandae error aliquid sunt aut corporis at quia ipsam sed aut quo est tempore nulla iste iste veniam temporibus vel inventore.', 3387.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(31, 'Esse ipsam.', 'Temporibus quod quis qui et at vero numquam est suscipit ut tempore inventore voluptatem.', 4727.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(32, 'Incidunt ipsum suscipit.', 'Nihil veritatis aliquam illum ab quia aperiam vel nihil ut architecto consequatur ipsum laboriosam aperiam in nihil necessitatibus et non impedit odio delectus atque ut molestias sed illo.', 1021.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(33, 'Eligendi tempore delectus.', 'Praesentium eum et alias aut nostrum et aut quis nihil similique quasi deleniti animi distinctio excepturi ullam tenetur id possimus iusto assumenda ut animi corrupti.', 3629.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(34, 'Dolorem est qui.', 'Qui quo modi eos harum explicabo voluptatem veritatis sed aliquid eius nulla aliquam quia dicta.', 120.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(35, 'Et id.', 'Est qui ex reprehenderit pariatur commodi consequatur repellendus qui possimus accusantium delectus debitis modi.', 1391.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(36, 'Iusto minus.', 'Explicabo dolorem quam repellendus saepe pariatur molestias ad dolor necessitatibus nisi eaque ullam culpa rem corrupti odio qui iste.', 1923.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(37, 'Veniam sint ipsa.', 'Molestias et corporis quasi maxime consequatur consequatur qui rem officia laborum voluptatum reiciendis sunt.', 4297.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(38, 'Aliquam id.', 'Eligendi reiciendis ex et sint provident voluptatem quos aut fugiat debitis aspernatur praesentium est est et placeat quae quia quidem accusantium sed ut et labore.', 541.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(39, 'Ab qui accusamus.', 'Ut dolorum assumenda voluptatem aperiam et consequatur debitis sint et ea et neque magni est ut et cum tempora.', 3066.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(40, 'Eum facere.', 'Nesciunt enim modi vitae id minus officiis voluptas quis omnis qui vero asperiores rerum pariatur sed.', 3212.00, NULL, 2, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(41, 'Eveniet exercitationem quasi.', 'Omnis temporibus rerum temporibus et odio aut et ut dolore neque consequatur sapiente voluptatum reprehenderit illum tempore maiores nihil iste et reiciendis dolorem quam dolorum fugit.', 2204.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(42, 'Vel saepe consectetur.', 'Recusandae quaerat ratione sit ratione et porro nihil sit ut dolorem id eveniet vel maiores consequuntur blanditiis officia rem eius.', 853.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(43, 'Aliquid minima ipsa.', 'Adipisci ipsam voluptates sed libero eos exercitationem modi cum sunt suscipit ipsam quae sed rerum qui mollitia blanditiis sequi repellendus doloribus dolores iusto non amet repellat et quaerat.', 2344.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(44, 'Suscipit minima nam.', 'Sint enim quos et voluptatem velit sed voluptates nihil sit eum a pariatur necessitatibus eius est mollitia distinctio odit necessitatibus.', 2628.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(45, 'Non iste quod.', 'Error debitis explicabo veniam in eveniet atque mollitia earum modi magnam qui voluptas enim qui iusto.', 341.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(46, 'Doloribus molestias.', 'Vel tempore aliquid aut quis corrupti possimus impedit aut et minima perspiciatis debitis.', 2983.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(47, 'Quibusdam animi tempora.', 'Corrupti repudiandae excepturi impedit ut culpa rerum quis ratione corporis fuga quibusdam et nisi neque sit commodi eos qui odit temporibus qui ex qui impedit perspiciatis.', 825.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(48, 'Porro illo.', 'Culpa voluptatibus hic autem fugit voluptatibus officia vel temporibus et dolorem repellat quo eum alias animi molestiae cum ut esse quia consequuntur quas.', 3384.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(49, 'Libero similique.', 'Odio et doloribus harum quidem eos accusantium ab amet dolor et nihil dignissimos reiciendis.', 107.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(50, 'Mollitia illo eos.', 'Totam nobis porro ab fugiat aliquam laudantium nesciunt voluptatibus consequatur quae quae qui possimus qui voluptatem amet fugiat.', 202.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(51, 'Exercitationem nihil voluptatem.', 'Qui nihil nisi minus quia dolor ea iste placeat repudiandae cumque sint numquam nesciunt dolor at.', 3094.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(52, 'Possimus non necessitatibus.', 'Enim excepturi esse corporis sit quaerat blanditiis odio aspernatur vero non iste esse temporibus nesciunt quia cumque vel cum quia est voluptas iusto non est et.', 868.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(53, 'Ut consequatur consequatur.', 'Temporibus consequuntur ut praesentium libero eum voluptas explicabo ab et sunt magni quam occaecati nostrum et beatae.', 2941.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(54, 'Ut harum.', 'Ullam sed exercitationem est rerum officia natus doloremque est est omnis atque voluptatem sunt earum saepe rerum voluptatem enim et repellendus ut odit labore incidunt nemo velit.', 444.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(55, 'Error cupiditate.', 'Excepturi error voluptatibus nemo et et saepe molestiae id doloribus tenetur cumque aut.', 162.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(56, 'Qui sint eveniet.', 'Doloribus quia beatae mollitia totam in quisquam qui rem totam porro sed occaecati.', 3753.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(57, 'Repellendus harum.', 'Voluptatem qui vel molestiae sint tenetur fuga doloremque explicabo labore qui quae aut voluptatem qui fuga ut quos dolorem quas ipsam illo pariatur qui corporis.', 2050.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(58, 'Et minima repellat.', 'Quia minima consequatur voluptatem asperiores voluptatem nesciunt repellat aliquid velit nemo repellat quidem eveniet officia voluptatibus.', 2225.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(59, 'Laboriosam non.', 'Omnis minima sapiente eligendi rerum temporibus aliquid sit id et dicta officia a voluptatem praesentium sed nulla sunt quo.', 1456.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(60, 'Neque aspernatur eum.', 'Magnam et suscipit qui autem qui architecto voluptate et qui id sed tenetur repellendus accusamus eos ducimus eos ea nobis quidem laudantium a eveniet a dolorum magnam.', 377.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(61, 'Eum enim voluptatem.', 'Eius qui velit fugiat repellat facere ut omnis non doloribus at dicta vel adipisci atque.', 2924.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(62, 'Quia consequatur nostrum.', 'Dolor ut commodi est et totam laboriosam ut dolorem sit ex et est aut voluptas vero quis voluptatem repudiandae voluptate molestias deleniti.', 2927.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(63, 'Enim architecto consequatur.', 'Atque nihil quia laudantium error excepturi vel ad autem rerum voluptatem id hic nisi.', 2184.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(64, 'Aut et.', 'Error alias amet et nam atque debitis labore et rerum iste ut rerum placeat asperiores tempora ducimus necessitatibus nihil a iure.', 4862.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(65, 'Magni officiis illo.', 'Libero optio reiciendis ab est doloremque deserunt cupiditate sapiente et quia id saepe tempora atque fugit maxime porro est dolorem aut omnis.', 1221.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(66, 'Nobis quia.', 'Ullam architecto commodi hic vero provident nulla sapiente incidunt ut nobis exercitationem et natus porro asperiores dolor quae ipsam est atque.', 3700.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(67, 'Quasi qui.', 'Sed dolores consequatur iste minus aut dolore minus neque fugit cupiditate consequatur vel aspernatur ut fuga dicta.', 3911.00, NULL, 1, '2021-01-05 14:28:51', '2021-01-05 14:28:51', 'null'),
(68, 'Fuga quia.', 'Eos officia repudiandae id voluptatem magni aut sint aut eum ex voluptatibus dignissimos non omnis hic ut reprehenderit.', 3284.00, NULL, 1, '2021-01-05 14:28:52', '2021-01-05 14:28:52', 'null'),
(69, 'Unde nam velit.', 'Aliquam quo nemo omnis et aliquid assumenda amet non impedit voluptatem fugit similique non explicabo.', 4490.00, NULL, 1, '2021-01-05 14:28:52', '2021-01-05 14:28:52', 'null'),
(70, 'Eos eius sit.', 'Tempore veniam suscipit quibusdam consequatur magnam ut et quas et a molestiae repudiandae dolorum rerum voluptas.', 3649.00, NULL, 1, '2021-01-05 14:28:52', '2021-01-05 14:28:52', 'null');

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 4, NULL, NULL),
(17, 17, 4, NULL, NULL),
(18, 18, 4, NULL, NULL),
(19, 19, 4, NULL, NULL),
(20, 20, 5, NULL, NULL),
(21, 21, 5, NULL, NULL),
(22, 22, 5, NULL, NULL),
(23, 23, 5, NULL, NULL),
(24, 24, 5, NULL, NULL),
(25, 25, 5, NULL, NULL),
(26, 26, 4, NULL, NULL),
(27, 27, 4, NULL, NULL),
(28, 28, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(2, 'user', 'Normal User', '2020-02-10 19:10:11', '2020-02-10 19:10:11'),
(3, 'seller', 'Seller', '2020-02-19 12:25:16', '2020-02-19 12:25:16');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `rating` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `shops`
--

INSERT INTO `shops` (`id`, `name`, `user_id`, `is_active`, `description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 'Quos quia.', 4, 1, 'Corrupti porro saepe veritatis eligendi quae quia et at corrupti dicta sed expedita nesciunt sit sed eos ut ut quas nobis occaecati ut sequi facere doloremque qui.', NULL, '2021-01-05 14:28:51', '2021-01-05 14:28:51'),
(2, 'Beatae et.', 5, 1, 'Nihil rem architecto necessitatibus earum eum cumque pariatur incidunt nihil non dolor dolores accusantium aut quo ipsam itaque provident laboriosam beatae et nihil amet consequatur sequi omnis vero.', NULL, '2021-01-05 14:28:51', '2021-01-05 14:28:51');

-- --------------------------------------------------------

--
-- Структура таблицы `sub_orders`
--

CREATE TABLE `sub_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `grand_total` double(8,2) NOT NULL,
  `item_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `sub_order_items`
--

CREATE TABLE `sub_order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sub_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `sub_order_id` bigint UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_paid` double(8,2) NOT NULL,
  `commission` double(8,2) NOT NULL,
  `status` enum('pending','processing','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@webmall.com', 'users/default.png', '2020-02-09 07:42:53', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EbrJUMkdZPGKaaZSnJsgooPS1gSl8R2zkX2FBCupEVZ4qnKLvvg3MGAdFROD', NULL, '2020-02-09 07:42:53', '2020-02-10 19:15:23'),
(2, 2, 'customer 1', 'customer@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, '{\"locale\":\"en\"}', '2020-02-10 19:16:34', '2020-02-19 12:25:45'),
(3, 2, 'customer 2', 'customer2@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-10 19:16:34', '2020-02-10 19:16:34'),
(4, 3, 'Seller 1', 'seller1@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-10 19:16:34', '2020-02-10 19:16:34'),
(5, 3, 'Seller 2', 'seller2@webmall.com', 'users/default.png', NULL, '$2y$10$xJacK/k89sSDbvDvqaMnC.KLEHOZr/YhqQMVSrvrTVhjggQgVhzpq', NULL, NULL, '2020-02-10 19:16:34', '2020-02-10 19:16:34'),
(6, 2, 'Serge', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$Bo4Tr4bXjxxMO1XnNzYe2eDc5tNYBtUcFyTRA3w.XFRsTYCGNZ/4O', NULL, NULL, '2021-01-05 15:19:42', '2021-01-05 15:19:42');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`);

--
-- Индексы таблицы `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shops_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_orders_order_id_foreign` (`order_id`),
  ADD KEY `sub_orders_seller_id_foreign` (`seller_id`);

--
-- Индексы таблицы `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_order_items_sub_order_id_foreign` (`sub_order_id`),
  ADD KEY `sub_order_items_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_sub_order_id_foreign` (`sub_order_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT для таблицы `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `sub_orders`
--
ALTER TABLE `sub_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sub_order_items`
--
ALTER TABLE `sub_order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `shops_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD CONSTRAINT `sub_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD CONSTRAINT `sub_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_order_items_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
