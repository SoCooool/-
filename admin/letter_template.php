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

if ( strlen( trim( $_POST['New_Template'] ) ) )
{
	$tem_attribute  = 1;
}


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
	$tem_table = $SkaLinks->m_LetterTemTable;
	$tem_binding_table = $SkaLinks->m_LetterTemBindingTable;
	$links_table = $SkaLinks->m_LinksTable;
	if ( $_POST['Add_Template'] )
	{
		if ( $tem_attribute )
		{
			$SkaLinks->db_Query( "INSERT INTO `$tem_table` (`Template`) VALUES ('".$_POST['New_Template']."')" );
			$msg = $_skalinks_lang['msg']['template_added'];	
		}
		else
		{
			$msg = $_skalinks_lang['msg']['inf_incomplete'];
		}
	}
	if ( $_POST['Change_Template'] )
	{
		if ( $_POST['Templates_arr'] )
		{
			$tem_info_attr = 0;
			foreach( $_POST['Templates_arr'] as $value )
			{
				if ( strlen( trim( $_POST['Letter_tem'][$value] ) ) )
				{
					$SkaLinks->db_Query( "UPDATE `$tem_table` SET `Template`='".$_POST['Letter_tem'][$value]."' WHERE `ID`='".$value."'" );
				}
				else
				{
					$tem_info_attr = 1;
				}
			}
			if ( count( $_POST['Templates_arr'] ) > 1 && $tem_info_attr )
			{
				$msg = $_skalinks_lang['msg']['templates_not_all_changed'];
			}
			elseif ( $tem_info_attr )
			{
				$msg = $_skalinks_lang['msg']['template_not_changed'];
			}
			else
			{
				$msg = $_skalinks_lang['msg']['template_changed'];
			}
		}
		else
		{
			$msg = $_skalinks_lang['msg']['tem_not_checked'];
		}
	}

	if ( $_POST['Delete_Template'] )
	{
		if ( $_POST['Templates_arr'] )
		{
			foreach( $_POST['Templates_arr'] as $key => $value )
			{
				$tem_status = $SkaLinks->db_Row( "SELECT `Status` FROM `$tem_table` WHERE `ID`='".$_POST['Templates_arr'][$key]."'" );
				if ( !$tem_status['Status'] )
				{
					$SkaLinks->db_Query( "DELETE FROM `$tem_table` WHERE `ID`='".$_POST['Templates_arr'][$key]."'" );
					$SkaLinks->db_Query( "DELETE FROM `$tem_binding_table` WHERE `Template_id`='".$_POST['Templates_arr'][$key]."'" );
					$SkaLinks->db_Query( "UPDATE `$links_table` SET `Template_id`='0' WHERE `Template_id`='".$_POST['Templates_arr'][$key]."'" );
				}
				else
				{
					$msg = $_skalinks_lang['msg']['del_default_template'];
				}
			}
	
			$msg = ( !$msg ) ? $_skalinks_lang['msg']['template_deleted'] : $msg;
		}
		else
		{
			$msg = $_skalinks_lang['msg']['tem_not_checked'];
		}
	}
	$_output['all_templates']		 = $SkaLinks->db_Fetch( "SELECT * FROM `$tem_table`" );
	$_output['count']			 = 0;
	// Show HTML

	display( 'template_settings' );
}
?>
