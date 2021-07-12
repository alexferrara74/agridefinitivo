package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import javax.sql.DataSource;

import utils.utility;

public class PagamentoModel implements PagamentoModelDS<pagamento> {

private DataSource ds= null;
	
	public  PagamentoModel(DataSource ds) {
		this.ds=ds;
	}
	
	
	@Override
	public Collection<pagamento> doRetrieveById(String code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(pagamento item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL="INSERT INTO pagamento "+" (ID,num_pag,modalitapagamento) VALUES (?,?,?)";    
		
		try {
			connection=ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1,item.getId());
			preparedStatement.setInt(2,item.getNumeropagamento());
			preparedStatement.setString(3,item.getModalitapagamento());
			
			
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
	public void doUpdate(pagamento item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(pagamento item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
