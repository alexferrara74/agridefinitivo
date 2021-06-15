package model;

import java.util.Collection;
import java.sql.SQLException;

public interface negozioModel <T>{

	
	public T doRetrieveByKey(String email) throws SQLException;
	public T doRetrieveByRs(String rags) throws SQLException;
	
	public Collection<T> doRetrieveAll(	String order) throws SQLException ;
	public void doSave(T item) throws SQLException ;
	public void doUpdate(T item) throws SQLException ;
	public void doDelete(T item) throws SQLException ;



	
}