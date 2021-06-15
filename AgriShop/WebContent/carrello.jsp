<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%

Carrello <prodotto> carrello=(Carrello<prodotto>)request.getSession().getAttribute("carrello");
if(carrello!=null){
	
List<prodotto> prodcarrello=carrello.getOggetto();

%>

<%
 for(int i=0;i<prodcarrello.size();i++){

%>

<%prodotto p=prodcarrello.get(i); %>
<%=p.getDescrizione() %>
<%=p.getNome() %>
<%}} %>

</head>

<body>




</body>
</html>