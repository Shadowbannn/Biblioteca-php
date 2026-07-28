<?php
session_start();
require_once('../config/conexion.php');

if (!isset($_SESSION['publico_socio_id']) || $_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: verlibros_publico.php");
    exit();
}

$libro_id = (int) $_POST['libro_id'];
$socio_id = (int) $_SESSION['publico_socio_id'];

$stmtCheck = $conn->prepare("SELECT disponible FROM libros WHERE id = ?");
$stmtCheck->bind_param("i", $libro_id);
$stmtCheck->execute();
$libro = $stmtCheck->get_result()->fetch_assoc();

if (!$libro || $libro['disponible'] != 1) {
    header("Location: verlibros_publico.php?error=nodisponible");
    exit();
}

$conn->begin_transaction();

try {
    $stmt = $conn->prepare("INSERT INTO prestamos (libro_id, socio_id, fecha_devolucion_esperada, estado) VALUES (?, ?, ?, 'reservado')");
    $fechaEsperada = date('Y-m-d', strtotime('+14 days'));
    $stmt->bind_param("iis", $libro_id, $socio_id, $fechaEsperada);
    $stmt->execute();

    $stmtLibro = $conn->prepare("UPDATE libros SET disponible = 0 WHERE id = ?");
    $stmtLibro->bind_param("i", $libro_id);
    $stmtLibro->execute();

    $conn->commit();

    header("Location: reserva_confirmada.php?id=" . $conn->insert_id);
    exit();

} catch (Exception $e) {
    $conn->rollback();
    header("Location: verlibros_publico.php?error=1");
    exit();
}