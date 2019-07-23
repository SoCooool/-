<%Sub MemberCenter '用户中心
	Response.Write("Welcome!&nbsp;&nbsp;")
	IF memName=Empty Then
		Response.Write("<strong>Guest</strong>&nbsp;&nbsp;")
		Response.Write("<a href=""login.asp"">登入</a>&nbsp;&nbsp;<a href=""register.asp"">注册?</a>&nbsp;&nbsp;")
	Else
		Response.Write("<strong>"&memName&"</strong>&nbsp;&nbsp;")
		IF memStatus="8" Then
			Response.Write("<span style=""cursor:hand;"" onmouseover=""showIntro('show_admin');"" onmouseout=""showIntro('show_admin');"">管理</span>&nbsp;&nbsp;")
		End if
		Response.Write("<a href=""member.asp?action=edit"">修改资料</a>&nbsp;&nbsp;")
		Response.Write("<a href=""commlist.asp?memName="&memName&""">评论</a>&nbsp;&nbsp;<a href=""login.asp?action=logout"">登出</a>")
		Response.Write("<div style=""display:none;"" onmouseover=""showIntro('show_admin');"" onmouseout=""showIntro('show_admin');"" id=""show_admin"" class=""show_admin"">")
		Response.Write("<li><a href=""admin_login.asp"" target=""new"">后台管理</a></li>")
		Response.Write("<li><a href=""blogpost.asp"">发布日志</a></li>")
		Response.Write("<li><a href=""downpost.asp"">发布下载</a></li>")
		Response.Write("<li><a href=""coolsitepost.asp"">发布网站</a></li>")
		Response.Write("<li><a href=""photoadd.asp"">添加图片</a></li>")
		Response.Write("<li><a href=""recache.asp"" target=""new"">更新缓存</a></li>")
		Response.Write("</div>")
	End IF
End Sub

Sub SiteInfo '站点统计
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">站点统计</span></div>")
	Response.Write("<div class=""siderbar_main"">")
	Response.Write("<ul>")
	Response.Write("<li><a href=""blog.asp"">日志："&eblog.setup(8,0)&"</a></li>")
	Response.Write("<li><a href=""commlist.asp"">评论："&eblog.setup(9,0)&"</a></li>")
	Response.Write("<li><a href=""guestbook.asp"">留言："&eblog.setup(15,0)&"</a></li>")
	Response.Write("<li><a href=""tblist.asp"">引用："&eblog.setup(11,0)&"</a></li>")
	Response.Write("<li><a href=""member.asp"">成员："&eblog.setup(10,0)&"</a></li>")
	Response.Write("<li><a href=""blogvisit.asp"">访问："&eblog.setup(12,0)&"</a></li>")
	Response.Write("<li><a href=""download.asp"">下载："&eblog.setup(14,0)&"|"&eblog.setup(17,0)&"</a></li>")
	Response.Write("<li>建立时间："&eblog.setup(3,0)&"</li>")
	Response.Write("</ul>")
	Response.Write("</div></p>")
End Sub

Sub NewBlogList '最新Bolg列表
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">最新日志</span></div>")
	Response.Write("<div class=""siderbar_main""><ul>")
	Dim log_newlist
	Set log_newlist=Conn.Execute("SELECT TOP "&topwlog&" T.log_ID,T.log_Title,T.log_Author,log_PostTime,log_Content,log_IsShow,log_ViewNums FROM blog_Content T,blog_Category C WHERE T.log_cateID=C.cate_ID ORDER BY T.log_PostTime DESC")
	IF log_newlist.EOF AND log_newlist.BOF Then
		Response.Write("暂没有日志")
	Else
		Do While NOT log_newlist.EOF
		IF log_newlist("log_IsShow")=False Then
			Response.Write("<li><a href='blogview.asp?logID="&log_newlist("log_ID")&"' title='Hidden Weblog，No preview'>>> 隐藏的日志</a></li>")
		Else
			Response.Write("<li><a href='blogview.asp?logID="&log_newlist("log_ID")&"' title="""&HTMLEncode(log_newlist("log_Author"))&" 于 "&DateToStr(log_newlist("log_PostTime"),"Y-m-d H:I A")&" 发表日志：:&#13;&#10;"&Replace(Left(DelQuote(HTMLEncode(log_newlist("log_Content"))),100),"<br>","&#13;&#10;")&"""> "&HTMLEncode(cutStr(log_newlist("log_Title"),20))&"</a></li>")
		End IF
		log_newlist.MoveNext
		Loop
	End IF
	log_newlist.close
	Set log_newlist=Nothing
	Response.Write("</ul>")
	Response.Write("</div></p>")
End Sub

Sub NewCommList(titleNums) '最新评论列表
	Response.Write("<ul>")
	Dim Arr_LastComm '最新评论缓存
	IF Not IsArray(Application(CookieName&"_blog_LastComm")) Then
		Dim log_LastComm,log_LastCommList
		Set log_LastCommList=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT TOP "&topcomment&" C.comm_ID,C.comm_Content,C.comm_Author,C.comm_PostTime,C.comm_Hide,C.blog_ID,L.log_ID,L.log_IsShow FROM blog_Comment AS C,blog_Content AS L WHERE L.log_ID=C.blog_ID ORDER BY comm_PostTime DESC"
		log_LastCommList.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If log_LastCommList.EOF AND log_LastCommList.BOF Then
			Redim Arr_LastComm(8,0)
		Else
			Arr_LastComm=log_LastCommList.GetRows
		End If
		log_LastCommList.Close
		Set log_LastCommList=Nothing
		Application.Lock
		Application(CookieName&"_blog_LastComm")=Arr_LastComm
		Application.UnLock
	Else
		Arr_LastComm=Application(CookieName&"_blog_LastComm")
	End IF
	Dim blog_LastCommListNums,blog_LastCommListNumI
	blog_LastCommListNums=Ubound(Arr_LastComm,2)
	For blog_LastCommListNumI=0 To blog_LastCommListNums
	IF Arr_LastComm(7,blog_LastCommListNumI)=Empty Then
		Response.Write("<li><a href=""blogview.asp?logID="&Arr_LastComm(5,blog_LastCommListNumI)&"#commmark"&Arr_LastComm(0,blog_LastCommListNumI)&""">隐藏日志的评论</a></li>")
	ElseIf Arr_LastComm(4,blog_LastCommListNumI)=0 OR (memStatus=8 OR memStatus=7 OR memName=Arr_LastComm(2,blog_LastCommListNumI)) Then
		IF DelQuote(Arr_LastComm(1,blog_LastCommListNumI))<>Empty Then
			Dim blog_LastCommContent
			blog_LastCommContent=DelUbb(DelQuote(HTMLEncode(Arr_LastComm(1,blog_LastCommListNumI))))
			Response.Write("<li><a href=""blogview.asp?logID="&Arr_LastComm(5,blog_LastCommListNumI)&"#"&Arr_LastComm(0,blog_LastCommListNumI)&""" title="""&Arr_LastComm(2,blog_LastCommListNumI)&" 于 "&DateToStr(Arr_LastComm(3,blog_LastCommListNumI),"Y-m-d H:I A")&" 发表评论：&#13;&#10;"&Replace(Left(blog_LastCommContent,180),"<br>","&#13;&#10;")&""">"&SplitLines(cutStr(Replace(blog_LastCommContent,"<br>",""),titleNums),0)&"</a></li>")
		Else
			Response.Write("<li><a href=""blogview.asp?logID="&Arr_LastComm(5,blog_LastCommListNumI)&"#"&Arr_LastComm(0,blog_LastCommListNumI)&""">没有评论内容，只是引用</a></li>")
		End IF
	Else
		Response.Write("<li><a href=""blogview.asp?logID="&Arr_LastComm(5,blog_LastCommListNumI)&"#"&Arr_LastComm(0,blog_LastCommListNumI)&""">给管理员的悄悄话...</a></li>")
	End IF
	Next
	Response.Write("</ul>")
End Sub

Sub PhotoCommList(titleNums)
	Response.Write("<ul>")
	Dim Arr_PhotoComm
	IF Not IsArray(Application(CookieName&"_Photo_LastComm")) Then
		Dim photo_LastComm,photo_LastCommList
		Set photo_LastCommList=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT TOP "&topphoto_comm&" C.comm_ID,C.comm_Content,C.comm_Author,C.comm_PostTime,C.comm_Hide,C.ph_ID,L.ph_ID FROM photo_Comment AS C,photo AS L WHERE L.ph_ID=C.ph_ID ORDER BY comm_PostTime DESC"
		photo_LastCommList.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If photo_LastCommList.EOF AND photo_LastCommList.BOF Then
			Redim Arr_PhotoComm(7,0)
		Else
			Arr_PhotoComm=photo_LastCommList.GetRows
		End If
		photo_LastCommList.Close
		Set photo_LastCommList=Nothing
		Application.Lock
		Application(CookieName&"_Photo_LastComm")=Arr_PhotoComm
		Application.UnLock
	Else
		Arr_PhotoComm=Application(CookieName&"_Photo_LastComm")
	End IF
	Dim photo_CommListNums,photo_CommListNumI
	photo_CommListNums=Ubound(Arr_PhotoComm,2)
	For photo_CommListNumI=0 To photo_CommListNums
	If Arr_PhotoComm(4,photo_CommListNumI)=1 OR (memStatus="8" OR memStatus="7" OR memName=Arr_PhotoComm(2,photo_CommListNumI)) Then
		Dim photo_CommContent
		photo_CommContent=DelUbb(DelQuote(HTMLEncode(Arr_PhotoComm(1,photo_CommListNumI))))
		Response.Write("<li><a href=""photoshow.asp?photoID="&Arr_PhotoComm(5,photo_CommListNumI)&"#comment"">"&SplitLines(cutStr(Replace(photo_CommContent,"<br>",""),titleNums),0)&"</a></li>")
	Else
		Response.Write("<li><a href=""photoshow.asp?photoID="&Arr_PhotoComm(5,photo_CommListNumI)&"#comment"">给管理员的悄悄话...</a></li>")
	End IF
	Next
	Response.Write("</ul>")
End Sub

Sub blogSearch '站点搜索
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">站内搜索</span></div>")
	Response.Write("<div class=""siderbar_main"">")
	Response.Write("<form name=""blogsearch"" method=""Post"" action=""search.asp""><input name=""SearchContent"" type=""text"" id=""SearchContent"" size=""18"" title=""请输入要搜索的内容"" class=""input_bg"" />")
	Response.Write("<select name=""SearchMethod"">")
    Response.Write("<option value=""1"">--日志标题</option>")
    Response.Write("<option value=""2"">--日志内容</option>")
    Response.Write("<option value=""3"">--评论内容</option>")
	Response.Write("<option value=""4"">--留言内容</option>")
	Response.Write("<option value=""5"">--留言回复</option>")
	Response.Write("</select> <input name=""Submit"" type=""image"" id=""Submit"" value="""" src=""images/search.gif"" align=""absmiddle"" />")
	Response.Write("</form></div></p>")
End Sub

Sub googleSearch 'Google
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">Google搜索</span></div>")
	Response.Write("<div class=""siderbar_main""><script language=""JavaScript"" src=""js/google_search.js""></script>")
	Response.Write("</div></p>")
End Sub

Sub Others '其他信息
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">其他信息</span></div>")
	Response.Write("<div class=""siderbar_main_center"">")
	Response.Write("<p><img src=""images/eblog.png"" border=""0"" alt=""E-BLOG"" align=""absmiddle""></p>")
	Response.Write("<p><a href=""http://www.spreadfirefox.com/?q=affiliates&amp;id=106152&amp;t=83"" target=""_blank""><img border=""0"" alt=""Get Firefox!"" title=""Get Firefox!"" src=""http://sfx-images.mozilla.org/affiliates/Buttons/80x15/white_2.gif""/></a></p>")
	Response.Write("<p><img src=""images/utf8.png"" border=""0"" alt=""BLOG编码"" align=""absmiddle""></p>")
	Response.Write("<p><img src=""images/cc.png"" border=""0"" alt=""CC"" align=""absmiddle""></p>")
	Response.Write("<p><a href=""blogrss1.asp"" target=""new""><img src=""images/rss1.png"" border=""0"" alt=""RSS 1.0"" align=""absmiddle""></a></p>")
	Response.Write("<p><a href=""blogrss2.asp"" target=""new""><img src=""images/rss2.png"" border=""0"" alt=""RSS 2.0"" align=""absmiddle""></a></p>")
	Response.Write("</div></p>")
