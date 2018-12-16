{include file='header.tpl'}
<script src="{$_skalinks_url.root}SkaLinks_include/check.js" type=text/javascript></script>
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.list_cats.title_approve}</h2></div>
<form name=cat_list action="{$smarty.server.PHP_SELF}?show=0" method=post>
   
   	 <table width='80%' border='0' class=maintext cellpadding=6 align='center'>
	 <tr><td width='100%'>
	 </td>
	 </tr>
	    {foreach item=key from=$_output.cats}
	    <tr align="left"><td>
		<input type='checkbox' name=cat_arr[] value="{$key.ID}"> &nbsp;
		<a class='edit' href='{$_skalinks_url.admin}edit_cat.php?id={$key.ID}&cat={$key.Parent}'>{$_skalinks_lang.cat.edit}</a>	
	        <a class='cat' href='{$key.parent_cat_url}{$key.dir}/'>{$key.Title}</a>&nbsp;
		
	        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$_skalinks_lang.list_cats.parent}<a class='sub_cat' href='{$key.parent_cat_url}'>{$key.parent_cat_title}</a>&nbsp;
	</td><td>
	{/foreach}
	</td></tr>
	<tr align="left"><td>
	<br>
	<input type=checkbox OnClick="setCheckboxes( 'cat_list', this.checked ) ; ">
	<input class='btn' name = 'delete_cat' TYPE='submit' VALUE='{$_skalinks_lang.cat.delete}'>
	<input class='btn' name='approve_cat' type=submit value='{$_skalinks_lang.cat.approve}'>
	</td></tr>
	</table> 
	 </form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>

{include file='footer.tpl'}
