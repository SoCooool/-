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
if ( !$_output['register_users'] )
{
	$msg = $_skalinks_lang['msg']['register_users_disable'];
	require_once( $_skalinks_dir['dir'].'index.php' );
	exit;
}


$admin_attribute = ( ctype_space( $_POST['admin_name'] ) || ctype_space( $_POST['admin_password'] ) ) ? 0 : 1 ;
$_output['menu'] = 0;

// TODO: Statements here:

$smarty		= new DirSmarty();
$_output['title'] = $SkaLinks->GetTitleChain( -1, $_skalinks_lang['titles']['editor_register'], $_skalinks_lang['titles']['editor_editor_register'] );
$ADMIN = $SkaLinks->IsAdmin();

if ( $_POST['Register'] )
{
	// check input data
	$_output['info_complete'] = array();
	if ( strlen( trim( $_POST['admin_name'] ) ) )
	{
		$checked_admin_name	= convert_quote( $_POST['admin_name'] );
	}
	else
	{
		$_output['info_complete'][]	= $_skalinks_lang['register_editor']['info_incomp']['admin_name'];
		$_POST['admin_name']		= '';
	}
	if ( strlen( trim( $_POST['admin_password'] ) ) )
	{
		$checked_admin_pass		= convert_quote( $_POST['admin_password'] );
	}
	else
	{
		$_output['info_complete'][]	= $_skalinks_lang['register_editor']['info_incomp']['admin_password'];
		$_POST['admin_password']	= '';
	}
	if ( strlen( trim( $_POST['admin_email'] ) ) && preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['admin_email'] ) )
	{
		$checked_admin_email		= convert_quote( $_POST['admin_email'] );
	}
	else
	{
		$_output['info_complete'][]	= $_skalinks_lang['register_editor']['info_incomp']['admin_email'];
		$_POST['admin_email']		= ''; 
	}

	if ( !$_output['info_complete'][0] )
	{
		if ( $SkaLinks->AddAdmin( $checked_admin_name['s_strip'], md5( $checked_admin_pass['s_strip'] ), $checked_admin_email['s_strip'], 1 ) ) 
	       	{
			$msg = $_skalinks_lang['msg']['admin_exists'];
		}
		else
		{
			$msg = $_skalinks_lang['msg']['admin_added'];
			$SkaLinks->Login( $checked_admin_name['s_strip'], md5( $checked_admin_pass['s_strip'] ) );
			header( "Location: {$_skalinks_url['admin']}?first_register=1" );
		}
	}
	else
	{
		$msg = $_skalinks_lang['msg']['inf_incomplete'];
		foreach( $_output['info_complete'] as $key => $value )
		{
			$msg .= "<br/>".$value;
		}
	}
}
if ( !$ADMIN )
{
	$_output['menu'] = 0;
}

display( 'register_editor' );

?>
