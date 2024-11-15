
<%@page import="comm.CaseLock"%>
<%@page import="com.vo.DisplayDecision"%>

<%@ page import="java.sql.*"%>

<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.text.*"%>

<%@page import="java.math.*"%>
<%@page import="java.util.*"%>
<%@page import="com.workflow.connection.LoginDAO"%>
<%@page import="com.vo.Newcase1"%>
<%@page import="com.vo.AccountVo"%>
<%-- <%@page import="java.security.Timestamp"%> --%>
<%@page import="java.util.Date"%>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/Images/logo.png">

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
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/JavaScript/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/JavaScript/jquery.smartWizard.js"></script>

<script type="text/javascript"> var contextPath ='${pageContext.request.contextPath}';</script>
<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/general.js"></script>

<style>
.table>thead>tr>td {
	padding: 0px;
}

.panel-body {
	padding: 8px !important;
}

.loader {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url('${pageContext.request.contextPath}/Images/load.gif')
		50% 50% no-repeat rgb(249, 249, 249);
}

.left_col {
	width: 100%;
}

.btn-warning {
	margin-top: 0;
}

.table-bordered>thead>tr>th {
	font-size: 1.4rem;
	white-space: nowrap;
	padding: 5px;
}

@media only screen and (min-width: 1200px) {
	#wo_date {
		width: 197px;
	}
	#dispatch_date {
		width: 197px;
	}
	#scanning_service {
		width: 197px;
	}
	#A {
		padding-left: 21px;
	}
	#B {
		padding-left: 188px;
	}
	#c {
		padding: 5px;
	}
	#D {
		width: 800px;
		padding-left: 22px;
	}
}

.green-color {
	color: green;
}

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
<script>
function decisionFetch() {
	var caseid=document.getElementById("caseId").value;
	mywindow = window.open("DecisionDisplay.jsp?caseid="+caseid, "mywindow", "location=1,status=1,scrollbars=1,  width=1000,height=1000");
    mywindow.moveTo(0, 0);
}
</script>
<script>

 $(document).ready(function(){
	 $("#createSubmit").hide();
	 $("#secondform").hide();
	 $("#thirdform").hide();
	 $("#accountform").hide();
	 $("#sd").hide();
	 $("#productionform").hide();
	 $("#staggingform").hide();
     $("#3dprintingform").hide();
     $("#hollowtagform").hide();
     $("#addresslogsform").hide();
     $("#holdfrm").hide();
     $("#unholdfrm").hide();
     $("#billingHistoryForm").hide();
     $("#cadbsForm").hide();
     $("#rptForm").hide();

	 
	    $("#second").click(function(){
	    	 $("#createSubmit").show();
	    	 $("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").show();
	        $("#thirdform").hide();
		    $("#accountform").hide();
	    	$("#remarksdecision").show();
	        $("#staggingform").hide();
	        $("#3dprintingform").hide();
	        $("#hollowtagform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#production").click(function(){
	    	 $("#createSubmit").hide();
	    	 $("#productionform").show();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
		    $("#accountform").hide();
	    	$("#remarksdecision").show();
	        $("#staggingform").hide();
	        $("#3dprintingform").hide();
	        $("#hollowtagform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
 $("#billingHistoryForm").hide();
 $("#cadbsForm").hide();
 $("#rptForm").hide();

	    });
	    $("#first").click(function(){
	    	$("#createSubmit").hide();
	    	$("#productionform").hide();
	        $("#firstform").show();
	        $("#secondform").hide();
	        $("#thirdform").hide();
		    $("#accountform").hide();
	    	$("#remarksdecision").show();
	        $("#staggingform").hide();
	        $("#3dprintingform").hide();
	        $("#hollowtagform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	    });
	    $("#Third").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
		    $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#3dprintingform").hide();
	        $("#thirdform").show();
	        $("#hollowtagform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });	    
	    $("#account").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").show();
	        $("#staggingform").hide();
	        $("#3dprintingform").hide();
	        $("#hollowtagform").hide(); 
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	    });
	    $("#stagging").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#3dprintingform").hide();
	        $("#hollowtagform").hide();	    
	        $("#addresslogsform").hide();
	        $("#staggingform").show();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    ////////
	    $("#hollowtag").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").show();
	        $("#addresslogsform").hide();
	        $("#3dprintingform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#3dprinting").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#addresslogsform").hide();
	        $("#3dprintingform").show();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#addresslogsbtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide();
	        $("#addresslogsform").show();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#holdbtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide()
	        $("#unholdfrm").hide();
	        $("#holdfrm").show();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#unholdbtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").show();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").hide();	
	        $("#rptForm").hide();

	    });
	    $("#dispatchHistorybtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").show();
	        $("#cadbsForm").hide();
	        $("#rptForm").hide();

	    });
	    $("#cadbsbtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#rptForm").hide();
	        $("#cadbsForm").show();
	    });
	    
	    $("#rptbtn").click(function(){
	    	$("#remarksdecision").hide();
	    	$("#productionform").hide();
	        $("#firstform").hide();
	        $("#secondform").hide();
	        $("#thirdform").hide();
	        $("#accountform").hide();
	        $("#staggingform").hide();
	        $("#hollowtagform").hide();
	        $("#3dprintingform").hide();
	        $("#addresslogsform").hide();
	        $("#holdfrm").hide();
	        $("#unholdfrm").hide();
	        $("#billingHistoryForm").hide();
	        $("#cadbsForm").shide;
	        $("#rptForm").show();
	    });
	   ///////////////// 
	 });
	 $(".gif").click(function(){
	 	$(".loader").fadeIn("slow");
	 });

</script>

<style>
.green-color {
	color: green;
}
</style>

</head>

