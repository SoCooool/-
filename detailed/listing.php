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
			// Input Data
		
			$SkaLinks = new SkaLinks( $_skalinks_mysql );
			$smarty = new DirSmarty();
			$SkaLinks->SetRootUrl( $_skalinks_url['root'] );
			$SkaLinks->SetPrefix( $_skalinks_mysql['tbl_prefix'] );
			$url	     = $_GET['link_id'];
			$table_name  = $SkaLinks->m_LinksTable;
			$ADMIN	     = $SkaLinks->IsAdmin();
			$_output['linkopen_mod']	= $SkaLinks->GetParam( 'link_open' );
			$_output['mod_rewrite']		= $SkaLinks->GetParam( 'mod_rewrite' );
			$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );
			$_output['show_admin_ads']	= $SkaLinks->GetParam('show_admin_ads' );
			$number_search_results_display	= $SkaLinks->GetParam( 'number_search_display' );
			$_output['show_dirtree']	= $SkaLinks->GetParam('show_dirtree' );
			$_output['links_info']		= $SkaLinks->db_Row( "SELECT * FROM `$table_name` WHERE ID='$url' AND `Status` = '0'" );
			
			if ( !$_output['links_info'] )
			{
				exit;
			}
			
			$link_arr['id']		        = $url;
		        $link_arr['cat_id']	        = $_output['links_info']['Category'];
		        $link_arr['link']	        = $_output['links_info']['URL'];
		        $link_arr['LinkBackURLValid']	= $_output['links_info']['LinkBackURLValid'];
		        $link_arr['EmailValid']	        = $_output['links_info']['EmailValid'];
		        $link_arr['title']	        = $_output['links_info']['Title'];
		        $link_arr['description']	= $_output['links_info']['Description'];
		        $link_arr['rank']	        = $_output['links_info']['Rank'];
		        $link_arr['linkback']	        = $_output['links_info']['LinkBackURL']; 
		        $link_arr['email']	        = $_output['links_info']['Email'];
		        $link_arr['alt_domain']		= $_output['links_info']['Alt_domain'];
		        $link_arr['admin_name']		= $_output['links_info']['Admin_id'];
			$link_arr['extended_desc']	= $_output['links_info']['Full_Description'];
		        $SkaLinks->EditLink( $link_arr );
		        $_output['links_info']['Description']	= ( $_output['links_info']['Full_Description'] ) ? mysql_real_escape_string( $_output['links_info']['Full_Description'] ) : mysql_escape_string( $_output['links_info']['Description'] );	
		       
			$_output['title']		= $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_output['links_info']['Title'] );
			$_output['meta_description']	= $_output['links_info']['Description'];
			$_output['cat_navigation']	= $SkaLinks->GetCatNavigationLine( $_output['links_info']['Category'] );
			$_output['cat_info']		= $SkaLinks->GetCatInfo( $_output['links_info']['Category'] );
			$_output['searches']		= $SkaLinks->GetSearches( $_output['links_info']['Title'], $number_search_results_display ); 
			if ( $_output['mod_rewrite'] )
   			{
				foreach( $_output['searches'] as $key => $value )
				{
					$_output['searches'][$key]['URL'] = $_skalinks_url['dir']."search_url={$_output['searches'][$key]['Pattern']}".urlencode( "&search_type[]=URL&search_type[]=Title&search_type[]=Description").".html" ;
				}
			}
	                display('listing');
?>
