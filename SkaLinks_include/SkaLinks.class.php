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

	
/**
* Directory class
*
* The class is used to manage directory.  It completes such tasks
* as building the whole directory from scratch, rebuilding
* parts of directory, retrieving subcategories for a given category,
* and much much more.
*
* In all the examples below it is assumed that an instance of
* xx_Directory class (stored in $dir) exists, which can be created like this:
*
* <code>
* ...
* $dir = new xx_Directory();
* ...
* </code>
*/

class SkaLinks
{
	/** A public variable
	* Database connection
	*
	* @access private
	* @var int link
	*/
	var $m_Link;

	/**
	* Root directory in filesystem
	*
	* Stores path to directory from which to start building
	* categories tree
	*
	* @access private
	* @var string
	*/
	var $m_RootDir;

	/**
	* Root URL
	*
	* Stores root url which is used to
	* generate correct links to subcategories
	*
	* @access private
	* @var string
	*/
	var $m_RootURL;

	/**
	* Links table name
	*
	* @access private
	* @var string
	*/
	var $m_LinksTable;
	
	/** Advertising table name
	*
	* @access private
	* @var string
	*/
	var $m_AdsTable;
	
	/**
	* Categories table name
	*
	* @access private
	* @var string
	*/
	
	var $m_AdsBindingTable;
	/** Binding cats with advertising table
	*
	* @access private
	* @var string
	*/
	
	var $m_CategoriesTable;
	
	/**
	* Search results table
	*
	* @access private
	* @var string
	*/
	var $m_SearchTable;

	/**
	* Letters templates table
	* @access private
	* @var string
	*/
	var $m_LetterTemTable;	

	/**
	* Letters templates binding table
	*
	* @access private
	@ @var string
	*/
	var $m_LetterTemBindingTable;
	
	/**
	* Class constructor
	*
	* Connects to database.
	*/
	function SkaLinks( $mysql_attributes )
	{
		// Connect to database
		$host   = $mysql_attributes['host'];
		$user   = $mysql_attributes['username'];
		$pwd    = $mysql_attributes['userpwd'];
		$dbname = $mysql_attributes['dbname'];
		$this->m_Link = mysql_connect( $host, $user, $pwd ); 
		if ( !$this->m_Link )
		{
			die( mysql_error() );
		}
		$s = mysql_select_db( $dbname, $this->m_Link );
		if ( !$s )
		{
			die( mysql_error() );
		}

		// Set default table names
		$this->m_AdminsTable	 = 'admins';
		$this->m_CategoriesTable = 'categories';
		$this->m_CommentsTable   = 'comments';
		$this->m_LinksTable      = 'links';
		$this->m_ParamsTable     = 'params';
		$this->m_ParentTable     = 'parent';
		$this->m_RelatedTable    = 'related';
		$this->m_AdsTable	 = 'ads';
		$this->m_AdsBindingTable = 'ads_binding';
		$this->m_SearchTable	 = 'searches';
		$this->m_LetterTemTable  = 'letter_templates';
		$this->m_LetterTemBindingTable = 'letter_templates_binding';
		$this->m_SettingsTable	 = 'settings';
		
	}

	/**
	* Set root directory
	*
	* Sets path to root directory from which the whole directory is built.
	* Leading and trailing slashes are appended if necessary.
	*
	* <b>Example</b>:
	* <code>
	* ...
	* $dir->setRootDir('/var/www/mysite/dir');
	* ...
	* </code>
	*
	* In the code above root directory is set to <b>/var/www/mysite/dir/</b>
	* and any time a new category is added or the whole directory is
	* rebuilt this path is appended to each category.
	*
	* @param $rootDir is a string - the path to root directory
	*/
	function SetRootDir( $rootDir )
	{
		// Append trailing slash if necessary
		if ( substr( $rootDir, -1 ) != '/' )
		{
			$rootDir .= '/';
		}
		// Append leading slash if necessary
		if ( substr( $rootDir, 0, 1 ) != '/' )
		{
			$rootDir = '/'.$rootDir;
		} 
		$this->m_RootDir = $rootDir;
	}

	/**
	* Set root URL
	*
	* Sets root url for relative links.  Imagine you have a domain
	* called <b>www.mydomain.com</b> and you want the whole directory to
	* be located in <b>/dir</b> subdirectory (<b>www.mydomain.com/dir</b>).
	* In that subdirectory there
	* are two categories, <b>cat1</b> and <b>cat2</b>.  It would be good to have
	* relative links to those categories, i.e. <b>/dir/cat1</b> and <b>/dir/cat2</b>.
	* To achieve that the root url should <tr>
	* <b>www.mydomain.com/dir</b> since we want relative links, not
	* absolute).
	*
	* @param string $rootUrl root url
	*/
	function SetRootUrl( $rootUrl )
	{
		// Append trailing slash<tr>
		if ( substr( $rootUrl, -1 ) != '/' )
		{
			$rootUrl .= '/';
		}
		// Append leading slash
		if ( substr( $rootUrl, 0, 1 ) != '/' )
		{
			$rootUrl = $rootUrl;
		}
		$this->m_RootURL = $rootUrl;
	}

	/**
	* Set table prefix
	*
	* Sets table prefix.  The prefix is appended to
	* all table names, like links, categories, etc.
	*
	* For example, default name for links table is (guess it) `links`.
	* If this method is called with 'dir_` prefix, the table name
	* will be `dir_links`.
	*
	* @param string $prefix table prefix
	*/
	function SetPrefix( $prefix )
	{
		$this->m_AdminsTable		 = $prefix.'admins';
		$this->m_CategoriesTable	 = $prefix.'categories';
		$this->m_CommentsTable		 = $prefix.'comments';
	        $this->m_LinksTable		 = $prefix.'links';
		$this->m_ParamsTable		 = $prefix.'params';
		$this->m_RelatedTable		 = $prefix.'related';
		$this->m_ParentTable		 = $prefix.'parent';
		$this->m_AdsTable		 = $prefix.'ads';
		$this->m_AdsBindingTable	 = $prefix.'ads_binding';
		$this->m_SearchTable		 = $prefix.'searches';
		$this->m_LetterTemTable		 = $prefix.'letter_templates';
		$this->m_LetterTemBindingTable	 = $prefix.'letter_templates_binding';
		$this->m_SettingsTable		 = $prefix.'settings';
	}

	/**
	* Build Category
	*
	*
	* Rebuilds the whole directory from scratch recursively, if $id is zero.
	* In other rebuild category with $id for every category a separate directory in file system is
	* created and index file (index.php) and listing file ( listing.php ) is written
	* to this directory.
	*
	* (NOTE. The term 'directory' is used in two different meanings here.
	* The first one, used in function name, is a hierarchical structure
	* of categories and links within those categories, the other one,
	* most familiar to the user, is directory in filesystem)
	*
	* @param	int	$id	the ID of category for build
	* @return	int	1
	*/
	function BuildCategory( $id, $flag_all = 0 )
	{
		global $_skalinks_dir;
		$id = ( int )$id;
		$table_name = $this->m_CategoriesTable;
		if ( $id )
		{	       
			$sql = "SELECT * FROM `$table_name` WHERE `ID`=".$id;
			$res = & $this->db_Row( $sql );
			$cur_cat_status = $res['Status'];
			$dir = $res['dir'];
			$parent = $res['Parent'];
			if ( !$parent )
			{
				$dir = $this->m_RootDir.$dir."/";
			}
			while( $parent )
			{
				$sql = "SELECT `Parent`,`dir` FROM `$table_name` WHERE `ID`=$parent";
				$res = $this->db_Row( $sql );
				$dir = $res['dir']."/".$dir;
				$parent = $res['Parent'];
				$prev = ( !$parent ) ? $this->m_RootDir: "" ; 
				$dir = $prev.$dir."/";
			}
			if ( !$flag_all )
			{
				$this->db_Query( "UPDATE `$table_name` SET `Status`='0' WHERE `ID`=$id" );
			}
			if ( $flag_all && $cur_cat_status )
			{
				return 1;
			}
			if ( !file_exists( $dir ))
			{
				$ret = mkdir( $dir, 0777 );
			}
			     
			$path = $dir;
	     
			$f = fopen( "{$path}index.php", 'w' );
			$content = '<?php $id = '.$id."; require_once( '{$_skalinks_dir['dir']}index.php' ); ?>";
			fwrite( $f, $content );
			fclose( $f );
			$res = $this->db_Fetch( "SELECT `ID` FROM `$table_name` WHERE `Parent`=$id" );
			foreach ( $res as $key => $value )
			{
				if ( $flag_all )
			   	{
					$this->BuildCategory( $res[$key]['ID'], $flag_all );
				}
				else
				{
					$this->BuildCategory( $res[$key]['ID'] );
				}
			}
		}
		else
		{
			$res = $this->db_Fetch( "SELECT `ID` FROM `$table_name` WHERE `Parent`=$id" );
			foreach ( $res as $key => $value )
			{
				if ( $flag_all )
				{
					$this->BuildCategory( $res[$key]['ID'], $flag_all );
				}
				else
				{
					$this->BuildCategory( $res[$key]['ID'] );
				}
			}
		}
		return 1;
	}
     
	/**
	* Execute SELECT query and return result as associative array
	*
	* @param  string    $sql query
	* @return array
	*/
	function db_Fetch( $sql )
	{
		$res = mysql_query( $sql, $this->m_Link );
		if ( !$res )
		{
			die( mysql_error() );
		}
		
		// Convert to array
		$ret = array ();
		while ( $row = mysql_fetch_assoc( $res ) )
		{
			// Add to array
			$index = count( $ret );
			$ret[$index] = $row;
		}

		return $ret;
	}
	 /**
	 * Execute Mqsql - query and return result as array
	 *
	 * @param    string   $sql query
	 * @return   array
	 */
	function db_Query( $sql )
	{
		$res = mysql_query( $sql, $this->m_Link );
		if ( !$res )
		{
			die( mysql_error() );
		}
		return $res;
	}

