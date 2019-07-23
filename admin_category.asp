<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/function.asp"-->
<html>
<head>
<title>分类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
<%
dim action
action=trim(request("action"))
if action="blog" then
	call blog()
elseif action="save_blog" then
	call save_blog()
elseif action="down" then
	call down()
elseif action="save_down" then
	call save_down()
elseif action="photo" then
	call photo()
elseif action="save_photo" then
	call save_photo()
else
	call main()
end if
sub main()%>

<%end sub
sub blog()%>
<br>
<form action="admin_category.asp?action=save_blog" method="post" name="blog_Category" id="blog_Category">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="6" class="topbg"><strong>日志分类</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">删除？</td>
    <td nowrap="nowrap">名称</td>
    <td nowrap="nowrap">排序</td>
	<td nowrap="nowrap">查看模式</td>
    <td nowrap="nowrap">图标</td>
	<td nowrap="nowrap">操作</td>
  </tr>
	<%Dim Arr_blogCates'写入分类
	Dim blogClass,blog_CateList
	Set blog_CateList=Server.CreateObject("ADODB.RecordSet")
	blogClass="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_viewMode FROM blog_Category ORDER BY cate_Order ASC"
	blog_CateList.Open blogClass,Conn,1,1
	If blog_CateList.EOF And blog_CateList.BOF Then
		Redim Arr_blogCates(3,0)
	Else
		Arr_blogCates=blog_CateList.GetRows
		Dim blog_CateNums,blog_CateNumI
		blog_CateNums=Ubound(Arr_blogCates,2)
		For blog_CateNumI=0 To blog_CateNums%>
		  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
			<td align="center">
				<input name="cate_Dele" type="checkbox" id="cate_Dele" value="<%=""&Arr_blogCates(0,blog_CateNumI)&""%>">
				<input name="cate_ID" type="hidden" id="cate_ID" value="<%=""&Arr_blogCates(0,blog_CateNumI)&""%>">
			</td>
			<td><input name="cate_Name" type="text" size="20" id="cate_Name" value="<%=""&Arr_blogCates(1,blog_CateNumI)&""%>"></td>
			<td><input name="cate_Order" type="text" size="2" id="cate_Order" value="<%=""&Arr_blogCates(2,blog_CateNumI)&""%>"></td>
			<td>
				<select name="cate_viewMode" size="1">
				  <option value="0" <%If Arr_blogCates(4,blog_CateNumI)=0 Then Response.Write("selected")%>>普通</option>
				  <option value="1" <%If Arr_blogCates(4,blog_CateNumI)=1 Then Response.Write("selected")%>>列表</option>
				</select>
			</td>
			<td><input name="cate_Image" type="text" size="40" id="cate_Image" value="<%=""&Arr_blogCates(3,blog_CateNumI)&""%>"></td>
			<td>移动此分类日志到：<select name="Edit_CateMoveTo" id="Edit_CateMoveTo"><option value="0">选择分类</option>
		<%Dim blog_MoveCateNumI
		For blog_MoveCateNumI=0 To blog_CateNums
			Response.Write("<option value='"&Arr_blogCates(0,blog_MoveCateNumI)&"'>"&Arr_blogCates(1,blog_MoveCateNumI)&"</option>")
		Next%>
				</select>
			</td>
		  </tr>
	<%Next
	End If
	blog_CateList.Close
	Set blog_CateList=Nothing%>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="6">&nbsp;</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap"><strong>添加</strong>：</td>
    <td nowrap="nowrap"><input type="text" size="20" id="new_CateName" name="new_CateName"></td>
    <td nowrap="nowrap"><input type="text" size="2" id="new_CateOrder" name="new_CateOrder"></td>
	<td nowrap="nowrap">
		<select name="new_cateViewMode" size="1">
		  <option value="0" selected>普通</option>
		  <option value="1">列表</option>
		</select>
	</td>
    <td colspan="3"><input type="text" size="40" id="new_CateImage" name="new_CateImage"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="6" align="center"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%
end sub

