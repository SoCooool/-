{assign var=type value=cat}
{include file='header.tpl'}
<!--CATEGORY NAVIGATION BLOCK-->
<div id = "Cat_navigation">
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	{if $_output.mod_rewrite}
	<a class="edit" href="{$cat_navigation.url}{$_output.cat_index_url}" >{$cat_navigation.title}</a>	
	{else}
	<a class="edit" href="{$cat_navigation.url}" >{$cat_navigation.title}</a>
	{/if}	
	{/foreach}
</div>

<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
	<table width="680"><tr><td align=left>
	<tr>
{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) ) }<td>
{show_ads id=$_output.cat_info.ID type=$type position=left}
</td>{/if}
	<td> 
<div class=maintext>
<a href="{$_output.links_info.URL}" {if $_output.linkopen_mod} target="_blank" {/if}><u><b>{$_output.links_info.Title}</b></u></a><br><br>
{$_output.links_info.Description}
</div>
</td>
	<!-- Search results block-->
{if $_output.searches}  
<td class="tbl_result">
<div id="for_search_result">
{$_skalinks_lang.search_url.search_results}<br>
{foreach item=search_result from=$_output.searches}
{if $_output.mod_rewrite}
<a href="{$search_result.URL}">{$search_result.Pattern}</a>
{else}
<a href="{$_skalinks_url.root}search.php?url={$search_result.Pattern}&search_type[]=URL&search_type[]=Title&search_type[]=Description">{$search_result.Pattern}</a>
{/if}
<br>
{/foreach}
</div>
</td>
{/if}
</tr>
</table>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>

{include file='footer.tpl'}
