<?php
include_once('configuraciones/config.private.php');
include('recursos/injection.sql.php');
include_once('gestor/select.php');
include_once('gestor/insert.php');
include_once('gestor/update.php');
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
    case "ins02";
        $mVenta->setCantidadTarjetas(limpiar_cadena($_POST["cantidad"]));
        $mVenta->setTotal(limpiar_cadena($_POST["total"]));
        $mVenta->setCedulaU(limpiar_cadena($_POST["ceUser"]));
        $mVenta->setIdEmpleado(limpiar_cadena($_POST["idE"]));
        $mVenta->setCantidadInventario(limpiar_cadena($_POST["canInve"]));
        $guardar->almacenarventa($mVenta);
        break;
    case "sel002";
        $recuperar->ventasTotal();
        break;
    case "upd01":
        $mod->modificarCaja(limpiar_cadena($_POST["nuevo_saldo"]), limpiar_cadena($_POST['id_empleado']));
        break;
    case "upd02":
        $mod->modificarInventario(limpiar_cadena($_POST["cantidad_tarjetas"]), limpiar_cadena($_POST['id_empleado']));
        break;
    
}
?>