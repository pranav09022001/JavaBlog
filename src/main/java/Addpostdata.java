 
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Addpostdata
 */
@MultipartConfig
@WebServlet("/Addpostdata")
public class Addpostdata extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
			
			
			String btn=request.getParameter("sub");
			if(btn.equals("Add Post")){
			
			String title=request.getParameter("title");
			String category=request.getParameter("category");
			String description=request.getParameter("desc");
			String date=request.getParameter("date");

			Part file=request.getPart("image");
			
			String imageFileName=file.getSubmittedFileName();
			System.out.println("Selected Image File Name : "+imageFileName);
			String uploadPath="D:/CNC PROGRAMING/advjava/JavaBlog/src/main/webapp/images/"+imageFileName;
			System.out.println("Upload Path : "+uploadPath);
			
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
				
			PreparedStatement ps=con.prepareStatement("insert into post(title,category,description,imageFileName,date) values(?,?,?,?,?)");
			
			ps.setString(1, title);
			ps.setString(2,category);
			ps.setString(3,description);
			ps.setString(4,imageFileName);
			ps.setString(5, date);
			
			ps.executeUpdate();
			
			HttpSession session=request.getSession();
			session.setAttribute("status", "done");
			response.sendRedirect("AdminDashboard.jsp");
			
			
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
