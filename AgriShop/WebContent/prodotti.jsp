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

<p>Categorie:
<form action="prodotti" >
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta">
<label for="ortaggi"> Ortaggi</label><br>
</div>
<div>
<input type="radio" id="frutta" value="frutta" name="scelta">
<label for="ortaggi"> Frutta</label><br>
</div>
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta">
<label for="ortaggi"> Ortaggi</label><br>
</div>
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta">
<label for="ortaggi"> Ortaggi</label><br>
</div>
<div>
<input type="radio" id="ortaggi" value="ortaggi" name="scelta">
<label for="ortaggi"> Ortaggi</label><br>
</div>
    <input type="submit" value="Submit"> 

<div></div>
<div></div>
</form>
 


</div>



<div id="risultato">


<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	
	%>
	

	
	<div id="singolo">
	<a href=""><img id="immagineprod" width="60px" src="immagini/<%=beans.getIdfoto()%>.png"></a>
	  <p id="descrizione"><a href=""><%=beans.getDescrizione() %></a><br>
	 	 <p id="prezzo"><%=(float)beans.getPrezzo()%>0 <img width="20px" src="immagini/euro.png"> <br>
	
	</div>

<% }
		
	}else{
%>

 <a href="errore.jsp">Errore</a>

<% } %>

</div>

</body>


</html>