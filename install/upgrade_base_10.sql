ALTER TABLE `dir_admins` ADD `ID` INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
ALTER TABLE `dir_admins` ADD `Email` VARCHAR(60) NOT NULL;
ALTER TABLE `dir_links` ADD `Admin_id` INT(10) DEFAULT '0' NOT NULL;
DELETE FROM `dir_params` WHERE `Name`='thumb_width';
DELETE FROM `dir_params` WHERE `Name`='thumb_height';
INSERT INTO `dir_params`(`Name`,`VALUE`,`type`,`description`) VALUES ('default_admin_email','','text','Default Admin Email');
ALTER TABLE `dir_params` ADD `order_display` INT( 5 ) DEFAULT '0' NOT NULL ;
