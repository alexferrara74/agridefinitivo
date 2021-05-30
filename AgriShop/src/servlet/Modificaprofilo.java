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
 * Servlet implementation class Modificaprofilo
 */
@WebServlet("/Modificaprofilo")
public class Modificaprofilo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		LoginModelDS model= new LoginModelDS(ds);
		Negozio neg=(Negozio) request.getSession().getAttribute("neg");
		
		String user= request.getParameter("user");
		String password=request.getParameter("password");
		String conferma=request.getParameter("conferma");
		String indirizzo= request.getParameter("indirizzo");
		String piva=request.getParameter("piva");
	
		
		
		if(user!=null) {			
		if(!user.equals("")) {
			neg.setRs(user);
		}
		}
		if(indirizzo!=null) {
		if(!indirizzo.equals("")){
			neg.setIndirizzo(indirizzo);;
		}}
		
		if(piva!=null) {
		if(!piva.equals("")) {
			neg.setPiva(piva);
		}}
		
		if(!password.equals("")&&password.equals(conferma)) {
			neg.setPwd(password);
		}
		
	
		try {
			 model.doUpdate(neg);
			
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
		}
		
		if(request.getSession() !=null) {
			request.getSession().invalidate();
		}
		
	
		
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/Login.jsp");
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
