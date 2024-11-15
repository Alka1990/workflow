
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
<%@page import="com.vo.Newcase1"%>
<%@ page import="com.workflow.connection.LoginDAO"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/favicon.ico">

<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Workflow</title>
<!-- Bootstrap core CSS -->
<link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
<link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/StyleSheet/animate.min.css"
	rel="stylesheet">
<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/StyleSheet/custom1.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<link rel="stylesheet" href="script/accordion.min.css">

<script src="JavaScript/bootstrap.js"></script>

<script src="JavaScript/custom.js"></script>
<script type="text/javascript" class="init"></script>

<script type="text/javascript" language="javascript"
	src="${pageContext.request.contextPath}/JavaScript/dataTables.js"></script>

<style>
.clr {
	background: #EDEDED;
}

@
-webkit-keyframes invalid {from { background-color:yellow;
	
}

to {
	background-color: inherit;
}

}
@
-moz-keyframes invalid {from { background-color:yellow;
	
}

to {
	background-color: inherit;
}

}
@
-o-keyframes invalid {from { background-color:yellow;
	
}

to {
	background-color: inherit;
}

}
@
keyframes invalid {from { background-color:yellow;
	
}

to {
	background-color: inherit;
}

}
.invalid {
	-webkit-animation: invalid 1s infinite; /* Safari 4+ */
	-moz-animation: invalid 1s infinite; /* Fx 5+ */
	-o-animation: invalid 1s infinite; /* Opera 12+ */
	animation: invalid 1s infinite; /* IE 10+ */
}
}
</style>

</head>

<body class="nav-md">


	<form name="MyInvoiceForm" id="MyInvoiceForm">
		<%-- <form name="MyInvoiceForm" id="MyInvoiceForm" method="post" action="${pageContext.request.contextPath}/GenerateBarCodeServlet" target="_self" >
	--%>
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
						<div class="panel panel-primary">
							<div class="panel-heading">
								<strong>My Cases</strong>
							</div>
							<div class="table-responsive">
								<div style="display: none;">
									<input type="text" id="LinkType" name="LinkType" /> <input
										type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo" />
									<input type="text" id="hiddenLastQueryNo"
										name="hiddenLastQueryNo" /> <input type="text"
										id="hiddenInvId" name="hiddenInvId" />
								</div>
								<%
								List<Newcase1> WFClist = (List) request.getAttribute("WFClist");
								List<Newcase1> list = (List) request.getAttribute("newcaselist");
								List<Newcase1> CRMLIST = (List) request.getAttribute("CRMLIST");
								List<Newcase1> INIlist = (List) request.getAttribute("INIlist");
								List<Newcase1> PRElist = (List) request.getAttribute("PRElist");
								List<Newcase1> CADBSlist = (List) request.getAttribute("CADBSlist");
								List<Newcase1> plnlist = (List) request.getAttribute("plnlist");
								List<Newcase1> REVlist = (List) request.getAttribute("REVlist");
								List<Newcase1> QAlist = (List) request.getAttribute("QAlist");
								List<Newcase1> Stagelist = (List) request.getAttribute("Stagelist");
								List<Newcase1> STGlist = (List) request.getAttribute("STGlist");
								List<Newcase1> MPTlist = (List) request.getAttribute("MPTlist");
								List<Newcase1> TDPlist = (List) request.getAttribute("TDPlist");
								List<Newcase1> LABlist = (List) request.getAttribute("LABlist");
								List<Newcase1> FQClist = (List) request.getAttribute("FQClist");
								List<Newcase1> DPHlist = (List) request.getAttribute("DPHlist");
								List<Newcase1> VOList = (List) request.getAttribute("VOList");

								List<Newcase1> StageQueryForStarterList = (List) request.getAttribute("StageQueryForStarterList");
								List<Newcase1> MPTQueryForStarterList = (List) request.getAttribute("MPTQueryForStarterList");
								List<Newcase1> TDPQueryForStarterList = (List) request.getAttribute("TDPQueryForStarterList");

								List<Newcase1> LABQueryForStarterList = (List) request.getAttribute("LABQueryForStarterList");
								List<Newcase1> FQCQueryForStarterList = (List) request.getAttribute("FQCQueryForStarterList");
								List<Newcase1> DPHQueryForStarterList = (List) request.getAttribute("DPHQueryForStarterList");
								List<String> userRight = LoginDAO.getRight((String) request.getAttribute("username"));
   								List<com.vo.Impression> impressionINIQueryList = (List) request.getAttribute("impressionINIQueryList");

								for (String ss : userRight) {

								}
								List<Newcase1> issueList = (List) request.getAttribute("issuelist");
								List<Newcase1> sheetList = (List) request.getAttribute("sheetList");
								List<Newcase1> rptWFC = (List) request.getAttribute("rptWFC");
								List<Newcase1> rptWFCCOR = (List) request.getAttribute("rptWFCCOR");
								List<Newcase1> rptPLN = (List) request.getAttribute("rptPLN");
								List<Newcase1> rptLAB = (List) request.getAttribute("rptLAB");
								List<Newcase1> rpt3DPLAB = (List) request.getAttribute("rpt3DPLAB");
								List<Newcase1> rpt3DP = (List) request.getAttribute("rpt3DP");
								List<Newcase1> rpt3DP1 = (List) request.getAttribute("rpt3DP1");
								List<Newcase1> rptFQC = (List) request.getAttribute("rptFQC");
								List<Newcase1> rptPCK = (List) request.getAttribute("rptPCK");
								%>

								<table class="fontTable" align="center">
									<input type="hidden" name="username" id="logusername"
										value='<%=request.getAttribute("username")%>' />
									<tr id="mesg">
										<td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td>
									</tr>
								</table>
								<table id="myinvoice" class="table table-bordered">
									<thead>
										<tr>
											<td colspan="9">
												<div class="col-lg-12">
													<div class="table-responsive" style="overflow-x: hidden;">
														<!-- //////////////// WFC start style="overflow-x: hidden;"-->



														<section id="faqs">
														<div class="container">
															<div class="row">
																<div class="col-sm-12">

																	<div class="accordion-container">

																		<%
																		if (userRight.contains("WFC")) {
																		%>
																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">Case Initiated</button>
																			</h2>
																			<div class="ac-panel">
																				<p class="ac-text">
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																					<thead style="background: black; color: white;">
																						<tr role="row">
																							<th class="sorting">CASE_ID</th>
																							<th class="sorting">DOCTOR NAME</th>
																							<th class="sorting">PATIENT NAME</th>
																							<th class="sorting">TYPE OF REQUEST</th>
																							<th class="sorting">LAST STAGE</th>
																							<th class="sorting">CRM NAME</th>
																							<th class="sorting">LAST USER</th>
																							<th class="sorting">DATE</th>
																						</tr>
																					</thead>
																					<tbody>


																						<%
																						for (Newcase1 Nc : WFClist) {
																							String crm = Nc.getCrm();
																							String stage = Nc.getCase_stage();
																							if (crm == null) {
																								crm = "";
																							} else {
																								crm = Nc.getCrm();
																							}

																							if (stage.equals("INI")) {
																								stage = "Case Initiated";
																								if (Nc.getPriority().equals("10")) {
																						%>

																						<tr class="even invalid" role="row">
																							<%
																							} else {
																							%>
																						
																						<tr class="even" role="row">
																							<%
																							}
																							%>
																							<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																							<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																							<TD><%=Nc.getCdoctorname()%></TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>

																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>


																						</tr>

																						<%
																						}
																						}
																						%>
																					</tbody>
																				</table>
																				</p>
																			</div>
																		</div>
																		<!--  //////////////////// WFCCOR-->
																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">Work Flow Check
																					Correction</button>
																			</h2>

																			<div class="ac-panel">
																				<p class="ac-text">
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																					<thead style="background: black; color: white;">
																						<tr role="row">
																							<th class="sorting">CASE_ID</th>
																							<th class="sorting">DOCTOR NAME</th>
																							<th class="sorting">PATIENT NAME</th>
																							<th class="sorting">TYPE OF REQUEST</th>
																							<th class="sorting">LAST STAGE</th>
																							<th class="sorting">CRM NAME</th>
																							<th class="sorting">LAST USER</th>
																							<th class="sorting">DATE</th>
																						</tr>
																					</thead>
																					<tbody>

																						<%
																						for (Newcase1 Nc : CRMLIST) {
																							String crm = Nc.getCrm();
																							String stage = Nc.getCase_stage();

																							if (crm == null) {
																								crm = "";
																							} else {
																								crm = Nc.getCrm();
																							}
																							if (stage.equals("WFCCOR")) {
																								stage = "Work Flow Check Correction";
																								if (Nc.getPriority().equals("10")) {
																						%>
																						<tr class="even invalid" role="row">
																							<%
																							} else {
																							%>
																						
																						<tr class="even" role="row">
																							<%
																							}
																							%>
																							<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																							<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																							<TD><%=Nc.getCdoctorname()%></TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>

																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>

																						</tr>

																						<%
																						}
																						}
																						%>
																					</tbody>
																				</table>
																				</p>
																			</div>
																		</div>

																		<!--   ////// -->


																		<%
																		}
																		%>
																		<!-- //////////// end WFC-->
																		<%
																		if (userRight.contains("PRE")) {
																		%>

																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">Prerequisite
																					Correction</button>
																			</h2>
																			<div class="ac-panel">
																				<p class="ac-text">
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																					<thead style="background: black; color: white;">
																						<tr role="row">
																							<th class="sorting">CASE_ID</th>
																							<th class="sorting">DOCTOR NAME</th>
																							<th class="sorting">PATIENT NAME</th>
																							<th class="sorting">TYPE OF REQUEST</th>
																							<th class="sorting">LAST STAGE</th>
																							<th class="sorting">CRM NAME</th>
																							<th class="sorting">LAST USER</th>
																							<th class="sorting">DATE</th>
																						</tr>
																					</thead>
																					<tbody>


																						<%
																						for (Newcase1 Nc : CRMLIST) {
																							String stage = Nc.getCase_stage();
																							String crm = Nc.getCrm();
																							if (crm == null) {
																								crm = "";
																							} else {
																								crm = Nc.getCrm();
																							}

																							if (stage.equals("PRECOR")) {
																								stage = "Prerequisite Correction";
																								if (Nc.getPriority().equals("10")) {
																						%>

																						<tr class="even invalid" role="row">
																							<%
																							} else {
																							%>
																						
																						<tr class="even" role="row">
																							<%
																							}
																							%>
																							<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																							<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																							<TD><%=Nc.getCdoctorname()%></TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>

																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>
																							<%-- <td><%=Nc.getTotal_amount()%></td> 
	            																				<td><%=Nc.getPayment_processing() %></td>
	            																				<td><%=Nc.getPayment_mode() %></td> --%>
																						</tr>
																						<%
																						}
																						}
																						%>
																					</tbody>
																				</table>
																				</p>
																			</div>
																		</div>
																		<!-- //////////////// wfc-->
																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">Work Flow Check</button>
																			</h2>
																			<div class="ac-panel">
																				<p class="ac-text">
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																					<thead style="background: black; color: white;">
																						<tr role="row">
																							<th class="sorting">CASE_ID</th>
																							<th class="sorting">DOCTOR NAME</th>
																							<th class="sorting">PATIENT NAME</th>
																							<th class="sorting">TYPE OF REQUEST</th>

																							<th class="sorting">LAST STAGE</th>
																							<th class="sorting">CRM NAME</th>
																							<th class="sorting">LAST USER</th>
																							<th class="sorting">DATE</th>
																						</tr>
																					</thead>
																					<tbody>

																						<%
																						for (Newcase1 Nc : CRMLIST) {
																							String stage = Nc.getCase_stage();
																							String crm = Nc.getCrm();
																							if (crm == null) {
																								crm = "";
																							} else {
																								crm = Nc.getCrm();
																							}

																							if (stage.equals("WFC")) {
																								stage = "Work Flow Check";
																								if (Nc.getPriority().equals("10")) {
																						%>
																						<tr class="even invalid" role="row">
																							<%
																							} else {
																							%>
																						
																						<tr class="even" role="row">
																							<%
																							}
																							%>
																							<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																							<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																							<TD><%=Nc.getCdoctorname()%></TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>
																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>
																							<%-- <td><%=Nc.getTotal_amount()%></td> 
																					            <td><%=Nc.getPayment_processing() %></td>
																					            <td><%=Nc.getPayment_mode() %></td> --%>
																						</tr>
																						<%
																						}
																						}
																						%>
																					</tbody>
																				</table>
																				</p>
																			</div>
																		</div>
																		<%
																		}
																		%>
																		<!-- ////////////// INI RIGHT -->

																		<%
																		if (userRight.contains("INI")) {
																		%>
																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">Case Initiation
																					Correction</button>
																			</h2>
																			<div class="ac-panel">
																				<p class="ac-text">
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																					<thead style="background: black; color: white;">
																						<tr role="row">
																							<th class="sorting">CASE_ID</th>
																							<th class="sorting">DOCTOR NAME</th>
																							<th class="sorting">PATIENT NAME</th>
																							<th class="sorting">TYPE OF REQUEST</th>

																							<th class="sorting">LAST STAGE</th>
																							<th class="sorting">CRM NAME</th>
																							<th class="sorting">LAST USER</th>
																							<th class="sorting">DATE</th>
																						</tr>
																					</thead>
																					<tbody>

																						<%
																						for (Newcase1 Nc : INIlist) {
																							String crm = Nc.getCrm();
																							String stage = Nc.getCase_stage();

																							if (crm == null) {
																								crm = "";
																							} else {
																								crm = Nc.getCrm();
																							}

																							if (stage.equals("INICOR")) {
																								stage = "Case Initiation Correction";
																								if (Nc.getPriority().equals("10")) {
																						%>
																						<tr class="even invalid" role="row">
																							<%
																							} else {
																							%>
																						
																						<tr class="even" role="row">
																							<%
																							}
																							%>
																							<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																							<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																							<TD><%=Nc.getCdoctorname()%></TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>
																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>
																						</tr>
																						<%
																						}
																						}
																						%>
																					</tbody>
																				</table>
																				</p>
																			</div>
																		</div>
																		<%
																		}
																		%>
																		<!--ending INI  -->

																		<!-- ////////////// VO RIGHT -->
																		<%
																		if (userRight.contains("VO")) {
																		%>
																		<div class="ac">
																			<h2 class="ac-header clr">
																				<button class="ac-trigger">CRM Cases
																					</button>
																			</h2>
																			<div class="ac-panel">
																				<p class="ac-text">

																					<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
				<thead style="background: black; color: white;">
					<tr role="row">
						<th class="sorting">CASE_ID</th>
						<th class="sorting">DOCTOR NAME</th>
						<th class="sorting">PATIENT NAME</th>
						<th class="sorting">TYPE OF REQUEST</th>
						<th class="sorting">LAST STAGE</th>
						<th class="sorting">CRM NAME</th>
						<th class="sorting">LAST USER</th>
						<th class="sorting">DATE</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Newcase1 Nc : VOList) {
						String crm = Nc.getCrm();
						String stage = Nc.getCase_stage();

						if (crm == null) {
							crm = "";
						} else {
							crm = Nc.getCrm();
						}

						/*
						if (stage.equals("INICOR")) {
							stage = "Case Initiation Correction";
							if (Nc.getPriority().equals("10")) {
						*/
					%>
					<%-- <tr class="even invalid" role="row"> --%>
					<%-- <%} else { %> --%>
					<tr class="even" role="row">
						<%-- <%} %> --%>
						<TD>
						
						<a
