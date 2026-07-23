    <?php
    require_once('../includes/seguridad.php');
    ?>

    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <title>Agregar Socio</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
    </head>

    <body>

    <div class="container mt-5">

        <div class="form-card">

            <h2>Agregar Socio</h2>

            <?php
            if (isset($_GET['error'])) {
                echo "<div class='alert alert-danger'>Error al agregar el socio.</div>";
            }
            ?>

            <form action="guardarsocio.php" method="POST">

                <input
                    type="text"
                    name="nombre"
                    id="nombre"
                    class="form-control mb-3"
                    placeholder="Nombre"
                    required>

                <input
                    type="text"
                    name="apellido"
                    id="apellido"
                    class="form-control mb-3"
                    placeholder="Apellido"
                    required>

            

                <input
                    type="email"
                    name="email"
                    id="email"
                    class="form-control mb-3"
                    placeholder="Correo electrónico">

                <input
                    type="text"
                    name="telefono"
                    id="telefono"
                    class="form-control mb-3"
                    placeholder="Teléfono">

                <input
                    type="text"
                    name="cedula"
                    id="cedula"
                    class="form-control mb-3"
                    placeholder="Cédula"
                    maxlength="8"
                    required>

                <button type="submit" class="btn btn-success w-100">
                    Guardar Socio
                </button>

            </form>

        </div>

    </div>

    </body>
    </html>