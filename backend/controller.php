<?php
include_once('configuraciones/config.private.php');
include('recursos/injection.sql.php');
include_once('gestor/select.php');
include_once('gestor/insert.php');
include('configuraciones/autoload.inc');
include_once('configuraciones/objetos.inc');
conBd;
$tok=limpiar_cadena($_POST["token"]);

switch($tok){
    case "sel001":
        $recuperar->traerVendedor();
        break;
    case "ins01";
        $mCliente->setCedula(limpiar_cadena($_POST["cedulaUSer"]));
        $mCliente->setNombre(limpiar_cadena($_POST["nombreU"]));
        $mCliente->setDireccion(limpiar_cadena($_POST["direccionU"]));
        $mCliente->setAsesor(limpiar_cadena($_POST["asU"]));
        $guardar->almacenarCliente($mCliente);
        break;
    
}
?>