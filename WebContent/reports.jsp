<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>

<%

session = request.getSession(false);
if (session.getAttribute("userid") == null || session.getAttribute("userid").equals("")) {
	response.sendRedirect("login.jsp?msg=You are not logged in..!");
}

List userRights = (List) session.getAttribute("getRight");
String user_name = session.getAttribute("userid").toString();
ArrayList<String> crm_list = (ArrayList) session.getAttribute("CRMLlist");
Connection connection12 = LoginDAO.getConnectionDetails();
PreparedStatement stmt12 = connection12.prepareStatement("select distinct user_id from user_right where user_right not in('vo') order by user_id");
ResultSet rs12 = stmt12.executeQuery();
List<String> usernames = new ArrayList<>();
while (rs12.next()) {
	usernames.add(rs12.getString("User_id"));
}
rs12.close();
stmt12.close();
connection12.close();
%>

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

<script type="text/javascript"	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

#loading-image {
	position: absolute;
	top: 30%;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	z-index: 100;
}

#startdate, #enddate {
	background-color: white;
}

.asterisk {
	color: red;
}

.alert-msg {
	color: red;
	display: none;
}

#dispatchReportContainer .col-lg-2 {
	margin-top: 10px;
}

#reportDownloadPanel .col-lg-3 {
	margin-top: 5px;
	margin-bottom: 5px;
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


<script type="text/javascript">

$(document).ready(function() {
	 
    $("#year").datepicker({
        changeYear: true,     // Allow changing the year
        showButtonPanel: true, // Show year dropdown and today's button
        yearRange: "2016:'"+new Date().getFullYear()+"'", // Define the range of selectable years
        dateFormat: "yy",     // Display only the year (e.g., "2023")
        onClose: function(dateText, inst) {
            // Triggered when the date picker is closed; you can handle the selected year here
            var selectedYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            $("#year").val(selectedYear);
        }
    });
});

/*$(document).ready(function() {
    $("#payment_overduedays").datepicker({
        dateFormat: "dd/mm/yy", // You can change the date format as needed
        minDate: 0,            // Set the minimum date to today (0 means today)
        maxDate: "+1Y",        // Set the maximum date to 1 year from today
        showButtonPanel: true,  // Show today's button
    });
});
*/

