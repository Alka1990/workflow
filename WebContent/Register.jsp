<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css/register.css" type='text/css'>
<link rel="stylesheet" type="text/css" href="CSS1/style.css">
<link rel="stylesheet" type="text/css" href="CSS1/bootstrap.min.css">
<link href="CSS1/font-awesome.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/JavaScript/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
<title>Register</title>

</head>
<body>
	<div class="wrapper">
		<form action="RegisterServlet" METHOD="POST" class="login" style="background: border-box;box-shadow: 0px 1px ;">  
		
		
         
			<h1 align="center"><font style="color: white;">Register</font></h1>
			<input type="text"  name="USER_ID" placeholder="USER_ID" required   maxlength="20"/><br/> 
			<input type="text" name="FIRST_NAME"  placeholder="FIRST_NAME" required maxlength="100"/><br/> 
			<input type="text" name="MIDDLE_NAME"  placeholder="MIDDLE_NAME" required  maxlength="100"/><br/>  
			<input type="text" name="LAST_NAME"  placeholder="LAST_NAME" required  maxlength="100"/><br/>   
			<input type="text" name="PROFILE_ID"  placeholder="PROFILE_ID" required  maxlength="100"/><br/> 
			<!-- <input type="text" name="STATUS"   placeholder="STATUS" required/><br/>    -->
			<input type="text" name="PASSWORD"  placeholder="PASSWORD" required  maxlength="30"/><br/> 
			<input type="text" name="EMAIL_ID"  placeholder="EMAIL_ID" required  maxlength="50"/><br/>  
			<input type="text" name="PHONE"  placeholder="PHONE" required  maxlength="10" onkeypress="return onlyNumberKey(event)"/><br/>  
			<input type="text" name="FAX"  placeholder="FAX" required  maxlength="20"/><br/> 
			<input type="text" name="DESIGNATION"  placeholder="DESIGNATION" required  maxlength="20"/><br/> 
			<input type="text" name="CITY"  placeholder="CITY" required  maxlength="20"/><br/> 
			<input type="text" name="DISTRICT"  placeholder="DISTRICT" required  maxlength="20"/><br/>  
			<input type="text" name="COUNTRY"  placeholder="COUNTRY" required  maxlength="20"/><br/> 
			<input type="submit"  class="btn login-btn" value="Register"/>   
			<i class="spinner"></i>
			<h6  style="text-align: left;background-color: white!important;" >New user? <a href="Register.jsp">Start here.</a></h6>
		</form>
	</div>
	
<script>

	
    function onlyNumberKey(evt) {
         
        // Only ASCII character in that range allowed
        var ASCIICode = (evt.which) ? evt.which : evt.keyCode
        if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
        return true;
    }
</script>
</body>
</html>