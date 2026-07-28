<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

// Traer solo socios y libros disponibles
$socios = $conn->query("SELECT id, nombre, apellido FROM socios ORDER BY nombre ASC");
$librosDisponibles = $conn->query("SELECT id, titulo, autor FROM libros WHERE disponible = 1 ORDER BY titulo ASC");
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Nuevo Préstamo</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container mt-5">

    <div class="form-card">

        <h2>Nuevo Préstamo</h2>

        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger">
                <?= $_GET['error'] === 'nodisponible' ? 'Ese libro ya no está disponible.' : 'Error al registrar el préstamo.' ?>
            </div>
        <?php endif; ?>

        <form action="guardarprestamo.php" method="POST">

            <label>Socio</label>
            <select name="socio_id" class="form-select mb-3" required>
                <option value="">Seleccioná un socio</option>
                <?php while ($s = $socios->fetch_assoc()): ?>
                    <option value="<?= $s['id'] ?>">
                        <?= htmlspecialchars($s['nombre'] . ' ' . $s['apellido']) ?>
                    </option>
                <?php endwhile; ?>
            </select>

            <label>Libro</label>
            <select name="libro_id" class="form-select mb-3" required>
                <option value="">Seleccioná un libro</option>
                <?php if ($librosDisponibles->num_rows === 0): ?>
                    <option value="" disabled>No hay libros disponibles</option>
                <?php endif; ?>
                <?php while ($l = $librosDisponibles->fetch_assoc()): ?>
                    <option value="<?= $l['id'] ?>">
                        <?= htmlspecialchars($l['titulo'] . ' — ' . $l['autor']) ?>
                    </option>
                <?php endwhile; ?>
            </select>

            <label>Fecha de devolución esperada</label>
            <input type="date" name="fecha_devolucion_esperada" class="form-control mb-3" required
                   min="<?= date('Y-m-d') ?>">

            <button type="submit" class="btn btn-success w-100 mb-2">Registrar Préstamo</button>
            <a href="verprestamo.php" class="btn btn-secondary w-100">Cancelar</a>

        </form>

    </div>

</div>

</body>
</html>