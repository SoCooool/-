INSERT INTO `dir_params` ( `Name` , `VALUE` , `type` , `description` , `order_display` )
VALUES (
'link_open', '1', 'text', 'Link Open Mod (1 - new window, 0 - not in new window) ', '9'
);
CREATE TABLE `dir_settings` (
`Package_ver` INT( 2 ) NOT NULL
);
INSERT INTO `dir_settings`(`Package_ver`)
VALUES ('12');
