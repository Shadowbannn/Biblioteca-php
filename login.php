<?php
session_start();

$mensaje = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $email = $_POST["email"];
    $password = $_POST["password"];

    if ($email == "admin@utu.edu.uy" && $password == "1234") {

        $_SESSION["usuario"] = $email;
        header("Location: index.php");
        exit();

    } else {
        $mensaje = "Email o contraseña incorrectos.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styleE.css">
</head>

<body>

<div class="formulario">

    <h1>Inicio de Sesión</h1>

    <?php
    if($mensaje != ""){
        echo "<div class='alert alert-danger'>$mensaje</div>";
    }
    ?>

    <form method="POST">

        <div class="form-group">
            <label>Email</label>
            <input
                type="email"
                name="email"
                class="form-control"
                required>
        </div>

        <br>

        <div class="form-group">
            <label>Contraseña</label>
            <input
                type="password"
                name="password"
                class="form-control"
                required>
        </div>

        <br>

        <div class="form-check">
            <input type="checkbox" class="form-check-input" id="recordar">
            <label class="form-check-label" for="recordar">Recuérdame</label>
        </div>

        <br>

        <button type="submit" class="btn btn-primary w-100">
            Ingresar
        </button>

    </form>

</div>

</body>
</html>