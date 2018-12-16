
{include file='header.tpl'}


{if $ADMIN}
<div class="for_banner"> 
<form action="{$smarty.server.PHP_SELF}" method=get >
<input type='hidden' name='id' value='{$smarty.get.id}'> 
<input type=hidden name=cat value='{$smarty.get.cat}'>
<table id="Add" align=center border="0" cellpadding="0" cellspacing="0">
<tr align=center>
<td><input type="text" size=40 name="url" value="{$_output.url_search}"><input class=btn type=submit name="Search" value="{$_skalinks_lang.search_url.submit_search}"></td>
</tr> 
<tr align=center><td>
<br>
<input id=1 type=checkbox name="search_type[]" value="URL" {if $_output.search_type}{foreach item=search_type from=$_output.search_type}{if $search_type=="URL"} checked {/if}{/foreach}{else} checked {/if}><label for=1>{$_skalinks_lang.search_url.type_url}</label>
<input id=2 type=checkbox name="search_type[]" value="Title" {foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}checked{/if}{/foreach}><label for=2>{$_skalinks_lang.search_url.type_title}</label>
<input id=3 type=checkbox name="search_type[]" value="Description" {foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}checked{/if}{/foreach}><label for=3>{$_skalinks_lang.search_url.type_desc}</label>
</td></tr>
<tr>
<td align=left>
{if $_output.linking_page > 1}
<a href="{$_skalinks_url.admin}edit_url.php?Search=Search&url={$smarty.get.url|default:$smarty.post.url}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}&linking_page={$_output.linking_page-1}">{$_skalinks_lang.link_nav.previous}</a>
{/if}
</td>
<td align=right>
{if ( $_output.count_links > 1 ) && ( $_output.linking_page < $_output.count_links ) }
<a href="{$_skalinks_url.admin}edit_url.php?Search=Search&url={$smarty.get.url|default:$smarty.post.url}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}&linking_page={$_output.linking_page+1}">{$_skalinks_lang.link_nav.next}</a>
{/if}
</td>
</table>
</form>
</div>

<div id = "Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<table id="Add" border="0" cellpadding="0" cellspacing="5">
 <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.category}</b></td>
	 <td><br>
	 	{if !$_output.cat_info.ID}
		   root
		{else}
		   <a href='{$_output.this_cat_url}'>{$_output.cat_info.Title}</a>
		{/if}
		
    
    </td>
 </tr>  
 <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.change_cat}</b></td>
	 <td><br>
	 	<form name=cat_link_choise action="{$smarty.server.PHP_SELF}" method=get>
		<input type="hidden" name="id" value="{$smarty.get.id}">
		<input type="hidden" name="linking_page" value="{$_output.linking_page}">
		<input type="hidden" name="url" value="{$_output.url_search}">
		{foreach item=search_type from=$_output.search_type}{if $search_type=="URL"}<input type="hidden" name="search_type[]" value="URL">{/if}{/foreach}
		{foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}<input type="hidden" name="search_type[]" value="Title">{/if}{/foreach}
		{foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}<input type="hidden" name="search_type[]" value="Description">{/if}{/foreach}
	 	<select name="cat" onChange="document.cat_link_choise.submit()">
		<option value=""></option>
		{if $_output.cat_info.ID}
		
		<option value='{$_output.cat_info.Parent}'>../</option>
		{/if}
		{foreach item=category from=$_output.category}
		
		<option value='{$category.ID}'>{$category.title}{if $ADMIN.Type != 2 && $ADMIN.ID == $category.Editor_id} ({$_skalinks_lang.edit_link.owner}){/if}</option><br>
		{/foreach}
	 
	 </select>
	</form>
         </td>
  </tr>
  <form action="{$smarty.server.PHP_SELF}" method=post OnSubmit="return EditLinkFormValidation( this );">
     <input type="hidden" name="id" value="{$smarty.get.id}">
     <input type="hidden" name="cat" value="{$smarty.get.cat}">
     <input type="hidden" name="url" value="{$_output.url_search}">
     <input type="hidden" name="linking_page" value="{$_output.linking_page}">
    {foreach item=search_type from=$_output.search_type}{if $search_type=="URL"}<input type=hidden name="search_type[]" value="URL">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}<input type=hidden name="search_type[]" value="Title">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}<input type=hidden name="search_type[]" value="Description">{/if}{/foreach}
  <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_url}</b></td>
	 <td><br>
