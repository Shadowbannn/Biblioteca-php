<?php

require_once('../includes/seguridad.php');
require_once('../libros/libro.php');
require_once('../socios/socio.php');
require_once('../prestamos/prestamo.php');

$libro1 = new Libro("Jumanji", "La Roca", 1999, 167);
$libro2 = new Libro("El Principito", "Antonio Exupery", 1943, 96);
$libro3 = new Libro("Metamorfosis", "Franz Kafka", 1915, 120);

$socio1 = new Socio("Julio", 67, "julio67@gmail.com");
$socio2 = new Socio("Juan", 69, "juan69@gmail.com");
$socio3 = new Socio("Jaime", 42, "jaime42@gmail.com");

$prestamo1 = new Prestamo($socio1, $libro1, "27/03/2026", "03/04/2026");
$prestamo2 = new Prestamo($socio2, $libro2, "05/03/2026", "16/03/2026");
$prestamo3 = new Prestamo($socio3, $libro3, "17/02/2026", "25/02/2026");

$prestamos = [$prestamo1, $prestamo2, $prestamo3];

// Determina si la fecha de devolución ya pasó, solo para el detalle visual (badge)
function estaVencido($fechaDevolucion) {
    $fecha = DateTime::createFromFormat('d/m/Y', $fechaDevolucion);
    if (!$fecha) return false;
    return $fecha < new DateTime('today');
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
        <li><a href="../socios/versocio.php"><b>Socios</b></a></li>
        <li><a href="../prestamos/verprestamo.php"><b>Prestamos</b></a></li>
        <li><a href="../logout.php"><b>Cerrar sesión</b></a></li>
    </ul>

</nav>


<div class="container">

    <h1 class="titulo"><br><br><b>Préstamos</b></h1>

    <div class="card mb-4">

        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">Listado de Préstamos</h4>
        </div>

        <div class="card-body">

            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">

                <?php foreach ($prestamos as $prestamo): ?>

                    <?php $vencido = estaVencido($prestamo->fecha_devolucion); ?>

                    <div class="col">
                        <div class="info-card">

                            <div class="d-flex justify-content-between align-items-start mb-2">
                                <div class="info-card-icon">
                                    <?= strtoupper(substr($prestamo->obj_socio->nombre, 0, 1)) ?>
                                </div>
                                <span class="badge <?= $vencido ? 'badge-vencido' : 'badge-encurso' ?>">
                                    <?= $vencido ? 'Vencido' : 'En curso' ?>
                                </span>
                            </div>

                            <h5><?= htmlspecialchars($prestamo->obj_libro->titulo) ?></h5>
                            <p class="mb-1"><b>Autor:</b> <?= htmlspecialchars($prestamo->obj_libro->autor) ?></p>

                            <hr>

                            <p class="mb-1"><b>Socio:</b> <?= htmlspecialchars($prestamo->obj_socio->nombre) ?> (N° <?= htmlspecialchars($prestamo->obj_socio->numero_socio) ?>)</p>
                            <p class="mb-1"><b>Préstamo:</b> <?= htmlspecialchars($prestamo->fecha_prestamo) ?></p>
                            <p class="mb-0"><b>Devolución:</b> <?= htmlspecialchars($prestamo->fecha_devolucion) ?></p>

                        </div>
                    </div>

                <?php endforeach; ?>

            </div>

        </div>

    </div>

</div>

    <footer class="bg-dark text-white">
        Biblioteca de los guri
    </footer>

</body>
</html>