<%-- 						href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a>
 --%>						
					    href="Approval?caseId=<%=Nc.getCaseid()%>&logusername=<%=request.getAttribute("username")%>&NxtStage=<%=Nc.getCaseid()%>&SearchStage=Y"><%=Nc.getCaseid()%></a>
						
						</TD>
						<%-- <TD><%=Nc.getRdoctorname()%></TD> --%>
						<TD><%=Nc.getCdoctorname()%></TD>
						<TD><%=Nc.getPatient_Name()%></TD>
						<TD><%=Nc.getType_request()%></TD>
						<TD><%=Nc.getCase_stage()%></TD>
						<TD><%=Nc.getCrm()%></TD>
						<TD><%=Nc.getUser_id()%></TD>
						
						<TD><%=Nc.getStage_at()%></TD>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</p>
	</div>
</div>
<%
}
%>
<!--ending VO -->
																		<%
																		if (userRight.contains("CADBS")) {
																		%><div class="ac">
						
																																		<h2 class="ac-header clr">
																					<button class="ac-trigger">Work Flow Check</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : CRMLIST) {
																									String stage = Nc.getCase_stage();

																									String crm = Nc.getCrm();
																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("WFC")) {
																										stage = "Work Flow Check";
																										if (Nc.getPriority().equals("10")) {
																								%>
																								<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="NewCasesshow1?caseId=<%=Nc.getCaseid()%>&page=newcase"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																								<%-- <td><%=Nc.getTotal_amount()%></td> 
																					            <td><%=Nc.getPayment_processing() %></td>
																					            <td><%=Nc.getPayment_mode() %></td> --%>
																							</tr>
																							
																							<%
																																														}
																																														}
																																														%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%--    <div class="ac">
	    <h2 class="ac-header clr">
	      <button class="ac-trigger">Prerequisite</button>
	    </h2>
	    <div class="ac-panel">
	      <p class="ac-text">
	     <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
	    <thead style="background:black;color:white;">
	      <tr role="row">
	        <th class="sorting">CASE_ID</th>
	        <th class="sorting"> DOCTOR NAME </th>
	         <th class="sorting">PATIENT NAME </th>
	                  <th class="sorting">TYPE OF REQUEST</th>
	         
	        <th class="sorting">LAST STAGE </th>
	         <th class="sorting">CRM NAME </th>
	      </tr>
	    </thead>
		<tbody>
		
	<% 
	for(Newcase1 Nc:PRElist){	
		String crm=Nc.getCrm();
		String stage=Nc.getCase_stage();
	
		 if(crm==null)
			{crm="";}
			else{crm=Nc.getCrm();}
	
			 if(stage.equals("PRE")){
				  stage="Prerequisite"; %>
		<tr class="even" role="row">
			        <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%=  Nc.getCaseid() %></a></TD>
	         		<TD> <%=Nc.getRdoctorname() %></td>
	                <TD> <%= Nc.getCdoctorname() %></TD>
	                <TD> <%=Nc.getPatient_Name() %></td>
	                                <TD> <%= Nc.getType_request() %></TD>
	                
	              <TD> <%= stage %></TD>
					 <TD> <%= crm %></TD>
				</tr>	
	    <% }}%>
		</tbody>
		</table>
	      </p>
	    </div>
	  </div>  --%>
	
																			<%
																				}
																				%>
																			<!-- ///////// otpln-->
																			<%
																			if (userRight.contains("OTPLN")) {
																			%>
	
	
	
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">CAD Baising
																						Segmentation</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : CADBSlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("CADBS")) {
																										stage = "CAD Baising Segmentation";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="AddPlanning?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%> "><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
																			<!-- ///// PLNCOR -->
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Planning
																						Correction</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : CADBSlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("PLNCOR")) {
																										stage = "Planning Correction";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="AddPlanning?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
																			<%
																			}
																			%>
																			<!-- ///// QA start.................... -->
	
	
																			<!-- ///// UPL -->
																			<%
																			if (userRight.contains("UPL")) {
																			%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Planning</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : plnlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("PLN")) {
																										stage = "Planning";
																										if (Nc.getPriority().equals("10")) {
																								%>
	
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
	
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Upload
																						Correction</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : plnlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("PLN")) {
																										stage = "Planning";
																									}
																									if (stage.equals("UPLCOR")) {
																										stage = "Upload Correction";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
																			<%
																			}
																			%>
																			<!-- ///////////REV start-->
	
																			<%
																				if (userRight.contains("REV")) {
																				%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger" title="Plan for Review">Uploaded
																						Plan</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
																							<%
																							for (Newcase1 Nc : REVlist) {
																								String crm = Nc.getCrm();
																								String stage = Nc.getCase_stage();

																								if (crm == null) {
																									crm = "";
																								} else {
																									crm = Nc.getCrm();
																								}

																								if (stage.equals("UPL")) {
																									stage = "Upload Plan";
																									if (Nc.getPriority().equals("10")) {
																							%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="AddPlanning?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%
																				}
																				%>
	
																			<!--   /////////QA -->
	
																			<%
																				if (userRight.contains("QA")) {
																				%><!-- PRE -->
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger" title="">Planning
																						Review</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
																							<%
																							for (Newcase1 Nc : QAlist) {
																								String crm = Nc.getCrm();
																								String stage = Nc.getCase_stage();
																								if (crm == null) {
																									crm = "";
																								} else {
																									crm = Nc.getCrm();
																								}

																								if (stage.equals("REV")) {
																									//stage="Review"; 
																									stage = "Planning Review";
																									if (Nc.getPriority().equals("10")) {
																							%>
																								
																							
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="AddPlanning?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- 	<TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
	
	
																			<%
																						}
																						%>
	
																			<!-- //////////// STG -->
																			<%
																			if (userRight.contains("STG")) {
																			%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Pending for Sign
																						off</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : Stagelist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("QA")) {
																										stage = "Pending for Sign off";
																										if (Nc.getPriority().equals("10")) {
																								%>
																						<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="SelectStaging?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
	
	
																			<%
																						}
																						%>
																			<!-- ////// MPT -->
																			<%
																			if (userRight.contains("MPT")) {
																			%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Staging</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																							<!-- <th class="sorting">Case Date</th> -->	
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : STGlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();
																									String casedate = Nc.getCaseDate();

																									if (casedate == null) {
																										casedate = "";
																									} else {
																										casedate = Nc.getCaseDate();
																									}

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("STG")) {
																										stage = "Staging";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&

=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																							<!-- 	<TD><%=casedate%></TD> -->
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%
																				}
																				%>
																			<!-- ////////// 3d printing -->
																			<%
																			if (userRight.contains("3DP")) {
																			%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Hollow Tagging</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : MPTlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("MPT")) {
																										stage = "Hollow Tagging";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%> "><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">3D Printing
																						Correction</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : MPTlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("3DPCOR")) {
																										stage = "3D Printing Correction";
																										if (Nc.getPriority().equals("10")) {
																								%>
																								<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
	
																			<%
																					}
																					%>
	
																			<!-- /////////LAB -->
	
																			<%
																				if (userRight.contains("Lab")) {
																				%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">3D Printing</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : TDPlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("3DP")) {
																										stage = "3D Printing";
																										if (Nc.getPriority().equals("10")) {
																								%>
																								<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%> "><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<!--     ///////////RIGHT:LAB  STAGE: LABCOPR -->
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">LAB Correction</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : TDPlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("LABCOR")) {
																										stage = "LAB Correction";
																										if (Nc.getPriority().equals("10")) {
																								%>
																						<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%
																				}
																				%>
	
																			<%
																				if (userRight.contains("FQC")) {
																				%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">LAB</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
																							<%
																							for (Newcase1 Nc : LABlist) {
																								String crm = Nc.getCrm();
																								String stage = Nc.getCase_stage();

																								if (crm == null) {
																									crm = "";
																								} else {
																									crm = Nc.getCrm();
																								}

																								if (stage.equals("LAB")) {
																									stage = "LAB";
																									if (Nc.getPriority().equals("10")) {
																							%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
																								<TD><%=Nc.getCase_stage()%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%
																				}
																				%>
																			<!-- ////////Right PCK-->
	
																			<%
																				if (userRight.contains("PCK")) {
																				%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Finishing
																						Quality Check</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : FQClist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("FQC")) {
																										stage = "Finishing Quality Check";
																										if (Nc.getPriority().equals("10")) {
																								%>
																							<tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%> "><%=Nc.getCaseid()%></a></TD>
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
	
																							</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Packaging
																						Correction</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : FQClist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("PCKCOR")) {
																										stage = "Packaging Correction";
																										if (Nc.getPriority().equals("10")) {
																								%><tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								<%--   <TD><a href="NewCasesshow1?caseId=<%=  Nc.getCaseid()%>&page=newcase"><%=  Nc.getCaseid() %></a></TD> --%>
																								<TD><a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%> "><%=Nc.getCaseid()%></a></TD>
	
																								<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																								<TD><%=Nc.getCdoctorname()%></TD>
																								<TD><%=Nc.getPatient_Name()%></td>
																								<TD><%=Nc.getType_request()%></TD>
	
																								<TD><%=stage%></TD>
																								<TD><%=crm%></TD>
																								<TD><%=Nc.getUser_id()%></TD>
																								<TD><%=Nc.getStage_at()%></TD>
																								</tr>
																								<%
																								}
																								}
																								%>
																							
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
																			<%
																				}
																				%>
	
																			<!-- ////// Right DPH-->
	
																			<%
																				if (userRight.contains("DPH")) {
																				%>
																			<div class="ac">
																				<h2 class="ac-header clr">
																					<button class="ac-trigger">Packaging</button>
																				</h2>
																				<div class="ac-panel">
																					<p class="ac-text">
																					
																				<table role="grid" id="example"
																					class="table table-bordered table-striped table-hover dataTable">
																						<thead style="background: black; color: white;">
																							<tr role="row">
																								<th class="sorting">CASE_ID</th>
																								<th class="sorting">DOCTOR NAME</th>
																								<th class="sorting">PATIENT NAME</th>
																								<th class="sorting">TYPE OF REQUEST</th>
	
																								<th class="sorting">LAST STAGE</th>
																								<th class="sorting">CRM NAME</th>
																								<th class="sorting">LAST USER</th>
																								<th class="sorting">DATE</th>
																							</tr>
																						</thead>
																						<tbody>
	
																							<%
																								for (Newcase1 Nc : DPHlist) {
																									String crm = Nc.getCrm();
																									String stage = Nc.getCase_stage();

																									if (crm == null) {
																										crm = "";
																									} else {
																										crm = Nc.getCrm();
																									}

																									if (stage.equals("PCK")) {
																										stage = "Packaging";
																										if (Nc.getPriority().equals("10")) {
																								%><tr class="even invalid" role="row">
																									<%
																									} else {
																									%>
																									
																									
																						<tr class="even" role="row">
																									<%
																									}
																									%>
																								
																								
																								<TD>
                                                         										 	  <%
                                                         										 	  if (Nc.getCdoctorname() == null || Nc.getCdoctorname().trim().isEmpty()) {
                                                         										 	  %>
        	                             														<a
        	                             														
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getRdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%>
																								
																								</a>
   																								  <%

   																								  } else {
   																								  %>
       																					         <a
																								href="Multifrm?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a>
   																						              <%

   																						              }
   																						              %>
 																						       </TD>
																							<TD>
																								<%
																								if (Nc.getCdoctorname() == null || Nc.getCdoctorname().trim().isEmpty()) {
																								%> <%=Nc.getRdoctorname()%> <%
 } else {
 %> <%=Nc.getCdoctorname()%> <%
 }
 %>
																							</TD>
																							<TD><%=Nc.getPatient_Name()%></td>
																							<TD><%=Nc.getType_request()%></TD>
																							<TD><%=stage%></TD>
																							<TD><%=crm%></TD>
																							<TD><%=Nc.getUser_id()%></TD>
																							<TD><%=Nc.getStage_at()%></TD>
																						</tr>
																							<%
																							}
																							}
																							%>
																						</tbody>
																					</table>
																					</p>
																				</div>
																			</div>
	
	
	
	
																			<%
																							}
																							%>
	

<!-- start repeat -->
<style>
.table_wrapper {
	display: block;
	overflow-x: auto;
	white-space: nowrap;
}

.btn-secondary {
	color: #fff;
	background-color: #545b62;
	border-color: #4e555b;
}

.inpt-control {
	width: 108px !important;
}
</style>
	<%
	if (userRight.contains("WFC") || userRight.contains("OTPLN") || userRight.contains("3DP") || userRight.contains("Lab")
			|| userRight.contains("FQC") || userRight.contains("PCK") || userRight.contains("DPH")) {
	%>
	
<div class="ac">
<h2 class="ac-header clr">
	<button class="ac-trigger">Repeat cases</button>
</h2>
<div class="ac-panel">
	<p class="ac-text">
	
																				<div class="table_wrapper">
		<table id="example" class="table table-bordered">
			<thead style="background: black; color: white; width: 100%;">
				<tr>
					<th class="sorting" width="40" title="Case Id">Case Id</th>
					<th class="sorting" width="200" title="Doctor Name">Doctor Name</th>
					<th class="sorting" width="200" title="Patient Name">Patient Name</th>
					<th class="sorting" width="350">Issue</th>
					 <th class="sorting" width="100">Photos</th>
					 <%
					 if (userRight.contains("OTPLN") || userRight.contains("Lab") || userRight.contains("3DP") || userRight.contains("FQC")
					 		|| userRight.contains("PCK") || userRight.contains("DPH")) {
					 %>
					
					 <%
										 }
										 %>
					
					  <%
										  if (userRight.contains("WFC")) {
										  %>
					 <th class="sorting" width="200">Upper Aligner</th>
					 <th class="sorting" width="200">Lower Aligner</th>
					 <th class="sorting" width="200"
																									title="Workflow check user Remarks">WFC Remarks</th>					 
					 <th class="sorting" width="200">Decision</th>
					 <%
					 }
					 %>	
				</tr>
			</thead>
			<tbody>
			<%
			if (userRight.contains("WFC")) {
			%>
				 <tr class="even" role="row">
					<TD>
					<input type="text" class="form-control" id="rptcaseidwfc"
																									minlength="10" maxlength="10" pattern="[0-9]+"
																									onkeypress="return event.charCode > 47 && event.charCode < 58;">
						
					</TD>
					<TD><input type="text" class="form-control" id="rptdoctorwfc"
																									readonly>
					</TD>
					
					<TD><input type="text" class="form-control" id="rptpatientwfc"
																									readonly></td>
					<TD><select class="form-select form-control" id="rptissuewfc"
																									required>
							<option value="0">Select</option>
							<%
							for (Newcase1 issue : issueList) {
							%>
							<option value="<%=issue.getIssueid()%>">
								<%=issue.getIssuename()%></option>
							<%
							}
							%>
					</select></td>					
					<TD align="center">
					 <input type="radio" class="l" id="rptphotoywfc" name="rptphotowfc"
																									value="yes" minlength="1" maxlength="2"> Yes
					 <input type="radio" class="" id="rptphotonwfc" name="rptphotowfc"
																									value="no" minlength="1" maxlength="2" checked> No
			
					 </TD>
 					<TD><input type="text" class="form-control"
																									id="rptupper_alignerwfc" maxlength="30"
																									onkeypress="return RestrictCommaSemicolon(event);"></TD>	
 					<TD><input type="text" class="form-control"
																									id="rptlower_alignerwfc" maxlength="30"
																									onkeypress="return RestrictCommaSemicolon(event);"></TD>	
 					 <TD><input type="text" class="form-control"
																									id="rptremarkswfc" required maxlength="200"></TD>	
				   	<td><button type="button" class="btn btn-primary"
																										id="rptstagewfc" value="RPTWFC">Send To Planning</button>
					</TD>
				</tr>  
				<!-- start 2 -->
			<%
			} else {

			if (userRight.contains("OTPLN")) {

				if (rptWFC.size() == 0) {
			%>
					<tr class="even" role="row">
						<TD colspan="14" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptWFC) {

			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();

			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String photos = Nc.getPhotos();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String rptcrm_name = Nc.getCrm();

			String issueName = null;
			String sheetName = null;

			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();

			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();

			String no_of_rpt = Nc.getNo_of_rpt();
			String malocclusion = Nc.getMalocclusion();
			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
			for (Newcase1 sheet : sheetList) {
				if (sheet.getSheetId().equals(sheetId)) {
			sheetName = sheet.getSheetname();
				}
			}
		%>
			<tr class="even" role="row">
		<%-- <%
    String originalUrl = "https://www.example.com/page?param1=value1&param2=value2";
	String rep = "RepeatCasefrm.jsp?caseId=" + Nc.getCaseid() + "&cdoc= " + cdoctor_name + "&patient_Name=" + patient_name + "&stage=OTPLN&preuasheet="+pre_ua_sheet+
			     "&preut="+pre_u_thichness+"&prelasheet="+pre_la_sheet+"&prelt="+pre_l_thichness+
                 "&nowuasheet="+new_ua_sheet+"&nowut="+new_u_thichness+"&nowlasheet="+new_la_sheet+"&nowlt="+new_l_thichness+"&mal="
                 +malocclusion+"&plnremrks="+remarks+"&upper_aligner="+upper_aligner+"&lower_aligner="+lower_aligner+"&wfcremrks="
                 +wfc_remarks+"&no_of_rpt="+no_of_rpt+"&issueName="+issueName+"&crm_name="+rptcrm_name;  
		
		
    String encodedUrl = "";
    
    try {
        encodedUrl = URLEncoder.encode(rep, "UTF-8");
    } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
    }
	System.out.println("encodedUrl = " + encodedUrl);

%> --%>
					<%-- <%-- <TD><%=Nc.getCaseid()%></TD> --%>
<td><a
href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=OTPLN&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a></td>
					 
					
					
					<TD><%=cdoctor_name%></TD>
					<TD><%=patient_name%></td>
					<TD>
							<%
							for (Newcase1 issue : issueList) {
								String issueid = issue.getIssueid();
								if (issueId.equals(issueid)) {
							%>
								<%=issueName%>
								<%
								}
								}
								%>
					</select>
																								</td>						
						<TD align="center">
						<%
						if (photos.equals("yes")) {
						%>
							Yes
							 <%
						} else {
						%>
		  			     	No
		  			   <%
						}
						%>
		  			    </TD>
		  			  <%--   <TD><%=wfc_remarks %></TD> --%>
		  			   
				</tr>
				<%
				}
				}
				}
				%> <!-- pln  -->
					<%
					if (userRight.contains("3DP")) {
						if (rpt3DP.size() == 0){
					%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rpt3DP) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String no_of_rpt = Nc.getNo_of_rpt();

			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
					
<%-- 				   <td><a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name %>&patient_Name=<%=patient_name %>&stage=RPTTDP"><%=Nc.getCaseid()%></a>
 --%>				   
				   <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=RPTTDP&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a></td>
					
				   <input type="hidden" class="form-control" name="userid"
																									id="userid"
																									value="<%=request.getAttribute("username")%>">
					<input type="hidden" class="form-control"
																									id="correction<%=Nc.getCaseid()%>" value="yes">
					</td>
					
					<TD><%=cdoctor_name%></TD>
					<TD><%=patient_name%></td>
					
					<TD>
																									<%
																									for (Newcase1 issue : issueList) {
																										String issueid = issue.getIssueid();
																										if (issueId.equals(issueid)) {
																									%>
								<%=issueName%>
								<%
								}
								}
								%></td>						
						
						 <TD align="center">
						<%
						if (photos.equals("yes")) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
		  			    </TD>
		  			    <%-- <TD align="center"><%=wfc_remarks %></TD>
		  			    <TD align="center"><%=remarks %></TD>  		 --%>
				</tr>
				<%
				}
				}
				}
				%> 
								
				<%
 												if (userRight.contains("Lab")) {

 													if (rptPLN.size() == 0) {
 												%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptPLN) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();

			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();
			String no_of_rpt = Nc.getNo_of_rpt();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
 		<%-- 			<td><a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&stage=Lab&"><%=Nc.getCaseid()%></a>
 					<input type="hidden" class="form-control"  name="userid" id="userid" value="<%=request.getAttribute("username")%>"></td>
					 --%>
					 
					 <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=Lab&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a></td>
					
					<TD><%=cdoctor_name%></TD>
					<TD><%=patient_name%></td>
					<TD>
																									<%
																									for (Newcase1 issue : issueList) {
																										String issueid = issue.getIssueid();
																										if (issueId.equals(issueid)) {
																									%>
								<%=issueName%>
								<%
								}
								}
								%></td>						
						
						 <TD align="center">
						<%
						if (photos.equals("yes")) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
		  			    </TD>
		  			   <%--  <TD align="center"><%=wfc_remarks %></TD>
		  			    <TD align="center"><%=remarks %></TD>  	 --%>	
				</tr>
				<%
				}
				}
				}
				%> 
			
			<!-- end LAB  -->

<%
if (userRight.contains("FQC")) {

	if (rptLAB.size() == 0) {
%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptLAB) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();

			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();

			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();
			String no_of_rpt = Nc.getNo_of_rpt();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
			<%--  <td>
									    <a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&stage=RPTFQC"><%=Nc.getCaseid()%></a>
									    <input type="hidden" class="form-control" name="userid" id="userid" value="<%=request.getAttribute("username")%>">
								</td> --%>
								
												   <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=RPTFQC&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a>
	    <input type="hidden" class="form-control" name="userid" id="userid"
																									value="<%=request.getAttribute("username")%>">
								</td>
				
					
					
					<TD><%=cdoctor_name%></TD>
					<TD><%=patient_name%></td>
					<TD>
																									<%
																									for (Newcase1 issue : issueList) {
																										String issueid = issue.getIssueid();
																										if (issueId.equals(issueid)) {
																									%>
								<%=issueName%>
								<%
								}
								}
								%></td>						
						
						 <TD align="center">
						<%
						if (photos.equals("yes")) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
		  			    </TD>
		  			    <%-- <TD align="center"><%=wfc_remarks %></TD>
		  			    <TD align="center"><%=remarks %></TD>  --%>
		  		</tr>
				<%
				}
				}
				}
				%>
			<!-- end FQC -->
				
																			
				
<%
																											if (userRight.contains("PCK")) {

																												if (rptFQC.size() == 0) {
																											%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptFQC) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();

			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();
			String no_of_rpt = Nc.getNo_of_rpt();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();
			String rptcrm_name = Nc.getCrm();
			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
					
						<%--  <td><a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&stage=RPTPCK"><%=Nc.getCaseid()%></a>
						 <input type="hidden" class="form-control" name="userid" id="userid" value="<%=request.getAttribute("username")%>"></td>
					 --%>
									   <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=RPTPCK&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a>
<input type="hidden" class="form-control" name="userid" id="userid"
																									value="<%=request.getAttribute("username")%>"></td>
				
					<TD><%=cdoctor_name%></TD>
					<TD><%=patient_name%></td>
					<TD>
																									<%
																									for (Newcase1 issue : issueList) {
																										String issueid = issue.getIssueid();
																										if (issueId.equals(issueid)) {
																									%>
								<%=issueName%>
								<%
								}
								}
								%></td>						
						
						 <TD align="center">
						<%
						if (photos.equals("yes")) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
		  			    </TD>
		  			    <%-- <TD align="center"><%=wfc_remarks %></TD>
		  			    <TD align="center"><%=remarks %></TD>  --%>
		  		
				</tr>
				<%
				}
				}
				}
				%>
			<!-- end PCK -->
				
<%
				if (userRight.contains("DPH")) {

					if (rptPCK.size() == 0) {
				%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptPCK) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();
			String no_of_rpt = Nc.getNo_of_rpt();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
				<%-- 	<td><a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&stage=RPTDPH"><%=Nc.getCaseid()%></a>
					<input type="hidden" class="form-control" name="userid" id="userid" value="<%=request.getAttribute("username")%>">
					</td> --%>
					
	<%-- 								   <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=RPTDPH&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a>
<input type="hidden" class="form-control" name="userid" id="userid"
																									value="<%=request.getAttribute("username")%>">
					</td> --%>
					
					<TD>
                                                         										 	  <%
                                                         										 	  if (Nc.getCdoctorname() == null || Nc.getCdoctorname().trim().isEmpty()) {
                                                         										 	  %>
        	                             														<a
        	                             														
																								
																								href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=RegDr%>
&patient_Name=<%=patient_name%>&stage=RPTDPH&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%>


																								</a>
   																								  <%

   																								  } else {
   																								  %>
       																					         <a

																							href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=RPTDPH&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%>
																								</a>
   																						              <%

   																						              }
   																						              %>
 																						       </TD>
				
					
					<%-- <TD><%=cdoctor_name%></TD> --%>
					<TD>
                                                         										 	  <%
                                                         										 	  if (Nc.getCdoctorname() == null || Nc.getCdoctorname().trim().isEmpty()) {
                                                         										 	  %>
																										<%=RegDr%>
   																								  <%

   																								  } else {
   																								  %>
       																					        <%=cdoctor_name%>
   																						              <%

   																						              }
   																						              %>
 																						       </TD>
					<TD><%=patient_name%></td>
					<TD>
																									<%
																									for (Newcase1 issue : issueList) {
																										String issueid = issue.getIssueid();
																										if (issueId.equals(issueid)) {
																									%>
								<%=issueName%>
								<%
								}
								}
								%></td>						
						
						 <TD align="center">
						<%
						if (photos.equals("yes")) {
						%>Yes<%
						} else {
						%>No<%
						}
						%>
		  			    </TD>
		  			   <%--  <TD align="center"><%=wfc_remarks %></TD>
		  			    <TD align="center"><%=remarks %></TD> 	 --%>	  			   
				</tr>
				<%
				}
				}
				}
				%>
			<!-- end DPH -->
			
			<%
						}
						%><!-- end else -->
																							<!-- end else -->
		    <!-- end 2 -->
				</tbody>
			</table>
		</div>
	</div>
</div> 

<!-- Start RPTWFCCOR -->
<%
if (userRight.contains("WFC")) {
%>

<div class="ac">
<h2 class="ac-header clr">
	<button class="ac-trigger">Repeat cases Correction</button>
</h2>
<div class="ac-panel">
	<p class="ac-text">
	
																				<div class="table_wrapper">
		<table id="example" class="table table-bordered">
			<thead style="background: black; color: white; width: 100%;">
				<tr>
					<th class="sorting" width="200" title="Case Id">Case Id</th>
					<th class="sorting" width="200" title="Doctor Name">Doctor Name</th>
					<th class="sorting" width="200" title="Patient Name">Patient Name</th>
					<th class="sorting" width="350">Issue</th>
					 <th class="sorting" width="300">Photos</th>
					 <th class="sorting" width="300">Upper Aligner</th>
					 <th class="sorting" width="300">Lower Aligner</th>
					 
					  <th class="sorting" width="200"
																									title="Workflow check user Remarks">Work Flow Check Remarks</th>
					 <th class="sorting" width="200"
																									title="Workflow check user Remarks">Planning Remarks</th>
				  	 <th class="sorting" width="200" title="Sheet"> Decision </th>
					 	
				</tr>
			</thead>
			<tbody>
			

			<%
						if (rptWFCCOR.size() == 0) {
						%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rptWFCCOR) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();

			String no_of_rpt = Nc.getNo_of_rpt();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
					
					<td><%=Nc.getCaseid()%>
					<input type="hidden" class="form-control"
																									id="useridcor<%=Nc.getCaseid()%>"
																									value="<%=request.getAttribute("username")%>">
					<input type="hidden" class="form-control"
																									id="correctioncor<%=Nc.getCaseid()%>"
																									value="yes">
					</td> 
					<td><input type="text" class="form-control"
																									id="rptdoctorwfccor<%=Nc.getCaseid()%>"
																									readonly value="<%=cdoctor_name%>"></td>
					<td><input type="text" class="form-control"
																									id="rptpatientwfccor<%=Nc.getCaseid()%>"
																									readonly value="<%=patient_name%>"></td>					
				    <TD><select class="form-select form-control"
																									id="rptissuecor<%=Nc.getCaseid()%>" required>
						<option value="0">Select</option>
						<%
						for (Newcase1 issue : issueList) {
							String issueid = issue.getIssueid();
							if (issueId.equals(issueid)) {
						%>
							<option selected value="<%=issueId%>"><%=issueName%></option>
							<%
							} else {
							%>
							<option value="<%=issue.getIssueid()%>"><%=issue.getIssuename()%></option>
					 <%
					 }
					 }
					 %>
					<td align="center">
					<%
					if (photos.equals("yes")) {
					%>
					 <input type="radio" class="l" checked
																											id="rptphotowfccor<%=Nc.getCaseid()%>"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="yes" minlength="1" maxlength="2"> Yes
					 <input type="radio" class="l"
																											id="rptphotonwfccor<%=Nc.getCaseid()%>"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="no" minlength="1" maxlength="2"> No
					 <%
					 } else {
					 %>
					 <input type="radio" class="l"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="yes" minlength="1" maxlength="2"> Yes
					 <input type="radio" class="" checked
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="no" minlength="1" maxlength="2"> No
					 <%
					 }
					 %>
																									</td>
					 <td><input type="text" class="form-control"
																											id="rptupper_alignercor<%=Nc.getCaseid()%>"
																											maxlength="30"></td>
					 <td><input type="text" class="form-control"
																											id="rptlower_alignercor<%=Nc.getCaseid()%>"
																											maxlength="30"></td>
					 
					  <td><input type="text" class="form-control"
																											id="rptremarkswfccor<%=Nc.getCaseid()%>"
																											required="" value="<%=wfc_remarks%>"></td>	 					 						 
		  			     <TD align="center">
		  			     <input type="text" class="form-control" readonly
																											value="<%=remarks%>">
																									</TD> 	
		  			     	  	<TD align="center"><button type="button"
																												class="btn btn-primary"
																												id="case_stagecor<%=Nc.getCaseid()%>"
																												value='RPTWFC'
																												onclick="repeatWfccor(<%=Nc.getCaseid()%>)">Submit</button></TD>   		
		  			     	  			  
				
																							</tr>
				<%
				}
				}
				%>
			</tbody>
			</table>
			</div>
			</div>
			</div>
			<%
			}
			%>
<!-- End RPTCOR -->

<!-- Start RPTTDP -->
<%
if (userRight.contains("Lab")) {
%>

<div class="ac">
<h2 class="ac-header clr">
	<button class="ac-trigger">3DP Repeat cases</button>
</h2>
<div class="ac-panel">
	<p class="ac-text">
	
																				<div class="table_wrapper">
		<table id="example" class="table table-bordered">
			<thead style="background: black; color: white; width: 100%;">
				<tr>
					<th class="sorting" width="200" title="Case Id">Case Id</th>
					<th class="sorting" width="200" title="Doctor Name">Doctor Name</th>
					<th class="sorting" width="200" title="Patient Name">Patient Name</th>
					<th class="sorting" width="350">Issue</th>
					 <th class="sorting" width="300">Photos</th>
					  <th class="sorting" width="200"
																									title="Workflow check user Remarks">Work Flow Check Remarks</th>
					 <th class="sorting" width="200"
																									title="Workflow check user Remarks">Planning Remarks</th>
					 					 	
				</tr>
			</thead>
			<tbody>

			<%
			if (rpt3DP1.size() == 0) {
			%>
					<tr class="even" role="row">
						<TD colspan="17" align="center"><strong>No data found!</TD>
																							</tr>
		<%
		} else {
		for (Newcase1 Nc : rpt3DP1) {
			String issueId = Nc.getIssueid();
			String sheetId = Nc.getSheetId();
			String patient_name = Nc.getPatient_Name();
			String cdoctor_name = Nc.getCdoctorname();
			String RegDr = Nc.getRdoctorname();
			String remarks = Nc.getRemark();
			String wfc_remarks = Nc.getWfc_remarks();
			String upper_aligner = Nc.getUpper_aligner();
			String lower_aligner = Nc.getLower_aligner();
			String pre_ua_sheet = Nc.getPre_ua_sheet();
			String pre_u_thichness = Nc.getPre_u_thichness();
			String rptcrm_name = Nc.getCrm();
			String pre_la_sheet = Nc.getPre_la_sheet();
			String pre_l_thichness = Nc.getPre_l_thichness();
			String no_of_rpt = Nc.getNo_of_rpt();

			String new_ua_sheet = Nc.getNew_ua_sheet();
			String new_u_thichness = Nc.getNew_u_thichness();

			String new_la_sheet = Nc.getNew_la_sheet();
			String new_l_thichness = Nc.getNew_l_thichness();

			String photos = Nc.getPhotos();
			String malocclusion = Nc.getMalocclusion();

			String issueName = null;
			String sheetName = null;

			if (patient_name == null)
				patient_name = "";
			if (cdoctor_name == null)
				cdoctor_name = "";
			if (RegDr == null)
				RegDr = "";
			if (remarks == null)
				remarks = "";

			if (wfc_remarks == null)
				wfc_remarks = "";

			for (Newcase1 issue : issueList) {
				if (issue.getIssueid().equals(issueId)) {
			issueName = issue.getIssuename();
				}
			}
		%>
			<tr class="even" role="row">
			<%-- <td><a href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&stage=Lab"><%=Nc.getCaseid()%></a></td>
			 --%>
							   <td><a
																									href="RepeatCasefrm.jsp?caseId=<%=Nc.getCaseid()%>&cdoc=<%=cdoctor_name%>
&patient_Name=<%=patient_name%>&stage=Lab&preuasheet=<%=pre_ua_sheet%>
&preut=<%=pre_u_thichness%>&prelasheet=<%=pre_la_sheet%>&prelt=<%=pre_l_thichness%>
&nowuasheet=<%=new_ua_sheet%>&nowut=<%=new_u_thichness%>&nowlasheet=<%=new_la_sheet%>
&nowlt=<%=new_l_thichness%>&mal=<%=malocclusion%>&plnremrks=<%=remarks%>
&upper_aligner=<%=upper_aligner%>&lower_aligner=<%=lower_aligner%>&wfcremrks=<%=wfc_remarks%>&no_of_rpt=<%=no_of_rpt%>&issueName=<%=issueName%>&crm_name=<%=rptcrm_name%>"><%=Nc.getCaseid()%></a></td>
				
					
					<td><input type="text" class="form-control"
																									id="rptdoctorwfccor<%=Nc.getCaseid()%>"
																									readonly value="<%=cdoctor_name%>"></td>
					<td><input type="text" class="form-control"
																									id="rptpatientwfccor<%=Nc.getCaseid()%>"
																									readonly value="<%=patient_name%>"></td>					
				    <TD><select class="form-select form-control"
																									id="rptissuecor<%=Nc.getCaseid()%>" required>
						<option value="0">Select</option>
						<%
						for (Newcase1 issue : issueList) {
							String issueid = issue.getIssueid();
							if (issueId.equals(issueid)) {
						%>
							<option selected value="<%=issueId%>"><%=issueName%></option>
							<%
							} else {
							%>
							<option value="<%=issue.getIssueid()%>"><%=issue.getIssuename()%></option>
					 <%
					 }
					 }
					 %>
					<td align="center">
					<%
					if (photos.equals("yes")) {
					%>
					 <input type="radio" class="l" checked
																											id="rptphotowfccor<%=Nc.getCaseid()%>"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="yes" minlength="1" maxlength="2"> Yes
					 <input type="radio" class="l"
																											id="rptphotonwfccor<%=Nc.getCaseid()%>"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="no" minlength="1" maxlength="2"> No
					 <%
					 } else {
					 %>
					 <input type="radio" class="l"
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="yes" minlength="1" maxlength="2"> Yes
					 <input type="radio" class="" checked
																											name="rptphotowfccor<%=Nc.getCaseid()%>"
																											value="no" minlength="1" maxlength="2"> No
					 <%
					 }
					 %>
																									</td>
					  <td><input type="text" class="form-control" readonly
																											id="rptremarkswfccor<%=Nc.getCaseid()%>"
																											required="" value="<%=wfc_remarks%>"></td>	 					 						 
		  			     <TD align="center">
		  			     <input type="text" class="form-control" readonly
																											value="<%=remarks%>">
																									</TD> 		  			  
		  			    
<%-- 		  				<TD align="center"><button type="button" class="btn btn-primary" id="case_stagecor<%=Nc.getCaseid()%>" value='RPTWFC' onclick="repeatWfccor(<%=Nc.getCaseid()%>)">Submit</button></TD>   		
 --%>				
																							</tr>
				<%
				}
				}
				%>
			</tbody>
			</table>
			</div>
			</div>
			</div>
			<%
			}
			%>
			
			
			<!-- Start LAB3dp -->



<%
}
%>
	
                               
                       <% if (userRight.contains("Lab") ) { %>
    <div class="row text-center">
        <h1>LAB Impression</h1>
    </div>
    <div class="table-responsive">
        <table role="grid" id="ImpressionsTable" class="table table-bordered table-striped table-hover dataTable">
            <thead style="background: black; color: white;">
                <tr>
                    <th class="sorting">Impression ID</th>
                    <th class="sorting">Case Id</th>
                    <th class="sorting">Patient Name</th>
                    <th class="sorting">Doctor Name</th>
                    <th class="sorting">CRM Name</th>  
                    <th class="sorting">Case Type</th>                           
                    <th class="sorting">Impression Received Date</th>
                    <th class="sorting">Updated By</th>                    
                    <th class="sorting">Action</th>  
                      
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    con = LoginDAO.getConnectionDetails();
                    String sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date,impression_user,decision FROM impression WHERE decision = 'Impression_INI'";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                    	  String caseId = rs.getString("case_id");
                          if (caseId == null || caseId.trim().isEmpty()) {
                              caseId = ""; // Set empty string if case_id is null or empty
                          }
                    
                %>
                    <tr>
                        <td><%= rs.getLong("impression_id") %></td>
                         <td><%= caseId %></td>
                        <td><%= rs.getString("patient_name") %></td>
                        <td><%= rs.getString("doctor_name") %></td>
                        <td><%= rs.getString("crm_name") %></td>
                        <td><%= rs.getString("caseType") %></td>                                              
                        <td><%= rs.getString("impression_received_date") %></td>
                        <td><%= rs.getString("impression_user") %></td> 
                        <td>
                            <form action="ImpressionProcess" method="post" class="form-horizontal" onsubmit="handleFormSubmission(event)">
                                <input id="impression_id" type="hidden" name="impression_id" value="<%= rs.getLong("impression_id") %>">
                                <input id="decision" type="hidden" name="decision" value="Impression_LAB">
                                <button type="submit"  value="approve" class="btn btn-primary btn-sm">Accept</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } 
                %>
            </tbody>
        </table>
    </div>
