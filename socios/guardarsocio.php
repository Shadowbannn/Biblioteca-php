<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    header("Location: agregarsocio.php");
    exit();
}

$nombre   = trim($_POST['nombre']);
$apellido = trim($_POST['apellido']);
$edad     = (int) $_POST['edad'];
$email    = trim($_POST['email']);
$telefono = trim($_POST['telefono']);
$cedula   = trim($_POST['cedula']);
$clase    = trim($_POST['clase']);

// Verificar que no exista la misma cédula
$consulta = $conn->prepare("SELECT id FROM socios WHERE cedula = ?");
$consulta->bind_param("s", $cedula);
$consulta->execute();
$resultado = $consulta->get_result();

if ($resultado->num_rows > 0) {
    echo "<script>
            alert('Ya existe un socio con esa cédula.');
            window.location='agregarsocio.php';
          </script>";
    exit();
}

// Insertar socio
$stmt = $conn->prepare("
    INSERT INTO socios
    (nombre, apellido, clase, cedula, email, telefono)
    VALUES (?, ?, ?, ?, ?, ?)
");

$stmt->bind_param(
    "sssiss",
    $nombre,
    $apellido,
    $clase,
    $cedula,
    $email,
    $telefono
    
);

if ($stmt->execute()) {

    header("Location: versocio.php");

} else {

    echo "<script>
            alert('Ocurrió un error al guardar el socio.');
            history.back();
          </script>";
}

$stmt->close();
$conn->close();
?>