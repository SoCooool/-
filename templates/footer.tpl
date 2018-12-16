{if ( ( !$ADMIN ) || ( $ADMIN && $_output.show_admin_ads ) )}
<div class="for_banner">{show_ads id=$_output.cat_info.ID type=$type position=bottom}</div>
{/if}
<div id="footer">(c) Copyright <a class=sub_cat href="{$_skalinks_url.main_site}">{$_skalinks_site.brand}</a><br> 2005. Powered by <a class=sub_cat href="http://www.skalinks.com">SkaLinks - Link Exchange Script</a><br><br><br>
</div>
</div>
</body>
</html>
