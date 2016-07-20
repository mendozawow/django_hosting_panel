/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_3306
Source Server Version : 50630
Source Host           : 127.0.0.1:3306
Source Database       : hosting_panel

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2016-07-19 16:23:56
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE IF NOT EXISTS hosting_panel;

USE hosting_panel;

-- ----------------------------
-- Table structure for `apachevhost`
-- ----------------------------
DROP TABLE IF EXISTS `apachevhost`;
CREATE TABLE `apachevhost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverName` varchar(128) NOT NULL,
  `documentRoot` varchar(256) NOT NULL,
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serverName` (`serverName`) USING BTREE,
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of apachevhost
-- ----------------------------
INSERT INTO `apachevhost` VALUES ('1', 'ext', '/var/www/macher.com.ar/', '1');
INSERT INTO `apachevhost` VALUES ('2', 'localhost', '/var/www/', '1');
INSERT INTO `apachevhost` VALUES ('3', 'macher.com.ar', '/var/www/laravel/laravel-with-admin-lte/public/', '1');
INSERT INTO `apachevhost` VALUES ('4', 'test.macher.com.ar', '/var/www/macher.com.ar/var/www/macher.com.ar/html', '1');
INSERT INTO `apachevhost` VALUES ('5', 'source.macher.com.ar', '/var/www/macher.com.ar/codiad/', '1');
INSERT INTO `apachevhost` VALUES ('13', 'suitemendoza.com.ar', '/var/www/suitemendoza.com.ar/', '15');
INSERT INTO `apachevhost` VALUES ('14', 'matera.macher.com.ar', '/var/www/macher.com.ar/matera/', '1');
INSERT INTO `apachevhost` VALUES ('15', 'testing.macher.com.ar', '/var/www/macher.com.ar/testing/', '1');
INSERT INTO `apachevhost` VALUES ('16', 'musse.macher.com.ar', '/var/www/macher.com.ar/musse/', '1');
INSERT INTO `apachevhost` VALUES ('17', 'neg.macher.com.ar', '/var/www/macher.com.ar/neg/', '1');

-- ----------------------------
-- Table structure for `authtoken_token`
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8_bin NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add Token', '7', 'add_token');
INSERT INTO `auth_permission` VALUES ('20', 'Can change Token', '7', 'change_token');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete Token', '7', 'delete_token');
INSERT INTO `auth_permission` VALUES ('22', 'Can add domains', '8', 'add_domains');
INSERT INTO `auth_permission` VALUES ('23', 'Can change domains', '8', 'change_domains');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete domains', '8', 'delete_domains');
INSERT INTO `auth_permission` VALUES ('25', 'Can add records', '9', 'add_records');
INSERT INTO `auth_permission` VALUES ('26', 'Can change records', '9', 'change_records');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete records', '9', 'delete_records');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_bin NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(254) COLLATE utf8_bin NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$24000$ckRZECx9ErXQ$pMugIt00Xe0APUknUTjXB4f8ccZs0y+0UYm+Z3wkZw4=', '2016-07-18 18:25:06.641619', '1', 'admin', '', '', 'pablo.dtorres@gmail.com', '1', '1', '2016-07-13 21:28:30.251635');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$24000$CuNTViKzUJux$HVcX4/I0viTZSRQi17t2qCh/SN8jrJvzGX817iYJBhE=', null, '0', 'test', 'Testing', 'User', 'test@test.com', '0', '1', '2016-07-15 14:36:03.000000');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `cryptokeys`
-- ----------------------------
DROP TABLE IF EXISTS `cryptokeys`;
CREATE TABLE `cryptokeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `flags` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `domainidindex` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cryptokeys
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_bin,
  `object_repr` varchar(200) COLLATE utf8_bin NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_bin NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2016-07-15 14:36:03.594132', 0x32, 'test', '1', 0x41646465642E, '4', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2016-07-15 14:36:21.196595', 0x32, 'test', '2', 0x4368616E6765642066697273745F6E616D652C206C6173745F6E616D6520616E6420656D61696C2E, '4', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_bin NOT NULL,
  `model` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('7', 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('8', 'domains', 'domains');
INSERT INTO `django_content_type` VALUES ('9', 'domains', 'records');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-07-13 21:07:57.365795');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2016-07-13 21:07:57.699139');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2016-07-13 21:07:57.785272');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2016-07-13 21:07:57.798262');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2016-07-13 21:07:57.862400');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2016-07-13 21:07:57.895580');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2016-07-13 21:07:57.930935');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2016-07-13 21:07:57.939643');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2016-07-13 21:07:57.970335');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2016-07-13 21:07:57.973050');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2016-07-13 21:07:57.980477');
INSERT INTO `django_migrations` VALUES ('12', 'authtoken', '0001_initial', '2016-07-13 21:07:58.028193');
INSERT INTO `django_migrations` VALUES ('13', 'authtoken', '0002_auto_20160226_1747', '2016-07-13 21:07:58.097749');
INSERT INTO `django_migrations` VALUES ('14', 'domains', '0001_initial', '2016-07-13 21:07:58.102735');
INSERT INTO `django_migrations` VALUES ('15', 'sessions', '0001_initial', '2016-07-13 21:07:58.134879');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_bin NOT NULL,
  `session_data` longtext COLLATE utf8_bin NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('m5h0d4z5gc1erciob4xslf1zmy0vc2jw', 0x4D4755785A5441324E6A51304D6A686B4E474D33597A4A6C5A4468695A445A6A5A6D5931597A526A5954426A4D446B314E7A67784E7A7037496C39686458526F5833567A5A584A666147467A61434936496A41784D7A5532597A646959546B7A4D5459324F546B7A597A4E69596D566C5A5451334D4441354F47597A596D4A684D4463314E3255694C434A6659585630614639316332567958324A685932746C626D51694F694A6B616D46755A3238755932397564484A70596935686458526F4C6D4A685932746C626D527A4C6B31765A475673516D466A613256755A434973496C39686458526F5833567A5A584A66615751694F694978496E303D, '2016-08-01 18:25:06.645671');

