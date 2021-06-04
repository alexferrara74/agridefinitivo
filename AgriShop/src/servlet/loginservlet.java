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
import model.ProductModelDS;
import utils.utility;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet(description = "/login", urlPatterns = { "/login" })
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		
		String username= request.getParameter("Email");
		String password=request.getParameter("password");
	
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		LoginModelDS model= new LoginModelDS(ds);
		Negozio neg=new Negozio();
		String passerrata="passerrata";
		HttpSession ssn=request.getSession();
		ssn.setMaxInactiveInterval(-1);
		ssn.setAttribute("nome", null);
		try {
			request.setAttribute("negozio", neg=(model.doRetrieveByKey(username)));
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
		
			
		}
		if(neg.getPwd()==null) {
		
			request.setAttribute("passerrata", passerrata);
			ssn.setAttribute("errore","errore");
		}
		
		else {
			
		if(neg.getPwd().equals(password)&&neg.getEmail().equals(username)) {
			
		
				ssn.setAttribute("nome",neg.getRs());
				ssn.setAttribute("neg", neg);
		}
		else {
			ssn.setAttribute("errore",passerrata);
			
		}
		}
	
	RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/homepage.jsp");
	dispacher.forward(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
