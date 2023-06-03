<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*"
    pageEncoding="ISO-8859-1"%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");

String email=request.getParameter("email");
PreparedStatement ps=con.prepareStatement("select email from userdata where email=?");
ps.setString(1,email);
ResultSet rs=null;

rs=ps.executeQuery();
if(rs.next()){
	%>
	
	<span style="color:red;">Email Already exist</span>
	
	
	
	<% 
}
else{
	%>
	

	
	<% 
}
%>
