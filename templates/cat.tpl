{assign var=type value=cat}
{include file='header.tpl'}
<script src="{$_skalinks_url.root}SkaLinks_include/check.js" type=text/javascript></script>
<!--CATEGORY NAVIGATION BLOCK-->
{if $_output.cat_info.TopText}
<div class="top_text">{$_output.cat_info.TopText}</div>
{/if}

<div id = "Cat_navigation">
	<a class='edit' href='{$_skalinks_url.dir}'>{$_skalinks_site.brand}</a>
	{foreach name='cat_navigation' item='cat_navigation' from=$_output.cat_navigation}
	>>
	{if $smarty.foreach.cat_navigation.last } 
	{$cat_navigation.title}
	{elseif $_output.mod_rewrite}
	<a class="edit" href="{$cat_navigation.url}{$_output.cat_index_url}" >{$cat_navigation.title}</a>	
	{else}
	<a class="edit" href="{$cat_navigation.url}" >{$cat_navigation.title}</a>	
	{/if}
	{/foreach}
</div>

 <!--CATEGORIES BLOCK-->

{if $_output.categories}

<div id="Content"><div class="cont_left"></div><div class="cont_right"></div><div class="cont_padd">
{if $ADMIN}
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
{if $ADMIN.Name}
<form name="cat_action" action = "{$smarty.server.PHP_SELF}" method = post>
{/if}
	{ foreach item='categories' from=$_output.categories}
		{if ( $categories.Editor_id == $ADMIN.ID ) || ( $ADMIN.Type == 2 )}
		{assign var=cats_exists value=1}
		<input type="checkbox" name=cat_arr[] value="{$categories.ID}"> &nbsp;
		<a class="edit" href="{$_skalinks_url.admin}edit_cat.php?id={$categories.ID}&cat={$categories.Parent}">{$_skalinks_lang.cat.edit}</a>	
		{/if}
		{if $_output.mod_rewrite}
		<a class="cat" href="{$categories.url}{$_output.cat_index_url}" >{$categories.title}</a>
		{else}
		<a class="cat" href="{$categories.url}" >{$categories.title}</a>
		{/if}
		{if $categories.log }
		 @ 
		{/if}
		{if $categories.links}
		({$categories.links})
		{/if}
		{if $categories.Status}
		&nbsp;&nbsp;
		<b>( {$_skalinks_lang.status.not_approved} )</b>
		{/if}
		<br><div class="marg">
			{foreach name="sub" item="sub" from=$categories.sub}
			{if $_output.mod_rewrite}
			<a class="sub_cat" href="{$sub.url}{$_output.cat_index_url}" >{$sub.title}</a>
			{else}
			<a class="sub_cat" href="{$sub.url}" >{$sub.title}</a>
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
		<a href="mailto:{$categories.Editor_info.Email}" ><b>{$categories.Editor_info.Name}</b></a>
		{else}
		{$_skalinks_lang.cat.editor_none}
		{/if}
		</b>
		</div>
		{/if}
		<br>
	{/foreach}
<br>
{if ( $ADMIN.Name && ( $ADMIN.Type == 2 ) || ( ( $ADMIN.Type == 1 ) && ( $cats_exists ) ) )} 
<input type=checkbox OnClick="setCheckboxes( 'cat_action', this.checked ) ; ">
<input class="btn" name="delete_cat" type=submit value="{$_skalinks_lang.cat.delete}">
<input class="btn" name="approve_cat" type=submit value="{$_skalinks_lang.cat.approve}">
<input class="btn" name="disapprove_cat" type=submit value="{$_skalinks_lang.cat.disapprove}">
{/if}
{if $ADMIN.Name}
</form>
{/if}
{if $_output.show_admin_ads}
 <br>
	</td></tr>
	</table>
{/if}
{else}
	<table align=center><tr><td align=left>
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
{/if}


  	{if $_output.related_categories}
		<div id="Related">
		<h2>{$_skalinks_lang.cat.seealso}</h2><br>
		{foreach item=related_categories from=$_output.related_categories}
		<a class="cat" href="{$related_categories.url}" >{$related_categories.Title}</a><br>	
		{/foreach}
		</div>
	{/if}
{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) )}
<div class="for_banner">{show_ads id=$_output.cat_info.ID type=cat position=middle}</div>
{/if}		  


