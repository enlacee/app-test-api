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
}
