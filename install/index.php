<?php
	
	if ( !$_POST['Install'] )
	{
				require_once( '../SkaLinks_include/English_lang.php' );
				require_once( 'template.php' );
				
	}
	else
	{
	$package_version = 15;
	foreach( $_POST as $key => $value )
	{
		if( !strlen( $value ) && ( $key != 'mysql_userpwd' ) )
		{
			die( "<font color=red>The value of $key parameter is empty!</font>" );
			}
		}
	$f = fopen( '../headers.php', 'w' );
	$content = 
	'<?php

	
	//Section for script configuraion - START
	//For info, refer to the Manual.

	$_url_main_site		= \''.$_POST['url_main_site'].'\'; //http://www.mysite.com/dir/
	$_url_root		= \''.$_POST['url_root'].'\'; //http://www.mysite.com/
	$_dir_root		= \''.$_POST['dir_root'].'\'; // /my/home/directory/ If you are unsure about the correct path to the home directory of your site in the server file system, please contact your web-hosting support for assistance.
	
	$_site_title		= \''.$_POST['page_title'].'\';
	$_site_full_name	= \''.$_POST['site_full'].'\';
	$_site_brand		= \''.$_POST['site_brand'].'\';
	$_site_description	= \''.$_POST['site_description'].'\';
	
	$_mysql_username		= \''.$_POST['mysql_username'].'\';
	$_mysql_userpwd		= \''.$_POST['mysql_userpwd'].'\';
	$_mysql_host		= \''.$_POST['mysql_host'].'\';
	$_mysql_dbname		= \''.$_POST['mysql_dbname'].'\';

	//Section for script configuraion - END
	
	
	$_skalinks_url[\'root\']	= $_url_root;
	$_skalinks_url[\'dir\']		= $_skalinks_url[\'root\'];
	$_skalinks_url[\'templates\']	= $_skalinks_url[\'root\'].\'templates/\';
	$_skalinks_url[\'admin\']	= $_skalinks_url[\'root\'].\'admin/\';
	$_skalinks_url[\'main_site\']	= $_url_main_site;
	$_skalinks_url[\'rm_news\']	= \'http://www.skalinks.com/news/news.rss\';

	$_skalinks_dir[\'root\']	 = $_dir_root;
	$_skalinks_dir[\'dir\']		 = $_skalinks_dir[\'root\']; 
	$_skalinks_dir[\'admin\']	 = $_skalinks_dir[\'root\'].\'admin/\';
	$_skalinks_dir[\'db_backup\']	 = $_skalinks_dir[\'admin\'].\'db_backup/\';

	$_skalinks_dir[\'smarty\']	 = $_skalinks_dir[\'root\'].\'smarty/\';
	$_skalinks_dir[\'template_dir\'] = $_skalinks_dir[\'root\'].\'templates/\';
	$_skalinks_dir[\'compile_dir\']	 = $_skalinks_dir[\'root\'].\'compile/\';
	$_skalinks_dir[\'config_dir\']	 = $_skalinks_dir[\'root\'].\'config/\';
	$_skalinks_dir[\'cache_dir\']	 = $_skalinks_dir[\'root\'].\'cache/\';

	$_skalinks_mysql[\'username\']	= $_mysql_username;
	$_skalinks_mysql[\'userpwd\']	= $_mysql_userpwd;
	$_skalinks_mysql[\'host\']	= $_mysql_host;
	$_skalinks_mysql[\'dbname\']	= $_mysql_dbname;
	$_skalinks_mysql[\'tbl_prefix\'] = \'dir_\';

	$_skalinks_page = array
	(
		\'title\' => $_site_title,
		\'title_add_cat\' => \'Add Category\',
		\'title_add_url\' => \'Add Link\',
		\'title_search\'  => \'Find your Link\',
		\'title_search_result\'  => \'Search Result\',	
		\'title_edit_cat\' => \'Edit Category\',
		\'title_edit_url\' => \'Edit Link\',
		\'title_admin\' => \'Admin index page\',
		\'title_link_list\' => \'Links list\',
		\'title_cat_list\' => \'Categories list\',
		\'title_dirtree\' => \'Tree of categories\',
		);

	$_skalinks_site = array
	(
		\'site_description\'	=> $_site_description,
		\'site_full\'		=> $_site_full_name,
		\'brand\'		=> $_site_brand,
		\'mail_theme\'		=> \'Message\',
		);


	require_once( \'SkaLinks_include/English_lang.php\' );
	require_once( \'SkaLinks_include/component.php\' );
	require_once( \'SkaLinks_include/SkaLinks.class.php\' );
	require_once( $_skalinks_dir[\'smarty\'].\'Smarty.class.php\' ); 
	require_once( \'SkaLinks_include/design.php\' );
	$SkaLinks = new SkaLinks( $_skalinks_mysql );
	$SkaLinks->SetRootURL( $_skalinks_url[\'root\'] );
	$SkaLinks->SetPrefix( $_skalinks_mysql[\'tbl_prefix\'] );
	$color_theme = $SkaLinks->GetParam( \'color_theme\' );
	$_skalinks_url[\'color_theme\'] = $_skalinks_url[\'templates\'].$color_theme.\'/\';
		
	// Get some settings
	$_output[\'register_users\']	= $SkaLinks->GetParam( \'register_users\' );

	?>';
	fwrite( $f, $content );
	fclose;	
	
	// Mysql dump installation

	// Connect to MySql server
	$link = mysql_connect ( $_POST['mysql_host'], $_POST['mysql_username'], $_POST['mysql_userpwd']  );
	
	mysql_select_db( $_POST['mysql_dbname'], $link );
	
	$query = mysql_query( "SELECT `Package_ver` FROM `dir_settings` LIMIT 0,1", $link );
	$package = ( $query ) ? mysql_fetch_assoc( $query ): "";
	
	if ( !$package['Package_ver'] )
	{
	
		$sql_file = "skalinks_mysql_dump.sql";
			if ( !mysql_select_db ($_POST['mysql_dbname'], $link ) )
			{
				die ("<font color=red>Could not select database ".$_POST['mysql_dbname'].": " . mysql_error()."</font>");
				}
	
	// Begin installation of dump file 
	if ( file_exists( $_POST['dir_root']."install/".$sql_file ) )
	{
		$dump_file = $_POST['dir_root']."install/".$sql_file;
	}
	else
	{
		die( "<font color=red>The path to directory is wrong. Couldn't find dump file : $sql </font>" );
		}
	
	 if ( !($f = fopen ( $dump_file, "r" )) )
	 {
		 die( "<font color=red>Could not open file with sql instructions: $dump_file </font>" );
	 }


     while ( $s = fgets ( $f, 10240) )
    {
        $s = trim ($s);
        if ( $s[0] == '#' ) continue;
        if ( $s[0] == '-' ) continue;


        if ( $s[strlen($s)-1] == ';' )
        {
            $s_sql .= $s;
        }
        else
        {
            $s_sql .= $s;
            continue;
        }

        $res = mysql_query ( $s_sql, $link );
        if ( !$res )
        {
            $ret .= "<i><font color=red><b>Error</b> while executing:</i> $s_sql <br>".mysql_error()."</font><hr>";
        }
        $s_sql = "";
    }

    fclose($f);
	}
	else
	{
		while( $package['Package_ver'] < $package_version )
		{

		$sql_file = "upgrade_base_".$package['Package_ver'].".sql";

		// Begin installation of dump file 
		if ( file_exists( $_POST['dir_root']."install/".$sql_file ) )
		{
			$dump_file = $_POST['dir_root']."install/".$sql_file;
		}
		else
		{
			die( "<font color=red>The path to directory is wrong. Couldn't find dump file </font>" );
		}
	
		 if ( !($f = fopen ( $dump_file, "r" )) )
		 {
			 die( "<font color=red>Could not open file with sql instructions: $dump_file </font>" );
	 	}


		    while ( $s = fgets ( $f, 10240) )
    		    {
		        $s = trim ($s);
		        if ( $s[0] == '#' ) continue;
		        if ( $s[0] == '-' ) continue;


		        if ( $s[strlen($s)-1] == ';' )
        		{
		            $s_sql .= $s;
        		}
        		else
        		{
      			      $s_sql .= $s;
			      continue;
        		}

		        $res = mysql_query ( $s_sql, $link );
		        if ( !$res )
        		{
		            $ret .= "<i><font color=red><b>Error</b> while executing:</i> $s_sql <br>".mysql_error()."</font><hr>";
        		}
		        $s_sql = "";
		    }

			fclose($f);
			$new_ver = mysql_query( "SELECT `Package_ver` FROM `dir_settings`", $link );
			$number_new_version = ( $new_ver ) ? mysql_fetch_assoc( $new_ver ): "";
			$package['Package_ver'] = ( $number_new_version ) ? $number_new_version['Package_ver']: $package['Package_ver']+=1;
    }
		}

    setcookie( "adminname", "admin", time()+36000000, "/" );
    setcookie( "pwd", md5( "test" ), time()+36000000,"/" );
    header( "Location: ".$_POST['url_root']."admin/index.php?Build_cat=yes" );
    }

	?>
