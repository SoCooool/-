<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {

   public function _initialize(){ //初始化
      
	 
	
	  $this->assign('key2',KEY);
$this->assign('key3',DESC);
$this->assign('key4',SITE2);
$this->assign('ad',AD);

$foo2=split(',',FOO2);

$this->assign('ff',$foo2);
	  
	  }
	  
	  public function test(){
	  
	  
	  }


public function read(){ 




include 'php.php'; 
$url=I('get.url');

//$url=str_replace('==','',$url);

//$videourl='http://v.youku.com/v_show/'.$url; 



//$str=xurl($videourl); 


 
//$page=nanji_cut("<div class=\"scroller-container\" id=\"Drama_playlist\" >","<div class=\"item drama_operation\"",$str); 


  

//function get_content($url ,$data){
// if(is_array($data)){
//  $data = http_build_query($data, '', '&'); 
// }
// $ch = curl_init();
// curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
// curl_setopt($ch, CURLOPT_POST, 1);
// curl_setopt($ch, CURLOPT_HEADER, 0);
// curl_setopt($ch, CURLOPT_URL,$url);
// curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
// $result = curl_exec($ch);
// return $result;
//}   

 
//$str = get_content('http://www.pengyou.com/json.php?mod=usershare&act=geturlinfo',array('url'=>$videourl));




//$str=json_decode($str); 
//
//
//$flash=$str->result->flash;
//
//$desc=$str->result->desc;
//
//$tt=explode('/',$flash);


$uurl='http://player.youku.com/embed/'.$url;


//$s2=file_get_contents($url);

$this->assign('uurl',$uurl);
//$this->assign('s2',$s2);
//$this->assign('vo',$url);
//$this->assign('desc',$desc);
//$title=$str->result->title;
//$this->assign('flash',$flash);
//$this->assign('title',$title." - ");
//$this->assign('url',$tt[5]);
$this->display();
}

public function vod(){


		//include 'phpQuery.php'; 
		include 'php.php'; 
$url=I('get.url');
$ti=I('get.u');
if ($ti=="")$ti='电影';
if( $url==""){
		$url="http://www.soku.com/m/y/video?q=%E7%94%B5%E5%BD%B1&f=1&kb=120200000000000_%E9%9D%92%E4%BA%91%E5%BF%97_%E7%94%B5%E5%BD%B1";
				$url='http://list.youku.com/category/show/c_96_pt_1_s_1_d_1_u_1.html?spm=a2hmv.20009921.m_86993.5~5~5!2~A&from=y1.3-movie-grid-1095-9921.86994-86993.0-1';
}else{

$url='http://list.youku.com/'.$url;
}


$str=xurl($url); 


$page=nanji_cut("<div class=\"yk-pager\">","</div><div class=\"vault-banner mb20\">",$str);

//$page=str_replace('<ul class="yk-pages">','<ul class="pagination">',$page);


$page=str_replace('http://list.youku.com/','/yxk/index.php/home/index/vod?url=',$page);

$str=str_replace('http://v.youku.com/v_show/','/yxk/index.php/home/index/read?url=',$str);





preg_match_all('|<div class="p-thumb"><a href="([^"]*)" title="([^"]*)"([^"]*)|',$str,$a); 
//print_r($a);
preg_match_all('|<img class="quic" _src="([^"]*)"|',$str,$i); 
//print_r($i); 
preg_match_all('|</li><li>([^"]*) </li></ul>|',$str,$i2);
//print_r($i2);
if($a=='') echo '数据为空！';


	$this->assign("list3",$i[1]);
$this->assign("list4",$i2[1]);
			$this->assign("list2",$a[1]);
		$this->assign("list",$a[2]);
		$this->assign("ti",$ti);
		$this->assign("page",$page);
		$this->display('vod');

}


    public function index(){
        
		 //foreach($artlist as $li){ 
//  $listr=$listr.pq($li)->find('div')->html();
//} 

		//include 'phpQuery.php'; 
		include 'php.php'; 
$url=I('get.url');

$ti=FOO;

if( $url==""){
$url='http://www.soku.com/search_video/q_'.urlencode($ti);
}else{

$tt2=split('_',$url);

$ti=$tt2[1];

$url='http://www.soku.com/search_video/q_'.urlencode($ti).'_orderby_1_limitdate_0?site=14&page='.i('get.page');
}

//echo $url;

			$str=nanji_cut("<div class=\"sk_result\">","<!-- albuum folder start -->",xurl($url));	
		

$page=nanji_cut('<div class="sk_pager">','</div>',$str);
$page=str_replace('<ul>','<ul class="yk-pages">',$page);



//$str=nanji_cut('<div class=\"box-series\'>,'<div class=\"yk-pager\">',$str);

$page=str_replace('/search_video/',''.'/yxk/index.php/home/index?url=',$page);




$str=str_replace('http://v.youku.com/v_show/','/yxk/index.php/home/index/read?url=',$str);



		 preg_match_all('|            <a title="([^"]*)" target="_blank" href="//v.youku.com/v_show/id_([^"]*)==.html([^"]*)"|',$str,$a); 
			 
//print_r($a);

preg_match_all('|             src="([^"]*)"|',$str,$t);
//print_r($t);
preg_match_all('|<span class="v-time">([^"]*)</span>|',$str,$sj);
//print_r($a3);
//print_r($i); 

//print_r($i2);
if($a=='') echo '数据为空！';
	$this->assign("a1",$a[1]);
$this->assign("a2",$a[2]);
			$this->assign("tp",$t[1]);
		$this->assign("sj",$sj[1]);
		$this->assign("ti",$ti);
		$this->assign("page",$page);
		$this->display('archive');
		
    }
	
	
	
}
