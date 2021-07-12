<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="JS/conferma-carrello.js"></script>
<link rel="stylesheet" href="style/stylecarrello.css">


<%
String nomeprodotto=(String)request.getSession().getAttribute("nomeprod");
Carrello <prodotto> carrello=(Carrello<prodotto>)request.getSession().getAttribute("carrello");
int count=0;
float totale=0;
%>


</head>

<body>

<%@ include file="Header.jsp"%><br>


<a id="svuotacarrello" href="<%=response.encodeURL("carrello?action=clearCart")%>">Svuota Carrello</a>







<%if(carrello!=null&&carrello.getOggetto().size()>0){
	
List<prodotto> prodcarrello=carrello.getOggetto(); %>

<%for(int i=0;i<prodcarrello.size();i++){ %>

<% prodotto p=prodcarrello.get(i);
	totale=totale+(p.getDispcarrello()*p.getPrezzo());
	
%>

<div id="test"></div>




<div class="prodotti__carrello">
<span><img src="immagini/<%=p.getIdfoto()%>.png"></span>
<input type="text" id="nomeprodotto" name="nome" value="<%=p.getNome() %>" style="display:none"  readonly >
<span id="nomeprod"><input type="text" name="nome" value="<%=p.getDescrizione() %>"  readonly ></span>

<span id="quantita"><input id="quantitanumero"  type="number" name="quantita" value="<%=p.getDispcarrello() %>" readonly></span>
<span id="prezzo">EUR <%=p.getPrezzo() %></span>


</div>

<%}}else{ %>


<div class="carrello__vuoto">

<img src="immagini/carrellovuoto.png">
<a id="cliccaqui" href="prodotti.jsp"><button>Clicca Qui!</button></a>

</div>

<%} %>


<div id="conferma__carrello">



<a href="confermaordine.jsp"> Conferma Ordine</a>


<%=totale %>


<%
if(carrello!=null){

carrello.setValorecarrello(totale);} %>


</div>




<script src="JS/carrello.js"></script>

</body>
</html>