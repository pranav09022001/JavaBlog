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
        margin-bottom:0px !important;
        }
        </style>
   




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
function EmailVerify(){
	  
	//let com=document.getElementById("comment"+pid).value;
	let email=document.getElementById("email").value;
	let xmlHttp=new XMLHttpRequest();
	
	xmlHttp.open("GET","EmailVerify.jsp?email="+email,true);
	xmlHttp.send();
	
	 

	
	xmlHttp.onreadystatechange=function(){
		if(this.readyState==4){
			
			document.getElementById("emailmessage").innerHTML=this.responseText;
		
			/*let em=document.getElementById("emailmessage").innerText;
			console.log(em);
			
			if(em==""){
				 //$("#sub").attr("disabled",false);
			}
			else{
				 //$("#sub").attr("disabled",true);
			}
			*/
		}	
	}	
}


$(document).ready(function(){
	
	 
	
	
	  $('#password').on('keyup', function(event){
		  event.preventDefault();
	    var password = $("#password").val();
	    var confirmPassword = $('#cpass').val();
	    var passwordLength = password.length;
	    var hasUppercase = /[A-Z]/.test(password);
	    var hasLowercase = /[a-z]/.test(password);
	    var hasNumber = /\d/.test(password);
	    var hasSpecialChar = /[-@#!$%^&*()_+|~=`{}\[\]:";'<>?,.\/]/.test(password);

	    
	    if(!hasUppercase) {
		      $('#password-message').text('Password should have uppercase letter').css('color', 'red');
		    }
	    else if(!hasNumber) {
		      $('#password-message').text('Password should have one number letter').css('color', 'red');
		    }
	    else if(!hasLowercase) {
		      $('#password-message').text('Password should have atleast one lowercase letter').css('color', 'red');
		    }
	    else if(!hasSpecialChar) {
		      $('#password-message').text('Password should have special Character').css('color', 'red');
		    }
	  
	    else if(passwordLength <8) {
	      $('#password-message').text('Password should be greater than 8').css('color', 'red');
	    }
	    
	    
	    else if(passwordLength >= 8 && hasUppercase && hasLowercase && hasNumber && hasSpecialChar) {
	        $('#password-message').text('Password is strong').css('color', 'green');
	        
	        
	        }
	    
	    
	    else {
	      $('#password-message').text("");
	    }
	    
	    if(password === confirmPassword && confirmPassword.length > 0) {
	        $('#cp-message').text('Passwords match').css('color', 'green');
	        //$("#sub").attr("disabled",false);
	      }
	    else if(confirmPassword==""){
	    	$('#cp-message').text('');
	    }else {
	        $('#cp-message').text('Passwords do not match').css('color', 'red');
	       // $("#sub").attr("disabled",true);
	      }
	  });
	  
	  $('#cpass').on('keyup', function(){
		  var password = $('#password').val();
		    var confirmPassword = $('#cpass').val();

		    if(password === confirmPassword && confirmPassword.length > 0) {
		      $('#cp-message').text('Passwords match').css('color', 'green');
		     // $("#sub").attr("disabled",false);
		    }
		    else if(confirmPassword==""){
		    	$('#cp-message').text('');
		    }
		 	else {
		      $('#cp-message').text('Passwords do not match').css('color', 'red');
		     // $("#sub").attr("disabled",true);
		    }
		  });
	  
	  
	  
	  
 		$('input').on('keyup', function(){
		  
		  var pm = document.getElementById("password-message").innerText;
		    var cpm = document.getElementById("cp-message").innerText;
		    var em = document.getElementById("emailmessage").innerText;
		  
		    if(pm=="Password is strong" && cpm=="Passwords match" && em==""){
		    	
		    	$("#sub").attr("disabled",false);
		    	
		    }
		    else{
		    	$("#sub").attr("disabled",true);
		    }
		  
	  });
});
	
	
</script>

</head>
<body>

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

<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class=" container cont">
				<div class="signin-content">
					<div class="signin-image" style="margin-top:100px;">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						
					</div>

					<div class="signin-form">
						<h2 class="form-title" style="font-weight:900;text-align:center;font-family: verdana ;">SIGN UP</h2>
						
						<form  name="f1" action="UserRegistration.jsp" id="form">
						<div class="form-group">
						<input style="font-size:16px; font-family:verdana;"  type="text" name="name" placeholder="Enter Name"  required>&nbsp;<span id="name-message" ></span>
						</div>
						
						
						
						<div class="form-group">
				<input style="font-size:16px;font-family:verdana;"   placeholder="Enter Email" type="email" name="email" onkeyup="EmailVerify()"  id="email" required>&nbsp;<span id="emailmessage" ></span>
				</div>
					<div class="form-group">
				<input style="font-size:16px;font-family:verdana;"   placeholder="Enter Password" type="text" name="pass" id="password" required >&nbsp;<span id="password-message"></span>
				</div>
				
				<div class="form-group">
						<input style="font-size:16px;font-family:verdana;"  placeholder="Enter Confirm Password"  type="text" name="cpass" id="cpass" required>&nbsp;<span id="cp-message"></span>
						</div>
						
				
				
				<div class="form-group">
					<input style="font-size:16px;font-family:verdana;"  placeholder="Enter No"  type="text" name="mob" required >&nbsp;<span id="mob-message"></span>
						</div>
						
						<div class="form-group">
						<input style="font-size:16px;font-family:verdana;"  placeholder="Enter DOB"  type="Date" name="dob" required>&nbsp;<span id="dob-message"></span>
						</div>
						
				
				<input class="btn btn-primary" type="submit" name="sub" value="Submit"  id="sub" disabled ><br>
				<p style="color:black;padding-top:20px;font-family:verdana;">Already User?&nbsp;<a href="Userlogin.jsp">Login Here..</a></p>
				
				
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
	if(status=="is not valid"){
		swal("Sorry","Wrong Email & Password","error");
		<% session.setAttribute("status","");
		%>
		
		
	}
	
	
	</script>




</body>
</html>










