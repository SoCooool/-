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

function restore_backup( $path )
{
	global $_skalinks_dir;
	global $SkaLinks;
	
	$gz_handle = gzopen( $path, 'r' );
	if ( !$gz_handle )
	{
		return -1;
	}
	
	// back database in temp file
	backup_db( '0', 'temp_backup_db.sql.gz' );
	
	// dropt all tables in database
	mysql_query( "DROP TABLE IF EXISTS {$SkaLinks->m_LinksTable} , `{$SkaLinks->m_AdsTable}`,`{$SkaLinks->m_AdsBindingTable}`,`{$SkaLinks->m_CategoriesTable}`,`{$SkaLinks->m_SearchTable}`,`{$SkaLinks->m_LetterTemTable}`,`{$SkaLinks->m_LetterTemBindingTable}`,`{$SkaLinks->m_AdminsTable}`,`{$SkaLinks->m_CommentsTable}`,`{$SkaLinks->m_ParamsTable}`,`{$SkaLinks->m_RelatedTable}`,`{$SkaLinks->m_ParentTable}`,`{$SkaLinks->m_SettingsTable}`" );	
	
	$content = '';
	while( $s = gzread( $gz_handle, '1024' ) )
	{
		$string .= $s;
	}
	gzclose( $gz_handle );
	splitSqlFile( $content, $string );
	foreach( $content as $value )
       	{
		if ( !$value['empty'] && !@mysql_query( $value['query'].';' ) )
		{
			$mysql_err = 1;
		}
	}
	if ( $mysql_err )
	{
		// restore db from temp backup
		$SkaLinks->db_Query( "DROP TABLE IF EXISTS {$SkaLinks->m_LinksTable} , `{$SkaLinks->m_AdsTable}`,`{$SkaLinks->m_AdsBindingTable}`,`{$SkaLinks->m_CategoriesTable}`,`{$SkaLinks->m_SearchTable}`,`{$SkaLinks->m_LetterTemTable}`,`{$SkaLinks->m_LetterTemBindingTable}`,`{$SkaLinks->m_AdminsTable}`,`{$SkaLinks->m_CommentsTable}`,`{$SkaLinks->m_ParamsTable}`,`{$SkaLinks->m_RelatedTable}`,`{$SkaLinks->m_ParentTable}`,`{$SkaLinks->m_SettingsTable}`" );	

		$gz_handle = gzopen( $_skalinks_dir['db_backup'].'temp_backup_db.sql.gz', 'r'  );
		$string		= '';
		$content	= '';
		while( $s = gzread( $gz_handle, '1024' ) )
		{
			$string .= $s;
		}		
		gzclose( $gz_handle );
		echo strlen( $string );
		splitSqlFile( $content, $string );
		foreach( $content as $value )
		{
			if ( !$value['empty'] )
			{
				mysql_query( $value['query'].';' );
			}
		}
		unlink( $path );
		unlink( $_skalinks_dir['db_backup'].'temp_backup.sql.gz' );
		return 0;		
	}
	unlink( $_skalinks_dir['db_backup'].'temp_backup_db.sql.gz' );
	return 1;
}

