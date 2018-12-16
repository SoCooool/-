<?php
/*
 *	SkaLinks, Links Exchange Script
 * (c) Skalfa eCommerce, 2005
 *
 * TERMS OF USE
 * You are free to use, modify and distribute the original code of SkaLinks software
 * with the following restrictions:
 * 1) You may not remove Skalfa eCommerce copyright notices from any parts of Skalinks software
 * code.
 * 2) You may not remove or modify "powered by" links to vendor's site from any web-pages of
 * SkaLinks script.
 * 3) You may use but may not distribute original or modified version of SkaLinks software
 * for commercial purposes.
 * Complete License Agreement text: http://www.skalinks.com/license.php
 *
 * Technical support: http://www.skalinks.com/support/
 */

$_skalinks_lang = array
(
'header_links' => array(
	'add_cat_link' => 'Add Category',
	'add_url_link' => 'Add Link',
	'ads_settings' => 'Advertisement',
	'dir_tree' => 'Directory Tree',
	'editors' => 'Editors',
	'find_url' => 'Find URL',
	'link_ads' => 'Advertisement',	
	'letter_template' => 'Letter Templates',
	'login'	=> 'Login',
	'register' => 'Register as Editor',
	'settings' => 'Settings',
	'ctrlpanel' => 'Control Panel',
	'directory' => 'Directory',
	'dir_name_prefix' => ' - Directory',	
),
'msg' => array(
	'admin_added' => 'Editor account added.',
	'admin_exists' => 'This editor already exists!',
	'admin_deleted' => 'Editors were deleted.',
	'ads_deleted' => 'Advertisement was deleted from this page.',
	'add_cat_root' => 'You can not create new category in the root directory!',
	'add_url_root_cat' => 'You can not submit a link to the root directory. Please, choise category before.',
	'banner_not_checked' => 'At least one advertisement should be checked for performing this action.',
	'banner_added' => 'Advertisement was added.',
	'banner_changed' => 'Advertisements were modified.',
	'banner_deleted' => 'Advertisements were deleted.',
	'backup_deleted' => 'Backup file was deleted from server',
	'backup_restored' => 'Database was successfully restored from dump file',
	'cat_deleted' => 'Category was deleted.',
	'cat_not_deleted' => 'Category was not deleted.',
	'cat_not_checked' => 'At least one category should be checked for performing this action.',
	'cat_added' => 'Category was added.',
	'cat_approved' => 'Category was approved.',
	'cat_disapproved' => 'Category was disapproved.',
	'cat_not_approved' => 'Categories were not approved!',
	'cat_dissapproved' => 'Categories disapproved.',
	'cat_not_dissapproved' => 'Categories not disapproved',
	'changes_done' => 'Changes were applied!<br>',
	'cat_changed' => 'Category was modified.',
	'cat_not_changed' => 'Category was not modified.',
	'cat_exists' => 'This category is already exists!',
	'cats_built' => 'Categories were rebuilt.',
	'cats_not_built' => 'Categories were not built!',
	'cur_editor_status' => 'You can not change your status to "editor"',
	'comment_saved' => 'The comment for link was saved',
	'del_cur_editor' => 'You can`t delete current editor account!',
        'del_default_template' => 'You can`t delete default letter template, only change!',
	'db_backup_created' => 'Database backup was successfully created',
	'db_backup_not_created' => 'Error while creating Database backup!<br>Please, set chmod 777 for "db_backup" folder in "admin" folder.',
	'edit_link_root' => 'Links can not be placed into the root category!',
	'editor_saved' => 'The information about editors was saved',
	'first_register'	=> 'Thank you for registration, now you are logged as editor!',
	'htaccess_change' => 'Please, replace code in .htaccess file with:<br><br>',
	'inf_incomplete' => 'Incomplete information!',
	'link_not_found' => 'Link was not found.',
	'links_checked' => 'Links were verified.',
	'links_not_checked' => 'Links were not verified.',
	'link_added' => 'Your link was submitted, Thank you!',
	'link_changed' => 'Link was modified.',
	'link_not_changed' => 'Link was not modified.',
	'link_not_checked' => 'At least one link should be checked for performing this action.',
	'link_checked' => 'Links were verified.',
	'link_approved' => 'Links were approved.',
	'link_disapproved' => 'Links were disapproved.',
	'link_not_disapproved' => 'Links were not disapproved!',
	'link_not_approved' => 'Links were not approved!',
	'link_deleted' => 'Links were deleted.',
	'link_not_chosen' => 'You did not choose a link!',
	'link_status_changed' => 'Link status was changed.',
	'link_exists' => 'This link already exists!',
	'pagerank_set' => 'Pagerank was set for all links',
	'not_admin' => 'You are not authorized to view this page.',
	'not_cat_editor' => 'You are not the editor of this category!',
	'not_link_editor' => 'You can not edit links in this category.You are not the editor of this category!',
	'not_cat_onwer' => 'You are not the onwer of category, where you try to move this category!',
	'not_link_cat_onwer' => 'You are not the onwer of category, where you try to move this link!',
	'rel_cat_added' => 'Related category was added.',
	'rel_cat_deleted' => 'Related category was deleted.',
	'rel_cat_exists' => 'Related category already exists!',
	'register_users_disable' => 'Registration of new users is disabled!',
	'template_added' => 'Letter subtemplate was added.',
	'sel_baner_before' => 'Please, select the ads for modify!',
	'select_dump_file' => 'Please, select dump file before!',
	'template_changed' => 'Letter subtemplates were changed.',
	'templates_not_all_changed' => 'Letter subtemplates were changed, expect some',
	'template_deleted' => 'Template was deleted.',
	'template_exists' => 'Letter subtemplate already exists!',
	'template_not_changed' => 'Incomplate information for letter subtemplate!',
	'tem_not_checked' => 'Please, check the subtemplate before!',
	'upl_file_not_sel' => 'Please, select file for uploading!',
	'upl_file_other_err' => 'Server error during upload file!',
	'upl_file_file_empty' => 'File is empty, please select other!',
	'upl_file_max_size' => 'Size of uploading file is too much!',
	'upl_file_not_post' => 'Security alert! You try to upload with none HTTP POST method!',
	'upl_file_exec_file' => 'Security alert! You try to upload executable file to server!',
	'upl_file_non_file_type' => 'Please, upload only file!',
	'upl_file_sys_error' => 'Server error while move file to db backup folder!',
	'upl_file_success' => 'DB backup was successfully uploaded',
	'vir_cat_added' => 'Category was added as virtual.',
	'vir_cat_deleted' => 'Category was deleted from virtual.',
	'vir_cat_exists' => 'This category is already present as virtual in this directory!',
	'incor_count_cat_item' => 'Incorrect count of categories, the number of titles and dirs is different!',
	'visitor_not_add_cat' => 'You can not submit categories, please, login before!',
),

'add_cat' => array( 
	'category' => 'Category:',
	'cat_dir' => 'Suggest Subcategory: ',
	'cat_title' => 'Suggest Subcategory Directory: ',
	'cat_title_more' => 'Name of cat\'s folder in file system',
	'cat_topdesc' => 'Suggest Subcategory Top Description: ',
	'cat_topdesc_more' => 'This description will be displayed <br> at the top of category page',
	'cat_bottomdesc' => 'Suggest Subcategory Bottom Description: ',
	'cat_bottomdesc_more' => 'This description will be displayed <br> at the bottom of category page',
	'cat_metadesc' => 'Suggest Subcategory Short Meta Description: ',
	'cat_metadesc_more' => 'Specify meta description for this category',
	'cat_editor' => 'Category editor: ',
	'description' => 'Please, make sure that this specific parent category fits your subcategory best.',	
	'none_editor' => 'None',
	'submit_cat' => 'Submit category',
	'title' => 'Directory - Add Category',
	'tit_title' => 'Please, insert the correct title of category',
	'dir_title' => 'Please, use only ( A-Z, a-z , _ ) symbols in category dir name',
	'topdesc_title' => 'Please, insert the short description, which will be displayed at the top of category page',
	'bottomdesc_title' => 'Please, insert the short description, which will be displayed at the bottom of category page',
	'metadesc_title' => 'Please, insert the meta description keywords, which will be displayed at the meta tag og category page',
),
'add_link' => array(
        'category' => 'Category:',	
	'description' => 'Please, make sure that this specific category is the best choice for your link.',
	'link_url' => 'Resource URL: ',
	'link_back' => 'Linkback URL:',
	'link_back_desc' => 'Page address <br> that contains reciprocal link.',
	'link_title' => 'Resource Title:',
	'link_title_desc' => '',
	'link_description' => 'Resource Short Description:',
	'link_full_description' => 'Resource Extended Description:',
	'link_email' => 'Resource Email:',
	'link_alt_domain' => 'Alternative domain:',
	'link_alt_domain_desc' => 'Domain name <br> to check LinkBackURL for',
	'letter_temp' => 'Letter subtemplate with custom reciprocal link title, url and description request for links submitted to this category',
	'submit_link' => 'Submit Link',
	'title' => 'Directory - Add Link',
	'url_title' => 'Please, insert correct URL of your link',
	'tit_title' => 'Please, insert the correct title of your link',
	'desc_title' => 'Please, insert the short description of your link',
	'desc_full_title' => 'Please, insert the full description of your link',
	'email_title' => 'Please, insert your email',
),
'search_url' => array( 
	'submit_search' => 'Search',
	'search_desc' => 'Find URL in directory',
	'url_cat' => 'Category:',
	'link_http_code' => 'HTTP code: ',
	'search_results' => 'Most popular related searches: ',
	'type_url' => 'By URL',
	'type_title' => 'By Link Title',	
	'type_desc' => 'By Link Description',
),
'ads' => array(
	'add_ad' => 'Add ads',
	'delete_ad' => 'Delete Ads',
	'modify_ad' => 'Modify Ads',
	'title' => 'Advertisements',
	'cur_ads' => 'Current Advertisement',	
),
'let_tem' => array(
	'add_tem' => 'Add Subtemplate',
	'delete_tem' => 'Delete Subtemplate',
	'modify_tem' => 'Modify Subtemplate',
	'title' => 'Submit Letter Subtemplate',
	'cur_tem' => 'Current Subtemplates',
	'select_template' => 'Select other letter subtemplate',
	'select' => 'Select',
),

'settings_section' => array(
	'let_template' => 'Letters templates',
	'dis_url' => 'URL display',
	'ads_setting' => 'Ads settings',
	'linkback_setting' => 'BackLink settings',
	'display' => 'Display',
	'site_setting' => 'Site settings',
	),

'settings' => array(
	'color_theme' => 'Color theme',
	'count_ads_pos' => 'Advertisement locations',
	'cat_pages_view' => 'Category pages URL',
	'cat_index_url' => 'Category index page URL',
	'dir_links_rank_per_page' => 'Number of links (ranked) displayed on a page',
	'dir_links_per_page' => 'Number of links (not ranked) displayed on a page',
	'default_admin_email' => 'Default Editor Email',
	'default_admin_name' => 'Default Editor Name',
	'default_mail_theme' => 'Mail theme',
	'linkback_required' => "LinkBackURL Mode ( on - LinkBack URL mandatory )",
	'listing_url_view' => 'Listing page URL',
	'mod_rewrite' => "ReWrite Engine Mode",
	'nav_links_per_page' => 'Number of pages in navigation line',
	'submit_settings' => 'Save Changes',
	'show_dirtree' => "Directory Tree Link Mode",
	'show_admin_ads' => 'Ads Display Mode',
	'same_site_display' => 'Promotion to exchange links with others site also',
	'title' => 'Settings',
	'var_table_name' => 'Names and descriptions of variable, which editor can use in letter templates',
	'var_mod_rewrite_table_name' => 'Use this variables in URL configs',
	'table_name' => 'Variable Name',
	'table_description' => 'Description',
	't_admin_link_approved' => 'Message that is sent  when visitor add a link for approve',
	't_admin_link_disapproved' => "Message that is sent when a link gets 'Disapproved' status",
	't_admin_link_submitted' => 'Message that is sent when a link is submitted',	
	't_admin_link_changed' => "Message that is sent when a link is modified",	
	't_admin_link_deleted' => 'Message that is sent when a link is deleted',
	'link_open' => "Link Open Mod",
	'number_search_display' => 'Number of search results display',
	'num_cols_cat' => 'Number of categories columns',
	'num_subcats' => 'Number of displaying subcats',
	'register_users' => 'Visitors can register in directory',
	'recip_verify_mod' => 'LinkBack URL verification mode',
	'pagerank_set' => 'Links PageRank mod',
	'visitor_add_cat' => 'Visitors can submit categories for approve',
),
'letters_var' => array(
	0 => array(
		'name' => '<your_LinkSite>',
		'desc' => 'URL attribute of the link;',
	),
	1 => array(
		'name' => '<your_LinkRank>',
		'desc' => 'Rank attribute of the link;',
	),
	2 => array(
		'name' => '<your_LinkEmail>',
		'desc' => 'Email attribute of the link;',
	),
	3 => array(
		'name' => '<your_LinkDescription>',
		'desc' => 'Description attribute of the link;',
	),
	4 => array(
		'name' => '<your_LinkTitle>',
		'desc' => 'Title attribute of the link;',
	),
	5 => array(
		'name' => '<our_MainSiteURL>',
		'desc' => 'URL of the site home page;',
	),
	6 => array(
		'name' => '<our_MainSiteTitle>',
		'desc' => 'Title of the site home page;',
	),
	7 => array(
		'name' => '<our_MainSiteDescription>',
		'desc' => 'Site description;',
	),
	8 => array(
		'name' => '<our_SiteBizname>',
		'desc' => 'Site brand name;',
	),
	9 => array(
		'name' => '<our_LinkLocation>',
		'desc' => 'Link URL, where visitor can find his link;',
	),
	10 => array(
		'name' => '<our_ListingPage>',
		'desc' => 'Location, where visitor can find full info about his link;',
	),
	11 => array(
		'name' => '<our_LinksEmail>',
		'desc' => 'Email address of the current editor;',
	),
	12 => array(
		'name' => '<LinkBackMessage>',
		'desc' => 'Special string code, that will be replaced by the text of a chosen subtemplate. Subtemplates can be added/edited on the “Letter Templates” page and can be selected for any category on the category content page;',
	),
),
'mod_rewrite_vars' => array(
	0 => array(
		'name' => '<listing_id>',
		'desc' => 'ID of link in database',
	),
	1 => array(
		'name' => '<page_number>',
		'desc' => 'Number of page in category',
	),
),
'editors' => array(
	'add_editor' => 'Add editor account',
	'email' => 'Email',
	'type' => 'Type',
	'type_editor' => 'Editor',
	'type_seditor' => 'Super Editor',
	'name' => 'Name',
	'not_checked_ed' => 'Please, select the edtior before',
	'new_pass' => 'New Password',
	'passwd' => 'Password',
	'submit_del' => 'Delete',
	'submit_save' => 'Save',
	'submit_addeditor' => 'Add Editor',
	'title' => 'Editors',
	'cur_editors' => 'Editors accounts:',
),
'ctrlpanel' => array(
	'admin_name' => 'Admin Name',
	'appr_title' => 'Approve',
	'category' => 'Categories',
	'db_title' => 'DataBase Utilities',
	'db_backup_create' => 'Create Backup',
	'db_backup_download_hint' => 'download backup',
	'db_backup_select_backup' => 'Select backup file',
	'db_backup_restore' => 'Restore',
	'db_backup_download' => 'Download',
	'db_backup_upload' => 'Upload backup',
	'db_backup_delete' => 'Delete',
	'get_all_pagerank' => 'Set Pagerank for all links',
	'links' => 'Links',
	'link_status_desc' => 'Links HTTP status:',
	'login' => 'Login',
	'logged_as' => 'You are logged as: ',
	'rebuild_cat' => 'Rebuild Categories',
	'logout' => 'Logout',
	'invalid_email' => 'Invalid Email:',
	'invalid_backurl' => 'Invalid BackURL:',
	'maint_title' => 'Maintenance',
	'password' => 'Admin Password',
	'title' => 'Control Panel',
	'no_broken_links' => 'No link in database',
),
'cat' => array( 
	'add_ads' => 'Add Advertisement to page',
	'add_template' => 'Add Letter Template for category',
	'approve' => 'Approve',
	'delete' => 'Delete',
	'disapprove' => 'Disapprove',
	'edit' => 'Edit',
	'editor_name' => 'Editor: ',
	'editor_none' => 'None',
	'seealso' => 'See also:',
	'title' => 'Directory',
),
'dirtree' => array(
	'title' => 'Directory Tree',
),
'edit_cat' => array(
	'add_rel_cat' => 'Add Related Category',
	'add_vir_cat' => 'Add This Category as Virtual to: ',
	'bottomdesc' => 'Suggest Subcategory Bottom Description: ',
	'cur_vir_cat' => 'Current Virtual Categories',
	'cur_rel_cat' => 'Current Related Categories',
	'change_parent_cat' => 'Change Parent Category',
	'dir' => 'Category Dir',	
	'editor' => 'Category Editor',
	'none_editor' => 'None',
       	'parent_cat' => 'Parent Category',
	'rel_cat' => 'Related Category',
	'metadesc' => 'Suggest Subcategory Short Meta Description: ',
	'onwer' => 'onwer',
	'submit_cat' => 'Save',
	'submit_disappr_cat' => 'Disapprove cat',
	'submit_appr_cat' => 'Approve cat',
	'title' => 'Category Title',
	'topdesc' => 'Suggest Subcategory Top Description: ',
	'vir_cat' => 'Virtual Category',
	'tit_title' => 'Please, insert correct title of category',
	'dir_title' => 'Please, use only ( A-Z, a-z , _ , - ) symbols in category dir name',
	'dir_topdesc' => 'Please, insert the short description, which will be displayed at the top of category page',
	'dir_bottomdesc' => 'Please, insert the short description, which will be displayed at the bottom of category page',
	'dir_metadesc' => 'Please, insert the meta description keywords, which will be displayed at the meta tag og category page',
),
'link_nav' => array(
	'first' => 'First',
	'last' => 'Last',
	'next' => 'Next',
	'previous' => 'Previous',	
),
'link' => array(
	'approve' => 'Approve',
	'check_recip' => 'Check reciprocal links',
	'check_broken' => 'Check broken links',
	'creator_name' => 'Creator: ',
	'creator_visitor' => 'Visitor',
	'delete' => 'Delete',
	'disapprove' => 'Disapprove',
	'edit' => 'Edit',
	'editor_name' => 'Last modified by: ',
	'linkback' => 'LinkBack URL: ',	
	'linkback_none' => 'none',	
	'more_info' => 'More info',
),
'edit_link' => array(
	'link_alt_domain' => 'Alternative domain:',
	'category' => 'Category',
	'change_cat' => 'Change Category',
	'comment' => 'Comments',
	'creator_name' => 'Creator Name:',
	'creator_visitor' => 'Visitor',
	'editor_name' => 'Last modified by',
	'http_status' => 'HTTP status:',
	'link_url' => 'Resource URL:',
	'link_title' => 'Resource Title:',
	'link_description' => 'Resource Description:',
	'link_rank' => 'Rank',
	'link_page' => 'Page:',	
	'link_back' => 'Linkback URL:',
	'link_email' => 'E-Mail:',
	'link_extend_description' => 'Resource Extended Description:',
	'no_editor' => 'None',
	'owner' => 'owner',	
	'send_message' => 'Optional Message',
	'submit_modify_link' => 'Modify Link',
	'submit_appr_link' => 'Approve Link',
	'submit_disappr_link' => 'Disapprove Link',
	'submit_save_comment' => 'Save Comment',
	'submit_send_message' => 'Send',
	'send_email' => 'Send Email',
	'url_title' => 'Please, insert correct URL of link',
	'tit_title' => 'Please, insert correct title of link',
	'desc_title' => 'Please, insert correct description of link',
	'email_title' => 'Please, insert correct email address',
),
'status' => array(
	'not_approved' => 'Not approved',
),
'add_ads' => array(
	'ads_pos' => 'Position',	
	'submit_ads' => 'Add ads to page',	
	'submit_del' => 'Delete',
	'title' => 'Advertisement',
),
'add_template' => array(
	'cur_templates' => 'Current category letter subtemplate',
	'submit_tem' => 'Add Template',
	'submit_del' => 'Delete Template',
	'title' => 'Category Letter Templates',
),
'list_links' => array(
	'title_approve' => 'Links to approve',
	'title_http_status' => 'Links with HTTP status: ',
	'title_invalid_email' => 'Links with invalid email',
	'title_invalid_backurl' => 'Links with invalid BackURL'
),
'list_cats' => array(
	'parent' => 'Parent: ',
	'title_approve' => 'Categories to approve',
),
'install' => array(
	'step1' => array(
		'title' => 'Step 1. Paths and URLs',
		'url_main_site' => array(
			'title' => '$_url_main_site',
			'message' => 'Please, enter correct URL of the main site.',
			'desc' => 'Here you should specify the correct URL of your main site’s home page. For example: http://www.mysite.com/
			Note that trailing “/” symbol is mandatory!',
		),
		'url_root' => array(
			'title' => '$_url_root',
			'message' => 'Please, enter correct URL of the script directory.',
			'desc' => 'Here you should specify the correct URL of the directory with SkaLinks script. For example: http://www.mysite.com/dir/
			Note that trailing “/” symbol is mandatory!',
		),
		'dir_root' => array(
			'title' => '$_dir_root',
			'message' => 'Please, enter correct path to the script root directory.',
			'desc' => 'Here you should specify the correct path to the home directory of your site in the server file system. For example: /my/home/directory/
Note that trailing “/” symbol is mandatory!',
		),
	),
	'step2' => array(
		'title' => 'Step 2. Site options',
		'page_title' => array(
			'title' => '$_page_title',
			'message' => 'Please enter correct title of your site.',
			'desc' => 'The value that is assigned to this variable will appear as a part of every page\'s title generated by the script.',
		),
		'site_full' => array(
			'title' => '$_site_full',
			'message' => 'Please enter correct full name of your site.',
			'desc' => 'The full name of your site that will be used throughout the pages. For example: “My Site Online Services”.',
		),
		'site_description' => array(
			'title' => '$_site_description',
			'message' => 'Please enter correct description of your site.',
			'desc' => 'Full description of your site that will be used in letter templates.',
		),		
		'site_brand' => array(
			'title' => '$_site_brand',
			'message' => 'Please enter correct brand name of your site.',
			'desc' => 'Brand name’s purpose is close to the one of the full name. It is a shorter presentation of the site name. For example: “MySite” – this brand name will be used in e-mail templates.',
		),
	),
	'step3' => array(
		'title' => 'Step 3. MySQL Database configuration',
		'mysql_username' => array(
			'title' => '$_mysql_username',
			'message' => 'Please, enter correct username of MySQL database.',
			'desc' => 'The user name to connect to MySQL database.',
		),
		'mysql_userpwd' => array(
			'title' => '$_mysql_userpwd',
			'message' => '',
			'desc' => 'The password to connect to MySQL database.',
		),
		'mysql_host' => array(
			'title' => '$_mysql_host',
			'message' => 'Please, enter correct host name of MySQL database.',
			'desc' => 'The name of MySQL server. For example: localhost if the server is situated on your site.',
		),
		'mysql_dbname' => array(
			'title' => '$_mysql_dbname',
			'message' => 'Please, enter correct name of MySql database.',
			'desc' => 'The name of MySQL database.',
		),
	),
),
'titles' => array(
	'editor_register' => 'Editor Login',

),
'register_editor' => array(
	'admin_name'	=> 'Username',
	'email'		=> 'Email',
	'password'	=> 'Password',
	'register_btn'	=> 'Register',	
	'info_incomp'	=> array(
		'admin_name' => 'You inserted empty username!',
		'admin_password' => 'You inserted empty password!',
		'admin_email'	=> 'You inserted incorrect email!',
	),
	'title'		=> 'REGISTER A NEW EDITOR',
),
);
function text ($params )
{
switch( $params['c'] )
{
	case 'txt_link_deleted':
	return "<br>Link \"{$params['link_title']}\" was deleted.";
	case 'txt_link_not_deleted':
	return "<br>You do not have rights for deleting link to \"{$params['link_title']}\".";
	case 'txt_editor_move_link':
	return "Link was moved to {$params['cat_title']}, where you are not the editor. It will be approved by owner of this category.";
	case 'txt_editor_saved':
	return "The information about {$params['e_name']} editor was saved <br>";
	case 'txt_editor_incomplete':
	return "Incomplete information about {$params['e_name']}, check this fields:<br>";
	case 'txt_cat_added':
	return "<br>Category {$params['cat_title']} with directory name {$params['cat_dir']} was added";
	case 'txt_cat_exists':
	return "<br>Category with title {$params['cat_title']} or directory name {$params['cat_dir']} already exists here";
	case 'txt_cat_approved':
	return "<br>Category \"{$params['cat_title']}\" was approved";
	case '"txt_cat_not_approved':
	return "<br>Category \"{$params['cat_title']}\" was not approved";
	case 'txt_cat_disapproved':
	return "<br>Category \"{$params['cat_title']}\" was disapproved";
	case 'txt_cat_not_disapproved':
	return "<br>Category \"{$params['cat_title']}\" was not disapproved";
	case 'txt_cat_deleted':
	return "<br>Category \"{$params['cat_title']}\" was deleted";
	case 'txt_cat_not_deleted':
	return "<br>Category \"{$params['cat_title']}\" was not deleted";
	case 'txt_recip_link_valid':
	return "<div align=left>LinkBack URL for \"{$params['link_title']}\" is VALID.</div>";
	case 'txt_recip_link_invalid':
	$return = "<div align=\"left\">LinkBack URL for \"{$params['link_title']}\" is INVALID! Please, check it: LinkBack URL - {$params['link_back']}</div>";
	if ( $params['link_alt_domain'] && $params['link_alt_domain'] != 'http://' )
	{
		$return .= "<div align=left>Alternative domain: {$params['link_alt_domain']}</div>";
	}
	return $return;
	case 'txt_recip_no_content':
	return "<div align=\"left\">LinkBack URL for \"{$params['link_title']}\" is INVALID! Can not get content from {$params['link_back']}</div>";
	case 'txt_recip_no_linkback':
	return "<div align=\"left\">There is no LinkBack URL for \"{$params['link_title']}\"</div>";
	case 'txt_broken_link_status':
	switch( $params['link_http_status'] )
	{
		case 0:
		$text = " - The URL of link do not contains 'http://'";
		break;
		case 1:
		$text = " - Can not get content from page";
		break;
		case 404:
		$text = " - Page was not found";
		break;
		case 403:
		$text = " - The access to page is forbidden";
		break;
		case 200:
		$text = " - Normal";
		break;
		case 301:
		$text = " - Permanent redirect";
		break;
		case 302:
		$text = " - Temporary redirect";
		break;
		default:
		$text = " - For more info about this status go to <a href=\"http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html\">HTTP/1.1: Status Code Definitions</a>";
	}
	return "<br>Link \"{$params['link_title']}\" has HTTP Status: {$params['link_http_status']}".$text;
	
}

}
?>