	/**
	* Single row from sql
	*
	* @param  string   $sql
	* @return array
	*/
	function db_Row( $sql )
	{
		$res = mysql_query( $sql, $this->m_Link );
		if ( !$res )
		{
			die( mysql_error() );
		}
		$row = mysql_fetch_assoc( $res );

		return $row;
	}

	/**
	* Return single value from sql, it is the first field of the first record
	*
	* @param  string   $sql query
	* @return mixed
	*/
	function db_Value( $sql )//value()
	{
		$res = mysql_query( $sql, $this->m_Link );
		if ( !$res )
		{
			die( mysql_error() );
		}
		$row = mysql_fetch_row( $res );
		
		$ret = ( $row ) ? $row[0] : '';

		return $ret;
	}
	
	/**
	* Gets params from parameter's table 
	* and return array of params for Directory , if $param = 0
	* or return value of one parametr if $param is the name of 
	* fixed parametr
	*
	* @param  int	$param is the name of param
	* @return array	is the array of params
	*/
	function GetParam( $param, $section=''  )
	{
		$table_name = $this->m_ParamsTable;
	        $cause	    = ( $param ) ? "WHERE Name = '{$param}'" : "WHERE `section_name`='$section'";
		$ret	    = ( $param ) ? $this->db_Value( "SELECT `VALUE` FROM `$table_name`".$cause ) : $this->db_Fetch( "SELECT * FROM `$table_name` ".$cause."ORDER BY `order_display`" );
		return $ret;
	}

   /**
   * Sets parameters in table of parameters
   * makes sql query and return info about result of query
   *
	* @param  string   $p_name is the name of parmeter for update
	* @param  string   $value is the new value for parameter
	* @return array
	*/
              
      

	function SetParam( $p_name, $value )
	{
		$table_name = $this->m_ParamsTable;
		$p_name     = mysql_escape_string( $p_name );
		$value	    = mysql_escape_string( $value );
		$sql	    = "UPDATE `$table_name` SET `VALUE` = '{$value}' WHERE `Name` = '{$p_name}' LIMIT 1";
		$res	    =& $this->db_Query( $sql );

		return $res;
	}
	
	/**
	* Return array of subcategories
	* Makes sql query in table of links, categories and virtual categories
	* and return array of physical and virtual categories and count of subcategories links in parent category
	* Use $status = -1, if you want to get subcategories with any status
	*
	*  
	* @param     int   $parent parent category id, 0 means root category
	* @param		 int	 $status	the status of subcategories
	* @return    array	$res	the array with subcategories
	*/
	function &GetCategories( $parent, $status, $real_flag = 0 )
	{
	   
	        $parent = ( int )$parent;
	        $status	= ( int )$status;
	        if ( $status == -1 )
		{
			$clause = "";
		      	
			$adm_link_clause = " OR `t2`.`Status`='1'";
	   	}	
		else
		{
			$adm_link_clause = "";
			
		      	$clause = "AND `t1`.`Status`='".$status."'";
		}
		if ( !$real_flag )
		{
			$sql  = "SELECT `t1`.`ID`,`t1`.`Editor_id`, `t1`.`Status`, `t1`.`Parent`, `t3`.`Parent_id`, `t1`.`Title` `title`, `t1`.`dir`, `t3`.`Parent_id`=".$parent." `log`, COUNT(`t2`.`ID`) `links`,  COUNT(`t3`.`Parent_id`) AS `logical` ";
			$sql .= "FROM `".$this->m_CategoriesTable."` `t1`";
			$sql .= "LEFT JOIN `".$this->m_LinksTable."` `t2` ON `t1`.`ID` = `t2`.`Category` AND (`t2`.`Status`='0' ".$adm_link_clause.")";
			$sql .= "LEFT JOIN `".$this->m_ParentTable."` `t3` ON `t3`.`Parent_id`='$parent' AND `t3`.`Child_id`=`t1`.`ID`";
			$sql .= "WHERE ( `t1`.`Parent`=$parent OR `t3`.`Parent_id`=$parent ) ".$clause;
			$sql .= "GROUP BY `t1`.`ID`";
			$sql .= "ORDER BY `t1`.`Title`";
		        $parent_new = $parent; 
		}
		else
		{
			$sql  = "SELECT `t1`.`ID`,`t1`.`Editor_id`, `t1`.`Status`, `t1`.`Parent`, `t1`.`Title` `title`, `t1`.`dir`, COUNT(`t2`.`ID`) `links`";
			$sql .= "FROM `".$this->m_CategoriesTable."` `t1`";
			$sql .= "LEFT JOIN `".$this->m_LinksTable."` `t2` ON `t1`.`ID` = `t2`.`Category` AND (`t2`.`Status`='0' ".$adm_link_clause.")";
			$sql .= "WHERE `t1`.`Parent`=$parent ".$clause;
			$sql .= "GROUP BY `t1`.`ID`";
			$sql .= "ORDER BY `t1`.`Title`";
		}
		$res = & $this->db_Fetch( $sql );
		foreach( $res as $key_vir => $value_vir )
		{  // Add URL to every category	
			if ( $res[$key_vir]['Parent'] )
			{  
				// Get parent category url
				$url = $this->GetCategoryURL( $res[$key_vir]['Parent'] );
				$dir = $res[$key_vir]['dir']; 
				$res[$key_vir]['url'] = "{$url}{$dir}/";
			}
			else
			{
				$url = $this->GetCategoryURL( $res[$key_vir]['ID'] );
				$res[$key_vir]['url'] = $url;
			}
			
			if ( $res[$key_vir]['Parent']!=$parent )
			{
				$parent = $res[$key_vir]['Parent_id'];
			}
			else 
			{
				$parent = $parent_new; 
			}
		}
		return $res;
	}

	 /**
	 * Return array of Related Categories
	 * Function return array of related categories in category with ID - $parent
	 * return's array contains ID, Title and Url of related category 
	 * 
	 * @param    int	$parent is the ID of parent category
	 * @param	 int	$status	the status of subcategories
	 * @return   array	$res	the array with related categories
	 */
	 function GetRelatedCategories( $cat, $status )
	 {
	    $cat     =	( int )$cat;
	    $status  =	( int )$status;
	    if ( $status == -1 )
	    {
	       $clause = "";
	       }
	       else
	       {
		  $clause = "AND `t1`.`Status`='$status'";
		  }
	       
	  
	    $sql = "SELECT `t1`.`ID`, `t1`.`Title` FROM `".$this->m_CategoriesTable."` `t1` LEFT JOIN `".$this->m_RelatedTable."` `t2` ON `t1`.`ID`=`t2`.`related_cat` WHERE `t2`.`main_cat`=$cat ".$clause;
	    $res =& $this->db_Fetch( $sql ); 
	    foreach( $res as $key => $value )
	    {
	       $res[$key]['url']   = $this->GetCategoryURL( $res[$key]['ID'] ); 
	       $res[$key]['Title'] = $this->GetFullCategoryTitle( $res[$key]['ID'] );
	       }
	       return $res;
	    }
	/**
	* Return category URL 
	*
	* Return URL of category with ID = $cat
	*
	* @param  int	   $cat category id
	* @return string   $dir is the category URL
	*/
	function GetCategoryURL( $cat )
	{
	        $cat	    = ( int )$cat;
		$table_name = $this->m_CategoriesTable;
		$sql	    = "SELECT `Parent`,`dir` FROM `$table_name` WHERE `ID`=$cat";
		$row	    =& $this->db_Row( $sql );
		$dir	    = $row['dir'].'/';

		$parent = $row['Parent'];
		if ( $parent )
		{
			$dir = $this->GetCategoryURL( $parent ).$dir;
		}
		else
		{
			$dir = $this->m_RootURL.$dir;
		}
		return $dir;
	}
	
	/**
	* Return full title chain of category
	* with ID = $cat
   * 	
	* 
	* @param  int	   $cat category id
	* @return string   $dir is the title chain of category
   */	
	function GetFullCategoryTitle( $cat )
	{
	        $cat	    = ( int )$cat;
		$table_name = $this->m_CategoriesTable;
		$sql	    = "SELECT `Parent`,`Title` FROM `$table_name` WHERE `ID`=$cat";
		$row	    =& $this->db_Row($sql);
		$dir	    = $row['Title'].'/';
		$parent	    = $row['Parent'];
		if ( $parent )
		{
			$dir = $this->GetFullCategoryTitle( $parent ).$dir;
		}
		else
		{
			$dir = "/".$dir;
		}
		return $dir;
	}


