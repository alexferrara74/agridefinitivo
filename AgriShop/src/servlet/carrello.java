package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import model.*;
import utils.utility;



@WebServlet("/carrello")
public class carrello extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String quantita=request.getParameter("quantita");
		int qnt=Integer.parseInt(quantita);
		String nome = request.getParameter("nome");
		System.out.println(nome);
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model = new ProductModelDS(ds);
		boolean controllo=false;
		@SuppressWarnings("unchecked")
		Carrello<prodotto> carrello = (Carrello<prodotto>) request.getSession().getAttribute("carrello");
		if (carrello == null) {
			carrello = new Carrello<prodotto>();
			request.getSession().setAttribute("carrello", carrello);
		}
		
		String action = request.getParameter("action");
		
		try {
			if (action != null) {
				if (action.equals("aggiungi")) {			
					prodotto bean = (prodotto) model.doRetrieveByNome(nome);
					if (bean != null && !bean.isEmpty()) {		
						if(carrello.getOggetto().isEmpty()) {
							if(bean.getQuantita()>=(bean.getDispcarrello()+qnt)) {
							bean.setDispcarrello(qnt);
							carrello.addOggetto(bean);
							}else {
								bean.setDispcarrello(bean.getQuantita());
								carrello.addOggetto(bean);
								request.getSession().setAttribute("quantitaerr", "erroredisponibilita");
							
							}
							}else {

						for(int i=0;i<carrello.getOggetto().size();i++) {
							if(carrello.getOggetto().get(i).getNome().equals(bean.getNome())){
								int valore=carrello.getOggetto().get(i).getDispcarrello();
								int disponibilita=carrello.getOggetto().get(i).getQuantita();
								System.out.println(valore);
								System.out.println(disponibilita);
								if(disponibilita>=(valore+qnt)) {
								carrello.getOggetto().get(i).setDispcarrello(valore+qnt);
								controllo=true;
								}
								else {
									bean.setDispcarrello(bean.getQuantita());
						
									request.getSession().setAttribute("quantitaerr", "erroredisponibilita");
									controllo=true;
								}
							}}
							if(controllo==false) {
								if(bean.getQuantita()>=(bean.getDispcarrello()+qnt)) {
								bean.setDispcarrello(qnt);
								carrello.addOggetto(bean);
								}else {
									bean.setDispcarrello(bean.getQuantita());
									carrello.addOggetto(bean);
									request.getSession().setAttribute("quantitaerr", "erroredisponibilita");
								
								}
								}
									
							
						}
						
						
						
						
						
					}}
				} else if (action.equals("clearCart")) {
					carrello.deleteOggetto();
					request.setAttribute("message", "Cart cleaned");
				} else if (action.equals("deleteCart")) {
					String id = request.getParameter("id");
					prodotto bean = (prodotto) model.doRetrieveByKey(id);
					if (bean != null && !bean.isEmpty()) {
						carrello.deleteOggetto(bean);
						request.setAttribute("message", "Product " + bean.getNome() + " deleted from cart");
					}
				}
			
		} catch (SQLException | NumberFormatException e) {
			utility.print(e);
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("carrello", carrello);
		request.getSession().setAttribute("nomeprod", nome);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/homepage.jsp");
		dispatcher.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
