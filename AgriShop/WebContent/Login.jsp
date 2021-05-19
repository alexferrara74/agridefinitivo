<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<link href="style/stylelogreg.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="Header.jsp"%><br>

	<div class="login">
		<form action="AgriShop_login" method="post">
			<table style="with: 50%">

				<tr>
					<td>Email</td>
					<td><input type="text" name="Email" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" /></td>
				</tr>
			</table>
			<input class="bottone" type="submit" value="Accedi" />
		</form>

		<div >
			<h2>Oppure :</h2>
			<a href="Registrazione.jsp" id="testocarrello">
			<input class="bottone" type="submit" value="Registrati"></a>

		</div>
	</div>




</body>
</html>