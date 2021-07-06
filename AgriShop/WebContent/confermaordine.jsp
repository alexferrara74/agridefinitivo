<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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




<div class="prodotti__carrello">
<span id="nomeprod"><input type="text"  name="nome" value="<%=p.getDescrizione() %>"  readonly ></span>
<span id="quantita"><input type="text" value="<%=p.getDispcarrello() %>"></span>
<span id="prezzo">EUR <%=p.getPrezzo()*p.getDispcarrello() %></span>


</div>


<%}} %>


<div>

<% if(carrello!=null) {%>
<p>Totale Carrello: <%= carrello.getValorecarrello()%>
<%} %>
</div>

</body>
</html>