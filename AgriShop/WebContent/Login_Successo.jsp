<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Utente loggato correttamente</title>
</head>
<body>
	<table style="with: 50%">
		<tr>
			<td>
				<% String Email = request.getParameter("Email"); %> <a>Welcome <% out.println(Email); %>,sei
					loggato!!.
			</a>
			</td>
		</tr>
		<tr></tr>
		<tr>
			<td></td>
			<td></td>
			<td><a href="Login.jsp"><b>Logout</b></a></td>
		</tr>


	</table>

	<a href="modifica.jsp"><b>link</b></a>
</body>
</html>