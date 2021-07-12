package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import model.ProductModelDS;
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
		ProductModelDS prodotto=new ProductModelDS(ds);
		
		Negozio neg=new Negozio();
		prodotto p= new prodotto();
		
		StringBuffer risposta=new StringBuffer();
	
				Collection <ordine> ordine= new LinkedList<ordine>(); 
				Collection <composto> composto= new LinkedList<composto>(); 

				
			try {
				neg=modelnegozio.doRetrieveByRs(nomenegozio);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		

			try {
				ordine=modelordine.doRetrieveByPiva(neg.getPiva());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			risposta.append("<p>");
			risposta.append(neg.getRs());	
			risposta.append("</p>");
	
		Iterator<?> it=ordine.iterator();
		while(it.hasNext()) {
			ordine beans=(ordine) it.next();
				risposta.append("<p>");	
				risposta.append("N°Ordine :");
				risposta.append(beans.getNumero());
				risposta.append(" ");
				risposta.append("</p>");
		
				try {
					composto=modelcomposto.doRetrieveByPiva(beans.getNumero());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Iterator <?> itcomposto=composto.iterator();
				while(itcomposto.hasNext()) {
					composto bean=(composto) itcomposto.next();
					
					try {
						p=prodotto.doRetrieveBySSN(bean.getSsn());
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					risposta.append("<p>");						
					risposta.append("Prodotto: ");
					risposta.append(p.getNome());
					risposta.append("     ");
					risposta.append("Pz:");
					risposta.append(bean.getQuantita());					
					risposta.append("</p>");
					
			
				}
		
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
