<!--#include file="inc/inc_sys.asp"-->
<%
dim action,rs,site_placard
Action=trim(request("Action"))
if action="saveconfig" then
	site_placard=request("site_placard")
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select site_placard from blog_Info",conn,1,3
	rs(0)=site_placard
	rs.update
	rs.close
	eblog.reloadsetup
	response.Redirect("admin_placard.asp")
else
	set rs=conn.execute("select site_placard from blog_Info")
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="styles/admin_style.css" rel="stylesheet" type="text/css">
<body class="tdbg">
<br>
<table width="99%" border="0" align="center" cellpadding="2" cellspacing="1" class="border">
  <tr> 
    <td height="25" align="center" class="title"><strong><font color="#FFFFFF">修改网站公告(htm代码)</font></strong></td>
  </tr>
  <tr> 
    <td><form name="form1" method="post" action="admin_placard.asp">
	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td>
                <textarea name="site_placard" style="width:100%;" rows="10" id="edit"><%=rs(0)%></textarea>
				<div align="right"><a href="javascript:chang_size(-3,'site_placard')"><img src="images/admin/minus.gif" unselectable="on" border='0'></a> <a href="javascript:chang_size(3,'site_placard')"><img src="images/admin/plus.gif" unselectable="on" border='0'></a></div>
            </td>
			</tr>
			<tr>
			 <td align="center"><input name="Action" type="hidden" id="Action" value="saveconfig"> 
                <input type="submit" name="Submit" value="提交修改">
			</td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
<%
set rs=nothing
end if
%>