<% } %>  

<% if (userRight.contains("CADBS")) { %>
    <div class="row text-center">
        <h1>CADBS Impression</h1>
    </div>
    <div class="table-responsive">
        <table role="grid" id="example" class="table table-bordered table-striped table-hover dataTable">
            <thead style="background: black; color: white;">
                <tr>
                    <th class="sorting">Impression ID</th>
                    <th class="sorting">Case Id</th>
                    <th class="sorting">Patient Name</th>
                    <th class="sorting">Doctor Name</th>
                    <th class="sorting">CRM Name</th>  
                    <th class="sorting">Case Type</th>                           
                    <th class="sorting">Impression Lab Date</th>
                    <th class="sorting">Updated By</th>
                    <th class="sorting">Action</th>  
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    con = LoginDAO.getConnectionDetails();
                    String sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType,impression_received_date,lab_user,decision FROM impression WHERE decision = 'Impression_LAB'";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                    	 String caseId = rs.getString("case_id");
                         if (caseId == null || caseId.trim().isEmpty()) {
                             caseId = ""; // Set empty string if case_id is null or empty
                         }
                    
                %>
                    <tr>
                       <td><%= rs.getLong("impression_id") %></td>
                        <td><%= caseId %></td>
                        <td><%= rs.getString("patient_name") %></td>
                        <td><%= rs.getString("doctor_name") %></td>
                        <td><%= rs.getString("crm_name") %></td>
                        <td><%= rs.getString("caseType") %></td>
                        <td><%= rs.getString("impression_received_date") %></td>
                        <td><%= rs.getString("lab_user") %></td>
                        <td>
                             <form action="ImpressionProcess" method="post" class="form-horizontal" onsubmit="handleFormSubmission(event)">
                                <input id="impression_id" type="hidden" name="impression_id" value="<%= rs.getLong("impression_id") %>">
                                <input id="decision" type="hidden" name="decision" value="Impression_Upl">
                                <button type="submit"  value="approve" class="btn btn-primary btn-sm">Accept</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } 
                %>
            </tbody>
        </table>
    </div>
