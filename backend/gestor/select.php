<?php
class select{
    public function traerVendedor(){
        $sql = "SELECT * FROM `stmcajainventario`";
        $result = conectar()->query($sql);

        if($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                $array_consulta[]=$row;
            }
            echo json_encode(array("data_asesor"=>$array_consulta));
          } else {
            echo "0 results";
          }
    }
    public function inventario(){
        $sql = "SELECT * FROM `inventario`";
        $result = conectar()->query($sql);

        if($result->num_rows > 0) {
            // output data of each row
            while($row = $result->fetch_assoc()) {
                $array_consulta[]=$row;
            }
            echo json_encode(array("inventario"=>$array_consulta));
          } else {
            echo "0 results";
          }
    }
    public function ventasTotal(){
      $sql ="SELECT SUM(valor) AS total FROM `venta`";
      $result = conectar()->query($sql);

      if($result->num_rows > 0) {
          // output data of each row
          while($row = $result->fetch_assoc()) {
              $array_consulta[]=$row;
          }
          echo json_encode(array("totalVenta"=>$array_consulta));
        } else {
          echo "0 results";
        }
  }
}
?>