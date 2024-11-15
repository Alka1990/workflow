    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.vo.ExportVo"%> 
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
 
 <% 
 System.out.println("entering...............=");

 
 List<ExportVo> list = (List)request.getAttribute("exportlist");
 
 %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> :: Workflow Export Delivery Details :: </title>
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
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.0/xlsx.full.min.js"></script>
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
             <div class="badge-notification">
<i class="fa fa-bell fa-5x fa-border icon-grey badge"></i>
</div>

<div class="container" style="padding-top:20px;">

  <div class="panel panel-primary">
  <div class="panel-heading"><strong>Export Data</strong> </div>
<br>

<div class="row">
<div class="col-lg-11" style="margin-left:40px;">
<div class="panel panel-info">
<div class="panel-heading "style="color:black;" ><b></b></div>
<div class="panel-body">

<div class="card-body scrollable"  style="overflow-x:auto;" >
    <table class="table table-bordered table-striped table-hover dataTable"  id="exportdata">
  <thead style="background:black;color:white;">
    <tr role="row">
        <th class="sorting">Case Id </th>
        <th class="sorting">Patient Name </th>
        <th class="sorting">Doctor Name </th>
         <th class="sorting">Tracking Id </th>
      </tr>
    </thead>
         <tbody>
     <% if(list.size()==0){%>
    <tr><td colspan="4" align="center"><b>No data found!</b></td></tr>
  <%}else{
    	 for(ExportVo ex:list){	
	%>
		<tr class="even" role="row">
         		<TD><span> <%=ex.getCase_id()%></span></td>
         		<TD><span> <%=ex.getPatient_Name()%></span></td>
                <TD><span> <%= ex.getDoctor_Name()%></span></TD>
                <TD> <span><%=ex.getTracking_id()%></span></TD> 
			</tr>	
<%} }%>  <tbody> 
  </tbody>

</table> 

</div>	
 <% if(list.size()!=0){%>
<table align="center">
<tr >

<td >
<button class="btn btn-success" onclick="ExportToExcel('xls')" style="float:right;"><i class="fa fa-file-excel-o"></i> Export to Excel</button> 
</td>
</tr>
</table>	
<%}%>				    
</div>
</div>
</div>
</div>
        </div>
    </div>
    			
    <script>
    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
    var yyyy = today.getFullYear();
    today = mm + '/' + dd + '/' + yyyy;
    
        function ExportToExcel(type, fn, dl) {
            var elt = document.getElementById('exportdata');
            var wb = XLSX.utils.table_to_book(elt, { sheet: "ExportData" });
            return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('ExportDeliveryDetails_'+today+'.' + (type || 'xls')));
        }

    </script>
</body>
</html>