<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<link href="style/stylelogreg.css" rel="stylesheet" type="text/css">

<%@ include file="Header.jsp"%>

</head>
<body>


	<div class="registrazione">

		<form action="AgriShop" method="post">
			<table style="with: 50%">

				<tr>

					<td>Email</td>
					<td><input id="name" type="text" name="Email" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>Ragione Sociale</td>
					<td><input type="text" name="RagioneSociale" /></td>

				</tr>
				<tr>
					<td>P.Iva</td>
					<td><input type="text" name="P.Iva" /></td>
				</tr>
				<tr>
					<td>Indirizzo</td>
					<td><input type="text" name="Indirizzo" /></td>
				</tr>
				<tr>

				</tr>
			</table>
			<input class="iscriviti" type="submit" value="Iscriviti" />
		</form>


	</div>
</body>

</body>
</html>