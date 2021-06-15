package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
		HttpSession ssn=request.getSession();
		Negozio neg= new Negozio();
		boolean check=false;
		
		nuovo.setEmail(email);
		nuovo.setIndirizzo(indirizzo);
		nuovo.setPiva(piva);
		nuovo.setPwd(password);
		nuovo.setRs(ragionesociale);
		nuovo.setCivico(civico);
		nuovo.setCap(cap);
		
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		LoginModelDS model= new LoginModelDS(ds);
		 
		try {
			
			neg=(model.doRetrieveByKey(email));
			if(neg.getEmail().equals(email)) {
				request.setAttribute("error", "falso");	
				check=true;
			}	
		
				neg=(model.doRetrieveByRs(ragionesociale));
					if(neg.getRs().equals(ragionesociale)) {
						request.setAttribute("error", "falso");	
						check=true;
					}
			
			if(check==false) {
			if(password.equals(conferma)) {
				model.doSave(nuovo);
				request.setAttribute("error", "vero");}
			else
			{
				
				request.setAttribute("passdiversa", "falso");
			
			}
					}
			
			
		}catch(SQLException e) {
			request.setAttribute("error", "falso");	
		}
		

		
		
		
					
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/Registrazione.jsp");
		dispacher.include(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
