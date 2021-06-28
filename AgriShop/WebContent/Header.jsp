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


<%
String username= (String)request.getSession().getAttribute("nome");
Collection<?> ricercacateg=(Collection<?>)request.getAttribute("ricercacategoria");
prodotto ricercanome=(prodotto)request.getAttribute("ricercanome");
if(ricercacateg==null){System.out.print("erroreeee");}
if(ricercanome==null){}
%>

</head>
<body>




<header class="header clearfix" >

<a href="" class="header__logo"><img src="immagini/LogoOk.png" alt="logo"></a>
	
	<div class="ricerca">
	<form action="ricerca" method="POST" name="form">
		<div class="ricerca_testo">
		<input id="input_ricerca" name="input_ricerca" type="text" placeholder="Ricerca" >
		</div>
		<div class="ricerca_img">
		<button type="submit"><img id="img_ricerca"src="immagini/search.png" alt="ricerca" ></button>
		</div>
</form>
	
	<%if(ricercanome!=null){ %>

	<div id="ris__ricerca">
  
<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=ricercanome.getNome()%>"><%=ricercanome.getNome()%>        <%=ricercanome.getDescrizione()%></a>

	</div>

<%} %>


<%
if(ricercacateg!=null&&ricercacateg.size()>0){%>

<div id="ris__ricerca">
	
	<%	Iterator<?> it=ricercacateg.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();

	%>
	
	
 
<a href="prodotti/visualizzaprodotto.jsp?nomeprodotto=<%=beans.getNome()%>"><%=beans.getNome()%>        <%=beans.getDescrizione()%></a>

	


<%}} %>
	</div>
	</div>
	
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
<p class="accedi__mobile__item"><a href="Login.jsp"><img src="immagini/enter.png"></a></p>
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
<script src="JS/header.js"></script>
</html>