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

require_once( 'headers.php' );

// Process input data
$smarty	  = new DirSmarty();
$ADMIN = $SkaLinks->IsAdmin();
//
//
$_output['menu'] = 0;
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_add_cat'] );
$_output['show_dirtree'] = $SkaLinks->GetParam( 'show_dirtree' );
$_output['show_admin_ads'] = $SkaLinks->GetParam( 'show_admin_ads' );

$cat_id = ( $_GET['cat'] ) ? ( int )$_GET['cat'] : ( int )$_POST['cat'];

if ( $_POST['Form_submitted'] )
{
	// get incorrect filds
	if ( ctype_space( $_POST['title'] ) )
	{
		$inf_item = $_skalinks_lang['add_cat']['cat_dir'];
	}
	elseif( ctype_space( $_POST['dir'] ) )
	{
		$inf_item = $_skalinks_lang['add_cat']['cat_title'];
	}

	$topdesc_checked	= convert_quote( $_POST['topdesc'] );
	$bottomdesc_checked	= convert_quote( $_POST['bottomdesc'] );
	$metadesc_checked	= convert_quote( $_POST['metadesc'] );
	$cat_title		= convert_quote( $_POST['title'] );
	
	if ( !$inf_item )
	{
		$cat_attribute = 1 ;
		$_POST['dir'] = ltrim( $_POST['dir'] );
		$_POST['dir'] = rtrim( $_POST['dir'] );
		$_POST['dir'] = str_replace( ' ', '_', $_POST['dir'] );
		$_POST['dir'] = str_replace( '/', '_', $_POST['dir'] );
	}
	else
	{
		$_POST['topdesc']	= $topdesc_checked['s_strip'];
		$_POST['bottomdesc']	= $bottomdesc_checked['s_strip'];
		$_POST['title']		= $cat_title['s_strip'];
		$_POST['metadesc']	= $metadesc_checked['s_strip'];	
	}
}

// TO DO: Statements here

$_output['cat_info']		= $SkaLinks->GetCatInfo( $cat_id );
$_output['cat_url']		= $SkaLinks->GetCategoryURL( $cat_id );
$_output['cat_navigation']	= $SkaLinks->GetCatNavigationLine( $cat_id );
$_output['mod_rewrite']		= $SkaLinks->GetParam( 'mod_rewrite' );
$_output['visitor_add_cat']	= $SkaLinks->GetParam( 'visitor_add_cat' );

if ( $_output['mod_rewrite'] )
{
	$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );
}
if ( $ADMIN['Type'] == 2 )
{
	$_output['editors']	   = $SkaLinks->GetAdmins( 1 );
}
if ( $_POST['Form_submitted'] )
{
	if ( !$cat_attribute )
	{
		$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$inf_item;
		$_output['info_inf'] = 1;
	}
	else
	{
		if ( ( $ADMIN['Type'] == 2 ) || ( ( $ADMIN['Type'] == 1 ) && ( $ADMIN['ID'] == $_output['cat_info']['Editor_id'] ) ) )
		{
			$dir_arr	= explode( ',', $_POST['dir'] );
			$title_arr	= explode( ',', $cat_title['s_strip'] );
			if ( ( count( $dir_arr ) != count( $title_arr ) ) || ( array_search( "", $dir_arr ) != false ) || ( array_search( "", $title_arr ) != false ) )
			{
				$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$_skalinks_lang['msg']['incor_count_cat_item'];
			}
			else
			{
				$status = 0;
				foreach( $title_arr as $key => $value )
				{
					$dir_arr[$key] = preg_replace( '/[^\w,\-]/i','_',$dir_arr[$key]);
					if ( $SkaLinks->AddCategory( $title_arr[$key], $dir_arr[$key], $topdesc_checked['s_strip'], $bottomdesc_checked['s_strip'], $metadesc_checked['s_strip'], $cat_id, $_POST['editor'], $status ) )
					{
						$new_cat_info = $SkaLinks->db_Row( "SELECT ID FROM ".$SkaLinks->m_CategoriesTable." WHERE `Parent`='$cat_id' AND `title`='".mysql_real_escape_string( $title_arr[$key] )."'" );
						$SkaLinks->BuildCategory( $new_cat_info['ID'] );
						$msg .= text( array( 'c' => 'txt_cat_added', 'cat_title' => $title_arr[$key], 'cat_dir' => $dir_arr[$key] ));
					}
					else
					{
						$msg .= text( array( 'c' => 'txt_cat_exists', 'cat_title' => $title_arr[$key], 'cat_dir' => $dir_arr[$key] ) );
					}
				}
				$_POST['title']	= "";
				$_POST['dir']	= "";  
			}
		}
		else
		{
			if ( $_output['visitor_add_cat'] )
			{
				$status		= 1;
				$editor_id	= 0;
				if ( $SkaLinks->AddCategory( $cat_title['s_strip'], $_POST['dir'], $topdesc_checked['s_strip'], $bottomdesc_checked['s_strip'], $metadesc_checked['s_strip'],$cat_id, $editor_id, $status ) )
				{
					$msg = $_skalinks_lang['msg']['cat_added'];
				}
				else
				{
					$msg = $_skalinks_lang['msg']['cat_exists'];
				}
			}
			else
			{
				$msg = $_skalinks_lang['msg']['visitor_not_add_cat'];
			}
		}
	}      
}//if ( $_POST['Form_submitted'] )
if ( !$_output['visitor_add_cat'] && !$ADMIN )
{
	$msg = $_skalinks_lang['msg']['visitor_not_add_cat'];
	require_once( 'index.php' );
}
if ( !$ADMIN && !$cat_id )
{
	$msg = $_skalinks_lang['msg']['add_cat_root'];
	require_once( 'index.php' );
}
else
{
	$_output['js'] = 'form.js';
	display( 'add_cat' );
}
?> 
