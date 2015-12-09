<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends CI_Controller {

    public function index()
    {

    }
    
	public function test()
	{
		$this->load->library('Excel');
		$this->excel->setActiveSheetIndex(0);
		
		$objPHPExcel = $this->excel;;
		
		$objPHPExcel->getProperties()->setCreator("Altimea")
			->setLastModifiedBy("Altimea")
			->setTitle("REGISTROS L'BEL-RESPONDE")
			->setSubject("REGISTROS L'BEL-RESPONDE")
			->setDescription("REGISTROS L'BEL-RESPONDE")
			->setKeywords("REGISTROS L'BEL-RESPONDE")
			->setCategory("lbel-responde");

		$tituloReporte = "REGISTROS L'BEL-RESPONDE";
		$titulosColumnas = array('Preguntas', 'Nombre', 'Correo', 'País', 'Estado', 'Fecha registro');

		$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E1');
		$objPHPExcel->setActiveSheetIndex(0)
							->setCellValue('A1',$tituloReporte);
		
		
		$objPHPExcel->setActiveSheetIndex(0);
		$objPHPExcel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(25);

		date_default_timezone_set("America/Bogota");
		$fecha = date('d-m-Y');

		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="lbelresponde-'.$fecha.'.xls"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

				// If you're serving to IE over SSL, then the following may be needed
		header('Content-Type: text/html; charset=UTF-8');		
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');

		exit;
		
	}
    
    /**
     * Report encuesta
     */
    public function reporte_encuesta()
    {
	    $this->load->model('Encuesta_model');
		
		$this->load->library('Excel');
		$this->excel->setActiveSheetIndex(0);
		
		$objPHPExcel = $this->excel;		
		$objPHPExcel->getProperties()->setCreator("PLATICOM")
			->setLastModifiedBy("PLATICOM")
			->setTitle("REGISTROS PLATICOM-RESPONDE")
			->setSubject("REGISTROS PLATICOM-RESPONDE")
			->setDescription("REGISTROS PLATICOM-RESPONDE")
			->setKeywords("REGISTROS PLATICOM-RESPONDE")
			->setCategory("plataticom-records");

		$tituloReporte = "REGISTROS PLATICOM-ENCUESTA";
		$titulosColumnas = array('N', 'USUARIO', 'PREGUNTA-1', 'PREGUNTA-2', 'PREGUNTA-3', 'PREGUNTA-4', 'PREGUNTA-5', 'FECHA');

		$objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:E2');
		$objPHPExcel->setActiveSheetIndex(0)
			->setCellValue('A1',$tituloReporte)
			->setCellValue('A4',  $titulosColumnas[0])
			->setCellValue('B4',  $titulosColumnas[1])
			->setCellValue('C4',  $titulosColumnas[2])
			->setCellValue('D4',  $titulosColumnas[3])
			->setCellValue('E4',  $titulosColumnas[4])
			->setCellValue('F4',  $titulosColumnas[5])
			->setCellValue('G4',  $titulosColumnas[6])
			->setCellValue('H4',  $titulosColumnas[7]);
		
		$rs = $this->Encuesta_model->get_entries();	
		
		$i = 5;
		$contador = 1;
		foreach ($rs as $item) {
			$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('A' . $i,  $contador)
				->setCellValue('B' . $i,  $item['codigo_usuario']);
			// 01
			if (!empty($item['p1'])) {
				$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('C' . $i, $this->getOption(0, $item['p1']));
			}
			// 02
			if (!empty($item['p2'])) {
				$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('D' . $i, $this->getOption(1, $item['p2']));
			}
			// 03
			if (!empty($item['p3'])) {
				$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('E' . $i, $this->getOption(2, $item['p3']));
			}
			// 04
			if (!empty($item['p4'])) {
				$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('F' . $i, $this->getOption(3, $item['p4']));
			}
			// 05
			if (!empty($item['p5'])) {
				$objPHPExcel->setActiveSheetIndex(0)
					->setCellValue('G' . $i, $this->getOption(4, $item['p5']));
			}
			
			$objPHPExcel->setActiveSheetIndex(0)
				->setCellValue('H' . $i, $item['fecha_fin']);
			
			$i++;
			$contador++;
		}
		
		
		// STYLE EXCEL
		$estiloTituloReporte = array(
			'font' => array(
				'name'      => 'Verdana',
				'bold'      => true,
				'italic'    => false,
				'strike'    => false,
				'size' =>16,
					'color'     => array(
						'rgb' => 'FFFFFF'
					)
			),
			'fill' => array(
				'type'	=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'	=> array('argb' => 'FF244062')
			),
			'borders' => array(
				'allborders' => array(
					'style' => PHPExcel_Style_Border::BORDER_NONE                    
				)
			), 
			'alignment' =>  array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
					'rotation'   => 0,
					'wrap'          => TRUE
			)
		);
		$estiloTituloColumnas = array(
			'font' => array(
				'name'      => 'Arial',
				'bold'      => true,
				'size' => '11',                          
				'color'     => array(
					'rgb' => 'FFFFFF'
				)
			),
			'fill' => array(
				'type'	=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'	=> array('argb' => 'FFA5A5A5')
			),
			'borders' => array(
				'top'     => array(
					'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
					'color' => array(
						'rgb' => '143860'
					)
				),

				'right'     => array(
					'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
					'color' => array(
						 'rgb' => '143860'
					)),
				'bottom'     => array(
					'style' => PHPExcel_Style_Border::BORDER_MEDIUM ,
					'color' => array(
						'rgb' => '143860'
					)
				)
			),
			'alignment' =>  array(
					'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
					'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
					'wrap'          => TRUE
			)
		);
		$estiloInformacion = new PHPExcel_Style();
		$estiloInformacion->applyFromArray(
			array(
				'font' => array(
				'name'      => 'Arial',               
				'color'     => array(
					'rgb' => '000000'
				)
			),
			'fill' 	=> array(
				'type'		=> PHPExcel_Style_Fill::FILL_SOLID,
				'color'		=> array('argb' => 'FFDCE6F1')
			),
			'borders' => array(
				'right'     => array(
					'style' => PHPExcel_Style_Border::BORDER_THIN ,
					'color' => array(
						'rgb' => '3a2a47'
					)),
				'bottom'     => array(
					'style' => PHPExcel_Style_Border::BORDER_THIN ,
					'color' => array(
						'rgb' => '3a2a47'
					))             
			)
		));
		$objPHPExcel->getActiveSheet()->getStyle('A1:E2')->applyFromArray($estiloTituloReporte);
		$objPHPExcel->getActiveSheet()->getStyle('A4:H4')->applyFromArray($estiloTituloColumnas);		
		$objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion, "A5:H".($i-1));

		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('A')->setWidth(5);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('B')->setWidth(15);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('C')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('D')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('E')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('F')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('G')->setWidth(20);
		$objPHPExcel->setActiveSheetIndex(0)->getColumnDimension('H')->setWidth(20);
		
				
		// PRINT EXCEL
		date_default_timezone_set("America/Lima");
		$fecha = date('d-m-Y');

		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="'. __FUNCTION__ .'-'.$fecha.'.xls"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');

				// If you're serving to IE over SSL, then the following may be needed
		header('Content-Type: text/html; charset=UTF-8');		
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0

		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');

		exit;
    }
	
	/**
	 * 
	 * @param Integer indice
	 * @param Integer indice
	 * @return string
	 */
	private function getOption($iQuestion, $iAnswer = 1)
	{	
		$options = array();
		$options[0]['pregunta'] = '¿Qué tan entendible fue la capacitación recibida?';
		$options[0]['respuestas'][1] = 'Totalmente entendible';
		$options[0]['respuestas'][2] = 'Muy entendible';
		$options[0]['respuestas'][3] = 'Medio entendible';
		$options[0]['respuestas'][4] = 'Ligeramente confuso';
		$options[0]['respuestas'][5] = 'Para nada entendible';
		
		$options[1]['pregunta'] = 'El tiempo para contestar las preguntas de la evaluación fue:';
		$options[1]['respuestas'][1] = 'Demasiado extenso';
		$options[1]['respuestas'][2] = 'Extenso';
		$options[1]['respuestas'][3] = 'Suficiente';
		$options[1]['respuestas'][4] = 'Reducido';
		$options[1]['respuestas'][5] = 'Muy reducido';
		
		$options[2]['pregunta'] = 'El tiempo para contestar las preguntas de la evaluación fue: ';
		$options[2]['respuestas'][1] = 'Totalmente atractivo ';
		$options[2]['respuestas'][2] = 'Muy atractivo';
		$options[2]['respuestas'][3] = 'Medio Atractivo';
		$options[2]['respuestas'][4] = 'Ligeramente Aburrido';
		$options[2]['respuestas'][5] = 'Totalmente Aburrido';
		
		$options[3]['pregunta'] = 'El tiempo para contestar las preguntas de la evaluación fue:';
		$options[3]['respuestas'][1] = 'Totalmente atractivo';
		$options[3]['respuestas'][2] = 'Muy atractivo';
		$options[3]['respuestas'][3] = 'Medio Atractivo';
		$options[3]['respuestas'][4] = 'Ligeramente Aburrido';
		$options[3]['respuestas'][5] = 'Totalmente Aburrido';
		
		$options[4]['pregunta'] = 'La capacitación resultó para usted:';
		$options[4]['respuestas'][1] = 'Muy provechosa';
		$options[4]['respuestas'][2] = 'Provechosa';
		$options[4]['respuestas'][3] = 'Poco provechosa';
		$options[4]['respuestas'][4] = 'Nada provechosa';
		
		return ($options[$iQuestion]['respuestas'][$iAnswer]);
	}
	
	/**
	 * Template
	 */
	public function theme_reporte_excel()
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

	$filename= __FUNCTION__ . '.xls'; //save our workbook as this file name
	header('Content-Type: application/vnd.ms-excel'); //mime type
	header('Content-Disposition: attachment;filename="'.$filename.'"'); //tell browser what's the file name
	header('Cache-Control: max-age=0'); //no cache
	
	//save it to Excel5 format (excel 2003 .XLS file), change this to 'Excel2007' (and adjust the filename extension, also the header mime type)
	//if you want to save it as .XLSX Excel 2007 format
	$objWriter = PHPExcel_IOFactory::createWriter($this->excel, 'Excel5');	//$objWriter->save("php://output")
	}

}

