-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 09 2021 г., 00:02
-- Версия сервера: 10.4.12-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `web_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_created` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `time_updated` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `article_status` int(11) NOT NULL DEFAULT 0,
  `comments_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`article_id`, `title`, `description`, `content`, `time_created`, `created_by`, `time_updated`, `updated_by`, `article_status`, `comments_status`) VALUES
(1, 'addfdsf', 'sdfsdfdsf', '<p>dsfsadfj sfdsf dsf dsfds fsd fsdf dsf</p>', '2021-02-07 15:34:52', 2, '2021-02-07 15:35:21', NULL, 1, 1),
(2, 'ssdfdsfdsf', 'gfsdfsdfsdhkadfhkdsj', '<p>ljasdfkd</p>', '2021-02-08 19:40:23', 1, '2021-02-08 19:40:44', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `object_type_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`file_id`, `object_type_id`, `object_id`, `name`, `mime_type`) VALUES
(1, 2, 1, 'картинка к статье №1', NULL),
(2, 1111, 2222, 'ffff', NULL),
(3, 2, 2, 'картинка к статье №2', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1612701600),
('m151104_211037_create_users_table', 1612701602),
('m151105_225806_rbac_init', 1612701604),
('m151121_201645_create_news_table', 1612701604),
('m151127_155030_create_articles_table', 1612701604),
('m151128_210416_create_comments_table', 1612701605),
('m151129_130102_create_tags_table', 1612701605),
('m151129_130202_create_tags_list_table', 1612701605),
('m151130_150753_add_foreign_key_on_article_comments_table', 1612701605),
('m151210_210139_create_products_table', 1612701606),
('m151210_213302_create_product_brands_table', 1612701606),
('m151210_213722_create_product_attributes_table', 1612701606),
('m151210_214059_create_product_attributes_list_table', 1612701607),
('m151210_214151_create_product_attributes_categories_table', 1612701608),
('m151210_214415_create_product_categories_list_table', 1612701608),
('m151210_221047_create_product_categories_table', 1612701609),
('m151210_222107_create_product_images_table', 1612701609),
('m151211_090747_create_orders_table', 1612701609),
('m151211_091359_create_order_details_table', 1612701610),
('m151215_223052_create_titles_table', 1612701610),
('m160424_193437_filling_the_tables_with_test_data', 1612701617),
('m160605_192718_create_files_table', 1612701617),
('m210208_202046_add_position_column_to_users_table', 1612815861);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_created` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `time_updated` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `news_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`news_id`, `user_id`, `title`, `description`, `content`, `time_created`, `created_by`, `time_updated`, `updated_by`, `news_status`) VALUES
(1, 1, 'віававі', 'цуавіавіаіва', '<p>івавіававіавіавіаіа</p>\r\n', '2021-02-07 16:30:05', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `entered_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `total_sum` float NOT NULL,
  `time_ordered` timestamp NULL DEFAULT NULL,
  `client_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `entered_name`, `user_phone_number`, `status`, `total_sum`, `time_ordered`, `client_comment`, `manager_comment`) VALUES
(1, NULL, 'Никонор Евлампиевич', '+38 (111) 111-11-11', 0, 275, NULL, 'Хочу скидку 100%', 'Да, конечно');

-- --------------------------------------------------------

--
-- Структура таблицы `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `status`, `price`) VALUES
(1, 2, 1, 0, 239),
(1, 3, 1, 0, 17),
(3, 3, 2, 0, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `article` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `price` float DEFAULT NULL,
  `special_price` float DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `time_created` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `time_updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `brand_id`, `category_id`, `sku`, `article`, `title`, `description`, `status`, `price`, `special_price`, `created_by`, `time_created`, `updated_by`, `time_updated`) VALUES
