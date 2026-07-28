<?php
session_start();
require_once('../config/conexion.php');

if ($_SERVER["REQUEST_METHOD"] !== "POST") {
    header("Location: /carpeta/libros/verlibros_publico.php");
    exit();
}

$nombre = trim($_POST["nombre"]);
$apellido = trim($_POST["apellido"]);
$clase = trim($_POST["clase"]);
$email = trim($_POST["email"] ?? '');
$telefono = trim($_POST["telefono"] ?? '');
$cedula = trim($_POST["cedula"]);
$libro_id = (int) ($_POST['libro_id'] ?? 0);

$stmtCheck = $conn->prepare("SELECT id FROM socios WHERE cedula = ?");
$stmtCheck->bind_param("s", $cedula);
$stmtCheck->execute();
$existente = $stmtCheck->get_result()->fetch_assoc();

if ($existente) {
    header("Location: registrarsocio_publico.php?libro_id=$libro_id&error=1");
    exit();
}

$stmt = $conn->prepare("INSERT INTO socios (nombre, apellido, clase, email, telefono, cedula) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssisss", $nombre, $apellido, $clase, $email, $telefono, $cedula);

if ($stmt->execute()) {
    $_SESSION['publico_socio_id'] = $conn->insert_id;
    header("Location: /carpeta/libros/reservarlibro.php?id=$libro_id");
} else {
    header("Location: registrarsocio_publico.php?libro_id=$libro_id&error=1");
}
exit();