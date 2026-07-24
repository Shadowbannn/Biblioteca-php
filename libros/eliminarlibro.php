<?php
require_once('../includes/seguridad.php');
require_once('../socios/socio.php');
require_once('../config/conexion.php');

if (!isset($_GET["id"])) {
    header("Location: verlibro.php");
    exit();
}

$id = $_GET["id"];

// Guardar los parámetros de la página actual para volver al mismo lugar
$pagina = $_GET['pagina'] ?? 1;
$busqueda = $_GET['busqueda'] ?? '';
$genero = $_GET['genero'] ?? '';

$stmt = $conn->prepare("DELETE FROM libros WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

// Armar la URL de vuelta conservando página, búsqueda y género
$parametros = ['pagina' => $pagina];
if ($busqueda !== '') $parametros['busqueda'] = $busqueda;
if ($genero !== '') $parametros['genero'] = $genero;

header("Location: verlibro.php?" . http_build_query($parametros));
exit();
?>