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

import model.LoginModelDS;
import model.Negozio;
import model.ProductModelDS;
import model.prodotto;
import utils.utility;

/**
 * Servlet implementation class AdminPage
 */
@WebServlet("/AdminPage")
public class AdminPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataSource ds= (DataSource) getServletContext().getAttribute("DataSource");
		ProductModelDS model= new ProductModelDS(ds);
		prodotto prod=(prodotto) request.getSession().getAttribute("prod");
		
		Float prezzo= (Float.parseFloat(request.getParameter("prezzo")));
		String nome=request.getParameter("nome");
		String SSN=request.getParameter("Ssn");
		Integer disponibilit√= (Integer.parseInt(request.getParameter("disponibilit√")));
		String descrizione=request.getParameter("descrizione");
		String categ=request.getParameter("categ");
		String idfoto=request.getParameter("idfoto");
		
		if(prezzo!=null) {			
			if(!prezzo.equals("")) {
				prod.setPrezzo(prezzo);;
			}}
		
			if(nome!=null) {			
				if(!nome.equals("")) {
					prod.setNome(nome);
				}}
		
		if(SSN!=null) {			
		if(!SSN.equals("")) {
			prod.setSsn(SSN);
		}
		}
		if(disponibilit√!=null) {
		if(!disponibilit√.equals("")){
			prod.setQuantita(disponibilit√);;
		}}
		
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
			 model.doSave(prod);
			
		} catch (SQLException e) {
			utility.print(e);
			
			request.setAttribute("error", e.getMessage());
		}
		
		if(request.getSession() !=null) {
			request.getSession().invalidate();
		}
		
	
		
		RequestDispatcher dispacher=this.getServletContext().getRequestDispatcher("/Login.jsp");
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
