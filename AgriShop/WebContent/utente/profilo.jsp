<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../style/stylogreg.css" rel="stylesheet" type="text/css">
<script src="../JS/controllo-profilo.js"></script>

<%
String username= (String)request.getSession().getAttribute("nome");
Negozio neg=(Negozio)request.getSession().getAttribute("neg");
%>

</head>
<body>


<div id="utente">
<fieldset>
<legend>Modifica Dati Personali</legend>
<p>Account di <%=username%></p>

<form action="../Modificaprofilo" method="post">

<table>
<tr>
<td><input type="text" name="user " placeholder="<%=username%>"></td>
</tr>

<tr>
<td><input type="text" name="email" placeholder="<%=neg.getEmail()%>" readonly="readonly" ></td>
</tr>
<tr>

<td><input type="text" name="cap" placeholder="<%=neg.getCap()%>"></td>
</tr>
<tr>

<td><input type="text" name="civico" placeholder="<%=neg.getCivico()%>"></td>
</tr>
<tr>

<td><input type="text" name="indirizzo" placeholder="<%=neg.getIndirizzo()%>"></td>
</tr>
<tr>
<td><input type="text" name="piva" placeholder="<%=neg.getPiva()%>"></td>
</tr>

<tr>
<td><input type="password" name="password" placeholder="password" required></td>
<td><input type="password" name="conferma" placeholder="conferma password" required></td>
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