<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/stylecarrello.css" rel="stylesheet" type="text/css">
<script type="JS/prodotti.j"></script>


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

 <label class="container" onClick="attiva()">One
  <input type="radio" checked="checked" name="radio" onchange="attiva()">
  <span class="checkmark"></span>
</label>
<label class="container">Two
  <input type="radio" name="radio">
  <span class="checkmark"></span>
</label>
<label class="container">Three
  <input type="radio" name="radio">
  <span class="checkmark"></span>
</label>



</div>
<div id="dati_pagamento">ciao a tutti</div>



<div id="modalita_spedizione">


</div>

<div id="inserisci__ordine">


</div>

</body>

</html>
