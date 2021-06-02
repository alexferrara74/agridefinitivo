<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%String nomeprodotto=request.getParameter("nome"); 
String descprodotto=request.getParameter("descrizione");
String prezzoprodotto=request.getParameter("prezzo"); 
String fotoprodotto=request.getParameter("foto"); 

%>

</head>



<body>
<%if(nomeprodotto!=null&&descprodotto!=null&&prezzoprodotto!=null) {%>
		
		<div id="visualizzaprodotto">
		
		<%=nomeprodotto %>
		<%=descprodotto %>
		<%=prezzoprodotto %>
		<img src="../immagini/<%=fotoprodotto %>.png">
		
		</div>


<%} %>
</body>
</html>