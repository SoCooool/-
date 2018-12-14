<?php
/* php正则解析YY视频地址
*/
error_reporting(0);
$id = addslashes($_GET['id']);
$url = 'http://www.yy.com/s/'.$id;
$refer = 'http://www.yy.com/s/'.$id;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_BINARYTRANSFER, true);
curl_setopt($ch, CURLOPT_REFERER, $refer);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36');
$output = curl_exec($ch);
curl_close($ch);
preg_match('|video: "(.+?)",|i', $output, $video);
$videourl = $video[1];
header('location:'.$videourl);exit();
?>