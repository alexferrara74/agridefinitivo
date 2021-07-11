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

import model.Carrello;
import model.LoginModelDS;
import model.Negozio;
import model.OrdineModel;
import model.composto;
import model.compostoModel;
import model.ordine;
import model.prodotto;

/**
 * Servlet implementation class totaleordine
 */
@WebServlet("/totaleordine")
public class totaleordine extends HttpServlet {
	private static final long serialVersionUID = 1L;
	float cont=0;
	int numeroordine=0;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String contanti= request.getParameter("contanti");
		String totale= request.getParameter("action");
		String nomenegozio=(String) request.getSession().getAttribute("nome");
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		OrdineModel modelordine= new OrdineModel(ds);
		LoginModelDS model= new LoginModelDS(ds);
		
		Carrello<prodotto> carrello = (Carrello<prodotto>) request.getSession().getAttribute("carrello");
		Negozio neg=new Negozio();
		ordine ordine= new ordine();
		composto composto=new composto();
		StringBuffer risposta=new StringBuffer();
		
		if(nomenegozio!=null) {
			try {
				neg=(model.doRetrieveByRs(nomenegozio));
				System.out.print(neg.getEmail());
			}catch (SQLException e) {
				
				response.sendRedirect("homepage.jsp");		
	}
			
		}
		
		
		
		if(carrello!=null) {
		
			if(contanti!=null) {
				cont=Float.parseFloat(contanti);
			
			}
	
		
		
		if(totale!=null&&totale.equals("totale")) {
			
			
			float valore=carrello.getValorecarrello();
			valore=valore+cont;
			carrello.setValorecarrello(valore);
			cont=0;
			risposta.append(+carrello.getValorecarrello());
			
		}
		
	
		try {
		
			ordine.setNumero(numeroordine);
			numeroordine++;
			ordine.setPiva(neg.getPiva());			
			modelordine.doSave(ordine);
			
		}
			catch (SQLException e) {
				
						
	}
		
		
		for(int i=0;i<carrello.getOggetto().size();i++) {
			prodotto prod= new prodotto();
			prod=carrello.getOggetto().get(i);
			composto.setNumero(numeroordine);
			composto.setQuantita(prod.getDispcarrello());
			composto.setSsn(prod.getSsn());
			
			
		}
		
		try {
			compostoModel modelcomposto=new compostoModel(ds);
			modelcomposto.doSave(composto);
			
			
		}
			catch (SQLException e) {
				
						
	}
		}
		
	
		
		response.getWriter().write(risposta.toString());
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
