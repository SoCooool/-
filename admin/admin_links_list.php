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


// Process Input Data

$link_array['id']  = $_POST['link_arr'];
if ( $link_array['id'][0] )
{
	foreach( $link_array['id'] as $key => $value )
	{
		$link_array['id'][$key] = ( int )$link_array['id'][$key];
	}
}

$param = ( int )$_GET['show'];
$hcode = ( int )$_GET['hcode'];
$page = ( !$_GET['page'] ) ? 1 : $_GET['page'];
$_output['menu'] = 0;

// TODO: Statements here:

$smarty		= new DirSmarty();
$SkaLinks->IsAdmin();
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_link_list'] );
$ADMIN = $SkaLinks->IsAdmin();
if ( !$ADMIN )
{
   	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
     
}
else
{
	// Processing of "Delete", "Approve", "Disapprove", "Check" links
	if ( $ADMIN )
	{
		if ( $_POST['check_recip_links'] )
		{
			if ( !$link_array['id'][0] )
			{
				$msg = $_skalinks_lang['msg']['link_not_checked'];
			}
			else
			{
				foreach( $link_array['id'] as $value )
				{
					$result = $SkaLinks->VerifyLinkRecip( $value );
					$recip_link_info = $SkaLinks->GetLinkInfo( $value );
					switch( $result )
					{
						case 'y':
						$msg .= text( array( 'c'=>'txt_recip_link_valid', 'link_title'=>$recip_link_info['Title'] ) );
						break;
						case 'n':
						$msg .= text( array( 'c'=>'txt_recip_link_invalid', 'link_title'=>$recip_link_info['Title'], 'link_back'=>$recip_link_info['LinkBackURL'], 'link_alt_domain'=>$recip_link_info['Alt_domain'] ) );
						break;
						case '0':
						$msg .= text( array( 'c'=>'txt_recip_no_content', 'link_title'=>$recip_link_info['Title'], 'link_back'=>$recip_link_info['LinkBackURL'] ) );
						break;
						case '-1':
						$msg .= text( array( 'c'=>'txt_recip_no_linkback', 'link_title'=>$recip_link_info['Title'], ) );
						break;
					}
				}
			}	 
		}
		if ( $_POST['approve_link'] )
		{
			if ( !$link_array['id'][0] )
			{
				$msg = $_skalinks_lang['msg']['link_not_checked'];
			}
			else
			{
				$type = 2;
				$status = 0;
				foreach ( $link_array['id'] as $value )
				{
					$result = $SkaLinks->UpdateStatus( $type, $value, $status, $ADMIN['Name'] );
					if ( $result )
					{
						$link_info	   = $SkaLinks->GetLinkInfo( $value );
						$location_link = $SkaLinks->GetCategoryURL( $link_info['Category'] );
						$listing_link = ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
						$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_submitted', $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
					}
				}
				$msg = ( $result ) ? $_skalinks_lang['msg']['link_approved'] : $_skalinks_lang['msg']['link_not_approved'] ;
			}
		}
		if ( $_POST['disapprove_link'] )
		{
			if ( !$link_array['id'][0] )
			{
				$msg = $_skalinks_lang['msg']['link_not_checked'];
			}
			else
			{
				$type = 2;
				$status = 1;
				foreach ( $link_array['id'] as $value )
				{
	    				$result = $SkaLinks->UpdateStatus( $type, $value, $status, $ADMIN['Name'] );
					if ( $result )
					{
						$link_info	   = $SkaLinks->GetLinkInfo( $value );
						$location_link = $SkaLinks->GetCategoryURL( $link_info['Category'] );
						$listing_link = ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
						$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_disapproved', $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
					}
				}
				$msg = ( $result ) ? $_skalinks_lang['msg']['link_disapproved'] : $_skalinks_lang['msg']['link_not_disapproved'] ;
			}
		}
		if ( $_POST['check_broken_links'] )
		{
			if ( !$link_array['id'][0] )
			{
				$msg = $_skalinks_lang['msg']['link_not_checked'];
			}
			else
			{
				foreach( $link_array['id'] as $value )
				{
					$result = $SkaLinks->VerifyLinkBroken( $value );  
					$broken_link_info = $SkaLinks->GetLinkInfo( $value );
					$msg .= text( array( 'c'=>'txt_broken_link_status', 'link_http_status'=>$result, 'link_title'=>$broken_link_info['Title'] ) );
				}	
			}	 
		}
		
		if ( $_POST['delete_links'] )
		{
			if ( !$link_array['id'][0] )
			{
				$msg = $_skalinks_lang['msg']['link_not_checked'];
			}
			else
			{ 		
				foreach( $link_array['id'] as $key => $value )
				{ 
					$links_info	   = $SkaLinks->GetLinkInfo( $link_array['id'][$key] );
					$location_link = $SkaLinks->GetCategoryURL( $links_info['Category'] ); 
					$listing_link = ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_id.".html" : $location_link."listing.php?link_id=".$link_id ;
					$result = $SkaLinks->DelLink( $link_array['id'][$key] );
					if ( $result > 0 )
					{
						$SkaLinks->Mailer( $links_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_deleted', $links_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
					}
					$msg .= ( $result > 0 ) ? text( array( 'c'=>'txt_link_deleted', 'link_title' => $links_info['Title'] ) ): text( array( 'c'=>'txt_link_not_deleted', 'link_title' => $links_info['Title'] ) );
				}
			}
		}
}

// Gets pages with links
  $number_links_display		= $SkaLinks->GetParam( 'dir_links_per_page' );
  $number_nav_links_display	= $SkaLinks->GetParam( 'nav_links_per_page' );
  $_output['param'] = $param;
  $_output['hcode'] = $hcode;
  
// get type editor
if ( $ADMIN['Type'] == 2 )
{
	$editor_id = 0;
}
else
{
	$editor_id = $ADMIN['ID'];
}
switch( $param )
{
	case 1:
	$_output['link']	= $SkaLinks->GetVerifyLinks( array( 'type' => 1, 'index' => ( $page - 1)*$number_links_display, 'num' => $number_links_display, 'editor' => $editor_id  ) );
	$_output['all_links']	= $SkaLinks->GetVerifyLinks( array( 'type' => 1, 'editor' => $editor_id  ) ); 
	foreach ( $_output['link'] as $key => $value )
	{
		$_output['link'][$key]['cat_url']	= $SkaLinks->GetCategoryURL( $_output['link'][$key]['Category'] );
		$_output['link'][$key]['cat_title']	= $SkaLinks->GetFullCategoryTitle( $_output['link'][$key]['Category'] );
		if ( $_output['link'][$key]['Rank'] )
		{
			$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['link'][$key]['Rank']." AND `Category`=".$_output['link'][$key]['Category']." AND `ID`<=".$_output['link'][$key]['ID'].")" );  
			$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
			$_output['link'][$key]['page']	  = ceil( $res['count']/$number_links_rank_display );
		}
		else
		{
			$number_links_not_rank_display	= $SkaLinks->GetParam( 'dir_links_per_page' );
			$res			    	= $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>=".$_output['link'][$key]['ID']." AND `Rank`=0 AND `Category`=".$_output['link'][$key]['Category'].")" ); 
			$_output['link'][$key]['page']		     = ceil( $res['count']/$number_links_not_rank_display );
		}
	}
	$_output['links_type'] = $_skalinks_lang['list_links']['title_approve'];
	break;
	case 2:
	$_output['link']	= $SkaLinks->GetVerifyLinks( array( 'type' =>2, 'UrlHeader' => $hcode, 'index' => ( $page - 1)*$number_links_display, 'num' => $number_links_display, 'editor' => $editor_id  ) );
	$_output['all_links']	= $SkaLinks->GetVerifyLinks( array( 'type' =>2, 'UrlHeader' => $hcode, 'editor' => $editor_id  ) );
	foreach ( $_output['link'] as $key => $value )
	{
		$_output['link'][$key]['cat_url']	= $SkaLinks->GetCategoryURL( $_output['link'][$key]['Category'] );
		$_output['link'][$key]['cat_title']	= $SkaLinks->GetFullCategoryTitle( $_output['link'][$key]['Category'] );
		if ( $_output['link'][$key]['Rank'] )
		{
			$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['link'][$key]['Rank']." AND `Category`=".$_output['link'][$key]['Category']." AND `ID`<=".$_output['link'][$key]['ID'].")" );  
			$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
			$_output['link'][$key]['page']	  = ceil( $res['count']/$number_links_rank_display );
		}
		else
		{
			$number_links_not_rank_display	= $SkaLinks->GetParam( 'dir_links_per_page' );
			$res			     	= $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>=".$_output['link'][$key]['ID']." AND `Rank`=0 AND `Category`=".$_output['link'][$key]['Category'].")" ); 
			$_output['link'][$key]['page']	= ceil( $res['count']/$number_links_not_rank_display );
		}
	}
	$_output['links_type'] = $_skalinks_lang['list_links']['title_http_status'].$hcode;
	break;
	case 3:
	$_output['link'] = $SkaLinks->GetVerifyLinks( array( 'type' => 3, 'index' => ( $page - 1)*$number_links_display, 'num' => $number_links_display, 'editor' => $editor_id  ) );
	$_output['all_links'] = $SkaLinks->GetVerifyLinks( array( 'type' => 3, 'editor' => $editor_id  ) );
	foreach ( $_output['link'] as $key => $value )
	{
		$_output['link'][$key]['cat_url']	= $SkaLinks->GetCategoryURL( $_output['link'][$key]['Category'] );
		$_output['link'][$key]['cat_title']	= $SkaLinks->GetFullCategoryTitle( $_output['link'][$key]['Category'] );
		if ( $_output['link'][$key]['Rank'] )
		{
			$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['link'][$key]['Rank']." AND `Category`=".$_output['link'][$key]['Category']." AND `ID`<=".$_output['link'][$key]['ID'].")" );  
			$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
			$_output['link'][$key]['page']	  = ceil( $res['count']/$number_links_rank_display );
		}
		else
		{
			$number_links_not_rank_display = $SkaLinks->GetParam( 'dir_links_per_page' );
			$res			     = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>=".$_output['link'][$key]['ID']." AND `Rank`=0 AND `Category`=".$_output['link'][$key]['Category'].")" ); 
			$_output['link'][$key]['page']		     = ceil( $res['count']/$number_links_not_rank_display );
		}
	}
	$_output['links_type'] = $_skalinks_lang['list_links']['title_invalid_email'];
	break;
	case 4:
	$_output['link']	= $SkaLinks->GetVerifyLinks( array( 'type' => 4, 'index' => ( $page - 1)*$number_links_display, 'num' => $number_links_display, 'editor' => $editor_id  ) );
	$_output['all_links']	= $SkaLinks->GetVerifyLinks( array( 'type' => 4, 'editor' => $editor_id  ) );
	foreach ( $_output['link'] as $key => $value )
	{
		$_output['link'][$key]['cat_url']	= $SkaLinks->GetCategoryURL( $_output['link'][$key]['Category'] );
		$_output['link'][$key]['cat_title']	= $SkaLinks->GetFullCategoryTitle( $_output['link'][$key]['Category'] );
		if ( $_output['link'][$key]['Rank'] )
		{
			$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['link'][$key]['Rank']." AND `Category`=".$_output['link'][$key]['Category']." AND `ID`<=".$_output['link'][$key]['ID'].")" );  
			$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
			$_output['link'][$key]['page']	  = ceil( $res['count']/$number_links_rank_display );
		}
		else
		{
			$number_links_not_rank_display	= $SkaLinks->GetParam( 'dir_links_per_page' );
			$res			     	= $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>=".$_output['link'][$key]['ID']." AND `Rank`=0 AND `Category`=".$_output['link'][$key]['Category'].")" ); 
			$_output['link'][$key]['page']	= ceil( $res['count']/$number_links_not_rank_display );
		}
	}
	$_output['links_type'] = $_skalinks_lang['list_links']['title_invalid_backurl'];
	break;
}
   
