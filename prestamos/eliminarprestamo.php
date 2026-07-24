<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

if (!isset($_GET["id"])) {
    header("Location: verprestamo.php");
    exit();
}

$id = (int) $_GET["id"];

$stmtBuscar = $conn->prepare("SELECT libro_id, estado FROM prestamos WHERE id = ?");
$stmtBuscar->bind_param("i", $id);
$stmtBuscar->execute();
$prestamo = $stmtBuscar->get_result()->fetch_assoc();

if (!$prestamo) {
    header("Location: verprestamo.php");
    exit();
}

$conn->begin_transaction();

try {

    // Si se borra un préstamo que seguía activo, liberar el libro
    if ($prestamo['estado'] === 'prestado') {
        $stmtLibro = $conn->prepare("UPDATE libros SET disponible = 1 WHERE id = ?");
        $stmtLibro->bind_param("i", $prestamo['libro_id']);
        $stmtLibro->execute();
    }

    $stmt = $conn->prepare("DELETE FROM prestamos WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();

    $conn->commit();

} catch (Exception $e) {
    $conn->rollback();
}

header("Location: verprestamo.php");
exit();