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
        $this->db->select()->from($this->_name);
        $this->db->join(
            'ac_escenarios_evidencias',
            "ac_escenarios_evidencias.id_evidencia = {$this->_name}.id_evidencia",
            'join'
        );
        $this->db->join(
            'ac_formularios',
            "ac_formularios.id_formulario = {$this->_name}.id_formulario",
            'join'
        );
        $this->db->where("ac_escenarios_evidencias.id_escenario", $id_escenario);
        //$this->db->limit();
        $query = $this->db->get();
        $response = $query->result_array();

        return $response;
    }

}