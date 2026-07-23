<?php

class Prestamo {

    public $obj_socio;
    public $obj_libro;
    public $fecha_prestamo;
    public $fecha_devolucion;

    public function __construct(
        Socio $obj_socio,
        Libro $obj_libro,
        $fecha_prestamo,
        $fecha_devolucion
    ) {
        $this->obj_socio          = $obj_socio;
        $this->obj_libro          = $obj_libro;
        $this->fecha_prestamo     = $fecha_prestamo;
        $this->fecha_devolucion   = $fecha_devolucion;
    }

    public function mostrarInfo() {
        return
            $this->obj_socio->mostrarInfo() . "<br>" .
            $this->obj_libro->mostrarInfo() . "<br>" .
            "<b>Fecha préstamo:</b> " . $this->fecha_prestamo . "<br>" .
            "<b>Fecha devolución:</b> " . $this->fecha_devolucion;
    }
}

?>