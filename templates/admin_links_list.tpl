
{include file='header.tpl'}

<!--LINKS NAVIGATION BLOCK-->
{if $_output.links_pages}
   
     <div id='Link_navigation'> 
		{if $_output.links_page > 1 } 
		
      		<a href='{$_output.this_cat_url}?show={$_output.param}&hcode={$_output.hcode}&page=1'>{$_skalinks_lang.link_nav.first}</a>&nbsp;
		{/if}
		 
      		{if $_output.links_page > 1 }
	    	{assign var=prev value=$_output.links_page-1}
		<a href='{$_output.this_cat_url}?show={$_output.param}&hcode={$_output.hcode}&page={$prev}'>{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{/if} 
		{foreach item=value from=$_output.links_pages}
		  
		{if $_output.links_page != $value}
	    
	        <a href='{$_output.this_cat_url}?show={$_output.param}&hcode={$_output.hcode}&page={$value}'>{$value}</a>&nbsp;
			
		     {else} 
			  
			{$value}
		     {/if}
		   {/foreach}	     
	  {if $_output.links_page < $_output.links_total_pages }
	    	 {assign var=next value=$_output.links_page+1}
  		 <a href='{$_output.this_cat_url}?show={$_output.param}&hcode={$_output.hcode}&page={$next}'>{$_skalinks_lang.link_nav.next}</a>&nbsp;
	
      	  {/if}
	 {if $_output.links_page < $_output.links_total_pages}
	 
	   <a href='{$_output.this_cat_url}?show={$_output.param}&hcode={$_output.hcode}&page={$_output.links_total_pages}'>{$_skalinks_lang.link_nav.last}</a>&nbsp;
	 {/if}
	 </div>
{/if}   
<!--LINKS BLOCK-->
 
	{if $_output.link}
	 <br />
	<div id='Links'><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
<div class=cen><h2>{$_output.links_type}</h2></div>
	<form name = 'links_action' action = "{$smarty.server.PHP_SELF}?show={$_output.param}&hcode={$_output.hcode}&page={$_output.links_page}" method = post>
	{assign var=numbering_link value=$_output.links_links_number}
	{foreach item=links from=$_output.link}
		<div class="link_item">
	{if $ADMIN}
		<input type = 'checkbox' name = link_arr[] value = "{$links.ID}"> &nbsp;
	{/if}
	{assign var=numbering_link value=$numbering_link+1}
	{$numbering_link}&nbsp;
    	   <a href="{$links.URL}">{$links.Title}</a>&nbsp;
	   {if $links.Status}
	   	<b>({$_skalinks_lang.status.not_approved})</b><br>
	   {/if}
	   {if $links.Rank}
	   	{section name=stars loop=$links.Rank}
	   	<img src='{$_skalinks_url.templates}star.gif' border='0' alt=''>
	   	{/section}
	   {/if}
	   <br>
	   <a class = 'edit' href='{$_skalinks_url.admin}edit_url.php?id={$links.ID}&cat={$links.Category}'>{$_skalinks_lang.link.edit}</a>
	   <br><br>
   	   {$links.URL}&nbsp;
	  	<br>
		{$_skalinks_lang.search_url.url_cat}<a href='{$links.cat_url}?page={$links.page}'>{$links.cat_title}</a><br>
		{if $_output.pagerank_set}
		<br>
		{assign var=pagerank value=$links.Pagerank*10}
		PR: {$links.Pagerank}<br>
		<table cellspacing=0 width="45" style="border:1px solid #000; height:5px ;"><tr>{if $pagerank}<td bgcolor="#5abb5a" width="{$pagerank}%"></td>{/if}<td bgcolor="white"></td></tr></table>
		{/if}
		<br>
		{if $links.Name }
		{$_skalinks_lang.link.editor_name}<a href="mailto:{$links.Editor_Email}"><b>{$links.Name}</b></a><br>
		{/if}
		{if $links.Creator_Name}
			{$_skalinks_lang.link.creator_name}<a href="mailto:{$links.Creator_Email}"><b>{$links.Creator_Name}</b></a>
				{assign var=creator_exists value=1}
		{else}
			{$_skalinks_lang.link.creator_name}<b>{$_skalinks_lang.link.creator_visitor}</b>
		{/if}
		<br>
		<br>
		<b>{$_skalinks_lang.search_url.link_http_code}{$links.UrlHeader}</b>
		<br>
		<b>{$links.url}&nbsp;</b>
	 	<br>
		<div class="{if $links.LinkBackURLValid == 'y'}back_link_valid{else}back_link_invalid{/if}">{$_skalinks_lang.link.linkback}<a href="{$links.LinkBackURL}" target="_blank">{$links.LinkBackURL}</a></div>
		<br>
		{$links.Description}
		<br>
		<a class="cat3" href="{$_skalinks_url.root}detailed/listing.php?link_id={$links.ID}">{$_skalinks_lang.link.more_info}</a>&nbsp;
	</div>
	{/foreach}

{if $ADMIN }
<input type=checkbox OnClick="setCheckboxes( 'links_action', this.checked ) ; ">
<input class='btn' name = 'delete_links' type="submit" value="{$_skalinks_lang.link.delete}" title="{$_skalinks_lang.link.delete}">
<input class='btn' name = 'check_broken_links' type="submit" value="{$_skalinks_lang.link.check_broken}">
<input class='btn' name = 'check_recip_links' type="submit" value="{$_skalinks_lang.link.check_recip}">
<input class='btn' name = 'approve_link' type="submit" value="{$_skalinks_lang.link.approve}">
<input class='btn' name = 'disapprove_link' type="submit" value="{$_skalinks_lang.link.disapprove}">
</form>
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div>
</div>
{/if}

{/if}

{include file='footer.tpl'}
