<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="com.workflow.connection.LoginDAO" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
<title>Pending Request For L2</title>
</head>
<body>
<div class="wrapper">
     <form action="createServlet" method="post" class="login"> 
<p class="title">Pending Request For L2</p>

        <% 
        Connection  con=null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        try{
   		     LoginDAO loginDAO = new LoginDAO();
     	    con=LoginDAO.getConnectionDetails();
            ps=con.prepareStatement("select * from CASE_MSTR where CASE_ID=?");  
    		String caseId=request.getParameter("caseId");
    		ps.setString(1, caseId);
    		rs = ps.executeQuery();
        %>
       
   
        <% while(rs.next()){ %>
        
CASE_ID: <input  type="text" name="caseId" value="<%= rs.getString("CASE_ID") %>"/><br/> 
USER_ID: <input type="text" name="USER_ID"  value="<%= session.getAttribute("userid") %>"/><br/> 
 STATUS: <input type="text" name="STATUS"  value="<%= rs.getString("STATUS") %>"/><br/> 
DECISION: <input type="text" name="DECISION"  value="<%= rs.getString("DECISION") %>"/><br/>   
STAGE: <input type="text" name="STAGE"  value="<%= rs.getString("STAGE") %>"/><br/>   
NEXT_STAGE:  <input type="text" name="NEXT_STAGE" id="STAGE" value="<%= rs.getString("NEXT_STAGE")%>"/><br/>   
CREATED_DATE:  <input type="text" name="NEXT_STAGE"  value="<%= rs.getString("CREATED_DATE")%>"/><br/> 
FIELD1:  <input type="text" name="FIELD1"  value="<%= rs.getString("FIELD1")%>"/><br/>  
FIELD2:  <input type="text" name="FIELD2"  value="<%= rs.getString("FIELD2")%>"/><br/> 
<% } %>

Decision :   
<select name="category2"  id="single2">
<option selected='selected'>Approve</option>
<option selected='selected'>Reject</option>
</select><br/><br/> 

<input type="hidden" name="username" value='<%=session.getAttribute("username")%>'/>
<input type="submit" name="ApendingSubmit" value="Submit"/>


</form>
</div>
</body>
</html>
<%
        }catch (Exception e) {
			e.printStackTrace();
		}
finally {
			
			
			 if (rs != null) {
		            // closes the database connection
		            try {
		            	rs.close();
		            	rs=null;
		            } catch (SQLException ex) {
		                          ex.printStackTrace();
		            }
			 }
		            if (ps != null) {
			            // closes the database connection
			            try {
			            	ps.close();
			            	ps=null;
			            } catch (SQLException ex) {
			                          ex.printStackTrace();
			            }
		            }
		           
			
	       if (con != null) {
	           // closes the database connection
	           try {
	               con.close();
	               con=null;
	           } catch (SQLException ex) {
	                         ex.printStackTrace();
	           }
	             
	       }           
	       }
        
        %>