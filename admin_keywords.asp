<!--#include file="inc/inc_sys.asp"-->
<!--#include file="inc/function.asp"-->
<html>
<head>
<title>分类</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
<SCRIPT language=javascript>
function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll"&&e.disabled!=true)
       e.checked = form.chkAll.checked;
    }
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="bgcolor" >
<br>
<%
dim action
action=trim(request("action"))
if action="save_keywords" then
	call save_keywords()
else
	call main()
end if
sub main()%>

<form action="admin_keywords.asp?action=save_keywords" method="post" name="keywords" id="keywords">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="5" class="topbg"><strong>表情管理</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">删除？</td>
    <td nowrap="nowrap">文本</td>
	<td nowrap="nowrap">链接</td>
    <td nowrap="nowrap">图片</td>
    <td nowrap="nowrap">预览</td>
  </tr>
	<%Dim Arr_keywords
	Dim keywords,keywordsList
	Set keywordsList=Server.CreateObject("ADODB.RecordSet")
	keywords="SELECT key_ID,key_Text,key_URL,key_Image FROM blog_Keywords ORDER BY key_ID ASC"
	keywordsList.Open keywords,Conn,1,1
	If keywordsList.EOF And keywordsList.BOF Then
		Redim Arr_keywords(3,0)
	Else
		Arr_keywords=keywordsList.GetRows
		Dim keywordNums,keywordNumI
		keywordNums=Ubound(Arr_keywords,2)
		For keywordNumI=0 To keywordNums%>
		  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
			<td align="center">
				<input name="key_Dele" type="checkbox" id="key_Dele" value="<%=""&Arr_keywords(0,keywordNumI)&""%>">
				<input name="key_ID" type="hidden" id="key_ID" value="<%=""&Arr_keywords(0,keywordNumI)&""%>">
			</td>
			<td><input name="key_Text" type="text" size="20" id="key_Text" value="<%=""&Arr_keywords(1,keywordNumI)&""%>"></td>
			<td><input name="key_Url" type="text" size="40" id="key_Url" value="<%=""&Arr_keywords(2,keywordNumI)&""%>"></td>
			<td><input name="key_Image" type="text" size="20" id="key_Image" value="<%=""&Arr_keywords(3,keywordNumI)&""%>"></td>
			<td align="center">
				<%if Arr_keywords(3,keywordNumI)<>Empty Then%>
					<img src="images/keywords/<%=""&Arr_keywords(3,keywordNumI)&""%>">
				<%End If%>
			</td>
		  </tr>
	<%Next
	End If
	keywordsList.Close
	Set keywordsList=Nothing%>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox"></td>
	<td colspan="4">选中本页显示的所有关键字</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap"><strong>添加</strong>：</td>
    <td nowrap="nowrap"><input type="text" size="20" id="new_key_Text" name="new_key_Text"></td>
	<td nowrap="nowrap"><input type="text" size="40" id="new_key_Url" name="new_key_Url"></td>
	<td nowrap="nowrap"><input type="text" size="20" id="new_key_Image" name="new_key_Image"></td>
	<td nowrap="nowrap"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="5" align="center"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%
end sub

sub save_keywords()
Dim EditNums,Edit_ID,Edit_Text,Edit_Url,Edit_Image,Edit_Every
	EditNums=0
	Edit_ID=Split(Request.Form("key_ID"),",")
	Edit_Text=Split(Request.Form("key_Text"),",")
	Edit_Url=Split(Request.Form("key_Url"),",")
	Edit_Image=Split(Request.Form("key_Image"),",")
	For Each Edit_Every IN Edit_ID
		Conn.Execute("UPDATE blog_Keywords SET key_Text='"&CheckStr(Edit_Text(EditNums))&"',key_Url='"&CheckStr(Edit_Url(EditNums))&"',key_Image='"&CheckStr(Edit_Image(EditNums))&"' WHERE key_ID="&Edit_Every&"")
		SQLQueryNums=SQLQueryNums+1
		EditNums=EditNums+1
	Next
	IF Request.Form("key_Dele")<>Empty Then
		Conn.Execute("DELETE * FROM blog_Keywords WHERE key_ID IN ("&Request.Form("key_Dele")&")")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Dim new_key_Text,new_key_Url,new_key_Image
	new_key_Text=CheckStr(Request.Form("new_key_Text"))
	new_key_Url=CheckStr(Request.Form("new_key_Url"))
	new_key_Image=CheckStr(Request.Form("new_key_Image"))
	IF new_key_Text<>Empty AND new_key_Url<>Empty Then
		Conn.Execute("INSERT INTO blog_Keywords(key_Text,key_URL,key_Image) VALUES ('"&new_key_Text&"','"&new_key_Url&"','"&new_key_Image&"')")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Application.Lock()
	Application(cookieName&"_blog_keywords")=""
	Application.UnLock()
	Response.Redirect("?action=main")
end sub%>
<br>
</body>
</html>