<!--LINK NAVIGATION BLOCK-->
{if $_output.links_pages}
   
     <div id='Link_navigation'> 
		{if $_output.links_page > 1 } 
		{if $_output.mod_rewrite}
      		<a href="{$_output.this_cat_url}{$_output.cat_index_url}">{$_skalinks_lang.link_nav.first}</a>&nbsp;
		{else}
      		<a href="{$_output.this_cat_url}">{$_skalinks_lang.link_nav.first}</a>&nbsp;
		{/if}
		{/if}
		 
      		{if $_output.links_page > 1 }
	    	{assign var=prev value=$_output.links_page-1}
		{if $_output.mod_rewrite}
		{if $prev > 1}
		<a href="{$_output.this_cat_url}{$_output.cat_pages_view|replace:"<page_number>":$prev}" >{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{else}
		<a href="{$_output.this_cat_url}{$_output.cat_index_url}" >{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{/if}
		{else}
		{if $prev > 1}
		<a href="{$_output.this_cat_url}?page={$prev}" >{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{else}
		<a href="{$_output.this_cat_url}" >{$_skalinks_lang.link_nav.previous}</a>&nbsp;
		{/if}
		{/if}
		{/if} 
		{foreach item=value from=$_output.links_pages}
		  
		{if $_output.links_page != $value}
	    	{if $_output.mod_rewrite}
		{if $value > 1}
	        <a href="{$_output.this_cat_url}{$_output.cat_pages_view|replace:"<page_number>":$value}" >{$value}</a>&nbsp;
		{else}
		<a href="{$_output.this_cat_url}{$_output.cat_index_url}" >{$value}</a>&nbsp;
		{/if}
		{else}
		{if $value > 1}
		<a href="{$_output.this_cat_url}?page={$value}">{$value}</a>&nbsp;
		{else}
		<a href="{$_output.this_cat_url}">{$value}</a>&nbsp;
		{/if}
		{/if}
			
		     {else} 
			  
			{$value}
		     {/if}
		   {/foreach}	     
	  {if $_output.links_page < $_output.links_total_pages }
	    	 {assign var=next value=$_output.links_page+1}
		 {if $_output.mod_rewrite}
  		 <a href="{$_output.this_cat_url}{$_output.cat_pages_view|replace:"<page_number>":$next}">{$_skalinks_lang.link_nav.next}</a>&nbsp;
		 {else}
		 <a href="{$_output.this_cat_url}?page={$next}">{$_skalinks_lang.link_nav.next}</a>&nbsp;
		 {/if}
	
      	  {/if}
	 {if $_output.links_page < $_output.links_total_pages}
	 {if $_output.mod_rewrite}
	   <a href="{$_output.this_cat_url}{$_output.cat_pages_view|replace:"<page_number>":$_output.links_total_pages}" >{$_skalinks_lang.link_nav.last}</a>&nbsp;
	 {else}
	   <a href="{$_output.this_cat_url}?page={$_output.links_total_pages}" >{$_skalinks_lang.link_nav.last}</a>&nbsp;
	 {/if}
	 {/if}
	 </div>
{/if}
<!--LINKS BLOCK-->
<div id="Links"><div class="cont_left"></div><div class="cont_right"></div>
<div class="cont_padd">
{if ( $ADMIN.Name )}
	<form name="links_action" action="{$smarty.server.PHP_SELF}?page={$_output.links_page}" method=post>
{/if}
	{if $_output.links} 
	<div id="cat_links">
	<!-- Search results block-->
	{if $_output.searches}  
	<div id="for_search_result">
	{$_skalinks_lang.search_url.search_results}<br>
	{foreach item=search_result from=$_output.searches}
	{if $_output.mod_rewrite}
        <a href="{$search_result.URL}" >{$search_result.Pattern}</a>
        {else}
        <a href="{$_skalinks_url.root}search.php?url={$search_result.URL_Pattern}&search_type[]=URL&search_type[]=Title&search_type[]=Description" >{$search_result.Pattern}</a>
        {/if}
	<br>
	{/foreach}
	</div>
	{/if}
	{assign var=numbering_link value=$_output.numbering_link}
	{foreach item=links from=$_output.links}
	<div class="link_item">
	   {if ( $ADMIN.Name ) && ( ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) || ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.AddedBy ) ) }
	   <input type="checkbox" name=link_arr[] value="{$links.ID}"> &nbsp;
	   {/if}
	   {assign var=numbering_link value=$numbering_link+1}
	   {$numbering_link}&nbsp;
	   {if $ADMIN.Name}
      	   <span title="{$links.Comment}"> <a href="{$links.url}" {if $_output.link_open}target="_blank"{/if} >{$links.title}</a></span>&nbsp;
	   {else}
	   <a href="{$links.url}" {if $_output.link_open}target="_blank"{/if} >{$links.title}</a>&nbsp;
	   {/if}
	   {if $links.Rank}
	   {section name=stars loop=$links.Rank}
	    <img src="{$_skalinks_url.templates}star.gif" border="0" alt="">
	   {/section}
	   {/if}
	   {if $links.Status}
	   &nbsp;<b>( {$_skalinks_lang.status.not_approved} )</b>
	   {/if}
	   <br>
	  
	   <br>
	   {if ( $ADMIN.Name ) && ( ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) || ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.AddedBy ) )}
	   
	   <a class="edit" href="{$_skalinks_url.admin}edit_url.php?id={$links.ID}&cat={$links.Category}">{$_skalinks_lang.link.edit}</a>
	   {/if}
	   <b>{$links.url}&nbsp;</b><br>
	 	<br>
		{if ( $ADMIN.Name && ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) || ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $links.AddedBy ) )}
		<div class="{if $links.LinkBackURLValid == 'y'}back_link_valid{else}back_link_invalid{/if}">{$_skalinks_lang.link.linkback}<a href="{$links.LinkBackURL}" target="_blank" >{$links.LinkBackURL}</a></div>
		{/if}
		<br>
		{if $_output.pagerank_set}
			{assign var=pagerank value=$links.Pagerank*10}
			PR: {$links.Pagerank}<br>
			<table cellspacing=0 width="45" style="border:1px solid #000;height:5px; "><tr>{if $pagerank}<td bgcolor="#5abb5a" width="{$pagerank}%"></td>{/if}<td bgcolor="white"></td></tr></table>
			<br>	
		{/if}
		{if $ADMIN.Name}
		{if $links.Name}
			<div class="marg_desc">{$_skalinks_lang.link.editor_name}<a href="mailto:{$links.Editor_Email}"><b>{$links.Name}</b></a></div>
		{/if}

			{if $links.Creator_Name}
				<div class="marg_desc">{$_skalinks_lang.link.creator_name}<a href="mailto:{$links.Creator_Email}"><b>{$links.Creator_Name}</b></a></div>
				{assign var=creator_exists value=1}
			{else}
				<div class="marg_desc">{$_skalinks_lang.link.creator_name}<b>{$_skalinks_lang.link.creator_visitor}</b></div>
			{/if}
		{/if}
		<br>
		<div class=marg_desc>{$links.description}<br><br>
		{if $_output.mod_rewrite}
	    
	       		<a class="cat3" href="{$_skalinks_url.root}{$links.listing_url}">{$_skalinks_lang.link.more_info}</a>&nbsp;
	        {else}
	       
	        <a class="cat3" href='{$_skalinks_url.root}detailed/listing.php?link_id={$links.ID}'>{$_skalinks_lang.link.more_info}</a>&nbsp;
		  
		{/if}</div>
		</div>
	{/foreach}

