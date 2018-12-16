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

// Process input data

$cat_id = ( $_GET['cat_id'] ) ? ( int )$_GET['cat_id'] : ( int )$_POST['cat_id'];
$page_type = ( $_GET['type'] ) ? $_GET['type'] : $_POST['type'];
$cat_id = ( $page_type != 'cat' ) ? 0 : $cat_id;
// TODO : Statements here

$smarty = new DirSmarty();
$ADMIN = $SkaLinks->IsAdmin();

if ( !$ADMIN )
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
}
else
{
	$ads_table		= $SkaLinks->m_AdsTable;
	$ads_binding_table	= $SkaLinks->m_AdsBindingTable;
	if ( $_POST['Add_ads'] )
	{
		if ( $_POST['Ads_id'] )
		{
			$SkaLinks->db_Query( "INSERT INTO `$ads_binding_table` (`Cat_id`,`Ads_id`,`Ads_position`,`Page_type`) VALUES ('".$cat_id."','".$_POST['Ads_id']."','".$_POST['Ads_pos']."','".$page_type."')" );
			$msg = $_skalinks_lang['msg']['ads_added'];
		}
		else
		{
			$msg = $_skalinks['banner_not_checked'];
		}
	}
	if ( $_POST['Delete_ads'] )
	{
		if ( $_POST['Ads_pos'] )
		{
			$SkaLinks->db_Query( "DELETE FROM `$ads_binding_table` WHERE (`Cat_id`='$cat_id' AND `Page_type`='$page_type' AND `Ads_position`='".$_POST['Ads_position']."')");
			$msg = $_skalinks_lang['msg']['ads_deleted'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['banner_not_checked'] ;
		}
	}
	$_output['ads_type'] = convert_ads_pos( array( 'cat_id' => $cat_id, 'type' => $page_type ) );
	$_output['cat_navigation']	    	 = $SkaLinks->GetCatNavigationLine( $cat_id );// Get Navigation Category Line
	$_output['cat_ads']			 = $SkaLinks->db_Fetch( "SELECT * FROM `$ads_binding_table` WHERE `Cat_id`='$cat_id' AND `Page_type`='$page_type'" );
	$_output['all_ads']			 = $SkaLinks->db_Fetch( "SELECT * FROM `$ads_table`" ); 

	// Show HTML

	display( 'add_ads' );
}
?>
