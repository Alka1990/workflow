
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
    <div class="panel-heading"><strong>MyInvoice</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
	<% List<Newcase1> list = (List)request.getAttribute("newcaselist");
	 List<Newcase1> CRMLIST = (List)request.getAttribute("CRMLIST");
	List<Newcase1> INIlist = (List)request.getAttribute("INIlist");
	List<Newcase1> PRElist = (List)request.getAttribute("PRElist");
	List<Newcase1> CADBSlist = (List)request.getAttribute("CADBSlist");
	List<Newcase1> plnlist = (List)request.getAttribute("plnlist");
	List<Newcase1> REVlist = (List)request.getAttribute("REVlist");
	List<Newcase1> QAlist = (List)request.getAttribute("QAlist");
	List<Newcase1> Stagelist = (List)request.getAttribute("Stagelist");
	List<Newcase1> STGlist = (List)request.getAttribute("STGlist");
	List<Newcase1> MPTlist = (List)request.getAttribute("MPTlist");
	List<Newcase1> TDPlist = (List)request.getAttribute("TDPlist");	
	List<Newcase1> LABlist = (List)request.getAttribute("LABlist");
	List<Newcase1> FQClist = (List)request.getAttribute("FQClist");
	List<Newcase1> DPHlist = (List)request.getAttribute("DPHlist");
	List<Newcase1> StageQueryForStarterList = (List)request.getAttribute("StageQueryForStarterList");
	List<Newcase1> MPTQueryForStarterList = (List)request.getAttribute("MPTQueryForStarterList");
	List<Newcase1> TDPQueryForStarterList = (List)request.getAttribute("TDPQueryForStarterList");
	
	List<Newcase1> LABQueryForStarterList = (List)request.getAttribute("LABQueryForStarterList");
	List<Newcase1> FQCQueryForStarterList = (List)request.getAttribute("FQCQueryForStarterList");
	List<Newcase1> DPHQueryForStarterList = (List)request.getAttribute("DPHQueryForStarterList");
	List<String> userRight =LoginDAO.getRight((String)request.getAttribute("username"));
	%>
	<table class="fontTable" align="center">	
	<input type="hidden" name="username" id="logusername" value='<%=request.getAttribute("username")%>'/>
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
		</table>
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
    <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead>
      <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">STARTER DOCTOR </th>
        <th class="sorting"> DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
         <th class="sorting">CRM NAME </th>
        
      </tr>
    </thead>
     <%  if(userRight.contains("WFC")){ for(Newcase1 Nc:list){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
				 
			</tr>	
<% }
}
     else
%>	

 <% if(userRight.contains("PRE")){
for(Newcase1 Nc:CRMLIST){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
				 
			</tr>	
<% }}%>	
<% if(userRight.contains("INI")){
for(Newcase1 Nc:INIlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%= Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
				
			</tr>	
<% }}%>	

