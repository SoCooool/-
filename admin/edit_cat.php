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


   // Input data
   $smarty	= new DirSmarty();
   $SkaLinks->SetRootDir( $_skalinks_dir['dir'] );
   $ADMIN = $SkaLinks->IsAdmin();
   
   $_output['menu'] = 0;
	$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_edit_cat'] );

   $cat_id      = ( int )$_GET['id'];
   $parent_id   = ( int )$_GET['cat'];
   $virtual_id  = ( int )$_GET['virtual_cat'];
   $related_id  = ( int )$_GET['related_cat']; 
   $_GET['delete_vir_cat'] = ( int )$_GET['delete_vir_cat'];
   $_GET['delete_rel_cat'] = ( int )$_GET['delete_rel_cat'];
   $cat_editor_info = $SkaLinks->GetCatEditor( $cat_id );
   
if ( $_GET['Form_submitted'] || $_GET['Cat_disapprove'] || $_GET['Cat_approve'] )
{
	// get incorrect filed
	if ( ctype_space( $_GET['title'] ) )
	{
		$inf_item = $_skalinks_lang['add_cat']['cat_dir'];
	}
	elseif( ctype_space( $_GET['dir'] ) )
	{
		$inf_item = $_skalinks_lang['add_cat']['cat_title'];
	}

	if ( !$inf_item )
	{
		$cat_attribute = 1 ;
	}
}

   
if ( $cat_attribute )
{
	$cat_checked_title	= convert_quote( $_GET['title'] );
	$cat_checked_topdesc	= convert_quote( $_GET['topdesc'] );
	$cat_checked_bottomdesc	= convert_quote( $_GET['bottomdesc'] );
	$cat_checked_metadesc	= convert_quote( $_GET['metadesc'] );
	$_GET['dir']		= ltrim( $_GET['dir'] );
	$_GET['dir']		= rtrim( $_GET['dir'] );
	}
   
	if ( !$ADMIN )
	{
		$msg = $_skalinks_lang['msg']['not_admin'];
		require_once( '../index.php' );
	}
	elseif( ( $ADMIN['Type'] == 1 ) && ( $ADMIN['ID'] != $cat_editor_info['ID'] ) )
	{
		$msg = $_skalinks_lang['msg']['not_cat_editor'];
		require_once( '../index.php' );
	}
	else
	{     
   
	if ( $_GET['Vir_cat_submitted'] && $virtual_id && $ADMIN['Type'] == 2 )
	{ 
		if ( $SkaLinks->AddVirtualCategory( $cat_id, $virtual_id ) )
		{
			$msg = $_skalinks_lang['msg']['vir_cat_added'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['vir_cat_exists'];
		}
	}
	if ( $_GET['Vir_cat_deleted'] && $_GET['delete_vir_cat'] && $ADMIN['Type'] == 2  )
	{
		if ( $SkaLinks->DelVirCategory( $cat_id, $_GET['delete_vir_cat'] ) )
	      	{
			$msg = $_skalinks_lang['msg']['vir_cat_deleted'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['vir_cat_not_deleted'];
		}
	}
	if ( $_GET['Rel_cat_submitted'] && $related_id && $ADMIN['Type'] == 2  )
	{
		if ( $SkaLinks->AddRelatedCategory( $cat_id, $related_id ) )
		{
			$msg = $_skalinks_lang['msg']['rel_cat_added'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['rel_cat_exists'];
		}
	}
	if ( $_GET['Rel_cat_deleted'] && $_GET['delete_rel_cat'] && $ADMIN['Type'] == 2  )
	{
		if ( $SkaLinks->DelRelCategory( $cat_id, $_GET['delete_rel_cat'] ) )
		{
			$msg = $_skalinks_lang['msg']['rel_cat_deleted'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['rel_cat_not_deleted'];
		}
	}
	if ( $_GET['Cat_submitted'] )
	{ 
		$info = $SkaLinks->GetCatInfo( $cat_id );
		if ( $SkaLinks->EditCategory( $cat_id, $parent_id, $info['Title'], $info['dir'], $info['TopText'], $info['BottomText'], $info['meta_desc'], $info['Editor_id'], $info['Status'] ) )
		{
			$SkaLinks->DelFolder( $cat_id );
			if ( $SkaLinks->BuildCategory( $cat_id, 1 ) )
			{
				$msg = $_skalinks_lang['msg']['cat_changed'];
			}
			else
			{
				$msg = $_skalinks_lang['msg']['cat_not_changed'];
			}
		}
		else
		{
			$msg = $_skalinks_lang['msg']['not_cat_onwer'];
		}
	}
	if ( $_GET['Form_submitted'] )
	{
		if ( $cat_attribute )
		{
			$info = $SkaLinks->GetCatInfo( $cat_id );
			if ( $SkaLinks->EditCategory( $cat_id, $info['Parent'], $cat_checked_title['s_strip'], $_GET['dir'], $cat_checked_topdesc['s_strip'],$cat_checked_bottomdesc['s_strip'], $cat_checked_metadesc['s_strip'], $_GET['editor'], $info['Status'] ) && $SkaLinks->BuildCategory( $cat_id, 1 ) )
			{
				$msg = $_skalinks_lang['msg']['cat_changed'];
			}	   
			else
			{
				$msg = $_skalinks_lang['msg']['cat_not_changed'];
			}
		}
		else
		{
			$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$inf_item;
		}
	}
	if ( $_GET['Cat_disapprove'] )
	{
		$info = $SkaLinks->GetCatInfo( $cat_id );
		$status = 1;
		$msg = ( $SkaLinks->EditCategory( $cat_id, $info['Parent'], $cat_checked_title['s_strip'], $_GET['dir'], $cat_checked_topdesc['s_strip'],$cat_checked_bottomdesc['s_strip'], $cat_checked_metadesc['s_strip'], $_GET['editor'], $status ) ) ? $_skalinks_lang['msg']['cat_disapproved'] : "";
	}
	if( $_GET['Cat_approve'] )
	{
		$status = 0;
		$info = $SkaLinks->GetCatInfo( $cat_id );
		$SkaLinks->BuildCategory( $cat_id );
		$msg = ( $SkaLinks->EditCategory( $cat_id, $info['Parent'], $cat_checked_title['s_strip'], $_GET['dir'], $cat_checked_topdesc['s_strip'],$cat_checked_bottomdesc['s_strip'], $cat_checked_metadesc['s_strip'], $_GET['editor'], $status ) ) ? $_skalinks_lang['msg']['cat_approved'] : "";
		
	}
	$status = -1; 
        $_output['cat_info']		  = $SkaLinks->GetCatInfo( $parent_id );
	$_output['this_cat_url']	  = $SkaLinks->GetCategoryURL( $parent_id );
	$_output['vir_cat_info']	  = $SkaLinks->GetCatInfo( $virtual_id );
	$_output['this_vir_cat_url']	  = $SkaLinks->GetCategoryURL( $virtual_id );
	$_output['rel_cat_info']	  = $SkaLinks->GetCatInfo( $related_id );
	$_output['this_rel_cat_info']    = $SkaLinks->GetCategoryURL( $related_id );

	$temp_categories['categories']      = $SkaLinks->GetCategories( $parent_id, $status, 1 );
	foreach( $temp_categories['categories'] as $key => $value )
	{
		if ( $temp_categories['categories'][$key]['ID'] != $cat_id )
		{
			$_output['categories'][$key] = $temp_categories['categories'][$key];
		}
		else
		{
			continue;
		}
	}
	if ( $ADMIN['Type'] == 2 )
	{
		$temp_vir_categories['vir_categories']  = $SkaLinks->GetCategories( $virtual_id, $status, 1 );
		foreach( $temp_vir_categories['vir_categories'] as $key => $value )
		{
			if ( $temp_vir_categories['vir_categories'][$key]['ID'] != $cat_id )
			{
				$_output['vir_categories'][$key] = $temp_vir_categories['vir_categories'][$key];
			}
			else
			{
				continue;
			}
		}
		$temp_rel_categories['rel_categories']  = $SkaLinks->GetCategories( $related_id, $status, 1 );
	   	foreach( $temp_rel_categories['rel_categories'] as $key => $value )
		{
			if ( $temp_rel_categories['rel_categories'][$key]['ID'] != $cat_id )
			{
				$_output['rel_categories'][$key] = $temp_rel_categories['rel_categories'][$key];
			}
			else
			{
				continue;
			}
		}
		$_output['editors'] = $SkaLinks->GetAdmins( 1 );
	}
	  
	$_output['list_vir_categories'] = $SkaLinks->GetVirtualCategories( $cat_id, $status );
	$_output['list_rel_categories'] = $SkaLinks->GetRelatedCategories( $cat_id, $status );
	$_output['category']	        = $SkaLinks->GetCatInfo( $cat_id );
	$cat_selected_title		= convert_quote( $_output['category']['Title'] );
	$_output['category']['Title']	= $cat_selected_title['m_strip'];
	$_output['category']['editor_info'] = $SkaLinks->GetCatEditor( $cat_id );
	$_output['cat_navigation']	 = $SkaLinks->GetCatNavigationLine( $_output['category']['Parent'] );
	$msg = ( $ADMIN ) ? $msg : $_skalinks_lang['msg']['not_admin'];

	// - Show HTNL -
	
	$_output['js'] = 'form.js';
	display( 'edit_cat' );
}
?>
