<?php
$libro_id = (int) ($_GET['libro_id'] ?? 0);
$cedulaPrellenada = trim($_GET['cedula'] ?? '');
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Crear cuenta de socio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="form.css">
</head>

<body>

<div class="container mt-5">
    <div class="form-card">

        <h2>Crear cuenta</h2>

        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger">Ya existe una cuenta con esa cédula.</div>
        <?php endif; ?>

        <form action="guardarsocio_publico.php" method="POST">

            <input type="hidden" name="libro_id" value="<?= $libro_id ?>">

            <input type="text" name="nombre" class="form-control mb-3" placeholder="Nombre" required>
            <input type="text" name="apellido" class="form-control mb-3" placeholder="Apellido" required>
            <input type="text" name="clase" class="form-control mb-3" placeholder="Clase" required>
            <input type="email" name="email" class="form-control mb-3" placeholder="Correo electrónico">
            <input type="text" name="telefono" class="form-control mb-3" placeholder="Teléfono" maxlength="9">
            <input type="text" name="cedula" class="form-control mb-3" placeholder="Cédula" maxlength="8"
                value="<?= htmlspecialchars($cedulaPrellenada) ?>" required>

            <button type="submit" class="btn btn-primary w-100">Crear cuenta y continuar</button>
            <a href="verlibro.php" class="btn btn-secondary w-100 mt-2">Cancelar</a>

        </form>

    </div>
</div>

</body>
</html>