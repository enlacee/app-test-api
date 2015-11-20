<?php
defined('BASEPATH') OR exit('No direct script access allowed');
$file = FCPATH."application/core/Public_Controller.php"; (is_file($file)) ? include($file) : die("error: {$file}");

class Home extends Public_Controller {

	public function __construct() {
		parent::__construct();
	}

	public function index()
	{
		$this->load->model('Escenario_model');
		$this->load->model('Evidencia_model');
		$this->load->model('Formulario_model');

		$result = $this->Escenario_model->get_last_entries();
		//$form = $this->Formulario_model->get_alternativas_by_formulario_id(6);
		foreach ($result as $key => $value) {
			// obtener lista de evidencias
			$data_evidencia = $this->Evidencia_model->get_by_escenario_id($value['id_escenario']);
			foreach ($data_evidencia as $key1 => $value1) {
				// obtener lista alternativas
				$data_formulario = $this->Formulario_model->get_alternativas_by_formulario_id($value1['id_formulario']);
				$data_evidencia[$key1]['data_formulario'] = $data_formulario;
			}

			$result[$key]['data_evidencia'] = $data_evidencia;
		}

		//shuffle($result);
		echo json_encode($result);
		exit;
	}



}
