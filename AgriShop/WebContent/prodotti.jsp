<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*" session="true"%>

<% 
Collection<?> prodotti=(Collection<?>)request.getAttribute("prodotti");
String controlloutente=(String)request.getSession().getAttribute("nome");
if(controlloutente==null){}
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

<p><h3><strong>Categorie:</strong></h3>
<form action="prodotti" id="prodaction" >
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta" onclick="esegui()">
<label for="ortaggi"> ORTAGGI</label><br>
</div>
<br>
<div>
<input type="radio" id="frutta" value="frutta" name="scelta" onclick="esegui()">
<label for="ortaggi"> FRUTTA</label><br>
</div>
<br>
<div>
<input type="radio" id="verdura" value="verdura" name="scelta" onclick="esegui()">
<label for="ortaggi"> VERDURA</label><br>
</div>
<br>
<div>
<input type="radio" id="semi" value="semi" name="scelta" onclick="esegui()">
<label for="ortaggi"> SEMI</label><br>
</div>
<br>
<div>
<input type="radio" id="fruttasecca" value="fruttasecca" name="scelta" onclick="esegui()">
<label for="ortaggi">FRUTTA SECCA</label><br>
</div>
 <br>
 <div>
<input type="radio" id="vino" value="vino" name="scelta" onclick="esegui()">
<label for="ortaggi">VINO</label><br>
</div>
<br>
<div>
<input type="radio" id="olio" value="olio" name="scelta" onclick="esegui()">
<label for="ortaggi">OLIO</label><br>
</div>
<br>
</form>
 


</div>



<div id="risultato">


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();

	%>

	<div id="singolo">
		 
		<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=beans.getNome()%>"><img id="immagineprod" width="60px" src="immagini/<%=beans.getIdfoto()%>.png"></a>
		<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=beans.getNome()%>" >	<p id="descrizione" ><%=beans.getDescrizione() %><br></p></a>
	 	<%if (controlloutente!=null){ %>  <p id="prezzo"><%=(float)beans.getPrezzo()%>0 <img width="20px" src="immagini/euro.png"> <br><%} %>

	</div>

<% }
		
	}else{
%>

 <a href="errore.jsp">Errore</a>

<% } %>

</div>
<div id="foother">
<%@ include file="foother.jsp"%>
</div>
</body>


</html>