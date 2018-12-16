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
  
$param			= ( int )$_GET['show'];
$_output['menu']	= 0;
$cat_array['id']	= $_POST['cat_arr'];
if ( $cat_array['id'] )
{
	foreach( $cat_array['id'] as $key => $value )
	{
		$cat_array['id'][$key] = ( int )$cat_array['id'][$key]; 
	}
}
// TODO: Statements here:

$smarty		= new DirSmarty();
$SkaLinks->SetRootDir( $_skalinks_dir['dir'] );
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_cat_list'] );
$ADMIN = $SkaLinks->IsAdmin();
if ( !$ADMIN )
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
}
else
{

	if ( $_POST['delete_cat'] )
	{
		if ( !$cat_array )
		{
			$msg = $_skalinks_lang['msg']['cat_not_checked'];
		}
		else
		{ 
			foreach( $cat_array['id'] as $key => $value )
			{
				$SkaLinks->DelFolder( $cat_array['id'][$key] );
				$result = $SkaLinks->DelCategory( $cat_array['id'][$key] ); 
			}
			$msg = ( $result ) ? $_skalinks_lang['msg']['cat_deleted'] : $_skalinks_lang['msg']['cat_not_deleted'];
		}	 
	}
	if ( $_POST['approve_cat'] )
	{
		if ( !$cat_array )
		{
			$msg = $_skalinks_lang['msg']['cat_not_checked'];
		}
		else
		{
			foreach ( $cat_array['id'] as $key => $value )
			{
				$result = $SkaLinks->BuildCategory( $cat_array['id'][$key] );
			}
			$msg = ( $result ) ? $_skalinks_lang['msg']['cat_approved'] : $_skalinks_lang['msg']['cat_not_approved'];
		}
	}
	$ADMIN['ID']		= ( $ADMIN['Type'] == 2 ) ? 0 : $ADMIN['ID'];
	$_output['cats']	= $SkaLinks->GetVerifyCats( 1, $ADMIN['ID'] );
	foreach ( $_output['cats'] as $key => $value )
	{
		$_output['cats'][$key]['parent_cat_url']	= $SkaLinks->GetCategoryURL( $_output['cats'][$key]['Parent'] );
		$_output['cats'][$key]['parent_cat_title']	= $SkaLinks->GetFullCategoryTitle( $_output['cats'][$key]['Parent'] );
	}

	display( 'admin_cats_list' );
}
?>
