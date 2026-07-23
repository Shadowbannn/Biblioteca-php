<?php
require_once('../includes/seguridad.php');
require_once('../socios/socio.php');
require_once('../config/conexion.php');

// Verificar que exista el ID
if (!isset($_GET["id"])) {
    header("Location: verlibro.php");
    exit();
}

$id = $_GET["id"];

// Si se envió el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $titulo = $_POST["titulo"];
    $autor = $_POST["autor"];
    $anio = $_POST["anio"];
    $paginas = $_POST["paginas"];
    $genero = trim($_POST["genero"] ?? '');
    $urlPortada = trim($_POST["portada_url"] ?? '');

    // Traer la portada actual por si no cambian nada
    $stmtActual = $conn->prepare("SELECT portada FROM libros WHERE id=?");
    $stmtActual->bind_param("i", $id);
    $stmtActual->execute();
    $libroActual = $stmtActual->get_result()->fetch_assoc();
    $portada = $libroActual["portada"];

    $carpetaDestino = '../uploads/portadas/';
    $extensionesPermitidas = ['jpg', 'jpeg', 'png', 'webp'];
    $nuevaPortadaGuardada = false;

    // 1) Prioridad: si subieron un archivo, usar ese
    if (isset($_FILES['portada']) && $_FILES['portada']['error'] === UPLOAD_ERR_OK) {

        $extension = strtolower(pathinfo($_FILES['portada']['name'], PATHINFO_EXTENSION));

        if (in_array($extension, $extensionesPermitidas)) {

            $nombreArchivo = uniqid('portada_', true) . '.' . $extension;
            $rutaDestino = $carpetaDestino . $nombreArchivo;

            if (move_uploaded_file($_FILES['portada']['tmp_name'], $rutaDestino)) {
                if (!empty($portada) && file_exists($carpetaDestino . $portada)) {
                    unlink($carpetaDestino . $portada);
                }
                $portada = $nombreArchivo;
                $nuevaPortadaGuardada = true;
            }
        }
    }

    // 2) Si no subieron archivo, pero pegaron/autocompletaron una URL, descargarla
    if (!$nuevaPortadaGuardada && !empty($urlPortada) && filter_var($urlPortada, FILTER_VALIDATE_URL)) {

        $extension = strtolower(pathinfo(parse_url($urlPortada, PHP_URL_PATH), PATHINFO_EXTENSION));

        if (!in_array($extension, $extensionesPermitidas)) {
            $extension = 'jpg'; // portadas de APIs a veces no traen extensión en la URL
        }

        $contexto = stream_context_create([
            'http' => ['timeout' => 10],
            'https' => ['timeout' => 10]
        ]);

        $contenidoImagen = @file_get_contents($urlPortada, false, $contexto);

        if ($contenidoImagen !== false) {

            $nombreArchivo = uniqid('portada_', true) . '.' . $extension;
            $rutaDestino = $carpetaDestino . $nombreArchivo;

            if (file_put_contents($rutaDestino, $contenidoImagen)) {
                if (!empty($portada) && file_exists($carpetaDestino . $portada)) {
                    unlink($carpetaDestino . $portada);
                }
                $portada = $nombreArchivo;
            } else {
                $error = "No se pudo guardar la imagen descargada.";
            }
        } else {
            $error = "No se pudo descargar la imagen desde esa URL.";
        }
    }

    // Solo actualizar si no hubo error
    if (!isset($error)) {

        $stmt = $conn->prepare("UPDATE libros SET titulo=?, autor=?, anio=?, paginas=?, genero=?, portada=? WHERE id=?");
        $stmt->bind_param("ssiissi", $titulo, $autor, $anio, $paginas, $genero, $portada, $id);

        if ($stmt->execute()) {
            header("Location: verlibro.php");
            exit();
        } else {
            $error = "Error al actualizar el libro.";
        }
    }
}

