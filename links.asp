<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<div id="default_main">
	<div class="links_head"><h4>首页显示链接</h4></div>
	<div class="links_main">
		<div class="links_mainbg"><%eblog.links("Mimage")%></div>
	</div>
	<br />
	<div class="links_head"><h4>首页显示文本链接</h4></div>			
	<div class="links_main">
	<div class="links_mainbg">
		<ul>
			<%eblog.links("Mtext")%>
		</ul>
	</div>
	</div>
	<br />
	<div class="links_head"><h4>Blog图片链接</h4></div>
	<div class="links_main">
		<div class="links_mainbg"><%eblog.links("Himage")%></div>
	</div>
	<br />
	<div class="links_head"><h4>Blog文本链接</h4></div>			
	<div class="links_main">
		<div class="links_mainbg">
		<ul>
			<%eblog.links("Htext")%>
		</ul>
		</div>
	</div>
</div>
<!--#include file="footer.asp" -->