<?php

class Formulario_model extends CI_Model {

    public $_name = 'ac_formularios';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
    * obtener lista de alternativas de 1 formulario
    */
    public function get_alternativas_by_formulario_id($id_formulario)
    {
        $this->db->select("ac_alternativas.*")->from('ac_alternativas');
        $this->db->join(
            'ac_alternativas_formularios',
            "ac_alternativas_formularios.id_alternativa = ac_alternativas.id_alternativa", 'join');
        $this->db->where("ac_alternativas_formularios.id_formulario", $id_formulario);
        //$this->db->limit();
        $query = $this->db->get();
        $response = $query->result_array();

        return $response;
    }

}