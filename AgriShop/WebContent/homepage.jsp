<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*" import="model.prodotto"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://pagecdn.io/lib/normalize/8.0.1/normalize.css">
<link rel="stylesheet" href="style/style.css">
<script src="JS/homepage.js"></script>
</head>

<body>
<%@ include file="Header.jsp"%>

<div class="center">

<div class="slogan">
<h1>Primo messaggio slogan</h1>
<h2>secondo messaggio slogan</h2>

</div>

<div class="immagine">
<img id="imm"src="immagini/azienda(1).jpg" alt="immagine">
<div class="immagine__cerchio"><img src="immagini/vino.jpg"></div>
<div class="immagine__cerchio"><img src="immagini/olio.jpg"></div>
<div class="immagine__cerchio"><img src="immagini/vino.jpg"></div>
<div class="immagine__cerchio"><img src="immagini/vino.jpg"></div>
</div>

<div class="offerta"></div>

</div>


<div class="banner clearfix">



<a href="home.html" class="home"><img src="immagini/home.png" alt="home" class="home"></a>
<a href="" class="home"><img src="immagini/shop.png" alt="home" class="home"></a>
<a href="" class="home"><img src="immagini/shopping-cart.png" alt="home" class="home"></a>
<a href="" class="home"><img src="immagini/user.png" alt="home" class="menu__mobile"></a>

</div>



<div id="foother">
<%@ include file="foother.jsp"%>
</div>


</body>
</html>