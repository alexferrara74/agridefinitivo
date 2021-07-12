package model;

public class pagamento {
int id;
int numeropagamento;
String modalitapagamento;

public pagamento() {
	id=0;
	numeropagamento=0;
	modalitapagamento="";
	
}



public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getNumeropagamento() {
	return numeropagamento;
}
public void setNumeropagamento(int numeropagamento) {
	this.numeropagamento = numeropagamento;
}
public String getModalitapagamento() {
	return modalitapagamento;
}
public void setModalitapagamento(String modalitapagamento) {
	this.modalitapagamento = modalitapagamento;
}

}