sub save_blog()
Dim Edit_CateID,Edit_CateName,Edit_CateOrder,Edit_CateView,Edit_CateImage,Edit_CateEvery,Edit_CateNums,Edit_CateMoveTo
	Edit_CateNums=0
	Edit_CateID=Split(Request.Form("cate_ID"),",")
	Edit_CateName=Split(Request.Form("cate_Name"),",")
	Edit_CateOrder=Split(Request.Form("cate_Order"),",")
	Edit_CateView=Split(Request.Form("cate_viewMode"),",")
	Edit_CateImage=Split(Request.Form("cate_Image"),",")
	Edit_CateMoveTo=Split(Request.Form("Edit_CateMoveTo"),",")
	For Each Edit_CateEvery  IN Edit_CateID
		IF Edit_CateMoveTo(Edit_CateNums)<>0 Then
			Conn.ExeCute("UPDATE blog_Content SET log_CateID="&Edit_CateMoveTo(Edit_CateNums)&" WHERE log_CateID="&Edit_CateID(Edit_CateNums)&"")
			SQLQueryNums=SQLQueryNums+1
		End IF
		Conn.Execute("UPDATE blog_Category SET cate_Name='"&CheckStr(Edit_CateName(Edit_CateNums))&"',cate_Order="&Edit_CateOrder(Edit_CateNums)&",cate_Image='"&CheckStr(Edit_CateImage(Edit_CateNums))&"',cate_viewMode="&CheckStr(Edit_CateView(Edit_CateNums))&" WHERE cate_ID="&Edit_CateEvery&"")
		SQLQueryNums=SQLQueryNums+1
		Edit_CateNums=Edit_CateNums+1
	Next
	IF Request.Form("cate_Dele")<>Empty Then
		Conn.Execute("DELETE * FROM blog_Category WHERE cate_ID IN ("&Request.Form("cate_Dele")&")")
		Conn.Execute("DELETE * FROM blog_Content WHERE log_CateID IN ("&Request.Form("cate_Dele")&")")
		SQLQueryNums=SQLQueryNums+2
	End IF
	Dim new_CateName,new_CateOrder,new_CateImage,new_cateViewMode
	new_CateName=CheckStr(Request.Form("new_CateName"))
	new_CateOrder=CheckStr(Request.Form("new_CateOrder"))
	new_CateImage=CheckStr(Request.Form("new_CateImage"))
	new_cateViewMode=Request.Form("new_cateViewMode")
	IF new_CateName<>Empty AND new_CateOrder<>Empty Then
		Conn.Execute("INSERT INTO blog_Category(cate_Name,cate_Order,cate_Image,cate_viewMode) VALUES ('"&new_CateName&"',"&new_CateOrder&",'"&new_CateImage&"',"&new_cateViewMode&")")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Application.Lock()
	Application(cookieName&"_blog_Category")=""
	Application.UnLock()
	Response.Redirect("?action=blog")
end sub

sub down()%>
<br>
<form action="admin_category.asp?action=save_down" method="post" name="blog_Category" id="blog_Category">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="5" class="topbg"><strong>下载分类</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">删除？</td>
    <td nowrap="nowrap">名称</td>
    <td nowrap="nowrap">排序</td>
    <td nowrap="nowrap">图标</td>
	<td nowrap="nowrap">操作</td>
  </tr>
	<%Dim Arr_downCates'写入下载分类
	Dim blogClass,blog_CateList
	Set blog_CateList=Server.CreateObject("ADODB.RecordSet")
	blogClass="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM down_Category ORDER BY cate_Order ASC"
	blog_CateList.Open blogClass,Conn,1,1
	If blog_CateList.EOF And blog_CateList.BOF Then
		Redim Arr_downCates(3,0)
	Else
		Arr_downCates=blog_CateList.GetRows
		Dim blog_CateNums,blog_CateNumI
		blog_CateNums=Ubound(Arr_downCates,2)
		For blog_CateNumI=0 To blog_CateNums%>
		  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
			<td align="center">
				<input name="cate_Dele" type="checkbox" id="cate_Dele" value="<%=""&Arr_downCates(0,blog_CateNumI)&""%>">
				<input name="cate_ID" type="hidden" id="cate_ID" value="<%=""&Arr_downCates(0,blog_CateNumI)&""%>">
			</td>
			<td><input name="cate_Name" type="text" size="20" id="cate_Name" value="<%=""&Arr_downCates(1,blog_CateNumI)&""%>"></td>
			<td><input name="cate_Order" type="text" size="2" id="cate_Order" value="<%=""&Arr_downCates(2,blog_CateNumI)&""%>"></td>
			<td><input name="cate_Image" type="text" size="40" id="cate_Image" value="<%=""&Arr_downCates(3,blog_CateNumI)&""%>"></td>
			<td>移动此分类数据到：<select name="Edit_CateMoveTo" id="Edit_CateMoveTo"><option value="0">选择分类</option>
		<%Dim blog_MoveCateNumI
		For blog_MoveCateNumI=0 To blog_CateNums
			Response.Write("<option value='"&Arr_downCates(0,blog_MoveCateNumI)&"'>"&Arr_downCates(1,blog_MoveCateNumI)&"</option>")
		Next%>
				</select>
			</td>
		  </tr>
	<%Next
	End If
	blog_CateList.Close
	Set blog_CateList=Nothing%>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="5">&nbsp;</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap"><strong>添加</strong>：</td>
    <td nowrap="nowrap"><input type="text" size="20" id="new_CateName" name="new_CateName"></td>
    <td nowrap="nowrap"><input type="text" size="2" id="new_CateOrder" name="new_CateOrder"></td>
    <td colspan="2"><input type="text" size="40" id="new_CateImage" name="new_CateImage"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="6" align="center"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%
