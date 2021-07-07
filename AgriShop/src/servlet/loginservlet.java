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
		String errore="errorelogin";
		
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		LoginModelDS model= new LoginModelDS(ds);
		Negozio neg=new Negozio();
		
		HttpSession ssn=request.getSession();
		ssn.setMaxInactiveInterval(-1);
		ssn.setAttribute("nome", null);
		
		if(username.equals("admin")&&password.equals("admin")){
			ssn.setAttribute("nome","admin");
			ssn.setAttribute("neg", "admin");
			response.sendRedirect("homepage.jsp");
			
		}
		
			
		try {
			neg=(model.doRetrieveByKey(username));
		
			if(neg.isEmpty()) {
				request.setAttribute("erroreaccount",errore);	
			}
			
			
			if(neg.getPwd()==null&&neg.getEmail()==null) {
				
				request.setAttribute("erroreaccount",errore);	
			
			} else {	
				if((neg.getPwd().equals(password))&&(neg.getEmail().equals(username))) {
					
					
						ssn.setAttribute("nome",neg.getRs());
						ssn.setAttribute("neg", neg);
						response.sendRedirect("homepage.jsp");
				} else {
					
						request.setAttribute("passerrore",errore);				
				}}
				
		} catch (SQLException e) {
			
					response.sendRedirect("homepage.jsp");		
		}
		
		
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/Login.jsp");
		dispacher.include(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
