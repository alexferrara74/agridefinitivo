package model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;

import utils.utility;

public class OrdineModel implements OrdineModelDS<ordine> {
private DataSource ds= null;
	
	public  OrdineModel(DataSource ds) {
		this.ds=ds;
	}
	
	@Override
	public Collection<ordine>doRetrieveByPiva(String order) throws SQLException {
		Connection connection=null;
		PreparedStatement prepareStatement=null;
		
		String selectSQL="SELECT * FROM ordine where PIVA= ?";
		
		
		Collection <ordine> ordine= new LinkedList<ordine>(); 
		try {
			
			connection= ds.getConnection();
			prepareStatement= connection.prepareStatement(selectSQL);
			prepareStatement.setString(1, order);
			ResultSet rs=prepareStatement.executeQuery();
			ordine bean=new ordine();
			
				bean.setNumero(rs.getInt("numero"));
				bean.setPiva(rs.getString("PIVA"));
				ordine.add(bean);			
			
						
		}finally {
			try {
			if(prepareStatement!=null)
			prepareStatement.close();
			}finally {
				
			
			
			if(connection!=null)
			connection.close();
			}
			
		}
		
		return ordine;
	}
	

	@Override
	public void doSave(ordine item) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL="INSERT INTO ordine"+"(numero,PIVA) VALUES (?,?)";    
		
		try {
			connection=ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setInt(1,item.getNumero());
			preparedStatement.setString(2,item.getPiva());
			
			
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
	public void doUpdate(ordine item) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(ordine item) throws SQLException {
		// TODO Auto-generated method stub
		
	}





}
