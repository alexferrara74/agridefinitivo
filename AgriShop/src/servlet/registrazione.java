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

import model.LoginModelDS;
import model.Negozio;
import utils.utility;

/**
 * Servlet implementation class registrazione
 */
@WebServlet("/registrazione")
public class registrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Negozio nuovo=new Negozio();
		String email= request.getParameter("email");
		String password=request.getParameter("password");
		String conferma=request.getParameter("conferma");
		String ragionesociale=request.getParameter("ragionesociale");
		String piva=request.getParameter("piva");
		String indirizzo=request.getParameter("indirizzo");
		String cap=request.getParameter("cap");
		String civico=request.getParameter("civico");
		
		
		nuovo.setEmail(email);
		nuovo.setIndirizzo(indirizzo);
		nuovo.setPiva(piva);
		nuovo.setPwd(password);
		nuovo.setRs(ragionesociale);
		nuovo.setCivico(civico);
		nuovo.setCap(cap);
		
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		LoginModelDS model= new LoginModelDS(ds);
		 
		if(password.equals(conferma)) {
			
				
		try {
			model.doSave(nuovo);
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
					
		}
		}
		else {
			
			request.setAttribute("passdiversa", "passdiversa");
			
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
