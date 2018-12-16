{include file='header.tpl'}
<!--CATEGORY NAVIGATION BLOCK-->
<div id = "Cat_navigation">
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{if !$_output.cat_navigation}
	>> root
	{/if}
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	<a class = 'edit' href = '{$cat_navigation.url}' >{$cat_navigation.title}</a>	
	{/foreach}
</div>
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div id=cen><h2>{$_skalinks_lang.add_template.title}</h2></div><br>
<table cellspacing=0 cellpadding=4 align=center border=0>
<form action="{$smarty.server.PHP_SELF}" method=post>
{foreach item=template from=$_output.all_templates}
<tr class="{cycle values="tbl_color1,tbl_color2"}">
<td><input type=radio name=Template_id value="{$template.ID}"></td><td><textarea cols=40 rows=8>{$template.Template}</textarea></td></tr>
{/foreach}
</table>
<br>
<br>
{if $smarty.get.cat_id != -1}
<input class="btn" type=submit name="Add_Template" value="{$_skalinks_lang.add_template.submit_tem}">
<input type=hidden name=cat_id value="{$smarty.get.cat_id|default:$smarty.post.cat_id}">

<br>
{/if}
{if $_output.cat_template}
<br>
<u>{$_skalinks_lang.add_template.cur_templates}</u><br><br><br>
<table cellspacing=0 cellpadding=4 align=center border=0>
<tr class="{cycle values="tbl_color1,tbl_color2"}">
<td><textarea cols=40 rows=8>{$_output.cat_template.Template}</textarea></td></tr>
</table>
<input type=hidden name="Template_id" value="{$_output.cat_template.ID}">
<input class="btn" type=submit name=Delete_Template value="{$_skalinks_lang.add_template.submit_del}">
{/if}
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>


{include file='footer.tpl'}
