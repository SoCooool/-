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


// - Process input data -
$cat_id		   = ( int )$id;
$page		   = $_GET['page'] ? (int)$_GET['page'] : 1;
$cat_array['id']   = $_POST['cat_arr'];
$link_array['id']  = $_POST['link_arr'];
$index		   = 0;
if ( $link_array['id'] )
{
	foreach( $link_array['id'] as $key => $value )
	{
		$link_array['id'][$key] = ( int )$link_array['id'][$key];
	}
}
$index = 0;
if ( $cat_array['id'] )
{
	foreach( $cat_array['id'] as $key => $value )
	{
		$cat_array['id'][$key] = ( int )$cat_array['id'][$key]; 
	}
}


// TODO: Statements here
// $_GET['catID'] = (int)$_GET['catID'];
// $_POST['Rank'] = (int)$_POST['Rank'];
/*
$_POST['Rank'] = $_POST['Rank'] < 0 && $_POST['Rank'] > 10 ? 0 : $_POST['Rank'];
*/

/*
if ( preg_match( '/pattern/', $_POST['Email'] ) )
{
}

*/

// ----------------------
 
//

$smarty	  = new DirSmarty(); 
$SkaLinks->SetRootURL( $_skalinks_url['dir'] );
$SkaLinks->SetRootDir( $_skalinks_dir['dir'] );
$SkaLinks->SetPrefix( $_skalinks_mysql['tbl_prefix'] );
$ADMIN = $SkaLinks->IsAdmin();
$_output['menu']		= 1;
$_output['title']		= $SkaLinks->GetTitleChain( $cat_id, $_skalinks_page['title'], "" );
$_output['show_dirtree']	= $SkaLinks->GetParam( 'show_dirtree' );
$_output['show_admin_ads']	= $SkaLinks->GetParam( 'show_admin_ads' );
$_output['pagerank_set']	= $SkaLinks->GetParam( 'pagerank_set' );
//

//

if ( $ADMIN )
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
				$del_cat_info	= $SkaLinks->GetCatInfo( $cat_array['id'][$key] );
				$result		= $SkaLinks->DelCategory( $cat_array['id'][$key] ); 
				$msg .= text( array( 'c'=>'txt_cat_deleted', 'cat_title'=>$del_cat_info['Title'] ) );
			}
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
				$result		= $SkaLinks->BuildCategory( $cat_array['id'][$key] );
				$app_cat_info	= $SkaLinks->GetCatInfo( $cat_array['id'][$key] );
				$msg .= text( array( 'c'=>'txt_cat_approved', 'cat_title' =>$app_cat_info['Title'] ) );
			}
		}
	}
	if ( $_POST['disapprove_cat'] )
	{
		if ( !$cat_array )
		{
			$msg = $_skalinks_lang['msg']['cat_not_checked'];
		}
		else
		{
			$cat_type = 1;
			$cat_status = 1;
			foreach( $cat_array['id'] as $key => $value )
			{
				$result		= $SkaLinks->UpdateStatus( $cat_type, $value, $cat_status );
				$disap_cat_info = $SkaLinks->GetCatInfo( $value );
				$msg .= text( array( 'c'=>'txt_cat_disapproved', 'cat_title'=>$disap_cat_info['Title'] ) );
				}
			}
	}
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
				$result			= $SkaLinks->VerifyLinkRecip( $value );
				$recip_link_info	= $SkaLinks->GetLinkInfo( $value );
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
					$link_info		= $SkaLinks->GetLinkInfo( $value );
					$location_link		= $SkaLinks->GetCategoryURL( $cat_id );
					$listing_link		= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
					$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_submitted',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
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
					$link_info		= $SkaLinks->GetLinkInfo( $value );
					$location_link		= $SkaLinks->GetCategoryURL( $cat_id );
					$listing_link		= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_info['ID'].".html" : $location_link."listing.php?link_id=".$link_info['ID'] ;
					$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_disapproved',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
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
				$link_info	= $SkaLinks->GetLinkInfo( $link_array['id'][$key] );
				$location_link	= $SkaLinks->GetCategoryURL( $cat_id ); 
				$listing_link	= ( $SkaLinks->GetParam( 'mod_rewrite' ) ) ? $location_link."listing".$link_id.".html" : $location_link."listing.php?link_id=".$link_id ;
				$result = $SkaLinks->DelLink( $link_array['id'][$key] );
				if ( $result > 0 )
				{
					$SkaLinks->Mailer( $link_info['Email'], $_skalinks_site['mail_theme'], 't_admin_link_deleted',  $link_info['URL'], $location_link, $listing_link, $_skalinks_site['brand'] );
				}
	 			$msg .= ( $result > 0 ) ? text( array( 'c'=>'txt_link_deleted', 'link_title' => $link_info['Title'] ) ): text( array( 'c'=>'txt_link_not_deleted', 'link_title' => $link_info['Title'] ) );
	    		}
		}
	}
}

