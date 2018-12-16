<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>{$_output.title|default:$_skalinks_page.title}</title>
{if $type=="add_url" || $type=="add_cat"}<meta NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">{/if}
<meta http-equiv="Content-Type" content="text/html;charset=windows-1251" >
<meta NAME="DESCRIPTION" CONTENT="{$_output.meta_description|default:$_skalinks_site.brand}">
<meta NAME="KEYWORDS" CONTENT="{$_output.meta_keywords|default:$_skalinks_site.brand}">
<meta NAME="Content-Type" CONTENT="text/html; charset=windows-1251">
<link href="{$_skalinks_url.color_theme}style.css" rel="STYLESHEET" type="text/css">
<script src="{$_skalinks_url.root}SkaLinks_include/{$_output.js|default:'check.js'}" type=text/javascript></script>
</head>
<body {if $_output.onload}onload="{foreach item=onload from=$_output.onload}{$onload}{/foreach}"{/if} >
{if $_output.cat_info.Title}
<h1>{$_output.cat_info.Title}</h1>
{/if}
<div id="container">
<div id="header"><div id="header_left"></div>
<div id="header_center">
<div id="h_1"><a class=header_1 href="{$_skalinks_url.main_site}">{$_skalinks_site.site_full}</a></div>
<div id="h_2">
{if $ADMIN && !$_output.logout}
<div class="small_text">{$_skalinks_lang.ctrlpanel.logged_as}<b>{$ADMIN.Name}</b></div>
<div class=logout_btn>
<form action="{$_skalinks_url.admin}" method=post><input class=btn name='Logout' TYPE='submit' value='{$_skalinks_lang.ctrlpanel.logout}' title='Logout'>
</form>
</div>
{/if}
	
</div>
</div>
<div id="header_right"></div>
</div>
<div id="navigation"><div id="navigation_left"></div>
{if $_output.menu}   
      {if $ADMIN.Name}
      <div id="navigation_center">
      <a class="menu_nav" rel="nofollow" href="{$_skalinks_url.dir}add_cat.php?cat={$_output.cat_info.ID}">{$_skalinks_lang.header_links.add_cat_link}</a> |
      <a class="menu_nav" rel="nofollow" href="{$_skalinks_url.dir}add_url.php?cat={$_output.cat_info.ID}">{$_skalinks_lang.header_links.add_url_link}</a> |
      <a class="menu_nav" href="{$_skalinks_url.dir}search.php">{$_skalinks_lang.header_links.find_url}</a> |
      <a class="menu_nav" href="{$_skalinks_url.dir}dirtree.php">{$_skalinks_lang.header_links.dir_tree}</a> | 
      {if $ADMIN.Type == 2}
      <a class="menu_nav" href="{$_skalinks_url.admin}ads_settings.php">{$_skalinks_lang.header_links.ads_settings}</a> |
      <a class="menu_nav" href="{$_skalinks_url.admin}letter_template.php">{$_skalinks_lang.header_links.letter_template}</a> |
      <a class="menu_nav" href="{$_skalinks_url.admin}settings.php">{$_skalinks_lang.header_links.settings}</a> | 
      <a class="menu_nav" href="{$_skalinks_url.admin}admin_account.php">{$_skalinks_lang.header_links.editors}</a> |  
      {/if}
      <a class="menu_nav" href="{$_skalinks_url.admin}">{$_skalinks_lang.header_links.ctrlpanel}</a>
      {else}
	    <div id="navigation_center">
	    {if $_output.visitor_add_cat}
	    <a class="menu_nav" rel="nofollow" href="{$_skalinks_url.dir}add_cat.php?cat={$_output.cat_info.ID}">{$_skalinks_lang.header_links.add_cat_link}</a> |
	    {/if}
	    <a class="menu_nav" rel="nofollow" href="{$_skalinks_url.dir}add_url.php?cat={$_output.cat_info.ID}">{$_skalinks_lang.header_links.add_url_link}</a> |
	    <a class="menu_nav" href="{$_skalinks_url.dir}search.php">{$_skalinks_lang.header_links.find_url}</a>
            {if $_output.register_users}
	    | <a class="menu_nav" href="{$_skalinks_url.dir}admin/index.php">{$_skalinks_lang.header_links.login}</a>
            | <a class="menu_nav" href="{$_skalinks_url.dir}admin/register.php">{$_skalinks_lang.header_links.register}</a>{/if}
	       {if $_output.show_dirtree}
	        | <a class="menu_nav" href="{$_skalinks_url.dir}dirtree.php">{$_skalinks_lang.header_links.dir_tree}</a>
	       {/if}
	     {/if}
	    
	       {else}
	       
		  {if $ADMIN.Name}
		     <div id="navigation_center">
		     <a class="menu_nav" href="{$_skalinks_url.dir}">{$_skalinks_lang.header_links.directory}</a> | 
		     <a class="menu_nav" href="{$_skalinks_url.dir}search.php">{$_skalinks_lang.header_links.find_url}</a> |
		     <a class="menu_nav" href="{$_skalinks_url.dir}dirtree.php">{$_skalinks_lang.header_links.dir_tree}</a> | 
		     {if $ADMIN.Type == 2}
		     <a class="menu_nav" href="{$_skalinks_url.admin}ads_settings.php">{$_skalinks_lang.header_links.ads_settings}</a> |
		     <a class="menu_nav" href="{$_skalinks_url.admin}letter_template.php">{$_skalinks_lang.header_links.letter_template}</a> | 
		     <a class="menu_nav" href="{$_skalinks_url.admin}settings.php">{$_skalinks_lang.header_links.settings}</a> | 
		     <a class="menu_nav" href="{$_skalinks_url.admin}admin_account.php">{$_skalinks_lang.header_links.editors}</a> |  
		     {/if}
		     <a class="menu_nav" href="{$_skalinks_url.admin}">{$_skalinks_lang.header_links.ctrlpanel}</a>
			{else}
			   <div id="navigation_center">
			   <a class="menu_nav" href="{$_skalinks_url.dir}">{$_skalinks_lang.header_links.directory}</a> | 
			   <a class="menu_nav" href="{$_skalinks_url.dir}search.php">{$_skalinks_lang.header_links.find_url}</a>
			   {if $_output.register_users}
			   | <a class="menu_nav" href="{$_skalinks_url.dir}admin/index.php">{$_skalinks_lang.header_links.login}</a>
		           | <a class="menu_nav" href="{$_skalinks_url.dir}admin/register.php">{$_skalinks_lang.header_links.register}</a> {/if}
			       
				  {if $_output.show_dirtree}
				 
				  | <a class="menu_nav" href="{$_skalinks_url.dir}dirtree.php">{$_skalinks_lang.header_links.dir_tree}</a>
				 
				 {/if}
				 {/if}
			   {/if}   
</div><div id="navigation_right"></div></div>

{if $_output.menu}   
	{if $ADMIN.Name}
		{if $_output.show_admin_ads}
			<div class="for_banner">{show_ads id=$_output.cat_info.ID type=$type position=top}</div>
		{/if}
	{else}
	    <div class="for_banner">{show_ads id=$_output.cat_info.ID type=$type position=top}</div>
	{/if}    
{else}
	{if $ADMIN.Name}
		{if $_output.show_admin_ads}
			<div class="for_banner">{show_ads id=$_output.cat_info.ID type=$type position=top}</div>
        {/if}
	{else}
		<div class="for_banner">{show_ads id=0 type=$type position=top}</div>
 	 {/if}
{/if}   
{if $msg}
<div class=msg>{$msg}<br></div>
{/if}
