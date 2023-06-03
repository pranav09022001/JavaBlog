

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Userlogin
 */
@WebServlet("/Userlogin")
public class Userlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
			
			String btn=request.getParameter("Login");
			if(btn.equals("Login")){
			String email=request.getParameter("email");
			String pass=request.getParameter("pass");
				
				
			PreparedStatement ps=con.prepareStatement("select name,email,password,uid from userdata where email=? AND password=?");
			ps.setString(1,email);
			ps.setString(2,pass);
			ResultSet rs=null;
			
			rs=ps.executeQuery();
			if(rs.next()){
				HttpSession session=request.getSession();
				session.setAttribute("uemail",rs.getString("email"));
				session.setAttribute("uname",rs.getString("name"));
				session.setAttribute("uid",rs.getInt("uid"));
				session.setAttribute("status", "is valid");
				
				response.sendRedirect("UserDashboard.jsp");
				
				
			}
			else{
				//out.print("<h3 style='color:red;'>Please fill correct details</h3>");
				//out.print("<script>alert('Please eneter correct details..')</script>");
				HttpSession session=request.getSession();
				session.setAttribute("status", "is not valid");
				RequestDispatcher rd=request.getRequestDispatcher("/Userlogin.jsp");
				rd.include(request,response);
			}
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		
	}

}
