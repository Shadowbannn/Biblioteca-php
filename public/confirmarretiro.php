<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if (!isset($_GET['id'])) {
    header("Location: verprestamo.php");
    exit();
}

$id = (int) $_GET['id'];

$stmt = $conn->prepare("UPDATE prestamos SET estado = 'prestado', fecha_prestamo = CURDATE(), fecha_devolucion_esperada = ? WHERE id = ? AND estado = 'reservado'");
$fechaEsperada = date('Y-m-d', strtotime('+14 days'));
$stmt->bind_param("si", $fechaEsperada, $id);
$stmt->execute();

header("Location: verprestamo.php");
exit();