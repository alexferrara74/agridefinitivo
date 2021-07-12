package model;

import java.util.Date;

public class ordine {

	int numero;
	String piva;
	
		public ordine() {		
			piva="";
			
		}

	
		public int getNumero() {
			return numero;
		}

		public void setNumero(int numero) {
			this.numero = numero;
		}

		public String getPiva() {
			return piva;
		}

		public void setPiva(String piva) {
			this.piva = piva;
		}
	
}
