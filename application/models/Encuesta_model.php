<?php

class Encuesta_model extends CI_Model {

    public $_name = 'ac_encuestas';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function get_entries()
    {
        $this->db->select()->from($this->_name);
        $this->db->join(
            'ac_juego',
            "ac_juego.id_juego = {$this->_name}.id_juego",
            'join'
        );
			
		$now = date('Y-m-d');
		$date = new DateTime($now);
		$date->sub(new DateInterval('P10D')); // 10 dias
		$antes10 = $date->format('Y-m-d');
			
        //$this->db->where("ac_juego.fecha_fin >", $antes10);
        $query = $this->db->get();
        $response = $query->result_array();

        return $response;
    }

}