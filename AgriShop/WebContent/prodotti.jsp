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

<p>
<form action="prodotti" id="prodaction" >

<div class="img">

<label for="ortaggi">  <a href="prodotti?scelta=ortaggi"><img id="img"src="immagini/logo_ortagg.png" alt="logof"></a></label><br>
<br>


<label for="ortaggi"> <a href="prodotti?scelta=frutta"><img id="img"src="immagini/logo_frutt.png" alt="logof"></a></label><br>
<br>
<br>

<label for="ortaggi"> <a href="prodotti?scelta=verdura"><img id="img"src="immagini/logo_verdura.png" alt="logof"></a></label><br>
<br>


<label for="ortaggi"> <a href="prodotti?scelta=semi"><img id="img"src="immagini/logo_semii.png" alt="logof"></a></label><br>	
<br>

<label for="ortaggi"><a href="prodotti?scelta=fruttasecca"><img id="img"src="immagini/logo_seccaf.png" alt="logof"></a></label><br>
<br>

<label for="ortaggi"><a href="prodotti?scelta=vino"><img id="img"src="immagini/logo_vinoo.png" alt="logof"></a></label><br>
<br>
<label for="ortaggi"><a href="prodotti?scelta=olio"><img id="img"src="immagini/logo_olioo.png" alt="logof"></a></label><br>
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