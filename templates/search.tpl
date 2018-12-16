{assign var=type value=url_search}
{include file='header.tpl'}
<script src="{$_skalinks_url.root}SkaLinks_include/check.js" type=text/javascript></script>
<div id="Content"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_skalinks_lang.search_url.search_desc}</h2></div>
<form action="{$smarty.server.PHP_SELF}" method=get>
<table align=center>
<tr>
<td valign=middle>
{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) )}
{show_ads id=$_output.cat_info.ID type=$type position=left}
{/if}
</td>
<td>
<table id="Add" align=center border="0" cellpadding="0" cellspacing="0">
<tr align=center>
<td><input type="text" size=40 name="url" value="{$_output.search_url|default:""}"><input class=btn type=submit name="Search" value="{$_skalinks_lang.search_url.submit_search}"></td>
</tr> 
<tr align=center><td>
<br>
<input id=s1 type=checkbox name="search_type[]" value="URL" {if $_output.search_type}{foreach item=search_type from=$_output.search_type}{if $search_type=="URL"}checked{/if}{/foreach}{else}checked{/if}><label for=s1>{$_skalinks_lang.search_url.type_url}</label>
<input id=s2 type=checkbox name="search_type[]" value="Title" {foreach item=search_type from=$_output.search_type}{if $search_type=="Title"}checked{/if}{/foreach}><label for=s2>{$_skalinks_lang.search_url.type_title}</label>
<input id=s3 type=checkbox name="search_type[]" value="Description" {foreach item=search_type from=$_output.search_type}{if $search_type=="Description"}checked{/if}{/foreach}><label for=s3>{$_skalinks_lang.search_url.type_desc}</label>
</td></tr>
</table>
</td>
</tr>
</table>
</form>
{if $ADMIN}
<div id="button_links_bg">
<a class="bottom_links" href="{$_skalinks_url.admin}add_ads.php?type=url_search">{$_skalinks_lang.cat.add_ads}</a>
</div>
{/if}
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div></div>

