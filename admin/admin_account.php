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

// Statements
	
$smarty		 = new DirSmarty();
$ADMIN = $SkaLinks->IsAdmin();

// Process input data

if ( $ADMIN['Type'] == 2 )
{
	if ( $_POST['Add_admin'] )
	{
		if ( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['admin_email'] ) )
		{
			$inf_item .= $_skalinks_lang['editors']['email'].'<br>';
		}
		elseif( !strlen( $_POST['admin_password'] ) )
		{
			$inf_item .= $_skalinks_lang['editors']['passwd'].'<br>';
		}
		elseif( !strlen( $_POST['admin_name'] ) )
		{
			$inf_item .= $_skalinks_lang['editors']['name'].'<br'; 
		}
	
		if ( !$inf_item )
		{
			$admin_attribute = 1;
		}
	}

	if ( $_POST['save_admin'] )
	{
		if ( $_POST['admin_arr'] )
		{
			foreach( $_POST['admin_arr'] as $value )
			{
				$inf_item = array();
				
				$editor_info = $SkaLinks->db_Row( "SELECT `Name` FROM `dir_admins` WHERE `ID`='$value'" );
				
				if ( !preg_match("/^.+\@(\[?)[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/", $_POST['editor_email'][$value] ) )
				{
					$inf_item[$editor_info['Name']] = $_skalinks_lang['editors']['email'].'<br>';
				}
				if( !strlen( $_POST['editor_name'][$value] ) ) 
				{
					$inf_item[$editor_info['Name']] .= $_skalinks_lang['editors']['name'].'<br>'; 
				}
				
				if ( array_count_values( $inf_item ) )
				{
					$editor_attribute[$editor_info['Name']] = $inf_item[$editor_info['Name']];
				}
				else
				{
					$inf_item = array();
				}
			}
			
		}
		else
		{
			$not_check_item = 1;
		}
	}
}

if( $ADMIN['Type'] == 2 )
{
	if ( $_POST['Add_admin'] && $admin_attribute )
	{
		$msg = ( $SkaLinks->AddAdmin( $_POST['admin_name'], md5( $_POST['admin_password'] ), $_POST['admin_email'], $_POST['admin_type'] ) ) ? $_skalinks_lang['msg']['admin_exists'] : $_skalinks_lang['msg']['admin_added'];
	}
	if ( $_POST['Add_admin'] && !$admin_attribute )
	{
		$msg = $_skalinks_lang['msg']['inf_incomplete']."<br/>".$inf_item;
	}
	if ( $_POST['delete_admin'] )
	{
		$exists = $SkaLinks->db_Row( "SELECT * FROM `".$SkaLinks->m_AdminsTable."` WHERE `Name`='".$_COOKIE['adminname']."' AND `Password`='".$_COOKIE['pwd']."'" );
		foreach( $_POST['admin_arr'] as $value )
	      	{
		       if ( $exists['Name'] != $value )
		       {
			       	$SkaLinks->DelAdmin( $value );
		      		$msg = $_skalinks_lang['msg']['admin_deleted'];
			}
			else
			{
				$msg = $_skalinks_lang['msg']['del_cur_editor'];
			}
		}
	}

	if ( $_POST['save_admin'] )
	{
		if ( $not_check_item )
		{
			$msg = $_skalinks_lang['editors']['not_checked_ed'];
		}
		else
		{
			$sql = "SELECT `ID` FROM `dir_admins` WHERE `Name`='{$ADMIN['Name']}'";
			$cur_adm = $SkaLinks->db_Row( $sql );
			
			foreach( $_POST['admin_arr'] as $value )
			{
				$editor_info = $SkaLinks->db_Row( "SELECT `Name` FROM `dir_admins` WHERE `ID`='$value'" );
				if ( !$editor_attribute[$editor_info['Name']] )
				{
					if ( ( $cur_adm['ID'] == $value ) && ( $_POST['editor_type'][$value] != 2 ) )
					{
						$_POST['editor_type'][$value] = 2;
						$msg = $_skalinks_lang['msg']['cur_editor_status']."<br/>";
					}
					if ( $SkaLinks->EditAdmin( $value, $_POST['editor_name'][$value], $_POST['editor_email'][$value], $_POST['editor_type'][$value], $_POST['editor_new_pass'][$value] ) )
					{
						$msg .= text( array( 'c' => 'txt_editor_saved', 'e_name' => $editor_info['Name'] ) );
					}		
				}
				else
				{
					$msg .= text( array( 'c' => 'txt_editor_incomplete', 'e_name' => $editor_info['Name'] ) ).$editor_attribute[$editor_info['Name']];
				}
			}
		}
	}
	
	$_output['admins'] = $SkaLinks->GetAdmins(); 
	display( 'admin_account' );
}
else
{
	$msg = $_skalinks_lang['msg']['not_admin'];
	require_once( '../index.php' );
}
?>
