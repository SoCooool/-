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

//Process input data

//Statements here

	$smarty = new DirSmarty();
	$ADMIN = $SkaLinks->IsAdmin();
	if ( $ADMIN )
	{
		$tem_table = $SkaLinks->m_LetterTemTable;
		$_output['all_templates'] = $SkaLinks->db_Fetch( "SELECT * FROM `$tem_table`" );
		foreach( $_output['all_templates'] as $key => $value )
		{
			$_output['all_templates'][$key]['Template'] = str_replace( "'", "`", $_output['all_templates'][$key]['Template'] );
			$_output['all_templates'][$key]['Template'] = str_replace( "\"", "&quot;", $_output['all_templates'][$key]['Template'] );
			$_output['all_templates'][$key]['display_template'] = $_output['all_templates'][$key]['Template'];
			$_output['all_templates'][$key]['Template'] = str_replace( "\n", "\\n", $_output['all_templates'][$key]['Template'] );
		}
		display( 'select_template' );
	}
	else
	{
		$msg = $_skalinks_lang['msg']['not_admin'];
		require_once( '../index.php' );
	}
?>
