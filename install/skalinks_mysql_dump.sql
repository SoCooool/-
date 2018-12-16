-- phpMyAdmin SQL Dump
-- version 2.6.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Feb 09, 2006 at 11:39 AM
-- Server version: 4.0.20
-- PHP Version: 4.3.10
-- 
-- Database: `ad`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_admins`
-- 

CREATE TABLE `dir_admins` (
  `ID` int(10) NOT NULL auto_increment,
  `Name` varchar(50) NOT NULL default '',
  `Password` varchar(100) NOT NULL default '',
  `Email` varchar(60) NOT NULL default '',
  `Type` enum('1','2') NOT NULL default '1',
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `Name` (`Name`)
) TYPE=MyISAM AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `dir_admins`
-- 

INSERT INTO `dir_admins` (`ID`, `Name`, `Password`, `Email`, `Type`) VALUES (9, 'admin', '098f6bcd4621d373cade4e832627b4f6', 'admin@test.tes', '2');

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_ads`
-- 

CREATE TABLE `dir_ads` (
  `ID` int(10) NOT NULL auto_increment,
  `Template` mediumtext NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `ID` (`ID`)
) TYPE=MyISAM AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `dir_ads`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_ads_binding`
-- 

CREATE TABLE `dir_ads_binding` (
  `Cat_id` int(10) NOT NULL default '0',
  `Ads_id` int(10) NOT NULL default '0',
  `Ads_position` varchar(20) NOT NULL default '',
  `Page_type` varchar(20) NOT NULL default '',
  KEY `Cat_id` (`Cat_id`),
  KEY `Page_type` (`Page_type`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_ads_binding`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_categories`
-- 

CREATE TABLE `dir_categories` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Parent` int(10) unsigned NOT NULL default '0',
  `Title` varchar(80) NOT NULL default '',
  `Status` enum('0','1','2') NOT NULL default '2',
  `TopText` mediumtext NOT NULL,
  `BottomText` mediumtext NOT NULL,
  `meta_desc` tinytext NOT NULL,
  `SignUpImg` varchar(10) default NULL,
  `dir` varchar(50) NOT NULL default '',
  `custom_template` tinyint(1) unsigned NOT NULL default '0',
  `Editor_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Parent` (`Parent`),
  KEY `ID` (`ID`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `dir_categories`
-- 

INSERT INTO `dir_categories` (`ID`, `Parent`, `Title`, `Status`, `TopText`, `BottomText`, `meta_desc`, `SignUpImg`, `dir`, `custom_template`, `Editor_id`) VALUES (1, 0, 'Link Exchange Scripts', '0', '', '', '', NULL, 'link_exchange_scripts', 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_comments`
-- 

CREATE TABLE `dir_comments` (
  `ID` int(10) unsigned NOT NULL default '0',
  `Comment` mediumtext NOT NULL,
  PRIMARY KEY  (`ID`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_comments`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_letter_templates`
-- 

CREATE TABLE `dir_letter_templates` (
  `ID` int(10) NOT NULL auto_increment,
  `Template` mediumtext NOT NULL,
  `Status` enum('0','1') NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) TYPE=MyISAM AUTO_INCREMENT=13 ;

-- 
-- Dumping data for table `dir_letter_templates`
-- 

INSERT INTO `dir_letter_templates` (`ID`, `Template`, `Status`) VALUES (4, '<our_MainSiteTitle> <our_MainSiteURL> <our_MainSiteDescription>', '1');

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_letter_templates_binding`
-- 

CREATE TABLE `dir_letter_templates_binding` (
  `Cat_id` int(10) NOT NULL default '0',
  `Template_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`Cat_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_letter_templates_binding`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_links`
-- 

CREATE TABLE `dir_links` (
  `ID` int(11) unsigned NOT NULL auto_increment,
  `Title` varchar(100) NOT NULL default '',
  `Category` int(10) unsigned NOT NULL default '0',
  `Status` enum('0','1') NOT NULL default '1',
  `URL` varchar(150) NOT NULL default '',
  `Description` text NOT NULL,
  `Full_Description` mediumtext NOT NULL,
  `UrlHeader` int(10) NOT NULL default '0',
  `LinkBackURL` varchar(150) NOT NULL default '',
  `LinkBackURLValid` enum('y','n') NOT NULL default 'n',
  `Alt_domain` varchar(100) NOT NULL default '',
  `Email` varchar(100) default NULL,
  `EmailValid` enum('y','n') NOT NULL default 'y',
  `Rank` tinyint(3) unsigned NOT NULL default '0',
  `Pagerank` int(2) NOT NULL default '0',
  `Page` smallint(5) unsigned NOT NULL default '0',
  `Date` int(10) NOT NULL default '0',
  `AddedBy` int(10) unsigned NOT NULL default '0',
  `Admin_id` int(10) NOT NULL default '0',
  `Template_id` int(10) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `Page` (`Page`),
  KEY `EmailValid` (`EmailValid`),
  KEY `LinkBackURLValid` (`LinkBackURLValid`),
  KEY `AddedBy` (`AddedBy`),
  KEY `ID` (`ID`),
  KEY `Category` (`Category`),
  KEY `URL` (`URL`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `dir_links`
-- 

INSERT INTO `dir_links` (`ID`, `Title`, `Category`, `Status`, `URL`, `Description`, `Full_Description`, `UrlHeader`, `LinkBackURL`, `LinkBackURLValid`, `Alt_domain`, `Email`, `EmailValid`, `Rank`, `Pagerank`, `Page`, `Date`, `AddedBy`, `Admin_id`, `Template_id`) VALUES (1, 'SkaLinks.com', 1, '0', 'http://www.skalinks.com/', 'Powerful Link Management software written in PHP. Search engines friendly structure, advanced advertisement system, advanced multiple editors tools. Broken and reciprocal links check. Absolutely FREE link exchange software.', '', 200, '', 'n', '', 'admin@skalinks.com', 'y', 0, 5, 0, 1139467029, 0, 0, 4);

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_params`
-- 

CREATE TABLE `dir_params` (
  `Name` varchar(30) NOT NULL default '',
  `VALUE` mediumtext NOT NULL,
  `type` enum('text','area','select') NOT NULL default 'text',
  `Range` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `section_name` varchar(20) NOT NULL default '',
  `order_display` int(5) NOT NULL default '0',
  UNIQUE KEY `Name` (`Name`),
  KEY `section_name` (`section_name`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_params`
-- 

INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('link_open', '1', 'select', '0=in current window;1=in new window', 'Link Open Mod (1 - new window, 0 - not in new window) ', 'display', 3);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('t_admin_link_approved', 'Dear Sir/Madam,\r\n\r\nYour site will be reviewed within 24 hours.\r\n\r\nIf you didn''t place reciprocal link(s) to <our_SiteBizname> yet, please use the following information:\r\n---------\r\n<LinkBackMessage>\r\n---------\r\nAll the links in our directory are direct, so they will improve your link popularity\r\nand Google PageRank.\r\n\r\nWe truly hope to send many visitors your way.\r\n\r\nThank you,\r\n<our_SiteBizname> administration team\r\n<our_LinksEmail>', 'area', '', 'Message when visitor submit link for approve', 'let_template', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('t_admin_link_disapproved', 'Dear Sir/Madam,\r\n\r\nLink to <your_LinkSite> in our directory has been disapproved.\r\n\r\nIf you have questions, please feel free to ask\r\n<our_SiteBizname> administration team\r\n<our_LinksEmail>', 'area', '', 'Message that is sent to email when status is changed to ''Disapproved''', 'let_template', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('t_admin_link_submitted', 'Dear Sir/Madam,\r\n\r\nWe are glad to inform you that a link to site <your_LinkSite> has been\r\npublished to <our_SiteBizname> directory. \r\nYour link is located at <our_LinkLocation>\r\n\r\nIf you didn''t place reciprocal link(s) to <our_SiteBizname> yet, please use the following information:\r\n---------\r\n<LinkBackMessage>\r\n---------\r\nThis will help your link stay in our directory permanently.\r\n\r\nAll the links in our directory are direct, so they will improve your link popularity\r\nand Google PageRank.\r\n\r\nWe truly hope to send many visitors your way.\r\n\r\nThank you,\r\n<our_SiteBizname> administration team\r\n<our_LinksEmail>', 'area', '', 'Message that is sent when a link is submitted', 'let_template', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('mod_rewrite', '1', 'select', '0=off;1=on', 'ReWrite Engine', 'dis_url', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('show_dirtree', '1', 'select', '0=only for admin;1=display for all', '1 - display "directory tree" link for all, 0 - only for admin', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('t_admin_link_changed', 'Hello!\r\nWe are glad to inform you, that your link to site <your_LinkSite> was modifyed. There are new attributes of your link:\r\nTitle:<your_LinkTitle>\r\nDecription:<your_LinkDescription>\r\nEmail:<your_LinkEmail>\r\nRank:<your_LinkRank>\r\nYou can browse your link here <our_LinkLocation>\r\nThank you\r\n<our_SiteBizname> Administration team\r\n<our_LinksEmail>\r\n\r\nIf you didn''t place reciprocal link(s) to <our_SiteBizname> yet, please use the following information:\r\n---------\r\n<LinkBackMessage>\r\n---------\r\nThis will help your link stay in our directory permanently.\r\n\r\nAll the links in our directory are direct, so they will improve your link popularity\r\nand Google PageRank.\r\n\r\nWe truly hope to send many visitors your way.\r\n\r\nThank you,\r\n<our_SiteBizname> administration team\r\n<our_LinksEmail>', 'area', '', 'Message that is sent when a link was modifyed', 'let_template', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('count_ads_pos', 'top middle left bottom', 'text', '', 'Location of the banners can be specified by the key words and separeted by the spaces', 'ads_setting', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('dir_links_per_page', '10', 'text', '', 'Number of links displayed on a page', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('nav_links_per_page', '4', 'text', '', 'Number of pages in navigation line', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('t_admin_link_deleted', 'Dear Sir/Madam,\r\n\r\nYour link  <your_LinkSite> has been deleted from <our_LinkLocation> category, probably because you didn''t place reciprocal link(s) to <our_SiteBizname>. To see your link again, please add a link to our site and inform us.\r\n\r\nThank you,\r\n<our_SiteBizname> administration team\r\n<our_LinksEmail>', 'area', '', 'Message when link deleted', 'let_template', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('linkback_required', '1', 'select', '0=on;1=off', 'LinkBackURL Mod, 1 - disable, 0 - enable', 'linkback_setting', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('dir_links_rank_per_page', '5', 'text', '', 'Number of links displayed with rank on a page', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('show_admin_ads', '1', 'select', '1=display ads for all;0=display ads only for visitors', '1 - display ads for admin, else 0', 'ads_setting', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('default_admin_email', 'default@email.com', 'text', '', 'Default Admin Email', 'site_setting', 4);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('number_search_display', '10', 'text', '', 'Number of search results display', 'display', 3);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('color_theme', 'violet', 'select', 'blue=blue;green=green;red=red;black=black;orange=orange;violet=violet', 'Color theme', 'display', 8);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('recip_verify_mod', '1', 'select', '0=full mode;1=simple mod', '', 'linkback_setting', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('pagerank_set', '1', 'select', '0=disable;1=enable', '', 'site_setting', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('default_admin_name', 'Editor', 'text', '', '', 'site_setting', 5);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('default_mail_theme', 'Message', 'text', '', '', 'site_setting', 6);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('listing_url_view', 'detailed/listing<listing_id>.html', 'text', '', '', 'dis_url', 1);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('cat_pages_view', 'page<page_number>.html', 'text', '', '', 'dis_url', 3);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('cat_index_url', 'index.html', 'text', '', '', 'dis_url', 4);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('visitor_add_cat', '1', 'select', '0=off;1=on', '', 'site_setting', 0);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('num_cols_cat', '3', 'text', '', '', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('num_subcats', '3', 'text', '', '', 'display', 2);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('register_users', '1', 'select', '0=disable;1=enable', '', 'site_setting', 3);
INSERT INTO `dir_params` (`Name`, `VALUE`, `type`, `Range`, `description`, `section_name`, `order_display`) VALUES ('same_site_display', '<br>Feel free to submit your link to \r\n<a href="http://www.skalinks.com/dir/">SkaLinks Directory</a><br>\r\nThank you!', 'area', '', '', 'display', 7);

-- --------------------------------------------------------

-- 
-- Table structure for table `dir_parent`
-- 

CREATE TABLE `dir_parent` (
  `Child_id` int(10) NOT NULL default '0',
  `Parent_id` int(10) NOT NULL default '0',
  KEY `Child_id` (`Child_id`),
  KEY `Parent_id` (`Parent_id`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_parent`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_related`
-- 

CREATE TABLE `dir_related` (
  `main_cat` int(10) NOT NULL default '0',
  `related_cat` int(10) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_related`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_searches`
-- 

CREATE TABLE `dir_searches` (
  `Pattern` varchar(255) NOT NULL default '',
  `Count_Hits` int(10) NOT NULL default '1',
  KEY `Pattern` (`Pattern`,`Count_Hits`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_searches`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `dir_settings`
-- 

CREATE TABLE `dir_settings` (
  `Package_ver` int(2) NOT NULL default '0'
) TYPE=MyISAM;

-- 
-- Dumping data for table `dir_settings`
-- 

INSERT INTO `dir_settings` (`Package_ver`) VALUES (15);
