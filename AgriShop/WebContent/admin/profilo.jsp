<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../style/stylelogreg.css" rel="stylesheet" type="text/css">

<script src="../JS/controllo-profilo.js"></script>

<%
String username= (String)request.getSession().getAttribute("nome");
%>

</head>
<body>

<div id="utente">
<fieldset>
<legend>Pagina di amministratore</legend>
<p>Account di <%=username%></p>

<form class="AdminPage"action="../AdminPage" method="post">
<h2>Inserimento prodotto</h2>
<table>


<tr>
<td><input type="text" name="prezzo" placeholder="Prezzo" required></td>
</tr>

<tr>
<td><input type="text" name="nome" placeholder="Nome" required></td>
</tr>

<tr>

<td><input type="text" name="Ssn" placeholder="Ssn" required></td>
</tr>
<tr>

<td><input type="text" name="disponibilita" placeholder="disponibilità" required></td>
</tr>

<tr>
<td><input type="text" name="descrizione" placeholder="Descrizione" required></td>
</tr>

<tr>
<td><select name="categoria"  required>
	<option value= "Ortaggi">Ortaggi</option>
	<option value="Frutta">Frutta</option>
	<option value="Verdura">Verdura </option>
	<option value="Semi">Semi</option>
	<option value= "Frutta Secca">Frutta Secca</option>
	<option value="Vino">Vino </option>
	<option value="Olio">Olio</option>
	
	</select>
	
	
	



</td>
</tr>

<tr>
<td><input type="text" name="idfoto" placeholder="nomefoto" required></td>
</tr>

<tr>
<td>
<input type="submit" value="invio">
</td>
</tr>
</table>
</form>


</fieldset>





</div>
</body>
</html>