$num_links	 = count( $_output['all_links'] ); // Total number of directory links
$total_pages	 = ceil( $num_links / $number_links_display ); // Total pages in navigation links line
if ($total_pages > 1)
{
	// Get offsets
	$left_offset = ceil( $number_nav_links_display / 2 ) - 1;
	$first	     = $page - $left_offset;
	$first	     = $first < 1 ? 1 : $first;
	$last	 = $first + $number_nav_links_display - 1;
	$last	 = ($last > $total_pages) ? $total_pages : $last;

	$first	 = $last - $number_nav_links_display + 1;
	$first	 = ($first < 1) ? 1 : $first; 
	// Create array of indices
	$_output['links_pages'] = range( $first, $last )  ;
}
if( ( !$page ) || ( $page == 1 ) )
{
	$_output['links_links_number'] = 0;
}
else
{
	$_output['links_links_number'] = $number_links_display * ( $page-1 );
}
$_output['links_page']		      = &$page;
$_output['links_number_links_display']  = &$number_links_display; 
$_output['links_num_links']	      = &$num_links;
$_output['links_total_pages']	      = &$total_pages;
$_output['pagerank_set']		= $SkaLinks->GetParam( 'pagerank_set' );
// Show HTML

display( 'admin_links_list' );
}
?>
