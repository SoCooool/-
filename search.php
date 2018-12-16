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

// Input data

$link_array['id']  = $_POST['link_arr'];
if ( $link_array['id'][0] )
{
	foreach( $link_array['id'] as $key => $value )
	{
		$link_array['id'][$key] = ( int )$link_array['id'][$key];
	}
}
//TODO: Statements here:

$smarty		= new DirSmarty();
$ADMIN		= $SkaLinks->IsAdmin();
$_output['menu'] = 0;

// Statements with links

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
			$result		 = $SkaLinks->VerifyLinkRecip( $value );
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
		$type	= 2;
		$status	= 0;
		foreach ( $link_array['id'] as $value )
		{
			$result = $SkaLinks->UpdateStatus( $type, $value, $status );
			if ( $result )
			{
				$link_info	= $SkaLinks->GetLinkInfo( $value );
				$location_link	= $SkaLinks->GetCategoryURL( $link_info['Category'] );
				$listing_link	= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
				$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_submitted',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'], $_skalinks_site['mail_links'] );
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
		$type	= 2;
		$status = 1;
		foreach ( $link_array['id'] as $value )
		{
			$result = $SkaLinks->UpdateStatus( $type, $value, $status );
			if ( $result )
			{
				$link_info	= $SkaLinks->GetLinkInfo( $value );
				$location_link	= $SkaLinks->GetCategoryURL( $link_info['Category'] );
				$listing_link	= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
				$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_disapproved',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'], $_skalinks_site['mail_links'] );
			}
		}
		$msg = ( $result ) ? $_skalinks_lang['msg']['link_approved'] : $_skalinks_lang['msg']['link_not_approved'] ;
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
			$result			= $SkaLinks->VerifyLinkBroken( $value );  
			$broken_link_info	= $SkaLinks->GetLinkInfo( $value );
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
			$links_info	= $SkaLinks->GetLinkInfo( $link_array['id'][$key] );
			$location_link	= $SkaLinks->GetCategoryURL( $links_info['Category'] ); 
			$listing_link	= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_id.".html" : $location_link."listing.php?link_id=".$link_id ;
			$SkaLinks->Mailer( $links_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_deleted',  $links_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'], $_skalinks_site['mail_links'] );
		$result = $SkaLinks->DelLink( $link_array['id'][$key] );
		}
		$msg = ( $result ) ? $_skalinks_lang['msg']['link_deleted']: $_skalinks_lang['msg']['link_not_deleted'];
	}
}
}
if ( $_GET['url'] && $_GET['search_type'] )
{
	$S_URL			= convert_quote( $_GET['url'] );
	$_output['title']	= $SkaLinks->GetTitleChain( -1, $_skalinks_page['title_search_result'], $S_URL['s_strip'] );
}
else
{
	$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_search'] );
}
$_output['show_dirtree']	= $SkaLinks->GetParam( 'show_dirtree' );
$_output['show_admin_ads']	= $SkaLinks->GetParam( 'show_admin_ads' );
$_output['mod_rewrite']		= $SkaLinks->GetParam( "mod_rewrite" );
if ( $_GET['url'] && $_GET['search_type'] )
{
	$cat_id					= 0;
	$status					= ( $ADMIN ) ? -1 : 0;
	$page					= ( !$_GET['page'] ) ? 1 : $_GET['page']; 
	$number_links_not_rank_display		= $SkaLinks->GetParam( 'dir_links_per_page' );
	$number_nav_links_display		= $SkaLinks->GetParam( 'nav_links_per_page' );
	$number_links_rank_display		= $SkaLinks->GetParam( 'dir_links_rank_per_page' );
	$SkaLinks->AddSearchPattern( $S_URL['s_strip'] );
	$rank_links				= $SkaLinks->GetLinks( array('cat' => $cat_id, 'status' => $status, 'index' => ($page - 1)*$number_links_rank_display, 'num' => $number_links_rank_display, 'flag' => 3 ,'search_type' => $_GET['search_type'], 'search' => $S_URL['s_strip'] ) );
	$not_rank_links				= $SkaLinks->GetLinks( array( 'cat' => $cat_id, 'status' => $status, 'index' => ($page - 1)*$number_links_not_rank_display, 'num' => $number_links_not_rank_display, 'flag' => 2, 'search_type' => $_GET['search_type'], 'search' => $S_URL['s_strip'] ) );
	$number_links_display			= ( $number_links_not_rank_display + $number_links_rank_display );
	$_output['links']		        = array_merge( $rank_links, $not_rank_links );
	$num_not_rank_links			= $SkaLinks->GetLinksCount( array( 'cat' => $cat_id, 'status' => $status, 'rank' => 0, 'url' => $S_URL['s_strip'] ) ); // Total number of directory links
	$num_rank_links				= $SkaLinks->GetLinksCount( array( 'cat' => $cat_id, 'status' => $status, 'rank' => 1, 'url' => $S_URL['s_strip'] ) );
	$rank_pages			        = ceil( $num_rank_links / $number_links_rank_display );
	$last_rank_links		        = fmod( $num_rank_links, $number_links_rank_display );
	$not_rank_pages				= ceil( $num_not_rank_links / $number_links_not_rank_display ); 
	$total_pages				= ( $not_rank_pages >= $rank_pages ) ? $not_rank_pages : $rank_pages; // Total pages in navigation links line
	if ( $total_pages > 1 )
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
	$_output['links_page']		       = &$page;
	$_output['links_number_links_display']      = &$number_links_display;
	$_output['search_type']		       = $_GET['search_type'];
	if ( $rank_pages )
	{
		if ( ( $page <= $rank_pages ) || ( ( $page ==  $rank_links_page )  && $last_rank_links ) )
		{
			$_output['numbering_link'] = $_output['links_number_links_display']*$_output['links_page']-$_output['links_number_links_display'];
		}
		if ( ( $page == ( $rank_pages + 1 ) ) && !$last_rank_links )
		{
			$_output['numbering_link'] = ( $page - 1 )*$number_links_display;
		}
		else
		{
			if ( $page > ( $rank_pages) )
			{
				$_output['numbering_link'] = ($rank_pages-1)*$number_links_display + $number_links_not_rank_display * ( $_output['links_page'] - $rank_pages ) + $last_rank_links ;
			}
		}
	}
	else
	{
		$_output['numbering_link'] = ( $page - 1 )*$number_links_not_rank_display;
	}
	$_output['mod_rewrite']			= $SkaLinks->GetParam( 'mod_rewrite' );
	
	// Get URL view for listing pages
	$_output['listing_url_view']	= $SkaLinks->GetParam( 'listing_url_view' );
	//Get URL view for category pages
	$_output['cat_pages_view']	= $SkaLinks->GetParam( 'cat_pages_view' );
	$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );
	$_output['links_num_links']	        = &$num_links;
	$_output['links_total_pages']		= &$total_pages;
	// Set link's category URL, listing URL and Title
	foreach ( $_output['links'] as $key => $value )
	{
		$cat_info = $SkaLinks->GetCatInfo( $_output['links'][$key]['Category'] );
		$_output['links'][$key]['cat_title'] = $cat_info['Title'];
		if ( $_output['mod_rewrite'] )
		{
			$_output['links'][$key]['listing_url'] = str_replace( "<listing_id>", $_output['links'][$key]['ID'], $_output['listing_url_view'] );
		}
		if ( $_output['links'][$key]['Rank'] )
		{
			$res				  = $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`Rank`>=".$_output['links'][$key]['Rank']." AND `Category`=".$_output['links'][$key]['Category']." AND `ID`<=".$_output['links'][$key]['ID'].")" );  
			$number_links_rank_display	  = $SkaLinks->GetParam( 'dir_links_rank_per_page' ); 
			$_output['links'][$key]['page']	  = ceil( $res['count']/$number_links_rank_display );
		}
		else
		{
			$number_links_not_rank_display	= $SkaLinks->GetParam( 'dir_links_per_page' );
			$res			     	= $SkaLinks->db_Row( "SELECT COUNT(*) as count FROM ".$SkaLinks->m_LinksTable." WHERE (`ID`>=".$_output['links'][$key]['ID']." AND `Rank`=0 AND `Category`=".$_output['links'][$key]['Category'].")" ); 
			$_output['links'][$key]['page']	= ceil( $res['count']/$number_links_not_rank_display );
		}
	}
}
	// Get display params  
	$_output['link_open']	= $SkaLinks->GetParam( 'link_open' );
	$_output['pagerank_set']	= $SkaLinks->GetParam( 'pagerank_set' );

	$_output['search_url']	= $S_URL['m_strip'];

	display( 'search' );  
?>
