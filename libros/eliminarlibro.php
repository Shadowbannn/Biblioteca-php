<?php
require_once('../includes/seguridad.php');
require_once('../socios/socio.php');
require_once('../config/conexion.php');

if (!isset($_GET["id"])) {
    header("Location: verlibro.php");
    exit();
}

$id = $_GET["id"];

// Consulta preparada para eliminar
$stmt = $conn->prepare("DELETE FROM libros WHERE id = ?");
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    header("Location: verlibro.php");
    exit();
} else {
    echo "Error al eliminar el libro.";
}
?>