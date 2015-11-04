<?php
ini_set('user_agent','Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727;)');
$url = "http://AXXXX.api2.ofpay.com/onlineorder.do?userid=A1164165&userpws=e3480c68a87e770dce483a6e8fd4bebb&cardid=140101&cardnum=1&mctype=&sporder_id=10&sporder_time=2015-11-03 15:57:30&game_userid=18919681329&md5_str=439423A07BCAE6951800DB95527945F7&version=6.0&ret_url=dsfd";

$contents = file_get_contents($url);
$res = simplexml_load_string($contents);  

var_dump($res);