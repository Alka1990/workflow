<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#E6E6FA">
<form action="servlet2" method="post">  

User ID :   <input type="text" name="uname" value='<%=request.getAttribute("username")%>'/> <br/><br/>
Field 1 :   <input type="text" name="status"/><br/><br/>  
Field 2 :   <input type="text" name="stage"/><br/><br/>
<!-- Decision :   <input type="dropdown" name="decision" style="width: 120px; "/><br/><br/>  --> 
Decision :   
<select name="category"  id="single1">
<option selected='selected'>Sports</option>
<option selected='selected'>Sports1</option>
</select><br/><br/>  

<input type="submit" name="save" value="Submit"/>  
  
</form>
</body>
</html>