	/**
	* Return an array of navigation URLs categories title
	* Navigation URLs uses to navigate between categories
	*
	* @param   int	    $cat category id
	* @return  array    $arr	
	*/
	function GetCatNavigationLine( $cat )
	{
	        $cat = ( int )$cat;
		$arr = array ();
	
		if ( $cat )
		{
			$cond	    = TRUE;
			$table_name = $this->m_CategoriesTable;
			while ( $cond )
			{
				$sql    = "SELECT `Parent`, `Title`, `dir` FROM `$table_name` WHERE `ID`=$cat";
				$row    = $this->db_Row( $sql );
				$index  = count( $arr );
				$url    = $this->GetCategoryURL( $cat );
				$arr[$index] = array ( 'title' => $row['Title'], 'url' => $url );
				if ( !$row['Parent'] )
				{
					$cond = FALSE;
				}
				else
				{
					$cat = $row['Parent'];
				}
			}
			$arr = array_reverse( $arr );
		}

		return $arr;
	}
       /**
	* Returns string of page title
	* Use $cat=-1, if you want to get title of pages, not displayed any categories
   * and use $name="" if you want to get title of pages, displayed any categories	
   * 
   * @param  int	   $cat	 category id
   * @param  char	   $title  the brand name of site
   * @param  char	   $name the string, which must be if $cat==-1
   * @return string   $res_title  which contain full title
   */	
	function GetTitleChain( $cat, $title, $name )
	{
		if (( $cat == -1 )&&( $name ))
		{
			$res_title = $name." - ".$title;
		}
		else
		{
			$arr=$this->GetCatNavigationLine( $cat );
			$res_title = $title;
			foreach( $arr as $key => $value )
			{
				$res_title = $arr[ $key ]['title']." - ".$res_title;
			}
		  
		}
		return $res_title;        
	}
	/**
	* Return array of category's links
	*
	* Function makes query to database and return array of links of category with ID = $cat
	* and status of links ( $status ), if you want to get links with any status use $status = -1
	* Use $flag = 1 if you want to get links with Rank and without it or
	* use $flag = 2 if you want to get only links in category with Rank = 0
	* and use $flag = 3 if you want to get links with Rank differ from zero
	* 
	* @param	 int	$status	the status of links in category
	* @param	 int	$flag	the type of categories would you want to get
	* @param  int	$cat category id
	* @param  int	$index zero-based index
	* @param  int	$num number of links to return
	* @return array $res array of category's links
	*/
	function GetLinks( $param )
	{
	        $cat	    = ( int )$param['cat'];
		$status	    = ( int )$param['status'];
		$index 	    = $param['index'];
		$num        = $param['num'];
		$flag       = $param['flag'];
		$search     = mysql_real_escape_string( $param['search'] );
		$search_type = $param['search_type'];
		$table_name	= $this->m_LinksTable;
		$admin_table	= $this->m_AdminsTable;
		$cat_table	= $this->m_CategoriesTable;
		$comment_tbl	= $this->m_CommentsTable;
		if ( $search_type && !$cat )
		{
			$count = count( $search_type );			
			foreach( $search_type as $key => $value )
			{
				if ( $value == 'URL' || $value == 'Title' || $value == 'Description' )
				{
					$list_search.= ( $key != ( $count - 1 ) ) ? "`t1`.`".$value."` LIKE '%$search%' OR ": "`t1`.`".$value."` LIKE '%$search%'"; 
				}
			}
		}
		$search_cond = ( $cat ) ? "`t1`.`Category`=$cat " : $list_search;
		if ( $status == -1 )
		{
		      $clause = ""; 
		   }
		   else
		   {
		      $clause = "AND `t1`.`Status`='".$status."'";
		      }
	        switch( $flag )
		{
		   case 1:
		      $sql = "SELECT `t6`.`Name` as `Creator_Name`, `t6`.`Email` as `Creator_Email`, `t1`.`AddedBy`, `t2`.`Name`, `t2`.`Email` as 'Editor_Email', `t1`.`ID`, `t1`.`Status`, `t1`.`LinkBackURL`, `t1`.`LinkBackURLValid`, `t1`.`Category`, `t1`.`Rank`,`t1`.`Pagerank`, `t1`.`Title` `title`,`t1`.`Description` `description`,`t1`.`URL` `url`, `t1`.`UrlHeader`, `t4`.`ID` as `Editor_ID`, `t4`.`Name` as `Editor_Name`, `t5`.`Comment` FROM `$table_name` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Admin_id`=`t2`.`ID` LEFT JOIN `$comment_tbl` `t5` ON `t1`.`ID`=`t5`.`ID` LEFT JOIN `$cat_table` `t3` ON `t1`.`Category`=`t3`.`ID` LEFT JOIN `$admin_table` `t4` ON `t3`.`Editor_id`=`t4`.`ID` LEFT JOIN `$admin_table` `t6` ON `t1`.`AddedBy` = `t6`.`ID` WHERE ".$search_cond.$clause." ORDER BY `t1`.`ID` DESC LIMIT $index, $num";
		      break;
		   case 2:
		      $sql = "SELECT `t6`.`Name` as `Creator_Name`, `t6`.`Email` as `Creator_Email`, `t1`.`AddedBy`, `t2`.`Name`, `t2`.`Email` as 'Editor_Email', `t1`.`ID`, `t1`.`Status`, `t1`.`LinkBackURL`, `t1`.`LinkBackURLValid`, `t1`.`Category`, `t1`.`Rank`,`t1`.`Pagerank`, `t1`.`Title` `title`,`t1`.`Description` `description`,`t1`.`URL` `url`, `t1`.`UrlHeader`, `t4`.`ID` as `Editor_ID`, `t4`.`Name` as `Editor_Name`, `t5`.`Comment` FROM `$table_name` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Admin_id`=`t2`.`ID`  LEFT JOIN `$comment_tbl` `t5` ON `t1`.`ID`=`t5`.`ID` LEFT JOIN `$cat_table` `t3` ON `t1`.`Category`=`t3`.`ID` LEFT JOIN `$admin_table` `t4` ON `t3`.`Editor_id`=`t4`.`ID` LEFT JOIN `$admin_table` `t6` ON `t1`.`AddedBy` = `t6`.`ID` WHERE ( ".$search_cond." ) AND `t1`.`Rank`=0 ".$clause." ORDER BY `t1`.`ID` DESC  LIMIT $index, $num ";
		      break;
		   case 3:
		      $sql = "SELECT `t6`.`Name` as `Creator_Name`, `t6`.`Email` as `Creator_Email`, `t1`.`AddedBy`, `t2`.`Name`, `t2`.`Email` as 'Editor_Email', `t1`.`ID`, `t1`.`Status`, `t1`.`LinkBackURL`, `t1`.`LinkBackURLValid`, `t1`.`Category`, `t1`.`Rank`,`t1`.`Pagerank`, `t1`.`Title` `title`,`t1`.`Description` `description`,`t1`.`URL` `url`, `t1`.`UrlHeader`, `t4`.`ID` as `Editor_ID`, `t4`.`Name` as `Editor_Name`, `t5`.`Comment` FROM `$table_name` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Admin_id`=`t2`.`ID`  LEFT JOIN `$comment_tbl` `t5` ON `t1`.`ID`=`t5`.`ID`  LEFT JOIN `$cat_table` `t3` ON `t1`.`Category`=`t3`.`ID` LEFT JOIN `$admin_table` `t4` ON `t3`.`Editor_id`=`t4`.`ID`  LEFT JOIN `$admin_table` `t6` ON `t1`.`AddedBy` = `t6`.`ID` WHERE ( ".$search_cond." ) AND `t1`.`Rank`!=0 ".$clause." ORDER BY `t1`.`Rank` DESC, `t1`.`ID` ASC  LIMIT $index, $num";
		      break;
		   }
		$res =& $this->db_Fetch( $sql );
		$start = $index + 1;
		foreach ( $res as $key => $value )
		{
			$res[$key]['num']     = $start;
			$res[$key]['cat_url'] = $this->GetCategoryURL( $res[$key]['Category'] );
			$res[$key]['cat_info'] = $this->GetCatInfo( $res[$key]['Category'] );
			$start++ ;
		}
		return $res;
	}

	/**
	* Return count of links for given category
	* Status can be 1, 0 or -1 ( to get links with any status )
	* Use $rank = 0, to get links without ranging or any number
	* between 1 and 10 to get links higher or equal rank
	* 
	* 
	* @param  int	$cat category id
	* @param	 int	$status	the status of links
	* @param	 int	$rank	the rank of links
	* @return int	$this->value( $sql) number of active links
	*/
	function GetLinksCount( $param )
	{
		
	   	$status		= ( int )$param['status'];
		$rank		= ( int )$param['rank'];
		$url		= mysql_real_escape_string( $param['url'] );
		$cat		= ( int )$param['cat'];
		$search_cond	= ( $cat ) ? "`Category`=$cat " : "URL LIKE '%$url%' ";
		
		$table_name = $this->m_LinksTable;
		if ( $status == -1 )
		{
		   $clause = "";
		   }
		   else
		   {
		      $clause = "AND `Status`='".$status."'";
		      }
	        if ( $rank > 0 )
		{
		   $rank_clause = " AND `Rank`>=".$rank; 
		   }
		   elseif ( !$rank )
		   {
		      $rank_clause = " AND `Rank`=0";
	      		}
		      else
		      {
			      $rank_clause = "";
			      }
		      
		$sql	    = "SELECT COUNT(*) FROM `$table_name` WHERE ".$search_cond.$clause.$rank_clause;
		return $this->db_Value( $sql );
	}

	/**
	* Check if category has custom template
	*
	* @param  int	$cat category id
	* @return bool	$value True, in success, or FALSE in other
	*/
	function HasCustomTemplate( $cat )
	{
		$cat	    = (int)$cat;
		$table_name = $this->m_CategoriesTable;
		$sql = "SELECT `custom_template` FROM `$table_name` WHERE `ID`=$cat";		
		$value = $this->db_Value( $sql );
		return (bool)$value;
	}
	
