<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Blog Master</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
       
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/blogstyle.css">
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
       
        <!-- Font Icon -->


<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
        

        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
        <style>
        *{
         backgorund:#ECF1F1 ;
        padding:0px; 
        margin:0px;
        }
       
        
        @media (min-width: 768px){
        .navbar{
        border-radius:0 !important;
        }
        .navbar-brand{
        margin-left:20%;
        font-size:40px;
       
        }
        .navbar-header{
        padding-bottom:3% !important;
        background: white !important;
        }
        }
        h4{
        font-family: verdana ;
        }
        .btn{
        font-size:16px;
        font-family:verdana;
        }
  
         .navbar-brand{
        
        text-shadow:2px 2px 2px black;
        }
        .form-group{
        margin-bottom:15px !important;
        }
        .navbar-inverse {
    	background-color:white !important;
        </style>
   
</head>
<body>
<input type="hidden" id="status" value="<%= session.getAttribute("status")%>">
<!-- Header -->
 <div class="site-main" id="sTop">
            
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row text-center">
                            <div class="col-lg-12 col-xl-12 col-sm-12 col-md-12 ">
                                <nav class="navbar navbar-inverse" role="navigation">
                                    <div class="navbar-header text-center" >
                                        
                                        <a href="MainPage.jsp" class="navbar-brand" style=" ">Blog Master</a>
                                       
                                    </div>
                                </nav>
                                </div>
                            </div> 
                           </div>                  
                    </div> 
                
            </div> 
        </div> 

<!-- Header end -->

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/pranav","root","12345");
PreparedStatement ps=con.prepareStatement("select * from post");
ResultSet rs=null;

rs=ps.executeQuery();
%>
<div>
<div class="row" >
<div class="col col-xl-12 col-lg-12 col-sm-12 col-md-12" style="height:500px; width:100%;background:url(images/mmm.jpg);
         background-repeat: no-repeat;
         background-size: cover;
		background-position: center center;">
		
		<div  align="center" style=" margin-top:220px;">
                               		
                                    
                                        <a href="ManagePost.jsp" style="font-family:'Source Sans Pro', sans-serif;font-size: 50px;
                                     font-weight: 900 ;color:white;text-shadow:3px 4px 2px black;">
                                    MANAGE ALL POST</a>
                                    
                                    </div>

</div>
</div>
</div>



<div style="background:#ECF1F1;" class="container-fluid ">
<%
while(rs.next()){
%>
 <div style=" border-radius:10px; padding-left:20px; margin:50px; background:white; ">
 	<div class="row">
 	<div class="col-12 col-xl-5 col-lg-5 col-md-12 col-sm-12" > 
 	<img src="images/<%=rs.getString("imageFileName") %>" style="height:400px;width:100%; padding:50px;padding-bottom:20px; ">
 	<div style="padding:50px;" class="text-center">
	
	<a href=DeletePost.jsp?id=<%=rs.getInt("pid")%> style=""><img src="images/recycle-bin.png"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href=EditPost.jsp?id=<%=rs.getInt("pid") %>> <img src="images/edit.png"></a>
	</div>
 	</div>
 	
 	
 	<div class="col-12 col-xl-7 col-lg-7 col-md-12 col-sm-12 " style=" padding:50px; ">
 	<div>
 	<h1 style="font-size:60px; font-weight:700; color:black; text-transform:uppercase;"><%=rs.getString("Title") %></h1>
 	</div>
 	<div style="">
	<h3><%=rs.getString("Date") %></h3>
	</div>
	<div style=" ">
	<h3 style="font-weight:bold;font-size:30px;"><%=rs.getString("Category") %></h3>
	</div>
	
	<div  style="">
	<p><%=rs.getString("Description") %></p>
	</div>
	
	<div>
	<span style="font-weight:bold;font-size:30px;">Comments&nbsp;<img src="images/chat.png" style="padding:0px; margin-top:0px !important;"></span>
	<%
	PreparedStatement ps2=con.prepareStatement("select * from usercomment where cid=?");
	ps2.setInt(1, rs.getInt("pid"));
	
	ResultSet rs2=null;
	rs2=ps2.executeQuery();
	
	while(rs2.next()){
	%>
	
	<p style="font-size:20px;"><img src="images/cuser.png">&nbsp;&nbsp;<%=rs2.getString("comment") %></p>
	
	<%
	}
	%>
	</div>
	
	
</div>	
</div>
</div>
<%
}
%>

<div align="right" style="padding-right:50px;padding-bottom:20px;">
	<a  href="AdminDashboard.jsp"><img src="images/back.png">GO BACK</a>
	</div>

</div>





 <footer>
            <div class="container " style="">
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
        
        
        
         <!--SWEET ALERT JS-->
        
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
          
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
		<script type="text/javascript">
		var status=document.getElementById("status").value;
		
		console.log(status);
		if(status=="true"){
			swal("Congrats","Post Edited Successfully..","success");
			<% session.setAttribute("status","");
			%>
		}
	
	
	</script>
	<!--SWEET ALERT JS-->
        
</body>
</html>