<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

// Verificar que exista el ID
if (!isset($_GET["id"])) {
    header("Location: versocio.php");
    exit();
}

$id = $_GET["id"];

// Si se envió el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre   = trim($_POST["nombre"]);
    $apellido = trim($_POST["apellido"]);
    $clase    = trim($_POST["clase"] ?? '');
    $email    = trim($_POST["email"] ?? '');
    $telefono = trim($_POST["telefono"] ?? '');
    $cedula   = trim($_POST["cedula"]);

    // Verificar que la cédula no pertenezca a OTRO socio (excluyendo el que estamos editando)
    $stmtCheck = $conn->prepare("SELECT id FROM socios WHERE cedula = ? AND id != ?");
    $stmtCheck->bind_param("si", $cedula, $id);
    $stmtCheck->execute();
    $existente = $stmtCheck->get_result()->fetch_assoc();

    if ($existente) {
        $error = "Ya existe otro socio con esa cédula.";
    } else {

        $stmt = $conn->prepare("UPDATE socios SET nombre=?, apellido=?, clase=?, email=?, telefono=?, cedula=? WHERE id=?");
        $stmt->bind_param("ssssssi", $nombre, $apellido, $clase, $email, $telefono, $cedula, $id);

        if ($stmt->execute()) {
            header("Location: versocio.php");
            exit();
        } else {
            $error = "Error al actualizar el socio.";
        }
    }
}

// Obtener datos del socio
$stmt = $conn->prepare("SELECT * FROM socios WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

$resultado = $stmt->get_result();
$socio = $resultado->fetch_assoc();

if (!$socio) {
    die("Socio no encontrado.");
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Editar Socio</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="form.css">
</head>

<body>

<div class="container mt-5">

    <div class="form-card">

        <h2>Editar Socio</h2>

        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <form method="POST">

            <label>Nombre</label>
            <input
                type="text"
                name="nombre"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["nombre"]) ?>"
                required>

            <label>Apellido</label>
            <input
                type="text"
                name="apellido"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["apellido"]) ?>"
                required>

            <label>Clase</label>
            <input
                type="text"
                name="clase"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["clase"] ?? '') ?>">
            

            <label>Email</label>
            <input
                type="email"
                name="email"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["email"] ?? '') ?>">

            <label>Teléfono</label>
            <input
                type="text"
                name="telefono"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["telefono"] ?? '') ?>">

            <label>Cédula</label>
            <input
                type="text"
                name="cedula"
                class="form-control mb-3"
                value="<?= htmlspecialchars($socio["cedula"]) ?>"
                maxlength="8"
                required>

            <button class="btn btn-primary w-100 mb-2">
                Guardar Cambios
            </button>

            <a href="versocio.php" class="btn btn-secondary w-100">
                Cancelar
            </a>

        </form>

    </div>

</div>

</body>
</html>