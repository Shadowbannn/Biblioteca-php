<?php
require_once('../includes/seguridad.php');
require_once('../socios/socio.php');
require_once('../config/conexion.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $titulo = $_POST["titulo"];
    $autor = $_POST["autor"];
    $anio = $_POST["anio"];
    $paginas = $_POST["paginas"];

    $sql = "INSERT INTO libros (titulo, autor, anio, paginas)
            VALUES ('$titulo', '$autor', '$anio', '$paginas')";

    if ($conn->query($sql)) {
        header("Location: verlibro.php");
        exit();
    } else {
        $error = "Error al agregar el libro.";
    }
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Agregar Libro</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>

<body>

<div class="container mt-5">

    <div class="form-card">

        <h2>Agregar Libro</h2>

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
            <small style="color: white;">Esto autocompleta los datos, después podés editarlos si querés.</small>

        </div>
        
        <form action="guardarlibro.php" method="POST" enctype="multipart/form-data">

            <input type="text" name="titulo" id="titulo" class="form-control mb-3" placeholder="Título" required>
            <input type="text" name="autor" id="autor" class="form-control mb-3" placeholder="Autor" required>
            <input type="number" name="anio" id="anio" class="form-control mb-3" placeholder="Año">
            <input type="number" name="paginas" id="paginas" class="form-control mb-3" placeholder="Páginas">
            <input type="text" name="genero" id="genero" class="form-control mb-3" placeholder="Género (ej: Novela, Poesía, Ensayo)">
            <input type="hidden" name="portada_url" id="portada_url">

            <div class="mb-3">
                <label>Portada (opcional, si ya se autocompletó no hace falta)</label>
                <input type="file" name="portada" class="form-control">
            </div>

            <div id="previewPortada" class="mb-3"></div>

            <button type="submit" class="btn btn-success w-100">Guardar</button>

        </form>

    </div>

</div>

<script>
document.addEventListener('DOMContentLoaded', function () {

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
            previewDiv.innerHTML = `
                <label>Portada encontrada:</label><br>
                <img src="${urlPortada}" style="width:100px; border-radius:4px;">
            `;
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