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
 
 // Input Data
 $smarty = new DirSmarty();
 $_output['linkback_mod'] = $SkaLinks->GetParam( "linkback_required" );
if ( $_GET['cat'] )
{
	$cat_id = ( int )$_GET['cat'];
}
else
{
	$cat_id = ( int )$_POST['cat'];
}

if ( $_POST['Form_submitted'] )
{
	$link_title_checked		= convert_quote( $_POST['link_title'] ); 
	$link_desc_checked		= convert_quote( $_POST['link_description'] );
	$link_extend_desc_checked	= convert_quote( $_POST['link_full_description'] );
if ( !$_output['linkback_mod'] )
{
	 // get the incorrect field
	 if ( !preg_match( "/^http:\/\/[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\/)*[a-zA-Z0-9\-\._]*/", $_POST['link_url'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_url'];
	 }
	 elseif( ctype_space( $_POST['link_back'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_back'];
	 }
	 elseif( ctype_space( $_POST['link_title'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_title'];
	 }
	 elseif( ctype_space( $_POST['link_description'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_description'];
	 }
	 elseif( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['link_email'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_email'];
	 }

	 if ( !$inf_item )
	 {
		 $link_attribute = 1;
	 }
}
else
{
	 // get the incorrect field
	 if ( !preg_match( "/^http:\/\/[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\/)*[a-zA-Z0-9\-\._]*/", $_POST['link_url'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_url'];
	 }
	 elseif( ctype_space( $_POST['link_title'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_title'];
	 }
	 elseif( ctype_space( $_POST['link_description'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_description'];
	 }
	 elseif( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['link_email'] ) )
	 {
		 $inf_item = $_skalinks_lang['add_link']['link_email'];
	 }

	 if ( !$inf_item )
	 {
		 $link_attribute = 1;
	 }
	
}

}// if ( $_POST['Form_submitted'] )

if ( $link_attribute )
{
	$_POST['link_url'] = trim( $_POST['link_url'] );
	$_POST['link_title'] = trim( $_POST['link_title'] );
	$_POST['link_description'] = trim( $_POST['link_description'] );
}


$template_id			= ( int )$_POST['letter_id'];
$_output['menu']		= 0;
$_output['title']		= $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_add_url'] );
$_output['show_dirtree']	= $SkaLinks->GetParam( 'show_dirtree' );
$_output['show_admin_ads']	= $SkaLinks->GetParam( 'show_admin_ads' );
$_output['mod_rewrite']		= $SkaLinks->GetParam( 'mod_rewrite' );
if ( $_output['mod_rewrite'] )
{
	$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );
}
$ADMIN = $SkaLinks->IsAdmin();

 //

 // TODO : Statements here...

 $_output['cat_info'] = $SkaLinks->GetCatInfo( $cat_id );
 $_output['cat_url']  = $SkaLinks->GetCategoryURL( $cat_id );
 $_output['cat_navigation'] = $SkaLinks->GetCatNavigationLine( $cat_id );

if ( $_POST['Form_submitted'] )
{
	$_POST['link_title']	= $link_title_checked['m_strip'];
	$_POST['link_description']	= $link_desc_checked['m_strip'];
	$_POST['link_full_description'] = $link_extend_desc_checked['m_strip'];
	if ( !$link_attribute && $cat_id )
	{
		$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$inf_item;
		$_output['info_inf'] = 1;
	}
	else
	{
		$_output['info_inf'] = 0;
		$status = ( $ADMIN ) ? 0 : 1;
		$alt_domain = ( $ADMIN ) ? $_POST['link_alt_domain'] : "";
		$added = $SkaLinks->AddLink( $_POST['link_url'], $_POST['link_back'], $link_title_checked['s_strip'], $link_desc_checked['s_strip'], $link_extend_desc_checked['s_strip'], $_POST['link_email'], $cat_id, $ADMIN['Name'], $template_id, $alt_domain );
       
       		$link_info = $SkaLinks->GetLinksSearch( $_POST['link_url'], 0, 1 );
		$link_id = $link_info[0]['ID'];
		if ( $_output['linkback_mod'] )
		{
			$SkaLinks->VerifyLinkRecip( $link_info[0]['ID'] );
		}
		$location_link = $SkaLinks->GetCategoryURL( $cat_id );
		$listing_link = ( $_output['mod_rewrite'] ) ? $location_link."listing".$link_id.".html" : $location_link."listing.php?link_id=".$link_id ;
		if ( !$added )
		{
			$letter_theme = ( $ADMIN ) ? 't_admin_link_submitted' : 't_admin_link_approved';
			$SkaLinks->Mailer( $_POST['link_email'], $_skalinks_site['mail_theme'], $letter_theme,  $_POST['link_url'], $location_link, $listing_link, $_skalinks_site['brand'] );
		}
       
		if ( $added )
		{
			$msg = $_skalinks_lang['msg']['link_exists'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['link_added']."<br>".$SkaLinks->GetParam('same_site_display');
		}
	}
}
if ( !$cat_id )
{
	$msg = $_skalinks_lang['msg']['add_url_root_cat'];
	require_once( 'index.php' );
}
else
{
	$tem_table = $SkaLinks->m_LetterTemTable;
	$tem_binding_table = $SkaLinks->m_LetterTemBindingTable;
	$cat_table = $SkaLinks->m_CategoriesTable;
	$category_id = $cat_id;
	while( !$_output['letter_template'] )
	{
		$result = $SkaLinks->db_Row( "SELECT `t2`.* FROM `$tem_binding_table` `t1` LEFT JOIN `$tem_table` `t2` ON `t1`.`Template_id`=`t2`.`ID` WHERE `t1`.`Cat_id`='$category_id'" );
		if ( $result )
		{
			$_output['letter_template'] = $result;
		}
		else
		{
			 $parent_category = $SkaLinks->db_Row( "SELECT `Parent` FROM `$cat_table` WHERE `ID`='$category_id'" );
			 $category_id = $parent_category['Parent'];
		}
		if ( !$category_id )
		{
			 break;
		}
	}
	if ( !$_output['letter_template'] )
	{
		 $sql = "SELECT * FROM `$tem_table` WHERE `Status`='1'";
		 $result = $SkaLinks->db_Row( $sql );
		 $_output['letter_template'] = $result;
	} 
		 $_output['js'] = 'form.js';
		 display( 'add_url' );
	}
?>
