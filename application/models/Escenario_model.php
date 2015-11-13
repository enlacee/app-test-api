<?php

class Escenario_model extends CI_Model {

    public $_name = 'ac_escenarios';

    public function __construct()
    {
        // Call the CI_Model constructor
        parent::__construct();
        $this->load->database();
    }

    public function get_last_entries()
    {
        $query = $this->db->get($this->_name, 22);
        return $query->result_array();
    }
}