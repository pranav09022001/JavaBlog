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

	int uid=Integer.parseInt(request.getParameter("uid"));

	int pid=Integer.parseInt(request.getParameter("pid"));
	PreparedStatement pl=con.prepareStatement("select * from likes where uid=? and pid=?");
	pl.setInt(1,uid);
	pl.setInt(2,pid);
	
	ResultSet rl=null;
	rl=pl.executeQuery();
	
	if(rl.next()){
		PreparedStatement pl2=con.prepareStatement("update likes set likes=1 where pid=? and uid=?");
		pl2.setInt(1,pid);
		pl2.setInt(2,uid);
		
		pl2.executeUpdate();
	}
	else{
		PreparedStatement pl2=con.prepareStatement("insert into likes(pid,uid,likes) values(?,?,?)");
		pl2.setInt(1,pid);
		pl2.setInt(2,uid);
		pl2.setInt(3,1);
		
		pl2.executeUpdate();
	}
	
	PreparedStatement ps=con.prepareStatement("select * from likes where pid=?");
	ps.setInt(1,pid);
	ResultSet rs=null;
	rs=ps.executeQuery();
	
	PreparedStatement lps2=con.prepareStatement("select count(likes) from likes where pid=?");
	lps2.setInt(1,pid);
	
	ResultSet lrs2=null;
	lrs2=lps2.executeQuery();

	if(rs.next()){
	if(lrs2.next()){
		%>
		
		<span style="font-size:20px; font-weight:bold; id="like<%=rs.getInt("pid") %>"><%=lrs2.getInt("count(likes)") %><span style="font-size:20px; font-weight:bold;">Likes</span></span>
	<%
	}
	else{
	 %>
	 <span id="like<%=rs.getInt("pid") %>">0</span><span>Likes</span>
	 <% 
	}
	}
%>
</body>
</html>