<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%Dim siteText
	siteText = "图片"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<table width="772" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
  <tr>
	<td align="left">
		<%Dim Arr_phCates '写入下载分类
		Dim ph_CateList
		Set ph_CateList=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM photo_Category ORDER BY cate_Order ASC"
		ph_CateList.Open SQL,Conn,1,1
		SQLQueryNums=SQLQueryNums+1
		If ph_CateList.EOF And ph_CateList.BOF Then
			Redim Arr_phCates(3,0)
		Else
			Arr_phCates=ph_CateList.GetRows
			Dim Down_CateNums,Down_CateNumI
			Down_CateNums=Ubound(Arr_phCates,2)
			For Down_CateNumI=0 To Down_CateNums
				Response.Write("<img src="""&Arr_phCates(3,Down_CateNumI)&""" border=""0"" align=""absmiddle"" /> <a href=""photo.asp?cateID="&Arr_phCates(0,Down_CateNumI)&""" title=""该分类收藏"&Arr_phCates(4,Down_CateNumI)&"张精彩图片"">"&Arr_phCates(1,Down_CateNumI)&"</a>&nbsp;&nbsp;")
			Next
		End If
		ph_CateList.Close
		Set ph_CateList=Nothing%>
	<td>
  <tr>
</table>
<%Dim Url_Add,cateID,SQLFiltrate
	cateID=CheckStr(Trim(Request.QueryString("cateID")))
	SQLFiltrate="WHERE "
	Url_Add="?"
	IF IsInteger(cateID)=True Then
		SQLFiltrate=SQLFiltrate&" ph_CateID="&CateID&" AND"
		Url_Add=Url_Add&"CateID="&CateID&"&"
	End IF

Dim CurPage
If CheckStr(Request.QueryString("Page"))<>Empty Then
	Curpage=CheckStr(Request.QueryString("Page"))
	If IsInteger(Curpage)=False OR Curpage<0 Then Curpage=1
Else
	Curpage=1
End If%>

<table width="772" border="0" align="center" cellpadding="0" cellspacing="6" bgcolor="#ffffff">
  <tr>
	<%Dim photos
	Set photos=Server.CreateObject("Adodb.Recordset")
	SQL="SELECT L.*,C.cate_Name,C.cate_Image FROM photo AS L,photo_Category AS C "&SQLFiltrate&" C.cate_ID=L.ph_CateID ORDER BY ph_PostTime DESC"
	photos.Open SQL,CONN,1,1
	SQLQueryNums=SQLQueryNums+1
	If photos.EOF AND photos.BOF Then 
		Response.Write("<td><h4>暂时没有收藏图片</h4></td>")
	Else
		photos.PageSize=photopage
		photos.AbsolutePage=CurPage
		coolsite_Num=photos.RecordCount
		Dim coolsite_Num,MultiPages,PageCount
		MultiPages=""&MultiPage(coolsite_Num,photopage,CurPage,Url_Add)&""
		Dim n,m,photo_main
		n = 1
		m = 4 '定义一行显示de列
		Do Until photos.EOF OR PageCount=photopage
			Dim ph_ID,ph_Author,ph_Views,ph_Comments
			ph_ID=photos("ph_ID")
			ph_Author=photos("ph_Author")
			ph_Views=photos("ph_Views")
			'Ph_Images=split(photos("ph_Image"),"@")
			Dim ph_Img,ph_Image,ph_Images
			ph_Img=photos("ph_Image")
			ph_Image=split(ph_Img,vbcrlf)
			Dim ph_Image0
			ph_Image0=ph_Image(0)
			If Not (Right(ph_Image0, 1) = "@") Then ph_Image0 = ph_Image0 & "@"
			ph_Images=split(ph_Image0,"@")
			ph_Comments=photos("ph_Comments")
		If (n mod 2 = 1) then 'mod和% 取模远算符
			photo_main = "photo_content_a"
		else
			photo_main = "photo_content_b"
		end if
		Response.Write("<a name=""photos"&ph_ID&"""></a>")%>
		<td width="25%" valign="top" class="<%=""&photo_main&""%>">
			<p align="center" style="padding-top: 20px;">
				<a href="photoshow.asp?photoID=<%=""&photos("ph_ID")&""%>">
				<%if photos("ph_Thumbnail")<>Empty Then
					Response.Write("<img src="""&photos("ph_Thumbnail")&"?v=0"" border=0 width=120 height=120 />")
				elseif photos("ph_Thumbnail")=Empty Then
					Response.Write("<img src="""&Ph_Images(0)&"?v=0"" border=0 width=120 height=120 />")
				else
					Response.Write("<img src=""images/nonpreview.gif"" border=0 width=120 height=120 />")
				end if%>
				</a>
			</p>
			<p align="center">
				<img src="images/icon_public.gif" border="0" align="absbottom" alt="" />
				<strong><a href="photoshow.asp?photoID=<%=""&photos("ph_ID")&""%>" target="_blan"><%=""&photos("ph_Name")&""%></a></strong>
				<%If memStatus="8" then Response.Write("&nbsp;<a href=""photoedit.asp?photoID="&photos("ph_ID")&""" title=""编辑"" target=""_blank""><img src=""images/icon_edit_02.gif"" border=""0"" align=""absmiddle"" /></a>")%>
			</p>
			<div class="photo_solidline"></div>
			<p>摘要：</p>
			<p style="text-indent: 20px;"><%=""&(UbbCode(HTMLEncode(cutStr(photos("ph_Remark"),110)),0,0,1,1,0))&""%></p>
			<p>浏览次数：<%=""&ph_Views&""%>&nbsp;&nbsp;&nbsp;&nbsp;评论：<%=""&ph_Comments&""%></p>
			<p>添加时间 ：<%=""&photos("ph_PostTime")&""%></p>
		</td>
		<%If n = m then
			Response.Write("<tr></tr>")
			n = 1
		Else
			n = n + 1
		End If
		photos.MoveNext
		PageCount=PageCount+1
		Loop
	End If%>
  <tr>
		<td colspan=4><%=""&MultiPages&""%></td>
	</tr>
</table>
<%photos.Close
Set photos=Nothing%>
<!--#include file="footer.asp" -->