package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.ProductModelDS;
import model.prodotto;
import utils.utility;

/**
 * Servlet implementation class ricerca
 */
@WebServlet("/ricerca")
public class ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parametro=request.getParameter("input_ricerca");
		
		System.out.print(parametro);
		
		
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		prodotto prod=new prodotto();
	
		
		try {
			request.setAttribute("ricercanome",prod= model.doRetrieveByscelta(parametro));
			if(prod.getNome().equals("")) {
				request.setAttribute("ricercacategoria",model.doRetrieveByparametro(parametro));
			}
			
			
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
			
			
		}
		
		
		
		
		
		
		
		
		
		
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/homepage.jsp");
		dispacher.forward(request, response);
		
	
		
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
