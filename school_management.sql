-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2023 at 12:37 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_employee_salaries`
--

CREATE TABLE `account_employee_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_employee_salaries`
--

INSERT INTO `account_employee_salaries` (`id`, `employee_id`, `date`, `amount`, `created_at`, `updated_at`) VALUES
(1, 18, '2023-08', 1200, '2023-08-17 05:35:09', '2023-08-17 05:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `account_other_costs`
--

CREATE TABLE `account_other_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_other_costs`
--

INSERT INTO `account_other_costs` (`id`, `date`, `amount`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, '2023-08-17', 600, 'Book Shelves', '2023081708571969 Dodge Charger RT.png', '2023-08-17 05:57:30', '2023-08-17 05:57:30');

-- --------------------------------------------------------

--
-- Table structure for table `account_student_fees`
--

CREATE TABLE `account_student_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assign_students`
--

CREATE TABLE `assign_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'user_id=student_id',
  `role` int(11) DEFAULT NULL,
  `class_id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `shift_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_students`
--

INSERT INTO `assign_students` (`id`, `student_id`, `role`, `class_id`, `year_id`, `group_id`, `shift_id`, `created_at`, `updated_at`) VALUES
(5, 14, 1, 3, 1, 1, 5, '2023-06-13 05:02:12', '2023-06-14 08:22:26'),
(6, 15, 2, 4, 1, 1, 5, '2023-06-13 05:16:04', '2023-06-14 07:27:25'),
(7, 16, NULL, 3, 1, 1, 5, '2023-08-09 06:47:41', '2023-08-09 06:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `assign_subjects`
--

CREATE TABLE `assign_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `full_mark` double NOT NULL,
  `pass_mark` double NOT NULL,
  `subjective_mark` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assign_subjects`
--

INSERT INTO `assign_subjects` (`id`, `class_id`, `subject_id`, `full_mark`, `pass_mark`, `subjective_mark`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 100, 50, 100, '2023-02-16 11:22:33', '2023-02-16 11:22:33'),
(2, 3, 2, 90, 50, 100, '2023-02-16 11:22:33', '2023-02-16 11:22:33'),
(3, 4, 4, 80, 33, 80, '2023-02-16 12:47:00', '2023-02-16 12:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Head Teacher', '2023-06-07 05:57:46', '2023-06-07 05:57:46'),
(5, 'Assistant Teacher', '2023-06-07 05:57:57', '2023-06-07 05:57:57'),
(6, 'Teacher', '2023-06-07 05:58:06', '2023-06-07 05:58:06');

-- --------------------------------------------------------

--
-- Table structure for table `discount_students`
--

CREATE TABLE `discount_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assign_student_id` int(11) NOT NULL,
  `fee_category_id` int(11) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_students`
--

