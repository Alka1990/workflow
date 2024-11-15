<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Workflow</title>
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
    <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
   <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

</head>
<body>
<h2>patient data</h2>
<form id="loginfrm" action="formdatafrm" method="post"><!-- action="RILogin" method="post" -->
					<div class="form-group">
						<input type="text" name="case_id"  id="case_id" class="form-control">
										
					</div>
					<div style="text-align: center;" >
						<button type="submit" class="btn login-btn" name="formdata" id="formdata" value="Login" >Login</button>
					</div>
			     </form>
<script>

$( document ).ready(function() {
	
	var searchParams = new URLSearchParams(window.location.search)	
	document.getElementById("case_id").value = searchParams.get('case_id');
			
			});
		</script>
</body>
</html>