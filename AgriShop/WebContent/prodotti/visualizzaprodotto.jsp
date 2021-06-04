<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/visualizzaprodotto.css" rel="stylesheet" type="text/css">

<%
String prodotto=(String)request.getParameter("nomeprodotto");
String controlloutente=(String)request.getSession().getAttribute("nome");
prodotto prodotti=(prodotto)request.getAttribute("prodotti");
System.out.print(prodotto);



if(prodotti==null){
	response.sendRedirect(response.encodeRedirectURL(".././visualizzaprodotto?nomeprodotto="+prodotto+""));
}


%>

</head>



<body>
<%@ include file="../Header.jsp"%><br>

<% if(prodotti!=null){
%>
<div id="foto">
<img src="immagini/<%=prodotti.getIdfoto()%>.png">
</div>

<div id="visualizzaprodotto">
<div id="quantita">

<input type="number" id="quantita" name="quantita" step="1">
</div>


<div id="nome">
<span><%=prodotti.getNome() %></span>
</div>

<div id="descrizione">
<span><%=prodotti.getDescrizione() %></span>
</div>
<%if(controlloutente!=null){ %>
<div id="prezzo">
<%=prodotti.getPrezzo() %>
</div>
<%} %>

<div id="categoria">
<span><%=prodotti.getCategoria() %></span>
</div>
<div id="addcarrello">

<input type="button" value="Aggiungi">

</div>


<%} %>
</div>


</body>
</html>