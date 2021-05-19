<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, model.*" session="true"%>

<% 
Collection<?> prodotti=(Collection<?>)request.getAttribute("prodotti");

String error= (String)request.getAttribute("error");

if(prodotti==null&& error==null){
	response.sendRedirect(response.encodeRedirectURL("./prodotti"));
	return;
	
}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="style.css" rel="stylesheet" type="text/css">

<title>PRODOTTI</title>
</head>


<body>
<h1>Store</h1>
<h1>Prodotti</h1>

<%


%>
<table>
<tr>
 <th>Code</th>
 <th>Nome</th>
 <th>Description</th>
 <th>Action</th>
</tr>

<%
if(prodotti!=null&&prodotti.size()>0){
	
		Iterator<?> it=prodotti.iterator();
		while(it.hasNext()){
			prodotto beans=(prodotto)it.next();
	
	%>
	
	<tr> 
	<td> <%=beans.getNome() %></td>
	<td> <%=beans.getPrezzo() %></td>
	<td> <%=beans.getDescrizione() %></td>
	<td></td>
</tr>




<% }
		
	}else{
%>

	<tr>
	<td colspan="4">NO PRODUCT</td>
	</tr>

<% } %>


</table>


</body>


</html>