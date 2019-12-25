<!--#include file="inc/inc_syssite.asp" -->
<!--#include file="inc/ubbcode.asp" -->
<%
Dim founderr,errmsg

Dim log_Year,log_Month,log_Day,logID,cateID,Url_Add
	log_Year=CheckStr(Trim(Request.QueryString("log_Year")))
	log_Month=CheckStr(Trim(Request.QueryString("log_Month")))
	log_Day=CheckStr(Trim(Request.QueryString("log_Day")))
	logID=CheckStr(Trim(Request.QueryString("logID")))
	cateID=CheckStr(Trim(Request.QueryString("cateID")))
	IF IsInteger(logID)=False OR (cateID<>Empty AND IsInteger(cateID)=False) Then
		FoundErr=True
		errmsg=errmsg & "<li>对不起，无效的参数，点击返回首页重新操作!</li>"
	Else
		Dim log_View
		Set log_View=Server.CreateObject("ADODB.RecordSet")
		SQL="SELECT * FROM blog_Content WHERE log_ID="&logID&""
		log_View.Open SQL,Conn,1,3
		SQLQueryNums=SQLQueryNums+1
		IF log_View.EOF AND log_View.BOF Then
			FoundErr=True
			errmsg=errmsg & "<li><a href=""blog.asp"">对不起，没有找到相关日志，点击返回首页重新操作</a></li>"
			log_View.Close
			Set log_View=Nothing
		Else
			Dim log_CateID,log_Title,log_Content,log_Author,log_PostTime,log_DisSM,log_DisUBB,log_DisIMG,log_AutoURL,log_From,log_FromURL,log_Modify,log_IsShow,log_QuoteNums,log_AutoKEY,log_DisComment,log_PostYear,log_PostMonth,log_PostDay,log_Weather,log_emot,log_ViewNums,log_CommNums
			log_IsShow=log_View("log_IsShow")
			log_Title=log_View("log_Title")
			If log_IsShow=False Then
				siteTitle = "隐藏日志,无法显示标题"&" - "
			Else
            	siteTitle = log_Title&" - "
			End If
			log_CateID=log_View("log_CateID")
			log_Content=log_View("log_Content")
			log_Author=log_View("log_Author")
			log_PostTime=log_View("log_PostTime")
			log_DisSM=log_View("log_DisSM")
			log_DisUBB=log_View("log_DisUBB")
			log_DisIMG=log_View("log_DisIMG")
			log_AutoURL=log_View("log_AutoURL")
			log_AutoKEY=log_View("log_AutoKEY")
			log_From=log_View("log_From")
			log_FromURL=log_View("log_FromURL")
			log_Modify=log_View("log_Modify")
			log_QuoteNums=log_View("log_QuoteNums")
			log_DisComment=log_View("log_DisComment")
			log_Weather=Split(log_View("log_Weather"),"|")
			log_PostYear=log_View("log_PostYear")
			log_PostMonth=log_View("log_PostMonth")
			log_PostDay=log_View("log_PostDay")
			log_emot=log_View("log_emot")
			log_CommNums=log_View("log_CommNums")
			log_ViewNums=log_View("log_ViewNums")
	  		log_View("log_ViewNums")=log_View("log_ViewNums")+1
			log_View.UPDATE
	  		log_View.Close
	  		Set log_View=Nothing
		End If
	End If%>
<!--#include file="header.asp" -->
<script language="JavaScript" type="text/javascript">
var flag=false; 
function DrawImage(ImgD){ 
	var image=new Image(); 
	image.src=ImgD.src; 
	if(image.width>0 && image.height>0){ 
		flag=true; 
		if(image.width>=730){ 
			ImgD.width=730; 
			ImgD.height=(image.height*730)/image.width; 
		}else{ 
			ImgD.width=image.width; 
			ImgD.height=image.height; 
		}  
	} 
} 
</script>
<%if founderr=True then
	eblog.sys_err(errmsg)
