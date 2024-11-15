
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.MathContext"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="com.vo.Newcase1"%> 
<%@ page import="com.workflow.connection.LoginDAO" %>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Workflow</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
      

 
<script src="JavaScript/bootstrap.js"></script>
 
 <script src="JavaScript/custom.js"></script>
 <script type="text/javascript" class="init">
	


	</script>
	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 

 
</head>

<body class="nav-md" >


<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >

<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
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
    <div class="panel-heading"><strong>Cases</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
	<% List<Newcase1> list = (List)request.getAttribute("list_casestage");
 String type=(String)request.getAttribute("type");

 %>
	<table class="fontTable" align="center">	
	<input type="hidden" name="username" id="logusername" value='<%=request.getAttribute("username")%>' />
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
		</table>
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
<td colspan="9">
<div class="col-lg-12">
    <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background-color:black;color:white;">
      <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">STARTER DOCTOR </th>
        <th class="sorting"> DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
         <th class="sorting">LAST USER</th>
		 <th>DATE</th>        
      </tr>
    </thead>
     <%   int days=0;
    	  int hours=0;
    	  int days1=0;
    	  int hours1=0;
    	 for(Newcase1 Nc:list){	
    		 String crm=Nc.getCrm();
        	 if(crm==null)
        		{crm="";}
        		else{crm=Nc.getCrm();}
        	  days=Nc.getDays();
        	  hours=Nc.getHours();
        	  days1=Nc.getDays1();
        	  hours1=Nc.getHours1();
        	  String stage="";
        	 
              if(type.equals("STRKIT")){ 
            	   stage=Nc.getStarter_case_stage();
              }
              else{
            	   stage=Nc.getCase_stage();
              }
        	 
        	  //WORK FLOW CHECK
              if(stage.equals("INI")){
        		  stage="Case Initiated"; 
        	  }
        	  if(stage.equals("WFCCOR")){
        		  stage="Work Flow Check Correction"; 
        	  }
        	   //CASE INITIATED
        	  if(stage.equals("INICOR")){
        		  stage="INITIATION CORRECTION"; 
        	  } 
        	  
        	  //PREREQUISITE CHECK
        	  if(stage.equals("PRE")){
        		  stage="Prerequisite"; 
        	  }
        	  if(stage.equals("WFC")){
        		  stage="Work Flow Check"; 
        	  }
        	  
        	/* //CAD BAISING SEGMENTATION
        	  if(stage.equals("PRE")){
        		  stage="Prerequisite"; 
        	  } */
        	
        	//PLANNING
        	  if(stage.equals("PLNCOR")){
        		  stage="Planning Correction"; 
        	  }
        	  if(stage.equals("CADBS")){
        		  stage="CAD Baising Segmentation"; 
        	  }
        	  
        	  //UPLOAD
        	  if(stage.equals("PLN")){
        		  stage="Planning"; 
        	  }
        	  if(stage.equals("UPLCOR")){
        		  stage="Upload Correction"; 
        	  }
        	  
        	//REVIEW
        	  if(stage.equals("UPL")){
        		  stage="Upload"; 
        	  }
        	  
        	//QUALITY ASSURANCE
        	  if(stage.equals("REV")){
        		  stage="Review"; 
        	  }
        	
        	//STAGGING
        	  if(stage.equals("QA")){
        		  stage="Quality Assurance"; 
        	  }
        	
        	//HOLLOW TAGING
        	  if(stage.equals("STG")){
        		  stage="Stagging"; 
        	  }
        	
        	//3D PRINTING
        	  if(stage.equals("MPT")){
        		  stage="MPT"; 
        	  }
        	  if(stage.equals("3DPCOR")){
        		  stage="3D Printing Correction"; 
        	  }
        	  
        	  //LAB
        	  if(stage.equals("3DP")){
        		  stage="3D Printing"; 
        	  }
        	  if(stage.equals("LABCOR")){
        		  stage="Lab Correction"; 
        	  }
        	  
        	  //FQC
        	  if(stage.equals("LAB")){
        		  stage="Lab"; 
        	  }
        	  
        	  //PACKING
        	  if(stage.equals("FQC")){
        		  stage="FQC"; 
        	  }
        	  if(stage.equals("PCKCOR")){
        		  stage="Packaging Corection"; 
        	  }
        	
        	  //DISPATCH
        	  if(stage.equals("PCK")){
        		  stage="Packaging"; 
        	  }
        	 
        	  
			//////////////////////////////////////////////////////
			
           //MTPSTRKIT
           if(stage.equals("INISTRKIT")){
        		 stage="Starter Case Initiated"; 
           }
        	  
		   //3DPSTRKIT
		   if(stage.equals("MTPSTRKIT")){
				stage="Hollo Taging Starter kit "; 
		  }
		  if(stage.equals("3DPSTRKITCOR")){
				stage="3D Print Starter kit Correction"; 
		   }

		  //LABSTRKIT
      	  if(stage.equals("3DPSTRKIT")){
      		  stage="3D Print Starter kit "; 
      	  }
      	  if(stage.equals("LABSTRKITCOR")){
      		  stage="LAB Starter Kit Correction"; 
      	  }
      	  
      	  //FQCSTRKIT
    	  if(stage.equals("LABSTRKIT")){
    		  stage="LAB Starter kit"; 
    	  }
   
    	  //PCKSTRKIT
    	  if(stage.equals("FQCSTRKIT")){
    		  stage="Finishing Quality Check Starter Kit"; 
    	  }
    	  if(stage.equals("PCKSTRKITCOR")){
    		  stage="Packaging Starter Kit Correction"; 
    	  }
    	  
    	  //DISPATCHSTRKIT
    	  if(stage.equals("PCKSTRKIT")){
    		  stage="Packaging Starter Kit "; 
    	  }

          //System.out.println("Case Id : "+Nc.getCaseid()+" days : "+days+" days : "+days+" hours : "+hours+" hours1 : "+hours1);
	  %>
	
    <tbody>
    <% 
    
    
    if(days>1 || days==1 ||   days1>1 || days1==1){%>
		<tr class="even" role="row" style="color:red;">
		 <TD><a style="color:red;" href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage()%>&SearchStage=Y"><%=Nc.getCaseid() %></a></TD>
         <TD> <%=Nc.getRdoctorname() %></td>
         <TD> <%= Nc.getCdoctorname() %></TD>
         
    
         <TD> <%= stage %></TD>
		
         
         <TD> <%=crm %></TD> 
                  <%if(Nc.getUser_id()!=null) {%>
         <TD> <%= Nc.getUser_id() %></TD>
         <% }else{%>
         <TD></TD>
         <%}if(Nc.getStage_at()!=null) {%>
         <TD> <%= Nc.getStage_at() %></TD>
         <% }else{%>
         <TD></TD>
         <% }%>
	   </tr>
	   <%} else if(hours>12  || hours==12 || hours1>12 || hours1==12 ){
		   
	   %>	
	   <tr class="even" role="row" style="color:blue;">
		 <TD><a style="color:blue;" href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage()%>&SearchStage=Y"><%=Nc.getCaseid() %></a></TD>
         <TD> <%=Nc.getRdoctorname() %></td>
         <TD> <%= Nc.getCdoctorname() %></TD>
     
         <TD> <%= stage %></TD>
            
         <TD> <%=crm %></TD> 
                  <%if(Nc.getUser_id()!=null) {%>
         <TD> <%= Nc.getUser_id() %></TD>
         <% }else{%>
         <TD></TD>
         <%}if(Nc.getStage_at()!=null) {%>
         <TD> <%= Nc.getStage_at() %></TD>
         <% }else{%>
         <TD></TD>
         <% }%>
	   </tr>
	   <%} else{

		   
	   %>
	   <tr class="even" role="row"  style="color:green;">
		 <TD><a style="color:green;" href="Approval?caseId=<%=  Nc.getCaseid() %>&logusername=<%= request.getAttribute("logUser") %> &NxtStage=<%=Nc.getCase_stage()%>&SearchStage=Y"><%=Nc.getCaseid() %></a></TD>
         <TD> <%=Nc.getRdoctorname() %></td>
         <TD> <%= Nc.getCdoctorname() %></TD>
         <TD> <%= stage %></TD>
         <TD> <%=crm %></TD> 
                  <%if(Nc.getUser_id()!=null) {%>
         <TD> <%= Nc.getUser_id() %></TD>
         <% }else{%>
         <TD></TD>
         <%}if(Nc.getStage_at()!=null) {%>
         <TD> <%= Nc.getStage_at() %></TD>
         <% }else{%>
         <TD></TD>
         <% }%>
	   </tr>
	   <%} %>
<% } %>
    

   
       

</body>

</html>
