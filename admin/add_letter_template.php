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

if ( !$ADMIN )
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
}
else
{
	$tem_table = $SkaLinks->m_LetterTemTable;
	$tem_binding_table = $SkaLinks->m_LetterTemBindingTable;
	if ( $_POST['Add_Template'] )
	{
		if ( $_POST['Template_id'] )
		{
			$template_exists = $SkaLinks->db_Row( "SELECT * FROM `$tem_binding_table` WHERE `Cat_id`='$cat_id'" );
			if ( $template_exists )
			{
				$msg = $_skalinks_lang['msg']['template_exists'];
			}
			else
			{
				$SkaLinks->db_Query( "INSERT INTO `$tem_binding_table` (`Cat_id`,`Template_id`) VALUES ('".$cat_id."','".$_POST['Template_id']."')" );
				$msg = $_skalinks_lang['msg']['template_added'];
			}
		}
		else
		{
			$msg = $_skalinks_lang['msg']['template_not_checked'];
		}
	}
	if ( $_POST['Delete_Template'] )
	{
		if ( $_POST['Template_id'] )
		{
			$SkaLinks->db_Query( "DELETE FROM `$tem_binding_table` WHERE (`Cat_id`='$cat_id' AND `Template_id`='".$_POST['Template_id']."')");
			$msg = $_skalinks_lang['msg']['template_deleted'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['template_not_checked'] ;
		}
	}
	$_output['cat_navigation']		    	 = $SkaLinks->GetCatNavigationLine( $cat_id );// Get Navigation Category Line
	$_output['cat_template']			 = $SkaLinks->db_Row( "SELECT `t2`.`Template`,`t2`.`ID` FROM `$tem_binding_table` `t1` LEFT JOIN `$tem_table` `t2` ON `t1`.`Template_id` = `t2`.`ID` WHERE `t1`.`Cat_id`='$cat_id'" );
	$_output['all_templates']			 = $SkaLinks->db_Fetch( "SELECT * FROM `$tem_table`" ); 

	// Show HTML
	display( 'add_templates' );
}
?>
