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
	
$_display = array
(
   'sub_cats' => 3,
   'row_cats' => 3.
);

function display( $template_name )
{
	global $smarty;
	$smarty->display( $template_name . '.tpl' );  
}

function showdirtree($para)
{
		
	global $_skalinks_url;
	global $SkaLinks;
	global $s;
	global $_output;
	
	$s = $s."<ul> <div id=".$para['cats']." style='display:none'  class='edit' >";
   
	$cat	= $para['cats'];
	$status	= ( $para['ADMIN'] ) ? -1 : 0;
	$res	= $SkaLinks->GetCategories($cat, $status);
	foreach($res as $key=>$cat)
	{
		$temp = $SkaLinks->GetCategories($cat['ID'], $status);
		if( $cat['log']==1 )
		{
			$flag_vir = "&nbsp@&nbsp";
		}
		else
		{
			$flag_vir = "";
		}
			   
		if( $temp )
		{	
			if ( !$flag_vir )
			{
				if ( $_output['mod_rewrite'] )
				{
					$s = $s."<li class=dirtree><a  class=\"edit\" href=\"javascript:divShow(".$cat['ID'].")\">+</a> <a name=".$cat['ID']." class=\"edit\" href=\"".$cat['url'].$_output['cat_index_url']."\">".$cat['title']."</a>".$flag_vir."(".$cat['links'].")";
				}
				else
				{
					$s = $s."<li><a  class=\"edit\" href=\"javascript:divShow(".$cat['ID'].")\">+</a> <a name =".$cat['ID']." class=\"edit\" href=\"".$cat['url']."\">".$cat['title']."</a>".$flag_vir."(".$cat['links'].")";
				}
			}
			else
			{
				if ( $_output['mod_rewrite'] )
				{
					$s = $s."<li><a  class='edit' href=\"".$cat['url'].$_output['cat_index_url']."\">".$cat['title']."</a>".$flag_vir."(".$cat['links'].")";
				}
				else
				{
					$s = $s."<li><a  class='edit' href=\"".$cat['url']."\">".$cat['title']."</a>".$flag_vir."(".$cat['links'].")";
				}
			}
		}   
		else
		{
			if ( $_output['mod_rewrite'] )
			{
				$s = $s."<li> <a  class=\"edit\" href=\"".$cat['url'].$_output['cat_index_url']."\">".$cat['title']."</a>".$flag_vir." (".$cat['links'].")";
			}
			else
			{
				$s = $s."<li> <a  class=\"edit\" href=\"".$cat['url']."\">".$cat['title']."</a>".$flag_vir." (".$cat['links'].")";
			}
		}
		           	     
		if ( $temp && !$flag_vir )
		{
			showdirtree( array( 'cats'=> $cat['ID'] ) );
		}		 
	} 
	$s = $s."</div></ul>";
	return $s;
}
function convert_quote( $string )
{
	$ret_arr = array();
	$ret_arr['s_strip']	= stripslashes( str_replace( "&quot;", '"', str_replace( "&#039;", "'", $string ) ) );
	$ret_arr['qq_strip']	= str_replace( '"', '\"', stripslashes( str_replace( "&quot;", '"', str_replace( "&#039;", "'", $string ) ) ) );
	$ret_arr['q_strip']	= str_replace( "'", "\'", stripslashes( str_replace( "&quot;", '"', str_replace( "&#039;", "'", $string ) ) ) );
	$ret_arr['m_strip']	= stripslashes( str_replace( '"', "&quot;", str_replace( "'", "&#039;", $string ) ) );
	$ret_arr['all_strip']	= stripslashes( str_replace( "&quot;", '"', str_replace( "&#039;", "'", $ret_arr['qq_strip'] ) ) );

	return $ret_arr;
}
function display_cats( $arr )
{
	global $_display;
	global $SkaLinks;
	global $_output;

	$_display['row_cats']	= $SkaLinks->GetParam( 'num_cols_cat' );
	$_display['sub_cats']	= $SkaLinks->GetParam( 'num_subcats' );
	$_output = $arr['output'];
	$row = $_display['row_cats'];
	echo "<table class=maintext cellpadding=8>";
	foreach( $_output['categories'] as $key => $value )
	{
		if ( $row == $_display['row_cats'] )
		{
			echo "<tr>";
			$row = 1;
		}
		else
		{
			$row++;
		}
		echo "<td align='left' valign='top'>";   
		if ( $_output['mod_rewrite'] )
		{
			echo "<a class='cat' href='".$_output['categories'][$key]['url'].$_output['cat_index_url']."'>".$_output['categories'][$key]['title']."</a>";
		}
		else
		{
			echo "<a class='cat' href='".$_output['categories'][$key]['url']."'>".$_output['categories'][$key]['title']."</a>";
		}
															
		$s = count($_output['categories'][$key]['sub']);
		$arr = array();
		if ( $_output['categories'][$key]['links'] ) 
		{
			$count_l="&nbsp;(".$_output['categories'][$key]['links'].")";
		} 
		else
		{
			$count_l="";
		}
				
		echo $count_l;
		if ( $_output['categories'][$key]['logical']==1 )
		{		
			echo " @ ";			
		} 	
		echo "<br>";	
			
		for ( $i=0; $i<$s; $i++ )
		{
			if ( $_output['mod_rewrite'] )
			{
				$arr[$i] = "<a class='sub_cat' href='".$_output['categories'][$key]['sub'][$i]['url'].$_output['cat_index_url']."'>".$_output['categories'][$key]['sub'][$i]['title']."</a>";
			}
			else
			{
				$arr[$i] = "<a class='sub_cat' href='".$_output['categories'][$key]['sub'][$i]['url']."'>".$_output['categories'][$key]['sub'][$i]['title']."</a>";
			}
		}
		echo implode( ', ', $arr );
		
		echo "<br>";
		echo "<br>";
		echo "<br>";
		echo "</td>";
	
  	} 
	echo "</table>"; 
}

