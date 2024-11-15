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

<style>
.table-bordered>tbody>tr>td {
	text-align: left;
}
.alert-msg{
  display:none;
}
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 99; /* Sit on top */
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
	margin-left: 10px;
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
	width: 125px;
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

@media ( min-width :768px) {
	.features-btn .btn {
		font-size: 1.5rem;
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
<body class="nav-md" style="background: black;">
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
			<div class="right_col" role="main">
				<div class="badge-notification">
					<i class="fa fa-bell fa-5x fa-border icon-grey badge"></i>
				</div>
				<div class="container">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="wrapper">
								<section class="execute-process-wrap">
								<div class="container">
									<div class="execute-process">
										<div class="date-picker">
											<div class="input-group">
												<input type="text" class="form-control flatpickr-input"
													style="background-color: white" placeholder="From"
													name="startdate" id="startdate" readonly="readonly">
												<span class="input-group-addon" id="sizing-addon2"><i
													class="glyphicon glyphicon-calendar"></i></span>
											</div>
											<div class="input-group">
												<input type="text" class="form-control flatpickr-input"
													style="background-color: white" placeholder="TO"
													name="enddate" id="enddate" readonly="readonly"> <span
													class="input-group-addon" id="sizing-addon2"><i
													class="glyphicon glyphicon-calendar"></i></span>
											</div>
										</div>
										<!-- choose type -->
										<div class="choose-type">
											<form>
												<label for="case-type">Case Type:</label> <select
													class="form-control" name="demo" id="caseType"
													form="caseform">
													<option value="Clove">Clove</option>
													<option value="32Watts">32Watts</option>
													<option value="Study">Study</option>
													<option value="Institutional">Institutional</option>
													<option value="Digital">Digital</option>
													<option value="Study">Study</option>
													<option value="Planned">Planned</option>
													<option value="Retail">Retail</option>
												</select>
											</form>
											<form>
												<label for="dispatch-type">Dispatch Type:</label> <select
													class="form-control" name="demo" id="dispatchType"
													form="dispatchform">
													<option value="Aligner">Aligner</option>
													<option value="Starter Kit">Starter Kit</option>
												</select>
											</form>
											<form>
												<label for="request-type">Request Type:</label> <select
													class="form-control" name="demo" id="requestType"
													form="requestform">
													<option value=""></option>
													<option value="New Case">New Case</option>
													<option value="Next Batch Required">Next Batch
														Required</option>
													<option value="Mid Scan">Mid Scan</option>
													<option value="Retainer">Retainer</option>
													<option value="Refinment">Refinment</option>
													<option value="Rescan">Rescan</option>
												</select>
											</form>
											<form>
												<label for="payment-type">Payment Status:</label> <select
													id="paymentType" class="form-control" name="">
													<option value="Unbilled">Unbilled</option>
													<option value="To Bill">To Bill</option>
													<option value="Billed">Billed</option>
													<option value="Collected">Collected</option>
													<option value="Issue CN">Issue CN</option>
													<option value="CN Issued">CN Issued</option>
													<option value="Cancelled">Cancelled</option>
													<option value="Dispute">Dispute</option>

												</select>
											</form>
											<form>
												<label for="extra-aligner">Extra Aligner:</label> <select
													class="form-control" name="demo" id="extraAligner"
													form="alignerform">
													<option value="Yes">Yes</option>
													<option value="No">No</option>

												</select>
											</form>
											<form>
												<label for="extra-aligner"><br></label>
												<button class="btn form-control" id="getDataBtn">
													<i class="fa fa-search" style="margin: 0 5px;"></i> Search
												</button>
											</form>

										</div>
										<div class="row">
											<h5 class="text-center text-danger" id="message2"
												style="display: none;">All fields are required</h5>
										</div>
										<div class="row">
											<div id="loading">
												<img id="loading-image" src="Images/Loading_icon.gif"
													alt="Loading..." />
											</div>
										</div>
										<!-- table features -->
										<div id="download-kit" class="table-features">
											<div class="features-btn">
												<button
													onclick="selectElementContents( document.getElementById('Table1') );"
													class="
													btn" type="button">
													<span>Copy</span>
												</button>
											</div>
											<div class="features-btn">
												<button onclick="ExportToExcel('xlsx')" class=" btn"
													type="button">
													<span>Excel</span>
												</button>
											</div>
											<div class="features-btn">
												<button onClick="tableToCSV()"
													class="btn dt-button buttons-csv buttons-html5 table-btn"
													aria-controls="example" tabindex="0" type="button">
													<span>CSV</span>
												</button>
											</div>

											<div class="features-btn">
												<button class="btn" id="btnExport" type="button">
													<span>PDF</span>
												</button>
											</div>
											<div class="features-btn">
												<button id="checkedData" type="button" onClick="sendMail()"
													class="btn " data-toggle="modal" data-target="#caseModal">
													Checked Data</button>
												<!-- data-toggle="modal" data-target="#caseModal" -->
												<span id="senddata"></span>
											</div>
											<div class="features-btn">
												<button class="btn dlt ">Remove</button>
											</div>
											<div class="features-btn">
												<input id='myInput' class="btn btn-primary"
													onkeyup='searchTable()' type='text' placeholder="Search">
											</div>

										</div>

									</div>
								</div>
								</section>
								<section class="table-wrap">
								<div class="container">
									<div class="table-content" id="customers">
										<h2>Clove Extra Aligner</h2>
										<table rules="all" id="Table1" class="user-table display"
											style="border-collapse: collapse;" cellspacing="0" border="1">
											<thead>
												<tr>
													<th class="order">Details</th>
													<th class="text-center"><input id="check_all"
														type="checkbox"></th>
													<th class="order">Dispatched Id</th>
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
											</tbody>
										</table>
									</div>
								</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Tabe Row Data Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Selected Row
						Data</h4>
				</div>
				<div class="modal-body">
					<form id="loginfrm" action="formdatafrm" method="post">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Dispatched
								Id:</label> <input type="text" class="form-control" id="dispatched-id">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Case
								Id:</label> <input type="text" class="form-control" id="case-id">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Doctor
								Name:</label> <input type="text" class="form-control" id="doctor-name">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Patient
								Name:</label> <input type="text" class="form-control" id="patient-name">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Upper
								Dispatched:</label> <input type="text" class="form-control"
								id="upper-dispatched">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Lower
								Dispatched:</label> <input type="text" class="form-control"
								id="lower-dispatched">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status:</label> <select id="getType" class="form-control" name="">
								<option value="Unbilled">Unbilled</option>
								<option value="To Bill">To Bill</option>
								<option value="Collected">Issued CN</option>
								<option value="Collected">CN Issued</option>
								<option value="Cancelled">Cancelled</option>
								<option value="Dispute">Dispute</option>
							</select>

						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status Remarks:</label> <input type="text" class="form-control"
								name="myText" id="paymentRemark" disabled="disabled">
								<span class="alert-msg" style="color:red;">This Field is Required*</span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" onClick="abc()" class="btn">Send
						message</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	$('#myModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
/* 		  var modal = $(this)
		  modal.find('.modal-title').text('Table Row Data ' + recipient)
		  modal.find('.modal-body input').val(Case Id) */
		})
/* 		$('#caseModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget) // Button that triggered the modal
		  var recipient = button.data('whatever') // Extract info from data-* attributes
		  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
/* 		  var modal = $(this)
		  modal.find('.modal-title').text('Table Row Data ' + recipient)
		  modal.find('.modal-body input').val(Case Id) */
		}) */
		
	</script>
	<!-- All Selected Case Id -->
	<div class="modal" id="caseModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Checked Data</h4>
					<span id="senddata1"></span>
				</div>
				<div class="modal-body">
					<form id="checkedfrmdata">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Case
								Id:</label> <input type="text" class="form-control" id="triggermailto">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status:</label> <select id="fetchData" class="form-control" name="">
								<option value="Unbilled">Unbilled</option>
								<option value="To Bill">To Bill</option>
								<option value="Collected">Issued CN</option>
								<option value="Collected">CN Issued</option>
								<option value="Cancelled">Cancelled</option>
								<option value="Dispute">Dispute</option>
							</select>

						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status Remarks:</label> <input type="text" class="form-control"
								name="myText" id="payment-remarks" disabled="disabled">
								<span class="alert-msg" style="color:red;">This Field is Required*</span>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn marked" onclick="markedData()">Send
						Message</button>
				</div>
			</div>
		</div>
	</div>
	<!-- table to CSV -->
	<script type="text/javascript">
		        function tableToCSV() {

			// Variable to store the final csv data
			var csv_data = [];

			// Get each row data
			var rows = document.getElementsByTagName('tr');
			for (var i = 0; i < rows.length; i++) {

				// Get each column data
				var cols = rows[i].querySelectorAll('td,th');

				// Stores each csv row data
				var csvrow = [];
				for (var j = 0; j < cols.length; j++) {

					// Get the text data of each cell
					// of a row and push it to csvrow
					csvrow.push(cols[j].innerHTML);
				}

				// Combine each column value with comma
				csv_data.push(csvrow.join(","));
			}

			// Combine each row data with new line character
			csv_data = csv_data.join('\n');

			// Call this function to download csv file 
			downloadCSVFile(csv_data);

		}

		function downloadCSVFile(csv_data) {

			// Create CSV file object and feed
			// our csv_data into it
			CSVFile = new Blob([ csv_data ], {
				type : "text/csv"
			});

			// Create to temporary link to initiate
			// download process
			var temp_link = document.createElement('a');

			// Download csv file
			temp_link.download = "Data.csv";
			var url = window.URL.createObjectURL(CSVFile);
			temp_link.href = url;

			// This link should not be displayed
			temp_link.style.display = "none";
			document.body.appendChild(temp_link);

			// Automatically click the link to
			// trigger download
			temp_link.click();
			document.body.removeChild(temp_link);
		}
    
	</script>
	<!-- checkbox-selection -->
	<script type="text/javascript">
	$(function() {
		//If check_all checked then check all table rows
		$("#check_all").on("click", function () {
			if ($("input:checkbox").prop("checked")) {
				$("input:checkbox[name='row-check']").prop("checked", true);
			} else {
				$("input:checkbox[name='row-check']").prop("checked", false);
			}
		});

		// Check each table row checkbox
		$("input:checkbox[name='row-check']").on("change", function () {
			var total_check_boxes = $("input:checkbox[name='row-check']").length;
			var total_checked_boxes = $("input:checkbox[name='row-check']:checked").length;

			// If all checked manually then check check_all checkbox
			if (total_check_boxes === total_checked_boxes) {
				$("#check_all").prop("checked", true);
			}
			else {
				$("#check_all").prop("checked", false);
			}
		});
	});
		/* remove row */
		$(".dlt").on("click", function() {
			$('input:checked').not('.all').parents("tr").remove();
		});
		$('.all').on('click', function() {
			var $inputs = $('table').find('input');
			$inputs.prop('checked', 'checked');
		});
	</script>
	<!-- for PDF converter -->
	<script>
	 $("body").on("click", "#btnExport", function () {
		            html2canvas($('#Table1')[0], {
		                onrendered: function (canvas) {
		                    var data = canvas.toDataURL();
		                    var docDefinition = {
		                        content: [{
		                            image: data,
		                            width: 100%
		                        }]
		                    };
		                    pdfMake.createPdf(docDefinition).download("Report.pdf");
		                }
		            });
		        });
	</script>
	<script>
		$(document).ready(function() {
			$('#dtBasicExample').DataTable();
			$("#startdate, #enddate").flatpickr({
				dateFormat : "d-m-Y",
				maxDate : new Date()
			});
			$("#startdate").on("change", function() {
				let startDateValue = $("#startdate").val();
				$("#enddate").flatpickr({
					dateFormat : "d-m-Y",
					maxDate : new Date(),
					minDate : startDateValue
				});
			});
		});
	</script>
	<!-- sorting-table -->
	<script>
	function table_sort() {
		  const styleSheet = document.createElement('style')
		  styleSheet.innerHTML = `
		        .order-inactive span {
		            visibility:hidden;
		        }
		        .order-inactive:hover span {
		            visibility:visible;
		        }
		        .order-active span {
		            visibility: visible;
		        }
		    `
		  document.head.appendChild(styleSheet)

		  document.querySelectorAll('th.order').forEach(th_elem => {
		    let asc = true
		    const span_elem = document.createElement('span')
		    span_elem.style = "font-size:0.8rem; margin-left:0.5rem"
		    span_elem.innerHTML = "🔽"
		    th_elem.appendChild(span_elem)
		    th_elem.classList.add('order-inactive')

		    const index = Array.from(th_elem.parentNode.children).indexOf(th_elem)
		    th_elem.addEventListener('click', (e) => {
		      document.querySelectorAll('th.order').forEach(elem => {
		        elem.classList.remove('order-active')
		        elem.classList.add('order-inactive')
		      })
		      th_elem.classList.remove('order-inactive')
		      th_elem.classList.add('order-active')

		      if (!asc) {
		        th_elem.querySelector('span').innerHTML = '🔼'
		      } else {
		        th_elem.querySelector('span').innerHTML = '🔽'
		      }
		      const arr = Array.from(th_elem.closest("table").querySelectorAll('tbody tr'))
		      arr.sort((a, b) => {
		        const a_val = a.children[index].innerText
		        const b_val = b.children[index].innerText
		        return (asc) ? a_val.localeCompare(b_val) : b_val.localeCompare(a_val)
		      })
		      arr.forEach(elem => {
		        th_elem.closest("table").querySelector("tbody").appendChild(elem)
		      })
		      asc = !asc
		    })
		  })
		}

		table_sort()
	</script>
	<!-- search button js -->
	<script>
	function searchTable() {
	    var input, filter, found, table, tr, td, i, j;
	    input = document.getElementById("myInput");
	    filter = input.value.toUpperCase();
	    table = document.getElementById("Table1");
	    tr = table.getElementsByTagName("tr");
	    for (i = 0; i < tr.length; i++) {
	        td = tr[i].getElementsByTagName("td");
	        for (j = 0; j < td.length; j++) {
	            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
	                found = true;
	            }
	        }
	        if (found) {
	            tr[i].style.display = "";
	            found = false;
	        } else {
	            tr[i].style.display = "none";
	        }
	    }
	}
	</script>
	<!-- copy table  -->
	<script>
	 function selectElementContents(el) {
		    var body = document.body,
		      range, sel;
		    if (document.createRange && window.getSelection) {
		      range = document.createRange();
		      sel = window.getSelection();
		      sel.removeAllRanges();
		      range.selectNodeContents(el);
		      sel.addRange(range);
		    }
		    document.execCommand("Copy");
		  }
