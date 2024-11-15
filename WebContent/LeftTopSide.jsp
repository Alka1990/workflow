<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.HashMap"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="profile">
							<div class="profile_pic"></div>
							<div class="profile_info" style="width: 100%;">
								<span>Welcome</span>
								<h2 style="padding-bottom: 10px;">
								
									<strong><%=(session.getAttribute("userid"))%>
            </strong>
            </h2>

							</div>
						</div>
</body>
</html>