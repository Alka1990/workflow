
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
<%@page import="com.vo.Newcase"%>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/favicon.ico">

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1"> -->
<title>:: WF Add Case Details ::</title>
<!-- Bootstrap core CSS -->
<link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
<link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">
<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<!-- To take font-awesome social media icons. -->
<link rel="stylesheet" href="CSS1/all.css">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
<script src="JavaScript/bootstrap.js"></script>
<script src="JavaScript/custom.js"></script>
<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>
<script src="JavaScript/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/b58dabb0d1.js"
	crossorigin="anonymous"></script>
<style>
/*   	i have added inline css so that same class property may not affect the others pages as lots 
         of tables and divs are taken with same class name but have different functionality */
.left_col {
	width: 100%;
}

label {
	margin: 0px;
}

.form-check {
	white-space: nowrap;
}

.panel-body {
	padding: 0px;
	overflow: scroll;
}

.table-bordered>tbody>tr>td {
	vertical-align: middle;
}

.bg-success {
	white-space: nowrap;
}

.form-control {
	font-size: 1.2rem;
	display: inline-block;
	max-width: 100%;
	font-weight: bold;
}

.form-group {
	margin-bottom: 0px;
}

.table-bordered>thead>tr>th {
	text-align: center;
}

.form-label {
	font-size: 1.2rem;
}

@media ( min-width :768px) {
	.form-control {
		font-size: 1.4rem;
		width: 214px;
	}
	.form-group-block {
		align-items: center;
	}
	.form-label {
		width: 160px;
		font-size: 1.4rem;
	}
}

@media ( min-width : 992px) {
	.form-label {
		font-size: 1.4rem;
	}
}
</style>

</head>

<body class="nav-md">
	<div class="container body">
	
	
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
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
				<div class="container">
				
					<div class="panel panel-primary">
						<div class="panel-heading">
							<strong>Add Case Details</strong>
						</div>
						<div class="table-responsive">
							<div style="display: none;">
								<input type="text" id="LinkType" name="LinkType" /> <input
									type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo" /> <input
									type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo" />
								<input type="text" id="hiddenInvId" name="hiddenInvId" />
							</div>


							<div class="col-xs-12" style="padding: 5px;">
								<div class="table-responsive"
									style="overflow: hidden; border: none;">


									<form action="AddCaseDetails" method="post"
										onsubmit="return validate_form();">
										<div class="container">
											<div class="row">

												<div class="col-lg-12 header-styles"
													style="Background-color: #f58220; text-align: center; width: 100%;">
													<h3 style="font-size: 2rem;">CC Details</h3>
												</div>

											</div>
											<div class="row"
												style="margin-top: 20px; display: flex; align-items: center;">
												<div class="col-lg-2">
													<label for="Case ID" class="form-label">Case ID</label>
												</div>
												<div class="col-lg-6" style="padding: 0 10px;">
													<input type="text" name="case_id" id="incase"
														minlength="10" maxlength="10" placeholder="Case ID"
														class="form-control" autofocus
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
												</div>
											</div>

											<div class="row"
												style="margin-top: 20px; display: flex; align-items: center;">

												<div class="col-lg-2">
													<label for="Existing/New" class="form-label">Existing/New</label>
												</div>
												<div class="col-lg-2">
													&nbsp;&nbsp;&nbsp;<input type="radio"
														class="form-check-input" name="Existing"
														onClick="iscaseidExist()" id="Existing" value="Existing">
													Existing &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
														class="form-check-input" name="Existing" checked="checked"
														id="New" value="New"> New
												</div>
												<div class="col-lg-2"
													style="padding-left: 10px; padding-right: 10px;"></div>




											</div>


											<div class="row"
												style="margin-top: 20px; display: flex; align-items: center;">

												<div class="col-lg-2">

													<label for="Scan/Impression" class="form-label">Scan/Impression
													</label>

												</div>
												<div class="col-lg-3">
													<div class="form-check">
														&nbsp;&nbsp; <input type="radio" class="form-check-input"
															name="Impression" id="Scan" checked="checked"
															value="Scan"> Scan &nbsp;&nbsp; <input
															type="radio" class="form-check-input" name="Impression"
															id="Impression" value="Impression"> Impression
														&nbsp;&nbsp;&nbsp;&nbsp;
													</div>
												</div>

											</div>

											<div class="row"
												style="margin-top: 20px; display: flex; align-items: center;">

												<div class="col-lg-2">
													<label for=" Clinic" class="form-label"> Clinic
														Name</label>
												</div>
												<div class="">
													<button type="button" id="AddNew3"
														style="outline: none; border: none; background: none;">
														<i class="fas fa-plus"></i>
													</button>
												</div>
												<div class="col-lg-6" id="ClinicNameDiv"
													style="padding-left: 10px; padding-right: 10px;">
													<input type="text" name="cni1" id="cni1"
														placeholder="Enter Clinic Name" class="form-control">
												</div>

											</div>

