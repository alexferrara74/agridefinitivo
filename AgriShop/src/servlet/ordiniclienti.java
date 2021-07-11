package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import model.LoginModelDS;
import model.Negozio;
import model.OrdineModel;
import model.composto;
import model.compostoModel;
import model.ordine;
import model.prodotto;

/**
 * Servlet implementation class ordiniclienti
 */
@WebServlet("/ordiniclienti")
public class ordiniclienti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		String nomenegozio=(String) request.getSession().getAttribute("nome");

		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		compostoModel modelcomposto=new compostoModel(ds);
		OrdineModel modelordine= new OrdineModel(ds);
		LoginModelDS modelnegozio=new LoginModelDS(ds);
		Negozio neg=new Negozio();
		
		StringBuffer risposta=new StringBuffer();
		Collection <ordine> ordine= new LinkedList<ordine>(); 
		Collection <composto> composto= new LinkedList<composto>(); 
		try {
			neg=modelnegozio.doRetrieveByRs(nomenegozio);
		}catch(SQLException e) {
			
		}
		
		
		
		try {
			ordine=modelordine.doRetrieveByPiva(neg.getPiva());
			
			Iterator<?> it=ordine.iterator();
			while(it.hasNext()){
				ordine beans=(ordine)it.next();
				System.out.println(beans.getPiva());
				risposta.append("<p>");
	
				risposta.append(+beans.getNumero());
				risposta.append(beans.getPiva());
				risposta.append("</p>");
				composto=modelcomposto.doRetrieveByPiva(beans.getNumero());
				Iterator<?> ite=composto.iterator();
				while(ite.hasNext()){
					composto beanscomposto=(composto)ite.next();
					risposta.append("<p>");
					risposta.append(beanscomposto.getQuantita());
					risposta.append(beanscomposto.getSsn());
					risposta.append("</p>");
				}
			}
			
			
			
			
		} catch (SQLException e) {
			
		}
		
		
	
		
		
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
