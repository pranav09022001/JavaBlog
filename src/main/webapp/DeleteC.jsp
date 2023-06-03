<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
int id=Integer.parseInt(request.getParameter("id"));
int uid=Integer.parseInt(request.getParameter("uid"));
PreparedStatement psd=con.prepareStatement("delete from usercomment where id=? and uid=?");
psd.setInt(1,id);
psd.setInt(2,uid);

psd.executeUpdate();

String name=(String)session.getAttribute("uname");

int Uid=(Integer)session.getAttribute("uid");

PreparedStatement ps=con.prepareStatement("select * from post");
ResultSet rs=null;
rs=ps.executeQuery();
%>



<%
while(rs.next()){
%>
<div style= "margin-bottom:50px;background:white;">
<div style="padding:30px;">
	<img src="images/<%=rs.getString("imageFileName") %>" style="height:500px;width:100%;">
	<h1 style="font-weight:600"><%=rs.getString("Title") %></h1>
	<h4><%=rs.getString("Date") %></h4>
	<h3 style="text-transform:uppercase"><%=rs.getString("Category") %></h3>
	<p><%=rs.getString("Description") %></p><br>
	
	
	<%
	PreparedStatement lps2=con.prepareStatement("select count(likes) from likes where pid=?");
	lps2.setInt(1,rs.getInt("pid"));
	ResultSet lrs2=null;
	lrs2=lps2.executeQuery();
	%>
	
	<%
	PreparedStatement lps=con.prepareStatement("select * from userdata where name=?");
	lps.setString(1, name);
	
	ResultSet lrs=null;
	lrs=lps.executeQuery();
	if(lrs.next()){	
	%>
	<img src="images/like.png" onClick="Like(<%=rs.getInt("pid") %>,<%=lrs.getInt("uid") %>)">
	
	<img src="images/dislike.png" onClick="DisLike(<%=rs.getInt("pid") %>,<%=lrs.getInt("uid") %>)">
	<%
	} 
	%>
	<span id="Like<%=rs.getInt("pid") %>">
	<% 
	if(lrs2.next()){
		%>
		<span id="like<%=rs.getInt("pid") %>" style="font-size:20px; font-weight:bold;"><%=lrs2.getInt("count(likes)") %><span style="font-size:20px; font-weight:bold;">Likes</span></span>
	<%
	}
	else{
	 %>
	 <span id="like<%=rs.getInt("pid") %>">0</span><span>Likes</span>
	 <% 
	}
	
	%>
	</span><br><br>
	
	<%
	PreparedStatement psc=con.prepareStatement("select * from userdata where name=?");
	psc.setString(1,name);
	ResultSet rsc=null;
	rsc=psc.executeQuery();
	if(rsc.next()){	
	%>
	<form  name="f1" method="get">
	<input type="hidden" name="cid" value="<%=rs.getInt("pid") %>" id="cc">
	
	<input type="hidden" name="uid" value="<%= rsc.getInt("uid")%>">
	<input style="border-radius:5px;height:30px;" type="text" id="comment<%= rs.getInt("pid")%>">&nbsp;
	<img src="images/chat.png" onClick="AddCom(<%= rs.getInt("pid")%>,<%= rsc.getInt("uid")%>)"><br><br>
	 
<%
	}
	PreparedStatement ps2=con.prepareStatement("select * from usercomment where cid=?");
	ps2.setInt(1, rs.getInt("pid"));
	ResultSet rs2=null;
	
	rs2=ps2.executeQuery();
	while(rs2.next()){
	%> 
	
	<!--  forcomment delete-->
	<%
	PreparedStatement ps5=con.prepareStatement("Select * from userdata where name=?");
	ps5.setString(1,name);
	ResultSet rs5=null;
	rs5=ps5.executeQuery();
	%>
	<p id="com<%=rs.getInt("pid")%>" ><img src="images/cuser.png">&nbsp;<span id="del"><%=rs2.getString("comment")%></span> 
	<%
	if(rs5.next()){
			%>  
			<%
			if(Uid==rs2.getInt("uid")){
				
				%>
			
			
		
			<img src="images/delete.png"  onclick="Delete(<%= rs2.getInt("id")%>,<%=rs5.getInt("uid") %>)">
			
			<%
			}
		}
	%>
	</p>
	<%
		
	}
	%>
	
	<%
	

%>
	
	
</form>
</div>
</div>

<%
}
%>
