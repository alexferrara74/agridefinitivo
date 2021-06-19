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

	<form class="ricerca" action="ricerca" method="POST">
		<input class="ricerca_testo" type="text" placeholder="Ricerca">
	</form>



<ul class="header__menu">
<li class="header__menu__item"><a href="prodotti.jsp">Prodotti</a></li>
<li class="header__menu__item"><a href="">Visite</a></li>
<li class="header__menu__item"><a href="Chisiamo.jsp">Chi Siamo</a></li>
<li class="header__menu__item"><a href="#foother">Contatti</a></li>
<%if(username==null) {%>
<li class="header__menu__item"><a href="Login.jsp">Accedi</a></li>
</ul>

<div class="accedi__mobile">
<p class="accedi__mobile__item"><a href="Login.jsp">Accedi</a></p>
</div>

<%} else{ %>
<div class="accedi__mobile">
<p class="accedi__mobile__item"><a href=""><%=username %></a></p>
</div>

<div class="header__menu__item">
<a id="item_login" href="javascript:void(0)" onmouseover="menulogin()"><%=username %></a>
</div>

<ul id="header__menu__sotto" onmouseleave="menuoff()">
<li class="header__menu__item__sotto"><a href="">Ordini</a></li>
<li class="header__menu__item__sotto"><a href="">Modifica</a></li>
<li class="header__menu__item__sotto"><a href="/logout">Logout</a></li>
</ul>
<%} %>
</header>




</body>
</html>