	/**
	* Add new admin account in table
	*
	* @param  string   $admin is the admin's name
	* @param  string   $passord is the admin's password
	* @return string   $msg message
	*/
	function AddAdmin( $admin, $password, $email, $type )
	{
		$admin		= mysql_real_escape_string( $admin );
		$email		= mysql_real_escape_string( $email );
		$type		= ( int )$type;
		$table_name = $this->m_AdminsTable;
		$ifexists   = $this->db_Value( "SELECT `Name` FROM `$table_name` WHERE Name = '{$admin}'" );
		if ( $ifexists )
		{
		     return 1;
		}
		else
		{
			$res = $this->db_Query( "INSERT INTO`$table_name`(`Name`, `Password`, `Email`, `Type` )VALUES( '$admin', '$password', '$email', '$type')" );
			return 0;
     		     }
	
	}	
	
	/**
	* Adds new category
	*
	* Adds information in categories table
	* if the category already exists, return appropriate message
	* if there are no category , return message about successful addition of category
	* 0 - record exists
	*
	* @param  string   $title is a title name of category
	* @param  string   $dir is a prysical name of category in file-system
	* @param  int	   $cat is a ID of parent category 
	* @param  int	   $status is a status of category, usuall in first addition the status is 0 
	* @return string   $msg of message
	*/
	function AddCategory( $title, $dir, $topdesc, $bottomdesc, $metadesc, $cat, $editor, $status )
	{	
		$cat	    = (int)$cat;
		$editor     = (int)$editor;
		$title	    = mysql_real_escape_string( $title );
		$dir	    = mysql_real_escape_string( $dir );
		$topdesc	= mysql_real_escape_string( $topdesc );
		$bottomdesc	= mysql_real_escape_string( $bottomdesc );
		$metadesc	= mysql_real_escape_string( $metadesc );
		$table_name = $this->m_CategoriesTable;
		$ifexists   = $this->db_Value( "SELECT ID FROM `$table_name` WHERE ( Parent = '$cat' AND Title = '$title' ) OR ( Parent = '$cat' AND dir = '$dir' )" );
		if ( $ifexists )
		{
		   return 0;
		}
	       	 
		// if editor not selected, insert parent category editor, else none editor
		if ( !$editor )
		{
			$editor = $this->GetCatEditor( $cat );
			
		}
		$res = $this->db_Query( "INSERT INTO `$table_name`(`Title`,`dir`,`TopText`,`BottomText`,`meta_desc`,`Parent`,`Editor_id`,`Status`) VALUES( '$title','$dir','$topdesc','$bottomdesc','$metadesc','$cat','$editor','$status')" );
		return 1;
		
		
	     }
	/**
	* Adds new virtual category
	* 
	* Adds new virtual category in table of virtual categories
	* Function checks for presence category with appropriate Child_id and Parent_id
        * and if where are no recordings in table, than adds new recording
	* 
	* @param  int	   $child_id is the id of filial category
	* @param  int	   $parent_id is the id of parent category
	* @return string   $msg of message
	*/
	 	
	 function AddVirtualCategory( $child_id, $parent_id )
        {
	 $child_id   = (int)$child_id;
	 $parent_id  = (int)$parent_id;
	 if ( $child_id == $parent_id )
	 {
	    return 0;
	    }
	 $table_name = $this->m_ParentTable;
	 $ifexists   = $this->db_Value("SELECT Child_id FROM `$table_name` WHERE Child_id='{$child_id}' AND Parent_id='{$parent_id}'");
	 if( $ifexists )
	 {
	    return 0;
	 }
	 else
	 {
	    $res = $this->db_Query("INSERT INTO `$table_name`(`Child_id`,`Parent_id`) VALUES('$child_id','$parent_id')");
	    return 1;
	 }
	
        } 
	/**
	* Adds new related category
	* Function checks for presence category with appropriate main_cat and related_cat
        * and if where are no recordings in table, than adds new recording
	* 
	* @param  int	   $main_cat is the id of main category
	* @param  int	   $parent_id is the id of related category
	* @return string   $msg of message
	*/
       
	function AddRelatedCategory( $main_cat, $related_cat )
	 {
	    $main_cat	 = (int)$main_cat;
	    $related_cat = (int)$related_cat;
	    if ( $mail_cat != $related_cat )
	    {
	       $table_name	 = $this->m_RelatedTable;
	       $ifexists	 = $this->db_Value("SELECT main_cat FROM `$table_name` WHERE main_cat='{$main_cat}' AND related_cat='{$related_cat}'");
	       if( $ifexists)
	       {
	       return 0;
	       }
	       else
	       {
		  $res = $this->db_Query("INSERT INTO `$table_name`(`main_cat`,`related_cat`) VALUES('$main_cat','$related_cat')");
		  return 1;
		  }
	       }
	 }

	 /**
	 * Function updates values of fields ID, Parent, Title, dir and Status in category's table
	 * 
	 * @param int	$id is the id of update category
	 * @param int	$parent is the parent id of update category
	 * @param string   $title is the Title name of category
	 * @param string   $dir is the name of category in file system
	 * @param int	$status the new status of update category, status can be 0, 1 or 2
	 * @return   array $this->query( $sql ) is the result of sql query
	 */
	function EditCategory( $id, $parent, $title, $dir, $topdesc, $bottomdesc, $metadesc, $editor_id, $status )
	{
		$id	    = ( int )$id;
		$parent	    = ( int )$parent;
		$editor_id  = ( int )$editor_id;
		$status	    = ( int )$status;
		$title	    = mysql_real_escape_string( $title );
		$dir	    = mysql_real_escape_string( $dir );
		$topdesc	= mysql_real_escape_string( $topdesc );
		$bottomdesc	= mysql_real_escape_string( $bottomdesc );
		$metadesc	= mysql_real_escape_string( $metadesc );
		$table_name = $this->m_CategoriesTable;
		global $ADMIN;

		// Check onwer of new parent category
		if ( $ADMIN['Type'] != 2 )
		{
			$query = "SELECT `Editor_id` FROM `$table_name` WHERE `ID`='$parent'";
			$parent_cat_info = $this->db_Row( $query );
			if ( $ADMIN['ID'] != $parent_cat_info['Editor_id'] )
			{
				return 0;
			}
		}
		
		$cat_old_info = $this->db_Row( "SELECT `Editor_id` FROM `$table_name` WHERE `ID`='$id'"); 
		
		$sql = "UPDATE `$table_name` SET Title = '$title', Parent = $parent, dir = '$dir', `TopText`='$topdesc', `BottomText`='$bottomdesc', `meta_desc`='$metadesc', `Editor_id`='$editor_id', `Status`='$status' WHERE ID = '$id'";
		$this->db_Query( $sql );

		if ( $editor_id != $cat_old_info['Editor_id'])
		{
				$query = "SELECT `ID`,`Parent`,`Title`,`dir`,`Editor_id`,`Status`,`TopText`,`BottomText`,`meta_desc` FROM `$table_name` WHERE `Parent`='$id'";
				$child_cat = $this->db_Fetch( $query );
				foreach( $child_cat as $key => $value )
				{
					if ( ( $child_cat[$key]['ID'] && !$child_cat[$key]['Editor_id'] ) || ( $child_cat[$key]['ID'] && ( $child_cat[$key]['Editor_id'] == $cat_old_info['Editor_id']) ) )
					{
						$this->EditCategory( $child_cat[$key]['ID'], $child_cat[$key]['Parent'], $child_cat[$key]['Title'], $child_cat[$key]['dir'], $child_cat[$key]['TopText'], $child_cat[$key]['BottomText'], $child_cat[$key]['metadesc'], $editor_id, $child_cat[$key]['Status'] );
					}
				}
			
		}
		return 1;
	}
	/**
	* Adds new link in table with links
	*
	* @param  string	$url is the URL of link
	* @param  string   $linkback is the back link URL
	* @param  string   $title is the title name of link
	* @param  string   $desc the discription of link
	* @param  string   $email the e-mail of man, which added new link
	* @param  int	$cat is the id of category, where link was added
	* @param  int	$status the status of link, can be 0 or 1
	* @return string $msg message
	*/