<body class="nav-md" id="InvoiceformBody"
	onkeydown="javascript:return customOnKeydown(this.id,event)">
	<%
	List<String> userRight = LoginDAO.getRight((String) session.getAttribute("userid"));
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

					<!-- /sidebar menu -->



					<!-- sidebar menu -->
					<%@ include file="SideBar.jsp"%>
					<!-- /sidebar menu -->



				</div>
			</div>

			<!-- top navigation -->
			<%@ include file="TopNavigation.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main" style="margin-top: -23px;">
				<div class="container" style="padding-top: 20px;">
				
					<div>
						<div id="sd">hello</div>

						<%
						//List<PlanningVO> list = (List)session.getAttribute("plnlist");
						List<DisplayDecision> displayDecisionList = new ArrayList<DisplayDecision>();
						con = null;
						ps = null;
						PreparedStatement ps1 = null;
						PreparedStatement ps2 = null;
						PreparedStatement ps3 = null;
						rs = null;
						rs1 = null;
                        String special_remark = "";
                        boolean isRemarkNull = true;
                        String caseId = request.getParameter("caseId");


						ResultSet rs3 = null;
						String caseLock = "Y";
						try {
							LoginDAO loginDAO = new LoginDAO();
							con = LoginDAO.getConnectionDetails();

							String Patient_Name = "";
							String registered_doctor = "";
							String clinic_Name = "";
							String priority = "";
							int planning_idcrm = 0;
							ResultSet rstop = null;
						   /*   String strUpper = "";
                             String strLower = "";
                             String strBoth = ""; */

							////////
							PreparedStatement pstop = con.prepareStatement("select * from cc_crm where case_id=?");
							pstop.setString(1, request.getParameter("caseId"));
							rstop = pstop.executeQuery();
							if (rstop.next()) {
								Patient_Name = rstop.getString("Patient_Name");
								registered_doctor = rstop.getString("registered_doctor");
								clinic_Name = rstop.getString("clinic_Name");
								priority = rstop.getString("priority");
								planning_idcrm = rstop.getInt("planning_id");
								if (registered_doctor == null) {
							registered_doctor = "";
								} else
							registered_doctor = rstop.getString("registered_doctor");
								if (priority == null) {
							priority = "";
								} else
							priority = rstop.getString("priority");
							}
							 String query = "SELECT special_remarks FROM wisealign_workflow.cc_crm WHERE case_id = ?";
                             ps = con.prepareStatement(query);
                             ps.setString(1, caseId);
                             rs = ps.executeQuery();
                             
                             if (rs.next()) {
                                 special_remark = rs.getString("special_remarks");
                                 isRemarkNull = (special_remark == null || special_remark.trim().isEmpty());
                             }
                        
                         
                             
                               /*   // Replace this query with your actual query to fetch the data
                                 String sql = "SELECT st_upper, st_lower, st_other FROM cc_crm WHERE case_id = ?"; // Add your condition here
                                  ps = con.prepareStatement(sql);
                                 ps.setString(1, request.getParameter("case_id")); // Assuming case_id is passed as a parameter
                                  rs = ps.executeQuery();

                                 if (rs.next()) {
                                     strUpper = rs.getString("st_upper");
                                     strLower = rs.getString("st_lower");
                                     strBoth = rs.getString("st_other");
                                 }
 */
                         

							////////

							ps = con.prepareStatement("select * from cc_crm where Case_Id=?");
							 caseId = request.getParameter("caseId");
							String currentstage = request.getParameter("stage");
							String nextStage = (String) request.getParameter("NxtStage");

							ps.setString(1, caseId);
							rs = ps.executeQuery();

							ps2 = con.prepareStatement(
							"select display_name from stage_decision_map a,decision_master b  where a.decs_code=b.decs_code and a.stage_id='"
									+ nextStage + "'");
							rs2 = ps2.executeQuery();

							ps1 = con.prepareStatement("select * from payment_grid where case_id=?");
							ps1.setString(1, caseId);

							rs1 = ps1.executeQuery();
							String payment_grid = "";
							String planninggrid = "";

							String val1 = "";
							String val2 = "";
							String val3 = "";
							String val4 = "";
							String val5 = "";
							while (rs1.next()) {

								val1 = rs1.getString("payment_amount");
								val2 = rs1.getString("payment_date");
								val3 = rs1.getString("pending_amount");
								if (val1.equals("null") || val1.equals(null)) {
							val1 = "";
								}
								if (val2.equals("null") || val2.equals(null)) {
							val2 = "";
								}
								if (val3.equals("null") || val3.equals(null)) {
							val3 = "";
								}

								payment_grid += val1 + "~" + val2 + "~" + val3 + "#";

							}
							if (payment_grid.equals("")) {

							} else {

								payment_grid = payment_grid.substring(0, payment_grid.length() - 1);
							}

							ps1 = con.prepareStatement("select * from planning_grid where case_id=?");
							ps1.setString(1, caseId);
							rs1 = ps1.executeQuery();

							while (rs1.next()) {

								val1 = rs1.getString("no_of_aligner_upper_active");
								val2 = rs1.getString("no_of_aligner_upper_passive");
								val3 = rs1.getString("no_of_aligner_lower_active");
								val4 = rs1.getString("no_of_aligner_lower_passive");
								val5 = rs1.getString("attachment_applicable");
								if (val1.equals("null") || val1.equals(null)) {
							val1 = "";
								}
								if (val2.equals("null") || val2.equals(null)) {
							val2 = "";
								}
								if (val3.equals("null") || val3.equals(null)) {
							val3 = "";
								}
								if (val4.equals("null") || val4.equals(null)) {
							val4 = "";
								}
								if (val5.equals("null") || val5.equals(null)) {
							val5 = "";
								}
								planninggrid += val1 + "~" + val2 + "~" + val3 + "~" + val4 + "~" + val5 + "#";


							}
							if (payment_grid.equals("")) {

							} else {

								payment_grid = payment_grid.substring(0, payment_grid.length() - 1);
							}

							ps1 = con.prepareStatement("select * from reviewnumbergrid where case_id=?");
							ps1.setString(1, caseId);

							rs1 = ps1.executeQuery();
							String reviewnumbergrid = "";

							while (rs1.next()) {

								val1 = rs1.getString("review_number");
								val2 = rs1.getString("work_grid");
								val3 = rs1.getString("new_aligner_required");
								val4 = rs1.getString("redefine_aligner");
								if (val1.equals("null") || val1.equals(null)) {
							val1 = "";
								}
								if (val2.equals("null") || val2.equals(null)) {
							val2 = "";
								}
								if (val3.equals("null") || val3.equals(null)) {
							val3 = "";
								}
								if (val4.equals("null") || val4.equals(null)) {
							val4 = "";
								}

								reviewnumbergrid += val1 + "~" + val2 + "~" + val3 + "~" + val4 + "#";

							}
							if (reviewnumbergrid.equals("")) {

							} else {
								reviewnumbergrid = reviewnumbergrid.substring(0, reviewnumbergrid.length() - 1);
							}

							ps1 = con.prepareStatement("select * from no_of_aligers_table where case_id=?");
							ps1.setString(1, caseId);

							rs1 = ps1.executeQuery();
							String no_of_aligers = "";
							String selectvalue = "";
							String attarray = "";

							while (rs1.next()) {

								val1 = rs1.getString("no_of_aligners_d_u");
								val2 = rs1.getString("no_of_aligners_d_l");
								val3 = rs1.getString("mode_of_delievery");
								val4 = rs1.getString("courier_track_no");
								String upper1 = rs1.getString("upper1");
								String upper2 = rs1.getString("upper2");
								String lower1 = rs1.getString("lower1");
								String lower2 = rs1.getString("lower2");
								String att = rs1.getString("att");
								attarray += att + "#";
								selectvalue += upper1 + "~" + upper2 + "~" + lower1 + "~" + lower2 + "#";
								if (val1.equals("null") || val1.equals(null)) {
							val1 = "";
								}
								if (val2.equals("null") || val2.equals(null)) {
							val2 = "";
								}
								if (val3.equals("null") || val3.equals(null)) {
							val3 = "";
								}
								if (val4.equals("null") || val4.equals(null)) {
							val4 = "";
								}
								no_of_aligers += val1 + "~" + val2 + "~" + val3 + "~" + val4 + "#";

							}

							ps1 = con.prepareStatement(
							"select decision,remarks,date_time,stage,userid from Decision_History  where caseid=? order by date_time desc  ");
							ps1.setString(1, caseId);
							rs1 = ps1.executeQuery();
							while (rs1.next()) {
								DisplayDecision displayDecision = new DisplayDecision();
								displayDecision.setDateTime(rs1.getString("date_time"));
								displayDecision.setDecision(rs1.getString("decision"));
								displayDecision.setRemarks(rs1.getString("Remarks"));
								displayDecision.setStage(rs1.getString("stage"));
								displayDecision.setUserName(rs1.getString("userid"));
								displayDecisionList.add(displayDecision);
							}

							String crm = "";
							String doctor_name = "";
							String patient_name = "";
							String planning_type = "";
							String base_segment = "";
							String planned = "";
							String ipr_sheet = "";
							String treat_report = "";
							String upload_digiplan = "";
							String plan_review = "";
							String decesion = "";
							String planning_remark = "";
							String from_type = "";
							String to_type = "";
							String date = "";
							String planned_no = "";

							/* 		 	PreparedStatement pstmt = con.prepareStatement("select * from planning where case_id=?");
								pstmt.setString(1, caseId);
								ResultSet resultset = pstmt.executeQuery();
								while (resultset.next()) {
							
							crm=resultset.getString("crm");
							doctor_name=resultset.getString("doctor_name");
							patient_name=resultset.getString("patient_name");
							planning_type=resultset.getString("planning_type");
							base_segment=resultset.getString("base_segment");
							planned=resultset.getString("planned");
							ipr_sheet= resultset.getString("ipr_sheet");
							treat_report=resultset.getString("treat_report");
							planning_remark=resultset.getString("remark");
							decesion=resultset.getString("decesion");
							upload_digiplan=resultset.getString("upload_digiplan");
							plan_review= resultset.getString("plan_review");
							from_type=resultset.getString("from_type");
							to_type=resultset.getString("to_type");
							date=resultset.getString("date");
							planned_no=resultset.getString("planned_no");
							
								
								if(plan_review==null)
								{
							plan_review="";
								}
								else
								{
							plan_review= resultset.getString("plan_review");
								}
								
								if(upload_digiplan==null)
								{
							upload_digiplan="";
								}
								else
								{
							upload_digiplan=resultset.getString("upload_digiplan");;
								}
								
								if(decesion==null)
								{
							decesion="";
								}
								else
								{
							decesion=resultset.getString("decesion");
								}
								
								if(planning_remark==null)
								{
							planning_remark="";
								}
								else
								{
							planning_remark=resultset.getString("remark");
								}
								
								if(treat_report==null)
								{
							treat_report="";
								}
								else
								{
							treat_report=resultset.getString("treat_report");
								}
								
								if(ipr_sheet==null)
								{
							ipr_sheet="";
								}
								else
								{
							ipr_sheet= resultset.getString("ipr_sheet");
								}
								
								if(planned==null)
								{
							planned="";
								}
								else
								{
							planned=resultset.getString("planned");
								}
								
								if(base_segment==null)
								{
							base_segment="";
								}
								else
								{
							base_segment=resultset.getString("base_segment");
								}
								
								if(planning_type==null)
								{
							planning_type="";
								}
								else
								{
							planning_type=resultset.getString("planning_type");
								}
								
								if(patient_name==null)
								{
							patient_name="";
								}
								else
								{
							patient_name=resultset.getString("patient_name");
								}
								
								if(doctor_name==null)
								{
							doctor_name="";
								}
								else
								{
							doctor_name=resultset.getString("doctor_name");
								}
								
								if(crm==null)
								{
							crm="";
								}
								else
								{
							crm=resultset.getString("crm");
								}
								if(planned_no==null)
								{
							planned_no="";
								}
								else
								{
							planned_no=resultset.getString("planned_no");
								}
								
								if(from_type==null)
								{
							from_type="";
								}
								else
								{
							from_type=resultset.getString("from_type");
								}
								if(to_type==null)
								{
							to_type="";
								}
								else
								{
							to_type=resultset.getString("to_type");
								}
								} */

							String doctor_name_disp = "";
							String patient_name_disp = "";
							String crm_disp = "";
							String Sr_no_disp = "";
							String item_disp = "";
							String dispatch_disp = "";
							String dispatch_no_disp = "";
							String tracking_id_disp = "";
							String delivery_nn_disp = "";
							String Type_of_dispatch_disp = "";
							String remark_disp = "";
							String date_disp = "";
							String decesion_disp = "";

							PreparedStatement pstmtdisp = con
							.prepareStatement("select * from dispatched_scan where case_id=? order by date desc ");
							pstmtdisp.setString(1, caseId);
							ResultSet resultsetdisp = pstmtdisp.executeQuery();
							String doctor_name_ac = "";
							String patient_name_ac = "";
							String crm_ac = "";
							String payment_mode_ac = "";
							String payment_ac = "";
							String remain_amount_ac = "";
							String paid_amount_ac = "";
							String submitted_amount_ac = "";
							String date_ac = "";
							String aid = "";
							String revamt = "";
							String acremarks = "";
							String invoice_date = "";
							String invoice_no="";
							String billingAmount = "";

							//List<AccountVo> list = (List)session.getAttribute("AccountVoList");
							List<com.vo.AccountVo> list = new ArrayList<com.vo.AccountVo>();
							PreparedStatement pstmtac = con.prepareStatement("select * from account where case_id=?");
							pstmtac.setString(1, caseId);
							ResultSet resultsetac = pstmtac.executeQuery();
							while (resultsetac.next()) {
								doctor_name_ac = resultsetac.getString("doctor_name");
								patient_name_ac = resultsetac.getString("patient_name");
								crm_ac = resultsetac.getString("crm");
								payment_mode_ac = resultsetac.getString("payment_mode");
								payment_ac = resultsetac.getString("payment");
								remain_amount_ac = resultsetac.getString("remain_amount");
								paid_amount_ac = resultsetac.getString("paid_amount");
								submitted_amount_ac = resultsetac.getString("submitted_amount");
								date_ac = resultsetac.getString("date");
								aid = resultsetac.getString("account_id");
								revamt = resultsetac.getString("revoke_amount");
								acremarks = resultsetac.getString("remarks");
								invoice_date = resultsetac.getString("invoice_date");
								invoice_no = resultsetac.getString("invoice_no");
								billingAmount = resultsetac.getString("Billing_amount");
								
								if (doctor_name_ac == null) {
							doctor_name_ac = "";
								} else {
							doctor_name_ac = resultsetac.getString("doctor_name");
								}
								if (patient_name_ac == null) {
							patient_name_ac = "";
								} else {
							patient_name_ac = resultsetac.getString("patient_name");
								}
								if (crm_ac == null) {
							crm_ac = "";
								} else {
							crm_ac = resultsetac.getString("crm");
								}
								if (payment_mode_ac == null) {
							payment_mode_ac = "";
								} else {
							payment_mode_ac = resultsetac.getString("payment_mode");
								}
								if (payment_ac == null) {
							payment_ac = "";
								} else {
							payment_ac = resultsetac.getString("payment");
								}
								if (remain_amount_ac == null) {
							remain_amount_ac = "";
								} else {
							remain_amount_ac = resultsetac.getString("remain_amount");
								}
								if (paid_amount_ac == null) {
							paid_amount_ac = "";
								} else {
							paid_amount_ac = resultsetac.getString("paid_amount");
								}
								if (submitted_amount_ac == null) {
							submitted_amount_ac = "";
								} else {
							submitted_amount_ac = resultsetac.getString("submitted_amount");
								}
								
								
								if(payment_mode_ac.equals("cash")){
									payment_mode_ac="Cash";
								}
								if(payment_mode_ac.equals("dcard")){
									payment_mode_ac="Debit Card";
								}
								if(payment_mode_ac.equals("ccard")){
									payment_mode_ac="Credit Card";
								}
								if(payment_mode_ac.equals("netb")){
									payment_mode_ac="NetBanking";
								}
								if(payment_mode_ac.equals("upi")){
									payment_mode_ac="UPI";
								}
								
								
								if (invoice_date == null) {
									invoice_date = "";
										} else {
											invoice_date = resultsetac.getString("invoice_date");
										}
								if (invoice_no == null) {
									invoice_no = "";
										} else {
											invoice_no = resultsetac.getString("invoice_no");
										}
								if (billingAmount == null) {
									billingAmount = "";
										} else {
											billingAmount = resultsetac.getString("Billing_amount");
										}
								if (acremarks == null) {
									acremarks = "";
										} else {
											acremarks = resultsetac.getString("remarks");
										}
								if (revamt == null) {
									revamt = "";
										} else {
											revamt = resultsetac.getString("revoke_amount");
										}

								AccountVo AccountVo1 = new AccountVo();
								AccountVo1.setAccount_id(aid);
								AccountVo1.setCaseid(caseId);
								AccountVo1.setCrm(crm_ac);
								AccountVo1.setDoctorName(doctor_name_ac);
								AccountVo1.setPatientName(patient_name_ac);
								AccountVo1.setModepayment(payment_mode_ac);
								AccountVo1.setPaidAmount(paid_amount_ac);
								AccountVo1.setRemainAmount(remain_amount_ac);
								AccountVo1.setTotal(payment_ac);
								AccountVo1.setDate(date_ac);
								AccountVo1.setSubmitted_amount(submitted_amount_ac);
								AccountVo1.setRevoke_amount(revamt);
								AccountVo1.setRemarks(acremarks);
								AccountVo1.setInvoice_no(invoice_no);
								AccountVo1.setInvoice_date(invoice_date);
								AccountVo1.setBilingAmount(billingAmount);
								
								list.add(AccountVo1);
							}

							List<com.vo.AccountVo> listrev = new ArrayList<com.vo.AccountVo>();
							PreparedStatement pstmtrev = null;
							ResultSet rsrev = null;

							pstmtrev = con.prepareStatement(" select * from account_change where case_id=? ");
							pstmtrev.setString(1, caseId);
							rsrev = pstmtrev.executeQuery();
							while (rsrev.next()) {
								AccountVo ac = new AccountVo();
								ac.setCaseid(rsrev.getString("case_id"));
								ac.setPrevious_amount(rsrev.getString("previous_amount"));
								ac.setNew_amount(rsrev.getString("new_amount"));
								ac.setRemarks(rsrev.getString("reason"));
								ac.setDate(rsrev.getString("date"));
								listrev.add(ac);
							}

							PreparedStatement pstmtstg = con.prepareStatement("select * from stagging where caseid=?");
							pstmtstg.setString(1, caseId);
							ResultSet resultstg = pstmtstg.executeQuery();

							String abc = (String) request.getAttribute("abc");
							String logusername = (String) request.getAttribute("def");
							String profile = (String) session.getAttribute("profile");

							PreparedStatement pstmthltg = con
							.prepareStatement("select * from hollow_tagging where caseid=? order by date desc ");
							pstmthltg.setString(1, caseId);
							ResultSet resulthltg = pstmthltg.executeQuery();
							
							PreparedStatement dispatch_stmt = con
									.prepareStatement("select * from execute_decision_history where case_id=? order by created_at desc ");
							dispatch_stmt.setString(1, caseId);
									ResultSet dispatch_rs = dispatch_stmt.executeQuery();
									
									PreparedStatement cadbs_stmt = con
											.prepareStatement("select * from cadbs where case_id=? order by date desc ");
									cadbs_stmt.setString(1, caseId);
											ResultSet cadbs_rs = cadbs_stmt.executeQuery();

							PreparedStatement pstmt3dp = con
							.prepareStatement("select * from threedprinting where caseid=? order by date desc ");
							pstmt3dp.setString(1, caseId);
							ResultSet result3dp = pstmt3dp.executeQuery();
							
							PreparedStatement rptpstmt = con.prepareStatement("select * from case_master_history where case_id=? order by modified_at desc ");
							rptpstmt.setString(1, caseId);
							ResultSet rpt_rs = rptpstmt.executeQuery();
									
						%>
						<%--  <% if (!isRemarkNull) { %>
                            <marquee class="blink">
                                <%= special_remark %>
                            </marquee>
                        <% } %> --%>
                        
                        
                        
						<div class="container">
						
						
							<!-- Trigger the modal with a button -->
							<div class="row" style="display: flex; flex-wrap: wrap;">
							
								<div class="patient-info">
									<label> Patient Name : </label> <span><%=Patient_Name%></span>
								</div>
								<div class="patient-info">
									<label>Registered Doctor : </label><span><%=registered_doctor%></span>
								</div>
								<div class="patient-info">
									<label>Case Id : </label><span><%=caseId%></span>
								</div>
								<div class="patient-info">
									<label>Clinic Name : </label><span><%=clinic_Name%></span>

								</div>
								<div class="patient-info">
									<label>Priority : </label> <span><%=priority%></span>

								</div>





								<div class="col-sm-1" id="editbutton" style="display: none">

									<button type="button" style="right: 0px"
										class="btn btn-info btn-sm " data-toggle="modal"
										data-target="#myModal">Edit</button>
								</div>
								<!-- Modal -->
								<div class="modal fade" id="myModal" role="dialog">
									<div class="modal-dialog">

										<form action="changedetail" method="post">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">Change Details</h4>
												</div>

												<div class="modal-body" style="margin-top: 10px">
													<table>
														<tr>
															<td><span class="">Case ID : &nbsp;</span></td>
															<td><input type="text" readonly="readonly"
																value="<%=caseId%>" id="case_id1" name="case_id1"></td>
														<tr>
														<tr>
															<td><span class="">Enter Patient Name :
																	&nbsp;</span></td>
															<td><input type="text" id="p_name" name="p_name"></td>
														<tr>
														<tr>
															<td><span class="">Enter Registered Doctor
																	Name : &nbsp;</span></td>
															<td><input type="text" id="r_doctor" name="r_doctor"></td>
														<tr>
														<tr>
															<td><span class="">Change Priority : &nbsp;</span></td>
															<td><select class="form-control" id="priority1"
																name="priority1" onchange="fun()">
																	<option style="padding: 7px 0px 7px 7px;" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																		-- Select
																		--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
																	<option style="padding: 7px 0px 7px 7px;">1</option>
																	<option style="padding: 7px 0px 7px 7px;">2</option>
																	<option style="padding: 7px 0px 7px 7px;">3</option>

																	<option style="padding: 7px 0px 7px 7px;">4</option>
																	<option style="padding: 7px 0px 7px 7px;">5</option>
																	<option style="padding: 7px 0px 7px 7px;">6</option>
																	<option style="padding: 7px 0px 7px 7px;">7</option>
																	<option style="padding: 7px 0px 7px 7px;">8</option>
																	<option style="padding: 7px 0px 7px 7px;">9</option>
																	<option style="padding: 7px 0px 7px 7px;">10</option>

															</select>
													</table>

												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-default">CHANGE</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

						</div>



						<div class="btn-group" style="margin: 3px 0px;">
							<button type="button" class="btn btn-primary" id="first"
								title="Case Information">Initial</button>
<button type="button" class="btn btn-primary" id="cadbsbtn"
								title="CADBS">CADBS</button>
							<button type="button" class="btn btn-primary" id="second"
								title="Case Planning">Planning</button>

							<button type="button" class="btn btn-primary" id="stagging"
								title="Case Stagging">Stagging</button>

							<button type="button" class="btn btn-primary" id="hollowtag"
								title="Case Stagging">Hollow Tag</button>
							<button type="button" class="btn btn-primary" id="3dprinting"
								title="Case Stagging">3D Printing</button>
							<button type="button" class="btn btn-primary" id="account"
								title="Case Account">Account</button>
							<button type="button" class="btn btn-primary" id="production"
								title="Case Dispatch">Dispatched</button>


							<button type="button" class="btn btn-primary" id="holdbtn"
								title="Case Stagging">Hold</button>

							<button type="button" class="btn btn-primary" id="unholdbtn"
								title="Case Stagging">UnHold</button>

							<!-- 	<button type="button" class="btn btn-default" id="holdstage">Hold Stage</button> -->
							<button type="button" class="btn btn-primary" id="Third"
								title="Case Decision And History">Decision & History</button>
							<button type="button" class="btn btn-primary" id="addresslogsbtn"
								title="Address Logs">Address</button>
								<button type="button" class="btn btn-primary" id="dispatchHistorybtn"
								title="Billing History">Billing History</button>
								<button type="button" class="btn btn-primary" id="rptbtn" title="Repeat Cases">Repeat Case</button>
							
						</div>
					</div>
					<form style="margin-top: 0px" class="form-inline" action=""
						method="post" id="form1">

						<%
						while (rs.next()) {
							String city = rs.getString("city");
							String PatientName = rs.getString("Patient_Name");
							String t_account = rs.getString("t_account");
							String corporate_account = rs.getString("corporate_account");
							String kol = rs.getString("kol");
							String starter_kit = rs.getString("starter_kit");
						    String strUpper = rs.getString("st_upper");
						    String strLower =rs.getString("st_lower");
						    String strBoth = rs.getString("st_other");
							String bgst_no = rs.getString("bgst_no");
							String remarks = rs.getString("remark");
							String address = rs.getString("address");
							String Doctor_Name = rs.getString("Doctor_Name");
							String registered_dr = rs.getString("registered_doctor");
							String clinic_Name1 = rs.getString("clinic_Name");

							String delivery_note_no = rs.getString("delivery_note_no");
							String bclinic = rs.getString("bclinic");
							String badd = rs.getString("badd");
							String category = rs.getString("category");
							String upper_aligner = rs.getString("upper_aligner");
							String lower_aligner = rs.getString("lower_aligner");
							String others = rs.getString("others");
							String case_type = rs.getString("case_type");
							String scan = rs.getString("scan");
							String location = rs.getString("location");
							String p_graph = rs.getString("p_graph");
							String type_request = rs.getString("type_request");
							String s_shown = rs.getString("s_shown");
							String ppf_fill = rs.getString("ppf_fill");
							String case_stage = rs.getString("case_stage");
							String crm_name = rs.getString("crm_name");

							String address1 = rs.getString("address1");
							String address2 = rs.getString("address2");
							String address3 = rs.getString("address3");
							String address4 = rs.getString("address4");
							String address5 = rs.getString("address5");

							String pincode1 = rs.getString("pincode1");
							String pincode2 = rs.getString("pincode2");
							String pincode3 = rs.getString("pincode3");
							String pincode4 = rs.getString("pincode4");
							String pincode5 = rs.getString("pincode5");

							String phone1 = rs.getString("phone1");
							String phone2 = rs.getString("phone2");
							String phone3 = rs.getString("phone3");
							String phone4 = rs.getString("phone4");
							String phone5 = rs.getString("phone5");

							String city1 = rs.getString("city");
							String city2 = rs.getString("city2");
							String city3 = rs.getString("city3");
							String city4 = rs.getString("city4");
							String city5 = rs.getString("city5");

							String location1 = rs.getString("location");
							String location2 = rs.getString("location2");
							String location3 = rs.getString("location3");
							String location4 = rs.getString("location4");
							String location5 = rs.getString("location5");

							String Default_starterkit = rs.getString("default_starterkit");
							String Default_batch = rs.getString("default_address");

							if (address == null) {
								address = "";
							} else {
								address = rs.getString("address");
							}
							if (others == null) {
								others = "";
							} else {
								others = rs.getString("others");
							}
							if (upper_aligner == null) {
								upper_aligner = "";
							} else {
								upper_aligner = rs.getString("upper_aligner");
							}
							if (badd == null) {
								badd = "";
							} else {
								badd = rs.getString("badd");
							}
							if (delivery_note_no == null) {
								delivery_note_no = "";
							} else {
								delivery_note_no = rs.getString("delivery_note_no");
							}
							if (lower_aligner == null) {
								lower_aligner = "";
							} else {
								lower_aligner = rs.getString("lower_aligner");
							}
							if (category == null) {
								category = "";
							} else {
								category = rs.getString("category");
							}
							if (bclinic == null) {
								bclinic = "";
							} else {
								bclinic = rs.getString("bclinic");
							}
							if (crm_name == null) {
								crm_name = "";
							} else {
								crm_name = rs.getString("crm_name");
							}
							if (city == null) {
								city = "";
							} else {
								city = rs.getString("city");
							}
							if (t_account == null) {
								t_account = "";
							} else {
								t_account = rs.getString("t_account");
							}
							if (corporate_account == null) {
								corporate_account = "";
							} else {
								corporate_account = rs.getString("corporate_account");
							}
							if (kol == null) {
								kol = "";
							} else {
								kol = rs.getString("kol");
							}
							if (starter_kit == null) {
								starter_kit = "";
							} else {
								starter_kit = rs.getString("starter_kit");
							}
							if (bgst_no == null) {
								bgst_no = "";
							} else {
								bgst_no = rs.getString("bgst_no");
							}
							if (remarks == null) {
								remarks = "";
							} else {
								remarks = rs.getString("remark");
							}
							if (Doctor_Name == null) {
								Doctor_Name = "";
							} else {
								Doctor_Name = rs.getString("Doctor_Name");
							}
							if (registered_dr == null) {
								registered_dr = "";
							} else {
								registered_dr = rs.getString("registered_doctor");
							}
							if (clinic_Name1 == null) {
								clinic_Name1 = "";
							} else {
								clinic_Name1 = rs.getString("clinic_Name");
							}
							if (case_type == null) {
								case_type = "";
							} else {
								case_type = rs.getString("case_type");
							}
							if (scan == null) {
								scan = "";
							} else {
								scan = rs.getString("scan");
							}
							if (location == null) {
								location = "";
							} else {
								location = rs.getString("location");
							}
							if (p_graph == null) {
								p_graph = "";
							} else {
								p_graph = rs.getString("p_graph");
							}
							if (type_request == null) {
								type_request = "";
							} else {
								type_request = rs.getString("type_request");
							}
							if (s_shown == null) {
								s_shown = "";
							} else {
								s_shown = rs.getString("s_shown");
							}
							if (ppf_fill == null) {
								ppf_fill = "";
							} else {
								ppf_fill = rs.getString("ppf_fill");
							}
							if (case_stage == null) {
								case_stage = "";
							} else {
								case_stage = rs.getString("case_stage");
							}
						%>

						<input type="hidden" name="username1"
							value='<%=(String) session.getAttribute("userid")%>'> <input
							type="hidden" name="caseLockVal" id="caseLockVal"
							value='<%=caseLock%>'>

						<div class="panel panel-primary">
							<div class="loader"></div>
							<div class="panel-heading">
								<strong>Case Details</strong>
							</div>

							<div id="error" style="width: 100%; display: none; color: green;"
								align="center">
								<h4 class="errorMsg">
									<label id="err"></label>
								</h4>
							</div>

							<div style="display: none;">
								<input type="text" id="hiddenNextInvNo" name="hiddenNextInvNo" />
							</div>
							<div style="padding: 10px;">

								<div id="firstform">
									<div class="container">
										<div class="panel panel-info">
											<div class="panel-heading ">Initial</div>
											<div class="panel-body">

												<%
												if (nextStage.contentEquals("initial stage")) {
												%>
												<div class="form-group">

													<button onclick="myFunction1()" class="btn btn-primary"
														type="submit">Add patient Prescription</button>
												</div>
												<%
												}
												%>
												<%-- 		<div class="form-group" id="D">

										<label>I have checked and filled the pre-requisite
											form. <span class="required" style="color: red">*</span>
										</label>
											<span style="padding-left:30px; margin-top:5px;">             					

        
					
       				
       <select disabled class="form-control" id="prerequisite" name="prerequisite"  onchange="fun()" >
       <!-- <option style="padding:7px 0px 7px 7px;" value=""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -- Select --&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
       <option  style="padding:7px 0px 7px 7px;">yes</option> -->
                                    <option  style="padding:7px 0px 7px 7px;"><%= rs.getString("prerequisite")%></option>

      
   </select></span>

									</div> --%>
												<!-- <div class="row">
  <div class="col-lg-4 ">
  <div class="input-group">	
  <label><button type="button" class="btn btn-primary" onclick="myFunction11()">View And Attach Document</button></label>
    </div>
  </div>

</div> -->
												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">CRM Name</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="crm_name" name="crm_name"
																	value="<%=crm_name%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Clinic Name </label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="clinic_Name"
																	name="clinic_Name" value="<%=clinic_Name1%>"></label>
															</div>
														</div>
													</div>
												</div>
												<!-- start address handler -->

												<div class="container" style="width: 100%; margin-top: 8px;">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<i class="fa fa-address-card-o" style="font-size: 20px;"></i>
															Starter kit / Batch Delivery Address Details
														</div>
														<div class="panel-body">
															<div class="table-responsive">
																<div class="">
																	<table
																		class="table table-bordered table-striped table-striped table-hover dataTable">
																		<thead style="background: black; color: white;">
																			<tr>
																				<th class="sorting"></th>
																				<th class="sorting">Address</th>
																				<th class="sorting">Pin Code</th>
																				<th class="sorting">Phone</th>
																				<th class="sorting">City</th>
																				<th class="sorting">Location</th>
																				<th class="sorting" title="Starter kit Address"
																					style="width: 2px;" valign="moddle">SKA</th>
																				<th class="sorting" title="Batch Address"
																					style="width: 2px;" valign="moddle">BA</th>
																			</tr>
																		</thead>
																		<tbody>

																			<%
																			if (Default_starterkit == null || Default_batch == null) {
																			%>
																			<tr>
																				<td colspan="8" align="center">No Address
																					found!</td>
																			</tr>
																			<%
																			} else {

																			if (Default_starterkit.equals("1") || Default_batch.equals("1")) {
																			%>
																			<tr>
																				<td valign="middle">Home</td>
																				<td valign="middle"><%=address1%></td>
																				<td valign="middle"><%=pincode1%></td>
																				<td valign="middle"><%=phone1%></td>
																				<td valign="middle"><%=city1%></td>
																				<td valign="middle"><%=location1%></td>

																				<td valign="middle">
																					<%
																					if (Default_starterkit.equals("1")) {
																					%> <input class="starterkit"
																					onclick="return false;" type="checkbox" checked
																					id="starterkit1" name="starterkit1" value="1"
																					style="width: 36px; height: 36px;"> <%
 } else {
 %> <input class="form-check-input starterkit" onclick="return false;"
																					type="checkbox" id="starterkit1" name="starterkit1"
																					value="1" style="width: 36px; height: 36px;">
																					<%
																					}
																					%>

																				</td>
																				<td valign="middle">
																					<%
																					if (Default_batch.equals("1")) {
																					%> <input class="form-control" type="checkbox"
																					onclick="return false;" checked id="batch1"
																					name="batch1" value="1"
																					style="width: 36px; height: 36px;"> <%
 } else {
 %> <input class="form-control" type="checkbox" id="batch1"
																					onclick="return false;" name="batch1" value="1"
																					style="width: 36px; height: 36px;"> <%
 }
 %>


																				</td>
																			</tr>
																			<%
																			}
																			if (Default_starterkit.equals("2") || Default_batch.equals("2")) {
																			%>
																			<tr>
																				<td>Clinic</td>
																				<td><%=address2%></td>
																				<td><%=pincode2%></td>

																				<td><%=phone2%></td>

																				<td valign="middle"><%=city2%></td>
																				<td valign="middle"><%=location2%></td>

																				<td valign="middle">
																					<%
																					if (Default_starterkit.equals("2")) {
																					%> <input class="form-check-input starterkit"
																					onclick="return false;" type="checkbox" checked
																					id="starterkit2" name="starterkit2" value="2"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input starterkit" onclick="return false;"
																					type="checkbox" id="starterkit2" name="starterkit2"
																					value="2" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>

																				</td>
																				<td valign="middle">
																					<%
																					if (Default_batch.equals("2")) {
																					%> <input class="form-check-input" type="checkbox"
																					onclick="return false;" checked id="batch2"
																					name="batch2" value="2"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input" type="checkbox"
																					onclick="return false;" id="batch2" name="batch2"
																					value="2" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>

																				</td>
																			</tr>
																			<%
																			}

																			if (Default_starterkit.equals("3") || Default_batch.equals("3")) {
																			%>
																			<tr>
																				<td>Other1</td>
																				<td><%=address3%></td>
																				<td><%=pincode3%></td>
																				<td><%=phone3%></td>
																				<td valign="middle"><%=city3%></td>
																				<td valign="middle"><%=location3%></td>

																				<td valign="middle">
																					<%
																					if (Default_starterkit.equals("3")) {
																					%> <input class="form-check-input starterkit"
																					onclick="return false;" type="checkbox" checked
																					id="starterkit3" name="starterkit3" value="3"
																					style="width: 28px; height: 36px;"> <%
 } else {
 %> <input class="form-check-input starterkit" onclick="return false;"
																					type="checkbox" id="starterkit3" name="starterkit3"
																					value="3" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>

																				</td>
																				<td valign="middle">
																					<%
																					if (Default_batch.equals("3")) {
																					%> <input class="form-check-input" type="checkbox"
																					onclick="return false;" checked id="batch3"
																					name="batch3" onclick="BatchSelectOne(this.id);"
																					value="3" style="width: 28px; height: 28px;">
																					<%
																					} else {
																					%> <input class="form-check-input" type="checkbox"
																					id="batch3" name="batch3" onclick="return false;"
																					value="3" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>

																				</td>
																			</tr>
																			<%
																			}

																			if (Default_starterkit.equals("4") || Default_batch.equals("4")) {
																			%>
																			<tr>
																				<td>Other2</td>
																				<td><%=address4%></td>
																				<td><%=pincode4%></td>
																				<td><%=phone4%></td>
																				<td valign="middle"><%=city4%></td>
																				<td valign="middle"><%=location4%></td>

																				<td valign="middle">
																					<%
																					if (Default_starterkit.equals("4")) {
																					%> <input class="form-check-input starterkit"
																					type="checkbox" onclick="return false;" checked
																					id="starterkit4" name="starterkit4" value="4"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input starterkit" onclick="return false;"
																					type="checkbox" id="starterkit4" name="starterkit4"
																					value="4" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>


																				</td>
																				<td valign="middle">
																					<%
																					if (Default_batch.equals("4")) {
																					%> <input class="form-check-input" type="checkbox"
																					onclick="return false;" checked id="batch4"
																					name="batch4" value="4"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input" type="checkbox" id="batch4"
																					name="batch4" onclick="return false;" value="4"
																					style="width: 28px; height: 28px;"> <%
 }
 %>
																				</td>
																			</tr>
																			<%
																			}

																			if (Default_starterkit.equals("5") || Default_batch.equals("5")) {
																			%>
																			<tr>
																				<td>Other3</td>
																				<td><%=address5%></td>
																				<td><%=pincode5%></td>
																				<td><%=phone5%></td>
																				<td valign="middle"><%=city5%></td>
																				<td valign="middle"><%=location5%></td>

																				<td valign="middle">
																					<%
																					if (Default_starterkit.equals("5")) {
																					%> <input class="form-check-input starterkit"
																					onclick="return false;" checked type="checkbox"
																					id="starterkit5" name="starterkit5" value="5"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input starterkit" onclick="return false;"
																					type="checkbox" id="starterkit5" name="starterkit5"
																					value="5" style="width: 28px; height: 28px;">
																					<%
																					}
																					%>

																				</td>
																				<td valign="middle">
																					<%
																					if (Default_batch.equals("5")) {
																					%> <input class="form-check-input" type="checkbox"
																					id="batch5" checked name="batch5"
																					onclick="return false;" value="5"
																					style="width: 28px; height: 28px;"> <%
 } else {
 %> <input class="form-check-input" type="checkbox" id="batch5"
																					name="batch5" onclick="return false;" value="5"
																					style="width: 28px; height: 28px;"> <%
 }
 %>

																				</td>
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
													</div>
												</div>
												<!-- end address handler -->




												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Registered Doctor</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" d="registered_doctor"
																	name="registered_doctor" value="<%=registered_dr%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Doctor Name</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="Doctor_Name"
																	name="Doctor_Name" value="<%=Doctor_Name%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Patient Name</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="patient_name"
																	name="patient_name"
																	value="<%=rs.getString("Patient_Name")%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Delivery Note No</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="delivery_note_no"
																	name="delivery_note_no" value="<%=delivery_note_no%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Buyers Clinic Name</label>
														<div class="">
															<div class="input-group">
																<label><input disabled type="text" disabled
																	class="form-control" id="bclinic" name="bclinic"
																	value="<%=bclinic%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Buyer's Address</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="badd" name="badd"
																	value="<%=badd%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Category</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="category" name="category"
																	value="<%=category%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Upper Aligner</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="upper_aligner"
																	name="upper_aligner" value="<%=upper_aligner%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Lower Aligner</label>
														<div class=" ">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="lower_aligner"
																	name="lower_aligner" value="<%=lower_aligner%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Others</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="others" name="others"
																	value="<%=others%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Existing/New</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="case_type" name="case_type"
																	value="<%=case_type%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Scan/Impression</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="scan" name="scan"
																	value="<%=scan%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">
													<div class="form-group-block col-md-6">
														<label class="control-label">Photograph Available</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="p_graph" name="p_graph"
																	value="<%=p_graph%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Type of Request</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="type_request"
																	name="type_request" value="<%=type_request%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">

													<div class="form-group-block col-md-6">
														<label class="control-label">Simulation Shown</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="s_shown" name="s_shown"
																	value="<%=s_shown%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">PPF Filled</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="ppf_fill" name="ppf_fill"
																	value="<%=ppf_fill%>"></label>
															</div>
														</div>
													</div>
												</div>


												<div class="row form-group-wrap">

													<div class="form-group-block col-md-6">
														<label class="control-label">Case Stage</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="case_stage" name="case_stage"
																	value="<%=case_stage%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">Type of Account</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="type_of_account"
																	name="type_of_account" value="<%=t_account%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">

													<div class="form-group-block col-md-6">
														<label class="control-label">Corporate Account</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="corporate_account"
																	name="corporate_account" value="<%=corporate_account%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">KOL</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="kol" name="kol"
																	value="<%=kol%>"></label>
															</div>
														</div>
													</div>
												</div>

												<div class="row form-group-wrap">

													<div class="form-group-block col-md-6">
														<label class="control-label">Starter Kit Required</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="starter_kit"
																	name="starter_kit" value="<%=starter_kit%>"></label>
															</div>
														</div>
													</div>
													<div class="form-group-block col-md-6">
														<label class="control-label">GST Number</label>
														<div class="">
															<div class="input-group">
																<label><input type="text" disabled
																	class="form-control" id="gst_number" name="gst_number"
																	value="<%=bgst_no%>"></label>
															</div>
														</div>
													</div>
												</div>



<div class="form-group-block col-md-6">
    <label class="control-label">Str_Upper</label>
    <div class="">
        <div class="input-group">
            <label><input type="text" disabled class="form-control" id="str_upper" name="str_upper" value="<%=strUpper%>" ></label>
        </div>
    </div>
</div>
<div class="form-group-block col-md-6">
    <label class="control-label">Str_Lower</label>
    <div class="">
        <div class="input-group">
            <label><input type="text" disabled class="form-control" id="str_lower" name="str_lower" value="<%=strLower%>" ></label>
        </div>
    </div>
</div>
<div class="form-group-block col-md-6">
    <label class="control-label">Str_Both</label>
    <div class="">
        <div class="input-group">
            <label><input type="text" disabled class="form-control" id="str_both" name="str_both" value="<%=strBoth%>"></label>
        </div>
    </div>
</div>

<div class="form-group-block col-md-6">
    <label class="control-label">Special Remarks</label>
    <div class="">
        <div class="input-group">
            <textarea id="special_remarks" name="special_remarks" rows="4" style="border: 2px solid red;font-weight: bold; width: 90%;" class="form-control" maxlength="250" readonly><%= special_remark %></textarea>
        </div>
    </div>
</div>

















											</div>
										</div>
									</div>
									<!-- container-->

								</div>




								<div id="secondform"  >
									<%
									int row = 1;

									int planning_idpln = 0;
									PreparedStatement pstmt = con.prepareStatement("select * from planning where case_id=? and planned_no IS NOT NULL ");
									pstmt.setString(1, caseId);
									ResultSet resultset = pstmt.executeQuery();
									while (resultset.next()) {

										crm = resultset.getString("crm");
										doctor_name = resultset.getString("doctor_name");
										patient_name = resultset.getString("patient_name");
										base_segment = resultset.getString("base_segment");
										planned = resultset.getString("planned");
										ipr_sheet = resultset.getString("ipr_sheet");
										treat_report = resultset.getString("treat_report");
										planning_remark = resultset.getString("remark");
										decesion = resultset.getString("decesion");
										upload_digiplan = resultset.getString("upload_digiplan");
										plan_review = resultset.getString("plan_review");
										from_type = resultset.getString("from_type");
										to_type = resultset.getString("to_type");
										date = resultset.getString("date");

										String upper_aligner_from = resultset.getString("upper_aligner_from");
										String upper_aligner_to = resultset.getString("upper_aligner_to");
										String lower_aligner_from = resultset.getString("lower_aligner_from");
										String lower_aligner_to = resultset.getString("lower_aligner_to");

										planned_no = resultset.getString("planned_no");
										planning_type = resultset.getString("planning_type");
										planning_idpln = resultset.getInt("planning_id");
										
										 String case_booking_form = resultset.getString("case_booking_form");
									        String sales_approval_docs = resultset.getString("sales_approval_docs");
									        String doc_approval_form = resultset.getString("doc_approval_form");
									        String stagesheet = resultset.getString("stagesheet");
									        String plan_comment = resultset.getString("plan_comment");
									        int u_form = resultset.getInt("u_form");
									        int u_to = resultset.getInt("u_to");
									        int l_from = resultset.getInt("l_from");
									        int l_to = resultset.getInt("l_to");
									        Date dispatch_eta = resultset.getDate("dispatch_eta");
									        Timestamp created_at = resultset.getTimestamp("created_at");
									        String created_by = resultset.getString("created_by");

										if (upper_aligner_from == null) {
											upper_aligner_from = "";
										} else {
											upper_aligner_from = resultset.getString("upper_aligner_from");
										}

										if (upper_aligner_to == null) {
											upper_aligner_to = "";
										} else {
											upper_aligner_to = resultset.getString("upper_aligner_to");
										}

										if (lower_aligner_from == null) {
											lower_aligner_from = "";
										} else {
											lower_aligner_from = resultset.getString("lower_aligner_from");
										}

										if (lower_aligner_to == null) {
											lower_aligner_to = "";
										} else {
											lower_aligner_to = resultset.getString("lower_aligner_to");
										}

										if (planned_no == null) {
											planned_no = "";
										} else {
											planned_no = resultset.getString("planned_no");
										}

										if (planning_type == null) {
											planning_type = "";
										} else {
											planning_type = resultset.getString("planning_type");
										}
										if (case_booking_form == null) {
								            case_booking_form = "";
								        }else {
								        	case_booking_form = resultset.getString("case_booking_form");
										}

								        if (sales_approval_docs == null) {
								            sales_approval_docs = "";
								        }else {
								        	sales_approval_docs = resultset.getString("sales_approval_docs");
										}

								        if (doc_approval_form == null) {
								            doc_approval_form = "";
								        }else {
								        	doc_approval_form = resultset.getString("doc_approval_form");
										}

								        if (stagesheet == null) {
								            stagesheet = "";
								        }else {
								        	stagesheet = resultset.getString("stagesheet");
										}

								        if (plan_comment == null) {
								            plan_comment = "";
								        }else {
								        	plan_comment = resultset.getString("plan_comment");
										}
								        if (resultset.getObject("u_form") == null) {
								            u_form = 0; // Default value for integers
								        } else {
								            u_form = resultset.getInt("u_form");
								        }

								        if (resultset.getObject("u_to") == null) {
								            u_to = 0;
								        } else {
								            u_to = resultset.getInt("u_to");
								        }

								        if (resultset.getObject("l_from") == null) {
								            l_from = 0;
								        } else {
								            l_from = resultset.getInt("l_from");
								        }

								        if (resultset.getObject("l_to") == null) {
								            l_to = 0;
								        } else {
								            l_to = resultset.getInt("l_to");
								        }

								        if (resultset.getDate("dispatch_eta") == null) {
								            dispatch_eta = null; // or you can set a default date
								        } else {
								            dispatch_eta = resultset.getDate("dispatch_eta");
								        }

								        if (resultset.getTimestamp("created_at") == null) {
								            created_at = null; // or you can set a default timestamp
								        } else {
								            created_at = resultset.getTimestamp("created_at");
								        }

								        if (created_by == null) {
								            created_by = "";
								        } else {
								            created_by = resultset.getString("created_by");
								        }
								        
									%>

									<%
									if (planning_idcrm == planning_idpln && userRight.contains("OTPLN") || userRight.contains("QA")) {
										if (!planned_no.equals("")) {
									%>
									<div class="container">
										<%
										if (planning_idcrm == planning_idpln) {
										%>
										<div class="panel panel-info"
											style="border-color: green !important;">
											<%
											} else {
											%>
											<div class="panel panel-info">
												<%
												}
												%>

												<div class="panel-heading">
													Planning
													<%=row%>
													<!-- <i class="fa fa-check-circle green-color" style="font-size:28px;" aria-hidden="true"></i> -->



												</div>

												<%
												}
												%>
												<%
												} else {
												if (!planned_no.equals("")) {
												%>
												<div class="container">
													<div class="panel panel-info ">
														<%
														if (planning_idcrm == planning_idpln) {
														%>

														<div class="panel-heading ">
															Planning
															<%=row%>

														</div>
														<%
														} else {
														%>
														<div class="panel-heading ">
															Planning
															<%=row%></div>
														<%
														}
														%>

														<%
														}
														}
														%>

														<%
														if (!planned_no.equals("") && planned_no != null) {
														%>
														<div class="panel-body" style="padding: 14px !important;">
															<div class="row">
																<label class="col-lg-3 col-md-3 col-sm-3">Planned No
																</label>
																<div class="col-lg-3 col-md-3 col-sm-3">
																	<input type="text" disabled
																		class="form-control form-control-lg" name="Planned_No"
																	style="width: 56%; margin-right: 13px;"	id="Planned_No" placeholder="Planned No"
																		value="<%=planned_no%>">
																</div>

																<label class="col-lg-3 col-md-3 col-sm-3">Planning
																	Type </label>
																<div class="col-lg-3 col-md-3 col-sm-3">

																	<input type="text" disabled
																		class="form-control form-control-lg"
																		name="planningType" style="width: 56%; margin-right: 13px;" id="planningType"
																		value="<%=planning_type%>">

																</div>
															</div>
															<br>
															<div class="row">
																<label class="col-lg-3 col-md-3 col-sm-3">Upper
																	Aligner</label>
																<div class="col-lg-3 col-md-3 col-sm-3">
																	<div class="input-group">
																		<input type="text"
																			style="width: 26%; margin-right: 13px;" disabled
																			class="form-control" id="upper_aligner_from"
																			name="upper_aligner_from" placeholder="From"
																			value="<%=upper_aligner_from%>"> 
																			<input
																			type="text" style="width: 26%;" disabled
																			class="form-control" id="upper_aligner_to"
																			name="upper_aligner_to" placeholder="To"
																			value="<%=upper_aligner_to%>">
																	</div>
																</div>


																<label class="col-lg-3 col-md-3 col-sm-3">Lower
																	Aligner </label>
																<div class="col-lg-3 col-md-3 col-sm-3">
																	<div class="input-group">
																		<input type="text"
																			style="width: 26%; margin-right: 13px;" disabled
																			class="form-control" id="lower_aligner_from"
																			name="lower_aligner_from" placeholder="From"
																			value="<%=lower_aligner_from%>"> <input
																			type="text" style="width: 26%;" disabled
																			class="form-control" id="lower_aligner_to"
																			name="lower_aligner_to" placeholder="To"
																			value="<%=lower_aligner_to%>">
																	</div>
																</div>
																</div>
																  <div class="row" >
                    <label class="col-lg-3 col-md-3 col-sm-3">Dispatch Upper</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="input-group">
                   <input type="text"  class="form-control" style="width: 26%; margin-right: 13px;" id="u_form_6" name="u_form_6" placeholder="u_form" value="<%=u_form%>" disabled>
                     <input type="text" class="form-control" id="u_to" style="width: 26%; margin-right: 13px;" name="u_to" placeholder="u_to" value="<%=u_to%>" disabled >
                       
                        </div>
                    </div>
                
                    <label class="col-lg-3 col-md-3 col-sm-3">Dispatch Lower</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="l_from" style="width: 26%; margin-right: 13px;" name="l_from" placeholder="l_from" value="<%=l_from%>" disabled >
                            <input type="text" class="form-control" id="l_to" style="width: 26%; margin-right: 13px;" name="l_to" placeholder="l_to" value="<%=l_to%>" disabled>
                        
                        </div>
                    </div>
                  
                </div>
                <div class="row">
                    <label class="col-lg-3 col-md-3 col-sm-3">Sheet Type</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <select class="form-control form-control-lg" style="width: 56%; margin-right: 13px;" name="stagesheet" id="stagesheet" value="<%=stagesheet%>" disabled>
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

                            <!-- Add more options as needed -->
                        </select>
                    </div>
                     <label class="col-lg-3 col-md-3 col-sm-3">Created At</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                    
                        <input type="text" class="form-control form-control-lg" style="width: 56%; margin-right: 13px;" id="created_at" name="created_at" value="<%= new java.util.Date() %>" readonly value="<%=created_at%>" disabled >
                   
                    </div>
                </div>
             <br>
          
                <div class="row">
                 <label class="col-lg-3 col-md-3 col-sm-3">Plan Comment</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <!-- <div class="input-group"> -->
                       <input type="text" class="form-control form-control-lg"  style="width: 56%; margin-right: 13px;" id="plan_comment" name="plan_comment" placeholder="Plan Comment" value="<%=plan_comment%>" disabled> 
                   <!--  </div> -->
                </div>
                  <label class="col-lg-3 col-md-3 col-sm-3">Case Booking Form</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <input type="text" class="form-control form-control-lg" style="width: 56%; margin-right: 13px;" id="case_booking_form" name="case_booking_form" placeholder="Case Booking Form" value="<%=case_booking_form%>" disabled >
                    </div>
                </div>
                <br>
 <div class="row">
             <label class="col-lg-3 col-md-3 col-sm-3">Sales Approval Docs</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <input type="text" class="form-control form-control-lgl" style="width: 56%; margin-right: 13px;" id="sales_approval_docs" name="sales_approval_docs" placeholder="Sales Approval Docs" value="<%=sales_approval_docs%>" disabled >
                    </div>
                      <label class="col-lg-3 col-md-3 col-sm-3">Doc Approval Form</label>
                    <div class="col-lg-3 col-md-3 col-sm-3">
                        <input type="text" class="form-control form-control-lg" style="width: 56%; margin-right: 13px;" id="doc_approval_form" name="doc_approval_form" placeholder="Doc Approval Form" value="<%=doc_approval_form%>" disabled>
                    </div>
                </div>
                <br>
            <div class="col-lg-1 ">
																	<div class="input-group"></div>
																</div>
															
															<div class="row">
																<div class="text-center">

																	<%
																	if (planning_idcrm == planning_idpln) {
																	%>
																	<button class="btn btn-success" disabled
																		style="background: green; color: white;">Approved
																		Plan</button>
																	<%
																	} else {
																	%>
																	<!-- <button  class="btn btn-success" disabled>Approve Plan</button>  -->
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
														if (planning_idcrm == planning_idpln && userRight.contains("OTPLN") || userRight.contains("QA")) {
														%>
													</div>
												</div>
												
												<%
												} else {
												%>
											</div>
										</div>
										<%
										}
										%>

										<%
										row++;

										}
										%>


									</div>


									<div id="productionform">

										<div class="row">
											<div class="container" style="width: 100%">
												<div class="panel panel-info">
													<div class="panel-heading "
														style="background-color: #d9edf7; border-color: #bce8f1;">Dispatched
														Aligner Details</div>
													<div class="panel-body"
														style="overflow: scroll; padding: 0px !important;">
														<table role="grid"
															class="table table-bordered table-striped table-striped table-hover dataTable">
															<thead style="background: black; color: white;">

																<TR>
																	<TH data-field="date">Date</TH>
																	<TH data-field="deliverynoteno">Delivery Note No</TH>
																	<TH data-field="address">Address</TH>
																	<TH data-field="noofaligner">Upper(F/T)</TH>
																	<TH data-field="noofaligner">Lower(F/T)</TH>

																	<TH data-field="trackid">Tracking Id</TH>
																</TR>


															</thead>
															<tbody>
																<%
																String Dphcase_id = "";

																while (resultsetdisp.next()) {

																	String Dphdate = resultsetdisp.getString("date");
																	String Dphdelivery_nn = resultsetdisp.getString("delivery_nn");
																	String Dphdphaddress = resultsetdisp.getString("address");
																	String DphupperFrom = resultsetdisp.getString("upper_aligner_from");
																	String DphupperTo = resultsetdisp.getString("upper_aligner_to");
																	String DphlowerFrom = resultsetdisp.getString("lower_aligner_from");
																	String DphlowerTo = resultsetdisp.getString("lower_aligner_to");
																	String DphUpperATT = resultsetdisp.getString("upper_att");
																	String DphLowerATT = resultsetdisp.getString("lower_att");
																	String Dphtracking_id = resultsetdisp.getString("tracking_id");
																	Dphcase_id = resultsetdisp.getString("Case_Id");

																	if (DphupperFrom == null || DphupperTo == null || DphlowerFrom == null || DphlowerTo == null) {
																		DphupperFrom = "";
																		DphupperTo = "";
																		DphlowerFrom = "";
																		DphlowerTo = "";
																	} else {
																		DphupperFrom = resultsetdisp.getString("upper_aligner_from");
																		DphupperTo = resultsetdisp.getString("upper_aligner_to");
																		DphlowerFrom = resultsetdisp.getString("lower_aligner_from");
																		DphlowerTo = resultsetdisp.getString("lower_aligner_to");
																	}
																	if (caseId.equals(Dphcase_id)) {
																%>

																<tr>
																	<td><%=Dphdate%></td>
																	<td><%=Dphdelivery_nn%></td>
																	<td><%=Dphdphaddress%></td>
																	<td><%=DphupperFrom + "-" + DphupperTo%></td>
																	<td><%=DphlowerFrom + "-" + DphlowerTo%></td>
																	<td><%=Dphtracking_id%></td>
																</tr>
																<%
																} else {
																%>
																<tr>
																	<td colspan="6" align="center">No data found!</td>
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
										</div>
										<%-- 			<% int j=1;
										while (resultsetdisp.next()) {
									System.out.println("approval jsp Dispatched details :: case id : "+resultsetdisp.getString("case_id")+"");
											
	

								 %>
								 
								
									<% j++;} %> --%>
									</div>


									<div id="accountform">
										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">Account Details</div>
												<div class="panel-body">

													<form class="form-verticle">

														<div class="row form-group-wrap">
															<div class="form-group-block col-md-6">
																<label class="control-label">Doctor Name</label>
																<div class="">
																	<div class="input-group">
																		<label><input type="text" class="form-control"
																			name="doctor_name" disabled id="doctor_name"
																			value="<%=doctor_name_ac%>"></label>
																	</div>
																</div>
															</div>
															<div class="form-group-block col-md-6">
																<label class="control-label">Patient Name</label>
																<div class="">
																	<div class="input-group">
																		<label><input type="text" class="form-control"
																			name="patient_name" disabled id="patient_name"
																			value="<%=patient_name_ac%>"></label>
																	</div>
																</div>
															</div>
														</div>

														<div class="row form-group-wrap">
															<div class="form-group-block col-md-6">
																<label class="control-label">CRM Name</label>
																<div class="">
																	<div class="input-group">
																		<label><input type="text" class="form-control"
																			name="crm" disabled id="crm" value="<%=crm_ac%>"></label>
																	</div>
																</div>
															</div>
															<div class="form-group-block col-md-6">
																<label class="control-label">Total Amount</label>
																<div class="">
																	<div class="input-group">
																		<label><input type="text" class="form-control"
																			name="" total_amount"" disabled id="total_amount"
																			value="<%=payment_ac%>"></label>
																	</div>
																</div>
															</div>
														</div>
														<div class="row form-group-wrap">
															<div class="form-group-block col-md-6">
																<label class="control-label">Remain Amount</label>
																<div class="">
																	<div class="input-group">
																		<label><input type="text" class="form-control"
																			name="remain_amount" disabled id="remain_amount"
																			value="<%=remain_amount_ac%>"></label>
																	</div>
																</div>
															</div>
														</div>


														<div class="container" style="padding-top: 20px;">
															<div class="panel panel-primary">
																<div class="panel-heading">
																	<strong>Transaction History</strong>
																</div>
																<div class="table-responsive">

																	<%
																	List<AccountVo> list2 = (List) request.getAttribute("AccountVoList");

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
																					<div class="col-lg-12" style="padding: 0px;">
																						<div class="table-responsive">
																							<table role="grid" id="example"
																								class="table table-bordered table-striped table-hover dataTable">
																								<thead style="background: black; color: white;">

																									<tr role="row">

																										<th class="sorting">Sr.No.</th>
																										<th class="sorting">MOD</th>
																										<th class="sorting">Paid Amount</th>
																										<th class="sorting">Total Paid Amount</th>
																										<th class="sorting">Revoke Amount</th>
																										<th class="sorting">Total Amount</th>
																										<th class="sorting">Billing Amount</th>
																										<th class="sorting">Invoice Number</th>
																										<th class="sorting">InvoiceDate</th>
																										<th class="sorting">Remarks</th>
																										<th class="sorting">Date</th>
																									</tr>
																								</thead>


																								<tbody>
																									<%
																									if (list.size() == 0) {
																									%>

																									<tr class="even" role="row">
																										<TD colspan="8" align="center"><b> No
																												Data Found!<i class="fa fa-exclamation"></i>
																										</b></TD>
																									</tr>
																									<%
																									} else {
																									int i = 0;
																									for (AccountVo AccountVo1 : list) {
																										i++;
																									%>

																									<tr class="even" role="row">
																										<TD><%=i%></TD>

																										<TD><%=AccountVo1.getModepayment()%></TD>
																										<TD><%=AccountVo1.getPaidAmount()%>
																										<TD><%=AccountVo1.getSubmitted_amount()%>
																										<TD><%=AccountVo1.getRevoke_amount()%>
																										<TD><%=AccountVo1.getTotal()%>
																										<TD><%=AccountVo1.getBillingAmount()%>
																										<TD><%=AccountVo1.getInvoice_no()%>
																										<TD><%=AccountVo1.getInvoice_date()%>
																										<TD><%=AccountVo1.getRemarks()%>
																										<TD><%=AccountVo1.getDate()%></TD>


																										</TD>
																									</tr>

																									<%
																									}
																									}
																									%>


																								</tbody>
																							</table>

																							<br> <br>

																						</div>
																					</div>

																				</td>
																			</tr>
																		</thead>
																	</table>

																	<div class="bottomMenu"></div>

																</div>
															</div>

														</div>


														<!-- amt change  -->
														<div class="container" style="padding-top: 20px;">
															<div class="panel panel-primary">
																<div class="panel-heading">
																	<strong>Revoke Amount</strong>
																</div>
																<div class="table-responsive">

																	<table class="fontTable" align="center">
																		<tr id="mesg">
																			<td colspan="3" style="color: red;" class="errorMsg"><strong></strong></td>
																		</tr>

																	</table>


																	<table id="myinvoice" class="table table-bordered">
																		<thead>
																			<tr>
																				<td colspan="9">
																					<div class="col-lg-12" style="padding: 0px;">
																						<div class="table-responsive">
																							<table role="grid" id="example"
																								class="table table-bordered table-striped table-hover dataTable">
																								<thead style="background: black; color: white;">


																									<tr role="row">

																										<th class="sorting">Case Id.</th>
																										<th class="sorting">Previous Amount</th>
																										<th class="sorting">New Amount</th>
																										<th class="sorting">Reason</th>
																										<th class="sorting">Date</th>
																									</tr>
																								</thead>


																								<tbody>
																									<%
																									SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss.SSSX");

																									if (listrev.size() == 0) {
																									%>

																									<tr class="even" role="row">
																										<TD colspan="5" align="center"><b> No
																												Data Found!<i class="fa fa-exclamation"></i>
																										</b></TD>
																									</tr>
																									<%
																									} else {

																									for (AccountVo ac1 : listrev) {
																									%>

																									<tr class="even" role="row">
																										<TD><%=ac1.getCaseid()%></TD>
																										<TD><%=ac1.getPrevious_amount()%></TD>
																										<TD><%=ac1.getNew_amount()%></TD>
																										<TD><%=ac1.getRemarks()%></TD>
																										<TD><%=ac1.getDate()%></TD>
																									</tr>
																									<%
																									}
																									}
																									%>
																									<%--   	     <%  int r=0;
for(AccountVo AccountVo2:list){
	r++;  

%>
	
		<tr class="even" role="row">
			    <TD><%=i %></TD>
			  
                <TD><%=AccountVo2.getModepayment() %></TD>
  			    <TD> <%=AccountVo2.getPaidAmount() %> 	
  			      <TD> <%=AccountVo2.getSubmitted_amount() %> 	
  			        <TD> <%=AccountVo2.getRevoke_amount() %> 	
  			          <TD> <%=AccountVo2.getTotal() %> 	
  			               <TD> <%=AccountVo2.getRemarks() %>
  			                 <TD> <%=AccountVo2.getDate() %></TD>    
  			    		    
  			  
  			    </TD>
			</tr>
	
<% }%>	 --%>


																								</tbody>
																							</table>

																							<br> <br>

																						</div>
																					</div>

																				</td>
																			</tr>
																		</thead>
																	</table>

																	<div class="bottomMenu"></div>

																</div>
															</div>

														</div>
														<!-- end amt change -->
												</div>
											</div>
										</div>
										<!-- container-->
									</div>

									<div id="hollowtagform">
										<div class="container" style="width: 99%;">
											<div class="panel panel-info">
												<div class="panel-heading ">Hollow Tag</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<table role="grid"
														class="table table-bordered table-striped table-striped table-hover dataTable">
														<thead style="background: black; color: white;">

															
															<tr>
																<th data-field="date" style="width: 180px;">Date</th>
																<th>Decision</th>
																<th data-field="noofaligner" colspan="2">No of
																	Aligner Upper/Lower(F/T)</th>
																<th>Prepare Done</th>
																<th>Export Done</th>
																<th>Export Error</th>
																<th>Hollow</th>
																<th>Tag</th>
																<th>Model Checked</th>
																<th>Sculpt Done</th>	
																<th data-field="trackid" style="width: 550px;">Remarks</th>
															</tr>
														</thead>
														<tbody>
															<%
															while (resulthltg.next()) {

																String hlwdtdate = resulthltg.getString("date");
																String upper_aligner_from = resulthltg.getString("upper_aligner_from");
																String upper_aligner_to = resulthltg.getString("upper_aligner_to");
																String lower_aligner_from = resulthltg.getString("lower_aligner_from");
																String lower_aligner_to = resulthltg.getString("lower_aligner_to");
																String remark = resulthltg.getString("remark");
																String prepare_done = resulthltg.getString("prepare_done");
																String export_done = resulthltg.getString("export_done");
																String export_error = resulthltg.getString("export_error");
																String hollow = resulthltg.getString("hollow");
																String tag = resulthltg.getString("tag");
																String model_checked = resulthltg.getString("model_checked");
																String sculpt_done = resulthltg.getString("sculpt_done");
																String decision = resulthltg.getString("decesion");
																
																if(prepare_done==null)
																	prepare_done="";
																if(export_done==null)
																	export_done="";
																if(export_error==null)
																	export_error="";
																if(hollow==null)
																	hollow="";
																if(tag==null)
																	tag="";
																if(model_checked==null)
																	model_checked="";
																if(sculpt_done==null)
																	sculpt_done="";
																if(decision.equals("Y"))
																	decision="Work in progress";
																	
																
															%>
															<tr>
																<td><%=hlwdtdate%></td>
																<td><%=decision%></td>
																<td><%=upper_aligner_from%>-<%=upper_aligner_to%></td>
																<td><%=lower_aligner_from%>-<%=lower_aligner_to%></td>
																<td><%= prepare_done%></td>
																<td><%= export_done%></td>
																<td><%= export_error%></td>
																<td><%= hollow%></td>
																<td><%=tag %></td>
																<td><%=model_checked %></td>
																<td><%= sculpt_done%></td>
																<td><%=remark%></td>
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
									
									
																		<div id="billingHistoryForm">
										<div class="container" style="width: 99%;">
											<div class="panel panel-info">
												<div class="panel-heading ">Billing History</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<table role="grid"
														class="table table-bordered table-striped table-striped table-hover dataTable">
														<thead style="background: black; color: white;">

															<tr>
																<th class="sorting">Case Id</th>
																<th class="sorting">Dispatched Id</th>
																<th class="sorting">Patient Name</th>
																<th class="sorting">Doctor Name</th>
																<th class="sorting">Upper DIspatched</th>
																<th class="sorting">Lower Dispatched</th>
																<th class="sorting">Payment Bill Status</th>
																<th class="sorting">Payment Bill Status Remarks</th>
																<th class="sorting">User</th>
																<th class="sorting">Date</th>
															</tr>
														</thead>
														<tbody>
														<%
															while (dispatch_rs.next()) {

																String case_id = dispatch_rs.getString("case_id");
																String dispatched_id = dispatch_rs.getString("dispatched_id");
																String patientName = dispatch_rs.getString("patient_name");
																String doctorName = dispatch_rs.getString("doctor_name");
																String lowerDispatched = dispatch_rs.getString("lower_dispatched");
																String upperDispatched = dispatch_rs.getString("upper_dispatched");
																String paymentBillStatus = dispatch_rs.getString("payment_bill_status");
																String paymentBillStatusRemarks = dispatch_rs.getString("payment_bill_status_remarks");
																String user = dispatch_rs.getString("user_name");
																String createdDate = dispatch_rs.getString("created_at");
															%>
															<tr>
																<td><%=case_id%></td>
																<td><%=dispatched_id%></td>
																<td><%=patientName%></td>
																<td><%=doctorName%></td>
																<td><%=upperDispatched%></td>
																<td><%=lowerDispatched%></td>
																<td><%=paymentBillStatus%></td>
																<td><%=paymentBillStatusRemarks%></td>
																<td><%=user%></td>
																<td><%=createdDate%></td>
																
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
									
									
									
									
									<div id="cadbsForm">
										<div class="container" style="width: 99%;">
											<div class="panel panel-info">
												<div class="panel-heading ">CADBS</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<table role="grid"
														class="table table-bordered table-striped table-striped table-hover dataTable">
														<thead style="background: black; color: white;">

															<tr>
																<th class="sorting">Case Id</th>
																<th class="sorting">Patient Name</th>
																<th class="sorting">Doctor Name</th>
																<th class="sorting">CRM</th>
																<th class="sorting">Basing</th>
																<th class="sorting">Basing Bite</th>
																<th class="sorting">Basing Model Repair</th>
																<th class="sorting">Basing Sculpt</th>
																<th class="sorting">Segmentation</th>
																<th class="sorting">Super Imposition Best Fit</th>
																<th class="sorting">Super Imposition Normal</th>
																<th class="sorting">User</th>
																<th class="sorting">Decision</th>
																<th class="sorting">Remarks</th>
																<th class="sorting">Date</th>
															</tr>
														</thead>
														<tbody>
														<%
															while (cadbs_rs.next()) {

																String case_id = cadbs_rs.getString("case_id");
																String patientName = cadbs_rs.getString("patient_name");
																String doctorName = cadbs_rs.getString("doctor_name");
																String crm1 = cadbs_rs.getString("crm");
																String basing = cadbs_rs.getString("basing");
																String basing_bite = cadbs_rs.getString("basing_bite");
																String basing_model_repair = cadbs_rs.getString("basing_model_repair");
																String basing_sculpt = cadbs_rs.getString("basing_sculpt");
																String segmentation = cadbs_rs.getString("segmentation");
																String si_best_fit = cadbs_rs.getString("si_best_fit");
																String si_normal = cadbs_rs.getString("si_normal");
																String user = cadbs_rs.getString("user");
																String decision = cadbs_rs.getString("decision");
																String remarks1 = cadbs_rs.getString("remarks");
																String date1 = cadbs_rs.getString("date");
																
																if(decision.equals("Y"))
																	decision = "Work in progress";
																
															%>
															<tr>
																<td><%=case_id%></td>
																<td><%=patientName%></td>
																<td><%=doctorName%></td>
																<td><%=crm1%></td>
																<td><%=basing%></td>
																<td><%=basing_bite%></td>
																<td><%=basing_model_repair%></td>
																<td><%=basing_sculpt%></td>
																<td><%=segmentation%></td>
																<td><%=si_best_fit%></td>
																<td><%=si_normal%></td>
																<td><%=user%></td>
																<td><%=decision%></td>
																<td><%=remarks1%></td>
																<td><%=date1%></td>
																
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
									

									<div id="3dprintingform">

										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">3D Printing</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<table role="grid"
														class="table table-bordered table-striped table-striped table-hover dataTable">
														<thead style="background: black; color: white;">

															<tr>
																<th data-field="date" style="width: 180px;">Date</th>
																<th data-field="deliverynoteno" style="width: 98px;">Print</th>
																<th data-field="address" style="width: 97px;">Mode</th>
																<th data-field="noofaligner" colspan="2"
																	style="width: 60px;">No of Aligner
																	Upper/Lower(F/T)</th>
																<th data-field="trackid" style="width: 380px;">Remarks</th>
															</tr>
														</thead>
														<tbody>
															<%
															while (result3dp.next()) {

																String threedpdate = result3dp.getString("date");
																String print = result3dp.getString("print");
																String mode = result3dp.getString("mode");

																String upper_aligner_from = result3dp.getString("upper_aligner_from");
																String upper_aligner_to = result3dp.getString("upper_aligner_to");
																String lower_aligner_from = result3dp.getString("lower_aligner_from");
																String lower_aligner_to = result3dp.getString("lower_aligner_to");
																String remark = result3dp.getString("remark");
															%>
															<tr>
																<td><%=threedpdate%></td>
																<td><%=print%></td>
																<td><%=mode%></td>
																<td><%=upper_aligner_from%>-<%=upper_aligner_to%></td>
																<td><%=lower_aligner_from%>-<%=lower_aligner_to%></td>
																<td><%=remark%></td>
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


									<div id="staggingform">
									 <br>
               

										
									
										<%
										int m = 1;
										while (resultstg.next()) {

											String upper_aligner_from = resultstg.getString("upper_aligner_from");
											String upper_aligner_to = resultstg.getString("upper_aligner_to");
											String lower_aligner_from = resultstg.getString("lower_aligner_from");
											String lower_aligner_to = resultstg.getString("lower_aligner_to");
											String thick_upper = resultstg.getString("thick_upper");
											String thick_lower = resultstg.getString("thick_lower");
											String margin_upper = resultstg.getString("margin_upper");
											String margin_lower = resultstg.getString("margin_lower");
											String molor_upper = resultstg.getString("molor_upper");
											String molor_lower = resultstg.getString("molor_lower");
											String sheet_type = resultstg.getString("sheet_type");
											if (upper_aligner_from != null && upper_aligner_to != null && lower_aligner_from != null && lower_aligner_to != null
											&& thick_upper != null && thick_lower != null && margin_upper != null && margin_lower != null
											&& molor_upper != null && molor_lower != null && sheet_type != null) {
										%>


										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">
													Stagging
													<%=m%></div>
												<div class="panel-body" style="padding: 14px !important;">
													<div class="row">
																	<label class="control-label col-lg-3 col-md-3 col-sm-3">No of Upper Aligners</label>
																	<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
																		<div class="input-group">
																			<input type="text"
																				style="width: 28%; margin-right: 13px;" disabled
																				class="form-control" id="upper_aligner_from"
																				name="upper_aligner_from"
																				value="<%=upper_aligner_from%>"> <input
																				type="text" style="width: 28%;" disabled
																				class="form-control" id="upper_aligner_to"
																				name="upper_aligner_to" value="<%=upper_aligner_to%>">

															</div>
														</div>

														<label class=" control-label col-lg-3 col-md-3 col-sm-3">No of Lower Aligners
														</label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<div class="input-group">
																<input type="text"
																	style="width: 28%; margin-right: 13px;" disabled
																	class="form-control" id="lower_aligner_from"
																	name="lower_aligner_from"
																	value="<%=lower_aligner_from%>"> <input
																	type="text" style="width: 28%;" disabled
																	class="form-control" id="lower_aligner_to"
																	name="lower_aligner_to" value="<%=lower_aligner_to%>">

															</div>
														</div>

													</div>

													<div class="row">
														<label class="control-label col-lg-3 col-md-3 col-sm-3">Thickness Upper </label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="thick_upper"
																id="thick_upper" value="<%=thick_upper%>">
														</div>
														<label class="control-label col-lg-3 col-md-3 col-sm-3">Thickness Lower </label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="thick_lower"
																id="thick_lower" value="<%=thick_lower%>">
														</div>
													</div>
													<br>
													<div class="row">
														<label class="control-label col-lg-3 col-md-3 col-sm-3">Margin Upper</label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="margin_upper"
																id="margin_upper" value="<%=margin_upper%>">
														</div>
														<label class="control-label col-lg-3 col-md-3 col-sm-3">Margin Lower </label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="margin_lower"
																id="margin_lower" value="<%=margin_lower%>">
														</div>
													</div>
													<br>
													<div class="row">
														<label class="control-label col-lg-3 col-md-3 col-sm-3">3rd Molar Upper </label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="molor_upper"
																id="molor_upper" value="<%=molor_upper%>">
														</div>
														<label class="control-label col-lg-3 col-md-3 col-sm-3">3rd Molar Lower</label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="molor_lower"
																id="molor_lower" value="<%=molor_lower%>">
														</div>
													</div>
													<br>
													<div class="row">
														<label class="control-label col-lg-3 col-md-3 col-sm-3">Sheet Type </label>
														<div class="input-group-block col-lg-3 col-md-3 col-sm-3">
															<input type="text" disabled
																class="form-control form-control-lg" name="sheet_type"
																id="sheet_type" value="<%=sheet_type%>">
														</div>
													</div>
													<br>
 

												</div>
											</div>
											
											 	
										</div>
										<!-- container-->
										
										
										<%
										m++;
										}
										}
										%>
									</div>
									<div id="addresslogsform">
										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">Address Logs</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<div class="table-responsive">
														<table role="grid"
															class="table table-bordered table-striped table-striped table-hover dataTable">
															<thead style="background: black; color: white;">
																<tr>
																	<!-- <th>Case Id</th> -->
																	<th>Address</th>
																	<th>Remarks</th>
																	<th>Decision</th>
																	<th>User</th>
																	<th>Date</th>
																</tr>
															</thead>
															<tbody>

																<%
																PreparedStatement pstmtal = con
																		.prepareStatement("select * from address_logs where case_id=? order by created_on desc ");
																pstmtal.setString(1, caseId);
																ResultSet rsal = pstmtal.executeQuery();
																while (rsal.next()) {
																	String case_id = rsal.getString("case_id");
																	String aaddress = rsal.getString("address");
																	String adecision = rsal.getString("decision");
																	String acreated_on = rsal.getString("created_on");
																	String auser_id = rsal.getString("user_id");
																	String aremarks = rsal.getString("remarks");

																	if (case_id == null || case_id == "") {
																		case_id = rsal.getString("case_id");
																	}

																	if (aaddress == null || aaddress == "") {
																		aaddress = rsal.getString("address");
																	}

																	if (adecision.equals("Y")) {
																		adecision = "Work-In-Progress";
																	}

																	if (aremarks == null || aremarks == "") {
																		aremarks = rsal.getString("remarks");
																	}
																	if (case_id.equals("")) {
																%>
																<tr>
																	<td colspan="6" align="center">No data found!</td>
																</tr>
																<%
																} else {
																%>

																<tr>
																	<%-- <td><%=case_id %></td> --%>
																	<td><%=aaddress%></td>
																	<td><%=aremarks%></td>
																	<td><%=adecision%></td>
																	<td><%=auser_id%></td>
																	<td><%=acreated_on%></td>
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
										</div>
										<!-- container-->
									</div>

									<div id="holdfrm">
										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">Hold Cases</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<div class="table-responsive">
														<table role="grid"
															class="table table-bordered table-striped table-striped table-hover dataTable">
															<thead style="background: black; color: white;">
																<tr>
																	<th>User</th>
																	<th>Case Id</th>
																	<th>Date of hold</th>
																	<th>Remarks</th>
																</tr>
															</thead>
															<tbody>

																<%
																PreparedStatement pstmhold = con
																		.prepareStatement(" select * from holdstatus where status='Hold' and caseid='" + caseId + "' ");
																ResultSet rshld = pstmhold.executeQuery();
																while (rshld.next()) {
																	String hldcase_id = rshld.getString("caseid");
																	String hlduser_id = rshld.getString("userid");
																	String hldremarks = rshld.getString("remarks");
																	String hlddate = rshld.getString("InsertDatetime");

																	if (hldcase_id != null || !hldcase_id.equals(""))
																		hldcase_id = rshld.getString("caseid");
																	else
																		hldcase_id = "";

																	if (hlduser_id != null || !hlduser_id.equals(""))
																		hlduser_id = rshld.getString("userid");
																	else
																		hlduser_id = "";

																	if (hldremarks != null || !hldremarks.equals(""))
																		hldremarks = rshld.getString("remarks");
																	else
																		hldremarks = "";

																	if (hlddate != null || !hlddate.equals(""))
																		hlddate = rshld.getString("InsertDatetime");
																	else
																		hlddate = "";

																	if (hldcase_id.equals("") || hldcase_id == null) {
																%>
																<tr>
																	<td colspan="4" align="center">No data found!</td>
																</tr>
																<%
																} else {
																%>

																<tr>
																	<td><%=hlduser_id%></td>
																	<td><%=hldcase_id%></td>
																	<td><%=hlddate%></td>
																	<td><%=hldremarks%></td>
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
										</div>
										<!-- container-->
									</div>
									<div id="unholdfrm">
										<div class="container">
											<div class="panel panel-info">
												<div class="panel-heading ">UnHold Cases</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<div class="table-responsive">
														<table role="grid"
															class="table table-bordered table-striped table-striped table-hover dataTable">
															<thead style="background: black; color: white;">
																<tr>
																	<th>User</th>
																	<th>Case Id</th>
																	<th>Date of Unhold</th>
																	<th>Remarks</th>
																</tr>
															</thead>
															<tbody>

																<%
																PreparedStatement pstmuhold = con
																		.prepareStatement(" select * from holdstatus where status='UnHold' and caseid='" + caseId + "' ");
																ResultSet rsunhld = pstmuhold.executeQuery();
																while (rsunhld.next()) {
																	String unhldcase_id = rsunhld.getString("caseid");
																	String unhlduser_id = rsunhld.getString("userid");
																	String unhldremarks = rsunhld.getString("remarks");
																	String unhlddate = rsunhld.getString("InsertDatetime");

																	if (unhldcase_id != null || !unhldcase_id.equals(""))
																		unhldcase_id = rsunhld.getString("caseid");
																	else
																		unhldcase_id = "";

																	if (unhlduser_id != null || !unhlduser_id.equals(""))
																		unhlduser_id = rsunhld.getString("userid");
																	else
																		unhlduser_id = "";

																	if (unhldremarks != null || !unhldremarks.equals(""))
																		unhldremarks = rsunhld.getString("remarks");
																	else
																		unhldremarks = "";

																	if (unhlddate != null || !unhlddate.equals(""))
																		unhlddate = rsunhld.getString("InsertDatetime");
																	else
																		unhlddate = "";

																	if (unhldcase_id.equals("") || unhldcase_id == null) {
																%>
																<tr>
																	<td colspan="4" align="center">No data found!</td>
																</tr>
																<%
																} else {
																%>

																<tr>
																	<td><%=unhlduser_id%></td>
																	<td><%=unhldcase_id%></td>
																	<td><%=unhlddate%></td>
																	<td><%=unhldremarks%></td>
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
										</div>
										<!-- container-->
									</div>

									<div id="rptForm">
										<div class="container" style="width: 99%;">
											<div class="panel panel-info">
												<div class="panel-heading ">Repeat Case Details</div>
												<div class="panel-body"
													style="overflow: scroll; padding: 0px !important;">
													<table role="grid"
														class="table table-bordered table-striped table-striped table-hover dataTable">
														<thead style="background: black; color: white;">
															<tr>
																<th class="sorting">Case Id</th>
																<th class="sorting">Patient Name</th>
																<th class="sorting">Doctor Name</th>
																<th class="sorting">Issue</th>
																<th class="sorting">Upper Aligner</th>
																<th class="sorting">Lower Aligner</th>
																<th class="sorting">Previous Upper Aligner sheet</th>
																<th class="sorting">Previous Upper Thichness</th>
																<th class="sorting">Previous Lower Aligner Sheet</th>
																<th class="sorting">Previous Lower Thichness</th>
																<th class="sorting">New Uper Aligner Sheet</th>
																<th class="sorting">New Upper Thichness</th>
																<th class="sorting">New Lower Aligner Sheet</th>
																<th class="sorting">New Lower Thichness</th>
																<th class="sorting">Photos</th>
																<th class="sorting">Malocclusion</th>
																<th class="sorting">WFC remarks</th>
																<th class="sorting">Planning_remarks</th>
																<th class="sorting">Last Modify Date</th>
															</tr>
														</thead>
														<tbody>
														<%
														List<Newcase1> sheetvo = LoginDAO.getPLNSheet();
														List<Newcase1> rptIssue = LoginDAO.getRPIssue();
														String SheetId = null;
														String SheetName1 = null;
														String SheetName2 = null;
														String SheetName3 = null;
														String SheetName4 = null;
														String issueName="";

															while (rpt_rs.next()) {

																String case_id = rpt_rs.getString("case_id");
																String patientName = rpt_rs.getString("doctor_name");
																String doctorName = rpt_rs.getString("patient_name");
																String issue = rpt_rs.getString("issue");
																upper_aligner = rpt_rs.getString("upper_aligner");
																lower_aligner = rpt_rs.getString("lower_aligner");
																String pre_ua_sheet = rpt_rs.getString("pre_ua_sheet");
																String pre_u_thichness = rpt_rs.getString("pre_u_thichness");
																String pre_la_sheet = rpt_rs.getString("pre_la_sheet");
																String pre_l_thichness = rpt_rs.getString("pre_l_thichness");
																String new_ua_sheet = rpt_rs.getString("new_ua_sheet");
																String new_u_thichness = rpt_rs.getString("new_u_thichness");
																String new_la_sheet = rpt_rs.getString("new_la_sheet");
																String new_l_thichness = rpt_rs.getString("new_l_thichness");
																String photos = rpt_rs.getString("photos");
																String malocclusion = rpt_rs.getString("malocclusion");
																String rpt_wfc_remarks = rpt_rs.getString("rpt_wfc_remarks");
																String rpt_pln_remarks = rpt_rs.getString("rpt_pln_remarks");
																String modified_at = rpt_rs.getString("modified_at");
																
																if (patientName == null)
																	patientName = "";
																
																if (doctorName == null)
																	doctorName = "";
																
																if (issue == null)
																	issue = "";
																
																if (upper_aligner == null)
																	upper_aligner = "";
																
																if (lower_aligner == null)
																	lower_aligner = "";
																
																	for (Newcase1 Newcase1 : sheetvo) {
																		if (pre_ua_sheet.equals(Newcase1.getSheetId())) {
																			SheetName1= Newcase1.getSheetname();
																	}
																	}
																
																	for (Newcase1 Newcase1 : sheetvo) {
																		if (pre_la_sheet.equals(Newcase1.getSheetId())) {
																			SheetName2= Newcase1.getSheetname();
																	}
																	}
																
																	for (Newcase1 Newcase1 : sheetvo) {
																		if (new_ua_sheet.equals(Newcase1.getSheetId())) {
																			SheetName3= Newcase1.getSheetname();
																	}
																	}
																
																	for (Newcase1 Newcase1 : sheetvo) {
																		if (new_la_sheet.equals(Newcase1.getSheetId())) {
																			SheetName4= Newcase1.getSheetname();
																	}
																	}
																																
																	for (Newcase1 issueList : rptIssue) {
																		if (issue.equals(issueList.getIssueid())) {
																			issueName= issueList.getIssuename();

																			}
																		}
																	
																if (pre_ua_sheet == null)
																	pre_ua_sheet = "";
																
																if (pre_u_thichness == null)
																	pre_u_thichness = "";
																
																if (pre_la_sheet == null)
																	pre_la_sheet = "";
																
																if (pre_l_thichness == null)
																	pre_l_thichness = "";
																
																if (new_ua_sheet == null)
																	new_ua_sheet = "";
																
																if (new_u_thichness == null)
																	new_u_thichness = "";
																
																if (new_la_sheet == null)
																	new_la_sheet = "";
																
																if (new_l_thichness == null)
																	new_l_thichness = "";
																
																if (photos == null)
																	photos = "";
																
																if (malocclusion == null)
																	malocclusion = "";
																
																if (rpt_wfc_remarks == null)
																	rpt_wfc_remarks = "";
																
																if (rpt_pln_remarks == null)
																	rpt_pln_remarks = "";
																
																if (modified_at == null)
																	modified_at = "";																
															%>
															<tr>
																<td align="center"><%=case_id%></td>
																<td align="center"><%=patientName%></td>
																<td align="center"><%=doctorName%></td>
																<td align="center"><%=issueName%></td>																
																<td align="center"><%=upper_aligner%></td>
																<td align="center"><%=lower_aligner%></td>
																<td align="center"><%=SheetName1%></td>
																<td align="center"><%=pre_u_thichness%></td>
																<td align="center"><%=SheetName2%></td>
																<td align="center"><%=pre_l_thichness%></td>
																<td align="center"><%=SheetName3%></td>
																<td align="center"><%=new_u_thichness%></td>
																<td align="center"><%=SheetName4%></td>
																<td align="center"><%=new_l_thichness%></td>
																<td align="center"><%=photos%></td>
																<td align="center"><%=malocclusion%></td>
																<td align="center"><%=rpt_wfc_remarks%></td>
																<td align="center"><%=rpt_pln_remarks%></td>
																<td align="center"><%=modified_at%></td>
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


								<div id="thirdform">
									<div class="container" style="width: 97%;">
										<div class="panel panel-info">
											<div class="panel-heading ">Decision and History</div>
											<div class="panel-body"
												style="overflow: scroll; padding: 0px !important;">
												<form name="MyInvoiceForm" id="MyInvoiceForm" method="post"
													action="${pageContext.request.contextPath}/GenerateBarCodeServlet"
													target="_self">
													<%
													List<DisplayDecision> list1 = displayDecisionList;
													%>

													<table id="myinvoice"
														class="table  table-striped table-hover dataTable">
														<thead>
															<tr>
																<td colspan="9">
																	<div class="col-lg-12" style="padding: 0px;">
																		<div class="table-responsive ">
																			<table role="grid" id="example"
																				class="table table-bordered table-striped table-striped table-hover dataTable">
																				<thead style="background: black; color: white;">
																					<TR>

																						<!-- <TH class="sorting">STAGE</TH> -->
																						<TH class="sorting">USER</TH>
																						<TH class="sorting">DECISION</TH>
																						<TH class="sorting">REMARKS</TH>
																						<TH class="sorting">DATE AND TIME</TH>

																					</TR>





																				</thead>
																				<%
																				for (DisplayDecision decisionVO : list1) {
																					String decision = decisionVO.getDecision();
																					if (decision.equals("Y")) {
																						decision = "Work-In-Progress";
																					} else {
																						decision = decisionVO.getDecision();
																					}
																				%>
																				<tbody>

																					<TR class="even">
																						<%-- <TD><%=decisionVO.getStage()%></td> --%>
																						<TD><%=decisionVO.getUserName()%></td>
																						<TD><%=decision%></TD>
																						<TD><%=decisionVO.getRemarks()%></TD>
																						<TD><%=decisionVO.getDateTime()%></TD>

																					</TR>

																					<%
																					}
																					%>







																				</tbody>
																			</table>

																			<br> <br>

																		</div>
																	</div>

																</td>
															</tr>
														</thead>

														<div class="bottomMenu"></div>
														<input type="hidden" name="InvoiceNumber"
															id="InvoiceNumber" value=""></input>
														<input type="hidden" name="InvoiceNo" id="InvoiceNo"
															value=""></input>
														<input type="hidden" name="BarcodeNumber"
															id="BarcodeNumber" value=""></input>
														<input type="hidden" name="TransactionNo"
															id="TransactionNo" value=""></input>
														<input type="hidden" name="InvPage" id="InvPage" value=""></input>

														<input type="hidden" name="InvoiceData" id="InvoiceData"
															value=""></input>
														<input type="hidden" name="hiddenInvoiceNumber"
															id="hiddenInvoiceNumber"></input>
														<input type="hidden" name="InvoicesDetails"
															id="InvoicesDetails"></input>
														<input type="hidden" name="currentInvoice"
															id="currentInvoice"></input>


														</div>

														</div>
														</div>
														</form>
														</div>
														</div>
														</div>
														<!-- container-->









														<!-- 
			<div class="table-responsive">
				<table class="table table-no-bordered">
					<tr>

						<td width="50%"><input class="btn btn-success" type="hidden"
							id="BtnSubmit" name="BtnSubmit" value='submitButton' disabled /></td>
						<td width="50%"><a class="btn btn-primary"
							style="display: none;" id="pendingSubmit"
							style="margin-left:-66px;" name="BtnSubmit1"
							onclick="genrateDocs()">GenerateBarcode</a>
						<td width="50%"><input class="btn btn-success" type="button"
							id="createSubmit" name="createSubmit" value='submitButton'
							onclick='pendingSubmit()' /></td>



					</tr>

				</table>
			</div> -->
														</form>


														</div>
														</div>




														<div id="customModal"></div>
														<!-- Modal -->

														<div class="modal fade" id="myModal" style="z-index: 10"
															role="dialog">
															<div class="modal-dialog modal-md">
																<!--  Modal content -->
																<div class="modal-content">
																	<div class="modal-header">
																		<button id="popupclose" type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<button class="close modalMinimize" id="maximize">
																			<i class='fa fa-compress'></i>
																		</button>
																	</div>
																	<div class="modal-body">
																		<iframe width="480" height="360" id="DocView"
																			class="embed-responsive-item"></iframe>
																		<div class="embed-responsive embed-responsive-4by3"></div>
																	</div>
																	<div class="modal-footer">
																		<button type='button'
																			class='btn btn-primary custombutton close'
																			data-dismiss="modal">Close</button>

																	</div>
																</div>

															</div>
														</div>

														<script
															src="${pageContext.request.contextPath}/JavaScript/jquery-ui.js"></script>

														</div>
														</div>

														<script>
$( document ).ready(function() {
<%-- 
	//trsting
	
	var reviewgridcontent='<%=reviewnumbergrid%>';
	var sreviewgridcontent=reviewgridcontent.split('#');
	
	
	for (index = 1; index <= sreviewgridcontent.length; index++) { 
		
		document.getElementbyId("reviewnumberr"+index+"c0").disabled=true;
		//id="reviewnumberr'+roid+'c0"
		document.getElementbyId("reviewnumberr"+index+"c1").disabled=true;
		document.getElementbyId("reviewnumberr"+index+"c2").disabled=true;
		document.getElementbyId("reviewnumberr"+index+"c3").disabled=true;
		
		
	}
	
	//testing --%>
	
	
	
	
	var currentstage='<%=nextStage%>';
	
	
/* 	 $.ajax({
			

		    type : 'POST',
			data : {stage:currentstage},
			url : 'geteditables',
			success : function(responseText) {
				var x=responseText.slice(1);
				//alert(x);
				var array = x.split(","); 
				//alert(array[0]);
				
				for (index = 0; index < array.length; index++) { 
					alert(array[index]);
					
					
					document.getElementById(array[index]).disabled = false;
				} 
								
			}

			
		  
			 
		}); */
	 
	
	
	
	
	
  $("input").keydown(function(){
 

		
		var caseidcheck='<%=abc%>';
		var logusernamecheck='<%=logusername%>';	
				
				
				
				$.ajax({
					  	    type : 'POST',
			  		data : {a:caseidcheck,b:logusernamecheck},
			  		url : 'hehe',
			  		success : function(responseText) {
							
			  			
						var x=responseText;
						var n = x.localeCompare("allowed");
					
						if(n==0){
						}
						
						else{
							
							alert(x);
							window.location = "Dashboard.jsp";
						}
			  		}
			  
			 	});
				
	  
	  
	  
	  
  });
 
});




function amitcheck(){
	
	
	
	alert("jdfbhdfb");
}
</script>



														<script>
var totalRowAdded='';
function getData(cell){
	
	var table = document.getElementById('payment');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded);
	for (var r = 1;r < totalRowAdded; r++) {
    	if(document.getElementById('paymentr'+r+'c0')!=null){   		
    		for (var c = 0; c < 3; c++) {
            	rowContent=rowContent+'~'+document.getElementById("paymentr"+r+"c"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
 // alert(tableContent);
   return tableContent;
}






var totalRowAdded1='';
function getData1(cell){
	
	var table1 = document.getElementById('reviewnumber');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded1);
	for (var r = 1;r < totalRowAdded1; r++) {
    	if(document.getElementById('reviewnumberr'+r+'c0')!=null){   		
    		for (var c = 0; c < 4; c++) {
            	rowContent=rowContent+'~'+document.getElementById("reviewnumberr"+r+"c"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
  tableContent=tableContent.substring(1, tableContent.length);
   //alert(tableContent);
   return tableContent;
}





var totalRowAdded2='';


function getData2(cell){
	
	var table1 = document.getElementById('table3');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded2);
	for (var r = 1;r < totalRowAdded2; r++) {
    	if(document.getElementById('table3r'+r+'c0')!=null){   		
    		for (var c = 0; c < 4; c++) {
            	rowContent=rowContent+'~'+document.getElementById("table3r"+r+"c"+c).value;
                
            }
    		
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
    	
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
   // alert(tableContent);
   return tableContent;
}



          var totalRowAdded4='';
          function getData4(cell){
          	
          	var table1 = document.getElementById('table4');
          	var rowContent='';
          	var tableContent='';
          	var cellcount='';
          	//alert('totalRowAdded '+totalRowAdded1);
          	alert("values of rows  "  +totalRowAdded4)
          	for (var r = 1;r <totalRowAdded4; r++) {
          	//	alert("dsbvfdvhfjhd   "+document.getElementById('planningr'+r+'c0'));
              	if(document.getElementById('planningr'+r+'c0')!=null){   		
              		for (var c = 0; c < cell; c++) {
              			//alert("amit");
                      	rowContent=rowContent+'~'+document.getElementById("planningr"+r+"c"+c).value;
                          
                      }
              		rowContent=rowContent.substring(1, rowContent.length);
              	      // alert('rowContent'+rowContent);
              	        tableContent=tableContent+'#'+rowContent;
              	        rowContent='';
              	}
                  
              }
            tableContent=tableContent.substring(1, tableContent.length);
             //alert(tableContent);
             return tableContent;
          }











function getselectvalues(){
	
	
	var table1 = document.getElementById('table3');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded2);
	for (var r = 1;r < totalRowAdded2; r++) {
    	if(document.getElementById('table3r'+r+'select1')!=null){   		
    		for (var c = 1; c < 5; c++) {
            	rowContent=rowContent+'~'+document.getElementById("table3r"+r+"select"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
   // alert(tableContent);
   return tableContent;
	
	
	
}



function getselectvalues5(){
	
	
	var table1 = document.getElementById('table5');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded2);
	for (var r = 1;r < totalRowAdded5; r++) {
    	if(document.getElementById('table5r'+r+'select1')!=null){   		
    		for (var c = 1; c < 5; c++) {
            	rowContent=rowContent+'~'+document.getElementById("table5r"+r+"select"+c).value;
                
            }
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
   // alert(tableContent);
   return tableContent;
	
	
	
}





function getAtt(){
	
	var table1 = document.getElementById('table3');
	var rowContent='';
	var tableContent='';
	var cellcount='';
	//alert('totalRowAdded '+totalRowAdded2);
	for (var r = 1;r < totalRowAdded2; r++) {
    	if(document.getElementById('table3r'+r+'select1')!=null){   		
    		
            	rowContent=rowContent+'~'+document.getElementById("att"+r).checked;
                
            
    		rowContent=rowContent.substring(1, rowContent.length);
    	      // alert('rowContent'+rowContent);
    	        tableContent=tableContent+'#'+rowContent;
    	        rowContent='';
    	}
        
    }
    tableContent=tableContent.substring(1, tableContent.length);
   // alert(tableContent);
   return tableContent;
	
	
}





$(document).ready(function (){
	
	
	var profile="<%=profile%>";
	
	//console.log("profile  : "+profile);
	if(profile.localeCompare("admin")===0){
		
		$("#editbutton").show();
		document.getElementById("user_id").disabled=false;
		
		
	}
	else if(profile.localeCompare("crm")===0){
		
		document.getElementById("user_id").disabled=false;
		
	}
	
	
	var rd='<%=rs.getString("registered_doctor")%>';
	
	$("#registered_doctor").html(rd);
	document.getElementById("registered_doctor").value=rd;
	/* document.getElementById("r_doctor").value=rd; */
	
	
//	var registered_doctor = $('#registered_doctor').val();
   <%-- 	var prerequisite1 ='<%=rs.getString("prerequisite")%>'; --%>
   	
	//document.getElementById("prerequisite1").value=prerequisite1;
	
	<%-- var case_rnumber='<%=rs.getString("case_number")%>'; --%>
	/* document.getElementById("case_rnumber").value=case_rnumber; */
	
	
   	var case_number1 = '<%=caseId%>';
   	$("#case_number").html(case_rnumber);
	//document.getElementById("case_number").value="";
	
	
   	var user_id1 = '<%=rs.getString("user_id")%>';
   
	document.getElementById("user_id").value=user_id1;
	
	var clinic_name1 = '<%=rs.getString("clinic_name")%>';
	$("#clinic_name").html(clinic_name1);
	document.getElementById("clinic_name").value=clinic_name1;
	
	var clinic_address1 ='<%=rs.getString("address")%>';
   	
	document.getElementById("clinic_address").value=clinic_address1;
		
	<%-- var gp1 ='<%=rs.getString("gp")%>';
	document.getElementById("gp").value=gp1; --%>
	
	var city1 = '<%=rs.getString("city")%>';
	document.getElementById("city").value=city1;
	
	var patient_name1 = '<%=rs.getString("patient_name")%>';
	$("#patient_name").html(patient_name1);
	

	document.getElementById("patient_name").value=patient_name1;
	document.getElementById("p_name").value=patient_name1;
	
	<%-- var patient_age1 ='<%=rs.getString("patient_age")%>';
	document.getElementById("patient_age").value=patient_age1; --%>
	
	<%-- var referred_by1 = '<%=rs.getString("referred_by")%>';
	document.getElementById("referred_by").value=referred_by1; --%>
		
	var type_of_account1 = '<%=rs.getString("t_account")%>';
	document.getElementById("type_of_account").value=type_of_account1;
			
	<%-- var channel1 = '<%=rs.getString("channel")%>';
	document.getElementById("channel").value=channel1; --%>
				
	var corporate_account1 = '<%=rs.getString("corporate_account")%>';
	document.getElementById("corporate_account").value=corporate_account1;
	var kol1 = '<%=rs.getString("kol")%>';
	document.getElementById("kol").value=kol1;
	<%-- var discount1 ='<%=rs.getString("discount")%>';
	document.getElementById("discount").value=discount1; --%>
	var starter_kit1 = '<%=rs.getString("starter_kit")%>';
	document.getElementById("starter_kit").value=starter_kit1;
	<%-- var no_of_aligners1 = '<%=rs.getString("no_of_aligners")%>';
	document.getElementById("no_of_aligners").value=no_of_aligners1; --%>
	<%-- var scanning1 = '<%=rs.getString("scanning")%>';
	document.getElementById("scanning").value=scanning1; --%>
	<%-- var pickup1 = '<%=rs.getString("pickup")%>';
	document.getElementById("pickup").value=pickup1; --%>
 	<%-- var dispatch1 = '<%=rs.getString("dispatch")%>';
	document.getElementById("dispatch").value=dispatch1; --%>
	<%-- var dispatch_to1 = '<%=rs.getString("dispatch_to")%>';
	document.getElementById("dispatch_to").value=dispatch_to1;
	var advance_starter1 = '<%=rs.getString("advance_starter")%>';
	document.getElementById("advance_starter").value=advance_starter1;
	var advance_scanning1 = '<%=rs.getString("advance_scanning")%>';
	document.getElementById("advance_scanning").value=advance_scanning1;
	var scanning_service1 ='<%=rs.getString("scanning_service")%>';
	document.getElementById("scanning_service").value=scanning_service1; --%>
 	<%-- var dispatch_date1 ='<%=rs.getString("dispatch_date")%>';
	document.getElementById("dispatch_date").value=dispatch_date1; --%>
 <%-- 	var person_dispatch1 ='<%=rs.getString("person_dispatch")%>';
	document.getElementById("person_dispatch").value=person_dispatch1;
 	var person_scan1 = '<%=rs.getString("person_scan")%>';
	document.getElementById("person_scan").value=person_scan1; --%>
 	<%-- var bill_to1 ='<%=rs.getString("bill_to")%>';
	document.getElementById("bill_to").value=bill_to1; --%>
 	var gst_number1 = '<%=rs.getString("bgst_no")%>';
	document.getElementById("gst_number").value=gst_number1;
 	<%-- var payment_mode1 = '<%=rs.getString("payment_mode")%>';
	document.getElementById("payment_mode").value=payment_mode1;
 	var wo_number1 = '<%=rs.getString("wo_number")%>';
	document.getElementById("wo_number").value=wo_number1; --%>
 	var priority1 ='<%=rs.getString("priority")%>';
 	$("#priority").html(priority1);
 	document.getElementById("priority1").value=priority1;
 	
 	document.getElementById("priority").value=priority1;
 	<%-- var wo_date1 ='<%=rs.getString("wo_date")%>';
   	
	document.getElementById("wo_date").value=wo_date1; --%>
 	
	<%-- var decision1 = '<%=rs.getString("decision")%>';
	document.getElementById("decision").value=decision1; --%>
	
	
	<%-- var no_of_stages1 = '<%=rs.getString("no_of_stages")%>';
	document.getElementById("no_of_stages").value=no_of_stages1; --%>
 	
	<%-- var current_stage1 ='<%=rs.getString("current_stage")%>';
	document.getElementById("current_stage").value=current_stage1; --%>
 	
	<%-- var no_of_aligners_u_p1 = '<%=rs.getString("no_of_aligners_u_p")%>';
	document.getElementById("no_of_aligners_u_p").value=no_of_aligners_u_p1; --%>
 
	var no_of_aligners_u_a1 ='<%=rs.getString("upper_aligner")%>';
	
 	document.getElementById("no_of_aligners_u_a").value=no_of_aligners_u_a1;
 
 	var no_of_aligners_l_a1='<%=rs.getString("lower_aligner")%>';
   	
	document.getElementById("no_of_aligners_l_a").value=no_of_aligners_l_a1;
 	
	<%-- var no_of_aligners_l_p1 ='<%=rs.getString("no_of_aligners_l_p")%>';
	document.getElementById("no_of_aligners_l_p").value=no_of_aligners_l_p1;
 
	var attachment_applicable1 ='<%=rs.getString("attachment_applicable")%>';
	document.getElementById("attachment_applicable").value=attachment_applicable1;
 
	var dispatch_grid1 = '<%=rs.getString("dispatch_grid")%>';
	document.getElementById("dispatch_grid").value=dispatch_grid1;
 
	var dispatch_date21 = '<%=rs.getString("dispatch_date2")%>';
	document.getElementById("dispatch_date2").value=dispatch_date21;
 
	var data_grid1 = '<%=rs.getString("data_grid")%>';
	document.getElementById("data_grid").value=data_grid1;
 
	var final_amount1 = '<%=rs.getString("final_amount")%>';
	document.getElementById("final_amount").value=final_amount1;

	var status_grid1 = '<%=rs.getString("status_grid")%>';
	document.getElementById("status_grid").value=status_grid1;
 	
	var payment_grid1 = '<%=rs.getString("payment_grid")%>';
	document.getElementById("payment_grid").value=payment_grid1;
  
	var batch_number1 ='<%=rs.getString("batch_number")%>';
	document.getElementById("batch_number").value=batch_number1;
 
	var work_date1 ='<%=rs.getString("work_date")%>';
	document.getElementById("work_date").value=work_date1;
	
	var next_work1 = '<%=rs.getString("next_work")%>';
	document.getElementById("next_work").value=next_work1;
	
	var next_work_date1 = '<%=rs.getString("next_work_date")%>';
	document.getElementById("next_work_date").value=next_work_date1;
	
	var refinement_package1 = '<%=rs.getString("refinement_package")%>';
	document.getElementById("refinement_package").value=refinement_package1;

	var case_review1 ='<%=rs.getString("case_review")%>';
	document.getElementById("case_review").value=case_review1;
 --%>
	

	var table = document.getElementById('payment');
//	alert(table.rows.length);
	var content='<%=payment_grid%>';
	if(content==''){
		totalRowAdded=1;
	}else{
		var sContent=content.split('#');
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td><input type="text" class="form-control" name="name" id="paymentr'+roid+'c0" /></td>';
			cols += '<td><input type="text" class="form-control" name="mail" id="paymentr'+roid+'c1"/></td>';
			cols += '<td><input type="text" class="form-control" name="phone" id="paymentr'+roid+'c2"/></td>';
			 cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
			
			newRow.append(cols);
			 $("#payment").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("paymentr"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	 
	var table = document.getElementById('payment');
	var rowct = table.rows.length;
	//alert(rowct);

    $("#addrow").on("click", function () {
    	
    	totalRowAdded++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input type="text" class="form-control" name="name' + counter + '" id="paymentr'+rowct+'c'+cellct+'" /></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="mail' + counter + '" id="paymentr'+rowct+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="paymentr'+rowct+'c'+cellct+'"/></td>';
        cellct++;
        
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        newRow.append(cols);
        $("#payment").append(newRow);
        counter++;
        rowct++;
        cellct=0;
    });



    $("#payment").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });





    var table1 = document.getElementById('reviewnumber');
//	alert(table1.rows.length);
	var content1='<%=reviewnumbergrid%>';
	
	if(content1==''){
		totalRowAdded1=1;
	}else{
		
		
		var CellContent='';
		//alert(sContent.length);
		
		totalRowAdded1=sContent.length+1;
		
		for (i = 0; i < sContent.length; i++) { 
			CellContent=sContent[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="name" id="reviewnumberr'+roid+'c0" /></center></td>';
			cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="mail" id="reviewnumberr'+roid+'c1"/></center></td>';
			 cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="phone" id="reviewnumberr'+roid+'c2"/></center></td>';
			 cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="phone" id="reviewnumberr'+roid+'c3"/></center></td>';
		
			 cols += '<td width="17%"><center><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
			 cols += '<td width="15%"><center><button type="button"  id="reviewnumberr'+roid+'file" onclick="myFunction111(this.id)">Upload</button></center></td>';
			/*  myFunction111(this.id) */
		      	
			newRow.append(cols);
			 $("#reviewnumber").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("reviewnumberr"+roid+"c"+j).value=CellContent[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
		}
	}
	
	
	
	
	
	
	


	
	
	
	
	
	
	 
	var table1 = document.getElementById('reviewnumber');
	var rowct1 = table1.rows.length;
//	alert(rowct1);

/* 
	
	for (index = 1; index <= rowct1; index++) { 
		
		document.getElementById("reviewnumberr"+index+"c0").disabled=true;
		//id="reviewnumberr'+roid+'c0"
		document.getElementById("reviewnumberr"+index+"c1").disabled=true;
		document.getElementById("reviewnumberr"+index+"c2").disabled=true;
		document.getElementById("reviewnumberr"+index+"c3").disabled=true;
		
		
	}
 */

  
        
  
        
        
       
    // Used to toggle the menu on small screens when clicking on the menu button
    function myFunction() {
        var x = document.getElementById("sidebar");
        if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
        } else { 
            x.className = x.className.replace(" w3-show", "");
        }
    }
    
    
    
 
    
    
    
    
    
    $("#addrow1").on("click", function () {
    	
    	totalRowAdded1++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";
     
       
        cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="name' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'" /></center></td>';
        cellct++;
        
        cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="mail' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></center></td>';
        cellct++;
        cols += '<td width="17%"><center><input width="70%" type="text" class="form-control" name="phone' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></center></td>';
        cellct++;
        cols += '<td width="17%"><center><input width="70%"  type="text" class="form-control" name="phone' + counter + '" id="reviewnumberr'+rowct1+'c'+cellct+'"/></center></td>';
        cellct++;
        
        cols += '<td width="17%"><center><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
        cellct++;
        cols += '<td width="15%"><center><button type="button"  id="reviewnumberr'+rowct1+'file" onclick="myFunction111(this.id)">upload</button></center></td>';
        
        newRow.append(cols);
        $("#reviewnumber").append(newRow);
        counter++;
        rowct1++;
        cellct=0;
    });
    
    
    
    
    $("#reviewnumber").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
    
    
    
    
    
    
    


    var table3 = document.getElementById('table3');
//	alert(table3.rows.length);
	//var content2='aa~bb~cc#zz~x~CC';

	var content2='<%=no_of_aligers%>';
	var selectvalues='<%=selectvalue%>';
	var attarray='<%=attarray%>';
	if(content2==''){
		totalRowAdded2=1;
	}else{
		
		var attay=attarray.split('#');
		var sContent=content2.split('#');
		var ssvalue=selectvalues.split('#');
		var CellContent='';
		//alert(sContent.length);
		alert(attay);
		totalRowAdded2=sContent.length+1;
		console.log(sContent.length);
		for (i = 0; i < sContent.length-1; i++) { 
			CellContent=sContent[i].split('~');
			CellContent1=ssvalue[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td width="30%"><input style="width:30%;" type="text" class="form-control" name="name" id="table3r'+roid+'c0" /><select id="table3r'+roid+'select1" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+roid+'select2" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
			cols += '<td width="30%"><input  style="width:30%;" type="text" class="form-control" name="mail" id="table3r'+roid+'c1"/><select id="table3r'+roid+'select3" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+roid+'select4" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
			 cols += '<td width="10%"><input type="text" class="form-control" name="phone" id="table3r'+roid+'c2"/></td>';
			 cols += '<td width="10%"><input type="text" class="form-control" name="phone" id="table3r'+roid+'c3"/></td>';
				
			 cols += '<td width="10%"><center> <input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
			
		        cols += '<td width="10%"><center><input type="checkbox" class="custom-control-input" id="att'+roid+'"></center></td>';
		        
			newRow.append(cols);
			 $("#table3").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("table3r"+roid+"c"+j).value=CellContent[j];
					//document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
			 for (j = 1; j <= CellContent1.length; j++) { 
			
					document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j-1];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
			 
				 
			 
					//alert(attay[i]);\
					var isTrueSet = (attay[i] === 'true');
					alert(isTrueSet);
					document.getElementById("att"+roid).checked=isTrueSet;
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				
			
		}
	}
	
	
	
	
	
	

    var table5 = document.getElementById('table5');
//	alert(table3.rows.length);
	//var content2='aa~bb~cc#zz~x~CC';

	var content5='';
	var selectvalues5='';
	var attarray5='';
	if(content5==''){
		totalRowAdded5=1;
	}else{
		
		var attay=attarray.split('#');
		var sContent=content2.split('#');
		var ssvalue=selectvalues.split('#');
		var CellContent='';
		//alert(sContent.length);
		alert(attay);
		totalRowAdded=sContent.length+1;
		console.log(sContent.length);
		for (i = 0; i < sContent.length-1; i++) { 
			CellContent=sContent[i].split('~');
			CellContent1=ssvalue[i].split('~');
			var newRow = $("<tr>");
			var cols = "";
			var roid=i+1;
			cols += '<td width="30%"><input style="width:30%;" type="text" class="form-control" name="name" id="table3r'+roid+'c0" /><select id="table3r'+roid+'select1" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+roid+'select2" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
			cols += '<td width="30%"><input  style="width:30%;" type="text" class="form-control" name="mail" id="table3r'+roid+'c1"/><select id="table3r'+roid+'select3" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+roid+'select4" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
			 cols += '<td width="10%"><input type="text" class="form-control" name="phone" id="table3r'+roid+'c2"/></td>';
			 cols += '<td width="10%"><input type="text" class="form-control" name="phone" id="table3r'+roid+'c3"/></td>';
				
			 cols += '<td width="10%"><center> <input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
			
		        cols += '<td width="10%"><center><input type="checkbox" class="custom-control-input" id="att'+roid+'"></center></td>';
		        
			newRow.append(cols);
			 $("#table3").append(newRow);
			 for (j = 0; j < CellContent.length; j++) { 
					document.getElementById("table3r"+roid+"c"+j).value=CellContent[j];
					//document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
			 for (j = 1; j <= CellContent1.length; j++) { 
			
					document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j-1];
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				}
			 
				 
			 
					//alert(attay[i]);\
					var isTrueSet = (attay[i] === 'true');
					alert(isTrueSet);
					document.getElementById("att"+roid).checked=isTrueSet;
					//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
				
			
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  var table4 = document.getElementById('table4');
//		alert(table3.rows.length);
		//var content2='aa~bb~cc#zz~xx~CC';

		var content4='<%=planninggrid%>';
		
		//alert("planninggrid   "+content4);
	
		if(content4==''){
			totalRowAdded4=1;
		}else{
			
			var attay=attarray.split('#');
			var sContent=content4.split('#');
		
			var CellContent='';
			//alert(sContent.length);
			alert(attay);
			totalRowAdded4=sContent.length+1;
			console.log(sContent.length);
			for (i = 0; i < sContent.length-1; i++) { 
				CellContent=sContent[i].split('~');
			
				var newRow = $("<tr>");
				var cols = "";
				var roid=i+1;
				
				 cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="name" id="planningr'+roid+'c0" /></center></td>';
			        
			        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="mail" id="planningr'+roid+'c1"/></center></td>';
		
			        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="phone" id="planningr'+roid+'c2"/></center></td>';
			    
			        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="phone" id="planningr'+roid+'c3"/></center></td>';
		
			        cols += '<td width="10%"><center><input style="width:70%" type="text" class="form-control" name="phone" id="planningr'+roid+'c4"/></center></td>';
			    
			        cols += '<td width="10%"><center><input style="width:70%" type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
			      
				
			
				newRow.append(cols);
				 $("#table4").append(newRow);
				 for (j = 0; j < CellContent.length; j++) { 
						document.getElementById("planningr"+roid+"c"+j).value=CellContent[j];
						//document.getElementById("table3r"+roid+"select"+j).value=CellContent1[j];
						//alert('Row '+i+' Cell '+j+' CellContent '+CellContent[j]);
					}
				
					
				
			}
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
	
	
	
	
	
	
	


	
	
	
	
	
	
	 
	var table3 = document.getElementById('table3');
	var rowct3 = table3.rows.length;
	//alert(rowct3);



	
    
    
    
    
    
    
    
    
    $("#addrow2").on("click", function () {
    	
    	totalRowAdded2++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input  style="width:30%;" type="text" class="form-control" name="name' + counter + '" id="table3r'+rowct3+'c'+cellct+'" /><select id="table3r'+rowct3+'select1" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+rowct3+'select2" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
        cellct++;
          cols += '<td><input style="width:30%;"  type="text" class="form-control" name="mail' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/><select id="table3r'+rowct3+'select3" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table3r'+rowct3+'select4" class="form-control"><option>1</option><option>2</option><option>3</option></select></td><br>';
        cellct++;
        cols += '<td><input  type="text" class="form-control" name="phone' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="table3r'+rowct3+'c'+cellct+'"/></td>';
         
        cellct++;
        
        cols += '<td><center><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
        cellct++;
        cols += '<td><center><input type="checkbox" class="custom-control-input" id="att'+rowct3+'"></center></td>';
        
        newRow.append(cols);
        $("#table3").append(newRow);
        counter++;
        rowct3++;
        cellct=0;
    });
    
    
    
    
    $("#table3").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
    
        
	
	
   		
    	
	 
	var table4 = document.getElementById('table4');
	var rowct4 = table4.rows.length;
	//alert(rowct);

    $("#addrow4").on("click", function () {
    	
    	totalRowAdded4++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="name' + counter + '" id="planningr'+rowct4+'c'+cellct+'" /></center></td>';
        cellct++;
        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="mail' + counter + '" id="planningr'+rowct4+'c'+cellct+'"/></center></td>';
        cellct++;
        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="phone' + counter + '" id="planningr'+rowct4+'c'+cellct+'"/></center></td>';
        cellct++;
        cols += '<td width="20%"><center><input style="width:70%" type="text" class="form-control" name="phone' + counter + '" id="planningr'+rowct4+'c'+cellct+'"/></center></td>';
        cellct++;
        cols += '<td width="10%"><center><input style="width:70%" type="text" class="form-control" name="phone' + counter + '" id="planningr'+rowct4+'c'+cellct+'"/></center></td>';
        cellct++;
        
        cols += '<td width="10%"><center><input style="width:70%" type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
        newRow.append(cols);
        $("#table4").append(newRow);
        counter++;
        rowct4++;
        cellct=0;
    });
    $("#table4").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
    
    
    
    var table5 = document.getElementById('table5');
	var rowct5 = table5.rows.length;
	
    
	

    
    $("#addrow5").on("click", function () {
    	
    	totalRowAdded5++;
    	var counter = 0;
       // var rowct = table.rows.length-1;
        var cellct = 0;
        var newRow = $("<tr>");
        var cols = "";

        cols += '<td><input  style="width:30%;" type="text" class="form-control" name="name' + counter + '" id="table5r'+rowct5+'c'+cellct+'" /><select id="table5r'+rowct5+'select1" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table5r'+rowct5+'select2" class="form-control"><option>1</option><option>2</option><option>3</option></select></td>';
        cellct++;
          cols += '<td><input style="width:30%;"  type="text" class="form-control" name="mail' + counter + '" id="table5r'+rowct5+'c'+cellct+'"/><select id="table5r'+rowct5+'select3" class="form-control"><option>1</option><option>2</option><option>3</option></select><select id="table5r'+rowct5+'select4" class="form-control"><option>1</option><option>2</option><option>3</option></select></td><br>';
        cellct++;
        cols += '<td><input  type="text" class="form-control" name="phone' + counter + '" id="table5r'+rowct5+'c'+cellct+'"/></td>';
        cellct++;
        cols += '<td><input type="text" class="form-control" name="phone' + counter + '" id="table5r'+rowct5+'c'+cellct+'"/></td>';
         
        cellct++;
        
        cols += '<td><center><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></center></td>';
        cellct++;
        cols += '<td><center><input type="checkbox" class="custom-control-input" id="att'+rowct5+'"></center></td>';
        
        newRow.append(cols);
        $("#table5").append(newRow);
        counter++;
        rowct5++;
        cellct=0;
    });
	
	
	
    
	
    $("#table5").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();       
        
    });
   
    
    
  
  
    	
    	
});







	 function pendingSubmit(){
		 
		 var table4data=getData4(5);
		
		 
		 var Att=getAtt();
		 var Att5=getAtt5();
		 alert("thisbis the att   "+Att);
		 var selectvalue=getselectvalues();
		 
		 var selectvalue5=getselectvalues5();
		 
		 alert("this is the selected value "+selectvalue5);
		 
	 
   	  var table3Content=getData2(4); 	
   	   	
      	  var caseId='<%=caseId%>';
      	 
      	 var tableContent=getData(3);
      	 var reviewnumber=getData1(4);
      	
      	
      	var registered_doctor = $('#registered_doctor').val();
      	var prerequisite = $('#prerequisite').val();
      	var case_number = $('#case_rnumber').val();
      	
      	alert("this is te case number "+case_number);
      	
      	
    //  	var payment_grid_table = $('#tableContent').val();
      	var user_id = $('#user_id').val();
      	var clinic_name = $('#clinic_name').val();
      	var clinic_address = $('#clinic_address').val();
      	
      	var gp = $('#gp').val();
      	var city = $('#city').val();
      	var patient_name = $('#patient_name').val();
      	
      	var patient_age = $('#patient_age').val();
      	var referred_by = $('#referred_by').val();
      	var type_of_account = $('#type_of_account').val();
      	var channel = $('#channel').val();
      	var corporate_account = $('#corporate_account').val();
      	var kol = $('#kol').val();
      	var discount = $('#discount').val();
      	var starter_kit = $('#starter_kit').val();
      	var no_of_aligners = $('#no_of_aligners').val();
      	var scanning = $('#scanning').val();
      	var pickup = $('#pickup').val();
      	var dispatch = $('#dispatch').val();
      	var dispatch_to = $('#dispatch_to').val();
      	var advance_starter = $('#advance_starter').val();
      	var advance_scanning = $('#advance_scanning').val();
      	var scanning_service = $('#scanning_service').val();
      	var dispatch_date = $('#dispatch_date').val();
      	var person_dispatch = $('#person_dispatch').val();
      	var person_scan = $('#person_scan').val();
    	var bill_to = $('#bill_to').val();
      	var gst_number = $('#gst_number').val();
      	var payment_mode = $('#payment_mode').val();
      	var wo_number = $('#wo_number').val();
      	var priority = $('#priority').val();
      	var wo_date = $('#wo_date').val();
      	
      	var decision = $('#decision').val();
      	var no_of_stages = $('#no_of_stages').val();
      	var current_stage = $('#current_stage').val();
      	var no_of_aligners_u_p = $('#no_of_aligners_u_p').val();
      	var no_of_aligners_u_a = $('#no_of_aligners_u_a').val();
      	var no_of_aligners_l_a = $('#no_of_aligners_l_a').val();
      	
      	var no_of_aligners_l_p = $('#no_of_aligners_l_p').val();
      	var attachment_applicable = $('#attachment_applicable').val();
      	var dispatch_grid = $('#dispatch_grid').val();
      	var dispatch_date2 = $('#dispatch_date2').val();
      	var data_grid = $('#data_grid').val();
      	var final_amount = $('#final_amount').val();
      	var status_grid = $('#status_grid').val();
      	var payment_grid = $('#payment_grid').val();
      	var batch_number = $('#batch_number').val();
      	var work_date = $('#work_date').val();
      	var next_work = $('#next_work').val();
      	var next_work_date = $('#next_work_date').val();
      	var refinement_package = $('#refinement_package').val();
      	var case_review = $('#case_review').val();
      	var nextStage='<%=nextStage%>';
      	var remarks=$('#remarks').val();
     // 	alert(document.getElementById('logusername').value);
    
    		 if(decision=='' || decision==null){
    				alert('Kindly select the Decision');
    				document.getElementById("decision").focus();
    			}else if(remarks==''){
    				alert('Kindly Enter the Remarks');
    				document.getElementById("remarks").focus();
    			}
    			else{
    				//$(".loader").fadeIn("slow");
    				$.ajax({
    		      	    type : 'POST',
    		      		data : {table4data:table4data,Att:Att,selectvalue:selectvalue,table3Content:table3Content,nextStage:nextStage,caseId:caseId,reviewnumber:reviewnumber,case_number:case_number,prerequisite:prerequisite,registered_doctor:registered_doctor,payment_grid_table:tableContent,user_id:user_id,clinic_name:clinic_name,clinic_address:clinic_address,gp:gp,city:city,patient_name:patient_name,patient_age:patient_age,referred_by:referred_by,type_of_account:type_of_account,channel:channel,kol:kol,corporate_account:corporate_account,discount:discount,starter_kit:starter_kit,no_of_aligners:no_of_aligners,scanning:scanning,pickup:pickup,dispatch:dispatch,dispatch_to:dispatch_to,advance_starter:advance_starter,advance_scanning:advance_scanning,scanning_service:scanning_service,dispatch_date:dispatch_date,person_dispatch:person_dispatch,person_scan:person_scan,bill_to:bill_to,gst_number:gst_number,payment_mode:payment_mode,wo_number:wo_number,wo_date:wo_date,priority:priority,decision:decision,no_of_stages:no_of_stages,current_stage:current_stage,no_of_aligners_u_a:no_of_aligners_u_a,no_of_aligners_u_p:no_of_aligners_u_p,no_of_aligners_l_a:no_of_aligners_l_a,no_of_aligners_l_p:no_of_aligners_l_p,attachment_applicable:attachment_applicable,dispatch_grid:dispatch_grid,dispatch_date2:dispatch_date2,data_grid:data_grid,final_amount:final_amount,status_grid:status_grid,payment_grid:payment_grid,batch_number:batch_number,work_date:work_date,next_work:next_work,next_work_date:next_work_date,case_review:case_review,refinement_package:refinement_package,remarks:remarks},
    		      		url : 'CreateServlet1',
    		      		success : function(responseText) {
    		   				
    		      			var x=responseText;
    		      			
    		      			//document.getElementById("form1").reset();
    		      			//$(".loader").fadeOut("slow");
    	    				
    		      			alert("Case Id "+x+" Submitted Successfully");
    		      			
    		      			
    		      			
    		      			 $('#sidebarpending')[0].click();
    		      			
    		      			$.ajax({
    	    		      		

    	    		      	    type : 'POST',
    	    		      		data : {caseid:x},
    	    		      		url : 'Intimation',
    	    		      		success : function(responseText) {
    	    		   				
    	    		      			
    	    		      			
    	    		      			//document.getElementById("form1").reset();
    	    		      			
    	    	    				
    	    		      		
    	    		      			
    	    		   			
    	    		   			}
    	    		      	
    	    		      	  
    	    		      		 
    	    		   		});
    		      			
    		      			
    		   			
    		   			}
    		      	
    		      	  
    		      		 
    		   		});
    			}
      
   }
    
    
  
    </script>




														<script>


function myFunction1(){

	alert("dfhdfbjh");
	
    var mapForm = document.createElement("form");
    mapForm.target = "Map";
    mapForm.method = "POST"; // or "post" if appropriate
    mapForm.action = "prescriptionpopup.jsp";
 
    var mapInput = document.createElement("input");
    mapInput.type = "hidden";
    mapInput.name = "case_id";
    mapInput.value ='<%=caseId%>'
    mapForm.appendChild(mapInput);
    document.body.appendChild(mapForm);
	
	map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

	
	if (map) {
	    mapForm.submit();
	} else {
	    alert('You must allow popups for this to work.');
	}		

	 


		
}





	function myFunction11(){

		if(document.getElementById("case_rnumber").value!="")
{		
	    var mapForm = document.createElement("form");
	    mapForm.target = "Map";
	    mapForm.method = "POST"; // or "post" if appropriate
	    mapForm.action = "${pageContext.request.contextPath}/DocUpload.jsp";

	    var mapInput = document.createElement("input");
	    mapInput.type = "hidden";
	    mapInput.name = "folderID";
	    mapInput.value = document.getElementById("case_rnumber").value;
	   // alert("this is casenumber  "+document.getElementById("case_rnumber").value);
	    mapForm.appendChild(mapInput);
	    document.body.appendChild(mapForm);
		
		map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

		if (map) {
		    mapForm.submit();
		} else {
		    alert('You must allow popups for this to work.');
		}		


			
	}
	
	else{
		
		
		alert("Please Enter Case Id first");
	}

	}

	
	

			function myFunction111(x){

					if(document.getElementById("case_rnumber").value!="")
			{		
						
					var data=document.getElementById("case_rnumber").value+","+x;	
						alert(data);
				    var mapForm = document.createElement("form");
				    mapForm.target = "Map";
				    mapForm.method = "POST"; // or "post" if appropriate
				    mapForm.action = "${pageContext.request.contextPath}/DocUpload.jsp";
				    var mapInput = document.createElement("input");
				    mapInput.type = "hidden";
				    mapInput.name = "folderID";
				    mapInput.value =data;
				   // alert("this is casenumber  "+document.getElementById("case_rnumber").value);
				    mapForm.appendChild(mapInput);
				  
				    document.body.appendChild(mapForm);
					
					map = window.open("", "Map", "Height=600px,Width=580px, scroll=yes,dependent=yes,menubar=no,toolbar=no,status=no,modal=yes,scroll=yes,alwaysRaised=yes");

					if (map) {
					    mapForm.submit();
					} else {
					    alert('You must allow popups for this to work.');
					}		


						
				}
				
				else{
					
					
					alert("Please Enter Case Id first");
				}

				}
 
	
	
	
</script>



														<%
														}
														%>
													
</body>

</html>
<%
} catch (Exception e) {
e.printStackTrace();
} finally {

if (rs != null) {
	// closes the database connection
	try {
		rs.close();
		rs = null;
	} catch (SQLException ex) {
		ex.printStackTrace();
	}
}
if (ps != null) {
	// closes the database connection
	try {
		ps.close();
		ps = null;
	} catch (SQLException ex) {
		ex.printStackTrace();
	}
}

if (con != null) {
	// closes the database connection
	try {
		con.close();
		con = null;
	} catch (SQLException ex) {
		ex.printStackTrace();
	}

}
}
%>
