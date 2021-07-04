<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style/stylecarrello.css">


<%
String erroreqnt=(String)request.getSession().getAttribute("quantitaerr");
String nomeprodotto=(String)request.getSession().getAttribute("nomeprod");
Carrello <prodotto> carrello=(Carrello<prodotto>)request.getSession().getAttribute("carrello");
int count=0;
float totale=0;
%>


</head>

<body>

<%@ include file="Header.jsp"%><br>


<a href="carrello?action=clearCart">Svuota Carrello</a>







<%if(carrello!=null&&carrello.getOggetto().size()>0){
	
List<prodotto> prodcarrello=carrello.getOggetto(); %>

<%for(int i=0;i<prodcarrello.size();i++){ %>

<% prodotto p=prodcarrello.get(i);
	totale=totale+(p.getDispcarrello()*p.getPrezzo());

%>

<div id="test"></div>




<div class="prodotti__carrello">
<span><img src="immagini/<%=p.getIdfoto()%>.png"></span>
<span id="nomeprod"><input type="text"  name="nome" value="<%=p.getDescrizione() %>"  readonly ></span>

<span id="quantita"><input type="number"name="quantita" min="0" step="1" value="<%=p.getDispcarrello() %>"></span>
<span id="prezzo">EUR <%=p.getPrezzo() %></span>


</div>




<%}}else{ %>


<div class="carrello__vuoto">

<img src="immagini/carrellovuoto.png">
<a id="cliccaqui" href="prodotti.jsp"><button>Clicca Qui!</button></a>
<h1></h1>
</div>

<%} %>


<div id="conferma__carrello">
<form action="" method="POST">
<input type="submit" value="Vai Al Pagamento">
</form>

<p>Prezzo Totale: <%=totale%>
</div>




<script src="JS/carrello.js"></script>
</body>
</html>