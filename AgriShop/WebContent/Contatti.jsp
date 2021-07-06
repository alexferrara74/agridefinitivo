<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/contatti.css" rel="stylesheet" type="text/css">
<title>Contatti</title>
</head>
<body>

<%@ include file="Header.jsp"%>

<div class="menu">
	
		<section id="main"></section>
	  <header class="page-header">
	  
      <h1 style="text-align:center;"><strong><em><span style="color:#7cd320;">Cerchi aiuto per i tuoi ordini?</span></em></strong></h1>
<div class="contatto">
<div class="nome">
<label>Nome </label><br>
<span class="ciao"><input type="text" name="name" value="" size="40"  aria-required="true" aria-invalid="false"></span>
</div>
</div>
<div class="contatto">
<div class="email">
<label>Email </label><br>
<span class="ciao"><input type="email" name="email" value="" size="40"  aria-required="true" aria-invalid="false"></span>
</div>
</div>
<div class="contatto">
<div class="numero">
<label>Numero Ordine </label><br>
<span class="ciao"><input type="text" name="order" value="" size="40"  aria-invalid="false"></span>
</div>
<div class="telefono">
<label>Telefono </label><br>
<span class="ciao"><input type="text" name="phone" value="" size="40" aria-invalid="false"></span>
</div>
</div>
<div class="contatto">
<div class="messaggio">
<label>Messaggio </label><br>
<span class="ciao"><textarea name="message" cols="75" rows="20"></textarea></span>
<input type="submit" value="Invia" class="ciao" aria-invalid="false">
</div>
</div>

<div id="foother">
<%@ include file="foother.jsp"%>
</div>



</body>
</html>