</script>
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
								<strong>Reports</strong>
							</div>
							<form id="reportForm">
				
								
								
								<div class="row">
									<div class="col-lg-12" style="margin-top: 20px;">
									
									<div id="divNotVisible">
									 	<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="fromdateContainer">
											<label id="form_label1"><span class="asterisk">*</span>
												From:</label> <input type="text" class="form-control"
												name="startdate" id="startdate">
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="todateContainer">
											<label id="form_label2"><span class="asterisk">*</span>
												To:</label> <input type="text" class="form-control" name="enddate"
												id="enddate">
										</div>
										
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="caseTypeContainer">
											<label id="caseTypelabel">Case Type:</label> <select class="form-control"
												style="margin-bottom: 10px;" id="caseType">
												<option id="caseTypeOption" style="display: none;" value="">Select</option>
												<option value="32watts" selected>32Watts</option>
												<option value="clove">Clove</option>
												<option value="study" class="optional">Study</option>
												<option value="institutional" class="optional">Institutional</option>
												<option value="digital" class="optional">Digital</option>
												<option value="retail" class="optional">Retail</option>
												<option value="planned" class="optional">Apollo</option>
												<option id="dealerOption" value="dealer" class="optional">Dealer</option>
												<option id="modelPrintingOption" value="Model_Printing"
													class="optional">Model Printing</option>
											</select>
										</div> 
										<!-- 										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" -->
										<!-- 											id="case_status" style="display: none;"> -->
										<!-- 											<label>Case Status:</label> <select class="form-control" -->
										<!-- 												id="case_stage"> -->
										<!-- 												<option value="cancelled">Cancelled</option> -->
										<!-- 												<option value="hold">Hold</option> -->
										<!-- 												<option value="unhold">Unhold</option> -->
										<!-- 											</select> -->
										<!-- 										</div> -->
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="crm_names" style="display: none;">
											<label>CRM Name:</label> <input class="form-control"
												list="crm_names_list" name="crm_name" id="crm_name">
											<datalist id="crm_names_list">
												<option value="" selected></option>
												<%
												for (String crmName : crm_list) {
												%>
												<option value="<%=crmName%>"><%=crmName%></option>
												<%
												}
												%>
											</datalist>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="doctorContainer" style="display: none;">
											<label>Doctor Name:</label> <input class="form-control"
												name="doctorName" id="doctorName">
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="userContainer" style="display: none;">
											<label id="form_label3"><span class="asterisk">*</span>
												User Name:</label> <input class="form-control" name="userName"
												list="username_list" id="userName">
											<datalist id="username_list">
												<option value="" selected></option>
												<%
												for (String username : usernames) {
												%>
												<option value="<%=username%>"><%=username%></option>
												<%
												}
												%>
											</datalist>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="userContainer1" style="display: none;">
											<label>User Name:</label> <select id="usernames" multiple
												class="form-control">
												<option value="" selected></option>
												<%
												for (String username : usernames) {
												%>
												<option value="<%=username%>"><%=username%></option>
												<%
												}
												%>
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="stageContainer" style="display: none;">
											<label id="form_label6"><span class="asterisk">*</span> Stage:</label> <input class="form-control"
												name="stage" id="stage" list="stage_list">
											<datalist id="stage_list">
												<option value="INI">INI</option>
												<option value="INICOR">INICOR</option>
												<option value="WFC">WFC</option>
												<option value="WFCORRECTION">WFCORRECTION</option>
												<option value="PRECORRECTION">PRECORRECTION</option>
												<option value="CADBS">CADBS</option>
												<option value="PLANNING">PLANNING</option>
												<option value="PLANCORRECTION">PLANCORRECTION</option>
												<option value="UPLOAD">UPLOAD</option>
												<option value="UPLOADCORRECTION">UPLOADCORRECTION</option>
												<option value="STAGGING">STAGGING</option>
												<option value="REVIEW">REVIEW</option>
												<option value="QA">QA</option>
												<option value="3DP">3DP</option>
												<option value="3DPCORRECTION">3DPCORRECTION</option>
												<option value="LAB">LAB</option>
												<option value="LABCORRECTION">LABCORRECTION</option>
												<option value="FQC">FQC</option>
												<option value="PACKING">PACKING</option>
												<option value="DISPATCHED">DISPATCHED</option>
												<option value="REJECTED">REJECTED</option>
												<option value="PRE">PRE</option>
												<option value="HOLLOWTAG">HOLLOWTAG</option>
												<option value="INISTARTERKIT">INISTARTERKIT</option>
												<option value="MPTSTARTERKIT">MPTSTARTERKIT</option>
												<option value="3DPSTARTERKIT">3DPSTARTERKIT</option>
												<option value="3DPSTARTERKITCORRECTION">3DPSTARTERKITCORRECTION</option>
												<option value="LABSTARTERKIT">LABSTARTERKIT</option>
												<option value="FQCSTARTERKIT">FQCSTARTERKIT</option>
												<option value="PCKSTARTERKIT">PCKSTARTERKIT</option>
												<option value="PCKSTARTERKITCORRECTION">PCKSTARTERKITCORRECTION</option>
												<option value="DPHSTRKIT">DPHSTRKIT</option>
											</datalist>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="stageContainer1" style="display: none;">
											<label id="form_label4"><span class="asterisk">*</span>
												Stage:</label> <input class="form-control" name="stage1" id="stage1"
												list="stage_list1">
											<datalist id="stage_list1">
												<option value="INI" class="batch">INI</option>
												<option value="INICOR" class="batch">INICOR</option>
												<option value="WFC" class="batch">WFC</option>
												<option value="WFCOR" class="batch">WFCOR</option>
												<option value="PRECOR" class="batch">PRECOR</option>
												<option value="CADBS" class="batch">CADBS</option>
												<option value="PLN" class="batch">PLANNING</option>
												<option value="PLANCOR" class="batch">PLANCOR</option>
												<option value="UPL" class="batch">UPLOAD</option>
												<option value="UPLCOR" class="batch">UPLOADCOR</option>
												<option value="STG" class="batch">STAGGING</option>
												<option value="REV" class="batch">REVIEW</option>
												<option value="QA" class="batch">QA</option>
												<option value="MPT" class="batch">MPT</option>
												<option value="3DP" class="batch">3DP</option>
												<option value="3DPCOR" class="batch">3DPCOR</option>
												<option value="LAB" class="batch">LAB</option>
												<option value="LABCOR" class="batch">LABCOR</option>
												<option value="FQC" class="batch">FQC</option>
												<option value="PCK" class="batch">PACKING</option>
												<option value="PCKCOR" class="batch">PACKINGCOR</option>
												<option value="DISPATCHED" class="batch">DISPATCHED</option>
												<option value="REJ" class="batch">REJECTED</option>
												<option value="PRE" class="batch">PRE</option>
												<option value="HOLLOWTAG" class="batch">HOLLOWTAG</option>
												<option value="Hold" class="batch">Hold</option>
												<option value="UnHold" class="batch">UnHold</option>
											</datalist>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="stageContainer2" style="display: none;">
											<label id="form_label5"><span class="asterisk">*</span>
												Stage:</label> <input class="form-control" name="stage2" id="stage2"
												list="stage_list2">
											<datalist id="stage_list2">
												<option value="INISTRKIT" class="strkit">INISTRKIT</option>
												<option value="MTPSTRKIT" class="strkit">MTPSTRKIT</option>
												<option value="3DPSTRKIT" class="strkit">3DPSTRKIT</option>
												<option value="3DPSTRKITCOR" class="strkit">3DPSTRKITCOR</option>
												<option value="LABSTRKIT" class="strkit">LABSTRKIT</option>
												<option value="LABSTRKITCOR">LABSTRKITCOR</option>
												<option value="FQCSTRKIT" class="strkit">FQCSTRKIT</option>
												<option value="PCKSTRKIT" class="strkit">PCKSTRKIT</option>
												<option value="PCKSTRKITCOR" class="strkit">PCKSTRKITCOR</option>
												<option value="DPHSTRKIT" class="strkit">DPHSTRKIT</option>
											</datalist>
										</div>
									
										
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="daysContainer" style="display: none;">
											<label id="form_labelodue1"><span class="asterisk">*</span>
												Days:</label> <input type="text" class="form-control" name="payment_overduedays" id="payment_overduedays" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
										</div>
										
										
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="stagesReportContainer" style="display: none;">
											<label> Stages:</label> <select class="form-control"
												id="stagesReport">

											</select>
										</div>
										
										
									<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="yearContainer" style="display: none;">
											<label id="form_labelyr1"><span class="asterisk">*</span>
												Year:</label> <input type="text" class="form-control yearpicker" name="year" id="year">
										</div>
										
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="MonthwiseContainer" style="display: none;">
											<label id="form_labelmonth1"><span class="asterisk">*</span>
												Month:</label> 
												  <select  name="monthwise_payment" id="monthwise_payment" class="form-control">
												    <option value='january'>January</option>
												    <option value='february'>February</option>
												    <option value='march'>March</option>
												    <option value='april'>April</option>
												    <option value='may'>May</option>
												    <option value='june'>June</option>
												    <option value='july'>July</option>
												    <option value='august'>August</option>
												    <option value='september'>September</option>
												    <option value='october'>October</option>
												    <option value='november'>November</option>
												    <option value='december'>December</option>
												    </select> 
										</div>
										
								<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12"
											id="MyCaselistuserContainer1" style="display: none;">
											<label>User Name:</label>
											 <select id="MyCaseusernames" multiple class="form-control">
												
											</select>
											</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="userCaseStatusContainer" style="display: none;">
											<label id="form_labelyr1"><span class="asterisk">*</span>
												Status:</label> 
												 <select  name="userCaseStatus" id="userCaseStatus" class="form-control">
												 <option id=""  value="">Select</option>
												    <option value='completed'>Completed</option>
												    <option value='pending'>Pending</option>
												    <option value='active'>Active</option>
												    </select>
										</div>
										
											<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" id="reportTypeContainer">
											<label>Report Type:</label> <select class="form-control"
												id="reportType">
												<% if (userRights.contains("WFC") == true || userRights.contains("account") == true || userRights.contains("DPH") == true) {%>
												<option value="3dp report">3DP Report</option>
												<option value="batch report">Batch Stage Report</option>
												<option value="cases by city report">City wise
													Report</option>
												<option value="cases by crm report">CRM wise Report</option>
												<option value="dispatch report" selected>Dispatch
													Report</option>
												<option value="cases by doctor report">Doctor wise
													Report</option>
												<option value="hollowtag report">Hollow tag Report</option>
												<option value="nextbatch report">Next Batch Report</option>
												<option value="payment report">Payment Report</option>
												<option value="planning report">Planning Report</option>
												<option value="signoff report">Sign off Report</option>
												<option value="starterkit report">Starter kit Report</option>
												<option value="staging report">Staging Report</option>
												<option value="upload report">Upload Report</option>
												<%} %>
												<option value="stage report">Stage wise Report</option>
												<option value="user report">User Work Report</option>
												
												<option value="payment reminder">Payment Reminder Report</option>
												<option value="pending for sign off report">Pending For Sign Off Report</option>
												<option value="aligner predict dispatch report">Aligner Predict Dispatch Report</option>
												<option value="Monthly_transaction_report">Monthly Transaction Report</option>
												<option value="PlanningCaseReport">Planning Case Report</option>
												<option value="DoctorsMonthlyCases">Doctors Monthly Cases Report</option>
												<option value="PaymentOverdueReport">Payment Overdue Report</option>
												<option value="MonthwisePaymentReport">Month Wise Payment Report</option>
												<!-- <option value="UpdateAlignerSchedule">Update Aligner Schedule</option>  This reported is rejected -->												
												<!-- 												<option value="fqc report">FQC Report</option> -->
												<!-- 												<option value="ini cases report">INI Cases Report</option> -->
												<!-- 												<option value="lab report">Lab Report</option> -->
												<!--  this is hold because the hold/ unhold  SQL  and backend functionality is not completed
												<option value="hold_unhold report">Hold & Unhold
													Case Report</option> -->
												<!-- 												<option value="packing report">Packing Report</option> -->
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12" >
											<button type="button"
												class="btn btn-warning btn-block searchReport"
												style="margin-top: 24px; display: none;" id="searchButton">
												<i class="fa-solid fa-magnifying-glass"
													style="margin-right: 5px;"></i> Search
											</button>
										</div>
									</div>
								</div>

								<div class="row" id="dispatchReportContainer">
									<div class="col-lg-12">
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
											<label>Dispatch Type:</label> <select class="form-control"
												id="dispatchType">
												<option value="aligner">Aligner</option>
												<option value="starter kit">Starter Kit</option>
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
											<label>Request Type:</label> <select class="form-control"
												id="requestType">
												<option value=""></option>
												<option value="new case">New Case</option>
												<option value="next batch required">Next Batch</option>
												<option value="mid scan">Mid Scan</option>
												<option value="retainer">Retainer</option>
												<option value="refinement">Refinement</option>
												<option value="rescan">Rescan</option>
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
											<label>Payment Status:</label> <select class="form-control"
												id="paymentStatus">
												<option value="unbilled">Unbilled</option>
												<option value="to bill">To Bill</option>
												<option value="billed">Billed</option>
												<option value="collected">Collected</option>
												<option value="issue cn">Issue CN</option>
												<option value="cn issued">CN Issued</option>
												<option value="cancelled">Cancelled</option>
												<option value="dispute">Dispute</option>
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
											<label>Extra Aligner:</label> <select class="form-control"
												id="extraAligners">
												<option value="Yes">Yes</option>
												<option value="No" selected>No</option>
											</select>
										</div>
										<div class="col-lg-2 col-md-4 col-sm-4 col-xs-12">
											<button type="submit"
												class="btn btn-warning btn-block searchReport"
												style="margin-top: 24px;">
												<i class="fa-solid fa-magnifying-glass"
													style="margin-right: 5px;"></i> Search
											</button>
										</div>
									</div>
								</div>
							</form>
							<hr>

							<div id="reportDownloadPanel" style="display: none;">
								<div class="row">
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
										<!-- 										<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12"> -->
										<!-- 											<button class="btn btn-warning btn-block downloadExcel" -->
										<!-- 												onclick="exportToPDF()" type="submit" disabled> -->
										<!-- 												<i class="fa-solid fa-file-arrow-down" -->
										<!-- 													style="margin-right: 7px;"></i>PDF -->
										<!-- 											</button> -->
										<!-- 										</div> -->
										<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
											<button class="btn btn-warning btn-block" type="submit"
												id="multipleChange" onClick="multipleCaseModal()"
												data-toggle="modal" data-target="#modal2" disabled>
												<i class="fa-regular fa-pen-to-square"
													style="margin-right: 6px;"></i>Change Billing Status
											</button>
										</div>
									</div>
								</div>
								<hr>

								<div class="row tableContainer" id="dispatchTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Details</th>
													<th><input type="checkbox" id="check_all" value="null"></th>
													<th>Dispatched Id</th>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>Phone</th>
													<th>Location</th>
													<th>City</th>
													<th>Pincode</th>
													<th>Request Type</th>
													<th>Payment Mode</th>
													<th>Total Amount</th>
													<th>Received Amount</th>
													<th>Remain Amount</th>
													<th>Last Payment Date</th>
													<th>Planning Id</th>
													<th>Plan Date</th>
													<th>Upper Planned</th>
													<th>Lower Planned</th>
													<th>Upper Att</th>
													<th>Lower Att</th>
													<th>Extra Upper Batches</th>
													<th>Extra Lower Batches</th>
													<th>Upper Dispatched</th>
													<th>Lower Dispatched</th>
													<th>Mode of Dispatch</th>
													<th>Tracking Id</th>
													<th>Delivery No</th>
													<th>Dispatched Date</th>
													<th>Payment Bill status</th>
													<th>Payment Bill Status Remarks</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="nextBatchTableContainer">
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
													<th>Planning ID</th>
													<th>Planned Upper From</th>
													<th>Planned Upper To</th>
													<th>Planned Lower From</th>
													<th>Planned Lower To</th>
													<th>Dispatched Date</th>
													<th>Dispatch Upper From</th>
													<th>Dispatch Upper To</th>
													<th>Dispatch Lower From</th>
													<th>Dispatch Lower To</th>
													<th>Next Upper Remainder Date</th>
													<th>Next Lower Remainder Date</th>
													<th>Payment Bill Status</th>
													<th>Payment Bill Status Remarks</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="paymentTableContainer">
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
													<th>CRM</th>
													<th>Case Type</th>
													<th>Total Amount</th>
													<th>Remaining Amount</th>
													<th>Total Received Amount</th>
													<th>Last Payment Date</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Last Dispatch Date</th>
													<th>Invoice Number</th>
													<th>Invoice Date</th>
													<th>Case Creation Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="caseStageTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample3"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample3_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Status Type</th>
													<th>Remarks</th>
													<th>Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="signoffTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample4"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample4_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Stage</th>
													<th>Planned No</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Signoff Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="uploadTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample5"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample5_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Stage</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Case Upload Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="casesByCityTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample6"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample6_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>City</th>
													<th>Total Cases</th>
													<th>Total Planned Cases</th>
													<th>Total Dispatched Cases</th>
													<th>Total Cases In Account</th>
													<th>Total Amount</th>
													<th>Received Amount</th>
													<th>Remaining Amount</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="casesByCRMTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample7"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample7_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>CRM</th>
													<th>Total Cases</th>
													<th>Total Planned Cases</th>
													<th>Total Dispatched Cases</th>
													<th>Total Cases In Account</th>
													<th>Total Amount</th>
													<th>Received Amount</th>
													<th>Remaining Amount</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="casesByDoctorTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample8"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample8_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>Clinic Name</th>
													<th>Case Type</th>
													<th>Total Cases</th>
													<th>Total Planned Cases</th>
													<th>Total Dispatched Cases</th>
													<th>Total Cases In Account</th>
													<th>Total Amount</th>
													<th>Received Amount</th>
													<th>Remaining Amount</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="iniCasesTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample9"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample9_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>City</th>
													<th>Stage</th>
													<th>Case Creation Date</th>
													<th>INI Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="userReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample10"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample10_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>User Name</th>
													<th>Request Type</th>
													<th>Forwarded Stage</th>
													<th>Forwarded Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="stageReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample11"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample11_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>User Name</th>
													<th>Stage</th>
													<th>Total Cases</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer"
									id="holowtagReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample12"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample12_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Stage</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Hollowtag Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="labReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample13"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample13_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Making</th>
													<th>Waxing</th>
													<th>Thermoform</th>
													<th>Name Cat</th>
													<th>Hand Tooling</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Upper Att</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Lower Att</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Lab Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="packingReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample14"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample14_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Packing Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="3dpReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample15"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample15_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Print</th>
													<th>Mode</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>3DP Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer"
									id="planningReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample16"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample16_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Stage</th>
													<th>Planned No</th>
													<th>Planning Type</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Planning Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="fqcReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample17"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample17_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Upper Att</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Lower Att</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>FQC Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="stagingReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample18"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample18_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Upper Aligner From</th>
													<th>Upper Aligner To</th>
													<th>Lower Aligner From</th>
													<th>Lower Aligner To</th>
													<th>Sheet Type</th>
													<th>Thick Upper</th>
													<th>Thick Lower</th>
													<th>Margin Upper</th>
													<th>Margin Lower</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Staging Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer" id="batchReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample19"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample19_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Previous Stage</th>
													<th>Stage</th>
													<th>Forwarded Stage</th>
													<th>Forwarded Date</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer"
									id="starterkitReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample20"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample20_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>User Name</th>
													<th>Previous Stage</th>
													<th>Stage</th>
													<th>Forwarded Stage</th>
													<th>Forwarded Date</th>
													<th>Case Creation Date</th>
													<th>Request Received Date</th>
													<th>Time Taken In Hours</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
									<!-- div  paymentReminderReport-->
								<div class="row tableContainer"
									id="paymentReminderTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample21"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample21_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>Upper Aligner from</th>
													<th>Upper Aligner to</th>
													<th>Lower Aligner from</th>
													<th>Lower Aligner to</th>
													<th>Remain Amount</th>
													<th>Invoice Date</th>
													<th>Invoice No.</th>
													<th>Next payment remainder date</th>
													<th>Total Received Amount</th>
													<th>Case creation date</th>
													<th>Last Payment Date</th>
													<th>Last dispatched Date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
									 <div class="row tableContainer"
									id="PendingForSignOffReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample22"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample22_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>Upper Aligner from</th>
													<th>Upper Aligner to</th>
													<th>Lower Aligner from</th>
													<th>Lower Aligner to</th>
													<th>Plan No.</th>
													<th>Stage</th>
													<th>Plan Date</th>
													<th>Case creation date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								 <div class="row tableContainer"
									id="AlignerPredictDispatchReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample23"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample23_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>Last upper dispatched</th>
													<th>Last dispatched date</th>
													<th>Next batch reminder date</th>
													<th>Last lower dispatched</th>
													<th>Remaining lower</th>
													<th>Panned upper</th>
													<th>Planned lower</th>
													<th>Remaining upper</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								 <div class="row tableContainer"
									id="MonthlyTransactionReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample24"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample24_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case Id</th>
													<th>Patient Name</th>
													<th>Doctor Name</th>
													<th>CRM</th>
													<th>Upper aligner from</th>
													<th>Upper aligner to</th>
													<th>Lower aligner from</th>
													<th>Lower aligner to</th>
													<th>Total amount</th>
													<th>Planned upper from</th>
													<th>Planned lower to</th>
													<th>Case creation date</th>
													<th>Monthly received amount</th>
													<th>Last Payment date</th>
													<th>Last dispatched date</th>
													<th>Planned upper to</th>
													<th>Planned lower from</th>
													<th>Invoice date</th>
													<th>Case category</th>
													<th>Invoice no</th>
													<th>Case types</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								 <div class="row tableContainer"
									id="DoctorsMonthlyCasesReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample25"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample25_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Doctor Name</th>
													<th>clinic_name</th>
													<th>crm_name</th>
													<th>dispatched_Cases</th>
													<th>pending_Cases</th>
													<th>total_Cases</th>
													<th>January</th>
													<th>February</th>
													<th>March</th>
													<th>April</th>
													<th>May</th>
													<th>June</th>
													<th>July</th>
													<th>August</th>
													<th>September</th>
													<th>October</th>
													<th>November</th>
													<th>December</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer"
									id="PaymentOverdueReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample26"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample26_info"
											style="width: 100%;">
											<thead>
												<tr>
													<th>Case id</th>
													<th>Patient name</th>
													<th>Doctor name</th>
													<th>CRM</th>
													<th>Total amount</th>
													<th>Total received amount</th>
													<th>Remain amount</th>
													<th>Last payment date</th>
													<th>Days since last payment</th>
													<th>Planned upper</th>
													<th>Planned lower</th>
													<th>Dispatched upper</th>
													<th>Dispatched lower</th>
													<th>Remaining upper</th>
													<th>Remaining lower</th>
													<th>Last dispatched date</th>
													<th>Case types</th>
													<th>Invoice no</th>
													<th>Invoice date</th>
													<th>Case creation date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row tableContainer"
									id="MonthwisePaymentReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample27"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample27_info"
											style="width: 100%;">
											<thead>
												<tr>
														<th>Case id</th>
														<th>Patient name</th>
														<th>Doctor name</th>
														<th>CRM</th>
														<th>Case types</th>
														<th>Planned upper</th>
														<th>Planned lower</th>
														<th>Remain amount</th>
														<th>Total amount</th>
														<th>Last dispatched date</th>
														<th>Case creation date</th>
														<th>Total received amount</th>
														<th>Dispatched upper</th>
														<th>Dispatched lower</th>
														<th>Last payment date</th>
														<th>Invoice no</th>
														<th>Invoice date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
									<div class="row tableContainer"
									id="MyCaselistReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample28"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample28_info"
											style="width: 100%;">
											<thead>
												<tr>
														<th>Case id</th>
														<th>Patient name</th>
														<th>Doctor name</th>
														<th>CRM</th>
														<th>upper_aligner_from</th>
														<th>upper_aligner_to</th>
														<th>lower_aligner_from</th>
														<th>lower_aligner_to</th>
														<th>case_creation_date</th>
														<th>planned_no</th>
														<th>Case plan_date date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<!-- Planning case report -->
									<div class="row tableContainer"
									id="PlanningCaseReportTableContainer">
									<div class="table-responsive">
										<table id="dtBasicExample29"
											class="table table-bordered table-sm dataTable display nowrap"
											role="grid" aria-describedby="dtBasicExample29_info"
											style="width: 100%;">
											<thead>
												<tr>
														<th>Case id</th>
														<th>Patient name</th>
														<th>Doctor name</th>
														<th>CRM</th>
														<th>User Name</th>
														<th>Stage</th>
														<th>Planning Type</th>
														<th>Plan-1</th>
														<th>Plan-1 Date</th>
														<th>Plan-2</th>
														<th>Plan-2 Date</th>
														<th>Plan-3</th>
														<th>Plan-3 Date</th>
														<th>Sign off Date</th>
														<th>Case creation date</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								<!-- div  -->
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
							</div>
							<div class="row" style="display: none;" id="loaderPanel">
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

	<!-- Single Case Update Modal -->
	<div class="modal" id="modal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Change Billing
						Status</h4>
				</div>
				<div class="modal-body">
					<form id="loginfrm">

						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Dispatched
										Id:</label> <input type="text" readonly class="form-control"
										id="dispatched-id"> <input type="hidden"
										id="user-name" value="<%=user_name%>">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Case
										Id:</label> <input type="text" readonly class="form-control"
										id="case-id">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Doctor
										Name:</label> <input type="text" readonly class="form-control"
										id="doctor-name">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Patient
										Name:</label> <input type="text" readonly class="form-control"
										id="patient-name">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Upper
										Dispatched:</label> <input type="text" readonly class="form-control"
										id="upper-dispatched">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Lower
										Dispatched:</label> <input type="text" readonly class="form-control"
										id="lower-dispatched">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status:</label> <select id="modal1_select" class="form-control">
								<%
								if (userRights.contains("WFC") == true) {
								%>
								<option value="unbilled">Unbilled</option>
								<option value="to bill">To Bill</option>
								<%
								}
								if (userRights.contains("account") == true) {
								%>
								<option value="billed">Billed</option>
								<option value="collected">Collected</option>
								<%
								}
								%>
								<option value="issue cn">Issue CN</option>
								<option value="cn issued">CN Issued</option>
								<option value="cancelled">Cancelled</option>
								<option value="dispute">Dispute</option>
							</select> <span class="alert-msg" id="err_msg3">Please change
								payment bill status</span>
						</div>
						<div class="form-group" id="billingAmountContainer"
							style="display: none;">
							<label for="billing-amount" class="control-label"><span
								class="asterisk">*</span> Billing Amount:</label> <input type="number"
								onkeypress="preventNonNumericalInput(event)" required
								class="form-control" name="myText" id="billing-amount"
								onkeypress="preventNonNumericalInput(event)"> <span
								class="alert-msg" id="err_msg5">This Field is Required*</span>
						</div>
						<div class="row paymentContainer">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="paid-amount" class="control-label"><span
										class="asterisk">*</span> Paid Amount:</label> <input type="number"
										onkeypress="preventNonNumericalInput(event)"
										class="form-control" id="paid-amount"> <span
										class="alert-msg" id="err_msg6">This Field is Required*</span>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="mode-of-payment" class="control-label"><span
										class="asterisk">*</span> Mode Of Payment:</label> <select
										id="mode-of-payment" class="form-control">
										<option value="">Select</option>
										<option value="cash">Cash</option>
										<option value="ccard">Credit Card</option>
										<option value="dcard">Debit Card</option>
										<option value="netb">NetBanking</option>
										<option value="upi">UPI</option>
									</select> <span class="alert-msg" id="err_msg7">This Field is
										Required*</span>
								</div>
							</div>
						</div>
						<div class="row paymentContainer">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="invoice-number" class="control-label"><span
										class="asterisk">*</span> Invoice Number:</label> <input type="number"
										onkeypress="preventNonNumericalInput(event)"
										class="form-control" id="invoice-number"> <span
										class="alert-msg" id="err_msg8">This Field is Required*</span>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="invoice-date" class="control-label"><span
										class="asterisk">*</span> Invoice Date:</label>
									<div class="input-group" style="margin-bottom: 0px;">
										<input type="text" class="form-control"
											style="background-color: white" name="invoice-date"
											id="invoice-date"> <span class="input-group-addon"
											id="sizing-addon2"><i
											class="glyphicon glyphicon-calendar"></i></span>
									</div>
									<span class="alert-msg" id="err_msg9">This Field is
										Required*</span>
								</div>
							</div>
						</div>
						<div class="form-group" id="remarks1" style="display: none;">
							<label for="recipient-name" class="control-label"><span
								class="asterisk">*</span> Remarks:</label> <input type="text" required
								class="form-control" name="myText" id="paymentRemarks1">
							<span class="alert-msg" id="err_msg1">This Field is
								Required*</span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modal_close1">Close</button>
					<button type="button" id="singleUpdateButton" class="btn">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Multiple Cases Update Modal -->
	<div class="modal" id="modal2" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Change Multiple
						Billing Status</h4>
					<span id="senddata1"></span>
				</div>
				<div class="modal-body">
					<form id="checkedfrmdata">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Case
								Id:</label>
							<textarea readonly class="form-control" id="case_ids"></textarea>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Payment
								Bill Status:</label> <select id="modal2_select" class="form-control">
								<%
								if (userRights.contains("WFC") == true) {
								%>
								<option value="unbilled">Unbilled</option>
								<option value="to bill">To Bill</option>
								<%
								}
								%>
								<option value="issue cn">Issue CN</option>
								<option value="cn issued">CN Issued</option>
								<option value="cancelled">Cancelled</option>
								<option value="dispute">Dispute</option>
							</select> <span class="alert-msg" id="err_msg4">Please change
								payment bill status</span>
						</div>
						<div class="form-group" id="remarks2" style="display: none;">
							<label for="recipient-name" class="control-label"><span
								class="asterisk">*</span> Remarks:</label> <input type="text" required
								class="form-control" name="myText" id="paymentRemarks2">
							<span class="alert-msg" id="err_msg2">This Field is
								Required*</span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modal_close2">Close</button>
					<button type="button" class="btn marked" id="multipleUpdateButton">Submit</button>
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
	let multipleData = [];
	let host = "https://103.120.178.180:8443/QRCodeGenerator";
	//let host = "http://localhost:2023";
	$.fn.dataTable.ext.errMode = "none";

	$(document).ready(function() {
		

		if($("#reportType").val() === "stage report"){

			$("#stageContainer").show();
			$("#searchButton").show();
			$("#dispatchReportContainer").hide();
			$("#caseTypeContainer").hide();
		}

		// Datepicker settings
		$("#startdate, #enddate, #invoice-date").flatpickr();
		$("#invoice-date").flatpickr({
			maxDate: new Date()
		});
		$("#startdate").on("change", function() {
			let startDateValue = $("#startdate").val();
			$("#enddate").flatpickr({
				minDate: startDateValue
			});
		});

		// To display or hide additional inputs on report type change
		$("#reportType").on("change", function() {
			let reportType = $(this).val();
			
			
			// this is commented to check new  report 
			  $("#caseType").find("option").eq(0).prop("selected", true);
			$("#reportDownloadPanel").hide();
			$("#startdate, #enddate, #userName").css("border-color", "#CCCCCC");
			$("#form_label1, #form_label2, #form_label3").css("color", "black"); 
			
			if (reportType === "dispatch report") {
				$("#dispatchReportContainer").show();
				$("#searchButton").hide();
			} else {
				$("#dispatchReportContainer").hide();
				$("#searchButton").show();
			}
			if (reportType === "hold_unhold report") {
				$("#case_status").show();
			} else {
				$("#case_status").hide();
			}
			if (reportType === "cases by city report" || reportType === "cases by crm report") {
				$("#crm_names").show();
				$("#caseType .optional").hide();
			} else {
				$("#crm_names").hide();
				$("#caseType .optional").show();
			}


			if (reportType === "3dp report") {
				 $("#caseTypeContainer").show();
			}
			if (reportType === "3dp report") {
				 $("#caseTypeContainer").show();
			}
			//
				if (reportType === "payment report") {
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}
				if (reportType === "planning report") {
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
				} else {
					$("#caseType .optional").show();
				}
				
				if (reportType === "signoff report") {
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
				} else {
					$("#caseType .optional").show();
				}
			
				if (reportType === "hollowtag report") {
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}
			
				if (reportType === "nextbatch report") {
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
				} else {
					$("#caseType .optional").show();
				}
				if (reportType === "staging report") {
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
				} else {
					$("#caseType .optional").show();
				}
				if (reportType === "upload report") {
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
				} else {
					$("#caseType .optional").show();
				}
			if (reportType === "cases by doctor report" || reportType === "cases by city report") {
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}
			if (reportType === "cases by doctor report") {
				$("#doctorContainer").show();
			} else {
				$("#doctorContainer").hide();
			}
			if (reportType === "user report") {
				$("#userContainer").show();
			} else {
				$("#userContainer").hide();
			}
			if (reportType === "stage report") {
				$("#stageContainer").show();
			} else {
				$("#stageContainer").hide();
			}
			if (reportType === "batch report" || reportType === "starterkit report") {
				$("#userContainer1").show();
			} else {
				$("#userContainer1").hide();
			}
			if (reportType === "batch report") {
				$("#userContainer1, #stageContainer1").show();
			} else {
				$("#stageContainer1").hide();
			}
			if (reportType === "starterkit report") {
				$("#userContainer1, #stageContainer2").show();
			} else {
				$("#stageContainer2").hide();
			}
			if (reportType === "user report" || reportType === "stage report" || reportType === "cases by crm report" || reportType === "batch report" || reportType === "starterkit report") {
				$("#caseTypeContainer").hide();
			} else {
				//$("#caseTypeContainer").show();
			}
			if (reportType === "dispatch report" || reportType === "payment report" || reportType === "nextbatch report" || reportType === "cases by doctor report" ||
				reportType === "cases by doctor report" || reportType === "cases by city report") {
				$("#caseType").find("option").eq(1).prop("selected", true);
				$("#caseTypeOption").hide();
			} else {
				$("#caseTypeOption").show();
			}
			
			// new report
			if(reportType === "payment reminder" ) {
				$("#caseTypeContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
					$("#caseType .optional").hide();
					$("#caseTypeContainer").show();
					$("#caseType").find("option").eq(1).prop("selected", true);
					//$("#caseType").find('[value="clove"]').remove();
				} else {
					$("#caseType .optional").show();				
					//$('#caseType').append(`<option value="${clove}"> Clove </option>`);
				}
			if(reportType === "pending for sign off report" ) {
				$("#caseTypeContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}
			if(reportType === "aligner predict dispatch report" ) {
				$("#caseTypeContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}
			
			if (reportType === "Monthly_transaction_report") {
				$("#caseTypeContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
				$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
			} else {
				$("#caseType .optional").show();
			}			
			if (reportType=== "PlanningCaseReport") {
				//$("#caseType .optional").hide();
				$("#caseTypeContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
			} else {
				$("#caseType .optional").show();
			}	
			
			
			//##
			if (reportType=== "DoctorsMonthlyCases") {
				$("#caseTypeContainer").hide();
				$("#fromdateContainer").hide();
				$("#todateContainer").hide();
				$("#yearContainer").show();
			} else {
				$("#yearContainer").hide();
				$("#caseType .optional").show();
				$("#caseTypeContainer").show();
				$("#fromdateContainer").show();
				$("#todateContainer").show();
			}			
			if (reportType=== "PaymentOverdueReport") {
				$("#caseTypeContainer").show();
				$("#fromdateContainer").hide();
				$("#todateContainer").hide();
				$("#daysContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
			} else {
				$("#daysContainer").hide();
				$("#caseType .optional").show();
				$("#caseTypeContainer").show();
				$("#fromdateContainer").show();
				$("#todateContainer").show();
			}
			if (reportType=== "PaymentOverdueReport") {
				$("#caseTypeContainer").show();
				$("#fromdateContainer").hide();
				$("#todateContainer").hide();
				$("#daysContainer").show();
				$("#caseType").find("option").eq(1).prop("selected", true);
			} else {
				$("#daysContainer").hide();
				$("#caseType .optional").show();
				$("#caseTypeContainer").show();
				$("#fromdateContainer").show();
				$("#todateContainer").show();
			}
			if (reportType=== "MonthwisePaymentReport") {
				$("#caseTypeContainer").show();
				$("#MonthwiseContainer").show();
				$("#yearContainer").show();
				$("#fromdateContainer").hide();
				$("#todateContainer").hide();
				$("#caseType").find("option").eq(1).prop("selected", true);
			} else {
				$("#MonthwiseContainer").hide();
				$("#yearContainer").hide();		
				$("#caseType .optional").show();
				$("#caseTypeContainer").show();
				if (reportType=== "PaymentOverdueReport") {
					$("#fromdateContainer").hide();
					$("#todateContainer").hide();
				}else{
					$("#fromdateContainer").show();
					$("#todateContainer").show();
				}
				
				$("#caseType").find("option").eq(1).prop("selected", true);
			}
			
			
			
			
			////

		});

		// To deselect header selection 		
		$("#dtBasicExample").on("page.dt", function() {
			$("#check_all, .dispatch_checkbox").prop("checked", false);
			$("#multipleChange").prop("disabled", true);
		});

		// Select or deselect all checkboxes
		$("#check_all").on("click", function() {
			if ($("input:checkbox").prop("checked") && api_response.length !== 0) {
				$("input:checkbox[name='row_check']").prop("checked", true);
				$("#multipleChange").prop("disabled", false);
			} else {
				$("input:checkbox[name='row_check']").prop("checked", false);
				$("#multipleChange").prop("disabled", true);
			}
		});

		// To display or hide remarks in modal1
		$("#modal1_select").on("change", function() {
			$("#paymentRemarks1, #billing-amount, #paid-amount, #invoice-number, #invoice-date").val("");
			$('#mode-of-payment option[value=""]').prop('selected', true);
			$("#err_msg1, #err_msg5, #err_msg6, #err_msg7, #err_msg8, #err_msg9").hide();
			if ($(this).val() == "cancelled" || $(this).val() == "dispute" || $(this).val() == "collected") {
				$("#remarks1").show();
				if ($(this).val() == "dispute" || $(this).val() == "collected") {
					$("#remarks1 label").text("Remarks:");
				} else {
					$("#remarks1 label").html("<span style='color: red'>*</span> Remarks:");
				}
			} else {
				$("#remarks1").hide();
			}
			if ($(this).val() == "billed") {
				$("#billingAmountContainer").show();
			} else {
				$("#billingAmountContainer").hide();
			}
			if ($(this).val() == "collected") {
				$(".paymentContainer").show();
			} else {
				$(".paymentContainer").hide();
			}
		});

		// To display or hide remarks in modal2
		$("#modal2_select").on("change", function() {
			$("#paymentRemarks2").val("");
			$("#err_msg2").hide();
			if ($(this).val() == "cancelled" || $(this).val() == "dispute") {
				$("#remarks2").show();
			} else {
				$("#remarks2").hide();
			}
		});

		// To submit modal1 form
		$("#singleUpdateButton").on("click", function(event) {
			event.preventDefault();
			let isReady = false;
			let paymentStatus = $("#modal1_select").val();
			let case_id = $("#case-id").val();
			let dispatched_id = $("#dispatched-id").val();
			let billingAmount = $("#billing-amount").val();
			let paidAmount = $("#paid-amount").val();
			let modeOfPayment = $("#mode-of-payment").val();
			let invoiceNumber = $("#invoice-number").val();
			let invoiceDate = $("#invoice-date").val();
			let remarks = $("#paymentRemarks1").val();
			let username = $("#user-name").val();
			let doctorName = $("#doctor-name").val();
			let patientName = $("#patient-name").val();
			let upperDispatched = $("#upper-dispatched").val();
			let lowerDispatched = $("#lower-dispatched").val();
			let data = [{
				"ids": dispatched_id,
				"status": paymentStatus,
				"remarks": remarks,
				"caseId": case_id,
				"billingAmount": billingAmount,
				"paidAmount": paidAmount,
				"modeOfPayment": modeOfPayment,
				"invoiceNumber": invoiceNumber,
				"invoiceDate": invoiceDate,
				"username": username,
				"doctorName": doctorName,
				"patientName": patientName,
				"upperDispatched": upperDispatched,
				"lowerDispatched": lowerDispatched
			}];
			if (paymentStatus === "cancelled" || paymentStatus === "dispute") {
				if (remarks === "") {
					$("#err_msg1").show();
				} else {
					$("#err_msg1").hide();
				}
			}
			if (paymentStatus === "billed") {
				if (billingAmount === "") {
					$("#err_msg5").show();
				} else {
					$("#err_msg5").hide();
				}
			}
			if (paymentStatus === "collected") {
				if (paidAmount === "") {
					$("#err_msg6").show();
				} else {
					$("#err_msg6").hide();
				}
				if (modeOfPayment === "") {
					$("#err_msg7").show();
				} else {
					$("#err_msg7").hide();
				}
				if (invoiceNumber === "") {
					$("#err_msg8").show();
				} else {
					$("#err_msg8").hide();
				}
				if (invoiceDate === "") {
					$("#err_msg9").show();
				} else {
					$("#err_msg9").hide();
				}
			}
			if (paymentStatus !== "cancelled" && paymentStatus !== "dispute" && paymentStatus !== "billed" && paymentStatus !== "collected") {
				isReady = true;
			} else if ((paymentStatus === "cancelled" || paymentStatus === "dispute") && remarks !== "") {
				isReady = true;
			} else if (paymentStatus === "billed" && billingAmount !== "") {
				isReady = true;
			} else if (paymentStatus === "collected" && paidAmount !== "" && modeOfPayment !== "" && invoiceNumber !== "" && invoiceDate !== "") {
				isReady = true;
			}
			let url = "/updatePaymentBillStatus";
			if (isReady) {
				$("#modal_close1").click();
				$("#loaderPanel").show();
				$.ajax({
					url: host + url,
					type: "PUT",
					data: JSON.stringify(data),
					contentType: 'application/json; charset=utf-8',
					success: function(response) {
						if ((response.isAccountPresent === true && (paymentStatus === "billed" || paymentStatus === "collected")) ||
							(paymentStatus !== "billed" && paymentStatus !== "collected")) {
							alert("Updated successfully.");
							let myTable = $('#dtBasicExample').DataTable();
							let indexes = myTable.rows().eq(0).filter(function(rowIdx) {
								return myTable.cell(rowIdx, 2).data() === dispatched_id ? true : false;
							});
							myTable.row(indexes).remove().draw();
						} else {
							alert("Account data is not present.");
						}
						$("#check_all, .dispatch_checkbox").prop("checked", false);
						$("#multipleChange").prop("disabled", true);
						$("#loaderPanel").hide();
					},
					error: function(response) {
						console.log(response);
						alert("Internal server error!");
						$("#loaderPanel").hide();
					}
				});
			}
		});

		// To submit modal2 form
		$("#multipleUpdateButton").on("click", function(event) {
			event.preventDefault();
			let isReady = false;
			let paymentStatus = $("#modal2_select").val();
			let remarks = $("#paymentRemarks2").val();
			if (paymentStatus === "cancelled" || paymentStatus === "dispute") {
				if (remarks === "") {
					$("#err_msg2").show();
				} else {
					$("#err_msg2").hide();
				}
			}
			if (paymentStatus !== "cancelled" && paymentStatus !== "dispute") {
				isReady = true;
			} else if ((paymentStatus === "cancelled" || paymentStatus === "dispute") && remarks !== "") {
				isReady = true;
			}
			for (let i = 0; i < multipleData.length; i++) {
				multipleData[i].remarks = remarks;
				multipleData[i].status = paymentStatus;
			}
			let url = "/updatePaymentBillStatus";
			if (isReady) {
				$("#modal_close2").click();
				$("#loaderPanel").show();
				$.ajax({
					url: host + url,
					data: JSON.stringify(multipleData),
					contentType: 'application/json; charset=utf-8',
					type: "PUT",
					success: function(response) {
						alert("Updated successfully.");
						let myTable = $('#dtBasicExample').DataTable();
						$(".dispatch_checkbox:checked").each(function(i) {
							let indexNumber = $(this).closest("tr").index();
							myTable.row(":eq(" + indexNumber + ")").remove().draw();
						});
						$("#check_all").prop("checked", false);
						$("#multipleChange").prop("disabled", true);
						$("#loaderPanel").hide();
					},
					error: function(response) {
						console.log(response);
						alert("Internal server error!");
						$("#loaderPanel").hide();
					}
				});
			}
		});

		// To search data and to show table
		$(".searchReport").on("click", function(event) {
			event.preventDefault();
			let isReady = false;
			let url = "";
			let startdate = $("#startdate").val();
			let enddate = $("#enddate").val();
			
			if(startdate==''){
				startdate = "YYYY-MM-DD";
			}
			if(enddate==''){
				enddate = "YYYY-MM-DD";
			}
			let caseType = $("#caseType").val();
			let dispatchType = $("#dispatchType").val();
			let requestType = $("#requestType").val();
			let paymentStatus = $("#paymentStatus").val();
			let extraAligners = $("#extraAligners").val();
			let reportType = $("#reportType").val();
			let caseStage = $("#case_stage").val();
			let crmName = $("#crm_name").val();
			let doctorName = $("#doctorName").val();
			let userName = $("#userName").val();
			let stage = $("#stage").val();
			let stage1 = $("#stage1").val();
			let stage2 = $("#stage2").val();
			let usernames = $("#usernames").val();
			let userCaseStatus = $("#userCaseStatus").val();
			let myCaseusernames = $("#MyCaseusernames").val();
			let year = $("#year").val();
			let month = $("#monthwise_payment").val();
			let payment_overduedays = $("#payment_overduedays").val();
			
			$("#reportDownloadPanel, #multipleChange").hide();
			$("#multipleChange").prop("disabled", true);
			let tables = ["#dtBasicExample", "#dtBasicExample1", "#dtBasicExample2", "#dtBasicExample3", "#dtBasicExample4", "#dtBasicExample5", "#dtBasicExample6",
				"#dtBasicExample7", "#dtBasicExample8", "#dtBasicExample9", "#dtBasicExample10", "#dtBasicExample11", "#dtBasicExample12", "#dtBasicExample13", "#dtBasicExample14",
				"#dtBasicExample15", "#dtBasicExample16", "#dtBasicExample17", "#dtBasicExample18", "#dtBasicExample19", "#dtBasicExample20", "#dtBasicExample21",
				"#dtBasicExample22","#dtBasicExample23","#dtBasicExample24","#dtBasicExample25","#dtBasicExample26","#dtBasicExample27"
			];
			tables.forEach(element => {
				let table = $(element).DataTable();
				table.clear().draw();
				table.destroy();
			});
			$("#check_all").prop("checked", false);
			$(".downloadExcel").prop("disabled", true);
		 	if (startdate == "" && reportType!="DoctorsMonthlyCases") {
				$("#startdate").css("border-color", "red");
				$("#form_label1").css("color", "red");
			} else {
				$("#startdate").css("border-color", "#CCCCCC");
				$("#form_label1").css("color", "black");
			}
			if (enddate == ""  && reportType!='DoctorsMonthlyCases') {
				$("#enddate").css("border-color", "red");
				$("#form_label2").css("color", "red");
			} else {
				$("#enddate").css("border-color", "#CCCCCC");
				$("#form_label2").css("color", "black");
			} 
			if (userName == "") {
				$("#userName").css("border-color", "red");
				$("#form_label3").css("color", "red");
			} else {
				$("#userName").css("border-color", "#CCCCCC");
				$("#form_label3").css("color", "black");
			}
			if (stage1 == "" && reportType === "batch report") {
				$("#stage1").css("border-color", "red");
				$("#form_label4").css("color", "red");
			} else {
				$("#stage1").css("border-color", "#CCCCCC");
				$("#form_label4").css("color", "black");
			}
			if (stage2 == "" && reportType === "starterkit report") {
				$("#stage2").css("border-color", "red");
				$("#form_label5").css("color", "red");
			} else {
				$("#stage2").css("border-color", "#CCCCCC");
				$("#form_label5").css("color", "black");
			}
			if (stage == "" && reportType === "stage report") {
				$("#stage").css("border-color", "red");
				$("#form_label6").css("color", "red");
			} else {
				$("#stage").css("border-color", "#CCCCCC");
				$("#form_label6").css("color", "black");
			}
			//
			if (reportType === "payment reminder" && caseType==="") {
				alert(" Case Type must be filled out!")
				return false;
			}
			if (reportType === "MonthwisePaymentReport" && caseType==="" ) {
				alert(" Case Type must be filled out!")
				return false;
			}
			if (reportType === "MonthwisePaymentReport" && year==="") {
				alert("year must be filled out!")
				return false;
			}
			if (reportType === "MonthwisePaymentReport" && month==="" ) {
				alert("Month must be filled out!")
				return false;
			}
			if (reportType === "MyCaselist" && MyCaseusernames==="") {
				alert("User Name must be filled out!")
				return false;
			} 
			if (reportType === "MyCaselist" && userCaseStatus==="") {
				alert("Status must be filled out!")
				return false;
			} 
			if (reportType === "DoctorsMonthlyCases"  && year==="") {
				alert("year must be filled out!")
				return false;
			} 
			 if (reportType === "PaymentOverdueReport"  && payment_overduedays==="") {
				alert("Day must be filled out!")
				return false;
			}  	/*	if (reportType === "PaymentOverdueReport"  && caseType==="") {
				alert("Case Type must be filled out!3")
				return false;
			} */

			if (startdate != "" && enddate != "" && reportType !== "user report" &&  reportType !== "batch report" &&  reportType !== "starterkit report" &&  reportType !== "stage report") {
				isReady = true;
			}
			if (reportType === "user report" && userName != "" && startdate != "" && enddate != "") {
				isReady = true;
			}
			if (reportType === "batch report" && stage1 != "" && startdate != "" && enddate != "") {
				isReady = true;
			}
			if (reportType === "starterkit report" && stage2 != "" && startdate != "" && enddate != "") {
				isReady = true;
			}
			if (reportType === "stage report" && stage != "" && startdate != "" && enddate != "") {
				isReady = true;
			}

			if (reportType === "dispatch report") {
				url = "/getWattsDispatchReports?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Dispatch_Type=" + dispatchType + "&Request_Type=" + requestType + "&Extra_Aligner=" + extraAligners + "&Payment_Status=" + paymentStatus;
			} else if (reportType === "hold_unhold report") {
				url = "/getCaseStatusReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Case_Status=" + caseStage;
			} else if (reportType === "nextbatch report") {
				url = "/getNextBatchReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType;
			} else if (reportType === "payment report") {
				url = "/getPaymentReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType;
			} else if (reportType === "signoff report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=SignOff";
			} else if (reportType === "upload report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Upload";
			} else if (reportType === "cases by city report") {
				url = "/getCaseByCityReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&crm_name=" + crmName;
			} else if (reportType === "cases by crm report") {
				url = "/getCaseByCrmReport?FromDate=" + startdate + "&ToDate=" + enddate + "&precedureType=sup&crm_name=" + crmName;
			} else if (reportType === "cases by doctor report") {
				url = "/getCaseByDoctorReport?FromDate=" + startdate + "&ToDate=" + enddate + "&precedureType=sup&doctorName=" + doctorName + "&Case_Type=" + caseType;
			} else if (reportType === "ini cases report") {
				url = "/getINICaseReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType;
			} else if (reportType === "user report") {
				url = "/getWorkHistoryReport?FromDate=" + startdate + "&ToDate=" + enddate + "&username=" + userName;
			} else if (reportType === "stage report") {
				url = "/getStagesReport?FromDate=" + startdate + "&ToDate=" + enddate + "&stage=" + stage;
			} else if (reportType === "hollowtag report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=HollowTag";
			} else if (reportType === "lab report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Lab";
			} else if (reportType === "packing report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Packing";
			} else if (reportType === "3dp report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=3dp";
			} else if (reportType === "planning report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Planning";
			} else if (reportType === "fqc report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Fqc";
			} else if (reportType === "staging report") {
				url = "/getUploadSignoffReport?FromDate=" + startdate + "&ToDate=" + enddate + "&Case_Type=" + caseType + "&Report_Type=Staging";
			} else if (reportType === "batch report") {
				url = "/getWorkflowStagesReport?FromDate=" + startdate + "&ToDate=" + enddate + "&stage=" + stage1 + "&users=" + usernames + "&Report_Type=BatchReport";
			/* } else if (reportType === "starterkit report") {
				url = "/getWorkflowStagesReport?FromDate=" + startdate + "&ToDate=" + enddate + "&stage=" + stage2 + "&users=" + usernames + "&Report_Type=StarterkitReport";
			} */
			} else if (reportType === "starterkit report") {
				url = "/getWorkflowStagesReport?FromDate=" + startdate + "&ToDate=" + enddate + "&stage=" + stage2 + "&users=" + usernames + "&Report_Type=StarterkitReport";
			}
			///new reports
			 else if (reportType === "payment reminder") {
				  url = "/WFPaymentRemainderReport?fromDate="+ startdate + "&toDate=" + enddate + "&caseType="+caseType		
				console.log("payment reminder url "+url)
			} 
			 else if (reportType === "pending for sign off report") {
				 caseType = "32watts"
				  url = "/WFPendingForSignOffReport?caseType="+caseType+"&fromDate="+ startdate + "&toDate=" + enddate
			} 
			 else if (reportType === "aligner predict dispatch report") {
					  url = "/WFAlignerPredictDispatchReport?fromDate="+ startdate + "&toDate=" + enddate + "&caseType="+caseType				     
			}
			 else if (reportType === "Monthly_transaction_report") {
					  url = "/WFMonthlyAlignerTransactionReport?fromDate="+ startdate + "&toDate=" + enddate + "&caseType="+caseType				     
			} 
			 else if (reportType === "DoctorsMonthlyCases") {
					  url = "/WFDoctorsMonthlyCasesReport?year="+year//+ year	
			} 
			 else if (reportType === "PaymentOverdueReport") {
					  url = "/WFAlignerPaymentOverdueReport?caseType="+caseType+"&days="+payment_overduedays//
						console.log("PaymentOverdueReport: "+url)
			} 
			 else if (reportType === "MonthwisePaymentReport") {
					  url = "/WFMonthwisePaymentReport?year="+year+"&month="+month+"&type="+caseType//	
			}  
			 else if (reportType === "PlanningCaseReport") {
				  url = "/GetPlanningCaseReport?fromDate="+ startdate + "&toDate=" + enddate + "&caseType="+caseType				     
			}

			if (isReady) {
				$("#loaderPanel").show();
				$(".tableContainer").hide();
				$.ajax({
					url: host + url,
					type: "GET",
					success: function(response) {
						api_response = JSON.stringify(response)
						if (reportType === "dispatch report") {
							$("#dtBasicExample").DataTable({
								"data": response.data,
								"columns": [{
										"data": "dispatched_id",
										"mRender": function(data, type, full) {
											return "<a href='' class='text-primary' onClick='singleCaseModal(" + data + ")' id='" + data + "' data-toggle='modal' data-target='#modal1'>Change Billing Status</a>";
										}
									},
									{
										"data": "dispatched_id",
										"mRender": function(data, type, full) {
											return "<input type='checkbox' id='" + data + "' value='" + full.case_id + "::" + JSON.stringify(full) + "' class='text-center dispatch_checkbox' name='row_check' onclick='enableBillingButton()' class='selectMultiple' style='margin-left:8px;margin-top:3px;'>";
										}
									},
									{
										"data": "dispatched_id"
									},
									{
										"data": "case_id",
										"mRender": function(data, type, full) {
											return "<a href='Approval?caseId=" + data + "&logusername=null&NxtStage=INI&SearchStage=Y' class='text-primary'>" + data + "</a>";
										}
									},
									{
										"data": "patient_name"
									},
									{
										"data": "doctor_name"
									},
									{
										"data": "crm"
									},
									{
										"data": "phone"
									},
									{
										"data": "location"
									},
									{
										"data": "city"
									},
									{
										"data": "pincode"
									},
									{
										"data": "request_Type"
									},
									{
										"data": "payment_Mode"
									},
									{
										"data": "total_Amount"
									},
									{
										"data": "received_Amount"
									},
									{
										"data": "remain_Amount"
									},
									{
										"data": "last_Payment_Date"
									},
									{
										"data": "planning_id"
									},
									{
										"data": "plan_date"
									},
									{
										"data": "upper_Planned"
									},
									{
										"data": "lower_Planned"
									},
									{
										"data": "upper_Att"
									},
									{
										"data": "lower_att"
									},
									{
										"data": "extra_Upper_Batches"
									},
									{
										"data": "extra_Lower_Batches"
									},
									{
										"data": "upper_Dispatched"
									},
									{
										"data": "lower_Dispatched"
									},
									{
										"data": "mode_of_dispatch"
									},
									{
										"data": "tracking_id"
									},
									{
										"data": "delivery_nn"
									},
									{
										"data": "dispatched_date"
									},
									{
										"data": "payment_Bill_status"
									},
									{
										"data": "payment_Bill_status_Remarks"
									}
								]
							});
							$("#dispatchTableContainer, #multipleChange").show();
						} else if (reportType === "nextbatch report") {
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
										"data": "planning_id"
									},
									{
										"data": "planned_upper_from"
									},
									{
										"data": "planned_upper_to"
									},
									{
										"data": "planned_lower_from"
									},
									{
										"data": "planned_lower_to"
									},
									{
										"data": "dispatched_Date"
									},
									{
										"data": "dispatch_upper_from"
									},
									{
										"data": "dispatch_upper_to"
									},
									{
										"data": "dispatch_lower_from"
									},
									{
										"data": "dispatch_lower_to"
									},
									{
										"data": "next_UPPER_REMINDER_DATE"
									},
									{
										"data": "next_LOWER_REMINDER_DATE"
									},
									{
										"data": "payment_bill_status"
									},
									{
										"data": "payment_bill_status_remarks"
									}
								]
							});
							$("#nextBatchTableContainer").show();
						} else if (reportType === "payment report") {
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
										"data": "crm"
									},
									{
										"data": "case_types"
									},
									{
										"data": "total_amount"
									},
									{
										"data": "remain_amount"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "last_Payment_date"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "last_dispatched_date"
									},
									{
										"data": "invoice_no"
									},
									{
										"data": "invoice_date"
									},
									{
										"data": "case_creation_date"
									}
								]
							});
							$("#paymentTableContainer").show();
						} else if (reportType === "hold_unhold report") {
							$("#dtBasicExample3").DataTable({
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
										"data": "user_Name"
									},
									{
										"data": "status_Type"
									},
									{
										"data": "remarks"
									},
									{
										"data": "insertDatetime"
									}
								]
							});
							$("#caseStageTableContainer").show();
						} else if (reportType === "signoff report") {
							$("#dtBasicExample4").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "planned_no"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "sign_off_date"
									},
									{
										"data": "time_diff_hours"
									}
								]
							});
							$("#signoffTableContainer").show();
						} else if (reportType === "upload report") {
							$("#dtBasicExample5").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "upload_date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#uploadTableContainer").show();
						} else if (reportType === "cases by city report") {
							$("#dtBasicExample6").DataTable({
								"data": response.data,
								"columns": [{
										"data": "city_name",
										"mRender": function(data, type, full) {
											return "<a href='subReport.jsp?Case_Type=" + caseType + "&FromDate=" + startdate + "&ToDate=" + enddate + "&city=" + data + "&crm_name=" + crmName + "&reportType=" + reportType + "' class='text-primary' target='_black'>" + data + "</a>";
										}
									},
									{
										"data": "total_cases"
									},
									{
										"data": "total_Planned_Cases"
									},
									{
										"data": "total_dispatched_cases"
									},
									{
										"data": "total_Cases_in_Account"
									},
									{
										"data": "total_Amount"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "remaining_Amount"
									}
								]
							});
							$("#casesByCityTableContainer").show();
						} else if (reportType === "cases by crm report") {
							$("#dtBasicExample7").DataTable({
								"data": response.data,
								"columns": [{
										"data": "crm_name",
										"mRender": function(data, type, full) {
											return "<a href='subReport.jsp?FromDate=" + startdate + "&ToDate=" + enddate + "&crm_name=" + data + "&reportType=" + reportType + "' class='text-primary' target='_black'>" + data + "</a>";
										}
									},
									{
										"data": "total_cases"
									},
									{
										"data": "total_Planned_Cases"
									},
									{
										"data": "total_dispatched_cases"
									},
									{
										"data": "total_Cases_in_Account"
									},
									{
										"data": "total_Amount"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "remaining_Amount"
									}
								]
							});
							$("#casesByCRMTableContainer").show();
						} else if (reportType === "cases by doctor report") {
							$("#dtBasicExample8").DataTable({
								"data": response.data,
								"columns": [{
										"data": "doctor_name",
										"mRender": function(data, type, full) {
											return "<a href='subReport.jsp?Case_Type=" + caseType + "&FromDate=" + startdate + "&ToDate=" + enddate + "&doctorName=" + data + "&reportType=" + reportType + "' class='text-primary' target='_black'>" + data + "</a>";
										}
									},
									{
										"data": "clinic_name"
									},
									{
										"data": "case_types"
									},
									{
										"data": "total_cases"
									},
									{
										"data": "total_Planned_Cases"
									},
									{
										"data": "total_dispatched_cases"
									},
									{
										"data": "total_Cases_in_Account"
									},
									{
										"data": "total_Amount"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "remaining_Amount"
									}
								]
							});
							$("#casesByDoctorTableContainer").show();
						} else if (reportType === "ini cases report") {
							$("#dtBasicExample9").DataTable({
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
										"data": "user_name"
									},
									{
										"data": "city"
									},
									{
										"data": "stage"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "ini_date"
									}
								]
							});
							$("#iniCasesTableContainer").show();
						} else if (reportType === "user report") {
							$("#dtBasicExample10").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
									},
									{
										"data": "patient_name"
									},
									{
										"data": "doctor_name"
									},
									{
										"data": "user_name"
									},
									{
										"data": "type_request"
									},
									{
										"data": "forwarded_stage"
									},
									{
										"data": "forwarded_date"
									}
								]
							});
							$("#userReportTableContainer").show();
						} else if (reportType === "stage report") {
							$("#dtBasicExample11").DataTable({
								"data": response.data,
								"columns": [{
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "total_case"
									}
								]
							});
							$("#stageReportTableContainer").show();
						} else if (reportType === "hollowtag report") {
							$("#dtBasicExample12").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "hollowtag_date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#holowtagReportTableContainer").show();
						} else if (reportType === "lab report") {
							$("#dtBasicExample13").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "making"
									},
									{
										"data": "waxing"
									},
									{
										"data": "thermoform"
									},
									{
										"data": "name_cat"
									},
									{
										"data": "hand_tooling"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "upper_att"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "lower_att"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "lab_date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#labReportTableContainer").show();
						} else if (reportType === "packing report") {
							$("#dtBasicExample14").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "packing_Date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#packingReportTableContainer").show();
						} else if (reportType === "3dp report") {
							$("#dtBasicExample15").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "print"
									},
									{
										"data": "mode"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "3DP_Date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#3dpReportTableContainer").show();
						} else if (reportType === "planning report") {
							$("#dtBasicExample16").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "planned_no"
									},
									{
										"data": "planning_type"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "planning_DATE"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#planningReportTableContainer").show();
						} else if (reportType === "fqc report") {
							$("#dtBasicExample17").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "upper_att"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "lower_att"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "fqc_date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#fqcReportTableContainer").show();
						} else if (reportType === "staging report") {
							$("#dtBasicExample18").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
									},
									{
										"data": "patient_Name"
									},
									{
										"data": "doctor_Name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "user_name"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "sheet_type"
									},
									{
										"data": "thick_upper"
									},
									{
										"data": "thick_lower"
									},
									{
										"data": "margin_upper"
									},
									{
										"data": "margin_lower"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Recieved_date"
									},
									{
										"data": "stagging_Date"
									},
									{
										"data": "time_Taken_hours"
									}
								]
							});
							$("#stagingReportTableContainer").show();
						} else if (reportType === "batch report") {
							$("#dtBasicExample19").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
									},
									{
										"data": "patient_Name"
									},
									{
										"data": "doctor_Name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "user_name"
									},
									{
										"data": "previous_stage"
									},
									{
										"data": "stage"
									},
									{
										"data": "forwarded_stage"
									},
									{
										"data": "forwarded_date"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Received_Date"
									},
									{
										"data": "time_Taken"
									}
								]
							});
							$("#batchReportTableContainer").show();
						} else if (reportType === "starterkit report") {
							$("#dtBasicExample20").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
									},
									{
										"data": "patient_Name"
									},
									{
										"data": "doctor_Name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "user_name"
									},
									{
										"data": "previous_stage"
									},
									{
										"data": "stage"
									},
									{
										"data": "forwarded_stage"
									},
									{
										"data": "forwarded_date"
									},
									{
										"data": "case_Creation_Date"
									},
									{
										"data": "request_Received_Date"
									},
									{
										"data": "time_Taken"
									}
								]
							});
							$("#starterkitReportTableContainer").show();
						}
						// paymentReminder div
						 else if (reportType === "payment reminder") {
							$("#dtBasicExample21").DataTable({
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
										"data": "crm"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "remain_amount"
									},
									{
										"data": "invoice_date"
									},
									{
										"data": "invoice_no"
									},
									{
										"data": "next_payment_remainder_date"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "last_Payment_date"
									},
									{
										"data": "last_dispatched_date"
									}
								]
							});
							$("#paymentReminderTableContainer").show();
						} 
						// pending for signoff
						else if (reportType === "pending for sign off report") {
							$("#dtBasicExample22").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
									},
									{
										"data": "patient_Name"
									},
									{
										"data": "doctor_Name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "planned_no"
									},
									{
										"data": "stage"
									},
									{
										"data": "plan_date"
									},
									{
										"data": "case_creation_date"
									}
								]
							});
							$("#PendingForSignOffReportTableContainer").show();
						} 
						// predict 
						else if (reportType === "aligner predict dispatch report") {
							$("#dtBasicExample23").DataTable({
								"data": response.data,
								"columns": [{
										"data": "case_id"
									},
									{
										"data": "patient_name"
									},
									{
										"data": "doctor_Name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "last_upper_dispached"
									},
									{
										"data": "last_dispatched_date"
									},
									{
										"data": "next_BATCH_REMINDER_DATE"
									},
									{
										"data": "last_lower_dispatched"
									},
									{
										"data": "remaining_lower"
									},
									{
										"data": "panned_upper"
									},
									{
										"data": "planned_lower"
									},
									{
										"data": "remaining_upper"
									}
								]
							});
							$("#AlignerPredictDispatchReportTableContainer").show();
						}
						else if (reportType === "Monthly_transaction_report") {
							$("#dtBasicExample24").DataTable({
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
										"data": "crm"
									},
									{
										"data": "upper_aligner_from"
									},
									{
										"data": "upper_aligner_to"
									},
									{
										"data": "lower_aligner_from"
									},
									{
										"data": "lower_aligner_to"
									},
									{
										"data": "total_amount"
									},
									{
										"data": "planned_upper_from"
									},
									{
										"data": "planned_lower_to"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "monthly_Received_amount"
									},
									{
										"data": "last_Payment_date"
									},
									{
										"data": "last_dispatched_date"
									},
									{
										"data": "planned_upper_to"
									},
									{
										"data": "planned_lower_from"
									},
									{
										"data": "invoice_date"
									},
									{
										"data": "case_category"
									},
									{
										"data": "invoice_no"
									},
									{
										"data": "case_Types"
									}
								]
							});
							$("#MonthlyTransactionReportTableContainer").show();
						}
						
						 
						else if (reportType === "DoctorsMonthlyCases") {
							
							 console.log("DoctorsMonthlyCases api response====>")
							$("#dtBasicExample25").DataTable({
								"data": response.data,
								"columns": [{
										"data": "doctor_name"
									},
									{
										"data": "clinic_name"
									},
									{
										"data": "crm_name"
									},
									{
										"data": "dispatched_Cases"
									},
									{
										"data": "pending_Cases"
									},
									{
										"data": "total_Cases"
									},
									{
										"data": "january"
									},
									{
										"data": "february"
									},
									{
										"data": "march"
									},
									{
										"data": "april"
									},
									{
										"data": "may"
									},
									{
										"data": "june"
									},
									{
										"data": "july"
									},
									{
										"data": "august"
									},
									{
										"data": "september"
									},
									{
										"data": "october"
									},
									{
										"data": "november"
									},
									{
										"data": "december"
									}
								]
							});
							$("#DoctorsMonthlyCasesReportTableContainer").show();
						}
						 else if (reportType === "PaymentOverdueReport") {
							$("#dtBasicExample26").DataTable({
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
										"data": "crm"
									},
									{
										"data": "total_amount"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "remain_amount"
									},
									{
										"data": "last_Payment_date"
									},
									{
										"data": "days_Since_last_payment"
									},
									{
										"data": "planned_upper"
									},
									{
										"data": "planned_lower"
									},
									{
										"data": "dispatched_upper"
									},
									{
										"data": "dispatched_lower"
									},
									{
										"data": "remaining_upper"
									},
									{
										"data": "remaining_lower"
									},
									{
										"data": "last_dispatched_date"
									},
									{
										"data": "case_Types"
									},
									{
										"data": "invoice_no"
									},
									{
										"data": "invoice_date"
									},
									{
										"data": "case_creation_date"
									}
								]
							});
							$("#PaymentOverdueReportTableContainer").show();
						}
						else if (reportType === "MonthwisePaymentReport") {
							$("#dtBasicExample27").DataTable({
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
										"data": "crm"
									},
									{
										"data": "case_Types"
									},
									{
										"data": "planned_upper"
									},
									{
										"data": "planned_lower"
									},
									{
										"data": "remain_amount"
									},
									{
										"data": "total_amount"
									},
									{
										"data": "last_dispatched_date"
									},
									{
										"data": "case_creation_date"
									},
									{
										"data": "total_Received_amount"
									},
									{
										"data": "dispatched_upper"
									},
									{
										"data": "dispatched_lower"
									},
									{
										"data": "last_Payment_date"
									},
									{
										"data": "invoice_no"
									},
									{
										"data": "invoice_date"
									}
								]
							});
							$("#MonthwisePaymentReportTableContainer").show();
						}
						else if (reportType === "PlanningCaseReport") {
							$("#dtBasicExample29").DataTable({
								"data": response.data,
								"columns": [{
										"data": "caseid"
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
										"data": "user_name"
									},
									{
										"data": "stage"
									},
									{
										"data": "planning_type"
									},
									{
										"data": "plan1"
									},
									{
										"data": "plan1_Date"
									},
									{
										"data": "plan2"
									},
									{
										"data": "plan2_Date"
									},
									{
										"data": "plan3"
									},
									{
										"data": "plan3_Date"
									},
									{
										"data": "sign_off_date"
									},
									{
										"data": "case_Creation_Date"
									}
								]
							});
							$("#PlanningCaseReportTableContainer").show();
						}
						
						let optionValue = JSON.parse(api_response).data[0].payment_Bill_status;
						$('option[name="' + optionValue + '"]').prop("selected", true);
						$(".downloadExcel").prop("disabled", false);
						$("#reportDownloadPanel").show();
						$("#loaderPanel").hide();
					},
					error: function(response) {
						console.log(response);
						if (response.status == 500) {
								$("#errorTable table th, #errorTable table td").text("Internal Server Error");
						} else {
							$("#errorTable table th, #errorTable table td").text("No Data Available");
						}
						$("#errorTable, #reportDownloadPanel").show();
						$("#loaderPanel").hide();
					}
				});
			}
		});
	});

	// To download csv file
	function exportToExcel(extention) {
		let response = JSON.parse(api_response);
		const wb = XLSX.utils.book_new();
		const ws = XLSX.utils.json_to_sheet(response.data, {
			raw: false,
			dateNF: 'yyyy-mm-dd'
		});
		XLSX.utils.book_append_sheet(wb, ws, "test");
		XLSX.writeFile(wb, "Report." + extention);
	}

	function exportToPDF() {
		let response = JSON.parse(api_response);
		const doc = new jsPDF();
		let data = response.data;
		data.forEach(function(item, i) {
			doc.text(20, 10 + (i * 10),
				"First Name: " + item.patient_name +
				"Last Name: " + item.doctor_name);
		});
		doc.save('Report.pdf');
	}

	// To enable or disable change billing button 
	function enableBillingButton() {
		let total_checked_boxes = $("input:checkbox[name='row_check']:checked").length;
		if ($("#multipleChange").prop("disabled") == true && total_checked_boxes != 0) {
			$("#multipleChange").prop("disabled", false);
		}
		if ($("#multipleChange").prop("disabled") == false && total_checked_boxes == 0) {
			$("#multipleChange").prop("disabled", true);
			$("#check_all").prop("checked", false);
		}
	}

	// To allow number only in number input
	function preventNonNumericalInput(e) {
		e = e || window.event;
		var charCode = (typeof e.which == "undefined") ? e.keyCode : e.which;
		var charStr = String.fromCharCode(charCode);
		if (!charStr.match(/^[0-9]+$/))
			e.preventDefault();
	}

	// To set or reset data in modal1
	function singleCaseModal(dispatched_id) {
		let response = JSON.parse(api_response)
		let optionValue = JSON.parse(api_response).data[0].payment_Bill_status;
		$('#modal1_select option[value="' + optionValue + '"]').prop('selected', true);
		if ($("#modal1_select").val() == "cancelled" || $("#modal1_select").val() == "dispute" || $("#modal1_select").val() == "collected") {
			$("#remarks1").show();
			if ($("#modal1_select").val() == "dispute" || $("#modal1_select").val() == "collected") {
				$("#remarks1 label").text("Remarks:");
			} else {
				$("#remarks1 label").html("<span style='color: red'>*</span> Remarks:");
			}
		} else {
			$("#remarks1, #err_msg1").hide();
		}
		if ($("#modal1_select").val() == "billed") {
			$("#billingAmountContainer").show();
		} else {
			$("#billingAmountContainer, #err_msg5").hide();
		}
		if ($("#modal1_select").val() == "collected") {
			$(".paymentContainer").show();
		} else {
			$("#err_msg6, #err_msg7, #err_msg8, #err_msg9, .paymentContainer").hide();
		}
		$("#paymentRemarks1, #billing-amount, #paid-amount, #invoice-number, #invoice-date").val("");
		$('#mode-of-payment option[value=""]').prop('selected', true);
		$("#err_msg1, #err_msg3, #err_msg5, #err_msg6, #err_msg7, #err_msg8, #err_msg9").hide();
		for (let i = 0; i < response.data.length; i++) {
			if (response.data[i].dispatched_id == dispatched_id) {
				$("#dispatched-id").val(response.data[i].dispatched_id);
				$("#case-id").val(response.data[i].case_id);
				$("#doctor-name").val(response.data[i].doctor_name);
				$("#patient-name").val(response.data[i].patient_name);
				$("#upper-dispatched").val(response.data[i].upper_Dispatched);
				$("#lower-dispatched").val(response.data[i].lower_Dispatched);
				break;
			}
		}
	}

	// To set or reset data in modal2
	function multipleCaseModal() {
		let case_ids = [];
		let accountData = [];
		let optionValue = JSON.parse(api_response).data[0].payment_Bill_status;
		$('#modal2_select option[value="' + optionValue + '"]').prop('selected', true);
		if ($("#modal2_select").val() == "cancelled" || $("#modal2_select").val() == "dispute") {
			$("#remarks2").show();
		} else {
			$("#remarks2, #err_msg2").hide();
		}
		$("#paymentRemarks2").val("");
		$("#err_msg2, #err_msg4").hide();
		$(".dispatch_checkbox:checked").each(function(i) {
			let data = $(this).val().split("::");
			case_ids[i] = data[0];
			let response = JSON.parse(data[1]);
			let username = $("#user-name").val();
			accountData[i] = {
				"ids": response.dispatched_id,
				"status": "",
				"remarks": "",
				"caseId": response.case_id,
				"username": username,
				"doctorName": response.doctor_name,
				"patientName": response.patient_name,
				"upperDispatched": response.upper_Dispatched,
				"lowerDispatched": response.lower_Dispatched
			};
			document.getElementById("case_ids").value = case_ids;
		});
		multipleData = accountData;
	}
	
	//429
	
	$(document).ready(function() {		
		//fetch("http://localhost:1001/getAllUsers", {
			fetch("https://103.120.178.180:8443/DigiplanAPI/getAllUsers", {
			  method: "GET",
			  headers: {
			    "accept": "*/*"
			  },
			}).then(response => {
			    if (!response.ok) {
			      throw new Error("Network response was not ok");
			    }
			    return response.json();
			  }).then(data => {
				  for (let i = 0; i < data.results.length; i++) {
					  $("#MyCaseusernames").append('<option value=' + data.results[i].username + '>' + data.results[i].firstname+" "+data.results[i].lastname + '</option>');
			         }
			  }).catch(error => {
			    console.error("There was a problem with the fetch operation:", error);
			  });
	
		  });
	
	
	</script>
	
	
	
<!-- modal for update aligner  -->

<!-- END MODAL -->



</body>

</html>