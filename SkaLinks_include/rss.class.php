<?php

require_once("xml_parser.class.php");

class RSSReader extends feedReader{

var $data;

function RSSReader($url){
	$this->setFeedUrl($url);
	$this->parseFeed();
	$this->data = $this->getFeedOutputData();
}

//********************* CHANNEL **********************************
function getChannelTitle($class=""){
	$html = "<a ";
	if(isset($class)){
		$html .= "class=\"".$class."\" ";
	}
	$html .= "href=\"".$this->data['channel']['link']."\" target=\"_blank\">";
	$html .= $this->data['channel']['title'];
	$html .= "</a>";
	return $html;
}

function getChannelDescription($class=""){
	$html = "<span ";
	if(isset($class)){
		$html .= "class=\"".$class."\" ";
	}
	$html .= ">".$this->data['channel']['description'];
	$html .= "</span>";
	return $html;
}

function getChannelCopyright($class=""){
	if(isset($this->data['channel']['copyright'])){
		$html = "<span ";
		if(isset($class)){
			$html .= "class=\"".$class."\" ";
		}
		$html .= ">".$this->data['channel']['copyright'];
		$html .= "</span>";
		return $html;
	}
}

function getChannelLanguage($class=""){
	if(isset($this->data['channel']['language'])){
		$html = "<span ";
		if(isset($class)){
			$html .= "class=\"".$class."\" ";
		}
		$html .= ">".$this->data['channel']['language'];
		$html .= "</span>";
		return $html;
	}
}
//********************* IMAGE *****************************
function getImage(){
	if(isset($this->data['image']['link'])){
		$html = "<a href=\"".$this->data['image']['link']."\" target=\"_blank\">";
		$html .= "<img border=\"0\" ";
		if(isset($this->data['image']['height'])){
			$html .= "height=\"".$this->data['image']['height']."\" ";
		}
		if(isset($this->data['image']['width'])){
			$html .= "width=\"".$this->data['image']['width']."\" ";
		}
		$html .= "src=\"".$this->data['image']['url']."\" title=\"".$this->data['image']['title']."\" />";
		$html .= "</a>";
		return $html;
	}
}
//*********************** ITEM ****************************
function getItemTitle($class="",$item){
	$html = "<a ";
	if(isset($class)){
		$html .= "class=\"".$class."\" ";
	}
	$html .= "href=\"".$this->data['item']['link'][$item]."\" target=\"_blank\">";
	$html .= $this->data['item']['title'][$item];
	$html .= "</a>";
	return $html;
}

function getItemDescription($class="",$item){
	if(isset($this->data['item']['description'][$item])){
		$html = "<span ";
		if(isset($class)){
			$html .= "class=\"".$class."\" ";
		}
		$html .= ">".str_replace ("</pre>", "</p>", str_replace ("<pre>", "<p>", html_entity_decode($this->data['item']['description'][$item])));
		//tag <pre> change the attribute with in a cell in table
		$html .= "</span>";
		return $html;
	}
}

function getItemPubdate($class="",$item){
	if(isset($this->data['item']['pubdate'][$item])){
		$html = "<span ";
		if(isset($class)){
			$html .= "class=\"".$class."\" ";
		}
		$html .= ">".$this->data['item']['pubdate'][$item];
		$html .= "</span>";
		return $html;
	}
}

function getNumberOfNews(){
	return $this->getFeedNumberOfNodes();
}

}
?>

