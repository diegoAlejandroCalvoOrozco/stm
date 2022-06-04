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
}
?>