<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/stylecarrello.css" rel="stylesheet" type="text/css">
<script src="JS/conferma-carrello.js"></script>


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

 <label class="container" ><img src="immagini/paypal.png">
  <input type="radio"  name="radio" value="PayPal" onchange="pagamento(this);">
  <span class="checkmark"></span>
</label>

<div id="conferma_paypal">
<h1>agrishop@gmail.com</h1>

</div>

<label class="container"><img src="immagini/mastercard.png">
  <input type="radio" name="radio" value="mastercard" onchange="pagamento(this);">
  <span class="checkmark"></span>
</label>

<div id="dati_pagamento">
<input type="text" placeholder="">
<input type="text" placeholder="">
<input type="text" placeholder="">
</div>




<label class="container"><img src="immagini/contrassegno.png">
  <input type="radio" id="contr" name="radio" value="contanti"  onchange="pagamento(this);">
  <span class="checkmark"></span>
</label>

</div>





<div id="modalita_spedizione">


</div>

<button onclick="calcolo()">Conferma carrello</button>


<div id="totale__carrello">



</div>


<div id="inserisci__ordine">


</div>


<div id="foother">
<%@ include file="foother.jsp"%>
</div>
</body>

</html>
