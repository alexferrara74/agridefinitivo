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
import model.PagamentoModel;
import model.SpedizioneModel;
import model.composto;
import model.compostoModel;
import model.ordine;
import model.pagamento;
import model.prodotto;
import model.spedizione;

/**
 * Servlet implementation class totaleordine
 */
@WebServlet("/totaleordine")
public class totaleordine extends HttpServlet {
	private static final long serialVersionUID = 1L;
	float cont=0;
	int costospedizione;
	int numeroordine=5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		
		String tipopagamento= request.getParameter("pagamento");
		String totale= request.getParameter("action");
		String tipospedizione=request.getParameter("spedizione");
		String nomenegozio=(String) request.getSession().getAttribute("nome");
		
		OrdineModel modelordine= new OrdineModel(ds);
		PagamentoModel modelpagamento=new PagamentoModel(ds);
		SpedizioneModel modelspedizione= new SpedizioneModel(ds);
		LoginModelDS model= new LoginModelDS(ds);
		compostoModel modelcomposto=new compostoModel(ds);
		Carrello<prodotto> carrello = (Carrello<prodotto>) request.getSession().getAttribute("carrello");
		Negozio neg=new Negozio();
		ordine ordine= new ordine();
		composto composto=new composto();
		spedizione spedizione=new spedizione();
		pagamento pagamento=new pagamento();
		
		
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
			
			if(tipospedizione!=null) {
				if(tipospedizione.equals("GLS")) {
					costospedizione=8;
					spedizione.setCostospedizione(costospedizione);
					spedizione.setModalitaspedizione("GLS");
				}
				if(tipospedizione.equals("SDA")) {
					costospedizione=6;
					spedizione.setCostospedizione(costospedizione);
					spedizione.setModalitaspedizione("SDA");
				}
				if(tipospedizione.equals("MANO")) {
					costospedizione=0;
					spedizione.setCostospedizione(costospedizione);
					spedizione.setModalitaspedizione("RITIRO");
				}
			}
		
			if(tipopagamento!=null) {
				if(tipopagamento.equals("contanti")) {
				pagamento.setModalitapagamento("contanti");
				cont=4;
				}
			
			
				if(tipopagamento.equals("mastercard")) {
				pagamento.setModalitapagamento("mastercard");
				cont=0;
				}
			
	
				if(tipopagamento.equals("paypal")) {
				pagamento.setModalitapagamento("paypal");
				cont=0;
			
				try {
					modelpagamento.doSave(pagamento);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}}
			
			
			
		if(totale!=null&&totale.equals("totale")) {	
			float valore=carrello.getValorecarrello();
			valore=valore+cont+costospedizione;
			carrello.setValorecarrello(valore);
			cont=0;
			costospedizione=0;
			risposta.append(+carrello.getValorecarrello());
			
	
		ordine.setPiva(neg.getPiva());
		ordine.setNumero(numeroordine);
		try {
			modelordine.doSave(ordine);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
			
		for(int i=0;i<carrello.getOggetto().size();i++) {
			prodotto prod= new prodotto();
			prod=carrello.getOggetto().get(i);
		
			composto.setQuantita(prod.getDispcarrello());
			composto.setSsn(prod.getSsn());
			composto.setNumero(numeroordine);
			
			System.out.print(composto.getQuantita());
			try {
				modelcomposto.doSave(composto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
				
		
			
		
		}
		
		}}
		
	
		numeroordine++;
		response.getWriter().write(risposta.toString());
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
