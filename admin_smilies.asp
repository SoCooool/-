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
if action="save_smilies" then
	call save_smilies()
else
	call main()
end if
sub main()%>

<form action="admin_smilies.asp?action=save_smilies" method="post" name="smilies" id="smilies">
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="1" bgcolor="#FFFFFF" Class="border">
  <tr>
	<td height="22" colspan="5" class="topbg"><strong>表情管理</strong></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap">删除？</td>
    <td nowrap="nowrap">代码</td>
    <td nowrap="nowrap">名称</td>
    <td nowrap="nowrap">图标</td>
  </tr>
	<%Dim Arr_smilies
	Dim smilies,smiliesList
	Set smiliesList=Server.CreateObject("ADODB.RecordSet")
	smilies="SELECT sm_ID,sm_Image,sm_Text FROM blog_Smilies ORDER BY sm_ID ASC"
	smiliesList.Open smilies,Conn,1,1
	If smiliesList.EOF And smiliesList.BOF Then
		Redim Arr_smilies(3,0)
	Else
		Arr_smilies=smiliesList.GetRows
		Dim smiliesNums,smiliesNumI
		smiliesNums=Ubound(Arr_smilies,2)
		For smiliesNumI=0 To smiliesNums%>
		  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
			<td align="center">
				<input name="smilies_Dele" type="checkbox" id="smilies_Dele" value="<%=""&Arr_smilies(0,smiliesNumI)&""%>">
				<input name="smilies_ID" type="hidden" id="smilies_ID" value="<%=""&Arr_smilies(0,smiliesNumI)&""%>">
			</td>
			<td><input name="smilies_Text" type="text" size="20" id="smilies_Text" value="<%=""&Arr_smilies(2,smiliesNumI)&""%>"></td>
			<td><input name="smilies_Image" type="text" size="40" id="smilies_Image" value="<%=""&Arr_smilies(1,smiliesNumI)&""%>"></td>
			<td><img src="images/smilies/<%=""&Arr_smilies(1,smiliesNumI)&""%>"></td>
		  </tr>
	<%Next
	End If
	smiliesList.Close
	Set smiliesList=Nothing%>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox"></td>
	<td colspan="3">选中本页显示的所有表情</td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td nowrap="nowrap"><strong>添加</strong>：</td>
    <td nowrap="nowrap"><input type="text" size="20" id="new_smilies_Text" name="new_smilies_Text"></td>
    <td colspan="2"><input type="text" size="40" id="new_smilies_Image" name="new_smilies_Image"></td>
  </tr>
  <tr class="tdbg" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
	<td colspan="4" align="center"><input type="submit" name="Submit" value=" 确定编辑 "></td>
  </tr>
</table>
</form>
<%
end sub

sub save_smilies()
Dim EditNums,Edit_ID,Edit_Text,Edit_Image,Edit_Every
	EditNums=0
	Edit_ID=Split(Request.Form("smilies_ID"),",")
	Edit_Text=Split(Request.Form("smilies_Text"),",")
	Edit_Image=Split(Request.Form("smilies_Image"),",")
	For Each Edit_Every IN Edit_ID
		Conn.Execute("UPDATE blog_Smilies SET sm_Image='"&CheckStr(Edit_Image(EditNums))&"',sm_text='"&CheckStr(Edit_Text(EditNums))&"' WHERE sm_ID="&Edit_Every&"")
		SQLQueryNums=SQLQueryNums+1
		EditNums=EditNums+1
	Next
	IF Request.Form("smilies_Dele")<>Empty Then
		Conn.Execute("DELETE * FROM blog_Smilies WHERE sm_ID IN ("&Request.Form("smilies_Dele")&")")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Dim new_smilies_Text,new_smilies_Image
	new_smilies_Image=CheckStr(Request.Form("new_smilies_Image"))
	new_smilies_Text=CheckStr(Request.Form("new_smilies_Text"))
	IF new_smilies_Image<>Empty AND new_smilies_Text<>Empty Then
		Conn.Execute("INSERT INTO blog_Smilies(sm_Image,sm_Text) VALUES ('"&new_smilies_Image&"','"&new_smilies_Text&"')")
		SQLQueryNums=SQLQueryNums+1
	End IF
	Application.Lock()
	Application(cookieName&"_blog_smilies")=""
	Application.UnLock()
	Response.Redirect("?action=main")
end sub%>
<br>
</body>
</html>