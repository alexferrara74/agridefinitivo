package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.sql.DataSource;



import java.sql.Connection;


import utils.*;
public class LoginModelDS implements negozioModel<Negozio>{

	
	private DataSource ds= null;
	
	public LoginModelDS(DataSource ds) {
		this.ds=ds;
	}
	
	
	
	public Negozio doRetrieveByRs(String rags) throws SQLException {
		
		java.sql.Connection connection=null;
		PreparedStatement preparedStatement=null;
		Negozio bean= new Negozio();
		
		String sql="SELECT * FROM negozio WHERE ragione_sociale=?";
		
		
		
		try {

			connection= ds.getConnection();
			preparedStatement= connection.prepareStatement(sql);
			preparedStatement.setString(1,rags);
			ResultSet rs=preparedStatement.executeQuery();
			
		
		
		while(rs.next()) {
			bean.setCap(rs.getString("cap"));
			bean.setCivico(rs.getString("ncivico"));
			bean.setRs(rs.getString("ragione_sociale"));
			bean.setIndirizzo(rs.getString("indirizzo"));
			bean.setPiva(rs.getString("PIVA"));
			bean.setPwd(rs.getString("pwd"));
			bean.setEmail(rs.getString("email"));
				
		}
		
		
		}finally {
		try {
		if(preparedStatement!=null)
		preparedStatement.close();
		}finally {
			
		
		
		if(connection!=null)
		connection.close();
		}
		
	}
		return bean;
		
		}

	
	@Override
	public Negozio doRetrieveByKey(String email) throws SQLException {
	
		java.sql.Connection connection=null;
		PreparedStatement preparedStatement=null;
		Negozio bean= new Negozio();
		
		String sql="SELECT * FROM negozio WHERE email=?";
		
		
		
		try {

			connection= ds.getConnection();
			preparedStatement= connection.prepareStatement(sql);
			preparedStatement.setString(1,email);
			ResultSet rs=preparedStatement.executeQuery();
			
		
		
		while(rs.next()) {
			bean.setCap(rs.getString("cap"));
			bean.setCivico(rs.getString("ncivico"));
			bean.setRs(rs.getString("ragione_sociale"));
			bean.setIndirizzo(rs.getString("indirizzo"));
			bean.setPiva(rs.getString("PIVA"));
			bean.setPwd(rs.getString("pwd"));
			bean.setEmail(rs.getString("email"));
				
		}
		
		
		}finally {
		try {
		if(preparedStatement!=null)
		preparedStatement.close();
		}finally {
			
		
		
		if(connection!=null)
		connection.close();
		}
		
	}
		return bean;
		
		}

	@Override
	public Collection<Negozio> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Negozio item) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO negozio " + " (ragione_sociale, indirizzo, ncivico, cap, PIVA, email,pwd) VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			connection=ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(insertSQL);

			preparedStatement.setString(1,item.getRs());
			preparedStatement.setString(2,item.getIndirizzo());
			preparedStatement.setString(3,item.getCivico());
			preparedStatement.setString(4,item.getCap());
			preparedStatement.setString(5,item.getPiva());
			preparedStatement.setString(6,item.getEmail());
			preparedStatement.setString(7,item.getPwd());
			
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
	public void doUpdate(Negozio item) throws SQLException {
		// TODO Auto-generated method stub
		Connection 	connection=null;
		PreparedStatement preparedStatement=null;
		
		String SQL="UPDATE negozio SET "+" ragione_sociale= ?, indirizzo= ? , ncivico=?, cap=? , PIVA= ?, pwd=? WHERE email=?";
		try {
			connection = ds.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(SQL);

			preparedStatement.setString(1, item.getRs());
			preparedStatement.setString(2, item.getIndirizzo());
			preparedStatement.setString(3, item.getCivico());
			preparedStatement.setString(4, item.getCap());
			preparedStatement.setString(5, item.getPiva());
			preparedStatement.setString(6, item.getPwd());
			preparedStatement.setString(7, item.getEmail());

			utility.print("doUpdate: " + preparedStatement.toString());
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
	public void doDelete(Negozio item) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	
	
	
	
	
}
