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
    
    public function full_report() {
	
	return true;
    }
    
    /**
     * Report encuesta
     */
    public function reporte_total()
    {
	
	//load our new PHPExcel library
	$this->load->library('excel');
	//activate worksheet number 1
	$this->excel->setActiveSheetIndex(0);
	//name the worksheet
	$this->excel->getActiveSheet()->setTitle('test worksheet');
	//set cell A1 content with some text
	$this->excel->getActiveSheet()->setCellValue('A1', 'This is just some text value');
	//change the font size
	$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setSize(20);
	//make the font become bold
	$this->excel->getActiveSheet()->getStyle('A1')->getFont()->setBold(true);
	//merge cell A1 until D1
	$this->excel->getActiveSheet()->mergeCells('A1:D1');
	//set aligment to center for that merged cell (A1 to D1)
	$this->excel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);

	$filename='just_some_random_name.xls'; //save our workbook as this file name
	header('Content-Type: application/vnd.ms-excel'); //mime type
	header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
	header('Cache-Control: max-age=0'); //no cache
	
	//save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
	//if you want to save it as .XLSX Excel 2007 format
	$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');	//$objWriter->save("php://output")
    }

}
