<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="model.prodotto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Ingrosso Agricolo">
<meta name="keywords" content="DataSource, Product, Cart, Session">
<meta name="author" content="AgriShop">


<link href="style/stylepage.css" rel="stylesheet" type="text/css">


</head>


<body>



	<%@ include file="../Header.jsp"%><br>



<div class="immagine">
	<img class="imm" src="immagini/azienda.jpg" alt="azienda" width="1000px" height="400px">


</div>




<div class="homepage">

<% 
Collection<?> prodotti=(Collection<?>)request.getAttribute("offerta");
	
%>


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	
	%>
		
		<p id="offerta">Prodotti in offerta:</p>
		
		<span id="prodottiinofferta">
		
		<%= beans.getNome() %>
				
		</span>

<% } }%>

	</div>





	<%@ include file="foother.jsp"%>

</body>
</html>

