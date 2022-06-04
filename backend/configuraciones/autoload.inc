<?php
function autoload($clases){
    include_once "./".$clases.".php";
}
spl_autoload_register('autoload');

?>