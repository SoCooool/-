<?php
include ('../inc/aik.config.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>全民K歌解析下载–<?php echo $aik['sitename'];?></title>
<meta name="keywords" content="<?php echo $aik['title'];?>,在线解析,电视直播网站,零八影院快播,高清云影视,云点播,免费看视频,湖南卫视直播,80电影网,最新电影天堂免费在线观看">
<meta name="description" content="<?php echo $aik['sitename'];?>,热剧快播,最好看的剧情片尽在<?php echo $aik['title'];?>,高清云影视免费为大家提供最新最全的免费电影，电视剧，综艺，动漫无广告在线云点播，以及电视直播">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- 弹窗插件 -->
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <script src="plugins/layui/layui.all.js"></script>
</head>

<div class="song-info-box" id="j-song-info">
    <div class="song-cover" id="j-song-cover"></div>
    <div class="song-name" id="j-song-name"></div>
    <div class="song-worker" id="j-song-worker"></div>
    <div class="song-copyright">歌曲来源：<a target="_blank" href="http://kg.qq.com">全民K歌（kg.qq.com）</a></div>
</div>

<body>
    <div class="bg-header">
        <div class="download-box">
            <div class="header">
                <div class="head-img"></div>
            </div>
            <div class="download-form" id="j-download-music">
                <div class="search-shadow">
                    <input type="text" class="search-input" id="j-music-url" name="music_url" placeholder="输入你要下载的歌曲地址">
                </div>
                <button class="download-btn" id="j-download-btn">
                    <div class="icon-download"></div>
                </button>
            </div>
        </div>
        <div class="feedback">
            <a href="mailto:13099961778@163.com" class="layui-btn layui-btn-normal">意见反馈</a>
        </div>
    </div>
    <div class="home-middle">
        <div class="title">如何下载歌曲</div>
        <div class="download-step">
            <h2 style="margin-bottom: 20px;">1. 找到你要下载的歌曲地址</h2>
            <span>APP可以通过分享歌曲按钮，或者到官方页面查找歌曲，然后选择复制链接</span><br>
            <span>PC版直接复制歌曲播放页面的url即可</span><br>
            <h2>2. 复制你得到的链接地址到本页下载</h2><br>    <span>全民K歌官方地址:		<a href="http://kg.qq.com">http://kg.qq.com</a></span><br>
            <h2 style="color: #999"><?php echo $aik['sitename'];?>申明：本站不存在任何全民K歌的歌曲，只提供下载歌曲功能，歌曲所有权属于所有者</h2>
        </div>
    </div>
    <!--百度收录自动推送-->
<script>
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https') {
        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
    }
    else {
        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
    }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>

<script language="javascript" type="text/javascript" src="http://js.users.51.la/18759442.js"></script></div>

</body>
</html>
<script>
    $(function(){
        //搜索歌曲
        $('#j-download-btn').on('click', function(){
            var music_url = $('#j-music-url').val();
            if (music_url === '') {
                layer.msg('请输入要下载歌曲的地址');
                return false;
            }
            $.ajax({
                type: 'get',
                url: 'kgDownload.php',
                data: {'music_url': music_url},
                dataType: 'json',
                success: function(data) {
                    if (data.code === 200) {
                        showSongInfo(data.data);
                        return true;
                    }
                    layer.msg(data.msg);
                    return false;
                    // window.location.href = data.data.url;
                    // return true;
                }
            });
        });

        function showSongInfo(songData) {
            $('#j-song-cover').css('background-image', 'url("' + songData.cover + '")');
            $('#j-song-name').html(songData.name);
            $('#j-song-worker').html('作者：' + songData.singer);
            var songInfo = layer.open({
                type: 1,
                title: '歌曲信息',
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: $('#j-song-info'),
                btn: ['下载'],
                yes: function(){
                    window.location.href = songData.url;
                    $('#j-song-info').hide();
                    layer.close(songInfo);
                    return true;
                },
                cancel: function(){
                    $('#j-song-info').hide();
                }
            });
        }
    });
</script>
