<% } %>

<% if (userRight.contains("OTPLN") ) { %>
    <div class="row text-center">
        <h1>Planning Impression</h1>
    </div>
    <div class="table-responsive">
        <table role="grid" id="ImpressionsTable" class="table table-bordered table-striped table-hover dataTable">
            <thead style="background: black; color: white;">
                <tr>
                    <th class="sorting">Impression ID</th>
                    <th class="sorting">Case Id</th>
                    <th class="sorting">Patient Name</th>
                    <th class="sorting">Doctor Name</th>
                    <th class="sorting">CRM Name</th>
                    <th class="sorting">Case Type</th>                           
                    <th class="sorting">Impression Upload Date</th>
                    <th class="sorting">Updated By</th>
                    <th class="sorting">Remarks</th>
                    <th class="sorting">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                try {
                    con = LoginDAO.getConnectionDetails();
                    String sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date, upl_user, decision, Updated_By FROM impression WHERE decision = 'Impression_Upl'";
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                    	
                    	 String caseId = rs.getString("case_id");
                         if (caseId == null || caseId.trim().isEmpty()) {
                             caseId = ""; // Set empty string if case_id is null or empty
                         }
                %>
                    <tr>
                        <td><%= rs.getLong("impression_id") %></td>
                        <td><%= caseId %></td>
                        <td><%= rs.getString("patient_name") %></td>
                        <td><%= rs.getString("doctor_name") %></td>
                        <td><%= rs.getString("crm_name") %></td>
                        <td><%= rs.getString("caseType") %></td>
                        <td><%= rs.getString("impression_received_date") %></td>
                        <td><%= rs.getString("upl_user") %></td>
                        <td>
                            <input type="text" id="mandatoryField<%= rs.getLong("impression_id") %>" name="remarks" class="form-control">
                        </td>
                        <td>
                            <form action="ImpressionProcess" method="post" class="form-horizontal" onsubmit="setRemarks('<%= rs.getLong("impression_id") %>', 'Accept')">
                                <input type="hidden" name="impression_id" value="<%= rs.getLong("impression_id") %>">
                                <input type="hidden" name="decision" value="Impression_Accept">
                                <input type="hidden" name="remarks" id="remarksAccept<%= rs.getLong("impression_id") %>">
                                <input type="hidden" name="Updated_By" value="<%= session.getAttribute("userid") %>">                               
                                <button type="submit" class="btn btn-primary btn-sm">Accept</button>
                            </form>
                            <form action="ImpressionProcess" method="post" class="form-horizontal" onsubmit="return validateAndSetRemarks('<%= rs.getLong("impression_id") %>')">
                                <input type="hidden" name="impression_id" value="<%= rs.getLong("impression_id") %>">
                                <input type="hidden" name="decision" value="Impression_Reject">
                                <input type="hidden" name="remarks" id="remarksReject<%= rs.getLong("impression_id") %>">
                                <input type="hidden" name="Updated_By" value="<%= session.getAttribute("userid") %>">                               
                                <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                            </form>
                        </td>
                    </tr>
                <% 
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } 
                %>
            </tbody>
        </table>
    </div>
<% } %>

