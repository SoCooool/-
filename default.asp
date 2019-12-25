<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="header.asp" -->
<div id="default">
<div id="default_bg">
	<div id="default_right">
		<div id="dc_show">
			<div style="margin-bottom: 4px;"></div>
			<!-- hot coolsite -->
			<div class="dc_show_mian">
			<div class="dc_show_bg">
				<div class="dc_show_l">
					<%Dim T_coolsite
					Set T_coolsite=Conn.ExeCute("SELECT Top 1 * FROM coolsite Where c_TopShow=True ORDER BY c_PostTime DESC")
					IF T_coolsite.EOF AND T_coolsite.BOF Then
						Response.Write("None!")
					Else
						IF T_coolsite("c_TopShow_Image")<>Empty Then
							Response.Write("<img src="""&T_coolsite("c_TopShow_Image")&""" align=""absmiddle"" />")
						Else
							Response.Write("<img src=""images/icon_nonpreview.gif"">")
						End If
						Response.Write("<p><a href=""coolsite.asp?ID="&T_coolsite("c_ID")&"#Cool"&T_coolsite("c_ID")&"""><strong>"&HTMLEncode(cutStr(T_coolsite("c_Name"),20))&"</strong></a></p>")
						Response.Write("<p>"&HTMLEncode(cutStr(T_coolsite("c_Info"),50))&"</p>")
					End IF
					T_coolsite.Close
					Set T_coolsite=Nothing%>
				</div>
				<div class="dc_show_r">推荐酷站</div>
			</div>
			</div>
			<!-- hot download -->
			<div class="dc_show_mian">
			<div class="dc_show_bg">
				<div class="dc_show_l">
					<%Dim T_Download
					Set T_Download=Conn.ExeCute("SELECT Top 1 * FROM Download Where downl_TopShow=True AND downl_IsShow=True ORDER BY downl_PostTime DESC")
					IF T_Download.EOF AND T_Download.BOF Then
						Response.Write("None!")
					Else
						IF T_Download("downl_TopShow_Image")<>Empty Then
							Response.Write("<img src="""&T_Download("downl_TopShow_Image")&""" align=""absmiddle"" />")
						Else
							Response.Write("<img src=""images/icon_nonpreview.gif"">")
						End If
						Response.Write("<p><a href=""download.asp?downID="&T_Download("downl_ID")&"#down"&T_Download("downl_ID")&"""><strong>"&HTMLEncode(cutStr(T_Download("downl_Name"),19))&"</strong></a></p>")
						Response.Write("<p>"&HTMLEncode(cutStr(T_Download("downl_Comment"),52))&"</p>")
					End IF
					T_Download.Close
					Set T_Download=Nothing%>
				</div>
				<div class="dc_show_r">推荐下载</div>
			</div>
			</div>
			<!-- my info -->
			<div class="dc_show_mian">
			<div class="dc_show_bg">
				<div class="dc_show_l"><%=""&eblog.setup(7,0)&""%></div>
				<div class="dc_show_r">我的信息</div>
			</div>
			</div>
		</div>
			<!-- SiteInfo -->
			<div class="s_show_head"><span class="gaoliang">站点统计</span> [ <%=""&eblog.setup(3,0)&""%> ]</div>
			<div class="s_show_mian">
			<div class="s_show_bg">
				<div class="s_show_l">
					<p>‧ <a href="blog.asp">文章：<%=""&eblog.setup(8,0)&""%></a></p>
					<p>‧ <a href="photo.asp">图片：<%=""&eblog.setup(16,0)&""%></a></p>
					<p>‧ <a href="tblist.asp">引用：<%=""&eblog.setup(11,0)&""%></a></p>
				</div>
				<div class="s_show_r">
					<p>‧ <a href="commlist.asp">评论：<%=""&eblog.setup(9,0)&""%></a></p>
					<p>‧ <a href="download.asp">下载：<%=""&eblog.setup(14,0)&""%>|<%=""&eblog.setup(17,0)&""%></a></p>
					<p>‧ <a href="blogvisit.asp">访问：<%=""&eblog.setup(12,0)&""%></a></p>
				</div>
				<div class="s_show_c">
					<p>‧ <a href="guestbook.asp">留言：<%=""&eblog.setup(15,0)&""%></a></p>
					<p>‧ <a href="coolsite.asp">酷站：<%=""&eblog.setup(13,0)&""%></a></p>
					<p>‧ <a href="member.asp">成员：<%=""&eblog.setup(10,0)&""%></a></p>
				</div>
			</div>
			</div>
			<!-- NewCommList -->
			<div id="menu1" style="DISPLAY: block">
				<div class="s_show_head"><span class="gaoliang"><a style="CURSOR: hand" onclick=javascript:changebar(1)>最新文章评论</A></span>&nbsp;&nbsp;&nbsp;&nbsp;<A style="CURSOR: hand" onclick=javascript:changebar(2)>最新相册评论</A></div>
				<div class="s_show_mian">
				<div class="s_show_bg1">
					<div id="content1"><%Call NewCommList(36)%></div>
				</div>
				</div>
			</div>
			<!-- Photo_CommList -->
			<div id="menu2" style="DISPLAY: none">
				<div class="s_show_head"><span class="gaoliang"><a style="CURSOR: hand" onclick=javascript:changebar(2)>最新图片评论</A></span>&nbsp;&nbsp;&nbsp;&nbsp;<A style="CURSOR: hand" onclick=javascript:changebar(1)>最新日志评论</A></div>
				<div class="s_show_mian">
				<div class="s_show_bg1">
					<div id="content2"><%Call PhotoCommList(36)%></div>
				</div>
				</div>
			</div>
			<!-- Others -->
			<div class="s_show_head"><span class="gaoliang">其他信息</span></div>
			<div class="s_show_mian">
			<div class="s_show_bg">
				<div class="s_show_l">
					<p><img src="images/eblog.png" border="0" alt="E-BLOG" align="absmiddle"/></p>
					<p><img src="images/utf8.png" border="0" alt="BLOG编码" align="absmiddle"/></p>
				</div>
				<div class="s_show_r">
					<p><img src="images/gbk.png" border="0" alt="BLOG编码" align="absmiddle"/></p>
					<p><a href="blogrss2.asp" target="new"><img src="images/rss2.png" border="0" alt="RSS 2.0" align="absmiddle"/></a></p>
				</div>
				<div class="s_show_c">
					<p><img src="images/cc.png" border="0" alt="CC" align="absmiddle"/></p>
					<p><a href="blogrss1.asp" target="new"><img src="images/rss1.png" border="0" alt="RSS 1.0" align="absmiddle"/></a></p>
				</div>
			</div>
			</div>
                        <!-- Others -->
			<div class="s_show_head"><span class="gaoliang">站点广告</span></div>
			<div class="s_show_mian">
			<div class="s_show_bg"><script type="text/javascript"><!--
google_ad_client = "pub-9250346185801484";
google_ad_width = 290;
google_ad_height = 250;
google_ad_format = "300x250_as";
google_ad_type = "text_image";
google_ad_channel ="";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
                        </div>
			</div>
	</div>

	<div id="default_left">
		<div class="d_new_head"><span class="gaoliang">最近更新</span></div>
		<div class="d_new">
			<!-- new photo -->
			<%Dim photo_new
			Set photo_new=Conn.ExeCute("SELECT Top 1 ph_ID,ph_Name,ph_Thumbnail,ph_Image,ph_Remark FROM photo ORDER BY ph_PostTime DESC")
			IF photo_new.EOF AND photo_new.BOF Then
				Response.Write("None!")
			Else
				Dim ph_Img,ph_Image,ph_Images
				ph_Img=photo_new("ph_Image")
				ph_Image=split(ph_Img,vbcrlf)
				Dim ph_Image0
				ph_Image0=ph_Image(0)
				If Not (Right(ph_Image0, 1) = "@") Then ph_Image0 = ph_Image0 & "@"
				ph_Images=split(ph_Image0,"@")
				'Ph_Images=split(photo_new("ph_Image"),"@")
				IF photo_new("ph_Thumbnail")<>Empty Then
					Response.Write("<img src="""&photo_new("ph_Thumbnail")&"?v=0"" align=""absmiddle"" width=200 height=230/>")
				ElseIf photo_new("ph_Thumbnail")=Empty Then
					Response.Write("<a href=""photoshow.asp?photoID="&photo_new("ph_ID")&"""><img src="""&Ph_Images(0)&"?v=0"" align=""absmiddle"" width=200 height=230 border=0 /></a>")
				Else
					Response.Write("<img src=""images/icon_nonpreview.gif"" align=""absmiddle"" width=200 height=230 />")
				End If
				Response.Write("<p><a href=""photoshow.asp?photoID="&photo_new("ph_ID")&"""><h4>"&HTMLEncode(cutStr(photo_new("ph_Name"),20))&"</h4></a>&nbsp;&nbsp;[<a href=""photo.asp"">Photo</a>]</p>")
				Response.Write("<p>"&HTMLEncode(cutStr(photo_new("ph_Remark"),108))&"</p>")
			End IF
			photo_new.Close
			Set photo_new=Nothing%>
			<p style="margin-bottom: 10px;"></p>
			<!-- new log -->
			<%Dim webLog
			Set webLog=Server.CreateObject("Adodb.Recordset")
			SQL="SELECT Top 7 * FROM blog_Content WHERE log_IsShow=True ORDER BY log_Posttime DESC"
			webLog.Open SQL,CONN,1,1
			SQLQueryNums=SQLQueryNums+1
			If webLog.EOF AND webLog.BOF Then 
				Response.Write("None!")
			Else
				Dim weblog_ID,log_IsShow,log_Weather,log_Emot
				Do Until webLog.EOF OR webLog.BOF
					weblog_ID=weblog("log_ID")%>
					<p class="line_n">[ <%=""&DateToStr(weblog("log_PostTime"),"m-d")&""%> ] <a href="blogview.asp?logID=<%=""&weblog_ID&""%>"><%=""&cutStr(webLog("log_Title"),28)&""%></a></p>
				<%webLog.MoveNext
				Loop
			End If
			webLog.Close
			Set webLog=Nothing%>
		</div>
<!-- 希望站长你能帮我免费做一下广告,无限感激AD -->
		<div style="margin-bottom: 6px;"></div>
		<!-- 站点广告 -->
		<div class="d_new_head"><span class="gaoliang">站点广告</span></div>
		<div class="d_new" align="center"><script type="text/javascript"><!--
google_ad_client = "pub-9250346185801484";
google_ad_width = 440;
google_ad_height = 50;
google_ad_format = "468x60_as_rimg";
google_cpa_choice = "CAAQwZOgnAIaCJucFLWOC_hBKJnA93M";
google_ad_channel = "";
//--></script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
		<!-- Hot日志 -->
		<div class="d_new_head"><span class="gaoliang">Hot文章</span></div>
		<div class="d_new">
			<%Dim hotlog
			Set hotlog=Server.CreateObject("Adodb.Recordset")
			SQL=("SELECT Top 10 * FROM (SELECT * FROM blog_Content WHERE log_IsShow=True ORDER BY log_ViewNums DESC)")
			hotlog.Open SQL,CONN,1,1
			SQLQueryNums=SQLQueryNums+1%>
				<%If hotlog.EOF AND hotlog.BOF Then
					Response.Write("None!")
				Else%>
					<%Do Until hotlog.EOF OR hotlog.BOF%>
					<p class="line_n"><img src="images/icon_update.gif" align="absmiddle" alt="" />[ <%=""&DateToStr(hotlog("log_PostTime"),"Y-m-d H:I A")&""%> ]&nbsp;&nbsp;<a href="blogview.asp?logID=<%=""&hotlog("log_ID")&""%>" title="标题：<%=""&hotlog("log_Title")&""%>&#13;&#10;作者：<%=""&hotlog("log_Author")&""%>&#13;&#10;浏览次数：<%=""&hotlog("log_ViewNums")&""%>&#13;&#10;发表时间：<%=""&hotlog("log_PostTime")&""%>"><%=""&cutStr(hotlog("log_Title"),30)&""%></a>&nbsp;&nbsp;&nbsp;&nbsp;Views: <%=""&hotlog("log_ViewNums")&""%></p>
					<%hotlog.MoveNext
					Loop%>
				<%End If
			hotlog.Close
			Set hotlog=Nothing%>
		</div>
		<!-- 本站搜索 -->
		<div class="d_new_head"><span class="gaoliang">本站搜索</span></div>
		<div class="d_new"><script language="JavaScript" src="js/blog_search_d.js"></script></div>

		<!-- Hot下载,酷站 -->
		<div class="h_dc">
		<div class="h_dc_bg">
			<div class="h_dc_l">
				<!-- Hot下载 -->
				<div class="h_dc_head"><span class="gaoliang">Hot下载</span></div>
				<%Dim H_Down
				Set H_Down=Conn.ExeCute("SELECT Top 5 * FROM (SELECT * FROM Download Where downl_IsShow=True ORDER BY downl_Nums DESC)")
				IF H_Down.EOF AND H_Down.BOF Then
					Response.Write("None!")
				Else
					Do Until H_Down.EOF OR H_Down.BOF%>
					<p class="line_n"><a href="download.asp?downID=<%=""&H_Down("downl_ID")&""%>#down_<%=""&H_Down("downl_ID")&""%>" title="名称：<%=""&H_Down("downl_Name")&""%>&#13;&#10;下载次数：<%=""&H_Down("downl_Nums")&""%>&#13;&#10;上传时间：<%=""&DateToStr(H_Down("downl_PostTime"),"Y-m-d")&""%>"><%=""&HTMLEncode(cutStr(H_Down("downl_Name"),22))&""%></a><span class="h_dc_c"><%=""&DateToStr(H_Down("downl_PostTime"),"Y-m-d")&""%></span></p>
					<%H_Down.MoveNext
					Loop
				End IF
				H_Down.Close
				Set H_Down=Nothing%>
			</div>
			<div class="h_dc_r">
				<!-- Hot酷站 -->
				<div class="h_dc_head"><span class="gaoliang">Hot酷站</span></div>
				<%Dim H_coolsite
				Set H_coolsite=Conn.ExeCute("SELECT Top 5 * FROM (SELECT * FROM coolsite ORDER BY c_viewNums DESC)")
				IF H_coolsite.EOF AND H_coolsite.BOF Then
					Response.Write("None!")
				Else
					Do Until H_coolsite.EOF OR H_coolsite.BOF%>
					<p class="line_n"><a href="coolsite.asp?ID=<%=""&H_coolsite("c_ID")&""%>#Cool<%=""&H_coolsite("c_ID")&""%>" title="Title：<%=""&H_coolsite("c_Name")&""%>&#13;&#10;Views：<%=""&H_coolsite("c_viewNums")&""%>&#13;&#10;Update Time：<%=""&DateToStr(H_coolsite("c_PostTime"),"Y-m-d")&""%>&#13;&#10;Url：<%=""&H_coolsite("c_Url")&""%>"><%=""&HTMLEncode(cutStr(H_coolsite("c_Name"),22))&""%></a></p>
					<%H_coolsite.MoveNext
					Loop
				End IF
				H_coolsite.Close
				Set H_coolsite=Nothing%>
			</div>
		</div>
		</div>
		<!-- links -->
		<div id="link">
		<div id="link_bg">
			<div id="links_head"><span class="gaoliang"><a href="links.asp" class="active">友情连接</a></span>&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<div id="links_main">
			<div id="links_main_bg">
				<%eblog.links("Mimage")%>
			</div>
			</div>
			<div id="links_main">
			<div id="links_main_bg">
				<ul>
					<%eblog.links("Mtext")%>
				</ul>
			</div>
			</div>
		</div>
		</div>
	</div>
</div>
</div>
<!--#include file="footer.asp" -->