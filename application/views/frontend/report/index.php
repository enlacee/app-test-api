<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Welcome to CodeIgniter</title>
</head>
<body>

<div id="container">
	<h1>Applicaciòn Web!</h1>
	<p>Reportes:	</p>
	<ol>
	    <li><a href="<?php echo site_url('report/index') ?>">Reporte Juego web</a></li>
	    <li><a href="<?php echo site_url('report/index') ?>">Reporte Encuesta</a></li>
	</ol>
</div>

</body>
</html>