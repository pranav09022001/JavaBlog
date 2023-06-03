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

if(btn.equals("Submit")){
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pass=request.getParameter("pass");
	String mob=request.getParameter("mob");
	String dob=request.getParameter("dob");
	
	PreparedStatement ps=con.prepareStatement("insert into userdata(name,email,password,mobile_no,dob) values(?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, pass);
	ps.setString(4, mob);
	ps.setString(5, dob);
	
	ps.executeUpdate();
	
	session=request.getSession();
	session.setAttribute("status", "done");
	response.sendRedirect("Userlogin.jsp");
	


}
%>
</body>
</html>