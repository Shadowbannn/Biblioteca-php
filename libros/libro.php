<?php

class Libro {

    public $titulo;
    public $autor;
    public $fecha_publicacion;
    public $cantidad_paginas;

    public function __construct($titulo, $autor, $fecha_publicacion, $cantidad_paginas) {
        $this->titulo               = $titulo;
        $this->autor                = $autor;
        $this->fecha_publicacion    = $fecha_publicacion;
        $this->cantidad_paginas     = $cantidad_paginas;
    }

    public function mostrarInfo() {
        return "<b>Título:</b> " . $this->titulo . "<br>" .
               "  <b>Autor:</b> " . $this->autor . "<br>" .
               "  <b>Año:</b> " . $this->fecha_publicacion . "<br>" .
               "  <b>Páginas:</b> " . $this->cantidad_paginas;
    }
}

?>