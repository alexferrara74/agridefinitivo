package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.LoginModelDS;
import model.Negozio;
import utils.utility;

/**
 * Servlet implementation class controlloregistrazione
 */
@WebServlet("/controlloregistrazione")
public class controlloregistrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parametro=request.getParameter("mail");
		DataSource ds=(DataSource)getServletContext().getAttribute("DataSource");
		LoginModelDS model=new LoginModelDS(ds);
		Negozio negozio= new Negozio();	
		
		System.out.print("ciao");
		
		if(parametro!=null) {
			
			try {
				request.setAttribute("controllo", negozio=(model.doRetrieveByKey(parametro)));
				
			}catch(SQLException e) {
				utility.print(e);
				request.setAttribute("errore", e.getMessage());
			}
			response.getWriter().write("errore");
			
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
