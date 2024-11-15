<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/style.css" type='text/css'>
<title>HomePage</title>
</head>
<body bgcolor="#E6E6FA">
<div class="wrapper">
<form action="profileServlet" method="post" class="login">
 <p class="title">Task Lists</p>
<input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/>  

<input type="submit" name="createButton" value="Create Requests" disabled/> 

<input type="submit" name="pendingButton" value="Pending Requests"/>  


<input type="submit"  name="viewButton" value="View Requests" disabled/> 

<%
            session.setAttribute("username", request.getAttribute("username"));
            %>

</form>
</div>
</body>
</html>