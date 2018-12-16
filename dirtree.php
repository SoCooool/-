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


$smarty = new DirSmarty();
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_page['title'], $_skalinks_page['title_dirtree'] );

$ADMIN = $SkaLinks->IsAdmin();

$_output['categories']		= $SkaLinks->GetCategories( 0, -1 );
$_output['show_dirtree']	= $SkaLinks->GetParam( 'show_dirtree' );
$_output['mod_rewrite']		= $SkaLinks->GetParam( 'mod_rewrite' );
$_output['cat_index_url']	= $SkaLinks->GetParam( 'cat_index_url' );

display( 'dirtree' );
?>

