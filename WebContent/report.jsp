<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css"
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
	href="/Workflow/JavaScript/StyleSheet/tether.min.css">
<script type="text/javascript"
	src="/Workflow/JavaScript/jquery-1.10.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
<script type="text/javascript"
	src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>

<script type="text/javascript">
	function callModal() {
		$('#myModal').modal({
			backdrop : 'static',
			keyboard : false

		});
	};
</script>
<style>
.table-bordered>tbody>tr>td {
	text-align: left;
}

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
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
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

.close:hover, .close:focus {
	text-decoration: none;
	cursor: pointer;
}

.table-bordered>thead>tr>th, .table-bordered>thead>tr>td {
	padding: 6px 5px;
}

.scrollable {
	white-space: nowrap;
}

.panel-body {
	padding: 0px;
}
</style>
<style>
.mt-1 {
	margin-top: 10px !important;
}

.fixTableHead {
	overflow-y: auto;
	height: 110px;
}

.scrollable {
	overflow-y: scroll;
	display: block;
	height: 400px;
}

th {
	padding: 6px 5px !important;
}

.sorting {
	font-size: 1.2rem;
}

.panel-heading {
	padding: 5px 5px
}

.left_col {
	width: 100%;
}
</style>
<style>
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

#loading {
	position: fixed;
	display: block;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	text-align: center;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
}

#loading-image {
	position: absolute;
	top: 30%;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	z-index: 100;
}

table {
	border-spacing: 0px;
	border-radius: 10px;
	background: #fff;
	color: #000;
	margin-bottom: 8px;
	transition: all 0.5s;
}

.panel-primary>.panel-heading {
	background-color: #fff;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	border-radius: 12px;
}

.panel-primary {
	border: none;
	border-radius: 12px;
}

.button, input, optgroup, select, textarea {
	color: #000;
}

.execute-process-wrap {
	padding: 2px 0;
}

.date-picker {
	display: flex;
	align-items: center;
	margin: 0 10px;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	width: 98%;
	margin: 0 auto 12px;
	padding: 12px 9px;
	border-radius: 12px;
}

.date-picker label {
	margin: 5px 5px;
	font-size: 1.3rem;
	color: #000;
	font-size: 1.3rem;
}

.choose-type label {
	max-width: 120px;
	width: 100%;
	color: #000;
}

.input-group {
	margin-right: 5px;
	margin-bottom: 0px;
}

.form-control:focus {
	boredr: none;
	box-shadow: none;
}

.choose-type form {
	width: 100%;
	max-width: 124px;
	margin: 0 10px 10px;
}

.choose-type select {
	width: 100%;
	padding: 2px 20px;
	box-shadow: 1px 1px 2px 1px rgba(136, 134, 134, 0.75);
}

.choose-type {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	padding: 20px 0;
	border-radius: 12px;
	max-width: 98%;
	margin: 0 auto 12px;
}

.btn {
	box-shadow: 1px 1px 2px 1px rgba(136, 134, 134, 0.75) !important;
	border-radius: 4px;
	border: 1px solid #ccc;
	color: #000;
	padding: 3px 12px;
}

.btn:hover {
	background-color: #000;
	color: #fff;
}
/* table-wrap */
table, th, td {
	border: 1px solid #ddd;
	border-collapse: separate;
}

.table-wrap {
	margin-left: 230px;
}

thead {
	white-space: nowrap;
	box-shadow: 0 4px 6px -6px #222;
}

th {
	padding: 5px;
	font-weight: 400;
}

.table-wrap .table-content {
	overflow-x: scroll;
}

form {
	outline: none;
	border: none;
}

label {
	font-weight: 600;
}

th {
	background-color: #6071cc;
	color: #fff;
}

.table-content h2 {
	font-size: 1.6rem;
	margin: 10px 0;
	color: #000;
}

tbody th {
	border-bottom: 1px solid #111;
}

.features-btn {
	color: #000;
	margin: 5px 2px 5px 8px;
}

.table-btn {
	padding: 3px 12px;
	width: 100%;
}

.table-btn span {
	font-size: 1.2rem;
}

.features-btn .btn {
	font-size: 1.2rem;
	padding: 5px 20px;
	width: 80px;
}

.table-features {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
	padding: 8px 0;
	border-radius: 12px;
	max-width: 98%;
	margin: 0 auto;
}

