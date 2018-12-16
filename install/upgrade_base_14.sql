ALTER TABLE `dir_params` ADD `section_name` VARCHAR( 20 ) NOT NULL AFTER `description` ;

ALTER TABLE `dir_params` ADD INDEX ( `section_name` ) ;
UPDATE `dir_params` SET `section_name` = 'let_template' WHERE `Name` = 't_admin_link_approved' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'let_template' WHERE `Name` = 't_admin_link_disapproved' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'let_template' WHERE `Name` = 't_admin_link_submitted' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'let_template' WHERE `Name` = 't_admin_link_changed' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'let_template' WHERE `Name` = 't_admin_link_deleted' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'link_open' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'show_dirtree' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'dir_links_per_page' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'nav_links_per_page' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'dir_links_rank_per_page' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'number_search_display' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'display' WHERE `Name` = 'color_theme' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'linkback_setting' WHERE `Name` = 'linkback_required' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'linkback_setting' WHERE `Name` = 'recip_verify_mod' LIMIT 1 ;

UPDATE `dir_params` SET `Range` = '', `section_name` = 'ads_setting' WHERE `Name` = 'count_ads_pos' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'ads_setting' WHERE `Name` = 'show_admin_ads' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'dis_url' WHERE `Name` = 'mod_rewrite' LIMIT 1 ;

UPDATE `dir_params` SET `section_name` = 'site_setting' WHERE `Name` = 'default_admin_email' LIMIT 1 ;

INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'pagerank_set', 'on', 'select', '0=disable;1=enable', '', 'site_setting', '0'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'default_admin_name', 'Editor', 'text', '', '', 'site_setting', '5'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'default_mail_theme', 'Message', 'text', '', '', 'site_setting', '6'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'listing_url_view', 'detailed/listing<listing_id>.html', 'text', '', '', 'dis_url', '1'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'cat_pages_view', 'page<page_number>.html', 'text', '', '', 'dis_url', '3'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'cat_index_url', '', 'text', '', '', 'dis_url', '4'
);
ALTER TABLE `dir_categories` CHANGE `LeftText` `BottomText` MEDIUMTEXT NOT NULL;
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'visitor_add_cat', '1', 'select', '0=off;1=on', '', 'site_setting', '0'
);
ALTER TABLE `dir_links` ADD `Full_Description` MEDIUMTEXT NOT NULL AFTER `Description` ;
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'num_cols_cat', '3', 'text', '', '', 'display', '2'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'num_subcats', '3', 'text', '', '', 'display', '2'
);
ALTER TABLE `dir_links` CHANGE `AddedBy` `AddedBy` INT( 10 ) UNSIGNED NOT NULL; 
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'register_users', '1', 'select', '0=disable;1=enable', '', 'site_setting', '3'
);
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `section_name` , `order_display` )
VALUES (
'same_site_display', '<br>Feel free to submit your link to <a href="http://www.skalinks.com/dir/">SkaLinks Directory</a><br>Thank you!', 'area', '', '', 'display', '7'
);
DELETE FROM `dir_settings`;
INSERT INTO `dir_settings`(`Package_ver`) VALUES('15');
UPDATE `dir_params` SET `Range` = 'blue=blue;green=green;red=red;black=black;orange=orange;violet=violet' WHERE `Name` = 'color_theme' LIMIT 1 ;
