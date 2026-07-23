<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    header("Location: versocio.php");
    exit();
}

$id        = (int)$_POST['id'];
$nombre    = trim($_POST['nombre']);
$apellido  = trim($_POST['apellido']);
$email     = trim($_POST['email']);
$telefono  = trim($_POST['telefono']);
$cedula    = trim($_POST['cedula']);

// Verificar que la cédula no pertenezca a otro socio
$consulta = $conn->prepare("SELECT id FROM socios WHERE cedula = ? AND id <> ?");
$consulta->bind_param("si", $cedula, $id);
$consulta->execute();
$resultado = $consulta->get_result();

if ($resultado->num_rows > 0) {
    echo "<script>
            alert('Ya existe otro socio con esa cédula.');
            window.location='editarsocio.php?id=$id';
          </script>";
    exit();
}

// Actualizar los datos
$stmt = $conn->prepare("
    UPDATE socios
    SET
        nombre = ?,
        apellido = ?,
        edad = ?,
        email = ?,
        telefono = ?,
        cedula = ?
    WHERE id = ?
");

$stmt->bind_param(
    "ssisssi",
    $nombre,
    $apellido,
    $email,
    $telefono,
    $cedula,
    $id
);

if ($stmt->execute()) {

    header("Location: versocio.php");
    exit();

} else {

    echo "<script>
            alert('Error al actualizar el socio.');
            history.back();
          </script>";

}

$stmt->close();
$consulta->close();
$conn->close();
?>