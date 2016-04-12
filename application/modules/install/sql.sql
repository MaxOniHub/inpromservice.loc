-- phpMyAdmin SQL Dump
-- version 4.1.2deb0ubuntu1ppa1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Час створення: Гру 30 2013 р., 14:12
-- Версія сервера: 5.5.34-0ubuntu0.13.04.1
-- Версія PHP: 5.4.23-1+sury.org~raring+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База даних: `test`
--

-- --------------------------------------------------------

--
-- Структура таблиці `answer_notifications`
--

DROP TABLE IF EXISTS `answer_notifications`;
CREATE TABLE IF NOT EXISTS `answer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Дамп даних таблиці `answer_notifications`
--

INSERT INTO `answer_notifications` (`id`, `locale`, `name`, `message`) VALUES
(1, 'ua', 'incoming', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(2, 'ua', 'callback', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(3, 'ua', 'order', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(4, 'ru', 'incoming', '<h1>Спасибо</h1>\r\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>'),
(5, 'ru', 'callback', '<h1>Спасибо</h1>\r\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>'),
(6, 'ru', 'order', '<h1>Спасибо</h1>\r\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>');

-- --------------------------------------------------------

--
-- Структура таблиці `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `position` mediumint(5) NOT NULL DEFAULT '0',
  `name` varchar(160) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_desc` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `fetch_pages` text NOT NULL,
  `main_tpl` varchar(50) NOT NULL,
  `tpl` varchar(50) DEFAULT NULL,
  `page_tpl` varchar(50) DEFAULT NULL,
  `per_page` smallint(5) NOT NULL,
  `order_by` varchar(25) NOT NULL,
  `sort_order` varchar(25) NOT NULL,
  `comments_default` tinyint(1) NOT NULL DEFAULT '0',
  `field_group` int(11) NOT NULL,
  `category_field_group` int(11) NOT NULL,
  `settings` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `url` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Дамп даних таблиці `category`
--

INSERT INTO `category` (`id`, `parent_id`, `position`, `name`, `title`, `short_desc`, `url`, `image`, `keywords`, `description`, `fetch_pages`, `main_tpl`, `tpl`, `page_tpl`, `per_page`, `order_by`, `sort_order`, `comments_default`, `field_group`, `category_field_group`, `settings`) VALUES
(69, 0, 1, 'Новости', '', '', 'novosti', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 0, 13, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}');

-- --------------------------------------------------------

--
-- Структура таблиці `category_translate`
--

DROP TABLE IF EXISTS `category_translate`;
CREATE TABLE IF NOT EXISTS `category_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alias` int(11) NOT NULL,
  `name` varchar(160) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_desc` text,
  `image` varchar(250) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `lang` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Структура таблиці `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(25) NOT NULL DEFAULT 'core',
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_site` varchar(250) NOT NULL,
  `item_id` bigint(11) NOT NULL,
  `text` text,
  `date` int(11) NOT NULL,
  `status` smallint(1) NOT NULL,
  `agent` varchar(250) NOT NULL,
  `user_ip` varchar(64) NOT NULL,
  `rate` int(11) NOT NULL,
  `text_plus` varchar(500) DEFAULT NULL,
  `text_minus` varchar(500) DEFAULT NULL,
  `like` int(11) NOT NULL,
  `disslike` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module` (`module`),
  KEY `item_id` (`item_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Дамп даних таблиці `comments`
--

INSERT INTO `comments` (`id`, `module`, `user_id`, `user_name`, `user_mail`, `user_site`, `item_id`, `text`, `date`, `status`, `agent`, `user_ip`, `rate`, `text_plus`, `text_minus`, `like`, `disslike`, `parent`) VALUES
(25, 'shop', 1, 'Петр', 'go@gmail.com', '', 108, 'Отличный выбор!', 1296950400, 0, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.7 (KHTML, like Gecko) Chrome/16.0.912.77 Safari/535.7', '127.0.0.2', 0, '', '', 0, 0, NULL),
(66, 'shop', 1, 'Микола', 'hi@hello.com', '', 71, 'Телик плохой -цвета выгоревшие если смотреть сбоку или сверху картинка в тумане .', 1302134400, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(69, 'shop', 1, 'Микола', 'hi@hello.com', '', 78, 'Он обычные не лицензионные диски воспроизводит?', 1304726400, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(72, 'shop', 1, 'roman', 'hh@f.com', '', 82, 'Мучаюсь в подборе очень хорошего медиаплеера ( цена до 3 тыс) чтобы читал практически все форматы в том числе и с выдиокамер запись высокой четкости Качество картинки отменное должно быть считывал с флеш и жесткого диска читал диски Bli-Ray ,наличие сетевых интерфейсов вайфай и интернета и т д Одним словом чтобы данная модель была из новинок и была еще актуальной лет 5 Прошу дать профессиональную подбоку данного товара За ранее спасибо', 1307059200, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(73, 'shop', 1, 'Степа', 'w@go.com', '', 83, 'Купил пару месяцев назат доволен как слон работает как часы))<br/>Плюсы: Работоспособность 100% во всех аспектах<br/>Минусы: Не увидел', 1304726400, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, 'Работоспособность 100% во всех аспектах', 'Не увидел', 0, 0, 0),
(74, 'shop', 1, 'Иван', 't@com.com', '', 79, 'Купил пару месяцев назат доволен как слон работает как часы))', 1311638400, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(75, 'shop', 1, 'Иван', 't@com.com', '', 87, 'Купил пару месяцев назат доволен как слон работает как часы))', 1304380800, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, 'Работоспособность 100% во всех аспектах', '', 0, 0, 0),
(76, 'shop', 1, 'Оксана', 'oksana@mail.ru', '', 89, 'а у меня че-то флешку не принимает.... светиться надпись пионер на экране и все...может из-за того, что флешка на 16Гб? кто-то может подсказать в чем прблема?', 1310083200, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(77, 'shop', 1, 'Игор Петрович', 'kalmar@gmail.com', '', 115, 'Покупайте! Отличный выбор', 1314057600, 1, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(78, 'shop', 1, 'Игор Петрович', 'kalmar@gmail.com', '', 123, 'Покупайте! Отличный выбор', 1303516800, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(79, 'shop', 1, 'Василий Пупкин', 'vasil.pypkin@mail.ru', '', 105, 'Купил пару месяцев назат доволен как слон работает как часы))', 1296777600, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, 'Работоспособность 100% во всех аспектах', '', 0, 0, 0),
(80, 'shop', 1, 'Василий Пупкин', 'vasil.pypkin@mail.ru', '', 107, 'Купил 2 дня юзаю все в норме', 1305417600, 0, 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11', '127.0.0.1', 0, '', '', 0, 0, 0),
(83, 'shop', 48, 'Administrator', 'ad@min.com', '', 190, 'Купила это чудо техники на прошлой неделе. Пользуясь вторую неделю минусов не нашла, в основном все нравится - быстрый и удобный, сравниваю с 710.\r<br/>\r<br/>Фоточехол - действительно тема, очень практично и действительно удобней фотографировать с ним.', 1387480883, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '127.0.0.1', 4, '', '', 1, 0, 0),
(84, 'shop', 48, 'Administrator', 'ad@min.com', '', 190, 'Никого не слушайте на сегодняшний день лучшее из того что на мировом рынке предлагают производители камерофонов, обязательно надо докупать камеру грип (там дополнительная батарея да и держать удобней), привезли как подарок из США, жду теперь когда поступит в продажу у нас чтоб поменять второй...', 1387480905, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '127.0.0.1', 5, '', '', 0, 1, 0),
(85, 'shop', 48, 'Administrator', 'ad@min.com', '', 190, 'У самого Lumia 925. Мне даже страшно представить качество фотографий на 1020. Аппарат должен стать хитом!', 1387480922, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '127.0.0.1', 2, '', '', 1, 0, 0),
(86, 'shop', 48, 'Administrator', 'ad@min.com', '', 190, 'не смеши) толщина вообще не должна рассматриваться как минус) это же не кирпич, наоборот, хорошо когда плотно лежит в руке, а не лист жести держишь', 1387480940, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '127.0.0.1', 0, '', '', 0, 0, 83),
(87, 'shop', 48, 'Administrator', 'ad@min.com', '', 190, 'большой и удобный и.............толшена ТОРМОЗ', 1387480966, 0, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '127.0.0.1', 0, '', '', 0, 0, 83);

-- --------------------------------------------------------

--
-- Структура таблиці `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `identif` varchar(25) NOT NULL,
  `enabled` int(1) NOT NULL,
  `autoload` int(1) NOT NULL,
  `in_menu` int(1) NOT NULL DEFAULT '0',
  `settings` text,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `identif` (`identif`),
  KEY `enabled` (`enabled`),
  KEY `autoload` (`autoload`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=270 ;

--
-- Дамп даних таблиці `components`
--

INSERT INTO `components` (`id`, `name`, `identif`, `enabled`, `autoload`, `in_menu`, `settings`, `position`) VALUES
(1, 'user_manager', 'user_manager', 0, 0, 0, NULL, 19),
(2, 'auth', 'auth', 1, 0, 0, NULL, 28),
(4, 'comments', 'comments', 1, 1, 1, 'a:5:{s:18:"max_comment_length";i:0;s:6:"period";i:0;s:11:"can_comment";i:0;s:11:"use_captcha";b:0;s:14:"use_moderation";b:0;}', 9),
(7, 'navigation', 'navigation', 0, 0, 0, NULL, 29),
(30, 'tags', 'tags', 1, 1, 0, NULL, 27),
(92, 'gallery', 'gallery', 1, 0, 0, 'a:26:{s:13:"max_file_size";s:1:"5";s:9:"max_width";s:1:"0";s:10:"max_height";s:1:"0";s:7:"quality";s:2:"95";s:14:"maintain_ratio";b:1;s:19:"maintain_ratio_prev";b:1;s:19:"maintain_ratio_icon";b:1;s:4:"crop";b:0;s:9:"crop_prev";b:0;s:9:"crop_icon";b:0;s:14:"prev_img_width";s:3:"500";s:15:"prev_img_height";s:3:"500";s:11:"thumb_width";s:3:"100";s:12:"thumb_height";s:3:"100";s:14:"watermark_text";s:0:"";s:16:"wm_vrt_alignment";s:6:"bottom";s:16:"wm_hor_alignment";s:4:"left";s:19:"watermark_font_size";s:2:"14";s:15:"watermark_color";s:6:"ffffff";s:17:"watermark_padding";s:2:"-5";s:19:"watermark_font_path";s:20:"./system/fonts/1.ttf";s:15:"watermark_image";s:0:"";s:23:"watermark_image_opacity";s:2:"50";s:14:"watermark_type";s:4:"text";s:8:"order_by";s:4:"date";s:10:"sort_order";s:4:"desc";}', 13),
(55, 'rss', 'rss', 1, 0, 0, 'a:5:{s:5:"title";s:9:"Image CMS";s:11:"description";s:35:"Тестируем модуль RSS";s:10:"categories";a:1:{i:0;s:1:"3";}s:9:"cache_ttl";i:60;s:11:"pages_count";i:10;}', 14),
(60, 'menu', 'menu', 0, 1, 1, NULL, 0),
(58, 'sitemap', 'sitemap', 1, 1, 0, 'a:6:{s:18:"main_page_priority";b:0;s:13:"cats_priority";b:0;s:14:"pages_priority";b:0;s:20:"main_page_changefreq";b:0;s:21:"categories_changefreq";b:0;s:16:"pages_changefreq";b:0;}', 15),
(80, 'search', 'search', 1, 0, 0, NULL, 22),
(84, 'feedback', 'feedback', 1, 0, 0, 'a:2:{s:5:"email";s:19:"admin@localhost.loc";s:15:"message_max_len";i:550;}', 25),
(117, 'template_editor', 'template_editor', 0, 0, 0, NULL, 17),
(86, 'group_mailer', 'group_mailer', 0, 0, 1, NULL, 10),
(95, 'filter', 'filter', 1, 1, 0, NULL, 30),
(96, 'cfcm', 'cfcm', 0, 0, 0, NULL, 16),
(121, 'shop', 'shop', 1, 0, 0, NULL, 17),
(135, 'sample_mail', 'sample_mail', 0, 0, 0, NULL, 20),
(137, 'mailer', 'mailer', 1, 0, 0, NULL, 21),
(153, 'share', 'share', 1, 0, 1, 'a:10:{s:5:"vkcom";s:1:"1";s:8:"facebook";s:1:"1";s:7:"twitter";s:1:"1";s:2:"gg";s:1:"1";s:4:"type";s:4:"none";s:13:"facebook_like";s:1:"1";s:7:"vk_like";s:1:"1";s:8:"vk_apiid";s:7:"3901548";s:7:"gg_like";s:1:"1";s:12:"twitter_like";s:1:"1";}', 8),
(266, 'banners', 'banners', 1, 0, 1, 'a:1:{s:8:"show_tpl";i:1;}', 1),
(216, 'new_level', 'new_level', 1, 1, 1, 'a:3:{s:15:"propertiesTypes";a:2:{i:0;s:6:"scroll";i:2;s:8:"dropDown";}s:7:"columns";a:4:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";}s:5:"thema";s:18:"css/color_scheme_1";}', 6),
(181, 'shop_news', 'shop_news', 1, 1, 0, NULL, 24),
(179, 'categories_settings', 'categories_settings', 1, 1, 0, NULL, 7),
(183, 'wishlist', 'wishlist', 1, 1, 1, 'a:10:{s:11:"maxUserName";s:3:"256";s:11:"maxListName";s:3:"254";s:13:"maxListsCount";s:2:"10";s:13:"maxItemsCount";s:3:"100";s:16:"maxCommentLenght";s:3:"500";s:13:"maxDescLenght";s:4:"1000";s:15:"maxWLDescLenght";s:4:"1000";s:13:"maxImageWidth";s:3:"150";s:14:"maxImageHeight";s:3:"150";s:12:"maxImageSize";s:7:"2000000";}" }', 3),
(185, 'exchange', 'exchange', 1, 0, 1, 'a:13:{s:3:"zip";s:2:"no";s:8:"filesize";s:7:"2048000";s:7:"validIP";s:9:"127.0.0.1";s:5:"login";s:10:"ad@min.com";s:8:"password";s:5:"admin";s:11:"usepassword";s:2:"on";s:12:"userstatuses";N;s:10:"autoresize";N;s:5:"debug";N;s:5:"email";s:0:"";s:5:"brand";s:0:"";s:18:"userstatuses_after";s:1:"1";s:6:"backup";s:1:"1";}', 4),
(188, 'cmsemail', 'cmsemail', 1, 0, 1, 'a:9:{s:4:"from";s:41:"Интернет-магазин ImageShop";s:10:"from_email";s:22:"noreplay@client.com.ua";s:11:"admin_email";s:18:"info@client.com.ua";s:5:"theme";s:41:"Интернет-магазин ImageShop";s:12:"wraper_activ";s:2:"on";s:6:"wraper";s:472:"<h2>Интернет-магазин "ImageShop"</h2>\n<div>$content</div>\n<hr />\n<p>С уважением, Интернет-магазин "ImageShop"</p>\n<p>При возникновении любых вопросов, обращайтесь по телефонам:&nbsp;<br />+38 (044)227-95-72, +38 (050)578-17-40</p>\n<p><small>Данное письмо создано автоматически, пожалуйста не отвечайте на него.</small></p>";s:8:"mailpath";s:0:"";s:8:"protocol";s:4:"mail";s:4:"port";s:0:"";}', 4),
(191, 'mod_discount', 'mod_discount', 1, 1, 1, NULL, 2),
(253, 'smart_filter', 'smart_filter', 1, 1, 0, NULL, 26),
(204, 'mobile', 'mobile', 1, 1, 1, 'a:5:{s:15:"MobileVersionON";s:1:"1";s:17:"MobileVersionSite";s:21:"demoshop.imagecms.net";s:20:"MobileVersionAddress";s:23:"m.demoshop.imagecms.net";s:18:"mobileTemplatePath";s:37:"./templates/commerce_mobiles/shop";s:6:"action";s:0:"";}', 7),
(261, 'trash', 'trash', 0, 1, 1, NULL, 5),
(264, 'language_switch', 'language_switch', 0, 0, 0, NULL, 23),
(265, 'star_rating', 'star_rating', 1, 0, 0, NULL, 12),
(267, 'translator', 'translator', 1, 1, 1, 'a:2:{s:11:"originsLang";s:2:"en";s:11:"editorTheme";s:6:"chrome";}', 11),
(268, 'imagebox', 'imagebox', 0, 1, 0, NULL, 18),
(269, 'sample_module', 'sample_module', 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `meta_title` varchar(300) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `cat_url` varchar(260) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `prev_text` text,
  `full_text` longtext NOT NULL,
  `category` int(11) NOT NULL,
  `full_tpl` varchar(50) DEFAULT NULL,
  `main_tpl` varchar(50) NOT NULL,
  `position` smallint(5) NOT NULL,
  `comments_status` smallint(1) NOT NULL,
  `comments_count` int(9) DEFAULT '0',
  `post_status` varchar(15) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish_date` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `lang` int(11) NOT NULL DEFAULT '0',
  `lang_alias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `url` (`url`(333)),
  KEY `lang` (`lang`),
  KEY `post_status` (`post_status`(4)),
  KEY `cat_url` (`cat_url`),
  KEY `publish_date` (`publish_date`),
  KEY `category` (`category`),
  KEY `created` (`created`),
  KEY `updated` (`updated`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

--
-- Дамп даних таблиці `content`
--

INSERT INTO `content` (`id`, `title`, `meta_title`, `url`, `cat_url`, `keywords`, `description`, `prev_text`, `full_text`, `category`, `full_tpl`, `main_tpl`, `position`, `comments_status`, `comments_count`, `post_status`, `author`, `publish_date`, `created`, `updated`, `showed`, `lang`, `lang_alias`) VALUES
(35, 'О сайте', '', 'o-sajte', '', 'это, базовый, шаблон, imagecms, котором, релизованы, следующие, функции, вывод, фотогалереи, статической, статьи, блога', 'Это базовый шаблон ImageCMS, на котором релизованы следующие функции: вывод фотогалереи, вывод статической статьи, вывод блога.', '<p>Это базовый шаблон ImageCMS, на котором релизованы следующие функции: отображение фотогалереи, отображение статической статьи, отображение корпоративного блога, отображение формы обратной связи.</p>\n<p>Общий вид шаблона можно отредактировать и изменить лого, графическую вставку на свои тематические.</p>\n<p>Слева в сайдбаре Вы видите список категорий блога, который легко вставляется с помощью функции {sub_category_list()} в файле main.tpl. Также в левом сайдбаре находится форма поиска по сайту, виджет последних комментариев и виджет тегов сайта. В этот сайдбар можно также добавить виджет последних либо популярных новостей, а также любые счетчики, информеры.</p>\n<p>Верхнее меню реализовано с помощью модуля Меню. Управлять его содержимым можно из административной части в разделе Меню - Главное меню. Сюда как правило можно еще добавить страницы: о компании, контакты, услуги и т.п.</p>\n<p>За дополнительной информацией обращайтесь в официальный раздел документации: <a href="http://www.imagecms.net/wiki">http://www.imagecms.net/wiki</a></p>\n<p>Обсудить дополнительные возможности, а также вопросы по установке, настройке системы можно на официальном форуме: <a href="http://forum.imagecms.net/index.php">http://forum.imagecms.net/</a></p>', 'іаіаіваіваіваів', 0, '', '', 0, 1, 0, 'publish', 'admin', 1267203253, 1267203328, 1357651935, 13, 3, 0),
(64, 'О магазине', '', 'about', '', 'магазине', 'О магазине', '<p>Магазин ImageCMS Shop предоставляет огромный выбор техники на любой вкус по лучшим ценам.</p>\n<p>Наш магазин существует более 5 лет и за это время не было ни единого возврата товара.</p>\n<p>Мы обслуживаем ежедневно сотни покупателей и делаем это с радостью.</p>\n<p><strong>Покупайте технику у нас и становитесь обладателем лучшей в мире техники!!!</strong></p>', '', 0, '', '', 0, 1, 0, 'publish', 'Roman Koloda', 1291295776, 0, 1354551261, 305, 3, 0),
(65, 'Оплата', '', 'oplata', '', 'оплата', 'Оплата', '<p>Наш магазин поддерживает все доступные на данный момент методы оплаты.</p>\n<p>Также действует возможность оплаты курьеру при доставке для всех крупных городов Украины и России. (возможность оплаты курьеру в Вашем городе уточняйте по телефону <strong>0 800 820 22 22</strong>).</p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1291295824, 1291295836, 1291743521, 167, 3, 0),
(66, 'Доставка', '', 'dostavka', '', 'доставка', 'Доставка', '<p>Мы поддерживаем доставку службой Автомир по всему миру.</p>\n<p>Также возможна доставка курьером для всех больших городов Украины и России (возможность доставки курьером в Вашем городе уточняйте по телефону <strong>0 800 820 22 22</strong>).</p>\n<p>При желании Вы можете сами забрать купленный товар в наших офисах.</p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1291295844, 1291295851, 1291743683, 151, 3, 0),
(67, 'Помощь', '', 'help', '', 'помощь', 'Помощь', '<p>Для того, чтобы приобрести товар в нашем магазине, Вам нужно выполнить несколько простых шагов:</p>\n<ul>\n<li>Выбрать нужный товар, воспользовавшить навигацией слева, либо поиском.</li>\n<li>Добавить товар в корзину.</li>\n<li>Перейти в корзину, выбрать способ доставки и указать Ваши контактные данные.</li>\n<li>Подтвердить заказ и выбрать способ оплаты.</li>\n</ul>\n<p>После этого наши менеджеры свяжуться с Вами и помогут с оплатой и доставкой товара, а также проконсультируют по любому вопросу.</p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1291295855, 1291295867, 1291743919, 90, 3, 0),
(68, 'Контакты', '', 'contact_us', '', 'контакты', 'Контакты', '<p><strong>Горячий телефон</strong>: 0 800 80 80 800</p>\n<p><strong>Главный офис в Москве</strong></p>\n<p>ул. Гагарина 1/2</p>\n<p>тел. 095 095 00 00</p>\n<p>&nbsp;</p>\n<p><strong>Главный офис в Киеве</strong></p>\n<p>ул. Гагарина 1/2</p>\n<p>тел. 098 098 00 00</p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1291295870, 1291295888, 1291744068, 93, 3, 0),
(75, 'Contact', '', 'contact_us', '', 'ssss', 'ssss', '<p><span id="result_box" lang="en"><span>Hot Phone</span><span>:</span> <span>0800</span> <span>80</span> <span>80 800</span><br /><br /> <span>Head office in</span> <span>Moscow</span><br /><br /> <span>street</span><span>.</span> <span>Gagarin</span> <span>half</span><br /><br /> <span>tel.</span> <span>095</span> <span>095</span> <span>00</span> <span>00</span><br /><br /> <span>The main office</span> <span>in Kiev</span><br /><br /> <span>street</span><span>.</span> <span>Gagarin</span> <span>half</span><br /><br /> <span>tel.</span> <span>098</span> <span>098</span> <span>00</span> <span>00</span></span></p>', '', 0, '', '', 0, 1, 4, 'publish', 'admin', 1291295870, 1291295888, 1343664873, 35, 30, 68),
(76, 'Delivery', '', 'dostavka', '', 'support, the, delivery, service, autoworld, around, world, also, possible, all, major, cities, ukraine, and, russia, possibility, courier, your, area, please, call, desired, you, can, pick, purchased, goods, themselves, our, offices', 'We support the delivery of service Autoworld around the world. It is also possible delivery to all major cities of Ukraine and Russia (the possibility of delivery by courier in your area please call 0800820 22 22.) If desired, you can pick up the purchase', '<p><span id="result_box" lang="en"><span>We support the</span> <span>delivery of</span> <span>service</span> <span>Autoworld</span> <span>around the world.</span><br /><br /> <span>It is also possible</span> <span>delivery</span> <span>to all</span> <span>major cities</span> <span>of Ukraine and Russia</span> <span>(the possibility of</span> <span>delivery</span> <span>by courier</span> <span>in your area</span> <span>please call</span> <span>0800820</span> <span>22 22</span><span>.)</span><br /><br /> <span>If desired,</span> <span>you can</span> <span>pick up the</span> <span>purchased goods</span> <span>themselves</span> <span>in our offices.</span></span></p>', '', 0, '', '', 0, 1, 4, 'publish', 'admin', 1291295844, 1291295851, 1343664842, 8, 30, 66),
(77, 'Help', '', 'help', '', 'order, purchase, goods, our, store, you, must, follow, few, simple, steps, choose, the, right, product, vospolzovavshit, navigation, left, search, add, products, cart, shopping, select, shipping, method, and, provide, your, contact', 'In order to purchase goods in our store, you must follow a few simple steps: Choose the right product, vospolzovavshit navigation on the left, or search. Add products to cart. Go to the shopping cart, select shipping method and provide your contact inform', '<p><span id="result_box" lang="en"><span>In order to</span> <span>purchase goods</span> <span>in our store,</span> <span>you must follow</span> <span>a few simple steps</span><span>:</span><br /><br />&nbsp;&nbsp;&nbsp;&nbsp; <span>Choose</span> <span>the right product,</span> <span>vospolzovavshit</span> <span>navigation</span> <span>on the left</span><span>, or</span> <span>search.</span><br />&nbsp;&nbsp;&nbsp;&nbsp; <span>Add products</span> <span>to cart</span><span>.</span><br />&nbsp;&nbsp;&nbsp;&nbsp; <span>Go to the</span> <span>shopping cart,</span> <span>select</span> <span>shipping method</span> <span>and provide</span> <span>your contact information.</span><br />&nbsp;&nbsp;&nbsp;&nbsp; <span>Proceed to checkout</span> <span>and select the</span> <span>payment method.</span><br /><br /> <span>After that,</span> <span>our managers</span> <span>will contact</span> <span>you and</span> <span>help you</span> <span>with payment</span> <span>and delivery</span> <span>of the goods</span><span>, as well</span> <span>as give advice on</span> <span>any subject.</span></span></p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1291295855, 1291295867, 1343664897, 11, 30, 67),
(78, 'Payment', '', 'oplata', '', 'our, store, supports, all, currently, available, methods, payment, also, there, possibility, pay, the, courier, for, delivery, major, cities, ukraine, and, russia, ability, your, area, please, call', 'Our store supports all currently available methods of payment. Also there is a possibility to pay the courier for delivery to all major cities of Ukraine and Russia. (ability to pay for the courier in your area please call 0800820 22 22.)', '<p><span id="result_box" lang="en"><span>Our store</span> <span>supports all</span> <span>currently available</span> <span>methods of payment.</span><br /><br /> <span>Also there is</span> <span>a possibility to pay</span> <span>the courier</span> <span>for delivery</span> <span>to all</span> <span>major cities</span> <span>of Ukraine</span> <span>and Russia.</span> <span>(ability to</span> <span>pay for</span> <span>the courier</span> <span>in your area</span> <span>please call</span> <span>0800820</span> <span>22 22</span><span>.)</span></span></p>', '', 0, '', '', 0, 1, 3, 'publish', 'admin', 1291295824, 1291295836, 1343664949, 1, 30, 65),
(79, 'About us', '', 'about', '', 'shop, imagecms, offers, huge, selection, vehicles, suit, every, taste, the, best, prices, our, store, has, more, than, years, and, during, that, time, was, not, single, return, goods, serve, hundreds, customers', 'Shop ImageCMS Shop offers a huge selection of vehicles to suit every taste at the best prices. Our store has more than 5 years and during that time was not a single return of the goods. We serve hundreds of customers every day and do it with joy. Buy equi', '<p><span id="result_box" lang="en"><span>Shop</span> <span>ImageCMS Shop</span> <span>offers</span> <span>a huge selection</span> <span>of vehicles</span> <span>to suit every taste</span> <span>at the best prices</span><span>.</span><br /><br /> <span>Our store</span> <span>has more than</span> <span>5 years</span> <span>and during that time</span> <span>was not a single</span> <span>return of the goods</span><span>.</span><br /><br /> <span>We serve</span> <span>hundreds of</span> <span>customers</span> <span>every day</span> <span>and do</span> <span>it with joy.</span><br /><br /> <span>Buy</span> <span>equipment from</span> <span>us and</span> <span>become the owner of</span> <span>the world''s best</span> <span>technology</span><span>!</span></span></p>', '', 0, '', '', 0, 1, 1, 'publish', 'admin', 1291295776, 1291295792, 1343745649, 5, 30, 64),
(80, 'Site', '', 'o-sajte', '', 'new', 'new', '<p><span id="result_box" lang="en"><span>This is</span> <span>the basic template</span> <span>ImageCMS,</span> <span>which</span> <span>relizovany</span> <span>the following functions</span><span>: display</span> <span>gallery</span><span>, displaying</span> <span>static</span> <span>articles</span><span>, displaying</span> <span>a corporate blog</span><span>, displaying</span> <span>the feedback form.</span><br /><br /> <span>General view of the</span> <span>template, you can</span> <span>edit and</span> <span>change the</span> <span>logo,</span> <span>a graphic</span> <span>box on</span> <span>your</span> <span>case</span><span>.</span><br /><br /> <span>On the left</span> <span>you can see</span> <span>in the sidebar</span> <span>list of</span> <span>categories of</span> <span>the blog,</span> <span>which is easily</span> <span>inserted</span> <span>by using the</span> <span>{sub_category_list ()}</span> <span>in the file</span> <span>main.tpl.</span> <span>Also</span> <span>in the left</span> <span>sidebar</span> <span>is</span> <span>a search form</span> <span>on the site,</span> <span>recent comments</span> <span>widget</span> <span>and the widget</span> <span>tag</span> <span>site.</span> <span>In</span> <span>this</span> <span>sidebar</span> <span>you can also</span> <span>add a widget</span><span>, or</span> <span>the latest</span> <span>popular</span> <span>news,</span> <span>as well as any</span> <span>counters,</span> <span>widgets</span><span>.</span><br /><br /> <span>The top menu</span> <span>is implemented</span> <span>by the module</span> <span>menu</span><span>.</span> <span>And manage</span> <span>its content</span> <span>can be</span> <span>part</span> <span>of the</span> <span>administration</span> <span>in Menu</span> <span>-</span> <span>Main Menu.</span> <span>It</span> <span>is usually</span> <span>possible to add</span> <span>page</span> <span>about the company</span><span>, contacts,</span> <span>services, etc.</span><br /><br /> <span>For more</span> <span>information, contact the</span> <span>official</span> <span>section of the documentation</span><span>: http://www.imagecms.net/wiki</span><br /><br /> <span>Discuss</span> <span>additional opportunities</span><span>, as well as</span> <span>questions about</span> <span>installation, configuration,</span> <span>the system can be</span> <span>on the official forum</span><span>: http://forum.imagecms.net/</span></span></p>', '', 0, '', '', 0, 1, 0, 'publish', 'admin', 1267203253, 1267203328, 1343722704, 0, 30, 35),
(91, 'Как раскрутить сайт? Методы поискового продвижения', '', 'kak-raskrutit-sait-metody-poiskovogo-prodvizheniia', 'novosti/', 'наличие, корпоративного, сайта, стало, стандартом, факто, знаком, хорошего, тона, любой, компании, только, известных, игроков, рынка, независимо, области, вашей, деятельности, собственный, ресурс, любом, случае, принесет, пользу, особенно, знаете, раскрутить, сайт, самостоятельно', 'Наличие корпоративного сайта уже стало стандартом де-факто и знаком   хорошего тона любой компании, а не только известных игроков рынка.   Независимо от области вашей деятельности, собственный ресурс в любом   случае принесет вам пользу, особенно если вы', '<p>Наличие корпоративного сайта уже стало стандартом де-факто и знаком хорошего тона любой компании, а не только известных игроков рынка. Независимо от области вашей деятельности, собственный ресурс в любом случае принесет вам пользу, особенно если вы знаете как раскрутить сайт самостоятельно. Его можно использовать не только для повышения узнаваемости бренда, но и в качестве эффективного инструмента продаж.</p>', '<h1>Интернет-магазин</h1>\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\n<h2>Заголовок второго уровня</h2>\n<h3>Заголовок третьего уровня</h3>\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\n<h3>Заголовок третьего уровня</h3>\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\n<ul>\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\n</ul>\n<h4>Заголовок четвертого уровня</h4>\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\n<table>\n<tbody>\n<tr>\n<td>название</td>\n<td>размер</td>\n<td>цена</td>\n</tr>\n<tr>\n<td>длинна трубы</td>\n<td>10 метров</td>\n<td>145 уе</td>\n</tr>\n<tr>\n<td>ширина трубы</td>\n<td>2 метра</td>\n<td>134 уе</td>\n</tr>\n</tbody>\n</table>\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\n<ol>\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\n</ol>\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362225580, 1362225580, 1387472085, 3, 3, 0),
(92, 'Как добавить сайт в Яндекс и Гугл. Советы начинающим вебмастерам', '', 'kak-dobavit-sait-v-iandeks-i-gugl-sovety-nachinaiushchim-vebmasteram', 'novosti/', 'создание, сайта, само, себе, является, нелегким, довольно, продолжительным, процессом, позади, неприятно, обнаружить, ваш, красивый, наполненный, полезными, материалами, сайт, никто, кроме, самих, заходит, пожалуй, владельцы, сайтов, которые, запустили, свой, первый, проект', 'Создание сайта само по себе является нелегким и довольно продолжительным   процессом, и когда все уже позади, довольно неприятно обнаружить, что   на ваш красивый и наполненный полезными материалами сайт никто кроме  вас  самих не заходит. Пожалуй, владел', '<p>Создание сайта само по себе является нелегким и довольно продолжительным процессом, и когда все уже позади, довольно неприятно обнаружить, что на ваш красивый и наполненный полезными материалами сайт никто кроме вас самих не заходит. Пожалуй, владельцы сайтов, которые запустили свой первый проект, чаще всего испытывают неприятное удивление в связи с этим фактом. А на самом деле все просто &ndash; прежде всего, нужно знать как добавить сайт в поисковики.</p>', '<p>Создание сайта само по себе является нелегким и довольно продолжительным процессом, и когда все уже позади, довольно неприятно обнаружить, что на ваш красивый и наполненный полезными материалами сайт никто кроме вас самих не заходит. Пожалуй, владельцы сайтов, которые запустили свой первый проект, чаще всего испытывают неприятное удивление в связи с этим фактом. А на самом деле все просто &ndash; прежде всего, нужно знать как добавить сайт в поисковики.</p>\n<p>Посетители переходят на сайты из результатов поиска, выдаваемых им Google при вводе определенного запроса. Но, чтобы появится в выдаче по этому запросу, нужно сначала, чтобы поисковый робот проиндексировал ваш сайт, то есть, внес его в свою поисковую базу. Поэтому, если вы имеете понятие про <a href="http://www.imagecms.net/blog/obzory/biznes-v-internete-kak-perspektivnyi-trend" target="_blank">бизнес в Интернете</a>, и уже запустили собственный ресурс, вопрос как добавить сайт в поисковики будет актуальным для каждого вебмастера.</p>\n<p><a href="http://www.imagecms.net/download"><img src="http://www.imagecms.net/uploads/images/blog/2.png" alt="Мощная система для создания сайтов любых типов" width="705" height="183" /></a></p>\n<p>Часто бывает, что ресурс может проиндексироваться сразу же после регистрации доменного имени, но лучше всего самостоятельно добавить сайт в поисковые системы. Тем более, учитывая тот факт, что это займет совсем немного времени.</p>\n<p>&nbsp;</p>\n<h3>Добавить сайт в Яндекс</h3>\n<p>&nbsp;</p>\n<p>Для того, чтобы сообщить этому поисковику о новом сайте, нужно перейти на страницу со специальной формой, которая находится по следующему адресу: <a href="http://webmaster.yandex.ua/addurl.xml" target="_blank">http://webmaster.yandex.ua/addurl.xml</a></p>\n<p>С помощью панельки можно просто и быстро добавить сайт в Яндекс с минимальными затратами времени и сил. Перейдя по ссылке, вы увидите следующую форму: <br /><img src="http://www.imagecms.net/uploads/images/blog/add_yandex.jpg" alt="Форма добавления сайта в индекс ПС Яндекс" width="695" height="266" /> <br />В поле URL ведите адрес сайта, ниже введите цифры с картинки каптчи (защита от спама), после чего нажмите кнопку &laquo;Добавить&raquo;. Поздравляем! Только что вы смогли добавить сайт в Яндекс и уже в ближайшее время на него заглянет поисковый паук, чтобы внести в свою базу. После этого он появится в результатах поиска, и вы получите первых посетителей.</p>\n<p>&nbsp;</p>\n<h3>Добавить сайт в Гугл</h3>\n<p>&nbsp;</p>\n<p>Эта поисковая система является мировым лидером в области web-поиска, и сообщить ей о своем сайте нужно обязательно. Добавить сайт в Гугл еще проще, чем в предыдущем случае, ведь не нужно даже вводить каптчу. Перейдите <a href="https://www.google.com/webmasters/tools/submit-url?hl=ru" target="_blank">по этой ссылке</a> и перед вами откроется окно, с помощью которого можно добавить сайт в Google: <br /><img src="http://www.imagecms.net/uploads/images/blog/add_google.jpg" alt="Добавление url в индекс ПС Google" width="695" height="311" /><br /> Введите адрес и по желанию можно добавить примечание. Хотя вряд ли в этом есть смысл, так как это ни на что не влияет. Кстати, не нужно вводить никаких отдельных страниц, чтобы добавить сайт в Гугл достаточно вставить в поле формы URL главной страницы.</p>\n<p>Как видите, добавить сайт в поисковые системы совсем не сложно. Тем более, если учитывать, что хорошая индексация ведет к росту посещаемости, а значит и повышает <a href="http://www.imagecms.net/blog/obzory/otsenka-stoimosti-saita-i-faktory-kotorye-vliiaiut-na-tsenu" target="_blank">стоимость сайта</a> в целом. Это займет у вас минимум времени, но благодаря проделанным операциям вы сможете быть уверены в том, что поисковые системы узнают о сайте и добавят его в базу, а значит, на сайт начнут заходить посетители. Теперь вы знаете как добавить сайт в Google и можете без проблем сделать это самостоятельно.</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362225699, 1362225699, 1387364028, 1, 3, 0),
(93, '8Р: Бизнес в сети', '', '8r-biznes-v-seti', 'novosti/', 'редкий, предприниматель, наше, время, задается, вопросом, «как, помощью, интернета, увеличить, продажи, подробный, обстоятельный, ответ, каждый, сможет, получить, традиционной, ежегодной, конференции, бизнес, сети, которая, третий, состоится, одессе, ожидается, около, участников, этом', 'Редкий предприниматель в наше время не задается вопросом: «Как с помощью  интернета увеличить продажи?» Подробный и обстоятельный ответ каждый  сможет получить на традиционной ежегодной конференции “8Р: Бизнес в  сети”, которая в третий раз состоится в Од', '<p>Редкий предприниматель в наше время не задается вопросом: &laquo;Как с помощью интернета увеличить продажи?&raquo; Подробный и обстоятельный ответ каждый сможет получить на традиционной ежегодной конференции &ldquo;8Р: Бизнес в сети&rdquo;, которая в третий раз состоится &nbsp;в Одессе 13.07.2013г. Ожидается около 700 участников.</p>', '<p>&nbsp;</p>\n<p><img src="http://www.imagecms.net/uploads/images/8p_logo.jpg" alt="" width="300" height="70" />Редкий предприниматель в наше время не задается вопросом: &laquo;Как с помощью интернета увеличить продажи?&raquo; Подробный и обстоятельный ответ каждый сможет получить на традиционной ежегодной конференции &ldquo;8Р: Бизнес в сети&rdquo;, которая в третий раз состоится &nbsp;в Одессе 13.07.2013г. Ожидается около 700 участников.</p>\n<p dir="ltr">В этом году оргкомитет выбрал наиболее актуальные темы, пригласил более 40 докладчиков и решил немного отойти от теоретики, сделав упор на примеры из практики. Большое количество кейсов &ndash; отличительная черта &ldquo;8P&rdquo; 2013.</p>\n<p dir="ltr">В программе конференции предусмотрены 4 потока:</p>\n<p>&nbsp;</p>\n<ul>\n<li dir="ltr">Интернет-маркетинг &nbsp;&ndash; инструменты онлайн продвижения бизнеса</li>\n<li dir="ltr">E-commerce &ndash; привлечение новых клиентов, увеличение конверсии, формирование лояльности</li>\n<li dir="ltr">Кейсы &ndash; примеры успешного продвижения в сети</li>\n<li dir="ltr">Мастер-классы &ndash; полтора часа непрерывного общения&nbsp;</li>\n</ul>\n<p>&nbsp;</p>\n<p>Оформить регистрацию на конференцию &ldquo;8Р: Бизнес в сети&rdquo; 2013 можно <a href="http://8p.ua/?utm_source=p20954&amp;utm_medium=press_release&amp;utm_campaign=8p">здесь</a>.</p>\n<p dir="ltr">Там же вы можете посмотреть фото и видео с прошлогодней конференции, прочитать отзывы участников.</p>\n<p dir="ltr">Стартовая цена билета &ndash; 950 грн. Внимание: с каждым проданным билетом она возрастает на 1 грн.<br />Адрес конференции: г.Одесса, банкетный дом Ренессанс. От железнодорожного вокзала будет курсировать комфортабельный автобус. Добираться можно и на своем автомобиле - бесплатная парковка к вашим услугам.</p>\n<p>В программе также кофе-брейки, обед, афтер-пати.<br />Испытание на стойкость - афтер-афтер-пати.<br /> <br />Организатор конференции: <a href="http://netpeak.ua">Netpeak</a> - агентство интернет-маркетинга</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362225792, 1362225792, 1387364038, 1, 3, 0),
(94, 'Lviv Social Media Camp 2013', '', 'lviv-social-media-camp-2013', 'novosti/', 'lviv, social, media, camp, третья, ежегодная, конференция, вопросам, продвижения, малого, бизнеса, социальных, сетях, состоится, февраля, успешные, форумы, года, собравшие, почти, участников, доказали, покорения, изменчивого, мира, медиа, необходимы, незаурядные, знания, опыт', 'Lviv Social Media Camp 2013 - третья ежегодная конференция по вопросам  продвижения малого бизнеса в социальных сетях - состоится 23 февраля.  Успешные форумы 2011 и 2012 года, собравшие почти 700 участников,  доказали - для покорения изменчивого мира соц', '<p>Lviv Social Media Camp 2013 - третья ежегодная конференция по вопросам продвижения малого бизнеса в социальных сетях - состоится 23 февраля. Успешные форумы 2011 и 2012 года, собравшие почти 700 участников, доказали - для покорения &nbsp;изменчивого мира социальных медиа необходимы незаурядные знания и опыт, которыми могут поделиться только настоящие профессионалы. Как следствие - десятки новых ярких звезд, вспыхнувших в украинском бизнес-пространстве. Такие результаты не могли не вдохновить организаторов на продолжение работы в этом перспективном направлении.</p>', '<p><img src="http://www.imagecms.net/uploads/images/smcamp2013.png" alt="" width="850" height="237" /><br /><a href="http://smcamp.com.ua">Lviv Social Media Camp 2013</a> - третья ежегодная конференция по вопросам продвижения малого бизнеса в социальных сетях - состоится 23 февраля. Успешные форумы 2011 и 2012 года, собравшие почти 700 участников, доказали - для покорения &nbsp;изменчивого мира социальных медиа необходимы незаурядные знания и опыт, которыми могут поделиться только настоящие профессионалы. Как следствие - десятки новых ярких звезд, вспыхнувших в украинском бизнес-пространстве. Такие результаты не могли не вдохновить организаторов на продолжение работы в этом перспективном направлении.<br /> <br />Красноречивые факты:</p>\n<p>&nbsp;</p>\n<ul>\n<li dir="ltr">22 млн. гривен - общий объем видеорекламы в Уанете.</li>\n<li dir="ltr">680 млн. гривен - объем украинского рынка интернет-рекламы</li>\n<li dir="ltr">180 млн. гривен - объем прошлогоднего рынка Digital-услуг</li>\n<li dir="ltr">Около 20% - &nbsp;прогнозируемый рост Digital на 2013 год</li>\n</ul>\n<p>&nbsp;</p>\n<p><br />Нынешняя программа конференции разработана специально для предпринимателей и представителей малого бизнеса, которым интересны &nbsp;новые возможности для продвижения своего продукта. К тому же, конференция станет точкой сбора для украинских профессионалов SMM.<br /> <br />По традиции, в программе конференции будет три потока:<br /> <br />Social Media Marketing:</p>\n<p>&nbsp;</p>\n<ul>\n<li dir="ltr">Украинский SMM в 2013 году - успехи и провалы</li>\n<li dir="ltr">Нужен ли SMM украинскому бизнесу?</li>\n<li dir="ltr">Методы манипулирования выдачей Facebook</li>\n<li dir="ltr">Как продвигать "звезд" в YouTube</li>\n<li dir="ltr">Вирусные промокампании</li>\n<li dir="ltr">Использование возможностей Pinterest и Instagram</li>\n<li dir="ltr">Social Media Optimization: о секретных алгоритмах Facebook</li>\n<li dir="ltr">Опыт работы лучших украинских Digital-агентств</li>\n</ul>\n<p>&nbsp;</p>\n<p><br />Social Media и бизнес:</p>\n<p>&nbsp;</p>\n<ul>\n<li dir="ltr">Нуждается ли мой бизнес в использовании &nbsp;соц. сетей - как узнать?</li>\n<li dir="ltr">Успешные локальные маркетинговые кампании - рассмотрим примеры</li>\n<li dir="ltr">Facebook в Украине, Киеве, во Львове - определяем пользу</li>\n<li dir="ltr">Facebook-страница - как правильно оформить?</li>\n<li dir="ltr">Максимум результата за минимум времени - как добиться?</li>\n<li dir="ltr">Агентства &ndash; стоит ли доверяться?</li>\n</ul>\n<p>&nbsp;</p>\n<p><br />Новые медиа, разработка, стартапы:</p>\n<p>&nbsp;</p>\n<ul>\n<li dir="ltr">Собственные сервисы и social media - вопросы интеграции</li>\n<li dir="ltr">Mixed media</li>\n<li dir="ltr">Twitter, Facebook, Foursquare API</li>\n<li dir="ltr">BlogCamp</li>\n<li dir="ltr">SmartTV</li>\n<li dir="ltr">Линчи social media стартапов</li>\n</ul>\n<p>&nbsp;</p>\n<p><br />Стоимость билета:<br />200 грн. - Первые 50 билетов для ранних пташек<br />300 грн. - Следующие 200 билетов<br />500 грн. - Предпоследние 50 билетов<br />800 грн. - Кто поздно приходит, тому последние 20 билетов<br /> <br />Встречаемся&nbsp;23 февраля в конференц-зале УКУ (ул.. Хуторовка, 35а).</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362225886, 1362225886, 1387364053, 1, 3, 0),
(95, 'Оценка стоимости сайта и факторы, которые влияют на цену', '', 'otsenka-stoimosti-saita-i-faktory-kotorye-vliiaiut-na-tsenu', 'novosti/', 'как, время, разработки, продажи, интернет, ресурса, учитывается, достаточно, много, факторов, влияющих, цену, поэтому, нужно, уметь, оценить, стоимость, сайта, своими, силами, важно, планируете, создание, коммерческого, собираетесь, запустить, личный, блог, знать, финансовые', 'Как во время разработки, так и во время продажи Интернет-ресурса   учитывается достаточно много факторов, влияющих на его цену. Поэтому   нужно уметь оценить стоимость сайта своими силами. Не важно, планируете   ли вы создание коммерческого сайта или соби', '<p>Как во время разработки, так и во время продажи Интернет-ресурса учитывается достаточно много факторов, влияющих на его цену. Поэтому нужно уметь оценить стоимость сайта своими силами. Не важно, планируете ли вы создание коммерческого сайта или собираетесь запустить личный блог, знать финансовые стороны вопроса никогда не будет лишним.</p>', '<p>&nbsp;</p>\n<p><img src="http://www.imagecms.net/uploads/images/blog/site-price.jpg" alt="Быстрая оценка любого сайта" width="250" height="172" />Как во время разработки, так и во время продажи Интернет-ресурса учитывается достаточно много факторов, влияющих на его цену. Поэтому нужно уметь оценить стоимость сайта своими силами. Не важно, планируете ли вы создание коммерческого сайта или собираетесь запустить личный блог, знать финансовые стороны вопроса никогда не будет лишним. <a title="стоимость создания сайта" href="http://www.imagecms.net/blog/obzory/skolko-stoit-sait-postroit" target="_blank">Стоимость создания сайта</a> для многих является ключевым фактором, влияющим на принятие решения о разработка. Многое зависит от необходимых вам возможностей, ведь для простого блога вполне хватит бесплатной версии ImageCMS, а вот уже для торговой площадки понадобится коммерческий модуль Интернет-магазина.</p>\n<p>Оценка стоимости сайта при его разработке зависит от нескольких факторов. Пройдемся по пунктам:</p>\n<p>&nbsp;</p>\n<ul>\n<li>Дизайн. Если он уникальный &ndash; стоимость будет выше, но в этом случае учитываются все ваши пожелания и специфика вашего бизнеса. Индивидуальный подход позволяет сделать внешний вид сайта именно таким, каким вы бы хотели его видеть, и поднять <a title="юзабилити сайт" href="http://www.imagecms.net/blog/obzory/osnovy-iuzabiliti-saita" target="_blank">юзабилити сайта</a> на действительно высокий уровень. Шаблонный сайт обойдется дешевле, что позволит оценить стоимость сайта ниже, но и качество не будет на высоком уровне. Кроме того, такой же шаблон может использоваться и на десятках других сайтов.</li>\n<li>Функциональность. Думаю, не нужно быть профессионалом в web-разработке, чтобы понять, что различие в цене разработки сайта-визитки для местного фотографа и туристического портала, будет существенным. Оценка стоимости сайта в таком случае определяется сложностью добавляемых модулей.</li>\n<li>Контент. Пожалуй, о важности качественного контента на данный момент можно и не напоминать, это аксиома известная всем, как заказчикам, так и исполнителям. Конечно, качественный копирайтинг не может стоить дешево, и чем больше таких страниц нужно создать, тем дороже это обойдется. Точные знания относительно необходимого количества контента, позволяет узнать стоимость сайта более подробно. Но стоит помнить, что вложения в качество обязательно окупятся в долгосрочной перспективе.</li>\n<li>Оптимизация под поисковые системы (SEO). Если вам не нужны посетители, а сайт сделан просто для галочки и надписи на визитке &ndash; можете смело пропускать этот пункт. Вот только зачем тогда его вообще создавать? Оптимизация сайта является важным пунктом договора, который заранее оговаривается при разработке. Чтобы узнать стоимость сайта, необязательно сразу же просчитывать этот пункт, это скорее затраты будущего периода. Особенно хорошо нужно проработать такой момент как <a title="подбор ключевых слов для сайта" href="http://www.imagecms.net/blog/obzory/podbor-kliuchevyh-slov-kak-sdelat-vse-pravilno" target="_blank">подбор ключевых слов</a> для сайта, то есть, составление семантического ядра.</li>\n<li>Тематика сайта. Коммерческая ниша в любом случае будет цениться гораздо выше, чем развлекательная.</li>\n<li>Количество страниц в индексе. Чем их больше, тем выше можно выставить цену при продаже. Хороший багаж в плане контента будет полезен для любого проекта, как залог лояльности со стороны поисковых систем. Главное &ndash; чтобы все материалы сайта были уникальными, а не обычным копипастом.</li>\n<li>Показатели тИЦ и PR. Пожалуй, оценить стоимость сайта на основе этого показателя проще всего. Тут действует простое правило &ndash; чем больше, тем лучше.</li>\n<li>Посещаемость сайта. Оценка стоимости сайта с высокой посещаемостью всегда была высокой. В последнее время, в связи с ужесточением поисковых алгоритмов и увеличением конкуренции, сайты с более-менее пристойным количеством посетителей стали цениться еще выше.</li>\n<li>Присутствие в каталогах DMOZ, Mail.ru и Яндекс.Каталог. Хотя данный фактор уже не имеет такого веса как во времена расцвета ссылочных бирж, но он все еще играет весомую роль, если вас интересует оценка стоимости сайта, так как является своеобразным знаком качества от поисковиков.</li>\n</ul>\n<p>&nbsp;</p>\n<p><a href="http://www.imagecms.net/download"><img src="http://www.imagecms.net/uploads/images/blog/2.png" alt="Загрузить ImageCMS Corporate бесплатно" width="705" height="183" /></a></p>\n<p>Перечисленные выше факторы позволяют точно оценить стоимость сайта еще на этапе проектирования, и в случае надобности &ndash; внести необходимые корректировки. В случае, если ресурс принадлежит вам лично, а не компании, узнать стоимость сайта также очень важно, ведь он является выгодным активом, который можно в любой момент продать. Это может быть как блог, так и узкотематический проект, который хорошо закрепился в своей нише и представляет ценность для пользователей.</p>\n<p>В таком случае узнать стоимость сайта можно с помощью оценки немного других показателей, чем в первом случае. При продаже на стоимость повлияют такие показатели:</p>\n<p>В этой статье мы перечислили все основные факторы, с учетом которых можно оценить стоимость сайта и применить данные методики по отношению как корпоративному, так и личному проекту.</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362225958, 1362225958, 1387364060, 1, 3, 0),
(96, 'Зачем вашему оффлайн-бизнесу нужен Интернет-магазин?', '', 'zachem-vashemu-offlain-biznesu-nuzhen-internet-magazin', 'novosti/', 'несмотря, бурный, рост, интернет, коммерции, далеко, предприниматели, понимают, преимущества, магазина, особенно, оффлайная, торговая, точка, именно, таком, случае, проявляются, лучше, всего, ведь, получаете, только, отличный, источник, дополнительного, дохода, возможность, сравнения, эффективности', 'Несмотря на бурный рост Интернет-коммерции, далеко не все  предприниматели понимают, в чем преимущества Интернет-магазина, особенно  если уже есть оффлайная торговая точка. Но именно в таком случае  преимущества Интернет-магазина проявляются лучше всего,', '<p>Несмотря на бурный рост Интернет-коммерции, далеко не все предприниматели понимают, в чем преимущества Интернет-магазина, особенно если уже есть оффлайная торговая точка. Но именно в таком случае преимущества Интернет-магазина проявляются лучше всего, ведь вы получаете не только отличный источник дополнительного дохода, но и возможность сравнения эффективности вложения средств.</p>', '<p>&nbsp;</p>\n<p><img src="http://www.imagecms.net/uploads/images/blog/inet-magaz.jpg" alt="Интернет как перспективная бизнес-среда" width="213" height="200" />Несмотря на бурный рост Интернет-коммерции, далеко не все предприниматели понимают, в чем преимущества Интернет-магазина, особенно если уже есть оффлайная торговая точка. Но именно в таком случае преимущества Интернет-магазина проявляются лучше всего, ведь вы получаете не только отличный источник дополнительного дохода, но и возможность сравнения эффективности вложения средств.</p>\n<p>Так зачем нужен Интернет-магазин современному предпринимателю? В зависимости от того, есть ли у вас уже действующий оффлайн-бизнес, он может быть как дополнением к нему, или же основным источником дохода. Уже отталкиваясь от этого, нужно планировать бюджет создания магазина и его развития. Над онлайновой торговой площадкой нужно вести постоянную работу, подробно проработать <a href="http://www.imagecms.net/blog/obzory/biznes-plan-internet-magazina-na-chto-obratit-vnimanie" target="_blank">бизнес-план Интернет-магазина</a> - это не просто визитка, созданная &laquo;для галочки&raquo;... это полноценный и очень эффективный инструмент продаж. Плюсов у онлайн-бизнеса, по сравнению с оффлайном, довольно много.</p>\n<p><a href="http://www.imagecms.net/download"><img src="http://www.imagecms.net/uploads/images/blog/2.png" alt="Система для создания интернет-магазинов - ImageCMS" width="705" height="183" /></a></p>\n<p>Перечислим основные преимущества Интернет-магазина:</p>\n<p>&nbsp;</p>\n<ul>\n<li>можно обойтись без аренды производственных площадей и складов - достаточно небольшого офиса для обслуживания;</li>\n<li>может быть как основным источником прибыли, так и дополнительным по отношению к основному бизнесу - это важное обоснование при вопросе зачем нужен Интернет-магазин;</li>\n<li>гораздо меньший порог вхождения, хотя конкуренция в разных тематиках отличается;</li>\n<li>нет региональных ограничений: можно находить клиентов как в своем городе или области, так и по всей стране;</li>\n<li>доступность в режиме 24/7: круглосуточно и семь дней в неделю;</li>\n<li>такие преимущества Интернет-магазина как экономия времени и свобода выбора, играют важную роль и для покупателей;</li>\n<li><a title="бизнес в Интернете" href="http://www.imagecms.net/blog/obzory/biznes-v-internete-kak-perspektivnyi-trend" target="_blank">бизнес в Интернете</a> не требует большого количества обслуживающего персонала: можно обойтись одним консультантом там, где обычные торговые точки обслуживают пятерых;</li>\n<li>нет ограничений по количеству представленных на виртуальной витрине товаров;</li>\n<li>в случае с раскруткой и продвижением можно сфокусироваться только на потенциально заинтересованных в ваших товарах или услугах пользователях.</li>\n</ul>\n<p>&nbsp;</p>\n<p>Можно привести несколько примеров развертывания Интернет-магазинов на платформе <a href="http://www.imagecms.net/products/imagecms-shop-professional">ImageCMS Shop Professional</a>: boutique-ekaterinasmolina.ru, euro-technika.com.ua и др. Как видно из примеров, можно торговать в онлайне как с небольшим ассортиментом, так и предлагая тысячи наименований товаров. Учитывая вышеперечисленное, каждый владелец бизнеса может понять, зачем нужен Интернет-магазин и какие выгоды от его разработки можно получить (независимо от того, работаете ли вы с розничной торговлей или в области B2B).</p>', 69, '', '', 0, 0, 0, 'publish', 'Administrator', 1362226037, 1362226037, 1387364069, 5, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `content_fields`
--

DROP TABLE IF EXISTS `content_fields`;
CREATE TABLE IF NOT EXISTS `content_fields` (
  `field_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `weight` int(11) NOT NULL,
  `in_search` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`field_name`),
  UNIQUE KEY `field_name` (`field_name`),
  KEY `type` (`type`),
  KEY `in_search` (`in_search`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `content_fields`
--

INSERT INTO `content_fields` (`field_name`, `type`, `label`, `data`, `weight`, `in_search`) VALUES
('field_list_image', 'text', 'Изображение в списке', 'a:7:{s:5:"label";s:38:"Изображение в списке";s:7:"initial";s:0:"";s:9:"help_text";s:109:"Это изображение будет выводиться на странице списка статей";s:4:"type";s:4:"text";s:20:"enable_image_browser";s:1:"1";s:10:"validation";s:0:"";s:6:"groups";a:1:{i:0;s:2:"13";}}', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `content_fields_data`
--

DROP TABLE IF EXISTS `content_fields_data`;
CREATE TABLE IF NOT EXISTS `content_fields_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `item_type` varchar(15) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `item_type` (`item_type`),
  KEY `field_name` (`field_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Дамп даних таблиці `content_fields_data`
--

INSERT INTO `content_fields_data` (`id`, `item_id`, `item_type`, `field_name`, `data`) VALUES
(24, 91, 'page', 'field_list_image', '');

-- --------------------------------------------------------

--
-- Структура таблиці `content_fields_groups_relations`
--

DROP TABLE IF EXISTS `content_fields_groups_relations`;
CREATE TABLE IF NOT EXISTS `content_fields_groups_relations` (
  `field_name` varchar(64) NOT NULL,
  `group_id` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `content_fields_groups_relations`
--

INSERT INTO `content_fields_groups_relations` (`field_name`, `group_id`) VALUES
('field_sfsdfsdf', 0),
('field_sfsdfsdf', 0),
('field_fyjtyutyu', 0),
('field_fg12', 0),
('field_fg12', 0),
('field_list_image', 13);

-- --------------------------------------------------------

--
-- Структура таблиці `content_field_groups`
--

DROP TABLE IF EXISTS `content_field_groups`;
CREATE TABLE IF NOT EXISTS `content_field_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп даних таблиці `content_field_groups`
--

INSERT INTO `content_field_groups` (`id`, `name`, `description`) VALUES
(13, 'Акции и Новости', '');

-- --------------------------------------------------------

--
-- Структура таблиці `content_permissions`
--

DROP TABLE IF EXISTS `content_permissions`;
CREATE TABLE IF NOT EXISTS `content_permissions` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `page_id` bigint(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп даних таблиці `content_permissions`
--

INSERT INTO `content_permissions` (`id`, `page_id`, `data`) VALUES
(23, 80, 'a:3:{i:0;a:1:{s:7:"role_id";s:1:"0";}i:1;a:1:{s:7:"role_id";s:1:"1";}i:2;a:1:{s:7:"role_id";s:1:"2";}}');

-- --------------------------------------------------------

--
-- Структура таблиці `content_tags`
--

DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE IF NOT EXISTS `content_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_type_id` int(11) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `validators` varchar(255) DEFAULT NULL,
  `entity` varchar(32) DEFAULT NULL,
  `options` varchar(65) DEFAULT NULL,
  `classes` text,
  `position` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

-- --------------------------------------------------------

--
-- Структура таблиці `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
CREATE TABLE IF NOT EXISTS `custom_fields_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `field_data` text,
  `locale` varchar(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=514 ;

-- --------------------------------------------------------

--
-- Структура таблиці `custom_fields_i18n`
--

DROP TABLE IF EXISTS `custom_fields_i18n`;
CREATE TABLE IF NOT EXISTS `custom_fields_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(4) NOT NULL,
  `field_label` varchar(255) DEFAULT NULL,
  `field_description` text,
  `possible_values` text,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE IF NOT EXISTS `emails` (
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `template` text CHARACTER SET utf8 NOT NULL,
  `settings` text CHARACTER SET utf8 NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `emails`
--

INSERT INTO `emails` (`name`, `template`, `settings`, `locale`, `description`) VALUES
('wishListMail', 'Шановний %userName%. Ви створили наступний список побажань %wishKey%<br>Створений: %wishDateCreated%  ', 'a:4:{s:5:"theme";s:29:"Список побажань";s:4:"from";s:43:"Адміністрація магазину";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";a:3:{i:0;s:10:"%userName%";i:1;s:9:"%wishKey%";i:2;s:17:"%wishDateCreated%";}}', 'ua', 'Лист про створений список побажань  '),
('wishListMail', '<h2> Уважаемый %userName%.</h2> Вы создали следующий список желаний %wishKey%<div>Ссылка на просмотр списка желаний -&nbsp;&nbsp; %wishLink% <br>Создан %wishDateCreated%   %orderId% </div>  ', 'a:5:{s:5:"theme";s:14:"Вишлист";s:4:"from";s:43:"Администрация магазина";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о создании списка желаний.  '),
('noticeOfAppearance', 'Шаблон письма  ', 'a:5:{s:5:"theme";s:46:"Уведомлениен о появлении";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма об уведомлении о появлении  '),
('callBackNotification', 'Callback notification  ', 'a:5:{s:5:"theme";s:8:"Callback";s:4:"from";s:24:"Пользователь";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для callback  '),
('toAdminOrderNotification', 'Шаблон письма для администратора о совершении заказа  ', 'a:5:{s:5:"theme";s:59:"Уведомление о совершении заказа";s:4:"from";s:34:"Админ панель сайта";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для администратора о совершении заказа    '),
('toUserOrderNotification', 'Здравствуйте, %userName%.<br><br>Мы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop"<br><br>Вы указали следующие контактные данные:<br><br>Email адрес: %userEmail%<br><br>Номер телефона: %userPhone%<br><br>Адрес доставки: %userDeliver%<br><br>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.<br><br>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; %orderLink%.<br><br>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.<br><br>При возникновении любых вопросов, обращайтесь за телефонами:<br><br>+7 (095) 222-33-22 +38 (098) 222-33-22  ', 'a:5:{s:5:"theme";s:80:"Уведомление покупателя о совершении заказа";s:4:"from";b:0;s:9:"from_mail";s:21:"noreply@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление покупателя о совершении заказа  '),
('toUserChangeOrderStatusNotification', 'Уведомление пользователя о смене статуса заказа    ', 'a:5:{s:5:"theme";s:89:"Уведомление пользователя о смене статуса заказа";s:4:"from";s:37:"Администрация сайта";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление пользователя о смене статуса заказа    '),
('afterOrderUserRegistration', 'Письмо о регистрации на сатйе после совершения заказа  ', 'a:5:{s:5:"theme";s:38:"Регистрация на сайте";s:4:"from";s:43:"Администрация магазина";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о регистрации на сатйе после совершения заказа    '),
('forgotPassword', 'Здравствуйте!<br><br>На сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.<br><br>Для завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri%<br><br>Ваш новый пароль для входа: %password%<br><br>Если это письмо попало к Вам по ошибке просто проигнорируйте его.<br><br>При возникновении любых вопросов, обращайтесь по телефонам:<br><br>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89<br><br>---<br><br>С уважением,<br><br>сотрудники службы продаж %webSiteName%  ', 'a:5:{s:5:"theme";s:41:"Восстановление пароля";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма о восстановлении пароля  '),
('wishListMail', 'Шановний %userName%. Ви створили наступний список побажань %wishKey%<br>Створений: %wishDateCreated%  ', 'a:4:{s:5:"theme";s:29:"Список побажань";s:4:"from";s:43:"Адміністрація магазину";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";a:3:{i:0;s:10:"%userName%";i:1;s:9:"%wishKey%";i:2;s:17:"%wishDateCreated%";}}', 'ua', 'Лист про створений список побажань  '),
('wishListMail', '<h2> Уважаемый %userName%.</h2> Вы создали следующий список желаний %wishKey%<div>Ссылка на просмотр списка желаний -&nbsp;&nbsp; %wishLink% <br>Создан %wishDateCreated%   %orderId% </div>  ', 'a:5:{s:5:"theme";s:14:"Вишлист";s:4:"from";s:43:"Администрация магазина";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о создании списка желаний.  '),
('noticeOfAppearance', 'Шаблон письма  ', 'a:5:{s:5:"theme";s:46:"Уведомлениен о появлении";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма об уведомлении о появлении  '),
('callBackNotification', 'Callback notification  ', 'a:5:{s:5:"theme";s:8:"Callback";s:4:"from";s:24:"Пользователь";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для callback  '),
('toAdminOrderNotification', 'Шаблон письма для администратора о совершении заказа  ', 'a:5:{s:5:"theme";s:59:"Уведомление о совершении заказа";s:4:"from";s:34:"Админ панель сайта";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для администратора о совершении заказа    '),
('toUserOrderNotification', 'Здравствуйте, %userName%.<br><br>Мы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop"<br><br>Вы указали следующие контактные данные:<br><br>Email адрес: %userEmail%<br><br>Номер телефона: %userPhone%<br><br>Адрес доставки: %userDeliver%<br><br>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.<br><br>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; %orderLink%.<br><br>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.<br><br>При возникновении любых вопросов, обращайтесь за телефонами:<br><br>+7 (095) 222-33-22 +38 (098) 222-33-22  ', 'a:5:{s:5:"theme";s:80:"Уведомление покупателя о совершении заказа";s:4:"from";b:0;s:9:"from_mail";s:21:"noreply@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление покупателя о совершении заказа  '),
('toUserChangeOrderStatusNotification', 'Уведомление пользователя о смене статуса заказа    ', 'a:5:{s:5:"theme";s:89:"Уведомление пользователя о смене статуса заказа";s:4:"from";s:37:"Администрация сайта";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление пользователя о смене статуса заказа    '),
('afterOrderUserRegistration', 'Письмо о регистрации на сатйе после совершения заказа  ', 'a:5:{s:5:"theme";s:38:"Регистрация на сайте";s:4:"from";s:43:"Администрация магазина";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о регистрации на сатйе после совершения заказа    '),
('forgotPassword', 'Здравствуйте!<br><br>На сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.<br><br>Для завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri%<br><br>Ваш новый пароль для входа: %password%<br><br>Если это письмо попало к Вам по ошибке просто проигнорируйте его.<br><br>При возникновении любых вопросов, обращайтесь по телефонам:<br><br>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89<br><br>---<br><br>С уважением,<br><br>сотрудники службы продаж %webSiteName%  ', 'a:5:{s:5:"theme";s:41:"Восстановление пароля";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма о восстановлении пароля  ');

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `position` int(9) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `tpl_file` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `created` (`created`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_albums_i18n`
--

DROP TABLE IF EXISTS `gallery_albums_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_albums_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_category`
--

DROP TABLE IF EXISTS `gallery_category`;
CREATE TABLE IF NOT EXISTS `gallery_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_id` int(11) NOT NULL DEFAULT '0',
  `position` int(9) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_category_i18n`
--

DROP TABLE IF EXISTS `gallery_category_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_images`
--

DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `file_name` varchar(150) NOT NULL,
  `file_ext` varchar(8) NOT NULL,
  `file_size` varchar(20) NOT NULL,
  `position` int(9) NOT NULL,
  `width` int(6) NOT NULL,
  `height` int(6) NOT NULL,
  `uploaded` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблиці `gallery_images_i18n`
--

DROP TABLE IF EXISTS `gallery_images_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_images_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(100) NOT NULL,
  `identif` varchar(10) NOT NULL,
  `image` text NOT NULL,
  `folder` varchar(100) NOT NULL,
  `template` varchar(100) NOT NULL,
  `default` int(1) NOT NULL,
  `locale` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identif` (`identif`),
  KEY `default` (`default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Дамп даних таблиці `languages`
--

INSERT INTO `languages` (`id`, `lang_name`, `identif`, `image`, `folder`, `template`, `default`, `locale`) VALUES
(3, 'Русский', 'ru', '', 'russian', 'newLevel', 1, 'ru_RU');

-- --------------------------------------------------------

--
-- Структура таблиці `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ip_address` (`ip_address`),
  KEY `time` (`time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

-- --------------------------------------------------------

--
-- Структура таблиці `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date` (`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=847 ;

--
-- Дамп даних таблиці `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `username`, `message`, `date`) VALUES
(741, 1, 'admin', 'Вышел из панели управления', 1363601996),
(742, 1, 'admin', 'Вошел в панель управления IP 127.0.0.1', 1363602140),
(743, 1, 'admin', 'Изменил настройки сайта', 1363605006),
(744, 1, 'admin', 'Создал виджет popular_products', 1363606273),
(745, 1, 'admin', 'Создал виджет new_products', 1363606324),
(746, 1, 'admin', 'Создал виджет action_products', 1363606361),
(747, 1, 'admin', 'Создал виджет brands', 1363606422),
(748, 1, 'admin', 'Создал виджет view_product', 1363606497),
(749, 1, 'admin', 'Создал виджет similar', 1363606582),
(750, 1, 'admin', 'Создал категорию        <a href="/admin/categories/edit/69"> Новости</a>', 1363608590),
(751, 1, 'admin', 'Создал категорию        <a href="/admin/categories/edit/70"> Последние новости</a>', 1363608751),
(752, 1, 'admin', 'Изменил категорию   <a href="/admin/categories/edit/70"> Последние новости</a>', 1363608759),
(753, 1, 'admin', 'Создал категорию        <a href="/admin/categories/edit/71"> Архив</a>', 1363608777),
(754, 1, 'admin', 'Изменил категорию   <a href="/admin/categories/edit/69"> Новости</a>', 1363610618),
(755, 1, 'admin', 'Вышел из панели управления', 1363617075),
(756, 47, 'admin', 'Вышел из панели управления', 1368174639),
(757, 47, 'admin', 'Вошел в панель управления IP 127.0.0.1', 1368174783),
(758, 47, 'admin', 'Очистил кеш', 1368174887),
(759, 48, 'Administrator', 'Введен IP панели управления 127.0.0.1', 1387210853),
(760, 48, 'Administrator', 'Кэш очищен', 1387211003),
(761, 48, 'Administrator', 'Настройки сайта изменены', 1387211491),
(762, 48, 'Administrator', 'Настройки сайта изменены', 1387211868),
(763, 48, 'Administrator', 'Настройки сайта изменены', 1387212205),
(764, 48, 'Administrator', 'Язык изменен Русский', 1387212257),
(765, 48, 'Administrator', 'Кэш очищен', 1387212263),
(766, 48, 'Administrator', 'Язык изменен Русский', 1387212284),
(767, 48, 'Administrator', 'Язык изменен Русский', 1387212386),
(768, 48, 'Administrator', 'Язык изменен Русский', 1387212435),
(769, 48, 'Administrator', 'Язык изменен Русский', 1387212446),
(770, 48, 'Administrator', 'Кэш очищен', 1387360548),
(771, 48, 'Administrator', 'Кэш очищен', 1387360626),
(772, 48, 'Administrator', 'Модуль установлен mail_chimp', 1387363480),
(773, 48, 'Administrator', 'Кэш очищен', 1387363505),
(774, 48, 'Administrator', 'Удаленный модуль mail_chimp', 1387363744),
(775, 48, 'Administrator', 'Удалено категорию с ID 70', 1387363841),
(776, 48, 'Administrator', 'Удалено категорию с ID 71', 1387363841),
(777, 48, 'Administrator', 'ID удаленой страницы 35', 1387363866),
(778, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/64">О магазине</a>', 1387363906),
(779, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/66">Доставка</a>', 1387363934),
(780, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/66">Доставка и оплата</a>', 1387363950),
(781, 48, 'Administrator', 'ID удаленой страницы 65', 1387363957),
(782, 48, 'Administrator', 'ID удаленой страницы 67', 1387363957),
(783, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/68">Контакты</a>', 1387363966),
(784, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/68">Контакты</a>', 1387363982),
(785, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/64">О магазине</a>', 1387364012),
(786, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/91">Как раскрутить сайт? Методы поискового продвижения</a>', 1387364019),
(787, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/92">Как добавить сайт в Яндекс и Гугл. Советы начинающим вебмастерам</a>', 1387364028),
(788, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/93">8Р: Бизнес в сети</a>', 1387364039),
(789, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/94">Lviv Social Media Camp 2013</a>', 1387364046),
(790, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/94">Lviv Social Media Camp 2013</a>', 1387364053),
(791, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/95">Оценка стоимости сайта и факторы, которые влияют на цену</a>', 1387364060),
(792, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/96">Зачем вашему оффлайн-бизнесу нужен Интернет-магазин?</a>', 1387364069),
(793, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/66">Доставка и оплата</a>', 1387364077),
(794, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/68">Контакты</a>', 1387364083),
(795, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/66">Доставка и оплата</a>', 1387364099),
(796, 48, 'Administrator', 'Категория изменена <a href="/admin/categories/edit/69"> Новости</a>', 1387364144),
(797, 48, 'Administrator', 'Категория изменена <a href="/admin/categories/edit/69"> Новости</a>', 1387364284),
(798, 48, 'Administrator', 'Кэш очищен', 1387364523),
(799, 48, 'Administrator', 'Кэш очищен', 1387364606),
(800, 48, 'Administrator', 'Кэш очищен', 1387365248),
(801, 48, 'Administrator', 'Кэш очищен', 1387366399),
(802, 48, 'Administrator', 'Кэш очищен', 1387366500),
(803, 48, 'Administrator', 'Кэш очищен', 1387366519),
(804, 48, 'Administrator', 'Кэш очищен', 1387366882),
(805, 48, 'Administrator', 'Кэш очищен', 1387389710),
(806, 48, 'Administrator', 'Кэш очищен', 1387389910),
(807, 48, 'Administrator', 'Кэш очищен', 1387389970),
(808, 48, 'Administrator', 'Настройки сайта изменены', 1387390535),
(809, 48, 'Administrator', 'Настройки сайта изменены', 1387390549),
(810, 48, 'Administrator', 'Настройки сайта изменены', 1387390611),
(811, 48, 'Administrator', 'Кэш очищен', 1387390792),
(812, 48, 'Administrator', 'Кэш очищен', 1387390850),
(813, 48, 'Administrator', 'Кэш очищен', 1387391025),
(814, 48, 'Administrator', 'Кэш очищен', 1387391114),
(815, 48, 'Administrator', 'Кэш очищен', 1387391135),
(816, 48, 'Administrator', 'Кэш очищен', 1387391277),
(817, 48, 'Administrator', 'Кэш очищен', 1387391304),
(818, 48, 'Administrator', 'Кэш очищен', 1387391333),
(819, 48, 'Administrator', 'Кэш очищен', 1387391623),
(820, 48, 'Administrator', 'Кэш очищен', 1387391769),
(821, 48, 'Administrator', 'Кэш очищен', 1387391838),
(822, 48, 'Administrator', 'Виджет изменен ', 1387471429),
(823, 48, 'Administrator', 'Виджет изменен ', 1387471478),
(824, 48, 'Administrator', 'Виджет изменен ', 1387471527),
(825, 48, 'Administrator', 'Виджет изменен ', 1387471580),
(826, 48, 'Administrator', 'Виджет изменен ', 1387471616),
(827, 48, 'Administrator', 'Страница изменена <a href="http://newlevel.loc/admin/pages/edit/91">Как раскрутить сайт? Методы поискового продвижения</a>', 1387472085),
(828, 48, 'Administrator', 'Кэш очищен', 1387472629),
(829, 48, 'Administrator', 'Кэш очищен', 1387476557),
(830, 48, 'Administrator', 'Кэш очищен', 1387543508),
(831, 48, 'Administrator', 'Кэш очищен', 1387548212),
(832, 48, 'Administrator', 'Кэш очищен', 1387548227),
(833, 48, 'Administrator', 'Кэш очищен', 1387548244),
(834, 48, 'Administrator', 'Введен IP панели управления 127.0.0.1', 1387559624),
(835, 48, 'Administrator', 'Кэш очищен', 1387983944),
(836, 49, 'admin', 'Настройки сайта изменены', 1388402627),
(837, 49, 'admin', 'Настройки сайта изменены', 1388402686),
(838, 49, 'admin', 'Настройки сайта изменены', 1388402861),
(839, 49, 'admin', 'Настройки сайта изменены', 1388403496),
(840, 49, 'admin', 'Настройки сайта изменены', 1388403940),
(841, 49, 'admin', 'Настройки сайта изменены', 1388404076),
(842, 49, 'admin', 'Настройки сайта изменены', 1388404609),
(843, 49, 'admin', 'вышли с контрольной панели', 1388404860),
(844, 48, 'Administrator', 'Введен IP панели управления 127.0.0.1', 1388404862),
(845, 48, 'Administrator', 'Модуль установлен translator', 1388405320),
(846, 48, 'Administrator', 'Модуль установлен imagebox', 1388405332);

-- --------------------------------------------------------

--
-- Структура таблиці `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `date` int(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `main_title` varchar(300) NOT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `expand_level` int(255) DEFAULT NULL,
  `description` text,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `menus`
--

INSERT INTO `menus` (`id`, `name`, `main_title`, `tpl`, `expand_level`, `description`, `created`) VALUES
(4, 'top_menu', 'Top menu', 'top_menu', 0, 'Меню в верхней части шаблона', '2013-12-18 13:35:13'),
(11, 'left_menu', 'left_menu', 'left_menu', 1, 'Меню в левой части шаблона', '2013-03-18 16:13:38'),
(12, 'footer_menu_mobile', 'footer_menu_mobile', '', 0, 'Меню нижней части мобильной версии', '2013-09-19 17:42:17');

-- --------------------------------------------------------

--
-- Структура таблиці `menus_data`
--

DROP TABLE IF EXISTS `menus_data`;
CREATE TABLE IF NOT EXISTS `menus_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(9) NOT NULL,
  `item_id` int(9) NOT NULL,
  `item_type` varchar(15) NOT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `roles` text,
  `hidden` smallint(1) NOT NULL DEFAULT '0',
  `title` varchar(300) NOT NULL,
  `parent_id` int(9) NOT NULL,
  `position` smallint(5) DEFAULT NULL,
  `description` text,
  `add_data` text,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп даних таблиці `menus_data`
--

INSERT INTO `menus_data` (`id`, `menu_id`, `item_id`, `item_type`, `item_image`, `roles`, `hidden`, `title`, `parent_id`, `position`, `description`, `add_data`) VALUES
(10, 1, 0, 'url', '', '', 0, 'Оплата', 0, 3, NULL, 'a:2:{s:3:"url";s:7:"/oplata";s:7:"newpage";s:1:"0";}'),
(8, 1, 0, 'url', '', '', 0, 'Главная', 0, 1, NULL, 'a:2:{s:3:"url";s:1:"/";s:7:"newpage";s:1:"0";}'),
(9, 1, 64, 'page', '', '', 0, 'О магазине', 0, 2, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(11, 1, 0, 'url', '', '', 0, 'Доставка', 0, 4, NULL, 'a:2:{s:3:"url";s:9:"/dostavka";s:7:"newpage";s:1:"0";}'),
(12, 1, 0, 'url', '', '', 0, 'Помощь', 0, 5, NULL, 'a:2:{s:3:"url";s:5:"/help";s:7:"newpage";s:1:"0";}'),
(13, 1, 0, 'url', '', '', 0, 'Контакты', 0, 6, NULL, 'a:2:{s:3:"url";s:11:"/contact_us";s:7:"newpage";s:1:"0";}'),
(14, 4, 0, 'url', '', '', 0, 'Главная', 0, 1, NULL, 'a:2:{s:3:"url";s:1:"/";s:7:"newpage";s:1:"0";}'),
(15, 4, 64, 'page', '', '', 0, 'О магазине', 0, 2, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(16, 4, 66, 'page', '', '', 0, 'Доставка', 0, 3, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(17, 4, 67, 'page', '', '', 0, 'Помощь', 0, 4, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(18, 4, 68, 'page', '', '', 0, 'Контакты', 0, 5, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(19, 5, 0, 'url', '', '', 0, 'Главная', 0, 1, NULL, 'a:2:{s:3:"url";s:1:"/";s:7:"newpage";s:1:"0";}'),
(20, 5, 0, 'url', '', '', 0, 'Видео', 0, 2, NULL, 'a:2:{s:3:"url";s:20:"/shop/category/video";s:7:"newpage";s:1:"0";}'),
(21, 5, 64, 'page', '', '', 0, 'О магазине', 0, 3, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(22, 5, 0, 'url', '', '', 0, 'Домашнее  аудио', 0, 4, NULL, 'a:2:{s:3:"url";s:30:"/shop/category/domashnee_audio";s:7:"newpage";s:1:"0";}'),
(23, 5, 66, 'page', '', '', 0, 'Доставка и оплата', 0, 5, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(24, 5, 0, 'url', '', '', 0, 'Фото и камеры', 0, 6, NULL, 'a:2:{s:3:"url";s:28:"/shop/category/foto_i_kamery";s:7:"newpage";s:1:"0";}'),
(25, 5, 67, 'page', '', '', 0, 'Помощь', 0, 7, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(26, 5, 0, 'url', '', '', 0, 'Домашняя электроника', 0, 8, NULL, 'a:2:{s:3:"url";s:38:"/shop/category/domashniaia_elektronika";s:7:"newpage";s:1:"0";}'),
(27, 5, 68, 'page', '', '', 0, 'Контакты', 0, 9, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(28, 5, 0, 'url', '', '', 0, 'Авто музыка и видео', 0, 10, NULL, 'a:2:{s:3:"url";s:34:"/shop/category/avto_muzyka_i_video";s:7:"newpage";s:1:"0";}'),
(37, 11, 69, 'category', NULL, '', 0, 'Новости', 0, 2, NULL, 'N;'),
(38, 11, 70, 'category', NULL, '', 0, 'Последние новости', 37, 1, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(39, 11, 71, 'category', NULL, '', 0, 'Архив', 37, 2, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(40, 4, 69, 'category', NULL, '', 0, 'Новости', 0, 6, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(41, 11, 64, 'page', NULL, 'a:1:{i:0;s:1:"0";}', 0, 'О магазине', 0, 6, NULL, 'a:2:{s:4:"page";N;s:7:"newpage";i:0;}'),
(42, 11, 66, 'page', NULL, '', 0, 'Доставка', 0, 3, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(43, 11, 67, 'page', NULL, '', 0, 'Помощь', 0, 4, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(44, 12, 67, 'page', '', '', 0, 'Помощь', 0, 2, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(45, 12, 65, 'page', '', '', 0, 'Оплата', 0, 3, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(46, 12, 35, 'page', '', '', 0, 'О сайте', 0, 4, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(47, 12, 66, 'page', '', '', 0, 'Доставка', 0, 5, NULL, 'a:1:{s:7:"newpage";i:0;}');

-- --------------------------------------------------------

--
-- Структура таблиці `menu_translate`
--

DROP TABLE IF EXISTS `menu_translate`;
CREATE TABLE IF NOT EXISTS `menu_translate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `lang_id` (`lang_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Дамп даних таблиці `menu_translate`
--

INSERT INTO `menu_translate` (`id`, `item_id`, `lang_id`, `title`) VALUES
(32, 8, 30, 'Home'),
(31, 8, 3, 'Главная'),
(6, 9, 30, 'About'),
(5, 9, 3, 'О Магазине'),
(7, 13, 3, 'Контакты'),
(8, 13, 30, 'Contacts'),
(11, 10, 3, 'Оплата'),
(12, 10, 30, 'Delivery'),
(15, 12, 3, 'Помощь'),
(16, 12, 30, 'Help'),
(17, 14, 3, 'Главная'),
(18, 14, 30, 'Home'),
(19, 15, 3, 'О магазине'),
(20, 15, 30, 'About'),
(21, 16, 3, 'Доставка'),
(22, 16, 30, 'Delivery'),
(23, 17, 3, 'Помощь'),
(24, 17, 30, 'Help'),
(25, 18, 3, 'Контакты'),
(26, 18, 30, 'Contacts'),
(29, 19, 3, 'Главная'),
(30, 19, 30, 'Home'),
(33, 20, 3, 'Видео'),
(34, 20, 30, 'Video'),
(36, 21, 3, 'О магазине'),
(37, 21, 30, 'About'),
(38, 22, 3, 'Домашнее аудио'),
(39, 22, 30, 'Home music'),
(40, 23, 3, 'Доставка и оплата'),
(41, 23, 30, 'Delivery'),
(42, 24, 3, 'Фото и камеры'),
(43, 24, 30, 'Photo and Camera'),
(44, 25, 3, 'Помощь'),
(45, 25, 30, 'Help'),
(46, 26, 3, 'Домашняя электроника'),
(47, 26, 30, 'Home Electronics'),
(48, 27, 3, 'Контакты'),
(49, 27, 30, 'Contacts'),
(50, 28, 3, 'Авто музыка и видео'),
(51, 28, 30, 'Auto Tabs');

-- --------------------------------------------------------

--
-- Структура таблиці `mod_banner`
--

DROP TABLE IF EXISTS `mod_banner`;
CREATE TABLE IF NOT EXISTS `mod_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL,
  `active_to` int(11) DEFAULT NULL,
  `where_show` text,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mod_banner`
--

INSERT INTO `mod_banner` (`id`, `active`, `active_to`, `where_show`, `position`) VALUES
(1, 1, 1512079200, 'a:3:{i:0;s:6:"main_0";i:1;s:16:"shop_category_40";i:2;s:16:"shop_category_43";}', 1),
(2, 1, 1572465600, 'a:2:{i:0;s:6:"main_0";i:1;s:8:"brand_26";}', 0),
(3, 1, 1564776000, 'a:1:{i:0;s:6:"main_0";}', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `mod_banner_i18n`
--

DROP TABLE IF EXISTS `mod_banner_i18n`;
CREATE TABLE IF NOT EXISTS `mod_banner_i18n` (
  `id` int(11) NOT NULL,
  `url` text,
  `locale` varchar(5) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  KEY `id` (`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mod_banner_i18n`
--

INSERT INTO `mod_banner_i18n` (`id`, `url`, `locale`, `name`, `description`, `photo`) VALUES
(1, 'shop/brand/epson', 'ru', 'epson', '', '/uploads/shop/banners/template-imageshop-banner-1.jpg'),
(2, '/shop/brand/sony', 'ru', 'sony', '', '/uploads/shop/banners/template-imageshop-banner-2.jpg'),
(3, 'shop/brand/samsung', 'ru', 'apple/samsung', '', '/uploads/shop/banners/template-imageshop-banner-3.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_all_order`
--

DROP TABLE IF EXISTS `mod_discount_all_order`;
CREATE TABLE IF NOT EXISTS `mod_discount_all_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `for_autorized` tinyint(4) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `is_gift` tinyint(4) DEFAULT NULL,
  `begin_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_brand`
--

DROP TABLE IF EXISTS `mod_discount_brand`;
CREATE TABLE IF NOT EXISTS `mod_discount_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_category`
--

DROP TABLE IF EXISTS `mod_discount_category`;
CREATE TABLE IF NOT EXISTS `mod_discount_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_comulativ`
--

DROP TABLE IF EXISTS `mod_discount_comulativ`;
CREATE TABLE IF NOT EXISTS `mod_discount_comulativ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discount_id` int(11) DEFAULT NULL,
  `begin_value` int(11) DEFAULT NULL,
  `end_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_group_user`
--

DROP TABLE IF EXISTS `mod_discount_group_user`;
CREATE TABLE IF NOT EXISTS `mod_discount_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_product`
--

DROP TABLE IF EXISTS `mod_discount_product`;
CREATE TABLE IF NOT EXISTS `mod_discount_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_discount_user`
--

DROP TABLE IF EXISTS `mod_discount_user`;
CREATE TABLE IF NOT EXISTS `mod_discount_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discount_id` (`discount_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mod_discount_user`
--

INSERT INTO `mod_discount_user` (`id`, `user_id`, `discount_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mod_email_paterns`
--

DROP TABLE IF EXISTS `mod_email_paterns`;
CREATE TABLE IF NOT EXISTS `mod_email_paterns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `patern` text,
  `from` varchar(256) NOT NULL,
  `from_email` varchar(256) NOT NULL,
  `admin_email` varchar(256) NOT NULL,
  `type` enum('HTML','Text') NOT NULL DEFAULT 'HTML',
  `user_message_active` tinyint(1) NOT NULL,
  `admin_message_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп даних таблиці `mod_email_paterns`
--

INSERT INTO `mod_email_paterns` (`id`, `name`, `patern`, `from`, `from_email`, `admin_email`, `type`, `user_message_active`, `admin_message_active`) VALUES
(1, 'make_order', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 1),
(2, 'change_order_status', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 0),
(3, 'notification_email', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 0),
(4, 'create_user', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 1),
(5, 'forgot_password', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 0),
(6, 'change_password', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 0),
(7, 'price_change', '', 'Администрация сайта', 'no-replay@shop.com', '', 'HTML', 1, 0),
(8, 'wish_list', '', '', '', '', 'HTML', 1, 0),
(9, 'callback', '', '', '', '', 'HTML', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `mod_email_paterns_i18n`
--

DROP TABLE IF EXISTS `mod_email_paterns_i18n`;
CREATE TABLE IF NOT EXISTS `mod_email_paterns_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `theme` varchar(256) NOT NULL,
  `user_message` text NOT NULL,
  `admin_message` text NOT NULL,
  `description` text NOT NULL,
  `variables` text NOT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mod_email_paterns_i18n`
--

INSERT INTO `mod_email_paterns_i18n` (`id`, `locale`, `theme`, `user_message`, `admin_message`, `description`, `variables`) VALUES
(1, 'ru', 'Заказ товара', '<p><span>Здравствуйте, $userName$.</span><br /><br /><span>Мы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop"</span><br /><br /><span>Вы указали следующие контактные данные:</span><br /><br /><span>Email адрес: $userEmail$</span><br /><br /><span>Номер телефона: $userPhone$</span><br /><br /><span>Адрес доставки: $userDeliver$</span><br /><br /><span>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.</span><br /><br /><span>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; $orderLink$.</span><br /><br /><span>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.</span><br /><br /><span>При возникновении любых вопросов, обращайтесь за телефонами:</span><br /><br /><span>+7 (095) 222-33-22 +38 (098) 222-33-22</span></p>', '<p>Пользователь&nbsp;<span>$userName$ совершил заказ товара&nbsp;</span></p>\n<p><span><span>Email адрес: $userEmail$</span><br /><br /><span>Номер телефона: $userPhone$</span><br /><br /><span>Адрес доставки: $userDeliver$</span></span></p>', '<p><span>Уведомление покупателя о совершении заказа</span></p>', 'a:8:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:11:"$userPhone$";s:39:"Телефон Пользователя";s:13:"$userDeliver$";s:27:"Адрес доставки";s:11:"$orderLink$";s:28:"Ссылка на заказ";s:10:"$products$";s:29:"Продукты заказа";s:11:"$checkLink$";s:37:"Ссылка на чек заказа";s:12:"$totalPrice$";s:23:"Сумма заказа";}'),
(2, 'ru', 'Смена статуса заказа', '<p><span data-mce-mark="1">Здравствуйте, $userName$.</span><br /><br /><span data-mce-mark="1">Статус вашего заказа изменен на&nbsp;<span data-mce-mark="1">$status$</span></span><br /><br /><span data-mce-mark="1">Вы указали следующие контактные данные:</span><br /><br /><span data-mce-mark="1">Email адрес: $userEmail$</span><br /><br /><span data-mce-mark="1">Номер телефона: $userPhone$</span><br /><br /><span data-mce-mark="1">Адрес доставки: $userDeliver$</span></p>\n<p><span>Комментарий:&nbsp; $comment$</span><br /><br /><span>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.</span><br /><br /><span>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; $orderLink$.</span><br /><br /><span>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.</span><br /><br /><span>При возникновении любых вопросов, обращайтесь за телефонами:</span><br /><br /><span>+7 (095) 222-33-22 +38 (098) 222-33-22</span>&nbsp;</p>', '', '<p>Смена статуса заказа</p>', 'a:5:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:11:"$orderLink$";s:28:"Ссылка на заказ";s:8:"$status$";s:25:"статус заказа";s:9:"$comment$";s:22:"Комментарий";}'),
(3, 'ru', 'Уведомление', '<p><span>Здравствуйте, $userName$.</span><br /><br /><span>Статус товара $productName$&nbsp;за которым вы следите изменен на <span>$status$</span></span><br /><br /><span>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.</span><br /><br /><span>При возникновении любых вопросов, обращайтесь за телефонами:</span><br /><br /><span>+7 (095) 222-33-22 +38 (098) 222-33-22</span>&nbsp;</p>', '', '<p>Уведомление о появлении</p>', 'a:5:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:13:"$productName$";s:33:"Название продукта";s:8:"$status$";s:12:"Статус";s:13:"$productLink$";s:32:"Ссылка на продукт";}'),
(4, 'ru', 'Создание пользователя', '<p><span>Успешно пройдена реєстрация $user_name$&nbsp;</span></p>\n<p>Ваши данние:<br /><span>Пароль: $user_password$</span><br /><span>Адрес: &nbsp;$user_address$</span><br /><span>Email: $user_email$</span><br /><span>Телефон: $user_phone$</span></p>', '<p><span>Создан пользователь $user_name$:</span><br /><span>С паролем: $user_password$</span><br /><span>Адресом: &nbsp;$<span>user_</span>address$</span><br /><span>Email пользователя: $user_email$</span><br /><span>Телефон пользователя: $user_phone$</span></p>', '<p>Шаблон письма на создание пользователя</p>', 'a:6:{s:11:"$user_name$";s:31:"Имя пользователя";s:14:"$user_address$";s:35:"Адрес пользователя";s:15:"$user_password$";s:37:"Пароль пользователя";s:12:"$user_phone$";s:39:"Телефон пользователя";s:12:"$user_email$";s:30:"Email пользователя";}'),
(5, 'ru', 'Восстановление пароля', '<p><span>Здравствуйте!</span><br /><br /><span>На сайте $webSiteName$ создан запрос на восстановление пароля для Вашего аккаунта.</span><br /><br /><span>Для завершения процедуры восстановления пароля перейдите по ссылке $resetPasswordUri$</span><br /><br /><span>Ваш новый пароль для входа: $password$</span><br /><br /><span>Если это письмо попало к Вам по ошибке просто проигнорируйте его.</span><br /><br /><span>При возникновении любых вопросов, обращайтесь по телефонам:</span><br /><br /><span>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89</span><br /><br /><span>---</span><br /><br /><span>С уважением,</span><br /><br /><span>сотрудники службы продаж $webSiteName$</span></p>', '', 'Шаблон письма на  восстановление пароля', 'a:5:{s:13:"$webSiteName$";s:17:"Имя сайта";s:18:"$resetPasswordUri$";s:57:"Ссылка на восстановления пароля";s:10:"$password$";s:12:"Пароль";s:5:"$key$";s:8:"Ключ";s:16:"$webMasterEmail$";s:52:"Email сотрудников службы продаж";}'),
(6, 'ru', 'Смена пароля', '<p><span>Здравствуйте $user_name$!</span><br /><br /><span>Ваш новый пароль для входа: $password$</span><br /><br /><span>Если это письмо попало к Вам по ошибке просто проигнорируйте его.</span><br /><br /><span><br /></span></p>', '', '<p>Шаблон письма изменения пароля</p>', 'a:2:{s:11:"$user_name$";s:31:"Имя пользователя";s:10:"$password$";s:23:"Новий пароль";}'),
(7, 'ru', 'Изменение цены', '<p>Цена на $name$ за которым вы следите на сайте $server$ изменилась.<br /> <a title="Посмотреть список слежения" href="$list_url_look$">Посмотреть список слежения</a><br /> <a title="Отписатся от слежения" href="$delete_list_url_look$">Отписатся от слежения</a></p>\n<div id="dc_vk_code"  none;">&nbsp;</div>', '<p>&nbsp;</p>\n<div id="dc_vk_code">&nbsp;</div>', '<p>Изменение цены</p>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>', ''),
(7, 'ua', 'Ціна змінилася', '<p>Ціна на $name$ за яким Ви слідкуєте на сайті $server$ змінилася.<br /> <a title="Переглянути список слідкувань" href="$list_url_look$">Переглянути список слідкувань</a><br /> <a title="Відписатися від слідкування" href="$delete_list_url_look$">Відписатися від слідкування</a></p>\n<div id="dc_vk_code"  none;">&nbsp;</div>', '<p>&nbsp;</p>\n<div id="dc_vk_code">&nbsp;</div>', '<p>Слідкування за ціною</p>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>', ''),
(8, 'ru', 'Список Желаний', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Вы создали список желаний $wishName$</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Ссылка на просмотр списка желаний <a href="$wishLink$" target="_blank">$wishLink$</a></p>', '<p>Пользователь&nbsp;<span>$userName$ совершил заказ товара&nbsp;</span></p>\n<p><span><span>Email адрес: $userEmail$</span><br /><br /><span>Номер телефона: $userPhone$</span><br /><br /><span>Адрес доставки: $userDeliver$</span></span></p>', '<p><span>Уведомление покупателя о создании списка желаний</span></p>', 'a:4:{s:10:"$userName$";s:31:"Имя пользователя";s:10:"$wishName$";s:29:"Название списка";s:10:"$wishLink$";s:30:"Ссилка на список";s:15:"$wishListViews$";s:54:"Количество просмотров списка";}'),
(9, 'ru', 'Заказ звонка', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Вы заказали звонок в нашей компании<br />Менеджеры нашего магазина вскоре свяжутся с Вами.</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Вы указали следующие контактные данные:</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Телефон: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Коментарий: </span>$userComment$</div>', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Новий запрос о Заказе дзвонка от $userName$</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Дата колбека: </span>$dateCreated$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Телефон пользователя: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Коментарий пользователя: </span>$userComment$</div>', '<p>Шаблон заказа звонка</p>', 'a:6:{s:16:"$callbackStatus$";s:27:"Статус колбека";s:15:"$callbackTheme$";s:23:"Тема колбека";s:10:"$userName$";s:69:"Имя пользователя запросившего звонок";s:11:"$userPhone$";s:87:"Номер телефона пользователя запросившего Сallback";s:13:"$dateCreated$";s:23:"Дата колбека";s:13:"$userComment$";s:63:" Комментарии пользователя колбека";}');

-- --------------------------------------------------------

--
-- Структура таблиці `mod_new_level_columns`
--

DROP TABLE IF EXISTS `mod_new_level_columns`;
CREATE TABLE IF NOT EXISTS `mod_new_level_columns` (
  `category_id` varchar(500) NOT NULL,
  `column` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_new_level_product_properties_types`
--

DROP TABLE IF EXISTS `mod_new_level_product_properties_types`;
CREATE TABLE IF NOT EXISTS `mod_new_level_product_properties_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `type` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп даних таблиці `mod_new_level_product_properties_types`
--

INSERT INTO `mod_new_level_product_properties_types` (`id`, `property_id`, `name`, `type`) VALUES
(1, 29, 0, 'a:1:{i:0;s:6:"scroll";}'),
(4, 28, 0, 'a:2:{i:0;s:6:"scroll";i:1;s:8:"dropDown";}'),
(5, 22, 0, 'a:1:{i:0;s:8:"dropDown";}'),
(6, 21, 0, 'a:1:{i:0;s:6:"scroll";}'),
(7, 24, 0, 'a:2:{i:0;s:8:"dropDown";i:1;s:6:"scroll";}');
-- --------------------------------------------------------

--
-- Структура таблиці `mod_sample_settings`
--
DROP TABLE IF EXISTS `mod_sample_settings`;
CREATE TABLE IF NOT EXISTS `mod_sample_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `mod_sample_settings`
--

INSERT INTO `mod_sample_settings` (`id`, `name`, `value`) VALUES
(1, 'mailTo', 'admin@site.com'),
(2, 'useEmailNotification', 'TRUE'),
(3, 'key', 'UUUsssTTTeee');
-- --------------------------------------------------------

--
-- Структура таблиці `mod_shop_discounts`
--

DROP TABLE IF EXISTS `mod_shop_discounts`;
CREATE TABLE IF NOT EXISTS `mod_shop_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(25) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `max_apply` int(11) DEFAULT NULL,
  `count_apply` int(11) DEFAULT NULL,
  `date_begin` int(11) DEFAULT NULL,
  `date_end` int(11) DEFAULT NULL,
  `type_value` tinyint(4) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type_discount` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `mod_shop_discounts`
--

INSERT INTO `mod_shop_discounts` (`id`, `key`, `name`, `active`, `max_apply`, `count_apply`, `date_begin`, `date_end`, `type_value`, `value`, `type_discount`) VALUES
(1, '1mf82j8lypb107d5', NULL, 1, NULL, NULL, 1387490400, 0, 1, 12, 'user');

-- --------------------------------------------------------

--
-- Структура таблиці `mod_shop_discounts_i18n`
--

DROP TABLE IF EXISTS `mod_shop_discounts_i18n`;
CREATE TABLE IF NOT EXISTS `mod_shop_discounts_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `mod_shop_discounts_i18n`
--

INSERT INTO `mod_shop_discounts_i18n` (`id`, `locale`, `name`) VALUES
(1, 'ru', 'знижка адміна');

-- --------------------------------------------------------

--
-- Структура таблиці `mod_shop_news`
--

DROP TABLE IF EXISTS `mod_shop_news`;
CREATE TABLE IF NOT EXISTS `mod_shop_news` (
  `content_id` int(11) NOT NULL,
  `shop_categories_ids` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_wish_list`
--

DROP TABLE IF EXISTS `mod_wish_list`;
CREATE TABLE IF NOT EXISTS `mod_wish_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(254) NOT NULL,
  `description` text,
  `access` enum('public','private','shared') NOT NULL DEFAULT 'shared',
  `user_id` int(11) NOT NULL,
  `review_count` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_wish_list_products`
--

DROP TABLE IF EXISTS `mod_wish_list_products`;
CREATE TABLE IF NOT EXISTS `mod_wish_list_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wish_list_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `mod_wish_list_users`
--

DROP TABLE IF EXISTS `mod_wish_list_users`;
CREATE TABLE IF NOT EXISTS `mod_wish_list_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(254) DEFAULT NULL,
  `user_image` text,
  `user_birthday` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `propel_migration`
--

DROP TABLE IF EXISTS `propel_migration`;
CREATE TABLE IF NOT EXISTS `propel_migration` (
  `version` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `propel_migration`
--

INSERT INTO `propel_migration` (`version`) VALUES
(1363604832);

-- --------------------------------------------------------

--
-- Структура таблиці `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `votes` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE IF NOT EXISTS `search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(264) NOT NULL,
  `datetime` int(11) NOT NULL,
  `where_array` text NOT NULL,
  `select_array` text NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `order_by` text NOT NULL,
  `row_count` int(11) NOT NULL,
  `total_rows` int(11) NOT NULL,
  `ids` text NOT NULL,
  `search_title` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `datetime` (`datetime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Структура таблиці `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(50) NOT NULL,
  `create_keywords` varchar(25) NOT NULL,
  `create_description` varchar(25) NOT NULL,
  `create_cat_keywords` varchar(25) NOT NULL,
  `create_cat_description` varchar(25) NOT NULL,
  `add_site_name` int(1) NOT NULL,
  `add_site_name_to_cat` int(1) NOT NULL,
  `delimiter` varchar(5) NOT NULL,
  `editor_theme` varchar(10) NOT NULL,
  `site_template` varchar(50) NOT NULL,
  `site_offline` varchar(5) NOT NULL,
  `google_analytics_id` varchar(40) DEFAULT NULL,
  `main_type` varchar(50) NOT NULL,
  `main_page_id` int(11) NOT NULL,
  `main_page_cat` text NOT NULL,
  `main_page_module` varchar(50) NOT NULL,
  `sidepanel` varchar(5) NOT NULL,
  `lk` varchar(250) DEFAULT NULL,
  `lang_sel` varchar(15) NOT NULL DEFAULT 'russian_lang',
  `google_webmaster` varchar(200) DEFAULT NULL,
  `yandex_webmaster` varchar(200) DEFAULT NULL,
  `yandex_metric` varchar(11) NOT NULL,
  `ss` varchar(255) NOT NULL,
  `cat_list` varchar(10) NOT NULL,
  `text_editor` varchar(30) NOT NULL,
  `siteinfo` text NOT NULL,
  `update` text,
  `backup` text,
  PRIMARY KEY (`id`),
  KEY `s_name` (`s_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `settings`
--

INSERT INTO `settings` (`id`, `s_name`, `create_keywords`, `create_description`, `create_cat_keywords`, `create_cat_description`, `add_site_name`, `add_site_name_to_cat`, `delimiter`, `editor_theme`, `site_template`, `site_offline`, `google_analytics_id`, `main_type`, `main_page_id`, `main_page_cat`, `main_page_module`, `sidepanel`, `lk`, `lang_sel`, `google_webmaster`, `yandex_webmaster`, `yandex_metric`, `ss`, `cat_list`, `text_editor`, `siteinfo`, `update`, `backup`) VALUES
(2, 'main', 'auto', 'auto', '0', '0', 1, 1, '/', '0', 'newLevel', 'no', '', 'module', 69, '63', 'shop', '', '', 'russian_lang', '', '', '', '', 'yes', 'tinymce', 'a:3:{s:13:"siteinfo_logo";a:1:{s:8:"newLevel";s:8:"logo.png";}s:16:"siteinfo_favicon";a:1:{s:8:"newLevel";s:11:"favicon.ico";}s:2:"ru";a:7:{s:20:"siteinfo_companytype";s:97:"© Интернет-магазин «<a href="http://www.imagecms.net/">ImageCMS Shop</a>», 2013";s:16:"siteinfo_address";s:63:"Улица Шевченка, Буд. 22, офис: 39, Київ";s:18:"siteinfo_mainphone";s:15:"(097) 567-43-21";s:19:"siteinfo_adminemail";s:19:"webmaster@localhost";s:14:"siteinfo_Email";s:20:"partner@imagecms.net";s:14:"siteinfo_Skype";s:8:"imagecms";s:8:"contacts";a:2:{s:5:"Email";s:20:"partner@imagecms.net";s:5:"Skype";s:8:"imagecms";}}}', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `settings_i18n`
--

DROP TABLE IF EXISTS `settings_i18n`;
CREATE TABLE IF NOT EXISTS `settings_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_ident` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `settings_i18n`
--

INSERT INTO `settings_i18n` (`id`, `lang_ident`, `name`, `short_name`, `description`, `keywords`) VALUES
(1, 3, 'Сайт клиента', 'Клиент', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_banners`
--

DROP TABLE IF EXISTS `shop_banners`;
CREATE TABLE IF NOT EXISTS `shop_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `categories` text,
  `on_main` tinyint(1) DEFAULT NULL,
  `espdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_banners_I_1` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `shop_banners`
--

INSERT INTO `shop_banners` (`id`, `position`, `active`, `categories`, `on_main`, `espdate`) VALUES
(7, 23, 1, 'false', 1, 2147483647),
(11, 24, 1, 'false', 1, 2147457600),
(12, 25, 1, 'false', 1, 2147457600);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_banners_i18n`
--

DROP TABLE IF EXISTS `shop_banners_i18n`;
CREATE TABLE IF NOT EXISTS `shop_banners_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_banners_i18n`
--

INSERT INTO `shop_banners_i18n` (`id`, `locale`, `name`, `text`, `url`, `image`) VALUES
(12, 'ru', 'Samsung', ' ', '/shop/brand/samsung', 'template-imageshop-banner-3.jpg'),
(7, 'ru', 'Epson', ' ', '/shop/brand/epson', 'template-imageshop-banner-1.jpg'),
(11, 'ru', 'Sony', ' ', '/shop/brand/sony', 'template-imageshop-banner-2.jpg');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_brands`
--

DROP TABLE IF EXISTS `shop_brands`;
CREATE TABLE IF NOT EXISTS `shop_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_brands_I_2` (`url`),
  KEY `shop_brands_I_1` (`url`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Дамп даних таблиці `shop_brands`
--

INSERT INTO `shop_brands` (`id`, `url`, `image`, `position`) VALUES
(30, 'pioneer', 'pioneer.png', 0),
(39, 'motorola', NULL, 0),
(26, 'sony', 'sony.png', 0),
(27, 'apple', 'apple.png', 0),
(28, 'samsung', 'samsung.png', 0),
(29, 'panasonic', 'panasonic.png', 0),
(34, 'canon', NULL, 0),
(35, 'lg', NULL, 0),
(36, 'yamaha', 'yamaha.png', 0),
(37, 'epson', NULL, 0),
(38, 'plantronics', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_brands_i18n`
--

DROP TABLE IF EXISTS `shop_brands_i18n`;
CREATE TABLE IF NOT EXISTS `shop_brands_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_brands_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_brands_i18n`
--

INSERT INTO `shop_brands_i18n` (`id`, `locale`, `name`, `description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(30, 'ru', 'Pioneer', '<p><span style="font-weight:bold">Pioneer Corporation </span>— производитель электронной и аудио-видеоаппаратуры для дома, автомобиля, коммерческих и промышленных предприятий.&nbsp;Основана в 1938 году в Токио.</p><br>  ', '', '', ''),
(26, 'ru', 'Sony', '<span style="font-weight:bold">Sony Corporation&nbsp;</span>— транснациональная корпорация со штаб-квартирой в Японии, возникшая в 1946 году.  ', '', '', ''),
(27, 'ru', 'Apple', '', '', '', ''),
(28, 'ru', 'Samsung', '<span style="font-weight:bold">Samsung Group </span>&nbsp; — промышленный концерн (группа компаний), один из крупнейших в Южной Корее, основанный в 1938 году. На мировом рынке известен как производитель высокотехнологичных компонентов, телекоммуникационного оборудования, бытовой техники, аудио- и видео устройств.  ', '', '', ''),
(29, 'ru', 'Panasonic', '<span style="font-weight:bold">Panasonic Corporation </span>— крупная японская машиностроительная корпорация, один из крупнейших в мире производителей бытовой техники и электронных товаров.  ', '', '', ''),
(29, 'en', 'Impression Computers', '', '', '', ''),
(26, 'en', 'Hewlett Packard', '', '', '', ''),
(30, 'en', 'Bravo Computers', '', '', '', ''),
(28, 'en', 'Brain', '', '', '', ''),
(27, 'en', 'Apple', '', '', '', ''),
(34, 'ru', 'Canon', ' ', '', '', ''),
(35, 'ru', 'LG', ' ', '', '', ''),
(36, 'ru', 'Yamaha', '<span style="font-weight:bold">Yamaha Corporation </span>— японский концерн, производящий музыкальные инструменты, акустические системы, звуковое оборудование, спортивный инвентарь и многое другое.  ', '', '', ''),
(37, 'ru', 'Epson', ' ', '', '', ''),
(38, 'ru', 'Plantronics', ' ', '', '', ''),
(39, 'ru', 'Motorola', ' ', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_callbacks`
--

DROP TABLE IF EXISTS `shop_callbacks`;
CREATE TABLE IF NOT EXISTS `shop_callbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `theme_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_callbacks_I_1` (`user_id`),
  KEY `shop_callbacks_I_2` (`status_id`),
  KEY `shop_callbacks_I_3` (`theme_id`),
  KEY `shop_callbacks_I_4` (`date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Структура таблиці `shop_callbacks_statuses`
--

DROP TABLE IF EXISTS `shop_callbacks_statuses`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп даних таблиці `shop_callbacks_statuses`
--

INSERT INTO `shop_callbacks_statuses` (`id`, `is_default`) VALUES
(1, 1),
(3, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_callbacks_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_callbacks_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_callbacks_statuses_i18n_I_1` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_callbacks_statuses_i18n`
--

INSERT INTO `shop_callbacks_statuses_i18n` (`id`, `locale`, `text`) VALUES
(1, 'ru', 'Новый'),
(3, 'ru', 'Обработан');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_callbacks_themes`
--

DROP TABLE IF EXISTS `shop_callbacks_themes`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп даних таблиці `shop_callbacks_themes`
--

INSERT INTO `shop_callbacks_themes` (`id`, `position`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_callbacks_themes_i18n`
--

DROP TABLE IF EXISTS `shop_callbacks_themes_i18n`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_themes_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_callbacks_themes_i18n_I_1` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_callbacks_themes_i18n`
--

INSERT INTO `shop_callbacks_themes_i18n` (`id`, `locale`, `text`) VALUES
(1, 'ru', 'Первая тема'),
(1, 'ua', 'Перша тема');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `full_path` varchar(1000) DEFAULT NULL,
  `full_path_ids` varchar(250) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tpl` varchar(250) DEFAULT NULL,
  `order_method` int(11) DEFAULT NULL,
  `showsitetitle` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_category_I_2` (`url`),
  KEY `shop_category_I_3` (`active`),
  KEY `shop_category_I_4` (`parent_id`),
  KEY `shop_category_I_5` (`position`),
  KEY `shop_category_I_1` (`url`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84 ;

--
-- Дамп даних таблиці `shop_category`
--

INSERT INTO `shop_category` (`id`, `url`, `parent_id`, `position`, `full_path`, `full_path_ids`, `active`, `external_id`, `image`, `tpl`, `order_method`, `showsitetitle`) VALUES
(52, 'avto_muzyka_i_video', 0, 7, 'avto_muzyka_i_video', 'a:0:{}', 1, NULL, NULL, '', 1, NULL),
(51, 'bluetooth', 48, 13, 'domashniaia_elektronika/bluetooth', 'a:1:{i:0;i:48;}', 1, NULL, NULL, '', 1, NULL),
(50, 'telefony', 48, 12, 'domashniaia_elektronika/telefony', 'a:1:{i:0;i:48;}', 1, NULL, NULL, '', 1, NULL),
(48, 'domashniaia_elektronika', 0, 8, 'domashniaia_elektronika', 'a:0:{}', 1, NULL, NULL, '', 1, NULL),
(46, 'fotoprintery', 44, 16, 'foto_i_kamery/fotoprintery', 'a:1:{i:0;i:44;}', 1, NULL, NULL, '', 1, NULL),
(45, 'tsifrovye_kamery', 44, 15, 'foto_i_kamery/tsifrovye_kamery', 'a:1:{i:0;i:44;}', 1, NULL, NULL, '', 1, NULL),
(44, 'foto_i_kamery', 0, 9, 'foto_i_kamery', 'a:0:{}', 1, NULL, NULL, '', 1, NULL),
(43, 'saund_bary', 40, 6, 'domashnee_audio/saund_bary', 'a:1:{i:0;i:40;}', 1, NULL, '/uploads/shop/products/origin/94_vM105.jpg', '', 1, NULL),
(41, 'domashnie_teatry', 40, 5, 'domashnee_audio/domashnie_teatry', 'a:1:{i:0;i:40;}', 1, NULL, '/uploads/shop/products/origin/28cbf811f4fe849a05ac81f85a22932d.jpg', '', 1, NULL),
(40, 'domashnee_audio', 0, 6, 'domashnee_audio', 'a:0:{}', 1, NULL, NULL, 'categorysubfirst', NULL, NULL),
(36, 'video', 0, 0, 'video', 'a:0:{}', 1, NULL, '', 'categorysubfirst', 0, NULL),
(37, 'tv_hdtv', 36, 2, 'video/tv_hdtv', 'a:1:{i:0;i:36;}', 1, NULL, '/uploads/shop/products/origin/188_vS216.jpg', 'categorysubsecond', 0, NULL),
(38, 'dvd_dvr_pleery', 36, 3, 'video/dvd_dvr_pleery', 'a:1:{i:0;i:36;}', 1, NULL, '/uploads/shop/products/origin/84_vM95.jpg', '', 0, NULL),
(39, 'blu-ray', 36, 4, 'video/blu-ray', 'a:1:{i:0;i:36;}', 1, NULL, '/uploads/shop/products/origin/85_vS96.jpg', NULL, NULL, NULL),
(53, 'subwoofer', 52, 8, 'avto_muzyka_i_video/subwoofer', 'a:1:{i:0;i:52;}', 1, NULL, NULL, '', 1, NULL),
(54, 'cd_chendzhery', 52, 9, 'avto_muzyka_i_video/cd_chendzhery', 'a:1:{i:0;i:52;}', 1, NULL, NULL, '', 1, NULL),
(55, 'gps', 52, 10, 'avto_muzyka_i_video/gps', 'a:1:{i:0;i:52;}', 1, NULL, NULL, '', 1, NULL),
(74, 'zhk-televizory', 37, 17, 'video/tv_hdtv/zhk-televizory', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/187_vS215.jpg', '', 0, NULL),
(75, 'dvd-hd-mediapleery', 37, 18, 'video/tv_hdtv/dvd-hd-mediapleery', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/122_vM133.jpg', '', 0, NULL),
(76, 'dvd', 36, 1, 'video/dvd', 'a:1:{i:0;i:36;}', 1, NULL, '/uploads/shop/products/origin/69d5045a28b88ae8c53ae414b0a581f3.jpg', NULL, NULL, NULL),
(77, 'dvr-pleery', 76, NULL, 'video/dvd/dvr-pleery', 'a:2:{i:0;i:36;i:1;i:76;}', 1, NULL, NULL, NULL, NULL, NULL),
(79, 'domashnie-kinoteatry', 37, 19, 'video/tv_hdtv/domashnie-kinoteatry', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/89_vM100.jpg', '', 0, NULL),
(80, 'multimedia-proektory-dlia-domashnego-kinoteatra', 37, 20, 'video/tv_hdtv/multimedia-proektory-dlia-domashnego-kinoteatra', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/85_vS96.jpg', '', 0, NULL),
(81, '3d-ochki', 37, 21, 'video/tv_hdtv/3d-ochki', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/112_vM123.jpg', '', 0, NULL),
(82, 'tv-antenny', 37, 22, 'video/tv_hdtv/tv-antenny', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/121_vS132.jpg', '', 0, NULL),
(83, 'veb-kamery-dlia-tv', 37, 23, 'video/tv_hdtv/veb-kamery-dlia-tv', 'a:2:{i:0;i:36;i:1;i:37;}', 1, NULL, '/uploads/shop/products/origin/119_vS130.jpg', '', 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_category_i18n`
--

DROP TABLE IF EXISTS `shop_category_i18n`;
CREATE TABLE IF NOT EXISTS `shop_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `h1` varchar(255) NOT NULL,
  `description` text,
  `meta_desc` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_category_i18n_I_1` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_category_i18n`
--

INSERT INTO `shop_category_i18n` (`id`, `locale`, `name`, `h1`, `description`, `meta_desc`, `meta_title`, `meta_keywords`) VALUES
(52, 'ru', 'Авто музыка и видео', '', '', '', '', ''),
(51, 'ru', 'Bluetooth', '', '', '', '', ''),
(50, 'ru', 'Телефоны', '', '', '', '', ''),
(48, 'ru', 'Домашняя электроника', '', '', '', '', ''),
(46, 'ru', 'Фотопринтеры', '', '', '', '', ''),
(45, 'ru', 'Цифровые камеры', '', '', '', '', ''),
(44, 'ru', 'Фото и камеры', '', '', '', '', ''),
(43, 'ru', 'Спикеры', '', '', '', '', ''),
(41, 'ru', 'Домашние театры', '', '', '', '', ''),
(40, 'ru', 'Домашнее аудио', '', '', '', '', ''),
(36, 'ru', 'Видео', '', '<h1>Интернет-магазин</h1>\r\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\r\n<h2>Заголовок второго уровня</h2>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\r\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\r\n<ul>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ul>\r\n<h4>Заголовок четвертого уровня</h4>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>название</td>\r\n<td>размер</td>\r\n<td>цена</td>\r\n</tr>\r\n<tr>\r\n<td>длинна трубы</td>\r\n<td>10 метров</td>\r\n<td>145 уе</td>\r\n</tr>\r\n<tr>\r\n<td>ширина трубы</td>\r\n<td>2 метра</td>\r\n<td>134 уе</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\r\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\r\n<ol>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ol>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>', '', '', ''),
(37, 'ru', 'Телевизоры', '', '<h1>Интернет-магазин</h1>\r\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\r\n<h2>Заголовок второго уровня</h2>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\r\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\r\n<ul>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ul>\r\n<h4>Заголовок четвертого уровня</h4>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>название</td>\r\n<td>размер</td>\r\n<td>цена</td>\r\n</tr>\r\n<tr>\r\n<td>длинна трубы</td>\r\n<td>10 метров</td>\r\n<td>145 уе</td>\r\n</tr>\r\n<tr>\r\n<td>ширина трубы</td>\r\n<td>2 метра</td>\r\n<td>134 уе</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\r\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\r\n<ol>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ol>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>', '', '', ''),
(38, 'ru', 'DVD/DVR Плееры', '', '', '', '', ''),
(39, 'ru', 'Blu-Ray Плееры', '', '', '', '', ''),
(53, 'ru', 'Сабвуферы', '', '', '', '', ''),
(54, 'ru', 'CD Ченджеры', '', '', '', '', ''),
(55, 'ru', 'GPS', '', '', '', '', ''),
(37, 'ua', 'TV & HDTV', '', '<p><span style="color: #384654; font-size: 13px; text-align: right; background-color: #f8f8f8;">Описание&nbsp;</span>укр</p>', 'Meta Description укр', 'Meta Title укр', 'Meta Keywords укр'),
(36, 'en', 'Video', '', '', '', '', ''),
(37, 'en', 'TV & HDTV eng', '', '', '', '', ''),
(38, 'en', 'DVD/DVR', '', '', '', '', ''),
(39, 'en', 'Blu-Ray Player', '', '', '', '', ''),
(40, 'en', 'Home audio', '', '', '', '', ''),
(41, 'en', 'Home Theater', '', '', '', '', ''),
(43, 'en', 'Speakers', '', '', '', '', ''),
(44, 'en', 'Photo & Camera', '', '', '', '', ''),
(45, 'en', 'Digital cameras', '', '', '', '', ''),
(46, 'en', 'Photo Printers', '', '', '', '', ''),
(48, 'en', 'Home Electronics', '', '', '', '', ''),
(50, 'en', 'Phones', '', '', '', '', ''),
(51, 'en', 'Bluetooth', '', '', '', '', ''),
(52, 'en', 'Car Tabs', '', '', '', '', ''),
(53, 'en', 'Subwoofers', '', '', '', '', ''),
(54, 'en', 'CD changer ', '', '', '', '', ''),
(55, 'en', 'GPS', '', '', '', '', ''),
(74, 'ru', 'ЖК-телевизоры', '', '', '', '', ''),
(75, 'ru', 'DVD/HD-медиаплееры', '', '<h1>Интернет-магазин</h1>\r\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\r\n<h2>Заголовок второго уровня</h2>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\r\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\r\n<ul>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ul>\r\n<h4>Заголовок четвертого уровня</h4>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>название</td>\r\n<td>размер</td>\r\n<td>цена</td>\r\n</tr>\r\n<tr>\r\n<td>длинна трубы</td>\r\n<td>10 метров</td>\r\n<td>145 уе</td>\r\n</tr>\r\n<tr>\r\n<td>ширина трубы</td>\r\n<td>2 метра</td>\r\n<td>134 уе</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\r\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\r\n<ol>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ol>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>', '', '', ''),
(76, 'ru', 'DVD', '', NULL, '', '', ''),
(77, 'ru', 'DVR Плееры', '', NULL, '', '', ''),
(79, 'ru', 'Домашние кинотеатры', '', '', '', '', ''),
(80, 'ru', 'Мультимедиа проекторы для домашнего кинотеатра', '', '', '', '', ''),
(81, 'ru', '3D-очки', '', '', '', '', ''),
(82, 'ru', 'ТВ-антенны', '', '', '', '', ''),
(83, 'ru', 'Веб-камеры для ТВ', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_comulativ_discount`
--

DROP TABLE IF EXISTS `shop_comulativ_discount`;
CREATE TABLE IF NOT EXISTS `shop_comulativ_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `discount` int(3) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `date` int(15) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `total_a` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Структура таблиці `shop_currencies`
--

DROP TABLE IF EXISTS `shop_currencies`;
CREATE TABLE IF NOT EXISTS `shop_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `rate` float(6,3) DEFAULT '1.000',
  `showOnSite` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `shop_currencies_I_1` (`name`),
  KEY `shop_currencies_I_2` (`main`),
  KEY `shop_currencies_I_3` (`is_default`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `shop_currencies`
--

INSERT INTO `shop_currencies` (`id`, `name`, `main`, `is_default`, `code`, `symbol`, `rate`, `showOnSite`) VALUES
(1, 'Dollars', 0, 0, 'USD', '$', 0.122, 1),
(2, 'Гривна', 1, 1, 'UAH', 'грн', 1.000, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_delivery_methods`
--

DROP TABLE IF EXISTS `shop_delivery_methods`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float(10,2) NOT NULL,
  `free_from` float(10,2) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `is_price_in_percent` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `delivery_sum_specified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_delivery_methods_I_2` (`enabled`),
  KEY `shop_delivery_methods_I_1` (`enabled`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Дамп даних таблиці `shop_delivery_methods`
--

INSERT INTO `shop_delivery_methods` (`id`, `price`, `free_from`, `enabled`, `is_price_in_percent`, `position`, `delivery_sum_specified`) VALUES
(7, 0.00, 100000000.00, 1, 0, NULL, 0),
(5, 80.00, 100000000.00, 1, 0, NULL, 0),
(6, 50.00, 100000000.00, 1, 0, NULL, 0);


-- --------------------------------------------------------

--
-- Структура таблиці `shop_delivery_methods_i18n`
--

DROP TABLE IF EXISTS `shop_delivery_methods_i18n`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` text,
  `pricedescription` text,
  `delivery_sum_specified_message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_delivery_methods_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_delivery_methods_i18n`
--

INSERT INTO `shop_delivery_methods_i18n` (`id`, `locale`, `name`, `description`, `pricedescription`, `delivery_sum_specified_message`) VALUES
(7, 'ru', 'Самовывоз в Киеве', '<p>г. Киев, ул. Тестовая 12/34</p>', '', NULL),
(5, 'ru', 'Адресная доставка курьером', '', '', NULL),
(6, 'ru', 'Нова Пошта', '<p>Доставка по Украине</p>', '', ''),
(7, 'ua', 'Самовивезення', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_delivery_methods_systems`
--

DROP TABLE IF EXISTS `shop_delivery_methods_systems`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods_systems` (
  `delivery_method_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  PRIMARY KEY (`delivery_method_id`,`payment_method_id`),
  KEY `shop_delivery_methods_systems_FI_2` (`payment_method_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_delivery_methods_systems`
--

INSERT INTO `shop_delivery_methods_systems` (`delivery_method_id`, `payment_method_id`) VALUES
(5, 1),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(6, 9),
(6, 10),
(6, 11),
(7, 1),
(7, 9),
(7, 10),
(7, 11),
(15, 1),
(16, 1),
(16, 2),
(16, 3),
(20, 1),
(20, 3),
(21, 2),
(23, 3),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(25, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_discounts`
--

DROP TABLE IF EXISTS `shop_discounts`;
CREATE TABLE IF NOT EXISTS `shop_discounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date_start` int(11) DEFAULT NULL,
  `date_stop` int(11) DEFAULT NULL,
  `discount` varchar(11) DEFAULT NULL,
  `min_price` float(10,2) DEFAULT NULL,
  `max_price` float(10,2) DEFAULT NULL,
  `categories` text,
  `products` text,
  `description` text,
  `user_group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Структура таблиці `shop_gifts`
--

DROP TABLE IF EXISTS `shop_gifts`;
CREATE TABLE IF NOT EXISTS `shop_gifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `espdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `shop_gifts`
--

INSERT INTO `shop_gifts` (`id`, `key`, `active`, `price`, `created`, `espdate`) VALUES
(1, 'WTWWwPHJ4Al91jnZ', NULL, 100, 1354039607, 1354219200),
(2, '7WMAohSSCA3OViRL', NULL, 4, 1354039810, 1353700800),
(3, 'psnqw6IFxamCOCVmsd', NULL, 35, 1354039839, 1352404800);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_kit`
--

DROP TABLE IF EXISTS `shop_kit`;
CREATE TABLE IF NOT EXISTS `shop_kit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` smallint(6) NOT NULL,
  `only_for_logged` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_kit_FI_1` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп даних таблиці `shop_kit`
--

INSERT INTO `shop_kit` (`id`, `product_id`, `active`, `position`, `only_for_logged`) VALUES
(8, 185, 1, 0, 1),
(9, 96, 1, 0, 0),
(10, 71, 1, 0, 0),
(11, 190, 1, 0, 0),
(12, 190, 1, 0, 1),
(13, 71, 1, 1, 1);



-- --------------------------------------------------------

--
-- Структура таблиці `shop_kit_product`
--

DROP TABLE IF EXISTS `shop_kit_product`;
CREATE TABLE IF NOT EXISTS `shop_kit_product` (
  `product_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL,
  `discount` varchar(11) DEFAULT '0',
  PRIMARY KEY (`product_id`,`kit_id`),
  KEY `shop_kit_product_FI_2` (`kit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_kit_product`
--

INSERT INTO `shop_kit_product` (`product_id`, `kit_id`, `discount`) VALUES
(107, 8, '5'),
(100, 9, '40'),
(93, 10, '0'),
(96, 11, '12'),
(71, 11, '5'),
(102, 12, '5'),
(100, 12, '5'),
(93, 12, '2'),
(81, 12, '4');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_notifications`
--

DROP TABLE IF EXISTS `shop_notifications`;
CREATE TABLE IF NOT EXISTS `shop_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `user_comment` varchar(500) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `date_created` int(11) NOT NULL,
  `active_to` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notified_by_email` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_notifications_I_1` (`user_email`),
  KEY `shop_notifications_I_2` (`user_phone`),
  KEY `shop_notifications_I_3` (`status`),
  KEY `shop_notifications_I_4` (`date_created`),
  KEY `shop_notifications_I_5` (`active_to`),
  KEY `shop_notifications_FI_1` (`product_id`),
  KEY `shop_notifications_FI_2` (`variant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Структура таблиці `shop_notification_statuses`
--

DROP TABLE IF EXISTS `shop_notification_statuses`;
CREATE TABLE IF NOT EXISTS `shop_notification_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_notification_statuses_I_2` (`position`),
  KEY `shop_notification_statuses_I_1` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп даних таблиці `shop_notification_statuses`
--

INSERT INTO `shop_notification_statuses` (`id`, `position`) VALUES
(1, 1),
(2, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_notification_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_notification_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_notification_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_notification_statuses_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_notification_statuses_i18n`
--

INSERT INTO `shop_notification_statuses_i18n` (`id`, `locale`, `name`) VALUES
(1, 'ru', 'Новый'),
(2, 'ru', 'Выполнен');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
CREATE TABLE IF NOT EXISTS `shop_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `delivery_method` int(11) DEFAULT NULL,
  `delivery_price` float(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `user_full_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_deliver_to` varchar(500) DEFAULT NULL,
  `user_comment` varchar(1000) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_updated` int(11) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `total_price` float(10,2) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `gift_cert_key` varchar(25) DEFAULT NULL,
  `gift_cert_price` int(11) DEFAULT NULL,
  `comulativ` int(3) DEFAULT NULL,
  `discount` float(10,2) DEFAULT NULL,
  `discount_info` text,
  `origin_price` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orders_I_1` (`key`),
  KEY `shop_orders_I_2` (`status`),
  KEY `shop_orders_I_3` (`date_created`),
  KEY `shop_orders_FI_1` (`delivery_method`),
  KEY `shop_orders_FI_2` (`payment_method`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Дамп даних таблиці `shop_orders`
--

INSERT INTO `shop_orders` (`id`, `key`, `delivery_method`, `delivery_price`, `status`, `paid`, `user_full_name`, `user_email`, `user_phone`, `user_deliver_to`, `user_comment`, `date_created`, `date_updated`, `user_ip`, `user_id`, `payment_method`, `total_price`, `external_id`, `gift_cert_key`, `gift_cert_price`, `comulativ`, `discount`, `discount_info`, `origin_price`) VALUES
(49, 'n47081w21g', 5, 80.00, 1, 1, 'Administrator', 'ad@min.com', '+2 (4353) 453-45-34', '', '', 1387558994, 1387558994, '127.0.0.1', 48, 10, 19656.07, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '947hq681z2', 5, 80.00, 1, 1, 'Administrator', 'ad@min.com', '', '', '', 1387559471, 1387559471, '127.0.0.1', 48, 1, 289.97, NULL, NULL, NULL, NULL, 39.54, '{"id":"1","key":"1mf82j8lypb107d5","name":"\\u0437\\u043d\\u0438\\u0436\\u043a\\u0430 \\u0430\\u0434\\u043c\\u0456\\u043d\\u0430","active":"1","max_apply":null,"count_apply":null,"date_begin":"1387490400","date_end":"0","type_value":"1","value":"12","type_discount":"user","locale":"ru","ids":"1","user_id":"48","discount_id":"1"}', 329.51);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_orders_products`
--

DROP TABLE IF EXISTS `shop_orders_products`;
CREATE TABLE IF NOT EXISTS `shop_orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `kit_id` int(11) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orders_products_I_1` (`order_id`),
  KEY `shop_orders_products_FI_1` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- Дамп даних таблиці `shop_orders_products`
--

INSERT INTO `shop_orders_products` (`id`, `order_id`, `product_id`, `variant_id`, `product_name`, `variant_name`, `price`, `quantity`, `kit_id`, `is_main`) VALUES
(73, 49, 191, 219, 'Sony KDL-22EX553', '', 6762.30, 1, NULL, NULL),
(74, 49, 84, 95, 'Panasonic DMP-BD45 Ultra-Fast', '', 329.51, 1, NULL, NULL),
(75, 49, 190, 218, 'Samsung LE40D550K1WXUA', 'черный', 625.00, 3, 12, 1),
(76, 49, 81, 92, 'Samsung DVD-H1080 - 1080p', '', 165.12, 3, 12, 0),
(77, 49, 93, 104, 'Yamaha HS80M Powered Speaker', '', 1124.59, 3, 12, 0),
(78, 49, 100, 111, 'Canon PIXMA iP100 Photo Printer', 'Черный', 560.26, 3, 12, 0),
(79, 49, 102, 113, 'Epson Stylus R1900 Photo Printer', '', 1713.12, 3, 12, 0),
(80, 50, 84, 95, 'Panasonic DMP-BD45 Ultra-Fast', '', 329.51, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_orders_status_history`
--

DROP TABLE IF EXISTS `shop_orders_status_history`;
CREATE TABLE IF NOT EXISTS `shop_orders_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_orders_status_history_I_1` (`order_id`),
  KEY `shop_orders_status_history_FI_2` (`status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Дамп даних таблиці `shop_orders_status_history`
--

INSERT INTO `shop_orders_status_history` (`id`, `order_id`, `status_id`, `user_id`, `date_created`, `comment`) VALUES
(21, 49, 1, 48, 1387558995, ''),
(22, 50, 1, 48, 1387559471, '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_order_statuses`
--

DROP TABLE IF EXISTS `shop_order_statuses`;
CREATE TABLE IF NOT EXISTS `shop_order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_statuses_I_2` (`position`),
  KEY `shop_order_statuses_I_1` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп даних таблиці `shop_order_statuses`
--

INSERT INTO `shop_order_statuses` (`id`, `position`) VALUES
(1, 1),
(2, 99);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_order_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_order_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_order_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_order_statuses_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_order_statuses_i18n`
--

INSERT INTO `shop_order_statuses_i18n` (`id`, `locale`, `name`) VALUES
(1, 'ru', 'Новый'),
(2, 'ru', 'Доставлен');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_payment_methods`
--

DROP TABLE IF EXISTS `shop_payment_methods`;
CREATE TABLE IF NOT EXISTS `shop_payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `payment_system_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_payment_methods_I_2` (`position`),
  KEY `shop_payment_methods_FI_1` (`currency_id`),
  KEY `shop_payment_methods_I_1` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп даних таблиці `shop_payment_methods`
--

INSERT INTO `shop_payment_methods` (`id`, `active`, `currency_id`, `position`, `payment_system_name`) VALUES
(1, 1, 2, 0, '0'),
(11, 1, 2, 3, 'LiqPaySystem'),
(10, 1, 2, 2, 'PrivateBankSystem'),
(9, 1, 2, 1, '0');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_payment_methods_i18n`
--

DROP TABLE IF EXISTS `shop_payment_methods_i18n`;
CREATE TABLE IF NOT EXISTS `shop_payment_methods_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_payment_methods_i18n_I_1` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_payment_methods_i18n`
--

INSERT INTO `shop_payment_methods_i18n` (`id`, `locale`, `name`, `description`) VALUES
(1, 'ru', 'Наличными при получении', ''),
(11, 'ru', 'Visa/Mastercard', '<p>Предоплата заказа с помощью кредитной карты</p>'),
(9, 'ru', 'Безналичный перевод', '<p>Предоплата заказа с помощью перевода на кредитную карту. После оформления заказа с Вами свяжутся менеджеры и укажут Вам номер карты</p>'),
(1, 'en', 'Payment for the courier', ''),
(10, 'ru', 'Privat24', '<p>Предоплата заказа с помощью системы Приват24</p>');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
CREATE TABLE IF NOT EXISTS `shop_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `hit` tinyint(1) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `related_products` varchar(255) DEFAULT NULL,
  `mainImage` varchar(255) DEFAULT NULL,
  `smallImage` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `old_price` float(10,2) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `hot` tinyint(1) DEFAULT NULL,
  `action` tinyint(1) DEFAULT NULL,
  `added_to_cart_count` int(11) DEFAULT NULL,
  `enable_comments` tinyint(1) DEFAULT '1',
  `external_id` varchar(255) DEFAULT NULL,
  `mainModImage` varchar(255) DEFAULT NULL,
  `smallModImage` varchar(255) DEFAULT NULL,
  `tpl` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_products_I_2` (`url`),
  KEY `shop_products_I_3` (`brand_id`),
  KEY `shop_products_I_4` (`category_id`),
  KEY `shop_products_I_1` (`url`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=195 ;

--
-- Дамп даних таблиці `shop_products`
--

INSERT INTO `shop_products` (`id`, `url`, `active`, `hit`, `brand_id`, `category_id`, `related_products`, `mainImage`, `smallImage`, `created`, `updated`, `old_price`, `views`, `hot`, `action`, `added_to_cart_count`, `enable_comments`, `external_id`, `mainModImage`, `smallModImage`, `tpl`, `user_id`) VALUES
(71, '71', 1, 0, 26, 74, '96', '71_main.jpg', '71_mainMod.jpg', 1307542725, 1387557404, 1150.00, 192, 0, 0, 1, 1, NULL, '71_mainMod.jpg', '71_smallMod.jpg', '', NULL),
(96, '96', 1, 0, 0, 45, '100', '96_vM107.jpg', '96_vS107.jpg', 1307542081, 1387391583, 0.00, 9, NULL, NULL, NULL, 1, NULL, '96_mainMod.jpg', '96_smallMod.jpg', '', NULL),
(78, '78', 1, 0, 29, 74, '', '191_vM219.jpg', '191_vS219.jpg', 1307543572, 1387557414, 0.00, 11, NULL, NULL, 2, 1, NULL, '191_mainMod.jpg', '191_smallMod.jpg', '', NULL),
(79, '79', 1, NULL, 29, 38, '', '79_main.jpg', '79_mainMod.jpg', 1307544450, 1387389884, 120.00, 12, 1, NULL, 1, 1, NULL, '79_mainMod.jpg', '79_smallMod.jpg', '', NULL),
(81, '81', 1, 0, 28, 77, '', '81_vM92.jpg', '81_vS92.jpg', 1307544442, 1356345897, 0.00, 25, 0, 1, 20, 1, NULL, '81_mainMod.jpg', '81_smallMod.jpg', '', NULL),
(82, '82', 1, 0, 28, 74, '', '82_main.jpg', '82_small.jpg', 1307542064, 1387556041, 0.00, 12, NULL, 0, NULL, 1, NULL, '82_mainMod.jpg', '82_smallMod.jpg', '', NULL),
(83, '83', 1, NULL, 26, 74, '', '83_main.jpg', '83_small.jpg', 1307545378, 1387556057, 0.00, 7, 1, 0, 2, 1, NULL, '83_mainMod.jpg', '83_smallMod.jpg', '', NULL),
(84, '84', 1, NULL, 29, 74, '', '84_main.jpg', '84_small.jpg', 1307541602, 1387556072, 0.00, NULL, NULL, 1, 2, 1, NULL, '84_mainMod.jpg', '84_smallMod.jpg', '', NULL),
(85, '85', 1, 0, 0, 74, '', '85_vM96.jpg', '85_vS96.jpg', 1307544238, 1387556087, 0.00, 5, NULL, NULL, NULL, 1, NULL, '85_mainMod.jpg', '85_smallMod.jpg', '', NULL),
(86, '86', 1, 0, 28, 74, '', '86_main.jpg', '86_small.jpg', 1307545023, 1387556102, 0.00, 10, NULL, 1, NULL, 1, NULL, '86_mainMod.jpg', '86_smallMod.jpg', '', NULL),
(87, '87', 1, NULL, 26, 74, '', '87_main.jpg', '87_mainMod.jpg', 1307541766, 1387556564, 0.00, 33, 1, NULL, 2, 1, NULL, '87_mainMod.jpg', '87_smallMod.jpg', '', NULL),
(88, '88', 1, 1, 28, 74, '', '88_main.jpg', '88_small.jpg', 1307544977, 1387556546, 32000.00, 29, NULL, NULL, NULL, 1, NULL, '88_mainMod.jpg', '88_smallMod.jpg', '', NULL),
(95, '95', 1, NULL, 0, 45, '', '95_main.jpg', '95_small.jpg', 1307542081, 1355496317, 0.00, 4, NULL, NULL, NULL, 1, NULL, '95_mainMod.jpg', '95_smallMod.jpg', '', NULL),
(89, '89', 1, NULL, 29, 74, '', '89_main.jpg', '89_small.jpg', 1307541636, 1387557675, 0.00, 6, NULL, NULL, NULL, 1, NULL, '89_mainMod.jpg', '89_smallMod.jpg', '', NULL),
(90, '90', 1, NULL, 28, 74, '', '90_main.jpg', '90_small.jpg', 1307543337, 1387556187, 0.00, 4, NULL, NULL, 1, 1, NULL, '90_mainMod.jpg', '90_smallMod.jpg', '', NULL),
(91, '91', 1, NULL, 26, 74, '', '91_main.jpg', '91_small.jpg', 1307544214, 1387556204, 0.00, 2, NULL, NULL, NULL, 1, NULL, '91_mainMod.jpg', '91_smallMod.jpg', '', NULL),
(92, '92', 1, NULL, 28, 43, '', '92_main.jpg', '92_small.jpg', 1307544791, 1387557630, 0.00, 1, NULL, NULL, 1, 1, NULL, '92_mainMod.jpg', '92_smallMod.jpg', '', NULL),
(93, '93', 1, NULL, 36, 43, '', '93_main.jpg', '93_small.jpg', 1307542628, 1355496427, 0.00, 3, NULL, NULL, 4, 1, NULL, '93_mainMod.jpg', '93_smallMod.jpg', '', NULL),
(94, '94', 1, 0, 36, 43, '', '94_main.jpg', '94_small.jpg', 1307544425, 1355496438, 0.00, 44, 1, 0, 2, 1, NULL, '94_mainMod.jpg', '94_smallMod.jpg', '', NULL),
(97, '97', 1, NULL, 26, 74, '', '97_main.jpg', '97_small.jpg', 1307541628, 1387556226, 0.00, 35, NULL, NULL, NULL, 1, NULL, '97_mainMod.jpg', '97_smallMod.jpg', '', NULL),
(98, '98', 1, 1, 28, 74, '', '98_main.jpg', '98_small.jpg', 1307542730, 1387556241, 0.00, 22, NULL, NULL, NULL, 1, NULL, '98_mainMod.jpg', '98_smallMod.jpg', '', NULL),
(99, '99', 1, NULL, 28, 74, '', '99_main.jpg', '99_small.jpg', 1307543877, 1387556256, 0.00, 7, NULL, NULL, NULL, 1, NULL, '99_mainMod.jpg', '99_smallMod.jpg', '', NULL),
(100, '100', 1, NULL, 0, 74, '', '100_main.jpg', '100_small.jpg', 1307543018, 1387556276, 0.00, 66, NULL, NULL, 7, 1, NULL, '100_mainMod.jpg', '100_smallMod.jpg', '', NULL),
(101, '101', 1, NULL, 0, 74, '', '101_main.jpg', '101_small.jpg', 1307543107, 1387556297, 0.00, NULL, NULL, NULL, NULL, 1, NULL, '101_mainMod.jpg', '101_smallMod.jpg', '', NULL),
(102, '102', 1, 0, 37, 46, '', '102_main.jpg', '102_small.jpg', 1307545161, 1355844036, 550.00, 21, 0, 1, 4, 1, NULL, '102_mainMod.jpg', '102_smallMod.jpg', '', NULL),
(103, '103', 1, 0, 37, 46, '', '103_main.jpg', '103_small.jpg', 1307543901, 1355844048, 86.00, NULL, 0, 1, NULL, 1, NULL, '103_mainMod.jpg', '103_smallMod.jpg', '', NULL),
(104, '104', 1, 1, 37, 46, '', '104_main.jpg', '104_small.jpg', 1307543227, 1387391108, 400.00, NULL, 0, 0, NULL, 1, NULL, '104_mainMod.jpg', '104_smallMod.jpg', '', NULL),
(105, '105', 1, NULL, 29, 50, '', '105_main.jpg', '105_small.jpg', 1307543429, 1355497850, 0.00, 13, NULL, NULL, 2, 1, NULL, '105_mainMod.jpg', '105_smallMod.jpg', '', NULL),
(106, '106', 1, 0, 29, 50, '', '106_main.jpg', '106_small.jpg', 1307543089, 1387389760, 300.00, 29, NULL, NULL, 2, 1, NULL, '106_mainMod.jpg', '106_smallMod.jpg', '', NULL),
(107, '107', 1, NULL, 0, 51, '', '107_main.jpg', '107_small.jpg', 1307541701, 1355496710, 0.00, 4, NULL, NULL, NULL, 1, NULL, '107_mainMod.jpg', '107_smallMod.jpg', '', NULL),
(108, '108', 1, 1, 0, 51, '', '108_main.jpg', '108_small.jpg', 1307544069, 1355496690, 0.00, 134, NULL, NULL, 5, 1, NULL, '108_mainMod.jpg', '108_smallMod.jpg', '', NULL),
(109, '109', 1, NULL, 29, 50, '', '109_main.jpg', '109_small.jpg', 1307544627, 1355496650, 0.00, 2, 1, NULL, 1, 1, NULL, '109_mainMod.jpg', '109_smallMod.jpg', '', NULL),
(110, '110', 1, NULL, 0, 51, '', '110_main.jpg', '110_small.jpg', 1307543831, 1355496634, 0.00, 5, NULL, NULL, 2, 1, NULL, '110_mainMod.jpg', '110_smallMod.jpg', '', NULL),
(111, '111', 1, NULL, 0, 51, '', '111_main.jpg', '111_small.jpg', 1307543077, 1355496626, 0.00, NULL, NULL, NULL, NULL, 1, NULL, '111_mainMod.jpg', '111_smallMod.jpg', '', NULL),
(112, '112', 1, NULL, 39, 51, '', '112_main.jpg', '112_small.jpg', 1307543753, 1355496967, 0.00, 5, NULL, NULL, 1, 1, NULL, '112_mainMod.jpg', '112_smallMod.jpg', '', NULL),
(113, '113', 1, NULL, 35, 51, '', '113_main.jpg', '113_small.jpg', 1307542831, 1355496921, 0.00, NULL, 1, NULL, NULL, 1, NULL, '113_mainMod.jpg', '113_smallMod.jpg', '', NULL),
(114, '114', 1, NULL, 28, 51, '', '114_main.jpg', '114_small.jpg', 1307543699, 1355496903, 0.00, 1, NULL, NULL, NULL, 1, NULL, '114_mainMod.jpg', '114_smallMod.jpg', '', NULL),
(115, '115', 1, NULL, 30, 53, '', '115_main.jpg', '115_small.jpg', 1307543689, 1355496893, 0.00, 17, NULL, NULL, 1, 1, NULL, '115_mainMod.jpg', '115_smallMod.jpg', '', NULL),
(116, '116', 1, NULL, 0, 53, '', '116_main.jpg', '116_small.jpg', 1307542992, 1355496886, 0.00, NULL, NULL, NULL, 1, 1, NULL, '116_mainMod.jpg', '116_smallMod.jpg', '', NULL),
(117, '117', 1, NULL, 0, 53, '', '117_main.jpg', '117_small.jpg', 1307542495, 1355496876, 0.00, NULL, NULL, NULL, NULL, 1, NULL, '117_mainMod.jpg', '117_smallMod.jpg', '', NULL),
(118, '118', 1, NULL, 30, 53, '', '118_main.jpg', '118_small.jpg', 1307543269, 1355496864, 0.00, 1, NULL, NULL, NULL, 1, NULL, '118_mainMod.jpg', '118_smallMod.jpg', '', NULL),
(119, '119', 1, 1, 30, 53, '', '119_main.jpg', '119_small.jpg', 1307543316, 1387391023, 0.00, 8, NULL, NULL, NULL, 1, NULL, '119_mainMod.jpg', '119_smallMod.jpg', '', NULL),
(120, '120', 1, NULL, 30, 54, '', '120_main.jpg', '120_small.jpg', 1307542029, 1355496824, 0.00, 9, NULL, NULL, 2, 1, NULL, '120_mainMod.jpg', '120_smallMod.jpg', '', NULL),
(121, '121', 1, NULL, 30, 54, '', '121_main.jpg', '121_small.jpg', 1307543909, 1355497245, 0.00, 5, NULL, NULL, 2, 1, NULL, '121_mainMod.jpg', '121_smallMod.jpg', '', NULL),
(122, '122', 1, NULL, 29, 54, '', '122_main.jpg', '122_small.jpg', 1307543511, 1355497077, 0.00, 1, NULL, NULL, 2, 1, NULL, '122_mainMod.jpg', '122_smallMod.jpg', '', NULL),
(123, '123', 1, NULL, 0, 54, '', '123_main.jpg', '123_small.jpg', 1307543925, 1355497060, 0.00, 25, NULL, NULL, 1, 1, NULL, '123_mainMod.jpg', '123_smallMod.jpg', '', NULL),
(124, '124', 1, NULL, 0, 54, '', '124_main.jpg', '124_small.jpg', 1307542680, 1355497269, 0.00, NULL, NULL, NULL, 1, 1, NULL, '124_mainMod.jpg', '124_smallMod.jpg', '', NULL),
(185, 'apple-iphone-5-16gb-black-slate', 1, 0, 27, 50, '108,111,107', '185_main.jpg', '185_small.jpg', 1355428800, 1363607089, 0.00, 20, NULL, NULL, 3, 1, NULL, '185_mainMod.jpg', '185_smallMod.jpg', '', NULL),
(186, 'samsung-ue32eh4030wxua', 1, NULL, 0, 74, '', '186_main.jpg', '186_mainMod.jpg', 1355688000, 1387556311, 0.00, 23, NULL, NULL, 1, 1, NULL, '186_mainMod.jpg', '186_smallMod.jpg', '', NULL),
(187, 'samsung-ue40es6307uxua', 1, NULL, 28, 74, '', '187_main.jpg', '187_mainMod.jpg', 1355688000, 1355745685, 0.00, 1, NULL, NULL, NULL, 1, NULL, '187_mainMod.jpg', '187_smallMod.jpg', '', NULL),
(188, 'lg-32ls359t', 1, NULL, 29, 74, '', '188_main.jpg', '188_mainMod.jpg', 1355688000, 1387556494, 0.00, 9, NULL, NULL, 2, 1, NULL, '188_mainMod.jpg', '188_smallMod.jpg', '', NULL),
(189, 'lg-47lm580t', 1, 0, 35, 74, '', '189_main.jpg', '189_mainMod.jpg', 1355688000, 1387557554, 1500.00, 7, 1, 0, 1, 1, NULL, '189_mainMod.jpg', '189_smallMod.jpg', '', NULL),
(190, 'samsung-le40d550k1wxua', 1, 1, 28, 74, '186,187,86,88,79,99,114,98,71,89,97', '190_main.jpg', '190_mainMod.jpg', 1355688000, 1387557543, 800.00, 35, NULL, NULL, 3, 1, NULL, '190_mainMod.jpg', '190_smallMod.jpg', '', NULL),
(191, 'sony-kdl-22ex553', 1, NULL, 26, 74, '', '191_main.jpg', '191_mainMod.jpg', 1355688000, 1387557532, 0.00, 2, 0, 1, 1, 1, NULL, '191_mainMod.jpg', '191_smallMod.jpg', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_products_i18n`
--

DROP TABLE IF EXISTS `shop_products_i18n`;
CREATE TABLE IF NOT EXISTS `shop_products_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `short_description` text,
  `full_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_products_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_products_i18n`
--

INSERT INTO `shop_products_i18n` (`id`, `locale`, `name`, `short_description`, `full_description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(71, 'ru', 'Sony KDL46EX710', '<p>ЖК ТВ: технология Motionflow 100Hz, эко-функции, экран с Edge LED, диагональ 117 см / 46, Full HD 1080, Wireless LAN Ready</p>', '<p><strong>Множество функций для вашего отдыха</strong><br /> Супертонкий <strong>EX710</strong> очень просто перемещать из комнаты в комнату. Великолепное ТВ-изображение и потрясающий просмотр в Full HD. Дизайн без лишних проводов для удобного размещения в любом пространстве. Онлайн-развлечения для приятного отдыха на многие часы. Отличные функции и экономия электричества.<br /> <br /> <strong>Потрясающий просмотр в качестве Full HD</strong><br /> Передовая технология подсветки Edge LED помогает реализовывать бесподобное качество изображения в ультра-тонком корпусе. Технология Motionflow 100Hz позволяет добиться бесподобной контрастности и четкости, а также насыщенных цветов и плавного отображения динамичных сцен &ndash; максимум удовольствия от любимых фильмов и видеоигр.<br /> <br /> <strong>Порядок без проводов</strong><br /> Эта модель позволит сэкономить место в доме. Тонкий корпус с гладкими поверхностями идеально впишется в интерьер вашей комнаты. Телевизор также предусматривает соединение по Wi-Fi, что позволит подключиться к Интернету, без использования неприглядных проводов.<br /> <br /> <strong>Развлечения и экономия электроэнергии</strong><br /> Данная модель позволяет экономить электричество. Датчик присутствия определяет, когда в комнате никого нет, и выключает телевизор автоматически. Датчик освещения автоматически подбирает оптимальные настройки яркости изображения в соответствии с освещением и экономит электроэнергию при низком освещении.</p>', '', '', ''),
(96, 'ru', 'Canon VIXIA HF R11 Digital', '<p><strong>Тип</strong>: компактный, <strong> Количество мегапикселей</strong>: 12,1, <strong> Оптическое увеличение</strong>: 5, <strong> Слот для карт памяти</strong>: SD, SDHC, SDXC, <strong> Питание</strong>: Li-Ion аккумулятор, <strong> Вес, г</strong>: 198</p>', '<p>&nbsp;</p>\r\n<h3>Система HS&nbsp;</h3>\r\n<p>В представленной модели установлена специальная система HS, в которую входят процессор DIGIC 5 и 12,1-мегапиксельный сенсор. Их совместная работа обеспечивает фото с низким уровнем шума, высокой детализацией и естественной цветопередачей. Вы получите великолепный результат и при плохом освещении без использования штатива и вспышки.&nbsp;</p>\r\n<h3>Универсальный объектив</h3>\r\n<p>В отзывах о Canon PowerShot S100 Silver упоминают и об универсальных возможностях объектива. 24-миллиметровый широкоугольный объектив легко справится и с пейзажами, и с портретами, и с макросъемкой, а 5-кратный зум приблизит удаленные объекты. Благодаря интеллектуальному стабилизатору изображения камера автоматически выберет наиболее подходящий режим оптической стабилизации из 7-ми возможных вариантов.&nbsp;&lt;p&gt;&lt;a href="http://repka.ua/products/cifrovye-fotoapparaty/canon-powershot-s100-silver/42633.html?gclid=CM2qwKHIl7QCFYJP3godkBEAfA"&gt;.&lt;/a&gt;&lt;/p&gt;</p>', '', '', ''),
(78, 'ru', 'Sony KDL-22EX553', '<p>22 // 1366x768 пикс // 50 Гц // LED подсветка // эфирный (DVB-T) // кабельный (DVB-C) // HDMI: 2 шт // Компонентный //Композитный // SCART // USB // LAN // Линейный</p>', '<p>&lt;div&gt;&lt;strong&gt;KDL-22EX553&lt;br&gt; Новый способ просмотра ТВ&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; 55 см / 22", телевизор HD Ready с технологией подсветки Edge LED, X-Reality, встроенным Wi-Fi&reg; и интернет-телевидением от Sony&lt;br&gt; Наслаждайтесь четким отображением на тонком экране Edge LED&lt;br&gt; Wi-Fi обеспечивает быстрый доступ к функции просмотра пропущенных программ, фильмам и приложениям&lt;br&gt; Для более комфортного просмотра предусматривается изменение угла наклона телевизора&lt;br&gt; &lt;br&gt; &lt;div&gt;&lt;strong&gt;Мир развлечений на кончиках пальцев&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; Начните революцию интернет-телевидения у себя дома. Откройте увлекательный новый мир передачи контента по запросу, просмотра пропущенных программ, приложений и многого другого, и все это - с четким, детализированным изображением, на большом и тонком ЖК-экране. Пришло время управлять центром развлечений в вашем доме.&lt;br&gt; &lt;br&gt; &lt;div&gt;&lt;strong&gt;Четкое, реалистичное изображение&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; X-Reality обеспечивает более четкое и реалистичное HD-изображение, вне зависимости от источника: будь то интернет-канал, DVD-диск или любительский клип. Кроме того, эта технология убирает эффект мерцания, гарантируя более плавное отображение динамичных спортивных передач.&lt;br&gt; &lt;br&gt; &lt;div&gt;&lt;strong&gt;Новый дизайн, легкие материалы&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; Телевизоры серии HX75 выполнены из контрастных материалов и имеют безукоризненный дизайн. Вас восхитит легкость этого телевизора, который располагается на подставке в форме мольберта, позволяющей вращать его в вертикальной и горизонтальной плоскости для идеального угла обзора.&lt;br&gt; &lt;br&gt; &lt;div&gt;&lt;strong&gt;Беспроводной доступ к онлайн-развлечениям&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; Теперь доступ к контенту сетевого сервиса Sony Entertainment Network &mdash; HD-фильмам, миллионам музыкальных композиций, любимым телеканалам, веб-браузеру, приложениям Twitter&trade;, Facebook&reg;, YouTube&trade;, Skype&trade; и многому другому &mdash; осуществляется с помощью дистанционного пульта или мобильного устройства с поддержкой распознавания голоса.&lt;br&gt; &lt;br&gt; &lt;div&gt;&lt;strong&gt;Энергосберегающие функции телевизоров&lt;/strong&gt;&lt;/div&gt;&lt;br&gt; Новая функция затемнения LED Frame автоматически подстраивает яркость подсветки при просмотре и снижает потребление энергии, позволяя экономить деньги. При этом изображение остается резким и высококонтрастным.</p>', '', '', ''),
(79, 'ru', 'Panasonic DVD-S38 DVD', '<p>DVD-S38 - DVD-плеер&nbsp; для домашнего использования.</p>', '<p>DVD-S38 - DVD-плеер&nbsp; для домашнего использования. <br /> <br /> &bull; Высококачественное изображение: <br /> С технологией 1080p Up-Conversion и цифроаналоговым преобразователем видеосигнала 108 МГц/12 бит <br /> С прогрессивной разверткой и цифроаналоговым преобразователем видеосигнала 108 МГц/12 бит <br /> <br /> &bull; Слайд-шоу JPEG с музыкой MP3 <br /> <br /> &bull; Экологичные материалы и компактный дизайн (ширина 360 мм)</p>', '', '', ''),
(81, 'ru', 'Samsung DVD-H1080 - 1080p', 'DVD-плеер/выход HDMI/воспроизведение с USB-накопителей/поддержка видео в формате MPEG4, DivX  ', '<p>Чем занять выдавшийся свободным вечер? Посмотреть телевизор? Но там, как\n назло, нет ничего интересного. Сходить в гости? Но на улице холодно и \nветрено. А может, взять свежий DVD с фильмом и насладиться хорошим кино?\n Было бы неплохо, но вот беда — у вас все еще нет DVD-проигрывателя и вы\n смотрите кассеты на допотопном видеомагнитофоне. Значит, надо срочно \nобзаводиться более прогрессивным устройством. Ну а как же запись любимых\n телепередач, которые идут именно тогда, когда вы заняты? Как же старые \nвидеоархивы? Все решаемо, ведь современный DVD-проигрыватель — это не \nобязательно только воспроизведение DVD-дисков. Есть модели, совмещенные с\n классическим видеомагнитофоном; устройства, способные самостоятельно \nзаписывать DVD-диски; аппараты, оснащенные жесткими дисками для записи \nтелевизионных программ. Осталось только определиться, что вам нужно, и \nсделать правильный выбор.<br>\n<br>\nDVD – формат оптических носителей последнего поколения. DVD-диски \nзначительно объемнее и быстрее, чем обычные CD. Они могут содержать \nвидеоматериалы кинотеатрального качества, музыкальные файлы, цифровые \nфотографии и компьютерные данные. Цель DVD – объединить мультимедиа, \nкомпьютерную и деловую информацию в одном универсальном формате. DVD уже\n практически вытеснил лазерные диски, видеокассеты и игровые картриджи \nи, возможно, в скором будущем вытеснит и CD-диски. Формат DVD обладает \nширокой поддержкой среди основных производителей электроники и \nкомпьютерных изделий, а также среди звукозаписывающих и кино- студий. По\n этой причине DVD завоевал столь огромную популярность среди покупателей\n и стал самым распространенным форматом всего за три года. К 2003 году, \nза шесть лет существования, в мире насчитывалось уже более 250 миллионов\n DVD-устройств: DVD-плееры, рекордеры, компьютерные DVD-приводы и \nигровые приставки, - что сделало DVD передовым стандартом \nвидеоиндустрии.  </p>  ', '', '', ''),
(82, 'ru', 'Samsung BD-C5500 Blu-ray', '<p>Тип оборудования Blu-ray плеер Цвета, использованные в оформлении черный Механизм загрузки дисков лоток Поддерживаемые типы дисков (воспроизведение) CD-R, CD-RW, DVD-R, DVD+R, DVD-RW, DVD+RW, BD-R, BD-RE Поддерживаемые размеры дисков 12 см, 8 см Разъемы и выходы Разъемы на передней панели USB 2.0 Type A</p>', '<p>Чем занять выдавшийся свободным вечер? Посмотреть телевизор? Но там, как назло, нет ничего интересного. Сходить в гости? Но на улице холодно и ветрено. А может, взять свежий DVD с фильмом и насладиться хорошим кино? Было бы неплохо, но вот беда &mdash; у вас все еще нет DVD-проигрывателя и вы смотрите кассеты на допотопном видеомагнитофоне. Значит, надо срочно обзаводиться более прогрессивным устройством. Ну а как же запись любимых телепередач, которые идут именно тогда, когда вы заняты? Как же старые видеоархивы? Все решаемо, ведь современный DVD-проигрыватель &mdash; это не обязательно только воспроизведение DVD-дисков. Есть модели, совмещенные с классическим видеомагнитофоном; устройства, способные самостоятельно записывать DVD-диски; аппараты, оснащенные жесткими дисками для записи телевизионных программ. Осталось только определиться, что вам нужно, и сделать правильный выбор.<br /> <br /> DVD &ndash; формат оптических носителей последнего поколения. DVD-диски значительно объемнее и быстрее, чем обычные CD. Они могут содержать видеоматериалы кинотеатрального качества, музыкальные файлы, цифровые фотографии и компьютерные данные. Цель DVD &ndash; объединить мультимедиа, компьютерную и деловую информацию в одном универсальном формате. DVD уже практически вытеснил лазерные диски, видеокассеты и игровые картриджи и, возможно, в скором будущем вытеснит и CD-диски. Формат DVD обладает широкой поддержкой среди основных производителей электроники и компьютерных изделий, а также среди звукозаписывающих и кино- студий. По этой причине DVD завоевал столь огромную популярность среди покупателей и стал самым распространенным форматом всего за три года. К 2003 году, за шесть лет существования, в мире насчитывалось уже более 250 миллионов DVD-устройств: DVD-плееры, рекордеры, компьютерные DVD-приводы и игровые приставки, - что сделало DVD передовым стандартом видеоиндустрии. </p>', '', '', ''),
(83, 'ru', 'Sony BDP-S470 Network', '<p>Проигрыватель Blu-ray дисков SONY BDP-S470 B -Сверхсовременный высококачественный проигрыватель дисков Blu-ray Sony , позволяющий воспроизводить как обычные диски Blu-ray, так и диски Blu-ray 3D &mdash; с 3D-видео.</p>', '<p>Плеер дисков Blu-ray Disc 3D Ready с мгновенным доступом к онлайн-видеоматериалам!<br /> BRAVIA Internet Video, Wireless LAN ready, Entertainment Database Browser с Gracenote.<br /> Единое дизайнерское решение с линейкой техники домашних развлечений<br /> Мгновенный доступ к бесплатным фильмам и другому онлайн-содержимому<br /> iPhone/iPod touch для управления Blu-ray Disc<br /> Домашние развлечения нового поколения, в том числе потрясающая 3D-динамика на экране 3D-телевизора.<br /> Абсолютно новая модель плеера Blu-ray Disc: доступ к онлайн-контенту, работа с ПК и беспроводное подключение к Интернету.<br /> DLNA &mdash; позволяет плееру Sony Blu-ray Disc Player обмениваться информацией с другими DLNA-устройствами в доме и создавать домашнюю сеть для цифровых материалов. <br /> Новый дизайн 2010 г. BRAVIA Monolith: превосходные материалы и стильный минималистичный внешний вид. Подберите к своему телевизору BRAVIA и домашнему кинотеатру плеер Blu-ray Disc в едином стиле.<br /> Функция BRAVIA Internet Video &mdash; это доступ к онлайн-контенту. Смотрите телевизор так, как вы сами пожелаете с функцией просмотра пропущенных программ. Находите любимые записи в Интернете на таких интернет-сайтах по запросу, как YouTube и Dailymotion.<br /> Функция WLAN ready позволяет выходить в сеть без проводов: просто подключите ключ USB WIFI (приобретается дополнительно) &mdash; и вы в сети одним нажатием кнопки<br /> Полный контроль при помощи iPhone: управление работой плеера Blu-ray Disc, просмотр информации на диске и поиск связанного контента на Youtube &mdash; все это при помощи интерфейса на вашем сенсорном экране.<br /> Сверхбыстрая скорость работы: включение за 3 секунды, открытие лотка за 2 секунды и ускоренная загрузка.<br /> Просмотр фильмов Blu-ray Disc в формате Full HD 1080p и улучшенный просмотр фильмов из вашей DVD-коллекции.<br /> Узнать дополнительную информацию о фильме с диска Blu-ray Disc вы можете с помощью браузера по базе данных развлечений (Entertainment Database Browser) с технологией Gracenote.</p>', '', '', ''),
(84, 'ru', 'Panasonic DMP-BD45 Ultra-Fast', '<div>\r\n<div>Проигрыватели Blu-ray Panasonic&nbsp;DMP-BD45 Ultra-Fast</div>\r\n</div>', '<p>Процессор цветности PHL Reference Chroma Plus<br /> PHL Reference Chroma Processor Plus - это высококачественная интегральная схема, созданная для точной обработки каждого пикселя Blu-Ray видеосигнала в вертикальном направлении. Она воспроизводит цветовую информацию с удвоенной точностью по сравнению с обычными системами, чтобы поддерживать достоверность и резкость цветопередачи.<br /> <br /> Сверхбыстрая 0, 5-сек загрузка<br /> Время перехода из режима ожидания в рабочий режим значительно сократилось по сравнению с прежними моделями. Благодаря этому усовершенствованию вы сможете быстрее начать просмотр, не теряя времени на ожидание.</p>', '', '', ''),
(85, 'ru', 'LG BD570 Network Audio', '<p>Програвач BD LG BD570 (V-DAC 162 МГц/12bit, A-DAC 192 кГц/24bit, 1080p/60 Гц, BD-ROM, BD-R, BD-RE, DVD-R/RW, DVD+R/RW, CD-R/RW, MP3, WMA, JPEG, DivX, XviD, MKV(H.264), AVCHD, Dolby True HD/DTS HD MA/DTS / Dolby Digital, BD Live 2.0, Gracenote, NetCast (Youtube, Picassa, AccuWeather), DLNA/CIFS, HDMI 1.3, USB 2.0, Подкючение внешнего HDD, 430 х 45 х...</p>', '<p>&amp;lt;p&amp;gt;LG BD570 является необычным Blu-ray плеером: встроенный модуль беспроводной связи Wi-Fi позволяет новой модели подключаться к домашней беспроводной сети и Интернету, расширяя тем самым возможности домашних развлечений.&amp;lt;br&amp;gt; &ldquo;Люди не должны ограничивать себя только просмотром фильмов, которые выходят на дисках, - сказал Саймон Канг (Simon Kang), исполнительный директор и президент компании LG Home Entertainment. &ndash; Они должны иметь доступ к дополнительному медиа контенту из Интернета. Мы добавили в BD570 эту возможность, позволяющую передавать большой объем аудио-, видеофайлов и прочих развлечений прямо на экран телевизора&rdquo;.&amp;lt;br&amp;gt; &amp;lt;br&amp;gt; Беспроводный доступ в Интернет, который обеспечивает новая модель Blu-Ray проигрывателя LG, позволяет его владельцам смотреть потоковое видео с сайта YouTube или фотографии из веб- альбома Picasa на большом экране Full HD телевизора, а не на маленьком экране компьютерного монитора. Также с помощью BD570 можно дополнить содержимое Blu- Ray диска, загрузив дополнительную информацию через профиль BD Live 2. 0. Беспроводное подключение обеспечивает удобный доступ к информационным сайтам, например прогнозу погоды от Accuweather, а благодаря интуитивно понятному интерфейсу пользоваться BD570 сможет даже ребенок.&amp;lt;br&amp;gt; &amp;lt;br&amp;gt; &amp;lt;br&amp;gt; Во многих семьях накопились уже целые медиа- библиотеки, состоящие из большого числа фильмов, музыки, домашнего видео и фотографий. BD570 помогает собрать подобные медиа- файлы воедино, подключаясь ко всем компьютерам или DNLA- совместимым устройствам хранения данных, входящим в домашнюю сеть, посредством Wi- Fi и позволяет просматривать всю эту информацию на экране телевизора. Также плеер способен воспроизводить фильмы в формате DivX или MKV непосредственно с внешних жестких дисков или флэш- накопителей, подключенных по USB.&amp;lt;br&amp;gt; &amp;lt;br&amp;gt; Интерфейс HDMI позволяет подключать LG BD570 к большинству современных телевизоров с помощью единственного кабеля, обеспечивая зрителям максимально качественное изображение как при воспроизведении Blu- Ray дисков, так и обычных DVD, которые он декодирует в разрешении до 1080p. &amp;lt;/p&amp;gt;</p>', '', '', ''),
(86, 'ru', 'Samsung BD-C6900 1080p 3D Blu-ray', '<p>Програвач Blu-ray Samsung BD-C6900 (3D Blu-ray, BD-R/RE, DVD-Video, DVD/DVD&plusmn;R/DVD&plusmn;RW, USB Storage, MPEG2, H.264,VC-1, AVCHD, DivX HD, MKV, MP4, WMV9, HD JPEG, Internet@TV, All Share Ethernet, HDMI (V.1.4 + 3D)430 x 205 x 43/1,8кг, чорний)</p>', '<p>&nbsp;</p>\r\n<div>Чем занять выдавшийся свободным вечер? Посмотреть телевизор? Но там, как назло, нет ничего интересного. Сходить в гости? Но на улице холодно и ветрено. А может, взять свежий DVD с фильмом и насладиться хорошим кино? Было бы неплохо, но вот беда &mdash; у вас все еще нет DVD-проигрывателя и вы смотрите кассеты на допотопном видеомагнитофоне. Значит, надо срочно обзаводиться более прогрессивным устройством. Ну а как же запись любимых телепередач, которые идут именно тогда, когда вы заняты? Как же старые видеоархивы? Все решаемо, ведь современный DVD-проигрыватель &mdash; это не обязательно только воспроизведение DVD-дисков. Есть модели, совмещенные с классическим видеомагнитофоном; устройства, способные самостоятельно записывать DVD-диски; аппараты, оснащенные жесткими дисками для записи телевизионных программ. Осталось только определиться, что вам нужно, и сделать правильный выбор.<br /> <br /> DVD &ndash; формат оптических носителей последнего поколения. DVD-диски значительно объемнее и быстрее, чем обычные CD. Они могут содержать видеоматериалы кинотеатрального качества, музыкальные файлы, цифровые фотографии и компьютерные данные. Цель DVD &ndash; объединить мультимедиа, компьютерную и деловую информацию в одном универсальном формате. DVD уже практически вытеснил лазерные диски, видеокассеты и игровые картриджи и, возможно, в скором будущем вытеснит и CD-диски. Формат DVD обладает широкой поддержкой среди основных производителей электроники и компьютерных изделий, а также среди звукозаписывающих и кино- студий. По этой причине DVD завоевал столь огромную популярность среди покупателей и стал самым распространенным форматом всего за три года. К 2003 году, за шесть лет существования, в мире насчитывалось уже более 250 миллионов DVD-устройств: DVD-плееры, рекордеры, компьютерные DVD-приводы и игровые приставки, - что сделало DVD передовым стандартом видеоиндустрии.</div>', '', '', ''),
(87, 'ru', 'Sony HT-SS370 Home Theater', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(88, 'ru', 'Samsung HW-C770BS 7.1 Channel', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(95, 'ru', 'Canon EOS Rebel T2i 18 Megapixel Digital', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(89, 'ru', 'Panasonic SCPTX7 Home Theater', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(90, 'ru', 'Samsung HT-C7530W 5.1 Channel', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(91, 'ru', 'Sony BDV-E770W Home Theater', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(92, 'ru', 'Samsung HW-C700 7.2 Channel', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(93, 'ru', 'Yamaha HS80M Powered Speaker', 'Изящные спикеры с белым конусом, используемые в мониторах HS-ряда \nобеспечивают превосходное звучание, которое улучшено тщательно \nспроектируемым корпусом  ', '<p>Изящные спикеры с белым конусом, используемые в мониторах HS-ряда \nобеспечивают превосходное звучание, которое улучшено тщательно \nспроектируемым корпусом. Комбинация винтов и специально разработанного \nкольца устраняют вибрацию и резонанс, разрешая спикеру выдавать ровный \nзвуковой диапазон. Другая особенность, которая повышает работу басового \nспикера - специально отобранный магнит. Динамик для передачи высокого \nтона использует передовой проект гладкого контура, который минимизирует \nпотери так, чтобы высокочастотные детали воспроизводились с превосходной\n точностью.  </p>  ', '', '', ''),
(94, 'ru', 'Yamaha NSIW760 Speaker', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(97, 'ru', 'Sony Handycam HDR-CX3', '<p>Flash, AVCHD, Full HD, 1920x1080, 1/4, 1CMOS, фоторежим, zoom 12x/160x, MS Duo, SD, SDHC, 112x52x64 мм, 320 г</p>', '<p>Запись до 13 ч видео Full HD великолепного качества на встроенную память 32 ГБ, и еще больше &mdash; с дополнительной картой памяти. Великолепный дизайн, передовые оптические технологии и удобные функции помогают снимать прекрасные видеофильмы и фотографии с исключительным уровнем детализации.<br /> <br /> <strong>Мало света &ndash; не проблема</strong><br /> Многие камеры плохо снимают в условиях низкой освещенности, делая зернистые, шумные кадры. Сверхчувствительная матрица CMOS Exmor R&trade; сокращает шум и улучшает четкость. А в сочетании с мощным процессором BIONZ камера обеспечивает отличные результаты при плохом свете, в темных помещениях и сумерках.<br /> <br /> <strong>Уместить больше в одном кадре</strong><br /> Теперь при съемке праздника, дня рождения и других знаменательных событий точно никто не останется за кадром. Высококачественный объектив G от Sony в камере Handycam&reg; теперь снабжен улучшенными возможностями широкоугольной съемки, и снимает почти в 2 раза больше, чем предыдущие модели.<br /> <br /> <strong>Двигайтесь. Используйте зум. Делайте снимки: Еще больше четкости</strong><br /> Без штатива снимки часто получаются смазанные. Новый оптический режим SteadyShot Active Mode обеспечивает коррекцию дрожания камеры в трех направлениях, на любом значении зума, даже если вы снимаете на ходу. Камера обладает в десять раз более эффективной стабилизацией изображения при широкоугольной съемке.<br /> <br /> <strong>Наилучшее качество изображения в стандарте Full HD</strong><br /> Чем больше бит содержит каждый кадр, тем лучше качество изображения. Для наиболее ответственных видеосъемок в камере FX Mode предусмотрен режим с разрешением 1920x1080/50i и скоростью передачи данных 24 Мб/с &mdash; самое высокое возможное значение для формата AVCHD.<br /> <br /> <strong>Ловите момент</strong><br /> Функция Golf Shot позволяет снимать серию кадров на высокой скорости. Отличный способ улучшить свою технику удара... или запечатлеть любую динамичную сцену в мельчайших подробностях.</p>', '', '', ''),
(98, 'ru', 'Samsung NX10 14 Megapixel Digital', '<p>Матрица 23,4x15,6мм, 14,6 Мп / Объектив: 18-55mm OIS / поддержка карт памяти SD/SDHC / AMOLED-дисплей 3" / поддержка RAW / HD-видео / питание от литий-ионного аккумулятора / 123 x 87 x 39,8 мм, 353 г / черный</p>', '<p><em>Samsung NX10</em> &mdash; 14,6 Мп камера со сменной оптикой и электронным видоискателем. Так как оптического видоискателя с зеркалом и призмой для прямого визирования через объектив у нее нет, корпус получился существенно более компактным, чем у зеркалок. Отсутствие зеркала позволило максимально приблизить объектив к матрице. Что, в свою очередь, дает возможность делать короткофокусные объективы более простыми и компактными, чем у камер с зеркальной системой видоискателя.</p>', '', '', ''),
(99, 'ru', 'Samsung NX100 Interchangeable Lens', '<p>Матрица 23.5</p>', '<p>Матрица 23.5 &times; 15.7 мм, 20.3 Мп / объектив: 20-50 мм / поддержка карт памяти SD/SDHC/SDXC / LCD-дисплей 3" / FullHD-видео / Wi-Fi / питание от литий-ионного аккумулятора / 114 x 62.5 x 37.5 мм, 220.4 г / черный </p>', '', '', ''),
(100, 'ru', 'Canon PIXMA iP100 Photo Printer', '<p>принтер струменевий з акумулятором iP100 with battery</p>', '<p>Принцип действия струйных принтеров похож на матричные принтеры тем, что изображение на носителе формируется из точек. Но вместо головок с иголками в струйных принтерах используется матрица сопел (т. н. головка), печатающая жидкими красителями. Печатающая головка может быть встроена в картриджи с красителями (в основном такой подход используется компаниями Hewlett-Packard, Lexmark), а может и является деталью принтера, а сменные картриджи содержат только краситель (Epson, Canon).<br /> <br /> При длительном простое принтера (неделя и больше) происходит высыхание остатков красителя на соплах печатающей головки (особенно критично засорение сопел печатающей матрицы принтеров Epson, Canon). Принтер умеет сам автоматически чистить печатающую головку. Но также возможно провести принудительную очистку сопел из соответствующего раздела настройки драйвера принтера. При прочистке сопел печатающей головки происходит интенсивный расход красителя. Если штатными средствами принтера не удалось очистить сопла печатающей головки, то дальнейшая очистка и/или замена печатающей головки проводится в ремонтных мастерских. Замена картриджа, содержащего печатающую головку, на новый проблем не вызывает.<br /> <br /> Для уменьшения стоимости печати и улучшения некоторых других характеристик печати также применяют систему непрерывной подачи чернил (СНПЧ).</p>', '', '', ''),
(101, 'ru', 'Canon PIXMA iP4820 Premium', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(102, 'ru', 'Epson Stylus R1900 Photo Printer', 'Epson Stylus Photo R1900, компакт-диск с драйверам и программным \nобеспечением, руководство по установке, руководство пользователя, кабель\n питания,&nbsp; СНПЧ Epson Stylus Photo R1900, полностью заправленаня \nчернилами (по 130 мл в каждом цвете), гарантийный талон, Инструкция по \nустановке и эксплуатации СНПЧ  ', '<p>Epson Stylus Photo R1900, компакт-диск с драйверам и программным \nобеспечением, руководство по установке, руководство пользователя, кабель\n питания,&nbsp; СНПЧ Epson Stylus Photo R1900, полностью заправленаня \nчернилами (по 130 мл в каждом цвете), гарантийный талон, Инструкция по \nустановке и эксплуатации СНПЧ  <br></p>  ', '', '', ''),
(103, 'ru', 'Epson Stylus C88+ Inkjet Printer', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(104, 'ru', 'Epson Stylus Photo R2880 Color', '<p>Насладитесь удивительным результатам на каждом документе по доступной цене с помощью этого мощного струйного принтера</p>', '<p>Насладитесь удивительным результатам на каждом документе по доступной цене с помощью этого мощного струйного принтера. DURABrite &reg; Ultra пигментные чернила производит яркие, долговечные результаты, которые, несомненно, впечатляет. Продукция полей, готовых к отпечатки кадров в популярных размерах до 8 1/2 х 11 дюймов Удобный, раздельных картриджей позволяет заменять только цвета вам нужно. Особенности USB и параллельный порт подключения для дополнительного удобства и совместимости. Большой 120-листов лоток для бумаги максимальную производительность. Максимальная скорость печати (черный): 23,0 промилле; сети Ready: Нет, Тип принтера: струйный; Разрешение печати (цветной) (ширина х высота): 5760 х 1440 точек на дюйм. </p>', '', '', '');
INSERT INTO `shop_products_i18n` (`id`, `locale`, `name`, `short_description`, `full_description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(105, 'ru', 'Panasonic KX-TG6582T Cordless Phone', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(106, 'ru', 'Panasonic KX-TG7433B Expandable', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(107, 'ru', 'Plantronics CS70N Wireless Earset', 'Гарнитура CS70N представляет собой модификацию популярной гарнитуры \nCS70, в которую добавлена система шумоподавления, повышающая качество \nпередаваемого звука. В отличие от предыдущей модели микрофон гарнитуры \nCS70N размещен на элегантном держателе, что позволяет существенно \nснизить уровень посторонних шумов в передаваемом звуке. Кроме того, \nпрозрачный  ', '<p>Гарнитура CS70N представляет собой модификацию популярной гарнитуры \nCS70, в которую добавлена система шумоподавления, повышающая качество \nпередаваемого звука. В отличие от предыдущей модели микрофон гарнитуры \nCS70N размещен на элегантном держателе, что позволяет существенно \nснизить уровень посторонних шумов в передаваемом звуке. Кроме того, \nпрозрачный держатель микрофона делает гарнитуру практически незаметной. \nCS70N состоит из базового блока и самой гарнитуры. Базовый блок \nвыполняет функцию радиоадаптера для подключения гарнитуры к офисным \nтелефонным аппаратам, служит подставкой для гарнитуры, а также выполняет\n роль зарядного устройства. Время работы гарнитуры составляет 5 часов в \nрежиме разговора и 28 часов в режиме ожидания. Для возможности \nудаленного принятия вызова, в комплект CS70N™ входит специальное \nустройство - микролифт HL10, а функция IntelliStand™ позволяет \nавтоматически осуществлять прием вызова снятием гарнитуры с подставки \nбез нажатия на кнопку принятия вызова. Вес гарнитуры составляет всего 22\n грамма. В комплекте с системой CS70N поставляются 3 гелевые подушечки \nразных размеров, что позволяет, оптимально подобрать вариант крепления \nгарнитуры для комфортного использования.  </p>  ', '', '', ''),
(108, 'ru', 'Plantronics CS55 Wireless Earset', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(109, 'ru', 'Panasonic KX-TG6445 Cordless Phone', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(110, 'ru', 'Motorola H720 Earset - Mono', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(111, 'ru', 'Plantronics Discovery 665 Wireless', '- Тип: моно<br>- Тип наушников: вкладыши<br> - Bluetooth 2<br> - Вес: 9 г.  ', '<p>- Ответить-закончить разговор <br> - Ожидание вызова <br> - Голосовой набор <br> - Повтор номера <br> - Автоматическое парное соединение <br> - Автоматическая подстройка громкости <br> - Отключение микрофона <br> - Подавление шума <br> - Индикатор состояния <br> - Крепление с заушиной  <br></p>  ', '', '', ''),
(112, 'ru', 'Motorola H270 Bluetooth Headset', 'Motorola H270 – это беспроводная гарнитура среднего класса.  ', '<p>Motorola H270 – это беспроводная гарнитура среднего класса. \n<br>\n<br>Устройство имеет достаточно типичный дизайн для гарнитур компании. \nКорпус выполнен из качественного пластика и хорошо собран. H270 имеет \nудобные размеры 53,5x16x12 мм и вес — 11 грамм. Благодаря этому, она \nпрактически не чувствуется даже после длительного использования. Также \nэтому способствуют ушной интерфейс True Comfort и мягкая ушная подушка. \nЗа управление отвечают кнопки регулировки громкости и \nмногофункциональная клавиша. В комплекте идёт дужка для ношения, но \nустройство можно носить и без неё.\n<br>\n<br>По функциональным возможностям Motorola H270 ничего выдающегося не \nдемонстрирует, но все функции реализированы чётко и надёжно. Встроенный \nаккумулятор обеспечит работу на протяжении 6 часов в режиме разговора и 6\n дней в режиме ожидания. Поддержка профиля Bluetooth v2.1 с EDR, \nобеспечивает быструю и надёжную связь с телефонами. Гарнитура \nдемонстрирует хорошее качество передачи речи.\n<br>\n<br>Motorola H270 – гарнитура на каждый день. Практичная и удобная, она прекрасно подойдёт водителям.  <br></p>  ', '', '', ''),
(113, 'ru', 'LG HBM-210 Bluetooth Headset', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(114, 'ru', 'Samsung AWEP450PBECSTA Bluetooth Headset Black', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(115, 'ru', 'Pioneer TS-SW3041D Shallow-Mount Subwoofer', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(116, 'ru', 'Pyle PLT-AB8 Subwoofer - PLTAB8', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(117, 'ru', 'Pyle PLSQ10D Red Label Square', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(118, 'ru', 'Pioneer TS-W251R Subwoofer', 'Автомобильный сабвуферный динамик Pioneer TS-W251R  ', '<p>Автомобильный сабвуферный динамик Pioneer TS-W251R представляет собой \nбюджетное решение проблемы баса в вашем автомобиле. Высокая \nчувствительность, непритязательность к акустическому оформлению, \nспособность работать даже под маломощными усилителями делают этот \nсабвуфер выгодным приобретением. Опять же ни для кого не секрет, что \nнизкие частоты и Pioneer это практически слова синонимы - от этого \nдинамика вы получите именно то, чего ожидаете - бас, драйв, скорость.  </p>  ', '', '', ''),
(119, 'ru', 'Pioneer TSSW2541D Subwoofer', '', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br /><br />Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br /><br />На все продукты мы предоставляем гарантию качества.<br /><br />Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>', '', '', ''),
(120, 'ru', 'Pioneer JD-1212S 12-disc CD', '<ul><li>\n    Магазин-кассета для дисков для CD-чейнджера</li><li>\n    Вместимость 12 дисков</li></ul>  ', '<br><ul><li>\n    Магазин-кассета для дисков для CD-чейнджера</li><li>\n    Вместимость 12 дисков</li></ul>  ', '', '', ''),
(121, 'ru', 'Pioneer JD-612V 6-disc CD Magazine', '<div>\n                <ul><li>\n    Магазин-кассета для дисков для CD-чейнджеров</li><li>\n    Вместимость 6 дисков</li></ul></div>  ', '<br><div>\n                <ul><li>\n    Магазин-кассета для дисков для CD-чейнджеров</li><li>\n    Вместимость 6 дисков</li></ul></div>  ', '', '', ''),
(122, 'ru', 'Panasonic CX-DP880U 8-Disc', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(123, 'ru', 'JVC - XCM200 - 12-Disc CD', ' ', '<p>Высоко технологический продукт, который поможет Вам оценить качество на высшем уровне.<br><br>Все продукты доступны в наличии, а наши менеджеры помогу Вам произвести покупку в кратчайшие сроки.<br><br>На все продукты мы предоставляем гарантию качества.<br><br>Приобретайте только в нашем Интернет-магазине по лучшим ценам.</p>  ', '', '', ''),
(124, 'ru', 'JVC - CHX1500RF - FM Modulation', 'JVC CH-X1500 RF - компактный CD чейнджер с возможностью дистанционного управления.  ', '<p>JVC - Компания JVC (Victor Company of Japan) является одним из \nлидирующих мировых производителей аудио и видео продукции. Будучи \nразработчиком VHS-формата, воплощенного в фирменных видеомагнитофонах \nJVC, сегодня компания продолжает удивлять потребителей революционными \nтехническими инновациями. Многолетний опыт JVC позволяет прочно \nудерживать передовые позиции на рынке аудиовизуальной продукции. JVC \nCH-X1500 RF - компактный CD чейнджер с возможностью дистанционного \nуправления. Это автомобильный CD-чейнджер на 12 дисков. Удобство в \nуправлении и эксплуатации.  <br></p>  ', '', '', ''),
(115, 'en', 'Pioneer TS-SW3041D Shallow-Mount Subwoofer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(124, 'en', 'JVC - CHX1500RF - FM Modulation', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(123, 'en', 'JVC - XCM200 - 12-Disc CD', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(120, 'en', 'Pioneer JD-1212S 12-disc CD', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(102, 'en', 'Epson Stylus R1900 Photo Printer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(101, 'en', 'Canon PIXMA iP4820 Premium', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(109, 'en', 'Panasonic KX-TG6445 Cordless Phone', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(108, 'en', 'Plantronics CS55 Wireless Earset', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(114, 'en', 'Samsung AWEP450PBECSTA Bluetooth Headset Black', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(113, 'en', 'LG HBM-210 Bluetooth Headset', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(111, 'en', 'Plantronics Discovery 665 Wireless', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(119, 'en', 'Pioneer TSSW2541D Subwoofer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(118, 'en', 'Pioneer TS-W251R Subwoofer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(117, 'en', 'Pyle PLSQ10D Red Label Square', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(83, 'en', 'Sony BDP-S470 Network', '', '', '', '', ''),
(91, 'en', 'Sony BDV-E770W Home Theater1', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(90, 'en', 'Samsung HT-C7530W 5.1 Channel', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(89, 'en', 'Panasonic SCPTX7 Home Theater', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(93, 'en', 'Yamaha HS80M Powered Speaker', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(99, 'en', 'Samsung NX100 Interchangeable Lens', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(98, 'en', 'Samsung NX10 14 Megapixel Digital', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(97, 'en', 'Sony Handycam HDR-CX3', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(96, 'en', 'Canon VIXIA HF R11 Digital', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(104, 'en', 'Epson Stylus Photo R2880 Color', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(103, 'en', 'Epson Stylus C88+ Inkjet Printer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(94, 'en', 'Yamaha NSIW760 Speaker', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(81, 'en', 'Samsung DVD-H1080 - 1080p', '', '', '', '', ''),
(86, 'en', 'Samsung BD-C6900 1080p 3D Blu-ray', '', '', '', '', ''),
(85, 'en', 'LG BD570 Network Audio', '', '', '', '', ''),
(84, 'en', 'Panasonic DMP-BD45 Ultra-Fast', '', '', '', '', ''),
(91, 'ua', 'Sony BDV-E770W Home Theater', '', '', '', '', ''),
(71, 'en', 'Sony KDL46EX710 46', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(79, 'en', 'Panasonic DVD-S38 DVD', '', '', '', '', ''),
(78, 'en', 'Panasonic DVD-S58 DVD Player', '', '', '', '', ''),
(82, 'en', 'Samsung BD-C5500 Blu-ray', '', '', '', '', ''),
(92, 'en', 'Samsung HW-C700 7.2 Channel', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(88, 'en', 'Samsung HW-C770BS 7.1 Channel', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(87, 'en', 'Sony HT-SS370 Home Theater', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(100, 'en', 'Canon PIXMA iP100 Photo Printer', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(95, 'en', 'Canon EOS Rebel T2i 18 Megapixel Digital', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(112, 'en', 'Motorola H270 Bluetooth Headset', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(110, 'en', 'Motorola H720 Earset - Mono', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(107, 'en', 'Plantronics CS70N Wireless Earset', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(106, 'en', 'Panasonic KX-TG7433B Expandable', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(105, 'en', 'Panasonic KX-TG6582T Cordless Phone', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(116, 'en', 'Pyle PLT-AB8 Subwoofer - PLTAB8', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(122, 'en', 'Panasonic CX-DP880U 8-Disc', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(121, 'en', 'Pioneer JD-612V 6-disc CD Magazine', '', '<p><span id="result_box" lang="en"><span>High</span> <span>technology product</span> <span>that will help you</span> <span>evaluate the quality of</span> <span>the highest level.</span><br /><br /> <span>All products are available</span> <span>in stock</span><span>, and our managers</span> <span>will help you</span> <span>to make a purchase</span> <span>as soon as possible</span><span>.</span><br /><br /> <span>On</span> <span>all the products we</span> <span>offer a guarantee</span> <span>of quality.</span><br /><br /> <span>Purchase only</span> <span>from our online</span> <span>store</span> <span>at the best prices</span><span>.</span></span></p>', '', '', ''),
(185, 'ru', 'Apple iPhone 5 16GB Black Slate', ' ', ' ', '', '', ''),
(186, 'ru', 'Samsung UE32EH4030WXUA', '<p>32 дюйма, 1366x768, 720p, 16:9, LED-подсветка, 300000:1, звук: 2х10 Вт, SCART, RGB, VGA, HDMI x2, USB</p>', '<div>Супертонкий и плоский LED телевизор Samsung UE32EH4030WXUA идеально подойдет для вашей гостиной. При минималистичном дизайне этот телевизор обеспечивает кинематографическую реалистичность впечатлений во время просмотра, благодаря светодиодной подсветке матрицы ТВ Samsung UE32EH4030WXUA. Получите удовольствие от максимальной четкости динамичного изображения, насыщенности и многообразия цветовых оттенков.</div>', '', '', '');
INSERT INTO `shop_products_i18n` (`id`, `locale`, `name`, `short_description`, `full_description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(187, 'ru', 'Samsung UE40ES6307UXUA', '40 дюймов, LED, 1920x1080, 16:9, Full HD, 178°/178°, 2х10 Вт, 3xHDMI, 3xUSB, Ethernet (LAN), Wi-Fi, Smart TV  ', '<strong>Новый уровень ощущений в формате 3D</strong><br>\nLED телевизоры Samsung внесли в мир развлечений совершенно новые \nощущения. Благодаря новейшим достижениям технологии 3D вы погружаетесь в\n совершенно новый мир ТВ-реальности.<br>\n<br>\n<strong>Смотрите фильмы, загружая их прямо с USB-накопителя</strong><br>\nБлагодаря функции ConnectShare Movie, вы можете росто вставить ваш USB \nнакопитель или жесткий диск в USB разъем телевизора, чтобы записанные на\n носителе фильмы, фотоснимки или музыкальные треки начали \nвоспроизводиться на экране телевизора. Теперь на большом экране \nтелевизора, установленного в гостиной, вы можете просмотреть или \nпрослушать любой контент.<br>\n<br>\n<strong>Видеозвонки по Skype на большом экране</strong><br>\nПриложение Skype для Smart TV доступно бесплатно в магазине Samsung App.\n В сочетании с отдельно приобретаемой веб-камерой Skype вы сможете \nсовершать видеозвонки своим друзьям и близким на большом экране почти \nили совсем бесплатно. С помощью пульта ДУ вы можете легко создать новые \nSkype эккаунты и получать доступ к существующим. Теперь видеосвязь \nбуквально в ваших руках.<br>\n<br>\n<strong>Доступ в Интернет без проводов</strong><br>\nВстроенная поддержка сети, широкие возможности подключения других устройств сочетаются с привлекательным дизайном.<br>\n<br>\n<strong>Наслаждайтесь приложениями, видео, Skype, серфингом в Интернете и многими другими возможностями</strong><br>\nБлагодаря вашей домашней системе развлечений вы откроете для себя новый \nмир социальных и персонализированных развлечений на обновленном портале \nSamsung Smart Hub и трех новых сервисах. Раздел Family Story позволит \nподелиться в друзьями и близкими фотоснимками, текстовыми комментариями и\n самыми знаменательными событиями вашей жизни. Кроме того, дети могут \nвоспользоваться развлекательными, обучающими и познавательными \nпрограммами в разделе Kids (Для детей). С помощью раздела "Фитнес" \n(Fitness) вы можете заниматься фитнесом и контролировать результаты на \nэкране телевизора. Доступ к большой библиотеке контента, приложениям на \nпортале Samsung Apps и возможность бродить по страницам Интернета \nсущественно разнообразит ваш семейный досуг и позволит получить массу \nновых положительных эмоций.  ', '', '', ''),
(188, 'ru', 'LG 32LS359T', '<p>LED телевізор 32 LG 32LS359T (81,28 см, 16:9, HD Ready, 1366x768, 1000000:1, 178/178, 3 мс, Pal/Secam-B/G, Pal/Secam-D/K, Pal-I/I'', DVB-T2, DVB-C, Triple XD Engine, 2x5 Вт, телетекст (1000), годинник, таймер, CI Slot, RF In (T2/C), Composite, Full Scart, Component (Y,Pb,Pr), HDMI/HDCP (1.4)x2, USB 2.0 (JPEG/ MP3/ DivX), LAN, 100~240 В, 50-60 Гц, 755x530x288.8</p>', '<p>LED телевізор 32" LG 32LS359T (81, 28 см, 16:9, HD Ready, 1366x768, 1000000:1, 178/178, 3 мс, Pal/Secam-B/G, Pal/Secam-D/K, Pal-I/I'', DVB-T2, DVB-C, Triple XD Engine, 2x5 Вт, телетекст (1000), годинник, таймер, CI Slot, RF In (T2/C), Composite, Full Scart, Component (Y, Pb, Pr), HDMI/HDCP (1.4)x2, USB 2.0 (JPEG/ MP3/ DivX), LAN, 100~240 В, 50-60 Гц, 755x530x288.8 мм, 9.1 кг, білий)</p>', '', '', ''),
(189, 'ru', 'LG 47LM580T', '<div>\r\n<div>ЖК-телевизор, 47, 16:9, 1920x1080, HDTV, 1080p (Full HD), LED-подсветка, 200 Гц, 3D, мощность звука 20 Вт, HDMI x3, VGA</div>\r\n</div>', '<p>ЖК-телевизор, 47", 16:9, 1920x1080, HDTV, 1080p (Full HD), LED-подсветка, 200 Гц, 3D, мощность звука 20 Вт, HDMI x3, VGA</p>', '', '', ''),
(190, 'ru', 'Samsung LE40D550K1WXUA', '<div>\r\n<div>LCD телевізор 40 Samsung LE-40D550K1WXUA (Full HD 1080p 1920х1080, 500 cd/m2, 50Hz, 10 Wx2 SRS TheaterSound, HDMI 1.4, USB, Component In (Y/Pb/Pr), Composite In (AV), Digital Audio Out (Optical), PC In (D-sub), CI Slot, Scart, RF In (Terrestrial/Cable Input), headphones, PC Audio In (Mini Jack), DVI Audio In (Mini Jack), Ethernet (LAN) , VESA 200х200mm</div>\r\n</div>', '<h1>Интернет-магазин</h1>\r\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\r\n<h2>Заголовок второго уровня</h2>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\r\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\r\n<h3>Заголовок третьего уровня</h3>\r\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\r\n<ul>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ul>\r\n<h4>Заголовок четвертого уровня</h4>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td>название</td>\r\n<td>размер</td>\r\n<td>цена</td>\r\n</tr>\r\n<tr>\r\n<td>длинна трубы</td>\r\n<td>10 метров</td>\r\n<td>145 уе</td>\r\n</tr>\r\n<tr>\r\n<td>ширина трубы</td>\r\n<td>2 метра</td>\r\n<td>134 уе</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\r\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\r\n<ol>\r\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\r\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\r\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\r\n</ol>\r\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>', '', '', ''),
(191, 'ru', 'Sony KDL-22EX553', '<p>22 // 1366x768 пикс // 50 Гц // LED подсветка // эфирный (DVB-T) // кабельный (DVB-C) // HDMI: 2 шт // Компонентный //Композитный // SCART // USB // LAN // Линейный</p>', '<div><strong>KDL-22EX553<br /> Новый способ просмотра ТВ</strong></div>\r\n<p><br /> 55 см / 22", телевизор HD Ready с технологией подсветки Edge LED, X-Reality, встроенным Wi-Fi&reg; и интернет-телевидением от Sony<br /> Наслаждайтесь четким отображением на тонком экране Edge LED<br /> Wi-Fi обеспечивает быстрый доступ к функции просмотра пропущенных программ, фильмам и приложениям<br /> Для более комфортного просмотра предусматривается изменение угла наклона телевизора</p>\r\n<div><strong>Мир развлечений на кончиках пальцев</strong></div>\r\n<p><br /> Начните революцию интернет-телевидения у себя дома. Откройте увлекательный новый мир передачи контента по запросу, просмотра пропущенных программ, приложений и многого другого, и все это - с четким, детализированным изображением, на большом и тонком ЖК-экране. Пришло время управлять центром развлечений в вашем доме.</p>\r\n<div><strong>Четкое, реалистичное изображение</strong></div>\r\n<p><br /> X-Reality обеспечивает более четкое и реалистичное HD-изображение, вне зависимости от источника: будь то интернет-канал, DVD-диск или любительский клип. Кроме того, эта технология убирает эффект мерцания, гарантируя более плавное отображение динамичных спортивных передач.</p>\r\n<div><strong>Новый дизайн, легкие материалы</strong></div>\r\n<p><br /> Телевизоры серии HX75 выполнены из контрастных материалов и имеют безукоризненный дизайн. Вас восхитит легкость этого телевизора, который располагается на подставке в форме мольберта, позволяющей вращать его в вертикальной и горизонтальной плоскости для идеального угла обзора.</p>\r\n<div><strong>Беспроводной доступ к онлайн-развлечениям</strong></div>\r\n<p><br /> Теперь доступ к контенту сетевого сервиса Sony Entertainment Network &mdash; HD-фильмам, миллионам музыкальных композиций, любимым телеканалам, веб-браузеру, приложениям Twitter&trade;, Facebook&reg;, YouTube&trade;, Skype&trade; и многому другому &mdash; осуществляется с помощью дистанционного пульта или мобильного устройства с поддержкой распознавания голоса.</p>\r\n<div><strong>Энергосберегающие функции телевизоров</strong></div>\r\n<p><br /> Новая функция затемнения LED Frame автоматически подстраивает яркость подсветки при просмотре и снижает потребление энергии, позволяя экономить деньги. При этом изображение остается резким и высококонтрастным.</p>', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_products_rating`
--

DROP TABLE IF EXISTS `shop_products_rating`;
CREATE TABLE IF NOT EXISTS `shop_products_rating` (
  `product_id` int(11) NOT NULL,
  `votes` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_products_rating`
--

INSERT INTO `shop_products_rating` (`product_id`, `votes`, `rating`) VALUES
(71, 1, 2),
(81, 1, 5),
(88, 2, 6),
(76, 3, 11),
(82, 1, 4),
(77, 2, 7),
(73, 1, 2),
(108, 2, 6),
(72, 1, 5),
(74, 2, 8),
(75, 2, 9),
(94, 1, 4),
(87, 1, 5),
(79, 1, 5),
(190, 3, 11);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_categories`
--

DROP TABLE IF EXISTS `shop_product_categories`;
CREATE TABLE IF NOT EXISTS `shop_product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `shop_product_categories_FI_2` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_product_categories`
--

INSERT INTO `shop_product_categories` (`product_id`, `category_id`) VALUES
(71, 36),
(71, 37),
(71, 74),
(78, 36),
(78, 37),
(78, 74),
(79, 36),
(79, 38),
(81, 36),
(81, 76),
(81, 77),
(82, 36),
(82, 74),
(83, 36),
(83, 74),
(84, 36),
(84, 74),
(85, 36),
(85, 74),
(86, 36),
(86, 74),
(87, 36),
(87, 74),
(88, 40),
(88, 74),
(89, 40),
(89, 74),
(90, 40),
(90, 74),
(91, 40),
(91, 74),
(92, 40),
(92, 43),
(93, 40),
(93, 43),
(94, 40),
(94, 43),
(95, 44),
(95, 45),
(96, 44),
(96, 45),
(97, 44),
(97, 74),
(98, 44),
(98, 74),
(99, 44),
(99, 74),
(100, 44),
(100, 74),
(101, 44),
(101, 74),
(102, 44),
(102, 46),
(103, 44),
(103, 46),
(104, 44),
(104, 46),
(105, 48),
(105, 50),
(106, 48),
(106, 50),
(107, 48),
(107, 51),
(108, 48),
(108, 51),
(109, 48),
(109, 50),
(110, 48),
(110, 51),
(111, 48),
(111, 51),
(112, 48),
(112, 51),
(113, 48),
(113, 51),
(114, 48),
(114, 51),
(115, 52),
(115, 53),
(116, 52),
(116, 53),
(117, 52),
(117, 53),
(118, 52),
(118, 53),
(119, 48),
(119, 53),
(120, 54),
(121, 54),
(122, 54),
(123, 52),
(123, 54),
(124, 52),
(124, 54),
(185, 48),
(185, 50),
(186, 36),
(186, 37),
(186, 74),
(187, 36),
(187, 37),
(187, 74),
(188, 36),
(188, 37),
(188, 74),
(189, 36),
(189, 37),
(189, 74),
(190, 36),
(190, 37),
(190, 74),
(191, 36),
(191, 37),
(191, 74);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_images`
--

DROP TABLE IF EXISTS `shop_product_images`;
CREATE TABLE IF NOT EXISTS `shop_product_images` (
  `product_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`image_name`),
  KEY `shop_product_images_I_1` (`position`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_product_images`
--

INSERT INTO `shop_product_images` (`product_id`, `image_name`, `position`) VALUES
(186, '186_2.jpg', 2),
(186, '186_1.jpg', 1),
(187, '187_0.jpg', 0),
(186, '186_3.jpg', 3),
(186, '186_4.jpg', 4),
(187, '187_1.jpg', 1),
(187, '187_2.jpg', 2),
(187, '187_3.jpg', 3),
(188, '188_0.jpg', 0),
(188, '188_1.jpg', 1),
(188, '188_2.jpg', 2),
(188, '188_3.jpg', 3),
(71, '71_0.jpg', 0),
(71, '71_1.jpg', 1),
(71, '71_2.jpg', 2),
(189, '189_0.jpg', 0),
(189, '189_1.jpg', 1),
(189, '189_2.jpg', 2),
(190, '190_0.jpg', 0),
(190, '190_1.jpg', 1),
(190, '190_2.jpg', 2),
(191, '191_0.jpg', 0),
(191, '191_1.jpg', 1),
(185, '185_0.jpg', 0),
(185, '185_1.jpg', 1),
(185, '185_2.jpg', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_properties`
--

DROP TABLE IF EXISTS `shop_product_properties`;
CREATE TABLE IF NOT EXISTS `shop_product_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `csv_name` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `show_in_compare` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `show_on_site` tinyint(1) DEFAULT NULL,
  `multiple` tinyint(1) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `show_in_filter` tinyint(1) DEFAULT NULL,
  `main_property` tinyint(1) DEFAULT NULL,
  `show_faq` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_properties_I_2` (`active`),
  KEY `shop_product_properties_I_3` (`show_on_site`),
  KEY `shop_product_properties_I_4` (`show_in_compare`),
  KEY `shop_product_properties_I_5` (`position`),
  KEY `shop_product_properties_I_1` (`active`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Дамп даних таблиці `shop_product_properties`
--

INSERT INTO `shop_product_properties` (`id`, `csv_name`, `active`, `show_in_compare`, `position`, `show_on_site`, `multiple`, `external_id`, `show_in_filter`, `main_property`, `show_faq`) VALUES
(20, 'displaytech', 1, 1, 0, 1, 0, NULL, 1, 1, 0),
(21, 'razmerekrana', 1, 1, 1, 1, 0, NULL, 1, 0, 0),
(22, 'hdmi', 1, 1, 2, 1, 0, NULL, 1, 0, 0),
(23, 'power', 1, 1, 3, 1, 0, NULL, 1, 1, 0),
(24, 'digitalopticalinput', 1, 1, 4, 1, 1, NULL, 1, 1, 0),
(25, 'focus', 1, 1, 5, 1, 0, NULL, 1, 0, 0),
(26, 'megapixel', 1, 1, 6, 1, 0, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_properties_categories`
--

DROP TABLE IF EXISTS `shop_product_properties_categories`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_categories` (
  `property_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`),
  KEY `shop_product_properties_categories_FI_2` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_product_properties_categories`
--

INSERT INTO `shop_product_properties_categories` (`property_id`, `category_id`) VALUES
(20, 36),
(20, 37),
(20, 38),
(20, 39),
(20, 40),
(20, 41),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 48),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(20, 55),
(20, 74),
(20, 75),
(20, 76),
(20, 77),
(20, 79),
(20, 80),
(20, 81),
(20, 82),
(20, 83),
(21, 36),
(21, 37),
(21, 38),
(21, 39),
(21, 40),
(21, 41),
(21, 43),
(21, 44),
(21, 45),
(21, 46),
(21, 48),
(21, 50),
(21, 51),
(21, 52),
(21, 53),
(21, 54),
(21, 55),
(21, 74),
(21, 75),
(21, 76),
(21, 77),
(21, 79),
(21, 80),
(21, 81),
(21, 82),
(21, 83),
(22, 36),
(22, 37),
(22, 38),
(22, 39),
(22, 40),
(22, 41),
(22, 43),
(22, 44),
(22, 45),
(22, 46),
(22, 48),
(22, 50),
(22, 51),
(22, 52),
(22, 53),
(22, 54),
(22, 55),
(22, 74),
(22, 75),
(22, 76),
(22, 77),
(22, 79),
(22, 80),
(22, 81),
(22, 82),
(22, 83),
(23, 36),
(23, 37),
(23, 38),
(23, 39),
(23, 40),
(23, 41),
(23, 43),
(23, 44),
(23, 45),
(23, 46),
(23, 48),
(23, 50),
(23, 51),
(23, 52),
(23, 53),
(23, 54),
(23, 55),
(23, 74),
(23, 75),
(23, 76),
(23, 77),
(23, 79),
(23, 80),
(23, 81),
(23, 82),
(23, 83),
(24, 36),
(24, 37),
(24, 38),
(24, 39),
(24, 40),
(24, 41),
(24, 43),
(24, 44),
(24, 45),
(24, 46),
(24, 48),
(24, 50),
(24, 51),
(24, 52),
(24, 53),
(24, 54),
(24, 55),
(24, 74),
(24, 75),
(24, 76),
(24, 77),
(24, 79),
(24, 80),
(24, 81),
(24, 82),
(24, 83),
(25, 36),
(25, 37),
(25, 38),
(25, 39),
(25, 40),
(25, 41),
(25, 43),
(25, 44),
(25, 45),
(25, 46),
(25, 48),
(25, 50),
(25, 51),
(25, 52),
(25, 53),
(25, 54),
(25, 55),
(25, 74),
(25, 75),
(25, 76),
(25, 77),
(25, 79),
(25, 80),
(25, 81),
(25, 82),
(25, 83),
(26, 44),
(26, 45);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_properties_data`
--

DROP TABLE IF EXISTS `shop_product_properties_data`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value` varchar(500) NOT NULL,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_properties_data_I_1` (`value`(333)),
  KEY `shop_product_properties_data_FI_2` (`product_id`),
  KEY `shop_product_properties_data_FI_1` (`property_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6300 ;

--
-- Дамп даних таблиці `shop_product_properties_data`
--

INSERT INTO `shop_product_properties_data` (`id`, `property_id`, `product_id`, `value`, `locale`) VALUES
(22, 22, 91, 'Да', 'en'),
(23, 23, 91, '1500 Вт', 'en'),
(24, 24, 91, '2', 'en'),
(6141, 23, 83, '100 Вт', 'ru'),
(6258, 25, 71, 'Да', 'ru'),
(6257, 24, 71, '3', 'ru'),
(6133, 21, 82, '17', 'ru'),
(6134, 22, 82, 'Нет', 'ru'),
(6135, 23, 82, '100 Вт', 'ru'),
(6136, 24, 82, '1', 'ru'),
(6137, 25, 82, 'Да', 'ru'),
(6139, 21, 83, '17', 'ru'),
(6140, 22, 83, 'Нет', 'ru'),
(5990, 23, 79, '50 Вт', 'ru'),
(6084, 26, 96, '15 Мп', 'ru'),
(6132, 20, 82, 'LCD', 'ru'),
(6138, 20, 83, 'LED', 'ru'),
(6145, 20, 84, 'LED', 'ru'),
(6151, 20, 85, 'LCD', 'ru'),
(6157, 20, 86, 'LED', 'ru'),
(6215, 21, 101, '19', 'ru'),
(6204, 20, 99, 'Plasma', 'ru'),
(6205, 21, 99, '19', 'ru'),
(6206, 22, 99, 'Нет', 'ru'),
(6207, 24, 99, '1', 'ru'),
(6208, 25, 99, 'Нет', 'ru'),
(6209, 20, 100, 'LED', 'ru'),
(6210, 21, 100, '40', 'ru'),
(6211, 22, 100, 'Да', 'ru'),
(6212, 24, 100, '3', 'ru'),
(6213, 25, 100, 'Да', 'ru'),
(6214, 20, 101, 'LED', 'ru'),
(370, 25, 95, 'Да', 'ru'),
(371, 26, 95, '12 Мп', 'ru'),
(6299, 25, 89, 'Нет', 'ru'),
(6298, 24, 89, '12', 'ru'),
(6296, 24, 89, '10', 'ru'),
(6297, 24, 89, '11', 'ru'),
(6183, 22, 90, 'Нет', 'ru'),
(6182, 21, 90, '21', 'ru'),
(6181, 20, 90, 'LCD', 'ru'),
(6189, 22, 91, 'Да', 'ru'),
(6188, 21, 91, '17', 'ru'),
(6187, 20, 91, 'Plasma', 'ru'),
(6283, 23, 92, '100 Вт', 'ru'),
(442, 23, 93, '80 Вт', 'ru'),
(445, 23, 94, '100 Вт', 'ru'),
(6194, 21, 97, '19', 'ru'),
(6193, 20, 97, 'LCD', 'ru'),
(6199, 21, 98, '19', 'ru'),
(6198, 20, 98, 'LCD', 'ru'),
(508, 23, 118, '100 Вт', 'ru'),
(511, 23, 117, '40 Вт', 'ru'),
(514, 23, 116, '40 Вт', 'ru'),
(517, 23, 115, '40 Вт', 'ru'),
(537, 23, 122, '100 Вт', 'ru'),
(538, 24, 122, '4', 'ru'),
(562, 23, 124, '100 Вт', 'ru'),
(563, 24, 124, '2', 'ru'),
(6083, 25, 96, 'Да', 'ru'),
(6222, 22, 186, 'Да', 'ru'),
(6221, 21, 186, '32', 'ru'),
(6220, 20, 186, 'LED', 'ru'),
(641, 22, 187, 'Да', 'ru'),
(640, 21, 187, '40', 'ru'),
(639, 20, 187, 'LED', 'ru'),
(6239, 22, 188, 'Да', 'ru'),
(6237, 20, 188, 'LED', 'ru'),
(6238, 21, 188, '23', 'ru'),
(6286, 24, 92, '9', 'ru'),
(6285, 24, 92, '5', 'ru'),
(6264, 25, 78, 'Нет', 'ru'),
(6263, 24, 78, '2', 'ru'),
(6262, 23, 78, '100 Вт', 'ru'),
(6259, 20, 78, 'LED', 'ru'),
(6260, 21, 78, '39', 'ru'),
(6261, 22, 78, 'Да', 'ru'),
(6280, 22, 189, 'Нет', 'ru'),
(6278, 20, 189, 'Plasma', 'ru'),
(6279, 21, 189, '34', 'ru'),
(823, 23, 81, '50 Вт', 'ru'),
(6275, 22, 190, 'Нет', 'ru'),
(6276, 24, 190, '5', 'ru'),
(6277, 24, 190, '7', 'ru'),
(6281, 24, 189, '3', 'ru'),
(6282, 24, 189, '8', 'ru'),
(6267, 22, 191, 'Да', 'ru'),
(6268, 24, 191, '6', 'ru'),
(6269, 24, 191, '7', 'ru'),
(6270, 24, 191, '8', 'ru'),
(6271, 24, 191, '9', 'ru'),
(6272, 25, 191, 'Да', 'ru'),
(877, 23, NULL, '100 Вт', 'ru'),
(881, 23, NULL, '50 Вт', 'ru'),
(885, 23, NULL, '50 Вт', 'ru'),
(889, 23, NULL, '100 Вт', 'ru'),
(892, 23, NULL, '100 Вт', 'ru'),
(895, 23, NULL, '40 Вт', 'ru'),
(898, 23, NULL, '100 Вт', 'ru'),
(901, 23, NULL, '50 Вт', 'ru'),
(904, 23, NULL, '50 Вт', 'ru'),
(907, 22, NULL, 'Да', 'ru'),
(908, 23, NULL, '100 Вт', 'ru'),
(909, 24, NULL, '2', 'ru'),
(914, 22, NULL, 'Да', 'ru'),
(915, 23, NULL, '100 Вт', 'ru'),
(920, 22, NULL, 'Да', 'ru'),
(921, 23, NULL, '100 Вт', 'ru'),
(922, 24, NULL, '2', 'ru'),
(927, 22, NULL, 'Да', 'ru'),
(928, 23, NULL, '100 Вт', 'ru'),
(929, 24, NULL, '1', 'ru'),
(934, 22, NULL, 'Да', 'ru'),
(935, 23, NULL, '1500 Вт', 'ru'),
(936, 24, NULL, '2', 'ru'),
(941, 23, NULL, '100 Вт', 'ru'),
(944, 23, NULL, '80 Вт', 'ru'),
(947, 23, NULL, '100 Вт', 'ru'),
(950, 25, NULL, 'Да', 'ru'),
(951, 26, NULL, '15 Мп', 'ru'),
(954, 25, NULL, 'Да', 'ru'),
(955, 26, NULL, '12 Мп', 'ru'),
(958, 25, NULL, 'Да', 'ru'),
(959, 26, NULL, '15 Мп', 'ru'),
(962, 25, NULL, 'Да', 'ru'),
(963, 26, NULL, '10 Мп', 'ru'),
(966, 25, NULL, 'Да', 'ru'),
(967, 26, NULL, '15 Мп', 'ru'),
(1018, 23, NULL, '40 Вт', 'ru'),
(1021, 23, NULL, '40 Вт', 'ru'),
(1024, 23, NULL, '40 Вт', 'ru'),
(1027, 23, NULL, '100 Вт', 'ru'),
(1030, 23, NULL, '40 Вт', 'ru'),
(1035, 23, NULL, '100 Вт', 'ru'),
(1036, 24, NULL, '4', 'ru'),
(1040, 23, NULL, '100 Вт', 'ru'),
(1041, 24, NULL, '2', 'ru'),
(1044, 20, NULL, 'LED', 'ru'),
(1045, 22, NULL, 'Да', 'ru'),
(1047, 20, NULL, 'LED', 'ru'),
(1048, 21, NULL, '32', 'ru'),
(1049, 22, NULL, 'Да', 'ru'),
(1051, 20, NULL, 'LED', 'ru'),
(1052, 21, NULL, '40', 'ru'),
(1053, 22, NULL, 'Да', 'ru'),
(1055, 20, NULL, 'LED', 'ru'),
(1056, 21, NULL, '32', 'ru'),
(1057, 22, NULL, 'Да', 'ru'),
(1059, 20, NULL, 'Plasma', 'ru'),
(1060, 21, NULL, '40', 'ru'),
(1061, 22, NULL, 'Нет', 'ru'),
(1063, 20, NULL, 'LCD', 'ru'),
(1064, 21, NULL, '40', 'ru'),
(1065, 22, NULL, 'Нет', 'ru'),
(1067, 20, NULL, 'LCD', 'ru'),
(1068, 21, NULL, '21', 'ru'),
(1069, 22, NULL, 'Да', 'ru'),
(1071, 23, NULL, '100 Вт', 'ru'),
(1075, 23, NULL, '50 Вт', 'ru'),
(1079, 23, NULL, '50 Вт', 'ru'),
(1083, 23, NULL, '100 Вт', 'ru'),
(1086, 23, NULL, '100 Вт', 'ru'),
(1089, 23, NULL, '40 Вт', 'ru'),
(1092, 23, NULL, '100 Вт', 'ru'),
(1095, 23, NULL, '50 Вт', 'ru'),
(1098, 23, NULL, '50 Вт', 'ru'),
(1101, 22, NULL, 'Да', 'ru'),
(1102, 23, NULL, '100 Вт', 'ru'),
(1103, 24, NULL, '2', 'ru'),
(1108, 22, NULL, 'Да', 'ru'),
(1109, 23, NULL, '100 Вт', 'ru'),
(1114, 22, NULL, 'Да', 'ru'),
(1115, 23, NULL, '100 Вт', 'ru'),
(1116, 24, NULL, '2', 'ru'),
(1121, 22, NULL, 'Да', 'ru'),
(1122, 23, NULL, '100 Вт', 'ru'),
(1123, 24, NULL, '1', 'ru'),
(1128, 22, NULL, 'Да', 'ru'),
(1129, 23, NULL, '1500 Вт', 'ru'),
(1130, 24, NULL, '2', 'ru'),
(1135, 23, NULL, '100 Вт', 'ru'),
(1138, 23, NULL, '80 Вт', 'ru'),
(1141, 23, NULL, '100 Вт', 'ru'),
(1144, 25, NULL, 'Да', 'ru'),
(1145, 26, NULL, '15 Мп', 'ru'),
(1148, 25, NULL, 'Да', 'ru'),
(1149, 26, NULL, '12 Мп', 'ru'),
(1152, 25, NULL, 'Да', 'ru'),
(1153, 26, NULL, '15 Мп', 'ru'),
(1156, 25, NULL, 'Да', 'ru'),
(1157, 26, NULL, '10 Мп', 'ru'),
(1160, 25, NULL, 'Да', 'ru'),
(1161, 26, NULL, '15 Мп', 'ru'),
(1212, 23, NULL, '40 Вт', 'ru'),
(1215, 23, NULL, '40 Вт', 'ru'),
(1218, 23, NULL, '40 Вт', 'ru'),
(1221, 23, NULL, '100 Вт', 'ru'),
(1224, 23, NULL, '40 Вт', 'ru'),
(1229, 23, NULL, '100 Вт', 'ru'),
(1230, 24, NULL, '4', 'ru'),
(1234, 23, NULL, '100 Вт', 'ru'),
(1235, 24, NULL, '2', 'ru'),
(1238, 20, NULL, 'LED', 'ru'),
(1239, 22, NULL, 'Да', 'ru'),
(1241, 20, NULL, 'LED', 'ru'),
(1242, 21, NULL, '32', 'ru'),
(1243, 22, NULL, 'Да', 'ru'),
(1245, 20, NULL, 'LED', 'ru'),
(1246, 21, NULL, '40', 'ru'),
(1247, 22, NULL, 'Да', 'ru'),
(1249, 20, NULL, 'LED', 'ru'),
(1250, 21, NULL, '32', 'ru'),
(1251, 22, NULL, 'Да', 'ru'),
(1253, 20, NULL, 'Plasma', 'ru'),
(1254, 21, NULL, '40', 'ru'),
(1255, 22, NULL, 'Нет', 'ru'),
(1257, 20, NULL, 'LCD', 'ru'),
(1258, 21, NULL, '40', 'ru'),
(1259, 22, NULL, 'Нет', 'ru'),
(1261, 20, NULL, 'LCD', 'ru'),
(1262, 21, NULL, '21', 'ru'),
(1263, 22, NULL, 'Да', 'ru'),
(1265, 23, NULL, '100 Вт', 'ru'),
(1269, 23, NULL, '50 Вт', 'ru'),
(1273, 23, NULL, '50 Вт', 'ru'),
(1277, 23, NULL, '100 Вт', 'ru'),
(1280, 23, NULL, '100 Вт', 'ru'),
(1283, 23, NULL, '40 Вт', 'ru'),
(1286, 23, NULL, '100 Вт', 'ru'),
(1289, 23, NULL, '50 Вт', 'ru'),
(1292, 23, NULL, '50 Вт', 'ru'),
(1295, 22, NULL, 'Да', 'ru'),
(1296, 23, NULL, '100 Вт', 'ru'),
(1297, 24, NULL, '2', 'ru'),
(1302, 22, NULL, 'Да', 'ru'),
(1303, 23, NULL, '100 Вт', 'ru'),
(1308, 22, NULL, 'Да', 'ru'),
(1309, 23, NULL, '100 Вт', 'ru'),
(1310, 24, NULL, '2', 'ru'),
(1315, 22, NULL, 'Да', 'ru'),
(1316, 23, NULL, '100 Вт', 'ru'),
(1317, 24, NULL, '1', 'ru'),
(1322, 22, NULL, 'Да', 'ru'),
(1323, 23, NULL, '1500 Вт', 'ru'),
(1324, 24, NULL, '2', 'ru'),
(1329, 23, NULL, '100 Вт', 'ru'),
(1332, 23, NULL, '80 Вт', 'ru'),
(1335, 23, NULL, '100 Вт', 'ru'),
(1338, 25, NULL, 'Да', 'ru'),
(1339, 26, NULL, '15 Мп', 'ru'),
(1342, 25, NULL, 'Да', 'ru'),
(1343, 26, NULL, '12 Мп', 'ru'),
(1346, 25, NULL, 'Да', 'ru'),
(1347, 26, NULL, '15 Мп', 'ru'),
(1350, 25, NULL, 'Да', 'ru'),
(1351, 26, NULL, '10 Мп', 'ru'),
(1354, 25, NULL, 'Да', 'ru'),
(1355, 26, NULL, '15 Мп', 'ru'),
(1406, 23, NULL, '40 Вт', 'ru'),
(1409, 23, NULL, '40 Вт', 'ru'),
(1412, 23, NULL, '40 Вт', 'ru'),
(1415, 23, NULL, '100 Вт', 'ru'),
(1418, 23, NULL, '40 Вт', 'ru'),
(1423, 23, NULL, '100 Вт', 'ru'),
(1424, 24, NULL, '4', 'ru'),
(1428, 23, NULL, '100 Вт', 'ru'),
(1429, 24, NULL, '2', 'ru'),
(1432, 20, NULL, 'LED', 'ru'),
(1433, 22, NULL, 'Да', 'ru'),
(1435, 20, NULL, 'LED', 'ru'),
(1436, 21, NULL, '32', 'ru'),
(1437, 22, NULL, 'Да', 'ru'),
(1439, 20, NULL, 'LED', 'ru'),
(1440, 21, NULL, '40', 'ru'),
(1441, 22, NULL, 'Да', 'ru'),
(1443, 20, NULL, 'LED', 'ru'),
(1444, 21, NULL, '32', 'ru'),
(1445, 22, NULL, 'Да', 'ru'),
(1447, 20, NULL, 'Plasma', 'ru'),
(1448, 21, NULL, '40', 'ru'),
(1449, 22, NULL, 'Нет', 'ru'),
(1451, 20, NULL, 'LCD', 'ru'),
(1452, 21, NULL, '40', 'ru'),
(1453, 22, NULL, 'Нет', 'ru'),
(1455, 20, NULL, 'LCD', 'ru'),
(1456, 21, NULL, '21', 'ru'),
(1457, 22, NULL, 'Да', 'ru'),
(1459, 23, NULL, '100 Вт', 'ru'),
(1463, 23, NULL, '50 Вт', 'ru'),
(1467, 23, NULL, '50 Вт', 'ru'),
(1471, 23, NULL, '100 Вт', 'ru'),
(1474, 23, NULL, '100 Вт', 'ru'),
(1477, 23, NULL, '40 Вт', 'ru'),
(1480, 23, NULL, '100 Вт', 'ru'),
(1483, 23, NULL, '50 Вт', 'ru'),
(1486, 23, NULL, '50 Вт', 'ru'),
(1489, 22, NULL, 'Да', 'ru'),
(1490, 23, NULL, '100 Вт', 'ru'),
(1491, 24, NULL, '2', 'ru'),
(1496, 22, NULL, 'Да', 'ru'),
(1497, 23, NULL, '100 Вт', 'ru'),
(1502, 22, NULL, 'Да', 'ru'),
(1503, 23, NULL, '100 Вт', 'ru'),
(1504, 24, NULL, '2', 'ru'),
(1509, 22, NULL, 'Да', 'ru'),
(1510, 23, NULL, '100 Вт', 'ru'),
(1511, 24, NULL, '1', 'ru'),
(1516, 22, NULL, 'Да', 'ru'),
(1517, 23, NULL, '1500 Вт', 'ru'),
(1518, 24, NULL, '2', 'ru'),
(1523, 23, NULL, '100 Вт', 'ru'),
(1526, 23, NULL, '80 Вт', 'ru'),
(1529, 23, NULL, '100 Вт', 'ru'),
(1532, 25, NULL, 'Да', 'ru'),
(1533, 26, NULL, '15 Мп', 'ru'),
(1536, 25, NULL, 'Да', 'ru'),
(1537, 26, NULL, '12 Мп', 'ru'),
(1540, 25, NULL, 'Да', 'ru'),
(1541, 26, NULL, '15 Мп', 'ru'),
(1544, 25, NULL, 'Да', 'ru'),
(1545, 26, NULL, '10 Мп', 'ru'),
(1548, 25, NULL, 'Да', 'ru'),
(1549, 26, NULL, '15 Мп', 'ru'),
(1600, 23, NULL, '40 Вт', 'ru'),
(1603, 23, NULL, '40 Вт', 'ru'),
(1606, 23, NULL, '40 Вт', 'ru'),
(1609, 23, NULL, '100 Вт', 'ru'),
(1612, 23, NULL, '40 Вт', 'ru'),
(1617, 23, NULL, '100 Вт', 'ru'),
(1618, 24, NULL, '4', 'ru'),
(1622, 23, NULL, '100 Вт', 'ru'),
(1623, 24, NULL, '2', 'ru'),
(1626, 20, NULL, 'LED', 'ru'),
(1627, 22, NULL, 'Да', 'ru'),
(1629, 20, NULL, 'LED', 'ru'),
(1630, 21, NULL, '32', 'ru'),
(1631, 22, NULL, 'Да', 'ru'),
(1633, 20, NULL, 'LED', 'ru'),
(1634, 21, NULL, '40', 'ru'),
(1635, 22, NULL, 'Да', 'ru'),
(1637, 20, NULL, 'LED', 'ru'),
(1638, 21, NULL, '32', 'ru'),
(1639, 22, NULL, 'Да', 'ru'),
(1641, 20, NULL, 'Plasma', 'ru'),
(1642, 21, NULL, '40', 'ru'),
(1643, 22, NULL, 'Нет', 'ru'),
(1645, 20, NULL, 'LCD', 'ru'),
(1646, 21, NULL, '40', 'ru'),
(1647, 22, NULL, 'Нет', 'ru'),
(1649, 20, NULL, 'LCD', 'ru'),
(1650, 21, NULL, '21', 'ru'),
(1651, 22, NULL, 'Да', 'ru'),
(1653, 23, NULL, '100 Вт', 'ru'),
(1657, 23, NULL, '50 Вт', 'ru'),
(1661, 23, NULL, '50 Вт', 'ru'),
(1665, 23, NULL, '100 Вт', 'ru'),
(1668, 23, NULL, '100 Вт', 'ru'),
(1671, 23, NULL, '40 Вт', 'ru'),
(1674, 23, NULL, '100 Вт', 'ru'),
(1677, 23, NULL, '50 Вт', 'ru'),
(1680, 23, NULL, '50 Вт', 'ru'),
(1683, 22, NULL, 'Да', 'ru'),
(1684, 23, NULL, '100 Вт', 'ru'),
(1685, 24, NULL, '2', 'ru'),
(1690, 22, NULL, 'Да', 'ru'),
(1691, 23, NULL, '100 Вт', 'ru'),
(1696, 22, NULL, 'Да', 'ru'),
(1697, 23, NULL, '100 Вт', 'ru'),
(1698, 24, NULL, '2', 'ru'),
(1703, 22, NULL, 'Да', 'ru'),
(1704, 23, NULL, '100 Вт', 'ru'),
(1705, 24, NULL, '1', 'ru'),
(1710, 22, NULL, 'Да', 'ru'),
(1711, 23, NULL, '1500 Вт', 'ru'),
(1712, 24, NULL, '2', 'ru'),
(1717, 23, NULL, '100 Вт', 'ru'),
(1720, 23, NULL, '80 Вт', 'ru'),
(1723, 23, NULL, '100 Вт', 'ru'),
(1726, 25, NULL, 'Да', 'ru'),
(1727, 26, NULL, '15 Мп', 'ru'),
(1730, 25, NULL, 'Да', 'ru'),
(1731, 26, NULL, '12 Мп', 'ru'),
(1734, 25, NULL, 'Да', 'ru'),
(1735, 26, NULL, '15 Мп', 'ru'),
(1738, 25, NULL, 'Да', 'ru'),
(1739, 26, NULL, '10 Мп', 'ru'),
(1742, 25, NULL, 'Да', 'ru'),
(1743, 26, NULL, '15 Мп', 'ru'),
(1794, 23, NULL, '40 Вт', 'ru'),
(1797, 23, NULL, '40 Вт', 'ru'),
(1800, 23, NULL, '40 Вт', 'ru'),
(1803, 23, NULL, '100 Вт', 'ru'),
(1806, 23, NULL, '40 Вт', 'ru'),
(1811, 23, NULL, '100 Вт', 'ru'),
(1812, 24, NULL, '4', 'ru'),
(1816, 23, NULL, '100 Вт', 'ru'),
(1817, 24, NULL, '2', 'ru'),
(1820, 20, NULL, 'LED', 'ru'),
(1821, 22, NULL, 'Да', 'ru'),
(1823, 20, NULL, 'LED', 'ru'),
(1824, 21, NULL, '32', 'ru'),
(1825, 22, NULL, 'Да', 'ru'),
(1827, 20, NULL, 'LED', 'ru'),
(1828, 21, NULL, '40', 'ru'),
(1829, 22, NULL, 'Да', 'ru'),
(1831, 20, NULL, 'LED', 'ru'),
(1832, 21, NULL, '32', 'ru'),
(1833, 22, NULL, 'Да', 'ru'),
(1835, 20, NULL, 'Plasma', 'ru'),
(1836, 21, NULL, '40', 'ru'),
(1837, 22, NULL, 'Нет', 'ru'),
(1839, 20, NULL, 'LCD', 'ru'),
(1840, 21, NULL, '40', 'ru'),
(1841, 22, NULL, 'Нет', 'ru'),
(1843, 20, NULL, 'LCD', 'ru'),
(1844, 21, NULL, '21', 'ru'),
(1845, 22, NULL, 'Да', 'ru'),
(1847, 23, NULL, '100 Вт', 'ru'),
(1851, 23, NULL, '50 Вт', 'ru'),
(1855, 23, NULL, '50 Вт', 'ru'),
(1859, 23, NULL, '100 Вт', 'ru'),
(1862, 23, NULL, '100 Вт', 'ru'),
(1865, 23, NULL, '40 Вт', 'ru'),
(1868, 23, NULL, '100 Вт', 'ru'),
(1871, 23, NULL, '50 Вт', 'ru'),
(1874, 23, NULL, '50 Вт', 'ru'),
(1877, 22, NULL, 'Да', 'ru'),
(1878, 23, NULL, '100 Вт', 'ru'),
(1879, 24, NULL, '2', 'ru'),
(1884, 22, NULL, 'Да', 'ru'),
(1885, 23, NULL, '100 Вт', 'ru'),
(1890, 22, NULL, 'Да', 'ru'),
(1891, 23, NULL, '100 Вт', 'ru'),
(1892, 24, NULL, '2', 'ru'),
(1897, 22, NULL, 'Да', 'ru'),
(1898, 23, NULL, '100 Вт', 'ru'),
(1899, 24, NULL, '1', 'ru'),
(1904, 22, NULL, 'Да', 'ru'),
(1905, 23, NULL, '1500 Вт', 'ru'),
(1906, 24, NULL, '2', 'ru'),
(1911, 23, NULL, '100 Вт', 'ru'),
(1914, 23, NULL, '80 Вт', 'ru'),
(1917, 23, NULL, '100 Вт', 'ru'),
(1920, 25, NULL, 'Да', 'ru'),
(1921, 26, NULL, '15 Мп', 'ru'),
(1924, 25, NULL, 'Да', 'ru'),
(1925, 26, NULL, '12 Мп', 'ru'),
(1928, 25, NULL, 'Да', 'ru'),
(1929, 26, NULL, '15 Мп', 'ru'),
(1932, 25, NULL, 'Да', 'ru'),
(1933, 26, NULL, '10 Мп', 'ru'),
(1936, 25, NULL, 'Да', 'ru'),
(1937, 26, NULL, '15 Мп', 'ru'),
(1988, 23, NULL, '40 Вт', 'ru'),
(1991, 23, NULL, '40 Вт', 'ru'),
(1994, 23, NULL, '40 Вт', 'ru'),
(1997, 23, NULL, '100 Вт', 'ru'),
(2000, 23, NULL, '40 Вт', 'ru'),
(2005, 23, NULL, '100 Вт', 'ru'),
(2006, 24, NULL, '4', 'ru'),
(2010, 23, NULL, '100 Вт', 'ru'),
(2011, 24, NULL, '2', 'ru'),
(2014, 20, NULL, 'LED', 'ru'),
(2015, 22, NULL, 'Да', 'ru'),
(2017, 20, NULL, 'LED', 'ru'),
(2018, 21, NULL, '32', 'ru'),
(2019, 22, NULL, 'Да', 'ru'),
(2021, 20, NULL, 'LED', 'ru'),
(2022, 21, NULL, '40', 'ru'),
(2023, 22, NULL, 'Да', 'ru'),
(2025, 20, NULL, 'LED', 'ru'),
(2026, 21, NULL, '32', 'ru'),
(2027, 22, NULL, 'Да', 'ru'),
(2029, 20, NULL, 'Plasma', 'ru'),
(2030, 21, NULL, '40', 'ru'),
(2031, 22, NULL, 'Нет', 'ru'),
(2033, 20, NULL, 'LCD', 'ru'),
(2034, 21, NULL, '40', 'ru'),
(2035, 22, NULL, 'Нет', 'ru'),
(2037, 20, NULL, 'LCD', 'ru'),
(2038, 21, NULL, '21', 'ru'),
(2039, 22, NULL, 'Да', 'ru'),
(2041, 23, NULL, '100 Вт', 'ru'),
(2045, 23, NULL, '50 Вт', 'ru'),
(2049, 23, NULL, '50 Вт', 'ru'),
(2053, 23, NULL, '100 Вт', 'ru'),
(2056, 23, NULL, '100 Вт', 'ru'),
(2059, 23, NULL, '40 Вт', 'ru'),
(2062, 23, NULL, '100 Вт', 'ru'),
(2065, 23, NULL, '50 Вт', 'ru'),
(2068, 23, NULL, '50 Вт', 'ru'),
(2071, 22, NULL, 'Да', 'ru'),
(2072, 23, NULL, '100 Вт', 'ru'),
(2073, 24, NULL, '2', 'ru'),
(2078, 22, NULL, 'Да', 'ru'),
(2079, 23, NULL, '100 Вт', 'ru'),
(2084, 22, NULL, 'Да', 'ru'),
(2085, 23, NULL, '100 Вт', 'ru'),
(2086, 24, NULL, '2', 'ru'),
(2091, 22, NULL, 'Да', 'ru'),
(2092, 23, NULL, '100 Вт', 'ru'),
(2093, 24, NULL, '1', 'ru'),
(2098, 22, NULL, 'Да', 'ru'),
(2099, 23, NULL, '1500 Вт', 'ru'),
(2100, 24, NULL, '2', 'ru'),
(2105, 23, NULL, '100 Вт', 'ru'),
(2108, 23, NULL, '80 Вт', 'ru'),
(2111, 23, NULL, '100 Вт', 'ru'),
(2114, 25, NULL, 'Да', 'ru'),
(2115, 26, NULL, '15 Мп', 'ru'),
(2118, 25, NULL, 'Да', 'ru'),
(2119, 26, NULL, '12 Мп', 'ru'),
(2122, 25, NULL, 'Да', 'ru'),
(2123, 26, NULL, '15 Мп', 'ru'),
(2126, 25, NULL, 'Да', 'ru'),
(2127, 26, NULL, '10 Мп', 'ru'),
(2130, 25, NULL, 'Да', 'ru'),
(2131, 26, NULL, '15 Мп', 'ru'),
(2182, 23, NULL, '40 Вт', 'ru'),
(2185, 23, NULL, '40 Вт', 'ru'),
(2188, 23, NULL, '40 Вт', 'ru'),
(2191, 23, NULL, '100 Вт', 'ru'),
(2194, 23, NULL, '40 Вт', 'ru'),
(2199, 23, NULL, '100 Вт', 'ru'),
(2200, 24, NULL, '4', 'ru'),
(2204, 23, NULL, '100 Вт', 'ru'),
(2205, 24, NULL, '2', 'ru'),
(2208, 20, NULL, 'LED', 'ru'),
(2209, 22, NULL, 'Да', 'ru'),
(2211, 20, NULL, 'LED', 'ru'),
(2212, 21, NULL, '32', 'ru'),
(2213, 22, NULL, 'Да', 'ru'),
(2215, 20, NULL, 'LED', 'ru'),
(2216, 21, NULL, '40', 'ru'),
(2217, 22, NULL, 'Да', 'ru'),
(2219, 20, NULL, 'LED', 'ru'),
(2220, 21, NULL, '32', 'ru'),
(2221, 22, NULL, 'Да', 'ru'),
(2223, 20, NULL, 'Plasma', 'ru'),
(2224, 21, NULL, '40', 'ru'),
(2225, 22, NULL, 'Нет', 'ru'),
(2227, 20, NULL, 'LCD', 'ru'),
(2228, 21, NULL, '40', 'ru'),
(2229, 22, NULL, 'Нет', 'ru'),
(2231, 20, NULL, 'LCD', 'ru'),
(2232, 21, NULL, '21', 'ru'),
(2233, 22, NULL, 'Да', 'ru'),
(2235, 23, NULL, '100 Вт', 'ru'),
(2239, 23, NULL, '50 Вт', 'ru'),
(2243, 23, NULL, '50 Вт', 'ru'),
(2247, 23, NULL, '100 Вт', 'ru'),
(2250, 23, NULL, '100 Вт', 'ru'),
(2253, 23, NULL, '40 Вт', 'ru'),
(2256, 23, NULL, '100 Вт', 'ru'),
(2259, 23, NULL, '50 Вт', 'ru'),
(2262, 23, NULL, '50 Вт', 'ru'),
(2265, 22, NULL, 'Да', 'ru'),
(2266, 23, NULL, '100 Вт', 'ru'),
(2267, 24, NULL, '2', 'ru'),
(2272, 22, NULL, 'Да', 'ru'),
(2273, 23, NULL, '100 Вт', 'ru'),
(2278, 22, NULL, 'Да', 'ru'),
(2279, 23, NULL, '100 Вт', 'ru'),
(2280, 24, NULL, '2', 'ru'),
(2285, 22, NULL, 'Да', 'ru'),
(2286, 23, NULL, '100 Вт', 'ru'),
(2287, 24, NULL, '1', 'ru'),
(2292, 22, NULL, 'Да', 'ru'),
(2293, 23, NULL, '1500 Вт', 'ru'),
(2294, 24, NULL, '2', 'ru'),
(2299, 23, NULL, '100 Вт', 'ru'),
(2302, 23, NULL, '80 Вт', 'ru'),
(2305, 23, NULL, '100 Вт', 'ru'),
(2308, 25, NULL, 'Да', 'ru'),
(2309, 26, NULL, '15 Мп', 'ru'),
(2312, 25, NULL, 'Да', 'ru'),
(2313, 26, NULL, '12 Мп', 'ru'),
(2316, 25, NULL, 'Да', 'ru'),
(2317, 26, NULL, '15 Мп', 'ru'),
(2320, 25, NULL, 'Да', 'ru'),
(2321, 26, NULL, '10 Мп', 'ru'),
(2324, 25, NULL, 'Да', 'ru'),
(2325, 26, NULL, '15 Мп', 'ru'),
(2376, 23, NULL, '40 Вт', 'ru'),
(2379, 23, NULL, '40 Вт', 'ru'),
(2382, 23, NULL, '40 Вт', 'ru'),
(2385, 23, NULL, '100 Вт', 'ru'),
(2388, 23, NULL, '40 Вт', 'ru'),
(2393, 23, NULL, '100 Вт', 'ru'),
(2394, 24, NULL, '4', 'ru'),
(2398, 23, NULL, '100 Вт', 'ru'),
(2399, 24, NULL, '2', 'ru'),
(2402, 20, NULL, 'LED', 'ru'),
(2403, 22, NULL, 'Да', 'ru'),
(2405, 20, NULL, 'LED', 'ru'),
(2406, 21, NULL, '32', 'ru'),
(2407, 22, NULL, 'Да', 'ru'),
(2409, 20, NULL, 'LED', 'ru'),
(2410, 21, NULL, '40', 'ru'),
(2411, 22, NULL, 'Да', 'ru'),
(2413, 20, NULL, 'LED', 'ru'),
(2414, 21, NULL, '32', 'ru'),
(2415, 22, NULL, 'Да', 'ru'),
(2417, 20, NULL, 'Plasma', 'ru'),
(2418, 21, NULL, '40', 'ru'),
(2419, 22, NULL, 'Нет', 'ru'),
(2421, 20, NULL, 'LCD', 'ru'),
(2422, 21, NULL, '40', 'ru'),
(2423, 22, NULL, 'Нет', 'ru'),
(2425, 20, NULL, 'LCD', 'ru'),
(2426, 21, NULL, '21', 'ru'),
(2427, 22, NULL, 'Да', 'ru'),
(2429, 23, NULL, '100 Вт', 'ru'),
(2433, 23, NULL, '50 Вт', 'ru'),
(2437, 23, NULL, '50 Вт', 'ru'),
(2441, 23, NULL, '100 Вт', 'ru'),
(2444, 23, NULL, '100 Вт', 'ru'),
(2447, 23, NULL, '40 Вт', 'ru'),
(2450, 23, NULL, '100 Вт', 'ru'),
(2453, 23, NULL, '50 Вт', 'ru'),
(2456, 23, NULL, '50 Вт', 'ru'),
(2459, 22, NULL, 'Да', 'ru'),
(2460, 23, NULL, '100 Вт', 'ru'),
(2461, 24, NULL, '2', 'ru'),
(2466, 22, NULL, 'Да', 'ru'),
(2467, 23, NULL, '100 Вт', 'ru'),
(2472, 22, NULL, 'Да', 'ru'),
(2473, 23, NULL, '100 Вт', 'ru'),
(2474, 24, NULL, '2', 'ru'),
(2479, 22, NULL, 'Да', 'ru'),
(2480, 23, NULL, '100 Вт', 'ru'),
(2481, 24, NULL, '1', 'ru'),
(2486, 22, NULL, 'Да', 'ru'),
(2487, 23, NULL, '1500 Вт', 'ru'),
(2488, 24, NULL, '2', 'ru'),
(2493, 23, NULL, '100 Вт', 'ru'),
(2496, 23, NULL, '80 Вт', 'ru'),
(2499, 23, NULL, '100 Вт', 'ru'),
(2502, 25, NULL, 'Да', 'ru'),
(2503, 26, NULL, '15 Мп', 'ru'),
(2506, 25, NULL, 'Да', 'ru'),
(2507, 26, NULL, '12 Мп', 'ru'),
(2510, 25, NULL, 'Да', 'ru'),
(2511, 26, NULL, '15 Мп', 'ru'),
(2514, 25, NULL, 'Да', 'ru'),
(2515, 26, NULL, '10 Мп', 'ru'),
(2518, 25, NULL, 'Да', 'ru'),
(2519, 26, NULL, '15 Мп', 'ru'),
(2570, 23, NULL, '40 Вт', 'ru'),
(2573, 23, NULL, '40 Вт', 'ru'),
(2576, 23, NULL, '40 Вт', 'ru'),
(2579, 23, NULL, '100 Вт', 'ru'),
(2582, 23, NULL, '40 Вт', 'ru'),
(2587, 23, NULL, '100 Вт', 'ru'),
(2588, 24, NULL, '4', 'ru'),
(2592, 23, NULL, '100 Вт', 'ru'),
(2593, 24, NULL, '2', 'ru'),
(2596, 20, NULL, 'LED', 'ru'),
(2597, 22, NULL, 'Да', 'ru'),
(2599, 20, NULL, 'LED', 'ru'),
(2600, 21, NULL, '32', 'ru'),
(2601, 22, NULL, 'Да', 'ru'),
(2603, 20, NULL, 'LED', 'ru'),
(2604, 21, NULL, '40', 'ru'),
(2605, 22, NULL, 'Да', 'ru'),
(2607, 20, NULL, 'LED', 'ru'),
(2608, 21, NULL, '32', 'ru'),
(2609, 22, NULL, 'Да', 'ru'),
(2611, 20, NULL, 'Plasma', 'ru'),
(2612, 21, NULL, '40', 'ru'),
(2613, 22, NULL, 'Нет', 'ru'),
(2615, 20, NULL, 'LCD', 'ru'),
(2616, 21, NULL, '40', 'ru'),
(2617, 22, NULL, 'Нет', 'ru'),
(2619, 20, NULL, 'LCD', 'ru'),
(2620, 21, NULL, '21', 'ru'),
(2621, 22, NULL, 'Да', 'ru'),
(2623, 23, NULL, '100 Вт', 'ru'),
(2627, 23, NULL, '50 Вт', 'ru'),
(2631, 23, NULL, '50 Вт', 'ru'),
(2635, 23, NULL, '100 Вт', 'ru'),
(2638, 23, NULL, '100 Вт', 'ru'),
(2641, 23, NULL, '40 Вт', 'ru'),
(2644, 23, NULL, '100 Вт', 'ru'),
(2647, 23, NULL, '50 Вт', 'ru'),
(2650, 23, NULL, '50 Вт', 'ru'),
(2653, 22, NULL, 'Да', 'ru'),
(2654, 23, NULL, '100 Вт', 'ru'),
(2655, 24, NULL, '2', 'ru'),
(2660, 22, NULL, 'Да', 'ru'),
(2661, 23, NULL, '100 Вт', 'ru'),
(2666, 22, NULL, 'Да', 'ru'),
(2667, 23, NULL, '100 Вт', 'ru'),
(2668, 24, NULL, '2', 'ru'),
(2673, 22, NULL, 'Да', 'ru'),
(2674, 23, NULL, '100 Вт', 'ru'),
(2675, 24, NULL, '1', 'ru'),
(2680, 22, NULL, 'Да', 'ru'),
(2681, 23, NULL, '1500 Вт', 'ru'),
(2682, 24, NULL, '2', 'ru'),
(2687, 23, NULL, '100 Вт', 'ru'),
(2690, 23, NULL, '80 Вт', 'ru'),
(2693, 23, NULL, '100 Вт', 'ru'),
(2696, 25, NULL, 'Да', 'ru'),
(2697, 26, NULL, '15 Мп', 'ru'),
(2700, 25, NULL, 'Да', 'ru'),
(2701, 26, NULL, '12 Мп', 'ru'),
(2704, 25, NULL, 'Да', 'ru'),
(2705, 26, NULL, '15 Мп', 'ru'),
(2708, 25, NULL, 'Да', 'ru'),
(2709, 26, NULL, '10 Мп', 'ru'),
(2712, 25, NULL, 'Да', 'ru'),
(2713, 26, NULL, '15 Мп', 'ru'),
(2764, 23, NULL, '40 Вт', 'ru'),
(2767, 23, NULL, '40 Вт', 'ru'),
(2770, 23, NULL, '40 Вт', 'ru'),
(2773, 23, NULL, '100 Вт', 'ru'),
(2776, 23, NULL, '40 Вт', 'ru'),
(2781, 23, NULL, '100 Вт', 'ru'),
(2782, 24, NULL, '4', 'ru'),
(2786, 23, NULL, '100 Вт', 'ru'),
(2787, 24, NULL, '2', 'ru'),
(2790, 20, NULL, 'LED', 'ru'),
(2791, 22, NULL, 'Да', 'ru'),
(2793, 20, NULL, 'LED', 'ru'),
(2794, 21, NULL, '32', 'ru'),
(2795, 22, NULL, 'Да', 'ru'),
(2797, 20, NULL, 'LED', 'ru'),
(2798, 21, NULL, '40', 'ru'),
(2799, 22, NULL, 'Да', 'ru'),
(2801, 20, NULL, 'LED', 'ru'),
(2802, 21, NULL, '32', 'ru'),
(2803, 22, NULL, 'Да', 'ru'),
(2805, 20, NULL, 'Plasma', 'ru'),
(2806, 21, NULL, '40', 'ru'),
(2807, 22, NULL, 'Нет', 'ru'),
(2809, 20, NULL, 'LCD', 'ru'),
(2810, 21, NULL, '40', 'ru'),
(2811, 22, NULL, 'Нет', 'ru'),
(2813, 20, NULL, 'LCD', 'ru'),
(2814, 21, NULL, '21', 'ru'),
(2815, 22, NULL, 'Да', 'ru'),
(2817, 23, NULL, '100 Вт', 'ru'),
(2821, 23, NULL, '50 Вт', 'ru'),
(2825, 23, NULL, '50 Вт', 'ru'),
(2829, 23, NULL, '100 Вт', 'ru'),
(2832, 23, NULL, '100 Вт', 'ru'),
(2835, 23, NULL, '40 Вт', 'ru'),
(2838, 23, NULL, '100 Вт', 'ru'),
(2841, 23, NULL, '50 Вт', 'ru'),
(2844, 23, NULL, '50 Вт', 'ru'),
(2847, 22, NULL, 'Да', 'ru'),
(2848, 23, NULL, '100 Вт', 'ru'),
(2849, 24, NULL, '2', 'ru'),
(2854, 22, NULL, 'Да', 'ru'),
(2855, 23, NULL, '100 Вт', 'ru'),
(2860, 22, NULL, 'Да', 'ru'),
(2861, 23, NULL, '100 Вт', 'ru'),
(2862, 24, NULL, '2', 'ru'),
(2867, 22, NULL, 'Да', 'ru'),
(2868, 23, NULL, '100 Вт', 'ru'),
(2869, 24, NULL, '1', 'ru'),
(2874, 22, NULL, 'Да', 'ru'),
(2875, 23, NULL, '1500 Вт', 'ru'),
(2876, 24, NULL, '2', 'ru'),
(2881, 23, NULL, '100 Вт', 'ru'),
(2884, 23, NULL, '80 Вт', 'ru'),
(2887, 23, NULL, '100 Вт', 'ru'),
(2890, 25, NULL, 'Да', 'ru'),
(2891, 26, NULL, '15 Мп', 'ru'),
(2894, 25, NULL, 'Да', 'ru'),
(2895, 26, NULL, '12 Мп', 'ru'),
(2898, 25, NULL, 'Да', 'ru'),
(2899, 26, NULL, '15 Мп', 'ru'),
(2902, 25, NULL, 'Да', 'ru'),
(2903, 26, NULL, '10 Мп', 'ru'),
(2906, 25, NULL, 'Да', 'ru'),
(2907, 26, NULL, '15 Мп', 'ru'),
(2958, 23, NULL, '40 Вт', 'ru'),
(2961, 23, NULL, '40 Вт', 'ru'),
(2964, 23, NULL, '40 Вт', 'ru'),
(2967, 23, NULL, '100 Вт', 'ru'),
(2970, 23, NULL, '40 Вт', 'ru'),
(2975, 23, NULL, '100 Вт', 'ru'),
(2976, 24, NULL, '4', 'ru'),
(2980, 23, NULL, '100 Вт', 'ru'),
(2981, 24, NULL, '2', 'ru'),
(2984, 20, NULL, 'LED', 'ru'),
(2985, 22, NULL, 'Да', 'ru'),
(2987, 20, NULL, 'LED', 'ru'),
(2988, 21, NULL, '32', 'ru'),
(2989, 22, NULL, 'Да', 'ru'),
(2991, 20, NULL, 'LED', 'ru'),
(2992, 21, NULL, '40', 'ru'),
(2993, 22, NULL, 'Да', 'ru'),
(2995, 20, NULL, 'LED', 'ru'),
(2996, 21, NULL, '32', 'ru'),
(2997, 22, NULL, 'Да', 'ru'),
(2999, 20, NULL, 'Plasma', 'ru'),
(3000, 21, NULL, '40', 'ru'),
(3001, 22, NULL, 'Нет', 'ru'),
(3003, 20, NULL, 'LCD', 'ru'),
(3004, 21, NULL, '40', 'ru'),
(3005, 22, NULL, 'Нет', 'ru'),
(3007, 20, NULL, 'LCD', 'ru'),
(3008, 21, NULL, '21', 'ru'),
(3009, 22, NULL, 'Да', 'ru'),
(3011, 23, NULL, '100 Вт', 'ru'),
(3015, 23, NULL, '50 Вт', 'ru'),
(3019, 23, NULL, '50 Вт', 'ru'),
(3023, 23, NULL, '100 Вт', 'ru'),
(3026, 23, NULL, '100 Вт', 'ru'),
(3029, 23, NULL, '40 Вт', 'ru'),
(3032, 23, NULL, '100 Вт', 'ru'),
(3035, 23, NULL, '50 Вт', 'ru'),
(3038, 23, NULL, '50 Вт', 'ru'),
(3041, 22, NULL, 'Да', 'ru'),
(3042, 23, NULL, '100 Вт', 'ru'),
(3043, 24, NULL, '2', 'ru'),
(3048, 22, NULL, 'Да', 'ru'),
(3049, 23, NULL, '100 Вт', 'ru'),
(3054, 22, NULL, 'Да', 'ru'),
(3055, 23, NULL, '100 Вт', 'ru'),
(3056, 24, NULL, '2', 'ru'),
(3061, 22, NULL, 'Да', 'ru'),
(3062, 23, NULL, '100 Вт', 'ru'),
(3063, 24, NULL, '1', 'ru'),
(3068, 22, NULL, 'Да', 'ru'),
(3069, 23, NULL, '1500 Вт', 'ru'),
(3070, 24, NULL, '2', 'ru'),
(3075, 23, NULL, '100 Вт', 'ru'),
(3078, 23, NULL, '80 Вт', 'ru'),
(3081, 23, NULL, '100 Вт', 'ru'),
(3084, 25, NULL, 'Да', 'ru'),
(3085, 26, NULL, '15 Мп', 'ru'),
(3088, 25, NULL, 'Да', 'ru'),
(3089, 26, NULL, '12 Мп', 'ru'),
(3092, 25, NULL, 'Да', 'ru'),
(3093, 26, NULL, '15 Мп', 'ru'),
(3096, 25, NULL, 'Да', 'ru'),
(3097, 26, NULL, '10 Мп', 'ru'),
(3100, 25, NULL, 'Да', 'ru'),
(3101, 26, NULL, '15 Мп', 'ru'),
(3152, 23, NULL, '40 Вт', 'ru'),
(3155, 23, NULL, '40 Вт', 'ru'),
(3158, 23, NULL, '40 Вт', 'ru'),
(3161, 23, NULL, '100 Вт', 'ru'),
(3164, 23, NULL, '40 Вт', 'ru'),
(3169, 23, NULL, '100 Вт', 'ru'),
(3170, 24, NULL, '4', 'ru'),
(3174, 23, NULL, '100 Вт', 'ru'),
(3175, 24, NULL, '2', 'ru'),
(3178, 20, NULL, 'LED', 'ru'),
(3179, 22, NULL, 'Да', 'ru'),
(3181, 20, NULL, 'LED', 'ru'),
(3182, 21, NULL, '32', 'ru'),
(3183, 22, NULL, 'Да', 'ru'),
(3185, 20, NULL, 'LED', 'ru'),
(3186, 21, NULL, '40', 'ru'),
(3187, 22, NULL, 'Да', 'ru'),
(3189, 20, NULL, 'LED', 'ru'),
(3190, 21, NULL, '32', 'ru'),
(3191, 22, NULL, 'Да', 'ru'),
(3193, 20, NULL, 'Plasma', 'ru'),
(3194, 21, NULL, '40', 'ru'),
(3195, 22, NULL, 'Нет', 'ru'),
(3197, 20, NULL, 'LCD', 'ru'),
(3198, 21, NULL, '40', 'ru'),
(3199, 22, NULL, 'Нет', 'ru'),
(3201, 20, NULL, 'LCD', 'ru'),
(3202, 21, NULL, '21', 'ru'),
(3203, 22, NULL, 'Да', 'ru'),
(3205, 23, NULL, '100 Вт', 'ru'),
(3209, 23, NULL, '50 Вт', 'ru'),
(3213, 23, NULL, '50 Вт', 'ru'),
(3217, 23, NULL, '100 Вт', 'ru'),
(3220, 23, NULL, '100 Вт', 'ru'),
(3223, 23, NULL, '40 Вт', 'ru'),
(3226, 23, NULL, '100 Вт', 'ru'),
(3229, 23, NULL, '50 Вт', 'ru'),
(3232, 23, NULL, '50 Вт', 'ru'),
(3235, 22, NULL, 'Да', 'ru'),
(3236, 23, NULL, '100 Вт', 'ru'),
(3237, 24, NULL, '2', 'ru'),
(3242, 22, NULL, 'Да', 'ru'),
(3243, 23, NULL, '100 Вт', 'ru'),
(3248, 22, NULL, 'Да', 'ru'),
(3249, 23, NULL, '100 Вт', 'ru'),
(3250, 24, NULL, '2', 'ru'),
(3255, 22, NULL, 'Да', 'ru'),
(3256, 23, NULL, '100 Вт', 'ru'),
(3257, 24, NULL, '1', 'ru'),
(3262, 22, NULL, 'Да', 'ru'),
(3263, 23, NULL, '1500 Вт', 'ru'),
(3264, 24, NULL, '2', 'ru'),
(3269, 23, NULL, '100 Вт', 'ru'),
(3272, 23, NULL, '80 Вт', 'ru'),
(3275, 23, NULL, '100 Вт', 'ru'),
(3278, 25, NULL, 'Да', 'ru'),
(3279, 26, NULL, '15 Мп', 'ru'),
(3282, 25, NULL, 'Да', 'ru'),
(3283, 26, NULL, '12 Мп', 'ru'),
(3286, 25, NULL, 'Да', 'ru'),
(3287, 26, NULL, '15 Мп', 'ru'),
(3290, 25, NULL, 'Да', 'ru'),
(3291, 26, NULL, '10 Мп', 'ru'),
(3294, 25, NULL, 'Да', 'ru'),
(3295, 26, NULL, '15 Мп', 'ru'),
(3346, 23, NULL, '40 Вт', 'ru'),
(3349, 23, NULL, '40 Вт', 'ru'),
(3352, 23, NULL, '40 Вт', 'ru'),
(3355, 23, NULL, '100 Вт', 'ru'),
(3358, 23, NULL, '40 Вт', 'ru'),
(3363, 23, NULL, '100 Вт', 'ru'),
(3364, 24, NULL, '4', 'ru'),
(3368, 23, NULL, '100 Вт', 'ru'),
(3369, 24, NULL, '2', 'ru'),
(3372, 20, NULL, 'LED', 'ru'),
(3373, 22, NULL, 'Да', 'ru'),
(3375, 20, NULL, 'LED', 'ru'),
(3376, 21, NULL, '32', 'ru'),
(3377, 22, NULL, 'Да', 'ru'),
(3379, 20, NULL, 'LED', 'ru'),
(3380, 21, NULL, '40', 'ru'),
(3381, 22, NULL, 'Да', 'ru'),
(3383, 20, NULL, 'LED', 'ru'),
(3384, 21, NULL, '32', 'ru'),
(3385, 22, NULL, 'Да', 'ru'),
(3387, 20, NULL, 'Plasma', 'ru'),
(3388, 21, NULL, '40', 'ru'),
(3389, 22, NULL, 'Нет', 'ru'),
(3391, 20, NULL, 'LCD', 'ru'),
(3392, 21, NULL, '40', 'ru'),
(3393, 22, NULL, 'Нет', 'ru'),
(3395, 20, NULL, 'LCD', 'ru'),
(3396, 21, NULL, '21', 'ru'),
(3397, 22, NULL, 'Да', 'ru'),
(3399, 23, NULL, '100 Вт', 'ru'),
(3403, 23, NULL, '50 Вт', 'ru'),
(3407, 23, NULL, '50 Вт', 'ru'),
(3411, 23, NULL, '100 Вт', 'ru'),
(3414, 23, NULL, '100 Вт', 'ru'),
(3417, 23, NULL, '40 Вт', 'ru'),
(3420, 23, NULL, '100 Вт', 'ru'),
(3423, 23, NULL, '50 Вт', 'ru'),
(3426, 23, NULL, '50 Вт', 'ru'),
(3429, 22, NULL, 'Да', 'ru'),
(3430, 23, NULL, '100 Вт', 'ru'),
(3431, 24, NULL, '2', 'ru'),
(3436, 22, NULL, 'Да', 'ru'),
(3437, 23, NULL, '100 Вт', 'ru'),
(3442, 22, NULL, 'Да', 'ru'),
(3443, 23, NULL, '100 Вт', 'ru'),
(3444, 24, NULL, '2', 'ru'),
(3449, 22, NULL, 'Да', 'ru'),
(3450, 23, NULL, '100 Вт', 'ru'),
(3451, 24, NULL, '1', 'ru'),
(3456, 22, NULL, 'Да', 'ru'),
(3457, 23, NULL, '1500 Вт', 'ru'),
(3458, 24, NULL, '2', 'ru'),
(3463, 23, NULL, '100 Вт', 'ru'),
(3466, 23, NULL, '80 Вт', 'ru'),
(3469, 23, NULL, '100 Вт', 'ru'),
(3472, 25, NULL, 'Да', 'ru'),
(3473, 26, NULL, '15 Мп', 'ru'),
(3476, 25, NULL, 'Да', 'ru'),
(3477, 26, NULL, '12 Мп', 'ru'),
(3480, 25, NULL, 'Да', 'ru'),
(3481, 26, NULL, '15 Мп', 'ru'),
(3484, 25, NULL, 'Да', 'ru'),
(3485, 26, NULL, '10 Мп', 'ru'),
(3488, 25, NULL, 'Да', 'ru'),
(3489, 26, NULL, '15 Мп', 'ru'),
(3540, 23, NULL, '40 Вт', 'ru'),
(3543, 23, NULL, '40 Вт', 'ru'),
(3546, 23, NULL, '40 Вт', 'ru'),
(3549, 23, NULL, '100 Вт', 'ru'),
(3552, 23, NULL, '40 Вт', 'ru'),
(3557, 23, NULL, '100 Вт', 'ru'),
(3558, 24, NULL, '4', 'ru'),
(3562, 23, NULL, '100 Вт', 'ru'),
(3563, 24, NULL, '2', 'ru'),
(3566, 20, NULL, 'LED', 'ru'),
(3567, 22, NULL, 'Да', 'ru'),
(3569, 20, NULL, 'LED', 'ru'),
(3570, 21, NULL, '32', 'ru'),
(3571, 22, NULL, 'Да', 'ru'),
(3573, 20, NULL, 'LED', 'ru'),
(3574, 21, NULL, '40', 'ru'),
(3575, 22, NULL, 'Да', 'ru'),
(3577, 20, NULL, 'LED', 'ru'),
(3578, 21, NULL, '32', 'ru'),
(3579, 22, NULL, 'Да', 'ru'),
(3581, 20, NULL, 'Plasma', 'ru'),
(3582, 21, NULL, '40', 'ru'),
(3583, 22, NULL, 'Нет', 'ru'),
(3585, 20, NULL, 'LCD', 'ru'),
(3586, 21, NULL, '40', 'ru'),
(3587, 22, NULL, 'Нет', 'ru'),
(3589, 20, NULL, 'LCD', 'ru'),
(3590, 21, NULL, '21', 'ru'),
(3591, 22, NULL, 'Да', 'ru'),
(3593, 23, NULL, '100 Вт', 'ru'),
(3597, 23, NULL, '50 Вт', 'ru'),
(3601, 23, NULL, '50 Вт', 'ru'),
(3605, 23, NULL, '100 Вт', 'ru'),
(3608, 23, NULL, '100 Вт', 'ru'),
(3611, 23, NULL, '40 Вт', 'ru'),
(3614, 23, NULL, '100 Вт', 'ru'),
(3617, 23, NULL, '50 Вт', 'ru'),
(3620, 23, NULL, '50 Вт', 'ru'),
(3623, 22, NULL, 'Да', 'ru'),
(3624, 23, NULL, '100 Вт', 'ru'),
(3625, 24, NULL, '2', 'ru'),
(3630, 22, NULL, 'Да', 'ru'),
(3631, 23, NULL, '100 Вт', 'ru'),
(3636, 22, NULL, 'Да', 'ru'),
(3637, 23, NULL, '100 Вт', 'ru'),
(3638, 24, NULL, '2', 'ru'),
(3643, 22, NULL, 'Да', 'ru'),
(3644, 23, NULL, '100 Вт', 'ru'),
(3645, 24, NULL, '1', 'ru'),
(3650, 22, NULL, 'Да', 'ru'),
(3651, 23, NULL, '1500 Вт', 'ru'),
(3652, 24, NULL, '2', 'ru'),
(3657, 23, NULL, '100 Вт', 'ru'),
(3660, 23, NULL, '80 Вт', 'ru'),
(3663, 23, NULL, '100 Вт', 'ru'),
(3666, 25, NULL, 'Да', 'ru'),
(3667, 26, NULL, '15 Мп', 'ru'),
(3670, 25, NULL, 'Да', 'ru'),
(3671, 26, NULL, '12 Мп', 'ru'),
(3674, 25, NULL, 'Да', 'ru'),
(3675, 26, NULL, '15 Мп', 'ru'),
(3678, 25, NULL, 'Да', 'ru'),
(3679, 26, NULL, '10 Мп', 'ru'),
(3682, 25, NULL, 'Да', 'ru'),
(3683, 26, NULL, '15 Мп', 'ru'),
(3734, 23, NULL, '40 Вт', 'ru'),
(3737, 23, NULL, '40 Вт', 'ru'),
(3740, 23, NULL, '40 Вт', 'ru'),
(3743, 23, NULL, '100 Вт', 'ru'),
(3746, 23, NULL, '40 Вт', 'ru'),
(3751, 23, NULL, '100 Вт', 'ru'),
(3752, 24, NULL, '4', 'ru'),
(3756, 23, NULL, '100 Вт', 'ru'),
(3757, 24, NULL, '2', 'ru'),
(3760, 20, NULL, 'LED', 'ru'),
(3761, 22, NULL, 'Да', 'ru'),
(3763, 20, NULL, 'LED', 'ru'),
(3764, 21, NULL, '32', 'ru'),
(3765, 22, NULL, 'Да', 'ru'),
(3767, 20, NULL, 'LED', 'ru'),
(3768, 21, NULL, '40', 'ru'),
(3769, 22, NULL, 'Да', 'ru'),
(3771, 20, NULL, 'LED', 'ru'),
(3772, 21, NULL, '32', 'ru'),
(3773, 22, NULL, 'Да', 'ru'),
(3775, 20, NULL, 'Plasma', 'ru'),
(3776, 21, NULL, '40', 'ru'),
(3777, 22, NULL, 'Нет', 'ru'),
(3779, 20, NULL, 'LCD', 'ru'),
(3780, 21, NULL, '40', 'ru'),
(3781, 22, NULL, 'Нет', 'ru'),
(3783, 20, NULL, 'LCD', 'ru'),
(3784, 21, NULL, '21', 'ru'),
(3785, 22, NULL, 'Да', 'ru'),
(3787, 23, NULL, '100 Вт', 'ru'),
(3791, 23, NULL, '50 Вт', 'ru'),
(3795, 23, NULL, '50 Вт', 'ru'),
(3799, 23, NULL, '100 Вт', 'ru'),
(3802, 23, NULL, '100 Вт', 'ru'),
(3805, 23, NULL, '40 Вт', 'ru'),
(3808, 23, NULL, '100 Вт', 'ru'),
(3811, 23, NULL, '50 Вт', 'ru'),
(3814, 23, NULL, '50 Вт', 'ru'),
(3817, 22, NULL, 'Да', 'ru'),
(3818, 23, NULL, '100 Вт', 'ru'),
(3819, 24, NULL, '2', 'ru'),
(3824, 22, NULL, 'Да', 'ru'),
(3825, 23, NULL, '100 Вт', 'ru'),
(3830, 22, NULL, 'Да', 'ru'),
(3831, 23, NULL, '100 Вт', 'ru'),
(3832, 24, NULL, '2', 'ru'),
(3837, 22, NULL, 'Да', 'ru'),
(3838, 23, NULL, '100 Вт', 'ru'),
(3839, 24, NULL, '1', 'ru'),
(3844, 22, NULL, 'Да', 'ru'),
(3845, 23, NULL, '1500 Вт', 'ru'),
(3846, 24, NULL, '2', 'ru'),
(3851, 23, NULL, '100 Вт', 'ru'),
(3854, 23, NULL, '80 Вт', 'ru'),
(3857, 23, NULL, '100 Вт', 'ru'),
(3860, 25, NULL, 'Да', 'ru'),
(3861, 26, NULL, '15 Мп', 'ru'),
(3864, 25, NULL, 'Да', 'ru'),
(3865, 26, NULL, '12 Мп', 'ru'),
(3868, 25, NULL, 'Да', 'ru'),
(3869, 26, NULL, '15 Мп', 'ru'),
(3872, 25, NULL, 'Да', 'ru'),
(3873, 26, NULL, '10 Мп', 'ru'),
(3876, 25, NULL, 'Да', 'ru'),
(3877, 26, NULL, '15 Мп', 'ru'),
(3928, 23, NULL, '40 Вт', 'ru'),
(3931, 23, NULL, '40 Вт', 'ru'),
(3934, 23, NULL, '40 Вт', 'ru'),
(3937, 23, NULL, '100 Вт', 'ru'),
(3940, 23, NULL, '40 Вт', 'ru'),
(3945, 23, NULL, '100 Вт', 'ru'),
(3946, 24, NULL, '4', 'ru'),
(3950, 23, NULL, '100 Вт', 'ru'),
(3951, 24, NULL, '2', 'ru'),
(3954, 20, NULL, 'LED', 'ru'),
(3955, 22, NULL, 'Да', 'ru'),
(3957, 20, NULL, 'LED', 'ru'),
(3958, 21, NULL, '32', 'ru'),
(3959, 22, NULL, 'Да', 'ru'),
(3961, 20, NULL, 'LED', 'ru'),
(3962, 21, NULL, '40', 'ru'),
(3963, 22, NULL, 'Да', 'ru'),
(3965, 20, NULL, 'LED', 'ru'),
(3966, 21, NULL, '32', 'ru'),
(3967, 22, NULL, 'Да', 'ru'),
(3969, 20, NULL, 'Plasma', 'ru'),
(3970, 21, NULL, '40', 'ru'),
(3971, 22, NULL, 'Нет', 'ru'),
(3973, 20, NULL, 'LCD', 'ru'),
(3974, 21, NULL, '40', 'ru'),
(3975, 22, NULL, 'Нет', 'ru'),
(3977, 20, NULL, 'LCD', 'ru'),
(3978, 21, NULL, '21', 'ru'),
(3979, 22, NULL, 'Да', 'ru'),
(3981, 23, NULL, '100 Вт', 'ru'),
(3985, 23, NULL, '50 Вт', 'ru'),
(3989, 23, NULL, '50 Вт', 'ru'),
(3993, 23, NULL, '100 Вт', 'ru'),
(3996, 23, NULL, '100 Вт', 'ru'),
(3999, 23, NULL, '40 Вт', 'ru'),
(4002, 23, NULL, '100 Вт', 'ru'),
(4005, 23, NULL, '50 Вт', 'ru'),
(4008, 23, NULL, '50 Вт', 'ru'),
(4011, 22, NULL, 'Да', 'ru'),
(4012, 23, NULL, '100 Вт', 'ru'),
(4013, 24, NULL, '2', 'ru'),
(4018, 22, NULL, 'Да', 'ru'),
(4019, 23, NULL, '100 Вт', 'ru'),
(4024, 22, NULL, 'Да', 'ru'),
(4025, 23, NULL, '100 Вт', 'ru'),
(4026, 24, NULL, '2', 'ru'),
(4031, 22, NULL, 'Да', 'ru'),
(4032, 23, NULL, '100 Вт', 'ru'),
(4033, 24, NULL, '1', 'ru'),
(4038, 22, NULL, 'Да', 'ru'),
(4039, 23, NULL, '1500 Вт', 'ru'),
(4040, 24, NULL, '2', 'ru'),
(4045, 23, NULL, '100 Вт', 'ru'),
(4048, 23, NULL, '80 Вт', 'ru'),
(4051, 23, NULL, '100 Вт', 'ru'),
(4054, 25, NULL, 'Да', 'ru'),
(4055, 26, NULL, '15 Мп', 'ru'),
(4058, 25, NULL, 'Да', 'ru'),
(4059, 26, NULL, '12 Мп', 'ru'),
(4062, 25, NULL, 'Да', 'ru'),
(4063, 26, NULL, '15 Мп', 'ru'),
(4066, 25, NULL, 'Да', 'ru'),
(4067, 26, NULL, '10 Мп', 'ru'),
(4070, 25, NULL, 'Да', 'ru'),
(4071, 26, NULL, '15 Мп', 'ru'),
(4122, 23, NULL, '40 Вт', 'ru'),
(4125, 23, NULL, '40 Вт', 'ru'),
(4128, 23, NULL, '40 Вт', 'ru'),
(4131, 23, NULL, '100 Вт', 'ru'),
(4134, 23, NULL, '40 Вт', 'ru'),
(4139, 23, NULL, '100 Вт', 'ru'),
(4140, 24, NULL, '4', 'ru'),
(4144, 23, NULL, '100 Вт', 'ru'),
(4145, 24, NULL, '2', 'ru'),
(4148, 20, NULL, 'LED', 'ru'),
(4149, 22, NULL, 'Да', 'ru'),
(4151, 20, NULL, 'LED', 'ru'),
(4152, 21, NULL, '32', 'ru'),
(4153, 22, NULL, 'Да', 'ru'),
(4155, 20, NULL, 'LED', 'ru'),
(4156, 21, NULL, '40', 'ru'),
(4157, 22, NULL, 'Да', 'ru'),
(4159, 20, NULL, 'LED', 'ru'),
(4160, 21, NULL, '32', 'ru'),
(4161, 22, NULL, 'Да', 'ru'),
(4163, 20, NULL, 'Plasma', 'ru'),
(4164, 21, NULL, '40', 'ru'),
(4165, 22, NULL, 'Нет', 'ru'),
(4167, 20, NULL, 'LCD', 'ru'),
(4168, 21, NULL, '40', 'ru'),
(4169, 22, NULL, 'Нет', 'ru'),
(4171, 20, NULL, 'LCD', 'ru'),
(4172, 21, NULL, '21', 'ru'),
(4173, 22, NULL, 'Да', 'ru'),
(4175, 23, NULL, '100 Вт', 'ru'),
(4179, 23, NULL, '50 Вт', 'ru'),
(4183, 23, NULL, '50 Вт', 'ru'),
(4187, 23, NULL, '100 Вт', 'ru'),
(4190, 23, NULL, '100 Вт', 'ru'),
(4193, 23, NULL, '40 Вт', 'ru'),
(4196, 23, NULL, '100 Вт', 'ru'),
(4199, 23, NULL, '50 Вт', 'ru'),
(4202, 23, NULL, '50 Вт', 'ru'),
(4205, 22, NULL, 'Да', 'ru'),
(4206, 23, NULL, '100 Вт', 'ru'),
(4207, 24, NULL, '2', 'ru'),
(4212, 22, NULL, 'Да', 'ru'),
(4213, 23, NULL, '100 Вт', 'ru'),
(4218, 22, NULL, 'Да', 'ru'),
(4219, 23, NULL, '100 Вт', 'ru'),
(4220, 24, NULL, '2', 'ru'),
(4225, 22, NULL, 'Да', 'ru'),
(4226, 23, NULL, '100 Вт', 'ru'),
(4227, 24, NULL, '1', 'ru'),
(4232, 22, NULL, 'Да', 'ru'),
(4233, 23, NULL, '1500 Вт', 'ru'),
(4234, 24, NULL, '2', 'ru'),
(4239, 23, NULL, '100 Вт', 'ru'),
(4242, 23, NULL, '80 Вт', 'ru'),
(4245, 23, NULL, '100 Вт', 'ru'),
(4248, 25, NULL, 'Да', 'ru'),
(4249, 26, NULL, '15 Мп', 'ru'),
(4252, 25, NULL, 'Да', 'ru'),
(4253, 26, NULL, '12 Мп', 'ru'),
(4256, 25, NULL, 'Да', 'ru'),
(4257, 26, NULL, '15 Мп', 'ru'),
(4260, 25, NULL, 'Да', 'ru'),
(4261, 26, NULL, '10 Мп', 'ru'),
(4264, 25, NULL, 'Да', 'ru'),
(4265, 26, NULL, '15 Мп', 'ru'),
(4316, 23, NULL, '40 Вт', 'ru'),
(4319, 23, NULL, '40 Вт', 'ru'),
(4322, 23, NULL, '40 Вт', 'ru'),
(4325, 23, NULL, '100 Вт', 'ru'),
(4328, 23, NULL, '40 Вт', 'ru'),
(4333, 23, NULL, '100 Вт', 'ru'),
(4334, 24, NULL, '4', 'ru'),
(4338, 23, NULL, '100 Вт', 'ru'),
(4339, 24, NULL, '2', 'ru'),
(4342, 20, NULL, 'LED', 'ru'),
(4343, 22, NULL, 'Да', 'ru'),
(4345, 20, NULL, 'LED', 'ru'),
(4346, 21, NULL, '32', 'ru'),
(4347, 22, NULL, 'Да', 'ru'),
(4349, 20, NULL, 'LED', 'ru'),
(4350, 21, NULL, '40', 'ru'),
(4351, 22, NULL, 'Да', 'ru'),
(4353, 20, NULL, 'LED', 'ru'),
(4354, 21, NULL, '32', 'ru'),
(4355, 22, NULL, 'Да', 'ru'),
(4357, 20, NULL, 'Plasma', 'ru'),
(4358, 21, NULL, '40', 'ru'),
(4359, 22, NULL, 'Нет', 'ru'),
(4361, 20, NULL, 'LCD', 'ru'),
(4362, 21, NULL, '40', 'ru'),
(4363, 22, NULL, 'Нет', 'ru'),
(4365, 20, NULL, 'LCD', 'ru'),
(4366, 21, NULL, '21', 'ru'),
(4367, 22, NULL, 'Да', 'ru'),
(4369, 23, NULL, '100 Вт', 'ru'),
(4373, 23, NULL, '50 Вт', 'ru'),
(4377, 23, NULL, '50 Вт', 'ru'),
(4381, 23, NULL, '100 Вт', 'ru'),
(4384, 23, NULL, '100 Вт', 'ru'),
(4387, 23, NULL, '40 Вт', 'ru'),
(4390, 23, NULL, '100 Вт', 'ru'),
(4393, 23, NULL, '50 Вт', 'ru'),
(4396, 23, NULL, '50 Вт', 'ru'),
(4399, 22, NULL, 'Да', 'ru'),
(4400, 23, NULL, '100 Вт', 'ru'),
(4401, 24, NULL, '2', 'ru'),
(4406, 22, NULL, 'Да', 'ru'),
(4407, 23, NULL, '100 Вт', 'ru'),
(4412, 22, NULL, 'Да', 'ru'),
(4413, 23, NULL, '100 Вт', 'ru'),
(4414, 24, NULL, '2', 'ru'),
(4419, 22, NULL, 'Да', 'ru'),
(4420, 23, NULL, '100 Вт', 'ru'),
(4421, 24, NULL, '1', 'ru'),
(4426, 22, NULL, 'Да', 'ru'),
(4427, 23, NULL, '1500 Вт', 'ru'),
(4428, 24, NULL, '2', 'ru'),
(6265, 20, 191, 'LCD', 'ru'),
(6266, 21, 191, '35', 'ru'),
(4433, 23, NULL, '100 Вт', 'ru'),
(4436, 23, NULL, '80 Вт', 'ru'),
(4439, 23, NULL, '100 Вт', 'ru'),
(4442, 25, NULL, 'Да', 'ru'),
(4443, 26, NULL, '15 Мп', 'ru'),
(4446, 25, NULL, 'Да', 'ru'),
(4447, 26, NULL, '12 Мп', 'ru'),
(4450, 25, NULL, 'Да', 'ru'),
(4451, 26, NULL, '15 Мп', 'ru'),
(4454, 25, NULL, 'Да', 'ru'),
(4455, 26, NULL, '10 Мп', 'ru'),
(4458, 25, NULL, 'Да', 'ru'),
(4459, 26, NULL, '15 Мп', 'ru'),
(4510, 23, NULL, '40 Вт', 'ru'),
(4513, 23, NULL, '40 Вт', 'ru'),
(4516, 23, NULL, '40 Вт', 'ru'),
(4519, 23, NULL, '100 Вт', 'ru'),
(4522, 23, NULL, '40 Вт', 'ru'),
(4527, 23, NULL, '100 Вт', 'ru'),
(4528, 24, NULL, '4', 'ru'),
(4532, 23, NULL, '100 Вт', 'ru'),
(4533, 24, NULL, '2', 'ru'),
(4536, 20, NULL, 'LED', 'ru'),
(4537, 22, NULL, 'Да', 'ru'),
(4539, 20, NULL, 'LED', 'ru'),
(4540, 21, NULL, '32', 'ru'),
(4541, 22, NULL, 'Да', 'ru'),
(4543, 20, NULL, 'LED', 'ru'),
(4544, 21, NULL, '40', 'ru'),
(4545, 22, NULL, 'Да', 'ru'),
(4547, 20, NULL, 'LED', 'ru'),
(4548, 21, NULL, '32', 'ru'),
(4549, 22, NULL, 'Да', 'ru'),
(4551, 20, NULL, 'Plasma', 'ru'),
(4552, 21, NULL, '40', 'ru'),
(4553, 22, NULL, 'Нет', 'ru'),
(4555, 20, NULL, 'LCD', 'ru'),
(4556, 21, NULL, '40', 'ru'),
(4557, 22, NULL, 'Нет', 'ru'),
(4559, 20, NULL, 'LCD', 'ru'),
(4560, 21, NULL, '21', 'ru'),
(4561, 22, NULL, 'Да', 'ru'),
(4563, 23, NULL, '100 Вт', 'ru'),
(6284, 24, 92, '3', 'ru'),
(4567, 23, NULL, '50 Вт', 'ru'),
(6223, 25, 186, 'Нет', 'ru'),
(4571, 23, NULL, '50 Вт', 'ru'),
(6219, 25, 101, 'Нет', 'ru'),
(4575, 23, NULL, '100 Вт', 'ru'),
(4578, 23, NULL, '100 Вт', 'ru'),
(4581, 23, NULL, '40 Вт', 'ru'),
(4584, 23, NULL, '100 Вт', 'ru'),
(4587, 23, NULL, '50 Вт', 'ru'),
(4590, 23, NULL, '50 Вт', 'ru'),
(4593, 22, NULL, 'Да', 'ru'),
(4594, 23, NULL, '100 Вт', 'ru'),
(4595, 24, NULL, '2', 'ru'),
(6218, 24, 101, '2', 'ru'),
(4600, 22, NULL, 'Да', 'ru'),
(4601, 23, NULL, '100 Вт', 'ru'),
(6217, 24, 101, '1', 'ru'),
(4606, 22, NULL, 'Да', 'ru'),
(4607, 23, NULL, '100 Вт', 'ru'),
(4608, 24, NULL, '2', 'ru'),
(6216, 22, 101, 'Нет', 'ru'),
(4613, 22, NULL, 'Да', 'ru'),
(4614, 23, NULL, '100 Вт', 'ru'),
(4615, 24, NULL, '1', 'ru'),
(6203, 25, 98, 'Да', 'ru'),
(4620, 22, NULL, 'Да', 'ru'),
(4621, 23, NULL, '1500 Вт', 'ru'),
(4622, 24, NULL, '2', 'ru'),
(6202, 24, 98, '3', 'ru'),
(4627, 23, NULL, '100 Вт', 'ru'),
(4630, 23, NULL, '80 Вт', 'ru'),
(4633, 23, NULL, '100 Вт', 'ru'),
(4636, 25, NULL, 'Да', 'ru'),
(4637, 26, NULL, '15 Мп', 'ru'),
(4640, 25, NULL, 'Да', 'ru'),
(4641, 26, NULL, '12 Мп', 'ru'),
(4644, 25, NULL, 'Да', 'ru'),
(4645, 26, NULL, '15 Мп', 'ru'),
(4648, 25, NULL, 'Да', 'ru'),
(4649, 26, NULL, '10 Мп', 'ru'),
(4652, 25, NULL, 'Да', 'ru'),
(4653, 26, NULL, '15 Мп', 'ru'),
(4704, 23, NULL, '40 Вт', 'ru'),
(4707, 23, NULL, '40 Вт', 'ru'),
(4710, 23, NULL, '40 Вт', 'ru'),
(4713, 23, NULL, '100 Вт', 'ru'),
(4716, 23, NULL, '40 Вт', 'ru'),
(4721, 23, NULL, '100 Вт', 'ru'),
(4722, 24, NULL, '4', 'ru'),
(4726, 23, NULL, '100 Вт', 'ru'),
(4727, 24, NULL, '2', 'ru'),
(4730, 20, NULL, 'LED', 'ru'),
(4731, 22, NULL, 'Да', 'ru'),
(4733, 20, NULL, 'LED', 'ru'),
(4734, 21, NULL, '32', 'ru'),
(4735, 22, NULL, 'Да', 'ru'),
(4737, 20, NULL, 'LED', 'ru'),
(4738, 21, NULL, '40', 'ru'),
(4739, 22, NULL, 'Да', 'ru'),
(4741, 20, NULL, 'LED', 'ru'),
(4742, 21, NULL, '32', 'ru'),
(4743, 22, NULL, 'Да', 'ru'),
(4745, 20, NULL, 'Plasma', 'ru'),
(4746, 21, NULL, '40', 'ru'),
(4747, 22, NULL, 'Нет', 'ru'),
(4749, 20, NULL, 'LCD', 'ru'),
(4750, 21, NULL, '40', 'ru'),
(4751, 22, NULL, 'Нет', 'ru'),
(4753, 20, NULL, 'LCD', 'ru'),
(4754, 21, NULL, '21', 'ru'),
(4755, 22, NULL, 'Да', 'ru'),
(4757, 23, NULL, '100 Вт', 'ru'),
(6201, 24, 98, '1', 'ru'),
(4761, 23, NULL, '50 Вт', 'ru'),
(6200, 22, 98, 'Нет', 'ru'),
(4765, 23, NULL, '50 Вт', 'ru'),
(6197, 25, 97, 'Да', 'ru'),
(4769, 23, NULL, '100 Вт', 'ru'),
(4772, 23, NULL, '100 Вт', 'ru'),
(4775, 23, NULL, '40 Вт', 'ru'),
(4778, 23, NULL, '100 Вт', 'ru'),
(4781, 23, NULL, '50 Вт', 'ru'),
(4784, 23, NULL, '50 Вт', 'ru'),
(4787, 22, NULL, 'Да', 'ru'),
(4788, 23, NULL, '100 Вт', 'ru'),
(4789, 24, NULL, '2', 'ru'),
(6196, 24, 97, '2', 'ru'),
(4794, 22, NULL, 'Да', 'ru'),
(4795, 23, NULL, '100 Вт', 'ru'),
(6195, 22, 97, 'Нет', 'ru'),
(4800, 22, NULL, 'Да', 'ru'),
(4801, 23, NULL, '100 Вт', 'ru'),
(4802, 24, NULL, '2', 'ru'),
(6192, 25, 91, 'Нет', 'ru'),
(4807, 22, NULL, 'Да', 'ru'),
(4808, 23, NULL, '100 Вт', 'ru'),
(4809, 24, NULL, '1', 'ru'),
(6191, 24, 91, '3', 'ru'),
(4814, 22, NULL, 'Да', 'ru'),
(4815, 23, NULL, '1500 Вт', 'ru'),
(4816, 24, NULL, '2', 'ru'),
(6190, 23, 91, '100 Вт', 'ru'),
(4821, 23, NULL, '100 Вт', 'ru'),
(4824, 23, NULL, '80 Вт', 'ru'),
(4827, 23, NULL, '100 Вт', 'ru'),
(4830, 25, NULL, 'Да', 'ru'),
(4831, 26, NULL, '15 Мп', 'ru'),
(4834, 25, NULL, 'Да', 'ru'),
(4835, 26, NULL, '12 Мп', 'ru'),
(4838, 25, NULL, 'Да', 'ru'),
(4839, 26, NULL, '15 Мп', 'ru'),
(4842, 25, NULL, 'Да', 'ru'),
(4843, 26, NULL, '10 Мп', 'ru'),
(4846, 25, NULL, 'Да', 'ru'),
(4847, 26, NULL, '15 Мп', 'ru'),
(4898, 23, NULL, '40 Вт', 'ru'),
(4901, 23, NULL, '40 Вт', 'ru'),
(4904, 23, NULL, '40 Вт', 'ru'),
(4907, 23, NULL, '100 Вт', 'ru'),
(4910, 23, NULL, '40 Вт', 'ru'),
(4915, 23, NULL, '100 Вт', 'ru'),
(4916, 24, NULL, '4', 'ru'),
(4920, 23, NULL, '100 Вт', 'ru'),
(4921, 24, NULL, '2', 'ru'),
(4924, 20, NULL, 'LED', 'ru'),
(4925, 22, NULL, 'Да', 'ru'),
(4927, 20, NULL, 'LED', 'ru'),
(4928, 21, NULL, '32', 'ru'),
(4929, 22, NULL, 'Да', 'ru'),
(4931, 20, NULL, 'LED', 'ru'),
(4932, 21, NULL, '40', 'ru'),
(4933, 22, NULL, 'Да', 'ru'),
(4935, 20, NULL, 'LED', 'ru'),
(4936, 21, NULL, '32', 'ru'),
(4937, 22, NULL, 'Да', 'ru'),
(4939, 20, NULL, 'Plasma', 'ru'),
(4940, 21, NULL, '40', 'ru'),
(4941, 22, NULL, 'Нет', 'ru'),
(4943, 20, NULL, 'LCD', 'ru'),
(4944, 21, NULL, '40', 'ru'),
(4945, 22, NULL, 'Нет', 'ru'),
(4947, 20, NULL, 'LCD', 'ru'),
(4948, 21, NULL, '21', 'ru'),
(4949, 22, NULL, 'Да', 'ru'),
(4951, 23, NULL, '100 Вт', 'ru'),
(6186, 25, 90, 'Нет', 'ru'),
(4955, 23, NULL, '50 Вт', 'ru'),
(6185, 24, 90, '1', 'ru'),
(4959, 23, NULL, '50 Вт', 'ru'),
(6184, 23, 90, '100 Вт', 'ru'),
(4963, 23, NULL, '100 Вт', 'ru'),
(4966, 23, NULL, '100 Вт', 'ru'),
(4969, 23, NULL, '40 Вт', 'ru'),
(4972, 23, NULL, '100 Вт', 'ru'),
(4975, 23, NULL, '50 Вт', 'ru'),
(4978, 23, NULL, '50 Вт', 'ru'),
(4981, 22, NULL, 'Да', 'ru'),
(4982, 23, NULL, '100 Вт', 'ru'),
(4983, 24, NULL, '2', 'ru'),
(6294, 24, 89, '3', 'ru'),
(6295, 24, 89, '4', 'ru'),
(4988, 22, NULL, 'Да', 'ru'),
(4989, 23, NULL, '100 Вт', 'ru'),
(6292, 22, 89, 'Да', 'ru'),
(6293, 23, 89, '100 Вт', 'ru'),
(4994, 22, NULL, 'Да', 'ru'),
(4995, 23, NULL, '100 Вт', 'ru'),
(4996, 24, NULL, '2', 'ru'),
(6290, 20, 89, 'LED', 'ru'),
(6291, 21, 89, '32', 'ru'),
(5001, 22, NULL, 'Да', 'ru'),
(5002, 23, NULL, '100 Вт', 'ru'),
(5003, 24, NULL, '1', 'ru'),
(6288, 24, 92, '11', 'ru'),
(6289, 24, 92, '12', 'ru'),
(5008, 22, NULL, 'Да', 'ru'),
(5009, 23, NULL, '1500 Вт', 'ru'),
(5010, 24, NULL, '2', 'ru'),
(6244, 24, 88, '1', 'ru'),
(6245, 25, 88, 'Да', 'ru'),
(5015, 23, NULL, '100 Вт', 'ru'),
(5018, 23, NULL, '80 Вт', 'ru'),
(5021, 23, NULL, '100 Вт', 'ru'),
(5024, 25, NULL, 'Да', 'ru'),
(5025, 26, NULL, '15 Мп', 'ru'),
(5028, 25, NULL, 'Да', 'ru'),
(5029, 26, NULL, '12 Мп', 'ru'),
(5032, 25, NULL, 'Да', 'ru'),
(5033, 26, NULL, '15 Мп', 'ru'),
(5036, 25, NULL, 'Да', 'ru'),
(5037, 26, NULL, '10 Мп', 'ru'),
(5040, 25, NULL, 'Да', 'ru'),
(5041, 26, NULL, '15 Мп', 'ru'),
(5092, 23, NULL, '40 Вт', 'ru'),
(5095, 23, NULL, '40 Вт', 'ru'),
(5098, 23, NULL, '40 Вт', 'ru'),
(5101, 23, NULL, '100 Вт', 'ru'),
(5104, 23, NULL, '40 Вт', 'ru'),
(5109, 23, NULL, '100 Вт', 'ru'),
(5110, 24, NULL, '4', 'ru'),
(5114, 23, NULL, '100 Вт', 'ru'),
(5115, 24, NULL, '2', 'ru'),
(5118, 20, NULL, 'LED', 'ru'),
(5119, 22, NULL, 'Да', 'ru'),
(5121, 20, NULL, 'LED', 'ru'),
(5122, 21, NULL, '32', 'ru'),
(5123, 22, NULL, 'Да', 'ru'),
(5125, 20, NULL, 'LED', 'ru'),
(5126, 21, NULL, '40', 'ru'),
(5127, 22, NULL, 'Да', 'ru'),
(5129, 20, NULL, 'LED', 'ru'),
(5130, 21, NULL, '32', 'ru'),
(5131, 22, NULL, 'Да', 'ru'),
(5133, 20, NULL, 'Plasma', 'ru'),
(5134, 21, NULL, '40', 'ru'),
(5135, 22, NULL, 'Нет', 'ru'),
(5137, 20, NULL, 'LCD', 'ru'),
(5138, 21, NULL, '40', 'ru'),
(5139, 22, NULL, 'Нет', 'ru'),
(5141, 20, NULL, 'LCD', 'ru'),
(5142, 21, NULL, '21', 'ru'),
(5143, 22, NULL, 'Да', 'ru'),
(5145, 23, NULL, '100 Вт', 'ru'),
(6243, 23, 88, '100 Вт', 'ru'),
(5149, 23, NULL, '50 Вт', 'ru'),
(6242, 22, 88, 'Да', 'ru'),
(5153, 23, NULL, '50 Вт', 'ru'),
(6287, 24, 92, '10', 'ru'),
(5157, 23, NULL, '100 Вт', 'ru'),
(5160, 23, NULL, '100 Вт', 'ru'),
(5163, 23, NULL, '40 Вт', 'ru'),
(5166, 23, NULL, '100 Вт', 'ru'),
(5169, 23, NULL, '50 Вт', 'ru'),
(5172, 23, NULL, '50 Вт', 'ru'),
(5175, 22, NULL, 'Да', 'ru'),
(5176, 23, NULL, '100 Вт', 'ru'),
(5177, 24, NULL, '2', 'ru'),
(6250, 24, 87, '2', 'ru'),
(6251, 25, 87, 'Да', 'ru'),
(5182, 22, NULL, 'Да', 'ru'),
(5183, 23, NULL, '100 Вт', 'ru'),
(6248, 22, 87, 'Да', 'ru'),
(6249, 23, 87, '100 Вт', 'ru'),
(5188, 22, NULL, 'Да', 'ru'),
(5189, 23, NULL, '100 Вт', 'ru'),
(5190, 24, NULL, '2', 'ru'),
(6246, 20, 87, 'Plasma', 'ru'),
(6247, 21, 87, '37', 'ru'),
(5195, 22, NULL, 'Да', 'ru'),
(5196, 23, NULL, '100 Вт', 'ru'),
(5197, 24, NULL, '1', 'ru'),
(6162, 25, 86, 'Нет', 'ru'),
(5202, 22, NULL, 'Да', 'ru'),
(5203, 23, NULL, '1500 Вт', 'ru'),
(5204, 24, NULL, '2', 'ru'),
(6161, 24, 86, '1', 'ru'),
(5209, 23, NULL, '100 Вт', 'ru'),
(5212, 23, NULL, '80 Вт', 'ru'),
(5215, 23, NULL, '100 Вт', 'ru'),
(5218, 25, NULL, 'Да', 'ru'),
(5219, 26, NULL, '15 Мп', 'ru'),
(5222, 25, NULL, 'Да', 'ru'),
(5223, 26, NULL, '12 Мп', 'ru'),
(5226, 25, NULL, 'Да', 'ru'),
(5227, 26, NULL, '15 Мп', 'ru'),
(5230, 25, NULL, 'Да', 'ru'),
(5231, 26, NULL, '10 Мп', 'ru'),
(5234, 25, NULL, 'Да', 'ru'),
(5235, 26, NULL, '15 Мп', 'ru'),
(5286, 23, NULL, '40 Вт', 'ru'),
(5289, 23, NULL, '40 Вт', 'ru'),
(5292, 23, NULL, '40 Вт', 'ru'),
(5295, 23, NULL, '100 Вт', 'ru'),
(5298, 23, NULL, '40 Вт', 'ru'),
(5303, 23, NULL, '100 Вт', 'ru'),
(5304, 24, NULL, '4', 'ru'),
(5308, 23, NULL, '100 Вт', 'ru'),
(5309, 24, NULL, '2', 'ru'),
(5312, 20, NULL, 'LED', 'ru'),
(5313, 22, NULL, 'Да', 'ru'),
(5315, 20, NULL, 'LED', 'ru'),
(5316, 21, NULL, '32', 'ru'),
(5317, 22, NULL, 'Да', 'ru'),
(5319, 20, NULL, 'LED', 'ru'),
(5320, 21, NULL, '40', 'ru'),
(5321, 22, NULL, 'Да', 'ru'),
(5323, 20, NULL, 'LED', 'ru');
INSERT INTO `shop_product_properties_data` (`id`, `property_id`, `product_id`, `value`, `locale`) VALUES
(5324, 21, NULL, '32', 'ru'),
(5325, 22, NULL, 'Да', 'ru'),
(5327, 20, NULL, 'Plasma', 'ru'),
(5328, 21, NULL, '40', 'ru'),
(5329, 22, NULL, 'Нет', 'ru'),
(5331, 20, NULL, 'LCD', 'ru'),
(5332, 21, NULL, '40', 'ru'),
(5333, 22, NULL, 'Нет', 'ru'),
(5335, 20, NULL, 'LCD', 'ru'),
(5336, 21, NULL, '21', 'ru'),
(5337, 22, NULL, 'Да', 'ru'),
(5339, 23, NULL, '50 Вт', 'ru'),
(6160, 23, 86, '50 Вт', 'ru'),
(5343, 23, NULL, '100 Вт', 'ru'),
(5346, 23, NULL, '100 Вт', 'ru'),
(5349, 23, NULL, '40 Вт', 'ru'),
(5352, 23, NULL, '100 Вт', 'ru'),
(5355, 23, NULL, '50 Вт', 'ru'),
(5358, 23, NULL, '50 Вт', 'ru'),
(5361, 22, NULL, 'Да', 'ru'),
(5362, 23, NULL, '100 Вт', 'ru'),
(5363, 24, NULL, '2', 'ru'),
(6159, 22, 86, 'Нет', 'ru'),
(5368, 22, NULL, 'Да', 'ru'),
(5369, 23, NULL, '100 Вт', 'ru'),
(6158, 21, 86, '21', 'ru'),
(5374, 22, NULL, 'Да', 'ru'),
(5375, 23, NULL, '100 Вт', 'ru'),
(5376, 24, NULL, '2', 'ru'),
(6156, 25, 85, 'Нет', 'ru'),
(5381, 22, NULL, 'Да', 'ru'),
(5382, 23, NULL, '100 Вт', 'ru'),
(5383, 24, NULL, '1', 'ru'),
(6155, 24, 85, '2', 'ru'),
(5388, 22, NULL, 'Да', 'ru'),
(5389, 23, NULL, '1500 Вт', 'ru'),
(5390, 24, NULL, '2', 'ru'),
(6154, 23, 85, '100 Вт', 'ru'),
(5395, 23, NULL, '100 Вт', 'ru'),
(5398, 23, NULL, '80 Вт', 'ru'),
(5401, 23, NULL, '100 Вт', 'ru'),
(5404, 25, NULL, 'Да', 'ru'),
(5405, 26, NULL, '15 Мп', 'ru'),
(5408, 25, NULL, 'Да', 'ru'),
(5409, 26, NULL, '12 Мп', 'ru'),
(5412, 25, NULL, 'Да', 'ru'),
(5413, 26, NULL, '15 Мп', 'ru'),
(5416, 25, NULL, 'Да', 'ru'),
(5417, 26, NULL, '10 Мп', 'ru'),
(5420, 25, NULL, 'Да', 'ru'),
(5421, 26, NULL, '15 Мп', 'ru'),
(5472, 23, NULL, '40 Вт', 'ru'),
(5475, 23, NULL, '40 Вт', 'ru'),
(5478, 23, NULL, '40 Вт', 'ru'),
(5481, 23, NULL, '100 Вт', 'ru'),
(5484, 23, NULL, '40 Вт', 'ru'),
(5489, 23, NULL, '100 Вт', 'ru'),
(5490, 24, NULL, '4', 'ru'),
(5494, 23, NULL, '100 Вт', 'ru'),
(5495, 24, NULL, '2', 'ru'),
(5498, 20, NULL, 'LED', 'ru'),
(5499, 22, NULL, 'Да', 'ru'),
(5501, 20, NULL, 'LED', 'ru'),
(5502, 21, NULL, '32', 'ru'),
(5503, 22, NULL, 'Да', 'ru'),
(5505, 20, NULL, 'LED', 'ru'),
(5506, 21, NULL, '40', 'ru'),
(5507, 22, NULL, 'Да', 'ru'),
(5509, 20, NULL, 'LED', 'ru'),
(5510, 21, NULL, '32', 'ru'),
(5511, 22, NULL, 'Да', 'ru'),
(5513, 23, NULL, '100 Вт', 'ru'),
(6153, 22, 85, 'Нет', 'ru'),
(5517, 20, NULL, 'Plasma', 'ru'),
(5518, 21, NULL, '40', 'ru'),
(5519, 22, NULL, 'Нет', 'ru'),
(5521, 20, NULL, 'LCD', 'ru'),
(5522, 21, NULL, '40', 'ru'),
(5523, 22, NULL, 'Нет', 'ru'),
(5525, 20, NULL, 'LCD', 'ru'),
(5526, 21, NULL, '21', 'ru'),
(5527, 22, NULL, 'Да', 'ru'),
(5529, 23, NULL, '50 Вт', 'ru'),
(6152, 21, 85, '17', 'ru'),
(5533, 23, NULL, '50 Вт', 'ru'),
(6150, 25, 84, 'Да', 'ru'),
(5537, 23, NULL, '100 Вт', 'ru'),
(5540, 23, NULL, '100 Вт', 'ru'),
(5543, 23, NULL, '40 Вт', 'ru'),
(5546, 23, NULL, '100 Вт', 'ru'),
(5549, 23, NULL, '50 Вт', 'ru'),
(5552, 23, NULL, '50 Вт', 'ru'),
(5555, 22, NULL, 'Да', 'ru'),
(5556, 23, NULL, '100 Вт', 'ru'),
(5557, 24, NULL, '2', 'ru'),
(6149, 24, 84, '3', 'ru'),
(5562, 22, NULL, 'Да', 'ru'),
(5563, 23, NULL, '100 Вт', 'ru'),
(6148, 23, 84, '40 Вт', 'ru'),
(5568, 22, NULL, 'Да', 'ru'),
(5569, 23, NULL, '100 Вт', 'ru'),
(5570, 24, NULL, '2', 'ru'),
(6147, 22, 84, 'Нет', 'ru'),
(5575, 22, NULL, 'Да', 'ru'),
(5576, 23, NULL, '100 Вт', 'ru'),
(5577, 24, NULL, '1', 'ru'),
(6146, 21, 84, '40', 'ru'),
(5582, 22, NULL, 'Да', 'ru'),
(5583, 23, NULL, '1500 Вт', 'ru'),
(5584, 24, NULL, '2', 'ru'),
(6144, 25, 83, 'Да', 'ru'),
(5589, 23, NULL, '100 Вт', 'ru'),
(5592, 23, NULL, '80 Вт', 'ru'),
(5595, 23, NULL, '100 Вт', 'ru'),
(5598, 25, NULL, 'Да', 'ru'),
(5599, 26, NULL, '15 Мп', 'ru'),
(5602, 25, NULL, 'Да', 'ru'),
(5603, 26, NULL, '12 Мп', 'ru'),
(5606, 25, NULL, 'Да', 'ru'),
(5607, 26, NULL, '15 Мп', 'ru'),
(5610, 25, NULL, 'Да', 'ru'),
(5611, 26, NULL, '10 Мп', 'ru'),
(5614, 25, NULL, 'Да', 'ru'),
(5615, 26, NULL, '15 Мп', 'ru'),
(5666, 23, NULL, '40 Вт', 'ru'),
(5669, 23, NULL, '40 Вт', 'ru'),
(5672, 23, NULL, '40 Вт', 'ru'),
(5675, 23, NULL, '100 Вт', 'ru'),
(5678, 23, NULL, '40 Вт', 'ru'),
(5683, 23, NULL, '100 Вт', 'ru'),
(5684, 24, NULL, '4', 'ru'),
(5688, 23, NULL, '100 Вт', 'ru'),
(5689, 24, NULL, '2', 'ru'),
(5692, 20, NULL, 'LED', 'ru'),
(5693, 22, NULL, 'Да', 'ru'),
(5695, 20, NULL, 'LED', 'ru'),
(5696, 21, NULL, '32', 'ru'),
(5697, 22, NULL, 'Да', 'ru'),
(5699, 20, NULL, 'LED', 'ru'),
(5700, 21, NULL, '40', 'ru'),
(5701, 22, NULL, 'Да', 'ru'),
(5703, 20, NULL, 'LED', 'ru'),
(5704, 21, NULL, '32', 'ru'),
(5705, 22, NULL, 'Да', 'ru'),
(5707, 23, NULL, '100 Вт', 'ru'),
(6143, 24, 83, '4', 'ru'),
(5711, 20, NULL, 'Plasma', 'ru'),
(5712, 21, NULL, '40', 'ru'),
(5713, 22, NULL, 'Нет', 'ru'),
(5715, 20, NULL, 'LCD', 'ru'),
(5716, 21, NULL, '40', 'ru'),
(5717, 22, NULL, 'Нет', 'ru'),
(5719, 20, NULL, 'LCD', 'ru'),
(5720, 21, NULL, '21', 'ru'),
(5721, 22, NULL, 'Да', 'ru'),
(5723, 23, NULL, '50 Вт', 'ru'),
(6142, 24, 83, '3', 'ru'),
(5819, 23, 81, '50 Вт', 'ru'),
(5820, 22, 195, 'Да', 'ru'),
(5821, 20, 195, 'LED', 'ru'),
(5823, 22, 196, 'Да', 'ru'),
(5824, 21, 196, '32', 'ru'),
(5826, 20, 196, 'LED', 'ru'),
(5827, 22, 197, 'Да', 'ru'),
(5828, 21, 197, '40', 'ru'),
(5830, 20, 197, 'LED', 'ru'),
(5831, 21, 198, '32', 'ru'),
(5832, 20, 198, 'LED', 'ru'),
(5834, 22, 198, 'Да', 'ru'),
(5835, 22, 202, 'Да', 'ru'),
(5836, 20, 202, 'LED', 'ru'),
(5838, 22, 203, 'Да', 'ru'),
(5839, 21, 203, '32', 'ru'),
(5841, 20, 203, 'LED', 'ru'),
(5842, 22, 204, 'Да', 'ru'),
(5843, 21, 204, '40', 'ru'),
(5845, 20, 204, 'LED', 'ru'),
(5846, 21, 205, '32', 'ru'),
(5847, 20, 205, 'LED', 'ru'),
(5849, 22, 205, 'Да', 'ru'),
(5850, 22, 209, 'Да', 'ru'),
(5851, 20, 209, 'LED', 'ru'),
(5853, 22, 210, 'Да', 'ru'),
(5854, 21, 210, '32', 'ru'),
(5856, 20, 210, 'LED', 'ru'),
(5857, 22, 211, 'Да', 'ru'),
(5858, 21, 211, '40', 'ru'),
(5860, 20, 211, 'LED', 'ru'),
(5861, 21, 212, '32', 'ru'),
(5862, 20, 212, 'LED', 'ru'),
(5864, 22, 212, 'Да', 'ru'),
(6274, 21, 190, '36', 'ru'),
(6256, 24, 71, '1', 'ru'),
(6255, 23, 71, '40 Вт', 'ru'),
(6254, 22, 71, 'Да', 'ru'),
(6017, 23, 119, '40 Вт', 'ru'),
(6253, 21, 71, '38', 'ru'),
(6252, 20, 71, 'LED', 'ru'),
(6241, 21, 88, '33', 'ru'),
(6240, 20, 88, 'LED', 'ru'),
(6273, 20, 190, 'LCD', 'ru');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_properties_data_i18n`
--

DROP TABLE IF EXISTS `shop_product_properties_data_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_data_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_properties_data_i18n_I_1` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_properties_i18n`
--

DROP TABLE IF EXISTS `shop_product_properties_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_i18n` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `data` text,
  `description` text,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_product_properties_i18n_I_2` (`name`),
  KEY `shop_product_properties_i18n_I_1` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_product_properties_i18n`
--

INSERT INTO `shop_product_properties_i18n` (`id`, `name`, `locale`, `data`, `description`) VALUES
(26, 'Количество мегапикселей', 'ru', 'a:6:{i:0;s:5:"3 Mп";i:1;s:6:"5 Мп";i:2;s:6:"8 Мп";i:3;s:7:"10 Мп";i:4;s:7:"12 Мп";i:5;s:7:"15 Мп";}', ''),
(25, 'Настройка фокуса', 'ru', 'a:2:{i:0;s:4:"Да";i:1;s:6:"Нет";}', ''),
(24, 'Количество цифровых входов', 'ru', 'a:12:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";i:4;s:1:"5";i:5;s:1:"6";i:6;s:1:"7";i:7;s:1:"8";i:8;s:1:"9";i:9;s:2:"10";i:10;s:2:"11";i:11;s:2:"12";}', ''),
(23, 'Мощность', 'ru', '', ''),
(22, 'HDMI', 'ru', 'a:2:{i:0;s:4:"Да";i:1;s:6:"Нет";}', ''),
(21, 'Размер экрана', 'ru', 'a:14:{i:0;s:2:"17";i:1;s:2:"19";i:2;s:2:"21";i:3;s:2:"23";i:4;s:2:"30";i:5;s:2:"32";i:6;s:2:"33";i:7;s:2:"34";i:8;s:2:"35";i:9;s:2:"36";i:10;s:2:"37";i:11;s:2:"38";i:12;s:2:"39";i:13;s:2:"40";}', ''),
(20, 'Технология дисплея', 'ru', 'a:3:{i:0;s:3:"LED";i:1;s:3:"LCD";i:2;s:6:"Plasma";}', ''),
(20, 'Технологія дисплею', 'ua', 'a:4:{i:0;s:6:"LED-ua";i:1;s:9:"Plasma-ua";i:2;s:9:"Litium-ua";i:3;s:8:"Freon-ua";}', NULL),
(20, 'Display Technology', 'en', '', NULL),
(21, 'Screen Size', 'en', '', NULL),
(22, 'HDMI', 'en', 'a:2:{i:0;s:3:"Yes";i:1;s:2:"No";}', NULL),
(23, 'Power', 'en', '', NULL),
(24, 'Number of digital inputs', 'en', '', NULL),
(25, 'Setting the focus', 'en', '', NULL),
(26, 'The number of megapixels', 'en', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_variants`
--

DROP TABLE IF EXISTS `shop_product_variants`;
CREATE TABLE IF NOT EXISTS `shop_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price` double(20,5) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `mainImage` varchar(255) DEFAULT NULL,
  `smallImage` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `price_in_main` double(20,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_product_variants_I_1` (`product_id`),
  KEY `shop_product_variants_I_2` (`position`),
  KEY `shop_product_variants_I_3` (`number`),
  KEY `shop_product_variants_I_5` (`price`),
  KEY `shop_product_variants_I_4` (`price`),
  KEY `shop_product_variants_FI_2` (`currency`),
  KEY `external_id` (`external_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Дамп даних таблиці `shop_product_variants`
--

INSERT INTO `shop_product_variants` (`id`, `product_id`, `price`, `number`, `stock`, `position`, `mainImage`, `smallImage`, `external_id`, `currency`, `price_in_main`) VALUES
(82, 71, 20491.80328, ' 034976', 3, 0, '71_vM82.jpg', '71_vS82.jpg', NULL, 1, 2500.00000),
(89, 78, 825.00000, '', 8, 0, '78_vM89.jpg', NULL, NULL, 2, 825.00000),
(90, 79, 99.88000, '', 9, 0, '79_vM90.jpg', '79_vS90.jpg', NULL, 2, 99.88000),
(92, 81, 172.00000, 'AD-78-SA-QW', 7, 0, '81_vM92.jpg', '81_vS92.jpg', NULL, 2, 172.00000),
(93, 82, 422.95082, '', 5, 0, '82_vM93.jpg', '82_vS93.jpg', NULL, 1, 51.60000),
(94, 83, 422.95082, '', 6, 0, '83_vM94.jpg', '83_vS94.jpg', NULL, 1, 51.60000),
(95, 84, 329.50820, '', 8, 0, '84_vM95.jpg', '84_vS95.jpg', NULL, 1, 40.20000),
(96, 85, 88.00000, 'D01B570', 7, 0, '85_vM96.jpg', '85_vS96.jpg', NULL, 2, 88.00000),
(97, 86, 504.91803, '', 4, 0, '86_vM97.jpg', '86_vS97.jpg', NULL, 1, 61.60000),
(98, 87, 7151.63934, '', 7, 0, '87_vM98.jpg', '87_vS98.jpg', NULL, 1, 872.50000),
(99, 88, 22900.00000, '', 8, 0, '88_vM99.jpg', '88_vS99.jpg', NULL, 2, 22900.00000),
(100, 89, 1219.67213, '', 9, 0, '89_vM100.jpg', '89_vS100.jpg', NULL, 1, 148.80000),
(101, 90, 3275.40992, '', 2, 0, '90_vM101.jpg', '90_vS101.jpg', NULL, 1, 399.60001),
(102, 91, 1796.72131, '', 1, 0, '91_vM102.jpg', '91_vS102.jpg', NULL, 1, 219.20000),
(103, 92, 973.77049, '', 4, 0, '92_vM103.jpg', '92_vS103.jpg', NULL, 1, 118.80000),
(104, 93, 1147.54098, '', 8, 0, '93_vM104.jpg', '93_vS104.jpg', NULL, 1, 140.00000),
(105, 94, 327.70492, '', 4, 0, '94_vM105.jpg', '94_vS105.jpg', NULL, 1, 39.98000),
(106, 95, 2619.67221, '', 5, 0, NULL, NULL, NULL, 1, 319.60001),
(107, 96, 1747.50000, '4383B001', 6, 0, 'CANON-VIXIA-HF-G10.jpg', '96_vS107.jpg', NULL, 2, 1747.50000),
(108, 97, 2619.67221, '', 1, 0, '97_vM108.jpg', '97_vS108.jpg', NULL, 1, 319.60001),
(109, 98, 1800.00008, '', 4, 0, '98_vM109.jpg', '98_vS109.jpg', NULL, 1, 219.60001),
(110, 99, 1639.34426, '', 8, 0, '99_vM110.jpg', '99_vS110.jpg', NULL, 1, 200.00000),
(111, 100, 589.75410, '', 2, 0, '100_vM111.jpg', '100_vS111.jpg', NULL, 1, 71.95000),
(112, 101, 245.90164, '', 9, 0, '101_vM112.jpg', '101_vS112.jpg', NULL, 1, 30.00000),
(113, 102, 1803.27869, '', 2, 0, '102_vM113.jpg', '102_vS113.jpg', NULL, 1, 220.00000),
(114, 103, 284.91803, '', 8, 0, '103_vM114.jpg', '103_vS114.jpg', NULL, 1, 34.76000),
(115, 104, 320.00000, '', 0, 0, '104_vM115.jpg', '104_vS115.jpg', NULL, 2, 320.00000),
(116, 105, 327.70492, '', 2, 0, '105_vM116.jpg', '105_vS116.jpg', NULL, 1, 39.98000),
(117, 106, 272.04999, '', 0, 0, '106_vM117.jpg', '106_vS117.jpg', NULL, 2, 272.04999),
(118, 107, 718.93443, '', 5, 0, '107_vM118.jpg', '107_vS118.jpg', NULL, 1, 87.71000),
(119, 108, 721.31148, '', 2, 0, NULL, NULL, NULL, 1, 88.00000),
(120, 109, 404.50820, '', 9, 0, '109_vM120.jpg', '109_vS120.jpg', NULL, 1, 49.35000),
(121, 110, 121.14754, '', 5, 0, '110_vM121.jpg', '110_vS121.jpg', NULL, 1, 14.78000),
(122, 111, 66.88525, '', 7, 0, '111_vM122.jpg', '111_vS122.jpg', NULL, 1, 8.16000),
(123, 112, 42.62295, '', 6, 0, '112_vM123.jpg', '112_vS123.jpg', NULL, 1, 5.20000),
(124, 113, 36.06557, '', 9, 0, '113_vM124.jpg', '113_vS124.jpg', NULL, 1, 4.40000),
(125, 114, 65.57377, '', 3, 0, '114_vM125.jpg', '114_vS125.jpg', NULL, 1, 8.00000),
(126, 115, 147.54098, '', 5, 0, '115_vM126.jpg', '115_vS126.jpg', NULL, 1, 18.00000),
(127, 116, 200.00000, '', 6, 0, '116_vM127.jpg', '116_vS127.jpg', NULL, 1, 24.40000),
(128, 117, 154.83607, '', 7, 0, '117_vM128.jpg', '117_vS128.jpg', NULL, 1, 18.89000),
(129, 118, 183.60656, '', 2, 0, '118_vM129.jpg', '118_vS129.jpg', NULL, 1, 22.40000),
(130, 119, 1600.60000, '', 0, 0, '119_vM130.jpg', '119_vS130.jpg', NULL, 2, 1600.60000),
(131, 120, 100.65574, '', 6, 0, '120_vM131.jpg', NULL, NULL, 1, 12.28000),
(132, 121, 92.37705, '', 4, 0, '121_vM132.jpg', '121_vS132.jpg', NULL, 1, 11.27000),
(133, 122, 114.75410, '', 6, 0, '122_vM133.jpg', NULL, NULL, 1, 14.00000),
(134, 123, 137.70492, '', 1, 0, '123_vM134.jpg', '123_vS134.jpg', NULL, 1, 16.80000),
(135, 124, 111.47541, '', 2, 0, '124_vM135.jpg', '124_vS135.jpg', NULL, 1, 13.60000),
(210, 100, 573.36066, '', 1, 1, '100_vM210.jpg', '100_vS210.jpg', NULL, 1, 69.95000),
(211, 110, 121.14754, '', 2, 1, '110_vM211.jpg', '110_vS211.jpg', NULL, 1, 14.78000),
(212, 86, 508.19672, '', 0, 1, '86_vM212.jpg', '86_vS212.jpg', NULL, 1, 62.00000),
(213, 185, 200.00000, '123456', 5, 0, '185_main.jpg', '185_small.jpg', NULL, 2, 200.00000),
(214, 186, 6147.54098, ' 130835', 4, 0, '186_vM214.jpg', '186_vS214.jpg', NULL, 1, 750.00000),
(215, 187, 7172.13115, ' 155763', 0, 0, '187_vM215.jpg', '187_vS215.jpg', NULL, 1, 875.00000),
(216, 188, 5122.95082, '', 10, 0, '188_vM216.jpg', '188_vS216.jpg', NULL, 1, 625.00000),
(217, 189, 1250.00000, '', 10, 0, '189_vM217.jpg', NULL, NULL, 2, 1250.00000),
(218, 190, 625.00000, '1234', 5, 0, '190_vM218.jpg', NULL, NULL, 2, 625.00000),
(219, 191, 6762.29508, '', 8, 0, '191_vM219.jpg', '191_vS219.jpg', NULL, 1, 825.00000),
(224, 190, 700.00000, '5345', 1, 1, NULL, NULL, NULL, 2, 700.00000),
(225, 190, 700.00000, '6256', 2, 2, NULL, NULL, NULL, 2, 700.00000),
(226, 190, 700.00000, '8265', 1, 3, NULL, NULL, NULL, 2, 700.00000);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_product_variants_i18n`
--

DROP TABLE IF EXISTS `shop_product_variants_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_variants_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `shop_product_variants_i18n_I_1` (`name`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_product_variants_i18n`
--

INSERT INTO `shop_product_variants_i18n` (`id`, `locale`, `name`) VALUES
(82, 'ru', ''),
(211, 'ru', 'Серый'),
(89, 'ru', ''),
(90, 'ru', ''),
(92, 'ru', ''),
(93, 'ru', ''),
(94, 'ru', ''),
(95, 'ru', ''),
(96, 'ru', ''),
(97, 'ru', 'Черный'),
(98, 'ru', ''),
(99, 'ru', ''),
(100, 'ru', ''),
(101, 'ru', ''),
(102, 'ru', 'Sony BDV-E770W Home Theater'),
(103, 'ru', ''),
(104, 'ru', ''),
(105, 'ru', ''),
(106, 'ru', ''),
(107, 'ru', ''),
(108, 'ru', ''),
(109, 'ru', ''),
(110, 'ru', ''),
(111, 'ru', 'Черный'),
(112, 'ru', ''),
(113, 'ru', ''),
(114, 'ru', ''),
(115, 'ru', ''),
(116, 'ru', ''),
(117, 'ru', 'Panasonic KX-TG7433B Expandabledsf'),
(118, 'ru', ''),
(119, 'ru', ''),
(120, 'ru', ''),
(121, 'ru', 'Черный'),
(122, 'ru', ''),
(123, 'ru', ''),
(124, 'ru', ''),
(125, 'ru', ''),
(126, 'ru', ''),
(127, 'ru', ''),
(128, 'ru', ''),
(129, 'ru', ''),
(130, 'ru', ''),
(131, 'ru', ''),
(132, 'ru', ''),
(133, 'ru', ''),
(134, 'ru', ''),
(135, 'ru', ''),
(105, 'en', ''),
(82, 'en', ''),
(90, 'en', ''),
(89, 'en', ''),
(93, 'en', ''),
(92, 'en', ''),
(103, 'en', ''),
(99, 'en', ''),
(98, 'en', ''),
(111, 'en', ''),
(106, 'en', ''),
(123, 'en', ''),
(121, 'en', ''),
(118, 'en', ''),
(117, 'en', ''),
(116, 'en', ''),
(127, 'en', ''),
(133, 'en', ''),
(132, 'en', ''),
(210, 'ru', 'Белый'),
(212, 'ru', 'Белый'),
(213, 'ru', ''),
(214, 'ru', ''),
(215, 'ru', ''),
(216, 'ru', ''),
(217, 'ru', ''),
(218, 'ru', 'черный'),
(219, 'ru', ''),
(224, 'ru', 'красный'),
(225, 'ru', 'синий'),
(226, 'ru', 'белый');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_group`
--

DROP TABLE IF EXISTS `shop_rbac_group`;
CREATE TABLE IF NOT EXISTS `shop_rbac_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Дамп даних таблиці `shop_rbac_group`
--

INSERT INTO `shop_rbac_group` (`id`, `type`, `name`, `description`) VALUES
(1, 'shop', 'ShopAdminBanners', NULL),
(2, 'shop', 'ShopAdminBrands', NULL),
(3, 'shop', 'ShopAdminCallbacks', NULL),
(4, 'shop', 'ShopAdminCategories', NULL),
(5, 'shop', 'ShopAdminCharts', NULL),
(6, 'shop', 'ShopAdminComulativ', NULL),
(7, 'shop', 'ShopAdminCurrencies', NULL),
(8, 'shop', 'ShopAdminCustomfields', NULL),
(9, 'shop', 'ShopAdminDashboard', NULL),
(10, 'shop', 'ShopAdminDeliverymethods', NULL),
(11, 'shop', 'ShopAdminDiscounts', NULL),
(12, 'shop', 'ShopAdminGifts', NULL),
(13, 'shop', 'ShopAdminKits', NULL),
(14, 'shop', 'ShopAdminNotifications', NULL),
(15, 'shop', 'ShopAdminNotificationstatuses', NULL),
(16, 'shop', 'ShopAdminOrders', NULL),
(17, 'shop', 'ShopAdminOrderstatuses', NULL),
(18, 'shop', 'ShopAdminPaymentmethods', NULL),
(19, 'shop', 'ShopAdminProducts', NULL),
(20, 'shop', 'ShopAdminProductspy', NULL),
(21, 'shop', 'ShopAdminProperties', NULL),
(22, 'shop', 'ShopAdminRbac', NULL),
(23, 'shop', 'ShopAdminSearch', NULL),
(24, 'shop', 'ShopAdminSettings', NULL),
(25, 'shop', 'ShopAdminSystem', NULL),
(26, 'shop', 'ShopAdminUsers', NULL),
(27, 'shop', 'ShopAdminWarehouses', NULL),
(28, 'base', 'Admin', NULL),
(29, 'base', 'Admin_logs', NULL),
(30, 'base', 'Admin_search', NULL),
(31, 'base', 'Backup', NULL),
(32, 'base', 'Cache_all', NULL),
(33, 'base', 'Categories', NULL),
(34, 'base', 'Components', NULL),
(35, 'base', 'Dashboard', NULL),
(36, 'base', 'Languages', NULL),
(37, 'base', 'Login', NULL),
(39, 'base', 'Pages', NULL),
(40, 'base', 'Rbac', NULL),
(41, 'base', 'Settings', NULL),
(43, 'module', 'Cfcm', NULL),
(44, 'module', 'Comments', NULL),
(45, 'module', 'Feedback', NULL),
(46, 'module', 'Gallery', NULL),
(47, 'module', 'Group_mailer', NULL),
(48, 'module', 'Mailer', NULL),
(49, 'module', 'Menu', NULL),
(50, 'module', 'Rss', NULL),
(51, 'module', 'Sample_mail', NULL),
(52, 'module', 'Sample_module', NULL),
(53, 'module', 'Share', NULL),
(54, 'module', 'Sitemap', NULL),
(55, 'module', 'Social_servises', NULL),
(56, 'module', 'Template_editor', NULL),
(57, 'module', 'Trash', NULL),
(58, 'module', 'User_manager', NULL),
(59, 'base', 'Widgets_manager', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_group_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_group_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_group_i18n` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  KEY `id_idx` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_rbac_group_i18n`
--

INSERT INTO `shop_rbac_group_i18n` (`id`, `description`, `locale`) VALUES
(1, 'Управление баннерами', 'ru'),
(2, 'Управление брендами', 'ru'),
(3, 'Управление колбеками', 'ru'),
(4, 'Управление категориями товаров в магазине', 'ru'),
(5, 'Управление статистикой', 'ru'),
(6, 'Управление накопительными скидками', 'ru'),
(7, 'Управление валютами', 'ru'),
(8, 'Управление дополнительными полями для магазина', 'ru'),
(9, 'Главная страница панели управления магазином', 'ru'),
(10, 'Управление способами доставки', 'ru'),
(11, 'Управление скидками', 'ru'),
(12, 'Управление подарочными сертификатами', 'ru'),
(13, 'Управление наборами товаров', 'ru'),
(14, 'Управление уведомлениями', 'ru'),
(15, 'Управление статусами уведомлений', 'ru'),
(16, 'Управление заказами', 'ru'),
(17, 'Управление статусами заказов', 'ru'),
(18, 'Управление методами оплаты', 'ru'),
(19, 'Управление товарами', 'ru'),
(20, 'Управление слежением за товарами', 'ru'),
(21, 'Управление свойствами товаров', 'ru'),
(23, 'Управление поиском', 'ru'),
(24, 'Управление настройками магазина', 'ru'),
(25, 'Управление системой магазина (импорт\\экспорт)', 'ru'),
(26, 'Управление юзерами магазина', 'ru'),
(27, 'Управление складами', 'ru'),
(28, 'Доступ к админпанели', 'ru'),
(29, 'История событий', 'ru'),
(30, 'Управление поиском в базовой админ панели', 'ru'),
(31, 'Управление бекапами', 'ru'),
(32, 'Управление кэшем', 'ru'),
(33, 'Управление категориями сайта', 'ru'),
(34, 'Управление компонентами сайта', 'ru'),
(35, 'Управление главной станицой базовой админ панели', 'ru'),
(36, 'Управление языками', 'ru'),
(37, 'Вход в админпанель', 'ru'),
(38, 'Поиск модулей для установки', 'ru'),
(39, 'Управление страницами', 'ru'),
(40, 'Управление правами доступа', 'ru'),
(41, 'Управление базовыми настройками', 'ru'),
(42, 'Управление обновлением системы', 'ru'),
(43, 'Управление констуктором полей', 'ru'),
(44, 'Управление комментариями', 'ru'),
(45, 'Управление обратной связью', 'ru'),
(46, 'Управление галереей', 'ru'),
(47, 'Управление модулем рассылки', 'ru'),
(48, 'Управление модулем подписки и рассылки', 'ru'),
(49, 'Управление меню', 'ru'),
(50, 'Управление модулем RSS', 'ru'),
(51, 'Управление шаблонами писем', 'ru'),
(52, 'Шаблон модуля', 'ru'),
(53, 'Управление модулем кнопок соцсетей', 'ru'),
(54, 'Управление модулем карта сайта', 'ru'),
(55, 'Управление модулем интеграции с соцсетями', 'ru'),
(56, 'Управление модулем редактор шаблонов', 'ru'),
(57, 'Управление модулем перенаправления', 'ru'),
(58, 'Управление пользователями', 'ru'),
(59, 'Управление виджетами', 'ru');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_privileges`
--

DROP TABLE IF EXISTS `shop_rbac_privileges`;
CREATE TABLE IF NOT EXISTS `shop_rbac_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_rbac_privileges_I_1` (`name`),
  KEY `shop_rbac_privileges_FI_1` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=485 ;

--
-- Дамп даних таблиці `shop_rbac_privileges`
--

INSERT INTO `shop_rbac_privileges` (`id`, `name`, `group_id`, `description`) VALUES
(1, 'ShopAdminBanners::index', 1, NULL),
(2, 'ShopAdminBanners::create', 1, NULL),
(3, 'ShopAdminBanners::edit', 1, NULL),
(4, 'ShopAdminBanners::deleteAll', 1, NULL),
(5, 'ShopAdminBanners::translate', 1, NULL),
(6, 'ShopAdminBanners::changeActive', 1, NULL),
(7, 'ShopAdminBrands::index', 2, NULL),
(8, 'ShopAdminBrands::create', 2, NULL),
(9, 'ShopAdminBrands::edit', 2, NULL),
(10, 'ShopAdminBrands::delete', 2, NULL),
(11, 'ShopAdminBrands::c_list', 2, NULL),
(12, 'ShopAdminBrands::translate', 2, NULL),
(13, 'ShopAdminCallbacks::index', 3, NULL),
(14, 'ShopAdminCallbacks::update', 3, NULL),
(15, 'ShopAdminCallbacks::statuses', 3, NULL),
(16, 'ShopAdminCallbacks::createStatus', 3, NULL),
(17, 'ShopAdminCallbacks::updateStatus', 3, NULL),
(18, 'ShopAdminCallbacks::setDefaultStatus', 3, NULL),
(19, 'ShopAdminCallbacks::changeStatus', 3, NULL),
(20, 'ShopAdminCallbacks::reorderThemes', 3, NULL),
(21, 'ShopAdminCallbacks::changeTheme', 3, NULL),
(22, 'ShopAdminCallbacks::deleteCallback', 3, NULL),
(23, 'ShopAdminCallbacks::deleteStatus', 3, NULL),
(24, 'ShopAdminCallbacks::themes', 3, NULL),
(25, 'ShopAdminCallbacks::createTheme', 3, NULL),
(26, 'ShopAdminCallbacks::updateTheme', 3, NULL),
(27, 'ShopAdminCallbacks::deleteTheme', 3, NULL),
(28, 'ShopAdminCallbacks::search', 3, NULL),
(29, 'ShopAdminCategories::index', 4, NULL),
(30, 'ShopAdminCategories::create', 4, NULL),
(31, 'ShopAdminCategories::edit', 4, NULL),
(32, 'ShopAdminCategories::delete', 4, NULL),
(33, 'ShopAdminCategories::c_list', 4, NULL),
(34, 'ShopAdminCategories::save_positions', 4, NULL),
(35, 'ShopAdminCategories::ajax_translit', 4, NULL),
(36, 'ShopAdminCategories::translate', 4, NULL),
(37, 'ShopAdminCategories::changeActive', 4, NULL),
(38, 'ShopAdminCategories::create_tpl', 4, NULL),
(39, 'ShopAdminCategories::get_tpl_names', 4, NULL),
(40, 'ShopAdminCharts::orders', 5, NULL),
(41, 'ShopAdminCharts::byDate', 5, NULL),
(42, 'ShopAdminCharts::_createDatesDropDown', 5, NULL),
(43, 'ShopAdminComulativ::index', 6, NULL),
(44, 'ShopAdminComulativ::create', 6, NULL),
(45, 'ShopAdminComulativ::edit', 6, NULL),
(46, 'ShopAdminComulativ::allUsers', 6, NULL),
(47, 'ShopAdminComulativ::user', 6, NULL),
(48, 'ShopAdminComulativ::deleteAll', 6, NULL),
(49, 'ShopAdminComulativ::change_comulativ_dis_status', 6, NULL),
(50, 'ShopAdminCurrencies::index', 7, NULL),
(51, 'ShopAdminCurrencies::create', 7, NULL),
(52, 'ShopAdminCurrencies::edit', 7, NULL),
(53, 'ShopAdminCurrencies::makeCurrencyDefault', 7, NULL),
(54, 'ShopAdminCurrencies::makeCurrencyMain', 7, NULL),
(55, 'ShopAdminCurrencies::delete', 7, NULL),
(56, 'ShopAdminCurrencies::recount', 7, NULL),
(57, 'ShopAdminCurrencies::checkPrices', 7, NULL),
(58, 'ShopAdminCustomfields::index', 8, NULL),
(59, 'ShopAdminCustomfields::create', 8, NULL),
(60, 'ShopAdminCustomfields::edit', 8, NULL),
(61, 'ShopAdminCustomfields::deleteAll', 8, NULL),
(62, 'ShopAdminCustomfields::change_status_activ', 8, NULL),
(63, 'ShopAdminCustomfields::change_status_private', 8, NULL),
(64, 'ShopAdminCustomfields::change_status_required', 8, NULL),
(65, 'ShopAdminDashboard::index', 9, NULL),
(66, 'ShopAdminDeliverymethods::index', 10, NULL),
(67, 'ShopAdminDeliverymethods::create', 10, NULL),
(68, 'ShopAdminDeliverymethods::change_delivery_status', 10, NULL),
(69, 'ShopAdminDeliverymethods::edit', 10, NULL),
(70, 'ShopAdminDeliverymethods::deleteAll', 10, NULL),
(71, 'ShopAdminDeliverymethods::c_list', 10, NULL),
(72, 'ShopAdminDiscounts::index', 11, NULL),
(73, 'ShopAdminDiscounts::create', 11, NULL),
(74, 'ShopAdminDiscounts::change_discount_status', 11, NULL),
(75, 'ShopAdminDiscounts::edit', 11, NULL),
(76, 'ShopAdminDiscounts::deleteAll', 11, NULL),
(77, 'ShopAdminGifts::index', 12, NULL),
(78, 'ShopAdminGifts::create', 12, NULL),
(79, 'ShopAdminGifts::generateKey', 12, NULL),
(80, 'ShopAdminGifts::delete', 12, NULL),
(81, 'ShopAdminGifts::edit', 12, NULL),
(82, 'ShopAdminGifts::ChangeActive', 12, NULL),
(83, 'ShopAdminGifts::settings', 12, NULL),
(84, 'ShopAdminGifts::save_settings', 12, NULL),
(85, 'ShopAdminKits::index', 13, NULL),
(86, 'ShopAdminKits::kit_create', 13, NULL),
(87, 'ShopAdminKits::kit_edit', 13, NULL),
(88, 'ShopAdminKits::kit_save_positions', 13, NULL),
(89, 'ShopAdminKits::kit_change_active', 13, NULL),
(90, 'ShopAdminKits::kit_list', 13, NULL),
(91, 'ShopAdminKits::kit_delete', 13, NULL),
(92, 'ShopAdminKits::get_products_list', 13, NULL),
(93, 'ShopAdminNotifications::index', 14, NULL),
(94, 'ShopAdminNotifications::edit', 14, NULL),
(95, 'ShopAdminNotifications::changeStatus', 14, NULL),
(96, 'ShopAdminNotifications::notifyByEmail', 14, NULL),
(97, 'ShopAdminNotifications::deleteAll', 14, NULL),
(98, 'ShopAdminNotifications::ajaxDeleteNotifications', 14, NULL),
(99, 'ShopAdminNotifications::ajaxChangeNotificationsStatus', 14, NULL),
(100, 'ShopAdminNotifications::search', 14, NULL),
(101, 'ShopAdminNotifications::getAvailableNotification', 14, NULL),
(102, 'ShopAdminNotificationstatuses::index', 15, NULL),
(103, 'ShopAdminNotificationstatuses::create', 15, NULL),
(104, 'ShopAdminNotificationstatuses::edit', 15, NULL),
(105, 'ShopAdminNotificationstatuses::deleteAll', 15, NULL),
(106, 'ShopAdminNotificationstatuses::savePositions', 15, NULL),
(107, 'ShopAdminOrders::index', 16, NULL),
(108, 'ShopAdminOrders::edit', 16, NULL),
(109, 'ShopAdminOrders::changeStatus', 16, NULL),
(110, 'ShopAdminOrders::changePaid', 16, NULL),
(111, 'ShopAdminOrders::delete', 16, NULL),
(112, 'ShopAdminOrders::ajaxDeleteOrders', 16, NULL),
(113, 'ShopAdminOrders::ajaxChangeOrdersStatus', 16, NULL),
(114, 'ShopAdminOrders::ajaxChangeOrdersPaid', 16, NULL),
(115, 'ShopAdminOrders::ajaxEditWindow', 16, NULL),
(116, 'ShopAdminOrders::editKit', 16, NULL),
(117, 'ShopAdminOrders::ajaxEditAddToCartWindow', 16, NULL),
(118, 'ShopAdminOrders::ajaxDeleteProduct', 16, NULL),
(119, 'ShopAdminOrders::ajaxGetProductList', 16, NULL),
(120, 'ShopAdminOrders::ajaxEditOrderCart', 16, NULL),
(121, 'ShopAdminOrders::ajaxEditOrderAddToCart', 16, NULL),
(122, 'ShopAdminOrders::ajaxGetOrderCart', 16, NULL),
(123, 'ShopAdminOrders::search', 16, NULL),
(124, 'ShopAdminOrders::printChecks', 16, NULL),
(125, 'ShopAdminOrders::createPDFPage', 16, NULL),
(126, 'ShopAdminOrders::createPdf', 16, NULL),
(127, 'ShopAdminOrders::create', 16, NULL),
(128, 'ShopAdminOrderstatuses::index', 17, NULL),
(129, 'ShopAdminOrderstatuses::create', 17, NULL),
(130, 'ShopAdminOrderstatuses::edit', 17, NULL),
(131, 'ShopAdminOrderstatuses::delete', 17, NULL),
(132, 'ShopAdminOrderstatuses::ajaxDeleteWindow', 17, NULL),
(133, 'ShopAdminOrderstatuses::savePositions', 17, NULL),
(134, 'ShopAdminPaymentmethods::index', 18, NULL),
(135, 'ShopAdminPaymentmethods::create', 18, NULL),
(136, 'ShopAdminPaymentmethods::change_payment_status', 18, NULL),
(137, 'ShopAdminPaymentmethods::edit', 18, NULL),
(138, 'ShopAdminPaymentmethods::deleteAll', 18, NULL),
(139, 'ShopAdminPaymentmethods::savePositions', 18, NULL),
(140, 'ShopAdminPaymentmethods::getAdminForm', 18, NULL),
(141, 'ShopAdminProducts::index', 19, NULL),
(142, 'ShopAdminProducts::create', 19, NULL),
(143, 'ShopAdminProducts::edit', 19, NULL),
(144, 'ShopAdminProducts::saveAdditionalImages', 19, NULL),
(145, 'ShopAdminProducts::delete', 19, NULL),
(146, 'ShopAdminProducts::processImage', 19, NULL),
(147, 'ShopAdminProducts::deleteAddImage', 19, NULL),
(148, 'ShopAdminProducts::ajaxChangeActive', 19, NULL),
(149, 'ShopAdminProducts::ajaxChangeHit', 19, NULL),
(150, 'ShopAdminProducts::ajaxChangeHot', 19, NULL),
(151, 'ShopAdminProducts::ajaxChangeAction', 19, NULL),
(152, 'ShopAdminProducts::ajaxUpdatePrice', 19, NULL),
(153, 'ShopAdminProducts::ajaxCloneProducts', 19, NULL),
(154, 'ShopAdminProducts::ajaxDeleteProducts', 19, NULL),
(155, 'ShopAdminProducts::ajaxMoveWindow', 19, NULL),
(156, 'ShopAdminProducts::ajaxMoveProducts', 19, NULL),
(157, 'ShopAdminProducts::translate', 19, NULL),
(158, 'ShopAdminProducts::get_ids', 19, NULL),
(159, 'ShopAdminProducts::prev_next', 19, NULL),
(160, 'ShopAdminProductspy::index', 20, NULL),
(161, 'ShopAdminProductspy::delete', 20, NULL),
(162, 'ShopAdminProductspy::settings', 20, NULL),
(163, 'ShopAdminProperties::index', 21, NULL),
(164, 'ShopAdminProperties::create', 21, NULL),
(165, 'ShopAdminProperties::edit', 21, NULL),
(166, 'ShopAdminProperties::renderForm', 21, NULL),
(167, 'ShopAdminProperties::save_positions', 21, NULL),
(168, 'ShopAdminProperties::delete', 21, NULL),
(169, 'ShopAdminProperties::changeActive', 21, NULL),
(184, 'ShopAdminSearch::index', 23, NULL),
(185, 'ShopAdminSearch::save_positions_variant', 23, NULL),
(186, 'ShopAdminSearch::autocomplete', 23, NULL),
(187, 'ShopAdminSearch::advanced', 23, NULL),
(188, 'ShopAdminSearch::renderCustomFields', 23, NULL),
(189, 'ShopAdminSettings::index', 24, NULL),
(190, 'ShopAdminSettings::update', 24, NULL),
(191, 'ShopAdminSettings::get_fsettings', 24, NULL),
(192, 'ShopAdminSettings::get_vsettings', 24, NULL),
(193, 'ShopAdminSettings::_get_templates', 24, NULL),
(194, 'ShopAdminSettings::_load_settings', 24, NULL),
(195, 'ShopAdminSettings::runResize', 24, NULL),
(196, 'ShopAdminSystem::import', 25, NULL),
(197, 'ShopAdminSystem::export', 25, NULL),
(198, 'ShopAdminSystem::getAttributes', 25, NULL),
(199, 'ShopAdminSystem::exportUsers', 25, NULL),
(200, 'ShopAdminUsers::index', 26, NULL),
(201, 'ShopAdminUsers::search', 26, NULL),
(202, 'ShopAdminUsers::create', 26, NULL),
(203, 'ShopAdminUsers::edit', 26, NULL),
(204, 'ShopAdminUsers::deleteAll', 26, NULL),
(205, 'ShopAdminUsers::auto_complite', 26, NULL),
(206, 'ShopAdminWarehouses::index', 27, NULL),
(207, 'ShopAdminWarehouses::create', 27, NULL),
(208, 'ShopAdminWarehouses::edit', 27, NULL),
(209, 'ShopAdminWarehouses::deleteAll', 27, NULL),
(210, 'Admin::__construct', 28, NULL),
(211, 'Admin::init', 28, NULL),
(212, 'Admin::index', 28, NULL),
(213, 'Admin::sys_info', 28, NULL),
(214, 'Admin::delete_cache', 28, NULL),
(215, 'Admin::elfinder_init', 28, NULL),
(216, 'Admin::get_csrf', 28, NULL),
(217, 'Admin::sidebar_cats', 28, NULL),
(218, 'Admin::logout', 28, NULL),
(219, 'Admin::report_bug', 28, NULL),
(220, 'Admin_logs::__construct', 29, NULL),
(221, 'Admin_logs::index', 29, NULL),
(222, 'Admin_search::__construct', 30, NULL),
(223, 'Admin_search::index', 30, NULL),
(224, 'Admin_search::advanced_search', 30, NULL),
(225, 'Admin_search::do_advanced_search', 30, NULL),
(226, 'Admin_search::validate_advanced_search', 30, NULL),
(227, 'Admin_search::form_from_group', 30, NULL),
(228, 'Admin_search::_filter_pages', 30, NULL),
(229, 'Admin_search::autocomplete', 30, NULL),
(230, 'Backup::__construct', 31, NULL),
(231, 'Backup::index', 31, NULL),
(232, 'Backup::create', 31, NULL),
(233, 'Backup::force_download', 31, NULL),
(234, 'Cache_all::__construct', 32, NULL),
(235, 'Cache_all::index', 32, NULL),
(236, 'Categories::__construct', 33, NULL),
(237, 'Categories::index', 33, NULL),
(238, 'Categories::create_form', 33, NULL),
(239, 'Categories::update_block', 33, NULL),
(240, 'Categories::save_positions', 33, NULL),
(241, 'Categories::cat_list', 33, NULL),
(242, 'Categories::sub_cats', 33, NULL),
(243, 'Categories::create', 33, NULL),
(244, 'Categories::update_urls', 33, NULL),
(245, 'Categories::category_exists', 33, NULL),
(246, 'Categories::fast_add', 33, NULL),
(247, 'Categories::update_fast_block', 33, NULL),
(248, 'Categories::edit', 33, NULL),
(249, 'Categories::translate', 33, NULL),
(250, 'Categories::delete', 33, NULL),
(251, 'Categories::_get_sub_cats', 33, NULL),
(252, 'Categories::get_comments_status', 33, NULL),
(253, 'Components::__construct', 34, NULL),
(254, 'Components::index', 34, NULL),
(255, 'Components::modules_table', 34, NULL),
(256, 'Components::is_installed', 34, NULL),
(257, 'Components::install', 34, NULL),
(258, 'Components::deinstall', 34, NULL),
(259, 'Components::find_components', 34, NULL),
(260, 'Components::component_settings', 34, NULL),
(261, 'Components::save_settings', 34, NULL),
(262, 'Components::init_window', 34, NULL),
(263, 'Components::cp', 34, NULL),
(264, 'Components::run', 34, NULL),
(265, 'Components::com_info', 34, NULL),
(266, 'Components::get_module_info', 34, NULL),
(267, 'Components::change_autoload', 34, NULL),
(268, 'Components::change_url_access', 34, NULL),
(269, 'Components::save_components_positions', 34, NULL),
(270, 'Components::change_show_in_menu', 34, NULL),
(271, 'Dashboard::__construct', 35, NULL),
(272, 'Dashboard::index', 35, NULL),
(273, 'Languages::__construct', 36, NULL),
(274, 'Languages::index', 36, NULL),
(275, 'Languages::create_form', 36, NULL),
(276, 'Languages::insert', 36, NULL),
(277, 'Languages::edit', 36, NULL),
(278, 'Languages::update', 36, NULL),
(279, 'Languages::delete', 36, NULL),
(280, 'Languages::set_default', 36, NULL),
(281, 'Login::__construct', 37, NULL),
(282, 'Login::index', 37, NULL),
(283, 'Login::user_browser', 37, NULL),
(284, 'Login::do_login', 37, NULL),
(285, 'Login::forgot_password', 37, NULL),
(286, 'Login::update_captcha', 37, NULL),
(287, 'Login::captcha_check', 37, NULL),
(288, 'Mod_search::__construct', 38, NULL),
(289, 'Mod_search::index', 38, NULL),
(290, 'Mod_search::category', 38, NULL),
(291, 'Mod_search::display_install_window', 38, NULL),
(292, 'Mod_search::connect_ftp', 38, NULL),
(293, 'Pages::__construct', 39, NULL),
(294, 'Pages::index', 39, NULL),
(295, 'Pages::add', 39, NULL),
(296, 'Pages::_set_page_roles', 39, NULL),
(297, 'Pages::edit', 39, NULL),
(298, 'Pages::update', 39, NULL),
(299, 'Pages::delete', 39, NULL),
(300, 'Pages::ajax_translit', 39, NULL),
(301, 'Pages::save_positions', 39, NULL),
(302, 'Pages::delete_pages', 39, NULL),
(303, 'Pages::move_pages', 39, NULL),
(304, 'Pages::show_move_window', 39, NULL),
(305, 'Pages::json_tags', 39, NULL),
(306, 'Pages::ajax_create_keywords', 39, NULL),
(307, 'Pages::ajax_create_description', 39, NULL),
(308, 'Pages::ajax_change_status', 39, NULL),
(309, 'Pages::GetPagesByCategory', 39, NULL),
(310, 'Rbac::__construct', 40, NULL),
(311, 'Settings::__construct', 41, NULL),
(312, 'Settings::index', 41, NULL),
(313, 'Settings::main_page', 41, NULL),
(314, 'Settings::_get_templates', 41, NULL),
(315, 'Settings::save', 41, NULL),
(316, 'Settings::switch_admin_lang', 41, NULL),
(317, 'Settings::save_main', 41, NULL),
(318, 'Sys_upgrade::__construct', 42, NULL),
(319, 'Sys_upgrade::index', 42, NULL),
(320, 'Sys_upgrade::make_upgrade', 42, NULL),
(321, 'Sys_upgrade::_check_status', 42, NULL),
(322, 'cfcm::__construct', 43, NULL),
(323, 'cfcm::_set_forms_config', 43, NULL),
(324, 'cfcm::index', 43, NULL),
(325, 'cfcm::create_field', 43, NULL),
(326, 'cfcm::edit_field_data_type', 43, NULL),
(327, 'cfcm::delete_field', 43, NULL),
(328, 'cfcm::edit_field', 43, NULL),
(329, 'cfcm::create_group', 43, NULL),
(330, 'cfcm::edit_group', 43, NULL),
(331, 'cfcm::delete_group', 43, NULL),
(332, 'cfcm::form_from_category_group', 43, NULL),
(333, 'cfcm::get_form_attributes', 43, NULL),
(334, 'cfcm::save_weight', 43, NULL),
(335, 'cfcm::render', 43, NULL),
(336, 'cfcm::get_url', 43, NULL),
(337, 'cfcm::get_form', 43, NULL),
(338, 'comments::__construct', 44, NULL),
(339, 'comments::index', 44, NULL),
(340, 'comments::proccess_child_comments', 44, NULL),
(341, 'comments::render', 44, NULL),
(342, 'comments::edit', 44, NULL),
(343, 'comments::update', 44, NULL),
(344, 'comments::update_status', 44, NULL),
(345, 'comments::delete', 44, NULL),
(346, 'comments::delete_many', 44, NULL),
(347, 'comments::show_settings', 44, NULL),
(348, 'comments::update_settings', 44, NULL),
(349, 'feedback::__construct', 45, NULL),
(350, 'feedback::index', 45, NULL),
(351, 'feedback::settings', 45, NULL),
(352, 'gallery::__construct', 46, NULL),
(353, 'gallery::index', 46, NULL),
(354, 'gallery::category', 46, NULL),
(355, 'gallery::settings', 46, NULL),
(356, 'gallery::create_album', 46, NULL),
(357, 'gallery::update_album', 46, NULL),
(358, 'gallery::edit_album_params', 46, NULL),
(359, 'gallery::delete_album', 46, NULL),
(360, 'gallery::show_crate_album', 46, NULL),
(361, 'gallery::edit_album', 46, NULL),
(362, 'gallery::edit_image', 46, NULL),
(363, 'gallery::rename_image', 46, NULL),
(364, 'gallery::delete_image', 46, NULL),
(365, 'gallery::update_info', 46, NULL),
(366, 'gallery::update_positions', 46, NULL),
(367, 'gallery::update_album_positions', 46, NULL),
(368, 'gallery::update_img_positions', 46, NULL),
(369, 'gallery::show_create_category', 46, NULL),
(370, 'gallery::create_category', 46, NULL),
(371, 'gallery::edit_category', 46, NULL),
(372, 'gallery::update_category', 46, NULL),
(373, 'gallery::delete_category', 46, NULL),
(374, 'gallery::upload_image', 46, NULL),
(375, 'gallery::upload_archive', 46, NULL),
(376, 'group_mailer::__construct', 47, NULL),
(377, 'group_mailer::index', 47, NULL),
(378, 'group_mailer::send_email', 47, NULL),
(379, 'mailer::__construct', 48, NULL),
(380, 'mailer::index', 48, NULL),
(381, 'mailer::send_email', 48, NULL),
(382, 'mailer::delete', 48, NULL),
(383, 'menu::__construct', 49, NULL),
(384, 'menu::index', 49, NULL),
(385, 'menu::menu_item', 49, NULL),
(386, 'menu::list_menu_items', 49, NULL),
(387, 'menu::create_item', 49, NULL),
(388, 'menu::display_selector', 49, NULL),
(389, 'menu::get_name_by_id', 49, NULL),
(390, 'menu::delete_item', 49, NULL),
(391, 'menu::edit_item', 49, NULL),
(392, 'menu::process_root', 49, NULL),
(393, 'menu::insert_menu_item', 49, NULL),
(394, 'menu::save_positions', 49, NULL),
(395, 'menu::create_menu', 49, NULL),
(396, 'menu::edit_menu', 49, NULL),
(397, 'menu::update_menu', 49, NULL),
(398, 'menu::check_menu_data', 49, NULL),
(399, 'menu::delete_menu', 49, NULL),
(400, 'menu::create_tpl', 49, NULL),
(401, 'menu::get_pages', 49, NULL),
(402, 'menu::search_pages', 49, NULL),
(403, 'menu::get_item', 49, NULL),
(404, 'menu::display_tpl', 49, NULL),
(405, 'menu::fetch_tpl', 49, NULL),
(406, 'menu::translate_window', 49, NULL),
(407, 'menu::translate_item', 49, NULL),
(408, 'menu::_get_langs', 49, NULL),
(409, 'menu::render', 49, NULL),
(410, 'menu::change_hidden', 49, NULL),
(411, 'menu::get_children_items', 49, NULL),
(412, 'rss::__construct', 50, NULL),
(413, 'rss::index', 50, NULL),
(414, 'rss::render', 50, NULL),
(415, 'rss::settings_update', 50, NULL),
(416, 'rss::display_tpl', 50, NULL),
(417, 'rss::fetch_tpl', 50, NULL),
(418, 'sample_mail::__construct', 51, NULL),
(419, 'sample_mail::create', 51, NULL),
(420, 'sample_mail::edit', 51, NULL),
(421, 'sample_mail::render', 51, NULL),
(422, 'sample_mail::index', 51, NULL),
(423, 'sample_mail::delete', 51, NULL),
(424, 'sample_module::__construct', 52, NULL),
(425, 'sample_module::index', 52, NULL),
(426, 'share::__construct', 53, NULL),
(427, 'share::index', 53, NULL),
(428, 'share::update_settings', 53, NULL),
(429, 'share::get_settings', 53, NULL),
(430, 'share::render', 53, NULL),
(431, 'sitemap::__construct', 54, NULL),
(432, 'sitemap::index', 54, NULL),
(433, 'sitemap::_load_settings', 54, NULL),
(434, 'sitemap::update_settings', 54, NULL),
(435, 'sitemap::display_tpl', 54, NULL),
(436, 'sitemap::fetch_tpl', 54, NULL),
(437, 'sitemap::render', 54, NULL),
(438, 'social_servises::__construct', 55, NULL),
(439, 'social_servises::index', 55, NULL),
(440, 'social_servises::update_settings', 55, NULL),
(441, 'social_servises::get_fsettings', 55, NULL),
(442, 'social_servises::get_vsettings', 55, NULL),
(443, 'social_servises::_get_templates', 55, NULL),
(444, 'social_servises::render', 55, NULL),
(445, 'template_editor::index', 56, NULL),
(446, 'template_editor::render', 56, NULL),
(447, 'trash::__construct', 57, NULL),
(448, 'trash::index', 57, NULL),
(449, 'trash::create_trash', 57, NULL),
(450, 'trash::edit_trash', 57, NULL),
(451, 'trash::delete_trash', 57, NULL),
(452, 'user_manager::__construct', 58, NULL),
(453, 'user_manager::index', 58, NULL),
(454, 'user_manager::set_tpl_roles', 58, NULL),
(455, 'user_manager::getRolesTable', 58, NULL),
(456, 'user_manager::genre_user_table', 58, NULL),
(457, 'user_manager::auto_complit', 58, NULL),
(458, 'user_manager::create_user', 58, NULL),
(459, 'user_manager::actions', 58, NULL),
(460, 'user_manager::search', 58, NULL),
(461, 'user_manager::edit_user', 58, NULL),
(462, 'user_manager::update_user', 58, NULL),
(463, 'user_manager::groups_index', 58, NULL),
(464, 'user_manager::create', 58, NULL),
(465, 'user_manager::edit', 58, NULL),
(466, 'user_manager::save', 58, NULL),
(467, 'user_manager::delete', 58, NULL),
(468, 'user_manager::deleteAll', 58, NULL),
(469, 'user_manager::update_role_perms', 58, NULL),
(470, 'user_manager::show_edit_prems_tpl', 58, NULL),
(471, 'user_manager::get_permissions_table', 58, NULL),
(472, 'user_manager::get_group_names', 58, NULL),
(473, 'Widgets_manager::__construct', 59, NULL),
(474, 'Widgets_manager::index', 59, NULL),
(475, 'Widgets_manager::create', 59, NULL),
(476, 'Widgets_manager::create_tpl', 59, NULL),
(477, 'Widgets_manager::edit', 59, NULL),
(478, 'Widgets_manager::update_widget', 59, NULL),
(479, 'Widgets_manager::update_config', 59, NULL),
(480, 'Widgets_manager::delete', 59, NULL),
(481, 'Widgets_manager::get', 59, NULL),
(482, 'Widgets_manager::edit_html_widget', 59, NULL),
(483, 'Widgets_manager::edit_module_widget', 59, NULL),
(484, 'Widgets_manager::display_create_tpl', 59, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_privileges_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_privileges_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_privileges_i18n` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `locale` varchar(45) NOT NULL,
  KEY `id_idx` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_rbac_privileges_i18n`
--

INSERT INTO `shop_rbac_privileges_i18n` (`id`, `title`, `description`, `locale`) VALUES
(473, 'Управление виджетами', 'Доступ к управлению виджетами', 'ru'),
(1, 'Список баннеров', 'Доступ к списку баннеров', 'ru'),
(2, 'Создание баннера', 'Доступ к созданию баннера', 'ru'),
(3, 'Редактирование баннера', 'Доступ к редактированию баннера', 'ru'),
(4, 'Удаление баннера', 'Доступ к удалению баннера', 'ru'),
(5, 'Перевод баннера', 'Доступ к переводу баннера', 'ru'),
(6, 'Активность баннера', 'Управление активностью баннера', 'ru'),
(7, 'Список брендов', 'Доступ к списку брендов', 'ru'),
(8, 'Создание бренда', 'Доступ к созданию бренда', 'ru'),
(9, 'Редактирование бренда', 'Доступ к редактированию бренда', 'ru'),
(10, 'Удаление бренда', 'Доступ к удалению бренда', 'ru'),
(11, 'Список брендов', 'Доступ к списку брендов', 'ru'),
(12, 'Перевод бренда', 'Доступ к переводу бренда', 'ru'),
(13, 'Список колбеков', 'Доступ к просмотру колбеков', 'ru'),
(14, 'Редактирование колбека', 'Доступ к редактированию колбеков', 'ru'),
(15, 'Статусы колбеков', 'Просмотр статусов колбеков', 'ru'),
(16, 'Создание статуса колбеков', 'Доступ к созданию статусов колбеков', 'ru'),
(17, 'Редактирование статуса колбека', 'Доступ к редактированию статуса колбека', 'ru'),
(18, 'Установка статуса колбека по-умолчанию', 'Доступ к установке статуса колбека по-умолчанию', 'ru'),
(19, 'Изменение статуса колбека', 'Доступ к изменению статуса колбека', 'ru'),
(20, 'Смена порядка статусов колбеков', 'Доступ к изменению порядка статусов колбеков', 'ru'),
(21, 'Изменение темы колбека', 'Доступ к изменению статуса колбека', 'ru'),
(22, 'Удаление колбека', 'Доступ к удалению колбека', 'ru'),
(23, 'Удаление статуса', 'Доступ к удалению статуса колбека', 'ru'),
(24, 'Просмотр тем колбеков', 'Доступ к просмотру тем колбеков', 'ru'),
(25, 'Создание тем колбеков', 'Доступ к созданию тем колбеков', 'ru'),
(26, 'Редактирование темы колбека', 'Доступ к редактированию темы колбека', 'ru'),
(27, 'Удаление темы колбека', 'Доступ к удалению темы колбека', 'ru'),
(28, 'Поиск колбеков', 'Доступ к поиску колбеков', 'ru'),
(29, 'Просмотр категорий магазина', 'Доступ к просмотру категорий магазина', 'ru'),
(30, 'Создание категории магазина', 'Доступ к созданию категории магазина', 'ru'),
(31, 'Редактирование категории магазина', 'Доступ к редактированию категории магазина', 'ru'),
(32, 'Удаление категории магазина', 'Доступ к удалению категории магазина', 'ru'),
(33, 'Просмотр списка категорий магазина', 'Доступ к просмотру списка категорий магазина', 'ru'),
(34, 'Изменение порядка категорий магазина', 'Доступ к изменению порядка категорий магазина', 'ru'),
(35, 'Транслитерация строки', 'Доступ к транслитерации строки', 'ru'),
(36, 'Перевод категории магазина', 'Доступ к переводу категории магазина', 'ru'),
(37, 'Смена активности категории магазина', 'Доступ к изменению активности категории магазина', 'ru'),
(38, 'Создание шаблона категории', 'Доступ к созданию шаблона категории магазина', 'ru'),
(39, 'Список доступных шаблонов для категорий магаз', 'Доступ к списку доступных шаблонов для категорий магазина', 'ru'),
(40, 'Просмотр статистики заказов', 'Доступ к просмотру статистики заказов', 'ru'),
(41, 'Фильтр заказов по дате', 'Доступ к фильтру заказов по дате', 'ru'),
(42, 'ShopAdminCharts::_createDatesDropDown', '', 'ru'),
(43, 'Просмотр списка накопительных скидок', 'Доступ к просмотру списка накопительных скидок', 'ru'),
(44, 'Создание накопительной скидки', 'Доступ к созданию накопительной скидки', 'ru'),
(45, 'Редактирование накопительной скидки', 'Доступ к редактированию накопительной скидки', 'ru'),
(46, 'Просмотр списка пользовательских скидок', 'Доступ к просмотру списка пользовательских скидок', 'ru'),
(47, 'Просмотр скидки пользователя', 'Доступ к просмотру скидки пользователя', 'ru'),
(48, 'Удаление всех скидок', 'Доступ к удалению всех скидок', 'ru'),
(49, 'Смена статуса скидки', 'Доступ к смене статуса скидки', 'ru'),
(50, 'Просмотр списка валют', 'Доступ к просмотру списка валют', 'ru'),
(51, 'Создание валюты', 'Доступ к созданию валюты', 'ru'),
(52, 'Редактирование валюты', 'Доступ к редактированию валюты', 'ru'),
(53, 'Установка валюты по-умолчанию', 'Доступ к установке валюты по-умолчанию', 'ru'),
(54, 'Установка главной валюты', 'Доступ к установке главной валюты', 'ru'),
(55, 'Удаление валюты', 'Доступ к удалению валюты', 'ru'),
(56, 'Пересчет цен', 'Доступ к пересчету цен', 'ru'),
(57, 'Проверка цен в базе данных', 'Доступ к проверке цен в базе данных и их исправление', 'ru'),
(58, 'Просмотр списка дополнительных полей для мага', 'Доступ к просмотру списка дополнительных полей магазина', 'ru'),
(59, 'Создание дополнительного поля для магазина', 'Доступ к созданию дополнительного поля для магазина', 'ru'),
(60, 'Редактирование дополнительного поля для магаз', 'Доступ к редактированию дополнительного поля для магазина', 'ru'),
(61, 'Удаление всех дополнительных полей для магази', 'Доступ к удалению всех дополнительных полей для магазина', 'ru'),
(62, 'Смена активности дополнительного поля для маг', 'Доступ к смене активности дополнительного поля для магазина', 'ru'),
(63, 'Смена приватности дополнительного полю', 'Доступ к изменению приватности дополнительного поля', 'ru'),
(64, 'Смена необходимости дополнительного поля для ', 'Доступ к изменению необходимости дополнительного поля для магазина', 'ru'),
(65, 'Просмотр дашборда админ панели магазина', 'Доступ к просмотру дашборда админ панели магазина', 'ru'),
(66, 'Просмотр списка способов доставки', 'Доступ к просмотру списка способов доставки', 'ru'),
(67, 'Создание способа доставки', 'Доступ к созданию способа доставки', 'ru'),
(68, 'Смена статуса способа доставки', 'Доступ к смене статуса способа доставки', 'ru'),
(69, 'Редактирование способа доставки', 'Доступ к редактированию способа доставки', 'ru'),
(70, 'Удаление способа доставки', 'Доступ к удалению способа доставки', 'ru'),
(71, 'ShopAdminDeliverymethods::c_list', '', 'ru'),
(72, 'Просмотр списка постоянных скидок', 'Доступ к просмотру списка постоянных скидок', 'ru'),
(73, 'Создание постоянной скидки', 'Доступ к созданию постоянной скидки', 'ru'),
(74, 'Смена статуса постоянной скидки', 'Доступ к смене статуса постоянной скидки', 'ru'),
(75, 'Редактирование постоянной скидки', 'Доступ к редактированию постоянной скидки', 'ru'),
(76, 'Удаление постоянной скидки', 'Доступ к удалению постоянной скидки', 'ru'),
(77, 'Просмотр списка подарочных сертификатов', 'Доступ к просмотру списка подарочных сертификатов', 'ru'),
(78, 'Создание подарочного сертификата', 'Доступ к созданию подарочного сертификата', 'ru'),
(79, 'Создание кода для подарочного сертификата', 'Доступ к соданию кода для подарочного сертификата', 'ru'),
(80, 'Удаление подарочного сертификата', 'Доступ к удалению подарочного сертификата', 'ru'),
(81, 'Редактирование подарочного сертификата', 'Доступ к редактированию подарочного сертификата', 'ru'),
(82, 'Смена активности подарочного сертификата', 'Доступ к смене активности подарочного сертификата', 'ru'),
(83, 'Настройки подарочных сертификатов', 'Доступ к настройкам подарочных сертификатов', 'ru'),
(84, 'Сохранение настроек подарочных сертификатов', 'Доступ к сохранению настроек подарочных сертификатов', 'ru'),
(85, 'Просмотр списка наборов товаров', 'Доступ к просмотру списка наборов товаров', 'ru'),
(86, 'Создание набора товаров', 'Доступ к созданию набора товаров', 'ru'),
(87, 'Редактирование набора товаров', 'Доступ к редактированию набора товаров', 'ru'),
(88, 'Смена порядка наборов товаров', 'Доступ к смене порядка наборо товаров', 'ru'),
(89, 'Смена активности набора товаров', 'Доступ к смене активности набора товаров', 'ru'),
(90, 'ShopAdminKits::kit_list', '', 'ru'),
(91, 'Удаление набора товаров', 'Доступ к удалению набора товаров', 'ru'),
(92, 'Получение списка товаров', 'Доступ к получению списка товаров', 'ru'),
(93, 'Просмотр списка уведовлений', 'Доступ к просмотру списка уведомлений', 'ru'),
(94, 'Редактирование уведомления', 'Доступ к редактированию уведомления', 'ru'),
(95, 'Смена статуса уведомления', 'Доступ к смене статуса уведомления', 'ru'),
(96, 'Уведомление по почте', 'Доступ к уведомлению по почте', 'ru'),
(97, 'Удаление уведомления', 'Доступ к удалению уведомления', 'ru'),
(98, 'Удаление уведомления', 'Доступ к удалению уведомления', 'ru'),
(99, 'Смена статуса уведомления', 'Доступ к смене статуса уведомления', 'ru'),
(100, 'Поиск уведомления', 'Доступ к поиску уведомления', 'ru'),
(101, 'Поиск новых событий', 'Доступ к поиску новых событий', 'ru'),
(102, 'Просмотр статусов уведомлений', 'Доступ к просмотру статусов уведомлений', 'ru'),
(103, 'Создание статуса уведомления', 'Доступ к созданию статуса уведомления', 'ru'),
(104, 'Редактирование статуса уведомления', 'Доступ к редактированию статуса увдеомления', 'ru'),
(105, 'Удаление статуса уведомления', 'Доступ к удалению статуса уведомления', 'ru'),
(106, 'Смена порядка статусов уведомлений', 'Доступ к смене порядка статусов уведомлений', 'ru'),
(107, 'Просмотр списка заказов', 'Доступ к просмотру списка заказов', 'ru'),
(108, 'Редактирование заказа', 'Доступ к редактированию заказа', 'ru'),
(109, 'Смена статуса заказа', 'Доступ к смене статуса заказа', 'ru'),
(110, 'Смена статуса оплаты заказа', 'Доступ к смене  статуса оплаты заказа', 'ru'),
(111, 'Удаление заказа', 'Доступ к удалению статуса заказа', 'ru'),
(112, 'Удаление статуса заказа', 'Доступ к удалению статуса заказа', 'ru'),
(113, 'Смена статусов заказов', 'Доступ к смене статусов заказов', 'ru'),
(114, 'Смена статуса оплаты заказов', 'Доступ к смене статусов оплаты заказов', 'ru'),
(115, 'Отображение окна редактирования', 'Доступ к окну редактирования', 'ru'),
(116, 'Окно редактирования набора товаров', 'Доступ к окну редактирования набора товаров', 'ru'),
(117, 'Окно добавления товара к заказу', 'Доступ к окну добавления товаров к заказу', 'ru'),
(118, 'Удаление товара из заказа', 'Доступ к удалению товара из заказа', 'ru'),
(119, 'Получение списка товаров', 'Доступ к получению списка товаров', 'ru'),
(120, 'Редактирование товара в заказе', 'Доступ к редактированию товара в заказе', 'ru'),
(121, 'Добавление товара к заказу', 'Доступ к добавлению товара к заказу', 'ru'),
(122, 'Получение списка товаров в заказе', 'Доступ к получению списка товаров в заказе', 'ru'),
(123, 'Поиск заказа', 'Доступ к поиску заказа', 'ru'),
(124, 'Создание чеков', 'Доступ созданию чека', 'ru'),
(125, 'Создание pdf чека', 'Доступ созданию pdf чека', 'ru'),
(126, 'Создание чека', 'Доступ к созданию чека', 'ru'),
(127, 'Создание заказа', 'Доступ к созданию заказа', 'ru'),
(128, 'Просмотр списка статусов заказов', 'Доступ к просмотру списка статусов заказов', 'ru'),
(129, 'Создание статуса заказа', 'Доступ к созданию статуса заказа', 'ru'),
(130, 'Редактирование статуса заказа', 'Доступ к редактированию статуса заказа', 'ru'),
(131, 'Удаление статуса заказа', 'Доступ к удалению статуса заказа', 'ru'),
(132, 'Отображение окна удаления', 'Доступ к отображению окна удаления', 'ru'),
(133, 'Смена порядка статусов заказов', 'Доступ к смене порядка статусов заказов', 'ru'),
(134, 'Просмотр списка методов оплаты', 'Доступ к просмотру списка методов оплаты', 'ru'),
(135, 'Создание метода оплаты', 'Доступ к созданию метода оплаты', 'ru'),
(136, 'Смена статуса способа оплаты', 'Доступ к смене статуса способа оплаты', 'ru'),
(137, 'Редактирование способа оплаты', 'Доступ к редактированию способа оплаты', 'ru'),
(138, 'Удаление способа оплаты', 'Доступ к удалению способа оплаты', 'ru'),
(139, 'Смена порядка способов оплаты', 'Доступ к смене порядка способов оплаты', 'ru'),
(140, 'Отображение настроек способа оплаты', 'Доступ к отображению настроек способа оплаты', 'ru'),
(141, 'ShopAdminProducts::index', '', 'ru'),
(142, 'Создание продукта', 'Доступ к созданию продукта', 'ru'),
(143, 'Редактирование товара', 'Доступ к редактированию товара', 'ru'),
(144, 'Сохранение дополнительных изображений', 'Доступ к сохренению дополнительных изображений', 'ru'),
(145, 'Удаление товара', 'Доступ к удалению товара', 'ru'),
(146, 'Обработка изображений', 'Доступ к обработке изображений', 'ru'),
(147, 'Удаление дополнительных изображений', 'Доступ к удалению дополнительных изображений', 'ru'),
(148, 'Смена активности товара', 'Доступ к смене активности товара', 'ru'),
(149, 'Смена пункта "Хит" для товара', 'Доступ к смене пункта "Хит" для товара', 'ru'),
(150, 'Смена пункта "Новинка" для товара', 'Доступ к смене пункта "Новинка" для товара', 'ru'),
(151, 'Смена пункта "Акция" для товара', 'Доступ к смене пункта "Акция" для товара', 'ru'),
(152, 'Обновление цены', 'Доступ к обновлению цены товара', 'ru'),
(153, 'Копирование товаров', 'Доступ к копированию товаров', 'ru'),
(154, 'Удаление товаров', 'Доступ к удалению товаров', 'ru'),
(155, 'Просмотр окна перемещения товаров', 'Доступ к окну перемещения товаров', 'ru'),
(156, 'Перемещение товаров', 'Доступ к перемещению товаров', 'ru'),
(157, 'Перевод товара', 'Доступ к переводу товара', 'ru'),
(158, 'Получение списка id товаров', 'Доступ к получению списка id товаров', 'ru'),
(159, 'Переключение товаров', 'Доступ к переключению товаров', 'ru'),
(160, 'Просмотр списка слежения', 'Доступ к просмотру списка слежения', 'ru'),
(161, 'Удаления слежения', 'Доступ к удалению слежения', 'ru'),
(162, 'Настройки слежения за товарами', 'Доступ к настройкам слежения за товаром', 'ru'),
(163, 'Просмотр списка свойств', 'Доступ к просмотру списка свойств', 'ru'),
(164, 'Создание свойства товара', 'Доступ к созданию свойства товара', 'ru'),
(165, 'Редактирование свойства товара', 'Доступ к редактированию свойства товара', 'ru'),
(166, 'ShopAdminProperties::renderForm', '', 'ru'),
(167, 'Смена порядка свойств', 'Доступ к смене порядка свойств', 'ru'),
(168, 'Удаление свойств', 'Доступ к удалению свойств', 'ru'),
(169, 'Смена активности свойства', 'Доступ к смене активности свойства', 'ru'),
(180, 'ShopAdminRbac::group_create', '', 'ru'),
(181, 'ShopAdminRbac::group_edit', '', 'ru'),
(182, 'ShopAdminRbac::group_list', '', 'ru'),
(183, 'ShopAdminRbac::group_delete', '', 'ru'),
(184, 'Просмотр списка товаров', 'Доступ к просмотру списка товаров', 'ru'),
(185, 'Смена порядка вариантов товаров', 'Доступ к смене порядка вариантов товаров', 'ru'),
(186, 'Автодополнение к поиску', 'Доступ к автодополнению к поиску', 'ru'),
(187, 'Продвинутый поиск', 'Доступ к продвинутому поиску', 'ru'),
(188, 'ShopAdminSearch::renderCustomFields', '', 'ru'),
(189, 'Свойства магазина', 'Доступ к свойствам магазина', 'ru'),
(190, 'Изменение свойств магазина', 'Доступ к изменению свойств магазина', 'ru'),
(191, 'Получение настроек для интеграции с фейсбуком', 'Доступ к настройкам интеграции с фейсбуком', 'ru'),
(192, 'Получение настроек интеграции с вк', 'Доступ к настройкам интеграции с вк', 'ru'),
(193, 'Получение списка шаблонов', 'Доступ к получению списка шаблонов', 'ru'),
(194, 'Загрузка настроек', 'Доступ к загрузке настроек', 'ru'),
(195, 'Запуск ресайза изображений', 'Доступ к запуску ресайза изображений', 'ru'),
(196, 'Импорт товаров', 'Доступ к импорту товаров', 'ru'),
(197, 'Экспорт товаров', 'Доступ к экспорту товаров', 'ru'),
(198, 'Получение атрибутов', 'Доступ к получению атрибутов', 'ru'),
(199, 'Экспорт пользователей', 'Доступ к экспорту пользователей', 'ru'),
(200, 'Просмотр списка пользователей', 'Доступ к просмотру списка пользователей', 'ru'),
(201, 'Поиск пользователей', 'Доступ к поиску пользователей', 'ru'),
(202, 'Создание пользователя', 'Доступ к созданию пользователя', 'ru'),
(203, 'Редактирование пользователя', 'Доступ к редактированию пользователя', 'ru'),
(204, 'Удаление пользователя', 'Доступ к удалению пользователя', 'ru'),
(205, 'Автодополнение списка пользователей', 'Достпу к автодополнению списка пользователей', 'ru'),
(206, 'Просмотр списка складов', 'Доступ к просмотру списка складов', 'ru'),
(207, 'Создание склада', 'Доступ к созданию склада', 'ru'),
(208, 'Редактирование склада', 'Доступ к редактированию склада', 'ru'),
(209, 'Удаление склада', 'Доступ к удалению склада', 'ru'),
(210, 'Доступ к админпанели', 'Доступ к админпанели', 'ru'),
(211, 'Инициализация настроек', 'Доступ к инициализации настроек', 'ru'),
(212, 'Просмотр дашборда базовой админки', 'Доступ к просмотру дашборда базовой админки', 'ru'),
(213, 'Просмотр информации о системе', 'Доступ к просмотру информации о системе', 'ru'),
(214, 'Очистка кеша', 'Доступ к очистке кеша', 'ru'),
(215, 'Инициализация elfinder', 'Доступ к инициализации elfinder', 'ru'),
(216, 'Получение защитного токена', 'Доступ к получению токена', 'ru'),
(217, 'Admin::sidebar_cats', '', 'ru'),
(218, 'Выход с админки', 'Доступ к выходу с админки', 'ru'),
(219, 'Сообщить о ошибке', 'Доступ к сообщению о ошибке', 'ru'),
(220, 'История событий', 'Доступ к истории событий', 'ru'),
(221, 'Просмотр истории событий', 'Доступ к просмотру истории событий', 'ru'),
(222, 'Поиск в базовой версии', 'Доступ к поиску в базовой версии', 'ru'),
(223, 'Admin_search::index', '', 'ru'),
(224, 'Продвинутый поиск в базовой версии', 'Доступ к продвинутому поиску в базовой версии', 'ru'),
(225, 'Произвести поиск в базовой версии', 'Произвести поиск в базовой версии', 'ru'),
(226, 'Валидация поиска в базовой версии', 'Доступ к валидации поиска в базовой версии', 'ru'),
(227, 'Admin_search::form_from_group', '', 'ru'),
(228, 'Фильтрация страниц', 'Доступ к фильтрации страниц', 'ru'),
(229, 'Автодополнение поиска', 'Доступ к автодополнению поиска', 'ru'),
(230, 'Управление бекапами', 'Доступ к управлению бекапами', 'ru'),
(231, 'Подготовка резервного копирования', 'Доступ к подготовке резервного копирования', 'ru'),
(232, 'Создание бекапа', 'Доступ к созданию бекапа', 'ru'),
(233, 'Закачка резервной копии', 'Доступ к созданию резервной копии', 'ru'),
(234, 'Управление кешем', 'Достпу к управлению кешем', 'ru'),
(235, 'Управление кешем', 'Доступ к управлению кешем', 'ru'),
(236, 'Управление категориями сайта', 'Доступ к управлению категориями сайта', 'ru'),
(237, 'Просмотр списка категорий сайта', 'Доступ к просмотру списка категорий сайта', 'ru'),
(238, 'Отображение формы создания категории', 'Доступ к отображению формы создания категории', 'ru'),
(239, 'Обноление категории', 'Доступ к обновлению категорий', 'ru'),
(240, 'Смена порядка категорий сайта', 'Доступ к смене порядка категорий сайта', 'ru'),
(241, 'Просмотр списка категорий сайта', 'Доступ к просмотру списка категорий сайта', 'ru'),
(242, 'Подкатегории', 'Доступ к подкатегориям', 'ru'),
(243, 'Создание категории сайта', 'Доступ к категории сайта', 'ru'),
(244, 'Обновление урлов', 'Доступ к обновлению урлов', 'ru'),
(245, 'Проверка сушествования категории сайта', 'Доступ к проверке сушествования категории сайта', 'ru'),
(246, 'Быстрое добавление категории', 'Доступ к быстрому добавлению категории', 'ru'),
(247, 'Быстрое обновление блока', 'Доступ к быстрому обновлению блока', 'ru'),
(248, 'Редактирование категорий сайта', 'Доступ к редактированию категории сайта', 'ru'),
(249, 'Перевод категории сайта', 'Доступ к переводу категории сайта', 'ru'),
(250, 'Удаление категории сайта', 'Доступ к удалению категории сайта', 'ru'),
(251, 'Получение подкатегорий', 'Доступ к получению подкатегорий', 'ru'),
(252, 'Получение статуса комментариев', 'Доступ к получению статусув комментариев', 'ru'),
(253, 'Доступ к компонентам', 'Доступ к компонентам', 'ru'),
(254, 'Управление компонентами системы', 'Доступ к управлению компонентами системы', 'ru'),
(255, 'Просмотр списка компонентов сайта', 'Доступ к просмотру списка компонентов сайта', 'ru'),
(256, 'Проверка установки компонента', 'Доступ к проверке установки компонента', 'ru'),
(257, 'Установка модуля', 'Доступ к установке модуля', 'ru'),
(258, 'Удаление модуля', 'Доступ к удалению модуля', 'ru'),
(259, 'Поиск компонентов', 'Доступ к поиску компонентов', 'ru'),
(260, 'Настройки модуля', 'Доступ к настройкам модуля', 'ru'),
(261, 'Сохранение настроек модулей', 'Доступ к сохранению настроек модулей', 'ru'),
(262, 'Переход к админчасти модуля', 'Доступ к админчасти модуля', 'ru'),
(263, 'Запук модулей', 'Доступ к запуску модулей', 'ru'),
(264, 'Запук методов модулей', 'Доступ к запуску методов модулей', 'ru'),
(265, 'Получение информации о компонентах', 'Доступ к получению информации о компонентах', 'ru'),
(266, 'Получение информации о модуле', 'Доступ к получению информации о модуле', 'ru'),
(267, 'Смена статуса автозагрузки модуля', 'Доступ к смене статуса автозагрузки модуля', 'ru'),
(268, 'Смена доступа по url к модулю', 'Смена доступа по url к модулю', 'ru'),
(269, 'Смена порядка компонентов в списке', 'Доступ к смене порядка компонентов в списке', 'ru'),
(270, 'Включение\\отключение отображения модуля в мен', 'Доступ к включению\\отключению отображения модуля в меню', 'ru'),
(271, 'Отображение дашборда админки', 'Доступ к отображению дашборда админки', 'ru'),
(272, 'Отображение дашборда админки', 'Доступ к отображению дашборда админки', 'ru'),
(273, 'Управление языками', 'Доступ к управлению языками', 'ru'),
(274, 'Просмотр списка языков', 'Достпу к просмотру списка языков', 'ru'),
(275, 'Отображение формы создания языка', 'Доступ к отображению формы создания языка', 'ru'),
(276, 'Создание языка', 'Доступ к созданию языка', 'ru'),
(277, 'Редактирование языка', 'Доступ к редактированию языка', 'ru'),
(278, 'Обновление языка', 'Доступ к обновлению языка', 'ru'),
(279, 'Удаление языка', 'Доступ к удалению языка', 'ru'),
(280, 'Установка языка по-умолчанию', 'Доступ к установке языка по-умолчанию', 'ru'),
(281, 'Вход в админ панель', 'Доступ к входу в админ панель', 'ru'),
(282, 'Вход в админ панель', 'Доступ к входу в админ панель', 'ru'),
(283, 'Проверка браузера пользователя', 'Доступ к проверке браузера пользователя', 'ru'),
(284, 'Вход', 'Вход', 'ru'),
(285, 'Восстановление пароля', 'Восстановление пароля', 'ru'),
(286, 'Обновление капчи', 'Доступ к обновлению капчи', 'ru'),
(287, 'Проверка капчи', 'Доступ к проверке капчи', 'ru'),
(288, 'Mod_search::__construct', '', 'ru'),
(289, 'Mod_search::index', '', 'ru'),
(290, 'Mod_search::category', '', 'ru'),
(291, 'Mod_search::display_install_window', '', 'ru'),
(292, 'Mod_search::connect_ftp', '', 'ru'),
(293, 'Управление страницами', 'Доступ к управлению страницами', 'ru'),
(294, 'Просмотр списка страниц', 'Доступ к просмотру списка страниц', 'ru'),
(295, 'Добавление страницы', 'Доступ к добавлению страницы', 'ru'),
(296, 'Pages::_set_page_roles', '', 'ru'),
(297, 'Редактирование страницы', 'Доступ к редактированию страницы', 'ru'),
(298, 'Обновление страницы', 'Доступ к редактированию страницы', 'ru'),
(299, 'Удаление страницы', 'Доступ к удалению страницы', 'ru'),
(300, 'Транслит слов', 'Доступ к транслиту слов', 'ru'),
(301, 'Смена порядка страниц', 'Доступ к смене порядка страниц', 'ru'),
(302, 'Удаление страниц', 'Доступ к удалению страниц', 'ru'),
(303, 'Перемещение страниц', 'Доступ к перемещению страниц', 'ru'),
(304, 'Отображение страницы перемещения', 'Доступ к отображению страницы перемещения', 'ru'),
(305, 'Теги', 'Теги', 'ru'),
(306, 'Создание ключевых слов', 'Доступ к созданию ключевых слов', 'ru'),
(307, 'Создание описания', 'Доступ к созданию описания', 'ru'),
(308, 'Смена статуса', 'Доступ к смене статуса', 'ru'),
(309, 'Фильтр страниц по категории', 'Доступ к фильтру страниц по категории', 'ru'),
(310, 'Управление доступом', 'Управление доступом', 'ru'),
(311, 'Настройки сайта', 'Доступ к настройкам сайта', 'ru'),
(312, 'Настройки сайта', 'Доступ к настройкам сайта', 'ru'),
(313, 'Settings::main_page', '', 'ru'),
(314, 'Список папок с шаблонами', 'Список папок с шаблонами', 'ru'),
(315, 'Сохранение настроек', 'Доступ к сохранению настроек сайта', 'ru'),
(316, 'Переключение языка в админке', 'Доступ к переключению языка в админке', 'ru'),
(317, 'Settings::save_main', '', 'ru'),
(318, 'Обновление системы', 'Доступ к обновлению системы', 'ru'),
(319, 'Обновление системы', 'Доступ к обновлению системы', 'ru'),
(320, 'Запуск обновления системы', 'Доступ к запуску обновления системы', 'ru'),
(321, 'Проверка статуса обновления системы', 'Доступ к проверке статуса обновления системы', 'ru'),
(322, 'Управление дополнительными полями', 'Доступ к управлению дополнительными полями', 'ru'),
(323, 'Настройки форм', 'Доступ к настройкам форм', 'ru'),
(324, 'Управление дополнительными полями', 'Доступ к управлению дополнительными полями', 'ru'),
(325, 'Создание дополнительного поля', 'Доступ к созданию дополнительного поля', 'ru'),
(326, 'Редактирование типа дополнительного поля', 'Доступ к редактированию типа дополнительного поля', 'ru'),
(327, 'Удаление дополнительного поля', 'Доступ к удалению дополнительного поля', 'ru'),
(328, 'Редактирование дополнительного поля', 'Доступ к редактированию дополнительного поля', 'ru'),
(329, 'Создание групы полей', 'Доступ к созданию групы полей', 'ru'),
(330, 'Редактирование групы полей', 'Доступ к редактированию групы полей', 'ru'),
(331, 'Удаление групы полей', 'Доступ к удалению групы полей', 'ru'),
(332, 'cfcm::form_from_category_group', '', 'ru'),
(333, 'Получение атрибутов формы', 'Доступ к получению атрибутов формы', 'ru'),
(334, 'Сохранение важности', 'Доступ к сохранению важности', 'ru'),
(335, 'Отображение поля', 'Доступ к отображению поля', 'ru'),
(336, 'Получение адреса', 'Доступ к получению адреса', 'ru'),
(337, 'Получение формы', 'Доступ к форме', 'ru'),
(338, 'Управление комментариями', 'Доступ к управлению комментариями', 'ru'),
(339, 'Отображения списка комментариев', 'Доступ к отображению списка комментариев', 'ru'),
(340, 'Обработка подкомментариев', 'Доступ к обработке подкомментариев', 'ru'),
(341, 'comments::render', '', 'ru'),
(342, 'Редактирование комментария', 'Доступ к редактированию комментария', 'ru'),
(343, 'Обновление комментария', 'Доступ к обновлению комментария', 'ru'),
(344, 'Обновление статуса комментария', 'Доступ к обновлению статуса комментария', 'ru'),
(345, 'Удаление комментария', 'Доступ к удалению комментария', 'ru'),
(346, 'Множественное удаление комментариев', 'Доступ к множественному удалению комментариев', 'ru'),
(347, 'Отображение настроек модуля комментарии', 'Доступ к отображению настроек модуля комментарии', 'ru'),
(348, 'Обновление настроек комментариев', 'Доступ к обновлению настроек комментариев', 'ru'),
(349, 'Управление обратноей связью', 'Доступ к управлению обратной связью', 'ru'),
(350, 'Настройки модуля обратная связь', 'Доступ к настройкам модуля обратная связь', 'ru'),
(351, 'Получение настроек модуля обратная связь', 'Доступ к получению настроек модуля обратная связь', 'ru'),
(352, 'Управление галереей', 'Доступ к галерее', 'ru'),
(353, 'Список категорий галереи', 'Доступ к списку категорий галереи', 'ru'),
(354, 'Категория галереи', 'Доступ к категории галереи', 'ru'),
(355, 'Настройки галереи', 'Доступ к настройкам галереи', 'ru'),
(356, 'Создание альбома', 'Доступ к созданию альбома', 'ru'),
(357, 'Редактирование альбома', 'Доступ к редактированию альбома', 'ru'),
(358, 'Редактирование настроек альбома', 'Доступ к редактированию настроек альбома', 'ru'),
(359, 'Удаление альбома', 'Доступ к удалению альбома', 'ru'),
(360, 'Отображение формы содания альбома', 'Доступ к форме создания альбома', 'ru'),
(361, 'Редактирование альбома', 'Доступ к редактированию альбома', 'ru'),
(362, 'Редактирование изображения', 'Доступ к редактированию изображения', 'ru'),
(363, 'Переименование изображения', 'Доступ к переименованию изображения', 'ru'),
(364, 'Удаление изображения', 'Доступ к удалению изображения', 'ru'),
(365, 'Обновление информации', 'Доступ к обновлению информации', 'ru'),
(366, 'Смена порядка категорий', 'Доступ к смене порядка категорий', 'ru'),
(367, 'Смена порядка альбомов', 'Доступ к смене порядка альбомов', 'ru'),
(368, 'Смена порядка изображений', 'Доступ к смене порядка изображений', 'ru'),
(369, 'Отображение формы создания категории', 'Доступ к отображению формы создания категории', 'ru'),
(370, 'Создание категории', 'Доступ к созданию категории', 'ru'),
(371, 'Редактирование категории', 'Доступ к редактированию категории', 'ru'),
(372, 'Обновление категории', 'Доступ к обновлению категории', 'ru'),
(373, 'Удаление категории', 'Доступ к удалению категории', 'ru'),
(374, 'Загрузка изображений', 'Доступ к загрузке изображений', 'ru'),
(375, 'Загрузка архива', 'Доступ к загрузке архива', 'ru'),
(376, 'Управление модулем рассылки', 'Управление модулем рассылки', 'ru'),
(377, 'Отправка писем групам', 'Доступ к отправке писем групам', 'ru'),
(378, 'Отправка писем групам', 'Доступ к отправке писем групам', 'ru'),
(379, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(380, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(381, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(382, 'Удаление подписчиков', 'Доступ к удалению подписчиков', 'ru'),
(383, 'Управление меню', 'Доступ к управлению меню', 'ru'),
(384, 'Список меню сайта', 'Доступ к списку меню сайта', 'ru'),
(385, 'Отображение меню', 'Доступ к отображению меню', 'ru'),
(386, 'menu::list_menu_items', '', 'ru'),
(387, 'Создание пункта меню', 'Доступ к созданию пункта меню', 'ru'),
(388, 'menu::display_selector', '', 'ru'),
(389, 'menu::get_name_by_id', '', 'ru'),
(390, 'Удаление пункта меню', 'Доступ к удалению пункта меню', 'ru'),
(391, 'Редактирование пункта меню', 'Доступ к редактированию пункта меню', 'ru'),
(392, 'menu::process_root', '', 'ru'),
(393, 'menu::insert_menu_item', '', 'ru'),
(394, 'Смена порядка меню', 'Доступ к смене порядка меню', 'ru'),
(395, 'Создание меню', 'Доступ к созданию меню', 'ru'),
(396, 'Редактирование меню', 'Доступ к редактированию меню', 'ru'),
(397, 'Обновление меню', 'Доступ к обновлению меню', 'ru'),
(398, 'Проверка данных меню', 'Доступ к проверке данных меню', 'ru'),
(399, 'Удаление меню', 'Доступ к удалению меню', 'ru'),
(400, 'Отображение формы создания меню', 'Доступ к отображению формы создания меню', 'ru'),
(401, 'Получение списка страниц', 'Доступ к получению списка страниц', 'ru'),
(402, 'Поиск страниц', 'Доступ к поиску страниц', 'ru'),
(403, 'menu::get_item', '', 'ru'),
(404, 'menu::display_tpl', '', 'ru'),
(405, 'menu::fetch_tpl', '', 'ru'),
(406, 'Отображение окна перевода пункта меню', 'Доступ к отображению окна перевода пункта меню', 'ru'),
(407, 'Перевод пункта меню', 'Доступ к переводу пункта меню', 'ru'),
(408, 'Получение списка языков', 'Доступ к получению списка языков', 'ru'),
(409, 'menu::render', '', 'ru'),
(410, 'Смена активности меню', 'Доступ к смене активности меню', 'ru'),
(411, 'Получение дочерних елементов', 'Доступ к получению дочерних елементов', 'ru'),
(412, 'Управление rss', 'Управление rss', 'ru'),
(413, 'Управление rss', 'Управление rss', 'ru'),
(414, 'rss::render', '', 'ru'),
(415, 'rss::settings_update', '', 'ru'),
(416, 'rss::display_tpl', '', 'ru'),
(417, 'rss::fetch_tpl', '', 'ru'),
(418, 'Управление шаблонами писем', 'Доступ к управлению шаблонами писем', 'ru'),
(419, 'Создание шаблона письма', 'Доступ к созданию шаблона письма', 'ru'),
(420, 'Редактирование шаблона письма', 'Доступ к редактированию шаблона письма', 'ru'),
(421, 'sample_mail::render', '', 'ru'),
(422, 'Список шаблонов писем', 'Доступ к списку шаблонов писем', 'ru'),
(423, 'Удаление шаблона письма', 'Доступ к удалению шаблона письма', 'ru'),
(424, 'sample_module::__construct', '', 'ru'),
(425, 'sample_module::index', '', 'ru');
INSERT INTO `shop_rbac_privileges_i18n` (`id`, `title`, `description`, `locale`) VALUES
(426, 'Управление кнопками соцсетей', 'Доступ к управлению кнопками соцсетей', 'ru'),
(427, 'Управление кнопками соцсетей', 'Доступ к управлению кнопками соцсетей', 'ru'),
(428, 'Обновление настроек модуля кнопок соцсетей', 'Доступ к обновлению настроек модуля кнопок соцсетей', 'ru'),
(429, 'Получение настроек модуля кнопок соцсетей', 'Доступ к настройкам модуля кнопок соцсетей', 'ru'),
(430, 'share::render', '', 'ru'),
(431, 'Управление картой сайта', 'Доступ к управлению картой сайта', 'ru'),
(432, 'Настройки карты сайта', 'Доступ к настройкам карты сайта', 'ru'),
(433, 'sitemap::_load_settings', '', 'ru'),
(434, 'Обновление настроек катры сайта', 'Доступ к обновлению настроек карты сайта', 'ru'),
(435, 'sitemap::display_tpl', '', 'ru'),
(436, 'sitemap::fetch_tpl', '', 'ru'),
(437, 'sitemap::render', '', 'ru'),
(438, 'Управление интеграцией с соцсетями', 'Доступ к управлению интеграцией с соцсетями', 'ru'),
(439, 'Настройки модуля интеграции с соцсетями', 'Достпу к настройкам модуля интеграции с соцсетями', 'ru'),
(440, 'Обновление настроек модуля', 'Доступ к обновлению настроек модуля', 'ru'),
(441, 'social_servises::get_fsettings', '', 'ru'),
(442, 'social_servises::get_vsettings', '', 'ru'),
(443, 'social_servises::_get_templates', '', 'ru'),
(444, 'social_servises::render', '', 'ru'),
(445, 'Редактор шаблонов', 'Доступ к редактору шаблонов', 'ru'),
(446, 'template_editor::render', '', 'ru'),
(447, 'Управление редиректами с удаленнных товаров', 'Управление редиректами с удаленнных товаров', 'ru'),
(448, 'Список редиректов', 'Доступ к списку редиректов', 'ru'),
(449, 'Создание редиректа', 'Доступ к созданию редиректа', 'ru'),
(450, 'Редактирование редиректа', 'Доступ к редактированию редиректа', 'ru'),
(451, 'Удаление редаректа', 'Доступ к удалению редиректа', 'ru'),
(452, 'Управление пользователями', 'Доступ к управлению пользователями', 'ru'),
(453, 'Список пользователей', 'Доступ к списку пользователей', 'ru'),
(454, 'user_manager::set_tpl_roles', '', 'ru'),
(455, 'user_manager::getRolesTable', '', 'ru'),
(456, 'Создание списка юзеров', 'Доступ к созданию списка юзеров', 'ru'),
(457, 'user_manager::auto_complit', '', 'ru'),
(458, 'Создание юзера', 'Доступ к созданию юзера', 'ru'),
(459, 'user_manager::actions', '', 'ru'),
(460, 'Поиск пользователей', 'Доступ к поиску пользователей', 'ru'),
(461, 'Редактирование юзера', 'Доступ к редактированию юзера', 'ru'),
(462, 'Обновление информации о пользователе', 'Доступ к обновлению информации о пользователе', 'ru'),
(463, 'user_manager::groups_index', '', 'ru'),
(464, 'user_manager::create', '', 'ru'),
(465, 'user_manager::edit', '', 'ru'),
(466, 'user_manager::save', '', 'ru'),
(467, 'user_manager::delete', '', 'ru'),
(468, 'Удаление пользователя', 'Доступ к удалению пользвателя', 'ru'),
(469, 'user_manager::update_role_perms', '', 'ru'),
(470, 'user_manager::show_edit_prems_tpl', '', 'ru'),
(471, 'user_manager::get_permissions_table', '', 'ru'),
(472, 'user_manager::get_group_names', '', 'ru'),
(474, 'Список виджетов', 'Доступ к списку виджетов', 'ru'),
(475, 'Создание виджета', 'Доступ к созданию виджета', 'ru'),
(476, 'Отображение формы создания виджета', 'Доступ к отображению формы создания виджета', 'ru'),
(477, 'Редактирование виджетов', 'Доступ к отображению формы создания виджета', 'ru'),
(478, 'Обновление виджета', 'Доступ к обновлению виджетов', 'ru'),
(479, 'Обновление настроек виджета', 'Доступ к обновлению настроек виджета', 'ru'),
(480, 'Удаление виджета', 'Доступ к удалению виджета', 'ru'),
(482, 'Редактирование html виджета', 'Доступ к редактированию html виджета', 'ru'),
(483, 'Редактирование модульного виджета', 'Доступ к редактированию модульного виджета', 'ru');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_roles`
--

DROP TABLE IF EXISTS `shop_rbac_roles`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `importance` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `shop_rbac_roles`
--

INSERT INTO `shop_rbac_roles` (`id`, `name`, `importance`, `description`) VALUES
(1, 'Administrator', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_roles_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_roles_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles_i18n` (
  `id` int(11) NOT NULL,
  `alt_name` varchar(45) DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  KEY `role_id_idx` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_rbac_roles_i18n`
--

INSERT INTO `shop_rbac_roles_i18n` (`id`, `alt_name`, `locale`, `description`) VALUES
(1, 'Администратор', 'ru', 'Доступны все елементы управления');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_rbac_roles_privileges`
--

DROP TABLE IF EXISTS `shop_rbac_roles_privileges`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rolepriv` (`role_id`,`privilege_id`),
  KEY `shop_rbac_roles_privileges_FK_2` (`privilege_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=614 ;

--
-- Дамп даних таблиці `shop_rbac_roles_privileges`
--

INSERT INTO `shop_rbac_roles_privileges` (`id`, `role_id`, `privilege_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 1, 93),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(98, 1, 98),
(99, 1, 99),
(100, 1, 100),
(101, 1, 101),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(106, 1, 106),
(107, 1, 107),
(108, 1, 108),
(109, 1, 109),
(110, 1, 110),
(111, 1, 111),
(112, 1, 112),
(113, 1, 113),
(114, 1, 114),
(115, 1, 115),
(116, 1, 116),
(117, 1, 117),
(118, 1, 118),
(119, 1, 119),
(120, 1, 120),
(121, 1, 121),
(122, 1, 122),
(123, 1, 123),
(124, 1, 124),
(125, 1, 125),
(126, 1, 126),
(127, 1, 127),
(128, 1, 128),
(129, 1, 129),
(130, 1, 130),
(131, 1, 131),
(132, 1, 132),
(133, 1, 133),
(134, 1, 134),
(135, 1, 135),
(136, 1, 136),
(137, 1, 137),
(138, 1, 138),
(139, 1, 139),
(140, 1, 140),
(141, 1, 141),
(142, 1, 142),
(143, 1, 143),
(144, 1, 144),
(145, 1, 145),
(146, 1, 146),
(147, 1, 147),
(148, 1, 148),
(149, 1, 149),
(150, 1, 150),
(151, 1, 151),
(152, 1, 152),
(153, 1, 153),
(154, 1, 154),
(155, 1, 155),
(156, 1, 156),
(157, 1, 157),
(158, 1, 158),
(159, 1, 159),
(160, 1, 160),
(161, 1, 161),
(162, 1, 162),
(163, 1, 163),
(164, 1, 164),
(165, 1, 165),
(166, 1, 166),
(167, 1, 167),
(168, 1, 168),
(169, 1, 169),
(184, 1, 184),
(185, 1, 185),
(186, 1, 186),
(187, 1, 187),
(188, 1, 188),
(189, 1, 189),
(190, 1, 190),
(191, 1, 191),
(192, 1, 192),
(193, 1, 193),
(194, 1, 194),
(195, 1, 195),
(196, 1, 196),
(197, 1, 197),
(198, 1, 198),
(199, 1, 199),
(200, 1, 200),
(201, 1, 201),
(202, 1, 202),
(203, 1, 203),
(204, 1, 204),
(205, 1, 205),
(206, 1, 206),
(207, 1, 207),
(208, 1, 208),
(209, 1, 209),
(210, 1, 210),
(211, 1, 211),
(212, 1, 212),
(213, 1, 213),
(214, 1, 214),
(215, 1, 215),
(216, 1, 216),
(217, 1, 217),
(218, 1, 218),
(219, 1, 219),
(220, 1, 220),
(221, 1, 221),
(222, 1, 222),
(223, 1, 223),
(224, 1, 224),
(225, 1, 225),
(226, 1, 226),
(227, 1, 227),
(228, 1, 228),
(229, 1, 229),
(230, 1, 230),
(231, 1, 231),
(232, 1, 232),
(233, 1, 233),
(234, 1, 234),
(235, 1, 235),
(236, 1, 236),
(237, 1, 237),
(238, 1, 238),
(239, 1, 239),
(240, 1, 240),
(241, 1, 241),
(242, 1, 242),
(243, 1, 243),
(244, 1, 244),
(245, 1, 245),
(246, 1, 246),
(247, 1, 247),
(248, 1, 248),
(249, 1, 249),
(250, 1, 250),
(251, 1, 251),
(252, 1, 252),
(253, 1, 253),
(254, 1, 254),
(255, 1, 255),
(256, 1, 256),
(257, 1, 257),
(258, 1, 258),
(259, 1, 259),
(260, 1, 260),
(261, 1, 261),
(262, 1, 262),
(263, 1, 263),
(264, 1, 264),
(265, 1, 265),
(266, 1, 266),
(267, 1, 267),
(268, 1, 268),
(269, 1, 269),
(270, 1, 270),
(271, 1, 271),
(272, 1, 272),
(273, 1, 273),
(274, 1, 274),
(275, 1, 275),
(276, 1, 276),
(277, 1, 277),
(278, 1, 278),
(279, 1, 279),
(280, 1, 280),
(281, 1, 281),
(282, 1, 282),
(283, 1, 283),
(284, 1, 284),
(285, 1, 285),
(286, 1, 286),
(287, 1, 287),
(293, 1, 293),
(294, 1, 294),
(295, 1, 295),
(296, 1, 296),
(297, 1, 297),
(298, 1, 298),
(299, 1, 299),
(300, 1, 300),
(301, 1, 301),
(302, 1, 302),
(303, 1, 303),
(304, 1, 304),
(305, 1, 305),
(306, 1, 306),
(307, 1, 307),
(308, 1, 308),
(309, 1, 309),
(310, 1, 310),
(311, 1, 311),
(312, 1, 312),
(313, 1, 313),
(314, 1, 314),
(315, 1, 315),
(316, 1, 316),
(317, 1, 317),
(322, 1, 322),
(323, 1, 323),
(324, 1, 324),
(325, 1, 325),
(326, 1, 326),
(327, 1, 327),
(328, 1, 328),
(329, 1, 329),
(330, 1, 330),
(331, 1, 331),
(332, 1, 332),
(333, 1, 333),
(334, 1, 334),
(335, 1, 335),
(336, 1, 336),
(337, 1, 337),
(338, 1, 338),
(339, 1, 339),
(340, 1, 340),
(341, 1, 341),
(342, 1, 342),
(343, 1, 343),
(344, 1, 344),
(345, 1, 345),
(346, 1, 346),
(347, 1, 347),
(348, 1, 348),
(349, 1, 349),
(350, 1, 350),
(351, 1, 351),
(352, 1, 352),
(353, 1, 353),
(354, 1, 354),
(355, 1, 355),
(356, 1, 356),
(357, 1, 357),
(358, 1, 358),
(359, 1, 359),
(360, 1, 360),
(361, 1, 361),
(362, 1, 362),
(363, 1, 363),
(364, 1, 364),
(365, 1, 365),
(366, 1, 366),
(367, 1, 367),
(368, 1, 368),
(369, 1, 369),
(370, 1, 370),
(371, 1, 371),
(372, 1, 372),
(373, 1, 373),
(374, 1, 374),
(375, 1, 375),
(376, 1, 376),
(377, 1, 377),
(378, 1, 378),
(379, 1, 379),
(380, 1, 380),
(381, 1, 381),
(382, 1, 382),
(383, 1, 383),
(384, 1, 384),
(385, 1, 385),
(386, 1, 386),
(387, 1, 387),
(388, 1, 388),
(389, 1, 389),
(390, 1, 390),
(391, 1, 391),
(392, 1, 392),
(393, 1, 393),
(394, 1, 394),
(395, 1, 395),
(396, 1, 396),
(397, 1, 397),
(398, 1, 398),
(399, 1, 399),
(400, 1, 400),
(401, 1, 401),
(402, 1, 402),
(403, 1, 403),
(404, 1, 404),
(405, 1, 405),
(406, 1, 406),
(407, 1, 407),
(408, 1, 408),
(409, 1, 409),
(410, 1, 410),
(411, 1, 411),
(412, 1, 412),
(413, 1, 413),
(414, 1, 414),
(415, 1, 415),
(416, 1, 416),
(417, 1, 417),
(418, 1, 418),
(419, 1, 419),
(420, 1, 420),
(421, 1, 421),
(422, 1, 422),
(423, 1, 423),
(426, 1, 426),
(427, 1, 427),
(428, 1, 428),
(429, 1, 429),
(430, 1, 430),
(431, 1, 431),
(432, 1, 432),
(433, 1, 433),
(434, 1, 434),
(435, 1, 435),
(436, 1, 436),
(437, 1, 437),
(438, 1, 438),
(439, 1, 439),
(440, 1, 440),
(441, 1, 441),
(442, 1, 442),
(443, 1, 443),
(444, 1, 444),
(445, 1, 445),
(446, 1, 446),
(447, 1, 447),
(448, 1, 448),
(449, 1, 449),
(450, 1, 450),
(451, 1, 451),
(452, 1, 452),
(453, 1, 453),
(454, 1, 454),
(455, 1, 455),
(456, 1, 456),
(457, 1, 457),
(458, 1, 458),
(459, 1, 459),
(460, 1, 460),
(461, 1, 461),
(462, 1, 462),
(463, 1, 463),
(464, 1, 464),
(465, 1, 465),
(466, 1, 466),
(467, 1, 467),
(468, 1, 468),
(469, 1, 469),
(470, 1, 470),
(471, 1, 471),
(472, 1, 472),
(473, 1, 473),
(474, 1, 474),
(475, 1, 475),
(476, 1, 476),
(477, 1, 477),
(478, 1, 478),
(479, 1, 479),
(480, 1, 480),
(482, 1, 482),
(483, 1, 483),
(612, 1, 424),
(613, 1, 425);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_settings`
--

DROP TABLE IF EXISTS `shop_settings`;
CREATE TABLE IF NOT EXISTS `shop_settings` (
  `name` varchar(255) NOT NULL,
  `value` text,
  `locale` varchar(5) NOT NULL,
  PRIMARY KEY (`name`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `shop_settings`
--

INSERT INTO `shop_settings` (`name`, `value`, `locale`) VALUES
('mainImageWidth', '320', ''),
('mainImageHeight', '320', ''),
('smallImageWidth', '140', ''),
('smallImageHeight', '140', ''),
('addImageWidth', '800', ''),
('addImageHeight', '600', ''),
('imagesQuality', '99', ''),
('systemTemplatePath', './templates/newLevel/shop/', ''),
('frontProductsPerPage', '24', ''),
('adminProductsPerPage', '24', ''),
('ordersMessageFormat', NULL, ''),
('ordersMessageText', 'Здравствуйте, %userName%.  \n\nМы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop" \nВы указали следующие контактные данные: \n\nEmail адрес: %userEmail% \nНомер телефона: %userPhone% \nАдрес доставки: %userDeliver%  \n\nМенеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.  \n\nТакже, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:  %orderLink%.  \n\nСпасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.  \n\nПри возникновении любых вопросов, обращайтесь за телефонами:  \n+7 (095) 222-33-22 +38 (098) 222-33-22', ''),
('ordersSendMessage', NULL, ''),
('ordersSenderEmail', NULL, ''),
('ordersSenderName', 'DemoShop ImageCms.net', ''),
('ordersMessageTheme', 'Данные для просмотра совершенной покупки', ''),
('2_LMI_SECRET_KEY', 'bank', ''),
('2_LMI_PAYEE_PURSE', 'bank', ''),
('1_LMI_SECRET_KEY', 'cur', ''),
('1_LMI_PAYEE_PURSE', 'cur', ''),
('2_OschadBankData', 'a:5:{s:8:"receiver";s:41:"ТЗОВ "Екзампл Магазин" ";s:4:"code";s:9:"123456789";s:7:"account";s:12:"123456789123";s:3:"mfo";s:6:"123456";s:8:"banknote";s:7:"грн.";}', ''),
('3_SberBankData', 'a:8:{s:12:"receiverName";s:45:"Наименование получателя";s:8:"bankName";s:29:"Банк получателя";s:11:"receiverInn";s:10:"1231231231";s:7:"account";s:20:"15412398123312341237";s:3:"BIK";s:9:"123123123";s:11:"cor_account";s:20:"12312312334012340123";s:8:"bankNote";s:7:"руб.";s:9:"bankNote2";s:7:"коп.";}', ''),
('4_RobokassaData', 'a:3:{s:5:"login";s:5:"login";s:9:"password1";s:9:"password1";s:9:"password2";s:9:"password2";}', ''),
('notifyOrderStatusMessageFormat', NULL, ''),
('notifyOrderStatusMessageText', '', ''),
('notifyOrderStatusSenderEmail', NULL, ''),
('notifyOrderStatusSenderName', '', ''),
('notifyOrderStatusMessageTheme', '', ''),
('wishListsMessageFormat', 'text', ''),
('wishListsMessageText', '', ''),
('wishListsSenderEmail', 'noreply@example.com', ''),
('wishListsSenderName', '', ''),
('wishListsMessageTheme', '', ''),
('notificationsMessageFormat', 'text', ''),
('notificationsMessageText', '', ''),
('notificationsSenderEmail', 'noreply@example.com', ''),
('notificationsSenderName', '', ''),
('notificationsMessageTheme', '', ''),
('callbacksSendNotification', '0', ''),
('callbacksMessageFormat', 'text', ''),
('callbacksMessageText', '', ''),
('callbacksSendEmailTo', 'manager@example.com', ''),
('callbacksSenderEmail', 'noreply@example.com', ''),
('callbacksSenderName', '', ''),
('callbacksMessageTheme', '', ''),
('userInfoRegister', '1', ''),
('userInfoMessageFormat', 'text', ''),
('userInfoMessageText', '', ''),
('userInfoSenderEmail', 'noreply@example.com', ''),
('userInfoSenderName', '', ''),
('userInfoMessageTheme', '', ''),
('topSalesBlockFormulaCoef', '1', ''),
('pricePrecision', '2', ''),
('smallAddImageWidth', '90', ''),
('smallAddImageHeight', '90', ''),
('forgotPasswordMessageText', 'Здравствуйте!\n\nНа сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.\n\nДля завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri% \n\nВаш новый пароль для входа: %password%\n\nЕсли это письмо попало к Вам по ошибке просто проигнорируйте его.\n\n\nПри возникновении любых вопросов, обращайтесь по телефонам:  \n(012)  345-67-89 , (012)  345-67-89 \n---\n\nС уважением, \nсотрудники службы продаж %webSiteName%', ''),
('watermark_wm_hor_alignment', 'left', ''),
('watermark_wm_vrt_alignment', 'bottom', ''),
('watermark_watermark_type', 'text', ''),
('watermark_watermark_image', '', ''),
('watermark_watermark_image_opacity', '50', ''),
('watermark_watermark_padding', '', ''),
('watermark_watermark_text', 'demoshop.imagecms.net', ''),
('watermark_watermark_font_size', '', ''),
('watermark_watermark_color', '', ''),
('watermark_watermark_font_path', '', ''),
('watermark_active', '', ''),
('forgotPasswordMessageText', NULL, 'ru'),
('ordersMessageText', NULL, 'ru'),
('ordersSenderName', NULL, 'ru'),
('ordersMessageTheme', NULL, 'ru'),
('11_LiqPayData', 'a:2:{s:11:"merchant_id";s:6:"111111";s:12:"merchant_sig";s:6:"111111";}', ''),
('notifyOrderStatusMessageText', NULL, 'ru'),
('notifyOrderStatusSenderName', NULL, 'ru'),
('notifyOrderStatusMessageTheme', NULL, 'ru'),
('wishListsMessageText', '', 'ru'),
('wishListsSenderName', 'admin', 'ru'),
('wishListsMessageTheme', '', 'ru'),
('notificationsMessageText', '', 'ru'),
('notificationsSenderName', '', 'ru'),
('notificationsMessageTheme', '', 'ru'),
('callbacksMessageText', '', 'ru'),
('callbacksSenderName', '', 'ru'),
('callbacksMessageTheme', '', 'ru'),
('userInfoMessageText', '', 'ru'),
('userInfoSenderName', '', 'ru'),
('userInfoMessageTheme', '', 'ru'),
('adminMessageCallback', '<h1>Спасибо за заказ звонка</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('adminMessages', 'a:3:{s:8:"incoming";s:0:"";s:8:"callback";s:27:"вфы вфыв фыв фы";s:5:"order";s:0:"";}', 'ru'),
('selectedProductCats', 'a:5:{i:0;s:2:"36";i:1;s:2:"37";i:2;s:2:"38";i:3;s:2:"39";i:4;s:2:"41";}', ''),
('adminMessageIncoming', '<h1>Спасибо</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('adminMessageOrderPage', '<h1>Спасибо</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('mainModImageWidth', '640', ''),
('mainModImageHeight', '480', ''),
('smallModImageWidth', '90', ''),
('smallModImageHeight', '90', ''),
('order_method', NULL, ''),
('forgotPasswordMessageText', 'Здравствуйте!\n\nНа сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.\n\nДля завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri% \n\nВаш новый пароль для входа: %password%\n\nЕсли это письмо попало к Вам по ошибке просто проигнорируйте его.\n\n\nПри возникновении любых вопросов, обращайтесь по телефонам:  \n(012)  345-67-89 , (012)  345-67-89 \n---\n\nС уважением, \nсотрудники службы продаж %webSiteName%', 'en'),
('ordersMessageText', 'Здравствуйте, %userName%.  \n\nМы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop" \nВы указали следующие контактные данные: \n\nEmail адрес: %userEmail% \nНомер телефона: %userPhone% \nАдрес доставки: %userDeliver%  \n\nМенеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.  \n\nТакже, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:  %orderLink%.  \n\nСпасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.  \n\nПри возникновении любых вопросов, обращайтесь за телефонами:  \n+7 (095) 222-33-22 +38 (098) 222-33-22', 'en'),
('ordersSenderName', 'DemoShop ImageCms.net', 'en'),
('ordersMessageTheme', 'Данные для просмотра совершенной покупки', 'en'),
('ordersManagerEmail', NULL, ''),
('ordersSendManagerMessage', NULL, ''),
('notifyOrderStatusMessageText', '', 'en'),
('notifyOrderStatusSenderName', '', 'en'),
('notifyOrderStatusMessageTheme', '', 'en'),
('wishListsMessageText', '', 'en'),
('wishListsSenderName', '', 'en'),
('wishListsMessageTheme', '', 'en'),
('notificationsMessageText', '', 'en'),
('notificationsSenderName', '', 'en'),
('notificationsMessageTheme', '', 'en'),
('callbacksMessageText', '', 'en'),
('callbacksSenderName', '', 'en'),
('callbacksMessageTheme', '', 'en'),
('userInfoMessageText', '', 'en'),
('userInfoSenderName', '', 'en'),
('userInfoMessageTheme', '', 'en'),
('MemcachedSettings', 'a:1:{s:11:"MEMCACHE_ON";b:0;}', ''),
('10_PB_MERCHANT_PASSWORD', '999999999999', ''),
('10_PB_API_URL', 'https://api.privatbank.ua/p24api/ishop', ''),
('adminMessageMonkey', '', ''),
('adminMessageMonkeylist', '', ''),
('MobileVersionSettings', 'a:1:{s:15:"MobileVersionON";b:0;}', ''),
('10_PB_MERCHANT_ID', '99999', ''),
('facebook_int', 'a:3:{s:9:"secretkey";s:0:"";s:9:"appnumber";s:0:"";s:8:"template";s:8:"newLevel";}', ''),
('vk_int', 'a:3:{s:7:"protkey";s:0:"";s:9:"appnumber";s:0:"";s:8:"template";s:8:"newLevel";}', ''),
('xmlSiteMap', 'a:6:{s:18:"main_page_priority";b:0;s:13:"cats_priority";b:0;s:14:"pages_priority";b:0;s:20:"main_page_changefreq";b:0;s:21:"categories_changefreq";b:0;s:16:"pages_changefreq";b:0;}', ''),
('mobileTemplatePath', './templates/commerce_mobiles/shop/PIE', ''),
('ordersRecountGoods', '', ''),
('ordersuserInfoRegister', NULL, ''),
('notifyOrderStatusStatusEmail', NULL, ''),
('8_LMI_PAYEE_PURSE', '6456456456464', ''),
('8_LMI_SECRET_KEY', '456', ''),
('watermark_watermark_interest', '25', ''),
('9_OschadBankData', 'a:5:{s:8:"receiver";s:0:"";s:4:"code";s:10:"1234567890";s:7:"account";s:0:"";s:3:"mfo";s:0:"";s:8:"banknote";s:0:"";}', ''),
('ss', 'a:9:{s:4:"yaru";s:1:"1";s:5:"vkcom";s:1:"1";s:8:"facebook";s:1:"1";s:7:"twitter";s:1:"1";s:9:"odnoclass";s:1:"1";s:7:"myworld";s:1:"1";s:2:"lj";s:1:"1";s:4:"type";s:6:"button";s:8:"vk_apiid";s:0:"";}', ''),
('1CCatSettings', 'a:1:{s:8:"filesize";s:11:"file_limit=";}', ''),
('1CSettingsOS', 'N;', ''),
('usegifts', '0;', 'ru'),
('ordersCheckStocks', '', ''),
('imageSizesBlock', 'a:4:{s:5:"small";a:3:{s:4:"name";s:5:"small";s:6:"height";s:2:"62";s:5:"width";s:2:"62";}s:6:"medium";a:3:{s:4:"name";s:6:"medium";s:6:"height";s:3:"149";s:5:"width";s:3:"260";}s:4:"main";a:3:{s:4:"name";s:4:"main";s:6:"height";s:3:"288";s:5:"width";s:3:"452";}s:5:"large";a:3:{s:4:"name";s:5:"large";s:6:"height";s:4:"1000";s:5:"width";s:4:"1000";}}', ''),
('imagesMainSize', 'auto', ''),
('additionalImageWidth', '1000', ''),
('additionalImageHeight', '1000', ''),
('arrayFrontProductsPerPage', 'a:3:{i:0;s:2:"24";i:1;s:2:"48";i:2;s:2:"96";}', ''),
('thumbImageWidth', '62', ''),
('thumbImageHeight', '62', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_sorting`
--

DROP TABLE IF EXISTS `shop_sorting`;
CREATE TABLE IF NOT EXISTS `shop_sorting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pos` int(11) DEFAULT NULL,
  `get` varchar(25) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `shop_sorting`
--

INSERT INTO `shop_sorting` (`id`, `pos`, `get`, `active`) VALUES
(1, 4, 'rating', 1),
(2, 1, 'price', 1),
(3, 2, 'price_desc', 1),
(4, 3, 'hit', 1),
(5, 5, 'hot', 1),
(6, 0, 'action', 1),
(7, 8, 'name', 0),
(8, 9, 'name_desc', 0),
(9, 6, 'views', 0),
(10, 7, 'topsales', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_sorting_i18n`
--

DROP TABLE IF EXISTS `shop_sorting_i18n`;
CREATE TABLE IF NOT EXISTS `shop_sorting_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(11) NOT NULL DEFAULT 'ru',
  `name` varchar(50) NOT NULL,
  `name_front` varchar(50) DEFAULT NULL,
  `tooltip` varchar(256) NOT NULL,
  PRIMARY KEY (`id`,`locale`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп даних таблиці `shop_sorting_i18n`
--

INSERT INTO `shop_sorting_i18n` (`id`, `locale`, `name`, `name_front`, `tooltip`) VALUES
(1, 'ru', 'По рейтингу', 'Рейтинг', ''),
(2, 'ru', 'От дешевых к дорогим', 'От дешевых к дорогим', ''),
(3, 'ru', 'От дорогих к дешевым', 'От дорогих к дешевым', ''),
(4, 'ru', 'Популярные', 'Популярные', ''),
(5, 'ru', 'Новинки', 'Новинки', ''),
(6, 'ru', 'Акции', 'Акции', ''),
(6, 'ua', '', '', ''),
(7, 'ru', 'А-Я', 'Имени', ''),
(8, 'ru', 'Я-А', 'Имени(Я-А)', ''),
(9, 'ru', 'Просмотров', 'Количеству просмотров', ''),
(10, 'ru', 'Топ продаж', 'Топ продаж', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_spy`
--

DROP TABLE IF EXISTS `shop_spy`;
CREATE TABLE IF NOT EXISTS `shop_spy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп даних таблиці `shop_spy`
--

INSERT INTO `shop_spy` (`id`, `user_id`, `product_id`, `price`, `variant_id`, `key`, `email`, `old_price`) VALUES
(3, 69, 102, 550, 113, 'IPrMlWydoeP9Cmex30upNOUsdTa4bIrg', NULL, 549);

-- --------------------------------------------------------

--
-- Структура таблиці `shop_warehouse`
--

DROP TABLE IF EXISTS `shop_warehouse`;
CREATE TABLE IF NOT EXISTS `shop_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `shop_warehouse_I_1` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп даних таблиці `shop_warehouse`
--

INSERT INTO `shop_warehouse` (`id`, `name`, `address`, `phone`, `description`) VALUES
(1, 'warehouse 1', 'address', 'phone', ''),
(2, 'warehouse 2', 'address 2', '', '');

-- --------------------------------------------------------

--
-- Структура таблиці `shop_warehouse_data`
--

DROP TABLE IF EXISTS `shop_warehouse_data`;
CREATE TABLE IF NOT EXISTS `shop_warehouse_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_warehouse_data_FI_1` (`product_id`),
  KEY `shop_warehouse_data_FI_2` (`warehouse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Дамп даних таблиці `shop_warehouse_data`
--

INSERT INTO `shop_warehouse_data` (`id`, `product_id`, `warehouse_id`, `count`) VALUES
(37, 132, 2, 3),
(36, 132, 1, 2),
(35, 132, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `support_comments`
--

DROP TABLE IF EXISTS `support_comments`;
CREATE TABLE IF NOT EXISTS `support_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `text` varchar(500) NOT NULL,
  `date` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп даних таблиці `support_comments`
--

INSERT INTO `support_comments` (`id`, `ticket_id`, `user_id`, `user_status`, `user_name`, `text`, `date`) VALUES
(1, 3, 1, 1, 'admin', 'Вы можете оплатить услуги безналичным переводом и наличными.', 1353064129);

-- --------------------------------------------------------

--
-- Структура таблиці `support_departments`
--

DROP TABLE IF EXISTS `support_departments`;
CREATE TABLE IF NOT EXISTS `support_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `support_departments`
--

INSERT INTO `support_departments` (`id`, `name`) VALUES
(1, 'Техническая поддержка'),
(2, 'Финансовый отдел'),
(3, 'Отдел консультаций');

-- --------------------------------------------------------

--
-- Структура таблиці `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
CREATE TABLE IF NOT EXISTS `support_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `last_comment_author` varchar(50) NOT NULL,
  `text` text,
  `theme` varchar(100) NOT NULL,
  `department` int(11) NOT NULL,
  `status` smallint(1) DEFAULT NULL,
  `priority` varchar(15) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп даних таблиці `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `last_comment_author`, `text`, `theme`, `department`, `status`, `priority`, `date`, `updated`) VALUES
(1, 1, '', 'Не могу настроить на сайте переадресации. На локалке все работает. Помогите пожалуйста.', 'htaccess', 1, 0, '2', 1353061322, 1353061322),
(2, 1, '', 'Какой тарифный план лучше подходит для моего сайта?', 'хостинг', 3, 0, '1', 1353061376, 1353061376),
(3, 1, 'admin', 'Как я могу полатить хостинг?', 'Оплата услуг', 2, 0, '0', 1353061402, 1353064130);

-- --------------------------------------------------------

--
-- Структура таблиці `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `trash`
--

DROP TABLE IF EXISTS `trash`;
CREATE TABLE IF NOT EXISTS `trash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trash_id` varchar(255) DEFAULT NULL,
  `trash_url` varchar(255) DEFAULT NULL,
  `trash_redirect_type` varchar(20) DEFAULT NULL,
  `trash_redirect` varchar(255) DEFAULT NULL,
  `trash_type` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `newpass` varchar(255) DEFAULT NULL,
  `newpass_key` varchar(255) DEFAULT NULL,
  `newpass_time` int(11) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cart_data` text,
  `wish_list_data` text,
  `key` varchar(255) NOT NULL,
  `amout` float(10,2) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_I_1` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

-- --------------------------------------------------------

--
-- Структура таблиці `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`),
  KEY `last_ip` (`last_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблиці `user_temp`
--

DROP TABLE IF EXISTS `user_temp`;
CREATE TABLE IF NOT EXISTS `user_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(34) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activation_key` varchar(50) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблиці `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `data` text NOT NULL,
  `method` varchar(50) NOT NULL,
  `settings` text NOT NULL,
  `description` varchar(300) NOT NULL,
  `roles` text NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Дамп даних таблиці `widgets`
--

INSERT INTO `widgets` (`id`, `name`, `type`, `data`, `method`, `settings`, `description`, `roles`, `created`) VALUES
(3, 'latest_news', 'module', 'core', 'recent_news', 'a:4:{s:10:"news_count";s:1:"3";s:11:"max_symdols";s:3:"150";s:10:"categories";a:1:{i:0;s:2:"69";}s:7:"display";s:6:"recent";}', 'Последние новости', '', 1291632457),
(4, 'recent_product_comments', 'module', 'comments', 'recent_product_comments', 'a:2:{s:14:"comments_count";s:1:"5";s:13:"symbols_count";s:1:"0";}', 'Последние комментарии продукта', '', 1308300371),
(5, 'tags', 'module', 'tags', 'tags_cloud', '', 'Теги', '', 1312362714),
(6, 'path', 'module', 'navigation', 'widget_navigation', '', 'Виджет навигации', '', 1328631622),
(10, 'popular_products', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:11:"popular,hit";s:5:"title";s:33:"Популярные товары";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Популярные товары', '', 1363606273),
(11, 'new_products', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:11:"popular,hot";s:5:"title";s:14:"Новинки";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Новые товары', '', 1363606324),
(12, 'action_products', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:14:"popular,action";s:5:"title";s:31:"Акционные товары";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Акционные товары', '', 1363606361),
(13, 'brands', 'module', 'shop', 'brands', 'a:4:{s:10:"withImages";b:1;s:11:"brandsCount";s:2:"15";s:7:"subpath";s:7:"widgets";s:5:"title";s:39:"Лучшие производители";}', 'Бренды', '', 1363606422),
(14, 'view_product', 'module', 'shop', 'view_product', 'a:4:{s:12:"productsType";b:0;s:5:"title";s:54:"Недавно просмотренные товары";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Недавно просмотренные товары', '', 1363606497),
(15, 'similar', 'module', 'shop', 'similar_products', 'a:3:{s:5:"title";s:27:"Похожие товары";s:13:"productsCount";s:1:"5";s:7:"subpath";s:7:"widgets";}', 'Похожие товары', '', 1363606582),
(28, 'popular_products_category', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:17:"date,hit,category";s:5:"title";s:16:"Popular products";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Популярная категория товара', '', 1374575193),
(27, 'ViewedProducts', 'module', 'shop', 'view_product', 'a:4:{s:12:"productsType";b:0;s:5:"title";s:14:"ViewedProducts";s:13:"productsCount";s:2:"10";s:7:"subpath";s:7:"widgets";}', 'Просмотренные товары', '', 1374575092),
(16, 'benefits', 'html', '<div class="container">\n<ul class="items items-benefits">\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_1">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Бесплатная</div>\n<p>доставка</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_2">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Гибкая система</div>\n<p>скидок</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_3">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Индивидуальный</div>\n<p>подход</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_4">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">высокий уровень</div>\n<p>сервиса</p>\n</div>\n</div>\n</li>\n</ul>\n</div>', '', '', 'Преимущества', '', 1371214822),
(17, 'payments_delivery_methods_info', 'html', '<div class="frame-delivery-payment"><dl><dt class="title f-s_0"><span class="icon_delivery">&nbsp;</span><span class="text-el">Доставка</span></dt><dd class="frame-list-delivery">\n<ul class="list-style-1">\n<li>Новая Почта</li>\n<li>Другие транспортные службы</li>\n<li>Курьером по Киеву</li>\n<li>Самовывоз</li>\n</ul>\n</dd><dt class="title f-s_0"><span class="icon_payment">&nbsp;</span><span class="text-el">Оплата</span></dt><dd class="frame-list-payment">\n<ul class="list-style-1">\n<li>Наличными при получении</li>\n<li>Безналичный перевод</li>\n<li>Приват 24</li>\n<li>WebMoney</li>\n</ul>\n</dd></dl></div>\n<div class="frame-phone-product">\n<div class="title f-s_0"><span class="icon_phone_product">&nbsp;</span><span class="text-el">Заказы по телефонах</span></div>\n<ul class="list-style-1">\n<li>(097) <span class="d_n">&minus;</span>567-43-21</li>\n<li>(097) <span class="d_n">&minus;</span>567-43-22</li>\n</ul>\n</div>', '', '', 'Информация о способах доставки', '', 1371821417),
(20, 'start_page_seo_text', 'html', '', '', '', '', '', 1378821714);

-- --------------------------------------------------------

--
-- Структура таблиці `widget_i18n`
--

DROP TABLE IF EXISTS `widget_i18n`;
CREATE TABLE IF NOT EXISTS `widget_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(11) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`,`locale`),
  KEY `locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `widget_i18n`
--

INSERT INTO `widget_i18n` (`id`, `locale`, `data`) VALUES
(16, 'ru', '<div class="container">\n<ul class="items items-benefits">\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_1">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Бесплатная</div>\n<p>доставка</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_2">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Гибкая система</div>\n<p>скидок</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_3">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Индивидуальный</div>\n<p>подход</p>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_4">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">высокий уровень</div>\n<p>сервиса</p>\n</div>\n</div>\n</li>\n</ul>\n</div>'),
(17, 'ru', '<div class="frame-delivery-payment"><dl><dt class="title f-s_0"><span class="icon_delivery">&nbsp;</span><span class="text-el">Доставка</span></dt><dd class="frame-list-delivery">\n<ul class="list-style-1">\n<li>Новая Почта</li>\n<li>Другие транспортные службы</li>\n<li>Курьером по Киеву</li>\n<li>Самовывоз</li>\n</ul>\n</dd><dt class="title f-s_0"><span class="icon_payment">&nbsp;</span><span class="text-el">Оплата</span></dt><dd class="frame-list-payment">\n<ul class="list-style-1">\n<li>Наличными при получении</li>\n<li>Безналичный перевод</li>\n<li>Приват 24</li>\n<li>WebMoney</li>\n</ul>\n</dd></dl></div>\n<div class="frame-phone-product">\n<div class="title f-s_0"><span class="icon_phone_product">&nbsp;</span><span class="text-el">Заказы по телефонах</span></div>\n<ul class="list-style-1">\n<li>(097) <span class="d_n">&minus;</span>567-43-21</li>\n<li>(097) <span class="d_n">&minus;</span>567-43-22</li>\n</ul>\n</div>'),
(20, 'ru', '<h1>Интернет-магазин</h1>\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\n<h2>Заголовок второго уровня</h2>\n<h3>Заголовок третьего уровня</h3>\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\n<p>Совокупность отобранных товаров, способ оплаты и доставки представляют собой законченный заказ, который оформляется на сайте путем сообщения минимально необходимой информации о покупателе.</p>\n<h3>Заголовок третьего уровня</h3>\n<p><strong>Основные способы оплаты покупок в интернет-магазине:</strong></p>\n<ul>\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\n</ul>\n<h4>Заголовок четвертого уровня</h4>\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>\n<table>\n<tbody>\n<tr>\n<td>название</td>\n<td>размер</td>\n<td>цена</td>\n</tr>\n<tr>\n<td>длинна трубы</td>\n<td>10 метров</td>\n<td>145 уе</td>\n</tr>\n<tr>\n<td>ширина трубы</td>\n<td>2 метра</td>\n<td>134 уе</td>\n</tr>\n</tbody>\n</table>\n<p>При выборе такого способа оплаты пользователю предлагается на выбор наиболее удобный способ перевода денег от пластиковой карточки до терминала и мобильного телефона.</p>\n<p>Основные способы оплаты покупок в интернет-магазине:</p>\n<ol>\n<li>наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара, наличный расчет &mdash; товар оплачивается курьеру наличными деньгами при получении покупателем товара;</li>\n<li>электронные деньги &mdash; безналичный вид расчёта;</li>\n<li>терминалы моментальной оплаты &mdash; оплата производится в уличных платёжных терминалах;</li>\n</ol>\n<p>электронные кассы &mdash; вид расчета, объединяющий практически все перечисленные выше способы оплаты.</p>');

UPDATE 
    `mod_email_paterns_i18n` 
SET `variables` = 'a:5:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:11:"$orderLink$";s:28:"Ссылка на заказ";s:8:"$status$";s:25:"статус заказа";s:9:"$comment$";s:38:"Комментарий к заказу";}' 
WHERE 
    id = 2 AND 
    locale = 'ru'
LIMIT 1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
