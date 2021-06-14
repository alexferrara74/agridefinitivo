package servlet;

import java.io.IOException;
import java.sql.SQLException;

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
 * Servlet implementation class visualizzaprodotto
 */
@WebServlet("/visualizzaprodotto")
public class visualizzaprodotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		String dato=(String)request.getParameter("nomeprodotto");
		prodotto p=new prodotto();
				
		try {
			p= model.doRetrieveByscelta(dato);
			request.setAttribute("prodotti", p);
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
			
			
		}

	RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/prodotti/visualizzaprodotto.jsp");
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
