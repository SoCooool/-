var postSubmited = false;
function ctlent(obj) {
	if(postSubmited == false && (event.ctrlKey && window.event.keyCode == 13) || (event.altKey && window.event.keyCode == 83)) {
			if(this.document.inputform.topicsubmit) this.document.inputform.topicsubmit.disabled = true;
			if(this.document.inputform.replysubmit) this.document.inputform.replysubmit.disabled = true;
			if(this.document.inputform.editsubmit) this.document.inputform.editsubmit.disabled = true;
			postSubmited = true;
			this.document.inputform.submit();
	}
}

function showIntro(objID)
{
	if (document.getElementById(objID).style.display == "none") {
		document.getElementById(objID).style.display = "";
	}else{
		document.getElementById(objID).style.display = "none";
	}
}

function winconfirm(confirmMSG,confirmURL){
	question = confirm(confirmMSG);
	if (question != "0"){
		window.location=confirmURL;
	}
}
function CopyText(obj) {
	ie = (document.all)? true:false
	if (ie){
		var rng = document.body.createTextRange();
		rng.moveToElementText(obj);
		rng.scrollIntoView();
		rng.select();
		rng.execCommand("Copy");
		rng.collapse(false);
	}
}
function UBBShowObj(strType,strID,strURL,intWidth,intHeight)
{
	var varHeader="V";
	var tmpstr="";
	var bSwitch = false;
	bSwitch = document.getElementById(varHeader+strID).value;
	bSwitch	=~bSwitch;
	document.getElementById(varHeader+strID).value = bSwitch;
	if(bSwitch){
		document.getElementById(strID).innerHTML = "影音源文件地址：<a href='"+strURL+"' target='_blank'>"+strURL+"</a>";
	}else{
		switch(strType.toUpperCase()){
			case "SWF":
				tmpstr="<object codeBase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' width='"+intWidth+"' height='"+intHeight+"'><param name='movie' value='"+strURL+"'><param name='quality' value='high'><param name='AllowScriptAccess' value='never'><embed src='"+strURL+"' quality='high' pluginspage='http://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' width='"+intWidth+"' height='"+intHeight+"'>'"+strURL+"'</embed></OBJECT>";
				break;
			case "MP3":
				tmpstr="<object classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95'  id='MediaPlayer' width='"+intWidth+"' height='"+intHeight+"'><param name='ShowStatusBar' value='-1'><param name='AutoStart' value='True'><param name='Filename' value='"+strURL+"'></object>";
				break;
			case "WMA":
				tmpstr="<object classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95'  id='MediaPlayer' width='"+intWidth+"' height='"+intHeight+"'><param name='ShowStatusBar' value='-1'><param name='AutoStart' value='True'><param name='Filename' value='"+strURL+"'></object>";
				break;
			case "WMV":
				tmpstr="<object classid='CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95' width='"+intWidth+"' height='"+intHeight+"'><param name='ShowStatusBar' value='-1'><param name='AutoStart' value='Ture'><param name='Filename' value='"+strURL+"'></object>";
				break;
			case "RA":
				tmpstr="<object classid='clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA' id='RAOCX' width='"+intWidth+"' height='"+intHeight+"'><param name='_ExtentX' value='6694'><param name='_ExtentY' value='1588'><param name='AUTOSTART' value='0'><param name='SHUFFLE' value='0'><param name='PREFETCH' value='0'><param name='NOLABELS' value='0'><param name='SRC' value='"+strURL+"'><param name='CONTROLS' value='StatusBar,ControlPanel'><param name='LOOP' value='0'><param name='NUMLOOP' value='0'><param name='CENTER' value='0'><param name='MAINTAINASPECT' value='0'><param name='BACKGROUNDCOLOR' value='#000000'><embed src='"+strURL+"' width='253' autostart='true' height='60'></embed></object>"
				break;
			case "RM":
				tmpstr="<object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' height='"+intHeight+"' id='Player' width='"+intWidth+"' viewastext><param name='_ExtentX' value='12726'><param name='_ExtentY' value='8520'><param name='AUTOSTART' value='0'><param name='SHUFFLE' value='0'><param name='PREFETCH' value='0'><param name='NOLABELS' value='0'><param name='CONTROLS' value='ImageWindow'><param name='CONSOLE' value='_master'><param name='LOOP' value='0'><param name='NUMLOOP' value='0'><param name='CENTER' value='0'><param name='MAINTAINASPECT' value='"+strURL+"'><param name='BACKGROUNDCOLOR' value='#000000'></object><br><object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' height='32' id='Player' width='"+intWidth+"' VIEWASTEXT><param name='_ExtentX' value='18256'><param name='_ExtentY' value='794'><param name='AUTOSTART' value='-1'><param name='SHUFFLE' value='0'><param name='PREFETCH' value='0'><param name='NOLABELS' value='0'><param name='CONTROLS' value='controlpanel'><param name='CONSOLE' value='_master'><param name='LOOP' value='0'><param name='NUMLOOP' value='0'><param name='CENTER' value='0'><param name='MAINTAINASPECT' value='0'><param name='BACKGROUNDCOLOR' value='#000000'><param name='SRC' value='"+strURL+"'></object>";
				break;
			case "MID":
				tmpstr="<OBJECT classid='CLSID:22D6F312-B0F6-11D0-94AB-0080C74C7E95' codebase='http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,0,02,902' type='application/x-oleobject' standby='Loading...' width="+intWidth+" height="+intHeight+"><PARAM NAME='FileName' VALUE='"+strURL+"'><param name='ShowStatusBar' value='-1'><param name='EnableContextMenu' value='0'><param name='VideoBorder3D' value='0'><param name='Volume' value='0'><PARAM NAME='AutoStart' VALUE='true'><EMBED type='application/x-mplayer2' pluginspage='http://www.microsoft.com/Windows/MediaPlayer/' SRC='"+strURL+"' AutoStart=true width="+intWidth+" height="+intHeight+"></EMBED></OBJECT>";
				break;
			case "QT":
				tmpstr="<embed src='"+strURL+"' autoplay='true' Loop='false' controller='true' playeveryframe='false' cache='false' scale='TOFIT' bgcolor='#000000' kioskmode='false' targetcache='false' pluginspage='http://www.apple.com/quicktime/'>";
				break;
		}
		document.getElementById(strID).innerHTML = tmpstr;
	}
}
function AutoSizeDIV(objID){
	var obj=document.getElementById(objID);
	if (obj.scrollHeight < obj.offsetHeight){
		obj.style.height = obj.scrollHeight+2;
	}
}
//定义一个运行代码的函数，
function runCode(o)
{
    ie = (document.all)? true:false
    if (ie)
    {
        var code=o.innerText;//即要运行的代码。
        var newwin=window.open('','','');  //打开一个窗口并赋给变量newwin。
        newwin.opener = null // 防止代码对论谈页面修改
        newwin.document.write(code);  //向这个打开的窗口中写入代码code，这样就实现了运行代码功能。
        newwin.document.close();
    }
}
//定义打开重叠层
function hasSupport(){if(typeof hasSupport.support!="undefined")return hasSupport.support;var ie55=/msie 5\.[56789]/i.test(navigator.userAgent);hasSupport.support=(typeof document.implementation!="undefined"&&document.implementation.hasFeature("html","1.0")||ie55)
if(ie55){document._getElementsByTagName=document.getElementsByTagName;document.getElementsByTagName=function(sTagName){if(sTagName=="*")return document.all;else return document._getElementsByTagName(sTagName);};}return hasSupport.support;}function WebFXTabPane(el,bUseCookie){if(!hasSupport()||el==null)return;this.element=el;this.element.tabPane=this;this.pages=[];this.selectedIndex=null;this.useCookie=bUseCookie!=null?bUseCookie:false;this.element.className=this.classNameTag+" "+this.element.className;this.tabRow=document.createElement("div");this.tabRow.className="tab-row";el.insertBefore(this.tabRow,el.firstChild);var tabIndex=0;if(this.useCookie){tabIndex=Number(WebFXTabPane.getCookie("webfxtab_"+this.element.id));if(isNaN(tabIndex))tabIndex=0;}this.selectedIndex=tabIndex;var cs=el.childNodes;var n;for(var i=0;i<cs.length;i++){if(cs[i].nodeType==1&&cs[i].className=="tab-page"){this.addTabPage(cs[i]);}}}WebFXTabPane.prototype.classNameTag="dynamic-tab-pane-control";WebFXTabPane.prototype.setSelectedIndex=function(n){if(this.selectedIndex!=n){if(this.selectedIndex!=null&&this.pages[this.selectedIndex]!=null)this.pages[this.selectedIndex].hide();this.selectedIndex=n;this.pages[this.selectedIndex].show();if(this.useCookie)WebFXTabPane.setCookie("webfxtab_"+this.element.id,n);}};WebFXTabPane.prototype.getSelectedIndex=function(){return this.selectedIndex;};WebFXTabPane.prototype.addTabPage=function(oElement){if(!hasSupport())return;if(oElement.tabPage==this)return oElement.tabPage;var n=this.pages.length;var tp=this.pages[n]=new WebFXTabPage(oElement,this,n);tp.tabPane=this;this.tabRow.appendChild(tp.tab);if(n==this.selectedIndex)tp.show();else tp.hide();return tp;};WebFXTabPane.prototype.dispose=function(){this.element.tabPane=null;this.element=null;this.tabRow=null;for(var i=0;i<this.pages.length;i++){this.pages[i].dispose();this.pages[i]=null;}this.pages=null;};WebFXTabPane.setCookie=function(sName,sValue,nDays){var expires="";if(nDays){var d=new Date();d.setTime(d.getTime()+nDays*24*60*60*1000);expires="; expires="+d.toGMTString();}document.cookie=sName+"="+sValue+expires+"; path=/";};WebFXTabPane.getCookie=function(sName){var re=new RegExp("(\;|^)[^;]*("+sName+")\=([^;]*)(;|$)");var res=re.exec(document.cookie);return res!=null?res[3]:null;};WebFXTabPane.removeCookie=function(name){setCookie(name,"",-1);};function WebFXTabPage(el,tabPane,nIndex){if(!hasSupport()||el==null)return;this.element=el;this.element.tabPage=this;this.index=nIndex;var cs=el.childNodes;for(var i=0;i<cs.length;i++){if(cs[i].nodeType==1&&cs[i].className=="tab"){this.tab=cs[i];break;}}var a=document.createElement("A");this.aElement=a;a.href="#";a.onclick=function(){return false;};while(this.tab.hasChildNodes())a.appendChild(this.tab.firstChild);this.tab.appendChild(a);var oThis=this;this.tab.onclick=function(){oThis.select();};this.tab.onmouseover=function(){WebFXTabPage.tabOver(oThis);};this.tab.onmouseout=function(){WebFXTabPage.tabOut(oThis);};}WebFXTabPage.prototype.show=function(){var el=this.tab;var s=el.className+" selected";s=s.replace(/ +/g," ");el.className=s;this.element.style.display="block";};WebFXTabPage.prototype.hide=function(){var el=this.tab;var s=el.className;s=s.replace(/ selected/g,"");el.className=s;this.element.style.display="none";};WebFXTabPage.prototype.select=function(){this.tabPane.setSelectedIndex(this.index);};WebFXTabPage.prototype.dispose=function(){this.aElement.onclick=null;this.aElement=null;this.element.tabPage=null;this.tab.onclick=null;this.tab.onmouseover=null;this.tab.onmouseout=null;this.tab=null;this.tabPane=null;this.element=null;};WebFXTabPage.tabOver=function(tabpage){var el=tabpage.tab;var s=el.className+" hover";s=s.replace(/ +/g," ");el.className=s;};WebFXTabPage.tabOut=function(tabpage){var el=tabpage.tab;var s=el.className;s=s.replace(/ hover/g,"");el.className=s;};function setupAllTabs(){if(!hasSupport())return;var all=document.getElementsByTagName("*");var l=all.length;var tabPaneRe=/tab\-pane/;var tabPageRe=/tab\-page/;var cn,el;var parentTabPane;for(var i=0;i<l;i++){el=all[i]
cn=el.className;if(cn=="")continue;if(tabPaneRe.test(cn)&&!el.tabPane)new WebFXTabPane(el);else if(tabPageRe.test(cn)&&!el.tabPage&&tabPaneRe.test(el.parentNode.className)){el.parentNode.tabPane.addTabPage(el);}}}function disposeAllTabs(){if(!hasSupport())return;var all=document.getElementsByTagName("*");var l=all.length;var tabPaneRe=/tab\-pane/;var cn,el;var tabPanes=[];for(var i=0;i<l;i++){el=all[i]
cn=el.className;if(cn=="")continue;if(tabPaneRe.test(cn)&&el.tabPane)tabPanes[tabPanes.length]=el.tabPane;}for(var i=tabPanes.length-1;i>=0;i--){tabPanes[i].dispose();tabPanes[i]=null;}}if(typeof window.addEventListener!="undefined")window.addEventListener("load",setupAllTabs,false);else if(typeof window.attachEvent!="undefined"){window.attachEvent("onload",setupAllTabs);window.attachEvent("onunload",disposeAllTabs);}else{if(window.onload!=null){var oldOnload=window.onload;window.onload=function(e){oldOnload(e);setupAllTabs();};}else window.onload=setupAllTabs;}

function changebar(a){
	for (var i=1;i<=2;i++){
		eval("menu"+i).style.display="none";
		eval("content"+i).style.display="none";
	}
	eval("menu"+a).style.display="block";
		eval("content"+a).style.display="block";
}