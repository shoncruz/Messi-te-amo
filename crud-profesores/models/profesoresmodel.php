<?php
class profesoresmodel
{
    private $PDO;
    public function __construct()
    {
        require_once("c:/xampp/htdocs/CRUD-PROFESORES/config/db.php");
        $con = new db();
        $this->PDO = $con->conexion();
    }
    public function insertar($nombre)
    {
        $stament = $this->PDO->prepare("INSERT INTO profesores values(null,:nombre)");
        $stament->bindParam(":nombre", $nombre);
        return ($stament->execute()) ? $this->PDO->lastInsertId() : false;
    }
    public function insertar2($turno)
    {
        $stament = $this->PDO->prepare("INSERT INTO profesores values(null,:turno)");
        $stament->bindParam(":turno", $turno);
        return ($stament->execute()) ? $this->PDO->lastInsertId() : false;
    }
    public function insertar3($especialidad)
    {
        $stament = $this->PDO->prepare("INSERT INTO profesores values(null,:especialidad)");
        $stament->bindParam(":especialidad", $especialidad);
        return ($stament->execute()) ? $this->PDO->lastInsertId() : false;
    }
}


?>