.features-btn input {
	width: 80px;
	padding: 2px 20px;
	box-shadow: 1px 1px 2px 1px rgba(136, 134, 134, 0.75);
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.features-btn:last-child input {
	
}

@media ( min-width :480px) {
	.date-picker label {
		font-size: 1.2rem;
	}
}
</style>
<script>
	$(document).ready(function() {
		$('#example').DataTable({
			dom : 'Bfrtip',
			buttons : [ 'copyHtml5', 'excelHtml5', 'csvHtml5', 'pdfHtml5' ]
		});
	});
</script>
</head>
<body class="nav-md" onload="redirect()" style="background: black;">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view" style="background: black;">
					<!-- Top Bar -->
					<%@ include file="TopBar.jsp"%>
					<!-- Top Bar -->
					<!-- menu prile quick info -->

					<%@ include file="LeftTopSide.jsp"%>
					<!-- /menu prile quick info -->

					<!-- sidebar menu -->
					<%@ include file="SideBar.jsp"%>
					<!-- /sidebar menu -->
				</div>
			</div>

			<!-- top navigation -->
			<%@ include file="TopNavigation.jsp"%>
			<!-- /top navigation -->


			<!-- page content -->
		</div>
		<button class="btn form-control" id="getDataBtn">
			<i class="fa fa-search" style="margin: 0 5px;"></i> Search
		</button>
		<section class="table-wrap">
		<div class="container">
			<div class="table-content" id="customers">
				<h2>Clove Extra Aligner</h2>
				<table rules="all" id="Table1" class="user-table display"
					style="border-collapse: collapse;" cellspacing="0" border="1">
					<thead>
						<tr>
							<th class="text-center"><input class="checkbox select-all"
								data-input-id='ids' data-rows-group-id='users' type="checkbox"></th>

							<th class="order">Case Id</th>
							<th class="order">Patient Name</th>
							<th class="order">Doctor Name</th>
							<th class="order">Crm</th>
							<th class="order">Location</th>
							<th class="order">City</th>
							<th class="order">Pincode</th>
							<th class="order">Phone</th>
							<th class="order">Plan Date</th>
							<th class="order">Request Type</th>
							<th class="order">Payment Mode</th>
							<th class="order">Total Amount</th>
							<th class="order">Received Amount</th>
							<th class="order">Last Payment Date</th>
							<th class="order">Remain Amount</th>
							<th class="order">Planning Id</th>
							<th class="order">Upper Planned</th>
							<th class="order">Lower Planned</th>
							<th class="order">Upper Dispatched</th>
							<th class="order">Lower Dispatched</th>
							<th class="order">Extra Upper Batches</th>
							<th class="order">Extra Lower Batches</th>
							<th class="order">Upper Att</th>
							<th class="order">Lower Att</th>
							<th class="order">Mode of Dispatch</th>
							<th class="order">Tracking id</th>
							<th class="order">Delivery No</th>
							<th class="order">Dispatched date</th>
							<th class="order">Payment Bill status</th>
							<th class="order">Payment Bill Status Remarks</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</section>
	</div>

	<script>
		 $("#getDataBtn").click(function(e){
	        e.preventDefault()
			let startdate = $("#startdate").val();
			let enddate = $("#enddate").val();
			let caseType = $("#caseType").val();
			let dispatchType = $("#dispatchType").val();
			let requestType = $("#requestType").val();
			let paymentType = $("#paymentType").val();
			let extraAligner = $("#extraAligner").val();
			
			//alert("startdate: "+startdate+" enddate: "+enddate)
			console.log(startdate)
			var addUrl = "report.jsp?FromDate="+startdate+"&ToDate="+enddate+"&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType;
			console.log(addUrl)
			if (startdate == '' || enddate == '' || caseType == '' || dispatchType == '' || paymentType == '' || extraAligner == '') {
				$("#message2").show();
			} else {
				$("#message2").hide();
				   $.ajax({
				         // url: "http://112.196.167.2:8080/getWattsDispatchReports?FromDate=2022-10-01&ToDate=2022-11-01&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType, //API URL
				          url: "http://112.196.167.2:8080/getWattsDispatchReports?FromDate="+startdate+"&ToDate="+enddate+"&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType, //API URL

				        		  type: "GET", 
				        /*   beforeSend: function () {
				              // This function calls before ajax API Hits
				              // Here we have to show our loader
				          }, */
				          success: function (response, status) {
				              // Once our API call send success
				              // this function gets called.
				              console.log(response.message)
				              let html = "";
				              for (let i = 0; i < response.message.length; i++) {
							         console.log(response.message[i].tracking_id)
							        var url1=addUrl+"&case_id"+response.message[i].case_id
							         console.log(url1)
					
				                  html += `
				                      <tr>
									  <td><input class="checkbox select-row" data-rows-group-id='users' type="checkbox" id=response.message[i] data-id="123"/></td>
										<th class="order">Dispatched Id</th><td>`+  response.message[i].tracking_id + `</td>
									  <td>`+  response.message[i].case_id + `</td>
									  <td>`+  response.message[i].patient_name + `</td>
									  <td>`+  response.message[i].doctor_name + `</td>
									  <td>`+  response.message[i].crm + `</td>
									  <td>`+  response.message[i].location + `</td>
									  <td>`+  response.message[i].city + `</td>
									  <td>`+  response.message[i].pincode + `</td>
									  <td>`+  response.message[i].phone + `</td>
									  <td>`+  response.message[i].plan_date + `</td>
									  <td>`+  response.message[i].request_type + `</td>
									  <td>`+  response.message[i].payment_mode + `</td>
									  <td>`+  response.message[i].total_Amount + `</td>
									  <td>`+  response.message[i].received_Amount + `</td>
									  <td>`+  response.message[i].last_Payment_Date + `</td>
									  <td>`+  response.message[i].last_Payment_Date + `</td>
									  <td>`+  response.message[i].remain_Amount + `</td>
									  <td>`+  response.message[i].remain_Amount + `</td>
									  <td>`+  response.message[i].planning_id + `</td>
									  <td>`+  response.message[i].upper_Planned + `</td>
									  <td>`+  response.message[i].lower_Planned + `</td>
									  <td>`+  response.message[i].upper_Dispatched + `</td>
									  <td>`+  response.message[i].lower_Dispatched + `</td>
									  <td>`+  response.message[i].extra_Upper_Batches + `</td>
									  <td>`+  response.message[i].extra_Lower_Batches + `</td>
									  <td>`+  response.message[i].upper_Att + `</td>
									  <td>`+  response.message[i].lower_att + `</td>
									  <td>`+  response.message[i].mode_of_dispatch + `</td>
									  <td>`+  response.message[i].tracking_id + `</td>
									  <td>`+  response.message[i].delivery_nn + `</td>
									  <td>`+  response.message[i].dispatched_date + `</td>
									  <td>`+  response.message[i].payment_Bill_status+ `</td>
									  <td>`+  response.message[i].payment_Bill_status_Remarks + `</td> 
									  <td><button type="button"  onClick="manoj(`+ response.message[i].case_id +`)">btn</button></td>
									  <td><button type="button" onClick="abc(`+ response.message[i].case_id +`)">btn</button></td>
				 
				                      </tr>
				                  `;
						
				              }
				              $(".user-table").find("tbody").append(html);
				          },
				          error: function (error, status) {
				           
				        	  alert(error)
				          },
				      });
			}
		});
</script>
	<script>
  function manoj(url){
	    let startdate = $("#startdate").val();
		let enddate = $("#enddate").val();
		let caseType = $("#caseType").val();
		let dispatchType = $("#dispatchType").val();
		let requestType = $("#requestType").val();
		let paymentType = $("#paymentType").val();
		let extraAligner = $("#extraAligner").val();
		var addUrl = "report.jsp?FromDate="+startdate+"&ToDate="+enddate+"&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType;
		console.log(addUrl)
		var url1=addUrl+"&case_id="+url
	    console.log(url1)
	    window.location= url1
  }
   function abc(case_id){
	  console.log(abc)
  } 
</script>
	<script>
$(".getData").click(function() {
    var $row = $(this).closest("tr");    // Find the row
    var $tds = $row.find("td");
    $.each($tds, function() {
        console.log($(this).text());
    });
    
});
</script>
	<!-- page loader -->
	<script>
        $(window).on('load', function(){
            $('#loading').hide();
        });
      </script>

	<script type="text/javascript" src="/Workflow/JavaScript/general.js"></script>
	<script type="text/javascript" src="/Workflow/JavaScript/bootstrap.js"></script>
	<script type="text/javascript" src="/Workflow/JavaScript/custom.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="/Workflow/JavaScript/javascript/tether.min.js"></script>
	<script
		src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"
		integrity="sha512-qZvrmS2ekKPF2mSznTQsxqPgnpkI4DNTlrdUmTzrDgektczlKNRRhy5X5AAOnx5S09ydFYWWNSfcEqDTTHgtNA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>