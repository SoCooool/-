<?php
//Ö÷º¯Êý
function nanji_url($url){
	$ch=curl_init();
	curl_setopt($ch,CURLOPT_URL,$url);
	$user_agent="Baiduspider+(+http://www.baidu.com/search/spider.htm)";
	curl_setopt($ch,CURLOPT_USERAGENT,$user_agent);
	curl_setopt($ch,CURLOPT_REFERER,"http://www.baidu.com/");
	curl_setopt($ch,CURLOPT_FOLLOWLOCATION,1);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
	$nanji_tempz=curl_exec($ch);
	curl_close($ch);
	return $nanji_tempz;
}

function xurl($url){


$ch = curl_init();  
$timeout = 5;  
curl_setopt ($ch, CURLOPT_URL, $url);  
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);  
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);  
$file_contents = curl_exec($ch);  
curl_close($ch);  
return $file_contents;  



}

function nanji_cut($start,$end,$str){
	$temp=explode($start,$str,2);
	$content=explode($end,$temp[1],2);
	return $content[0];
}
function nanji_split($start,$end,$str){
	$temp=preg_split($start,$str);
	$content=preg_split($end,$temp[1]);
	return $content[0];
}

?>