<!--LINK NAVIGATION BLOCK-->
{if $_output.links_pages}

     <div id='Link_navigation'> 
		{if $_output.links_page > 1 } 
		{if $_output.mod_rewrite}
		<a href="{$_skalinks_url.dir}search_url={php}echo urlencode( $_GET['url']."&page=" );{/php}{foreach item=search_type from=$_output.search_type}{php}echo urlencode( "&search_type[]=".$this->_tpl_vars['search_type'] );{/php}{/foreach}.html">{$_skalinks_lang.link_nav.first}</a>&nbsp;
		{else}
      		<a href='{$_skalinks_url.dir}search.php?url={$smarty.get.url}&page=1{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}'>{$_skalinks_lang.link_nav.first}</a>&nbsp;
		{/if}
		{/if}
		 
      		{if $_output.links_page > 1 }
	    	{assign var=prev value=$_output.links_page-1}
		{if $_output.mod_rewrite}
		<a href="{$_skalinks_url.dir}search_url={php}echo urlencode( $_GET['url']."&page=".$this->_tpl_vars['prev'] );{/php}{foreach item=search_type from=$_output.search_type}{php}echo urlencode( "&search_type[]=".$this->_tpl_vars['search_type'] );{/php}{/foreach}.html">{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{else}
		<a href='{$_skalinks_url.dir}search.php?url={$smarty.get.url}&page={$prev}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}'>{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{/if}
		{/if} 
		{if $_output.mod_rewrite}
		{foreach item=value from=$_output.links_pages}
		  
		{if $_output.links_page != $value}
	    
	        <a href="{$_skalinks_url.dir}search_url={php}echo urlencode( $_GET['url']."&page=".$this->_tpl_vars['value'] );{/php}{foreach item=search_type from=$_output.search_type}{php}echo urlencode( "&search_type[]=".$this->_tpl_vars['search_type'] );{/php}{/foreach}.html">{$value}</a>&nbsp;
			
		     {else} 
			  
			{$value}
		     {/if}
		   {/foreach}
		{else}
		{foreach item=value from=$_output.links_pages}
		  
		{if $_output.links_page != $value}
	        <a href='{$_skalinks_url.dir}search.php?url={$smarty.get.url}&page={$value}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}'>{$value}</a>&nbsp;
			
		     {else} 
			  
			{$value}
		     {/if}
		   {/foreach}
		{/if}
	  {if $_output.links_page < $_output.links_total_pages }
	    	 {assign var=next value=$_output.links_page+1}
		 {if $_output.mod_rewrite}
		 <a href="{$_skalinks_url.dir}search_url={php}echo urlencode( $_GET['url']."&page=".$this->_tpl_vars['next'] );{/php}{foreach item=search_type from=$_output.search_type}{php}echo urlencode( "&search_type[]=".$this->_tpl_vars['search_type'] );{/php}{/foreach}.html">{$_skalinks_lang.link_nav.next}</a>&nbsp;
		 {else}
  		 <a href='{$_skalinks_url.dir}search.php?url={$smarty.get.url}&page={$next}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}'>{$_skalinks_lang.link_nav.next}</a>&nbsp;
		 {/if}
	
      	  {/if}
	 {if $_output.links_page < $_output.links_total_pages}
	 {if $_output.mod_rewrite}
	 <a href="{$_skalinks_url.dir}search_url={php}global $_output;echo urlencode( $_GET['url']."&page=".$_output['links_total_pages'] );{/php}{foreach item=search_type from=$_output.search_type}{php}echo urlencode( "&search_type[]=".$this->_tpl_vars['search_type'] );{/php}{/foreach}.html">{$_skalinks_lang.link_nav.last}</a>&nbsp;
	 {else}
	   <a href='{$_skalinks_url.dir}search.php?url={$smarty.get.url}&page={$_output.links_total_pages}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}'>{$_skalinks_lang.link_nav.last}</a>&nbsp;
	 {/if}
	 {/if}
	 </div>
{/if}
<!--LINKS BLOCK-->
 
	{if $_output.links}
	 
	<div id='Links'><div class="cont_left"></div><div class="cont_right"></div>
	<div class="cont_padd">
	<div id=cat_links>
{if $ADMIN.Name}
<form name = 'links_action' action = "{$smarty.server.PHP_SELF}?url={$smarty.get.url}&page={$_output.links_page}{foreach item=search_type from=$_output.search_type}&search_type[]={$search_type}{/foreach}" method = post>
{/if}
	{assign var=numbering_link value=$_output.numbering_link}
	{assign var=count_editors_link value=0}
	{foreach item=links from=$_output.links}
		<div class="link_item">
	   {if ( $ADMIN.Name && ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.Editor_ID ) || ( $ADMIN.ID == $links.AddedBy ) ) )}
	   {assign var=count_editors_link value=++$count_editors_link}
	   <input type = 'checkbox' name = link_arr[] value = "{$links.ID}"> &nbsp;
	   {/if}
	   {assign var=numbering_link value=$numbering_link+1}
	   {$numbering_link}&nbsp;
      	   <a href='{$links.url}' {if $_output.link_open}target="_blank"{/if}>{$links.title}</a>&nbsp;
	   {if $links.Rank}
	   {section name=stars loop=$links.Rank}
	   <img src='{$_skalinks_url.templates}star.gif' border='0' alt=''>
	   {/section}
	   {/if}
	   {if $links.Status }
	   &nbsp;<b>( {$_skalinks_lang.status.not_approved} )</b>
	   {/if}
	   <br><br>
	   {if ( $ADMIN.Name && ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.Editor_ID ) || ( $ADMIN.ID == $links.AddedBy ) ) )}

	   <a class = 'edit' href='{$_skalinks_url.admin}edit_url.php?id={$links.ID}&cat={$links.Category}'>{$_skalinks_lang.link.edit}</a>
	
	   {/if}
	   <b>{$links.url}&nbsp;</b>
	   <br>
	   <br>
		{if $_output.mod_rewrite}
		<div class=marg_desc>{$_skalinks_lang.search_url.url_cat}<a href="{$links.cat_url}
		{if $links.page > 1}
		{$_output.cat_pages_view|replace:"<page_number>":$links.page}
		{else}{$_output.cat_index_url}
		{/if}">{$links.cat_title}</a>
		{else}
		<div class=marg_desc>{$_skalinks_lang.search_url.url_cat}<a href='{$links.cat_url}{if $links.page > 1}?page={$links.page}{/if}'>{$links.cat_title}</a>
		{/if}
		{if $links.cat_info.Status}
		&nbsp;<b>( {$_skalinks_lang.status.not_approved} )</b>
		{/if}
		{if ( $ADMIN.Name && ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.Editor_ID ) || ( $ADMIN.ID == $links.AddedBy ) ) )}
		<div class="{if $links.LinkBackURLValid == 'y'}back_link_valid{else}back_link_invalid{/if}">{$_skalinks_lang.link.linkback}<a href="{$links.LinkBackURL}" target="_blank">{$links.LinkBackURL}</a></div>
		{/if}
		<br>
		{if $_output.pagerank_set}
		{assign var=pagerank value=$links.Pagerank*10}
		<br>
		PR: {$links.Pagerank}<br>
		<table cellspacing=0 width="45" style="border:1px solid #000; height:5px ;"><tr>{if $pagerank}<td bgcolor="#5abb5a" width="{$pagerank}%"></td>{/if}<td bgcolor="white"></td></tr></table>
		{/if}
		{if $ADMIN.Type == 2}
		<br>
		{$_skalinks_lang.cat.editor_name}<b>{if $links.Editor_Name}{$links.Editor_Name}{else}{$_skalinks_lang.cat.editor_none}{/if}</b>
		{/if}
</div>
		<br>
		<div class=marg_desc>{$links.description}<br>
		{if $_output.mod_rewrite}
	    
	       <a class = 'cat3' href="{$_skalinks_url.root}{$links.listing_url}">{$_skalinks_lang.link.more_info}</a>&nbsp;
	       
	       {else}
	       
	       <a class = 'cat3' href='{$_skalinks_url.root}detailed/listing.php?link_id={$links.ID}'>{$_skalinks_lang.link.more_info}</a>&nbsp;
		  
		{/if}
		</div>
</div>
	{/foreach}
{if $count_editors_link }
<input type=checkbox OnClick=" setCheckboxes('links_action', this.checked ) ; " >
<input class='btn' name = 'delete_links' TYPE = 'submit' VALUE = '{$_skalinks_lang.link.delete}' title='{$_skalinks_lang.link.delete}'>
<input class='btn' name = 'check_broken_links' TYPE = 'submit' value='{$_skalinks_lang.link.check_broken}'>
<input class='btn' name = 'check_recip_links' type = 'submit' value='{$_skalinks_lang.link.check_recip}'>
<input class='btn' name = 'approve_link' type='submit' value ='{$_skalinks_lang.link.approve}'>
<input class='btn' name = 'disapprove_link' type='submit' value='{$_skalinks_lang.link.disapprove}'>
</form>
{/if}
</div>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{/if}
{include file='footer.tpl'}
