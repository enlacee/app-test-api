<?php

class Evidencia_model extends CI_Model {

    public $_name = 'ac_evidencias';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_by_escenario_id($id_escenario)
    {
        $this->db->select("{$this->_name}.*, ac_escenarios_evidencias.id as id_escenario_evidencia")->from($this->_name);
        $this->db->join(
            'ac_escenarios_evidencias',
            "ac_escenarios_evidencias.id_evidencia = {$this->_name}.id", 'join');
        $this->db->where("ac_escenarios_evidencias.id_escenario", $id_escenario);
        //$this->db->limit();
        $query = $this->db->get();
        $response = $query->result_array();

        return $response;
    }

}