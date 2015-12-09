<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ReportPlay extends CI_Controller {

    
    public function index()
    {
	    $this->load->model('Juego_model');
	    $rs = $this->Juego_model->get_entries();
	    foreach ($rs as $key => $value) {
			$rs[$key]['total_incorrectas'] = ( (int)$value['puntos_total'] - (int)$value['puntos']);
			$rs[$key]['more'] = $this->Juego_model->get_entries_detalle($value['id_juego']);
	    }
		
		$this->load->library('Excel'); //$this->excel->setActiveSheetIndex(0);
		$objPHPExcel = $this->excel;

		// set hoja 2
		$objPHPExcel = $this->_reportDetalle($objPHPExcel, $rs);

		$sheet = $objPHPExcel->getSheet(1); // Sheet 1

		$objPHPExcel->getProperties()->setCreator("PLATICOM")
			->setLastModifiedBy("PLATICOM")
			->setTitle("REGISTROS PLATICOM-RESPONDE")
			->setSubject("REGISTROS PLATICOM-RESPONDE")
			->setDescription("REGISTROS PLATICOM-RESPONDE")
			->setKeywords("REGISTROS PLATICOM-RESPONDE")
			->setCategory("plataticom-records");

		$tituloReporte = "REGISTROS PLATICOM-PLAY";
		$titulosColumnas = array(
			'INDICE', 'CODIGO USUARIO', 'RPTA CORRECTAS',
			'RPTA INCORRECTAS', 'TOTAL PREGUNTAS', 'FECHA', '.', '.'
		);
		// set headers *excel*
		$sheet->mergeCells('A1:E2');
		$sheet
			->setCellValue('A1',$tituloReporte)
			->setCellValue('A4',  $titulosColumnas[0])
			->setCellValue('B4',  $titulosColumnas[1])
			->setCellValue('C4',  $titulosColumnas[2])
			->setCellValue('D4',  $titulosColumnas[3])
			->setCellValue('E4',  $titulosColumnas[4])
			->setCellValue('F4',  $titulosColumnas[5])
			->setCellValue('G4',  $titulosColumnas[6])
			->setCellValue('H4',  $titulosColumnas[7]);

		// print data
		$i = 5;
		$contador = 1;
		foreach ($rs as $item) {
			$sheet
				->setCellValue('A' . $i,  $contador)
				->setCellValue('B' . $i,  $item['codigo_usuario'])
				->setCellValue('C' . $i, $item['puntos'])
				->setCellValue('D' . $i, $item['total_incorrectas'])
				->setCellValue('E' . $i, $item['puntos_total'])
				->setCellValue('F' . $i, $item['fecha_fin']);

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
		$sheet->getStyle('A1:E2')->applyFromArray($estiloTituloReporte);
		$sheet->getStyle('A4:H4')->applyFromArray($estiloTituloColumnas);		
		$sheet->setSharedStyle($estiloInformacion, "A5:H".($i-1));

		$sheet->getColumnDimension('A')->setWidth(5);
		$sheet->getColumnDimension('B')->setWidth(15);
		$sheet->getColumnDimension('C')->setWidth(20);
		$sheet->getColumnDimension('D')->setWidth(20);
		$sheet->getColumnDimension('E')->setWidth(20);
		$sheet->getColumnDimension('F')->setWidth(20);
		$sheet->getColumnDimension('G')->setWidth(20);
		$sheet->getColumnDimension('H')->setWidth(20);
		

	 	
		// PRINT EXCEL
		
		$fecha = date('d-m-Y');

		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="'. __FUNCTION__ .'-'.$fecha.'.xls"');
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
    * Setter Sheet Two
    * Detail 
    */
    private function _reportDetalle($objPHPExcel, $data)
    {
    	$sheetId = 0;

       	$objPHPExcel->createSheet(NULL, $sheetId);
        $objPHPExcel->setActiveSheetIndex($sheetId);
        //$objPHPExcel->getActiveSheet()->setTitle("detalle");

        $tituloReporte = "REGISTROS PLATICOM-PLAY";
		$titulosColumnas = array(
			'INDICE', 'CODIGO USUARIO', '.',
			'.', '.', '.', '.', '.'
		);
		// set headers *excel*
		$sheet = $objPHPExcel->getSheet($sheetId); // Sheet 1
		$sheet->mergeCells('A1:E2');
		$sheet
			->setCellValue('A1',$tituloReporte)
			->setCellValue('A4',  $titulosColumnas[0])
			->setCellValue('B4',  $titulosColumnas[1])
			->setCellValue('C4',  $titulosColumnas[2])
			->setCellValue('D4',  $titulosColumnas[3])
			->setCellValue('E4',  $titulosColumnas[4])
			->setCellValue('F4',  $titulosColumnas[5])
			->setCellValue('G4',  $titulosColumnas[6])
			->setCellValue('H4',  $titulosColumnas[7]);

		// print data
		$i = 5;
		$contador = 1;
		$rs = $data;
		foreach ($rs as $key => $value) {
			$sheet
				->setCellValue('A' . $i, $contador)
				->setCellValue('B' . $i, $value['codigo_usuario'])
				->setCellValue('C' . $i, $value['puntos'])
				->setCellValue('D' . $i, $value['total_incorrectas'])
				->setCellValue('E' . $i, $value['puntos_total'])
				->setCellValue('F' . $i, $value['fecha_fin']);

			// detalle
			$variable = $value['more'];
			if (is_array($variable) && count($variable) > 0) {
				$newCount = 1;
				foreach ($variable as $key2 => $value2) {
					$i++;
					$sheet
						->setCellValue('A' . $i, $contador . '.' . $newCount)
						->setCellValue('B' . $i, $value2['id_juego'])
						->setCellValue('C' . $i, $value2['description_escenario'])
						->setCellValue('D' . $i, $value2['description_evidencia'])
						->setCellValue('E' . $i, $value2['description_respuesta'])
						->setCellValue('F' . $i, $value2['description']);
					$newCount++;
				}
			}

			$i++;
			$contador++;
		}
		
		return $objPHPExcel;
    }

    
}