<% if(userRight.contains("CADBS")){
for(Newcase1 Nc:PRElist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
				
			</tr>	
<% }}%>	
<% if(userRight.contains("OTPLN")){
for(Newcase1 Nc:CADBSlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="AddPlanning?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%>

	<% if(userRight.contains("UPL")){
for(Newcase1 Nc:plnlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%>	
<% if(userRight.contains("REV")){
for(Newcase1 Nc:REVlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="AddPlanning?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("PRE")){
for(Newcase1 Nc:QAlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="AddPlanning?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("STG")){
	
for(Newcase1 Nc:Stagelist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="newplanning.jsp?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("MPT")){
	
for(Newcase1 Nc:STGlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("3DP")){
	
for(Newcase1 Nc:MPTlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="newcaseshow1?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("Lab")){
	
for(Newcase1 Nc:TDPlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("FQC")){
	
for(Newcase1 Nc:LABlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("PCK")){
	
for(Newcase1 Nc:FQClist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%><% if(userRight.contains("DPH")){
	
for(Newcase1 Nc:DPHlist){	
	%>
    <tbody>
		<tr class="even" role="row">
		        <TD><a href="Multifrm?caseId=<%=  Nc.getCaseid()%>&crm=<%=  Nc.getCrm()%>&cdoc=<%=  Nc.getCdoctorname()%>&patient_Name=<%=  Nc.getPatient_Name()%> "><%=  Nc.getCaseid() %></a></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <%= Nc.getCrm() %></TD>
				
			</tr>	
<% }}%>
    	
    </tbody>
  </table>
  		<br><br>	
  </div>
  </div>
  <% if(userRight.contains("MPT") || userRight.contains("3DP") || userRight.contains("Lab") || userRight.contains("FQC") || userRight.contains("PCK") ){
  	 %>
<H1><center>Starter Kit Cases</center></H1>
     <table class="fontTable" align="center">	
	
	<tr id="mesg"><td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td></tr>
		</table>
    <table id="myinvoice" class="table table-bordered">
    <thead>
    <tr>
        <td colspan="9">
<div class="col-lg-12">
    <div class="table-responsive">
    <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
    <thead>
      <tr role="row">
        <th class="sorting">CASE_ID</th>
        <th class="sorting">REGISTERED DOCTOR </th>
        <th class="sorting"> DOCTOR NAME </th>
        <th class="sorting">LAST STAGE </th>
        <th class="sorting">REMARK </th>
          <th class="sorting">DECISION </th>
      </tr>
    </thead>
     <% } if(userRight.contains("MPT")){
    	 for(Newcase1 Nc:StageQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                   <option value="MTPSTRKIT">Starter Kit Approved</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%> <%  if(userRight.contains("3DP")){
    	 for(Newcase1 Nc:MPTQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                   <option value="3DPSTRKIT">Starter Kit Approved</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%><%  if(userRight.contains("Lab")){
    	 for(Newcase1 Nc:TDPQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                   <option value="LABSTRKIT">Starter Kit Approved</option>
                    <option value="3DPSTRKITCOR">3D Print Correction</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%><%  if(userRight.contains("FQC")){
    	 for(Newcase1 Nc:LABQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                <option value="FQCSTRKIT">Starter Kit Approved</option>
                   <option value="LABSTRKITCOR">LAB Correction</option>
                    <option value="3DPSTRKITCOR"> 3D Print Correction</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%>
     
     
   	<%  if(userRight.contains("PCK")){
    	 for(Newcase1 Nc:FQCQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                <option value="PCKSTRKIT">Starter Kit Approved</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%>
       	<%  if(userRight.contains("DPH")){
    	 for(Newcase1 Nc:DPHQueryForStarterList){	
	%>
	
	
    <tbody>
		<tr class="even" role="row">
		        <TD><%=  Nc.getCaseid() %></TD>
         		<TD> <%=Nc.getRdoctorname() %></td>
                <TD> <%= Nc.getCdoctorname() %></TD>
              <TD> <%= Nc.getCase_stage() %></TD>
              <TD> <input type ="text" id="remark<%=  Nc.getCaseid()%>" ></TD>
               <TD> <select id ="listid<%=  Nc.getCaseid()%>" onchange="changelist(<%=  Nc.getCaseid()%>)">
                <option value="0" >---Select Decision--</option>
                <option value="DPHSTRKIT">Starter Kit Dispatched</option>
                <option value="PCKSTRKITCOR">Packing Correction</option>
                
                </select> 
                
               </TD>
				 
			</tr>	
<% }

     }%>
   	
    </tbody>
  </table>
    	
    	
  </div>
  </div>
  
   </div>
		</form>

                 <!-- footer content -->

                   
                <!-- /footer content -->
            </div>
            <!-- /page content -->

   
  <script>
   function changelist(x) {
	  var remarkId="remark"+x;
	  var remark=document.getElementById(remarkId).value;
	  var listid="listid"+x;
	  var id=document.getElementById(listid).value;
    //var select = document.createElement("select");
   // alert("select==="+id+ "||"+x);
   console.log(id);
if(id==='3DPSTRKITCOR'||id==='LABSTRKITCOR'||id==='PCKSTRKITCOR'){
	
	if(remark===''||remark==null||remark=='undefind'){
		
		alert("Please fill the remark");
			
	}
	alert(id);
	$.ajax({
		
	    type : 'GET',
		//data : {caseid:x},
		url : 'StageChange?case_id='+x+'&case_stage='+id+'&remark='+remark,
		success : function(responseText) {
			
			var x=responseText;
			//alert(x);
			location.reload();
			
		}
	});

	

}
else if(id==='0'){
	alert("Please Select");

	
}else{
$.ajax({
		
	    type : 'GET',
		url : 'StageChange?case_id='+x+'&case_stage='+id+'&remark='+remark,
		success : function(responseText) {
			
			var x=responseText;
			//alert(x);
			location.reload();
			
		}
	});
}
     }


   </script> 
   
       

<script>





/* function startcase(x){

	$.ajax({
	
	    type : 'POST',
		data : {caseid:x},
		url : 'Startcase',
		success : function(responseText) {
			
			var x=responseText;
			alert(x);
			location.reload();
			
		}

	  
		 
	});
	
} */
</script>
    
</body>

</html>
