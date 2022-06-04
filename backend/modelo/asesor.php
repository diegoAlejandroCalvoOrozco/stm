<?php
namespace modelo;
class asesor{
    private $id;
    private $nombre;
    private $telefono;
    private $correo;
    private $estacion;

    function __construct(){
        $this->id="";
        $this->nombre="";
        $this->telefono="";
        $this->correo="";
        $this->estacion="";
    }

    public function getId(){
		return $this->id;
	}

	public function setId($id){
		$this->id = $id;
	}

	public function getNombre(){
		return $this->nombre;
	}

	public function setNombre($nombre){
		$this->nombre = $nombre;
	}

	public function getTelefono(){
		return $this->telefono;
	}

	public function setTelefono($telefono){
		$this->telefono = $telefono;
	}

	public function getCorreo(){
		return $this->correo;
	}

	public function setCorreo($correo){
		$this->correo = $correo;
	}

	public function getEstacion(){
		return $this->estacion;
	}

	public function setEstacion($estacion){
		$this->estacion = $estacion;
	}
}
?>