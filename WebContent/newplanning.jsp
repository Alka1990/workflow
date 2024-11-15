
<!DOCTYPE html>

<%@page import="com.vo.StagingVo"%>
<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@page import="com.vo.PlanningVO"%>

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
<!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<link
	href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">


<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
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
	String n = request.getParameter("caseId");
	String crm = request.getParameter("crm");
	String patient_Name = request.getParameter("patient_Name");
	String cdoc = request.getParameter("cdoc");

	String cccrmpriority = (String) session.getAttribute("cccrmpriority");

	List<String> userRight = LoginDAO.getRight((String) session.getAttribute("userid"));

	List<StagingVo> list = (List) session.getAttribute("previousstagging");
	List<PlanningVO> list10 = (List) session.getAttribute("previousotpln");
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
			
				<div class="container" style="padding-top: 20px;">
				<%
                         n = request.getParameter("caseId");
                         crm = request.getParameter("crm");
                         patient_Name = request.getParameter("patient_Name");
                         cdoc = request.getParameter("cdoc");
                         cccrmpriority = (String) session.getAttribute("plnpriority");
                         con = null;
                        PreparedStatement pstmt = null;
                         rs = null;
                        String special_remark = "";

                        try {
                            if (n != null && !n.trim().isEmpty()) {
                                LoginDAO loginDAO = new LoginDAO();
                                con = LoginDAO.getConnectionDetails();
                                String query = "SELECT special_remarks FROM wisealign_workflow.cc_crm WHERE case_id = ?";
                                pstmt = con.prepareStatement(query);
                                pstmt.setString(1, n);
                                rs = pstmt.executeQuery();

                                if (rs.next()) {
                                    special_remark = rs.getString("special_remarks");
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


                    <div class="row hidden">
                        <div class="col-sm-3">
                            <label>Case Id: </label><span> <%= n %></span>
                        </div>
                    </div>

                   <%--  <%
                        if (special_remark != null && !special_remark.trim().isEmpty()) {
                    %>
                        <div class="row">
                            <div class="col-sm-12">
                                <marquee class="blink">
                                    <%= special_remark %>
                                </marquee>
                            </div>
                        </div>
                    <%
                        }
                    %> --%>
					<div class="row">

						<%-- <input type="hidden" class="form-control" value="<%= cdoc%>" name="doctor_name" id="doctor_name" placeholder="Doctor Name" >
<input type="hidden" class="form-control" value="<%= n%>" name="caseId" id="caseId" >
<input type="hidden" class="form-control" value="<%= patient_Name%>" name="patient_name" id="patient_name" placeholder="Patient Name">
 --%>

						<div class="col-sm-3">
							<label">Case Id : </label><span> <%=n%></span>
						</div>
						<div class="col-sm-3">
							<label> Patient Name :<%=patient_Name%>
							</label> <span></span>
						</div>
						<div class="col-sm-3">
							<label> Doctor Name :<%=cdoc%>
							</label><span></span>
						</div>
						<div class="col-sm-3">
							<label>Priority : </label> <span><%=cccrmpriority%> </span>

						</div>

					</div>

					<div class="row">
						<div class="col-sm-3">
							<label><a class="btn btn-primary"
								href="Approval?caseId=<%=n%>&NxtStage=null&crm=<%=crm%>&cdoc=<%=cdoc%>&patient_Name=<%=patient_Name%> ">fetch
									data</a> </label><span></span>
						</div>
						<div class="col-sm-3">
							<label><a class="btn btn-primary"
								href="DispImageGrid?caseId=<%=n%> ">View Photo</a> </label><span></span>

						</div>


					</div>


					<div class="panel panel-primary">
						<div class="panel-heading">
							<strong>Staging</strong>
						</div>
						<br>

						<%
						if (list10.size() == 0) {
						%>
						<center>
							<div class="alert alert-danger" style="width: 98%;">
								<div class="row"
									style="margin-top: -10px; margin-bottom: -20px;">
									<i class="fa fa-warning" style="font-size: 15px"></i> <b>
										No Approved Planning Data found!</b>
									<button type="button" class="close" data-dismiss="alert"
										aria-hidden="true">�</button>

								</div>
							</div>
						</center>

						<%
						} else {
						%>
						<div class="container" style="width: 98%;">
							<div class="panel panel-info">
								<div class="panel-heading" style="background-color: #d9edf7;">
									Approved Planning Details<i
										class="fa fa-check-circle green-color"
										style="font-size: 20px; color: green;"></i>
								</div>
								<div class="panel-body">
									<%
									for (PlanningVO otpln : list10) {

										String planned_no = otpln.getPlanned_no();


										String planning_type = otpln.getPlanning_type();
										String Upper_aligner_from = otpln.getUpper_aligner_from();
										String Upper_aligner_to = otpln.getUpper_aligner_to();
										String Lower_aligner_from = otpln.getLower_aligner_from();
										String Lower_aligner_to = otpln.getLower_aligner_to();
									
										  String case_booking_form = otpln.getCase_booking_form();
							    		 String sales_approval_docs = otpln.getSales_approval_docs();
							    		 String doc_approval_form = otpln.getDoc_approval_form();
							    		 int u_form = otpln.getU_form();
							    		 int u_to = otpln.getU_to();
							    		 int l_from = otpln.getL_from();
							    		 int l_to = otpln.getL_to();
							    		 String plan_comment = otpln.getPlan_comment();
							    		 String stagesheet = otpln.getStagesheet();		    				    		
							    	     java.sql.Timestamp created_at = otpln.getCreated_at();
							    	     String created_by = otpln.getCreated_by(); 
										
										
									%>


									<fieldset disabled="disabled">
										<div class="row">
											<label class="col-md-1 control-label">Planned No </label>
											<div class="col-lg-4 ">
												<input class="form-control form-control-lg"
													value="<%=planned_no%>">
											</div>
											<label class="col-md-1 control-label">Planning Type </label>
											<div class="col-lg-4 ">
												<input class="form-control form-control-lg"
													value="<%=planning_type%>">
											</div>
										</div>
										<br>
										<div class="row">
											<label class="col-md-2 control-label">Upper Aligner</label>
											<div class="col-lg-2 ">
												<div class="input-group">
													<label><input class="form-control form-control-lg"
														value="<%=Upper_aligner_from%>"></label>
												</div>
											</div>
											<div class="col-lg-2 ">
												<div class="input-group">
													<label><input class="form-control form-control-lg"
														value="<%=Upper_aligner_to%>"></label>
												</div>
											</div>

											<label class="col-md-2 control-label">Lower Aligner </label>
											<div class="col-lg-2 ">
												<div class="input-group">
													<label><input class="form-control form-control-lg"
														value="<%=Lower_aligner_from%>"></label>
												</div>
											</div>
											<div class="col-lg-2 ">
												<div class="input-group">
													<label><input class="form-control form-control-lg"
														value="<%=Lower_aligner_to%>"></label>
												</div>
											</div>
										</div>
									<div class="row">
											<div class="text-center">

												<button class="btn btn-primary"
													style="background: green; color: white;">Approved
													Plan</button>


											</div>
										</div>
									</fieldset>
									<%
									}
									%>

								</div>
							</div>
						</div>
						<%
						}
						%>

						<%
						int i = 0;
						for (com.vo.StagingVo Nc : list) {
							i++;
						%>
						<%
						if (Nc.getUpper_aligner_from() == null && Nc.getUpper_aligner_to() == null && Nc.getLower_aligner_from() == null
								&& Nc.getLower_aligner_to() == null && Nc.getThick_upper() == null && Nc.getThick_lower() == null
								&& Nc.getMargin_upper() == null && Nc.getMargin_lower() == null) {
							i = 0;
						%>
						<%
						} else {
						%>
						<div class="container" style="width: 99%">
							<div class="panel panel-info">
								<div class="panel-heading" style="background-color: #d9edf7;">Staging
								</div>

								<div class="panel-body">

									<div class="row">
										<label class="col-md-4 control-label">No of Upper
											Aligner</label>
										<div class="col-lg-1 ">
											<div class="input-group">
												<label><input type="text" disabled
													class="form-control" id="upper_aligner_from"
													name="upper_aligner_from"
													value="<%=Nc.getUpper_aligner_from()%>"></label>
											</div>
										</div>
										<div class="col-lg-1 ">
											<div class="input-group">
												<label><input type="text" disabled
													class="form-control" id="upper_aligner_to"
													name="upper_aligner_to"
													value="<%=Nc.getUpper_aligner_to()%>"></label>
											</div>
										</div>

										<label class="col-md-4 control-label">No of Lower
											Aligner </label>
										<div class="col-lg-1 ">
											<div class="input-group">
												<label><input type="text" disabled
													class="form-control" id="lower_aligner_from"
													name="lower_aligner_from"
													value="<%=Nc.getLower_aligner_from()%>"></label>
											</div>
										</div>
										<div class="col-lg-1 ">
											<div class="input-group">
												<label><input type="text" disabled
													class="form-control" id="lower_aligner_to"
													name="lower_aligner_to"
													value="<%=Nc.getLower_aligner_to()%>"></label>
											</div>
										</div>
									</div>

									<div class="row">
										<label class="col-md-2 control-label">Thickness Upper
										</label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="thick_upper"
												id="thick_upper" value="<%=Nc.getThick_upper()%>">
										</div>
										<label class="col-md-2 control-label">Thickness Lower
										</label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="thick_lower"
												id="thick_lower" value="<%=Nc.getThick_lower()%>">
										</div>
									</div>
									<br>
									<div class="row">
										<label class="col-md-2 control-label">Margin Upper</label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="margin_upper"
												id="margin_upper" value="<%=Nc.getMargin_upper()%>">
										</div>
										<label class="col-md-2 control-label">Margin Lower </label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="margin_lower"
												id="margin_lower" value="<%=Nc.getMargin_lower()%>">
										</div>
									</div>
									<br>
									<div class="row">
										<label class="col-md-2 control-label">3rd Molar Upper
										</label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="molor_upper"
												id="molor_upper" value="<%=Nc.getMolor_upper()%>">
										</div>
										<label class="col-md-2 control-label">3rd Molar Lower</label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="molor_lower"
												id="molor_lower" value="<%=Nc.getMolor_lower()%>">
										</div>
									</div>
									<br>
									<div class="row">
										<label class="col-md-2 control-label">Sheet Type </label>
										<div class="col-lg-2 ">
											<input type="text" disabled
												class="form-control form-control-lg" name="sheet_type"
												id="sheet_type" value="<%=Nc.getSheet_type()%>">
										</div>
									</div>
									<br>


								</div>
							</div>
						</div>


						<%
						}
						}
						%>








						<div class="container" style="width: 99%">
							<div class="panel panel-info">
								<div class="panel-heading"
									style="background-color: #337ab7; color: #fff;">Add New
									Staging</div>
								<div class="panel-body">

									<form class="form-verticle"
										action="SaveStaging?query=stagingnew" method="post">

										<input type="hidden" class="form-control" value="<%=cdoc%>"
											name="d_name" id="d_name"> <input type="hidden"
											class="form-control" value="<%=n%>" name="caseid"
											id="caseid"> <input type="hidden"
											class="form-control" value="<%=patient_Name%>"
											name="patient_name" id="patient_name"> <input
											type="hidden" class="form-control" value="<%=crm%>"
											name="crm" id="crm">

										<div class="row">
											<label class="col-md-2 control-label">No of Upper
												Aligner</label>
											<div class="col-lg-1 ">
												<div class="input-group">
													<label><input type="text" class="form-control"
														id="upper_aligner_from" required name="upper_aligner_from"
														placeholder="From" value=""
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
												</div>
											</div>
											<div class="col-lg-1 ">
												<div class="input-group">
													<label><input type="text" required
														class="form-control" id="upper_aligner_to"
														name="upper_aligner_to" placeholder="To" value=""
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
												</div>
											</div>

											<label class="col-md-2 control-label">No of Lower
												Aligner </label>
											<div class="col-lg-1 ">
												<div class="input-group">
													<label><input type="text" required
														class="form-control" id="lower_aligner_from"
														name="lower_aligner_from" placeholder="From" value=""
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
												</div>
											</div>
											<div class="col-lg-1 ">
												<div class="input-group">
													<label><input type="text" required
														class="form-control" id="lower_aligner_to"
														name="lower_aligner_to" placeholder="To" value=""
														oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
												</div>
											</div>
										</div>


										<div class="row">
											<label class="col-md-2 control-label">Thickness Upper
											</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="thick_upper"
													id="thick_upper">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="0.8">0.8</option>
													<option value="0.8">1.0</option>
												</select>
											</div>
											<label class="col-md-2 control-label">Thickness Lower
											</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="thick_lower"
													id="thick_lower">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="0.8">0.8</option>
													<option value="0.8">1.0</option>

												</select>
											</div>
										</div>

										<br>
										<div class="row">
											<label class="col-md-2 control-label">Margin Upper</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="margin_upper"
													id="margin_upper">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="cervical">Cervical</option>
													<option value="Straight Cut">Straight Cut</option>
												</select>
											</div>
											<label class="col-md-2 control-label">Margin Lower </label>
											<div class="col-lg-2 ">
												<select class="form-control" name="margin_lower"
													id="margin_lower">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="cervical">Cervical</option>
													<option value="Straight Cut">Straight Cut</option>

												</select>
											</div>
										</div>
										<br>
										<div class="row">
											<label class="col-md-2 control-label">3rd Molar Upper
											</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="molor_upper"
													id="molor_upper">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="Not Covered">Not Covered</option>
													<option value="25%">25%</option>
													<option value="50%">50%</option>
													<option value="75%">75%</option>
													<option value="Full Covered">Full Covered</option>
												</select>
											</div>
											<label class="col-md-2 control-label">3rd Molar Lower</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="molor_lower"
													id="molor_lower">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="Not Covered">Not Covered</option>
													<option value="25%">25%</option>
													<option value="50%">50%</option>
													<option value="75%">75%</option>
													<option value="Full Covered">Full Covered</option>
												</select>
											</div>
										</div>
										<br>
										<div class="row">
											<label class="col-md-2 control-label"> Sheet Type</label>
											<div class="col-lg-2 ">
												<select class="form-control" name="sheet_type"
													id="sheet_type">
													<!-- <option value="Y">Work-In-Progress</option> -->
													<option value="ERKUDENT">ERKUDENT</option>
													<option value="LEONE">LEONE</option>
													<option value="NANOFLEX">NANOFLEX</option>
													<option value="FORESDENT">FORESDENT</option>
													<option value="GT PRO">GT PRO</option>
													<option value="GT FLEX">GT FLEX</option>
													<option value="ZENDURA">ZENDURA</option>
													<option value="SCHEU">SCHEU</option>
													<option value="ESSIX">ESSIX</option>
													<option value="PU BX">PU BX</option>
													<option value="PU AL">PU AL</option>
													<option value="CA Pro">CA Pro</option>
													<option value="Duran Plus">Duran Plus</option>
													<option value="OTHERS">OTHERS</option>
													<option value="GHOST SHEET">GHOST SHEET</option>

												</select>
											</div>
										</div>
										<br>

										<div class="row">
											<div class="text-center">
												<button type="submit" class="btn btn-primary">Submit</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>

						<div class="container" style="width: 99%">
							<div class="panel panel-info" style="border-color: #3a5e7c;">
								<div class="panel-heading "
									style="background-color: #3a5e7c; color: #fff;">Staging</div>
								<div class="panel-body">

									<form class="form-verticle" action="SaveStaging" method="post"
										onsubmit="return validation()">

										<input type="hidden" class="form-control" value="<%=cdoc%>"
											name="d_name" id="d_name"> <input type="hidden"
											class="form-control" value="<%=n%>" name="caseid"
											id="caseid"> <input type="hidden"
											class="form-control" value="<%=patient_Name%>"
											name="patient_name" id="patient_name"> <input
											type="hidden" class="form-control" value="<%=crm%>"
											name="crm" id="crm">

										<div class="row">
											<label class="col-md-3 control-label">Review Attached</label>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="review_attach"
															id="review_attach" checked value="Yes">Yes</label>
													</div>
												</div>
											</div>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="review_attach"
															id="review_attach" value="No">No</label>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<label class="col-md-3 control-label">IPR Sheet</label>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="ipr_sheet_"
															id="ipr_sheet_" checked value="Yes">Yes</label>
													</div>
												</div>
											</div>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="ipr_sheet_"
															id="ipr_sheet_" value="No">No</label>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<label class="col-md-3 control-label">Soft Tissue
												Sculpt</label>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="soft_tissus"
															id="soft_tissus" checked value="Yes">Yes</label>
													</div>
												</div>
											</div>
											<div class="col-md-1 inputGroupContainer">
												<div class="input-group">
													<div class="radio">
														<label><input type="radio" name="soft_tissus"
															id="soft_tissus" value="No">No</label>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<label class="col-md-3 control-label">Decision</label>
											<div class="col-md-6 inputGroupContainer">
												<div class="input-group">
													<label> <select class="form-control"
														name="decesion" id="decesion"
														style="width: 501px; height: 34px;">
															<option value="STG">Staging Approve</option>
															<option value="PLN">Send to Upload</option>
															<option value="PRECOR">Prerequisite Correction</option>
													</select>
													</label>

												</div>
											</div>

										</div>
										<div class="row">
											<label class="col-md-3 control-label">Remarks</label>
											<div class="col-md-9 inputGroupContainer">
												<div class="input-group">
													<label> <textarea class="form-control"
															name="remark" id="remark" placeholder="Remarks"
															maxlength="250" rows="4" cols="58"></textarea>
													</label>
												</div>
											</div>

										</div>
									<div class="row">
   
<div class="row" style="margin-top:20px;margin-left:0px;">
    <label class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group">
            <textarea class="form-control" name="details" id="details" placeholder="Special Remarks" rows="4" cols="58" maxlength="250" 
                      style="font-size: 16px; font-style: italic; color: black; border: 2px solid red;" readonly>
                <%= (special_remark != null) ? special_remark : "" %>
            </textarea>
        </div>
    </div>
</div>



										<div class="row">
											<div class="text-center">
												<button type="submit" value="Save" class="btn btn-primary">Submit</button>
											</div>
										</div>
									</form>

								</div>
							</div>
						</div>


					</div>
				</div>



				<script type="text/javascript">
					function validation() {
						var stage = document.getElementById('decesion').value;
						var remarks = document.getElementById('remark').value;

						if (stage == 'PRECOR' && remarks == "") {
							alert("Remarks is Required!")
							document.getElementById("remark").style.borderColor = "#E34234";
							return false;
						}

					}
				</script>
</body>
</html>
