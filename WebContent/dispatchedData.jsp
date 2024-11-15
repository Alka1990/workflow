<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.vo.DispatchedScan"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>


<%
Connection connection12 = LoginDAO.getConnectionDetails();
PreparedStatement stmt12 = connection12.prepareStatement("select * from dispatched_scan");
ResultSet rs12 = stmt12.executeQuery();
List<DispatchedScan> dispatchData = new ArrayList<>();
while (rs12.next()) {
	DispatchedScan dispatchedScan = new DispatchedScan();
	dispatchedScan.setCase_id(rs12.getString("case_id"));
	dispatchedScan.setPatient_name(rs12.getString("patient_name"));
	dispatchedScan.setDoctor_name(rs12.getString("doctor_name"));
	dispatchedScan.setDispatched_id(rs12.getInt("dispatched_id"));
	dispatchedScan.setNo_of_aligners(rs12.getString("no_of_aligners"));
	dispatchedScan.setUpperAlignerFrom(rs12.getString("upper_aligner_from"));
	dispatchedScan.setUpperAlignerTo(rs12.getString("upper_aligner_to"));
	dispatchedScan.setUpperAtt(rs12.getString("upper_att"));
	dispatchedScan.setLowerAlignerFrom(rs12.getString("lower_aligner_from"));
	dispatchedScan.setLowerAlignerTo(rs12.getString("lower_aligner_to"));
	dispatchedScan.setLowerAtt(rs12.getString("lower_att"));
	dispatchedScan.setDispatch_no(rs12.getString("dispatch_no"));
	dispatchedScan.setTracking_id(rs12.getString("tracking_id"));
	dispatchedScan.setDate(rs12.getString("date"));
  /*   Date currentDate = new Date();
	dispatchedScan.setDate(currentDate.toString()); */
	dispatchData.add(dispatchedScan);
}
rs12.close();
stmt12.close();
connection12.close();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dispatched Data</title>
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<style>
.table>thead tr th {
	background-color: #3A98B9;
	color: white;
	line-height: 2;
}

