package model;


import java.util.Collection;
import java.sql.SQLException;

public interface OrdineModelDS<T>{

		public Collection <T> doRetrieveByPiva(String code) throws SQLException;
		public Collection <T> doRetrieveByAll() throws SQLException;
		
		public void doSave(T item) throws SQLException ;
		
		public void doUpdate(T item) throws SQLException ;
		public void doDelete(T item) throws SQLException ;
		

}

 