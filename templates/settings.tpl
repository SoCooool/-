{include file='header.tpl'} 
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2><b>{$_skalinks_lang.settings.title}</b></h2></div>

<div>
<table class="sec_name">
<tr>
{assign var=sec_count value=1}
{foreach key=s_name_key item=s_name from=$_skalinks_lang.settings_section}
{if $sec_count == 3}
{assign var=sec_count value=1}
<td>
<a class="cat2" href="{$_skalinks_url.admin}settings.php?s_name={$s_name_key}">{$s_name}</a>
</td>
</tr><tr>
{else}
{assign var=sec_count value=$sec_count+1}
<td>
<a class="cat2" href="{$_skalinks_url.admin}settings.php?s_name={$s_name_key}">{$s_name}</a>
</td>
{/if}
{/foreach}
</table>
</div>

{if $_output.s_name == 'let_template' }
<div id="help_title">{$_skalinks_lang.settings.var_table_name}</div>
<table class="help_name" width="500px" border="0" cellspacing="2" cellpadding="3" align=center>
  <tr class="help_name_cap">
    <td>{$_skalinks_lang.settings.table_name}</td>
    <td>{$_skalinks_lang.settings.table_description}</td>
  </tr>
  <tr>
    <td colspan=2>&nbsp;</td>
  </tr>
  {foreach item=variable from=$_skalinks_lang.letters_var}
  <tr class="{cycle values="tbl_color1,tbl_color2"}">
    <td width=30%>{$variable.name|replace:"<":"&lt;"|replace:">":"&gt;"}</td>
    <td width=70%>{$variable.desc}</td>
  </tr>
  {/foreach}
</table>
{elseif $_output.s_name == 'dis_url'}
<div id="help_title">{$_skalinks_lang.settings.var_mod_rewrite_table_name}</div>
<table class="help_name" width="500px" border="0" cellspacing="2" cellpadding="3" align=center>
  <tr class="help_name_cap">
    <td>{$_skalinks_lang.settings.table_name}</td>
    <td>{$_skalinks_lang.settings.table_description}</td>
  </tr>
  <tr>
    <td colspan=2>&nbsp;</td>
  </tr>
  {foreach item=variable from=$_skalinks_lang.mod_rewrite_vars}
  <tr class="{cycle values="tbl_color1,tbl_color2"}">
    <td width=30%>{$variable.name|replace:"<":"&lt;"|replace:">":"&gt;"}</td>
    <td width=70%>{$variable.desc}</td>
  </tr>
  {/foreach}
</table>
{/if}
<table class="help_tbl" id="Add" border="0" cellpadding="0" cellspacing="0">
<form action="{$_skalinks_url.admin}settings.php?s_name={$_output.s_name}" name="settings" method=post> 
	{foreach item=key from=$_output.settings}
       	 <tr class="{cycle values="tbl_color1,tbl_color2"}">
	 <td width="350px">{$key.mean}</td>
	 <td width="450px">
	 {if $key.type == 'text'}
		{if $key.Name == 'listing_url_view'}
		http://www.your_site.com/dir/<input type="text" id="url_set1" name="settings[{$key.Name}]" class="set_input" size="30" maxlength="50" value="{$key.VALUE}">	
		{elseif $key.Name == 'cat_pages_view'}
		http://www.your_site.com/dir/category/<input type="text" id="url_set2" name="settings[{$key.Name}]" class="set_input" size="23" maxlength="50" value="{$key.VALUE}">	
		{elseif $key.Name == 'cat_index_url'}
		http://www.your_site.com/dir/category/<input type="text" id="url_set3" name="settings[{$key.Name}]" class="set_input" size="10" maxlength="50" value="{$key.VALUE}">	
		{else}
		<input type="text" name="settings[{$key.Name}]" class="set_input" size="50" maxlength="50" value="{$key.VALUE}">
		{/if}
	 {elseif $key.type == 'area'}
	 <textarea name="settings[{$key.Name}]" cols=48 rows=10>{$key.VALUE}</textarea>
	 {elseif $key.type == 'select'}
	 {if $key.Name == 'mod_rewrite'}
	 <select id="mod_rewrite" name="settings[{$key.Name}]" class="set_select" onclick="SetModRewrite()">
	 {else}
	 <select name="settings[{$key.Name}]" class="set_select">
	 {/if}
	 {foreach from=$key.Range item=range}
	 	{html_options values=$range.0 selected=$key.VALUE output=$range.1}
	 {/foreach}
	 </select>
	 {/if}
	 </td>
	 </tr>  
	{/foreach}
{if $_output.s_name}
    <tr>
    <td><br><input class="btn" type=submit name="Change_settings" value="{$_skalinks_lang.settings.submit_settings}"></td>
	 <td></td>
    </tr>
{/if}
</table>
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{include file='footer.tpl'}