<script>
function validateAndSetRemarks(impressionId) {
    var mandatoryField = document.getElementById("mandatoryField" + impressionId);
    var remarksField = document.getElementById("remarksReject" + impressionId);

    if (mandatoryField.value.trim() === "") {
        alert("Remarks are mandatory for rejection.");
        return false;
    }
    remarksField.value = mandatoryField.value;
    return true;
}

function setRemarks(impressionId, action) {
    var mandatoryField = document.getElementById("mandatoryField" + impressionId);
    var remarksField = document.getElementById("remarks" + action + impressionId);

    remarksField.value = mandatoryField.value;
}
</script>

<% if (userRight.contains("INI")) { %>    
    <div class="row text-center">
        <h1>Impressions List</h1>
    </div>
    <form method="get" id="searchForm" class="form-inline justify-content-end mb-8" style="display: flex; justify-content: flex-end;">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search" name="search_term" id="search_term" value="<%= request.getParameter("search_term") != null ? request.getParameter("search_term") : "" %>">
            &nbsp;
            <button type="submit" class="btn btn-warning" id="Search" style="display: none;">Search</button>
            <button type="button" class="btn btn-warning" id="clearSearch" style="display: none;">Clear</button>
        </div>
    </form>
    <br>
    <br>
    <div class="table-responsive">
        <table role="grid" id="impressions_table" class="table table-bordered table-striped table-hover dataTable">
            <thead style="background: black; color: white;">
                <tr>
                    <th class="sorting">Impression ID</th>
                    <th class="sorting">Case Id</th>
                    <th class="sorting">Patient Name</th>
                    <th class="sorting">Doctor Name</th>
                    <th class="sorting">CRM Name</th>
                    <th class="sorting">Case Type</th>
                    <th class="sorting">Impression Planned Date</th>
                    <th class="sorting">Last Decision</th>
                    <th class="sorting">Updated By</th>
                    <th class="sorting">Remarks</th>
                    <th class="sorting">Action</th>
                </tr>
            </thead>
            <tbody id="impressions_body">
                <% 
             
                try {
                    con = LoginDAO.getConnectionDetails();
                    String sql = "SELECT impression_id, case_id, patient_name, doctor_name, crm_name, caseType, impression_received_date, Updated_By, remarks, decision FROM impression WHERE decision = 'Impression_Accept' OR decision = 'Impression_Reject'";
                    
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                    	 String caseId = rs.getString("case_id");
                         if (caseId == null || caseId.trim().isEmpty()) {
                             caseId = ""; // Set empty string if case_id is null or empty
                         }	
                    
                %>
                <tr>
                    <td><%= rs.getLong("impression_id") %></td>
                    <td><%= caseId %></td>
                    <td><%= rs.getString("patient_name") %></td>
                    <td><%= rs.getString("doctor_name") %></td>
                    <td><%= rs.getString("crm_name") %></td>
                    <td><%= rs.getString("caseType") %></td>
                    <td><%= rs.getString("impression_received_date") %></td>
                    <td><%= rs.getString("decision") %></td> 
                    <td><%= rs.getString("Updated_By") %></td>
                    <td><%= rs.getString("remarks") %></td>
                    <td>
                        <form action="EditImpressionTable.jsp" method="get">
                            <input type="hidden" name="impression_id" value="<%= rs.getLong("impression_id") %>">
                            <button type="submit" class="btn btn-warning">Edit</button>
                        </form>
                    </td>
                </tr>
                <% 
                    } 
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } 
                %>
            </tbody>
        </table>
    </div>
    
    <script>
        document.getElementById("clearSearch").addEventListener("click", function() {
            document.getElementById("search_term").value = "";
            document.getElementById("searchForm").submit();
        });

        window.addEventListener("load", function() {
            if (!window.location.search.includes("search_term")) {
                document.getElementById("search_term").value = "";
            }
        });

        document.getElementById("search_term").addEventListener("input", function() {
            let input = document.getElementById("search_term").value.toLowerCase();
            let table = document.getElementById("impressions_table");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                let tdArray = tr[i].getElementsByTagName("td");
                let rowVisible = false;
                for (let td of tdArray) {
                    if (td) {
                        let txtValue = td.textContent || td.innerText;
                        if (txtValue.toLowerCase().includes(input)) {
                            rowVisible = true;
                            break;
                        }
                    }
                }
                tr[i].style.display = rowVisible ? "" : "none";
            }
        });
    </script>
