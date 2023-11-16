<?php
require_once("c://xampp/htdocs/CRUD-PROFESORES/view/head/head.php");

?>
<form action="store.php" method="post" autocomplete="off">
    <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Nombre Profesor/a</label>
        <input type="text" name="nombre" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <label for="exampleInputEmail1" class="form-label">Turno</label>
        <input type="text" name="turno" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <label for="exampleInputEmail1" class="form-label">Especialidad</label>
        <input type="text" name="especialidad" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        <div id="emailHelp" class="form-text">Aqui se Registrara A los Profesores Segun Su Especialidad</div>
       
    </div>
    <button type="submit" class="btn btn-primary">Guardar</button>
    <a class="btn btn-danger" href="index.php">Cancelar</a>
</form>


<?php
require_once("c://xampp/htdocs/CRUD-PROFESORES/view/head/footer.php");

?>