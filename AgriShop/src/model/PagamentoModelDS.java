package model;


import java.util.Collection;
import java.sql.SQLException;

public interface PagamentoModelDS<T>{

		public Collection <T> doRetrieveById(String code) throws SQLException;
		
		public void doSave(T item) throws SQLException ;
		
		public void doUpdate(T item) throws SQLException ;
		public void doDelete(T item) throws SQLException ;
		

}
