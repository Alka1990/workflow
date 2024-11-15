<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>:: WorkFlow Search ::</title>

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/logo.png">
<link
	href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min1.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
	integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

<style>
.table>thead tr th {
	background-color: #3A98B9;
	color: white;
	line-height: 2;
}

table.dataTable.display tbody tr td {
	padding-top: 15px;
}

table.dataTable.display tbody tr td a {
	text-decoration: none
}

table.dataTable.display tbody tr:first-child td {
	text-align: left;
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

div.dom_wrapper {
	position: sticky; /* Fix to the top */
	top: 0;
	padding: 2px;
	background: rgba(255, 255, 255, 1); /* hide the scrolling table */
}

.tableContainer {
	margin-bottom: 20px;
	width: 98%;
	margin-left: 1%;
}

tbody tr.even:hover, tbody tr.odd:hover {
	background-color: #EAECEE;
}

table.dataTable thead>tr>th.sorting:after, table.dataTable thead>tr>th.sorting:before
	{
	color: white;
	background-color: black;
}
</style>
</head>
<body class="nav-md">
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

			<!-- Main Content -->
			<div class="right_col" role="main">
				<div class="container" style="padding-top: 20px;">
					<div class="panel panel-primary">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<strong>Sub Report</strong>
							</div>

							<div id="reportDownloadPanel">
								<div class="row" style="margin-top:20px;">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
											<button class="btn btn-warning btn-block downloadExcel"
												onclick="exportToExcel('csv')" type="submit" disabled>
												<i class="fa-solid fa-file-arrow-down"
													style="margin-right: 7px;"></i>CSV
											</button>
										</div>
										<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
											<button class="btn btn-warning btn-block downloadExcel"
												onclick="exportToExcel('xlsx')" type="submit" disabled>
												<i class="fa-solid fa-file-arrow-down"
													style="margin-right: 7px;"></i>Excel
											</button>
										</div>
									</div>
								</div>
								
								<hr>							

							<div class="row tableContainer" id="casesByCityTableContainer">
								<div class="table-responsive">
									<table id="dtBasicExample"
										class="table table-bordered table-sm dataTable display nowrap"
										role="grid" aria-describedby="dtBasicExample_info"
										style="width: 100%;">
										<thead>
											<tr>
												<th>Case Id</th>
												<th>Patient Name</th>
												<th>Doctor Name</th>
												<th>CRM</th>
												<th>City</th>
												<th>Case Type</th>
												<th>Case Status</th>
												<th>Total Amount</th>
												<th>Received Amount</th>
												<th>Remaining Amount</th>
												<th>Last Payment Date</th>
												<th>Last Upper Dispatched</th>
												<th>Last Lower Dispatched</th>
												<th>Last Dispatched Date</th>
												<th>Work Done By</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row tableContainer" id="casesByCrmTableContainer">
								<div class="table-responsive">
									<table id="dtBasicExample1"
										class="table table-bordered table-sm dataTable display nowrap"
										role="grid" aria-describedby="dtBasicExample1_info"
										style="width: 100%;">
										<thead>
											<tr>
												<th>Case Id</th>
												<th>Patient Name</th>
												<th>Doctor Name</th>
												<th>CRM</th>
												<th>Case Status</th>
												<th>Total Amount</th>
												<th>Received Amount</th>
												<th>Remaining Amount</th>
												<th>Last Payment Date</th>
												<th>Last Upper Dispatched</th>
												<th>Last Lower Dispatched</th>
												<th>Last Dispatched Date</th>
												<th>Work Done By</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row tableContainer" id="casesByDoctorTableContainer">
								<div class="table-responsive">
									<table id="dtBasicExample2"
										class="table table-bordered table-sm dataTable display nowrap"
										role="grid" aria-describedby="dtBasicExample2_info"
										style="width: 100%;">
										<thead>
											<tr>
												<th>Case Id</th>
												<th>Patient Name</th>
												<th>Doctor Name</th>
												<th>Clinic Name</th>
												<th>CRM</th>
												<th>Case Type</th>
												<th>Case Status</th>
												<th>Total Amount</th>
												<th>Received Amount</th>
												<th>Remaining Amount</th>
												<th>Last Payment Date</th>
												<th>Last Upper Dispatched</th>
												<th>Last Lower Dispatched</th>
												<th>Last Dispatched Date</th>
												<th>Work Done By</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>

							<div class="row tableContainer" id="errorTable"
								style="display: none;">
								<div class="table-responsive">
									<table class="table table-bordered table-sm display nowrap"
										role="grid" style="width: 100%;">
										<thead>
											<tr>
												<th class="text-center"></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row" id="loaderPanel">
								<div id="loading">
									<img id="loading-image" src="Images/Loading_icon.gif"
										draggable="false" alt="Loading..." />
								</div>
							</div>

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
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

	<script>
		let api_response = "";
		let host = "https://103.120.178.180:8443/QRCodeGenerator";
		//let host = "http://112.196.167.2:9091";
		$.fn.dataTable.ext.errMode = "none";

		$(document).ready(function() {
			let params = new URLSearchParams(location.search);
			let url = "";
			let startdate = params.get("FromDate");
			let enddate = params.get("ToDate");
			let caseType = params.get("Case_Type");
			let reportType = params.get("reportType");
			let city = params.get("city");
			let crmName = params.get("crm_name");
			let doctorName = params.get("doctorName");

			if (reportType === "cases by city report") {
				url = "/getCaseByCityReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&crm_name=" + crmName + "&city=" + city;
			} else if (reportType === "cases by crm report") {
				url = "/getCaseByCrmReport?FromDate=" + startdate + "&ToDate=" + enddate + "&precedureType=sub&crm_name=" + crmName;
			} else if (reportType === "cases by doctor report") {
				url = "/getCaseByDoctorReport?FromDate=" + startdate + "&ToDate=" + enddate + "&precedureType=sub&doctorName=" + doctorName + "&Case_Type=" + caseType ;
			}

			$(".tableContainer").hide();
			
			$.ajax({
				url: host + url,
				type: "GET",
				success: function(response) {
					api_response = JSON.stringify(response)
					if (reportType === "cases by city report") {
						$("#dtBasicExample").DataTable({
							"data": response.data,
							"columns": [{
									"data": "case_id"
								},
								{
									"data": "patient_name"
								},
								{
									"data": "doctor_name"
								},
								{
									"data": "crm_name"
								},
								{
									"data": "city_name"
								},
								{
									"data": "case_Types" 
								},
								{
									"data": "case_Status"
								},
								{
									"data": "total_amount"
								},
								{
									"data": "total_Recived_Amount"
								},
								{
									"data": "remaining_amount"
								},
								{
									"data": "last_Payment_Date"
								},
								{
									"data": "last_Upper_Dispatched"
								},
								{
									"data": "last_Lower_Dispatched"
								},
								{
									"data": "last_dispatched_date"
								},
								{
									"data": "worked_Done_by"
								}
							]
						});
						$("#casesByCityTableContainer").show();
					}
					if (reportType === "cases by crm report") {
						$("#dtBasicExample1").DataTable({
							"data": response.data,
							"columns": [{
									"data": "case_id"
								},
								{
									"data": "patient_name"
								},
								{
									"data": "doctor_name"
								},
								{
									"data": "crm_name"
								},
								{
									"data": "case_Status"
								},
								{
									"data": "total_amount"
								},
								{
									"data": "total_Recived_Amount"
								},
								{
									"data": "remaining_amount"
								},
								{
									"data": "last_Payment_Date"
								},
								{
									"data": "last_Upper_Dispatched"
								},
								{
									"data": "last_Lower_Dispatched"
								},
								{
									"data": "last_dispatched_date"
								},
								{
									"data": "worked_Done_by"
								}
							]
						});
						$("#casesByCrmTableContainer").show();
					}
					if (reportType === "cases by doctor report") {
						$("#dtBasicExample2").DataTable({
							"data": response.data,
							"columns": [{
									"data": "case_id"
								},
								{
									"data": "patient_name"
								},
								{
									"data": "doctor_name"
								},
								{
									"data": "clinic_name"
								},
								{
									"data": "crm_name"
								},
								{
									"data": "case_Types"
								},
								{
									"data": "case_Status"
								},
								{
									"data": "total_amount"
								},
								{
									"data": "total_Recived_Amount"
								},
								{
									"data": "remaining_amount"
								},
								{
									"data": "last_Payment_Date"
								},
								{
									"data": "last_Upper_Dispatched"
								},
								{
									"data": "last_Lower_Dispatched"
								},
								{
									"data": "last_dispatched_date"
								},
								{
									"data": "worked_Done_by"
								}
							]
						});
						$("#casesByDoctorTableContainer").show();
					}
					$(".downloadExcel").prop("disabled", false);
					$("#loaderPanel").hide();
				},
				error: function(response) {
					console.log(response);
					if (response.status == 404) {
						$("#errorTable table th, #errorTable table td").text("No Data Available");
					} else {
						$("#errorTable table th, #errorTable table td").text("Internal Server Error");
					}
					$("#errorTable").show();
					$("#loaderPanel").hide();
				}
			});
		});
		
		// To download csv file
		function exportToExcel(extention) {
			let response = JSON.parse(api_response);
			const wb = XLSX.utils.book_new();
			const ws = XLSX.utils.json_to_sheet(response.data, {raw: false, dateNF:'yyyy-mm-dd'});
			XLSX.utils.book_append_sheet(wb, ws, "test");
			XLSX.writeFile(wb, "Report." + extention);
		}
	</script>
	

</body>
</html>