
{include file='header.tpl'}
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.let_tem.title}</h2></div>
<form action="{$smarty.server.PHP_SELF}" method=post>
{if $_output.all_templates}
<div id=help_title><b>{$_skalinks_lang.let_tem.cur_tem}</b></div><br>
<table align=center cellspacing=0 cellpadding=0 border=0>
{foreach item=template from=$_output.all_templates}
<input type=hidden name=Tem_num[] value="{$template.ID}">
<tr class="{cycle values="tbl_color1,tbl_color2"}"><td align=middle>
<input type=checkbox name=Templates_arr[] value="{$template.ID}" id="{$template.ID}"></td><td><textarea rows=10 cols=60 name="Letter_tem[{$template.ID}]" onFocus="document.getElementById('{$template.ID}').checked = true;">{$template.Template}</textarea><br><table align=middle><tr></tr></table></td></tr>
{/foreach}
</table>
<table align=center>
<tr><td>
<div class=maintext>{$_skalinks_lang.let_tem.with_selected}</div>
<input class="btn" type=submit name="Change_Template" value="{$_skalinks_lang.let_tem.modify_tem}">
<input class="btn" type=submit name="Delete_Template" value="{$_skalinks_lang.let_tem.delete_tem}">
</td></tr></table>
<br>
</center>
{/if}
<center>
<br>
<textarea rows=10 cols=60 name="New_Template"></textarea>
<br>
<input class="btn" type=submit name="Add_Template" value="{$_skalinks_lang.let_tem.add_tem}">
</center>
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{include file='footer.tpl'}
