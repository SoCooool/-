ALTER TABLE `dir_admins` ADD `Type` ENUM( '1', '2' ) NOT NULL ;
ALTER TABLE `dir_categories` ADD `Editor_id` INT( 10 ) DEFAULT '0' NOT NULL ;
UPDATE `dir_admins` SET `Type`='2';
ALTER TABLE `dir_params` CHANGE `type` `type` ENUM( 'text', 'area', 'select' ) DEFAULT 'text' NOT NULL;
ALTER TABLE `dir_params` ADD `Range` VARCHAR( 255 ) NOT NULL AFTER `type` ;
UPDATE `dir_params` SET `type` = 'select',
`Range` = '0=in current window;1=in new window' WHERE `Name` = 'link_open' LIMIT 1 ;
UPDATE `dir_params` SET `type` = 'select',
`Range` = '0=Off;1=On' WHERE `Name` = 'mod_rewrite' LIMIT 1 ;
UPDATE `dir_params` SET `type` = 'select', `Range` = '1=only for admin;0=display for all' WHERE `Name` = 'show_dirtree' LIMIT 1 ;
UPDATE `dir_params` SET `type` = 'select',
`Range` = '0=on;1=off' WHERE `Name` = 'linkback_required' LIMIT 1 ;
UPDATE `dir_params` SET `type` = 'select',
`Range` = '0=off;1=on' WHERE `Name` = 'show_admin_ads' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '1' WHERE `Name` = 'mod_rewrite' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '1' WHERE `Name` = 'count_ads_pos' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '1' WHERE `Name` = 'linkback_required' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '1' WHERE `Name` = 'show_admin_ads' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '2' WHERE `Name` = 'show_dirtree' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '2' WHERE `Name` = 'nav_links_per_page' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '2' WHERE `Name` = 'dir_links_per_page' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '2' WHERE `Name` = 'dir_links_rank_per_page' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '3' WHERE `Name` = 'number_search_display' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '3' WHERE `Name` = 'link_open' LIMIT 1 ;
UPDATE `dir_params` SET `order_display` = '4' WHERE `Name` = 'default_admin_email' LIMIT 1 ;
UPDATE `dir_params` SET `Range` = '0=display ads for all;1=display ads only for visitors' WHERE `Name` = 'show_admin_ads' LIMIT 1 ;
ALTER TABLE `dir_links` ADD `Alt_domain` VARCHAR( 100 ) NOT NULL AFTER `LinkBackURLValid` ;
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `order_display` )
VALUES (
'recip_verify_mod', '0', 'select', '0=full mode;1=simple mod', '', '1'
);
ALTER TABLE `dir_links` ADD `Pagerank` INT( 2 ) DEFAULT '0' NOT NULL AFTER `Rank` ;
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `Range` , `description` , `order_display` )
VALUES (
'color_theme', 'blue', 'select', 'blue=blue;green=green;red=red;black=black', 'Color theme', '8'
);
DELETE FROM `dir_settings`;
INSERT INTO `dir_settings`(`Package_ver`) VALUES('14');