	function AddLink( $url, $linkback, $title, $desc, $extend_desc, $email, $cat, $ADMIN, $template_id, $alt_domain )
	{
		global $ADMIN;
		
		$cat			= ( int )$cat;
		$template_id		= ( int )$template_id;
		$title			= mysql_real_escape_string( $title );
		$desc			= mysql_real_escape_string( $desc );
		$email			= mysql_real_escape_string( $email );
		$url			= mysql_real_escape_string( $url );
		$alt_domain		= mysql_real_escape_string( $alt_domain );
		$extend_desc		= mysql_real_escape_string( $extend_desc );
		$table_name		= $this->m_LinksTable;
		$admin_table		= $this->m_AdminsTable;		
		$sim_links		= $this->GetLinksSearch( $url, 0, 100 );
		$pagerank_set		= $this->GetParam( 'pagerank_set' );
		$cat_info		= $this->GetCatInfo( $cat );
		$status			= ( ( $ADMIN['Type'] == 2 ) || ( $ADMIN['ID'] == $cat_info['Editor_id'] ) ) ? 0 : 1;
		
		if ( $pagerank_set )
		{
			$pagerank = getPR( $url );			
		}
		if ( $sim_links )
		{
			return 1;
		}
		else
		{
			$admin_id = $this->db_Row( "SELECT `ID` from `$admin_table` WHERE `Name`='$ADMIN' " ); 
			$res = $this->db_Query( "INSERT INTO`$table_name`(`URL`,`LinkBackURL`,`Title`,`Description`,`Full_Description`,`Email`,`Category`,`Status`,`Date`,`AddedBy`, `Admin_id`, `Template_id`,`Alt_domain`,`Pagerank`)VALUES('$url','$linkback','$title','$desc','$extend_desc','$email','$cat','$status','".time()."' ,'".$ADMIN['ID']."' , '".$ADMIN['ID']."','$template_id','$alt_domain','$pagerank')" );
			$link_info = $this->GetLinksSearch( $url, 0, 100 ); 
			$this->VerifyLinkBroken( $link_info[0]['ID'] );
			return 0;
		
		}
	}	
	/**
	* Update information about link in link's table
	* Update values in all fields of links table
	* 
	* @param  array	$link_arr is the associative array with fields as in link's table
        * @return array	$this->query( $sql )
        */	
	function EditLink( $link_arr )
	{
		global $ADMIN;

		$table_name	= $this->m_LinksTable;
		$cat_table	= $this->m_CategoriesTable;
		$pagerank_set	= $this->GetParam( 'pagerank_set' );
		if ( $ADMIN['Type'] != 2 )
		{
			// Check if editor is owner of new category
			$new_cat_info	= $this->GetCatInfo( $link_arr['cat_id'] );
			if ( $ADMIN['ID'] == $new_cat_info['Editor_id'] )
			{
				$link_status = 0;
			}
			else
			{
				$new_link_info	= $this->GetLinkInfo( $link_arr['id'] );
				$old_editor	= $this->db_Row( "SELECT `t1`.`Title`, `t2`.`Editor_id` FROM `$table_name` `t1` LEFT JOIN `$cat_table` `t2` ON `t1`.`Category`=`t2`.`ID` WHERE `t1`.`ID`='{$link_arr['id']}'" );
				if ( $ADMIN['ID'] == $old_editor['Editor_id'] )
				{
					$link_status = 1;
					$redirect = $link_arr['cat_id'];
				}
				elseif ( $ADMIN['ID'] == $new_link_info['AddedBy'] )
				{
					$link_status = 1;
				}
				else
				{
					return -1;
				}	
			}
		}
		else
		{
			$link_status = 0;
		}
		$link_arr['cat_id']		= ( int )$link_arr['cat_id'];
		$link_arr['id']			= ( int )$link_arr['id'];
		$link_arr['rank']		= ( int )$link_arr['rank'];
		$link_arr['description']	= mysql_real_escape_string( $link_arr['description'] );
		$link_arr['link']		= mysql_real_escape_string( $link_arr['link'] );
		$link_arr['title']		= mysql_real_escape_string( $link_arr['title'] );
		$link_arr['extended_desc']	= mysql_real_escape_string( $link_arr['extended_desc'] );
		$admin_name	 = $link_arr['admin_name'];
		
		$admin_table			    = $this->m_AdminsTable;
	        $lburl				    = ( $link_arr['LinkBackURLValid'] == 'y' ) ? 'y' : '';
		$emailvalid			    = $link_arr['EmailValid'] ? 'y' : '';
		
		if ( $pagerank_set )
		{
			$pagerank		= getPR( $link_arr['link'] );
			$pagerank_clause	= ",`Pagerank`='$pagerank' ";
		}
		else
		{
			$pagerank_clause	= "";
		}
		$admin_id = $this->db_Row( "SELECT `ID` from `$admin_table` WHERE `Name`='$admin_name' " );
		$sql  = "UPDATE `$table_name` SET Category = '{$link_arr['cat_id']}', URL = '{$link_arr['link']}', Title = '{$link_arr['title']}', ";
		$sql .= "Description = '{$link_arr['description']}', `Full_Description`='{$link_arr['extended_desc']}',Rank = '{$link_arr['rank']}', Page = '{$link_arr['page']}', LinkBackURL = '{$link_arr['linkback']}', ";
		$sql .= "LinkBackURLValid = '{$lburl}', Email = '{$link_arr['email']}', EmailValid = '{$emailvalid}', Admin_id='".$admin_id['ID']."', `Alt_domain`='{$link_arr['alt_domain']}', `Status` = '$link_status'".$pagerank_clause."WHERE ID = '{$link_arr['id']}'";
		$this->db_Query( $sql );
		return ( $redirect ) ? $redirect : 0;
	}
	
	/**
	* Get info about category
	* Get value of all fields in category's table with ID = $id
	*
	* @param  int	$id is the category's id
	* @return array 
	*/
	function GetCatInfo( $id )
	{
	   	$id		    = (int)$id;
		$table_name	 = $this->m_CategoriesTable;
		$sql		    = "SELECT * FROM `$table_name` WHERE `ID`='{$id}'";
		return $this->db_Row($sql);
	}
	
	/**
	* Get info about link
	* Get values of all fields in link's table with ID = $id
	* 
	* @param  int	$id is the id of link
	* @return array
	*/
	function GetLinkInfo( $id )
	{
	   	$id		    = ( int )$id;
		$table_name	    = $this->m_LinksTable;
		$admin_table 	    = $this->m_AdminsTable;
		$sql		    = "SELECT `t1`.*, `t2`.`Name`, `t3`.`Name` as `Creator_Name` FROM `$table_name` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Admin_id`=`t2`.`ID` LEFT JOIN `$admin_table` `t3` ON `t1`.`AddedBy`=`t3`.`ID` WHERE `t1`.`ID`=$id"; 
		return $this->db_Row( $sql ); 
	}
	
	function GetCatEditor( $cat_id )
	{
		$cat_id		= ( int )$cat_id;
		$cat_table	= $this->m_CategoriesTable;
		$admin_table    = $this->m_AdminsTable;
		$sql = "SELECT `t2`.`Email`,`t2`.`Name`,`t2`.`ID`, `t1`.`Parent` FROM `$cat_table` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Editor_id`=`t2`.`ID` WHERE `t1`.`ID`='$cat_id'"; 
		$result = $this->db_Row( $sql );
		
		
		return $result;
	}

	function GetLinkCatCreator( $link_id )
	{
		$link_id	= ( int )$link_id;
		$link_table	= $this->m_LinksTable;
		$cat_table	= $this->m_CategoriesTable;
		$sql = "SELECT `t2`.* FROM `$link_table` `t1` LEFT JOIN `$cat_table` `t2` ON `t1`.`Category`=`t2`.`ID` WHERE `t1`.`ID`='$link_id'";
		return $this->db_Row( $sql );
	}
	/**
	* Get info about virtual category
	* Function takes main_cat as argument and makes sql query in table with virtual categories and than get Parent_id
   * than get all values of fields in table with categories where ID = Parent_id
   * @param  int	$cat is the Child_id in virtual categories  table
   * @return array	$vir_arr_res
   */	
       	function GetVirtualCategories( $cat, $status )
      {
	 $cat		 = ( int )$cat; 
	 $status	 = ( int )$status;
	 $vir_arr_res	 = array ( );
	 $table_name	 = $this->m_CategoriesTable;
	 $table_name_vir = $this->m_ParentTable;
	  if ( $status == -1 )
	 {
	    $clause = "";
	    }
	    else
	    {
	       $clause = "AND `$table_name`.`Status`='$status'";
	       }
	 $sql	 = "SELECT  * FROM `$table_name_vir` LEFT JOIN `$table_name` ON `$table_name_vir`.`Parent_id`=`$table_name`.`ID` WHERE `$table_name_vir`.`Child_id`='{$cat}' ".$clause;
	 $i	 = 0;
	 $res	 = $this->db_Query($sql);
	  while( $arr_res = mysql_fetch_array( $res ) )
	 {
	     $arr_res['Title']		       = $this->GetFullCategoryTitle( $arr_res['ID'] ); 
	     $vir_arr_res[++$i]['Title']	 = $arr_res['Title'];
	     $vir_arr_res[$i]['ID']	    = $arr_res['ID'];       
	     
	  }
	      		  
             return $vir_arr_res;
      }

       /**
       * Search link in table with links
       * Function takes URL as argument and search link with that URL in table
       *
       * @param	  string   $url the URL, where the link direct
       * @return  array	$link_arr the array of links
       */

	function GetLinksSearch( $url, $index, $num )
	{
		$clause	   = "URL LIKE '%{$url}%' LIMIT $index, $num";
		$table_name = $this->m_LinksTable; 
		$link_arr   = $this->db_Fetch( "SELECT * FROM `$table_name` WHERE $clause" ); 
		return $link_arr;  
	}
	
	/**
	* Function takes URL as argument and get count of links, which direct to this URL
	*
	* @param  string   $url the URL, where the link direct
	* @return mixed
	*/
	function GetLinksSearchCount( $url )
	{
		$table_name	 = $this->m_LinksTable;
		$sql			 = "SELECT COUNT(*) FROM `$table_name` WHERE URL LIKE '%{$url}%' AND `Status`='0'";
		return $this->db_Value($sql);
	}
	
	/**
	* Deletes virtual category
	* Function takes Child_id and Parent_id as arguments and deletes
	* appropriate record from table with virtual categories
	*
	* @param  int	$child_id the Child_id in table with virtual categories
	* @param  int	$parent_id the Parent_id in table with virtual categories
	*/
	function DelVirCategory( $child_id, $parent_id )
	{
	 $child_id   = ( int )$child_id;
	 $parent_id  = ( int )$parent_id;
	 $cats_table = $this->m_ParentTable;
	 $sql = "DELETE FROM `$cats_table` WHERE `Child_id`='$child_id' AND `Parent_id`='$parent_id'";
	 return $this->db_Query( $sql );
	   
	 }

