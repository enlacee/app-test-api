<?php

class Juego_model extends CI_Model {

    public $_name = 'ac_juego';

    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
        $this->load->database();
    }

    public function get_entries()
    {
        $query = $this->db->select('*')
            //->where('fecha_fin', 1)
			->order_by('fecha_fin', 'asc')
            ->get($this->_name, 100);
		
        return $query->result_array();
    }

    /**
    * select detail playgame
    */
    public function get_entries_detalle($id_juego)
    {
        $table1             = 'ac_juego_detalle';
        $table2             = 'ac_escenarios_evidencias';
        $tableEscenario     = 'ac_escenarios';
        $tableEvidencia     = 'ac_evidencias';
        $tableAlternativa   = 'ac_alternativas';

        $selectText = 'ac_juego.id_juego,'
            . $table1 . '.description,' // CORRECTO O INCORRECTO
            . $tableAlternativa . '.description AS description_respuesta,'
            . $tableEscenario . '.description AS description_escenario,' // Escenario
            . $tableEvidencia . '.texto AS  description_evidencia,' // Evidencia
            . "";

        $this->db->select($selectText)->from('ac_juego');
        $this->db->join($table1, $table1 . ".id_juego = ac_juego.id_juego", 'join');
        $this->db->join($tableAlternativa, $tableAlternativa . ".id_alternativa = {$table1}.respuesta", 'left');
        $this->db->join($table2, $table2 . ".id_escenario_evidencia = {$table1}.id_escenario_evidencia", 'left');
        //table data necesary
        $this->db->join($tableEscenario, $tableEscenario . ".id_escenario = {$table2}.id_escenario", 'join');
        $this->db->join($tableEvidencia, $tableEvidencia . ".id_evidencia = {$table2}.id_evidencia", 'join');


        $this->db->where("ac_juego.id_juego", $id_juego);
        $this->db->order_by('ac_juego.fecha_fin', 'asc');
        //print_r($this->db->get_compiled_select()); exit;

        $query = $this->db->get();
        $response = $query->result_array();

        return $response;
    }

}
