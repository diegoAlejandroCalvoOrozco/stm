<?php
class almacenar{
    function almacenarCliente(&$data){
        $cedula=$data->getCedula();
        $nombre=$data->getNombre();
        $direccion=$data->getDireccion();
        $idAsesor=$data->getAsesor();
        $sql = "INSERT INTO `usuario` (`cedula`, `nombreUser`, `direccion`, `asesor_idasesor`) VALUES (".$cedula.", \".$nombre.\", \"$direccion\", ".$idAsesor.");";
        if (conectar()->query($sql) === TRUE) {
            echo true;
        } else {
            echo "Error: " . $sql . "<br>" . conectar()->error;
        }
        
        conectar()->close();
    }
    function almacenarventa(&$dVenta){
        $canT=$dVenta->getCantidadTarjetas();
        $valorT=$dVenta->getTotal();
        $usuario=$dVenta->getCedulaU();
        $cantidad=$dVenta->getCantidadInventario();
        $idEmpl=$dVenta->getIdEmpleado();
        
        /* Desactiva autocommit */
        mysqli_autocommit(conectar(), FALSE);
        mysqli_query(conectar(), "INSERT INTO `venta` (`idventa`, `cantidad_tarjetas`, `valor`, `fecha_venta`, `usuario_cedula`, `id_asesor`) VALUES (NULL, ".$canT.", ".$valorT.", NOW(), ".$usuario.", ".$idEmpl.");");
        mysqli_query(conectar(), "UPDATE `inventario` SET `cantidad_tarjetas`=\"$cantidad\" WHERE `asesor_idasesor` = 35154;");
    
       
        // Commit transaction
        if (!conectar() -> commit()) {
            echo "Commit transaction failed";
            exit();
        }else{
           echo true;
        }
        
                
        conectar()->close();
    }

}
