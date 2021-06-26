<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = " java.util.* "  import="model.*"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="ISO-8859-1">
<meta name="description" content="Ingrosso Agricolo">
<meta name="keywords" content="DataSource, Product, Cart, Session">
<meta name="author" content="AgriShop">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://pagecdn.io/lib/normalize/8.0.1/normalize.css">
<link rel="stylesheet" href="style/style.css">
<script src="JS/header.js"></script>

<%
String username= (String)request.getSession().getAttribute("nome");

%>

</head>
<body>

<header class="header clearfix">

<a href="" class="header__logo"><img src="immagini/aaa3.png" alt="logo"></a>
	<form action="ricerca" method="POST">
	<div class="ricerca">
	
		<div class="ricerca_testo">
		<input id="input_ricerca"  type="text" placeholder="Ricerca">
		</div>
		<div class="ricerca_img">
		<a href="ricerca"><img id="img_ricerca"src="immagini/search.png" alt="ricerca"></a>
		</div>
	
	</div>
</form>

<div id="carrello">
<a href="carrello.jsp"><img src="immagini/carrello.png"></a>

</div>

<ul class="header__menu">
<li class="header__menu__item"><a href="homepage.jsp">Home</a></li>
<li class="header__menu__item"><a href="prodotti.jsp">Prodotti</a></li>
<li class="header__menu__item"><a href="admin/profilo.jsp">Visite</a></li>
<%if(username==null) {%>
<li class="header__menu__item"><a href="Login.jsp">Accedi</a></li>
</ul>

<div class="accedi__mobile">
<p class="accedi__mobile__item"><a href="Login.jsp">Accedi</a></p>
</div>

<%} else{ %>
<div class="accedi__mobile">
<p class="accedi__mobile__item" ><a href=""><%=username %></a></p>
</div>

<div class="header__menu__item" id="username">
<a ><%=username %></a>

<div class="header__menu__sotto">
<a href="">Ordini</a>
<a href="utente/profilo.jsp">Modifica</a>
<a href="carrello.jsp">Carrello</a>
<a href="logout">Logout</a>

</div>


</div>


<%} %>
</header>




</body>
</html>