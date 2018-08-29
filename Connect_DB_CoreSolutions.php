<html>
	<head>
		<title>Conectando la base de datos de Core Solutions</title>
	</head>
	<body>
		<?php
			//Conexion a la base de datos
			$conexion=mysql_connect('localhost','root','ledzeppelin');
			mysql_select_db("core_solutions",$conexion) or die ("No se pudo amigo, vuelve a intentar");
		?>
		<center><table border="1">
			<tr>	
				<td colspan="5"><br><h2><center>Espectacular</center></h2></td>
				
			</tr>
			<tr>
				<td><b>Identificador</b></td>
				<td><b>Ubicacion</b></td>
				<td><b>Tipo</b></td>
				<td><b>Tamanio</b></td>
				<td><b>Costo Minimo</b></td>
			</tr>
		<?php
			//esta linea es de consulta de la base de datos de la tabla estudiante.
			$result=mysql_query("select*from espectaculares");
			while($row=mysql_fetch_array($result)){
		?><!--se cierra php porque se usara codigo html, trucaso xD -->
			<tr>
				<td><?php echo $row["id"]; ?></td>
				<td><?php echo $row["ubicacion"]; ?></td>
				<td><?php echo $row["tipo"]; ?></td>
				<td><?php echo $row["tamanio"]; ?></td>
				<td><?php echo $row["costo_minimo"]; ?></td>
			</tr>
		<?php
		}
		?>
		</table></center>
	</body>
<html>