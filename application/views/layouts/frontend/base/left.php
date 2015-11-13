<!-- Col 1 -->
<div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 col col_1 left-column sm568Max_width_100">
	<div class="ctn">
		<div class="main_left">

			<!-- Box -->
			<div class="box">
				<h3><i class="fa fa-check-square-o"></i>CIRUGIA</h3>
				<ul>
					<li><a href="#">Miopía - Astigmatismo</a></li>
					<li><a href="#">Hipermetropía - Presbicia</a></li>
					<li><a href="#">Catarata</a></li>
					<li><a href="#">Queratocono</a></li>
					<li><a href="#">Glaucoma</a></li>
					<li><a href="#">Estrabismo</a></li>
					<li><a href="#">Pterigium</a></li>
					<li><a href="#">Trasplante De Cornea</a></li>
					<li><a href="#">Cirugía Plastica Ocular</a></li>
				</ul>
			</div>
			<!--/ box -->

			<!-- Box -->
			<div class="box">
				<h3><i class="fa fa-globe"></i>TECNOLOGIA</h3>
				<ul>
					<li><a href="#">Excimer Laser</a></li>
					<li><a href="#">Faco - Infiniti</a></li>
					<li><a href="#">Crosslinking Corneal</a></li>
					<li><a href="#">Láser Argón</a></li>
				</ul>
			</div>
			<!--/ box -->

			<!-- Box -->
			<div class="box">
				<h3><i class="fa fa-leaf"></i>EXAMENES</h3>
				<ul>
					<li><a href="#">Pentacam</a></li>
					<li><a href="#">Topografía/Keratograph</a></li>
					<li><a href="#">Campimetría</a></li>
					<li><a href="#">OCT Seg. Anterior y Posterior</a></li>
					<li><a href="#">Microscopía Especular</a></li>
					<li><a href="#">Ultrasonido Ocular</a></li>
					<li><a href="#">Ecobiometría</a></li>
					<li><a href="#">Ortoqueratología</a></li>
					<li><a href="#">Contactología</a></li>
				</ul>
			</div>
			<!--/ box -->

			<!-- Box -->
			<div class="box">
				<h3><i class="fa fa-share-alt"></i>SIGUENOS</h3>
				<a href="#" target="_blank">
					<img src="assets/images/logos/facebook.jpg" alt="Siguenos en Facebook">
				</a>
				<a href="#" target="_blank">
					<img src="assets/images/logos/youtube.jpg" alt="Siguenos en Youtube">
				</a>
				<a href="#" target="_blank">
					<img src="assets/images/logos/twitter.jpg" alt="Siguenos en Twitter">
				</a>
			</div>
			<!--/ box -->

			<!-- Box -->
			<div class="box">
				<h3><i class="fa fa-check-square-o"></i>CIRUGÍAS</h3>
				<p>Cirugías realizadas este año en la clínica.</p>
				<div class="panel panel-default">
					<table class="table table-hover table-bordered table-condensed table-striped">
						<tbody>
							<?php for( $i=1; $i<=18; $i++ ): ?>
							<tr>
								<td><?php echo "Cirugía"; ?></td>
								<td><?php echo $i; ?></td>
							</tr>
						<?php endfor; ?>
						</tbody>
					</table>
				</div>
			</div>
			<!--/ box -->

		</div>
	</div>
</div>
<!--/ Col 1 -->