<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isThreadSafe="false" errorPage="Error.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.util.*"%>
<%@page import="java.math.*"%>
<%@page import="java.text.*"%>
<%@page import="com.vo.SearchVO"%>

<%
String crmName = (String) session.getAttribute("crm_Name");
List<SearchVO> searchResult = (List) session.getAttribute("searchResult");
String searchCaseId = (String) session.getAttribute("searchCaseId");
String searchDoctorName = (String) session.getAttribute("searchDoctorName");
String searchtreating_dr_email = (String) session.getAttribute("searchtreating_dr_email");
String searchPatientName = (String) session.getAttribute("searchPatientName");
String searchpatient_email = (String) session.getAttribute("searchpatient_email");
String searchStartDate = (String) session.getAttribute("searchStartDate");
String searchEndDate = (String) session.getAttribute("searchEndDate");
String searchDays = (String) session.getAttribute("searchDays");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CRM: <%=crmName%> Cases</title>

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

<link rel="stylesheet" href="${pageContext.request.contextPath}/JavaScript/StyleSheet/tether.min.css">
	
<script type="text/javascript"	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	


<style>
table.dataTable thead .sorting:after, table.dataTable thead .sorting:before,
	table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_asc:before,
	table.dataTable thead .sorting_asc_disabled:after, table.dataTable thead .sorting_asc_disabled:before,
	table.dataTable thead .sorting_desc:after, table.dataTable thead .sorting_desc:before,
	table.dataTable thead .sorting_desc_disabled:after, table.dataTable thead .sorting_desc_disabled:before
	{
	bottom: .5em;
}

