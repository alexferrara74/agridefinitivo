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
import model.OrdineModel;
import model.compostoModel;
import model.ordine;

/**
 * Servlet implementation class ordiniclienti
 */
@WebServlet("/ordiniclienti")
public class ordiniclienti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		String nomenegozio=(String) request.getSession().getAttribute("nome");
		System.out.print(nomenegozio);
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		compostoModel modelcomposto=new compostoModel(ds);
		OrdineModel modelordine= new OrdineModel(ds);
		LoginModelDS modelnegozio=new LoginModelDS(ds);
		Negozio neg=new Negozio();
		ordine ordine=new ordine();
		StringBuffer risposta=new StringBuffer();
		
		try {
			neg=modelnegozio.doRetrieveByRs(nomenegozio);
		}catch(SQLException e) {
			
		}
		
		
		
		try {
			ordine=modelordine.doRetrieveByPiva(neg.getPiva());
		} catch (SQLException e) {
			
		}
		
		risposta.append("<p>");
		risposta.append(ordine.getNumero());
		risposta.append(ordine.getPiva());

		risposta.append("</p>");
		
		response.getWriter().write(risposta.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
