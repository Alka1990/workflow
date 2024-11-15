<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.*"%>
<%@page import="java.math.*"%>
<%@page import="java.text.*"%>
<%@page import="com.vo.SearchVO"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>:: WorkFlow Search ::</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/logo.png">
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/JavaScript/StyleSheet/tether.min.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.2.1/moment.min.js"></script>
<style>
table.dataTable thead .sorting:after, table.dataTable thead .sorting:before,
	table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_asc:before,
	table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_asc_disabled:before,
	table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_desc:before,
	table.dataTable thead .sorting_desc_disabled:after, table.dataTable thead .sorting_desc_disabled:before
	{
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

label {
	display: inline-block;
	max-width: 100%;
	margin-bottom: 5px;
	font-weight: bold;
}
</style>
<script>

function getAllnewQueryRequest() {
	
	


	

    $.ajax({
        type: 'GET',
        url: 'http://112.196.167.2:8080/scanupload/api/getAll',
        success: function (response) {
            console.log(response);
        if(response.status_code == '200'){
        	
        	let html="";
        	
        	
    		  for (let i = 0; i < response.results.length; i++) {
    			  
    			    let caseId = response.results[i].caseId;
    	        	let patientName = response.results[i].patientName;
    	        	let doctorName = response.results[i].doctorName;
    	        	let expectedDeliveryDate = response.results[i].expectedDeliveryDate;
    	        	let createdAt = response.results[i].createdAt;
    	        	
    	        	if(caseId!=null){
    				  caseId = response.results[i].caseId;
    			  }else
    				  caseId = "";
    			  
    			  if(patientName!=null){
    				  patientName = response.results[i].patientName;
    			  }else
    				  patientName = "";
    			  
    			  if(doctorName!=null){
    				  doctorName = response.results[i].doctorName;
    			  }else
    				  doctorName = "";
    			  
    			  if(expectedDeliveryDate!=null){
    				  expectedDeliveryDate = response.results[i].expectedDeliveryDate;
    			  }else
    				  expectedDeliveryDate = "";
    			  
    			  if(createdAt!=null){
    				  createdAt = response.results[i].createdAt;
    			  }else
    				  createdAt = "";
    		
    			   //expectedDeliveryDate  = moment(expectedDeliveryDate).format("DD-MM-YYYY");
    			   createdAt = moment(createdAt).format("DD-MM-YYYY HH:mm:ss");
    			
    			   html += '<tr>' +
    			    '<td><a href="newQuery.jsp?reqId=' + response.results[i].caseBookingId + '">' + response.results[i].caseBookingId + '</a></td>' +
    			    '<td>' + caseId + '</td>' +
    			    '<td>' + patientName + '</td>' +
    			    '<td>' + doctorName + '</td>' +
    			    '<td>' + expectedDeliveryDate + '</td>' +
    			    '<td>' + createdAt + '</td>' +
    			'</tr>';
    		  }
    		 $(".newquery-table").find("tbody").append(html);
        }
        },
        error: function (error) {
            console.error('Error occurred:', error);
        }
    });
}
</script>
</head>
<body class="nav-md" onload="getAllnewQueryRequest()">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<%@ include file="TopBar.jsp"%>
					<%@ include file="LeftTopSide.jsp"%>
					<%@ include file="SideBar.jsp"%>

				</div>
			</div>
			<%@ include file="TopNavigation.jsp"%>
			<div class="right_col" role="main">
				<div class="container" style="padding-top: 20px;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<strong>New Query Request Data</strong>
						</div>
					
						<div class="row"
							style="margin-bottom: 20px; width: 98%; margin-left: 1%;">
							<div class="col-lg-12"><br>
								<table id="dtBasicExample "
									class="table table-striped table-bordered table-sm dataTable w-auto newquery-table"
									role="grid" aria-describedby="dtBasicExample_info"
									style="width: 100%;">
									<thead>
										<tr>
											<th>Request Id</th>
											<th>Case Id</th>
											<th>Patient Name</th>
											<th>Doctor Name</th>
											<th>Delivery Date</th>
											<th>Created Date</th>
										</tr>
									</thead>
									<tbody>
										
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script
		src="${pageContext.request.contextPath}/JavaScript/javascript/tether.min.js"></script>




</body>
</html>