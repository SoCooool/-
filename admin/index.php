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

require_once( '../headers.php' );
require_once( $_skalinks_dir['root'].'SkaLinks_include/db_tools.php' );

// Process input data

$admin_attribute = ( ctype_space( $_POST['admin_name'] ) || ctype_space( $_POST['admin_password'] ) ) ? 0 : 1 ;
$_output['menu'] = 0;

// TODO: Statements here:

$smarty		= new DirSmarty();
$SkaLinks->SetRootDir( $_skalinks_dir['dir'] );
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_admin'] );
$ADMIN = $SkaLinks->IsAdmin();

if ( $ADMIN['Type'] == 2 )
{
	$editor_id = 0;
}
else
{
	$editor_id = $ADMIN['ID'];
}
$_output['count_appr_cat']	= count( $SkaLinks->GetVerifyCats( 1, $editor_id ) ); 
$_output['count_appr_link']	= count( $SkaLinks->GetVerifyLinks( array( 'type' => 1, 'editor' => $editor_id ) ) );
$_output['count_broken_link']	= $SkaLinks->GetVerifyLinks( array( 'type' => 2, 'count' => 1, 'editor' => $editor_id ) ) ;
$_output['count_invalid_email'] = count( $SkaLinks->GetVerifyLinks( array( 'type' =>3, 'editor' => $editor_id ) ) );
$_output['count_recip_link']	= count( $SkaLinks->GetVerifyLinks( array( 'type' => 4, 'editor' => $editor_id ) ) );


if ( !$ADMIN )
{
	$_output['menu'] = 0;
}
if ( $_POST['Login'] )
{
	$_output['logout'] = $SkaLinks->Login( $_POST['admin_name'], md5( $_POST['admin_password'] ) );
}

if ( $_POST['Logout'] )
{
	$SkaLinks->Logout();
	header( "Location: {$_skalinks_url['dir']}" );
	$_output['logout'] = 1;
}

if ( $ADMIN['Type'] == 2 )
{
	if ( $_POST['Build_cat'] || $_GET['Build_cat'] )
	{
		$msg = ( $SkaLinks->BuildCategory( 0, 1 ) ) ? $_skalinks_lang['msg']['cats_built'] : $_skalinks_lang['msg']['cats_not_built'] ;
	}
	if ( $_POST['Get_pagerank'] )
	{
		$query = "SELECT * FROM `".$SkaLinks->m_LinksTable."`";
		$all_links = $SkaLinks->db_Fetch( $query );
		foreach( $all_links as $key => $value )
		{
			$page_rank	= getPR( $all_links[$key]['URL'] );
			$query		= "UPDATE `".$SkaLinks->m_LinksTable."` SET `Pagerank`='$page_rank' WHERE `ID`='{$all_links[$key]['ID']}'";
			$SkaLinks->db_Query( $query );
		}
		$msg = $_skalinks_lang['msg']['pagerank_set'];
	}
	if ( $_POST['create_backup'] )
	{
		$msg = ( backup_db( $_POST['ex_type'], 'dump_'.date("d.m.y").'.sql.gz' ) ) ? $_skalinks_lang['msg']['db_backup_created'] : $_skalinks_lang['msg']['db_backup_not_created'];
	}
	if ( $_POST['restore_backup'] )
	{
		if ( $_POST['backup_file'] )
		{
			$restore = restore_backup( $_skalinks_dir['db_backup'].$_POST['backup_file'] );
			$msg = ( $restore ) ? $_skalinks_lang['msg']['backup_restored'] : $_skalinks_lang['msg']['backup_not_restored'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['select_dump_file'];
		}
	}
	if ( $_POST['delete_backup'] )
	{
		if ( $_POST['backup_file'] )
		{
			unlink( $_skalinks_dir['db_backup'].$_POST['backup_file'] );
			$msg = $_skalinks_lang['msg']['backup_deleted'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['select_dump_file'];
		}
	}
	if ( $_POST['download_backup'] )
	{
		if ( $_POST['backup_file'] )
		{
			$gz_handle = gzopen( $_skalinks_dir['db_backup'].$_POST['backup_file'], 'r' );
			$string = '';
			while( $s = gzread( $gz_handle, '1024' ) )
			{
				$dump_code .= $s;
			}
			gzclose( $gz_handle );
			download_db_backup( $_POST['backup_file'], $dump_code );
		}
		else
		{
			$msg = $_skalinks_lang['msg']['select_dump_file'];
		}
	}
	if ( $_POST['upload_backup'] )
	{
		switch( upload_backup( $_skalinks_dir['db_backup'] ) )
		{
			case -1;
			$msg = $_skalinks_lang['msg']['upl_file_not_sel'];
			break;
			case -2;
			$msg = $_skalinks_lang['msg']['upl_file_other_err'];
			break;
			case -3:
			$msg = $_skalinks_lang['msg']['upl_file_file_empty'];
			break;
			case -4:
			$msg = $_skalinks_lang['msg']['upl_file_max_size'];
			break;
			case -5:
			$msg = $_skalinks_lang['msg']['upl_file_not_post'];
			break;
			case -6:
			$msg = $_skalinks_lang['msg']['upl_file_exec_file'];
			break;
			case -7:
			$msg = $_skalinks_lang['msg']['upl_file_non_file_type'];
			break;
			case 0:
			$msg = $_skalinks_lang['msg']['upl_file_sys_error'];
			break;
			default:
			$msg = $_skalinks_lang['msg']['upl_file_success'];
		}
	}

	require_once( '../SkaLinks_include/rss.class.php' );
	$reader = new RSSReader( $_skalinks_url['rm_news'] );
	foreach( $reader->data['item']['title'] as $key => $value )
	{
		$reader->data['item']['description'][$key] = str_replace( "&gt;", ">", $reader->data['item']['description'][$key] );
		$reader->data['item']['description'][$key] = str_replace( "&lt;", "<", $reader->data['item']['description'][$key] );
		$reader->data['item']['title'][$key] = str_replace( "&gt;", ">", $reader->data['item']['title'][$key] );
		$reader->data['item']['title'][$key] = str_replace( "&lt;", "<", $reader->data['item']['title'][$key] );
		
		$_output['news'][$key]['title']	= $reader->data['item']['title'][$key];
		$_output['news'][$key]['link']	= $reader->data['item']['link'][$key];
		$_output['news'][$key]['description']	= $reader->data['item']['description'][$key];
		$_output['news'][$key]['pubdate']	= $reader->data['item']['pubdate'][$key];
	}
	
	if ( $dir_handle = opendir( $_skalinks_dir['db_backup'] ) ) 
	{
		while ( $f_name = readdir( $dir_handle ) )
		{
			if (  $f_name != '.htaccess' && $f_name != '.' && $f_name != '..' )
			{
				$_output['backup_files'][] = $f_name;
			}
		}
	}

}

if ( $_GET['first_register'] )
{
	$msg = $_skalinks_lang['msg']['first_register'];
}

display( 'admin_index' );

?>
