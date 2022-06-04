<?php

// Create connection
include_once('configuraciones/config.php');
function conectar(){
    $conn = new mysqli(server, user, password, baseData);
    return $conn;
}

if (conectar()->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>