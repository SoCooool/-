<!--#include file="inc/inc_syssite.asp" -->
<%Dim siteText
	siteText = "UBB代码列表"
	siteTitle = siteText&" - "
%>
<!--#include file="header.asp" -->
<div id="default">
<div id="default_bg">
<TABLE width="100%" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#b6d8e0">
  <TR> 
    <TD height="24" bgcolor="#D9EBEF"><h4>UBB代码列表</h4></TD>
  </TR>
  <TR> 
    <TD bgcolor="#FFFFFF">
      <TABLE width="100%" border="0" cellspacing="0" cellpadding="6">
        <TR> 
          <TD colspan="2" style="text-indent: 20px;">具体代码含义如下:</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
          <TD>[b]文字[/b]</TD>
          <TD>插入粗体字</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'"> 
          <TD>[i]文字[/i]</TD>
          <TD>插入斜体字</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[u]文字[/u]</TD>
          <TD>插入下划线</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'"> 
          <TD>[s]文字[/s]</TD>
          <TD>插入删除线</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[fly]文字[fly]</TD>
          <TD>插入飞行文字</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[rainbow]文字[rainbow]</TD>
          <TD>插入发光文字</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[align=center]内容[/align]</TD>
          <TD>内容居中</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'"> 
          <TD>[align=left]内容[/align]</TD>
          <TD>内容居左</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[align=right]内容[/align]</TD>
          <TD>内容居右</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">  
          <TD>[color=颜色]文字[/color]</TD>
          <TD>插入指定颜色的文字</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'"> 
          <TD>[size=文字大小]文字[/color]</TD>
          <TD>插入指定大小的文字</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">  
          <TD>[url=链接地址]说明文字[/url]</TD>
          <TD>插入一个url链接,链接地址省略时默认链接地址为说明文字</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[email]邮箱地址[/email]</TD>
          <TD>插入一个邮箱地址链接</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[text]内容[/text]</TD>
          <TD>插入有蓝色框包围的内容</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[code]程序代码[/code]</TD>
          <TD>插入程序代码</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[quote]引用文字[/quote]</TD>
          <TD>插入一段引用文字</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[html]程序代码[/html]</TD>
          <TD>插入html代码</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[list=1][*]内容[*][/list]</TD>
          <TD>插入列表</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[img]图片链接地址[/img]</TD>
          <TD>插入图片</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[image]图片链接地址[/image]</TD>
          <TD>插入图片,点击不会打开新窗口</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[images]图片链接地址[/images]</TD>
          <TD>插入图片,有边框</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[swf]Flash文件链接地址[/swf]</TD>
          <TD>插入Flash动画</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[wma]Windows Media Player音频文件url[/wma]</TD>
          <TD>插入Windows Media Player音频媒体文件 [不自动播放] </TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[wmv]Windows Media Player视频文件url[/wmv]</TD>
          <TD>插入Windows Media Player视频媒体文件</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[mp3]音频文件url[/mp3]</TD>
          <TD>插入Windows Media Player音频媒体文件 [自动播放] </TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[ra]RealPlayer音频文件链接地址[/ra]</TD>
          <TD>插入RealPlayer的音频文件</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[rm]RealPlayer视频文件链接地址[/rm]</TD>
          <TD>插入RealPlayer的视频文件</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[qt]quicktime文件链接地址[/qt]</TD>
          <TD>插入quicktime媒体文件</TD>
        </TR>
        <TR bgcolor="#F5F5F5" onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#BFDFFF'">
          <TD>[down=下载地址]文字[/down]</TD>
          <TD>插入一个下载</TD>
        </TR>
        <TR onmouseout="this.style.backgroundColor=''" onmouseover="this.style.backgroundColor='#b6d8e0'">
          <TD>[download=下载地址]文字[/download]</TD>
          <TD>插入一个会员下载</TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TABLE>
</div>
</div>
<!--#include file="footer.asp" -->