
{include file='header.tpl'}

<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.dirtree.title}</h2></div>
<div class=left>
<script language="javascript">
{literal}
<!--
function divShow(div_id)
{
   if (document.getElementById(div_id).style.display=="none")
   
	document.getElementById(div_id).style.display="inline";
   else

      document.getElementById(div_id).style.display="none";
}
</script>
{/literal}
{showdirtree cat=0 ADMIN=$ADMIN}
</div>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{include file='footer.tpl'}
