<?php
namespace modelo;
class cliente{
    private $cedula;
    private $nombre;
    private $direccion;
    private $asesor;

    function __construct(){
        $this->cedula="";
        $this->nombre="";
        $this->direccion="";
        $this->asesor="";
    }

    public function getCedula(){
		return $this->cedula;
	}

	public function setCedula($cedula){
		$this->cedula = $cedula;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getDireccion(){
		return $this->direccion;
	}

	public function setDireccion($direccion){
		$this->direccion = $direccion;
	}

	public function getAsesor(){
		return $this->asesor;
	}

	public function setAsesor($asesor){
		$this->asesor = $asesor;
	}
}
?>