/**
 * 
 */




function cancellaprodotto(){

	
	var nome=document.getElementById("nomeprodotto").value;
	
	var http=new XMLHttpRequest();

	http.onreadystatechange=function(){
	if(http.readyState==4 && http.status==200){
		
		document.getElementByClassName("prodotti__carrello").innerHTML="elemento cancellato";	
		
	};
	}
	http.open("GET","carrello?action=deleteCart&nome="+nome+"",true);
	http.send();	
}



