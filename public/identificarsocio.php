<?php
session_start();
require_once('../config/conexion.php');

$cedula = trim($_POST['cedula'] ?? '');
$libro_id = (int) ($_POST['libro_id'] ?? 0);

$stmt = $conn->prepare("SELECT id FROM socios WHERE cedula = ?");
$stmt->bind_param("s", $cedula);
$stmt->execute();
$socio = $stmt->get_result()->fetch_assoc();

if ($socio) {
    $_SESSION['publico_socio_id'] = $socio['id'];
    header("Location: reservarlibro.php?id=$libro_id");
} else {
    header("Location: registrarsocio_publico.php?libro_id=$libro_id&cedula=" . urlencode($cedula));
}
exit();