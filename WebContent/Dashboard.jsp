<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.vo.Newcase1"%> 
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Workflow :: Dashboard</title>
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
	<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
 	<script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

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
   display:block;
   height: 400px;
  
}
.table{
  margin-bottom:0px;
}
th{
  padding: 6px 5px !important;
}
.sorting{
font-size:1.2rem;
}
.panel-heading{
   padding: 5px 5px
}
.left_col{
  width:100%;
}

</style>

</head>
<body class="nav-md" style="background: black;">
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
             <div class="right_col" role="main"><div class="badge-notification">
<i class="fa fa-bell fa-5x fa-border icon-grey badge"></i>
</div>
<div class="container">

  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Dashboard</strong> </div>


<br>

<div class="container">

<div class="row">
<div class="col-xs-12 col-sm-6" style="padding: 0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black; padding-left:5px;"><b>Batch</b></div>
<div class="panel-body" style="padding:0px;">
<div class="card-body scrollable" >
	    <table class="table table-bordered table-striped table-hover dataTable">
  <thead style="background:black; color:white;">
    <tr>
      <th scope="col">Stage</th>
      <th scope="col">Total</th>
    </tr>
            
  </thead>
  <tbody>
     <% 
     int serialNo=0;
     String key="";
     String value="";
          LinkedHashMap<String, String> linkedHashMap= (LinkedHashMap)request.getAttribute("Case_stage");
          for (Map.Entry<String,String> entry : linkedHashMap.entrySet())	
          {  
           %>
           
             <tr>
  <td> <span><%=entry.getKey()%></span> </td>          
  <td><span><a href="ShowPendingCases?casestage=<%=entry.getKey()%>"><%= entry.getValue() %></a></span></td>          
      </tr>
      <% serialNo++;
      }
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


<div class="col-xs-12 col-sm-6" style="padding: 0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>Starter Kit</b></div>
<div class="panel-body" style="padding:0px;">
<div class="card-body scrollable">

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
<div class="col-xs-12 col-sm-6" style="padding:0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading "style="color:black;" title="Total Hold Cases : <%=list.size()%>"><b>Hold Cases</b></div>
<div class="panel-body" style="padding:0px;">
<div class="card-body scrollable" >
    <table class="table table-bordered table-striped table-hover dataTable">
  <thead style="background:black;color:white;">
    <tr role="row">
        <th class="sorting">Case id</th>
        <th class="sorting">Doctor name </th>
        <th class="sorting">Last stage </th>
         <th class="sorting">Crm </th>
        
      </tr>
    </thead>
        <tbody>
        <% if(list.size()==0){%>
    	  <tr>
    	   <td colspan="4" align="center">No data found!</td>
    	   </tr>
    <%  }
        else{ 
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
<% }}%>  <tbody>

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
<div class="col-xs-12 col-sm-6" style="padding:0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total Pending for Sign Off Cases : <%=list2.size()%>"><b>Pending for Sign Off </b></div>
<div class="panel-body">
<div class="card-body scrollable" >
<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Case id </th>
      <th scope="col">Doctor name</th>
      <th scope="col">Patient name</th>
      <th scope="col">Crm</th>
    </tr>
  </thead>
    <tbody>
    
      <% if(list2.size()==0){%>
    	  <tr>
    	   <td colspan="4" style="text-align:center !important;">No data found!</td>
    	   </tr>
    <%  }
      else{
     
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
<% }}%>  <tbody>
  <tfoot style="background:black;color:white;">
   <tr>
      <th scope="col">Case id</th>
      <th scope="col">Doctor name</th>
      <th scope="col">Patient name</th>
      <th scope="col">Crm</th>
    </tr>
    </tfoot>
</table>
    						    
</div>
</div>
</div> 


</div>

<% List<Newcase1> list3= (List)request.getAttribute("rejectedlist");%>
<div class="">
<div class="col-xs-12 col-sm-6" style="padding: 0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total Rejected Cases : <%=list3.size()%>"><b>Rejeced Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >

<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
     <tr>
      <th scope="col">Case id </th>
      <th scope="col">Doctor name</th>
      <th scope="col">Patient name</th>
      <th scope="col">Crm</th>
    </tr>
  </thead>
    <tbody>
    <% if(list3.size()==0){%>
    	  <tr>
    	   <td colspan="4" style="text-align:center !important;">No data found!</td>
    	   </tr>
    <%  }else{
  
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
  <%} }%>
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
<div class="col-xs-12 col-sm-6"style="padding: 0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;" title="Total PPF Pending Cases : <%=list4.size()%>"><b>PPF Pending Cases</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col">Case id </th>
      <th scope="col">Doctor name</th>
      <th scope="col">Patient name</th>
      <th scope="col">Crm</th>
    </tr>
  </thead>
  <tbody>
  <% if(list4.size()==0){%>
    	  <tr>
    	   <td colspan="4" style="text-align:center !important;">No data found!</td>
    	   </tr>
    <%  }else{
   for(Newcase1 ppf: list4){
	 
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
    <%} }%>
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

<div class="">

<div class="col-xs-12 col-sm-6" style="padding:0 15px;">
<div class="panel panel-info" style="border-color: #007bff!important;">
<div class="panel-heading " style="color:black;"><b>Today New Request</b></div>
<div class="panel-body">
<div class="card-body scrollable" >
		<table class="table table-bordered table-striped table-hover dataTable " >
  <thead style="background:black;color:white;">
    <tr>
      <th scope="col"> Type</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody>
  <%
  LinkedHashMap <String,String> LinkedHashMap4=(LinkedHashMap)request.getAttribute("scanimpression");
  if(LinkedHashMap4.size()==0){%>
	  <tr><td colspan="2" style="text-align:center !important;"><b>No data found!</b></td></tr>
	  <%}else{ 
  for(Map.Entry<String,String> entry: LinkedHashMap4.entrySet()){%>
    <tr>
    <td><span><%=entry.getKey() %></span></td>
     <td><span><a href="ShowNewRequest?request=<%=entry.getKey()%>"><%= entry.getValue() %></a></span></td>   
    </tr>
    <%} }
    %>
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