</script>
	<!-- html table to excel -->
	<script>
        function ExportToExcel(type, fn, dl) {
            var elt = document.getElementById('Table1'); 
            var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
            return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('MySheet.' + (type || 'xlsx')));
        }
    </script>
	<!-- date format -->
	<script>
		$(document).ready(function() {
			$('#dtBasicExample').DataTable();
			$("#startdate, #enddate").flatpickr({
				dateFormat : "Y-m-d",
				maxDate : new Date()
			});
			$("#startdate").on("change", function() {
				let startDateValue = $("#startdate").val();
				$("#enddate").flatpickr({
					dateFormat : "Y-m-d",
					maxDate : new Date(),
					minDate : startDateValue
				});
			});
		});
	</script>
	<script>
	     let text = "";
	     $("#download-kit").hide();
	     $(".table-wrap").hide();
		 $("#getDataBtn").click(function(e){
		    $('#loading').show(); 
	        e.preventDefault()
			let startdate = $("#startdate").val();
			let enddate = $("#enddate").val();
			let caseType = $("#caseType").val();
			let dispatchType = $("#dispatchType").val();
			let requestType = $("#requestType").val();
			let paymentType = $("#paymentType").val();
			let extraAligner = $("#extraAligner").val();
			
			console.log(startdate)
			var addUrl = "FromDate="+startdate+"&ToDate="+enddate+"&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType;
			console.log(addUrl)
			if (startdate == '' || enddate == '' || caseType == '' || dispatchType == '' || paymentType == '' || extraAligner == '') {
				$("#message2").show();
			} else {
				$("#message2").hide();
				   $.ajax({
				          url: "http://112.196.167.2:8080/getWattsDispatchReports?FromDate="+startdate+"&ToDate="+enddate+"&Case_Type="+caseType+"&Dispatch_Type="+dispatchType+"&Request_Type="+requestType+"&Extra_Aligner="+extraAligner+"&Payment_Status="+paymentType, //API URL

				        		  type: "GET", 
				          success: function (response, status) {
				        	  $("#download-kit").show();
				        	  $(".table-wrap").show();
				              // Once our API call send success
				              // this function gets called.
				          
				              let html = "";
				              
				              for (let i = 0; i < response.message.length; i++) {
				            	  text=JSON.stringify(response);
							         
							        var url1=addUrl+"&case_id"+response.message[i].case_id
							
				                  html += `
				                      <tr>
				                	  <td><button type="button" onClick="requiredAction(`+ response.message[i].case_id +`)" id="rowData" data-toggle="modal" data-target="#myModal">Action</button></td>
									  <td><input type="checkbox"  id="`+ response.message[i].case_id +`" name="row-check" value="`+ response.message[i].case_id +`"></td>
									  <td>`+  response.message[i].tracking_id + `</td>
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
 							          
				                      </tr>
				                  `;
							         $('#loading').hide();
				              }
				              $(".user-table").find("tbody").append(html);
				          },
				          error: function (error, status) {
				              $('#loading').hide();
				        	  alert(error)
				          },
				      });
			}
		});
