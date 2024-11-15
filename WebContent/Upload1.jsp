<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.workflow.connection.LoginDAO" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
<title>Upload</title>
</head>
<body>
<div class="wrapper">
     <form action="UploadFileServlet" method="post"  enctype="multipart/form-data" class="login"> 
<p class="title">Task Details</p>

        <% 
	    	Connection con=null;  
	    	LoginDAO loginDAO = new LoginDAO();
	   	    con=LoginDAO.getConnectionDetails();
            Statement statement = con.createStatement() ;
    		PreparedStatement ps=con.prepareStatement("select * from CASE_MSTR where CASE_ID=?");  
    		String caseId=request.getParameter("caseId");
    		ps.setString(1, caseId);
    		ResultSet rs = ps.executeQuery();
        %>
       
   
        <% while(rs.next()){ %>
        
CASE_ID: <input  type="text" name="caseId" value="<%= rs.getString("CASE_ID") %>"/><br/> 
USER_ID: <input type="text" name="USER_ID"  value="<%= rs.getString("USER_ID") %>"/><br/>   
 STATUS: <input type="text" name="STATUS"  value="<%= rs.getString("STATUS") %>"/><br/>  
DECISION: <input type="text" name="DECISION"  value="<%= rs.getString("DECISION") %>"/><br/>   
STAGE: <input type="text" name="STAGE"  value="<%= rs.getString("STAGE") %>"/><br/>   
NEXT_STAGE:  <input type="text" name="NEXT_STAGE"  value="<%= rs.getString("NEXT_STAGE")%>"/><br/>  
CREATED_DATE:  <input type="text" name="NEXT_STAGE"  value="<%= rs.getString("CREATED_DATE")%>"/><br/>   
FIELD1:  <input type="text" name="FIELD1"  value="<%= rs.getString("FIELD1")%>"/><br/>  
FIELD2:  <input type="text" name="FIELD2"  value="<%= rs.getString("FIELD2")%>"/><br/>   
<% } %>

Choose a file to Upload : <input type="file" name="file">

<input type="hidden" name="username" value='<%=session.getAttribute("username")%>'/>
<input type="submit" name="uploadSubmit" value="Submit"/>




</form>



</div>
</body>
</html>