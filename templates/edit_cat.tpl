
{include file='header.tpl'}


{if $ADMIN}
   
      
<!--CATEGORY NAVIGATION BLOCK-->
<div id = "Cat_navigation">
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{if !$_output.cat_navigation}
	>> root
	{/if}
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	{if $smarty.foreach.cat_navigation.last } 
	{$cat_navigation.title}
	{else}
	<a class = 'edit' href = '{$cat_navigation.url}' >{$cat_navigation.title}</a>	
	{/if}
	{/foreach}
<br>
</div>
<div id = "Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<table id="Add" cellpadding="0" cellspacing="0" border="0" bordercolor="#000">
 <tr>
	 <td width="40%"  class="input_txt"><br>{$_skalinks_lang.edit_cat.parent_cat}</td>
	 <td colspan="2"><br>
	 	{if !$_output.cat_info.ID}
		
		   root
		
		{else}
		
   		   <a href='{$_output.this_cat_url}'>{$_output.cat_info.Title}</a>
		{/if}
		
    
    </td>
 </tr>  
 <tr>
	 <td width="40%" class="input_txt"><br>{$_skalinks_lang.edit_cat.change_parent_cat}</td>
	 <td width="35%"><br><form name=cat_choise action='{$smarty.server.PHP_SELF}' method=get>
			        <input type='hidden' name='id' value='{$smarty.get.id}'>
			        <input name='related_cat' type='hidden' value='{$smarty.get.related_cat}'>
				<input name='virtual_cat' type='hidden' value='{$smarty.get.virtual_cat}'>
				<select name='cat' onChange='document.cat_choise.submit()'>
				<option value=''></option>
				{if $_output.cat_info.ID}
				
				<option value='{$_output.cat_info.Parent}'>../</option>
				{/if}
				{foreach item=categories from=$_output.categories}
				
				<option value='{$categories.ID}'>{$categories.title}{if $ADMIN.Type != 2 && $ADMIN.ID == $categories.Editor_id} ({$_skalinks_lang.edit_cat.onwer}){/if}</option><br>
				{/foreach}
				
	 </select>
	 </form>
	 </td>
	 <td width="25%" align="left"><br>
	 <form action='{$smarty.server.PHP_SELF}' method=get>
	 <input name=virtual_cat type=hidden value='{$smarty.get.virtual_cat}'>
	 <input name=related_cat type=hidden value='{$smarty.get.related_cat}'>
	 <input name=id type=hidden value='{$smarty.get.id}' >
	 <input type=hidden name=cat value='{$smarty.get.cat}'>
	 <input class=btn type="submit" value="add" name="Cat_submitted">
	 </form>
	 </td>
	 
  </tr>
{if $ADMIN.Type == 2}
  <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.vir_cat}
	 </td>
	 <td colspan="2"><br>
	  
		{if !$_output.vir_cat_info.ID}
		
		   root
		
		{else}
		
   		   <a href='{$_output.this_vir_cat_url}'>{$_output.vir_cat_info.Title}</a>
		{/if}
		
    
    </td>
 </tr>  
 <tr>
	 <td width="25%" class="input_txt"><br>{$_skalinks_lang.edit_cat.add_vir_cat}</td>
	 <td width="25%"><br><form name=vir_cat_choise action='{$smarty.server.PHP_SELF}' method=get>
			        <input type='hidden' name='id' value='{$smarty.get.id}'>
			        <input name='cat' type='hidden' value='{$smarty.get.cat}'>
				<input name='related_cat' type='hidden' value='{$smarty.get.related_cat}'>
				<select name='virtual_cat' onChange='document.vir_cat_choise.submit()'>
				<option value=''></option>
				{if $_output.vir_cat_info.ID}
				
				<option value='{$_output.vir_cat_info.Parent}'>../</option>
				{/if}
				{foreach item=vir_categories from=$_output.vir_categories}
				
				<option value='{$vir_categories.ID}'>{$vir_categories.title}</option>
				
				{/foreach}
				</select>
				</form>
			
				</td>
				<td width="50%" align="left"><br>
				<form action='{$smarty.server.PHP_SELF}' method=get>
				<input name=related_cat type=hidden value='{$smarty.get.related_cat}'>
			        <input name=virtual_cat type=hidden value='{$smarty.get.virtual_cat}'>
			        <input name=id type=hidden value='{$smarty.get.id}' >
			        <input name=cat type=hidden value='{$smarty.get.cat}'>
	         	        <input class=btn type="submit" value="add" name="Vir_cat_submitted">
				</form>
				</td>
  </tr>

  {if $_output.list_vir_categories}
       
	<tr><td class="input_txt">{$_skalinks_lang.edit_cat.cur_vir_cat}</td>
	<td colspan='2'><form action='{$smarty.get.PHP_SELF}' method=get>
	<input type=hidden name=id value='{$smarty.get.id}'>
	<input type=hidden name=cat value='{$smarty.get.cat}'>
	<select name='delete_vir_cat'>
	<option value=''></option>
	{foreach item=list_vir_categories from=$_output.list_vir_categories}
	
	   <option value='{$list_vir_categories.ID}'>{$list_vir_categories.Title}</option>
	{/foreach}
	</select>
	<input class='btn' type=submit value='Delete' name='Vir_cat_deleted'></form></td>
	</tr>
	{/if}	
    <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.rel_cat}</td>
	 <td colspan="2"><br>
	   
		{if !$_output.rel_cat_info.ID}
		
		   root
		
		{else}
		
   		   <a href='{$_output.this_rel_cat_url}'>{$_output.rel_cat_info.Title}</a>
		{/if}
		
    
    </td>
    </tr>
	 <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.add_rel_cat}</td>
	 <td><br><form name=rel_cat_choise action='{$smarty.server.PHP_SELF}' method=get>
		                <input type='hidden' name='id' value='{$smarty.get.id}'>
	                        <input name='cat' type='hidden' value='{$smarty.get.cat}'>
				<input name='virtual_cat' type='hidden' value='{$smarty.get.virtual_cat}'>
				<select name='related_cat' onChange='document.rel_cat_choise.submit()'>
				<option value=''></option>
				{if $_output.rel_cat_info.ID}
				
				<option value='{$_output.rel_cat_info.Parent}'>../</option>
				{/if}
				{foreach item=rel_categories from=$_output.rel_categories}
				
				<option value='{$rel_categories.ID}'>{$rel_categories.title}</option><br>
				{/foreach}
				
				</select>
				</form>
	  </td>
				<td align="left"><br>
				<form action='{$smarty.get.PHP_SELF}' method=get>
			        <input name=related_cat type=hidden value='{$smarty.get.related_cat}'>
			        <input name=virtual_cat type=hidden value='{$smarty.get.virtual_cat}'>
			        <input name=cat type=hidden value='{$smarty.get.cat}'>
			        <input name=id type=hidden value='{$smarty.get.id}' >
				<input class=btn type="submit" value="add" name="Rel_cat_submitted">
				</form>
				</td>
				
  </tr>
   	{if $_output.list_rel_categories}
       
	<tr><td class="input_txt"><br>{$_skalinks_lang.edit_cat.cur_rel_cat}</td>
	<td><br><form action='{$smarty.server.PHP_SELF}' method=get>
	<input type=hidden name=id value='{$smarty.get.id}'>
	<input type=hidden name=cat value='{$smarty.get.cat}'>
	<select name='delete_rel_cat'>
	<option value=''></option>
	{foreach item=list_rel_categories from=$_output.list_rel_categories}
	
	   <option value='{$list_rel_categories.ID}'>{$list_rel_categories.Title}</option>
	{/foreach}
	</select></td>
	<td valign='bottom'><input class=btn type=submit value='Delete' name='Rel_cat_deleted'></form></td>
	</tr>
	{/if}
{/if}	
<form action='{$smarty.server.PHP_SELF}' method=get OnSubmit="return EditCatFormValidation( this );">
<input type=hidden name=id value='{$smarty.get.id}'>
<input type=hidden name=virtual_cat value='{$smarty.get.virtual_cat}'>
<input type=hidden name=related_cat value='{$smarty.get.related_cat}'>
<input type=hidden name=cat value='{$smarty.get.cat}'>   
  <tr>
    <td class="input_txt"><br>{$_skalinks_lang.edit_cat.title}</td>
	 <td colspan="2"><br><input type="text" name="title" title="{$_skalinks_lang.edit_cat.tit_title}" size="40" maxlength="80" value="{$_output.category.Title}"></td>
  </tr>
  <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.dir}</td>
	 <td colspan="2"><br><input type="text" name="dir" title="{$_skalinks_lang.edit_cat.dir_title}" size="40" maxlength="80" value='{$_output.category.dir}'></td>
  </tr>
  <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.topdesc}</td>
	 <td colspan="2"><br><textarea name="topdesc" title="{$_skalinks_lang.edit_cat.dir_topdesc}" cols="40" rows="7" >{$_output.category.TopText}</textarea></td>
  </tr>
  <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.bottomdesc}</td>
	 <td colspan="2"><br><textarea name="bottomdesc" title="{$_skalinks_lang.edit_cat.dir_bottomdesc}" cols="40" rows="7" >{$_output.category.BottomText}</textarea></td>
  </tr>
  <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.metadesc}</td>
	 <td colspan="2"><br><textarea name="metadesc" title="{$_skalinks_lang.edit_cat.dir_metadesc}" cols="40" rows="7" >{$_output.category.meta_desc}</textarea></td>
  </tr>
{if $ADMIN.Type == 2}
 <tr>
	 <td class="input_txt"><br>{$_skalinks_lang.edit_cat.editor}</td>
	 <td colspan="2"><br>
	 <select name="editor">
	 <option value="0">{$_skalinks_lang.edit_cat.none_editor}</option>
	 {foreach item=editor from=$_output.editors}
	 <option value="{$editor.ID}" {if $editor.ID == $_output.category.editor_info.ID} selected {/if}>{$editor.Name}</option>
	 {/foreach}
	 </select></td>
  </tr>
{else}
	 <input type="hidden" name="editor" value="{$_output.category.editor_info.ID}">
{/if}
  <tr>
		<td></td>
	  <td align=left><br><input class=btn type="submit" value="{$_skalinks_lang.edit_cat.submit_cat}" name="Form_submitted">
	  <input class=btn type="submit" value={if !$_output.category.Status}"{$_skalinks_lang.edit_cat.submit_disappr_cat}"{else}"{$_skalinks_lang.edit_cat.submit_appr_cat}" {/if} name={if !$_output.category.Status}"Cat_disapprove"{else}"Cat_approve"{/if}>
	  </td>
	  </form>
  </tr>
</table>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{/if}

{include file='footer.tpl'}






 