$status = ( $ADMIN ) ? -1: 0;
$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );
$_output['categories'] = $SkaLinks->GetCategories( $cat_id, $status );
$_output['num_subcats'] = $SkaLinks->GetParam( 'num_subcats' );
foreach( $_output['categories'] as $key => $value )
{
	// get editors id and name
	$_output['categories'][$key]['Editor_info'] = $SkaLinks->GetCatEditor( $_output['categories'][$key]['ID'] );
	$sub_cat = $_output['categories'][$key]['ID'];
	$sub_res = $SkaLinks->GetCategories( $sub_cat, $status );
	$meter   = 1;
	$count_u = 0;
	foreach ( $sub_res as $key1 => $value1 )
	{
		if( $meter <= $_output['num_subcats'] )
		{
			$_output['categories'][$key]['sub'][$count_u]['id']	= $sub_res[$key1]['ID'] ;
			$_output['categories'][$key]['sub'][$count_u]['url']	= $sub_res[$key1]['url'];
			$_output['categories'][$key]['sub'][$count_u]['title']	= $sub_res[$key1]['title'];
			$meter++; 
			$count_u++;
		}	
		else
		{
			break;
		}
	}
}
 
if ( $cat_id )
{
	$_output['cat_info']			 = $SkaLinks->GetCatInfo( $cat_id );
	$_output['meta_keywords']		 = str_replace( $search = array( 0 => " - ", 1 => " " ), ",", $_output['title'] );
	$_output['meta_description']			 = $_output['cat_info']['meta_desc'];
	$_output['this_cat_url']	         = $SkaLinks->GetCategoryURL( $cat_id );
	$_output['related_categories']		 = $SkaLinks->GetRelatedCategories( $cat_id, $status );
	$_output['cat_navigation']	    	 = $SkaLinks->GetCatNavigationLine( $cat_id ); // Get Navigation Category Line
	$number_search_results_display		 = $SkaLinks->GetParam( 'number_search_display' );
	$number_links_not_rank_display		 = $SkaLinks->GetParam( 'dir_links_per_page' );
	$number_nav_links_display		 = $SkaLinks->GetParam( 'nav_links_per_page' );
	$number_links_rank_display		 = $SkaLinks->GetParam( 'dir_links_rank_per_page' );
	$rank_links				 = $SkaLinks->GetLinks( array( 'cat' => $cat_id, 'status' => $status, 'index' => ($page - 1)*$number_links_rank_display, 'num' => $number_links_rank_display, 'flag' => 3) );
	$not_rank_links			         = $SkaLinks->GetLinks( array( 'cat' => $cat_id, 'status' => $status, 'index' => ($page - 1)*$number_links_not_rank_display, 'num' => $number_links_not_rank_display , 'flag' => 2 ) );
	$number_links_display		         = ( $number_links_not_rank_display + $number_links_rank_display );
	$_output['links']		         = array_merge( $rank_links, $not_rank_links );
	if ( !$_output['links'] && ( $page > 1 ) )
	{
		header( "Location: {$_output['this_cat_url']}{$_output['cat_index_url']}" );
	}
	$num_not_rank_links			 = $SkaLinks->GetLinksCount( array( 'cat' => $cat_id, 'status' => $status, 'rank' => 0 ) ); // Total number of directory links
	$num_rank_links				 = $SkaLinks->GetLinksCount( array( 'cat' => $cat_id, 'status' => $status, 'rank' => 1 ) );
	$rank_pages			         = ceil( $num_rank_links / $number_links_rank_display );
	$last_rank_links		         = fmod( $num_rank_links, $number_links_rank_display );
	$not_rank_pages			         = ceil( $num_not_rank_links / $number_links_not_rank_display ); 
	$total_pages				 = ( $not_rank_pages >= $rank_pages ) ? $not_rank_pages : $rank_pages; // Total pages in navigation links line
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
   $_output['links_num_links']		       = &$num_links;
   $_output['links_total_pages']	       = &$total_pages;
   }
   // gets cat editor id and name
   $_output['cat_info']['Editor_info'] = $SkaLinks->GetCatEditor( $cat_id );
   
   $_output['mod_rewrite']	= $SkaLinks->GetParam( 'mod_rewrite' );
   $_output['link_open']	= $SkaLinks->GetParam( 'link_open' );
   $_output['listing_url_view']	= $SkaLinks->GetParam( 'listing_url_view' );
   $_output['cat_pages_view']	= $SkaLinks->GetParam( 'cat_pages_view' );
   $_output['visitor_add_cat']	= $SkaLinks->GetParam( 'visitor_add_cat' );

// ---
// - Output HTML -
if ( $cat_id )
{
	if ( $_output['mod_rewrite'] )
	{
		foreach( $_output['links'] as $key => $value )
		{
			$_output['links'][$key]['listing_url'] = str_replace( "<listing_id>", $_output['links'][$key]['ID'], $_output['listing_url_view'] );
		}
	}
	$cat_title = convert_quote( $_output['cat_info']['Title'] );
	$_output['searches'] = $SkaLinks->GetSearches( $cat_title['s_strip'] , $number_search_results_display ); 
	foreach( $_output['searches'] as $key => $value )
	{
		if ( $_output['mod_rewrite'] )
		{
			$_output['searches'][$key]['URL'] = $_skalinks_url['dir']."search_url=".urlencode( "{$_output['searches'][$key]['Pattern']}&search_type[]=URL&search_type[]=Title&search_type[]=Description").".html" ;
		}
		else
		{
			$_output['searches'][$key]['URL_Pattern'] = urlencode( $_output['searches'][$key]['Pattern'] );
		}
	}
	if ( $SkaLinks->HasCustomTemplate( $cat_id ) )
	{
		// Custom template
		$fileName = "cat$id";
	}
	else
	{
		// General purpose template
		$fileName = 'cat';
	}
	display( $fileName );
}
else
{
	
	display( 'index' );
}


// ---------------

?>
