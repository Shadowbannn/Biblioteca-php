<?php

class Socio {

    public $nombre;
    public $numero_socio;
    public $email;

    public function __construct($nombre, $numero_socio, $email) {
        $this->nombre        = $nombre;
        $this->numero_socio  = $numero_socio;
        $this->email         = $email;
    }

    public function mostrarInfo() {
        return "<b>Nombre:</b> " . $this->nombre . "<br>" .
               "  <b>Número de socio:</b> " . $this->numero_socio . "<br>" .
               "  <b>Email:</b> " . $this->email;
    }
}

?>