table_wrapper{
    display: block;
    overflow-x: auto;
    white-space: nowrap;
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
			<div class="right_col" role="main">
				<div class="container" style="padding-top: 20px;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<strong>CRM <%=crmName %> Cases</strong>
						</div>
						<div class="row">
							<div class="col-lg-12" style="margin-top: 20px;">

								<form id="advancedSearch">
									<div class="col-lg-2 col-md-2 col-sm-2">
										<input type="text" class="form-control"
											placeholder="Case Id " name="caseid" id="caseid"
											<%if (searchCaseId != null) {%> value=<%=searchCaseId%> <%}%>>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2">
										<input type="text" class="form-control"
											placeholder="Patient Name" name="patientname"
											<%if (searchPatientName != null) {%>
											value=<%=searchPatientName%> <%}%> id="patientname">
									</div>
										<div class="col-lg-2 col-md-2 col-sm-2">
										<input type="text" class="form-control"
											placeholder="Patient Email" name="patient_email"
											<%if (searchpatient_email != null) {%>
											value=<%=searchpatient_email%> <%}%> id="patient_email">
									</div>
									
									<div class="col-lg-2 col-md-2 col-sm-2">
										<input type="text" class="form-control"
											placeholder="Doctor Name" name="doctorname"
											<%if (searchDoctorName != null) {%>
											value=<%=searchDoctorName%> <%}%> id="doctorname">
									</div>
								
								<div class="col-lg-2 col-md-2 col-sm-2">
										<input type="text" class="form-control"
											placeholder="Doctor Email" name="treating_dr_email"
											<%if (searchtreating_dr_email != null) {%>
											value=<%=searchtreating_dr_email%> <%}%> id="treating_dr_email">
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2">
										<button type="submit" class="btn btn-warning btn-block" style="margin-top: 0px;">
											Search</button>
									</div>
								</form>
							</div>
						</div>
						<div class="row">
							<h5 class="text-center text-danger" id="message1"
								style="display: none;">Please fill at least 1 of these
								fields</h5>
						</div>
						<hr>
						<div class="row">
							<div class="col-lg-12">
								<form id="moderateSearch">
									
									<div class="col-lg-5 col-md-5 col-sm-5">
										<div class="input-group">
											<input type="text" class="form-control"
												<%if (searchStartDate != null) {%>
												value=<%=searchStartDate%> <%}%>
												style="background-color: white" placeholder="From"
												name="startdate" id="startdate"> <span
												class="input-group-addon" id="sizing-addon2"><i
												class="glyphicon glyphicon-calendar"></i></span>
										</div>
									</div>
									<div class="col-lg-5 col-md-5 col-sm-5">
										<div class="input-group">
											<input type="text" class="form-control"
												<%if (searchEndDate != null) {%> value=<%=searchEndDate%>
												<%}%> style="background-color: white" placeholder="TO"
												name="enddate" id="enddate"> <span
												class="input-group-addon" id="sizing-addon2"><i
												class="glyphicon glyphicon-calendar"></i></span>
										</div>
									</div>
									<div class="col-lg-2 col-md-2 col-sm-2">
										<button type="submit" class="btn btn-warning btn-block"  style="margin-top: 0px;">Search
											By Date</button>
									</div>
								</form>
							</div>
						</div>
						<div class="row">
							<h5 class="text-center text-danger" id="message2"
								style="display: none;">Both fields are required</h5>
						</div>
						<hr>
						<div class="row" style="margin-bottom: 20px; width: 98%; margin-left: 1%;">
							<div class="col-lg-12">
							<div class="table_wrapper ">
									<table id="dtBasicExample"
									class="table table-striped table-bordered table-sm dataTable w-auto"
									role="grid" aria-describedby="dtBasicExample_info"
									style="width: 100%;">
									<thead >
										<tr>
											<th class="sorting sorting_asc">Case Id</th>
											<th>Patient Name</th>
											<th>Patient Email</th>
											<th>Doctor Name</th>
											<th>Doctor Email</th>
											<th title="Starter Kit Phone Number">Phone</th>											
											<th>CRM Name</th>
											<th>Clinic Name</th>
										</tr>
									</thead>
									<tbody>
										<%
										if (searchResult != null) {
											for (SearchVO searchvo : searchResult) {
												
												String searchPatient_Name=searchvo.getPatient_Name();
												String searchDoctor_Name=searchvo.getDoctor_Name();
												String searchPhone=searchvo.getPhone();
												String searchpatientemail = searchvo.getPatient_email();
												String searchtreating_dremail =searchvo.getTreating_dr_email();
							
	
												String searchCrm_name=searchvo.getCrm_name();
												String searchClinic_Name=searchvo.getClinic_Name();
												
												if(searchPatient_Name==null){
													searchPatient_Name="";
												}else{
													searchPatient_Name=searchvo.getPatient_Name();
												}
												if(searchDoctor_Name==null){
													searchDoctor_Name="";
												}else{
													searchDoctor_Name=searchvo.getDoctor_Name();
												}
												if(searchPhone==null){
													searchPhone="";
												}else{
													searchPhone=searchvo.getPhone();
												}
												
												if(searchCrm_name==null){
													searchCrm_name="";
												}else{
													searchCrm_name=searchvo.getCrm_name();
												}
												if(searchClinic_Name==null){
													searchClinic_Name="";
												}else{
													searchClinic_Name=searchvo.getClinic_Name();
												}
												
												
												if(searchpatientemail==null){
													searchpatientemail="";
												}else{
													searchpatientemail = searchvo.getPatient_email();
												}
												if(searchtreating_dremail==null){
													searchtreating_dremail="";
												}else{
													searchtreating_dremail =searchvo.getTreating_dr_email();
												}
														
										%>
										<tr>
											<td><a
												href="Approval?caseId=<%=searchvo.getCase_Id()%>&logusername=<%=request.getAttribute("username")%>&NxtStage=<%=searchvo.getBatch_stage()%>&SearchStage=Y"><%=searchvo.getCase_Id()%></a></td>
											<td><%=searchPatient_Name%></td>
											<td><%=searchpatientemail%></td>
											<td><%=searchDoctor_Name%></td>
											<td><%=searchtreating_dremail%></td>
											<td><%=searchPhone%> </td>
											<td><%=searchCrm_name%></td>
											<td><%=searchClinic_Name%></td>
										</tr>
										<%
										}
										} else {
										Connection connection = LoginDAO.getConnectionDetails();
										PreparedStatement stmt = connection.prepareStatement("select * from cc_crm  where crm_name='"+session.getAttribute("crm_Name")+"' order by CREATED_DATE desc limit 10");
										ResultSet rst = stmt.executeQuery();
										while (rst.next()) {
											String dbPatient_Name=rst.getString("Patient_Name");
											String dbDoctor_Name=rst.getString("Doctor_Name");
											String dbPhone=rst.getString("Phone");
											String dbCrm_name=rst.getString("Crm_name");
											String dbClinic_Name= rst.getString("Clinic_Name");
											String dbtreating_dr_email = rst.getString("treating_dr_email");
											String dbpatient_email = rst.getString("patient_email");
											
											if(dbPhone==null){
												dbPhone="";
											}else{
												dbPhone=rst.getString("Phone");											}
											
										
											///////
											if(dbPatient_Name==null){
												dbPatient_Name="";
											}else{
												dbPatient_Name=rst.getString("Patient_Name");
											}
											if(dbDoctor_Name==null){
												dbDoctor_Name="";
											}
											else{
												dbDoctor_Name=rst.getString("Doctor_Name");;
											}
										
											if(dbCrm_name==null){
												dbCrm_name="";
											}else{
												dbCrm_name=rst.getString("Crm_name");
											}
											if(dbClinic_Name==null){
												dbClinic_Name="";
											}else{
												dbClinic_Name= rst.getString("Clinic_Name");
											}
											
											if(dbtreating_dr_email==null){
												dbtreating_dr_email="";
											}else{
												 dbtreating_dr_email = rst.getString("treating_dr_email");
											}
											if(dbpatient_email==null){
												dbpatient_email="";
											}else{
												dbpatient_email = rst.getString("patient_email");
											}
										%>
										<tr>
											<td><a href="Approval?caseId=<%=rst.getString("Case_Id")%>&logusername=<%=request.getAttribute("username")%>&NxtStage=<%=rst.getString("Case_Id")%>&SearchStage=Y"><%=rst.getString("Case_Id")%></a></td>
											<td><%=dbPatient_Name%></td>
											<td><%=dbpatient_email%></td>
											<td><%=dbDoctor_Name%></td>
											<td><%=dbtreating_dr_email%></td>
											<td><%=dbPhone%></td>
											<td><%=dbCrm_name%></td>
											<td><%=dbClinic_Name%></td>
										</tr>
										<%
										}
										connection.close();
										}
										%>
									</tbody>
								</table>
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
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

		<script
		src="${pageContext.request.contextPath}/JavaScript/javascript/tether.min.js"></script>

	<script>
		$(document).ready(function() {
	<%session.removeAttribute("searchResult");%>
		
	<%session.removeAttribute("searchStartDate");%>
		
	<%session.removeAttribute("searchEndDate");%>
		
	<%session.removeAttribute("searchCaseId");%>
		
	<%session.removeAttribute("searchPatientName");%>
		
	<%session.removeAttribute("searchDoctorName");%>
	
	<%session.removeAttribute("searchpatient_email");%>
	
	<%session.removeAttribute("searchtreating_dr_email");%>
		
	<%session.removeAttribute("searchDays");%>
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

	<script>
		$(document)
				.ready(
						function() {
							$("#dtBasicExample_filter").addClass(
									"dataTables_length");
							$("#dtBasicExample_filter")
									.html(
											`<label>Show last <select name='dtBasicExample_length' aria-controls='dtBasicExample' onchange="simpleSearch(this)"><option value='0' id='zero'>select days</option><option value='30' id='thirty'>30</option><option value='90' id='ninety'>90</option></select> days entries</label>`);
							if (
	<%=searchDays%>
		== "30") {
								$("#thirty").prop("selected", "selected");
							} else if (
	<%=searchDays%>
		== "90") {
								$("#ninety").prop("selected", "selected");
							} else {
								$("#zero").prop("selected", "selected");
							}
						});
	</script>

	<script>
		$(document).ready(function() {
			$("#advancedSearch").on('submit', function(event) {
				console.log("1")
				event.preventDefault();
				let caseid = $("#advancedSearch #caseid").val();
				let doctorname = $("#advancedSearch #doctorname").val();
				let patientname = $("#advancedSearch #patientname").val();
				let patient_email = $("#advancedSearch #patient_email").val();
				let treating_dr_email = $("#advancedSearch #treating_dr_email").val();

				if (caseid == "" && doctorname == "" && patientname == "" && treating_dr_email=="" && patient_email=="") {
					$("#message1").show();
				} else {
					$("#message1").hide();
					$.ajax({
						url : "SearchCRMCases",
						type : "POST",
						data : {
							caseId : caseid,
							doctorName : doctorname,
							patientName : patientname,
							patient_email : patient_email,
							treating_dr_email : treating_dr_email,
							searchType : "Advanced"
						},
						success : function(data) {
							console.log("data ",data)
							if (data.trim() == "success") {
								location.reload();
							} else {
								console.log("Something went wrong!");
							}
						}
					});
				}
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$("#moderateSearch").on('submit', function(event) {
				console.log("2")
				event.preventDefault();
				let startdate = $("#startdate").val();
				let enddate = $("#enddate").val();
				if (startdate == "" || enddate == "") {
					$("#message2").show();
				} else {
					$("#message2").hide();
					$.ajax({
						url : "SearchCRMCases",
						type : "POST",
						data : {
							startDate : startdate,
							endDate : enddate,
							searchType : "Moderate"
						},
						success : function(data) {
							if (data.trim() == "success") {
								location.reload();
							} else {
								console.log("Something went wrong!");
							}
						}
					});
				}
			});
		});
	</script>

	<script>
		function simpleSearch(day) {
			console.log("3")
			$.ajax({
				url : "SearchCRMCases",
				type : "POST",
				data : {
					days : $(day).val(),
					searchType : "Simple"
				},
				success : function(data) {
					if (data.trim() == "success") {
						location.reload();
					} else {
						console.log("Something went wrong!");
						console.log("Response from server : " + data);
					}
				}
			});
		}
	</script>

</body>
</html>