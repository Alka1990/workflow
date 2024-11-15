 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page  import="java.util.Calendar"%>
<%@page  import="java.util.Calendar"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
 <link rel="shortcut icon" href="Images/logo1.jpeg">

 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>WorkFlow</title>
 <link rel="stylesheet" type="text/css" href="CSS1/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="CSS1/style.css">
 <link href="CSS1/font-awesome.css" rel="stylesheet" />
 <script src="JavaScript/jquery-1.9.1.js" > </script>
 <script type="text/javascript" src="JavaScript/bootstrap.js" ></script>
  <script type="text/javascript" src="JavaScript/jquery.min.js" ></script>

  
  <script src="JavaScript/tether.js"></script>
      <script src="JavaScript/bootstrap.js"></script>
      <style>
.header-menu-toggle{
    display:inline-block;
    width: 25px;
    height: 18px;
    transform: rotate(0deg);
    transition: .5s ease-in-out;
    cursor: pointer;
}

.humberger-line {
    display: block;
    position: absolute;
    height: 2px;
    width: 100%;
    background-color: #000000;
    opacity: 1;
    left: 0;
    transform: rotate(0deg);
    transition: .25s ease-in-out;
}
.humberger-line:nth-child(1) {
    top: 0px;
}
.humberger-line:nth-child(2) {
    top: 8px;
}
.humberger-line:nth-child(3) {
    top: 16px;
}
.header-menu-toggle.open .humberger-line:nth-child(1) {
    top: 8px;
    transform: rotate(135deg);
}
.header-menu-toggle.open .humberger-line:nth-child(2) {
    opacity: 0;
    left: -30px;
}
.header-menu-toggle.open .humberger-line:nth-child(3) {
    top: 8px;
    transform: rotate(-135deg);
}
      
      </style>
  
</head>
<body>
	
	<%
		Calendar now = Calendar.getInstance(); 
		if(session.getAttribute("username")!=null){
			session.removeAttribute("username");
			session.removeAttribute("password");
		}
	%>

<div class="modal fade" id="forgetpasswordmodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style=" background: none; border: none;">
         <div class="modal-body">
			<div class="popup-box">
					 <button type="button" class="close" data-dismiss="modal">&times;</button>
					      <div class="row" >  
            <div class="col-lg-4" ></div>
     
  <div class="col-lg-2" >    
		    <div class="form-group" >
		       <img src="Images/forgot-password.png" alt="car-key" border="0" style="width:80px; height:80px">
			 </div>
	   </div> 
	 </div>
					<h3>Forgot your password?</h3>
					<!-- <form action="ForgotPassword" method="post" id="frm"> -->
										<form >
					
					<div class="form-group"><input type="text" required="required" placeholder="Username" class="form-control" id="username" name="username" autofocus>
					</div>
					<div class="form-group"><input type="number" required="required" placeholder="Phone Number" pattern="[0-9]{10}" class="form-control" id="phoneNumber" name="phoneNumber" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="New Password" class="form-control" id="newpassword" name="newpassword" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="Confirm New Password" class="form-control" id="confirmnewpassword" name="confirmnewpassword">
					</div>
		
					<label class="text-danger error"   style="color:red" ></label>
					<div class="col-lg-12"><button type="button" id="forgotButton" class="btn btn-changepwd" >Change Password</button>
					</div>
					</form>
					</div>

        </div>
      </div>
    </div>
  </div>
  
  
<!--<nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse"  >
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand col-lg-2 col-4" href="#" ><img alt="ALIGNWISWE" src="http://alignwisesmile.com/images/logo.png" width="90%"> </a>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto" >
    	
    </ul>
     
   
  </div>
</nav>  -->


<header id="header">

        <div class="container">

            <div class="row">

                <div class="col-sm-2">

                    <div class="header-logo"   />

                        <a href="index.html">

                            <img src="Images/logo1.jpeg" alt="32 Watts Clear Aligners" style="width: 100px; height: auto;" />

                        </a>

                    </div>

                </div>

                <div class="col-sm-10">

                    <nav id="header-nav-wrap">

                        <ul class="header-main-nav">
                            <li>
                                <a href="http://www.32watts.com/" title="Patient">Patient</a>
                            </li>
                            <li>
                                <a href="http://www.32watts.com/orthodontist.html" title="Orthodontist">Dentist</a>
                            </li>
                            <li>
                                <a href="http://www.32watts.com/about.html" title="About">About</a>
                            </li>
                            <li>
                                <a href="https://blog.32watts.com/" target="blank" title="Blog">Blog</a>
                            </li>
                        </ul>
                    </nav>
                      <a class="header-menu-toggle" href="#">
                    <span class="humberger-line"></span>
                    <span class="humberger-line"></span>
                    <span class="humberger-line"></span>
                            </a>
                </div>
            </div>
        </div>
    </header>


<br>
<br>


<div class="login-bg">
<div class="container">
<h1>WorkFlow Login</h1>
<div class="login-form">
 <form name="login" id="login" method="post" action="login">
<div class="form-group">
<!--<label style="font-weight: bolder;">Username</label>-->
<label>Username</label>
<input type="text" name="user_id" id="user_id" class="" placeholder="Enter Username" autofocus>
</div>

<div class="form-group">
<label>Password</label>
<input type="password" name="password" id="passwordlgn" placeholder="Enter Password" value="">

<a  data-target="#forgetpasswordmodal" data-toggle="modal" class="link-forgotpwd">Forgot your password?</a>  <!-- data-target="#forgetpasswordmodal" -->
<!-- <input type="checkbox" onclick="myFunction()">Show Password -->
</div>

