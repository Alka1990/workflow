<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HomePage</title>
<link rel="stylesheet" href="css/style.css" type='text/css'>

</head>


<body>
       
<div class="wrapper">
<form action="profileServlet" method="post" class="login">
 <p class="title">Task Lists</p>


 <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
 <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
 <%
 if(session.getAttribute("initiationFlag").equals("I")){%>
	 <input type="submit" name="createButton" value="Create Requests" /> 
<%
 }else{ %>
 <input type="submit" name="createButton" value="Create Requests" disabled/> 
 <%
 }
 
 %>
 

<input type="submit" name="viewButton" value=" View Requests"/>  

<input type="submit" name="pendingButton" value="Pending Requests"/>  

<input type="text" name="caseid" id ="caseid" />
<input type="submit" name="SearchButton" value="Search Requests" />  


<%
            session.setAttribute("username", request.getAttribute("username"));
            %>

</form>
</div>
<div class="fixed-footer">
        <div class="container">Copyright &copy; 2016 Your Company</div>        
    </div>
</body>
</html>