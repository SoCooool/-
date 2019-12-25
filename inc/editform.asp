<table width="98%" border="0" cellspacing="0" cellpadding="2">
  <tr>
	<td width="100%">
	<select name="font" onFocus="this.selectedIndex=0" onChange="chfont(this.options[this.selectedIndex].value)" size="1">
	  <option value="" selected>选择字体</option>
	  <option value="宋体">宋体</option>
	  <option value="黑体">黑体</option>
	  <option value="Arial">Arial</option>
	  <option value="Book Antiqua">Book Antiqua</option>
	  <option value="Century Gothic">Century Gothic</option>
	  <option value="Courier New">Courier New</option>
	  <option value="Georgia">Georgia</option>
	  <option value="Impact">Impact</option>
	  <option value="Tahoma">Tahoma</option>
	  <option value="Times New Roman">Times New Roman</option>
	  <option value="Verdana">Verdana</option>
	</select>
	<select name="size" onFocus="this.selectedIndex=0" onChange="chsize(this.options[this.selectedIndex].value)" size="1">
	  <option value="" selected>字体大小</option>
	  <option value="-2">-2</option>
	  <option value="-1">-1</option>
	  <option value="1">1</option>
	  <option value="2">2</option>
	  <option value="3">3</option>
	  <option value="4">4</option>
	  <option value="5">5</option>
	  <option value="6">6</option>
	  <option value="7">7</option>
	</select>
	<select name="color"  onFocus="this.selectedIndex=0" onChange="chcolor(this.options[this.selectedIndex].value)" size="1">
	  <option value="" selected>字体颜色</option>
	  <option value="White" style="background-color:white;color:white;">White</option>
	  <option value="Black" style="background-color:black;color:black;">Black</option>
	  <option value="Red" style="background-color:red;color:red;">Red</option>
	  <option value="Yellow" style="background-color:yellow;color:yellow;">Yellow</option>
	  <option value="Pink" style="background-color:pink;color:pink;">Pink</option>
	  <option value="Green" style="background-color:green;color:green;">Green</option>
	  <option value="Orange" style="background-color:orange;color:orange;">Orange</option>
	  <option value="Purple" style="background-color:purple;color:purple;">Purple</option>
	  <option value="Blue" style="background-color:blue;color:blue;">Blue</option>
	  <option value="Beige" style="background-color:beige;color:beige;">Beige</option>
	  <option value="Brown" style="background-color:brown;color:brown;">Brown</option>
	  <option value="Teal" style="background-color:teal;color:teal;">Teal</option>
	  <option value="Navy" style="background-color:navy;color:navy;">Navy</option>
	  <option value="Maroon" style="background-color:maroon;color:maroon;">Maroon</option>
	  <option value="LimeGreen" style="background-color:limegreen;color:limegreen;">LimeGreen</option>
	</select>
	</td>
	<td rowspan="2" nowrap><strong>模式：</strong>
		<input type="radio" name="mode" value="2" onclick="chmode('2')" checked /> 基本
		<input type="radio" name="mode" value="0" onclick="chmode('0')" /> 高级
		<input type="radio" name="mode" value="1" onclick="chmode('1')" /> 帮助
	</td>
  </tr>
  <tr>
	<td>
	  <a href="javascript:bold()"><img src="images/ubbcode/bb_bold.gif" border="0" alt="插入粗体文本"></a>
	  <a href="javascript:italicize()"><img src="images/ubbcode/bb_italicize.gif" border="0" alt="插入斜体文本"></a>
	  <a href="javascript:underline()"><img src="images/ubbcode/bb_underline.gif" border="0" alt="插入下划线"></a>
	  <a href="javascript:center()"><img src="images/ubbcode/bb_center.gif" border="0" alt="居中对齐"></a>
	  <a href="javascript:hyperlink()"><img src="images/ubbcode/bb_url.gif" border="0" alt="插入超级链接"></a>
	  <a href="javascript:email()"><img src="images/ubbcode/bb_email.gif" border="0" alt="插入邮件地址"></a>
	  <a href="javascript:image()"><img src="images/ubbcode/bb_image.gif" border="0" alt="插入图像"></a>
	  <a href="javascript:code()"><img src="images/ubbcode/bb_code.gif" border="0" alt="插入代码"></a>
	  <a href="javascript:quote()"><img src="images/ubbcode/bb_quote.gif" border="0" alt="插入引用"></a>
	  <a href="javascript:list()"><img src="images/ubbcode/bb_list.gif" border="0" alt="插入列表"></a>
	  <a href="javascript:flash()"><img src="images/ubbcode/bb_flash.gif" border="0" alt="插入 Flash"></a>
	  <a href="javascript:wma()"><img src="images/ubbcode/bb_wma.gif" alt="插入音频文件" border="0"></a>
	  <a href="javascript:wmv()"><img src="images/ubbcode/bb_wmv.gif" alt="插入视频文件" border="0"></a>
	</td>
  </tr>
</table>