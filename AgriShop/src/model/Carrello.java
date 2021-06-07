package model;

import java.util.ArrayList;
import java.util.List;

public class Carrello<T> {
	List<T> items;

	public Carrello() {
		items = new ArrayList<T>();
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
