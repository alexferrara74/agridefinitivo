package servlet;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AgriShop
 */
@WebServlet("/AgriShop")
public class AgriShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgriShop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Email = request.getParameter("Email");
		String password = request.getParameter("password");
		String RagioneSociale = request.getParameter("RagioneSociale");
		String P_iva = request.getParameter("P.Iva");
		
		String Indirizzo = request.getParameter("Indirizzo");
		
		
		if(Email.isEmpty() || password.isEmpty() || RagioneSociale.isEmpty() || 
			P_iva.isEmpty() ||	Indirizzo.isEmpty() )
		{
			RequestDispatcher req = request.getRequestDispatcher("Registrazione.jsp");
			req.include(request, response);
		}
		else
		{
			RequestDispatcher req = request.getRequestDispatcher("Registrazione_Success.jsp");
			req.forward(request, response);
		}
		doGet(request, response);
	}

}
