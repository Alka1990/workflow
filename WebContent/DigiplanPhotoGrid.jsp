
<%@page import="com.vo.MidAssessmentVo"%>
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
<%@page import="com.vo.NewQueryPhotoVo"%> 

<%
/* session = request.getSession(false);
if (session.getAttribute("userid") == null || session.getAttribute("userid").equals(""))
{
	response.sendRedirect("login.jsp?msg=You are not logged in..!");
}  */
List<NewQueryPhotoVo> list = (List)request.getAttribute("NewQueryPhotoList");
List<MidAssessmentVo> list1 = (List)request.getAttribute("MidAssessmentPhotoGrid");
String typeOfRequest = (String)request.getAttribute("typeOfRequest");

String doctor_name = "";
String patient_name = "";
%>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Workflow</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<script src="JavaScript/bootstrap.js"></script>
 <script src="JavaScript/custom.js"></script>

	
	<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
 
</head>

<body class="nav-md" >



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
    <div class="panel-heading">
     <% if(typeOfRequest.equals("Next Batch Required")) {  %>
    	<strong><%=typeOfRequest %></strong>
	<%}else if(typeOfRequest.equals("repeat")){  %> 
	<strong><%=typeOfRequest %></strong>

	<%}else if(typeOfRequest.equals("Retainer")){  %> 
	<strong><%=typeOfRequest %></strong>
	<%} %>
</div>
    <div class="table-responsive">
		
		
	
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
      <% if(typeOfRequest.equals("Next Batch Required") || typeOfRequest.equalsIgnoreCase("Retainer") || typeOfRequest.equalsIgnoreCase("Repeat")) { %>
    <table role="grid" id="newquery" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
    
      <tr role="row">
       <th class="sorting">Id</th>
        <th class="sorting">Case Id</th>
       <th class="sorting">Doctor Name</th>
       <th class="sorting">Patient Name</th>
       <th class="sorting">CRM Name</th>
       <th class="sorting">Type of Request</th>
       <th class="sorting">Created on</th></tr>
    </thead>
     <tbody> 
		     <%if(list.size()==0){ %>
     <tr>
     	<td colspan="7" align="center"><b>No Data Found!</b></td>
     </tr>
<%}else{ for(NewQueryPhotoVo newQueryPhotoVo:list){
doctor_name = newQueryPhotoVo.getDoctor_name();
patient_name =newQueryPhotoVo.getPatient_name(); 
String CrmName = newQueryPhotoVo.getCrm_name();
String typeOfCase = newQueryPhotoVo.getCase_type();

if(doctor_name==null)
	doctor_name="";
if(patient_name==null)
	patient_name="";
if(CrmName==null)
	CrmName="";
%>
		<tr class="even" role="row">
		 	<TD><a href="DigiplanPhotoShow.jsp?id=<%=newQueryPhotoVo.getCase_booking_id()%>&typeOfRequest=<%=typeOfRequest %>"><%= newQueryPhotoVo.getCase_booking_id() %></a></TD>
			<TD> <%= newQueryPhotoVo.getCase_id() %></TD>
			<TD> <%= doctor_name %></TD>
            <TD> <%= patient_name %></TD>
            <TD> <%= CrmName %>  </TD>
            <TD> <%= newQueryPhotoVo.getCase_type() %></TD>            
            <TD> <%= newQueryPhotoVo.getCreated_at()  %>  </TD>
			</tr>
		<% }}%>	 
    </tbody>
  </table>
  
  <% } else if(typeOfRequest.equals("Mid Scan")) { %> 
		    <table role="grid" id="other" class="table table-bordered table-striped table-hover dataTable">
    <thead style="background:black;color:white;">
      <tr role="row">
       <th class="sorting">Request Id</th>
        <th class="sorting">Case Id</th>
       <th class="sorting">Doctor Name</th>
       <th class="sorting">Patient Name</th>
       <th class="sorting">Request Status</th>
       <th class="sorting">Created on</th>
       <th class="sorting">Updated on</th>
       </tr>
    </thead>
     <tbody> 
		 <%if(list1.size()==0){ %>
     <tr>
     	<td colspan="7" align="center"><b>No Data Found!</b></td>
     </tr>
		<%}else{ for(MidAssessmentVo midAssessmentVo:list1){
		  doctor_name = midAssessmentVo.getDoctor_name();
		  patient_name = midAssessmentVo.getPatient_name();
		  String request_status = midAssessmentVo.getRequest_status();
		  String modifiedAt = midAssessmentVo.getModified_at();
		  if(doctor_name==null)
			  doctor_name="";
			if(patient_name==null)
				patient_name="";
			if(modifiedAt==null)
				modifiedAt="";
			if(request_status==null)%>
		<tr class="even" role="row">
		 	<TD><a href="DigiplanMidPhotoShow.jsp?id=<%=midAssessmentVo.getRequest_id()%>"><%= midAssessmentVo.getRequest_id() %></a></TD>
			<TD> <%= midAssessmentVo.getCaseid() %></TD>
			<TD> <%= doctor_name%></TD>
            <TD> <%= patient_name%></TD>
            <TD> <%= request_status %>  </TD>
            <TD> <%= midAssessmentVo.getCreated_date()%></TD>            
            <TD> <%=modifiedAt  %></TD>            
			</tr>
		<% }}%>	 
    </tbody>
  </table>
		<%} %>
  		<br><br>
  </div>
  </div>
</td>
        </tr>
    </thead>
    </table>
    			
  </div>
  </div>
  
   </div>

    
</body>

</html>
