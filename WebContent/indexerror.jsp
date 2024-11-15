<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>WorkFlow</title>
<!--  <link rel="stylesheet" type="text/css" href="CSS1/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="CSS1/style.css">
 <link rel="icon" type="image/ico" href="Images/favicon.ico" sizes="32x32" />
 
 
<script src="js/jquery.js" ></script>
 
<script type="text/javascript" src="js/angular.min.js" ></script>
<script type="text/javascript" src="js/ng-file-upload.min.js" ></script>
<script type="text/javascript" src="js/ng-file-upload-shim.min.js" ></script>
<script type="text/javascript" src="js/FileSaver.js" ></script>
<script src="js/angular-route.js"></script> 
 <script src="js/angular-animate.js"></script>
<script type="text/javascript" src="js/angularapp.js"></script>
 <script type="text/javascript" src="js/moment.js" ></script>
 <script type="text/javascript" src="js/controller.js"></script>
<link href="js/tether.js"></script>
<script src="JavaScript/bootstrap.js"></script> -->


 <link rel="stylesheet" type="text/css" href="CSS1/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="CSS1/style.css">
 <link rel="icon" type="image/ico" href="Images/favicon.ico" sizes="32x32" />
 
 
 <script src="js/jquery.js"></script>
 
<script type="text/javascript" src="js/angular.min.js" ></script>
<script type="text/javascript" src="js/ng-file-upload.min.js" ></script>
<script type="text/javascript" src="js/ng-file-upload-shim.min.js" ></script>
<script type="text/javascript" src="js/FileSaver.js" ></script>
<script src="js/angular-route.js"></script>
 <script src="js/angular-animate.js"></script>
<script src="js/jquery.js" ></script>
<script src="js/jquery-3.1.1.js" > </script>
<script type="text/javascript" src="js/angularapp.js"></script>
<script type="text/javascript" src="js/moment.js" ></script>
<script type="text/javascript" src="js/controller.js"></script>
<link href="CSS1/font-awesome.css" rel="stylesheet" />
<script src="js/tether.js"></script>
<script src="js/bootstrap.js"></script>
   
</head>
<body style="background-color: #deffff"  ng-app="myapp" ng-controller="cont">

		<%
			if(session.getAttribute("username")!=null){
				session.removeAttribute("username");
				session.removeAttribute("password");
			}
	   %>

<div class="modal fade" id="forgetpasswordmodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style=" background: none; border: none;">
         <div class="modal-body"   >
         
			<div class="popup-box">
					 <button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>Forgot your password?</h3>
					<h4>Not to worry, we got you! Let's get you a new password.</h4>
					<form ng-submit="forgetPassword();">
					<div class="form-group"><input type="text" required="required" placeholder="Username" class="form-control" ng-model="forgetPasswordJson.username">
					</div>
					<div class="form-group"><input type="text" required="required" placeholder="Phone Number" pattern="[0-9]{10}" class="form-control" ng-model="forgetPasswordJson.phoneNumber" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="New Password" class="form-control" ng-model="forgetPasswordJson.newpassword" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="Confirm New Password" class="form-control" ng-model="forgetPasswordJson.confirmnewpassword"  >
					</div>
					<label class="text-danger" ng-if="forgetPasswordJson.newpassword!=forgetPasswordJson.confirmnewpassword" >Password does not match</label>
					<div class="col-lg-12"><button type="submit" class="btn btn-changepwd">Change Password</button>
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

                    <div class="header-logo">

                        <a href="index.jsp">

                            <img src="Images/logo.png" alt="32 Watts Clear Aligners" />

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
                        <span>Menu</span>
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
	<form action="login" method="post">
	
	<div class="form-group">
	
	<h3 style="color:red;text-align: center;">Invalid credentials!</h3>
	<label>Username</label>
	<input type="text" name="user_id"  class="" placeholder="Enter Username">
	</div>
	
	<div class="form-group">
	<label>Password</label>
	<input type="password" name="password" class="form-control" placeholder="Enter Password">
	<a data-target="#forgetpasswordmodal" data-toggle="modal" class="link-forgotpwd">Forgot your password?</a>
	</div>
	<div style="text-align: center;" >
	<button type="submit" class="btn login-btn" name="loginButton" value="Login" >Login</button>
	
	</div>
	<div style="text-align: center;" >
New user? <a href="Register.jsp">Start here.</a>
</div>
</form>
	</form>
	</div>
	</div>
	</div>




<footer>
        <div class="container">
            <div class="f-logo">
                <img src="Images/logo-footer.jpg" alt="32 watts clear aligner" />
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
                <span>32 Watts</span>&copy; 2019  Render Wise Solutions Pvt. Ltd. All Rights Reserved
            </div>
            <div class="footer-social">
                <ul>
                    <li>
                        <a href="https://www.facebook.com/32watts">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/company/alignwise-smile-technologies/">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/alignwise_smile/">
                            <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.youtube.com/channel/UC2Xgt_zC4ZWvKISMzzwmMbg">
                            <i class="fa fa-youtube-play" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>



  
	<% 
if(session.getAttribute("error")!=null){
	
	if(session.getAttribute("error").equals("Invalid credentials!")){
		
		out.println("<script type=\"text/javascript\">console.log('not');  $('#errormodal').modal('show');</script>");
		session.removeAttribute("error");
	}
}

%>
<!-- 
<script type="text/javascript" src="Javajs/bootstrap.js" ></script>
  <script src="js/jquery-1.10.1.js"></script>
  <script src="js/main.js"></script>
	 -->
 </body>
</html>