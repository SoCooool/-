<?php
 


if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');



// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false

define('APP_DEBUG',True);

define('APP_NAME', 'yxk/');

define('SITE2', '智云影音', true);   //设置网站名称

define('FOO', '小品', true);   //设置首页采集的内容

define('FOO2', '车模,VR,魔术,音乐,游戏,搞笑,牛人,历史,美食,探索发现解密,劲爆dj舞曲,Beautyleg,韩国美女', true);   //设置导航栏分类

define('KEY', '车模,魔术,音乐,游戏,搞笑,牛人,历史,美食,探索发现解密,劲爆dj舞曲', true);   //设置SEO关键词

define('DESC', '车模,魔术,音乐,游戏,搞笑,牛人,历史,美食,探索发现解密,劲爆dj舞曲', true);   //设置SEO描述

define('AD', '提示:点击上面菜单列表展开更多精彩视频', true);   //设置广告位，可以设置代码的，比如网盟都可以

// 定义应用目录

define('APP_PATH','./Application/');





// 引入ThinkPHP入口文件

require './ThinkPHP/ThinkPHP.php';



// 亲^_^ 后面不需要任何代码了 就是如此简单
