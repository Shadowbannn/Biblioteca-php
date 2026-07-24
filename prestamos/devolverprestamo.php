<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if (!isset($_GET["id"])) {
    header("Location: verprestamo.php");
    exit();
}

$id = (int) $_GET["id"];

$stmtBuscar = $conn->prepare("SELECT libro_id FROM prestamos WHERE id = ? AND estado = 'prestado'");
$stmtBuscar->bind_param("i", $id);
$stmtBuscar->execute();
$prestamo = $stmtBuscar->get_result()->fetch_assoc();

if (!$prestamo) {
    header("Location: verprestamo.php");
    exit();
}

$conn->begin_transaction();

try {

    $stmt = $conn->prepare("UPDATE prestamos SET estado = 'devuelto', fecha_devolucion_real = CURDATE() WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    $stmtLibro = $conn->prepare("UPDATE libros SET disponible = 1 WHERE id = ?");
    $stmtLibro->bind_param("i", $prestamo['libro_id']);
    $stmtLibro->execute();

    $conn->commit();

} catch (Exception $e) {
    $conn->rollback();
}

header("Location: verprestamo.php");
exit();