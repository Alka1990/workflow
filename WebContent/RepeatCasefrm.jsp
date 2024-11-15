
<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="com.workflow.connection.LoginDAO"%>
<%@page import="com.vo.Newcase1"%>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="Images/logo.png">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WorkFlow</title>

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
<link href="${pageContext.request.contextPath}/StyleSheet/jquery-ui.css"
	rel="stylesheet">
<link rel="stylesheet" href="script/accordion.min.css">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery.smartWizard.js"></script>

<script type="text/javascript">
var contextPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
<style type="text/css">
.blink {
                animation: blinker 1.5s linear infinite;
                color: red;
                font-family: sans-serif;
            }

            @keyframes blinker {
                50% {
                    opacity: 0;
                }
            }
</style>
</head>

<body class="nav-md">
	<%
	HttpSession s = request.getSession();
	String caseId = request.getParameter("caseId");
	String crm = request.getParameter("crm_name");
	
	String patient_Name = request.getParameter("patient_Name");
	String cdoc = request.getParameter("cdoc");
	String currentStage = request.getParameter("stage");
	List<String> userRight = LoginDAO.getRight((String) session.getAttribute("userid"));
	String pre_ua_sheet = request.getParameter("preuasheet");
	String pre_u_thichness = request.getParameter("preut");
	String pre_la_sheet = request.getParameter("prelasheet");
	String pre_l_thichness = request.getParameter("prelt");
	String new_ua_sheet = request.getParameter("nowuasheet");
	String new_u_thichness = request.getParameter("nowut");
	String new_la_sheet = request.getParameter("nowlasheet");
	String new_l_thichness = request.getParameter("nowlt");
	String malocclusion = request.getParameter("mal");
	String wfcremrks = request.getParameter("wfcremrks");
	String plnremrks = request.getParameter("plnremrks");
	String upper_aligner = request.getParameter("upper_aligner");
	String lower_aligner = request.getParameter("lower_aligner");
	String issueName = request.getParameter("issueName");
	int no_of_rpt = 0;
	if(request.getParameter("no_of_rpt")!= null)
	no_of_rpt = Integer.parseInt(request.getParameter("no_of_rpt"));

	List<Newcase1> sheetvo = LoginDAO.getPLNSheet();

	String SheetId = null;
	String SheetName = null;

	if (patient_Name == null)
		patient_Name = "";

	if (cdoc == null)
		cdoc = "";

	if (crm == null)
		crm = "";

	if (malocclusion.equals("null") || malocclusion == null)
		malocclusion = "";

	if (pre_u_thichness.equals("null") || pre_u_thichness == null)
		pre_u_thichness = "";

	if (pre_l_thichness.equals("null") || pre_l_thichness == null)
		pre_l_thichness = "";

	if (new_u_thichness.equals("null") || new_u_thichness == null)
		new_u_thichness = "";

	if (new_l_thichness.equals("null") || new_l_thichness == null)
		new_l_thichness = "";

	if (plnremrks.equals("null") || plnremrks == null)
		plnremrks = "";

	if (wfcremrks.equals("null") || wfcremrks == null)
		wfcremrks = "";

	%>

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
			 <%
                         s = request.getSession();
                         caseId = request.getParameter("caseId");
                        if (caseId == null || caseId.trim().isEmpty()) {
                            caseId = (String) s.getAttribute("caseId");
                        }

                         con = null;
                        PreparedStatement pstmt = null;
                         rs = null;

                        String special_remark = "";
                        boolean isRemarkNull = true;

                        try {
                            if (caseId != null && !caseId.trim().isEmpty()) {
                                LoginDAO loginDAO = new LoginDAO();
                                con = LoginDAO.getConnectionDetails();
                                String query = "SELECT special_remarks FROM wisealign_workflow.cc_crm WHERE case_id = ?";
                                pstmt = con.prepareStatement(query);
                                pstmt.setString(1, caseId);
                                rs = pstmt.executeQuery();
                                
                                if (rs.next()) {
                                    special_remark = rs.getString("special_remarks");
                                    isRemarkNull = (special_remark == null || special_remark.trim().isEmpty());
                                }
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>

                   <%--  <% if (!isRemarkNull) { %>
                        <marquee class="blink">
                            <%= special_remark %>
                        </marquee>
                    <% } %>
 --%>
				<div class="container">					
					<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
											<label for="Case Id">Case Id</label>
													<input type="text" readonly class="form-control" value="<%=caseId%>">
											</div>
											
											<div class="col-lg-3 col-md-3 col-sm-3">
											<label for="Patient Name">Patient Name</label>
													<input type="text" readonly class="form-control" value="<%=patient_Name%>">
											</div>
											
											<div class="col-lg-3 col-md-3 col-sm-3">
											<label for="Doctor Name">Doctor Name</label>
												<input type="text" readonly class="form-control" value="<%=cdoc%>">	
											</div>
											
											<div class="col-lg-3 col-md-3 col-sm-3">
											<label for="CRM">CRM</label>
												<input type="text" readonly class="form-control" value="<%=crm%>">	
											</div>
											</div>
											</div>
										


					<style>
legend {
	background-color: #d9edf7;
	color: #fff;
	padding: 3px 6px;
	height: 35px;
}

.output {
	font: 1rem 'Fira Sans', sans-serif;
}

input {
	margin: .4rem;
}

.bg-warning {
	background-color: rgb(255, 193, 7) !important;
}

.bg-danger {
	background-color: rgb(220, 53, 69) !important;
}




/* .notification:hover {
  background: red;
} */

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 50%;
  background-color: #2ab31b;
  color: white;
}

.button {
  padding: 15px 25px;
  font-size: 24px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #04AA6D;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>




					<!--   <div class="panel panel-primary">
    <div class="panel-heading"><strong>Repeat Case</strong> </div> -->

					<br>
					<%
					if (userRight.contains("OTPLN") && currentStage.equals("OTPLN")) {
					%>

					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Planning Repeat Case details</div>

							<div class="panel-body">

								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<%
															if (no_of_rpt == 2) {
															%>
															<button class="ac-trigger bg-warning notification">More
																Details  
  																			<span class="badge"><%=no_of_rpt %></span></button>
															<%
															} else if (no_of_rpt >= 3) {
															%>
															<button class="ac-trigger bg-danger notification">More
																Details  
  																			<span class="badge"><%=no_of_rpt %></span></button>
															<%
															} else {
															%>
															<button class="ac-trigger bg-primary notification"  style="background-color: #2ab31b;">More Details
															<span class="badge"><%=no_of_rpt %></span>
															</button>
															<%
															}
															%>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">

																	<div class="card text-white bg-success mb-12">
																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label>
																							 <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">
																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>







																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase" method="post"  onsubmit="return plnvalidation()">
									<input type="hidden" class="form-control" name="caseId"
										id="caseId" value="<%=caseId%>"> <input type="hidden"
										class="form-control" name="userid" id="userid"
										value="<%=s.getAttribute("userid")%>"> <input
										type="hidden" class="form-control" name="correction"
										value="yes">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Previous Upper Arch Sheet">Previous
													Upper Arch Sheet</label> <select class="form-control"
													name="pre_ua_sheet" id="pre_ua_sheet">
													<option value="0">Select Option</option>
													<%
													for (Newcase1 Newcase1 : sheetvo) {
														if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
													%>
													<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
													<%
													} else {
													%>
													<option value="<%=Newcase1.getSheetId()%>"><%=Newcase1.getSheetname()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="pre_u_thichness">Upper Thickness</label> <select
													class="form-control" name="pre_u_thichness"
													id="pre_u_thichness">
													<option value="0">Select Option</option>
													<%
													if (pre_u_thichness.equals("0.8")) {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (pre_u_thichness.equals("0.9")) {
													%>
													<option selected value="0.9">0.9 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (pre_u_thichness.equals("1.0")) {
													%>
													<option selected value="1.0">1.0 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<%
													} else {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													}
													%>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="pre_la_sheet">Previous Lower Arch Sheet</label>
												<select class="form-control" name="pre_la_sheet"
													id="pre_la_sheet">
													<option value="0">Select Option</option>
													<%
													for (Newcase1 Newcase1 : sheetvo) {
														if (pre_la_sheet.equals(Newcase1.getSheetId())) {
													%>
													<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
													<%
													} else {
													%>
													<option value="<%=Newcase1.getSheetId()%>"><%=Newcase1.getSheetname()%></option>
													<%
													}
													}
													%>

												</select>
											</div>

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="pre_l_thichness">Lower Thickness</label> <select
													class="form-control" name="pre_l_thichness"
													id="pre_l_thichness">

													<option value="0">Select Option</option>
													<%
													if (pre_l_thichness.equals("0.8")) {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (pre_l_thichness.equals("0.9")) {
													%>
													<option selected value="0.9">0.9 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (pre_l_thichness.equals("1.0")) {
													%>
													<option selected value="1.0">1.0 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<%
													} else {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													}
													%>
												</select>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="exampleInputEmail1">Now Upper Arch Sheet</label>
												<select class="form-control" name="new_ua_sheet"
													id="new_ua_sheet">
													<option value="0">Select</option>
													<%
													for (Newcase1 Newcase1 : sheetvo) {
														if (new_ua_sheet.equals(Newcase1.getSheetId())) {
													%>
													<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
													<%
													} else {
													%>
													<option value="<%=Newcase1.getSheetId()%>"><%=Newcase1.getSheetname()%></option>
													<%
													}
													}
													%>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="exampleInputEmail1">Upper Thickness</label> <select
													class="form-control" name="new_u_thichness"
													id="new_u_thichness">
													<option value="0">Select Option</option>
													<%
													if (new_u_thichness.equals("0.8")) {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (new_u_thichness.equals("0.9")) {
													%>
													<option selected value="0.9">0.9 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (new_u_thichness.equals("1.0")) {
													%>
													<option selected value="1.0">1.0 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<%
													} else {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													}
													%>
												</select>
											</div>

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="new_la_sheet">Now Lower Arch Sheet</label> <select
													class="form-control" name="new_la_sheet" id="new_la_sheet">
													<option value="0">Select Option</option>
													<%
													for (Newcase1 Newcase1 : sheetvo) {
														if (new_la_sheet.equals(Newcase1.getSheetId())) {
													%>
													<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
													<%
													} else {
													%>
													<option value="<%=Newcase1.getSheetId()%>"><%=Newcase1.getSheetname()%></option>
													<%
													}
													}
													%>
												</select>
											</div>

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="new_l_thichness">Lower Thickness</label> <select
													class="form-control" name="new_l_thichness"
													id="new_l_thichness">
													<option value="0">Select Option</option>
													<%
													if (new_l_thichness.equals("0.8")) {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (new_l_thichness.equals("0.9")) {
													%>
													<option selected value="0.9">0.9 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													} else if (new_l_thichness.equals("1.0")) {
													%>
													<option selected value="1.0">1.0 mm</option>
													<option value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<%
													} else {
													%>
													<option selected value="0.8">0.8 mm</option>
													<option value="0.9">0.9 mm</option>
													<option value="1.0">1.0 mm</option>
													<%
													}
													%>
												</select>
											</div>

										</div>
									</div>

									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="malocclusion">Malocclusion</label> <input
													type="text" class="form-control" name="malocclusion"
													id="malocclusion" value="<%=malocclusion%>" maxlength="200">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks"
													value="<%=plnremrks%>"  maxlength="200">
											</div>

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control"
													aria-label="Default select example" id="case_stage"
													name="case_stage">
<!-- 													<option value="" >Select Stage</option>
 -->													<option value="RPTPLN" selected>Approved Planning</option>
													<option value="RPTWFCCOR">Workflow Correction</option>
												</select>
												<%System.out.println("sending in cases "); %>
											</div>
  <%-- <div class="col-lg-3 col-md-3 col-sm-3">
        <label for="special_remarks" class="form-label">Special Remarks</label>  
        <textarea id="special_remarks" name="special_remarks" rows="4" class="form-control" maxlength="250" 
                  style="font-size: 16px; font-family: Arial, sans-serif; font-style: italic; 
                         color: black; border: 2px solid red; width: 100%;" readonly><%= special_remark %></textarea>
    </div>
</div> --%>

										</div>
									</div>
									<div class="row">
										<div class="col-lg-12 text-center">
											<button type="submit" class="btn btn-primary"
												style="margin-top: 22px;">Submit</button>

										</div>
									</div>
								</form>

							</div>
						</div>
					</div>
					<%
					}
					%>


					<%
					if (userRight.contains("Lab") && currentStage.equals("Lab")) {
						System.out.println("found in LAB");

					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Lab Repeat Case details</div>
							<div class="panel-body">

								<!-- start previous data -->
								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase?query=RPTLAB"
									method="post" onsubmit="return labvalidation()">

									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>"> <input
										type="hidden" class="form-control" name="correction"
										value="yes">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>
												<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control"
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option selected value="RPTLAB">LAB Approved</option>
													<option value="RPTTDPCOR">3DP Correction</option>
												</select>
											</div>
										
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 30px;">Submit</button>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12 text-center"></div>
									</div>
								</form>

							</div>
						</div>
					</div>
					<%
					}
					%>

					<%
					if (userRight.contains("3DP") && currentStage.equals("RPTTDP")) {
						System.out.println("found in RPTTDP");
					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add 3D Printing Repeat Case
								details</div>
							<div class="panel-body">
								<!-- start previous data -->

								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<!-- end previous data -->
								<form class="form-group" action="RepeatCase?query=RPTTDP"
									method="post">

									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>"> <input
										type="hidden" class="form-control" name="correction"
										value="yes">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>
											

											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label>
												 <select
													class="form-control inpt-control" readonly
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option value="RPTTDP">3DP Approved</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 25px;">Submit</button>
											</div>

										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
					}
					%>

					<%
					if (userRight.contains("FQC") && currentStage.equals("RPTFQC")) {
					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Packaging Repeat Case
								Details</div>
							<div class="panel-body">


								<!-- start previous data -->
								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase?query=RPTFQC"
									method="post">
									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control" readonly
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option value="RPTFQC">FQC Approved</option>
													<!-- <option value="RPTTDPCOR">3DP Correction</option> -->
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks"
													maxlength="100">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 30px;">Submit</button>
											</div>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
					<%
					}
					%>

					<%
					if (userRight.contains("PCK") && currentStage.equals("RPTPCK")) {
					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Packaging Repeat Case
								Details</div>
							<div class="panel-body">


								<!-- start previous data -->
								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase?query=RPTPCK"
									method="post">
									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>


											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control" readonly
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option value="RPTPCK">Packaging Approved</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks"
													maxlength="100">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 22px;">Submit</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<%
					}
					%>


					<%
					if (userRight.contains("DPH")) {
					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Dispatch Repeat Case
								Details</div>
							<div class="panel-body">

								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase?query=RPTDPH"
									method="post">
									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>"> <input
										type="hidden" class="form-control" name="no_of_rpt"
										value="<%=no_of_rpt%>">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control" readonly
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option value="RPTDPH">Dispatch Approved</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks"
													maxlength="100">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 30px;">Submit</button>
											</div>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
					<%
					}
					%>
					<!-- start wfc cor -->
					
					
					<%
					if (userRight.contains("WFC") && currentStage.equals("WFCCOR")) {
					%>
					<div class="container " style="width: 98%;">
						<div class="panel panel-info">
							<div class="panel-heading ">Add Dispatch Repeat Case
								Details</div>
							<div class="panel-body">

								<section id="faqs">
									<div class="container">
										<div class="row">
											<div class="col-sm-12">
												<div class="accordion-container">
													<div class="ac">
														<h2 class="ac-header clr">
															<button class="ac-trigger"  style="background-color: #2ab31b;">More Details</button>
														</h2>
														<div class="ac-panel">
															<p class="ac-text">
															<div class="row">
																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">

																		<div class="card-body">
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Upper
																							Aligner</label> <input type="text" readonly
																							class="form-control" value="<%=upper_aligner%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Lower Aligner">Lower Aligner</label> <input
																							type="text" readonly class="form-control"
																							value="<%=lower_aligner%>">

																					</div>


																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="Previous Upper Arch Sheet">Previous
																							Upper Arch Sheet</label> <select class="form-control"
																							readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_la_sheet">Previous Lower
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=pre_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">


																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_u_thichness">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_u_thichness%>">
																					</div>

																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="pre_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=pre_l_thichness%>">
																					</div>

																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Now Upper
																							Arch Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_ua_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_la_sheet">Now Lower Arch
																							Sheet</label> <select class="form-control" readonly>
																							<option value="">No Data Selected</option>
																							<%
																							for (Newcase1 Newcase1 : sheetvo) {
																								if (new_la_sheet.equals(Newcase1.getSheetId())) {
																							%>
																							<option selected value="<%=new_la_sheet%>"><%=Newcase1.getSheetname()%></option>
																							<%
																							}
																							}
																							%>
																						</select>
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="exampleInputEmail1">Upper
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_u_thichness%>">
																					</div>
																					<div class="col-lg-6 col-md-6 col-sm-6">
																						<label for="new_l_thichness">Lower
																							Thickness</label> <input type="text" class="form-control"
																							readonly value="<%=new_l_thichness%>">
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>
																</div>



																<div class="col-sm-6">
																	<div class="card text-white bg-success mb-12">


																		<div class="card-body">
																		<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Issue</label>
																						<input type="text" class="form-control" readonly
																							value="<%=issueName%>">
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Malocclusion</label>
																						<input type="text" class="form-control" readonly
																							value="<%=malocclusion%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="Previous Upper Arch Sheet">Work
																							Flow Check Remarks</label> <input type="text" readonly
																							class="form-control" value="<%=wfcremrks%>">
																					</div>
																				</div>
																			</div>

																			<div class="row">
																				<div class="col-lg-12" style="margin-top: 20px;">
																					<div class="col-lg-12 col-md-12 col-sm-12">
																						<label for="exampleInputEmail1">Planning
																							Remarks</label> <input type="text" class="form-control"
																							readonly value="<%=plnremrks%>">

																					</div>
																				</div>
																			</div>


																		</div>
																	</div>
																</div>
																<!-- end pre info -->
																</p>
																<div>
																	<div>
																		<div>
																			<div>
																				<div>
																					<div>
								</section>

								<form class="form-group" action="RepeatCase?query=RPTDPH"
									method="post">
									<input type="hidden" class="form-control" name="userid"
										id="userid" value="<%=s.getAttribute("userid")%>"> <input
										type="text" class="form-control" name="no_of_rpt"
										value="<%=no_of_rpt%>">
									<div class="row">
										<div class="col-lg-12" style="margin-top: 20px;">
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Case ID">Case ID </label> <input type="text"
													class="form-control" readonly name="caseId" id="caseId"
													value="<%=caseId%>">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="Decision">Decision</label> <select
													class="form-control inpt-control" readonly
													aria-label="Default select example" id="case_stage"
													name="case_stage">
													<option value="RPTDPH">Dispatch Approved</option>
												</select>
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<label for="remarks">Remarks</label> <input type="text"
													class="form-control" name="remarks" id="remarks"
													maxlength="100">
											</div>
											<div class="col-lg-3 col-md-3 col-sm-3">
												<button type="submit" class="btn btn-primary"
													style="margin-top: 22px;">Submit</button>
											</div>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>
					<%
					}
					%>
					<!-- end wfc cor -->
					
					<!--  </div> -->
					<!--  end main panel -->
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>




	<script src="script/accordion.min.js"></script>
	<script>
		new Accordion('.accordion-container');
	</script>
<script>

    function plnvalidation(){
    	var stage = document.getElementById('case_stage').value;
        var remarks = document.getElementById('remarks').value;
       
        if(stage=='RPTWFCCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 } 
    }
    function labvalidation(){
    	var stage = document.getElementById('case_stage').value;
        var remarks = document.getElementById('remarks').value;
       
        if(stage=='RPTTDPCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 } 
    }
	</script>
</body>
</html>
