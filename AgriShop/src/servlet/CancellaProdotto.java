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
 * Servlet implementation class CancellaProdotto
 */
@WebServlet("/CancellaProdotto")
public class CancellaProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancellaProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		
		prodotto prod= new prodotto();
		
		
		String SSN=request.getParameter("Ssn");
		
		

	
		
		if(SSN!=null) {			
		if(!SSN.equals("")) {
			prod.setSsn(SSN);
		}
		}
	
	
		try {
			 model.doDelete(prod);
			
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
