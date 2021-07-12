package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import javax.sql.DataSource;

import utils.utility;

public class SpedizioneModel implements SpedizioneModelDS<spedizione> {

	
private DataSource ds= null;
	
	public  SpedizioneModel(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public spedizione doRetrieveByNumero(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(spedizione item) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL="INSERT INTO spedizione "+" (ID,numero,modalitaspedizione,costospedizione) VALUES (?,?,?,?)";    
		
		try {
			connection=ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1,item.getId());
			preparedStatement.setInt(2,item.getNumeroordine());
			preparedStatement.setString(3,item.getModalitaspedizione());
			preparedStatement.setInt(4,item.getCostospedizione());
			
			
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
	public void doUpdate(spedizione item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(spedizione item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
