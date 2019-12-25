	<%If log_IsShow=True OR (log_IsShow=False And (memStatus="8" OR (memStatus="7" And memName=log_Author))) Then
		Dim CurPage
		If CheckStr(Request.QueryString("Page"))<>Empty Then
			Curpage=CheckStr(Request.QueryString("Page"))
			If IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
			Else
				Curpage=1
			End If
			Dim blog_Comment
			Set blog_Comment=Server.CreateObject("Adodb.RecordSet")
			SQL="SELECT comm_ID,comm_Content,comm_Author,comm_PostTime,comm_DisSM,comm_DisUBB,comm_DisIMG,comm_AutoURL,comm_PostIP,comm_AutoKEY,comm_Face,comm_Hide,comm_EditNums FROM blog_Comment WHERE blog_ID="&logID&" UNION ALL SELECT 0,tb_Intro,tb_Title,tb_PostTime,tb_URL,tb_Site,tb_ID,0,'127.0.0.1',0,0,0,0 FROM blog_Trackback WHERE blog_ID="&logID&" ORDER BY comm_PostTime DESC"
			blog_Comment.Open SQL,Conn,1,1
			SQLQueryNums=SQLQueryNums+1
			IF blog_Comment.EOF AND blog_Comment.BOF Then
				Response.Write("<div id=""view_head""><h4>Comments</h4></div>")
				Response.Write("<div id=""view_connent"">None!</div>")
			Else
				Dim Comm_Nums,MultiPages,PageCount
				blog_Comment.PageSize=commentpage
				blog_Comment.AbsolutePage=CurPage
				Comm_Nums=blog_Comment.RecordCount
				MultiPages=""&MultiPage(Comm_Nums,commentpage,CurPage,Url_Add)&""%>
				<a name="commmark"></a>
				<div id="view_head">
					<div id="view_head_right"><%=""&MultiPages&""%></div>
					<div id="view_head_left"><h4>Comments</h4></div>
				</div>
				<%Do Until blog_Comment.EOF OR PageCount=commentpage
				Dim blog_CommID,blog_CommAuthor,blog_CommContent,blog_CommFace,blog_CommHide,blog_CommEdit
				blog_CommID=blog_Comment("comm_ID")
				blog_CommAuthor=blog_Comment("comm_Author")
				blog_CommContent=blog_Comment("comm_Content")
				blog_CommFace=blog_Comment("comm_Face")
				blog_CommHide=blog_Comment("comm_Hide")
				blog_CommEdit=blog_Comment("comm_EditNums")%>

				<a name="<%=""&blog_CommID&""%>" id="<%=""&blog_CommID&""%>"></a>
				<a name="commmark" id="commmark"></a>
				<!-- 评论人级别及其资料2005/07/05修正 -->
				<%Dim Arr_Member,comm_Members
				Set comm_Members=Server.CreateObject("ADODB.RecordSet")
				SQL="SELECT mem_ID,mem_Name,mem_Email,mem_HideEmail,mem_QQ,mem_Msn,mem_HomePage,mem_Status FROM blog_Member WHERE mem_Name='"&blog_CommAuthor&"'"
				comm_Members.Open SQL,Conn,1,1
				SQLQueryNums=SQLQueryNums+1
				Dim homepage,email,qq,msn
				If comm_Members.EOF And comm_Members.BOF Then
					Dim styles
					styles=""
					homepage=""
					email=""
					qq=""
					msn=""
					Response.Write("<font color=#A1A1A1>Guest</font>")
					Redim Arr_Member(8,0)
				Else
					Arr_Member=comm_Members.GetRows
					Dim comm_MemberI,comm_MemberNums
					comm_MemberNums=Ubound(Arr_Member,2)
					For comm_MemberI=0 To comm_MemberNums
					select case Arr_Member(7,comm_MemberI)
					case "8"
						styles="_SupAdmin"
					case "7"
						styles="_Admin"
					case else
						styles=""
					end select
					'Dim homepage,email,qq,msn
					IF Arr_Member(6,comm_MemberI)<>Empty Then
						homepage=("<a href="""&Arr_Member(6,comm_MemberI)&""" target=""new""><img src=""images/icon_home.gif"" border=""0"" align=""absmiddle"" alt="""&Arr_Member(1,comm_MemberI)&"的个人主页"" /></a>")
					else
						homepage=""
					end if
					IF Arr_Member(2,comm_MemberI)<>Empty And Arr_Member(3,comm_MemberI)=False Then
						email=("<a href=""mailto:"&Arr_Member(2,comm_MemberI)&"""><img src=""images/icon_email.gif"" border=""0"" align=""absmiddle"" alt=""给"&Arr_Member(1,comm_MemberI)&"发送Email"" /></a>")
					else
						email=""
					end if
					IF Arr_Member(4,comm_MemberI)<>Empty Then
						qq=("<img src=""images/icon_QQ.gif"" border=""0"" align=""absmiddle"" alt="""&Arr_Member(1,comm_MemberI)&"的QQ号码 [ "&Arr_Member(4,comm_MemberI)&" ]"" />")
					else
						qq=""
					end if
					IF Arr_Member(5,comm_MemberI)<>Empty Then
						msn=("<img src=""images/icon_msn.gif"" border=""0"" align=""absmiddle"" alt="""&Arr_Member(1,comm_MemberI)&"的Msn [ "&Arr_Member(5,comm_MemberI)&" ]"" />")
					else
						msn=""
					end if
					Next
				End If
				comm_Members.Close
				Set comm_Members=Nothing%>
				<!----------------->
			<div class="comment_main<%=""&styles&""%>">
				<%IF blog_CommID=0 Then%>
					<div class="comment_quote">
						<p><img src="images/icon_ctb.gif" border="0" align="absmiddle" alt="" />&nbsp;引用通告：<a href="<%=""&HTMLEncode(blog_Comment("comm_DisSM"))&""%>" target="new"><%=""&HTMLEncode(blog_Comment("comm_DisUBB"))&""%></a></p>
						<p>标题：<%=""&blog_CommAuthor&""%></p>
						<p>链接：<a href="<%=""&blog_Comment("comm_DisSM")&""%>" target="_blank"><%=""&blog_Comment("comm_DisSM")&""%></a></p>
						<p>摘要：<%=""&HTMLEncode(blog_CommContent)&""%></p>
						<p>时间：<%=""&DateToStr(blog_Comment("comm_PostTime"),"Y-m-d H:I A")&""%><%If memStatus="8" OR memStatus="7" Then Response.Write("&nbsp;<a href=""trackback.asp?action=deltb&logID="&logID&"&tbID="&blog_Comment("comm_DisIMG")&""" title=""删除引用通告"" onClick=""winconfirm('你真的要删除这个引用吗？','trackback.asp?action=deltb&logID="&logID&"&tbID="&blog_Comment("comm_DisIMG")&"'); return false""><img src=""images/icon_del.gif"" border=""0"" align=""absmiddle"" alt=""删除引用通告"" /></a>")%></p>
					</div>
				<%Else%>
					<div class="comment_left">
						<%IF blog_Comment("comm_Face")<>Empty Then
							Response.Write("<img src=""images/face/"&blog_CommFace&".gif"" border=""0"" align=""absmiddle"" />")
						ElseIf blog_Comment("comm_Face")=Empty Then
							Response.Write("<img src=""images/face/0.gif"" border=""0"" align=""absmiddle"" />")
						End If%>
						<br />
						<strong><a href="member.asp?action=view&memName=<%=""&Server.URLEncode(blog_CommAuthor)&""%>" target="new"><%=""&blog_CommAuthor&""%></a></strong>
						<br />
						<%=homepage&" "&email&" "&msn&" "&qq&""%>
					</div>
					<div class="comment_right">
						<%If blog_CommHide=0 OR (memStatus="8" OR memStatus="7" OR memName=blog_CommAuthor) Then
							Response.Write("<div style=""display:none;"" id=""quote_"&blog_CommID&""">"&cutStr(DelQuote(DelUbb(Replace(HTMLEncode(blog_CommContent),"<br>",""))),80)&"</div>"&UbbCode(HTMLEncode(blog_CommContent),blog_Comment("comm_DisSM"),blog_Comment("comm_DisUBB"),blog_Comment("comm_DisIMG"),blog_Comment("comm_AutoURL"),blog_Comment("comm_AutoKEY"))&"")
							Response.Write("<p style=""margin-top: 6px""><a href=""javascript:blogquote('quote_"&blog_CommID&"','"&blog_Comment("comm_Author")&"','"&DateToStr(blog_Comment("comm_PostTime"),"Y-m-d H:I A")&"')"" onFocus=""if(this.blur)this.blur()"" title=""Quote this Post""><img src=""images/icon_quote.gif"" align=""absmiddle"" border=""0""></a>&nbsp;&nbsp;"&DateToStr(blog_Comment("comm_PostTime"),"Y-m-d H:I A")&"</p>")
							If (memName=blog_CommAuthor And blog_CommEdit<3) OR memStatus="8" OR memStatus="7" Then Response.Write("&nbsp;&nbsp;<a href=""commedit.asp?commID="&blog_CommID&""" title=""编辑评论"" target=""_blank""><img src='images/icon_edit.gif' border='0' align='absmiddle'></a>")
							IF (memStatus="7" AND memName=log_Author) OR memStatus="8" Then
								Response.Write("&nbsp;<a href=""blogcomm.asp?action=delecomm&logID="&logID&"&commID="&blog_CommID&""" title=""删除评论"" onClick=""winconfirm('你真的要删除这个评论吗？','blogcomm.asp?action=delecomm&logID="&logID&"&commID="&blog_CommID&"'); return false""><img src=""images/icon_del.gif"" border=""0"" align=""absmiddle"" alt="""" /></a>")
								Response.Write("&nbsp;&nbsp;<a href=""http://whois.pconline.com.cn/whois/?ip="&blog_Comment("comm_PostIP")&""" title=""点击查看IP地址："&blog_Comment("comm_PostIP")&" 的来源"" target=""_blank""><img src=""images/ip.gif"" alt=""点击查看IP地址："&blog_Comment("comm_PostIP")&" 的来源"" border=""0"" align=""absmiddle"" alt="""" /></a>")
							End If
						Else
							Response.Write("<font color=red>This is a Hidden Comment. Please Login as Admin to view it.!</font>")
						End If%>
					</div>
				<%End IF%>
				<div class="comment_navigation"></div>
			</div>
		<%blog_Comment.MoveNext
		PageCount=PageCount+1
		Loop
	End IF
	blog_Comment.Close
	Set blog_Comment=Nothing%>
	<div id="view_head">
		<div id="view_head_right"><%=""&MultiPages&""%></div>
		<div id="view_head_left1"><%=""&log_CateName&""%>&nbsp;<%=""&log_NextLogStr&""%>&nbsp;|&nbsp;<%=""&log_PrevLogStr&""%></div>
	</div>