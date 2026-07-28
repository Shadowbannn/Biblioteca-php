<?php
require_once('../config/conexion.php');

$id = (int) ($_GET['id'] ?? 0);

$stmt = $conn->prepare("SELECT p.*, l.titulo FROM prestamos p INNER JOIN libros l ON p.libro_id = l.id WHERE p.id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$reserva = $stmt->get_result()->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reserva confirmada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="container mt-5">
    <div class="form-card text-center">
        <h2>¡Reserva confirmada!</h2>
        <?php if ($reserva): ?>
            <p>Reservaste <b><?= htmlspecialchars($reserva['titulo']) ?></b>.</p>
            <p>Tenés <b>30 minutos</b> para retirarlo en el mostrador. Pasado ese tiempo, la reserva se libera automáticamente.</p>
        <?php endif; ?>
        <a href="verlibro.php" class="btn btn-primary w-100 mt-3">Volver al catálogo</a>
    </div>
</div>

</body>
</html>