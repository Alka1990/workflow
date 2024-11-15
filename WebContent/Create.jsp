<%@page import="java.util.Properties"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.workflow.connection.LoginDAO" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
<title>Create request</title>

</head>
<body>
<div class="wrapper">
<form action="createServlet" method="post" class="login">  
<p class="title">Create Request</p>

 
  <% 
  
        Connection  con=null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        try{
        		LoginDAO loginDAO = new LoginDAO();
        	con=LoginDAO.getConnectionDetails();
    		ps=con.prepareStatement("select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='Intro'");  
    		rs = ps.executeQuery();
    		
        %>


User ID :   <input type="text" name="username" value='<%=request.getAttribute("username")%>'/> <br/><br/>

  Field 1 :   <input type="text" name="field1"/><br/><br/>  

 
 Field 2 :   <input type="text" name="field2"/><br/><br/>
<!-- Decision :   <input type="dropdown" name="decision" style="width: 120px; "/><br/><br/>  --> 

Decision :  <select name="category"  id="single1">

 <% while(rs.next()){ %>
 <option selected='selected'><%= rs.getString("display_name")%></option>
 
	 <%}
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



</select><br/><br/>  

 <input type="submit" name="createSubmit" value="Submit"/> 
  
</form>
</div>
</body>
</html>