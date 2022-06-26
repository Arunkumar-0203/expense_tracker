-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2022 at 09:06 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `expense_tracker_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
`id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
`id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add custom', 7, 'add_custom'),
(26, 'Can change custom', 7, 'change_custom'),
(27, 'Can delete custom', 7, 'delete_custom'),
(28, 'Can view custom', 7, 'view_custom'),
(29, 'Can add expense', 8, 'add_expense'),
(30, 'Can change expense', 8, 'change_expense'),
(31, 'Can delete expense', 8, 'delete_expense'),
(32, 'Can view expense', 8, 'view_expense');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
`id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
`id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(7, 'expense_tracker_app', 'custom'),
(8, 'expense_tracker_app', 'expense'),
(6, 'expense_tracker_app', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
`id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-24 16:33:47.488156'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-06-24 16:33:47.673169'),
(3, 'auth', '0001_initial', '2022-06-24 16:33:48.342222'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-06-24 16:33:48.476232'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-06-24 16:33:48.497230'),
(6, 'auth', '0004_alter_user_username_opts', '2022-06-24 16:33:48.514236'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-06-24 16:33:48.535234'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-06-24 16:33:48.543235'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-06-24 16:33:48.559237'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-06-24 16:33:48.578261'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-06-24 16:33:48.596240'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-06-24 16:33:48.694247'),
(13, 'auth', '0011_update_proxy_permissions', '2022-06-24 16:33:48.720248'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-06-24 16:33:48.739250'),
(15, 'expense_tracker_app', '0001_initial', '2022-06-24 16:33:50.106352'),
(16, 'admin', '0001_initial', '2022-06-24 16:33:50.430378'),
(17, 'admin', '0002_logentry_remove_auto_add', '2022-06-24 16:33:50.455381'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-24 16:33:50.479380'),
(19, 'sessions', '0001_initial', '2022-06-24 16:33:50.617397'),
(20, 'expense_tracker_app', '0002_alter_expense_custom', '2022-06-24 16:54:30.726374'),
(21, 'expense_tracker_app', '0003_alter_custom_custom_key', '2022-06-24 17:19:01.224817'),
(22, 'expense_tracker_app', '0004_alter_expense_categorys', '2022-06-24 18:01:07.929032');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense_tracker_app_custom`
--

CREATE TABLE IF NOT EXISTS `expense_tracker_app_custom` (
`id` bigint(20) NOT NULL,
  `CUSTOM_type` varchar(100) DEFAULT NULL,
  `CUSTOM_KEY` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `expense_tracker_app_custom`
--

INSERT INTO `expense_tracker_app_custom` (`id`, `CUSTOM_type`, `CUSTOM_KEY`) VALUES
(3, 'trip_munnar', 'YUI3WR'),
(4, 'trip_kochi', '7HFAL0');

-- --------------------------------------------------------

--
-- Table structure for table `expense_tracker_app_expense`
--

CREATE TABLE IF NOT EXISTS `expense_tracker_app_expense` (
`id` bigint(20) NOT NULL,
  `categorys` varchar(200) DEFAULT NULL,
  `currencies` varchar(200) NOT NULL,
  `expense_amount` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `Custom_id` bigint(20) DEFAULT NULL,
  `userId_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `expense_tracker_app_expense`
--

INSERT INTO `expense_tracker_app_expense` (`id`, `categorys`, `currencies`, `expense_amount`, `date`, `Custom_id`, `userId_id`) VALUES
(1, 'Food', 'USD', 500, '2022-06-24 16:54:48.452961', NULL, 1),
(2, 'Food', 'BGN', 500, '2022-06-24 16:56:00.139129', NULL, 1),
(3, 'Travel', 'INR', 500, '2022-06-24 16:56:16.863953', NULL, 1),
(6, 'Travel', 'INR', 500, '2022-06-24 16:58:07.263074', NULL, 2),
(7, 'Food', 'USD', 500, '2022-06-24 16:58:56.685754', NULL, 2),
(10, 'Other', 'USD', 500, '2022-06-24 18:10:07.250685', 3, 1),
(11, 'Other', 'INR', 500, '2022-06-24 18:12:23.261758', 4, 2),
(12, 'Other', 'INR', 500, '2022-06-24 18:27:07.311067', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `expense_tracker_app_user`
--

CREATE TABLE IF NOT EXISTS `expense_tracker_app_user` (
`id` bigint(20) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `expense_tracker_app_user`
--

INSERT INTO `expense_tracker_app_user` (`id`, `last_login`, `is_superuser`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `username`, `password`, `firstName`, `phone`, `date`, `email`, `location`, `address`) VALUES
(1, NULL, 0, '', '', 0, 1, '2022-06-24 16:34:13.105203', 'arun', 'pbkdf2_sha256$260000$2lmAzkVOfcyBSXA05pYqaW$Tnl0nbYZ5vsNx5RjE/VcD/YouRbKmFylIsRo3rGSPuQ=', 'kumar', '9061970203', '2022-06-24', 'kumar@gmail.com', 'malapuram', 'aaaaa'),
(2, NULL, 0, '', '', 0, 1, '2022-06-24 16:35:37.587433', 'arun12345', 'pbkdf2_sha256$260000$zk8pLEqu0nTYtH03ftfZ2c$Epc/ECZNG9gjhGmhS0sOMC0mDkOnoWvxJr9IvzIgZp4=', 'kumar', '9061970201', '2022-06-24', 'kumar@gmail.com', 'malapuram', 'aaaaa'),
(3, NULL, 0, '', '', 0, 1, '2022-06-24 16:35:50.279273', 'arun12346', 'pbkdf2_sha256$260000$vDrIRSIXcHmxjcp5mQdeaV$TOqUxQ4I8cO3uRsUyEFb7ttBo94sSQn2CjhnYZy45w8=', 'kumar', '9061970202', '2022-06-24', 'kumar@gmail.com', 'malapuram', 'aaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `expense_tracker_app_user_groups`
--

CREATE TABLE IF NOT EXISTS `expense_tracker_app_user_groups` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `expense_tracker_app_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `expense_tracker_app_user_user_permissions` (
`id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`), ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
 ADD PRIMARY KEY (`id`), ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`), ADD KEY `django_admin_log_user_id_c564eba6_fk_expense_tracker_app_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
 ADD PRIMARY KEY (`session_key`), ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `expense_tracker_app_custom`
--
ALTER TABLE `expense_tracker_app_custom`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `CUSTOM_KEY` (`CUSTOM_KEY`);

--
-- Indexes for table `expense_tracker_app_expense`
--
ALTER TABLE `expense_tracker_app_expense`
 ADD PRIMARY KEY (`id`), ADD KEY `expense_tracker_app__userId_id_f95df3b2_fk_expense_t` (`userId_id`), ADD KEY `expense_tracker_app__Custom_id_d3e26619_fk_expense_t` (`Custom_id`);

--
-- Indexes for table `expense_tracker_app_user`
--
ALTER TABLE `expense_tracker_app_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `expense_tracker_app_user_groups`
--
ALTER TABLE `expense_tracker_app_user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `expense_tracker_app_user_groups_user_id_group_id_7e3e2024_uniq` (`user_id`,`group_id`), ADD KEY `expense_tracker_app__group_id_0cc722f5_fk_auth_grou` (`group_id`);

--
-- Indexes for table `expense_tracker_app_user_user_permissions`
--
ALTER TABLE `expense_tracker_app_user_user_permissions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `expense_tracker_app_user_user_id_permission_id_3858f70b_uniq` (`user_id`,`permission_id`), ADD KEY `expense_tracker_app__permission_id_7f6ac3c5_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `expense_tracker_app_custom`
--
ALTER TABLE `expense_tracker_app_custom`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `expense_tracker_app_expense`
--
ALTER TABLE `expense_tracker_app_expense`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `expense_tracker_app_user`
--
ALTER TABLE `expense_tracker_app_user`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `expense_tracker_app_user_groups`
--
ALTER TABLE `expense_tracker_app_user_groups`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `expense_tracker_app_user_user_permissions`
--
ALTER TABLE `expense_tracker_app_user_user_permissions`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_expense_tracker_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `expense_tracker_app_user` (`id`);

--
-- Constraints for table `expense_tracker_app_expense`
--
ALTER TABLE `expense_tracker_app_expense`
ADD CONSTRAINT `expense_tracker_app__Custom_id_d3e26619_fk_expense_t` FOREIGN KEY (`Custom_id`) REFERENCES `expense_tracker_app_custom` (`id`),
ADD CONSTRAINT `expense_tracker_app__userId_id_f95df3b2_fk_expense_t` FOREIGN KEY (`userId_id`) REFERENCES `expense_tracker_app_user` (`id`);

--
-- Constraints for table `expense_tracker_app_user_groups`
--
ALTER TABLE `expense_tracker_app_user_groups`
ADD CONSTRAINT `expense_tracker_app__group_id_0cc722f5_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
ADD CONSTRAINT `expense_tracker_app__user_id_cf5645bc_fk_expense_t` FOREIGN KEY (`user_id`) REFERENCES `expense_tracker_app_user` (`id`);

--
-- Constraints for table `expense_tracker_app_user_user_permissions`
--
ALTER TABLE `expense_tracker_app_user_user_permissions`
ADD CONSTRAINT `expense_tracker_app__permission_id_7f6ac3c5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
ADD CONSTRAINT `expense_tracker_app__user_id_f8ff0051_fk_expense_t` FOREIGN KEY (`user_id`) REFERENCES `expense_tracker_app_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