function convert_ads_pos($param)
{
	$cat_id		= ( int )$param['cat_id'];
	$type		= $param['type'];
	global $SkaLinks;
	$cat_id		= ( int )$cat_id;
	$cat_binding_table	= $SkaLinks->m_AdsBindingTable;
	$ads_type		= $SkaLinks->GetParam('count_ads_pos');
	$positions		= explode( " ", $ads_type );
	$res			= $SkaLinks->db_Fetch("SELECT `Ads_position` FROM `$cat_binding_table` WHERE `Cat_id`='$cat_id' AND `Page_type`='$type'" ) ;
	$index			= 0;
	foreach( $positions as $value)
	{
		$key = 0;
		foreach( $res as $key1 => $value1 )
		{
			if ( $value == $res[$key1]['Ads_position'] )
			{
				$key = 1;
			}
		}
		if ( !$key )
		{ 
			$result[$index] = $value;
			$index++;
		}
	}
	return $result;
	}
function show_ads( $param )
{
	global $SkaLinks;
	global $_skalinks_url;
	$param['id'] = ( int )$param['id'];
	if ( $param['id'] > -1 )
	{
		if ( $param['ads_id'] )
		{
			$ads_table	= $SkaLinks->m_AdsTable;
			$result		= $SkaLinks->db_Row( "SELECT `Template` FROM `$ads_table` WHERE `ID`=".$param['ads_id'] );
			$output.=$result['Template'];	
			return $output;			
		}
		$clause = ( $param['position'] ) ? " AND `Ads_position`='".$param['position']."'" : "";
		$cats_table = $SkaLinks->m_CategoriesTable;
		$ads_table = $SkaLinks->m_AdsTable;
		$ads_binding_table = $SkaLinks->m_AdsBindingTable;
		while ( !$template['Ads_id'] )
		{
			$sql = "SELECT `Parent` FROM `$cats_table` WHERE `ID`='".$param['id']."'";
			$res = $SkaLinks->db_Row( $sql );
			$sql = "SELECT `Ads_id` FROM `$ads_binding_table` WHERE `Cat_id`='".$param['id']."' AND `Page_type`='".$param['type']."'".$clause;
		        $template = $SkaLinks->db_Row( $sql );
			if ( !$param['id'] )
			{
				break;
			}
			$param['id'] = $res['Parent'];
		}
		$sql = "SELECT `Template` FROM `$ads_table` WHERE `ID`='".$template['Ads_id']."'";
		$res_template = $SkaLinks->db_Row( $sql );
		if ( $res_template['Template'] )
		{
			$output.=$res_template['Template'];	
		}
		return $output;
	}
	else
	{
		$ads_table = $SkaLinks->m_AdsTable;
		$result = $SkaLinks->db_Row( "SELECT `Template` FROM `$ads_table` WHERE `ID`='".$param['ads_id']."'" );
		$output.=$result['Template'];	
		return $output;
	}
}
class DirSmarty extends Smarty
{
	function DirSmarty()
	{
		// Call parent constructor
		$this->Smarty();

		global $_skalinks_dir;
		global $_skalinks_url;
		global $_skalinks_site;
		global $_skalinks_lang;
		global $_skalinks_page;
		global $_display;
		global $msg;
		global $ADMIN;
		global $_output;
		
		
		// Set working directories
		$this->template_dir	 = $_skalinks_dir['template_dir'];
		$this->compile_dir	 = $_skalinks_dir['compile_dir'];
		$this->config_dir	 = $_skalinks_dir['config_dir'];
		$this->cache_dir	 = $_skalinks_dir['cache_dir'];
		
		$this->assign_by_ref( '_skalinks_dir', $_skalinks_dir );
		$this->assign_by_ref( '_skalinks_page', $_skalinks_page);
		$this->assign_by_ref( '_skalinks_url', $_skalinks_url );
		$this->assign_by_ref( '_skalinks_site', $_skalinks_site );
		$this->assign_by_ref( '_skalinks_lang', $_skalinks_lang );
		$this->assign_by_ref( 'msg', $msg );
		$this->assign_by_ref( 'ADMIN', $ADMIN );
		$this->assign_by_ref( '_output', $_output );
		$this->register_function( 'display_cats', 'display_cats' );
		$this->register_function( 'showdirtree', 'showdirtree' );
		$this->register_function( 'divShow', 'divShow' );
		$this->register_function( 'show_ads', 'show_ads' );
		$this->register_function( 'convertbr', 'convertbr' );
	}
}
?>
