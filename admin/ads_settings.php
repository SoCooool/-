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


// TODO : Statements here

$smarty		= new DirSmarty();
$ADMIN = $SkaLinks->IsAdmin();

if ( $ADMIN['Type'] != 2 )
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
}
else
{
	$ads_table = $SkaLinks->m_AdsTable;
	$ads_binding_table = $SkaLinks->m_AdsBindingTable;

	if ( $_POST['Add_banner'] )
	{
		$SkaLinks->db_Query( "INSERT INTO `$ads_table` (`Template`) VALUES ('".$_POST['New_banner']."')" );
		$msg = $_skalinks_lang['msg']['banner_added'];	
	}
	if ( $_POST['Change_banner'] )
	{
		if ( $_POST['Ads_arr'] )
		{
			foreach( $_POST['Ads_arr'] as $key => $value )
			{
				foreach( $_POST['Tem_num'] as $key1 => $value1 )
				{
					if ( $_POST['Ads_arr'][$key] == $_POST['Tem_num'][$key1] )
					{
						$tem_num = $key1;
						break;
					}
				}
				$SkaLinks->db_Query( "UPDATE `$ads_table` SET `Template`='".$_POST['Banner_tem'][$tem_num]."' WHERE `ID`='".$_POST['Ads_arr'][$key]."'" );
			}
			$msg = $_skalinks_lang['msg']['banner_changed'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['sel_baner_before'];
		}
	}
	if ( $_POST['Delete_banner'] )
	{
		foreach( $_POST['Ads_arr'] as $key => $value )
		{
			$SkaLinks->db_Query( "DELETE FROM `$ads_table` WHERE `ID`='".$_POST['Ads_arr'][$key]."'" );
			$SkaLinks->db_Query( "DELETE FROM `$ads_binding_table` WHERE `Ads_id`='".$_POST['Ads_arr'][$key]."'" );
		}
		$msg = $_skalinks_lang['msg']['banner_deleted'];
	}
	$_output['all_ads']			 = $SkaLinks->db_Fetch( "SELECT * FROM `$ads_table`" );
	$_output['count']			 = 0;
	// Show HTML

	display( 'ads_settings' );
}
?>
