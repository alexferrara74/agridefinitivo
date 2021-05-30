<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*" session="true"%>

<% 
Collection<?> prodotti=(Collection<?>)request.getAttribute("prodotti");

String errore= (String)request.getAttribute("error");
if(prodotti==null&&errore==null){
	
	response.sendRedirect(response.encodeRedirectURL("./prodotti"));
}

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style/prodotti.css" rel="stylesheet" type="text/css">

<title>PRODOTTI</title>
</head>


<body>
	<%@ include file="Header.jsp"%><br>


<div id="parametriconfigurazione">




</div>



<div id="risultato">


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	
	%>
	

	
	<div id="singolo">
	 <p id="descrizione"><%=beans.getDescrizione() %><br>
	 <p id="prezzo"><%=beans.getPrezzo() %> <br>
	
	</div>

<% }
		
	}else{
%>

 <a href="errore.jsp">Errore</a>

<% } %>

</div>

</body>


</html>