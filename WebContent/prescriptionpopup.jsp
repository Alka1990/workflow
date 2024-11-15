<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
     <%@ page import="com.workflow.connection.LoginDAO" %>
    
<!DOCTYPE html>
 
<%

String caseid=request.getParameter("case_id");
Connection con=null;
ResultSet rs=null;
try{
	   LoginDAO loginDAO = new LoginDAO();
	 con=LoginDAO.getConnectionDetails();
	String query="select * from incompleteform ";
	PreparedStatement ps=con.prepareStatement(query);
	rs=ps.executeQuery();

	
%>

<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="shortcut icon" href="https://www.32watts.com/images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>WorkFlow</title>  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  </head>

<body>


<div align="center">Add Prescription Form</div>
<table class="table table-bordered table-hover">
<tr text-align="center">
<th>Form Id</th>
<th>Patient Name</th>
<th>Doctor Id</th>
<th>Submission Date</th>
</tr>

<%while(rs.next()){ %>

<tr style="cursor:pointer" onclick="add('<%=rs.getString("form_id")%>')">
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center"><%=rs.getString("form_id")%>
				</td>
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center"><%=rs.getString("patientname")%>
				</td>
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center"><%=rs.getString("submittedby")%>
				</td>
				<td style="text-align: center !important; padding: 5px 0px 5px 0px;"
					align="center"><%=rs.getString("submittedon")%>
				</td>

</tr>


<%} %>
</table>

<script>


function add(x){
	
	
	var caseid='<%=caseid%>';
	var form_id=x;
	
	$.ajax({
  		

  	    type : 'POST',
  		data : {caseid:caseid,form_id:form_id},
  		url : 'addprescriptioninfo',
  		success : function(responseText) {
				
  		
  			alert(responseText);
  			 window.opener.location.reload();
  	        window.close();
			}
  	
  	  
  		 
		});
	
	
	
	
	
}

</script>

</body>


</html><%
}
catch(Exception e){
	
}
finally{
	
	
}




%>