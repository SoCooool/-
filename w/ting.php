<?php
function m_v($url) {
       $user_agent = $_SERVER['HTTP_USER_AGENT'];
       $ch = curl_init(); 
       $timeout = 30;
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
       curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
       @ $file = curl_exec($ch);
       curl_close($ch);
       return $file;
}

$fname = 'http://' . $_SERVER['SERVER_NAME'] . $_SERVER["SCRIPT_NAME"];
if(isset ($_GET['id'])){
       $c ='http://www.333ttt.com/mp3/dj'.$_GET['id'].'.html';
       $d = m_v($c);
       preg_match('|var danceFilePath = "([^>]+).mp4|', $d, $s);
       $j = 'http://hd.xiaotimi.com/'.$s[1].'.mp4';
       header("location:$j");
}
?>
