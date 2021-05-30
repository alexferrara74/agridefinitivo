<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.* " import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="style/stylelogreg.css" rel="stylesheet" type="text/css">

<%String errorelogin=(String)request.getAttribute("passerrata"); %>

</head>
<body>

 <%@ include file="Header.jsp"%><br>


	<div class="login">
		<form action="login" method="POST">
			<table style="with: 50%">

				<tr>
					<td>Email</td>
					<td><input type="text" name="Email" required/></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required/></td>
				</tr>
			</table>
			<input class="bottone" type="submit" value="Accedi" />
		</form>

	
		<div >
			<h2>Oppure :</h2>
			<a href="Registrazione.jsp" id="testocarrello">
			<input class="bottone" type="submit" value="Registrati"></a>
			</div>
			
			<%if(errorelogin!=null){
			if(errorelogin.equals("passerrata")){ %>
			
			<div id="errorelogin">
			<p>errore login
			</div>
			<% }}%>
			
	</div>
	








</body>
</html>