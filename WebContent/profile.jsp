<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/angular.min.js"></script>
<link rel="stylesheet" href="css/style.css" type='text/css'>
<title>lets try angular</title>
<script type="text/javascript">

var app=angular.module("myapp",[]);

app.controller('myCtrl', function($scope) {
    $scope.profile='xyz';
    
});




</script>



</head>
<body ng-app="myapp" ng-controller="myCtrl" >

{{profile}}


<%

out.println("<div ng-init=\"profile='"+session.getAttribute("profile")+"'\"></div>");


%>


<div class="wrapper">
<form action="profileServlet" method="post" class="login">
 <p class="title">Task Lists</p>


 <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
 
<input type="submit" name="createButton" value="Create Requests" ng-disabled="profile=='Profile2'" /> 

<input type="submit" name="viewButton" value=" View Requests" ng-disabled="profile=='Profile2'" />  

<input type="submit" name="pendingButton" value="Pending Requests" ng-disabled="profile=='Profile1'" />  


<%
            session.setAttribute("username", request.getAttribute("username"));
            %>

</form>
</div>
<div class="fixed-footer">
        <div class="container"></div>        


</body>
</html>