<input type="text" name="Link" title="{$_skalinks_lang.edit_link.url_title}"  size="50" maxlength="150" value="{$_output.link.URL}">
    </td>
 </tr>  
    </tr>
   <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_title}</b></td>
	 <td><br><input type="text" name="Title" title="{$_skalinks_lang.edit_link.tit_title}"  size="50" maxlength="100" value="{$_output.link.Title}"></td>
  </tr>
   <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_description}</b></td>
	 <td><br><textarea name="Description" title="{$_skalinks_lang.edit_link.desc_title}" rows="5" cols="48" >{$_output.link.Description}</textarea>
  </tr>
    <tr>
	 <td valign="top"><br><br><br><b>{$_skalinks_lang.edit_link.link_extend_description}</b><br><br>
	 <b>Rank:&nbsp;</b>
	 {if ( ( $ADMIN.Type == 2 ) || ( $_output.cat_info.Editor_id == $ADMIN.ID ) )}
	 <select name=Rank>
	 {assign var=rank_val value=$_output.link.Rank}
	 {foreach from=$_output.Ranks item=rank_id}
		{html_options values=$rank_id selected=$rank_val output=$rank_id}
	 {/foreach}
	 </select>
	 {else}
	 {$_output.link.Rank}
	 {/if}
	 <br><br valign="top"><b>{$_skalinks_lang.edit_link.link_page} : {$_output.page}</b>&nbsp;
 	 <br><br><b>{$_skalinks_lang.edit_link.http_status} : {$_output.link.UrlHeader}</b>&nbsp;
         <br><br><b>{$_skalinks_lang.edit_link.editor_name} : {if $_output.link.Name}{$_output.link.Name}{else}{$_skalinks_lang.edit_link.no_editor}{/if}</b>&nbsp;
         <br><br><b>{$_skalinks_lang.edit_link.creator_name} {if $_output.link.AddedBy}{$_output.link.Creator_Name}{else}{$_skalinks_lang.edit_link.creator_visitor}{/if}</b>&nbsp;
	 </td>
	 <td>
	 <textarea rows="5" cols="48" name="Full_Description" title="{$_skalinks_lang.edit_link.extend_desc_title}">{$_output.link.Full_Description}</textarea>
    </td>
     
   <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_back}</b></td>
	 <td><br><input type="text" name="LinkBack" size="40" maxlength="150" value='{$_output.link.LinkBackURL}'>
	    <input type=checkbox name=LinkBackURLValid {if $_output.link.LinkBackURLValid == 'y'}  "checked" {else} "" {/if}> </td>
  </tr>
 <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_alt_domain}</b></td>
	 <td><br><input type="text" name="LinkAltDomain" size="40" maxlength="150" value='{$_output.link.Alt_domain}'>
	    
  </tr>
     <tr>
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.link_email}</b></td>
	 <td><br><input type="text" name="Email" title="{$_skalinks_lang.edit_link.email_title}" size="40" maxlength="100" value='{$_output.link.Email}'>
	    <input type=checkbox name=EmailValid {if $_output.link.EmailValid == 'y'}  "checked" {else} "" {/if}> </td>
  </tr>
  <tr>
	<tr>
	<td></td>
   <td colspan="2" align=left>{if ( ( $ADMIN.Type == 2 ) || ( $_output.cat_info.Editor_id == $ADMIN.ID ) || ( $_output.link.AddedBy == $ADMIN.ID && !$_output.link.Status ) )}<input class=btn type="submit" value={if !$_output.link.Status}  "{$_skalinks_lang.edit_link.submit_disappr_link}" {else} "{$_skalinks_lang.edit_link.submit_appr_link}" {/if} name={if !$_output.link.Status} "Link_disapproved" {else} "Link_approved" {/if}>{/if}
<input class=btn type="submit" value="{$_skalinks_lang.edit_link.submit_modify_link}" name="Form_submitted">
{if ( ( $ADMIN.Type == 2 ) || ( $_output.cat_info.Editor_id == $ADMIN.ID ) )}
<label><input type=checkbox name="send_email" checked>{$_skalinks_lang.edit_link.send_email}</label>
{/if}
</td></tr>
 </form> 
  <tr>
  <form action="{$smarty.server.PHP_SELF}" method=post>
     <input type=hidden name="url" value='{$smarty.get.url|default:$smarty.post.url}'>   
     <input type=hidden name='linking_page' value="{$_output.linking_page}">
<input type=hidden name=id value='{$smarty.get.id}'>
        <input type=hidden name=cat value='{$smarty.get.cat}'>
    {foreach item=search_type from=$_output.search_type}{if $search_type=="URL"}<input type=hidden name="search_type[]" value="URL">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}<input type=hidden name="search_type[]" value="Title">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}<input type=hidden name="search_type[]" value="Description">{/if}{/foreach}
	 <td valign="middle"><br><b>{$_skalinks_lang.edit_link.comment}</b></td>
	 <td valign="top"><br><textarea rows="5" cols="48" name="Comment">{$_output.link.Comment}</textarea>
		  <br><input class=btn type="submit" value="{$_skalinks_lang.edit_link.submit_save_comment}" name="Form_submitted"></td>  
  </form>
  </tr>
  <tr>
  <form action="{$smarty.server.PHP_SELF}" method=post>
	<input type=hidden name="url" value='{$smarty.get.url|default:$smarty.post.url}'>   
     <input type=hidden name='linking_page' value="{$_output.linking_page}">
    {foreach item=search_type from=$_output.search_type}{if $search_type=="URL"}<input type=hidden name="search_type[]" value="URL">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}<input type=hidden name="search_type[]" value="Title">{/if}{/foreach}
    {foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}<input type=hidden name="search_type[]" value="Description">{/if}{/foreach}
	<td valign="middle"><br><b>{$_skalinks_lang.edit_link.send_message}</b><br>
	<input type=hidden name=id value='{$smarty.get.id}'>
        <input type=hidden name=cat value='{$smarty.get.cat}'>
   </td>
	<td valign="top"><br><textarea name=Optmessage rows=5 cols=48></textarea>
		 <br><input  class=btn type=submit name='Send_message' value="{$_skalinks_lang.edit_link.submit_send_message}">
	</td>
	</tr>
	</form>
   
<tr>
</table>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>

{/if}

   
{include file='footer.tpl'}
