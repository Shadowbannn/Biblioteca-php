<?php
require_once __DIR__ . "/includes/seguridad.php";
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Biblioteca</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>

<body>

<nav>

<a href="Index.php"> 
 <img src="img/logo.png" 
 alt="Inicio" style="width: 250px; height: auto;">
 
</a>
    
    <ul>
        <li><a href="Index.php"><b>Inicio</b></a></li>
        <li><a href="libros/verlibro.php"><b>Libros</b></a></li>
        <li><a href="socios/versocio.php"><b>Alumnos</b></a></li>
        <li><a href="prestamos/verprestamo.php"><b>Prestamos</b></a></li>
        <li><a href="logout.php"><b>Cerrar sesión</b></a></li>
    </ul>

</nav>

<div class="container">

    <h1 class="titulo"><br><br><b>Bienvenidos</b></h1>

    <div class="row mt-5">

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <a href="/carpeta/libros/verlibro.php">
                <img class="card-img-top" src="https://statics.forbesuruguay.com/2024/11/crop/67407a774a603__600x390.webp" alt="Libros"></a>
                
                <div class="card-body">
                    <h5 class="card-title">Libritos</h5>
                    <p class="card-text">Libritos disponibles</p>
                    <a href="/carpeta/libros/verlibro.php" class="btn btn-primary">Ver Libritos</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <a href="socios/versocio.php"> 
                <img class="card-img-top" src="https://imagenes.excelsior.com.mx/files/og_thumbnail/uploads/2025/03/11/691ffb95e51ea.jpeg" alt="Socios"></a>
                
                <div class="card-body">
                    <h5 class="card-title">Alumnos</h5>
                    <p class="card-text">Sociedad de lectores</p>
                    <a href="socios/versocio.php" class="btn btn-primary">Ver Alumnos</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card h-100">
                <a href="prestamos/verprestamo.php">
                <img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLfB2R3avYAP-mu4DI27Gz26QW7mcJDZTMn3TafilEoWUBRZ4kJoS_Bywt&s=10" alt="Prestamos"></a>
                
                <div class="card-body">
                    <h5 class="card-title">Prestamos</h5>
                    <p class="card-text">Prestamos hechos</p>
                    <a href="prestamos/verprestamo.php" class="btn btn-primary">Ver Prestamos</a>
                </div>
            </div>
        </div>

    </div>
</div>
</div>

    <footer class="bg-dark text-white text-center p-3 mt-5">
        © 2026 Sigma Tech -  All rights reserved
    </footer>

</body>
</html>