<% } %>
 			
<script type="text/javascript">
    function submitDecision(decision) {
        document.getElementById('action').value = decision;
        document.forms[0].submit();
    }
</script>
		  <script type="text/javascript">
        function handleFormSubmission(event) {
            event.preventDefault(); // Prevent the default form submission

            // Display the alert
            alert("Submitted Successfully");

            // Manually submit the form after the alert
            event.target.submit();
        }
    </script>														<!-- end repeat -->	
																			
																		

													
													<%
 													if (userRight.contains("MPT") || userRight.contains("3DP") || userRight.contains("Lab") || userRight.contains("FQC")
 															|| userRight.contains("PCK") || userRight.contains("DPH")) {
 													%>
	
													<div class="row text-center">
														<h1>Starter Kit Cases</H1>
														</th>
													</div>
													<table id="myinvoice" class="table table-bordered">
	
														<tr>
															<td colspan="9">
																<div class="col-lg-12">
																	<div class="table-responsive">
																		<table role="grid" id="example"
																		class="table table-bordered table-striped table-hover dataTable">
																			<thead style="background: black; color: white;">
																				<tr role="row">
																					<th class="sorting">CASE_ID</th>
																					<!-- <th class="sorting">REGISTERED DOCTOR </th> -->
																					<th class="sorting">DOCTOR NAME</th>
																					<th class="sorting">PATIENT NAME</th>
																					<%
																					if (userRight.contains("MPT")) {
																					%>
																					<th class="sorting">DATE</th>
																					<%
																					}
																					%>
	
																					<%
																						if (userRight.contains("Lab") && userRight.contains("DPH")) {
																						%>
																					<th class="sorting">REMARK</th>
	
																					<%
																						} else {
																						}
																						%>
	
	
																					<%
																							if (userRight.contains("DPH")) {
																							%>
																					<%
																					} else {
																					%>
																					<th class="sorting">REMARK</th>
																					<th class="sorting">DECISION</th>
																					<%
																					}
																					%>
	
																					<th class="sorting">LAST STAGE</th>
																					<%
																					if (userRight.contains("DPH")) {
																					%>
																					<th class="sorting">ACTION</th>
																					<%
																					}
																					%>
	
																				</tr>
																			</thead>
																			<%
																			}
																			if (userRight.contains("MPT")) {
																			for (Newcase1 Nc : StageQueryForStarterList) {
																				String strkitstage = Nc.getStarter_case_stage();

																				String casedate = Nc.getCaseDate();

																				if (casedate == null) {
																					casedate = "";
																				} else {
																					casedate = Nc.getCaseDate();
																				}

																				if (strkitstage.equals("INISTRKIT")) {

																					strkitstage = "Starter kit Case Initiated";
																				}
																			%>
	
																			<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
																					<TD><%=casedate%></TD>
	
																					<TD><input type="text"
																					id="remark<%=Nc.getCaseid()%>"></TD>
																					<TD><%=strkitstage%></TD>
																					<TD><select class="btn btn-primary"
																					id="listid<%=Nc.getCaseid()%>"
																					onchange="changelist(<%=Nc.getCaseid()%>)">
																							<option value="0">Select Decision</option>
																							<option value="MTPSTRKIT">Starter Kit
																								Approved</option>
																							<option value="WFCCOR">Send Back to WFC</option>
	
																					</select></TD>
	
																				</tr>
																				<%
																				}

																				}
																				%>
																				
																				<div>		
																		
																				<%
																				if (userRight.contains("3DP")) {
																					for (Newcase1 Nc : MPTQueryForStarterList) {
																						String strkitstage = Nc.getStarter_case_stage();

																						if (strkitstage.equals("MTPSTRKIT")) {

																					strkitstage = "Starter Kit Hollow Tag";
																						}
																						if (strkitstage.equals("3DPSTRKITCOR")) {

																					strkitstage = "Starter Kit 3D Printing Correction";
																						}
																				%>
																			
																		<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
																					<%--   <TD> <%= Nc.getCase_stage() %></TD> --%>
																					<TD><input type="text"
																					id="remark<%=Nc.getCaseid()%>"></TD>
																					<TD><%=strkitstage%></TD>
																					<TD><select class="btn btn-primary"
																					id="listid<%=Nc.getCaseid()%>"
																					onchange="changelist(<%=Nc.getCaseid()%>)">
																							<option value="0">Select Decision</option>
																							<option value="3DPSTRKIT">Starter Kit
																								Approved</option>
	
																					</select></TD>
	
																				</tr>
																				<%
																				}

																				}
																				%>
																				<%
																				if (userRight.contains("Lab")) {
																					for (Newcase1 Nc : TDPQueryForStarterList) {
																						String strkitstage = Nc.getStarter_case_stage();

																						if (strkitstage.equals("3DPSTRKIT")) {

																					strkitstage = "Starter Kit 3D Printing";
																						}
																						if (strkitstage.equals("'LABSTRKITCOR'")) {

																					strkitstage = "Starter Kit LAB Correction";
																						}
																				%>
																			
																			
																		<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
																					<%--  <TD> <%= Nc.getCase_stage() %></TD> --%>
																					<TD><input type="text"
																					id="remark<%=Nc.getCaseid()%>"></TD>
																					<TD><a
																					href="http://192.168.0.64:8080/Registeration/Loginfetchedit?cid=<%=Nc.getCaseid()%>"
																					target="blank"><%=strkitstage%></a></TD>
																					<TD><select class="btn btn-primary"
																					id="listid<%=Nc.getCaseid()%>"
																					onchange="changelist(<%=Nc.getCaseid()%>)">
																							<option value="0">--Select Decision--</option>
																							<option value="LABSTRKIT">Starter Kit
																								Approved</option>
																							<option value="3DPSTRKITCOR">3D Print
																								Correction</option>
	
																					</select></TD>
	
	
																				</tr>
																				<%
																				}

																				}
																				%>
																				<%
																				if (userRight.contains("FQC")) {
																					for (Newcase1 Nc : LABQueryForStarterList) {
																						String strkitstage = Nc.getStarter_case_stage();

																						if (strkitstage.equals("LABSTRKIT")) {

																					strkitstage = "Starter Kit LAB";
																						}
																				%>
																			
																			
																		<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
																					<%--  <TD> <%= Nc.getCase_stage() %></TD> --%>
																					<TD><input type="text"
																					id="remark<%=Nc.getCaseid()%>"></TD>
																					<TD><%=strkitstage%></TD>
																					<TD><select id="listid<%=Nc.getCaseid()%>"
																					onchange="changelist(<%=Nc.getCaseid()%>)">
																							<option value="0">---Select Decision--</option>
																							<option value="FQCSTRKIT">Starter Kit
																								Approved</option>
																							<option value="LABSTRKITCOR">LAB
																								Correction</option>
																							<!--   <option value="3DPSTRKITCOR"> 3D Print Correction</option> -->
	
																					</select></TD>
	
																				</tr>
																				<%
																				}

																				}
																				%>
	
																				<%
																					if (userRight.contains("PCK")) {
																						for (Newcase1 Nc : FQCQueryForStarterList) {

																							String strkitstage = Nc.getStarter_case_stage();

																							if (strkitstage.equals("FQCSTRKIT")) {

																						strkitstage = "Starter Kit Finishing Quality Check";
																							}
																							if (strkitstage.equals("PCKSTRKITCOR")) {

																						strkitstage = "Starter Kit Packaging Correction";
																							}
																					%>
																			
																			
																		<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<%-- <TD> <%=Nc.getRdoctorname() %></td> --%>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
																					<%--   <TD> <%= Nc.getCase_stage() %></TD> --%>
																					<TD><input type="text"
																					id="remark<%=Nc.getCaseid()%>"></TD>
																					<TD><%=strkitstage%></TD>
																					<TD><select class="btn btn-primary"
																					id="listid<%=Nc.getCaseid()%>"
																					onchange="changelist(<%=Nc.getCaseid()%>)">
																							<option value="0">---Select Decision--</option>
																							<option value="PCKSTRKIT">Starter Kit
																								Approved</option>
	
																					</select></TD>
	
																				</tr>
																				<%
																				}

																				}
																				%>
																				<%
																				if (userRight.contains("DPH")) {
																					for (Newcase1 Nc : DPHQueryForStarterList) {
																						String strkitstage = Nc.getStarter_case_stage();

																						if (strkitstage.equals("PCKSTRKIT")) {

																					strkitstage = "Starter Kit Packaging";
																						}
																				%>
																			
																			
																		<tbody>
																				<tr class="even" role="row">
																					<TD><a
																					href="Approval?caseId=<%=Nc.getCaseid()%>&NxtStage=<%=Nc.getCase_stage()%>"><%=Nc.getCaseid()%></a></TD>
																					<TD><%=Nc.getCdoctorname()%></TD>
																					<TD><%=Nc.getPatient_Name()%></td>
	
																					<TD><%=strkitstage%></TD>
																					<TD><a
																					href="StarterKitDispatch?caseId=<%=Nc.getCaseid()%>&crm=<%=Nc.getCrm()%>&cdoc=<%=Nc.getCdoctorname()%>&patient_Name=<%=Nc.getPatient_Name()%>&stage=<%=Nc.getCase_stage()%>"
																					class="btn btn-primary">---Starter Kit
																							Dispatch---</a></TD>
	
																				</tr>
																				<%
																				}
																				}
																				%>
	
																			</tbody>
																		</table>
	
	
																	</div>
																</div>
	
																</div>
														
															
															
																</form> <!-- footer content --> <!-- /footer content -->
																</div> <!-- /page content -->
																
																
																
																
																 <script>
																 
																 
																 
																 
		function repeatlist(cid) {
			
			 var userId = $("#userid").val();		
		     var caseidId="rptcaseid"+cid;
			 var stageId="case_stage"+cid;
			 var rptcaseid = $("#"+caseidId).val();
			 var rptstage = $("#"+stageId).val();
			   	$.ajax({
				    type : 'GET',
					data : {caseId:rptcaseid,query:rptstage,userid:userId,case_stage:rptstage},
					url : 'RepeatCase',
					success : function(response) {
						alert(response);
						location.reload();
					}
				});  
		}
		
	   function changelist(x) {
		  var remarkId="remark"+x;
		 
		  var remark=document.getElementById(remarkId).value;
		  var listid="listid"+x;
		  var id=document.getElementById(listid).value;
		  
	    //var select = document.createElement("select");
	   //alert("select==="+id+ "||"+x);
	   console.log(id);
	if(id==='3DPSTRKITCOR' ||id==='LABSTRKITCOR'||id==='PCKSTRKITCOR' || id=='WFCCOR' ){
		
		if(remark===''||remark==null||remark=='undefind'){
			alert("Please fill the remark");
			document.getElementById(remarkId).style.borderColor = "#E34234";
			return false;			
		}
		//alert(id);
		$.ajax({
			
		    type : 'GET',
			//data : {caseid:x},
			url : 'StageChange?case_id='+x+'&case_stage='+id+'&remark='+remark,
			success : function(responseText) {
				
				var x=responseText;
				//alert(x);
				location.reload();
				
			}
		});
	
	}
	else if(id==='0'){
		alert("Please Select");

		
	}else{
	$.ajax({
			
		    type : 'GET',
			url : 'StageChange?case_id='+x+'&case_stage='+id+'&remark='+remark,
			success : function(responseText) {
				var x=responseText;
				//alert(x);
				location.reload();
				
			}
		});
	}
	     }
	
	   </script> <script>
	
	function startcase(x){
	
		$.ajax({
		    type : 'POST',
			data : {caseid:x},
			url : 'Startcase',
			success : function(responseText) {
				var x=responseText;
				alert(x);
				location.reload();
				
			}
	
		  
			 
		});
		
	}
	
		$("#rptcaseidwfc").blur(function(){
		let caseId = $("#rptcaseidwfc").val();
	  	$.ajax({
	    type : 'POST',
		data : {caseId:caseId,query:"getdata"},
		url : 'RepeatCase',
		success : function(response) {
			const myArray = response.split(",");
			let Patient_Name = myArray[0];
			let Doctor_Name = myArray[1];
			let crm_name = myArray[2];
			$('#rptdoctorwfc').val(myArray[1]);
			$('#rptpatientwfc').val(myArray[0]);
			$('#rptcrmwfc').val(myArray[2]);
			}, 
	        error: function( jqXhr, textStatus, errorThrown ){ 
	        console.log("errorThrown: " +errorThrown ); 
	       }
	});  
	});	
		
 		$("#rptstagewfc").click(function(){
 			
			var userId = $("#logusername").val();
			var rptcaseid = $("#rptcaseidwfc").val();
			var rptpatient = $("#rptpatientwfc").val();
			var rptdoctor = $("#rptdoctorwfc").val();
			var rptcrm = $("#rptcrmwfc").val();
			var rptissue = $("#rptissuewfc").val();
			var rptsheet = $("#rptsheetwfc").val();
			var rptremarks = $("#rptremarkswfc").val();
			
			var rpt_upper_aligner = $("#rptupper_alignerwfc").val();
			var rpt_lower_aligner = $("#rptlower_alignerwfc").val();
			
			var rptstage = $("#rptstagewfc").val();
			
			var rpt_photos = $('input[name="rptphotowfc"]:checked').val();		
			console.log("repeatcaseid: "+rptcaseid+" repeatpatient: "+rptpatient+" repeatdoctorName: "+rptdoctor+" repeatcrmName: "+rptcrm+" repeatissue: "+rptissue+" repeatsheet: "+rptsheet+" case_stage: "+rptstage+" remarks: "+rptremarks)
			if(rptcaseid==''){
				alert("Case ID is Required")
				return false;
			}
			if(rptissue=='0'){
				alert("Issue type is Required")
				return false;
			}
			if(rptsheet=='0' ){
				alert("Sheet type is Required")
				return false;
			}
			if(rptremarks=='' ){
				alert("Remarks is Required")
				return false;
			}
	  	$.ajax({
		    type : 'POST',
			data : {caseId:rptcaseid,patientName:rptpatient,doctorName:rptdoctor,remarks:rptremarks,query:"checkcaseid",userid:userId,sheet:rptsheet,issue:rptissue,case_stage:rptstage,photos:rpt_photos,upper_aligner:rpt_upper_aligner,lower_aligner:rpt_lower_aligner},
			url : 'RepeatCase',
			success : function(response) {
				alert(response);
				location.reload();
			}
		});  
		});
	  		
 		//wfccor
 		function repeatWfccor(cid) {
 			
			 var userId = $("#userid").val();		
			 var doctorId="rptdoctorwfccor"+cid;
			 var patientId="rptpatientwfccor"+cid;
			 var issueId="rptissuecor"+cid;
			 var remarksId="rptremarkswfccor"+cid;
			 var stageId="case_stagecor"+cid;
			 var correctionId="correctioncor"+cid;
			 
			 var upper_alignerId="rptupper_alignercor"+cid;
			 var lower_alignerId="rptlower_alignercor"+cid;
			 
			 var patientName = $("#"+patientId).val();
			 var doctorName = $("#"+doctorId).val();
			 var issue = $("#"+issueId).val();
			 var photos = $('input[name="rptphotowfccor'+cid+'"]:checked').val();		
			 var remarks = $("#"+remarksId).val();
			 var correction = $("#"+correctionId).val();
			 var case_stage = $("#"+stageId).val();
			 
			 var upper_aligner = $("#"+upper_alignerId).val();
			 var lower_aligner = $("#"+lower_alignerId).val();
			 			 
		 	   $.ajax({
				    type : 'POST',
					data : {caseId:cid,query:case_stage,userid:userId,case_stage:case_stage,patientName:patientName,doctorName:doctorName,issue:issue,photos:photos,remarks:remarks,correction:correction,upper_aligner:upper_aligner,lower_aligner:lower_aligner},
					url : 'RepeatCase',
					success : function(response) {
						alert(response);
						location.reload();
					}
				});  
		}
 		
 		//othercor
 		function repeatccor(cid) {
 			
			 var userId = $("#userid").val();		
			 var remarksId="rptremarkswfccor"+cid;
			 var stageId="case_stagecor"+cid;
			 var correctionId="correctioncor"+cid;
			 var upper_alignerId="rptupper_alignercor"+cid;
			 var lower_alignerId="rptlower_alignercor"+cid;

			 var remarks = $("#"+remarksId).val();
			 var correction = $("#"+correctionId).val();
			 var case_stage = $("#"+stageId).val();
			
			 var upper_aligner = $("#"+upper_alignerId).val();
			 var lower_aligner = $("#"+lower_alignerId).val();


		 	    $.ajax({
				    type : 'POST',
					data : {caseId:cid,query:case_stage,userid:userId,case_stage:case_stage,remarks:remarks,correction:correction,upper_alignerId:upper_alignerId,lower_aligner:lower_aligner},
					url : 'RepeatCase',
					success : function(response) {
						alert(response);
						location.reload();
					}
				}); 
		}
 	
 		 function RestrictCommaSemicolon(e) {
 	        var theEvent = e || window.event;
 	        var key = theEvent.keyCode || theEvent.which;
 	        key = String.fromCharCode(key);
 	        var regex = /[^,;]+$/;
 	        if (!regex.test(key)) {
 	            theEvent.returnValue = false;
 	            if (theEvent.preventDefault) {
 	                theEvent.preventDefault();
 	            }
 	        }
 	    }
	</script>
	 <script src="script/accordion.min.js"></script> <script>new Accordion('.accordion-container');</script>
	
	
	
	
	
</body>
	
	</html>
