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
        *{
         
        padding:0px; 
        margin:0px;
        }
       
        #fom{
        height:400px;
        padding-top:200px;
        }
        
      
        
        @media (min-width: 768px){
        .navbar-brand{
        margin-left:35%;
        font-size:40px;
        text-shadow:4px 4px black;
        }
        .navbar-header{
        padding-bottom:3% !important;
        background: #363e50 !important;
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
       
        background: #363e50 !important;
        }
         .navbar-brand{
        
        text-shadow:4px 4px black;
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

<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class=" container cont">
				<div class="signin-content" style="padding-top: 90px;">
					<div class="signin-image" style="margin-left: 0px; margin-right:0px;" >
						<figure>
							<img src="images/admin.gif" alt="sing up image" >
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title" style="font-weight:900;text-align:center;font-family: verdana ;">ADMIN LOGIN</h2>
						
						<form action="AdminLogin" method="post" >
						<div class="form-group">
				<input style="font-size:16px;font-family:verdana;" placeholder="Enter Admin Name" type="text" name="uname" >
				</div>
					<div class="form-group">
				<input style="font-size:16px;font-family:verdana;"   placeholder="Enter password" type="password" name="pass" id="password"><span id="password-message"></span>
				</div><br>
				
				<input class="btn btn-primary" type="submit" name="submit" value="SUBMIT"><br><br>
				<p style="font-family:verdana;color:black;">Not an Admin?&nbsp;<a href="Userlogin.jsp">User Login..</a></p>
				 
						</form>
						
					
					</div>
				</div>
			</div>
		</section>

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
        
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	var status=document.getElementById("status").value;
	console.log(status);
	if(status=="failed"){
		swal("Sorry","Wrong Admin Name & Password","error");
		<% session.setAttribute("status","");
		%>
		
		
	}
	
	
	</script>
        
</body>
</html>  
