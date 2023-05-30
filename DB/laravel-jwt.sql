-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 07:10 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-jwt`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(4, '2023_04_03_172517_create_todo_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `todo_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `docs` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`todo_id`, `title`, `docs`, `image`, `created_at`, `updated_at`) VALUES
(1, 'number 1 title', 'docs num 1', NULL, '2023-04-03 18:00:00', '2023-04-28 18:00:00'),
(3, 'Todo Title 2', 'Todo Docs text 2', NULL, '2023-04-28 18:00:00', '2023-04-28 18:00:00'),
(4, 'This is Update D', 'This is Update Docs This is Update DataTitle', NULL, '2023-04-30 18:00:00', '2023-04-30 18:00:00'),
(8, 'this is name', 'this is name  2', NULL, '2023-05-29 18:00:00', '2023-05-29 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Anupam Talukdar', 'anupam1', 'anupam@gmail.com', NULL, '$2y$10$UqarkuiSI34fDp8US.7mlu1vXx2Th.XqOu.tOb3ux7geHKK41K8eK', NULL, '2023-03-30 03:24:49', '2023-03-30 03:24:49'),
(2, 'sdfsfs', 'anupam2', 'sdfsdfds@gmail.com', NULL, '$2y$10$I36CKGyuJzSasUIM9vzKyuHrPuDza4PsBUfNPAHUntPmvyfyksefa', NULL, '2023-04-02 15:11:36', '2023-04-02 15:11:36'),
(3, 'anupam2', NULL, 'asd@gmail.com', NULL, '$2y$10$rc8jkkrZ3DopspxdzkSKC.idsYc19cURIOUxKbkV5aAdxKPywobhi', NULL, '2023-04-03 14:27:58', '2023-04-03 14:27:58'),
(4, 'Anupam3', NULL, 'anupam3@gmail.com', NULL, '$2y$10$FDnL7hs3VKkQQFOVOUfBGuNNxms7t3fBk48hBhe/xDrYZqc3M/NTq', NULL, '2023-04-03 14:31:49', '2023-04-03 14:31:49'),
(5, 'Anupam5 Talukdar', NULL, 'anupam5@gmail.com', NULL, '$2y$10$gHlP2JqPP/v6mux3gRU.WOXejYcLZr/bNMHsH3VzLW5TlMCYmJOLy', NULL, '2023-04-03 22:16:31', '2023-04-03 22:16:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`todo_id`);

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `todo_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
