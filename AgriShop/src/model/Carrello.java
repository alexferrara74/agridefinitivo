package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello<T> {
	List<T> items;
	float valorecarrello;
	
	public Carrello() {
		items = new ArrayList<T>();
		valorecarrello=0;
	}

	public float getValorecarrello() {
		return valorecarrello;
	}

	public void setValorecarrello(float valorecarrello) {
		this.valorecarrello = valorecarrello;
	}

	public void addOggetto(T item) {
		items.add(item);
	}

	public void deleteOggetto(T item) {
		items.remove(item);
		/*
		 * for(T it: items) { 
		 * 	if(it.equals(item)) { 
		 * 		items.remove(it); 
		 * 		break; } }
		 */
	}

	public List<T> getOggetto() {
		return items;
	}

	public void deleteOggetto() {
		items.clear();
	}
}