	 /**
	 * Deletes related category
	 * Function takes main_cat and related_cat as arguments and deletes
	 * appropriate record from table with related categories
	 *
	 * @param  int	$main_cat the main_cat in table with related categories
	 * @param  int	$related_cat the related_cat in table with related categories
	 */
	 function DelRelCategory( $main_cat, $related_cat )
	 {
	    $main_cat	   = ( int )$main_cat;
	    $related_cat   = ( int )$related_cat;
	    $cats_table	   = $this->m_RelatedTable;
	    $sql	   = "DELETE FROM `$cats_table` WHERE `main_cat`='$main_cat' AND `related_cat`='$related_cat'";
	    return $this->db_Query( $sql );

	    }


	/**
	* Deletes categories
	* Function takes ID of category as argument and deletes all values from 
	* table with categories with that category ID
	*
	* @param  int	$cat is the ID of category
	* @return array
	*/
      
	 function DelCategory ( $cat )
	{
		$cat	       = ( int )$cat;
		if ( !$cat )
		{
		   return 0;
		   }
	        $cats_table    = $this->m_CategoriesTable;
		$cats_vir_name = $this->m_ParentTable;
		$links_table   = $this->m_LinksTable;
		$cats_rel_name = $this->m_RelatedTable;
		$res	       = $this->db_Query( "DELETE FROM `{$links_table}` WHERE `Category` = '{$cat}'" );
		$res_del       = $this->db_Row("SELECT `dir` FROM `$cats_table` WHERE `ID`='{$cat}'");
		$cats_arr      = $this->db_Fetch( "SELECT * FROM `$cats_table` WHERE `Parent` = '{$cat}'" );
	        $this->db_Query("DELETE FROM `$cats_vir_name` WHERE `Child_id`='{$cats}' OR `Parent_id`='{$cat}'");
		$this->db_Query("DELETE FROM `$cats_rel_name` WHERE `main_cat`='{$cats}' OR `related_cat`='{$cats}'");
		foreach ( $cats_arr as $row )
		{
			$subcat = $row['ID'];
			$this->DelCategory ( $subcat );
					
			
		}	
		
		   
		
		return $this->db_Query( "DELETE FROM `$cats_table` WHERE `ID` = '$cat'" );
		
	}

	/** 
	* Deletes Folder
	* Function deletes physical folder of category in file system
	* Return 1 , if folder was deleted, else return 0
	*
	* @param	int	$id	the ID of category
	* @return	int
	*/
	function DelFolder( $id )
	{
	   $id			= ( int )$id;
	   $table_name = $this->m_CategoriesTable;
	   if ( $id )
	       {	       
		   $sql = "SELECT * FROM `$table_name` WHERE `ID`=".$id;
		   $res = & $this->db_Row( $sql );
		   $dir = $res['dir'];
		   if ( !ctype_space( $res['dir'] ) && strlen( $res['dir'] ) )
		   {
		      $parent = $res['Parent'];
		      if ( !$parent )
			{
			   $dir = $this->m_RootDir.$dir."/";
			   }
		      while( $parent )
		      {
				$sql = "SELECT `Parent`,`dir` FROM `$table_name` WHERE `ID`=$parent";
				$res = $this->db_Row( $sql );
				$dir = $res['dir']."/".$dir;
				$parent	 = $res['Parent'];
				$prev		 = ( !$parent ) ? $this->m_RootDir: "" ; 
				$dir		 = $prev.$dir."/";
				}
			exec( "rm -rf ".$dir );
			return 1;
		     }	       
	      }
	   else
	   {
	      return 0;
	      }
	      
	   
	   }

		/**
		* Delete Link
		* Function deletes link with ID = $link_id
		* from links table and return the result of query
		* to database for delete record in table
		*
		* @param	int	$link_id	the ID of link
		* @return	mixed
		*/		
		function DelLink( $link_id )
		{
			$link_id	= ( int )$link_id;
			$links_table	= $this->m_LinksTable;
			$cats_table	= $this->m_CategoriesTable;
			
			global $ADMIN;

			// get info about link
			$link_info = $this->db_Row( "SELECT `t1`.`AddedBy`,`t2`.`Editor_id` FROM `$links_table` `t1` LEFT JOIN `$cats_table` `t2` ON `t1`.`Category`=`t2`.`ID` WHERE `t1`.`ID`='$link_id'" );
			
			if ( ( ( $ADMIN['Type'] != 2 ) && ( $ADMIN['ID'] != $link_info['AddedBy'] && $ADMIN['ID'] != $link_info['Editor_id'] ) ) )
			{
				return -1;
			}
			elseif ( !$link_id ) 
			{
				return 0;
			}
	    
			$res	   = $this->db_Query("DELETE FROM `{$links_table}` WHERE `ID`='{$link_id}'");
			return $res;
	    }
	/**
	* Update status of category or link
	* Function takes a new status of category or link as argument
   * and update apropriate record in table
   * Use $type = 2 to update link or any other number to update category	
	* and  update values with appropriate record in table
	* 
	* @param  int	$type	2 - for update link, other - for update category
	* @param	int	$id	the ID of link or category
	* @param	int	$status	the new status of link or category
	* @return array 
	*/
	function UpdateStatus( $type, $id, $status, $admin_name=0 )//updStatus()
	{
		// Verify input data;
		$id		= ( int )$id;
		$status		= ( int )$status;
		$type		= ( int )$type;
		$admin_name	= mysql_real_escape_string( $admin_name );
		
		global $ADMIN;
		$cat_table	= $this->m_CategoriesTable;
		$link_table	= $this->m_LinksTable;
		
		switch( $type )
		{
		case 2:
			$pagerank_set	= $this->GetParam( 'pagerank_set' );
			$sql = "SELECT `t1`.*, `t2`.`Editor_id` FROM `$link_table` `t1` LEFT JOIN `$cat_table` `t2` ON `t1`.`Category`=`t2`.`ID` WHERE `t1`.`ID`='$id'";
			$link_info	= $this->db_Row( $sql );
			if ( ( $ADMIN['Type'] != 2 ) && ( $ADMIN['ID'] != $link_info['Editor_id'] ) )
			{
				return 0;
			}
			if ( !$status && $pagerank_set )
			{
				$pagerank		= getPR( $link_info['URL'] );
				$pagerank_clause	= ", `Pagerank`='$pagerank'";
			}
			else
			{
				$pagerank		= $link_info['Pagerank'];
				$pagerank_clause	= "";
			}
			$clause		= $pagerank_clause.",`Admin_id` = '".$admin_id['ID']."'";
			$table_name	= $link_table;
			break;
		case 1:
			if ( $status )
			{
				$this->DelFolder( $id );
				$clause = "";
			}
			$table_name	= $cat_table;
			break;
		default:
			$clause ="";
			$table_name	= $cat_table;
			break;
		}
		$sql = "UPDATE `$table_name` SET Status = '{$status}'".$clause." WHERE `ID`='{$id}'";
		return $this->db_Query( $sql );
	}

	/**
	* Edit comments for links
   	* Function takes ID of links and Comment for link as arguments
   	* and update appropriate record in table
	*
	* @param  int	$url_id is the ID of link with comment
	* @param  string	$comment is the new comment for link
	* @return array	result of sql query
	*/
	function EditComment( $url_id, $comment )
	{
		// Verify input data
		$url_id		= ( int )$url_id;
		$comment	= mysql_real_escape_string( $comment );
		$table_name = $this->m_CommentsTable;
		$sql_num_id = $this->db_Value("SELECT COUNT(*) FROM `$table_name` WHERE `ID` = '$url_id'");

		if ( $sql_num_id )
		{
			$sql = "UPDATE `$table_name` SET Comment = '$comment' WHERE `ID` = '$url_id'";
		}
		else
		{
			$sql = "INSERT INTO `$table_name` ( `ID`, `Comment` ) VALUES ( '$url_id', '$comment' )";
		}

		return $this->db_query( $sql );
	}

	/** Verify category for status
	* Function return array of categories with status = $status
	*
	* @param	int	$status	the status of categories wich function have to return
	* @return	array
	*/
	function GetVerifyCats( $status, $editor_id=0 )
	{
	   $status		 = ( int )$status;
	   $editor_id		 = ( int )$editor_id;
	   if ( $editor_id )
	   {
		   $clause = " AND `Editor_id`='$editor_id'";
	   }
	   else
	   {
		   $clause = "";
	   }
	   $table_name	 = $this->m_CategoriesTable;
	   $sql = "SELECT * FROM `$table_name` WHERE `Status` = '$status'".$clause;
	   return $this->db_Fetch( $sql );
	}

