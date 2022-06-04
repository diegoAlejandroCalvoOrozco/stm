<?php
class modificar{
    function modificarCaja($saldo, $asesor){
        /* Desactiva autocommit */
        mysqli_autocommit(conectar(), FALSE);
        mysqli_query(conectar(), "UPDATE `caja` SET `saldo_actual_caja`=".$saldo." WHERE `asesor_idasesor`=".$asesor.";");
        mysqli_query(conectar(), "DELETE FROM `venta` WHERE `id_asesor`=".$asesor.";");
        // Commit transaction
        if (!conectar() -> commit()) {
            echo "Commit transaction failed";
            exit();
        }else{
           echo true;
        }
        
        conectar()->close();
    }
    function modificarInventario($canTarjetas, $asesor){
        $sql = "UPDATE `inventario` SET `cantidad_tarjetas`=".$canTarjetas." WHERE `asesor_idasesor`=".$asesor.";";
        if (conectar()->query($sql) === TRUE) {
            echo true;
        } else {
            echo "Error: " . $sql . "<br>" . conectar()->error;
        }
        
        conectar()->close();
    }
}
?>