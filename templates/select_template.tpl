<script src="{$_skalinks_url.root}SkaLinks_include/check.js" type=text/javascript></script>
<table id="Add" border="0" cellpadding="0" cellspacing="0">
{foreach item=template from=$_output.all_templates}
<tr class="{cycle values="tbl_color1,tbl_color2"}">
<td>
<a href="Javascript:InsertTemplate('{$template.ID}', escape('{$template.Template}'));">{$_skalinks_lang.let_tem.select}</a>
</td>
<td>
<textarea cols=60 rows=20 disabled>
{$template.display_template}
</textarea>
</td>
</tr>
{/foreach}
