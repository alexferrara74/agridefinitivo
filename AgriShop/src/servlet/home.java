package servlet;

import java.io.IOException;
import java.sql.SQLException;
import utils.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ProductModelDS;



/**
 * Servlet implementation class home
 */
@WebServlet(description = "/prodotti", urlPatterns = { "/prodotti" })
public class home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub

		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		String[] categoria =request.getParameterValues("scelta");
			
		if(categoria!=null) {
	    for(String s:categoria) {
			if(s!=null) {
				String dato=s;
						
		try {
			request.setAttribute("prodotti", model.doRetrieveByKey(dato));
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
			
			
		}
	}
	    
	    }}	else {
				try {
					request.setAttribute("prodotti", model.doRetrieveByKey("frutta"));
				} catch (SQLException e) {
					utility.print(e);
					
					request.setAttribute("error", e.getMessage());
					
					
				}
			}
	
	    
	
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/prodotti.jsp");
		dispacher.forward(request, response);
		
	
		
	}
		
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
