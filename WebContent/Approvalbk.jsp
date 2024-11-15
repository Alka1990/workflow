<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.workflow.connection.LoginDAO" %>
   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/register.css" type='text/css'>
<title>Approval L2</title>

<script>
function decisionFetch() {
	var caseid=document.getElementById("caseId").value;
	mywindow = window.open("DecisionDisplay.jsp?caseid="+caseid, "mywindow", "location=1,status=1,scrollbars=1,  width=1000,height=1000");
    mywindow.moveTo(0, 0);
} 
</script>

</head>
<body>
<div class="wrapper">
     <form action="createServlet" method="post" class="login"> 
<p class="title">Task Details</p>

        <% 
        Connection  con=null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        ResultSet rs1 =null;
        try{
   		     LoginDAO loginDAO = new LoginDAO();
     	    con=LoginDAO.getConnectionDetails();           
    		ps=con.prepareStatement("select * from CASE_MSTR where CASE_ID=?");  
    		String caseId=request.getParameter("caseId");
    		String NxtStage=request.getParameter("NxtStage");
    		ps.setString(1, caseId);
    		rs = ps.executeQuery();
    		
    		ps=con.prepareStatement("select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='"+NxtStage+"'");  
    		rs1 = ps.executeQuery();
    		 %>
       
   
        <% while(rs.next()){ %>
        
CASE_ID: <input  type="text" name="caseId" id="caseId" value="<%= rs.getString("CASE_ID") %>"/><br/> 
USER_ID: <input type="text" name="USER_ID"  value="<%= session.getAttribute("userid") %>"/><br/>   
 STATUS: <input type="text" name="STATUS"  value="<%= rs.getString("STATUS") %>"/><br/>  
DECISION: <input type="text" name="DECISION"  value="<%= rs.getString("DECISION") %>"/><br/>   
STAGE: <input type="text" name="STAGE" value="<%= rs.getString("STAGE") %>"/><br/>   
NEXT_STAGE:  <input type="text" name="NEXT_STAGE" id="NEXT_STAGE" value="<%= NxtStage%>"/><br/>  
CREATED_DATE:  <input type="text" name="CreatedDate"  value="<%= rs.getString("CREATED_DATE")%>"/><br/>   
FIELD1:  <input type="text" name="FIELD1"  value="<%= rs.getString("FIELD1")%>"/><br/>  
FIELD2:  <input type="text" name="FIELD2"  value="<%= rs.getString("FIELD2")%>"/><br/>   
<% } %>

Decision :   
<select name="category2"  id="single2">
<% while(rs1.next()){ %>
 <option selected='selected'><%= rs1.getString("display_name")%></option>
 
	 <%}%>

</select><br/><br/> 

<input type="hidden" name="username" value='<%=session.getAttribute("username")%>'/>
<input type="submit" name="pendingSubmit" value="Submit"/>
<input type="button" name="DecisionSubmit" value="Decision" onclick="decisionFetch()"/>

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
			 if (rs1 != null) {
		            // closes the database connection
		            try {
		            	rs1.close();
		            	rs1=null;
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