End Sub

Sub CategoryList(ListStyle) '分类列表 ListStyle 表示调用样式 1-横向 2-竖向
	Dim blog_CategoryNums,blog_CategoryNumI
IF ListStyle=1 Then
	blog_CategoryNums=Ubound(Arr_Category,2)
	For blog_CategoryNumI=0 To blog_CategoryNums
		Response.Write("<li><a href=""blog.asp?cateID="&Arr_Category(0,blog_CategoryNumI)&""" title="""&Arr_Category(1,blog_CategoryNumI)&"分类有("&Arr_Category(4,blog_CategoryNumI)&")篇日志"">"&Arr_Category(1,blog_CategoryNumI)&"</a></li>")
	Next
ElseIF ListStyle=2 Then
	Response.Write("<p><div class=""siderbar_head""><span class=""gaoliang"">日志分类</span></div>")
	Response.Write("<div class=""siderbar_main""><ul>")
	blog_CategoryNums=Ubound(Arr_Category,2)
	For blog_CategoryNumI=0 To blog_CategoryNums
		Response.Write("<li><a href=""blog.asp?cateID="&Arr_Category(0,blog_CategoryNumI)&"""><img src="""&Arr_Category(3,blog_CategoryNumI)&""" border=""0"" align=""absmiddle""> "&Arr_Category(1,blog_CategoryNumI)&" <span class=""smalltxt"">("&Arr_Category(4,blog_CategoryNumI)&")</span></a></li>")	
	Next
		Response.Write("</ul>")
	Response.Write("</div></p>")
Else
	Response.Write("分类列表参数错误,请设置为CategoryList(1),表示调用样式1-横向 2-竖向")
End If
End Sub
%>