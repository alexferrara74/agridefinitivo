package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

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
 * Servlet implementation class ricerca
 */
@WebServlet("/ricerca")
public class ricerca extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String parametro=request.getParameter("parametro");
		
		
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		prodotto prod=new prodotto();	
		
		
		Collection <prodotto> prodotto= new LinkedList<prodotto>(); 
		if(!parametro.equals("")) {
		try {
			request.setAttribute("ricercanome",prod= model.doRetrieveByscelta(parametro));
		
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			if(!prod.getNome().equals("")) {
			out.print("<a href=visualizzaprodotto?nomeprodotto="+prod.getNome()+">"+prod.getNome()+" "+prod.getDescrizione()+" "+prod.getPrezzo()+"</a>");
			
			}
			
			if(prod.getNome().equals("")) {
				request.setAttribute("ricercacategoria",prodotto=model.doRetrieveByparametro(parametro));
				
					Iterator<?> it=prodotto.iterator();
					while(it.hasNext()){
						prodotto beans=(prodotto)it.next();
						out.print("<a href=visualizzaprodotto?nomeprodotto="+beans.getNome()+">"+beans.getNome()+" "+beans.getDescrizione()+" "+beans.getPrezzo()+"</a>");
						
				}
				
			}
			
			
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
					
		}
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
