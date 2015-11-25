<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

	public function index()
	{
		$this->load->model('Juego_model');
		$data = $this->Juego_model->get_entries();
		$lista = array();
		$lista[] = array(
			'INDICE', 'CODIGO USUARIO', 'RPTA CORRECTAS',
			'RPTA INCORRECTAS', 'TOTAL PREGUNTAS', 'FECHA'
		);
		foreach ($data as $key => $value) {
			$lista[] = array(
				$key+1,
				$value['codigo_usuario'],
				$value['puntos'],
				( (int)$value['puntos_total'] - (int)$value['puntos']),
				$value['puntos_total'],
				$value['fecha_fin']
			);
		}

		$path = str_replace('application/', '', APPPATH);
		$fileReporte = $path . 'assets/reporte.csv';

		$fp = fopen($fileReporte, 'w');

		foreach ($lista as $campos) {
			fputcsv($fp, $campos);
		}

		fclose($fp);
		
		header('Content-type: application/csv');
		header("Content-Disposition: inline; filename=reporte.csv");
		readfile($fileReporte);
	}

}
