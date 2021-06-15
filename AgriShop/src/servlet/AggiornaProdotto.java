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

import model.ProductModelDS;
import model.prodotto;
import utils.utility;

/**
 * Servlet implementation class AggiornaProdotto
 */
@WebServlet("/AggiornaProdotto")
public class AggiornaProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		prodotto prod= new prodotto();
		
		Float prezzo=(Float.parseFloat(request.getParameter("prezzo")));
		String nome=request.getParameter("nome");
		String SSN=request.getParameter("Ssn");
		Integer disponibilita= (Integer.parseInt(request.getParameter("disponibilita")));
		String descrizione=request.getParameter("descrizione");
		String categ=request.getParameter("categoria");
		String idfoto=request.getParameter("idfoto");
		
		

				if(prezzo!=null)
				prod.setPrezzo(prezzo);
			
		
			if(nome!=null) {			
				if(!nome.equals("")) {
					prod.setNome(nome);
				}}
		
		if(SSN!=null) {			
		if(!SSN.equals("")) {
			prod.setSsn(SSN);
		}
		}
		if(disponibilita!=null) {
			prod.setQuantita(disponibilita);;
		}
		
		if(descrizione!=null) {
		if(!descrizione.equals("")) {
			prod.setDescrizione(descrizione);
		}}
		
		if(!categ.equals("")) {
			prod.setCtegoria(categ);
		}
		
		if(idfoto!=null) {
			if(!idfoto.equals("")){
				prod.setIdfoto(idfoto);;
			}}
	
		try {
			 model.doUpdate(prod);
			
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
		}
		
	
	
		
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/homepage.jsp");
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