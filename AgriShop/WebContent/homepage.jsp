<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="model.prodotto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Ingrosso Agricolo">
<meta name="keywords" content="DataSource, Product, Cart, Session">
<meta name="author" content="AgriShop">

<script src="JS/homepage.js"></script>
<link href="style/stylepage.css" rel="stylesheet" type="text/css">
<link href="style/prodotti.css" rel="stylesheet" type="text/css">

<%String errorelogin=(String)request.getAttribute("loginsbagliata");

System.out.print(errorelogin);

%>
</head>


<body>

<%if (errorelogin!=null){%>
	
	<script>
	
	setTimeout(function() {
		
		  window.location.href = "Login.jsp";
		}, 4000);
	
	
	 
	</script>
	
	<div id="errorelogin">
	<h1>Errore Mail/Password </h1>
	<h2>Sarai reindirizzato alla pagine di login</h2>
	</div>
	
	
	
<% }%>


	<%@ include file="../Header.jsp"%><br>



<div class="immagine">
	
	<img id="imm" src="immagini/azienda(1).jpg" alt="azienda" width="1000px" height="400px">
</div>




<div class="homepage">
<p style=display:block; id="offerta">Prodotti in offerta:</p>
<% 
String controlloutente=(String)request.getSession().getAttribute("nome");
if(controlloutente==null){}
Collection<?> prodotti=(Collection<?>)request.getAttribute("offerta");
if(prodotti==null){
	response.sendRedirect(response.encodeRedirectURL("./home"));	}
%>


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	
	%>
		
		
		
		<div id="singolo">
		  <form action="prodotti/visualizzaprodotto.jsp" id="sceltasingolo"></form>
		  <img id="immagineprod" width="60px" src="immagini/<%=beans.getIdfoto()%>.png" onclick="funzione()">
		  <p id="descrizione" onclick="funzione()"><%=beans.getDescrizione() %><br>
	 <%if(controlloutente!=null){ %>	 <p id="prezzo"><%=(float)beans.getPrezzo()%>0 <img width="20px" src="immagini/euro.png"> <br><%} %>
	</div>


<% } }%>

	</div>





	<%@ include file="foother.jsp"%>

</body>
</html>

