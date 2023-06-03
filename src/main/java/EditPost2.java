

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
 * Servlet implementation class EditPost2
 */
@MultipartConfig
@WebServlet("/EditPost2")
public class EditPost2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
			
			
			String btn=request.getParameter("sub");
			if(btn.equals("submit")){
				
				int pid=Integer.parseInt(request.getParameter("pid"));
				String title=request.getParameter("title");
				String category=request.getParameter("category");
				String description=request.getParameter("desc");
				String date=request.getParameter("date");
				
				Part file=request.getPart("image");
				
				
				String imageFileName=file.getSubmittedFileName();
				String uploadPath="D:/CNC PROGRAMING/advjava/JavaBlog/src/main/webapp/images/"+imageFileName;
				
				FileOutputStream fos=new FileOutputStream(uploadPath);
				InputStream is=file.getInputStream();
				
				byte[] data=new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
				
				PreparedStatement ps=con.prepareStatement("update post set title=?,category=?,description=?,date=?,imageFileName=? where pid=?");
				ps.setString(1,title);
				ps.setString(2,category);
				ps.setString(3,description);
				ps.setString(4,date);
				ps.setString(5,imageFileName);
				ps.setInt(6,pid);
				
				
				
				
				
				
				ps.executeUpdate();
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("status","true");
				response.sendRedirect("ManagePost.jsp");
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
