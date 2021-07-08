/**
 * 
 */

function pagamento(src) {
	if(src.value=="mastercard")
		{
		document.getElementById("dati_pagamento").style.display="inline";
		document.getElementById("conferma_paypal").style.display="none";
		
		 }
		
		if(src.value=="contanti")		
		{
		document.getElementById("dati_pagamento").style.display="none";
		document.getElementById("conferma_paypal").style.display="none";
		
		 var xhr = new XMLHttpRequest();
   		 xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
           
        	}
   	 }
   		 xhr.open('GET', 'totaleordine?contanti=4', true);
  		 xhr.send(null);
		
		
		}
		
	if(src.value=="PayPal")
		{
		document.getElementById("conferma_paypal").style.display="inline"; 
		document.getElementById("dati_pagamento").style.display="none";
		
		
		
		}
	
	}
	
	function calcolo(){
		
		document.getElementById("totale__carrello").style.display="inline";
		
		 var xhr = new XMLHttpRequest();
   		 xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
		           
document.getElementById("totale__carrello").innerHTML=xhr.responseText;
        	}
   	 }
   		 xhr.open('GET', 'totaleordine?action=totale', true);
  		 xhr.send(null);
		
		
		}
		
		
	
	
	
	
	