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

$smarty		= new DirSmarty();
$ADMIN		= $SkaLinks->IsAdmin();

//
//
$linkback_mod		= $SkaLinks->GetParam( "linkback_required" );
$_output['menu']	= 0;
$_output['title']	= $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_edit_url'] );
$links_id		= ( $_GET['id'] ) ? ( int )$_GET['id'] : ( int )$_POST['id'];
$link_info		= $SkaLinks->GetLinkInfo( $links_id );
$editor_info		= $SkaLinks->GetCatEditor( $link_info['Category'] ); 
if ( !$ADMIN )
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
  
}
elseif( ( $ADMIN['Type'] != 2 ) && ( $ADMIN['ID'] != $editor_info['ID'] ) && ( $ADMIN['ID'] != $link_info['AddedBy'] ) )
{
	$msg = $_skalinks_lang['msg']['not_link_editor'];
	require_once( '../index.php' );
}
else
{
	$url		 = ( $_GET['url'] ) ? trim( $_GET['url'] ) : trim( $_POST['url'] );
	$search_type	 = ( $_GET['search_type'] ) ? $_GET['search_type'] : $_POST['search_type']; 
	$url_checked		= convert_quote( $url );
	$_output['url_search']	= $url_checked['m_strip'];
	if (  $url && $search_type )
	{
		if ( $_GET['Search'] )
		{
			$page = ( $_GET['linking_page'] ) ? ( int )$_GET['linking_page'] : ( int )$_POST['linking_page'];
			$page = ( !$page ) ? 1 : $page;
			$link = $SkaLinks->GetLinks( array( 'cat' => 0, 'status' => -1, 'index' => ($page - 1)*1, 'num' => 1, 'flag' => 1, 'search_type' => $search_type, 'search' => $url_checked['s_strip'] ) ); 
			$_output['link'] = $SkaLinks->GetLinkInfo( $link[0]['ID'], $status );
			$_output['linking_page'] = $page;
			$_output['search_type']		       = $search_type;
			if ( $_output['link'] )
			{
				$_output['count_links'] = $SkaLinks->GetLinksCount( array( 'cat' => 0, 'status' => -1, 'rank' => -1, 'url' => $url_checked['s_strip'] ) );
				$cat_id = $link[0]['Category'];
				$link_id = $link[0]['ID'];
				$_GET['id'] = $link_id;
				$_GET['cat'] = $cat_id;
			}
			else
			{
				$msg = $_skalinks_lang['msg']['link_not_found'];
				$cat_id	  = ( $_GET['cat'] ) ? ( int )$_GET['cat'] : ( int )$_POST['cat'];
				$link_id  = ( $_GET['id'] ) ? ( int )$_GET['id'] : ( int )$_POST['id'];
				$_output['search_type']		       = $search_type;
			}
		}
		else
		{
			$_output['count_links'] = $SkaLinks->GetLinksCount( array( 'cat' => 0, 'status' => -1, 'rank' => -1, 'url' => $url_checked['s_strip'] ) );
			$page = ( $_GET['linking_page'] ) ? ( int )$_GET['linking_page'] : ( int )$_POST['linking_page'];
			$page = ( !$page ) ? 1 : $page;
			$_output['linking_page'] = $page;
			$cat_id	  = ( $_GET['cat'] ) ? ( int )$_GET['cat'] : ( int )$_POST['cat'];
			$link_id  = ( $_GET['id'] ) ? ( int )$_GET['id'] : ( int )$_POST['id'];
			$_output['search_type']		       = $search_type;
		}
	}
	else
	{
		$cat_id	  = ( $_GET['cat'] ) ? ( int )$_GET['cat'] : ( int )$_POST['cat'];
		$link_id  = ( $_GET['id'] ) ? ( int )$_GET['id'] : ( int )$_POST['id'];
		$_output['search_type']		       = $search_type;
	}


if ( !$_GET['cat'] && $cat_id )
{
	$_GET['cat'] = $_POST['cat'] ;
}
if ( !$_GET['id'] && $link_id )
{
	$_GET['id'] = $_POST['id'] ;
}

if ( $_POST['Form_submitted'] || $_POST['Link_disapproved'] || $_POST['Link_approved'] )
{
	if ( !$linkback_mod )
	{
		 // get the incorrect field
		 if ( !preg_match( "/^http:\/\/[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\/)*[a-zA-Z0-9\-\._]*/", $_POST['Link'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_url'];
		 }
		 elseif( ctype_space( $_POST['LinkBack'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_back'];
		 }
		 elseif( ctype_space( $_POST['Title'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_title'];
		 }
		 elseif( ctype_space( $_POST['Description'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_description'];
		 }
		 elseif( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['Email'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_email'];
		 }

		 if ( !$inf_item )
		 {
			 $link_attribute = 1;
		 }	
	 }
	else
	{
		 // get the incorrect field
		 if ( !preg_match( "/^http:\/\/[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\/)*[a-zA-Z0-9\-\._]*/", $_POST['Link'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_url'];
		 }
		 elseif( ctype_space( $_POST['Title'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_title'];
		 }
		 elseif( ctype_space( $_POST['Description'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_description'];
		 }
		 elseif( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['Email'] ) )
		 {
			 $inf_item = $_skalinks_lang['edit_link']['link_email'];
		 }

		 if ( !$inf_item )
		 {
			 $link_attribute = 1;
		 }	
	}
	$link_checked_title = convert_quote( $_POST['Title'] );
	$link_checked_desc  = convert_quote( $_POST['Description'] );
	$link_checked_extend_desc	= convert_quote( $_POST['Full_Description'] );
}//if ( $_POST['Form_submitted'] )


// TO DO: Statements here

//
$status = 0;
//

if ( $_POST['Form_submitted'] || $_POST['Link_disapproved'] || $_POST['Link_approved'] )
{
	if ( $_POST['Form_submitted'] == $_skalinks_lang['edit_link']['submit_save_comment'] )
	{
		$link_checked_comment = convert_quote( $_POST['Comment'] );
		$SkaLinks->EditComment( $link_id, $link_checked_comment['s_strip'] );
		$msg	= $_skalinks_lang['msg']['comment_saved'];
	}
	else
	{
		if( !$link_attribute )
		{
			$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$inf_item;
		}
		else
		{ 
		if ( !$cat_id )
		{
			$msg = $_skalinks_lang['msg']['add_url_root_cat'];
		} 
		else
		{
			$link_arr['id']		        = $link_id;
			$link_arr['cat_id']	        = $cat_id;
			$link_arr['link']	        = $_POST['Link'];
			$link_arr['LinkBackURLValid']	= $_POST['LinkBackURLValid'];
			$link_arr['EmailValid']	        = $_POST['EmailValid'];
			$link_arr['title']	        = $link_checked_title['s_strip'];
			$link_arr['description']	= $link_checked_desc['s_strip'];
			$link_arr['rank']	        = $_POST['Rank'];
			$link_arr['linkback']	        = $_POST['LinkBack']; 
			$link_arr['email']	        = $_POST['Email'];
			$link_arr['alt_domain']		= $_POST['LinkAltDomain'];
			$link_arr['admin_name']		= $ADMIN['Name'];
			$link_arr['extended_desc']	= $link_checked_extend_desc['s_strip'];
			$link_edited			= $SkaLinks->EditLink( $link_arr );
			switch( $link_edited )
			{
			case 0:
				$msg = $_skalinks_lang['msg']['link_changed'];
				//$link_info = $SkaLinks->GetLinkInfo( $link_id );
				$location_link = $SkaLinks->GetCategoryURL( $link_info['Category'] );
				$listing_link = ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
				if ( $_POST['send_email'] )
				{
					$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_changed',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
				}
				break;
			case -1:
				$msg = $_skalinks_lang['msg']['not_link_cat_onwer'];
				break;
			default:
				$moved_cat_info = $SkaLinks->GetCatInfo( $link_edited );
				$msg = text( array( 'c' => 'txt_editor_move_link', 'cat_title' => $moved_cat_info['Title'] ) );
				require_once( '../index.php' );
				exit;
			}
			
		}
	}	
}
}

if ( $_POST['Link_disapproved'] )
{
	$SkaLinks->UpdateStatus( 2, $link_id, 1, $ADMIN['Name'] );
	$msg			= $_skalinks_lang['msg']['link_status_changed'];
	//$link_info		= $SkaLinks->GetLinkInfo( $link_id );
	$location_link		= $SkaLinks->GetCategoryURL( $link_info['category'] );
       	$listing_link		= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
	if ( $_POST['send_email'] )
	{
		$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_disapproved',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
	}
}
if ( $_POST['Link_approved'] )
{
	$SkaLinks->UpdateStatus( 2, $link_id, 0, $ADMIN['Name'] );
	//$link_info	= $SkaLinks->GetLinkInfo( $link_id );
	$location_link	= $SkaLinks->GetCategoryURL( $link_info['Category'] );
       	$listing_link	= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
	if ( $_POST['send_email'] )
	{
		$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_approved',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
	}
	$msg = $_skalinks_lang['msg']['link_status_changed'];
}

if ( $_POST['Send_message'] )
{
	$admin_table = $SkaLinks->m_AdminsTable;
	//$link_info = $SkaLinks->GetLinkInfo( $link_id );
	$admin_email = $SkaLinks->db_Row( "SELECT `Email` FROM `$admin_table` WHERE `Name`='{$ADMIN['Name']}'" );
	$from = "From: \".".$_skalinks_site['mail_sender_name']."\"<".$admin_email['Email'].">\n 1\nContent-Type: text/plain; charset=\"koi8-r\"\nContent-Transfer-Encoding: 8bit";
	mail( $link_info['Email'], $SkaLinks->GetParam( 'default_mail_theme' ), $_POST['Optmessage'], $from );
}

$_output['link']		 = $SkaLinks->GetLinkInfo( $link_id, $status );
$_output['cat_info']		 = $SkaLinks->GetCatInfo( $cat_id );
$_output['category']		 = $SkaLinks->GetCategories( $cat_id, $status, 1 );
$_output['Ranks']		 = range( 0, 10 );
$link_selected_title		 = convert_quote( $_output['link']['Title'] );
$link_selected_desc		 = convert_quote( $_output['link']['Description'] );
$_output['link']['Title']	 = $link_selected_title['m_strip']; 
$_output['link']['Description']	 = $link_selected_desc['s_strip']; 
if ( $_output['link']['Rank'] )
{
	$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['link']['Rank']." AND `Category`='".$_output['link']['Category']."' AND `ID`<=".$_output['link']['ID'].")" );
	$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
	$_output['page']		  = ceil( $res['count']/$number_links_rank_display );
}
else
{
	$number_links_not_rank_display = $SkaLinks->GetParam( 'dir_links_per_page' );
	$res			     = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>='".$_output['link']['ID']."' AND `Rank`='0' AND `Category`='".$_output['link']['Category']."')" );
	$_output['page']		     = ceil( $res['count']/$number_links_not_rank_display );
}

$_output['link']['Comment'] = $SkaLinks->GetComment( $link_id );
$_output['this_cat_url']	 = $SkaLinks->GetCategoryURL( $cat_id )."?page=".$_output['page'];

$_output['js'] = 'form.js';
display( 'edit_url' );
}
?>
