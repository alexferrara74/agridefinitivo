package model;

import java.sql.SQLException;

public interface compostoModelDS<T> {
	
	public T doRetrieveByPiva(String code) throws SQLException;
	
	public void doSave(T item) throws SQLException ;
	
	public void doUpdate(T item) throws SQLException ;
	public void doDelete(T item) throws SQLException ;
	
}
