
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
<%@page import="com.vo.SearchVO"%> 
 
 <% List<SearchVO> list = (List)request.getAttribute("searchvo");%>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/logo.png">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>:: WorkFlow Search :: </title>
    
    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->   
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/StyleSheet/jquery.dataTables.min.css" /> 
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/JavaScript/StyleSheet/tether.min.css">

<script src="${pageContext.request.contextPath}/JavaScript/javascript/tether.min.js"></script>
 
 <style>
table.dataTable thead .sorting:after,
table.dataTable thead .sorting:before,
table.dataTable thead .sorting_asc:after,
table.dataTable thead .sorting_asc:before,
table.dataTable thead .sorting_asc_disabled:after,
table.dataTable thead .sorting_asc_disabled:before,
table.dataTable thead .sorting_desc:after,
table.dataTable thead .sorting_desc:before,
table.dataTable thead .sorting_desc_disabled:after,
table.dataTable thead .sorting_desc_disabled:before {
  bottom: .5em;
}


.dataTables_wrapper .dataTables_filter input {
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    margin-left: 3px;
}

.dataTables_wrapper .dataTables_length select {
    border: 1px solid #aaa;
    border-radius: 3px;
    padding: 5px;
    background-color: transparent;
    padding: 4px;
}

</style>
<script>
// Basic example
$(document).ready(function () {
  $('#dtBasicExample').DataTable();
  $('.dataTables_length').addClass('bs-select');
});
</script>
</head>


<body class="nav-md" >
<form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/SearchCaseValue" target="_self" >

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
            <input type="hidden" name="username" value='<%=request.getAttribute("username")%>'/> 
<div class="container" style="padding-top:20px;">
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Search Screen</strong> </div>
    <div class="table-responsive" style="margin-left:20px;margin-right:20px">
	

     <div id="dtBasicExample_wrapper" class="dataTables_wrapper dt-bootstrap4" style="overflow: auto;overflow-x: hidden;overflow-y: hidden;">
<br>
  <div class="row">
    <div class="col-sm-12">
      <table id="dtBasicExample" class="table table-striped table-bordered table-sm dataTable w-auto" cellspacing="0" width="100%" role="grid" aria-describedby="dtBasicExample_info" style="width: 100%;">
        <thead style="color: #fff;background-color:#337ab7;">
          <tr role="row" >
            <th class="th-sm sorting_desc" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Name
          : activate to sort column ascending" style="width: 30px;" aria-sort="descending">Case Id </th>
            <th class="th-sm sorting" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Position
          : activate to sort column ascending" style="width: 50px;">Patient Name</th>
            <th class="th-sm sorting" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Office
          : activate to sort column ascending" style="width: 40px;">Doctor Name </th>
            <th class="th-sm sorting" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Age
          : activate to sort column ascending" style="width: 20px;">Phone </th>
            <th class="th-sm sorting" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Start date
          : activate to sort column ascending" style="width: 40px;">CRM Name </th>
            <th class="th-sm sorting" tabindex="0" aria-controls="dtBasicExample" rowspan="1" colspan="1" aria-label="Salary
          : activate to sort column ascending" style="width: 120px;">Clinic Name </th> 
          </tr>
        </thead>
        <tbody>
          <%
    	 for(SearchVO svo:list)
    	 {
    	 String Patient_Name=svo.getPatient_Name();
    	 String Doctor_Name=svo.getDoctor_Name();
    	 String crm=svo.getCrm_name() ;
    	 if(Patient_Name==null){
    		 Patient_Name="";
		 	 }
    	 if(Doctor_Name==null){
    		 Doctor_Name="";
		 	 }
    	 if(crm==null){
    		 crm="";
		 	 }
    	 
    	 %>
    	 
          <tr role="row" class="odd">
<%--             <td class="sorting_1"><%=svo.getCase_Id()%></td>
 --%>            
 		
 		     <TD>
 		     <a href="Approval?caseId=<%=svo.getCase_Id() %>&logusername=<%=request.getAttribute("username")%>&NxtStage=<%=svo.getBatch_stage() %>&SearchStage=Y"><%=svo.getCase_Id()%></a></TD>
 
          <td><%=Patient_Name %></td>
            <td><%=Doctor_Name %></td>
            <td><%=svo.getPhone() %></td>
            <td><%=crm%></td>
             <td><%=svo.getClinic_Name() %></td> 
          </tr>
          <%}%> 

        </tbody>
        <tfoot  style="color: #fff;background-color: #337ab7;">
          <tr >
            <th rowspan="1" colspan="1">Case Id </th>
            <th rowspan="1" colspan="1">Patient Name </th>
            <th rowspan="1" colspan="1">Doctor Name </th>
            <th rowspan="1" colspan="1">Phone </th>
            <th rowspan="1" colspan="1">CRM Name </th>
            <th rowspan="1" colspan="1">Clinic Name </th>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
  <br>
</div>

  </div>
  </div>
  
   </div>
		</form>
		
                <!-- /footer content -->
            </div>
            <!-- /page content -->
    <script stype="text/javascript" rc="${pageContext.request.contextPath}/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
 	<script src="${pageContext.request.contextPath}/JavaScript/jquery.dataTables.min.js"></script> 
 
</body>
</html>
