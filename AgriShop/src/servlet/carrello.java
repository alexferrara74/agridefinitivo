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
import model.*;
import utils.utility;



@WebServlet("/carrello")
public class carrello extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		DataSource ds = (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model = new ProductModelDS(ds);

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
					String id = request.getParameter("id");
					request.removeAttribute("product");
					request.setAttribute("prodotti", model.doRetrieveByNome(id));
				} else if (action.equals("addcarrello")) {
					String id = request.getParameter("nome");
					prodotto bean = (prodotto) model.doRetrieveByNome(id);
					if (bean != null && !bean.isEmpty()) {
						carrello.addOggetto(bean);
						request.setAttribute("message", "Product " + bean.getNome() + " added to cart");
					}
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
				}}
			
		} catch (SQLException | NumberFormatException e) {
			utility.print(e);
			request.setAttribute("error", e.getMessage());
		}

		
		request.setAttribute("carrello", carrello);


		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/carrello.jsp");
		dispatcher.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
