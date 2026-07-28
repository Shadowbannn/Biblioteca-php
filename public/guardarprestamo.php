<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: agregarprestamo.php");
    exit();
}

$libro_id = (int) $_POST["libro_id"];
$socio_id = (int) $_POST["socio_id"];
$fecha_devolucion_esperada = $_POST["fecha_devolucion_esperada"];

// Verificar que el libro siga disponible (por si dos personas lo intentan prestar casi a la vez)
$stmtCheck = $conn->prepare("SELECT disponible FROM libros WHERE id = ?");
$stmtCheck->bind_param("i", $libro_id);
$stmtCheck->execute();
$libro = $stmtCheck->get_result()->fetch_assoc();

if (!$libro || $libro['disponible'] != 1) {
    header("Location: agregarprestamo.php?error=nodisponible");
    exit();
}

$conn->begin_transaction();

try {

    $stmt = $conn->prepare("INSERT INTO prestamos (libro_id, socio_id, fecha_devolucion_esperada) VALUES (?, ?, ?)");
    $stmt->bind_param("iis", $libro_id, $socio_id, $fecha_devolucion_esperada);
    $stmt->execute();

    $stmtUpdate = $conn->prepare("UPDATE libros SET disponible = 0 WHERE id = ?");
    $stmtUpdate->bind_param("i", $libro_id);
    $stmtUpdate->execute();

    $conn->commit();

    header("Location: verprestamo.php");
    exit();

} catch (Exception $e) {
    $conn->rollback();
    header("Location: agregarprestamo.php?error=1");
    exit();
}