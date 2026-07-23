<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

header('Content-Type: application/json');
ini_set('display_errors', 0);
error_reporting(E_ALL);


$carpetaTemp = '../uploads/temp/';
$carpetaPortadas = '../uploads/portadas/';
$apiKey = 'AIzaSyCoSQTsL_0SmsOFqA6C-FGDn0sN81HUtsI';

$archivo = basename($_GET['archivo'] ?? '');
$offset = (int) ($_GET['offset'] ?? 0);
$loteSize = (int) ($_GET['lote'] ?? 15);

$rutaArchivo = $carpetaTemp . $archivo;

if (!file_exists($rutaArchivo)) {
    echo json_encode(['error' => 'Archivo no encontrado', 'procesados' => 0, 'importados' => 0, 'fallidos' => 0]);
    exit;
}

$libros = json_decode(file_get_contents($rutaArchivo), true);
$lote = array_slice($libros, $offset, $loteSize);

$importados = 0;
$fallidos = 0;

foreach ($lote as $libro) {

    $portada = null;

    if (!empty($libro['isbn'])) {

        $urlApi = "https://www.googleapis.com/books/v1/volumes?q=isbn:{$libro['isbn']}&key=$apiKey";
        $respuestaApi = @file_get_contents($urlApi);

        if ($respuestaApi !== false) {

            $datosApi = json_decode($respuestaApi, true);
            $urlThumbnail = $datosApi['items'][0]['volumeInfo']['imageLinks']['thumbnail'] ?? null;

            if ($urlThumbnail) {

                $urlThumbnail = str_replace('http://', 'https://', $urlThumbnail);
                $contenidoImagen = @file_get_contents($urlThumbnail);

                if ($contenidoImagen !== false) {
                    $nombreArchivo = uniqid('portada_', true) . '.jpg';
                    if (file_put_contents($carpetaPortadas . $nombreArchivo, $contenidoImagen)) {
                        $portada = $nombreArchivo;
                    }
                }
            }
        }
    }

    $stmt = $conn->prepare("INSERT INTO libros (titulo, autor, anio, paginas, genero, portada) VALUES (?, ?, ?, ?, ?, ?)");

    if (!$stmt) {
        echo json_encode([
            'error' => 'Error preparando consulta: ' . $conn->error,
            'procesados' => count($lote),
            'importados' => 0,
            'fallidos' => count($lote),
        ]);
        exit;
    }
    
    $stmt->bind_param(
        "ssiiss",
        $libro['titulo'],
        $libro['autor'],
        $libro['anio'],
        $libro['paginas'],
        $libro['genero'],
        $portada
    );

    if ($stmt->execute()) {
        $importados++;
    } else {
        $fallidos++;
    }
}

// Si ya llegamos al final, borrar el archivo temporal
if ($offset + $loteSize >= count($libros)) {
    @unlink($rutaArchivo);
}

echo json_encode([
    'procesados' => count($lote),
    'importados' => $importados,
    'fallidos' => $fallidos,
]);