end sub
sub save_down()
Dim Edit_CateID,Edit_CateName,Edit_CateOrder,Edit_CateImage,Edit_CateEvery,Edit_CateNums,Edit_CateMoveTo
	Edit_CateNums=0
	Edit_CateID=Split(Request.Form("cate_ID"),",")
	Edit_CateName=Split(Request.Form("cate_Name"),",")
	Edit_CateOrder=Split(Request.Form("cate_Order"),",")
	Edit_CateImage=Split(Request.Form("cate_Image"),",")
	Edit_CateMoveTo=Split(Request.Form("Edit_CateMoveTo"),",")
	For Each Edit_CateEvery  IN Edit_CateID
		IF Edit_CateMoveTo(Edit_CateNums)<>0 Then
			Conn.ExeCute("UPDATE Download SET downl_Cate="&Edit_CateMoveTo(Edit_CateNums)&" WHERE downl_Cate="&Edit_CateID(Edit_CateNums)&"")
		End IF
		Conn.Execute("UPDATE down_Category SET cate_Name='"&CheckStr(Edit_CateName(Edit_CateNums))&"',cate_Order="&Edit_CateOrder(Edit_CateNums)&",cate_Image='"&CheckStr(Edit_CateImage(Edit_CateNums))&"' WHERE cate_ID="&Edit_CateEvery&"")
		SQLQueryNums=SQLQueryNums+1
		Edit_CateNums=Edit_CateNums+1
	Next
	IF Request.Form("cate_Dele")<>Empty Then
		Conn.Execute("DELETE * FROM down_Category WHERE cate_ID IN ("&Request.Form("cate_Dele")&")")
		Conn.Execute("DELETE * FROM Download WHERE downl_Cate IN ("&Request.Form("cate_Dele")&")")
		SQLQueryNums=SQLQueryNums+2
	End IF
	Dim new_CateName,new_CateOrder,new_CateImage
	new_CateName=CheckStr(Request.Form("new_CateName"))
	new_CateOrder=CheckStr(Request.Form("new_CateOrder"))
	new_CateImage=CheckStr(Request.Form("new_CateImage"))
	IF new_CateName<>Empty AND new_CateOrder<>Empty Then
		Conn.Execute("INSERT INTO down_Category(cate_Name,cate_Order,cate_Image) VALUES ('"&new_CateName&"',"&new_CateOrder&",'"&new_CateImage&"')")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Application.Lock()
	Application(cookieName&"_blog_download")=""
	Application.UnLock()
	Response.Redirect("?action=down")
end sub

