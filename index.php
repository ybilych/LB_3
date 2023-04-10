<!DOCTYPE html>
<html>
<head>
	<title>ЛР3 Білич</title>
	<style>
		* {
			background: #a9c4f7;
		}
	</style>
</head>
<body>
	<h1>Лабораторна робота №3. <br> Білич Ю. Є. КІУКІ-19-8 <br> Варіант 7</h1>
	<form action="get1.php" method="get">
		<label for="client_id">Choose a client:</label>
		<select name="client_id" id="client_id">
			<?php
				include('connect.php');
				try {
					$stmt = $dbh->query("SELECT id_client, name FROM client");
					$res = $stmt->fetchAll();

					foreach($res as $row)
					{
						echo "<option value='$row[0]'>$row[1]</option>";
					}
				}
				catch(PDOException $ex) {
					echo $ex->GetMessage();
				}

				$dbh = null;
			?>
		</select>
		<input type="submit" value="Get!">
	</form>
	<form action="get2.php" method="get">
		<label for="start_time">Start time:</label>
		<input type="text" value="00:00:01" name="start_time" id="start_time">
		<label for="end_time">End time:</label>
		<input type="text" value="23:59:59" name="end_time" id="end_time">
		<input type="submit" value="Get!">
	</form>
	<form action="get3.php" method="get">
		<input type="submit" value="Get list of clients with -balance">
	</form>
</body>
</html>
