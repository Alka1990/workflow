<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.vo.Newcase1"%> 
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Workflow :: Dashboard</title>
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
	<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
 	<script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
  
   <script type="text/javascript">
 
function callModal(){
		$('#myModal').modal({
			backdrop: 'static',
			keyboard: false

		}); 
};
</script>
<style>
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
backdrop: 'static'
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;

}
/* The Close Button */
.close {
 	color: #000;
    float: right;
    font-size: 14px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    text-decoration: none;
    cursor: pointer;
}
</style>
<style>
.mt-1 {
  margin-top: 10px!important;
}
	.fixTableHead {
	overflow-y: auto;
	height: 110px;
	}
	.scrollable{
   overflow-y:scroll;
   height:350px;
   display:block;
  
}
</style>

</head>
<body class="nav-md" onload="redirect()" style="background: black;"> 
<div class="container body" >
  <div class="main_container" >
    <div class="col-md-3 left_col" >
                <div class="left_col scroll-view" style="background: black;">
                <!-- Top Bar -->
                 	<%@ include file="TopBar.jsp" %>
				<!-- Top Bar -->
             	<!-- menu prile quick info -->

						<%@ include file="LeftTopSide.jsp" %>
						<!-- /menu prile quick info -->
                          
                 	<!-- sidebar menu -->
					    <%@ include file="SideBar.jsp" %>
                    <!-- /sidebar menu -->
                </div>
            </div>

             <!-- top navigation -->
            <%@ include file="TopNavigation.jsp" %>
            <!-- /top navigation -->


            <!-- page content -->
             <div class="right_col" role="main">
<div class="container" style="padding-top:20px;">

  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Notifications</strong> </div>


<br>

<div class="container">

<div class="row">
<div class="col-lg-6" style="margin-left: 10px;width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>Case Stages</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
	    <table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Count</th>
    </tr>
            
  </thead>
  <tbody>
     <% 
          LinkedHashMap<String, String> linkedHashMap= (LinkedHashMap)request.getAttribute("Case_stage");
          for (Map.Entry<String,String> entry : linkedHashMap.entrySet())	
          {  
        	//returns keys and values respectively  
           %>
        
     <tr>
  <td> <span><%=entry.getKey()%></span> </td>          
  <td><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></td>          
      </tr>
      <%} %>
 
  
     
 
  </tbody>
<tfoot style="background:black;color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Count</th>
    </tr>
    </tfoot>
</table>
</div>							    
</div>
</div>
</div>


<div class="col-lg-6" style="width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>Starter Kit</b></div>
<div class="panel-body">
<div class="card-body scrollable" >

		       <table class="table table-bordered table-striped table-hover dataTable">
  <thead  style="background:black;color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Count</th>
 </tr>
  </thead>
  <tbody>
   <tr>
       </tr>
    
     <% 
     LinkedHashMap<String, String> linkedHashMap2= (LinkedHashMap)request.getAttribute("Starterkit");
     for (Map.Entry<String,String> entry : linkedHashMap2.entrySet())	
       {  
        	//returns keys and values respectively  
           %>
        
     <tr>
  <td> <span><%=entry.getKey()%></span> </td>          
  <td><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></td>          
      </tr>
      <%} %>

    </tbody>
    <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Stage</th>
      <th scope="col">Count</th>
	 </tr>
    </tfoot>
</table>	
</div>					    
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-lg-6" style="margin-left: 10px;width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading "style="color:black;" ><b>Hold Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
    <table class="table table-bordered table-striped table-hover dataTable">
  <thead style="background:black;color:white;">
    <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">STARTER DOCTOR </th>
        <th class="sorting">DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
        
      </tr>
    </thead>
    <% List<Newcase1> list = (List)request.getAttribute("holdflag");
	
	
 
 %>
    
     <% 
    	 for(Newcase1 Nc:list){	
    		 String crm=Nc.getCrm();
        	 if(crm==null)
        		{crm="";}
        		else{crm=Nc.getCrm();}
        	 String starterdoc=Nc.getRdoctorname();
        	 if(starterdoc==null)
        		{starterdoc="";}
        		else{
        			starterdoc=Nc.getRdoctorname();}
    
    
	%>

    <tbody>
		<tr class="even" role="row">
		 <TD><a href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage() %>&SearchStage=Y"><%=Nc.getCaseid() %></a></TD>
         		<TD> <%= starterdoc%></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
                <TD> <%=crm %></TD>
              
				 
			</tr>	
<% }%>  <tbody>

  </tbody>
   <tfoot style="background:black;color:white;">
   <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">STARTER DOCTOR </th>
        <th class="sorting"> DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
        
      </tr>
    </tfoot>
</table>


     
  </div>						    
</div>
</div>
</div>

<div class="col-lg-6" style="width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>...</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered">
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <td colspan="4"> <p align="center"> No Data found!</p></td>
    </tr>
  </tbody>
  <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
    </tfoot>
</table>
    						    
</div>
</div>
</div> 


</div>


<div class="row">
<div class="col-lg-6" style="margin-left: 19px;width: 48%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>...</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered">
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <td colspan="4"> <p align="center"> No Data found!</p></td>
    </tr>
  
  </tbody>
   <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
    </tfoot>
</table>

     
  </div>						    
</div>
</div>
</div>
<div class="col-lg-6" style="width: 48%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>...</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered">
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
  <tbody>
     <tr>
    <td colspan="4"> <p align="center"> No Data found!</p></td>
    </tr>
  </tbody>
   <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Sr No.</th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
    </tfoot>
</table>
    						    
</div>
</div>
</div> 


</div>


</div>								   
</div>
  
</div>

  
               

		
            </div>
            <!-- /page content -->

        </div>

    </div>




</body>
</html>