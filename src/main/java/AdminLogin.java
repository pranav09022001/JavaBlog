

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String uname=request.getParameter("uname");
		String password=request.getParameter("pass");
		
		if(uname.equals("pranav") && password.equals("12345")) {
			HttpSession session=request.getSession();
			session.setAttribute("pranav", uname);
			session.setAttribute("status","is valid");
			response.sendRedirect("AdminDashboard.jsp");
		}
		else {
			HttpSession session=request.getSession();
			
			RequestDispatcher rd=request.getRequestDispatcher("/Adminlogin.jsp");
			session.setAttribute("status","failed");
			rd.include(request, response);
		}
	}

}
