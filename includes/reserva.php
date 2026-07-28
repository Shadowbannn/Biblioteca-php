<?php

function liberarReservasVencidas($conn) {

    $stmt = $conn->prepare("SELECT id, libro_id FROM prestamos WHERE estado = 'reservado' AND creado_en < (NOW() - INTERVAL 30 MINUTE)");
    $stmt->execute();
    $vencidas = $stmt->get_result();

    while ($reserva = $vencidas->fetch_assoc()) {

        $conn->begin_transaction();

        try {
            $stmtCancelar = $conn->prepare("UPDATE prestamos SET estado = 'cancelado' WHERE id = ?");
            $stmtCancelar->bind_param("i", $reserva['id']);
            $stmtCancelar->execute();

            $stmtLibro = $conn->prepare("UPDATE libros SET disponible = 1 WHERE id = ?");
            $stmtLibro->bind_param("i", $reserva['libro_id']);
            $stmtLibro->execute();

            $conn->commit();
        } catch (Exception $e) {
            $conn->rollback();
        }
    }
}