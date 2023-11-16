<?php
    require_once("c://xampp/htdocs/CRUD-PROFESORES/controller/profesorescontroller.php");
    $obj    =   new profesorescontrollers();
    $obj->guardar($_POST['nombre']);
?>