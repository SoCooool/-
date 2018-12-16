
{include file='header.tpl'}
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.ads.title}</h2></div>
<form action="{$smarty.server.PHP_SELF}" method=post>
{if $_output.all_ads}
<div id=help_title>{$_skalinks_lang.ads.cur_ads}</div>
<table align=center cellspacing=0 cellpadding=0 border=0>
{foreach item=banner from=$_output.all_ads}
<input type=hidden name=Tem_num[] value="{$banner.ID}" >
<tr align=center class="{cycle values="tbl_color1,tbl_color2"}"><td align=middle>
<input type=checkbox name=Ads_arr[] value="{$banner.ID}" id="{$banner.ID}"></td><td><textarea rows=5 cols=45 name=Banner_tem[] onFocus="document.getElementById('{$banner.ID}').checked = true;">{$banner.Template}</textarea><br><table align=middle><tr><td>{show_ads ads_id=$banner.ID}</td></tr></table></td></tr>
{/foreach}
</table>
<table align=center>
<tr><td>
<div class="maintext">With selected:</div>
<input class="btn" type=submit name="Change_banner" value="{$_skalinks_lang.ads.modify_ad}">
<input class="btn" type=submit name="Delete_banner" value="{$_skalinks_lang.ads.delete_ad}">
</td></tr></table>
<br>
</center>
{/if}
<center>
<br>
<br>
<br>
<textarea rows=4 cols=40 name="New_banner"></textarea>
<br>
<input class="btn" type=submit name="Add_banner" value="{$_skalinks_lang.ads.add_ad}">
</center>
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>

{include file='footer.tpl'}
