{include file='header.tpl'}
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div id="cont_padd">
<table id="Add" border="0" cellpadding="0" cellspacing="0" align="center">
<tr>
	<td colspan=2>
		<div class="cen"><h2>{$_skalinks_lang.register_editor.title}</h2></div>
	</td>
</tr>
<form action='{$smarty.server.PHP_SELF}' method=post>	 
<tr>
	 <td width="20%" valign="middle">{$_skalinks_lang.register_editor.admin_name}:</td>
	 <td width="80%" valign="top"><input type=text name="admin_name" value="{$smarty.post.admin_name}">
</tr>
<tr>
	 <td width="20%" valign="middle">{$_skalinks_lang.register_editor.password}:</td>
	 <td width="80%" valign="top"><input type=text name="admin_password" value="{$smarty.post.admin_password}">
</tr>
<tr>
	<td width="20%" valign="middle">{$_skalinks_lang.register_editor.email}:</td>
	<td width="80%" valign="top"><input type=text name="admin_email" value="{$smarty.post.admin_email}"></td>
</tr>
<tr>
	<td></td>
	<td>
	<input class="btn" type=submit name="Register" value='{$_skalinks_lang.register_editor.register_btn}'><br><br><br>
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

{include file='footer.tpl'}
