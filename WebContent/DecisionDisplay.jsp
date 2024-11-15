<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
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
</head> 
<body>
<div class="wrapper">
     <form action="createServlet" method="post" class="login"> 
<p class="title">Task Details</p>

        <% 
        Connection  con=null;
        PreparedStatement ps=null;
        ResultSet rs =null;
        PreparedStatement ps1=null;
        ResultSet rs1 =null;
        HashMap<String, String> decMap=null;
        try{
        	String caseid=request.getParameter("caseid");
   		    LoginDAO loginDAO = new LoginDAO();
     	    con=LoginDAO.getConnectionDetails();
        	 String decquery ="select display_name,decs_code  from decision_master";
			ps=con.prepareStatement(decquery); 
			rs = ps.executeQuery();
			
				decMap= new LinkedHashMap<String, String>();
				while(rs.next()){
					
					decMap.put(rs.getString("decs_code"), rs.getString("display_name"));
					
				}
                
        		ps=con.prepareStatement("select a.Stage,a.Decision,a.User_id,a.created_date from case_mstr_history a where a.case_id="+caseid+" order by initiated_date") ;  
        		//ps.setString(1, caseId);
        		rs = ps.executeQuery();
        		
        		
        		//request.setAttribute("profile"
        				ps1=con.prepareStatement("select Stage,Decision,User_id,created_date from patient_details where case_id="+caseid);  
        		//ps.setString(1, caseId);
        		rs1 = ps1.executeQuery();
        		
        		%>
        		
        		      
<div class="wrapper">
<form class="login">
<p class="title">Decision History</p>
<table align="center">

             <TR>
            
           <TH> STAGE</TH>
              <TH> DECISION</TH>
                    <TH>USER</TH>
                     <TH>DATE</TH>
                   </TR> 
       
       
   
        <% while(rs.next()){ %>
        
        
         <TR>
          
               <TD> <%= rs.getString("Stage") %></TD>
                <TD> <%= decMap.get(rs.getString("Decision")) %></TD>
                <TD> <%= rs.getString("User_id") %></TD>
                <TD> <%= rs.getString("created_date") %></TD>
                 </TR>
              <% } 
             while(rs1.next()){ %>
              <TR>
            	 <TD> <%= rs1.getString("Stage") %></TD>
                 <TD> <%= decMap.get(rs1.getString("Decision")) %></TD>
                 <TD> <%= rs1.getString("User_id") %></TD>
                 <TD> <%= rs1.getString("created_date") %></TD>
                 </TR>
            <%  }
              %>   
                
        		
        		
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
		            if (rs1 != null) {
			            // closes the database connection
			            try {
			            	rs1.close();
			            	rs1=null;
			            } catch (SQLException ex) {
			                          ex.printStackTrace();
			            }
				 }
			            if (ps1 != null) {
				            // closes the database connection
				            try {
				            	ps1.close();
				            	ps1=null;
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
       
       
</form>
</div>
</body>
</html>