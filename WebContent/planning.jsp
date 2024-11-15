
<!DOCTYPE html>

<%@page import="com.vo.PlanningVO"%>
<%@page import="com.vo.PendingVO"%>
<%@page import="com.vo.QaVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.workflow.connection.LoginDAO"%>
 


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
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
  <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>

<style>
.green-color {
color:green;
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
            
            .image-preview-box {
    display: flex;
    flex-wrap: wrap;
    margin-top: 10px;
}
.image-preview-box img {
    border: 1px solid #ccc;
    padding: 5px;
}
  .image-preview-box {
        text-align: right;
        margin-top: 10px;
    }

    .image-preview-box img {
        max-width: 100px;
        max-height: 100px;
        margin-right: 10px;
        margin-bottom: 10px;
        cursor: pointer;
        border: 1px solid #ccc;
        padding: 5px;
    }

    .image-preview-box img:disabled {
        pointer-events: none;
    }

    .btn:disabled {
        background-color: #ddd;
        pointer-events: none;
    }          


</style>
</head>

<body class="nav-md">

<%
String n=request.getParameter("caseId");
String crm=request.getParameter("crm");
String patient_Name=request.getParameter("patient_Name");
String cdoc=request.getParameter("cdoc");
String corporate_account=request.getParameter("corporate_account");
List<String> userRight =LoginDAO.getRight((String)session.getAttribute("userid"));
String cccrmpriority=(String)session.getAttribute("plnpriority");
String planning_id=request.getParameter("planning_id");



List<String> CorporateAccount=(ArrayList<String>)session.getAttribute("customerlist");


/* List<PlanningVO> plnlist=(ArrayList)session.getAttribute("plnlist");

 */
List<PlanningVO> list = (List)session.getAttribute("plnlist");
 

%>


<%
							Connection con01 = null;
							Connection con02 = null;
							PreparedStatement ps01 = null;
							PreparedStatement ps02 = null;
							ResultSet rs01 = null;
							ResultSet rs02 = null;
							int planid=0;
							 int planid1=0;
							 int count=0;
						     String priority1="";

							try {
								LoginDAO connect1 = new LoginDAO();
								con01 = connect1.getConnectionDetails();
								con02 = connect1.getConnectionDetails();
								//////
								
								ps02 = con02.prepareStatement(" select count(*) as cnt from planning  where   planned_no IS NOT NULL and  case_id='"+n+"' ");
								rs02 = ps02.executeQuery();
								while (rs02.next()) {
									count=rs02.getInt("cnt");
								}
								ps01 = con01.prepareStatement(" select * from cc_crm where Case_Id='"+n+"' ");
								rs01 = ps01.executeQuery();
								while (rs01.next()) {
									planid=rs01.getInt("planning_id");
									priority1=rs01.getString("priority");

								}
			
%>


<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                <!-- Top Bar -->
                 	<%@ include file="TopBar.jsp" %>
				<!-- Top Bar -->
             	<!-- menu prile quick info -->

						<%@ include file="LeftTopSide.jsp" %>
						<!-- /menu prile quick info -->
                          
                 	<!-- sidebar menu -->
					    <%@ include file="SideBar.jsp" %>
                    <!-- /sidebar menu -->
                </div>
            </div>

             <!-- top navigation -->
            <%@ include file="TopNavigation.jsp" %>
            <!-- /top navigation -->


            <!-- page content -->
             <div class="right_col" role="main">
<div class="container" style="padding-top:20px;">
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

                    <%-- <%
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

<div class="col-sm-3">


									<label">Case Id : </label><span> <%= n%></span>
								</div>
								<div class="col-sm-3">
									<label> Patient Name :<%= patient_Name%> </label> <span></span>
								</div>
								<div class="col-sm-3">
									<label>Registered Doctor :<%= cdoc%>  </label><span></span>
								</div>
								<div class="col-sm-3">
									<label>Priority : </label> <span><%= cccrmpriority%> </span>

								</div>	
								
								</div>
<div class="row">

								<div class="col-sm-3">
									<label ><a class="btn btn-primary" href="Approval?caseId=<%= n%>&NxtStage=null&crm=<%= crm%>&cdoc=<%= cdoc%>&patient_Name=<%= patient_Name%> ">Fetch data</a>  </label>
								</div>
								<div class="col-sm-3">
									<label ><a class="btn btn-primary" href="DispImageGrid?caseId=<%= n%> ">View Photo</a>  </label>
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
								</style>
								
								<%  if(userRight.contains("OTPLN")){ %>
								<fieldset>
    								<legend class="text-center" style="color:black;">Registration link</legend>
								<div class="row">
								<div class="col-sm-12 text-center">		
							
  											<label><a class="btn btn-info" href="https://103.120.178.180:8443/Registration/fetchcreate.jsp">Create IPR</a>  </label><span></span>
 											
											<label ><button class="btn btn-info" onclick="editipr()">Edit IPR</button>  </label>
												<div id="editipr" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/editservlet" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
												<label ><button class="btn btn-info" onclick="viewdigiplan()">View Digiplan</button>  </label>
												<div id="viewdigiplan" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/logincheckdoctor" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
		
								   </div>
								   </div>
								   
								   </fieldset>
								   
							<%} %>
								
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Case Planning Details</strong> </div>
<%
  
 
int i = 0;

for (com.vo.PlanningVO plnnlist : list )
{
    String crmpln = plnnlist.getCrm();
    String cdocpln = plnnlist.getDoctor_name();
    String patient_Namepln = plnnlist.getPatient_name();
    int U_formpln = plnnlist.getU_form();

    i++;
%>
<%
    if (plnnlist.getPlanned_no() == null) {
        i = 0;
%>
<%
    } else {
        planid1 = plnnlist.getPlanning_id();
%>
 <%
if(userRight.contains("OTPLN") || userRight.contains("REV")){
	

%> 
<div class="container" style="width:99%">
    <% if (planid == planid1) { %>
    <div class="panel panel-default" style="border-color: green !important;">
        <div class="panel-heading" style="background-color: #d9edf7;">
            Planning 
            <i class="fa fa-check-circle green-color" style="font-size:28px;"></i>
        </div>
    <% } else { %>
    <div class="panel panel-default">
        <div class="panel-heading">
            Planning
        </div>
    <% } %>
        <div class="panel-body">
            <form class="form-verticle" action="SavePlanning" method="POST" >
                <input type="hidden" name="query" value="approveplan">
                <input type="hidden" name="planning_id" value="<%= plnnlist.getPlanning_id() %>">
                <input type="hidden" name="caseId" id="caseId" value="<%= plnnlist.getCase_id() %>">
                <input type="hidden" name="crm" value="<%= crmpln %>">
                <input type="hidden" name="doctor_name" value="<%= cdocpln %>">
                <input type="hidden" name="patient_name" value="<%= patient_Namepln %>">
                <%-- <p > <%= plnnlist.getCase_id() %></p> --%>
                <!-- Input fields for plan details -->
                
                <div class="row">
    <label class="col-md-2 control-label">Planned No </label>  
    <div class="col-lg-4 ">
        <input type="text" disabled class="form-control form-control-lg" name="Planned_No" id="Planned_No" placeholder="Planned No" value="<%=plnnlist.getPlanned_no() %>">
    </div>
    <label class="col-md-2 control-label">Planning Type </label>  
    <div class="col-lg-4 ">
        <input type="text" disabled class="form-control form-control-lg" name="planningType" id="planningType" value="<%=plnnlist.getPlanning_type() %>">
    </div>
</div>
<br>

<div class="row">
    <label class="col-md-2 control-label">Upper Aligner</label>  
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="upper_aligner_from" name="upper_aligner_from" placeholder="From" value="<%=plnnlist.getUpper_aligner_from() %>">
    </div>
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="upper_aligner_to" name="upper_aligner_to" placeholder="To" value="<%=plnnlist.getUpper_aligner_to() %>">
    </div>
    <label class="col-md-2 control-label">Lower Aligner </label>  
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" placeholder="From" value="<%=plnnlist.getLower_aligner_from()%>">
    </div>
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="lower_aligner_to" name="lower_aligner_to" placeholder="To" value="<%=plnnlist.getLower_aligner_to()%>">
    </div>
</div>
<br>
                <!-- "Approve Plan" button -->
               <%--  <div class="row">
                    <div class="text-center">
                        <% if (planid == planid1) { %>
                           <button type="submit" class="btn btn-primary" style="background:green;color:white;"  disabled>Approved Plan</button>               
                        <% } else { %>
                           <button type="submit" class="btn btn-primary"  id="submitButton"  >Approve Plan</button>               
                        <% } %>
                    </div>
                </div> --%>
            </form>
        </div>
    </div>
</div>
<%
    }
}
							 } 
%>
<br>

<%
if (userRight.contains("QA")) {
	

%>
<%
i = 0;
int formIndex = 0;
for (com.vo.PlanningVO plnnlist : list )
{
    String crmpln = plnnlist.getCrm();
    String cdocpln = plnnlist.getDoctor_name();
    String patient_Namepln = plnnlist.getPatient_name();
    int U_formpln = plnnlist.getU_form();
    i++;
    formIndex++;
%>
<%
    if (plnnlist.getPlanned_no() == null) {
    	i = 0;
%>
<%
    } else {
        planid1 = plnnlist.getPlanning_id();
%>

<div class="container" style="width:99%">
 <div class="panel panel-default">
         <% if (planid == planid1) { %>
    <div class="panel panel-default" style="border-color: green !important;">
        <div class="panel-heading" style="background-color: #d9edf7;">
            Planning 
            <i class="fa fa-check-circle green-color" style="font-size:28px;"></i>
        </div>
    <% } else { %>
    <div class="panel panel-default">
        <div class="panel-heading">
            Planning
        </div>
    <% } %>
         <div class="panel-body">
            <form id="qaForm_<%= formIndex %>" action="SavePlanning" method="POST" enctype="multipart/form-data" >
                <input type="hidden" name="query" value="QAPlan">
                <input type="hidden" name="planning_id" id="planning_id_<%= formIndex %>" value="<%= plnnlist.getPlanning_id() %>">
                <input type="hidden" name="caseId" id="caseId_<%= formIndex %>" value="<%= plnnlist.getCase_id() %>">
                <input type="hidden" name="crm" value="<%= crmpln %>">
                <input type="hidden" name="doctor_name" value="<%= cdocpln %>">
                <input type="hidden" name="patient_name" value="<%= patient_Namepln %>">
                 <div class="row">
    <label class="col-md-2 control-label">Planned No </label>  
    <div class="col-lg-4 ">
        <input type="text" disabled class="form-control form-control-lg" name="Planned_No" id="Planned_No" placeholder="Planned No" value="<%=plnnlist.getPlanned_no() %>">
    </div>
    <label class="col-md-2 control-label">Planning Type </label>  
    <div class="col-lg-4 ">
        <input type="text" disabled class="form-control form-control-lg" name="planningType" id="planningType" value="<%=plnnlist.getPlanning_type() %>">
    </div>
</div>
<br>

<div class="row">
    <label class="col-md-2 control-label">Upper Aligner</label>  
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="upper_aligner_from" name="upper_aligner_from" placeholder="From" value="<%=plnnlist.getUpper_aligner_from() %>">
    </div>
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="upper_aligner_to" name="upper_aligner_to" placeholder="To" value="<%=plnnlist.getUpper_aligner_to() %>">
    </div>
    <label class="col-md-2 control-label">Lower Aligner </label>  
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" placeholder="From" value="<%=plnnlist.getLower_aligner_from()%>">
    </div>
    <div class="col-lg-2">
        <input type="text" disabled class="form-control" id="lower_aligner_to" name="lower_aligner_to" placeholder="To" value="<%=plnnlist.getLower_aligner_to()%>">
    </div>
</div>
<br>
                
<div class="row">
    <label class="col-md-2 control-label">Dispatch Upper</label>
    <div class="col-lg-2">
        <input type="number" class="form-control" id="u_form_6" name="u_form_6"
               value="<%= (plnnlist.getU_form() != 0) ? plnnlist.getU_form() : "" %>"
               placeholder="u_form_6" <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
    <div class="col-lg-2">
        <input type="number" class="form-control" id="u_to" name="u_to"
               value="<%= (plnnlist.getU_to() != 0) ? plnnlist.getU_to() : "" %>"
               placeholder="u_to" <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
    <label class="col-md-2 control-label">Dispatch Lower</label>
    <div class="col-lg-2">
        <input type="number" class="form-control" id="l_from" name="l_from"
               value="<%= (plnnlist.getL_from() != 0) ? plnnlist.getL_from() : "" %>"
               placeholder="l_from" <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
    <div class="col-lg-2">
        <input type="number" class="form-control" id="l_to" name="l_to"
               value="<%= (plnnlist.getL_to() != 0) ? plnnlist.getL_to() : "" %>"
               placeholder="l_to" <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
</div>
<br>

<br>

<div class="row">
    <label class="col-md-2 control-label">Sheet Type</label>
    <div class="col-lg-4">
        <select class="form-control form-control-lg" name="stagesheet" id="stagesheet" <% if (planid == planid1) { %>disabled<% } %> required>
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
    <label class="col-md-2 control-label">Plan Comment</label>
    <div class="col-lg-4">
        <input type="text" class="form-control form-control-lgl" id="plan_comment" name="plan_comment" placeholder="plan_comment" value="<%=plnnlist.getPlan_comment() != null ? plnnlist.getPlan_comment() : ""  %>" <% if (planid == planid1) { %>disabled<% } %> required >
    </div>
</div>
<br>

<div class="row">
    <label class="col-md-2 control-label">Created At</label>
    <div class="col-lg-4">
        <input type="text" class="form-control" id="created_at" name="created_at" value="<%= new java.util.Date() %>" readonly <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
    <label class="col-md-2 control-label">Dispatch Date</label>
    <div class="col-lg-4">
        <input type="date" class="form-control" id="dispatch_eta" name="dispatch_eta" placeholder="Dispatch ETA" value="<%=plnnlist.getDispatch_eta() %>" <% if (planid == planid1) { %>disabled<% } %> required>
    </div>
</div>
<br>
 
<!-- Buttons for file uploads with aligned inputs -->
<div class="row text-center">
    <div class="col-md-4">
        <button type="button" class="btn btn-primary" id="caseBookingBtn_<%= formIndex %>" 
            onclick="document.getElementById('case_booking_form_<%= formIndex %>').click()" <% if (planid == planid1) { %>disabled<% } %>>Upload Case Booking Form</button>
        <input type="file" class="form-control" name="case_booking_form" 
            id="case_booking_form_<%= formIndex %>" accept="image/png, image/jpg, image/jpeg"
            style="display: none;" 
            onchange="previewImages('caseBookingPreview_<%= formIndex %>', this, <%= formIndex %>)" >
            <div class="col-md-4 image-preview-box" id="caseBookingPreview_<%= formIndex %>"></div>
    </div>
    <div class="col-md-4">
        <button type="button" class="btn btn-primary" id="salesApprovalBtn_<%= formIndex %>" 
            onclick="document.getElementById('sales_approval_docs_<%= formIndex %>').click()" <% if (planid == planid1) { %>disabled<% } %>>Upload Sales Approval Docs</button>
        <input type="file" class="form-control" name="sales_approval_docs" 
            id="sales_approval_docs_<%= formIndex %>" accept="image/png, image/jpg, image/jpeg"
            style="display: none;" 
            onchange="previewImages('salesApprovalPreview_<%= formIndex %>', this, <%= formIndex %>)">
            <div class="col-md-4 image-preview-box" id="salesApprovalPreview_<%= formIndex %>"></div> 
    </div>
    <div class="col-md-4">
        <button type="button" class="btn btn-primary" id="docApprovalBtn_<%= formIndex %>" 
            onclick="document.getElementById('doc_approval_form_<%= formIndex %>').click()"<% if (planid == planid1) { %>disabled<% } %>>Upload Doc Approval Form</button>
        <input type="file" class="form-control" name="doc_approval_form" 
            id="doc_approval_form_<%= formIndex %>" accept="image/png, image/jpg, image/jpeg"
            style="display: none;" 
            onchange="previewImages('docApprovalPreview_<%= formIndex %>', this, <%= formIndex %>)">
            <div class="col-md-4 image-preview-box" id="docApprovalPreview_<%= formIndex %>"></div>
    </div>
</div>

<br>
<br>
  <div class="row">
              <div class="text-center">
                        <% if (planid == planid1) { %>
                           <button type="submit" class="btn btn-primary" style="background:green;color:white;" onclick="approveAndGenerateNewForm()" disabled>Approved Plan</button>               
                        <% } else { %>
                           <button type="submit" class="btn btn-primary"  id="submitButton"  >Approve Plan</button>               
                        <% } %>
                    </div>
</div> 
  </div>
            </form>
</div>
</div>


   <script type="text/javascript">
 document.addEventListener("DOMContentLoaded", function () {
     const dispatchDateInput = document.getElementById("dispatch_eta");

     // Get the current date
         if (dispatchDateInput) {
        // Get the current date
        const currentDate = new Date();

        // Set the start date to the first day of the current month
        const firstDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
        dispatchDateInput.min = firstDayOfMonth.toISOString().split("T")[0];

        // Set the end date to the last day of the current month
        const lastDayOfMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
        dispatchDateInput.max = lastDayOfMonth.toISOString().split("T")[0];
    } else {
        console.error("dispatch_eta input element not found.");
    }
 });
 
   function previewImages(inputId, fileInput) {
        var previewBox = document.getElementById(inputId);
        previewBox.innerHTML = ''; // Clear previous previews

        var files = fileInput.files;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (file.type.startsWith('image/')) {
                var reader = new FileReader();
                reader.onload = function(event) {
                    var img = document.createElement('img');
                    img.src = event.target.result;
                    img.onclick = openFullScreenImage;
                    previewBox.appendChild(img);
                };
                reader.readAsDataURL(file);
            }
        }
    } 
    
   

    function openFullScreenImage(event) {
        var fullScreenImg = document.createElement('img');
        fullScreenImg.src = event.target.src;
        fullScreenImg.style.position = 'fixed';
        fullScreenImg.style.top = '50%';
        fullScreenImg.style.left = '50%';
        fullScreenImg.style.transform = 'translate(-50%, -50%)';
        fullScreenImg.style.maxWidth = '100%';
        fullScreenImg.style.maxHeight = '100%';
        fullScreenImg.style.zIndex = '9999';
        fullScreenImg.style.backgroundColor = 'rgba(0,0,0,0.8)';
        fullScreenImg.style.padding = '10px';
        fullScreenImg.style.cursor = 'zoom-out';

        fullScreenImg.addEventListener('click', function() {
            document.body.removeChild(fullScreenImg);
        });

        document.body.appendChild(fullScreenImg);
    }

</script>
<%
}}}
%>
 <%--  <% 
  
  /*   for(int i=0;i<list.size(); i++){ */
   

int i=0;
  

    	 for(com.vo.PlanningVO plnnlist:list){
				String crmpln=plnnlist.getCrm();
				String cdocpln=plnnlist.getDoctor_name();
				String patient_Namepln=plnnlist.getPatient_name();

  i++;
 
    %>
    <% if(plnnlist.getPlanned_no()==null){  
   i=0;
   %>
    
    <%}else{ %>
 <div class="container" style="width:99%">
 
   
    
   <% 
   planid1=plnnlist.getPlanning_id();
   if(planid==planid1) {    
   
   %>
    <div class="panel panel-default" style="border-color: green !important;">
    <div class="panel-heading" style="background-color: #d9edf7;" >Planning 
   <i class="fa fa-check-circle green-color" style="font-size:28px;" ></i>
   <%} else{%> 
    <div class="panel panel-default">
	   <div class="panel-heading" >Planning 
  <%}%> 
  
   
     </div>
    <div class="panel-body">
    
    	    <!-- new planning frm repeated-->
 
    
    <div class="row">
    <label class="col-md-2 control-label">Planned No </label>  
  <div class="col-lg-4 ">
  
<input type="text" disabled class="form-control form-control-lg" name="Planned_No" id="Planned_No"  placeholder="Planned No" value="<%=plnnlist.getPlanned_no() %>">
  </div>
  
    <label class="col-md-2 control-label">Planning Type </label>  
  <div class="col-lg-4 ">

	<input type="text"  disabled class="form-control form-control-lg" name="planningType" id="planningType" value="<%=plnnlist.getPlanning_type() %>">
			
  </div>
</div><br>
<div class="row">
    <label class="col-md-2 control-label">Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from" placeholder="From" value="<%=plnnlist.getUpper_aligner_from() %>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="upper_aligner_to"	name="upper_aligner_to" placeholder="To" value="<%=plnnlist.getUpper_aligner_to() %>"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" placeholder="From" value="<%=plnnlist.getLower_aligner_from()%>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"   disabled  class="form-control" id="lower_aligner_to" name="lower_aligner_to" placeholder="To" value="<%=plnnlist.getLower_aligner_to()%>"></label>
    </div>
  </div>
</div>

<div class="row">
	<div class="text-center">
		<% 
   planid1=plnnlist.getPlanning_id();
   if(planid==planid1) {%>
	<button  class="btn btn-primary" style="background:green;color:white;" >Approved Plan</button>
	
	   <%} else{ %>
		<a href="SavePlanning?query=approveplan&planning_id=<%=plnnlist.getPlanning_id()%>&caseId=<%=plnnlist.getCase_id() %>" class="btn btn-primary">Approve Plan</a>
		
		<a href="SavePlanning?query=approveplan&planning_id=<%=plnnlist.getPlanning_id()%>&caseId=<%=plnnlist.getCase_id() %>&crm=<%=request.getParameter("crm")%>&doctor_name=<%=cdocpln %>&patient_name=<%=patient_Namepln%>" class="btn btn-primary">Approve Plan</a>
		 <%} %>
	</div>
</div>

   <!--  </form> -->
    
    <!-- end  new planning frm  -->
    
    </div>
    </div>
    </div>
    <%} } %> --%>
   <%--  <%
if(userRight.contains("OTPLN")){
	

%> --%>
    <hr>
    <!--  planning 2nd repeated-->
  <div class="container" style="width:99%">
  <div class="panel panel-default" >
    <div class="panel-heading" style="background-color: #337ab7;color: #fff;">Add Planning</div>
    <div class="panel-body">
    
    	    <!-- new planning frm-->
    
    <form class="form-verticle" action="SavePlanning?query=planningnew" method="post" >
	 <input type="hidden" class="form-control" value="<%= cdoc%>" name="doctor_name" id="doctor_name" placeholder="Doctor Name" >
	<input type="hidden" class="form-control" value="<%= n%>" name="caseId" id="caseId" >
	<input type="hidden" class="form-control" value="<%= patient_Name%>" name="patient_name" id="patient_name" placeholder="Patient Name">
	<input type="hidden" class="form-control" value="<%= crm%>" name="crm" id="crm">
    
    <div class="row">
    <div class="col-md-6 ">
    <label class="col-md-6 control-label">Planned No </label>  
  <div class="col-lg-6 ">
  
<input type="text" class="form-control form-control-lg" name="Planned_No1" id="Planned_No"   placeholder="Planned No" value="<%=count+1 %>"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
  </div>
  </div>
    <div class="col-md-6 ">
    <label class="col-md-6 control-label">Planning Type </label>  
  <div class="col-lg-6 ">
   <select class="form-control " name="planningType" id="planningType">
           		 	<% List<String> Planning_Type1=(ArrayList<String>)session.getAttribute("Planning_Type");
				   	    for(String corpAcnt:Planning_Type1) {%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}%>
			</select>	
  </div>
  </div>
</div><br>
<div class="row">
    <div class="col-md-6 ">
    <label class="col-md-2 control-label">Upper Aligner</label>  
  <div class="col-lg-6 ">
  <div class="input-group">
  <input type="text" required class="form-control" id="upper_aligner_from"	name="upper_aligner_from" placeholder="From"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
  <input type="text" required  class="form-control" id="upper_aligner_to"	name="upper_aligner_to" placeholder="To"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
    </div>
  </div>
  </div>
      <div class="col-md-6 ">
    <label class="col-md-2 control-label">Lower Aligner </label>  
  <div class="col-lg-6 ">
  <input type="text" required class="form-control" id="lower_aligner_from" name="lower_aligner_from" placeholder="From"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
 <input type="text" required  class="form-control" id="lower_aligner_to" name="lower_aligner_to" placeholder="To"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')">
  </div>
  </div>
</div>


 <div class="row">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div>
    </form>
    
    <!-- end  new planning frm  -->
    
    </div>
    </div>
    </div>
 <%--    <%}  %>
     --%>
  <div class="container" style="width:99%">
  <div class="panel panel-default" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Planning Details</div>
    <div class="panel-body">

			<form class="form-verticle" action="SavePlanning" method="post"  onsubmit="return validation()" >
			
                
                <input type="hidden" name="caseId" id="caseId" value="<%= n %>">
                <input type="hidden" name="crm" value="<%= crm %>">
                <input type="hidden" name="doctor_name" value="<%= cdoc %>">
                <input type="hidden" name="patient_name" value="<%= patient_Name %>">
			  <input type="hidden" id="planid" readonly value=<%= planid%> >
		
			  
			  
			   <div class="row">
			    <div class="col-md-4 ">
			    	<label>BASING/SEGMENTATION CHECKED </label>  
			  </div>
			    <div class="col-md-1 ">
			        <input type="radio" name="basingsegcheck" id="basingsegcheck" checked="" >Yes
				</div>
				<div class="col-md-1 ">
					<input type="radio" name="basingsegcheck" id="basingsegcheck">No
			  </div>
			</div>
			
			<br>
			  <div class="row">
			    <div class="col-md-4 ">
			    	<label>Planned </label>  
			  </div>
			    <div class="col-md-1 ">
						<input type="radio" name="planned" id="planned" checked="">Yes
					</div>
				<div class="col-md-1 ">
						<input type="radio" name="planned" id="planned">No	
				</div>
			  </div>
			
			<br>
			 <div class="row">
			    <div class="col-md-4 ">
			    	<label>IPR Sheet </label>  
			  </div>
			    <div class="col-md-1 ">
			    <input type="radio" name="iprSheet" id="iprSheet" checked="">Yes
				</div>
				<div class="col-md-1 ">
				<input type="radio" name="iprSheet" id="iprSheet">No
			  </div>
			</div> 
			<br>
			<div class="row">
			    <div class="col-md-4 ">
			    	<label>Treatment Plan Report </label>  
			  </div>
			    <div class="col-md-1 ">
			      <input type="radio" name="treatmentreport" id="treatmentreport" checked="">Yes
				</div>
				<div class="col-md-1 ">
  					<input type="radio" name="treatmentreport" id="treatmentreport">No
			  </div>
			</div>
			<br>
			 <div class="row">
			    <div class="col-md-4 ">
			    	<label>Upload Digiplan/Send GIF </label>  
			  </div>
			    <div class="col-md-1 ">
			      <input type="radio" name="uploaddgiplan" id="uploaddgiplan" checked="">Yes
				</div>
				<div class="col-md-1 ">
  				<input type="radio" name="uploaddgiplan" id="uploaddgiplan">No
			  </div>
			</div> 
			<br>
			<div class="row">
			    <div class="col-md-4 ">
			    	<label>Planning Review By </label>  
			  </div>
			    <div class="col-md-6 ">
			       <select class="form-control" name="planningreview" id="planningreview" style="width:437px; ">
           		 	<% List<String> Planning_Review=(ArrayList<String>)session.getAttribute("Planning_Review");
				   	    for(String corpAcnt:Planning_Review) {%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}%>
				</select>	
				</div>
			</div><br>
			  <%  if(userRight.contains("QA")){ %>
			<div class="row">
			    <div class="col-md-4 ">
			    	<label>Priority </label>  
			  </div>
			    <div class="col-md-6 ">
			  
			       <select class="form-control"  name="priority" id="priority"  style="width:437px;" required>
           		 	 <% List<String> priority=(ArrayList<String>)session.getAttribute("prioritylist");
				   	   if(priority1==null){}
					  
					  for(String corpAcnt:priority) { 
						  
				   	    	if(corpAcnt.equals(priority1)){%>
				 	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	     <%} else{%>
				   	    
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%>
				</select>	
				
				</div>
			</div>
			<%} %>
				
				<br>
			
			<!--start priority -->
		<!-- 		<div class="row">
			    <div class="col-md-4 ">
			    	<label>Priority </label>  
			  </div>
			    <div class="col-md-6 ">
			       	<select class="form-control" name="priority" id="priority"  style="width:437px;" required>
					  	<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>	
				 	    <option selected="" value="9">9</option>
						<option value="10">10</option>	
				</select>	
				</div>
			</div> -->
			
			<!-- end  priority-->
			<br>
		<div class="row">
			    <div class="col-md-4 ">
			    	<label>Decision</label>  
			  </div>
			    <div class="col-md-6 ">
 <select class="form-control" name="stage" id="stage" style="width:437px; ">
 
		  	   <%  if(userRight.contains("OTPLN")){ %>
 
					  <option value="PLN">Planning Approve</option>	
					  <option value="PRECOR">Prerequisite Correction</option>	
					  <option value="QA">Send to Staging</option>	
				
				<%}else if(userRight.contains("REV")){ %>
				
           		 		<!-- <option value="Y">Work-In-Progress</option> -->
           		 		<option value="UPLCOR">Upload Correction</option>
           		 		<option value="PLNCOR">Plan Correction</option>
					  <option value="REV">Planning Review Approve</option>
					 
				
				<%} else if(userRight.contains("QA")){ %><!-- PRE -->
				
           		 		<!-- <option value="Y">Work-In-Progress</option> -->
           		 		 <option value="QA">Doctor Approved</option>
           		 		 <option value="PLNCOR">Plan Correction</option>
           		 		 <option value="UPLCOR">Upload Correction</option>
           		 		 
           		<%
           			
           		if(corporate_account.equals("PLAN")){%>
           		 <option value="Not Converted">Not Converted</option>
				  <option value="Cancel">Cancel</option>

           		<%}
	
	
	
           	 %>
	
           		 		 
		
				 <% }%>
</select>				</div>
				
			</div>
			<br>
			<div class="row">
			    <div class="col-md-4 ">
			    	<label>Remarks</label>  
			  </div>
			    <div class="col-md-6 ">
  						<textarea class="form-control"  name="remarks" id="remarks" placeholder="Enter remark" placeholder="Remarks"  style="width: 436px;" rows="4" cols="10"></textarea>
				</div>
			</div>
			
			<br>
<div class="row" style="margin-top:20px;">
 
    <div class="col-md-4">
        <label for="special_remarks" class="form-label">Special Remarks</label>
    </div>
    <div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
        <textarea id="special_remarks" name="special_remarks" rows="5" class="form-control" maxlength="250" 
                  style="width: 436px; 
                          border: 2px solid red;" readonly><%= special_remark %></textarea>
    </div>
</div>



<br>
			 <div class="row">
			<div class="text-center">
				<button type="submit" value="Save" class="btn btn-primary" id="planning">Submit</button>
			</div>
		</div> 
			</div>
		

   <script type="text/javascript">
   
    function validation(){
    	
    
    	var stage = document.getElementById('stage').value;
        var remarks = document.getElementById('remarks').value;
        var planid = document.getElementById('planid').value;
		var planning_id = <%=planid%>;
		
     	        if(stage=='PRECOR' && remarks==""){
        	 alert("Remarks is Required!") 
        	 document.getElementById("remarks").style.borderColor = "#E34234";
             return false;
        }	
        if(stage=='UPLCOR' && remarks==""){
       	 alert("Remarks is Required!") 
       	 document.getElementById("remarks").style.borderColor = "#E34234";
            return false;
       }
        if(stage=='PLNCOR' && remarks==""){
       	 alert("Remarks is Required!") 
       	 document.getElementById("remarks").style.borderColor = "#E34234";
            return false;
       }
        if(stage=='Not Converted' && remarks==""){
          	 alert("Remarks is Required!") 
          	 document.getElementById("remarks").style.borderColor = "#E34234";
               return false;
          }
        if(stage=='Cancel' && remarks==""){
         	 alert("Remarks is Required!") 
         	 document.getElementById("remarks").style.borderColor = "#E34234";
              return false;
         }    
       
    }
	</script>
</form>
</div>
</div>   
</div>

   <!-- end planning 2nd -->
    


  </div>
</div>
    </div>
            <!-- /page content -->
        </div>
    </div>
     <!-- font awesome link -->
 <script src="JavaScript/jquery-3.6.0.js" ></script>
<script src="JavaScript/kit.fontawesome.com/5b8969f8ab.js"></script>
<script>

function editipr() {
	  var x = document.getElementById("editipr");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
function viewdigiplan() {
	  var x = document.getElementById("viewdigiplan");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}

</script>
</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {

		 if(rs01!=null) {try{ rs01.close();}catch(Exception e){}finally {rs01=null; }}
		 if(rs02!=null) {try{ rs02.close();}catch(Exception e){}finally {rs02=null; }}
		 if(ps02!=null) {try{ ps02.close();}catch(Exception e){}finally {ps02=null; }}
		 if(con01!=null) {try{ con01.close();}catch(Exception e){}finally {con01=null; }}
		 if(con02!=null) {try{ con02.close();}catch(Exception e){}finally {con02=null; }}	 

	}
%>