-- ----------------------------
-- Table structure for `domainmetadata`
-- ----------------------------
DROP TABLE IF EXISTS `domainmetadata`;
CREATE TABLE `domainmetadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) NOT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `domainmetadata_idx` (`domain_id`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of domainmetadata
-- ----------------------------

-- ----------------------------
-- Table structure for `domains`
-- ----------------------------
DROP TABLE IF EXISTS `domains`;
CREATE TABLE `domains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `master` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `last_check` int(11) DEFAULT NULL,
  `type` varchar(6) COLLATE utf8_bin DEFAULT NULL,
  `notified_serial` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`),
  KEY `fk_domains_1_idx` (`user_id`),
  CONSTRAINT `domains_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of domains
-- ----------------------------
INSERT INTO `domains` VALUES ('1', 'macher.com.ar', null, null, null, null, '1', '1');
INSERT INTO `domains` VALUES ('2', 'localhost', null, null, null, null, '1', '1');
INSERT INTO `domains` VALUES ('3', 'localhost.localdomain', null, null, null, null, '1', '1');
INSERT INTO `domains` VALUES ('4', 'test.com', null, null, null, null, '2', '1');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `postfix_aliases`
-- ----------------------------
DROP TABLE IF EXISTS `postfix_aliases`;
CREATE TABLE `postfix_aliases` (
  `pkid` smallint(3) NOT NULL AUTO_INCREMENT,
  `mail` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '',
  `destination` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of postfix_aliases
-- ----------------------------
INSERT INTO `postfix_aliases` VALUES ('1', 'postmaster@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('2', 'sysadmin@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('3', 'webmaster@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('4', 'abuse@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('5', 'root@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('6', '@localhost', 'root@localhost', '1');
INSERT INTO `postfix_aliases` VALUES ('7', '@localhost.localdomain', '@localhost', '1');

-- ----------------------------
-- Table structure for `postfix_users`
-- ----------------------------
DROP TABLE IF EXISTS `postfix_users`;
CREATE TABLE `postfix_users` (
  `id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `uid` smallint(5) unsigned NOT NULL DEFAULT '5000',
  `gid` smallint(5) unsigned NOT NULL DEFAULT '5000',
  `home` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '/var/spool/mail/virtual',
  `maildir` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'blah/',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `change_password` tinyint(1) NOT NULL DEFAULT '0',
  `clear` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `crypt` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT 'V2VkIE9jdCAyOSAxMzo1MD',
  `quota` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of postfix_users
-- ----------------------------
INSERT INTO `postfix_users` VALUES ('pablo.torres@macher.com.ar', 'pablo.torres', '5000', '5000', '/var/spool/mail/virtual', 'pablo.torres@macher.com.ar/', '1', '0', '', '$5$9dde9bc1edc9b471$XmI8z4CRT6edYpFWXUgVTaYRbCq4JlgNzPLGJUPQkZ2', '', '1');
INSERT INTO `postfix_users` VALUES ('postmaster@macher.com.ar', 'postmaster', '5000', '5000', '/var/spool/mail/virtual', 'postmaster@macher.com.ar/', '1', '0', '', '$5$9dde9bc1edc9b471$XmI8z4CRT6edYpFWXUgVTaYRbCq4JlgNzPLGJUPQkZ2', '', '1');
INSERT INTO `postfix_users` VALUES ('ratuso@macher.com.ar', 'ratuso', '5000', '5000', '/var/spool/mail/virtual', 'ratuso@macher.com.ar/', '1', '0', '', '$5$9bc270aee0e5bd27$XC/S6ajw13o6FP.fne97iUjtn4fCRDUCbe6RDbOwZm4', '', '1');
INSERT INTO `postfix_users` VALUES ('root', 'root', '5000', '5000', '/var/spool/mail/virtual', 'root/', '1', '0', '', '$5$a83113c049c513a2$c8Gb8msrDQRwrpOQWZvCxwIkpYeaiv20..D3ZoWOHF3', '', '0');

-- ----------------------------
-- Table structure for `records`
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `content` mediumtext COLLATE utf8_bin,
  `ttl` int(11) DEFAULT NULL,
  `prio` int(11) DEFAULT NULL,
  `change_date` int(11) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `ordername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `auth` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `nametype_index` (`name`,`type`),
  KEY `domain_id` (`domain_id`),
  KEY `recordorder` (`domain_id`,`ordername`),
  CONSTRAINT `fk_records_1` FOREIGN KEY (`domain_id`) REFERENCES `domains` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES ('1', '1', 'macher.com.ar', 'SOA', 0x6D61636865722E636F6D2E61722E20706F73746D61737465722E6D61636865722E636F6D2E61722E20312033363030203630302038363430302033363030, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('2', '1', 'macher.com.ar', 'A', 0x35342E3233322E3235342E3534, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('3', '1', 'test.macher.com.ar', 'A', 0x3139302E31352E3231352E323439, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('4', '1', 'macher.com.ar', 'MX', 0x6D61696C2E6D61636865722E636F6D2E6172, '120', '10', '0', '0', null, '1');
INSERT INTO `records` VALUES ('5', '1', 'mail.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('6', '1', 'imap.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('7', '1', 'smtp.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('36', '1', 'matera.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('37', '1', 'testing.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('38', '1', 'musse.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('39', '1', 'neg.macher.com.ar', 'CNAME', 0x6D61636865722E636F6D2E6172, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('40', '2', '1.test.com', 'A', 0x35342E3233322E3235342E3534, '120', '0', '0', '0', null, '1');
INSERT INTO `records` VALUES ('56', '1', 'dodo.macher.com.ar', 'AAAA', 0x323030313A306462383A383561333A303030303A303030303A386132653A303337303A37333334, '120', '0', '0', '0', null, '1');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `updated_at` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', 'System Administrator', '1970-01-01 00:00:01', '1970-01-01 00:00:01');
INSERT INTO `roles` VALUES ('2', 'user', 'User', 'User', '1970-01-01 00:00:01', '1970-01-01 00:00:01');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1');
INSERT INTO `role_user` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `supermasters`
-- ----------------------------
DROP TABLE IF EXISTS `supermasters`;
CREATE TABLE `supermasters` (
  `ip` varchar(64) COLLATE utf8_bin NOT NULL,
  `nameserver` varchar(255) COLLATE utf8_bin NOT NULL,
  `account` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ip`,`nameserver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of supermasters
-- ----------------------------

-- ----------------------------
-- Table structure for `tsigkeys`
-- ----------------------------
DROP TABLE IF EXISTS `tsigkeys`;
CREATE TABLE `tsigkeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `algorithm` varchar(50) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namealgoindex` (`name`,`algorithm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tsigkeys
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google2fa_secret` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  `updated_at` timestamp NOT NULL DEFAULT '1970-01-01 00:00:01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Pablo Torres', 'pablo.dtorres@gmail.com', '$2y$10$BeQwIWXxqEfkIUdtCGYmee5/Vwdx.o41Z/RpYsK656s4XIpknGRYi', 'Jc9SdSblXcftWgq7ZlhylPEpYS6txVsEvc86eZWhJuY91lLKLxBsYmKMaBlI', '', '2015-11-06 15:53:43', '2016-07-08 20:55:56');
INSERT INTO `users` VALUES ('2', 'test', 'test@test.com', '$2y$10$Y0Jzcj42lUvhsxhOR4cgdumBTL722OLYO7dtelb6KPZdzDCx5364O', 'mVZm20rB7JdXuK8YdBkUWkKIA5cPLqhCYELmP9TUNFzLGxEriN2VcDTSZXlr', null, '2015-12-04 19:58:28', '2016-07-08 20:54:14');
INSERT INTO `users` VALUES ('3', 'Diego Navarro', 'navarrow@gmail.com', '$2y$10$4cKe7t2GqUw8LKadM4U6NeJbkSfbj78tDbuj16PUbqfcuV4zhJgVu', 'Zw22LnPinszVW2Ux9xonY8RCIOfYNOhRWwPzNJ71GP0fNXi61s96wp0hxF6E', 'PVQOYBNEWGIECZLM', '2015-12-10 14:09:42', '2016-07-08 20:55:15');

-- ----------------------------
-- Table structure for `vsftp_accounts`
-- ----------------------------
DROP TABLE IF EXISTS `vsftp_accounts`;
CREATE TABLE `vsftp_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_bin NOT NULL,
  `pass` varchar(50) COLLATE utf8_bin NOT NULL,
  `domain_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of vsftp_accounts
-- ----------------------------
INSERT INTO `vsftp_accounts` VALUES ('1', 'macher.com.ar', '*3ED78B468D46C55E943AAAD4D9D00BF2D4AE8594', '1');
INSERT INTO `vsftp_accounts` VALUES ('7', 'suitemendoza.com.ar', '*ABBCDC83AC4BEC074D48ABD710E7D4757E19BE15', '15');