INSERT INTO `discount_students` (`id`, `assign_student_id`, `fee_category_id`, `discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, '2023-06-08 08:30:41', '2023-06-13 04:50:16'),
(2, 2, 1, 10, '2023-06-08 08:32:17', '2023-06-08 08:32:17'),
(3, 3, 1, 10, '2023-06-08 08:44:08', '2023-06-08 08:44:08'),
(4, 4, 1, 10, '2023-06-08 08:45:32', '2023-06-08 08:45:32'),
(5, 5, 1, 20, '2023-06-08 08:46:31', '2023-06-15 06:18:38'),
(6, 6, 1, 0, '2023-06-12 04:37:49', '2023-06-13 09:07:23'),
(7, 1, 1, 10, '2023-06-12 10:39:50', '2023-06-12 10:39:50'),
(8, 2, 1, 10, '2023-06-12 11:36:56', '2023-06-12 11:36:56'),
(9, 3, 1, 10, '2023-06-13 04:48:00', '2023-06-13 04:48:00'),
(10, 4, 1, 0, '2023-06-13 04:55:23', '2023-06-13 04:55:23'),
(11, 5, 1, 0, '2023-06-13 05:02:12', '2023-06-13 05:02:12'),
(12, 6, 1, 0, '2023-06-13 05:16:04', '2023-06-13 05:16:04'),
(13, 7, 1, 10, '2023-08-09 06:47:41', '2023-08-09 06:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `date` date NOT NULL,
  `attend_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_attendances`
--

INSERT INTO `employee_attendances` (`id`, `employee_id`, `date`, `attend_status`, `created_at`, `updated_at`) VALUES
(1, 18, '2023-08-24', 'Present', '2023-08-16 09:45:00', '2023-08-16 09:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leaves`
--

CREATE TABLE `employee_leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=user_id',
  `leave_purpose_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_sallary_logs`
--

CREATE TABLE `employee_sallary_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` int(11) NOT NULL COMMENT 'employee_id=User_id',
  `previous_salary` int(11) DEFAULT NULL,
  `present_salary` int(11) DEFAULT NULL,
  `increment_salary` int(11) DEFAULT NULL,
  `effected_salary` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_sallary_logs`
--

INSERT INTO `employee_sallary_logs` (`id`, `employee_id`, `previous_salary`, `present_salary`, `increment_salary`, `effected_salary`, `created_at`, `updated_at`) VALUES
(1, 18, 1200, 1200, 0, '2023-09-01', '2023-08-16 09:01:21', '2023-08-16 09:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `exam_types`
--

CREATE TABLE `exam_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exam_types`
--

INSERT INTO `exam_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '1st Terminal Exam', '2023-02-16 10:20:59', '2023-02-16 10:20:59'),
(2, '2nd Terminal Exam', '2023-02-16 10:21:47', '2023-02-16 10:21:47'),
(4, '3rd Terminal Exam', '2023-02-16 10:23:00', '2023-02-16 10:23:00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fee_amounts`
--

CREATE TABLE `fee_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_amounts`
--

INSERT INTO `fee_amounts` (`id`, `fee_category_id`, `class_id`, `amount`, `created_at`, `updated_at`) VALUES
(5, 4, 6, 150, '2023-02-16 08:22:07', '2023-02-16 08:22:07'),
(6, 4, 3, 111, '2023-02-16 08:22:07', '2023-02-16 08:22:07'),
(9, 1, 3, 120, '2023-02-16 08:52:26', '2023-02-16 08:52:26'),
(10, 1, 5, 130, '2023-02-16 08:52:26', '2023-02-16 08:52:26'),
(11, 2, 3, 100, '2023-02-16 08:52:41', '2023-02-16 08:52:41'),
(12, 2, 4, 90, '2023-02-16 08:52:41', '2023-02-16 08:52:41');

-- --------------------------------------------------------

--
-- Table structure for table `fee_categories`
--

CREATE TABLE `fee_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_categories`
--

INSERT INTO `fee_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Registration Fee', '2023-02-15 07:56:02', '2023-02-15 07:56:02'),
(2, 'Monthly Fee', '2023-02-15 09:05:00', '2023-02-15 09:05:00'),
(4, 'Exam Fee', '2023-02-15 09:10:35', '2023-02-15 09:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `fee_category_amounts`
--

CREATE TABLE `fee_category_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fee_category_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fee_category_amounts`
--

INSERT INTO `fee_category_amounts` (`id`, `fee_category_id`, `class_id`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 300, NULL, NULL),
(2, 2, 3, 300, NULL, NULL),
(3, 2, 4, 400, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_purposes`
--

CREATE TABLE `leave_purposes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_purposes`
--

INSERT INTO `leave_purposes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Family Problem', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marks_grades`
--

CREATE TABLE `marks_grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `grade_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_marks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_marks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks_grades`
--

INSERT INTO `marks_grades` (`id`, `grade_name`, `grade_point`, `start_marks`, `end_marks`, `start_point`, `end_point`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 'A+', '5.00', '90', '100', '5.00', '5.00', 'Excellent', '2023-08-16 10:41:51', '2023-08-16 10:43:04');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_11_19_202339_create_sessions_table', 1),
(8, '2022_11_24_124334_create_student_classes_table', 3),
(9, '2023_02_14_120359_student_years', 4),
(10, '2023_02_15_083647_create_student_groups_table', 5),
(11, '2023_02_15_090957_create_student_shifts_table', 6),
(12, '2023_02_15_093811_create_fee_categories_table', 7),
(13, '2023_02_15_113258_create_fee_amounts_table', 8),
(14, '2023_02_16_113702_create_exam_types_table', 9),
(15, '2023_02_16_124808_create_school_subjects_table', 10),
(16, '2023_02_16_130809_create_assign_subjects_table', 11),
(17, '2023_06_06_105153_create_designations_table', 12),
(18, '2014_10_12_000000_create_users_table', 13),
(19, '2023_06_07_115749_create_assign_students_table', 14),
(20, '2023_06_07_120325_create_discount_students_table', 14),
(21, '2023_06_14_135607_create_fee_category_amounts_table', 15),
(22, '2023_08_16_103658_create_employee_sallary_logs_table', 16),
(23, '2023_08_16_122910_create_leave_purposes_table', 17),
(24, '2023_08_16_122940_create_employee_leaves_table', 17),
(25, '2023_08_16_124240_create_employee_attendances_table', 18),
(26, '2023_08_16_131230_create_student_marks_table', 19),
(27, '2023_08_16_131316_create_marks_grades_table', 19),
(28, '2023_08_17_081233_create_account_student_fees_table', 20),
(29, '2023_08_17_083233_create_account_employee_salaries_table', 21),
(30, '2023_08_17_085204_create_account_other_costs_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_subjects`
--

CREATE TABLE `school_subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_subjects`
--

INSERT INTO `school_subjects` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Health', '2023-02-16 10:53:53', '2023-02-16 10:53:53'),
(2, 'English', '2023-02-16 10:54:03', '2023-02-16 10:54:03'),
(4, 'Hindi', '2023-02-16 11:20:24', '2023-02-16 11:20:24'),
(5, 'Math', '2023-02-16 11:20:52', '2023-02-16 11:20:52');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('unsOHhNQhzvtclTz50nzRW3CoAIcFrJhb34nKe0o', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMzNsWnV2NXhIM0NKVnB3bjlKaFMwa3JRanZMTXpnVzZTSG81Tmk4biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFRuWXdXUmtLMWVzV240elNPTEJVaHVIME1mTm9sUkpvRDE5TVRWbFZFRFNDMTZpeTdTVnFTIjt9', 1692268622);

-- --------------------------------------------------------

--
-- Table structure for table `student_classes`
--

CREATE TABLE `student_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_classes`
--

INSERT INTO `student_classes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Class One', '2023-02-08 10:04:02', '2023-02-16 11:18:31'),
(4, 'Class Two', '2023-02-14 09:55:41', '2023-02-16 11:18:43'),
(5, 'Class Three', '2023-02-14 09:55:52', '2023-02-16 11:18:53'),
(6, 'Class Four', '2023-02-14 09:56:02', '2023-02-16 11:19:06'),
(7, 'Class Five', '2023-02-16 11:19:18', '2023-02-16 11:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `student_groups`
--

CREATE TABLE `student_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_groups`
--

INSERT INTO `student_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Arts', '2023-02-15 06:59:59', '2023-02-15 07:02:15'),
(2, 'Science', '2023-02-15 07:02:30', '2023-02-15 07:02:30'),
(3, 'Health', '2023-02-15 07:02:53', '2023-02-15 07:02:53');

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE `student_marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL COMMENT 'student_id=user_id',
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `assign_subject_id` int(11) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `marks` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_marks`
--

INSERT INTO `student_marks` (`id`, `student_id`, `id_no`, `year_id`, `class_id`, `assign_subject_id`, `exam_type_id`, `marks`, `created_at`, `updated_at`) VALUES
(3, 14, '20180011', 1, 3, 1, 1, 9, '2023-08-16 10:27:42', '2023-08-16 10:27:42'),
(4, 16, '20180016', 1, 3, 1, 1, 9, '2023-08-16 10:27:42', '2023-08-16 10:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `student_shifts`
--

CREATE TABLE `student_shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_shifts`
--

INSERT INTO `student_shifts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Shift A', '2023-02-15 07:27:03', '2023-02-15 07:28:24'),
(6, 'Shift B', '2023-02-15 07:28:37', '2023-02-15 07:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `student_years`
--

CREATE TABLE `student_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_years`
--

INSERT INTO `student_years` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '2018', NULL, NULL),
(2, '2019', NULL, NULL),
(3, '2020', NULL, NULL),
(4, '2021', NULL, NULL),
(5, '2022', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Student, Employee, Admin',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin=head of software, operator, computer operator, user=employee',
  `join_date` date DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive, 1=active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `usertype`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `address`, `gender`, `image`, `fname`, `mname`, `religion`, `id_no`, `dob`, `code`, `role`, `join_date`, `designation_id`, `salary`, `status`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin', 'tiucrs@gmail.com', NULL, '$2y$10$TnYwWRkK1esWn4zSOLBUhuH0MfNolRJoD19MTVlVEDSC16iy7SVqS', '0731127828', 'Str. Izvorul Oltului, nr. 6', NULL, '202211201841316156825_5808676965845647_1046647615246060235_n.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(5, 'Admin', 'OperatorUser', 'operator.user@gmail.com', NULL, '$2y$10$KwoPV4N5mWxvBKjSZu9sK.DQtr1bbxwPtDGHSGcMdb2tmAaJ.sgkW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8587', 'operator', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-06-07 09:46:05', '2023-06-07 09:51:47'),
(10, 'Student', 'Popescu Ion', NULL, NULL, '$2y$10$9J44BoFoExq1qQNbgkxA4uvGWh5.DrRo9jYuQ88sQKG/bERKret7q', '0788999444', 'strada Tineretului', 'Male', '202306081146screencapture-file-Users-Miru-Downloads-a-cool-shiny-hover-effect-button-dentacool-LP-index-html-2023-04-21-16_27_06.png', 'George', 'Alina', 'Christan', '20180001', '1992-02-05', '928', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-06-08 08:46:31', '2023-06-08 08:46:31'),
(14, 'Student', 'Tiu George Cristian', NULL, NULL, '$2y$10$AiGITYs5Nh0kUI3gtJ2ZluFEELXlT0Mym15dP3hlEJN51AsPTRhri', '0731127828', 'Aleea Teisani 292', 'Male', '202306130802about_img.png', 'Tiu Laurentiu', 'Tiu Cati', 'Christan', '20180011', '1992-02-05', '2471', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-06-13 05:02:12', '2023-06-13 05:03:44'),
(15, 'Student', 'Popescu Ion', NULL, NULL, '$2y$10$okBQNVNywSI7VGW3vMH.gus7x8wpipHraijqoMLIPMvxbBwbPX23i', '0799999999', 'tineretului', 'Male', '202306130816awards_02.png', 'Popescu Jon', 'Popescu Mom', 'Hindu', '20180015', '1995-05-05', '6400', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-06-13 05:16:04', '2023-06-13 05:16:04'),
(16, 'Student', 'Test Student', NULL, NULL, '$2y$10$G2eDkpKFER0OyhR8ayNr7OXR8xve5eFKErbdWJTnCRil.2XSo6YAa', '0722333444', 'ioajsdaoidjaoidjaodij', 'Male', '202308090947Dodge Charger.png', 'Test Father', 'Test Mother', 'Islam', '20180016', '1992-02-05', '5229', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2023-08-09 06:47:41', '2023-08-09 06:47:41'),
(18, 'employee', 'Employee Johnn', NULL, NULL, '$2y$10$4WcUhfZxZiYnF87p6SB9fehKhsg39BDT.1LBMILu6vLQ7Z8qeWRsq', '0744444444', 'Str Tineretului', 'Male', '2023081612011969 Dodge Charger RT.png', 'Employee Father', 'Employee Mother', 'Christan', '2023090001', '1992-02-05', '6442', NULL, '2023-09-01', 6, 1200, 1, NULL, NULL, NULL, '2023-08-16 09:01:21', '2023-08-16 09:05:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_students`
--
ALTER TABLE `assign_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `discount_students`
--
ALTER TABLE `discount_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_types`
--
ALTER TABLE `exam_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `exam_types_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fee_amounts`
--
ALTER TABLE `fee_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fee_categories`
--
ALTER TABLE `fee_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_categories_name_unique` (`name`);

--
-- Indexes for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leave_purposes_name_unique` (`name`);

--
-- Indexes for table `marks_grades`
--
ALTER TABLE `marks_grades`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `school_subjects`
--
ALTER TABLE `school_subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_subjects_name_unique` (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `student_classes`
--
ALTER TABLE `student_classes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_classes_name_unique` (`name`);

--
-- Indexes for table `student_groups`
--
ALTER TABLE `student_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_groups_name_unique` (`name`);

--
-- Indexes for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_shifts`
--
ALTER TABLE `student_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_shifts_name_unique` (`name`);

--
-- Indexes for table `student_years`
--
ALTER TABLE `student_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_years_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_employee_salaries`
--
ALTER TABLE `account_employee_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_other_costs`
--
ALTER TABLE `account_other_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `account_student_fees`
--
ALTER TABLE `account_student_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assign_students`
--
ALTER TABLE `assign_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assign_subjects`
--
ALTER TABLE `assign_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discount_students`
--
ALTER TABLE `discount_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_leaves`
--
ALTER TABLE `employee_leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_sallary_logs`
--
ALTER TABLE `employee_sallary_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exam_types`
--
ALTER TABLE `exam_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_amounts`
--
ALTER TABLE `fee_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fee_categories`
--
ALTER TABLE `fee_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fee_category_amounts`
--
ALTER TABLE `fee_category_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_purposes`
--
ALTER TABLE `leave_purposes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marks_grades`
--
ALTER TABLE `marks_grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_subjects`
--
ALTER TABLE `school_subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_classes`
--
ALTER TABLE `student_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `student_groups`
--
ALTER TABLE `student_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_marks`
--
ALTER TABLE `student_marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_shifts`
--
ALTER TABLE `student_shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student_years`
--
ALTER TABLE `student_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
