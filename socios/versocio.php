<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

$buscar = "";

if (isset($_GET['buscar'])) {
    $buscar = trim($_GET['buscar']);

    $stmt = $conn->prepare("
        SELECT *
        FROM socios
        WHERE nombre LIKE ?
        OR apellido LIKE ?
        OR cedula LIKE ?
        ORDER BY apellido, nombre
    ");

    $texto = "%$buscar%";
    $stmt->bind_param("sss", $texto, $texto, $texto);
} else {

    $stmt = $conn->prepare("
    SELECT *
    FROM socios
    ORDER BY id DESC
    ");
}

$stmt->execute();
$resultado = $stmt->get_result();

$totalSocios = $resultado->num_rows;
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Biblioteca - Socios</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>

<body>

<nav>

<a href="../Index.php"> 
 <img src="../img/logo.png" 
 alt="Inicio" style="width: 250px; height: auto;">
</a>
    
    <ul>
        <li><a href="../Index.php"><b>Inicio</b></a></li>
        <li><a href="../libros/verlibro.php"><b>Libros</b></a></li>
        <li><a href="../socios/versocio.php"><b>Socios</b></a></li>
        <li><a href="../prestamos/verprestamo.php"><b>Prestamos</b></a></li>
        <li><a href="../logout.php"><b>Cerrar sesión</b></a></li>
    </ul>

</nav>


<div class="container mt-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h2>Listado de Socios</h2>

        <a href="agregarsocio.php" class="btn btn-success">
            + Nuevo Socio
        </a>

    </div>

    <form method="GET" class="row mb-4">

        <div class="col-md-10">

            <input
                type="text"
                name="buscar"
                class="form-control"
                placeholder="Buscar por nombre, apellido o cédula..."
                value="<?= htmlspecialchars($buscar) ?>">

        </div>

        <div class="col-md-2 d-grid">

            <button class="btn btn-primary">
                Buscar
            </button>

        </div>

    </form>

    <div class="alert alert-secondary">

        Total de socios registrados:
        <strong><?= $totalSocios ?></strong>

    </div>

    <div class="table-responsive">

        <table class="table table-bordered table-hover table-striped align-middle">

            <thead class="table-dark">

            <tr>

                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Cédula</th>
                <th>Email</th>
                <th>Teléfono</th>
                <th>Fecha Registro</th>
                <th width="180">Acciones</th>

            </tr>

            </thead>

            <tbody>

            <?php if ($resultado->num_rows > 0): ?>

                <?php while($fila = $resultado->fetch_assoc()): ?>

                    <tr>

                        <td><?= $fila['id'] ?></td>

                        <td><?= htmlspecialchars($fila['nombre']) ?></td>

                        <td><?= htmlspecialchars($fila['apellido']) ?></td>

                        <td><?= htmlspecialchars($fila['cedula']) ?></td>

                        <td><?= htmlspecialchars($fila['email']) ?></td>

                        <td><?= htmlspecialchars($fila['telefono']) ?></td>

                        <td><?= $fila['fecha_registro'] ?></td>

                        <td>


                            <a
                                href="agregarsocio.php?id=<?= $fila['id'] ?>"
                                class="btn btn-success btn-sm">

                                Agregar

                            </a>


                            <a
                                href="editarsocio.php?id=<?= $fila['id'] ?>"
                                class="btn btn-warning btn-sm">

                                Editar

                            </a>

                            <a
                                href="eliminarsocio.php?id=<?= $fila['id'] ?>"
                                class="btn btn-danger btn-sm"
                                onclick="return confirm('¿Desea eliminar este socio?');">

                                Eliminar

                            </a>

                        </td>

                    </tr>

                <?php endwhile; ?>

            <?php else: ?>

                <tr>

                    <td colspan="9" class="text-center">

                        No hay socios registrados.

                    </td>

                </tr>

            <?php endif; ?>

            </tbody>

        </table>

    </div>

    <a href="../index.php" class="btn btn-secondary mt-3">
        ← Volver al inicio
    </a>

</div>

    <footer class="bg-dark text-white text-center p-3 mt-5">
        © 2026 Sigma Tech -  All rights reserved
    </footer>



</body>
</html>

<?php
$stmt->close();
$conn->close();
?>