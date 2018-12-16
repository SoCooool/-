<html>
<head>
<title>SkaLinks Exchange Script Installer</title>
<meta name="description" content="{$_output.meta_description|default:$_skalinks_site.brand}" content="text/html; charset=windows-1251">
<link href="../templates/style.css" rel="STYLESHEET" type="text/css">
<script src="form.js" type="text/javascript"></script>
<link href="styles.css" rel="STYLESHEET" type="text/css">
</style>
</head>
<body>
<div id = "container">
	<div id="Header_inst"><div class=logo></div><div class=ska><b>SkaLinks Exchange Script Installer</b></div></div>
	<div id="Content">&nbsp;
<?php if ( $msg )
	{
	?>	
	<div class="msg"><?php echo $msg ?></div>
		<?php } ?>
<form method=post onSubmit="return FormValidation( this );" action=<?php echo $_SERVER['PHP_SELF']?>>
<div id="i_desc">
Before starting installation, please make sure that you read <a href="http://www.skalinks.com/inst_manual.php">installation manual</a> - the installation process is decribed step by step in this document.<br><br>
In short, the following requirements should be met.<br><br>
For the following directories you should set <b>777</b> permissions manually:<br><br>
• 	<b>script_root_directory</b> (for example: /my/home/dir/)<br>
• 	<b>db backup folder</b> (for example: /my/home/dir/admin/db_backup/)<br>
• 	<b>.htaccess file</b> (for example: /my/home/dir/.htaccess)<br>
•	<b>cache</b> directory ( for example: /my/home/dir/cache/ )<br>
•	<b>compile</b> directory ( for example: /my/home/dir/compile/ )<br><br>
Remember that if you already have some earlier version of SkaLinks script installed, as a value for <b>$_mysql_dbname</b> variable you should specify the name of the MySQL database that is used by the previously installed script. Otherwise, you should create a new database on the server manually and specify its name.<br><br>
After you run the installation module and make sure that installation process went smoothly and properly, you should delete the <b>install</b> directory from your server! We strongly recommend that you do it for security reasons. If the directory remains on the server, anyone will be able to ruin your site’s settings.<br><br>
After installation, please, go to "Settings" page and make all necessary changes.
<br><br>
<table>
<tr>
<td align=left>
<a href="http://www.skalinks.com/forums/">SkaLinks Forum</a></td>
<td align=center>
<a href="http://www.skalinks.com/support.php">Support</a></td>
<td align=right><a href="http://www.skalinks.com/inst_manual.php">Installation support</a></td>
</tr>
</table>
</div>
<?php foreach( $_skalinks_lang['install'] as $key => $value )
	{
		?>
<table width="695" align="center" cellpadding="5" cellspacing="2" border="0">
<div class="i_header"><?php echo $_skalinks_lang['install'][$key]['title'] ?></div>
 <tr valign="middle" class=i_header2>
	 <td valign="middle" width="30%">Parameter
	</td>
	 <td valign="middle" width="30%">Value
	</td>
	<td valign="middle" width="40%">Description
	</td>
 </tr> 
 <?php foreach( $_skalinks_lang['install'][$key] as $key1 => $value1 )
	 { if ( $key1 == 'title' )
	 {
		 continue;
		 }
		 ?>
 <tr class=tr1 valign="middle">
	 <td valign="middle" width="30%"><b><?php echo $_skalinks_lang['install'][$key][$key1]['title'] ?></b>
	</td>
	 <td valign="middle" width="30%"><?php if ( $key1 == "site_description" )
		 {
			 ?>
			 <textarea cols=28 rows=6 name="<?php echo $key1 ?>" title="<?php echo $_skalinks_lang['install'][$key][$key1]['message']?>"><?php echo $_POST[$key1] ?></textarea>
	      <?php }
	     	 else
		 { ?> 
			 <input type="text" name="<?php echo $key1 ?>" title="<?php echo $_skalinks_lang['install'][$key][$key1]['message']?>" maxlength="100" size="30" <?php
		 if( $key1 == 'dir_root' )
		 {
			 if ( !$_POST['dir_root'] )
			 {
				 $dir_dest = substr( dirname( $_SERVER['SCRIPT_FILENAME'] ), 0, -7 );
				 echo "value=".$dir_dest;
			 }
			 else
			 {
				 echo "value=\"".$_POST[$key1]."\" ";
			 }
		 }
		 else if ( $key1 == 'url_root' )
		 {
			 if ( !$_POST['url_root'] )
			 {
				 echo "value=\"".substr( "http://".$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'] , 0, -8)."\" ";
			 }
			 else
			 {
				 echo "value=\"".$_POST[$key1]."\" ";
			 }			 
		 }
		 else
		 {
			 echo "value = \"".$_POST[$key1]."\" ";
		 }
		 ?> > <?php
		 }	 ?>
	</td>
	<td valign="middle" width="40%"><?php echo $_skalinks_lang['install'][$key][$key1]['desc'] ?>
	</td>
 </tr> 
 <?php }
  ?>
 
</table>
<?php }
	?>

<div class=i_btn><input class=btn_inst type="submit" value="Install" name="Install"></div>
</form>
	</div>
	<div id="footer">© Copyright SkaLinks Links Exchange Script
	</div>
</div>
</body>
</head>
</html>
