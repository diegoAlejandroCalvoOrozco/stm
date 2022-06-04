<?php
include_once("../configuraciones/config.php");
// Create connection
function conectar(){
    $conn = new mysqli(server, user, password, baseData);
    return $conn;
}

if (conectar()->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "conetado";
?>