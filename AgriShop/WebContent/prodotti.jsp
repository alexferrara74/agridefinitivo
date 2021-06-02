<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*" session="true"%>

<% 
Collection<?> prodotti=(Collection<?>)request.getAttribute("prodotti");

String errore= (String)request.getAttribute("error");
if(prodotti==null&&errore==null){
	response.sendRedirect(response.encodeRedirectURL("./prodotti"));
}

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/prodotti.css" rel="stylesheet" type="text/css">

<script src="JS/jsprodotti.js"></script>

</head>


<body>
	<%@ include file="Header.jsp"%><br>


<div id="parametriconfigurazione">

<p>Categorie:
<form action="prodotti" id="prodaction" >
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta" onclick="esegui()">
<label for="ortaggi"> Ortaggi</label><br>
</div>

<div>
<input type="radio" id="frutta" value="frutta" name="scelta" onclick="esegui()">
<label for="ortaggi"> Frutta</label><br>
</div>

<div>
<input type="radio" id="verdura" value="verdura" name="scelta" onclick="esegui()">
<label for="ortaggi"> Verdura</label><br>
</div>

<div>
<input type="radio" id="semi" value="semi" name="scelta" onclick="esegui()">
<label for="ortaggi"> Semi</label><br>
</div>

<div>
<input type="radio" id="fruttasecca" value="fruttasecca" name="scelta" onclick="esegui()">
<label for="ortaggi">Frutta Secca</label><br>
</div>
 
 <div>
<input type="radio" id="vino" value="vino" name="scelta" onclick="esegui()">
<label for="ortaggi">Vino</label><br>
</div>

<div>
<input type="radio" id="olio" value="olio" name="scelta" onclick="esegui()">
<label for="ortaggi">Olio</label><br>
</div>

</form>
 


</div>



<div id="risultato">


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	System.out.print(beans.getIdfoto());
	%>

	<div id="singolo">
		  <form action="prodotti/visualizzaprodotto.jsp" id="sceltasingolo"></form>
		  <img id="immagineprod" width="60px" src="immagini/<%=beans.getIdfoto()%>.png" onclick="funzione()">
		  <p id="descrizione" onclick="funzione()"><%=beans.getDescrizione() %><br>
	 	  <p id="prezzo"><%=(float)beans.getPrezzo()%>0 <img width="20px" src="immagini/euro.png"> <br>
	</div>

<% }
		
	}else{
%>

 <a href="errore.jsp">Errore</a>

<% } %>

</div>

</body>


</html>