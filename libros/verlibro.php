<?php

require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

// Leer filtros desde la URL (GET)
$busqueda = trim($_GET['busqueda'] ?? '');
$generoFiltro = trim($_GET['genero'] ?? '');

// Paginación
$librosPorPagina = 20;
$paginaActual = max(1, (int) ($_GET['pagina'] ?? 1));
$offset = ($paginaActual - 1) * $librosPorPagina;

// Armar condiciones dinámicamente según los filtros
$condiciones = [];
$parametros = [];
$tipos = '';

if ($busqueda !== '') {
    $condiciones[] = "(titulo LIKE ? OR autor LIKE ?)";
    $comodin = "%$busqueda%";
    $parametros[] = $comodin;
    $parametros[] = $comodin;
    $tipos .= 'ss';
}

if ($generoFiltro !== '') {
    $condiciones[] = "genero = ?";
    $parametros[] = $generoFiltro;
    $tipos .= 's';
}

$whereSql = !empty($condiciones) ? " WHERE " . implode(" AND ", $condiciones) : "";

// 1) Contar el total de resultados (para saber cuántas páginas hay)
$sqlConteo = "SELECT COUNT(*) as total FROM libros" . $whereSql;
$stmtConteo = $conn->prepare($sqlConteo);

if (!empty($parametros)) {
    $stmtConteo->bind_param($tipos, ...$parametros);
}

$stmtConteo->execute();
$totalLibros = $stmtConteo->get_result()->fetch_assoc()['total'];
$totalPaginas = max(1, ceil($totalLibros / $librosPorPagina));

// 2) Traer solo los libros de la página actual
$sql = "SELECT * FROM libros" . $whereSql . " ORDER BY id ASC LIMIT ? OFFSET ?";
$stmt = $conn->prepare($sql);

$tiposConLimite = $tipos . 'ii';
$parametrosConLimite = [...$parametros, $librosPorPagina, $offset];
$stmt->bind_param($tiposConLimite, ...$parametrosConLimite);

$stmt->execute();
$resultado = $stmt->get_result();

// Traer la lista de géneros existentes para el select
$generos = $conn->query("SELECT DISTINCT genero FROM libros WHERE genero IS NOT NULL AND genero != '' ORDER BY genero ASC");

// Función para armar la URL de cada página, conservando los filtros activos
function urlPagina($num, $busqueda, $genero) {
    $params = ['pagina' => $num];
    if ($busqueda !== '') $params['busqueda'] = $busqueda;
    if ($genero !== '') $params['genero'] = $genero;
    return 'verlibro.php?' . http_build_query($params);
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Biblioteca - Libros</title>

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

    <h1 class="titulo"><br><br><b>Libros</b></h1>

    <div class="mt-auto d-flex gap-2">
        <a href="agregarlibro.php" class="btn btn-success">
            ➕ Agregar Libro

        <a href="importarcsv.php" class="btn btn-success">
            ➕ Importar CSV

        </a>
    </div>


    <form method="GET" class="filtro-libros mb-4">

        <div class="row g-2 align-items-end">

            <div class="col-md-6">
                <label class="form-label">Buscar por título o autor</label>
                <input type="text" name="busqueda" class="form-control"
                       placeholder="..."
                       value="<?= htmlspecialchars($busqueda) ?>">
            </div>

            <div class="col-md-4">
                <label class="form-label">Género</label>
                <select name="genero" class="form-select">
                    <option value="">Todos</option>
                    <?php while ($fila = $generos->fetch_assoc()): ?>
                        <option value="<?= htmlspecialchars($fila['genero']) ?>"
                            <?= $generoFiltro === $fila['genero'] ? 'selected' : '' ?>>
                            <?= htmlspecialchars($fila['genero']) ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="col-md-2 d-grid">
                <button type="submit" class="btn btn-primary">Filtrar</button>
            </div>

        </div>

        <?php if ($busqueda !== '' || $generoFiltro !== ''): ?>
            <div class="mt-2">
                <a href="verlibro.php" class="btn btn-primary">Limpiar filtros</a>
            </div>
        <?php endif; ?>

    </form>

    <div class="card mb-4">

        <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
            <h4 class="mb-0">Listado de Libros</h4>
            <small><?= $totalLibros ?> libro<?= $totalLibros != 1 ? 's' : '' ?> en total</small>
        </div>

        <div class="card-body">

            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-5">

                <?php
                if ($resultado->num_rows > 0) {

                    while ($libro = $resultado->fetch_assoc()) {
                ?>

                        <div class="col">

                            <div class="card h-100 shadow-sm">

                                <?php if (!empty($libro["portada"])): ?>
                                    <img src="/carpeta/uploads/portadas/<?= htmlspecialchars($libro["portada"]) ?>"
                                         class="card-img-top portada-libro"
                                         alt="Portada de <?= htmlspecialchars($libro["titulo"]) ?>">
                                <?php else: ?>
                                    <img src="/carpeta/assets/sin-portada.png"
                                         class="card-img-top portada-libro"
                                         alt="Sin portada">
                                <?php endif; ?>

                                <div class="card-body d-flex flex-column">

                                    <h5 class="card-title"><?= htmlspecialchars($libro["titulo"]) ?></h5>

                                    <p class="card-text">
                                        <b>Autor:</b> <?= htmlspecialchars($libro["autor"]) ?><br>
                                        <b>Año:</b> <?= $libro["anio"] ?><br>
                                        <b>Páginas:</b> <?= $libro["paginas"] ?><br>
                                        <?php if (!empty($libro["genero"])): ?>
                                            <b>Género:</b> <?= htmlspecialchars($libro["genero"]) ?>
                                        <?php endif; ?>
                                    </p>

                                    <div class="mt-auto d-flex gap-2">

                                        <a href="editarlibro.php?id=<?= $libro["id"] ?>" class="btn btn-warning btn-sm">
                                            Editar
                                        </a>

                                        <a href="eliminarlibro.php?id=<?= $libro["id"] ?>"
                                           class="btn btn-danger btn-sm"
                                           onclick="return confirm('¿Deseas eliminar este libro?')">
                                            Eliminar
                                        </a>

                                    </div>

                                </div>

                            </div>

                        </div>

                <?php
                    }

                } else {

                    echo "<div class='col-12'><div class='alert alert-info'>No se encontraron libros con esos filtros.</div></div>";

                }
                ?>

            </div>

           <?php if ($totalPaginas > 1): ?>

    <div class="paginador mt-4">
        <ul class="pagination justify-content-center">

            <li class="page-item <?= $paginaActual <= 1 ? 'disabled' : '' ?>">
                <a class="page-link" href="<?= urlPagina($paginaActual - 1, $busqueda, $generoFiltro) ?>">Anterior</a>
            </li>

            <?php for ($i = 1; $i <= $totalPaginas; $i++): ?>
                <li class="page-item <?= $i === $paginaActual ? 'active' : '' ?>">
                    <a class="page-link" href="<?= urlPagina($i, $busqueda, $generoFiltro) ?>"><?= $i ?></a>
                </li>
            <?php endfor; ?>

            <li class="page-item <?= $paginaActual >= $totalPaginas ? 'disabled' : '' ?>">
                <a class="page-link" href="<?= urlPagina($paginaActual + 1, $busqueda, $generoFiltro) ?>">Siguiente</a>
            </li>

        </ul>
    </div>

<?php endif; ?>

        </div>

    </div>

</div>
   
    <footer class="bg-dark text-white text-center p-3 mt-5">
        © 2026 Sigma Tech -  All rights reserved
    </footer>

</div>

</body>

</html>