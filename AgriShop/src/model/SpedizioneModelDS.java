package model;


import java.util.Collection;
import java.sql.SQLException;

public interface SpedizioneModelDS<T>{

		public T doRetrieveByNumero(String code) throws SQLException;
		
		public void doSave(T item) throws SQLException ;
		
		public void doUpdate(T item) throws SQLException ;
		public void doDelete(T item) throws SQLException ;
		

}
