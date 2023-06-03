<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
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
	int id=Integer.parseInt(request.getParameter("id"));
	PreparedStatement ps=con.prepareStatement("delete from post where pid=?");
	ps.setInt(1,id);
	
	ps.executeUpdate();
	
	%>
	
	<script>alert("Data updated Sucessfully.."); window.location='ManagePost.jsp';</script>
	
</body>
</html>