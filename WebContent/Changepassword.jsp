
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">

<head>
.getrequest.get
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" href="Images/logo.png">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title><!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">    
    <script src="JavaScript/jquery-1.10.1.js"></script>
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script> 
    <script src="JavaScript/bootstrap.js"></script>
    <script src="JavaScript/custom.js"></script>
    <script src="JavaScript/common.js"></script>

</head>

<body class="nav-md" >
<form method="post" action="${pageContext.request.contextPath}/ChangePassword" target="_self" >
<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <!-- Top Bar -->
                 	<%@ include file="TopBar.jsp" %>
				<!-- Top Bar -->
                      <!-- menu prile quick info -->
                   
                    <%@ include file="LeftTopSide.jsp" %>
                    <!-- /menu prile quick info -->


                       	<!-- sidebar menu -->
						    <%@ include file="SideBar.jsp" %>
                    <!-- /sidebar menu -->
                </div>
            </div>

            <!-- top navigation -->
            <%@ include file="TopNavigation.jsp" %>
            <!-- /top navigation -->


            <!-- page content -->
            <div class="right_col" role="main">
            <input type="hidden" id="username" name="username" value='<%=request.getSession().getAttribute("username")%>'/> 
<div class="container" style="padding-top:20px;">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Change Password</strong> </div>
    <div class="" style="margin-left:20px;margin-right:20px;margin-top:20px;"><!-- table-responsive -->


     <div class="row" >  
            <div class="col-lg-4" ></div>
     
  <div class="col-lg-2" >    
		    <div class="form-group" >
		       <img src="Images/forgot-password.png" alt="car-key" border="0" style="width:80px; height:80px">
			 </div>
	   </div> 
	 </div>

     <div class="row" >  
            <div class="col-lg-2" ></div>
     
  <div class="col-lg-6" >    
		    <div class="form-group" >
		        <label>Old Password</label>
				<span style="color:red" class="required">*</span></label>
		        <span style="padding-left:129px; margin-top:5px;">
		            <input class="form-control" type="password"  id="oldpass"  name="oldpass" required>
		        </span>
			 </div>
	   </div> 
	 </div> 
	  <div class="row" >  
	         <div class="col-lg-2" ></div>
	  
         <div class="col-lg-6" >    
		     <div class="form-group" >
		            <label>New Password</label>
					<span style="color:red" class="required">*</span></label>
		     		<span style="padding-left:129px; margin-top:5px;">
					<input class="form-control" type="password"  id="newpassword1"  name="newpass" required>
		        </span>
		      </div>
	    </div>
	    </div>
	    	  <div class="row" >  
	           <div class="col-lg-2" ></div>
	    
	    <div class="col-lg-6" >    
		
			   <div class="form-group" >
		            <label>Confirm New Password</label>
					<span style="color:red" class="required">*</span></label>
		     		<span style="padding-left:129px; margin-top:5px;">
					<input class="form-control" type="password" id="confirmnewpassword1"  name="confirmpass" required>
		        </span>
		      </div>
			 
	   </div> 
	    </div> 
	    </div>   
	   <label class="error"  style="color:red" ></label>

      <div class="text-center" style="margin-top:20px;margin-bottom:50px;">
      <button class="btn btn-success" text-align="center" id="forgotButton" type="button" >Submit</button></td>   

  </div>
  </div>
  
   </div>

            </div>
            <!-- /page content -->
	</form>
    
    
    <script>

/* function myFunction() { 
	  var x = document.getElementById("passwordlogin");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	} */
	
	
$('#forgotButton').click(function(){

	var oldpass=$("#oldpass").val();
	var newpassword=$("#newpassword1").val();  
	var confirmnewpassword=$("#confirmnewpassword1").val(); 
	
	var oldpasswordb64 = btoa(unescape(encodeURIComponent(oldpass)));
	var newpasswordb64 = btoa(unescape(encodeURIComponent(newpassword)));
	var confirmnewpassword64 = btoa(unescape(encodeURIComponent(confirmnewpassword)));
	
     $.ajax
    ({ 
        url: 'ChangePassword',
        data: {oldpass: oldpasswordb64,newpass: newpasswordb64,confirmpass:confirmnewpassword64},
        type: 'post',
          success: function(data)
        { 
        	  
        	  if($.trim(data)=="User does not Exist"){
        		  alert('User does not Exist!');
             	  window.location='Changepassword.jsp';
        	  }
          	 else if($.trim(data)=="Success Data"){
          		 
        		 alert('Your Password has been changed!');
            	 window.location='login.jsp';
            	 }
        	 if($.trim(data)=="Wrong old password"){
        		 alert("Wrong old password")
        	 	 window.location='Changepassword.jsp';
        	 }
   	 	    if($.trim(data)=="User does not Exist"){
        		 alert("User does not Exist")
        		 window.location='Changepassword.jsp';
        	 }
   	 	   if($.trim(data)=="password does not match"){
   	 			alert("Password does not match")
   		 		window.location='Changepassword.jsp';
   	 }

       }        
}); 

});
	
</script>

</body>

</html>