Else
%>
	<div id="view_main">
	<div id="view_main_bg">
		<%Url_Add="?logID="&logID&"&"
		Dim cateQuery,catePage
		If cateID<>Empty Then
			cateQuery=" AND log_cateID="&cateID
			catePage="&cateID="&cateID
			Url_Add=Url_Add&"cateID="&cateID&"&"
		End If

		Dim log_PrevLog,log_PrevLogStr,log_PrevLogTitle,log_NextLog,log_NextLogStr,log_NextLogTitle,log_Cate,log_CateName
		Set log_Cate=Conn.Execute("SELECT cate_Name FROM blog_Category WHERE cate_ID="&log_CateID&"")
		IF log_Cate.EOF AND log_Cate.BOF Then
			log_CateName="&nbsp;"
		Else
			log_CateName="<a href='blog.asp?viewType=byCate&cateID="&log_CateID&"'><strong>"&log_Cate(0)&"</strong></a>"
		End IF
		Set log_Cate=Nothing

		Set log_PrevLog=Conn.Execute("SELECT TOP 1 log_Title,log_ID,log_IsShow,log_Author FROM blog_Content WHERE log_ID<"&logID&""&cateQuery&" ORDER BY log_ID DESC")
		SQLQueryNums=SQLQueryNums+1
		If log_PrevLog.EOF AND log_PrevLog.BOF Then
			log_PrevLogStr=""
		Else
			If log_PrevLog(2) = True OR (log_PrevLog(2)=False And (memStatus="8" OR (memStatus="7" And memName=log_PrevLog(3)))) Then
				log_PrevLogTitle=log_PrevLog(0)
			Else
				log_PrevLogTitle="隐藏日志，无权浏览"
			End If
			log_PrevLogStr="<a href='blogview.asp?logID="&log_PrevLog(1)&""&catePage&"'>"&log_PrevLogTitle&"</a> >>"
		End IF
		Set log_PrevLog=Nothing

		Set log_NextLog=Conn.Execute("SELECT TOP 1 log_Title,log_ID,log_IsShow,log_Author FROM blog_Content WHERE log_ID>"&logID&""&cateQuery&" ORDER BY log_ID ASC")
		SQLQueryNums=SQLQueryNums+1
		If log_NextLog.EOF AND log_NextLog.BOF Then
			log_NextLogStr=""
		Else
			If log_NextLog(2) = True OR (log_NextLog(2)=False And (memStatus="8" OR (memStatus="7" And memName=log_NextLog(3)))) Then
				log_NextLogTitle=log_NextLog(0)
			Else
				log_NextLogTitle="隐藏日志，无权浏览"
			End If
			log_NextLogStr="<< <a href=""blogview.asp?logID="&log_NextLog(1)&""&catePage&""">"&log_NextLogTitle&"</a>"
		End If
		Set log_PrevLog=Nothing%>

		<div id="view_head">
			<div id="view_head_right"><%=log_CateName%>&nbsp;<%=log_NextLogStr%>&nbsp;|&nbsp;<%=log_PrevLogStr%>&nbsp;<a href="#" onclick="history.back()" title="Go back">Go back</a></div>
	<%If log_IsShow = True OR (log_IsShow=False And (memStatus="8" OR (memStatus="7" And memName=log_Author))) Then%>
			<div id="view_head_left"><h4><%=""&log_Title&""%></h4><%IF (memStatus="7" AND memName=log_Author) OR memStatus="8" Then Response.Write("&nbsp;&nbsp;<a href=""blogedit.asp?logID="&logID&"""><img src=""images/icon_edit.gif"" border=""0"" align=""absmiddle"" alt=""编辑日志""></a>")%></div>
		</div>
		<div class="view_info">
			<div class="view_info_left">
				<%Response.Write("Update time："&log_PostYear&"-"&log_PostMonth&"-"&log_Postday&"&nbsp;&nbsp;By <a href=""member.asp?action=view&memName="&Server.URLEncode(log_Author)&""">"&log_Author&"</a>&nbsp;&nbsp;")
				If log_Weather(0)>"0" Then Response.Write("<img src=""images/weather/w_"&log_Weather(0)&".gif"" align=""absmiddle""> <img src=""images/weather/"&log_Weather(0)&".gif"" alt="""&log_Weather(1)&""" align=""absmiddle""> ")
				If log_emot>"0" Then Response.Write("<img src=images/emot/"&log_emot&".gif alt="""&log_emot&"☆"" align=""absmiddle"">")
				Response.Write("&nbsp;&nbsp;Form：<a href="""&log_FromURL&""" target=""new"">"&log_From&"</a>&nbsp;&nbsp;Views："&log_ViewNums&"&nbsp;&nbsp;Comments："&log_CommNums&"")%>
			</div>
 		  <div class="view_info_right">
				<script language="JavaScript" type="text/javascript" >
					//控制字体大小
					function doZoom(size,sizeh)
					{
						var obj=document.all.zoom;
						obj.style.fontSize=size+"px";
						obj.style.lineheight=sizeh+"px";
					}
					//setColor
					function setColor(color_val) {
						document.getElementById('mybgcolor').style.backgroundColor = color_val;
					}
					//getColor
					function getColor() {
					mybgcolor.style.backgroundColor = "#FFFFFF";
					var bg_color = readCookie("bgColor_cookie");
						if (bg_color != null) {
							mybgcolor.style.backgroundColor = bg_color
						}
					}
				</script>
				<a href="javascript:setColor('FAFBE6')"><img height="10" alt="杏仁黄" src="images/color/1.gif" width="10" border="0"></a>
				<a href="javascript:setColor('FFF2E2')"><img height="10" alt="秋叶褐" src="images/color/2.gif" width="10" border="0"></a>
				<a href="javascript:setColor('FDE6E0')"><img height="10" alt="胭脂红" src="images/color/3.gif" width="10" border="0"></a>
				<a href="javascript:setColor('F3FFE1')"><img height="10" alt="芥末绿" src="images/color/4.gif" width="10" border="0"></a>
				<a href="javascript:setColor('DAFAFE')"><img height="10" alt="天蓝" src="images/color/5.gif" width="10" border="0"></a>
				<a href="javascript:setColor('E9EBFE')"><img height="10" alt="雪青" src="images/color/6.gif" width="10" border="0"></a>
				<a href="javascript:setColor('EAEAEF')"><img height="10" alt="灰" src="images/color/7.gif" width="10" border="0"></a>
				<a href="javascript:setColor('FFFFFF')"><img height="10" alt="银河白(默认色)" src="images/color/8.gif" width="10" border="0"></a>&nbsp;
				<a href="javascript:doZoom(16.8,22)"><img src="styles/default/l.gif" alt="大" border="0" align="absbottom" /></a>
				<a href="javascript:doZoom(14.8,20)"><img src="styles/default/m.gif" alt="中" border="0" align="absbottom" /></a>
				<a href="javascript:doZoom(12.8,19)"><img src="styles/default/s.gif" alt="小" border="0" align="absbottom" /></a>
			</div>
			<div class="view_border"></div>
		</div>
		<div class="view_content" id="mybgcolor">
			<span id="zoom"><%Response.Write(UBBCode(HTMLEncode(log_Content),log_DisSM,log_DisUBB,log_DisIMG,log_AutoURL,log_AutoKEY)&"")%></span>
			<%IF log_Modify<>Empty Then Response.Write("<div style=""line-height: 20px;text-align:right"">"&log_Modify&"</div>")%>
			<!-- 跳转重叠层开始 -->
			<div style="height: 16px; clear: both;"></div>
			<div class=tab-pane id=tabPanel>
				<SCRIPT type=text/javascript>
				tp1 = new WebFXTabPane( document.getElementById( "tabPanel" ) );
				</SCRIPT>
				<div class=tab-page id=tabPage0>
					<h5 class=tab>版权信息&nbsp;&nbsp;</h5>
					<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage0" ) );</SCRIPT>
					<div class=teb_content>① 本站发表的文章仅属个人观点。<br>② 凡本站转载的文章如若侵权请与站长联系，万分抱歉，本站会尽快处理妥当。<br>③ 欢迎转载本站部分文章，但请注明出处，同时请不要盗链本站图片或影音文件地址。<br>④ 以上声明解释权归本站站长周滨所有。</div>
				</div>
                                <div class=tab-page id=tabPage1>
					<h5 class=tab>&nbsp;Google&nbsp;Ads&nbsp;&nbsp;</h5>
					<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage1" ) );</SCRIPT>
					<div class=teb_content>
					<script type="text/javascript"><!--
google_ad_client = "pub-9250346185801484";
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_type = "text_image";
google_ad_channel ="";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
				</div>
				<div class=tab-page id=tabPage2>
					<h5 class=tab>搜索相关内容</h5>
					<SCRIPT type=text/javascript>tp1.addTabPage( document.getElementById( "tabPage2" ) );</SCRIPT>
					<div class=teb_content>
						<!-- Search Google -->
<center>
<form method="get" action="http://www.google.cn/custom" target="_top">
<table bgcolor="#ffffff">
<tr><td nowrap="nowrap" valign="top" align="left" height="32">
<a href="http://www.google.com/">
<img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" align="middle"></img></a>
<input type="text" name="q" size="31" maxlength="255" value=""></input>
<input type="submit" name="sa" value="搜索"></input>
<input type="hidden" name="client" value="pub-9250346185801484"></input>
<input type="hidden" name="forid" value="1"></input>
<input type="hidden" name="ie" value="GB2312"></input>
<input type="hidden" name="oe" value="GB2312"></input>
<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#0D8F63;VLC:663399;AH:center;BGC:FFFFFF;LBGC:336699;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;LH:50;LW:559;L:http://ntzhoubin.com/styles/default/header.gif;S:http://ntzhoubin.com/;FORID:1"></input>
<input type="hidden" name="hl" value="zh-CN"></input>
</td></tr></table>
</form>
</center>
<!-- Search Google -->
<br />
					</div>
			       </div>
			</div>
			<!-- 跳转重叠层结束 -->
	<%Else%>
		</div>
			<div class="view_hide"><a href="#" onclick="history.back()" title="Back To Index" /><h4>Sorry，You don't have the permission to view this log！</h4></a></div>
	<%End IF%>
	</div>
</div>
</div>
<!-- 评论开始 -->
<div id="view_main">
<div id="view_main_bg">
	<!-- comments -->
	<!--#include file="comments.asp" -->
<!-- Post comment -->
<%If log_DisComment=False Or (log_DisComment=True And (memStatus="8" Or (memStatus="7" And memName=log_Author))) Then%>
	<div class="comm_post_head"><h4>Post Comment</h4></div>
	<div class="comm_post_main">
	<div class="comm_post_main_bg">
		<div id="comm_post_left">
		<%If eblog.chkiplock() then
			Response.Write("<br><br><div align=""center""><h4>对不起!你的IP已被锁定,不允许发表评论！</h4></div>")
		Else%>
			<script language="JavaScript" src="inc/face.js" type="text/javascript"></script>
			<script language="JavaScript" src="inc/ubbcode.js" type="text/javascript"></script>
			<form action="blogcomm.asp?action=postcomm" method="post" name="inputform" id="inputform" onsubmit="return Verifycomment();">
			<div id="comm_post_left2">
				<table width="74" border="0" cellpadding="0" cellspacing="1" bgcolor="#b6d8e0">
				  <tr>
					<td width="60" height="60" align="center" bgcolor="#FFFFFF"><IMG id="FacePic" src="images/face/1.gif"></td>
					<td align="center" vAlign="top" class="tablelayer">
						<div id="Face" class="face_show"><!--#include file="inc/face.asp" --></div>
						<div style="padding-top:4px;"><img src="images/face_show.gif" alt="选择更多头像" border="0" onclick="yagu()" onmouseover="this.className='FaceDown'"></div>
					</td>
				  </tr>
				  <tr>
				    <td colspan="2" align="center" bgcolor="#FFFFFF">选择头像</td>
			      </tr>
				</table>
			</div>
			<div id="comm_post_right2">
				<p>昵称: 
				<%IF memName<>Empty Then%>
					<input name="username" type="text" id="username" class="input_bg2" value="<%=""&memName&""%>" size="12" readonly />
				<%Else%>
					<input name="username" type="text" id="username" class="input_bg2" maxlength="10" onmouseover="this.focus();" />
					密码: <input name="memPassword" type="password" id="memPassword" class="input_bg2" maxlength="12" />&nbsp;&nbsp;
					<%If Setting(6)="1" Then%>
						<input name="comm_SaveMem" type="checkbox" id="comm_SaveMem" class="input_bg" value="1" /> 注册成员?
					<%End IF%>
				<%End IF%>
				</p>
				<textarea name="message" style="width:99%" rows="6" class="textarea_bg" wrap="VIRTUAL" id="Message" onSelect="javascript: storeCaret(this);" onClick="javascript: storeCaret(this);" onKeyDown="javascript: ctlent();" onKeyUp="javascript: storeCaret(this);"></textarea>
				<div align="left">
					<%=eblog.getcode(1)%>
					<input name="comm_Hide" type="checkbox" class="input_bg" id="comm_Hide" value="1" /> 隐藏内容
					<span style="padding-left:12px;" onclick="showIntro('add_smilies');"></span><a href="ubb.asp" target="new">UBB列表</a>
					<span style="cursor:hand;padding-left:10px;" onclick="showIntro('add_smilies');">添加表情</span>
					<span style="cursor:hand;padding-left:10px;" onclick="showIntro('post_mode');">发表模式</span>
				</div>
				<div style="display: none;" id="post_mode" class="smilies_main">
					<input class="input_bg" name="comm_DisSM" type="checkbox" id="comm_DisSM" value="1" />禁止表情
					<input class="input_bg" name="comm_DisUBB" type="checkbox" id="comm_DisUBB" value="1" />禁止UBB
					<input class="input_bg" name="comm_DisIMG" type="checkbox" id="comm_DisIMG" value="1" />禁止图片
					<input class="input_bg" name="comm_AutoURL" type="checkbox" id="comm_AutoURL" value="1" checked />识别链接
					<input class="input_bg" name="comm_AutoKEY" type="checkbox" id="comm_AutoKEY" value="0" />识别关键字
				</div>
				<div style="display: none;" id="add_smilies" class="smilies_main">
					<%Dim log_SmiliesListNums,log_SmiliesListNumI
					log_SmiliesListNums=Ubound(Arr_Smilies,2)
					TempVar=""
					For log_SmiliesListNumI=0 To log_SmiliesListNums
						Response.Write(TempVar&"<img style=""cursor:hand;"" onclick=""AddText('"&Arr_Smilies(2,log_SmiliesListNumI)&"');"" src=""images/smilies/"&Arr_Smilies(1,log_SmiliesListNumI)&""" />")
					TempVar=" "
					Next%>
				</div>
				<p style="padding-top: 4px;">
					<input name="blog_ID" type="hidden" id="blog_ID" value="<%=logID%>" />
					<input id="userface" type="hidden" value="1" name="userface" />
					<input class="postbtn" type="submit" name="replysubmit" onClick="this.disabled=true;document.inputform.submit();" value="发表" />&nbsp;&nbsp;
					<input class="postbtn" name="Reset" type="reset" id="Reset" value="重置" /></p>
				</p>
				</form>
			</div>
			<%End If%>
		</div>
		<div id="comm_post_right">
			<div class="newtopic">
				<div class="newtopic_main">
					<strong>文章导读:</strong><br /><hr />
					<script src=newtopic.asp?cateid=<%=""&log_CateID&""%>&n=8&orders=3&tlen=22&openmode=0&time=0&nums=0&weather=0></script>
				</div>
			</div>
		</div>
  </div>
  </div>
<%End IF
End IF
End IF%>
</div>
</div>
<!--#include file="footer.asp" -->