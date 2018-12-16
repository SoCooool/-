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
if ( $_POST['settings'] )
{
	foreach( $_POST['settings'] as $key => $value)
	{
		$_POST['settings'][$key] = trim( $_POST['settings'][$key] );
		if ( $key != 'cat_index_url' && ctype_space( $_POST['settings'][$key] ) )
		{
			$settings_attribute = 1;
			break;
		}
	}
}

// TODO: Statements here..
$smarty			= new DirSmarty();
$ADMIN			= $SkaLinks->IsAdmin();
$_output['title']	= $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], "Settings" );
if ( $ADMIN['Type'] != 2 )
{
   	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
      
}
else
{
	if ( $_GET['s_name'] )
	{
		$_output['s_name'] = $_GET['s_name'];
		if ( $_POST['Change_settings'] )
		{
			if ( !$settings_attribute )
			{ 
				foreach( $_POST['settings'] as $key => $value )
				{
					$checked_value = convert_quote( $value );
					$SkaLinks->SetParam( $key, $checked_value['all_strip'] );
				}
				$msg = $_skalinks_lang['msg']['changes_done'];
		     		if ( $_output['s_name'] == 'dis_url' && $_POST['settings']['mod_rewrite'] )
				{
					$_POST['settings']['listing_url_view']	= str_replace( "<listing_id>", "([0-9]+)", $_POST['settings']['listing_url_view'] );
					$_POST['settings']['listing_url_view']	= str_replace( ".", "\.", $_POST['settings']['listing_url_view'] );
					$_POST['settings']['cat_pages_view']	= str_replace( "<page_number>", "([0-9]*)", $_POST['settings']['cat_pages_view'] );
					$_POST['settings']['cat_pages_view']	= str_replace( ".", "\.", $_POST['settings']['cat_pages_view'] );

$content = "# BEGIN SkaLinks
<IfModule mod_rewrite.c>
RewriteEngine on
RewriteRule ^(.*){$_POST['settings']['listing_url_view']} $1detailed/listing.php?link_id=$2
RewriteRule search_(.*)\.html search.php?$1
RewriteRule ^(.*){$_POST['settings']['cat_pages_view']} $1index.php?page=$2";
if ( $_POST['settings']['cat_index_url'] ) 
{
	$content .= "\nRewriteRule ^(.*){$_POST['settings']['cat_index_url']} $1index.php";
}
$content .="
</IfModule>
# END SkaLinks
					";
					if ( is_writable( $_skalinks_dir['root'].'.htaccess' ) )
					{
						$file_cont = file( $_skalinks_dir['root'].'.htaccess' );
						foreach( $file_cont as $s )
						{
							if ( substr_count( $s, "# BEGIN SkaLinks" ) )
							{
								$ht_access_cont .= $content;
							       	$begin_fl = 1;
								$block_exists = 1;
							}
							if ( !$begin_fl )
							{
								$ht_access_cont .= $s;
							}
							if ( substr_count( $s, "# END SkaLinks" ) )
							{
								$begin_fl = 0;
							}
						}
						if ( !$block_exists )
						{
							$ht_access_cont .= $content;
						}
						$f = @fopen( $_skalinks_dir['root'].'.htaccess', 'w' );
						fwrite( $f, $ht_access_cont );
						fclose( $f );
					}
					else
					{
						$msg .= $_skalinks_lang['msg']['htaccess_change'].str_replace( "<IfModule mod_rewrite.c>", "&lt;IfModule mod_rewrite.c&gt;", str_replace( "</IfModule>", "&lt;/IfModule&gt;", nl2br( $content ) ) );
					}
				}
			}
			else
			{
				$msg = $_skalinks_lang['msg']['inf_incomplete'];
			}
		}
		$_output['settings'] = $SkaLinks->GetParam( 0, $_GET['s_name'] );
		foreach( $_output['settings'] as $key => $value )
		{	      
			$temp = $_output['settings'][$key]['Name'];
			$_output['settings'][$key]['mean'] = $_skalinks_lang['settings'][$temp];
			if ( $_output['settings'][$key]['type'] == 'select' && $_output['settings'][$key]['Range'] )
			{
				$_output['settings'][$key]['Range'] = explode( ";", $_output['settings'][$key]['Range'] );
				foreach( $_output['settings'][$key]['Range'] as $key1 => $value1 )
				{
					$_output['settings'][$key]['Range'][$key1] = explode( '=', $_output['settings'][$key]['Range'][$key1] );
				}
			}
		}
	}
	else
	{
		
	}
	      
	// Show HTML
	$_output['js'] = 'form.js';
	if( $_GET['s_name'] == 'dis_url' )
	{
		$_output['onload'][] = "SetModRewrite();";
	}
	display( 'settings' );
}
?>
