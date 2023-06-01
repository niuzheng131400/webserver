<?php

header("Content-Type:text/html;charset=utf-8");
echo "==================REDIS TEST START=================</br>";


$redis = new Redis();
$redis->connect('redis-server', 6379);
$redis->auth('abc123.');
echo "connection to server success </br>";
if($redis->ping()) {
    echo "ping success</br>";
}
echo "==================REDIS TEST END===================</br>";



echo "==================MYSQL TEST START=================</br>";
$conn = new Mysqli('mysql-server','root','niuzheng00.','naming');
if ($conn->connect_errno) {
    die('connect failed:' . $conn->connect_error."</br>");
}
$conn->set_charset('utf8mb4');
echo "connect success</br>";
$result = $conn->query('SELECT * FROM `naming`');
if ($result && $result->num_rows > 0){
    $data = $result->fetch_assoc();
    echo "<pre>";
    print_r($data);
}

echo "==================MYSQL TEST END===================</br>";



echo "==================PHPINFO TEST START===================</br>";
phpinfo();
echo "==================PHPINFO TEST END===================</br>";