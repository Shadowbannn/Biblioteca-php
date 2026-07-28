<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

$estadoFiltro = trim($_GET['estado'] ?? '');

$condiciones = [];
$parametros = [];
$tipos = '';

if ($estadoFiltro === 'prestado' || $estadoFiltro === 'devuelto') {
    $condiciones[] = "p.estado = ?";
    $parametros[] = $estadoFiltro;
    $tipos .= 's';
}

$whereSql = !empty($condiciones) ? " WHERE " . implode(" AND ", $condiciones) : "";

$sql = "SELECT p.*, l.titulo, l.autor, l.portada, s.nombre, s.apellido
        FROM prestamos p
        INNER JOIN libros l ON p.libro_id = l.id
        INNER JOIN socios s ON p.socio_id = s.id"
        . $whereSql .
        " ORDER BY p.fecha_prestamo ASC";

$stmt = $conn->prepare($sql);

if (!empty($parametros)) {
    $stmt->bind_param($tipos, ...$parametros);
}

$stmt->execute();
$resultado = $stmt->get_result();

function estaVencido($fechaEsperada, $estado) {
    if ($estado !== 'prestado') return false;
    return strtotime($fechaEsperada) < strtotime('today');
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Biblioteca - Préstamos</title>

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
        <li><a href="../socios/versocio.php"><b>Alumnos</b></a></li>
        <li><a href="../prestamos/verprestamo.php"><b>Prestamos</b></a></li>
        <li><a href="../logout.php"><b>Cerrar sesión</b></a></li>
    </ul>

</nav>

<div class="container">

    <h1 class="titulo"><br><br><b>Préstamos</b></h1>

    <div class="mb-3">
       
    </div>

    <form method="GET" class="mb-4">
      <div class="row g-2 align-items-end mb-4">
             <div class="col-sm-8">
                <form method="GET">
                    <label class="form-label">Filtrar por estado</label>
                    <select name="estado" class="form-select" onchange="this.form.submit()">
                        <option value="">Todos</option>
                        <option value="prestado" <?= $estadoFiltro === 'prestado' ? 'selected' : '' ?>>En curso</option>
                        <option value="devuelto" <?= $estadoFiltro === 'devuelto' ? 'selected' : '' ?>>Devueltos</option>
                    </select>
                </form>
            </div>

            <div class="col-md-3">
                <a href="agregarprestamo.php" class="btn btn-success w-100">
                    ➕ Nuevo Préstamo
                </a>
            </div>

           

        </div>
    </form>

    <div class="card mb-4">

        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">Listado de Préstamos</h4>
        </div>

        <div class="card-body">

            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

                <?php if ($resultado->num_rows > 0): ?>

                    <?php while ($p = $resultado->fetch_assoc()): ?>

                        <?php $vencido = estaVencido($p['fecha_devolucion_esperada'], $p['estado']); ?>

                        <div class="col">
                            <div class="info-card">

                                <div class="d-flex justify-content-between align-items-start mb-2">
                                  
                                    <?php if (!empty($p['portada'])): ?>
                                        <img src="/carpeta/uploads/portadas/<?= htmlspecialchars($p['portada']) ?>"
                                            alt="Portada de <?= htmlspecialchars($p['titulo']) ?>"
                                            class="portada-prestamo">
                                    <?php else: ?>
                                        <img src="/carpeta/assets/sin-portada.png"
                                            alt="Sin portada"
                                            class="portada-prestamo">
                                    <?php endif; ?>


                                   <?php if ($p['estado'] === 'devuelto'): ?>
                                        <span class="badge bg-secondary">Devuelto</span>

                                    <?php elseif ($p['estado'] === 'cancelado'): ?>
                                        <span class="badge bg-secondary">Reserva vencida</span>

                                    <?php elseif ($p['estado'] === 'reservado'): ?>
                                        <span class="badge badge-encurso">Reservado</span>

                                    <?php elseif ($vencido): ?>
                                        <span class="badge badge-vencido">Vencido</span>

                                    <?php else: ?>
                                        <span class="badge badge-encurso">En curso</span>

                                    <?php endif; ?>
                                </div>

                                <h5><?= htmlspecialchars($p['titulo']) ?></h5>
                                <p class="mb-1"><b>Autor:</b> <?= htmlspecialchars($p['autor']) ?></p>

                                <hr>

                                <p class="mb-1"><b>Socio:</b> <?= htmlspecialchars($p['nombre'] . ' ' . $p['apellido']) ?></p>
                                <p class="mb-1"><b>Préstamo:</b> <?= date('d/m/Y', strtotime($p['fecha_prestamo'])) ?></p>
                                <p class="mb-1"><b>Devolución esperada:</b> <?= date('d/m/Y', strtotime($p['fecha_devolucion_esperada'])) ?></p>

                                <?php if ($p['fecha_devolucion_real']): ?>
                                    <p class="mb-2"><b>Devuelto el:</b> <?= date('d/m/Y', strtotime($p['fecha_devolucion_real'])) ?></p>
                                <?php endif; ?>

                                <?php if ($p['estado'] === 'prestado'): ?>
                                    <div class="d-flex gap-2 mt-2">
                                        <a href="devolverprestamo.php?id=<?= $p['id'] ?>" class="btn btn-success btn-sm"
                                        onclick="return confirm('¿Marcar este préstamo como devuelto?')">
                                            Marcar devuelto
                                        </a>
                                        <a href="eliminarprestamo.php?id=<?= $p['id'] ?>" class="btn btn-danger btn-sm"
                                        onclick="return confirm('¿Eliminar este préstamo?')">
                                            Eliminar
                                        </a>
                                    </div>
                                <?php else: ?>
                                    <div class="mt-2">
                                        <a href="eliminarprestamo.php?id=<?= $p['id'] ?>" class="btn btn-danger btn-sm"
                                        onclick="return confirm('¿Eliminar este préstamo del historial?')">
                                            Eliminar
                                        </a>
                                    </div>
                                <?php endif; ?>

                            </div>
                        </div>

                    <?php endwhile; ?>

                <?php else: ?>
                    <div class="col-12">
                        <div class="alert alert-info">No hay préstamos registrados.</div>
                    </div>
                <?php endif; ?>

            </div>

        </div>

    </div>

</div>

    <footer class="bg-dark text-white">
        © 2026 Sigma Tech -  All rights reserved
    </footer>

</body>
</html>