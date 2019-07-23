<!--#include file="inc/inc_syssite.asp" -->
<%Dim siteText
	siteText = "酷站"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<div id="coolsite_main">
<div id="coolsite_main_bg">
<%Dim Url_Add
	Url_Add="?"

Dim CurPage
If CheckStr(Request.QueryString("Page"))<>Empty Then
	Curpage=CheckStr(Request.QueryString("Page"))
	If IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
Else
	Curpage=1
End If

Dim Cool
Set Cool=Server.CreateObject("Adodb.Recordset")
SQL="SELECT * FROM coolsite ORDER BY c_IsTop ASC,c_PostTime Desc"
Cool.Open SQL,CONN,1,1
SQLQueryNums=SQLQueryNums+1
If Cool.EOF AND Cool.BOF Then 
	Response.Write("<div><h4>暂时没有收藏COOL站</h4></div>")
Else
	Dim ID,Author,Istop
	Cool.PageSize=coolsitepage
	Cool.AbsolutePage=CurPage
	coolsite_Num=Cool.RecordCount
	Dim coolsite_Num,MultiPages,PageCount
	MultiPages=""&MultiPage(coolsite_Num,coolsitepage,CurPage,Url_Add)&""
	Response.Write("<div id=""coolsite_nav"">")
	Response.Write("<div id=""coolsite_nav_bg"">")
		Response.Write("<div id=""coolsite_nav_right"">"&MultiPages&"</div>")
		Response.Write("<div id=""coolsite_nav_left""><img src=""images/coolsite/1.gif"" alt=""我要推荐酷站"" align=""absmiddle"" /><strong>推荐酷站,请<a href=""mailto:lwcncn@163.com"">email</a>我</strong></div>")
	Response.Write("</div>")
	Response.Write("</div>")

	Response.Write("<table width=""100%"" border=""0"" align=""left"" cellpadding=""0"" cellspacing=""4"">")
	Response.Write("<tr>")
	Dim n,coolsite_main
	n = 0
	Do Until Cool.EOF OR PageCount=coolsitepage
		ID=Cool("c_ID")
		Author=Cool("c_Author")
		Istop=Cool("c_Istop")
	If n = 0 then
    	coolsite_main = "coolsite_content_a"
	else
    	coolsite_main = "coolsite_content_b"
 	end if
	Response.Write("<a name=""Cool"&ID&"""></a>")
    Response.Write("<td width=""50%"" class="""&coolsite_main&""">")
	Response.Write("<div class=""coolsite_content_left""><a href=""coolsiteshow.asp?ID="&Cool("c_ID")&""" target=""new"">")
	IF Cool("c_Image")<>Empty Then
		Response.Write("<img src="&Cool("c_Image")&" border=""0"" />")
	Else
		Response.Write("<img src=""images/nonpreview.gif"" border=""0"" />")
	End if
	Response.Write("</a></div>")
	Response.Write("<div class=""coolsite_content_right"">")
	Response.Write("<p><h4><a href=""coolsiteshow.asp?ID="&Cool("c_ID")&""" target=""new"">"&Cool("c_Name")&"</a></h4>")
	If memStatus="8" OR memStatus="7" then Response.Write("&nbsp;<a href=""coolsiteedit.asp?ID="&Cool("c_ID")&""" title=""编辑"" target=""_blank""><img src=""images/icon_edit_02.gif"" border=""0"" align=""absmiddle"" /></a>")
	Response.Write("</p>")
	Response.Write("<div class=""coolsite_solidline""></div>")
    Response.Write("<p><strong>Url：</strong><a href=""coolsiteshow.asp?ID="&Cool("c_ID")&""" target=""new"">"&Cool("c_URL")&"</a></p>")
	Response.Write("<p><strong>Designer：</strong>")
    IF Cool("c_Designer")<>Empty Then
		Response.Write(""&Cool("c_Designer")&"")
	Else
		Response.Write("None")
	End IF
	Response.Write("</p><p><strong>Views：</strong>"&Cool("c_viewNums")&" <strong>Update time：</strong>"&DateToStr(Cool("c_PostTime"),"Y-m-d")&"</p>")
    Response.Write("<p><strong>Explain：</strong>")
    IF Cool("c_Info")<>Empty Then
    	Response.Write(""&Cool("c_Info")&"")
	Else
    	Response.Write("None")
	End IF
	Response.Write("</p></div>")
	Response.Write("</td>")
	If n = 1 then Response.Write("<tr></tr>")
	n = n + 1
 	If n = 2 then n = 0
	Cool.MoveNext
	PageCount=PageCount+1
	Loop
End If
	Response.Write("</tr>")
	Response.Write("</table>")

Cool.Close
Set Cool=Nothing
	Response.Write("<div id=""coolsite_nav"">")
	Response.Write("<div id=""coolsite_nav_bg"">")
		Response.Write("<div id=""coolsite_nav_right"">"&MultiPages&"</div>")
		Response.Write("<div id=""coolsite_nav_left""> </div>")
	Response.Write("</div>")
	Response.Write("</div>")
%>
</div>
</div>
<!--#include file="footer.asp" -->