</script>
	<!-- payment remark -->
	<script type="text/javascript">
$(function () {

    $("#getType").change(function () {
        if ($(this).val() == 'Cancelled' || $(this).val() == 'Dispute') {
            $("#paymentRemark").removeAttr("disabled");
            $("#paymentRemark").focus(); 
            $(".alert-msg").show();
        } 
        else {
            $("#paymentRemark").attr("disabled", "disabled");
            $(".alert-msg").hide();
        }
    });
});
   var checkedCase= document.getElementById("response.message[i]");
   console.log(checkedCase);
   
   $(function () {
	    $("#fetchData").change(function () {
	        if ($(this).val() == 'Cancelled' || $(this).val() == 'Dispute' ) {
	            $("#payment-remarks").removeAttr("disabled");
	            $("#payment-remarks").focus();
	            $(".alert-msg").show();
	        }
	        else {
	            $("#payment-remarks").attr("disabled", "disabled");
	            $(".alert-msg").hide();
	        }
	    });
	});
</script>
	<script>
  function requiredAction(case_id){	  
	    const response= JSON.parse(text)
	        for (let i = 0; i < response.message.length; i++) { 
	        	if (response.message[i].case_id == case_id){
	        		$('#dispatched-id').val(response.message[i].tracking_id)
       		        $('#case-id').val(response.message[i].case_id)
	        		$('#doctor-name').val(response.message[i].doctor_name)
	        		$('#patient-name').val(response.message[i].patient_name) 
	        		$('#upper-dispatched').val(response.message[i].upper_Dispatched) 
	        		$('#lower-dispatched').val(response.message[i].lower_Dispatched)        
	        		break;
	        	}
	        }
  }
  

  function sendMail(){
	  var mailTo = [];
      $(':checkbox:checked').each(function(i){
    	  mailTo[i] = $(this).val();
         document.getElementById("triggermailto").value = mailTo;
      });
}
</script>
	<script>
