<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

$carpetaTemp = '../uploads/temp/';
$archivoJson = null;
$total = 0;

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['archivo_csv'])) {

    if ($_FILES['archivo_csv']['error'] !== UPLOAD_ERR_OK) {
        $error = "Error al subir el archivo.";
    } else {

        $handle = fopen($_FILES['archivo_csv']['tmp_name'], 'r');

        if ($handle === false) {
            $error = "No se pudo abrir el archivo CSV.";
        } else {

            $encabezados = fgetcsv($handle);
            $encabezados = array_map(fn($h) => trim($h), $encabezados);
            $indice = array_flip($encabezados);

            $estadosPermitidos = ['read', 'currently-reading'];
            $librosFiltrados = [];

            while (($fila = fgetcsv($handle)) !== false) {

                $titulo = trim($fila[$indice['titulo']] ?? '');

                if (empty($titulo)) {
                    continue;
                }

                $autor = trim($fila[$indice['autor']] ?? '');

                // Limpiar ISBN (por si viene con formato ="9781234567890")
                $isbn = preg_replace('/[^0-9X]/', '', $fila[$indice['isbn']] ?? '');

                $editorial = trim($fila[$indice['editorial']] ?? '');

                $anio = trim($fila[$indice['anio']] ?? '');
                $paginas = trim($fila[$indice['paginas']] ?? '');

                $genero = trim($fila[$indice['genero']] ?? '');

                $librosFiltrados[] = [
                    'titulo' => $titulo,
                    'autor' => $autor,
                    'anio' => $anio !== '' ? $anio : 0,
                    'paginas' => $paginas !== '' ? $paginas : null,
                    'genero' => $genero,
                    'isbn' => $isbn,
                    'editorial' => $editorial,
                ];
            }

            fclose($handle);

            if (!is_dir($carpetaTemp)) {
                mkdir($carpetaTemp, 0755, true);
            }

            $nombreArchivo = uniqid('importacion_', true) . '.json';
            file_put_contents($carpetaTemp . $nombreArchivo, json_encode($librosFiltrados));

            $archivoJson = $nombreArchivo;
            $total = count($librosFiltrados);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Importar CSV</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="form.css">
</head>

<body>

<div class="container mt-5">

    <div class="form-card">

        <h2><span class="centrado">Importar libros</span></h2>

        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
        <?php endif; ?>

        <?php if (!$archivoJson): ?>

            <form method="POST" 
                  enctype="multipart/form-data">

                <label>Archivo CSV</label>
                <input type="file" 
                       name="archivo_csv" 
                       class="form-control mb-3" 
                       accept=".csv" required>
                </input>

                <button type="submit" 
                        class="btn btn-primary w-100">
                        Analizar CSV
                </button>
                    <br><br>
                     <a href="../index.php" class="btn btn-success sm-3">
                         ← Volver al inicio
                    </a>

                    <a href="../libros/verlibro.php" class="btn btn-secondary sm">
                        ← Volver a libros
                    </a>


            </form>

        <?php else: ?>

            <p><b><?= $total ?></b> libros encontrados para importar (leídos + leyendo actualmente).</p>

            <div class="progress mb-3" style="height: 25px;">
                <div id="barraProgreso" class="progress-bar" role="progressbar" style="width: 0%">0%</div>
            </div>

                <p  id="estadoTexto" 
                    class="text-white">
                    Preparando importación...
                </p>

                    <a  href="verlibro.php" 
                        class="btn btn-secondary w-100 d-none" 
                        id="btnVolver">
                        Ver listado de libros
                    </a>

            <script>
                const archivoJson = <?= json_encode($archivoJson) ?>;
                const total = <?= $total ?>;
                const loteSize = 15;
                let offset = 0;
                let importados = 0;
                let fallidos = 0;

                async function procesarSiguienteLote() {

                    if (offset >= total) {
                        document.getElementById('estadoTexto').textContent =
                            `Listo: ${importados} libros importados, ${fallidos} con errores.`;
                        document.getElementById('btnVolver').classList.remove('d-none');
                        return;
                    }

                    document.getElementById('estadoTexto').textContent =
                        `Procesando libros ${offset + 1} a ${Math.min(offset + loteSize, total)} de ${total}...`;

                    try {

                        const respuesta = await fetch(`procesar_lote.php?archivo=${encodeURIComponent(archivoJson)}&offset=${offset}&lote=${loteSize}`);
                        const datos = await respuesta.json();

                        importados += datos.importados;
                        fallidos += datos.fallidos;
                        offset += datos.procesados;

                        const porcentaje = Math.round((offset / total) * 100);
                        const barra = document.getElementById('barraProgreso');
                        barra.style.width = porcentaje + '%';
                        barra.textContent = porcentaje + '%';

                        setTimeout(procesarSiguienteLote, 200);

                    } catch (error) {
                        document.getElementById('estadoTexto').textContent = 'Ocurrió un error durante la importación.';
                        console.error(error);
                    }
                }

                procesarSiguienteLote();
            </script>

        <?php endif; ?>

    </div>
            
 
    </div>
       
</div>


</body>
</html>