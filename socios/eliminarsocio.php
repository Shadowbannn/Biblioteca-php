<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if (!isset($_GET['id']) || empty($_GET['id'])) {
    header("Location: versocio.php");
    exit();
}

$id = (int)$_GET['id'];

// Verificar que el socio exista
$stmt = $conn->prepare("SELECT id FROM socios WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows == 0) {
    header("Location: versocio.php");
    exit();
}

// Verificar si el socio tiene préstamos
$prestamos = $conn->prepare("SELECT id FROM prestamos WHERE id_socio = ?");
$prestamos->bind_param("i", $id);
$prestamos->execute();
$resultadoPrestamos = $prestamos->get_result();

if ($resultadoPrestamos->num_rows > 0) {

    echo "<script>
            alert('No se puede eliminar este socio porque tiene préstamos registrados.');
            window.location='versocio.php';
          </script>";

    exit();
}

// Eliminar socio
$eliminar = $conn->prepare("DELETE FROM socios WHERE id = ?");
$eliminar->bind_param("i", $id);

if ($eliminar->execute()) {

    header("Location: versocio.php");
    exit();

} else {

    echo "<script>
            alert('Ocurrió un error al eliminar el socio.');
            window.location='versocio.php';
          </script>";
}

$stmt->close();
$prestamos->close();
$eliminar->close();
$conn->close();
?>