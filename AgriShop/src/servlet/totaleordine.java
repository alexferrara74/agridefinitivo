package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import model.prodotto;

/**
 * Servlet implementation class totaleordine
 */
@WebServlet("/totaleordine")
public class totaleordine extends HttpServlet {
	private static final long serialVersionUID = 1L;
	float cont=0;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String contanti= request.getParameter("contanti");
		String totale= request.getParameter("action");

		Carrello<prodotto> carrello = (Carrello<prodotto>) request.getSession().getAttribute("carrello");
		
		
		if(carrello!=null) {
		
			if(contanti!=null) {
				cont=Float.parseFloat(contanti);
			
			}
	
		StringBuffer risposta=new StringBuffer();
		
		if(totale!=null&&totale.equals("totale")) {
			
			
			float valore=carrello.getValorecarrello();
			valore=valore+cont;
			carrello.setValorecarrello(valore);
			cont=0;
			risposta.append(+carrello.getValorecarrello());
			
			
			
			
			response.getWriter().write(risposta.toString());
		}
		}

	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