(1, 7, 14, 'D&C 205-7', 'А654', 'Тапки', 'Непромокаемые и несносные', 1, 648, 149, 1, NULL, NULL, NULL),
(2, 1, 14, 'ВЧ8765', 'А747', 'Насос', 'Качать-не перекачать', 1, 1400, 239, 1, NULL, NULL, NULL),
(3, 5, 14, 'P502', 'А123', 'Коннектор', 'Коннектинг пиплов', 1, 55, 17, 1, NULL, NULL, NULL),
(4, 5, 14, 'P507', 'А155', 'Сальник', 'Самый сальник в мире', 1, 73, 19, 1, NULL, NULL, NULL),
(5, 1, 8, 'P507', 'А155', 'Мыльница из эко-стекла', 'Прозрачная в ассортименте', 0, 772, 143, 1, NULL, NULL, NULL),
(6, 1, 11, 'vbb', 'uuyui', 'nazva', '', 1, 100, 120, 1, '2021-02-07 12:47:40', 1, '2021-02-07 14:56:38'),
(7, 17, 13, '', '', 'рпро', 'па', 1, 1234, 123, 1, '2021-02-07 16:33:13', 1, NULL),
(8, 1, 1, '', '', 'ииь', 'іва', 1, 131231, 123, 1, '2021-02-07 16:34:29', 1, NULL),
(9, 1, 1, '', '', 'иол', '', 0, NULL, 88, 2, '2021-02-07 17:20:21', 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_attributes`
--

CREATE TABLE `product_attributes` (
  `attribute_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_attributes`
--

INSERT INTO `product_attributes` (`attribute_id`, `attribute_name`, `unit`) VALUES
(1, 'масса', 'кг'),
(2, 'диагональ', 'см'),
(3, 'объем памяти', 'Гб'),
(4, 'объем', 'л'),
(5, 'цвет', '--'),
(6, 'материал корпуса', '--'),
(7, 'hf', 'nn'),
(8, 'мооммитмтмтти', 'цц');

-- --------------------------------------------------------

--
-- Структура таблицы `product_attributes_categories`
--

CREATE TABLE `product_attributes_categories` (
  `attribute_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_attributes_categories`
--

INSERT INTO `product_attributes_categories` (`attribute_id`, `category_id`, `order`) VALUES
(1, 14, 3),
(2, 11, 1),
(2, 13, 2),
(2, 14, 2),
(3, 14, 1),
(4, 8, 1),
(5, 11, 2),
(5, 13, 1),
(6, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_attributes_list`
--

CREATE TABLE `product_attributes_list` (
  `attribute_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_attributes_list`
--

INSERT INTO `product_attributes_list` (`attribute_id`, `product_id`, `value`) VALUES
(1, 1, '0,2'),
(1, 2, '9'),
(1, 3, '0,01'),
(1, 4, '0,3'),
(2, 1, '27'),
(2, 2, '15'),
(2, 3, 'отсутствует'),
(2, 4, 'любая'),
(2, 6, '125'),
(3, 1, 'безграничный'),
(3, 2, 'глубинный'),
(3, 3, '1000'),
(3, 4, 'жирный'),
(4, 5, '0,2'),
(5, 6, 'blu green'),
(6, 8, 'рммм');

-- --------------------------------------------------------

--
-- Структура таблицы `product_brands`
--

CREATE TABLE `product_brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_brands`
--

INSERT INTO `product_brands` (`brand_id`, `brand_name`, `logo_url`, `discount`) VALUES
(1, 'Сунь-Хунь-В-Чай', NULL, 87),
(2, 'Reebosch', NULL, NULL),
(5, 'Pear', NULL, 12),
(7, 'Dolce & Kaballach', NULL, 5),
(12, 'Nenovo', NULL, 49),
(17, 'United Colors of Balakleya', NULL, 49),
(18, 'туц', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `product_categories_list`
--

CREATE TABLE `product_categories_list` (
  `category_id` int(11) NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `quantity_visible` int(11) NOT NULL DEFAULT 0,
  `quantity_invisible` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_categories_list`
--

INSERT INTO `product_categories_list` (`category_id`, `parent_category_id`, `name`, `discount`, `quantity_visible`, `quantity_invisible`) VALUES
(1, 0, 'Малогабаритная мебель', NULL, 2, 2),
(2, 0, 'Для дома Для семьи', NULL, 0, 0),
(3, 0, 'Недетские игрушки', NULL, 1, 0),
(4, 0, 'Разное', NULL, 4, 0),
(5, 2, 'Электродыроколы и пневмостеплеры', NULL, 0, 0),
(6, 2, 'Сербско-монгольские словари', NULL, 0, 0),
(7, 2, 'Клизмы', NULL, 0, 0),
(8, 1, 'Мыльницы', NULL, 0, 1),
(9, 3, 'Надувные шарфики', NULL, 0, 0),
(10, 3, 'Дверные виброзвонки', NULL, 0, 0),
(11, 3, 'Пароиммитаторы', NULL, 1, 0),
(12, 1, 'Вафельницы', NULL, 0, 0),
(13, 1, 'Пепельницы', NULL, 1, 0),
(14, 4, 'Всякое', NULL, 4, 0),
(15, 14, 'Кое-что еще', NULL, 0, 0),
(16, 15, 'Не понятно что', NULL, 0, 0),
(18, 4, 'Какое-то не такое', NULL, 0, 0),
(19, 0, 'new Category Test', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `auth_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(11) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `is_active`, `auth_key`, `access_token`, `created_date`, `first_name`, `last_name`, `phone_number`, `email`, `role`) VALUES
(1, 'admin', '$2y$10$SgAI4r.LYcSL/l8GoXvuMOGeLMV2MC0FgjFPQYxJgQB2bq8Yi1t1e', 1, NULL, NULL, NULL, 'Админ', 'Админов', '+38 (111) 111-11-11', 'admin@admin.com', 1),
(2, 'user', '$2y$10$M8u8bqX7Wjl.9UMyC./OneJuo2QFOPCCUiVDSRViBN8Vz3CfG28Q6', 1, NULL, NULL, NULL, 'Юзер', 'Юзеровский', '+38 (222) 222-22-22', 'user@user.ru', 2);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`article_id`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `product_attributes_categories`
--
ALTER TABLE `product_attributes_categories`
  ADD PRIMARY KEY (`attribute_id`,`category_id`);

--
-- Индексы таблицы `product_attributes_list`
--
ALTER TABLE `product_attributes_list`
  ADD PRIMARY KEY (`attribute_id`,`product_id`);

--
-- Индексы таблицы `product_brands`
--
ALTER TABLE `product_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Индексы таблицы `product_categories_list`
--
ALTER TABLE `product_categories_list`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `product_brands`
--
ALTER TABLE `product_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `product_categories_list`
--
ALTER TABLE `product_categories_list`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
