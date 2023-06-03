
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	
    import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
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
	String uploadPath="D:/CNC PROGRAMING/advjava/JavaBlog/src/main/webapp/images"+imageFileName;
	
	FileOutputStream fos=new FileOutputStream(uploadPath);
	InputStream is=file.getInputStream();
	
	byte[] data=new byte[is.available()];
	is.read(data);
	fos.write(data);
	fos.close();
		
	PreparedStatement ps=con.prepareStatement("insert into post(title,category,description,date) values(?,?,?,?)");
	
	ps.setString(1, title);
	ps.setString(2,category);
	ps.setString(3,description);
	ps.setString(4, date);
	
	ps.executeUpdate();
	
	session=request.getSession();
	session.setAttribute("status", "done");
	response.sendRedirect("AdminDashboard.jsp");
	
	
%>
<!-- <script>alert("Data updated Sucessfully.."); window.location='AdminDashboard.jsp';</script>  -->
<%
	}
%>

</body>
</html>