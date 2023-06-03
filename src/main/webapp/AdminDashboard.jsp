<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Blog Master</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/templatemo_misc.css">
        <link rel="stylesheet" href="css/blogstyle.css">
        <link rel="stylesheet" href="alert/dist/sweetalert.css">
       
        <!-- Font Icon -->


<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
        
	
        <script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
        <style>
        .modal-header .close {
    margin-top: -30px;
}
        *{
         
        padding:0px; 
        margin:0px;
        }
       
        #fom{
        height:400px;
        padding-top:200px;
        }
        
      
        #AdminMain{
        background:url(images/background.jpg); 
         background-repeat: no-repeat;
         background-size: cover;
		background-position: center center;
  		width:100%;
		  height:800px;
        }
        @media (min-width: 768px){
        .navbar-brand{
        margin-left:35%;
        font-size:40px;
        
        }
        .navbar-header{
        padding-bottom:3% !important;
       
        }
        }
        h4{
        font-family: verdana ;
        }
        .btn{
        font-size:16px;
        font-family:verdana;
        
        }
         .navbar-header{
   
		
        }
         .navbar-brand{
        
        text-shadow:2px 2px 2px black;
        }
        .form-group{
        margin-bottom:15px !important;
        }
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
                                    <div>
                                   
                                    </div>
                                </nav>
                                </div>
                            </div> 
                           </div>                  
                    </div> 
                
            </div> 
        </div> 

<!-- Header end -->

<!-- Main div -->
<%
if(session!=null){
	String uname=(String)session.getAttribute("pranav");
	
	%>


<div id="AdminMain">
<div class="container" >
<div class="row" >

<div>
                        <div class="banner-content">
                           
                            <h2 style="font-size:55px;font-family:'Open Sans', sans-serif;font-weight:900;margin-bottom:0px;text-shadow:3px 4px black">WELCOME ADMIN&nbsp;<%=uname %> </h2>
							
							<br>
                            <ul class="buttons" >
                                <li>
                                    
                                    <button type="button"  data-toggle="modal" data-target="#exampleModal" style="background:none;border:none;">
                                    <img src="images/add-file.png"><span style="font-family:'Source Sans Pro', sans-serif;font-size: 30px;
                                     font-weight: 900;color:white;text-shadow:3px 4px 2px black"">
                                    ADD POST 
                                    </span>
                                    <div >
                                    </div>
                                    </button>
                                        
                                    
                                </li>
                                <li>
                               		<button  style="background:none;border:none;" >
                               		
                                    
                                        <a href="ManagePost.jsp" style="font-family:'Source Sans Pro', sans-serif;font-size: 30px;
                                     font-weight: 900 ;color:white;text-shadow:3px 4px 2px black"">
                                     <img src="images/execute.png">MANAGE POST</a>
                                    
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>

</div>
</div>
</div>



<!-- MODAL -->




<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel" style="font-weight:900;">ADD NEW POST</h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true" style="font-size:40px;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="Addpostdata" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Title:</label>
            <input type="text" class="form-control" name="title" id="recipient-name" required>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Category:</label>
            <input type="text" name="category" class="form-control" id="message-text" required></input>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Description:</label>
            <input type="text" class="form-control" name="desc" id="recipient-name" required>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Image:</label>
            <input type="file" class="form-control"  name="image" id="recipient-name" required>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Date:</label>
            <input type="date" class="form-control"  name="date" id="recipient-name" required>
          </div>
          <div class="form-group">
          <input type="submit" value="Add Post" name="sub" class="btn btn-primary">
          </div>
        </form>
      </div>
     
    </div>
  </div>
</div>
	


	<%
}
else{
	response.sendRedirect("Adminlogin.html");
}
	%>
	
	
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	
	if(status=="is valid"){
		swal("Congrats","Admin Login Successfully","success");
		

		//document.getElementById("status").value="";
		<% session.setAttribute("status","");
		%>
	}
	
	if(status=="done"){
		swal("Congrats","Post Added Successfully","success");
		

		//document.getElementById("status").value="";
		<% session.setAttribute("status","");
		%>
	}
	
	
</script>
	
</body>
</html>