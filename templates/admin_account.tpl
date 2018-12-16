{include file='header.tpl'}
<div id='Content'><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.editors.title}</h2></div>
<form action="{$smarty.server.PHP_SELF}" name="cur_editors" method=post>
<table width="30%" class=maintext align=center>
		<tr>
		<td colspan=3 align=left><b>{$_skalinks_lang.editors.cur_editors}</b><br><br></td>
		</tr>
		<tr>
		<td class='ska_table'>&nbsp;</td>
		<td class='ska_table'><b>{$_skalinks_lang.editors.name}</b></td>
		<td class='ska_table'><b>{$_skalinks_lang.editors.email}</b></td>
		<td class='ska_table'><b>{$_skalinks_lang.editors.type}</b></td>
		<td class='ska_table'><b>{$_skalinks_lang.editors.new_pass}</b></td>
		</tr>
	
    {foreach item=key from=$_output.admins}
    
	    <tr><td class='ska_table'>
	    <input type=checkbox name=admin_arr[] value='{$key.ID}'></td><td class='ska_table'><input type="text" class="set_input" name="editor_name[{$key.ID}]" maxlength="50" value="{$key.Name}"></td><td class='ska_table'><input type="text" class="set_input" name="editor_email[{$key.ID}]" value="{$key.Email}"></td>
<td class="ska_table"><select name="editor_type[{$key.ID}]" class="set_select" >
	<option value="1" {if $key.Type == 1} selected {/if}>{$_skalinks_lang.editors.type_editor}</option>
	<option value="2" {if $key.Type == 2} selected {/if}>{$_skalinks_lang.editors.type_seditor}</option>
</td><td class='ska_table'><input type="text" class="set_input" name="editor_new_pass[{$key.ID}]" maxlength="15" value=""></td></tr><br>
    {/foreach}
	    <tr><td class='ska_table'><input type=checkbox OnClick=" setCheckboxes( 'cur_editors', this.checked ) ; " ></td>
	    <td align=left>
	    <input class=btn type=submit name=save_admin value={$_skalinks_lang.editors.submit_save} title='{$_skalinks_lang.editors.submit_del}'>
	    <input class=btn type=submit name=delete_admin value={$_skalinks_lang.editors.submit_del} title='{$_skalinks_lang.editors.submit_del}'>
	    </td></tr></table>
	    <br><br><b>{$_skalinks_lang.editors.add_editor}</b><br>
		 <table id="Add" width=35% align=center>
		 
		 <tr><td width="10%" align="left">{$_skalinks_lang.editors.name}: </td> 
			  <td align="left" width="90%"><input type=text name=admin_name class="set_input" value="{$smarty.post.admin_name|default:''}"><br></td></tr>
	    <tr><td width="10%"align="left">{$_skalinks_lang.editors.passwd}: </td>
			  <td align="left" width="90%"><input type=text name=admin_password class="set_input" value="{$smarty.post.admin_password|default:''}"><br></td></tr>
	    <tr><td width="10%" align="left">{$_skalinks_lang.editors.email}: </td>
			  <td align="left" width="90%"><input type=text name=admin_email class="set_input" value="{$smarty.post.admin_email|default:''}"><br></td></tr>
	    <tr><td width="10%" align="left">{$_skalinks_lang.editors.type}: </td>
			  <td align="left" width="90%">
				<select name="admin_type" class="set_select" >
				<option value="1">{$_skalinks_lang.editors.type_editor}</option>
				<option value="2">{$_skalinks_lang.editors.type_seditor}</option>
				</select>
				<br></td></tr>
	    </table>
		 <input class=btn type=submit name=Add_admin value='{$_skalinks_lang.editors.submit_addeditor}' title='{$_skalinks_lang.editors.submit_addeditor}'>
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{include file='footer.tpl'}
