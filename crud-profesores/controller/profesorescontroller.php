<?php
    class profesorescontrollers{
        private $model;
        public function __construct()
        {
            require_once("c://xampp/htdocs/CRUD-PROFESORES/model/profesoresmodel.php");
            $this->model = new profesoresmodel();
        }
        public function guardar($nombre){
           $id= $this->model->insertar($nombre);
           return ($id != false) ? header("location:show.php?id=".$id):header("location:create.php");

        } 
        public function guardarT($turno){
            $id= $this->model->insertar($turno);
            return ($id != false) ? header("location:show.php?id=".$id):header("location:create.php");
 
         } 
         public function guardarE($especialidad){
            $id= $this->model->insertar($especialidad);
            return ($id != false) ? header("location:show.php?id=".$id):header("location:create.php");
 
         } 
        
        
}    



?>