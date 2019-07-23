<!--#include file="inc/inc_syssite.asp" -->
<%Dim siteText
	siteText = "搜索"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<%Dim founderr,errmsg,sucmsg,sucUrl
Dim Search,blog_SearchContent,blog_SearchMethod
blog_SearchContent=CheckStr(Request.Form("SearchContent"))
blog_SearchMethod=CheckStr(Request.Form("SearchMethod"))
IF blog_SearchContent=Empty Then blog_SearchContent=CheckStr(Request.QueryString("SearchContent"))
IF blog_SearchMethod=Empty Then blog_SearchMethod=CheckStr(Request.QueryString("SearchMethod"))
If DateDiff("s",Request.Cookies(CookieName)("memLastsearch"),Now())<60 Then
	FoundErr=True
	errmsg=errmsg & "<li>频繁提交数据!</li>"
ElseIF blog_SearchContent=Empty Then
	FoundErr=True
	errmsg=errmsg & "<li>请输入搜索关键字!</li>"
ElseIf founderr<>True then%>
	<table width="772" border="0" cellpadding="0" cellspacing="4" align="center" bgcolor="#FFFFFF">
	  <tr>
		<td><h3>BLOG 搜索</h3>
		<%Dim CurPage,Url_Add
		IF CheckStr(Request.QueryString("Page"))<>Empty Then
			Curpage=CheckStr(Request.QueryString("Page"))
			IF IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
			Else
				Curpage=1
			End IF
			Url_Add = "?SearchContent="&Server.URLEncode(blog_SearchContent)&"&SearchMethod="&Server.URLEncode(blog_SearchMethod)&"&"
			Set Search=Server.CreateObject("ADODB.RecordSet")
			dim Method_Name
			select case blog_SearchMethod
				case "1"
					SQL="SELECT * FROM blog_Content WHERE log_Title LIKE '%"&blog_SearchContent&"%'"
					Method_Name="日志标题"
				case "2"
					SQL="SELECT * FROM blog_Content WHERE log_Title LIKE '%"&blog_SearchContent&"%' OR log_Content LIKE '%"&blog_SearchContent&"%'"
					Method_Name="日志内容"
				case "3"
					SQL="SELECT T.* FROM blog_Comment C,blog_Content T WHERE C.blog_ID=T.log_ID AND C.comm_Content LIKE '%"&blog_SearchContent&"%'"
					Method_Name="评论内容"
				case "4"
					SQL="SELECT * FROM Guestbook WHERE gb_Content LIKE '%"&blog_SearchContent&"%'"
					Method_Name="留言内容"
				case "5"
					SQL="SELECT * FROM Guestbook WHERE gb_Reply LIKE '%"&blog_SearchContent&"%'"
					Method_Name="留言内容"
			end select
			Search.Open SQL,Conn,1,1
			Response.Write("<div><h5>搜索结果列表</h5> &nbsp;&nbsp;&nbsp;&nbsp;搜索范围:<font color=blue>"&Method_Name&"</font> | 关键字: <font color=red>"&blog_SearchContent&"</font> | 找到: <strong>"&Search.RecordCount&"</strong> 个<hr align=""center"" width=""100%"" size=""1"" noshade=""noshade"" /></div>")
			IF Search.EOF AND Search.BOF Then
				Response.Write("<p>没有符合关键字 '<font color=red>"&blog_SearchContent&"</font>'的搜索结果。</p><p><a href=""javascript:history.go(-1);"">点击返回上一页</a></p>")
			Else
				Search.PageSize=20
				Search.AbsolutePage=CurPage
				Dim Search_Nums
				Search_Nums=Search.RecordCount
				Dim MultiPages,PageCount
				MultiPages=MultiPage(Search_Nums,Search.PageSize,CurPage,Url_Add)
				if MultiPages<>"" then MultiPages="<br />"&MultiPages&""
				Do Until Search.EOF OR PageCount=Search.PageSize
					dim Xurl
					select case blog_SearchMethod
						case "1"
							Xurl="<a href=""blogview.asp?logID="&Search("log_ID")&""" target=""new"">· "&Search("log_Title")&"</a> [ 日期: "&Search("log_PostTime")&" | "&Search("log_CommNums")&" 个评论 ]"
						case "2"
							Xurl="<a href=""blogview.asp?logID="&Search("log_ID")&""" target=""new"">· "&Search("log_Title")&"</a> [ 日期: "&Search("log_PostTime")&" | "&Search("log_CommNums")&" 个评论 ]"
						case "3"
							Xurl="<a href=""blogview.asp?logID="&Search("log_ID")&""" target=""new"">· "&Search("log_Title")&"</a> [ 日期: "&Search("log_PostTime")&" | "&Search("log_CommNums")&" 个评论 ]"
						case "4"
							Xurl="<a href=""guestbook.asp?gbID="&Search("gb_ID")&""" target=""new"">· 留言作者: "&Search("gb_Author")&" [ 日期: "&Search("gb_PostTime")&" ]</a>"
						case "5"
							Xurl="<a href=""guestbook.asp?gbID="&Search("gb_ID")&""" target=""new"">· 回复作者: "&Search("gb_ReplyAuthor")&" [ 日期: "&Search("gb_ReplyTime")&" ]</a>"
					end select
					Response.Write(""&Xurl&"<br>")
					Search.MoveNext
					PageCount=PageCount+1
					Response.Cookies(CookieName)("memLastsearch")=Now()
				Loop
				Response.Write(MultiPages)
			End IF
		Search.Close
		Set Search=Nothing%>
		</td>
	   </tr>
	  </table>
<%End IF
if founderr=True then
	eblog.sys_err(errmsg)
end if
%>
<!--#include file="footer.asp" -->