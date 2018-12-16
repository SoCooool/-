{assign var=type value=add_cat}

{include file='header.tpl'}
<div id = "Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.add_cat.title}</h2></div><br>
	<table><tr><td align=left>
	<table cellpadding=5>
	<tr><td>
{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) )}
{show_ads id=$_output.cat_info.ID type=$type position=left}
{/if}
</td></tr>
	</table>
	</td>
	<td> 

<div class="maintext" ><u>{$_skalinks_lang.add_cat.category}</u> &nbsp;

	
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	{if $_output.mod_rewrite}
	<a class="edit" href="{$cat_navigation.url}{$_output.cat_index_url}" >{$cat_navigation.title}</a>	
	{else}
	<a class="edit" href="{$cat_navigation.url}" >{$cat_navigation.title}</a>	
	{/if}
	{/foreach}
	{if !$_output.cat_navigation}
	
			>> root
	{/if}
<br>
<br>
{$_skalinks_lang.add_cat.description}</div><br><br>
<form action='{$smarty.server.PHP_SELF}' method="post" OnSubmit="return AddCatFormValidation( this );">
<table id="Add" border="0" cellpadding="0" cellspacing="7">
  <tr>
	 <td class=input_txt><br>{$_skalinks_lang.add_cat.cat_dir}</td>
	 <td><br> <input type="text" name="title" value="{$smarty.post.title}" title="{$_skalinks_lang.add_cat.tit_title}" class="set_input" size="40" maxlength="80"></td>
  </tr>
   <tr>
	 <td class=input_txt>{$_skalinks_lang.add_cat.cat_title}<br>
	<div class="small_text">{$_skalinks_lang.add_cat.cat_title_more}</div>
	</td>
	 <td><input type="text" name="dir" value="{$smarty.post.dir}" title="{$_skalinks_lang.add_cat.dir_title}" class="set_input" size="40" maxlength="40"></td>
  </tr>
<tr>
	<td class="input_txt">{$_skalinks_lang.add_cat.cat_topdesc}
		<div class="small_text">{$_skalinks_lang.add_cat.cat_topdesc_more}</div>
	</td>
	<td><textarea rows="7" cols="40" name="topdesc" title="{$_skalinks_lang.add_cat.topdesc_title}">{if $smarty.post.topdesc && $_output.info_inf}{$smarty.post.topdesc}{/if}</textarea></td>

</tr>
<tr>
	<td class="input_txt">{$_skalinks_lang.add_cat.cat_bottomdesc}
		<div class="small_text">{$_skalinks_lang.add_cat.cat_bottomdesc_more}</div>
	</td>
	<td><textarea rows="7" cols="40" name="bottomdesc" title="{$_skalinks_lang.add_cat.bottomdesc_title}">{if $smarty.post.bottomdesc && $_output.info_inf}{$smarty.post.bottomdesc}{/if}</textarea></td>

</tr>
<tr>
	<td class="input_txt">{$_skalinks_lang.add_cat.cat_metadesc}
		<div class="small_text">{$_skalinks_lang.add_cat.cat_metadesc_more}</div>
	</td>
	<td><textarea rows="7" cols="40" name="metadesc" title="{$_skalinks_lang.add_cat.metadesc_title}">{if $smarty.post.metadesc && $_output.info_inf}{$smarty.post.metadesc}{/if}</textarea></td>

</tr>
{if $ADMIN.Type == 2}
<tr>
	 <td class=input_txt>{$_skalinks_lang.add_cat.cat_editor}</td>
	 <td><select name="editor" class="set_select">
		<option value="0">{$_skalinks_lang.add_cat.none_editor}</option>
		{foreach item='editor' from=$_output.editors}
		<option value="{$editor.ID}">{$editor.Name}</option>
		{/foreach}
		</select></td>
  </tr>
{/if}
     <tr>
	 <td><br>
	 <input type=hidden name=cat value={$smarty.get.cat|default:$smarty.post.cat}>
	 <input class=btn type="submit" value="{$_skalinks_lang.add_cat.submit_cat}" name="Form_submitted"></td>
  </tr>
</table>
</form>
{if $ADMIN}
<div id="button_links_bg">
<a class="bottom_links" href="{$_skalinks_url.admin}add_ads.php?type=add_cat">{$_skalinks_lang.cat.add_ads}</a>
</div>
{/if}
</tr>
</table>
</div>
<div class="cont_left_bottom"></div>
<div class="cont_center_bottom"></div>
<div class="cont_right_bottom"></div>
</div>
{include file='footer.tpl'}
