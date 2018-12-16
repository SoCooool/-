
{include file='header.tpl'}

{if $ADMIN.Name && !$_output.logout}
<div id = "Content">
	<div class="cont_left"></div>
	<div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.ctrlpanel.title}</h2></div>
<div align=left>
</div>
<div id="news_admin">
<h2>News</h2>
{foreach item=news from=$_output.news}
<b><a href="{$news.link}">{$news.title}</a></b><br>
{$news.description}<br>
{$news.pubdate}<br><br>
{/foreach}
</div>
<div id=admin_main>

<h2>{$_skalinks_lang.ctrlpanel.appr_title}</h2>
<center>
<div id="Cat">
<table class=maintext>
<tr>
<td>{$_skalinks_lang.ctrlpanel.category}</td>
<td>
{if $_output.count_appr_cat}
         
<a href="{$_skalinks_url.admin}admin_cats_list.php?show=0">{$_output.count_appr_cat}</a>
    
      {else}
      
	{$_output.count_appr_cat}
{/if}
<br>
</td>
</tr>
<tr>
<td>{$_skalinks_lang.ctrlpanel.links}</td>
<td>
{if $_output.count_appr_link}
         
<a href="{$_skalinks_url.admin}admin_links_list.php?show=1">{$_output.count_appr_link}</a>
   
      {else}
      
	 {$_output.count_appr_link}
      {/if}      
<br>
</td>
</tr>
</table>
</div>
</center>
<h2>{$_skalinks_lang.ctrlpanel.maint_title}</h2>
<center>
<div id="Cat">					
{$_skalinks_lang.ctrlpanel.link_status_desc}
<br><br><table class=maintext>
{if $_output.count_broken_link}
   
      {foreach item=key from=$_output.count_broken_link}
      
      <tr><td>
      {$key.UrlHeader}:</td><td>
      <a href="{$_skalinks_url.admin}admin_links_list.php?show=2&hcode={$key.UrlHeader}">{$key.count}</a><br></td></tr>

      {/foreach}	
      {else} {$_skalinks_lang.ctrlpanel.no_links}.
	 {/if}
</table>
<table class=maintext><tr>
<td>{$_skalinks_lang.ctrlpanel.invalid_email}</td>
{if $_output.count_invalid_email}
   
      <td><a href="{$_skalinks_url.admin}admin_links_list.php?show=3">{$_output.count_invalid_email}</a></td>
	 
    {else}
	    
	       <td>{$_output.count_invalid_email}</td>
{/if}
<br>
</tr><tr><td>{$_skalinks_lang.ctrlpanel.invalid_backurl}</td>
{if $_output.count_recip_link}
   
   <td><a href="{$_skalinks_url.admin}admin_links_list.php?show=4">{$_output.count_recip_link}</a></td>
   
    {else}
      
	<td>{$_output.count_recip_link}</td>
{/if}
</tr></table>
</div>
</center>
</div>
{if $ADMIN.Type == 2}

<form action="{$_skalinks_url.admin}index.php" method=post>
<h2>{$_skalinks_lang.ctrlpanel.db_title}</h2>
<div class="db_backup">&nbsp;<input type=submit name="create_backup" value="{$_skalinks_lang.ctrlpanel.db_backup_create}" class="btn_db">
<input type=checkbox name="ex_type" value="1" id="create_backup" ><label for="create_backup">{$_skalinks_lang.ctrlpanel.db_backup_download_hint}</label><hr />
</form>

{if $_output.backup_files}

<form action="{$_skalinks_url.admin}index.php" method=post>
<select name="backup_file"  class="set_select">
<option value="0">{$_skalinks_lang.ctrlpanel.db_backup_select_backup}</option>
{foreach item=backup_file from=$_output.backup_files}
<option value="{$backup_file}">{$backup_file}</option>
{/foreach}
</select><br />
<input type=submit name="restore_backup" value="{$_skalinks_lang.ctrlpanel.db_backup_restore}" class="btn_db">
<input type=submit name="download_backup" value="{$_skalinks_lang.ctrlpanel.db_backup_download}" class="btn_db">
<input type=submit name="delete_backup" value="{$_skalinks_lang.ctrlpanel.db_backup_delete}" class="btn_db">
</form>
<hr />
{/if}

<form enctype="multipart/form-data" action="{$_skalinks_url.admin}" method=post>
<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
<INPUT NAME="userfile" TYPE="file" size=16>
<input type="submit" name="upload_backup" value="{$_skalinks_lang.ctrlpanel.db_backup_upload}" class="btn_db">
</form>
</div>

<div class="admin_right">
<form action='{$smarty.server.PHP_SELF}' method=post>
<input class="btn" name='Build_cat' TYPE='submit' value='{$_skalinks_lang.ctrlpanel.rebuild_cat}' title='Build cat'>
<input class="btn" name='Get_pagerank' TYPE='submit' value='{$_skalinks_lang.ctrlpanel.get_all_pagerank}'><br><br>
</form>
</div>
{/if}
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>


{else}
 
  
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div id="cont_padd">
<table id="Add" border="0" cellpadding="0" cellspacing="0" align="center">
<form action='{$smarty.server.PHP_SELF}' method=post>	 
<tr>
	 <td width="20%" valign="middle">{$_skalinks_lang.ctrlpanel.admin_name}:</td>
	 <td width="80%" valign="top"><input type=text name=admin_name>
</tr>
<tr>
	 <td width="20%" valign="middle">{$_skalinks_lang.ctrlpanel.password}:</td>
	 <td width="80%" valign="top"><input type=password name=admin_password></td>
</tr>
<tr>
	<td></td>
	<td>
		<input class="btn" type=submit name=Login value='{$_skalinks_lang.ctrlpanel.login}'><br><br><br>
	</td>
</tr>
</form> 
</table>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
</div>
{/if}
  
{include file='footer.tpl'}
