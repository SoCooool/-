{assign var=type value=add_url}
{include file='header.tpl'}
<div id = "Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.add_link.title}</h2></div><br>
<table><tr><td align=left>
{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) )}
<table cellpadding=5>
<tr><td>
{show_ads id=$_output.cat_info.ID type=$type position=left}
</td></tr>
</table>
</td>
{/if}
<td class=maintext>
<u>{$_skalinks_lang.add_link.category}</u> &nbsp;
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	{if $_output.mod_rewrite}
	<a class="edit" href="{$cat_navigation.url}{$_output.cat_index_url}" >{$cat_navigation.title}</a>	
	{else}
	<a class="edit" href="{$cat_navigation.url}" >{$cat_navigation.title}</a>	
	{/if}
	
	{/foreach}

<br>
<br>	
<div class=maintext>{$_skalinks_lang.add_link.description}</div>
<form action='{$smarty.server.PHP_SEL}' method="post" name="add_url" onSubmit="return AddLinkFormValidation( this );">
<table id="Add" border="0" cellpadding="0" cellspacing="8">
  <tr>
    <td class=input_txt><br>{$_skalinks_lang.add_link.link_url}*
	</td>
    <td><br><input type="text" name="link_url" class="set_input" title="{$_skalinks_lang.add_link.url_title}" size="70" maxlength="150" value="{if $smarty.post.link_url && $_output.info_inf}{$smarty.post.link_url}{else}http://{/if}"></td>
  </tr>
{if !$_output.linkback_mod}
  <tr>
    <td class=input_txt><br>{$_skalinks_lang.add_link.link_back}*<br>
		<div class="small_text">{$_skalinks_lang.add_link.link_back_desc}</div>
</td>
    <td><br><input type="text" name="link_back" class="set_input" size="70" maxlength="150" value="{if $smarty.post.link_back && $_output.info_inf}{$smarty.post.link_back}{else}http://{/if}"></td>
  </tr>
{/if}
{if $ADMIN.Name}
<tr>
    <td class=input_txt><br>{$_skalinks_lang.add_link.link_alt_domain}<br>
	<div class="small_text">{$_skalinks_lang.add_link.link_alt_domain_desc}</div>
</td>
    <td><br><input type="text" name="link_alt_domain" class="set_input" size="60" maxlength="150" value="{if $_output.info_inf}{$smarty.post.link_back}{else}{/if}"></td>
</tr>
{/if}
  <tr>
    <td colspan="2"><br>{$_skalinks_lang.add_link.link_title_desc}</td>
  </tr>
  <tr>
    <td class=input_txt><br>{$_skalinks_lang.add_link.link_title}*</td>
    <td><br><input type="text" name="link_title" title="{$_skalinks_lang.add_link.tit_title}" class="set_input" size="60" maxlength="100" value="{if $smarty.post.link_title && $_output.info_inf}{$smarty.post.link_title}{/if}"></td>
  </tr>
  <tr>
    <td valign="top"  class=input_txt><br><br>{$_skalinks_lang.add_link.link_description}*<br>
</td>
    <td><br><textarea rows="6" cols="45" name="link_description" title="{$_skalinks_lang.add_link.desc_title}">{if $smarty.post.link_description && $_output.info_inf}{$smarty.post.link_description}{/if}</textarea></td>
  </tr>
  <tr>
    <td valign="top"  class=input_txt><br><br>{$_skalinks_lang.add_link.link_full_description}<br>
</td>
    <td><br><textarea rows="10" cols="50" name="link_full_description" title="{$_skalinks_lang.add_link.desc_full_title}">{if $smarty.post.link_full_description && $_output.info_inf}{$smarty.post.link_full_description}{/if}</textarea></td>
  </tr>

<tr> 
    <td class=input_txt><br>{$_skalinks_lang.add_link.link_email}*</td>
    <td><br><input type="text" name="link_email" title="{$_skalinks_lang.add_link.email_title}" class="set_input" size="50" maxlength="100" value="{if $smarty.post.link_email && $_output.info_inf}{$smarty.post.link_email}{/if}"></td>
  </tr>
  <tr>
  <td>
    <input type=hidden name=cat value={$smarty.get.cat|default:$smarty.post.cat}>
</td> 
    <td><br><input class="btn" type="submit" value="{$_skalinks_lang.add_link.submit_link}" name="Form_submitted"></td>
  </tr>
  
</table>
<input type=hidden name="letter_id" value="{$_output.letter_template.ID}">
{if ( $ADMIN && ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $_output.cat_info.Editor_id ) ) ) }
<table>
<tr>
<td width=30%>
	{$_skalinks_lang.add_link.letter_temp}
</td>
<td width=70%>
	<textarea name="template_text" cols=45 rows=10 >
	{$_output.letter_template.Template}
	</textarea>
</td>
</tr></table>
{/if}
</form>
{if ( $ADMIN && ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $_output.cat_info.Editor_id ) ) )}
<div id="button_links_bg">
<a class="bottom_links" href="{$_skalinks_url.admin}add_ads.php?type=add_url"><b>{$_skalinks_lang.cat.add_ads}</b></a>
<a class="bottom_links" href="{$_skalinks_url.admin}select_template.php" target="_blank" onClick="window.open(this.href,'newwindow','resizable=yes,scrollbars=yes,scrolling=yes,width=640,height=480');return false;"><b>{$_skalinks_lang.let_tem.select_template}</b></a> 
</div>
{/if}
</td></tr>
</table>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>




{include file='footer.tpl'}
