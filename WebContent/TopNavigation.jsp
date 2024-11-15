
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Workflow</title>

</head>
<body>
<style>
.dropbtn {
  
  border: none;
}
.dropdown {
  position: relative;
  display: inline-block;
}
.dropdown:hover .dropdown-content {display: block;
}
.dropdown:hover .fa-angle-down{
     transform: rotate(180deg);
}
#menu_toggle{
    display:inline-block;
    width: 25px;
    height: 18px;
    position: relative;
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
#menu_toggle.open .humberger-line:nth-child(1) {
    top: 8px;
    transform: rotate(135deg);
}
#menu_toggle.open .humberger-line:nth-child(2) {
    opacity: 0;
    left: -30px;
}
#menu_toggle.open .humberger-line:nth-child(3) {
    top: 8px;
    transform: rotate(-135deg);
}
.fa-angle-down{
	position: absolute;
	top: 40%;
	right: 5px;
}
.btn-success{
  background-color:transparent;
}
.dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus{
   background-color: #fff !important;
   color:#000 !important;
}

</style>


 <form id="form1" style="margin-top:0px" class="form-inline" action="Logout" method="post"  >  
 
<div class="top_nav">

                <div class="nav_menu" style="padding-right:15px;">
                    <nav class="" role="navigation">
                     <div class="nav toggle">
                            <a id="menu_toggle">
                    <span class="humberger-line"></span>
                    <span class="humberger-line"></span>
                    <span class="humberger-line"></span>
                            </a>
                        </div>                   	
                    


                        <ul class="nav navbar-nav navbar-right dropdown" style="width:9%; border:none;">
                            <li class="dropbtn" >
                              <a class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                              <img src="Images/download.png" width=64"></i>
							<%session.setAttribute("user_id", request.getAttribute("user_id"));%>
                                <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-content" style="background-color: #ef9438;">
                                   <li><a class="btn btn-success" href="Changepassword.jsp" style=" border:none;">Change password</a></li>
                                   <li><a class="btn btn-success" href="Logout" style="background-color:#ef9438;border-color: #ef9438;">Log Out</a></li>                                    
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            </form>
            
            <!-- change pass modal start-->
    <div class="modal fade" id="changepasswordmodal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style=" background: none; border: none;">
         <div class="modal-body"   >
         
			<div class="popup-box">
					 <button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>Forgot your password?</h3>
					<h4>Not to worry, we got you! Let's get you a new password.</h4>
					<form action="ForgotPassword" method="post" id="frm">
					<div class="form-group"><input type="text" required="required" placeholder="Username" class="form-control" id="username" name="username">
					</div>
					<div class="form-group"><input type="text" required="required" placeholder="Phone Number" pattern="[0-9]{10}" class="form-control" id="phoneNumber" name="phoneNumber" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="New Password" class="form-control" id="newpassword" name="newpassword" >
					</div>
					<div class="form-group">
					<input type="password" required="required" placeholder="Confirm New Password" class="form-control" id="confirmnewpassword" name="confirmnewpassword">
					</div>
					<label class="text-danger error"   style="color:red" ></label>
					<div class="col-lg-12"><button type="submit"  class="btn btn-changepwd" >Change Password</button>
					</div>
					</form>
					</div>
        </div>
      </div>
    </div>
  </div>
  <!--change pass modal end  -->
</body>
</html>