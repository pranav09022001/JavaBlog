<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="java.sql.*" 
import="javax.servlet.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
        <title>Blog Master</title>
    	<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/blogstyle.css">
        

        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<style>
*{
font-family:verdana;
}
</style>
 <link rel="stylesheet" href="alert/dist/sweetalert.css">
<script>
function AddCom(pid,uid){
	let com=document.getElementById("comment"+pid).value;
	if(com==""){
		alert("please enter comment");
		}
	else{
	let xmlhttp=new XMLHttpRequest();
	xmlhttp.open("GET","AddComment.jsp?com="+com+"&cid="+pid+"&uid="+uid+"",true);
	xmlhttp.send();
	
	xmlhttp.onreadystatechange=function(){
		if(this.status==200){
			
			document.getElementById("result").innerHTML=this.responseText;
			
		}
	}
}
}          
function Delete(id,uid){




	let xmlHttp=new XMLHttpRequest();
	xmlHttp.open("GET","DeleteC.jsp?id="+id+"&uid="+uid+"",true);
	xmlHttp.send();

	xmlHttp.onreadystatechange=function(){
		if(this.status==200){
			
			//window.location='UserDashboard.jsp';
			//window.location='UserDashboard.jsp#com'+id; 
			
			document.getElementById("result").innerHTML=this.responseText;
			
		}
	}
		

}
function Like(pid,uid){
	let xmlHttp=new XMLHttpRequest();
	xmlHttp.open("GET","Like.jsp?pid="+pid+"&uid="+uid+"",true);
	xmlHttp.send();

	xmlHttp.onreadystatechange=function(){
		if(this.status==200){

			document.getElementById("Like"+pid).innerHTML=this.responseText;
			
		}
	}
	
}

function DisLike(pid,uid){
	let xmlHttp=new XMLHttpRequest();
	xmlHttp.open("GET","DisLike.jsp?pid="+pid+"&uid="+uid+"",true);
	xmlHttp.send();

	xmlHttp.onreadystatechange=function(){
		if(this.status==200){

			document.getElementById("Like"+pid).innerHTML=this.responseText;
			
		}
	}
	
}
</script>
</head>
<body>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
	
	String name=(String)session.getAttribute("uname");
	int Uid=(Integer)session.getAttribute("uid");
	
	PreparedStatement ps=con.prepareStatement("select * from post");
	ResultSet rs=null;
	rs=ps.executeQuery();
%>
<input type="hidden" id="status" value="<%= session.getAttribute("status")%>">



 


        <div class="banner" style="background-image: url(images/user.jpg) !important;
         background-repeat: no-repeat;
         background-size:cover;
         background-position: center center;">
          <div class="site-main" id="sTop">
            <div class="site-header">
         <div class="main-header" >
            <div class="container">
            <div id="menu-wrapper"  style="" >
            <div class="row" class="navbar-header stick-top" style="" >
                                
                 <div  style="height:60px;"  class="col-12 col-lg-6 col-md-6 col-sm-12">
                            
                     <a href="MainPage.jsp" class="navbar-brand" style="font-size:35px;margin-top:20px;">Blog Master</a>
                                        
                  </div>
                     <div  class="text-right" style="padding-right:50px;"  class="col-12 col-lg-6 col-md-6 col-sm-12">
                     <div style="padding:30px;text-transform:uppercase;">
                      <span class="btn btn-info btn-lg"><%=name %></span> 
                      <a href="Logout"><img src="images/logout.png"></a>
                      </div>                             
                     </div> 
                    </div>                
                </div> 
                </div>
                </div>
                </div>
                </div>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="banner-content">
                           
                            <h2>BLOG MASTER</h2>
							<h6>Creativity, Clarity, Happiness</h6>
							<br>
                           
                        </div>
                    </div>
                </div>
            </div>
        



<div class="container-fluid" style="background:#ECF1F1 ">
<div style="padding:50px;">
<div class="row">
<div class="col-12 col-xl-8 col-lg-8 col-md-12 col-sm-12" style="">

<div id="result">
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
</div><!--result div close-->

</div>
<div class="col-12 col-xl-4 col-lg-4 col-md-12 col-sm-12" style="background:white;">
<div  style="background:black;height:50px;text-align:center;">
<h2 style="color:white;line-height:50px;font-weight:bold;">ABOUT ME</h2>
</div>
<div align="center" style="padding:20px">
<img src="images/man.png">
</div>
<div  align="center">
<h1>Pranav Pokharkar</h1>
<p>I am Full Stack Developer. I have done bachleors of engineering in Information Technology from Shivajirao Jondhale College Of Engineering.</p>
<p>Technical Skills:JAVA,HTML5,CSS3,SQL,JAVASCRIPT,<br>REACT,BOOTSTRAP,JQUERY.</p>
</div>

<div style="background:black;height:50px;text-align:center;margin-top:50px;">
<h2 style="color:white;line-height:50px;font-weight:bold;">FOLLOW US</h2>

</div>
<div align="center">
<div style="padding:30px;">
<a href="https://www.facebook.com" target="_blank"><img src="images/facebook.png" style="margin-right:30px;"></a>
<a href="https://www.instagram.com" target="_blank"><img src="images/instagram.png" style="margin-right:20px;"></a>
 <a href="https://www.twitter.com" target="_blank"><img src="images/twitter.png" style="margin-right:20px;"></a>
 <a href="https://www.youtube.com" target="_blank"><img src="images/youtube.png" style="margin-right:20px;"></a>
 </div>
</div>
</div>
</div>
</div>
</div>


 <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-12">
					
                            <h2><a href="#top" class="footname">Blog Master</a></h2>
							<h4 style="color:white;">@all rights are reserved..</h4>
							<h5 style="color:white;">Developed By-Pranav Pokharkar</h5>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <ul class="social-icons">
                            <li><i class="fa fa-facebook" style="padding-top:10px;font-size:20px; display:inline;color:white"></i>&nbsp;&nbsp;&nbsp;<a href="#">Facebook</a></li>
                            <li><i class="fa fa-twitter" style="padding-top:10px;font-size:20px; display:inline;color:white"></i>&nbsp;&nbsp;&nbsp;<a href="#">Twitter</a></li>
                            <li><i class="fa fa-linkedin" style="padding-top:10px;font-size:20px; display:inline;color:white"></i>&nbsp;&nbsp;&nbsp;<a href="#">Linkedin</a></li>
                            <li><i class="fa fa-instagram" style="padding-top:10px;font-size:20px; display:inline;color:white"></i>&nbsp;&nbsp;&nbsp;<a href="#">Instagram</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-md-offset-2 col-sm-12">
                        <div class="back-to-top">
                            <a href="#top">
                                <i class="fa fa-angle-up"></i>
                                back to top
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        

 <script src="js/vendor/jquery-1.11.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script>
        <script src="js/bootstrap.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
		
		 <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
	  
	  
	  <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

        <!-- Google Map -->
        <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
        <script src="js/vendor/jquery.gmap3.min.js"></script>

        <script type="text/javascript">
        $(document).ready(function() {
            
            // mobile nav toggle
            $('#nav-toggle').on('click', function (event) {
                event.preventDefault();
                $('#main-nav').toggleClass("open");
            });
        }); 
        </script>




 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	
	if(status=="is valid"){
		swal("Congrats","Login Successfully","success");
		

		//document.getElementById("status").value="";
		<% session.setAttribute("status","");
		%>
		
		
		
	}
</script>
</body>
</html>