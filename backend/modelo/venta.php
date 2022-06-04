<?php
namespace modelo;
class venta{
    private $cantidadTarjetas;
    private $total;
    private $cedulaU;
    private $idEmpleado;
    private $cantidadInv;

    function __construct(){
        $this->cantidadTarjetas="";
        $this->total="";
        $this->cedulaU="";
        $this->idEmpleado="";
        $this->cantidadInv=0;
    }

    public function getCantidadTarjetas(){
		return $this->cantidadTarjetas;
	}

	public function setCantidadTarjetas($cantidadTarjetas){
		$this->cantidadTarjetas = $cantidadTarjetas;
	}

	public function getTotal(){
		return $this->total;
	}

	public function setTotal($total){
		$this->total = $total;
	}

	public function getCedulaU(){
		return $this->cedulaU;
	}

	public function setCedulaU($cedulaU){
		$this->cedulaU = $cedulaU;
	}

	public function getIdEmpleado(){
		return $this->idEmpleado;
	}

	public function setIdEmpleado($idEmpleado){
		$this->idEmpleado = $idEmpleado;
	}
	public function getCantidadInventario(){
		return $this->cantidadInv;
	}

	public function setCantidadInventario($cantidadInv){
		$this->cantidadInv= $cantidadInv;
	}
}
?>