sub photo()%>
<br>
<form action="admin_category.asp?action=save_photo" method="post" name="blog_Category" id="blog_Category">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="5" class="topbg"><strong>相册分类</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">删除？</td>
    <td nowrap="nowrap">名称</td>
    <td nowrap="nowrap">排序</td>
    <td nowrap="nowrap">图标</td>
	<td nowrap="nowrap">操作</td>
  </tr>
	<%Dim Arr_photoCates'写入分类
	Dim blogClass,blog_CateList
	Set blog_CateList=Server.CreateObject("ADODB.RecordSet")
	blogClass="SELECT cate_ID,cate_Name,cate_Order,cate_Image,cate_Nums FROM Photo_Category ORDER BY cate_Order ASC"
	blog_CateList.Open blogClass,Conn,1,1
	If blog_CateList.EOF And blog_CateList.BOF Then
		Redim Arr_photoCates(3,0)
	Else
		Arr_photoCates=blog_CateList.GetRows
		Dim blog_CateNums,blog_CateNumI
		blog_CateNums=Ubound(Arr_photoCates,2)
		For blog_CateNumI=0 To blog_CateNums%>
		  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
			<td align="center">
				<input name="cate_Dele" type="checkbox" id="cate_Dele" value="<%=""&Arr_photoCates(0,blog_CateNumI)&""%>">
				<input name="cate_ID" type="hidden" id="cate_ID" value="<%=""&Arr_photoCates(0,blog_CateNumI)&""%>">
			</td>
			<td><input name="cate_Name" type="text" size="20" id="cate_Name" value="<%=""&Arr_photoCates(1,blog_CateNumI)&""%>"></td>
			<td><input name="cate_Order" type="text" size="2" id="cate_Order" value="<%=""&Arr_photoCates(2,blog_CateNumI)&""%>"></td>
			<td><input name="cate_Image" type="text" size="40" id="cate_Image" value="<%=""&Arr_photoCates(3,blog_CateNumI)&""%>"></td>
			<td>移动此分类图片到：<select name="Edit_CateMoveTo" id="Edit_CateMoveTo"><option value="0">选择分类</option>
		<%Dim blog_MoveCateNumI
		For blog_MoveCateNumI=0 To blog_CateNums
			Response.Write("<option value='"&Arr_photoCates(0,blog_MoveCateNumI)&"'>"&Arr_photoCates(1,blog_MoveCateNumI)&"</option>")
		Next%>
				</select>
			</td>
		  </tr>
	<%Next
	End If
	blog_CateList.Close
	Set blog_CateList=Nothing%>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="5">&nbsp;</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap"><strong>添加</strong>：</td>
    <td nowrap="nowrap"><input type="text" size="20" id="new_CateName" name="new_CateName"></td>
    <td nowrap="nowrap"><input type="text" size="2" id="new_CateOrder" name="new_CateOrder"></td>
    <td colspan="3"><input type="text" size="40" id="new_CateImage" name="new_CateImage"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="5" align="center"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%
end sub

sub save_photo()
Dim Edit_CateID,Edit_CateName,Edit_CateOrder,Edit_CateImage,Edit_CateEvery,Edit_CateNums,Edit_CateMoveTo
	Edit_CateNums=0
	Edit_CateID=Split(Request.Form("cate_ID"),",")
	Edit_CateName=Split(Request.Form("cate_Name"),",")
	Edit_CateOrder=Split(Request.Form("cate_Order"),",")
	Edit_CateImage=Split(Request.Form("cate_Image"),",")
	Edit_CateMoveTo=Split(Request.Form("Edit_CateMoveTo"),",")
	For Each Edit_CateEvery  IN Edit_CateID
		IF Edit_CateMoveTo(Edit_CateNums)<>0 Then
			Conn.ExeCute("UPDATE photo SET ph_CateID="&Edit_CateMoveTo(Edit_CateNums)&" WHERE ph_CateID="&Edit_CateID(Edit_CateNums)&"")
		End IF
		Conn.Execute("UPDATE Photo_Category SET cate_Name='"&CheckStr(Edit_CateName(Edit_CateNums))&"',cate_Order="&Edit_CateOrder(Edit_CateNums)&",cate_Image='"&CheckStr(Edit_CateImage(Edit_CateNums))&"' WHERE cate_ID="&Edit_CateEvery&"")
		SQLQueryNums=SQLQueryNums+1
		Edit_CateNums=Edit_CateNums+1
	Next
	IF Request.Form("cate_Dele")<>Empty Then
		Conn.Execute("DELETE * FROM Photo_Category WHERE cate_ID IN ("&Request.Form("cate_Dele")&")")
		Conn.Execute("DELETE * FROM photo WHERE ph_CateID IN ("&Request.Form("cate_Dele")&")")
		SQLQueryNums=SQLQueryNums+2
	End IF
	Dim new_CateName,new_CateOrder,new_CateImage
	new_CateName=CheckStr(Request.Form("new_CateName"))
	new_CateOrder=CheckStr(Request.Form("new_CateOrder"))
	new_CateImage=CheckStr(Request.Form("new_CateImage"))
	IF new_CateName<>Empty AND new_CateOrder<>Empty Then
		Conn.Execute("INSERT INTO Photo_Category(cate_Name,cate_Order,cate_Image) VALUES ('"&new_CateName&"',"&new_CateOrder&",'"&new_CateImage&"')")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Application.Lock()
	Application(cookieName&"_blog_photo")=""
	Application.UnLock()
	Response.Redirect("?action=photo")
end sub
%>
</body>
</html>