<div style="text-align: center;">
<button type="button" class="btn login-btn" name="loginButton" id="loginButton" value="Login" >Login</button>
</div>

<!--<div style="text-align: center;" ><b>New user?  <a href="Register.jsp">Start here.</a> </b></div>-->
</form>
</div> 

</div>
</div>


<footer>
        <div class="container">
            <div class="f-logo">
                <img src="Images/logoFooter1.png.png" alt="32 watts clear aligner"  style="width: 300px; height: auto;"/>
            </div>
            <div class="footer-links">
                <ul>
                    <li>
                        <a href="http://www.32watts.com/">Patient</a>
                    </li>
                    <li>
                        <a href="http://www.32watts.com/orthodontist.html">Orthodontists</a>
                    </li>
                    <li>
                        <a href="http://www.32watts.com/about.html">About</a>
                    </li>
                    <li>
                        <a href="https://blog.32watts.com/ target="blank" title="Blog">Blog</a>
                    </li>
                </ul>
            </div>
            
            
            <div class="copyright">
                <span>32 Watts</span>&copy;   <%=now.get(Calendar.YEAR)%> Renderwise Solutions pvt ltd. All Rights Reserved
            </div>
            <div class="footer-social">
                <ul>
                    <li>
                        <a href="https://www.facebook.com/32watts">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/company/32watts-clear-aligners">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/32_watts/">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.youtube.com/c/32WattsClearAligners">
                            <i class="fa fa-youtube-play" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>


  <div class="modal  fade" id="errormodal" role="dialog">
    <div class="modal-dialog modal-sm"  >
    
      <!-- Modal content-->
      <div class="modal-content" >
       
        <div class="modal-body" style="text-align: center;" >
        <br>
        
        	<label style="font-size: large; ">  Invalid Credentials !</label>
           
        </div>
        <div class="modal-footer">
         <button class="btn btn-info" data-dismiss="modal" >Back</button>
        </div>
      </div>
      
    </div>
  </div>
  <% 
	if(session.getAttribute("error")!=null){
		
		if(session.getAttribute("error").equals("Invalid credentials!")){
			
			out.println("<script type=\"text/javascript\">console.log('not');  $('#errormodal').modal('show');</script>");
			session.removeAttribute("error");
		}
	}
	
	%>
  
    <div class="modal  fade" id="forgorpassmodal" role="dialog">
    <div class="modal-dialog modal-sm"  >
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-body" style="text-align: center;" >
        <br>
        	<label style="font-size: large; ">Password Change Successfully!</label>
        </div>
        <div class="modal-footer">
         <button class="btn btn-info" data-dismiss="modal" >Back</button>
        </div>
      </div>
    </div>
  </div>

   <% 
	if(session.getAttribute("changepass")!=null){
		
		if(session.getAttribute("changepass").equals("Password Changed Seccessfully!")){
			
			out.println("<script type=\"text/javascript\">console.log('not');  $('#forgorpassmodal').modal('show');</script>");
			session.removeAttribute("changepass");
		}
	}
	
	%>



<script>
$(document).ready(function(){
	  // hamburger-toggle
	  $('.header-menu-toggle').click(function(){
	      $(this).toggleClass('open');
	      $('#header-nav-wrap').slideToggle();
	  });
	});

/* function myFunction() { 
	  var x = document.getElementById("passwordlogin");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	} */
	
	
$('#loginButton').click(function(){

	var password=$("#passwordlgn").val()
	var user_id=$("#user_id").val()
	var loginButton=$("#loginButton").val();
	var passwordb64 = btoa(unescape(encodeURIComponent(password)));
	console.log("Login user_id : "+user_id+" passwordb64 : "+passwordb64+" loginButton : "+loginButton)

     $.ajax
    ({ 
        url: 'login',
        data: {password: passwordb64,user_id:user_id,loginButton:loginButton},
        type: 'post',
         success: function(data)
        { 	       
        	
        	if($.trim(data)=="error"){
        		$('#errormodal').modal('show');
        		//swal('Invalid user credentials!');
        		//setTimeout(function(){  window.location='login.jsp';},9000);	  
      	  }	 
        	else{
        		 window.location='Case_Stage';	  
        	}
       }       
}); 

});
	
	
	$('#forgotButton').click(function(){

		var username=$("#username").val();
		var phoneNumber=$("#phoneNumber").val();
		var newpassword=$("#newpassword").val();
		var confirmnewpassword=$("#confirmnewpassword").val();
		var newpasswordb64 = btoa(unescape(encodeURIComponent(newpassword)));
		var confrmpasswordb64 = btoa(unescape(encodeURIComponent(confirmnewpassword)));
		
	     $.ajax
	    ({ 
	        url: 'ForgotPassword',
	        data: {newpassword: newpasswordb64,confirmnewpassword:confrmpasswordb64,phoneNumber:phoneNumber,username:username},
	        type: 'post',
	         success: function(data)
	        { 	        	 
	        	 
	        	 if($.trim(data)=="User does not Exist"){
	        		  alert('User does not Exist!');
	             	  window.location='login.jsp';
	        	  }
	        	 if($.trim(data)=="Password Reset Successfully"){
	        		  alert('Password Reset Successfully');
	             	  window.location='login.jsp';
	        	  }
	        	 if($.trim(data)=="Mobile Number does not match"){
	        		  alert('Mobile Number does not match!');
	             	  window.location='login.jsp';
	        	  }
	        	 if($.trim(data)=="password does not match"){
	        		  alert('Password does not match!');
	             	  window.location='login.jsp';
	        	  }
 
	       }       
	}); 

	});
</script>

 
  
 </body>
</html>  