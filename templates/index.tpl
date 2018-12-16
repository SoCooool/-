{assign var=type value=cat}
{include file='header.tpl'}
<script src="{$_skalinks_url.root}SkaLinks_include/check.js" type=text/javascript></script>
<div id = "Content"><div class="cont_left"></div><div class="cont_right"></div><div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.cat.title}</h2></div>
{if $ADMIN }
{if $_output.show_admin_ads}
	<table align=center><tr><td align=left>
	<table cellpadding=5>
	<tr><td>{show_ads id=$_output.cat_info.ID type=$type position=left}</td></tr>
	</table>
	</td>
	<td align=left> 
{else}
<table align=center><tr><td align=left>
{/if}
{if $_output.categories}
<form name="cat_action" action="{$_skalinks_url.root}index.php" method=post>
	{ foreach item='categories' from=$_output.categories}
		{if ( $categories.Editor_id == $ADMIN.ID ) || ( $ADMIN.Type == 2)}
	        {assign var=cats_exists value=1}
		<input type='checkbox' name=cat_arr[] value="{$categories.ID}"> &nbsp;
		<a class='edit' href='{$_skalinks_url.admin}edit_cat.php?id={$categories.ID}&cat={$categories.Parent}'>{$_skalinks_lang.cat.edit}</a>	
		{/if}
		{if $_output.mod_rewrite}
		<a class='cat' href="{$categories.url}{$_output.cat_index_url}">{$categories.title}</a>
		{else}
		<a class='cat' href="{$categories.url}">{$categories.title}</a>
		{/if}
		{if $categories.logical ==1 }
		 @ 
		{/if}
		{if $categories.links}
		({$categories.links})
		{/if}
		{if $categories.Status}
		&nbsp;&nbsp;<b>( {$_skalinks_lang.status.not_approved} )</b>
		{/if}
		<br><div class="marg">
			{foreach name="sub" item="sub" from=$categories.sub}
			{if $_output.mod_rewrite}
			<a class="sub_cat" href="{$sub.url}{$_output.cat_index_url}">{$sub.title}</a>
			{else}
			<a class="sub_cat" href="{$sub.url}">{$sub.title}</a>
			{/if}
			{if $smarty.foreach.sub.last}
			...
			{else}
			,
			{/if}
			{/foreach}
		</div>
		{if $ADMIN.Type == 2}
		<div class="marg">
		<br>
		{$_skalinks_lang.cat.editor_name}
		{if $categories.Editor_info.Name}
		<a href="mailto:{$categories.Editor_info.Email}"><b>{$categories.Editor_info.Name}</b></a>
		{else}
		{$_skalinks_lang.cat.editor_none}
		{/if}
		</b>
		</div>
		{/if}
			 	 	
		<br>
	{/foreach}
<br>
{if ( $ADMIN.Type == 2 ) || ( ( $ADMIN.Type == 1 ) && ( $cats_exists ) )}
<input type=checkbox onClick="setCheckboxes( 'cat_action', this.checked );">
<input class='btn' name = 'delete_cat' TYPE = 'submit' VALUE='{$_skalinks_lang.cat.delete}'>
<input class='btn' name='approve_cat' type=submit value='{$_skalinks_lang.cat.approve}'>
<input class='btn' name='disapprove_cat' type=submit value='{$_skalinks_lang.cat.disapprove}'>
{/if}
</form>
{/if}
{if $ADMIN.Type == 2}
<div id="button_links_bg">
<a class=bottom_links href="{$_skalinks_url.admin}add_ads.php?type=cat&cat_id={$_output.cat_info.ID}"><b>{$_skalinks_lang.cat.add_ads}</b></a></div>
{/if}
{if $_output.show_admin_ads}

	</td></tr>
	</table>
{/if}
{else}
	<table align=center><tr><td>
	<table cellpadding=5>
	<tr><td>{show_ads id=$_output.cat_info.ID type=$type position=left}</td></tr>
	</table>
	</td>
	<td>  
   {display_cats  output=$_output}
   <br>
	</td></tr>
	</table>
{/if}
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div></div>
{include file='footer.tpl'}

