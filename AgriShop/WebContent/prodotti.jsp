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

<p><h3><strong>CATEGORIE:</strong></h3>
<form action="prodotti" id="prodaction" >

<div class="img">
<input type="radio" id="ortaggi" value="ortaggi" name="scelta" onclick="esegui()">
<label for="ortaggi">  <a href=""><img id="img"src="immagini/logo_ortaggi.png" alt="logof"></a></label><br>
<br>
<br>
<input type="radio" id="frutta" value="frutta" name="scelta" onclick="esegui()">
<label for="ortaggi"> <a href=""><img id="img"src="immagini/logo_frutta.png" alt="logof"></a></label><br>
<br>
<br>
 <input type="radio" id="verdura" value="verdura" name="scelta" onclick="esegui()">
<label for="ortaggi"> <a href=""><img id="img"src="immagini/logo_verdure.png" alt="logof"></a></label><br>
<br>
<br>
<input type="radio" id="semi" value="semi" name="scelta" onclick="esegui()">
<label for="ortaggi"> <a href=""><img id="img"src="immagini/logo_semi.png" alt="logof"></a></label><br>	
<br>
<br>
<input type="radio" id="fruttasecca" value="fruttasecca" name="scelta" onclick="esegui()">
<label for="ortaggi"><a href=""><img id="img"src="immagini/logo_secca.png" alt="logof"></a></label><br>
<br>
<br>
<input type="radio" id="vino" value="vino" name="scelta" onclick="esegui()">
<label for="ortaggi"><a href=""><img id="img"src="immagini/logo_vino.png" alt="logof"></a></label><br>
<br>
<br>
<input type="radio" id="olio" value="olio" name="scelta" onclick="esegui()">
<label for="ortaggi"><a href=""><img id="img"src="immagini/logo_olio.png" alt="logof"></a></label><br>
<br>
<br>
</div>
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
		 
		<div id="immagineprod">
		<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=beans.getNome()%>">
		<img src="immagini/<%=beans.getIdfoto()%>.png">
		</a>
		</div>
		
<div id="descrizione">		
<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=beans.getNome()%>">
<p><%=beans.getDescrizione() %><br></p>
</a>
</div>
	 	<div id="prezzo">
	 	<%if (controlloutente!=null){ %>  <p><%=(float)beans.getPrezzo()%></p> <p><img width="20px" src="immagini/euro.png"></p> <br><%} %>
	 	</div>
	 	<div id="scelta">
		<form action="" method="POST">
		<input type="number" id="quantita" name="quantita" step="1"><button type="submit">AGGIUNGI</button>
		</form>
		</div>
	</div>

<% }
		
	}else{
%>

 <a href="errore.jsp">Errore</a>

<% } %>

</div>

</body>


</html>