	/* Verify links
	* Function returns array with links depend at argument $param
	* If $param = 1, returns links with status = 1
	* if $param = 2, returns links with broken URL
	* if $param = 3, returns links with invalid Email
	* if $param = 4, returns links with invalid LinkBackURL
	* 
	* @param	int $param	the parametr of link for return
	* @return	array
	*/
	function GetVerifyLinks( $param )
	   {
	      $index		= ( int )$param['index'];
	      $num		= ( int )$param['num'];
	      $editor_id	= ( int )$param['editor'];
	      if ( $editor_id )
	      {
		      $editor_clause =  " AND `t3`.`Editor_id`='$editor_id'";
	      }
	      else
	      {
		      $editor_clause = "";		      
	      }
	      $table_name = $this->m_LinksTable;
	      $admin_table = $this->m_AdminsTable;
	      $cat_table = $this->m_CategoriesTable;
	      $limit_clause = ( $num ) ?  " LIMIT $index, $num": "";
	      switch( $param['type'] )
	      {
		 case 1:
		    $clause = "WHERE `t1`.`Status`='1'";
		    break;
	    	 case 2:
		    if ( $param['count'] )
		    {
			    if ( !$editor_id )
			    {
				    $sql = "SELECT `UrlHeader`, COUNT(`UrlHeader`) count FROM `$table_name` GROUP BY `UrlHeader`".$limit_clause;   
			    }
			    else
			    {
				    $sql = "SELECT `t1`.`UrlHeader`, COUNT(`t1`.`UrlHeader`) count FROM `$table_name` `t1` LEFT JOIN `$cat_table` `t2` ON `t1`.`Category`=`t2`.`ID` WHERE `t2`.`Editor_id`='$editor_id' GROUP BY `t1`.`UrlHeader`".$limit_clause;
			    }
		    }
		    else
		    {
			    $clause = "WHERE `t1`.`UrlHeader`=".$param['UrlHeader'];
		    }
		    break;
	 	 case 3:
		    $clause = "WHERE `t1`.`EmailValid`='n'";
		    break;
		 case 4:
		    $clause = "WHERE `t1`.`LinkBackURLValid`='n'";
	      }
		 $sql			 = ( $sql ) ? $sql : "SELECT `t1`.*, `t2`.`Name`, `t2`.`Email` as 'Editor_Email' FROM `$table_name` `t1` LEFT JOIN `$admin_table` `t2` ON `t1`.`Admin_id`=`t2`.`ID` LEFT JOIN `$cat_table` `t3` ON `t1`.`Category`=`t3`.`ID` ".$clause.$editor_clause.$limit_clause;
		 return $this->db_Fetch( $sql );
	      }

	/* Get comment
	* Function return comment from comments table with ID = $url_id
	*
	* @param	int	$url_id the ID of link to get comment
	* @return	value
	*/
    function GetComment( $url_id )
    {
      $url_id	    = ( int )$url_id;
		$table_name	 = $this->m_CommentsTable;
      $sql		    = "SELECT `Comment` FROM `$table_name` WHERE `ID` = '$url_id'";
		return $this->db_Value( $sql );
    }

    /**
    * Checks for links with URL to this Catalog of categoies from BackURL links
    * Function takes ID of links as argument and checks presence link with URL to Site Directory 
    * in URL wich was showed as BackLinkURL 
    	*
    * @param   int   $id is the ID of link
    * @param   int   $type if $type present, than function return message, else 1 or 0
    * @return  mixed
    */  
    function VerifyLinkRecip( $id )
    {
	    	global $_skalinks_url;
		$table_name	= $this->m_LinksTable;
      		$id		= ( int )$id;
		$link_info	= $this->GetLinkInfo ( $id );
		$verify_mod	= $this->GetParam( 'recip_verify_mod' );
		if ( !$link_info['LinkBackURL'] || $link_info['LinkBackURL'] == 'http://' )
		{
			$sql = "UPDATE `$table_name` SET `LinkBackURLValid`='n' WHERE `ID`='$id'";
			$this->db_Query( $sql );
			return '-1';
		}
		$aContent =  @file( $link_info['LinkBackURL'] );
		if ( $aContent )
		{
			$ftext = join ('', file( $link_info['LinkBackURL'] ) );
			preg_match( "/<\s*body\s*.*?>/i", $ftext, $body_pos );
			$body_before_pos = strpos( $ftext, $body_pos[0] );
			$body_post = substr( $ftext, $body_before_pos );
			$temp_body = substr( $ftext, 0, $body_before_pos );
			if ( substr_count( $temp_body, "<!--" ) <= substr_count( $temp_body, "-->" ) )
			{
				if ( $link_info['Alt_domain'] && $link_info['Alt_domain'] != 'http://' )
				{
					$search_domain = $link_info['Alt_domain'];
				}
				else
				{
					$search_domain = $_skalinks_url['main_site'];
				}
				$search_domain = trim( $search_domain );
				preg_match("/^(http:\/\/)?(www\.)?([^\/]+)/i",	$search_domain, $matches);
				
				$body_post = strtolower( $body_post );
								
				$href_pos_begin = ( strpos( $body_post, 'http://www.'.$matches[3] ) ) ? strpos( $body_post, 'http://www.'.$matches[3] ) : strpos( $body_post, 'http://'.$matches[3] );

				if ( $href_pos_begin )
				{
					$l_part		= substr( $body_post, 0, $href_pos_begin );
					$r_part		= substr( $body_post, $href_pos_begin );
					$r_href_end1	= strpos( $r_part, "/a" );
					$r_href_end1_txt = substr( $r_part, $r_href_end1 );
					$r_href_end2	= strpos( $r_href_end1_txt, ">" );
					$l_part		= strrev( $l_part );
					$l_href_end	= strpos( $l_part, "a<" ) ;
					$body_post	= substr( $body_post, ( $href_pos_begin - $l_href_end -2 ), ( $r_href_end1 + $r_href_end2 + $l_href_end + 3  ) );
					
				}
				//$body_post = str_replace( "\r\n", " ", $body_post );echo $body_post;
				/*preg_match( "/<\s*a\s.*?href\s*?=\s*(\"http:\/\/(w{3}\.)?{$matches[3]}(\/.*)*\"|\'http:\/\/(w{3}\.)??{$matches[3]}(\/.*)*\'|http:\/\/(w{3}\.)?{$matches[3]}(\/.*)*)\s.*?>.+?<\/\s*a\s*>/im", $body_post, $match );print_r($match);*/
				
				preg_match( "/<a\s([^<>]*?\s)*?href\s*?=\s*\"\s*(http:\/\/(w{3}\.)?{$matches[3]}\/?(.*?)*?)\"([^<>]*?\s*)*?>.+?<\/\s*a\s*>/is", $body_post, $match );
				if ( !$match[0] )
				{
					preg_match( "/<a\s([^<>]*?\s)*?href\s*?=\s*\'\s*(http:\/\/(w{3}\.)?{$matches[3]}\/?(.*?)*?)\'([^<>]*?\s*)*?>.+?<\/\s*a\s*>/is", $body_post, $match );
				}
				if ( !$match[0] )
				{
					preg_match( "/<a\s([^<>]*?\s)*?href\s*?=\s*(http:\/\/(w{3}\.)?{$matches[3]}\/?(.*?)*?)(\s*[^<>]*?\s*)*?>.+?<\/\s*a\s*>/is", $body_post, $match );
				}
				
				if ( $match[0] && ( !preg_match( "/rel\s*=\s*(nofollow|'nofollow'|\"nofollow\")/ims", $match[0] ) ) && !substr_count( $match[0], "<!" ) )
				{
					$href_before_pos = strpos( $body_post, $match[0] );
					$href_before_content = substr( $body_post, 0, $href_before_pos );
					if ( substr_count( $href_before_content, "<!" ) == substr_count( $href_before_content, "-->" ) )
					{
						if ( !$verify_mod )
						{
							preg_match( '/http:\/\/[^\s"\']+/i', $match[2], $url_search );
							$http_code = $this->VerifyLinkBroken(0, $url_search[0] );
							if ( array_search( $http_code, array( 1 => 200, 2 => 201, 3 => 202, 4 => 301 ) ) )
							{
								$back_valid = 'y';
							}
							else
							{
								$back_valid = 'n';
							}
							
						}
						else
						{
							$back_valid = 'y';
						}
					}
				}
				else
				{
					$back_valid = 'n';
				}
			}
			else
			{
				$back_valid = 'n';
			}
		}
	    	else
		{
	    		$back_valid = 'n';
		}
	
		$sql = "UPDATE `$table_name` SET `LinkBackURLValid`='$back_valid' WHERE `ID`='$id'";
		$this->db_Query( $sql );
		
		return ( $aContent ) ? $back_valid : '0';
	}
	

	/**
	* Checks for broken links
	* Function takes ID of links as argument, and takes URL of this links
	* and search in Internet this URL
	*
	* @param  int	$id is the ID of link
	* @param  int	$type if present, function return message, else return result of search
	* @return mixed
	*/
	function VerifyLinkBroken( $id, $url='' )
     {
	        if ( !$url )
		{
			$id    	    = ( int )$id;
			$link_info  = $this->GetLinkInfo( $id );
			$url	    = $link_info['URL'];
		}	
		$table_name = $this->m_LinksTable;		
		if ( preg_match("'^http://'",$url))
		{ 
			//display no errors and use @file to open link
			$aContent =  @file( $url ); 
			if ( $aContent )
			{
				$sContent = implode( "\n", $aContent );
				
				//get header code
				$header		   = join( "\n", $http_response_header ); 
				list(,$http_code,) = split( " ", $header, 3);
			}
			else
			{
				$http_code = 1;
			}
		}
		
		$result = $this->db_Query( "UPDATE `$table_name` SET `UrlHeader` = '{$http_code}' WHERE `ID` = '{$id}'" );
		return $http_code;
	}
	
	/**
	* Adds search pattern to database
	*/
	function AddSearchPattern( $pattern )
	{
		$pattern	= mysql_real_escape_string( $pattern );
		$table_name	= $this->m_SearchTable;
		$sql = "SELECT * FROM `$table_name` WHERE `Pattern`='$pattern'";
		$pattern_exists = $this->db_Row( $sql );
		if ( $pattern_exists )
		{
			$count_hits = ++$pattern_exists['Count_Hits'];
			$sql = "UPDATE `$table_name` SET `Count_Hits`='$count_hits' WHERE `Pattern`='$pattern'";
			return $this->db_Query( $sql );
			}
			else
			{
				$sql = "INSERT INTO `$table_name`(`Pattern`) VALUES('$pattern')";
				return $this->db_Query( $sql );
				}
		}
	
