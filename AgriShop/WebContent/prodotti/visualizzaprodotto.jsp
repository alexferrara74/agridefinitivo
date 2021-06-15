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


if(prodotti==null){
	response.sendRedirect(response.encodeRedirectURL(".././visualizzaprodotto?nomeprodotto="+prodotto+""));
}
%>
</head>

<body>
<%@ include file="../Header.jsp"%><br>

<% if(prodotti!=null){
%>
<div id="contenitore">
<div id="foto">
<img src="immagini/<%=prodotti.getIdfoto()%>.png">
</div>

<div id="visualizzaprodotto">

<form action="carrello?action=aggiungi">


<div id="nome">
<label>Prodotto: </label>
<span><%=prodotti.getNome() %></span>
</div>

<div id="descrizione">
<label>Descrizione: </label>
<input type="text" id="quantita" value="<%=prodotti.getDescrizione() %>" name="<%=prodotti.getDescrizione() %>" readonly>
</div>

<%if(controlloutente!=null){ %>




<div id="quantita">
<label>Quantità: </label>
<input type="number" id="quantita" name="quantita" step="1">
</div>


<div id="prezzo">
<label>Prezzo: </label>
<span><%=prodotti.getPrezzo() %></span>
<span><img width="20px" src="immagini/euro.png"></span>
</div>
<%}%>

<div id="categoria">
<label>Categoria: </label>
<span><%=prodotti.getCategoria() %></span>
</div>
<%if (controlloutente==null){ %>
<div id="login">

<a href="Login.jsp"><input type="button" value="Login"></a>

</div>
<%}else{ %>

<div id="addcarrello">
<a href="<%=response.encodeURL("carrello?action=addcarrello&nome=" + prodotti.getNome())%>"><input type="submit" value="Aggiungi" id="action"></a>
</div>
</form>

<%} }%>
</div>
</div>
	<%@ include file="../foother.jsp"%>
</body>
</html>