<div class="row" style="margin-top: 20px; display: flex; align-items: center;">
    <div class="col-lg-2">
        <label for="SpecialRemarks" class="form-label">Special Remarks</label>
    </div>
    <div class="col-lg-6" style="padding-left: 10px; padding-right: 10px;">
        <input type="text" name="special_remarks" id="special_remarks" placeholder="Enter Special Remarks" class="form-control" maxlength="250">
    </div>
</div>

											<div class="container">
												<h2></h2>
												<div class="panel panel-default">
													<div class="panel-heading">
														<i class="fa fa-address-card-o" style="font-size: 20px;"></i>
														Address Details
													</div>
													<div class="panel-body">
														<div class="table-responsive-lg">
															<table class="table table-bordered">
																<thead>
																	<tr class="bg-success">
																		<th scope="col"></th>
																		<th scope="col">Address</th>
																		<th scope="col">Pin Code</th>
																		<th scope="col">Phone</th>
																		<th scope="col">City</th>
																		<th scope="col">Location</th>
																		<th scope="col">Starter kit Address</th>
																		<th scope="col">Batch Address</th>
																	</tr>
																</thead>
																<tbody>
																	<tr>
																		<td valign="middle">
																			<div class="form-check">
																				<!-- 										<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
 -->
																				<label class="form-check-label"
																					for="flexCheckDefault"> Home </label>
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<textarea class="form-control" name="address1"
																					id="address1" rows="1" placeholder="Enter Address"></textarea>
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="pincode1" id="pincode1"
																					aria-describedby="pincode1" minlength="6"
																					maxlength="8"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Pincode">
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="phone1" id="phone1" aria-describedby="phone1"
																					minlength="10" maxlength="10"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Phone">
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<!-- 										<input type="text" class="form-control"  name="city1" id="city1" aria-describedby="city1" placeholder="Enter City"> 
 -->
																				<select class="form-control"
																					aria-label="Default select example" name="city1"
																					id="city1">

																					<%
																					List<String> CityList1 = (ArrayList<String>) session.getAttribute("citylist");
																					%>
																					<option value="">Select City</option>
																					<%
																					for (String corpAcnt : CityList1) {
																					%>
																					<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																					<%
																					}
																					%>
																				</select>
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control "
																					name="location1" id="location1"
																					aria-describedby="location1" maxlength="100"
																					placeholder="Enter Location">
																			</div>
																		</td>


																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="starterkit1" name="starterkit1"
																					value="1" style="width: 28px; height: 28px;">


																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-check text-center">
																				<!-- 										<button type="button" class="btn btn-success" id="starterkit1" name="starterkit1" value="1">Batch</button>
 -->
																				<input class="form-check-input strb_default "
																					type="checkbox" id="batch1" name="batch1" value="1"
																					style="width: 28px; height: 28px;">

																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-check">
																				<label class="form-check-label"
																					for="flexCheckDefault"> Clinic </label>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<textarea class="form-control" name="address2"
																					id="address2" rows="1" placeholder="Enter Address"></textarea>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="pincode2" id="pincode2"
																					aria-describedby="pincode2" minlength="6"
																					maxlength="8"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Pincode">
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="phone2" id="phone2" aria-describedby="phone2"
																					minlength="10" maxlength="10"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Phone">
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<!-- <input type="text" class="form-control"  name="city2" id="city2" aria-describedby="city2" placeholder="Enter City">
										 -->
																				<select class="form-control"
																					form-control="Default select example" name="city2"
																					id="city2">

																					<%
																					List<String> CityList2 = (ArrayList<String>) session.getAttribute("citylist");
																					%>
																					<option value="">Select City</option>
																					<%
																					for (String corpAcnt : CityList2) {
																						if (corpAcnt.equals("5")) {
																					%>
																					<option selected value="<%=corpAcnt%>"><%=corpAcnt%></option>
																					<%
																					} else {
																					%>
																					<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																					<%
																					}
																					}
																					%>
																				</select>
																			</div>

																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="location2" id="location2"
																					aria-describedby="location2" maxlength="100"
																					placeholder="Enter Location">
																			</div>
																		</td>

																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="starterkit2" name="starterkit2"
																					value="2" style="width: 28px; height: 28px;">


																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="batch2" name="batch2" value="2"
																					style="width: 28px; height: 28px;">

																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-check">

																				<label class="form-check-label"
																					for="flexCheckDefault"> Other1 </label>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<textarea class="form-control" name="address3"
																					id="address3" rows="1" placeholder="Enter Address"></textarea>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="pincode3" id="pincode3"
																					aria-describedby="pincode3" minlength="6"
																					maxlength="8"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Pincode">
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="phone3" id="phone3" aria-describedby="phone3"
																					minlength="10" maxlength="10"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Phone">
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<!-- <input type="text" class="form-control"  name="city3" id="city3" aria-describedby="city3" placeholder="Enter City"> -->
																				<select class="form-control"
																					aria-label="Default select example" name="city3"
																					id="city3">

																					<%
																					List<String> CityList3 = (ArrayList<String>) session.getAttribute("citylist");
																					%>
																					<option value="">Select City</option>
																					<%
																					for (String corpAcnt : CityList3) {
																					%>
																					<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																					<%
																					}
																					%>
																				</select>
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="location3" id="location3"
																					aria-describedby="location3" maxlength="100"
																					placeholder="Enter Location">
																			</div>
																		</td>

																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="starterkit3" name="starterkit3"
																					value="3" style="width: 28px; height: 28px;">


																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="batch3" name="batch3" value="3"
																					style="width: 28px; height: 28px;">

																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-check">
																				<label class="form-check-label"
																					for="flexCheckDefault"> Other2 </label>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<textarea class="form-control" name="address4"
																					id="address4" rows="1" placeholder="Enter Address"></textarea>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="pincode4" id="pincode4"
																					aria-describedby="pincode4" minlength="6"
																					maxlength="8"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Pincode">
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="phone4" id="phone4" aria-describedby="phone4"
																					minlength="10" maxlength="10"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Phone">
																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<!-- <input type="text" class="form-control"  name="city4" id="city4" aria-describedby="city4" placeholder="Enter City"> -->
																				<select class="form-control"
																					aria-label="Default select example" name="city4"
																					id="city4">

																					<%
																					List<String> CityList4 = (ArrayList<String>) session.getAttribute("citylist");
																					%>
																					<option value="">Select City</option>
																					<%
																					for (String corpAcnt : CityList4) {
																					%>
																					<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																					<%
																					}
																					%>
																				</select>
																			</div>

																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="location4" id="location4"
																					aria-describedby="location4" maxlength="100"
																					placeholder="Enter Location">
																			</div>
																		</td>

																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="starterkit4" name="starterkit4"
																					value="4" style="width: 28px; height: 28px;">


																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="batch4" name="batch4" value="4"
																					style="width: 28px; height: 28px;">

																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-check">

																				<label class="form-check-label"
																					for="flexCheckDefault"> Other3 </label>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<textarea class="form-control" name="address5"
																					id="address5" rows="1" placeholder="Enter Address"></textarea>
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="pincode5" id="pincode5"
																					aria-describedby="pincode5" minlength="6"
																					maxlength="8"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Pincode">
																			</div>
																		</td>
																		<td>
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="phone5" id="phone5" aria-describedby="phone5"
																					minlength="10" maxlength="10"
																					oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"
																					placeholder="Enter Phone">
																			</div>
																		</td>
																		<td valign="middle">
																			<!-- <input type="text" class="form-control"  name="city5" id="city5" aria-describedby="city5" placeholder="Enter City">  -->
																			<select class="form-control"
																			aria-label="Default select example" name="city5"
																			id="city5">

																				<%
																				List<String> CityList = (ArrayList<String>) session.getAttribute("citylist");
																				%>
																				<option value="">Select City</option>
																				<%
																				for (String corpAcnt : CityList) {
																				%>

																				<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																				<%
																				}
																				%>
																		</select>

																		</td>
																		<td valign="middle">
																			<div class="form-group">
																				<input type="text" class="form-control"
																					name="location5" id="location5"
																					aria-describedby="location5" maxlength="100"
																					placeholder="Enter Location">
																			</div>
																		</td>

																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="starterkit5" name="starterkit5"
																					value="5" style="width: 28px; height: 28px;">


																			</div>
																		</td>
																		<td valign="middle">
																			<div class="form-check text-center">
																				<input class="form-check-input strb_default "
																					type="checkbox" id="batch5" name="batch5" value="5"
																					style="width: 28px; height: 28px;">

																			</div>
																		</td>

																	</tr>




																</tbody>
															</table>
															<center>
																<span id="spnError" class="error" style="display: none">
																	<div class="alert alert-danger"
																		style="width: 98%; margin-top: 15px;">
																		<div class="row"
																			style="margin-top: -10px; margin-bottom: -20px;">
																			<i class="fa fa-warning" style="font-size: 15px"></i>
																			<b> <blink>Please select at-least one
																					default address.</blink></b>
																			<button type="button" class="close"
																				data-dismiss="alert" aria-hidden="true">×</button>
																		</div>
																	</div>
																</span>
															</center>

														</div>
													</div>
												</div>
											</div>

											<!--  new format has been introduced for mobile view & all the backend code are copied and pasted from old format only : MANOJ_KR -->
											<!--  i have changed the format such a way that there is no need to do backend again -->

											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for=" Registered Doctor" class="form-label">Starter
														Doctor </label>
													<div id="RegisteredDoctor" class="">
														<input type="text" name="RDoctor" id="RDoctor"
															placeholder="Enter Starter Doctor" class="form-control">
													</div>
												</div>
												<div class="form-group-block col-md-6">
													<label for="Clinic Doctor " class="form-label">
														Doctor Name</label>
													<div class="">
														<input type="text" name="CDoctor" id="CDoctor"
															placeholder="Enter Doctor Name" class="form-control">
													</div>
												</div>
											</div>
											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for=" Registered Doctor" class="form-label">Treating Doctor Email </label>
													<div id="RegisteredDoctor" class="">
														<input type="email"  class="form-control" name="treating_dr_email" id="treating_dr_email" placeholder="Enter Treating Doctor Email"  class="form-control"  >
															
													</div>
												</div>
												<div class="form-group-block col-md-6">
													<label for="Clinic Doctor " class="form-label">
														Patient Email</label>
													<div class="">
														
																			<input type="email"  class="form-control" name="patient_email" id="patient_email" placeholder="Enter Patient Email"  class="form-control"  >
															
													</div>
												</div>
											</div>

											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for=" PATIENT NAME" class="form-label">PATIENT
														NAME</label>
													<div class="">
														<input type="text" required name="PATIENT" id="PATIENT"
															placeholder="Enter Patient Name" class="form-control">
													</div>
												</div>
												<div class="form-group-block col-md-6">
													<label for="CRM  " class="form-label">CRM </label>
													<div class="">
														<select class="form-control" name="crm" id="crm"
															class="form-control">

															<%
															List<String> Crmlist = (ArrayList<String>) session.getAttribute("CRMLlist");
															for (String corpAcnt : Crmlist) {
															%>
															<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
															<%
															}
															%>
														</select>
													</div>
												</div>
											</div>
											<%
											List<String> getRight = (ArrayList<String>) session.getAttribute("getRight");
											%>

											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for="Type of Request" class="form-label">Type
														of Request</label>
													<div class="">
														<!-- <input type="text" name="TRequest" id="TRequest" placeholder="Enter Type of Request"  class="form-control"  >
			 -->
														<select class="form-control" name="TRequest" id="TRequest"
															class="form-control">

															<%
															List<String> Crmlist1 = (ArrayList<String>) session.getAttribute("TRequestlist");
															for (String corpAcnt : Crmlist1) {
															%>
															<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
															<%
															}
															%>
														</select>

													</div>
												</div>
												<div class="form-group-block col-md-6">
													<label for="Photograph available " class="form-label">
														Photograph available</label>
													<div class="">
														<input type="radio" class="form-check-input"
															name="Photograph" checked="checked" id="Yes" value="Yes">
														YES &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
															class="form-check-input" name="Photograph" id="NO"
															value="No"> NO
													</div>
												</div>
											</div>

											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for="Starter Kit required" class="form-label">Starter
														Kit required </label>
													<div class="">
														<input type="radio" class="form-check-input" name="SKit" onclick="toggleCheckboxes();"
															checked="checked" id="kYes" value="Yes"> YES
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
															class="form-check-input" name="SKit" id="kNO" onclick="toggleCheckboxes();" value="No">
														NO
													</div>												
												</div>
												
											 <div>
												  <div style="display: inline-block; margin-left: 10px;" id="additionalOptions">
  <label for="Starter Kit required" class="form-label">Starter Kit</label>
            <input  type="checkbox" class="form-check-input cadbsFormCheck" name="additionalOption" id="upper" value="Upper"> Upper
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" class="form-check-input cadbsFormCheck" name="additionalOption" id="lower" value="Lower"> Lower
            &nbsp;&nbsp;&nbsp;&nbsp;
            <input type="checkbox" class="form-check-input cadbsFormCheck" name="additionalOption" id="both" value="Both"  onclick="checkAll(this);"> Both
        </div>
												</div>
												
												<div class="form-group-block col-md-6">
												
													<label for="Starter Kit required" class="form-label">Simulation
														Shown</label>
													<div class="">
														<input type="radio" class="form-check-input" name="Shown"
															checked="checked" id="Shown" value="Yes"> YES
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
															class="form-check-input" name="Shown" id="Shown"
															value="No"> NO
													</div>
												</div>
												
											</div>
            									

    
											<div class="row form-group-wrap">
												<div class="form-group-block col-md-6">
													<label for="Starter Kit required" class="form-label">PPF
														Filled</label>
													<div class="">
														<input type="radio" class="form-check-input" name="PPF"
															checked="checked" id="PPF" value="Yes"> YES
														&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
															class="form-check-input" name="PPF" id="PPF" value="No">
														NO
													</div>
												</div>
											</div>


											<div class="row" style="margin-top: 20px;">

												<div class="col-lg-2">

													<!-- <label for=" PPF Filled" class="form-label"> PPF Filled</label>
			
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="PPF" id="PPF"  placeholder="Enter PPF Filled"  class="form-control"  >
				</div> -->
													<%
													if (getRight.contains("PRE")) {
													%>

												</div>
												<!-- 	    <div class="row" style=" height:50px; margin-top:40px;">
			
				<div class="col-lg-8" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
				<h3>CRM</h3>
				</div>
			
			    </div> -->

												<div class="row" style="height: 40px; margin-top: 30px;">

													<div class="col-xs-12 header-styles"
														style="Background-color: #f58220; text-align: center; margin-bottom: 18px;">
														<h3 style="margin: 0; padding: 8px 0;">CRM</h3>
													</div>

												</div>


												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">
															Type of Account</label>
														<div class="">
															<select class="form-control" name="TAccount"
																id="TAccount" style="outline: none;">
																<%
																List<String> toplist = (ArrayList<String>) session.getAttribute("typeofaccountlist");
																for (String corpAcnt : toplist) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for=" Corporate Account" class="form-label">Corporate
															Account </label>
														<div class="" id="CorporateAccount">
															<select class="form-control" name="CAccount"
																id="CAccount" style="outline: none;">

																<%
																List<String> list = (ArrayList<String>) session.getAttribute("customerlist");
																for (String corpAcnt : list) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for=" KOL" class="form-label"> KOL</label>
														<div class="">
															<select class="form-control" name="KOL" id="KOL"
																style="outline: none;">
																<%
																List<String> kollist = (ArrayList<String>) session.getAttribute("kollist");
																for (String corpAcnt : kollist) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Case Package" class="form-label"> Case
															Category</label>
														<div class="">
															<select class="form-control" name="Cpkg" id="Cpkg"
																style="outline: none;">
																<%
																List<String> packagelist = (ArrayList<String>) session.getAttribute("packagelist");
																for (String corpAcnt : packagelist) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
												</div>


												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for=" Dispatch rules w.r.t. corporate"
															class="form-label"> Dispatch rules w.r.t.
															corporate</label>
														<div class="">
															<!-- 				<input type="text" name="Dispatchcr" id="Dispatchcr" placeholder="Enter Dispatch rules "  class="form-control"  >
 -->
															<select class="form-control" name="Dispatchcr"
																id="Dispatchcr" style="outline: none;">
																<%
																List<String> Dispatch_ruleslist = (ArrayList<String>) session.getAttribute("Dispatch_ruleslist");
																for (String corpAcnt : Dispatch_ruleslist) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for=" Dispatch Address" class="form-label">
															Dispatch Address</label>
														<div class="">
															<input type="text" name="DispatchAdr" id="DispatchAdr"
																placeholder="Enter Dispatch address"
																class="form-control">
														</div>
													</div>
												</div>


												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Bill To address" class="form-label">
															Bill To address</label>
														<div class="">
															<input type="text" name="BillAdr" id="BillAdr"
																placeholder="Enter Bill To address" class="form-control">
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">
															Priority</label>
														<div class="">
															<select class="form-control" name="Priority"
																id="Priority" style="outline: none;">

																<%
																List<String> pritoty = (ArrayList<String>) session.getAttribute("prioritylist");
																for (String corpAcnt : pritoty) {
																%>
																<option value="<%=corpAcnt%>"><%=corpAcnt%></option>
																<%
																}
																%>
															</select>
														</div>
													</div>
													<%
													}
													%>
													<%
													if (getRight.contains("WFC")) {
													%>
												</div>

												<!-- 	delivery section starts -->

												<div class="row" style="margin-top: 40px;">
													<div class="col-xs-12"
														style="Background-color: #f58220; text-align: center; margin-bottom: 18px;">
														<h3>Delivery Note Details:</h3>
													</div>
												</div>



												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Bill To address" class="form-label">DELIVERY
															NOTE NO</label>
														<div class="">
															<input type="text" class="form-control" name="dno"
																id="dno" placeholder="Enter Delivery note No."
																class="form-control">
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">BUYER'S
															CLINIC NAME:</label>
														<div class="">
															<button type="button" id="AddNew4"
																style="outline: none; border: none;">
																<i class="fas fa-plus" style="color: green"></i>
															</button>
														</div>
														<div id="buyerClinicNameDiv" class="">
															<input type="text" class="form-control" name="bcn1"
																id="bcn1" placeholder="Enter buyer's Clinic Name"
																style="outline: none; text-transform: uppercase;">
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Bill To address" class="form-label">BUYER'S
															ADDRESS:</label>
														<div class="">
															<button type="button" id="AddNew5"
																style="outline: none; border: none;">
																<i class="fas fa-plus" style="color: green"></i>
															</button>
														</div>
														<div id="buyerAddressDiv" class="">
															<input type="text" class="form-control" name="badd1"
																id="badd1" placeholder="Enter buyer's Address"
																style="outline: none; padding-left: 10px; text-transform: uppercase;">
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">BUYER
															GST NO:</label>
														<div class="">
															<input type="text" class="form-control" name="bgst_no"
																id="bgn" placeholder="Enter buyer GST No."
																class="form-control">
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Bill To address" class="form-label">CATEGORY:</label>
														<div class="">
															<input type="text" name="category" id="cat"
																placeholder="Enter Category" class="form-control">
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">UPPER
															ALIGNER:</label>
														<div class="">
															<input type="text" name="upper_aligner" id="ua"
																placeholder="Enter upper Aligner" class="form-control">
														</div>
													</div>
												</div>



												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label for="Bill To address" class="form-label">LOWER
															ALIGNER:</label>
														<div class="">
															<input type="text" name="lower_aligner" id="la"
																placeholder="Enter lower Aligner" class="form-control">
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label for="Type of Account " class="form-label">OTHERS:</label>
														<div class="">
															<input type="text" name="others" id="oth"
																placeholder="Enter others" class="form-control">
														</div>
													</div>
												</div>
												<%
												}
												%>
											</div>


											<div class="container">
												<div class="row">
													<div class="col-lg-12 text-center">
														<button type="submit" id="btnSubmit"
															class="btn btn-primary">Submit</button>

													</div>
												</div>
											</div>
									</form>
									<script src="script/5b8969f8ab.js"></script>
									<script src="script/script.js"></script>

									<input type="hidden" id="userid"
										value="<%=request.getSession().getAttribute("userid")%>" />

									<script>
										function iscaseidExist() {
											var n1 = document
													.getElementById("incase").value;
											var username = document
													.getElementById("userid").value;
											var result = "NewCasesshow1?caseId="
													+ n1;
											window.location.href = result;
										}

										$('#starterkit1')
												.on(
														'change',
														function() {
															$('#starterkit2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});

										$('#starterkit2')
												.on(
														'change',
														function() {
															$('#starterkit1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#starterkit3')
												.on(
														'change',
														function() {
															$('#starterkit1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#starterkit4')
												.on(
														'change',
														function() {
															$('#starterkit1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#starterkit5')
												.on(
														'change',
														function() {
															$('#starterkit1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#starterkit4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});

										$('#batch1')
												.on(
														'change',
														function() {
															$('#batch2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#batch2')
												.on(
														'change',
														function() {
															$('#batch1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#batch3')
												.on(
														'change',
														function() {
															$('#batch2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#batch4')
												.on(
														'change',
														function() {
															$('#batch2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch5')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});
										$('#batch5')
												.on(
														'change',
														function() {
															$('#batch2')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch3')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch4')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
															$('#batch1')
																	.prop(
																			'disabled',
																			$(
																					this)
																					.prop(
																							'checked'));
														});

										function validate_form() {
											valid = true;

											if ($('input[type=checkbox]:checked').length == 0) {
												alert("Please select at least one checkbox to make Address Default");
												valid = false;
											}

											return valid;
										}
									</script>
									
								<script>
								function toggleCheckboxes() {
							        var kYes = document.getElementById("kYes");
							        var additionalOptions = document.getElementById("additionalOptions");
							        if (kYes.checked) {
							            additionalOptions.style.display = "inline-block";
							        } else {
							            additionalOptions.style.display = "none";
							        }
							    }
								
								function checkAll(element) {
								    var upper = document.getElementById('upper');
								    var lower = document.getElementById('lower');
								    if (element.checked) {
								        upper.checked = true;
								        lower.checked = true;
								        Both.checked = true ;
								    } else {
								        upper.checked = false;
								        lower.checked = false;
								        both.checked = false ;
								    }
								}
    document.addEventListener("DOMContentLoaded", function() {
        toggleCheckboxes(); // To set the initial state based on the pre-checked radio button
    });
</script>
									
									<br>
									<br>

								</div>
							</div>
</body>

</html>