</div>
{/if}
<div id="sp">&nbsp;</div>
{if ( $ADMIN.Name && $_output.links ) && ( ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) || ( $ADMIN.Type == 2 ) || $creator_exists )}
<input type=checkbox OnClick="setCheckboxes( 'links_action', this.checked ) ; " >
<input class='btn' name = 'delete_links' TYPE = 'submit' VALUE = 'Delete' title='{$_skalinks_lang.link.delete}'>
<input class='btn' name = 'check_broken_links' TYPE = 'submit' value='{$_skalinks_lang.link.check_broken}'>
<input class='btn' name = 'check_recip_links' type = 'submit' value='{$_skalinks_lang.link.check_recip}'>
{if ( ( $ADMIN.Type == 2 ) || ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) )}
<input class='btn' name = 'approve_link' type='submit' value ='{$_skalinks_lang.link.approve}'>
{/if}
<input class='btn' name = 'disapprove_link' type='submit' value='{$_skalinks_lang.link.disapprove}'>
</form>
{/if}
{if ( $ADMIN.Name ) && ( ( $ADMIN.ID == $_output.cat_info.Editor_info.ID ) || ( $ADMIN.Type == 2 ) )}
<div id="button_links_bg">
<a class="bottom_links" href="{$_skalinks_url.admin}add_letter_template.php?cat_id={$_output.cat_info.ID}">{$_skalinks_lang.cat.add_template}</a>
<a class="bottom_links" href="{$_skalinks_url.admin}add_ads.php?type=cat&cat_id={$_output.cat_info.ID}">{$_skalinks_lang.cat.add_ads}</a>
</div>
{/if}
</div>
<div class=cont_left_bottom></div>
<div class=cont_center_bottom></div>
<div class=cont_right_bottom></div></div>
{if $_output.cat_info.BottomText}
<div class="top_text">{$_output.cat_info.BottomText}</div>
{/if}

{include file='footer.tpl'}