function abc(){
	     var paymentRemark1 = $('#paymentRemark').val()
	      if (typeof paymentRemark1 === "undefined") {
	    	  paymentRemark1=''
	      }
	    if (paymentRemark1 == ""){
	     return (false);
	     }
		
  var getTyp= 'http://112.196.167.2:8080/updatePaymentBillStatus?ids='+$('#case-id').val()+'&status='+$('#getType').val()+'&remarks='+paymentRemark1
	    alert(getTyp)    
        $.ajax({
            url: getTyp,
            type: 'PUT',
            success: function (data) {
                console.log(data);
                alert("sucessfully status changed")
                window.location.reload();
            },
            error: function (textStatus, errorThrown) {
                console.log('Error in Operation');
            }
        });
}
</script>
	<!-- selected data request  -->
	<script>
function markedData(){
	     var paymentRemark2 = $('#payment-remarks').val()
	      if (typeof paymentRemark2 === "undefined") {
	    	  paymentRemark2=''
	      }
		    if (paymentRemark2 == ""){
			     return (false);
			     }

  var selectTyp= 'http://112.196.167.2:8080/updatePaymentBillStatus?ids='+$('#triggermailto').val()+'&status='+$('#fetchData').val()+'&remarks='+paymentRemark2
	    alert(selectTyp)    
        $.ajax({
            url: selectTyp,
            type: 'PUT',
            success: function (data, textStatus) {
                console.log(data);
                alert("sucessfully status changed")
                window.location.reload();
            },
            error: function (textStatus, errorThrown) {
                console.log('Error in Operation');
            }
        });
}
</script>

	<!-- page loader -->
	<script>
        $(window).on('load', function(){
            $('#loading').hide();
        });
      </script>
	<script>
      $('rowData').on('change', function() {
    	  alert( this.value );
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
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
	    
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
</body>
</html>