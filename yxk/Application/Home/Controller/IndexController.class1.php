<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

public function read(){ 
include 'php.php'; 
$url=I('get.url');

$videourl='http://v.youku.com/v_show/'.$url; 

$str=xurl($videourl); 


 
$page=nanji_cut("<div class=\"scroller-container\" id=\"Drama_playlist\" >","<div class=\"item drama_operation\"",$str);


 

function get_content($url ,$data){ 
 if(is_array($data)){ 
  $data = http_build_query($data, '', '&');  
 } 
 $ch = curl_init(); 
 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true ); 
 curl_setopt($ch, CURLOPT_POST, 1); 
 curl_setopt($ch, CURLOPT_HEADER, 0); 
 curl_setopt($ch, CURLOPT_URL,$url); 
 curl_setopt($ch, CURLOPT_POSTFIELDS, $data); 
 $result = curl_exec($ch); 
 return $result; 
} 
$str = get_content('http://www.pengyou.com/json.php?mod=usershare&act=geturlinfo',array('url'=>$videourl)); 
$str=json_decode($str); 


$flash=$str->result->flash;

$desc=$str->result->desc;

$tt=explode('/',$flash);



//echo 'http://m.youku.com/video/'.$url;

$s2=file_get_contents('http://m.youku.com/video/'.$url);


$this->assign('s2',$s2);
$this->assign('vo',$url);
$this->assign('desc',$desc);
$title=$str->result->title;
$this->assign('flash',$flash);
$this->assign('title',$title." - ");
$this->assign('url',$tt[5]);
$this->display();
}

    public function index(){
        
		 //foreach($artlist as $li){ 
//  $listr=$listr.pq($li)->find('div')->html();
//} 

		//include 'phpQuery.php'; 
		include 'php.php'; 
$url=I('get.url');
$ti=I('get.u');
if ($ti=="")$ti='电影';
if( $url==""){
		$str=xurl('http://www.soku.com/search_video/q_hot');
			$str=nanji_cut("<div class=\"sk_result\">","<!-- albuum folder start -->",$str);	
			echo $str;
			 preg_match_all('|<a title="([^"]*)" target="_blank" href="([^"]*)"|',$str,$a);
			 
			 print_r($a);  
			//$str=str_replace('http://v.youku.com/v_show/','/index.php/home/index/read?url=',$str);
}else{

$url='http://list.youku.com/'.$url;
$str=xurl($url); 
$page=nanji_cut("<div class=\"yk-pager\">","</div><div class=\"vault-banner mb20\">",$str);
//echo $page;
//$page=str_replace('<ul class="yk-pages">','<ul class="pagination">',$page);
//$str=nanji_cut('<div class=\"box-series\">','<div class=\"yk-pager\'>",$str);

$page=str_replace('http://list.youku.com/','/index.php?url=',$page);

$str=str_replace('http://v.youku.com/v_show/','/index.php/home/index/read?url=',$str);

 preg_match_all('|<div class="p-thumb"><a href="([^"]*)" title="([^"]*)"([^"]*)|',$str,$a);  
//print_r($a);
preg_match_all('|<img class="quic" _src="([^"]*)"|',$str,$i);  
//print_r($i); 
preg_match_all('|</li><li>([^"]*) </li></ul>|',$str,$i2);
}










 


//print_r($i2);
if($a=='') echo '数据为空！';
	$this->assign("list3",$i[1]);
$this->assign("list4",$i2[1]);
			$this->assign("list2",$a[1]);
		$this->assign("list",$a[2]);
		$this->assign("ti",$ti);
		$this->assign("page",$page);
		$this->display('archive');
		
    }
	
	
	
}