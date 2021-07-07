<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/stylecarrello.css" rel="stylesheet" type="text/css">
<%

Carrello <prodotto> carrello=(Carrello<prodotto>)request.getSession().getAttribute("carrello");


%>
</head>
<body>
<%@ include file="Header.jsp"%><br>

<%if(carrello!=null&&carrello.getOggetto().size()>0){
	
List<prodotto> prodcarrello=carrello.getOggetto(); %>

<%for(int i=0;i<prodcarrello.size();i++){ %>

<% prodotto p=prodcarrello.get(i);
	

%>

<div id="test"></div>




<div class="riepilogo__prodotti__carrello">
<span id="nomeprod"><input type="text"  name="nome" value="<%=p.getDescrizione() %>"  readonly ></span>
<span id="quantita"><input type="text" value="<%=p.getDispcarrello() %>"></span>
<span id="prezzo">EUR <%=p.getPrezzo()*p.getDispcarrello() %></span>


</div>



<%}} %>



<div id="totale__spesa">

<% if(carrello!=null) {%>
<p>Totale Carrello: <%= carrello.getValorecarrello()%>
<%} %>
</div>

<div id="modalita_pagamento">
  <div>
  <label>
  <a href="https://www.paypal.com/it/home">
  <input type="radio" id="paypal" name="paypal" value="paypal" checked>
  <img src="immagini/paypal.png" style=width:60px;height:40px;>
  	</a>
</label>
</div>

<div>
  <label>
  <input type="radio" id="mastercad" name="mastercad" value="mastercad" >
  <img src="immagini/mastercard.png" style=width:60px;height:40px;>

</label>
</div>

  <div>
   <label>
  <input type="radio" id="huey" name="drone" value="huey" >
  <img src="immagini/contrassegno.png" style=width:60px;height:50px;>
  </label>
  </div>

</div>


<div id="modalita_spedizione">
  

</div>

<div id="inserisci__ordine">


</div>

</body>
</html>