package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import utils.utility;

public class compostoModel implements compostoModelDS<composto>  {
private DataSource ds= null;
	

	public compostoModel(DataSource ds) {
		this.ds=ds;
	}



	@Override
	public void doSave(composto item) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL="INSERT INTO composto"+"(quantita,SSN,numero) VALUES (?,?,?)";    
		
		try {
			connection=ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1,item.getQuantita());
			preparedStatement.setString(2,item.getSsn());
			preparedStatement.setInt(3,item.getNumero());
			
			
			utility.print("doSave: " + preparedStatement.toString());
			preparedStatement.executeUpdate();

			connection.commit();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null) {
					connection.close();
				}
			}
		}


	}



	@Override
	public composto doRetrieveByPiva(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void doUpdate(composto item) throws SQLException {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void doDelete(composto item) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	
}