	/**
	* Gets array with most popular searches
	*
	*/
	function GetSearches( $string, $num )
	{
		$num = ( int )$num;
		$string = mysql_real_escape_string( $string );
		$table_name = $this->m_SearchTable;
		$search_array = explode( ' ', $string );
		$clause = "LIKE '".strtolower( $search_array[0] )."' ";
		foreach( $search_array as $key => $value )
		{
			if ( !$key )
			{
				continue;
				}
				else
				{
					$clause.="OR `Pattern` LIKE '".strtolower( $value )."' ";
					}
			}
		$sql = "SELECT * FROM `$table_name` WHERE `Pattern` ".$clause." ORDER BY `Count_Hits` DESC LIMIT 0,$num";
		return $this->db_Fetch( $sql );
		}
	
	/**
	* Logins admin
	* Function checks username and password in table with admin's account
	* if this login and password are present, than function sets appropriate cookies, and direct to folder "admin"
	*
	* @param  string   $admin the username of admin
	* @param  string   $password the password of admin
	* @return string   $msg the message
	*/
	function Login( $admin, $password)
	{
		global $_skalinks_site;
		global $_skalinks_url;
		$table_name	= $this->m_AdminsTable;
		$sql		= "SELECT `Name`, `Password` FROM `$table_name` WHERE `Name` = '$admin' and `Password` = '$password' LIMIT 1";
		$auth_info	= $this->db_Row( $sql );
		if ( !$auth_info )
		{
			return 1;
		}
		else
		{
			setcookie( "adminname", $admin, time()+36000000, "/" );
			setcookie( "pwd", $password, time()+36000000,"/" );
			header( "Location: ".$_skalinks_url['admin'] );
			return 0;
		}
	}
	
	/**
	* Send mail
	* 
	* @param	string	$to - email where message will be send
	* @param	string	$subj - subject of message
	* @param	string	$param_body	the name of parametr from params table, wich function use as template of message
	* @param	string	$from - name of sendler
	* @param	string	$URL_link - the URL of link
	* @param	string	$LOCATION_link - the location of link in Directory
	* @param	string	$LISTING_link - URL of links listing page
	* @param	string	$SiteBizname - the Bisness name of site, from where message will be send
	* @param	string	$LinksEmail - the E-meil, where reciever can sent message
	*
	*/
	function Mailer( $to, $subj, $param_body, $URL_link, $LOCATION_link, $LISTING_link, $SiteBizname )
	{
	   global $_skalinks_url;
	   global $_skalinks_site;
	   $table_name		= $this->m_ParamsTable;
	   $admin_table		= $this->m_AdminsTable;
	   $tem_table		= $this->m_LetterTemTable;
	   $tem_binding_table	= $this->m_LetterTemBindingTable;
	   $res			= $this->db_Row( "SELECT `VALUE` FROM `$table_name` WHERE `Name`='$param_body'");
	   $body		= $res['VALUE'];
	   $subj		= $this->GetParam( "default_mail_theme" );
	   $links_table = $this->m_LinksTable;
	   $cat_table = $this->m_CategoriesTable;
	   $link_info = $this->db_Row( "SELECT * FROM `$links_table` WHERE `URL`='$URL_link'" );
	   if ( $param_body == 't_admin_link_approved' || $param_body == 't_admin_link_submitted' || $param_body == 't_admin_link_changed')
	   {
		   if ( !$link_info['Template_id'] )
		   {
			   $parent_cat = $link_info['Category'];
			   while( $parent_cat )
			   {
				   $sql = "SELECT `t2`.`Template` FROM `$tem_binding_table` `t1` LEFT JOIN `$tem_table` `t2` ON `t1`.`Template_id`=`t2`.`ID` WHERE `t1`.`Cat_id`='$parent_cat'";
				   $result = $this->db_Row( $sql );
				   if ( !$result )
				   {
					   $sql = "SELECT `Parent` FROM `$cat_table` WHERE `ID`='$parent_cat'";
					   $result = $this->db_Row( $sql );
					   $parent_cat = $result['Parent'];
				   }
				   else
				   {
					   $parent_cat = 0;
					   $subtemplate = $result['Template'];
				   }
			   }
		   }
		   else
		   {
			   $sql = "SELECT `Template` FROM `$tem_table` WHERE `ID`='".$link_info['Template_id']."'";
			   $result = $this->db_Row( $sql );
			   $subtemplate = $result['Template'];
		   }
	   if ( !$subtemplate )
	   {
		   $sql = "SELECT `Template` FROM `$tem_table` WHERE `Status`='1'";
		   $result = $this->db_Row( $sql );
		   $subtemplate = $result['Template'];
		   }
	   $body = str_replace( "<LinkBackMessage>", $subtemplate, $body );
		   }
	   if ( $param_body == 't_admin_link_changed' )
	   {
		   $body = str_replace( "<your_LinkTitle>", $link_info['Title'], $body );
		   $body = str_replace( "<your_LinkDescription>", $link_info['Description'], $body );
		   $body = str_replace( "<your_LinkEmail>", $link_info['Email'], $body );
		   $body = str_replace( "<your_LinkRank>", $link_info['Rank'], $body ); 
		   }
	   $email = $this->db_Row( "SELECT `Email`,`Name` FROM `$admin_table` WHERE `ID`='".$link_info['Admin_id']."'" );
	   if ( !$email )
	   {
		   $res = $this->db_Row( "SELECT `VALUE` FROM `$table_name` WHERE `Name`='default_admin_email'" );
		   $sender_email = $res['VALUE'];
		   $from = $this->GetParam( 'default_admin_name' );
	   }
	   else
	   {
		   $sender_email = $email['Email'];
		   $from = $email['Name'];
	   }
	   $body = str_replace( "<our_MainSiteURL>", $_skalinks_url['main_site'], $body );
	   $body = str_replace( "<our_MainSiteTitle>", $_skalinks_site['site_full'], $body );
	   $body = str_replace( "<our_MainSiteDescription>", $_skalinks_site['site_description'], $body );
	   $body = str_replace( "<our_SiteBizname>", $SiteBizname, $body );
	   $body = str_replace( "<our_LinkLocation>", $LOCATION_link, $body );
	   $body = str_replace( "<our_ListingPage>", $LISTING_link, $body );
	   $body = str_replace( "<our_LinksEmail>", $sender_email, $body );
	   $body = str_replace( "<your_LinkSite>", $URL_link, $body );
	   $from = "From: \"".$from."\" <".$sender_email.">\r\n"."Reply-To: <".$sender_email.">\r\n Return-path: <".$sender_email."> \n ";
	   
	   if ( get_cfg_var( 'safe_mode' ) )
	   {
		   mail( $to, $subj, $body, $from ); 
	   }
	   else
	   {
		   mail( $to, $subj, $body, $from, "-f".$sender_email ); 
	   }
        }
 
        /**
	* Logout admin
	* just logout admin, there are no arguments
	*
	* @return string   $msg the message
	*/
	function Logout( )
	{
	        setcookie( "adminname", "", 0, "/");
		setcookie( "pwd", "",0,"/" );
		return 1;
	}
	
	/**
	* Checks cookies if admin
	* Return 0 if cookie for admin is present, else return 1
	* Function without arguments
	*
	* @return int
	*/
	function IsAdmin( )
	{ 
		$table_name = $this->m_AdminsTable;
		$res = $this->db_Row( "SELECT * FROM `$table_name` WHERE `Name`='".$_COOKIE['adminname']."' AND `Password`='".$_COOKIE['pwd']."'");
		if ( !$res )
		{
			return 0;
		}
		else
		{
			return $res;
		}
	}
	
	/**
	* Gets info about admins
	* Gets array with admins username and password from table with admin's username and password
        * Function without arguments
	*
	* @return array	
	*/
	function GetAdmins( $type=0 )
	{
		$table_name	= $this->m_AdminsTable;
		$clause		= ( $type ) ? " WHERE `Type`='$type'" : "";
		$sql		= "SELECT * FROM `$table_name`".$clause;
		return $this->db_Fetch( $sql );
	}

	function EditAdmin( $id, $name, $email, $type, $pass='0' )
	{
		$type	= ( int )$type;
		$id	= ( int )$id;
		$table_name = $this->m_AdminsTable;
		
		$query		= "SELECT `Name` FROM `$table_name` WHERE `ID`='$id'";
		$adm_info	= $this->db_Row( $query );
		if ( $adm_info['Name'] != $name )
		{
			$query = "SELECT `ID` FROM `$table_name` WHERE `Name`='$name'";
			$adm_exists = $this->db_Row( $query );
		}

		if ( !$adm_exists['ID'] )
		{
			$sql		= "SELECT `Name`, `Password` FROM `$table_name` WHERE `ID`='$id'";
			$adm_info	= $this->db_Row( $sql );
			$pass		= ( $pass ) ? md5( $pass ) : $adm_info['Password'];
			if ( $adm_info['Name'] == $_COOKIE['adminname'] )
			{				
				setcookie( "adminname", "", 0, "/");
				setcookie( "pwd", "",0,"/" );
				setcookie( "adminname", $name, time()+36000000, "/" );
				setcookie( "pwd", $pass, time()+36000000,"/" );
			}
			$sql = "UPDATE `$table_name` SET `Name`='$name', `Password`='$pass', `Email`='$email', `Type`='$type' WHERE `ID`='$id'";
			return $this->db_Query( $sql );
		}else
		{
			return 0;
		}
	}
	function DelAdmin( $admin_id )
	{
		$admin_id	= ( int )$admin_id;
		$table_name	= $this->m_AdminsTable;
		$sql		= "DELETE FROM `$table_name` WHERE `ID`='$admin_id'";
		return $this->db_Query( $sql );	
	}
}

?>
