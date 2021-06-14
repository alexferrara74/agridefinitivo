<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import = " java.util.* "  import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Ingrosso Agricolo">
<meta name="keywords" content="DataSource, Product, Cart, Session">
<meta name="author" content="AgriShop">
<link href="style/styleheader.css" rel="stylesheet" type="text/css">

<%
String username= (String)request.getSession().getAttribute("nome");
String error=(String)request.getSession().getAttribute("passerrata");
Collection<?> ricerca=(Collection<?>)request.getAttribute("ricerca");
%>

</head>
<body>
	<div class="banner">
		<p id="publicità">Spedizioni Gratuite a partire da 100,00 euro</p>
	</div>



	<div class="page">


		<div class="logo">
		
			<form id="ricerca" action="ricerca" method="POST">
				<input id="text" type="text" placeholder="Ricerca">
			</form>
			
			<%
			if(ricerca==null){}
			
			if(ricerca!=null&&ricerca.size()>0){
				Iterator<?> it=ricerca.iterator();
				while(it.hasNext()){
					prodotto beans=(prodotto)it.next();
			%>	
			<div id="risultatoricerca">
			<%=beans.getDescrizione() %>
			
			
			</div>
			
	<%}} %>
			
			

			<p id="img">
				<img id="img" src="immagini/aaa3.png" alt="alternatetext">
			<p id="carrello">
				<a href="carrello.jsp" id="testocarrello"><img id="fotocarrello"
					src="immagini/carrello.png " width="45px" height="45px"
					alt="alternatetext">Carrello</a>
		</div>
	</div>

	<div class="menu">
		<ul>
			<li><a href="homepage.jsp">Home</a>
			<li><a href="url">Chi Siamo</a>
			<li><a href="prodotti.jsp">Prodotti</a>
			<li><a href="admin/profilo.jsp">Visite</a>
			<li><a href="">contatti</a>
			
			<%if(error!=null){
			if(error.equals("passerrata")){ 
				response.sendRedirect("./Login.jsp"); %>
					
				<%} }%>
			
			<%if(username==null) {%>
			
			<li id="accesso"><a href="Login.jsp">Accedi/Registrati</a>
			
			<%} else{ %>
				
			<li id="accesso">
			<div class="utente-connesso">
  					<p id="username">Benvenuto <%=username %></p>
 					 	<div class="menu-utente">
 					 <p><a href="./logout">Ordini</a></p>
  					<p><a href="utente/profilo.jsp">Dati Personali</a></p>
  					<p><a href="./logout">Logout</a></p>
  						</div>
				</div>
	

			<%} %>
		</ul>
	
	
		</div>
	

	<div id="sessione">
	
	
	</div>
	
	
</body>
</html>