.alert-msg {
	color: red;
	display: none;
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

tbody tr.even:hover, tbody tr.odd:hover {
	background-color: #EAECEE;
}

.asterisk {
	color: red;
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
						<div class="panel panel-primary">
							<div class="panel-heading">
								<strong>Edit Tracking Id</strong>
							</div>

							<div class="row"
								style="margin-bottom: 20px; width: 98%; margin-left: 1%; margin-top: 30px;">
								<div class="table-responsive">
									<table id="dtBasicExample"
										class="table table-striped table-bordered table-sm dataTable w-auto"
										role="grid" aria-describedby="dtBasicExample_info"
										style="width: 100%;">
										<thead>
											<tr>
												<th></th>
												<th>Case Id</th>
												<th>Patient Name</th>
												<th>Doctor Name</th>
												<th>No of Aligners</th>
												<th>Upper Aligner From</th>
												<th>Upper Aligner To</th>
												<th>Upper Att</th>
												<th>Lower Aligner From</th>
												<th>Lower Aligner To</th>
												<th>Lower Att</th>
												<th>Dispatch Number</th>
												<th>Tracking Id</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (DispatchedScan item : dispatchData) {
												String caseid = "";
												String patientName = "";
												String doctorName = "";
												String noOfAligners = "";
												String upperAlignerFrom = "";
												String upperAlignerTo = "";
												String upperAtt = "";
												String lowerAlignerFrom = "";
												String lowerAlignerTo = "";
												String lowerAtt = "";
												String dispatchedNo = "";
												String trackingId = "";
												String date = "";

												if (item.getCase_id() != null)
													caseid = item.getCase_id();
												if (item.getPatient_name() != null)
													patientName = item.getPatient_name();
												if (item.getDoctor_name() != null)
													doctorName = item.getDoctor_name();
												if (item.getNo_of_aligners() != null)
													noOfAligners = item.getNo_of_aligners();
												if (item.getUpperAlignerFrom() != null)
													upperAlignerFrom = item.getUpperAlignerFrom();
												if (item.getUpperAlignerTo() != null)
													upperAlignerTo = item.getUpperAlignerTo();
												if (item.getUpperAtt() != null)
													upperAtt = item.getUpperAtt();
												if (item.getLowerAlignerFrom() != null)
													upperAlignerFrom = item.getLowerAlignerFrom();
												if (item.getLowerAlignerFrom() != null)
													lowerAlignerTo = item.getLowerAlignerFrom();
												if (item.getLowerAtt() != null)
													lowerAtt = item.getLowerAtt();
												if (item.getDispatch_no() != null)
													dispatchedNo = item.getDispatch_no();
												if (item.getTracking_id() != null)
													trackingId = item.getTracking_id();
												if (item.getDate() != null )
													date = item.getDate();
											%>
											<tr>
												<td><a type="button" href="" class='text-primary'
													style="text-decoration: none;"
													onClick='singleCaseModal(<%=item.getDispatched_id()%>,"<%=caseid%>","<%=patientName%>","<%=doctorName%>","<%=trackingId%>")'
													data-toggle='modal' data-target='#modal1'>Update</a></td>
												<td><%=caseid%></td>
												<td><%=patientName%></td>
												<td><%=doctorName%></td>
												<td><%=noOfAligners%></td>
												<td><%=upperAlignerFrom%></td>
												<td><%=upperAlignerTo%></td>
												<td><%=upperAtt%></td>
												<td><%=lowerAlignerFrom%></td>
												<td><%=lowerAlignerTo%></td>
												<td><%=lowerAtt%></td>
												<td><%=dispatchedNo%></td>
												<td><%=trackingId%></td>
												<td style="white-space: nowrap;"><%=date%></td>
											</tr>
											<%
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

	<div class="modal" id="modal1" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Update Tracking
						Id</h4>
					<span id="senddata1"></span>
				</div>
				<div class="modal-body">
					<form id="checkedfrmdata">

						<div class="row paymentContainer">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Case
										Id:</label> <input type="text" readonly class="form-control"
										id="case_id">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Patient
										Name:</label> <input type="text" readonly class="form-control"
										name="myText" id="patient_name">
								</div>
							</div>
						</div>


						<div class="row paymentContainer">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Doctor
										Name:</label> <input type="text" readonly class="form-control"
										name="myText" id="doctor_name">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label for="recipient-name" class="control-label">Tracking
										Id:</label> <input type="text" readonly class="form-control"
										name="myText" id="tracking_id"> <input type="hidden"
										id="dispatch_id">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label"><span
								class="asterisk">*</span> New Tracking Id:</label> <input type="text"
								required class="form-control" name=newTrackingId
								id="newTrackingId"> <span class="alert-msg" id="err_msg">This
								Field is Required*</span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modal_close2">Close</button>
					<button type="button" class="btn marked"
						onclick="updateTrackingId()">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>

	<script>
		$(document).ready(function() {
			$("table").DataTable();
		});
		
		function singleCaseModal(dispatched_id, caseId, patientName, doctorName, trackingId) {

			$("#dispatch_id").val(dispatched_id);
			$("#case_id").val(caseId);
			$("#patient_name").val(patientName);
			$("#doctor_name").val(doctorName);
			$("#tracking_id").val(trackingId);
			    	
		}
		
		function updateTrackingId(){
			let newTrackingId = $("#newTrackingId").val();
			let dispatchedId = $("#dispatch_id").val();
			let state = false;	
			if (newTrackingId==="") {
				$("#err_msg").show();
				state=false;
			} else {
				$("#err_msg").hide();
				state=true;
			}
			
			if(state){
 		      
				$.ajax({
					url:"UpdateTrackingId",
					type:"POST",
					data : {
						newTrackingId : newTrackingId,
						dispatchedId : dispatchedId,
						},
					success:function(data){
						if(data.trim()=="success"){
							alert("Tracking id updated successfully");
							location.reload();
						}
					},
					error:function(data){
						console.log(data)
					}
				});
			}			
		}
	</script>

</body>
</html>