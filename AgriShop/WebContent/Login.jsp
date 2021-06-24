<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="model.* " import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="style/stylelogreg.css" rel="stylesheet" type="text/css">

<%
String erroreaccount=(String)request.getAttribute("erroreaccount");
String errorelogin=(String)request.getAttribute("passerrore");

%>

</head>
<body>

 <%@ include file="Header.jsp"%><br>

	<div class="login">
		<form action="login" method="POST">
			<table style="with: 50%">

				<tr>
					
					<td><input type="text" name="Email" placeholder="Email" required/></td>
				</tr>
				<tr>
					
					<td><input type="password" name="password" placeholder="Password" required/></td>
				</tr>
			</table>
			<input class="bottone" type="submit" value="Accedi" />
		</form>
	
			<a href="Registrazione.jsp" id="testocarrello">
			<input class="bottone" type="submit" value="Registrati"></a>
			
	</div>
	
<%if(erroreaccount!=null&&erroreaccount.equals("errorelogin")){ %>	
	<div id="errorelogin">
	<p>errore account
	
	</div>
<%}%>


<%if(errorelogin!=null&&errorelogin.equals("errorelogin")){ %>	
	<div id="errorelogin">
	<p>errore account
	
	</div>
<%}%>


</body>
</html>