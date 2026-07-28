<?php
session_start();
require_once('../config/conexion.php');
require_once('../includes/reserva.php');

liberarReservasVencidas($conn);

if (!isset($_GET['id'])) {
    header("Location: verlibros_publico.php");
    exit();
}

$libro_id = (int) $_GET['id'];

$stmt = $conn->prepare("SELECT * FROM libros WHERE id = ?");
$stmt->bind_param("i", $libro_id);
$stmt->execute();
$libro = $stmt->get_result()->fetch_assoc();

if (!$libro || $libro['disponible'] != 1) {
    header("Location: verlibros_publico.php?error=nodisponible");
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Reservar Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container mt-5">
    <div class="form-card">

        <h2>Reservar libro</h2>
        <p><b><?= htmlspecialchars($libro['titulo']) ?></b> — <?= htmlspecialchars($libro['autor']) ?></p>

        <?php if (isset($_SESSION['publico_socio_id'])): ?>

            <p>Vas a reservar este libro con tu cuenta. Tenés <b>30 minutos</b> para retirarlo en el mostrador antes de que se libere.</p>

            <form action="guardarreserva.php" method="POST">
                <input type="hidden" name="libro_id" value="<?= $libro_id ?>">
                <button type="submit" class="btn btn-success w-100">Confirmar reserva</button>
            </form>

        <?php else: ?>

            <p>Para reservar necesitás una cuenta de socio.</p>

            <label>¿Ya tenés cuenta? Ingresá tu cédula</label>
            <form action="identificarsocio.php" method="POST" class="mb-4">
                <input type="hidden" name="libro_id" value="<?= $libro_id ?>">
                <div class="input-group">
                    <input type="text" name="cedula" class="form-control" placeholder="Cédula" maxlength="8" required>
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>
            </form>

            <hr>

            <p>¿No tenés cuenta todavía?</p>
            <a href="registrarsocio_publico.php?libro_id=<?= $libro_id ?>" class="btn btn-secondary w-100">Crear cuenta</a>

        <?php endif; ?>

        <a href="verlibros_publico.php" class="btn btn-link w-100 mt-2">Volver al catálogo</a>

    </div>
</div>

</body>
</html>