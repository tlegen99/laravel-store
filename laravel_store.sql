-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 01 2021 г., 20:48
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel_store`
--

-- --------------------------------------------------------

--
-- Структура таблицы `lara_categories`
--

CREATE TABLE `lara_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `lara_categories`
--

INSERT INTO `lara_categories` (`id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Phones', 'phones', 'В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.', 'categories.jpg', NULL, NULL),
(2, 'Cameras', 'cameras', 'В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.', 'avds_large.jpg', NULL, NULL),
(3, 'Laptops', 'laptops', 'В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн.', 'categories.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lara_failed_jobs`
--

CREATE TABLE `lara_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lara_migrations`
--

CREATE TABLE `lara_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `lara_migrations`
--

INSERT INTO `lara_migrations` (`id`, `migration`, `batch`) VALUES
(14, '2014_10_12_000000_create_users_table', 1),
(15, '2014_10_12_100000_create_password_resets_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2021_07_27_185725_create_products_table', 1),
(18, '2021_07_27_192345_add_new_price_column_in_products_table', 1),
(19, '2021_07_28_091644_create_product_images_table', 1),
(20, '2021_07_28_101415_add_column_show_home_in_products_table', 1),
(26, '2021_07_28_164649_create_categories_table', 2),
(27, '2021_07_29_160226_add_category_id_to_products_table', 3),
(28, '2021_07_29_165709_add_column_slug_to_products_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `lara_password_resets`
--

CREATE TABLE `lara_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `lara_products`
--

CREATE TABLE `lara_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `new_price` double(8,2) DEFAULT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `show_home` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `lara_products`
--

INSERT INTO `lara_products` (`id`, `title`, `price`, `new_price`, `in_stock`, `description`, `show_home`, `created_at`, `updated_at`, `category_id`, `slug`) VALUES
(1, 'Product 1', 1186.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 1, ''),
(2, 'Product 1.5', 821.00, 321.00, 0, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 2, ''),
(3, 'Product 2', 479.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 3, ''),
(4, 'Product 3', 547.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 1, ''),
(5, 'Product 4', 216.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 3, ''),
(6, 'Product 5', 1236.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 2, ''),
(7, 'Product 6', 1108.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 1, ''),
(8, 'Product 7', 341.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 2, ''),
(9, 'Product 8', 1390.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 3, ''),
(10, 'Product 9', 1358.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 1, ''),
(11, 'Product 10', 753.00, NULL, 1, 'Lorem Ipsum - это текст-\"рыба\", часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной \"рыбой\" для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов.', 1, NULL, NULL, 2, '');

-- --------------------------------------------------------

--
-- Структура таблицы `lara_product_images`
--

CREATE TABLE `lara_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `lara_product_images`
--

INSERT INTO `lara_product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'details_1.jpg', 1, NULL, NULL),
(2, 'details_2.jpg', 1, NULL, NULL),
(3, 'details_3.jpg', 1, NULL, NULL),
(4, 'details_4.jpg', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lara_users`
--

CREATE TABLE `lara_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `lara_categories`
--
ALTER TABLE `lara_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lara_failed_jobs`
--
ALTER TABLE `lara_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lara_failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `lara_migrations`
--
ALTER TABLE `lara_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lara_password_resets`
--
ALTER TABLE `lara_password_resets`
  ADD KEY `lara_password_resets_email_index` (`email`);

--
-- Индексы таблицы `lara_products`
--
ALTER TABLE `lara_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lara_products_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `lara_product_images`
--
ALTER TABLE `lara_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lara_product_images_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `lara_users`
--
ALTER TABLE `lara_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lara_users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `lara_categories`
--
ALTER TABLE `lara_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `lara_failed_jobs`
--
ALTER TABLE `lara_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `lara_migrations`
--
ALTER TABLE `lara_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `lara_products`
--
ALTER TABLE `lara_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `lara_product_images`
--
ALTER TABLE `lara_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `lara_users`
--
ALTER TABLE `lara_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `lara_products`
--
ALTER TABLE `lara_products`
  ADD CONSTRAINT `lara_products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `lara_categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lara_product_images`
--
ALTER TABLE `lara_product_images`
  ADD CONSTRAINT `lara_product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lara_products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