// Obtener datos del libro
$stmt = $conn->prepare("SELECT * FROM libros WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();

$resultado = $stmt->get_result();
$libro = $resultado->fetch_assoc();

if (!$libro) {
    die("Libro no encontrado.");
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Editar Libro</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container mt-5">

    <div class="form-card">

        <h2>Editar Libro</h2>

        <?php
        if(isset($error)){
            echo "<div class='alert alert-danger'>$error</div>";
        }
        ?>

        <div class="mb-3">
            <label>Buscar por ISBN o título</label>
            <div class="input-group">
                <input type="text" id="buscarLibro" class="form-control" placeholder="Ej: 978-8420633994 o El Principito">
                <button type="button" id="btnBuscar" class="btn btn-outline-secondary">Buscar</button>
            </div>
            <small style="color: white;">Esto reemplaza los datos de abajo, después podés editarlos si querés.</small>
        </div>

        <form method="POST" enctype="multipart/form-data">

            <label>Título</label>
            <input
                type="text"
                name="titulo"
                id="titulo"
                class="form-control mb-3"
                value="<?= htmlspecialchars($libro["titulo"]) ?>"
                required>

            <label>Autor</label>
            <input
                type="text"
                name="autor"
                id="autor"
                class="form-control mb-3"
                value="<?= htmlspecialchars($libro["autor"]) ?>"
                required>

            <label>Año</label>
            <input
                type="number"
                name="anio"
                id="anio"
                class="form-control mb-3"
                value="<?= $libro["anio"] ?>"
                required>

            <label>Páginas</label>
            <input
                type="number"
                name="paginas"
                id="paginas"
                class="form-control mb-3"
                value="<?= $libro["paginas"] ?>"
                required>

            <label>Género</label>
            <input
                type="text"
                name="genero"
                id="genero"
                class="form-control mb-3"
                value="<?= htmlspecialchars($libro["genero"] ?? '') ?>"
                placeholder="Ej: Novela, Poesía, Ensayo">

            <label>Portada actual</label><br>

            <div id="previewPortada" class="mb-2">
                <?php if (!empty($libro["portada"])): ?>
                    <img src="/carpeta/uploads/portadas/<?= htmlspecialchars($libro["portada"]) ?>"
                         alt="Portada actual"
                         class="portada-preview">
                <?php else: ?>
                    <p class="text-muted">Este libro no tiene portada.</p>
                <?php endif; ?>
            </div>

            <input type="hidden" name="portada_url" id="portada_url">

            <input type="file" name="portada" class="form-control mb-2" accept="image/*">
            <small style="color: white;" class="d-block mb-2">Opción A: subir un archivo desde tu computadora.</small>

            <input type="url" name="portada_url_manual" id="portada_url_manual" class="form-control mb-1" placeholder="https://ejemplo.com/imagen.jpg">
            <small style="color: white;" class="d-block mb-3">Opción B: pegar un link directo a una imagen. Si subís un archivo, el link se ignora.</small>

            <button class="btn btn-primary w-100 mb-2">
                Guardar Cambios
            </button>

            <a href="verlibro.php" class="btn btn-secondary w-100">
                Cancelar
            </a>

        </form>

    </div>

</div>

<script>
document.addEventListener('DOMContentLoaded', function () {

    // Si el usuario escribe manualmente en el campo de URL, usar ese valor al enviar
    document.getElementById('portada_url_manual').addEventListener('input', function () {
        document.getElementById('portada_url').value = this.value.trim();
    });

    document.getElementById('btnBuscar').addEventListener('click', async function () {

        const query = document.getElementById('buscarLibro').value.trim();

        if (!query) {
            alert('Escribí un ISBN o un título para buscar.');
            return;
        }

        const boton = this;
        boton.disabled = true;
        boton.textContent = 'Buscando...';

        const apiKey = 'AIzaSyCoSQTsL_0SmsOFqA6C-FGDn0sN81HUtsI';

        function completarCampos(titulo, autor, anio, paginas, urlPortada, genero) {

            document.getElementById('titulo').value = titulo || '';
            document.getElementById('autor').value = autor || '';
            document.getElementById('anio').value = anio || '';
            document.getElementById('paginas').value = paginas || '';
            document.getElementById('genero').value = genero || '';

            const previewDiv = document.getElementById('previewPortada');

            if (urlPortada) {
                document.getElementById('portada_url').value = urlPortada;
                document.getElementById('portada_url_manual').value = urlPortada;
                previewDiv.innerHTML = `<img src="${urlPortada}" class="portada-preview">`;
            } else {
                document.getElementById('portada_url').value = '';
                previewDiv.innerHTML = '<p class="text-muted">No se encontró portada para este libro.</p>';
            }
        }

        async function buscarEnOpenLibrary() {

            const respuesta = await fetch(`https://openlibrary.org/search.json?q=${encodeURIComponent(query)}&limit=1`);
            const datos = await respuesta.json();

            console.log('Respuesta Open Library:', datos);

            if (!datos.docs || datos.docs.length === 0) {
                alert('No se encontró ningún libro con esos datos.');
                return;
            }

            const libro = datos.docs[0];
            const urlPortada = libro.cover_i ? `https://covers.openlibrary.org/b/id/${libro.cover_i}-M.jpg` : null;

            completarCampos(
                libro.title,
                libro.author_name ? libro.author_name[0] : '',
                libro.first_publish_year,
                libro.number_of_pages_median,
                urlPortada,
                ''
            );
        }

        try {

            const respuesta = await fetch(`https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(query)}&key=${apiKey}`);

            console.log('Status HTTP Google:', respuesta.status);

            const datos = await respuesta.json();

            console.log('Respuesta Google Books:', datos);

            if (datos.error || !datos.items || datos.items.length === 0) {
                console.warn('Google Books falló o no encontró nada, probando con Open Library...');
                await buscarEnOpenLibrary();
                return;
            }

            const libro = datos.items[0].volumeInfo;

            completarCampos(
                libro.title,
                libro.authors ? libro.authors[0] : '',
                libro.publishedDate ? libro.publishedDate.substring(0, 4) : '',
                libro.pageCount,
                libro.imageLinks && libro.imageLinks.thumbnail ? libro.imageLinks.thumbnail.replace('http://', 'https://') : null,
                libro.categories ? libro.categories[0] : ''
            );

        } catch (error) {

            console.warn('Error con Google Books, probando con Open Library...', error);

            try {
                await buscarEnOpenLibrary();
            } catch (errorOpenLibrary) {
                alert('No se pudo buscar el libro en ninguna de las dos fuentes.');
                console.error('Error real:', errorOpenLibrary);
            }

        } finally {
            boton.disabled = false;
            boton.textContent = 'Buscar';
        }
    });

});
</script>

</body>
</html>