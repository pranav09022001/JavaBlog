<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
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
if(btn.equals("submit")){
	
	int pid=Integer.parseInt(request.getParameter("pid"));
	String title=request.getParameter("title");
	String category=request.getParameter("category");
	String description=request.getParameter("desc");
	String date=request.getParameter("date");
	
	PreparedStatement ps=con.prepareStatement("update post set title=?,category=?,description=?,date=? where pid=?");
	ps.setString(1,title);
	ps.setString(2,category);
	ps.setString(3,description);
	ps.setString(4,date);
	ps.setInt(5,pid);
	
	ps.executeUpdate();
	
	session=request.getSession();
	session.setAttribute("status","true");
	response.sendRedirect("ManagePost.jsp");
}
%>


</body>
</html>