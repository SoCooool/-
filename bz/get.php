<?php
$get = $_GET['says'];    // 获取 get 数据
$data = file_get_contents('http://www.tuling123.com/openapi/api?key=e825286159f9f57db1b597995d72ae2b&info='.$get);    // 从图灵的接口获取数据
$arr = json_decode($data, true);    // 将获取到的数据解析成 JSON 格式
echo $arr['text'];        // 输出数组中的 “text” 值（也就是之前 JSON 中的“text”键值中的内容）
?>
get.php?says=你想说的话