function download_db_backup( $filename, $code )
{
	$buffer = gzencode($code, 9);
	header('Content-Type: application/x-gzip');
	header('Content-Disposition: inline; filename="'.$filename.'"');
	header('Expires: '.gmdate('D, d M Y H:i:s').' GMT');
	header('Content-Disposition: inline; filename="'.$filename.'"');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
	echo $buffer;	
}	
function backup_db( $if_download, $file_name )
{
	global $_skalinks_mysql;
	global $_skalinks_dir;
	$status = '';
//	@mysql_select_db($db['db']);

	$sql = mysql_query("SHOW TABLE STATUS FROM `".$_skalinks_mysql['dbname']."`");

	$code = '';
	while ($row = mysql_fetch_array($sql))
	{
		$tablename = $row['Name'];

		$code .= "CREATE TABLE `".$tablename."` (";
		$quantity = 0;
		$array[] = '';
		$sql2 = mysql_query("SHOW FIELDS FROM `".$tablename."`");
		while ($row2 = mysql_fetch_array($sql2))
		{
			$quantity++;
			$array[$quantity] = $row2['Field'];
			if ($quantity > 1)
				$code .= ',';

			$code .= "\n  `".$row2["Field"]."`";
			$code .= " ".$row2["Type"]."";
			if (ereg("char", $row2["Type"]))
			{
				if ($row2["Null"] == "YES")
					$code .= " default NULL";
				else
					$code .= " NOT NULL default '".$row2["Default"]."'";
			}
			if (ereg("int", $row2["Type"]))
			{
				$code .= ' NOT NULL';
				if ($row2["Default"] != '')
					$code .= " default '".$row2["Default"]."'";
				if ($row2["Extra"] != '')
					$code .= ' '.$row2['Extra'];
			}
			if (ereg("date", $row2["Type"]))
			{
				if ($row2["Null"] != "YES")
					$code .= " NOT ";
				$code .= " NULL";
				if ($row2["Default"] != "")
				$code .= " default '".$row2["Default"]."'";
			if ($row2["Extra"] != "")
				$code .= " ".$row2["Extra"];
			}
			if (ereg("text", $row2["Type"]))
			{
				if ($row2["Null"] != "YES")
					$code .= " NOT NULL";
				if ($row2["Default"] != "")
					$code .= " default '".$row2["Default"]."'";
				if ($row2["Extra"] != "")
					$code .= " ".$row2["Extra"];
 		}
			if (ereg("float", $row2["Type"]))
			{
				if ($row2["Null"] == "YES")
					$code .= " default NULL";
				else
					$code .= " NOT NULL default '".$row2["Default"]."'";
			}
			if (ereg("enum", $row2["Type"]))
			{
				if ($row2["Null"] != "YES")
					$code .= " NOT NULL";
				ELSE
					$code .= "NULL";
				if ($row2["Default"] != "")
					$code .= " default '".$row2["Default"]."'";
			}
		}

		$arr = '';
		$i = 0;
		$sql2 = mysql_query("SHOW INDEX FROM `".$tablename."`");
		while ($row2 = mysql_fetch_array($sql2))
		{
			$arr[$i]["Non_unique"] = $row2["Non_unique"];
			$arr[$i]["Key_name"] = $row2["Key_name"];
			$arr[$i]["Seq_in_index"] = $row2["Seq_in_index"];
			$arr[$i]["Column_name"] = $row2["Column_name"];
 			$i++;
		}

		$flag = 0;
		for ($i2 = 0; $i2 < $i; $i2++)
		{
			if ($arr[$i2]["Seq_in_index"] < $arr[$i2 + 1]["Seq_in_index"] && $i2 < $i && $arr[$i2]["Non_unique"] == 0 && $arr[$i2]["Key_name"] != "PRIMARY" || $flag == 1)
			{
				if ($flag != 1)
					$code .= ",\n  UNIQUE KEY `".$arr[$i2]["Key_name"]."` (";
				if ($flag == 1)
					$code .= ",";
				$code .= "`".$arr[$i2]["Column_name"]."`";
				$flag = 1;
			}
			elseif ($arr[$i2]["Non_unique"] == "0" && $arr[$i2]["Key_name"] != "PRIMARY")
			{
				$code .= ",\n  UNIQUE KEY `".$arr[$i2]["Key_name"]."` (`".$arr[$i2]["Column_name"]."`)";
			}
			elseif ($arr[$i2]["Seq_in_index"] < $arr[$i2 + 1]["Seq_in_index"] && $i2 < $i && $arr[$i2]["Key_name"] == "PRIMARY" || $flag == 3)
			{
				if ($flag != 3)
					$code .= ",\n  PRIMARY KEY (";
				if ($flag == 3)
					$code .= ",";
				$code .= "`".$arr[$i2]["Column_name"]."`";
				$flag = 3;
			}
			elseif ($arr[$i2]["Key_name"] == "PRIMARY")
 			{
				$code .= ",\n  PRIMARY KEY (`".$arr[$i2]["Column_name"]."`)";
			}
			elseif ($arr[$i2]["Seq_in_index"] < $arr[$i2 + 1]["Seq_in_index"] && $i2 < $i && $arr[$i2]["Non_unique"] == "1" || $flag == 2)
			{
				if ($flag != 2)
					$code .= ",\n  KEY `".$arr[$i2]["Key_name"]."` (";
				if ($flag == 2)
					$code .= ",";
				$code .= "`".$arr[$i2]["Column_name"]."`";
				$flag = 2;
			}
			elseif ($arr[$i2]["Non_unique"] == "1" && $arr[$i2]["Seq_in_index"] == 1)
			{
				$code .= ",\n  KEY `".$arr[$i2]["Key_name"]."` (`".$arr[$i2]["Column_name"]."`)";
			}



	  		if ($flag == 1 && $arr[$i2]["Seq_in_index"] > $arr[$i2 +1]["Seq_in_index"])
			{
				$flag = 0;
				$code .= ")";
			}elseif ($flag == 3 && $arr[$i2]["Seq_in_index"] > $arr[$i2 +1]["Seq_in_index"])
			{
				$flag = 0;
				$code .= ")";
			}elseif ($flag == 2 && $arr[$i2]["Seq_in_index"] > $arr[$i2 +1]["Seq_in_index"])
			{
				$flag = 0;$buffer = gzencode($code, 9);
				$code .= ")";
			}
	  	}


		$code .= "\n)";

		if ($row['Type'] != '')
			$code .= ' TYPE='.$row['Type'];

		if ($row['Create_options'] != '')
			$code .= ' '.$row['Create_options'];

		if ($row['Auto_increment'] != '')
			$code .= ' AUTO_INCREMENT='.$row['Auto_increment'];

		$code .= " ;\n";

		if ($tablename != 'ZIPCodes')
		{
			$code .= "\n";
			$sql2 = mysql_query("SELECT * FROM `".$tablename."`");
			while ($row2 = mysql_fetch_array($sql2))
			{
				$code .= "INSERT INTO `".$tablename."` (";
				for ($j = 1; $j <= $quantity; $j++)
				{
					$code .= "`".$array[$j]."`";
					if ($j < $quantity)
						$code .= ", ";
 			}

				$code .= ') VALUES (';

				for ($j = 1; $j <= $quantity; $j++)
				{
					$val = ereg_replace("'", "''", $row2[$array[$j]]);
					$val = ereg_replace("\r\n", "\\n", $val);
					$code .= "'".$val."'";
					if ($j < $quantity)
						$code .= ", ";
				}
				$code .= ");\n";
			}
			$code .= "\n";
		}

		$code .= "\n";
		@mysql_free_result($sql2);

	}
	@mysql_free_result($sql);

	if ( $if_download )
	{
		download_db_backup( $file_name, $code );
	}
	
	$descriptor = @gzopen ( $_skalinks_dir['db_backup'].$file_name, 'w');
	if ( !$descriptor )
	{
		return 0;
	}
	else
	{
		gzwrite($descriptor, $code);
		gzclose($descriptor);
	//	$status .= 'Backup file was successfully saved.';
		return 1;
	}	
}
function splitSqlFile(&$ret, $sql )
{
    // do not trim, see bug #1030644
    //$sql          = trim($sql);
    $sql          = rtrim($sql, "\n\r");
    $sql_len      = strlen($sql);
    $char         = '';
    $string_start = '';
    $in_string    = FALSE;
    $nothing      = TRUE;
    $time0        = time();

    for ($i = 0; $i < $sql_len; ++$i) {
        $char = $sql[$i];

        // We are in a string, check for not escaped end of strings except for
        // backquotes that can't be escaped
        if ($in_string) {
            for (;;) {
                $i         = strpos($sql, $string_start, $i);
                // No end of string found -> add the current substring to the
                // returned array
                if (!$i) {
                    $ret[] = $sql;
                    return TRUE;
                }
                // Backquotes or no backslashes before quotes: it's indeed the
                // end of the string -> exit the loop
                else if ($string_start == '`' || $sql[$i-1] != '\\') {
                    $string_start      = '';
                    $in_string         = FALSE;
                    break;
                }
                // one or more Backslashes before the presumed end of string...
                else {
                    // ... first checks for escaped backslashes
                    $j                     = 2;
                    $escaped_backslash     = FALSE;
                    while ($i-$j > 0 && $sql[$i-$j] == '\\') {
                        $escaped_backslash = !$escaped_backslash;
                        $j++;
                    }
                    // ... if escaped backslashes: it's really the end of the
                    // string -> exit the loop
                    if ($escaped_backslash) {
                        $string_start  = '';
                        $in_string     = FALSE;
                        break;
                    }
                    // ... else loop
                    else {
                        $i++;
                    }
                } // end if...elseif...else
            } // end for
        } // end if (in string)
       
        // lets skip comments (/*, -- and #)
        else if (($char == '-' && $sql_len > $i + 2 && $sql[$i + 1] == '-' && $sql[$i + 2] <= ' ') || $char == '#' || ($char == '/' && $sql_len > $i + 1 && $sql[$i + 1] == '*')) {
            $i = strpos($sql, $char == '/' ? '*/' : "\n", $i);
            // didn't we hit end of string?
            if ($i === FALSE) {
                break;
            }
            if ($char == '/') $i++;
        }

        // We are not in a string, first check for delimiter...
        else if ($char == ';') {
            // if delimiter found, add the parsed part to the returned array
            $ret[]      = array('query' => substr($sql, 0, $i), 'empty' => $nothing);
            $nothing    = TRUE;
            $sql        = ltrim(substr($sql, min($i + 1, $sql_len)));
            $sql_len    = strlen($sql);
            if ($sql_len) {
                $i      = -1;
            } else {
                // The submited statement(s) end(s) here
                return TRUE;
            }
        } // end else if (is delimiter)

        // ... then check for start of a string,...
        else if (($char == '"') || ($char == '\'') || ($char == '`')) {
            $in_string    = TRUE;
            $nothing      = FALSE;
            $string_start = $char;
        } // end else if (is start of string)

        elseif ($nothing) {
            $nothing = FALSE;
        }

        // loic1: send a fake header each 30 sec. to bypass browser timeout
        $time1     = time();
        if ($time1 >= $time0 + 30) {
            $time0 = $time1;
            header('X-pmaPing: Pong');
        } // end if
    } // end for

    // add any rest to the returned array
    if (!empty($sql) && preg_match('@[^[:space:]]+@', $sql)) {
        $ret[] = array('query' => $sql, 'empty' => $nothing);
    }

    return TRUE;
} // end of the 'splitSqlFile()' function

function upload_backup( $folder_path )
{
	// check uploaded file
	if ( !strlen( trim( $_FILES['userfile']['name'] ) ) )
		return -1;
	if ( $_FILES['userfile']['error'] )
		return -2;
	if ( !$_FILES['userfile']['size'] )
		return -3;
	if ( $_FILES['userfile']['size'] > $_POST['MAX_FILE_SIZE'] )
		return -4;
	if ( !is_uploaded_file( $_FILES['userfile']['tmp_name'] ) )
		return -5;
	if ( is_executable( $_FILES['userfile']['tmp_name'] ) )
		return -6;
	if ( filetype( $_FILES['userfile']['tmp_name'] ) != 'file' ) 
	{
		return -7;
	}
	
	// move uploaded file from temp dir
	return ( move_uploaded_file( $_FILES['userfile']['tmp_name'], $folder_path.$_FILES['userfile']['name'] ) ) ? 1 : 0;
}
?>
