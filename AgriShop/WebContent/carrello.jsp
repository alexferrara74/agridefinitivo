<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style/stylecarrello.css">


<%
String erroreqnt=(String)request.getSession().getAttribute("quantitaerr");
String nomeprodotto=(String)request.getSession().getAttribute("nomeprod");
Carrello <prodotto> carrello=(Carrello<prodotto>)request.getSession().getAttribute("carrello");
int count=0;
%>


</head>

<body>

<%@ include file="Header.jsp"%><br>

<div id="mostra__carrello">
<%if(carrello!=null){
	
List<prodotto> prodcarrello=carrello.getOggetto(); %>

<%for(int i=0;i<prodcarrello.size();i++){ %>

<% prodotto p=prodcarrello.get(i);     %>



<div class="prodotti__carrello">
<span><%=p.getNome() %></span>

<span><%=p.getDispcarrello() %></span>
<span><%=p.getPrezzo() %></span>
<span class="errore__quantita"><%if(erroreqnt!=null&&erroreqnt.equals("erroredisponibilita")) {%> <p>errore<%} %></span>
</div>

<%}}else{ %>

<div class="carrello__vuoto">

<img src="immagini/carrellovuoto.png">
<a id="cliccaqui" href="prodotti.jsp"><button>Clicca Qui!</button></a>

</div>

<%} %>




</div>

</body>
</html>