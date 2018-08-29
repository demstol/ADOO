<html>
	<head>
		<title>Baja de espectacular</title>
		<meta charset="utf-8"/>
	</head>
	<body>
		<?php
			include("Connect_DB_CoreSolutions.php");
		?>
		<center><form action="EliminarEspectacular.php" method="POST">
			<br>
			Ubicacion: <input type="text" name="ubicacion"></br>
			<br>
			Tipo: <input type="text" name="tipo"></br>
			<br>
			Tamanio: <input type="text" name="tamanio"></br>
			<br>
			Costo Minimo: <input type="number" name="costo_minimo"></br>
			<br>
			<input type="submit" name="eliminar" value="Eliminar espectacular">
		</form></center>
		<?php
			if($_POST)
			{	
				$ubicacion=$_POST['ubicacion'];
				$tipo=$_POST['tipo'];
				$tamanio=$_POST['tamanio'];
				$costo_minimo=$_POST['costo_minimo'];
				mysql_query("delete from espectaculares where ubicacion='$ubicacion' AND tipo='$tipo' AND tamanio='$tamanio' AND costo_minimo='$costo_minimo' ") or die (mysql_error());
				echo "<center><h1>Espectacular eliminado</h1></center>";
			} 
		?>
	</body>
</html>