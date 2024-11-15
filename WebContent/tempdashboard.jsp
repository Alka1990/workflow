<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.vo.Newcase1"%> 
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta http-equiv="refresh" content="30"> -->
<title>Workflow :: Dashboard</title>
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css'>
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



</style>

</head>
<body class="nav-sm" > 
<div class="container body" >
  <div class="main_container">

            <!-- page content -->
             <div class="center_col" role="main" ><div class="badge-notification">
<i class="fa fa-bell fa-5x fa-border icon-grey badge"></i>
</div><br><br><br><br>
<div class="container" style="padding-top:20px;">

  <div class="panel panel-primary" style="margin-top: -6px;">
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
      <th scope="col">Total</th>
    </tr>
            
  </thead>
  <tbody>
     <% 
          LinkedHashMap<String, String> linkedHashMap= (LinkedHashMap)request.getAttribute("Case_stage");
          for (Map.Entry<String,String> entry : linkedHashMap.entrySet())	
          {  
           %>
        
     <tr>
  <td> <span><%=entry.getKey()%></span> </td>          
  <td><span><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></span></td>          
      </tr>
      <%}
          %>
 
  
     
 
  </tbody>
<tfoot style="background:black;color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Total</th>
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

		       <table class="table table-bordered table-striped table-hover dataTable " >
  <thead  style="background:black;color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Total</th>
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
        	//System.out.println("Item: " + entry.getKey() + ", Price: " + entry.getValue());  
           %>
        
     <tr>
  <td><span><%=entry.getKey()%> </span></td>          
  <td><span><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></span></td>          
      </tr>
      <%} %>

    </tbody>
    <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Stage</th>
      <th scope="col">Total</th>
	 </tr>
    </tfoot>
</table>	
</div>					    
</div>
</div>
</div>
</div>
    <% List<Newcase1> list = (List)request.getAttribute("holdflag");%>

<div class="row">
<div class="col-lg-6" style="margin-left: 10px;width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading "style="color:black;" title="Total Hold Cases : <%=list.size()%>"><b>Hold Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
    <table class="table table-bordered table-striped table-hover dataTable">
  <thead style="background:black;color:white;">
    <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
        
      </tr>
    </thead>
        <tbody>
     <% 
    	 for(Newcase1 Nc:list){	
    		 String crm=Nc.getCrm();
    		 String starterdoc=Nc.getRdoctorname();
    		 
        	 if(crm==null)
        		{crm="";}
        		else{crm=Nc.getCrm();}
        	
        	 if(starterdoc==null)
        		{starterdoc=Nc.getCdoctorname();}



	%>


		<tr class="even" role="row">

		  <TD><span><a href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage() %>&SearchStage=Y"><%=Nc.getCaseid() %></a></span></TD>
         		<TD><span> <%=starterdoc%></span></td>
              <TD><span> <%= Nc.getCase_stage() %></span></TD>
                <TD> <span><%=crm %></span></TD>
              
				 
			</tr>	
<% }%>  <tbody>

  </tbody>
   <tfoot style="background:black;color:white;">
   <tr role="row">
        <th class="sorting">CASE_ID</th>
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
 <% List<Newcase1> list2 = (List)request.getAttribute("pendingsgnoff");%>
<div class="col-lg-6" style="width: 49%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total Pending for Sign Off Cases : <%=list2.size()%>"><b>Pending for Sign Off </b></div>
<div class="panel-body">
<div class="card-body scrollable" >
<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Case Id </th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
    <tbody>
      <%
      
     
    	 for(Newcase1 psoff:list2){	
    		 String crm=psoff.getCrm();
    	     if(crm==null)
        		{crm="";}
        		else{crm=psoff.getCrm();}
        	 String starterdoc=psoff.getRdoctorname();
        	 if(starterdoc==null)
     		{starterdoc=psoff.getCdoctorname();}
	%>

  
		<tr class="even" role="row">
		 <TD><span><a href="Approval?caseId=<%=  psoff.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=psoff.getCase_stage() %>&SearchStage=Y"><%= psoff.getCaseid()%></a></span></TD>	
               <TD> <span><%= starterdoc%></span></td>
                 <TD><span> <%= psoff.getPatient_Name() %></span></TD>
                 <TD><span> <%=crm %></span></TD>
			</tr>	
<% }%>  <tbody>
  <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Case Id</th>
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

