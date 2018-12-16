CREATE TABLE `dir_searches` (
  `Pattern` varchar(255) NOT NULL default '',
  `Count_Hits` int(10) NOT NULL default '1',
  KEY `Pattern` (`Pattern`,`Count_Hits`)
) TYPE=MyISAM;
INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `description` , `order_display` )
VALUES (
'number_search_display', '10', 'text', 'Number of search results display', '10') ;
DELETE FROM `dir_settings`;
INSERT INTO `dir_settings`(`Package_ver`) VALUES('13');
CREATE TABLE `dir_letter_templates` (`ID` INT( 10 ) NOT NULL AUTO_INCREMENT ,`Template` MEDIUMTEXT NOT NULL ,`Status` ENUM( '0', '1' ) DEFAULT '0' NOT NULL ,PRIMARY KEY ( `ID` ));
INSERT INTO `dir_letter_templates` ( `ID` , `Template` , `Status` ) VALUES ('', '<our_MainSiteTitle> <our_MainSiteURL> <our_MainSiteDescription>', '1');
CREATE TABLE `dir_letter_templates_binding` (`Cat_id` INT( 10 ) NOT NULL ,`Template_id` INT( 10 ) NOT NULL);
ALTER TABLE `dir_letter_template_binding` ADD PRIMARY KEY ( `Cat_id` );
ALTER TABLE `dir_links` ADD `Template_id` INT( 10 ) DEFAULT '0' NOT NULL ;
