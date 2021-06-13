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
prodotto prod=(prodotto)request.getSession().getAttribute("prod");
%>

</head>
<body>

<div id="utente">
<fieldset>
<legend>Pagina di amministratore</legend>
<p>Account di <%=username%></p>

<form class="modprofilo"action="../AdminPage" method="post">

<table>



<tr>
<td><input type="text" name="prezzo" placeholder="<%=prod.getPrezzo()%>"  ></td>
</tr>

<tr>
<td><input type="text" name="nome" placeholder="<%=prod.getNome()%>"></td>
</tr>

<tr>

<td><input type="text" name="Ssn" placeholder="<%=prod.getSsn()%>"></td>
</tr>
<tr>

<td><input type="text" name="disponibilitÃ" placeholder="<%=prod.getQuantita()%>"></td>
</tr>

<tr>
<td><input type="text" name="descrizione" placeholder="<%=prod.getDescrizione()%>"></td>
</tr>

<tr>
<td><input type="text" name="categoria" placeholder="<%=prod.getCategoria()%>"></td>
</tr>

<tr>
<td><input type="text" name="idfoto" placeholder="<%=prod.getIdfoto()%>"></td>
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