<% List<Newcase1> list3= (List)request.getAttribute("rejectedlist");%>
<div class="row">
<div class="col-lg-6" style="margin-left: 19px;width: 48%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total Rejected Cases : <%=list3.size()%>"><b>Rejeced Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >

<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
     <tr>
      <th scope="col">Case Id </th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
    <tbody>
  <% 
  for(Newcase1 rej: list3){
		 String crm=rej.getCrm();
	     if(crm==null)
    		{crm="";}
    		else{crm=rej.getCrm();}
    	 String starterdoc=rej.getRdoctorname();
    	 if(starterdoc==null)
 		{starterdoc=rej.getCdoctorname();}
  %>

    <tr>
    <TD><span><a href="Approval?caseId=<%=rej.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=rej.getCase_stage() %>&SearchStage=Y"><%=rej.getCaseid()%></a></span></TD>	
    <TD> <span><%= starterdoc%></span></td>
    <td> <span><%=rej.getPatient_Name()%></span></td>
    <TD> <span><%=crm %></span></TD>
    </tr>
  <%} %>
  </tbody>
   <tfoot style="background:black;color:white;">
    <tr>
      <th scope="col">Case Id </th>
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
<%  List<Newcase1> list4= (List)request.getAttribute("ppfpending");%>
<div class="col-lg-6" style="width: 48%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total PPF Pending Cases : <%=list4.size()%>"><b>PPF Pending Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Case Id </th>
      <th scope="col">Doctor Name</th>
      <th scope="col">Patient Name</th>
      <th scope="col">CRM</th>
    </tr>
  </thead>
  <tbody>
  <% for(Newcase1 ppf: list4){
	 
	  String crm=ppf.getCrm();
	     if(crm==null)
 		{crm="";}
 		else{crm=ppf.getCrm();}
 	 String starterdoc=ppf.getRdoctorname();
 	 if(starterdoc==null)
		{starterdoc=ppf.getCdoctorname();}
	  
   %>
  
  <tr>
    <TD><span><a href="Approval?caseId=<%= ppf.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=ppf.getCase_stage() %>&SearchStage=Y"><%= ppf.getCaseid()%></a></span></TD>	
     <td ><span><%=starterdoc %></span> </td>
      <td ><span> <%=ppf.getPatient_Name()%></span></td>
       <td ><span><%=crm%></span></td>
    </tr>
    <%} %>
  </tbody>
   <tfoot style="background:black;color:white;">
 <tr>
      <th scope="col">Case Id </th>
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

<div class="row">

<div class="col-lg-6" style="margin-left: 20px;width: 48%;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>Today New Request</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr >
      <th scope="col"> Type</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody>
  <%
  LinkedHashMap <String,String> LinkedHashMap4=(LinkedHashMap)request.getAttribute("scanimpression");
  if(LinkedHashMap4.size()==0){%>
	  <tr><td colspan="2" align="center"><b>No data found!</b></td></tr>
	  <%}else{ 
  for(Map.Entry<String,String> entry: LinkedHashMap4.entrySet()){%>
    <tr>
    <td><span><%=entry.getKey() %></span></td>
     <td><span><a href="ShowNewRequest?request=<%=entry.getKey()%>"><%= entry.getValue() %></a></span></td>   
    </tr>
    <%} }%>
  </tbody>
   <tfoot style="background:black;color:white;">
  <tr>
      <th scope="col">Type</th>
      <th scope="col">Total</th>
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