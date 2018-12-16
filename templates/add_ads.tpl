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
<div class=cen><h2>{$_skalinks_lang.add_ads.title}</h2></div>
<table cellspacing=0 cellpadding=4 align=top border=0>
<form action="{$smarty.server.PHP_SELF}" method=post>
{foreach item=banner from=$_output.all_ads}
<tr bgcolor="{cycle values="#e9eef3,#f7f7f7"}">
<td><input type=radio name=Ads_id value="{$banner.ID}"></td><td>{show_ads ads_id=$banner.ID}</td></tr>
{/foreach}
</table>
<br>
<br>
{if $smarty.get.cat_id != -1 && $_output.all_ads}
<select name="Ads_pos">
{if $_output.ads_type}
	 {foreach from=$_output.ads_type item=type}
		{html_options values=$type output=$type}
	 {/foreach}
{else}
<option>Empty</option>
{/if}
	 </select>  
<input class="btn" type=submit name="Add_ads" value="{$_skalinks_lang.add_ads.submit_ads}">
<input type=hidden name=cat_id value="{$smarty.get.cat_id|default:$smarty.post.cat_id}">
<input type=hidden name=type value="{$smarty.get.type|default:$smarty.post.type}">
<br>
{/if}
{if $_output.cat_ads}
<u>Current pages banners:</u><br><br><br>
<table cellspacing=0 cellpadding=4 align=top border=0>
{foreach item=cats_banner from=$_output.cat_ads}
<tr bgcolor="{cycle values="#e9eef3,#f7f7f7"}"><td>
<input type=radio name=Ads_position value="{$cats_banner.Ads_position}"></td><td>{show_ads type=$smarty.get.type|default:$smarty.post.type ads_id=$cats_banner.Ads_id}</td><td>
<b>{$_skalinks_lang.add_ads.ads_pos}</b>&nbsp;{$cats_banner.Ads_position}</td></tr>
{/foreach}
</table>
<input class="btn" type=submit name=Delete_ads value="{$_skalinks_lang.add_ads.submit_del}">
{/if}
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>

{include file='footer.tpl'}
