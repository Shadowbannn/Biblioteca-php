<?php
require_once('../includes/seguridad.php');
require_once('../config/conexion.php');

$titulo   = $_POST['titulo'];
$autor    = $_POST['autor'];
$anio     = $_POST['anio'];
$paginas  = $_POST['paginas'];
$genero   = trim($_POST['genero'] ?? '');
$urlPortada = trim($_POST['portada_url'] ?? '');
$portada  = null;

$carpetaDestino = '../uploads/portadas/';
$extensionesPermitidas = ['jpg', 'jpeg', 'png', 'webp'];

// 1) Prioridad: archivo subido manualmente
if (isset($_FILES['portada']) && $_FILES['portada']['error'] === UPLOAD_ERR_OK) {

    $extension = strtolower(pathinfo($_FILES['portada']['name'], PATHINFO_EXTENSION));

    if (in_array($extension, $extensionesPermitidas)) {
        $nombreArchivo = uniqid('portada_', true) . '.' . $extension;
        if (move_uploaded_file($_FILES['portada']['tmp_name'], $carpetaDestino . $nombreArchivo)) {
            $portada = $nombreArchivo;
        }
    }
}

// 2) Si no hay archivo, usar la portada autocompletada por la API
if (!$portada && !empty($urlPortada) && filter_var($urlPortada, FILTER_VALIDATE_URL)) {

    $contexto = stream_context_create(['http' => ['timeout' => 10], 'https' => ['timeout' => 10]]);
    $contenidoImagen = @file_get_contents($urlPortada, false, $contexto);

    if ($contenidoImagen !== false) {
        $nombreArchivo = uniqid('portada_', true) . '.jpg';
        if (file_put_contents($carpetaDestino . $nombreArchivo, $contenidoImagen)) {
            $portada = $nombreArchivo;
        }
    }
}

$stmt = $conn->prepare("INSERT INTO libros (titulo, autor, anio, paginas, genero, portada) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssiiss", $titulo, $autor, $anio, $paginas, $genero, $portada);

if ($stmt->execute()) {
    header("Location: verlibro.php");
    exit();
} else {
    $error = "Error al agregar el libro.";
}