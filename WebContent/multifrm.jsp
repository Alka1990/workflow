
<!DOCTYPE html>
<%@page import="com.vo.AddresshandlerVO"%>
<%@page import="com.vo.ThreeDPrintingVo"%>
<%@page import="com.vo.HallowTagVo"%>
<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@page import="com.vo.MultiFrmVo"%>
<%@page import="com.vo.AccountVo"%>
<%@page import="com.vo.PlanningVO"%>
<%@page import="com.vo.StagingVo"%>
 
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

 <!-- < style>
  	 .big-checkbox {width: 30px; height: 30px;}
  </style> -->
  
        <script>
/*         function defaultadd(){
    $('input:checkbox').click(function() {
        $('input:checkbox').not(this).prop('checked', false);
    });
} */
  
  function validate_form()
  {
  valid = true;

  if($('input[type=checkbox]:checked').length == 0)
  {
      alert ( "ERROR! Please select at least one checkbox" );
      valid = false;
  }

  return valid;
  }
  
</script>
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
HttpSession s=request.getSession();

String n=request.getParameter("caseId");
String crm=request.getParameter("crm");
String patient_Name=request.getParameter("patient_Name");
String cdoc=request.getParameter("Doctor_Name");
String  currentStage=request.getParameter("stage");
 List<String> userRight =LoginDAO.getRight((String)session.getAttribute("userid"));
 %>

	    <% 

		List<MultiFrmVo> list = (List)request.getAttribute("threeDlist");
		List<MultiFrmVo> list1 = (List)request.getAttribute("hallowTag");
		List<MultiFrmVo> list2 = (List)request.getAttribute("upload");
		List<AccountVo>  list3 = (List)request.getAttribute("account");

		String cccrmpriority=(String)session.getAttribute("cccrmpriority");
		List<HallowTagVo> list4=(List)request.getAttribute("previoushallowtagVo");
		List<ThreeDPrintingVo> list5=(List)request.getAttribute("previous3dp");
		List<MultiFrmVo> list6=(List)request.getAttribute("previouslab");
		List<MultiFrmVo> list7=(List)request.getAttribute("dispatch");
		
		List<MultiFrmVo> list8=(List)request.getAttribute("previousfqc");
		List<MultiFrmVo> list9=(List)request.getAttribute("previouspck");
		List<PlanningVO> list10=(List)request.getAttribute("previousotpln");
		List<StagingVo> list11=(List)request.getAttribute("previousstg");
		List<HallowTagVo> list12=(List)request.getAttribute("previoushltg");
		
		List<AddresshandlerVO> addresslist=(List) request.getAttribute("addresshandler"); 

		String hallowtoGet="";
	    String hallowFrom_type="";
	    String uploadtoGet="";
	    String uploadFrom_type="";
	    String paidamount="";
	    String total="";
	    String remainAmount="";
	    String labFrom_type="";
	    String dispatchtoGet="";
	    String dispatchFrom_type="";
	    String threedtoGet="";
		String threedFrom_type="";
    	
		for(MultiFrmVo multiFrmVo:list){  
    	threedtoGet=multiFrmVo.getTo_type();
    	threedFrom_type=multiFrmVo.getFrom_type();
    	
     	%>
	 <%  }
    for(MultiFrmVo multiFrmVo1:list1){  
		 hallowtoGet=multiFrmVo1.getTo_type();
		 hallowFrom_type=multiFrmVo1.getFrom_type();
	 	
     	%>
    	
	
	
	 <%  }
	
    for(MultiFrmVo multiFrmVo2:list2){  
    	uploadtoGet=multiFrmVo2.getTo_type();
    	uploadFrom_type=multiFrmVo2.getFrom_type();
    	
     	%>
    	
	
	
	 <%  }
  
    for(AccountVo AccountVo:list3){  
    	total=AccountVo.getTotal();
    	paidamount=AccountVo.getPaidAmount();
    	remainAmount=AccountVo.getRemainAmount();

    	
     	%>

	
	 <%  }
  
    /* String delimiters = "\\#";
    String[] address={""};
 
    if(addresses!=null){
   	 address = addresses.split(delimiters); //if ccaddress is empty will still return one entry i.e "" 
   }*/
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

                  <%--   <%
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
<input type="hidden" class="form-control" value="<%= n%>" name="caseid" id="caseid" placeholder="Case ID">
<input type="hidden" class="form-control" value="<%= patient_Name%>" name="patient_name" id="patient_name" placeholder="Patient Name">
 --%>

<div class="col-sm-3">
							<label">Case Id : </label><span> <%= n%></span>
								</div>
								<div class="col-sm-3">
									<label> Patient Name : </label> <span><%= patient_Name%></span>
								</div>
								<div class="col-sm-3">
									<label>Doctor Name:</label><span><%= cdoc%>  </span>
								</div>
								<div class="col-sm-3">
									<label>CRM :  </label><span><%= crm%></span>
								</div>
								
								
								</div>
									<div class="row">
											<div class="col-sm-3">
									<label ><a class="btn btn-primary" href="Approval?caseId=<%= n%>&NxtStage=null&crm=<%= crm%>&cdoc=<%= cdoc%>&patient_Name=<%= patient_Name%> ">Fetch data</a>  </label><span></span>
								</div>
								<div class="col-sm-3">
								<label ><a class="btn btn-primary" href="DispImageGrid?caseId=<%= n%> ">View Photo</a>  </label><span></span>

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
								<%  if(userRight.contains("UPL")){ %>
								<fieldset>
    								<legend class="text-center" style="color:black;">Registration link</legend>
								<div class="row">
								<div class="col-sm-12 text-center">	
													<label ><button class="btn btn-info" onclick="viewdigiplan()">View Digiplan</button>  </label>
												<div id="viewdigiplan" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/logincheckdoctor" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
													<label ><button class="btn btn-info" onclick="editipr()">Edit IPR</button>  </label>
												<div id="editipr" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/editservlet" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
									</div>
								   </div>
								   
								   </fieldset>
							<%} %>
								
								
								
								<%  if(userRight.contains("Lab")){ %>
								<fieldset>
    								<legend class="text-center" style="color:black;">Registration link</legend>
								<div class="row">
								<div class="col-sm-12 text-center">		
							
											<label><a class="btn btn-info" href="https://103.120.178.180:8443/Registration/Loginfetchedit?cid=<%=n%>" target="blank">Generate Sticker</a>  </label><span></span>
<!-- 											<label><a class="btn btn-info" href="https://103.120.178.180:8443/Registration/fetchcreate.jsp">Create IPR</a>  </label><span></span>
 -->											
											<label ><button class="btn btn-info" onclick="editipr()">Edit IPR</button>  </label>
												<div id="editipr" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/editservlet" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
								 			<label ><button class="btn btn-info" onclick="viewipr()" >View IPR</button>  </label>
											<div id="viewipr" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/LoginCheck" method="post">			
														<input type="text" name="cid" required
														  pattern="[0-9]{10,10}" placeholder="Enter Case ID" class="inputStyle" value="<%= n%>">
														  <input type="text" name="pln" required
														   placeholder="Enter Plan Number" class="inputStyle">
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
											
												<label ><button class="btn btn-info" onclick="generatetemp()">Generate Template</button>  </label>
												<div id="generatetemp" style="display:none;">
												<form  action="https://103.120.178.180:8443/Registration/Loginfetchtemplate" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
										
											
								   </div>
								   </div>
								   
								   </fieldset>
							<%} %>
							
								
			
<script>
function viewipr() {
  var x = document.getElementById("viewipr");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
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
function generatetemp() {
	  var x = document.getElementById("generatetemp");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
</script>	


  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Multiple Form</strong> </div>

<br>
 <%  if(userRight.contains("UPL")){ 	

	
	 if(list10.size()==0){ %>  
	    <center>
	  <div class="alert alert-danger" style="width:98%;">
         <div class="row" style="margin-top:-10px;margin-bottom:-20px;">
          <i class="fa fa-warning" style="font-size:15px"></i>
             <b> No Approved Planning Data found!</b>
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
             
        </div>
    </div>
    </center>
    <%}else{ %>
	<div class="container" style="width:98%;" >
	  <div class="panel panel-info" >
	    <div class="panel-heading" style="background-color: #d9edf7;">Approved Planning Details<i class="fa fa-check-circle green-color" style="font-size:20px;color:green;"></i> </div>
	    <div class="panel-body">
	    
	    	 <% for(PlanningVO otpln:list10){
	    	 
	    		 String planned_no=otpln.getPlanned_no();
	 	    			    	
		    	 String planning_type=otpln.getPlanning_type();
		    	 String Upper_aligner_from=otpln.getUpper_aligner_from();
		    	 String Upper_aligner_to=otpln.getUpper_aligner_to();
		    	 String Lower_aligner_from=otpln.getLower_aligner_from();
		    	 String Lower_aligner_to=otpln.getLower_aligner_to();
		    	  
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
    <label class="col-md-2 control-label">Planned No </label>  
  <div class="col-lg-4 ">
		<input  class="form-control form-control-lg" value="<%=planned_no%>">
  </div>
    <label class="col-md-2 control-label">Planning Type </label>  
  <div class="col-lg-4 ">
   		<input  class="form-control form-control-lg" value="<%=planning_type%>" >
  </div>
</div>

<div class="row">
    <label class="col-md-2 control-label">Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input class="form-control form-control-lg" value="<%=Upper_aligner_from%>" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input class="form-control form-control-lg" value="<%=Upper_aligner_to%>" ></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input class="form-control form-control-lg" value="<%=Lower_aligner_from%>" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input class="form-control form-control-lg" value="<%=Lower_aligner_to%>" ></label>
    </div>
  </div>
  
</div>
 <%-- <div class="row" style="margin-top: 15px;">
                    <label class="col-md-2 control-label">Dispatch Upper</label>
                    <div class="col-lg-2">
                        <div class="input-group">  
                     <input type="text" class="form-control" id="u_form_6" name="u_form_6"placeholder="u_form" value="<%=u_form%>" readonly >
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group">
                            <input type="text" class="form-control" id="u_to" name="u_to" placeholder="u_to" value="<%=u_to%>" readonly >
                        </div>
                    </div>
                    <label class="col-md-2 control-label">Dispatch Lower</label>
                    <div class="col-lg-2">
                        <div class="input-group">
                            <input type="text" class="form-control" id="l_from" name="l_from" placeholder="l_from" value="<%=l_from%>" readonly >
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="input-group">
                            <input type="text" class="form-control" id="l_to" name="l_to" placeholder="l_to" value="<%=l_to%>" readonly >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <label class="col-md-2 control-label">Sheet Type</label>
                    <div class="col-lg-10">
                        <select class="form-control" name="stagesheet" id="stagesheet" value="<%=stagesheet%>" readonly >
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
                </div>
                <br>
                <div class="row">
                    <label class="col-md-2 control-label">Plan Comment</label>
                    <div class="col-lg-10">
                       <input type="text" class="form-control" id="plan_comment" name="plan_comment" placeholder="Plan Comment" value="<%=plan_comment%>" readonly > 
                    
                    </div>
                </div>
                <br>
              
                <div class="row">
                    <label class="col-md-2 control-label">Created At</label>
                    <div class="col-lg-4">
                        <input type="text" class="form-control" id="created_at" name="created_at" value="<%= new java.util.Date() %>" readonly  >
                    </div>
                    <label class="col-md-2 control-label">Created By</label>
                    <div class="col-lg-4">
                        <input type="text" class="form-control" id="created_by" name="created_by" placeholder="Created By" value="<%=created_by%>" readonly >
                    </div>
                </div>
                <br>
                <div class="row">
                    <label class="col-md-2 control-label">Case Booking Form</label>
                    <div class="col-lg-4">
                        <input type="text" class="form-control" id="case_booking_form" name="case_booking_form" placeholder="Case Booking Form" value="<%=case_booking_form%>"  readonly >
                    </div>
                    <label class="col-md-2 control-label">Sales Approval Docs</label>
                    <div class="col-lg-4">
                        <input type="text" class="form-control" id="sales_approval_docs" name="sales_approval_docs" placeholder="Sales Approval Docs" value="<%=sales_approval_docs%>"  readonly>
                    </div>
                </div>
                <br>
                <div class="row">
                    <label class="col-md-2 control-label">Doc Approval Form</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="doc_approval_form" name="doc_approval_form" placeholder="Doc Approval Form" value="<%=doc_approval_form%>"  readonly>
                    </div>
                </div>  --%>

<div class="row">
	<div class="text-center">
		
	<button class="btn btn-primary" style="background:green;color:white;">Approved Plan</button>
	
	   
	</div>
</div>
</fieldset> 
  	 <%}%>
	   
	    </div>
	    </div>
	    </div>
      	 <%}%>
    
	
            <div class="container " style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading ">Add Upload details</div>
    <div class="panel-body">
    
<form class="form-verticle" action="SaveCADUpload" method="post"  onsubmit="return SaveCADUpload()">

<input  type="hidden" class="form-control" value=<%= n%> name="case_id" id="case_id" placeholder="Case ID"  maxlength="15" style="width:501px;">
  
<input type="hidden" class="form-control" name="doctor_name" value=<%= cdoc%> id="doctor_name" placeholder="Doctor Name"  maxlength="50" style="width:501px;">
 <input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name"  maxlength="50" style="width:501px;">
 <input type="hidden" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name"  maxlength="50" style="width:501px;">
   

<!-- 

<div class="row">
  <label class="col-md-3 control-label">Date</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
  <label><input class="form-control" type="date" name="date" id ="date" style="width:501px;"></label>

    </div>
  </div>
 
</div> -->
<div class="row">
  <label class="col-md-3 control-label">Pre-Post STC</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="pre_post" id ="ppyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="pre_post" id ="ppno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Gif</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="gif" id ="gifyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="gif" id ="gifno" value="No">No</label>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Report</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="report" id ="reportyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="report" id ="reportno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">IPR Sheet</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="ipr_sheet" id ="iprsyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="ipr_sheet" id ="iprsno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Treatment Plan Report</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="treat_report" id ="tpryes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="treat_report" id ="tprno" value="No">No</label>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">IPR Filled</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="ipr_filled" id ="iprfyes" checked value="Yes" >Yes</label>
</div>
    </div>
  </div>
  
  
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="ipr_filled" id ="iprfno" value="No">No</label>
</div>

    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-6 inputGroupContainer">
  <div class="input-group">
  <label>   
  <select class="form-control" name="decesion" id="decesion" style="width:501px;height: 34px;">
           		 		  						  <option value="UPL">Upload Successfully</option>
           		 		<option value="PLNCOR">PLAN CORRECTION</option>
           		 		<option value="STG">Send to Hollow Tag</option>
				   	     
				</select>
  </label>

    </div>
  </div>

</div>


<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-9 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id ="remarks" placeholder="Remarks"  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
    
</div>

<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 

</form>

</div>
</div>   
</div>
      <% } %>
      <%  if(userRight.contains("MPT")){
    	 
    		 
		if(list11.size()== 0){ %>  
		
	    <center>
	  <div class="alert alert-danger" style="width:98%;">
         <div class="row" style="margin-top:-10px;margin-bottom:-20px;">
          <i class="fa fa-warning" style="font-size:15px"></i>
             <b> No Staging Data found!</b>
             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
        </div>
    </div>
    </center>
    <% }else{ %>
    		 
  <div class="container" style="width:99%">
  <div class="panel panel-info" >
    <div class="panel-heading" style="background-color: #d9edf7;" >Staging<i title="Last Staging Details"class="fa fa-check-circle green-color" style="font-size:20px;color:green;"></i> </div>
    <div class="panel-body">
    
    		<% for(StagingVo stg:list11){
    				    	
    		    	 String planning_type=stg.getPlanning_type();
    		    	 String Upper_aligner_from=stg.getUpper_aligner_from();
    		    	 String Upper_aligner_to=stg.getUpper_aligner_to();
    		    	 String Lower_aligner_from=stg.getLower_aligner_from();
    		    	 String Lower_aligner_to=stg.getLower_aligner_to();
    		    	  
    		    
    	    	 %>
    			
    		
    <div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled class="form-control"  value="<%=stg.getUpper_aligner_from()%>" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled class="form-control"   value="<%=stg.getUpper_aligner_to()%>"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"  disabled class="form-control"   value="<%=stg.getLower_aligner_from()%>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"   disabled  class="form-control"   value="<%=stg.getLower_aligner_to()%>"></label>
    </div>
  </div>
</div>

   <div class="row">
    <label class="col-md-2 control-label">Thickness Upper </label>  
  <div class="col-lg-4 ">
<input type="text" disabled class="form-control form-control-lg"  value="<%=stg.getThick_upper()%>">
  </div>
    <label class="col-md-2 control-label">Thickness Lower </label>  
  <div class="col-lg-4 ">
<input type="text" disabled class="form-control form-control-lg"  value="<%=stg.getThick_lower()%>">
  </div>
</div>
<br>
   <div class="row">
    <label class="col-md-2 control-label">Margin Upper</label>  
  <div class="col-lg-4 ">
	<input type="text"  disabled class="form-control form-control-lg"  value="<%=stg.getMargin_upper()%>">	
  </div>
      <label class="col-md-2 control-label">Margin  Lower </label>  
  <div class="col-lg-4 ">
<input type="text" disabled class="form-control form-control-lg"   value="<%=stg.getMargin_lower()%>">
  </div>
</div>
<br>
   <div class="row">
    <label class="col-md-2 control-label">3rd Molar Upper </label>  
  <div class="col-lg-4 ">
	<input type="text"  disabled class="form-control form-control-lg"  value="<%=stg.getMolor_upper()%>">	
  </div>
      <label class="col-md-2 control-label">3rd Molar Lower</label>  
  <div class="col-lg-4 ">
<input type="text" disabled class="form-control form-control-lg"  value="<%=stg.getMolor_lower()%>">
  </div>
</div>
<br>
 <div class="row">
    <label class="col-md-2 control-label">Sheet  Type </label>  
  <div class="col-lg-4 ">
	<input type="text"  disabled class="form-control form-control-lg"   value="<%=stg.getSheet_type()%>">	
  </div>
</div>
  
<br>
	<%}%>
    </div>
    </div>
    </div>
    	<% }%>
 			<div></div>
    	<%  
    	int i=0;
    	  for(HallowTagVo htg:list4){	
    	  	i++;%>  
	
	
	  <div class="container" style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading">Hollow Tagging <span><%=i %></span></div>
    <div class="panel-body">
			
			    <div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from" value="<%=htg.getUpper_aligner_from()%>" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=htg.getUpper_aligner_to()%>"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=htg.getLower_aligner_from()%>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"   disabled  class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=htg.getLower_aligner_to()%>"></label>
    </div>
  </div>
</div>
</div>
</div>
</div>
<%} %>

	<%--   <div class="container" style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading"> Add New Hollow Taging</div>
    <div class="panel-body">
		<form class="form-verticle" action="SaveHallowTag?query=hallowtaggrid" method="post">
		   <input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
		   <input type="hidden" class="form-control" name="crm" value=<%= crm%> id="crm" placeholder="CRM Name" style="width:501px;">
		   <input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
		   <input type="hidden" class="form-control"   value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
			
<div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="upper_aligner_to"	name="upper_aligner_to" placeholder="To"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="lower_aligner_from" name="lower_aligner_from"  placeholder="From"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="lower_aligner_to" name="lower_aligner_to" placeholder="To "></label>
    </div>
  </div>
</div>

 <div class="row" >
	<div class="text-center">
		<button type="submit" class="btn btn-primary" >Submit</button>
	</div>
</div> 

</form>
</div>
</div>
</div> --%>


	  <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Hollow Tagging Details</div>
    <div class="panel-body">
			<form class="form-verticle" action="SaveHallowTag" method="post" onsubmit="return MPTvalidation()">
		   <input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
		   <input type="hidden" class="form-control" name="crm" value=<%= crm%> id="crm" placeholder="CRM Name" style="width:501px;">
		   <input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
		   <input type="hidden" class="form-control"   value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">

 <div class="row">
  <label class="col-md-3 control-label">No of Upper Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" required class="form-control" id="upper_aligner_from" name="upper_aligner_from"  placeholder="From" style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="upper_aligner_to"	name="upper_aligner_to"  placeholder="To" style="width:233px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
</div>

 <div class="row">
  <label class="col-md-3 control-label">No of Lower Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" required class="form-control" id="lower_aligner_from" name="lower_aligner_from"   placeholder="From" style="width:230px;"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-6 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" required class="form-control" id="lower_aligner_to" name="lower_aligner_to"  placeholder="To" style="width:233px;"   oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
</div>



<div class="row">
  <label class="col-md-3 control-label">Decision</label> 
   
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
					  <% List<String> HallowDecesion=(ArrayList<String>)session.getAttribute("HallowDecesion");
				   	    for(String hallow:HallowDecesion) {%>
				   	    	<option value="<%=hallow %>"><%=hallow %></option>
				   	    <%}%> 
					  
				</select>
  </label>

    </div>
  </div>

</div>
<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-9 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id ="remark" placeholder="Remarks..."  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
</div>
<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62"style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
</form>
</div>
</div>   
</div>
<% } 
 
if(userRight.contains("3DP")){ 
	
	int i=0;
	if(list12.size()==0){ %>  
	
    <center>
	  <div class="alert alert-danger" style="width:98%;">
         <div class="row" style="margin-top:-10px;margin-bottom:-20px;">
          <i class="fa fa-warning" style="font-size:15px"></i>
             <b> No Hollow Tagging Data found!</b>
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
             
        </div>
    </div>
    </center>
    
  <%}else{ %>

<div class="container" style="width:98%;">
  <div class="panel panel-info">    
    <div class="panel-heading" style="background-color: #d9edf7;">Hollow Tagging Details<i class="fa fa-check-circle green-color" title="Previous Hollow Tagging Details" style="font-size:20px;color:green;"></i> </div>
    <div class="panel-body">
			<% for(HallowTagVo hltg : list12 ){%>
	<div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled="" class="form-control" id="upper_aligner_from" name="upper_aligner_from" value="<%=hltg.getUpper_aligner_from()%>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled="" class="form-control" id="upper_aligner_to" name="upper_aligner_to" value="<%=hltg.getUpper_aligner_to()%>"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled="" class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=hltg.getLower_aligner_from()%>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled="" class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=hltg.getLower_aligner_to()%>"></label>
    </div>
  </div>
</div>
<% } %>
</div>
</div>
</div>
<% }%>
	
	<%
	  
	  for(ThreeDPrintingVo tdp:list5){	
	  	i++;
	  	
	%>
	

	
	 <div class="container" style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading"> 3D Printing<span><%=i %></span></div>
    <div class="panel-body">
        <div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from" value="<%=tdp.getUpper_aligner_from() %>" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=tdp.getUpper_aligner_to() %>"></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=tdp.getLower_aligner_from() %>"></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text" disabled  class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=tdp.getLower_aligner_to() %>"></label>
    </div>
  </div>
</div>
    
    		    <div class="row">
    <label class="col-md-2 control-label">Print</label>  
  <div class="col-lg-4 ">
<input type="text"   disabled  class="form-control" name="print" id="print" value="<%=tdp.getPrint() %>">
  </div>

  
    <label class="col-md-2 control-label">Mode </label>  
  <div class="col-lg-4 ">

<input type="text"   disabled  class="form-control  form-select-lg  mb-3"  name="mode" id="mode"  value="<%=tdp.getMode() %>">

  </div>

</div>


    </div>
    </div>
    </div>
    <%} %>
    
  <%--    <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading">Add new 3D Printing</div>
    <div class="panel-body">
    <form class="form-verticle" action="ThreeDPrinting?query=3dp" method="post">
     <input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
		   <input type="hidden" class="form-control" name="crm" value=<%= crm%> id="crm" placeholder="CRM Name" style="width:501px;">
		   <input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
		   <input type="hidden" class="form-control"   value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
		  
		    <div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"     required class="form-control" id="upper_aligner_from"	name="upper_aligner_from" value="" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    required class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value=""></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"   required  class="form-control" id="lower_aligner_from" name="lower_aligner_from" value=""></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"   required  class="form-control" id="lower_aligner_to" name="lower_aligner_to" value=""></label>
    </div>
  </div>
</div>
		    <div class="row">
    <label class="col-md-2 control-label">Print</label>  
  <div class="col-lg-4 ">
  <div class="">

  	 <select class="form-control form-select-lg  mb-3" name="print" id="print"  aria-label=".form-select-lg example">
  						<option value="Print1">Select a Print Option</option>
           		 		 <% List<String> Print_Type=(ArrayList<String>)session.getAttribute("Print_Type");
				   	    for(String print:Print_Type) {%>
				   	    	<option value="<%=print %>"><%=print %></option>
				   	    <%}%>    
				</select>  

    </div>
  </div>

  
    <label class="col-md-2 control-label">Mode </label>  
  <div class="col-lg-4 ">
  <div class="">

  <select class="form-control form-select-lg  mb-3" name="mode" id="mode" aria-label=".form-select-lg example">
  						  <option value="0">Select Mode</option>
  						
			  <% List<String> mode_Type=(ArrayList<String>)session.getAttribute("Mode_type");
				   	    for(String mode:mode_Type) {%>
				   	    	<option value="<%=mode %>"><%=mode %></option>
				   	    <%}%> 
	
			 </select>
    </div>
  </div>

</div>
<br>		
		
<div class="row">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div>  
 </form>
    </div>
    </div>
    </div> --%>
    
    
 <div class="container" style="width:98%;">
  <div class="panel panel-info" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add 3D Printing Details</div>
    <div class="panel-body">
				<form class="form-verticle" action="ThreeDPrinting" method="post">
 		   <input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
		   <input type="hidden" class="form-control" name="crm" value=<%= crm%> id="crm" placeholder="CRM Name" style="width:501px;">
		   <input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
		   <input type="hidden" class="form-control"   value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">

<%-- 			<div class="row">
  <label class="col-md-3 control-label">Case ID</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
<label><input  type="text" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;"></label>
    </div>
  </div>
</div> --%>
<%-- <div class="row">
  <label class="col-md-3 control-label">Doctor Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
  <label><input type="text" class="form-control"  value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;"></label>
    </div>
  </div>
</div> --%>
<%-- <div class="row">
  <label class="col-md-3 control-label">Patient Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		
  <label><input type="text" class="form-control"  value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;"></label>

    </div>
  </div>
</div> --%>





   
<div class="row">
  <label class="col-md-3 control-label">Print</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="print" id="print" required style="width:501px; height: 34px;">
<!--   						<option value="Print1">Select a Print Option</option>
 -->           		 		 <% List<String> Print_Type1=(ArrayList<String>)session.getAttribute("Print_Type");
				   	    for(String print:Print_Type1) {%>
				   	    	<option value="<%=print %>"><%=print %></option>
				   	    <%}%>    
				</select>
						
					</label>

    </div>
  </div>

</div>
<div class="row">
  <label class="col-md-3 control-label">Mode</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="mode" id="mode" required style="width:501px;height: 34px;">
<!--   						  <option value="0">Select a Mode option</option>
 -->  						
			  <% List<String> mode_Type1=(ArrayList<String>)session.getAttribute("Mode_type");
				   	    for(String mode:mode_Type1) {%>
				   	    	<option value="<%=mode %>"><%=mode %></option>
				   	    <%}%> 
	
			 </select>
  </label>

    </div>
  </div>

</div>
 <div class="row">
  <label class="col-md-3 control-label">No of Upper Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" required name="upper_aligner_from" id="upper_aligner_from"  placeholder="From" style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control" required name="upper_aligner_to" id="upper_aligner_to"  placeholder="To " style="width:233px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
</div>

 <div class="row">
  <label class="col-md-3 control-label">No of Lower Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
				   	    
				   	    


  <label><input type="text" class="form-control" required name="lower_aligner_from" id="lower_aligner_from"  placeholder="From" style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control" required name="lower_aligner_to" id="lower_aligner_to" placeholder="To"  style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="decesion" required id="decesion" style="width:501px;height: 34px;">
  
					  <% List<String> PrintingDecesion=(ArrayList<String>)session.getAttribute("PrintDecesion");
				   	    for(String decesionprint:PrintingDecesion) {%>
				   	    	<option value="<%=decesionprint %>"><%=decesionprint %></option>
				   	    <%}%> 
	 
				</select>
  </label>

    </div>
  </div>

</div>
<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-8 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id ="remark" placeholder="Remarks"  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
    
</div>

<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
</form>
</div>
</div>   
</div>

<% } %>

<% 
if(userRight.contains("LAB")  || currentStage.equals("LABCOR")  && !currentStage.equals("PCKCOR") && !currentStage.equals("PCK")  && !currentStage.equals("FQC")  || currentStage.equals("3DP")){ 
	int i=0;
	 
	  for(MultiFrmVo mult:list6){	
		  String Lower_att=mult.getLower_att();
		  String upper_att=mult.getUpper_att();	       
	  	  i++;
	%>
	
<%--    <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading">Lab <%=i %></div>
    <div class="panel-body">
    
	 <div class="row">
  <label class="col-md-3 control-label">No of Upper Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From" style="width:230px;" disabled value="<%=mult.getUpper_aligner_from() %>" ></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text"  disabled class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=mult.getUpper_aligner_to() %>"></label>
    </div>
  </div>
  
  
  <div class="col-md-1">
  		<label>Att </label> 
	</div>
  
      <div class="col-md-1">
      <% if(Lower_att!=null) { %>
  		<input type="checkbox" name="lower_att" id="lower_att"  title="Upper Attachment" checked value="1" onclick="return false;">
  		<%}else{ %>
  		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Upper Attachment" onclick="return false;">
  		<%}%>
  </div>
</div>

 <div class="row">
  <label class="col-md-3 control-label">No of Lower Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text"   disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=mult.getLower_aligner_from() %>" style="width:230px;"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input  type="text" disabled class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=mult.getLower_aligner_to()%>" style="width:230px;"></label>
    </div>
  </div>
  
    <div class="col-md-1">
  		<label>Att </label> 
	</div>
  
      <div class="col-md-1">
        <%if(upper_att!=null){  %>
  		<input type="checkbox" checked name="lower_att" id="lower_att"  title="Lower Attachment" value="1" onclick="return false;">
  		<%}else{ %>
  		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" onclick="return false;">
  		
  		<%}%>
  </div>
  
</div>
 
    </div>
    </div>
    </div> --%>
    
    <%} %>
<%--       <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading">Add New Lab</div>
    <div class="panel-body">
    		<form class="form-verticle" action="SaveLab?query=lab" method="post">
			<input  type="hidden" class="form-control" value="<%= n%>" name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
			<input type="hidden" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name" style="width:501px;">
 		    <div class="row">
    <label class="col-md-2 control-label">No of Upper Aligner</label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    required class="form-control" id="upper_aligner_from"	name="upper_aligner_from" value="" ></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    required class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value=""></label>
    </div>
  </div>
  
    <label class="col-md-2 control-label">No of  Lower Aligner </label>  
  <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    required class="form-control" id="lower_aligner_from" name="lower_aligner_from" value=""></label>
    </div>
  </div>
    <div class="col-lg-2 ">
  <div class="input-group">
  <label><input type="text"    required class="form-control" id="lower_aligner_to" name="lower_aligner_to" value=""></label>
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
    </div> --%>
    
    
           <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading" style="border-color: #3a5e7c;">Add Lab Details</div>
    <div class="panel-body">
    
			<form class="form-verticle" action="SaveLab" method="post" onsubmit="return labvalidation()">
			<input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
			<input type="hidden" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name" style="width:501px;">

 <div class="row">
  <label class="col-md-3 control-label">No of Upper Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control"  name="upper_aligner_from" id="upper_aligner_from"  placeholder="From" style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control"  name="upper_aligner_to" id="upper_aligner_to"  placeholder="To " style="width:233px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
  <div class="col-md-1">
  		<label>Att </label> 
	</div>
  
      <div class="col-md-1">
  		<input type="checkbox" name="upper_att" id="upper_att"  title="Upper Attachment"  value="1">
  </div>
</div>

 <div class="row">
  <label class="col-md-3 control-label">No of Lower Aligner</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control"  name="lower_aligner_from" id="lower_aligner_from"  placeholder="From" style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control"  name="lower_aligner_to" id="lower_aligner_to" placeholder="To"  style="width:230px;"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"></label>
    </div>
  </div>
  
      <div class="col-md-1">
  		<label>Att </label> 
	</div>
  
      <div class="col-md-1">
  		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" value="1">
  </div>
  
  
</div>
<div class="row">
  <label class="col-md-3 control-label">Marking</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="making" id="myes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="making" id="mno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Waxing /Sheet Selection</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="waxing" id="wssyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="waxing" id="wssno" value="No">No</label>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">ThermoForm</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="thermoform" id="tfyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="thermoform" id="tfno"  value="No">No</label>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Name/No/Category</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="name_cat" id="nncyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="name_cat" id="nncno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Hand Tooling</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="hand_tooling" id="htyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="hand_tooling" id="htno" value="No">No</label>
</div>
    </div>
  </div>
</div>





<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <% if(userRight.contains("FQC")){ %>
  
   <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
   <% List<String> FQCPrint_Type=(ArrayList<String>)session.getAttribute("Decesion_Type");
				   	    for(String decesionprint:FQCPrint_Type) {%>
				   	    	<option value="<%=decesionprint %>"><%=decesionprint %></option>
				   	    <%}%> 
				 </select>
  
  
  <%}else{ %>
 
  <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
           		 		<% List<String> Decesionlab=(ArrayList<String>)session.getAttribute("Decesionlab");
				   	    for(String lab:Decesionlab) {%>
				   	    	<option value="<%=lab%>"><%=lab %></option>
				   	    <%}%> 
					  	</select><%} %>
  </label>

    </div>
  </div>

</div>

<%-- <div class="row">
  <label class="col-md-3 control-label">From/To</label>  
  <div class="col-md-3 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" name="from_type" id="from_type" value="<%= labFrom_type%>" placeholder="From" style="width:230px;"></label>
    </div>
  </div>
    <div class="col-md-3 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control" name="to_type" id="to_type" value="<%=labtoGet%>" placeholder="To " style="width:233px;"></label>
    </div>
  </div>
</div>
 --%>
<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-9 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id="remarks" placeholder="Remarks"  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
    
</div>

<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
</form>
</div>
</div>   
</div>

<% } %>

<% if(userRight.contains("FQC") && currentStage.contains("LAB") ){ %>
    
  <div class="container" style="width:98%;">
  <div class="panel panel-info" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Finishing Quality Check Details</div>
    <div class="panel-body">
    
			<form class="form-verticle" action="SaveFqc" method="post" onsubmit="return fqcvalidation()">
			<input  type="hidden" class="form-control" value=<%= n%> name="caseid" id="caseid" placeholder="Case ID"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
			<input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
			<input type="hidden" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name" style="width:501px;">

 

 <%for(MultiFrmVo mult1:list8){	
	  String Lower_att=mult1.getLower_att();
	  String upper_att=mult1.getUpper_att();
	  
	  String making=mult1.getMaking();
	  String waxing=mult1.getWaxing();
	  String thermoform=mult1.getThermoform();
	  String name_cat=mult1.getName_cat();
	  String hand_tooling=mult1.getHand_tooling();
	  %>

<div class="container" style="width:98%;">
<div class="row">
<label class="col-md-3 control-label">No of Upper Aligner</label>  
<div class="col-md-3 inputGroupContainer">
<div class="input-group">	
<label><input type="text" disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From" style="width:230px;" disabled value="<%=mult1.getUpper_aligner_from() %>" onclick="return false;"></label>
</div>
</div>
<div class="col-md-3 inputGroupContainer">
<div class="input-group">
<label><input type="text"  disabled class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=mult1.getUpper_aligner_to() %>" onclick="return false;"></label>
</div>
</div>


<div class="col-md-1">
		<label>Att </label> 
</div>



 <div class="col-md-1">
   <%if(upper_att!=null  ){  %>
		<input type="checkbox" checked name="lower_att" id="lower_att"  title="Lower Attachment" value="1" onclick="return false;">
		<%}else{ %>
		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" onclick="return false;">
		
		<%}%>
</div>
</div>

<div class="row">
<label class="col-md-3 control-label">No of Lower Aligner</label>  
<div class="col-md-3 inputGroupContainer">
<div class="input-group">	
<label><input type="text"   disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=mult1.getLower_aligner_from() %>" style="width:230px;"  onclick="return false;"></label>
</div>
</div>
<div class="col-md-3 inputGroupContainer">
<div class="input-group">
<label><input  type="text" disabled class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=mult1.getLower_aligner_to()%>" style="width:230px;"  onclick="return false;"></label>
</div>
</div>

<div class="col-md-1">
		<label>Att </label> 
</div>

 <div class="col-md-1">
 <% if(Lower_att!=null  ) { %>
		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" checked value="1" onclick="return false;">
		<%}else{ %>
		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Upper Attachment" onclick="return false;">
		<%}%>
</div>

</div>




<div class="row">
  <label class="col-md-3 control-label">Marking</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		<% if(making.equalsIgnoreCase("yes")){ %>
  <label><input type="radio"   name="making" id="myes" checked value="Yes" checked onclick="return false;">Yes</label>
  <%}else{ %>
    <label><input type="radio" name="making" id="myes" checked value="Yes" onclick="return false;">Yes</label>
  
  <%} %>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
   <% if(making.equalsIgnoreCase("no")){ %>
  <label><input type="radio" name="making" id="mno" value="No" checked onclick="return false;">No</label>
  <%}else{ %>
    <label><input type="radio" name="making" id="mno" value="No" onclick="return false;">No</label>
  <%} %>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Waxing /Sheet Selection</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		<% if(waxing.equalsIgnoreCase("yes")){ %>
  <label><input type="radio" name="waxing" id="wssyes" checked value="Yes" checked  onclick="return false;">Yes</label>
  <%}else{ %>
    <label><input type="radio" name="waxing" id="wssyes"  value="Yes"  onclick="return false;">Yes</label>
   <%} %>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
   <% if(waxing.equalsIgnoreCase("no")){ %>
  <label><input type="radio" name="waxing" id="wssno" value="No" checked onclick="return false;">No</label>
    <%}else{ %>
      <label><input type="radio" name="waxing" id="wssno" value="No" onclick="return false;">No</label>
     <%} %>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Thermo Form</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		<% if(thermoform.equalsIgnoreCase("yes")){ %>
  <label><input type="radio" name="thermoform" id="tfyes"  value="Yes" checked onclick="return false;">Yes</label>
  <%}else{ %>
    <label><input type="radio" name="thermoform" id="tfyes"  value="Yes"  onclick="return false;">Yes</label>
   <%} %>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <% if(thermoform.equalsIgnoreCase("no")){ %>
  <label><input type="radio" name="thermoform" id="tfno"  value="No" checked onclick="return false;">No</label>
    <%}else{ %>
      <label><input type="radio" name="thermoform" id="tfno"  value="No"  onclick="return false;">No</label>
    
    <%} %>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Name/No/Category</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		 <% if(name_cat.equalsIgnoreCase("yes")){ %>
  <label><input type="radio" name="name_cat" id="nncyes" checked value="Yes" onclick="return false;">Yes</label>
    <%}else{ %>
      <label><input type="radio" name="name_cat" id="nncyes"  value="Yes" onclick="return false;">Yes</label>
    <%} %>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
    <% if(name_cat.equalsIgnoreCase("no")){ %>
  <label><input type="radio" name="name_cat" id="nncno" value="No" checked onclick="return false;">No</label>
   <%}else{ %>
    <label><input type="radio" name="name_cat" id="nncno" value="No" onclick="return false;">No</label>
     <%} %>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Hand Tooling</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		    <% if(hand_tooling.equalsIgnoreCase("yes")){ %>
  		
  <label><input type="radio" name="hand_tooling" id="htyes" checked value="Yes" onclick="return false;">Yes</label>
  <%}else{ %>
    <label><input type="radio" name="hand_tooling" id="htyes"  value="Yes" onclick="return false;">Yes</label>
  
  
  <%} %>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
    <% if(hand_tooling.equalsIgnoreCase("no")){ %>
  <label><input type="radio" name="hand_tooling" id="htno" value="No" checked onclick="return false;">No</label>
  <%}else{ %>
    <label><input type="radio" name="hand_tooling" id="htno" value="No" onclick="return false;">No</label>
  
  <%}%>
</div>
    </div>
  </div>
</div>
<%} %>
<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>

  
   <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
   <% List<String> FQCPrint_Type=(ArrayList<String>)session.getAttribute("Decesion_Type");
				   	    for(String decesionprint:FQCPrint_Type) {%>
				   	    	<option value="<%=decesionprint %>"><%=decesionprint %></option>
				   	    <%}%> 
				 </select>
  
  
  
  </label>

    </div>
  </div>

</div>

<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-9 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id="remarks" placeholder="Remarks"  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
    
</div>
<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
<div class="row">
<label class="col-md-3"></label>  
	&ensp;&nbsp;<input type="checkbox" name="confirm_status" id="confirm_status" value="yes" required>&nbsp;By continuing, you agree to the above information is correct.

</div>
<br>
 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
</form>
</div>
</div>   
</div>

<% } %>



<% 
if(currentStage==null){
	currentStage="";
}
if(userRight.contains("PCK") && currentStage.contains("FQC") || currentStage.contains("PCKCOR")){ %>
<% if(list8.size()!=0){ %>
  <div class="container"  style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading"> Packing Lab Details </div>
    <div class="panel-body">
    
    <% 
    for(MultiFrmVo mult1:list8){	
	  String Lower_att=mult1.getLower_att();
	  String upper_att=mult1.getUpper_att();
	  String making=mult1.getMaking();
	  String waxing=mult1.getWaxing();
	  String thermoform=mult1.getThermoform();
	  String name_cat=mult1.getName_cat();
	  String hand_tooling=mult1.getHand_tooling();
	  %>

<div class="row">
<label class="col-md-3 control-label">No of Upper Aligner</label>  
<div class="col-md-3 ">
<div class="input-group">	
<label><input type="text" disabled class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From" value="<%=mult1.getUpper_aligner_from() %>" onclick="return false;"></label>
</div>
</div>
<div class="col-md-3 ">
<div class="input-group">
<label><input type="text" disabled class="form-control" id="upper_aligner_to" name="upper_aligner_to" value="<%=mult1.getUpper_aligner_to() %>" onclick="return false;"></label>
</div>
</div>


<div class="col-md-1">
		<label>Att </label> 
</div>
 <div class="col-md-1">
   <%if(upper_att!=null){  %>
		<input type="checkbox" checked name="lower_att" id="lower_att"  title="Lower Attachment" value="1" onclick="return false;">
		<%}else{ %>
		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" onclick="return false;">
		
		<%}%>
</div>

</div>

<div class="row">
<label class="col-md-3 control-label">No of Lower Aligner</label>  
<div class="col-md-3 inputGroupContainer">
<div class="input-group">	
<label><input type="text"   disabled class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=mult1.getLower_aligner_from() %>" onclick="return false;"></label>
</div>
</div>
<div class="col-md-3 inputGroupContainer">
<div class="input-group">
<label><input  type="text" disabled class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=mult1.getLower_aligner_to()%>" onclick="return false;"></label>
</div>
</div>

<div class="col-md-1">
		<label>Att </label> 
</div>



 <div class="col-md-1">
 <% if(Lower_att!=null) { %>
		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" checked value="1" onclick="return false;">
		<%}else{ %>
		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Upper Attachment" onclick="return false;">
		<%}%>
</div>

</div>

<% } %>
    </div>
    </div>
    </div>
   <%} %>
    
  <div class="container" style="width:98%;" >
  <div class="panel panel-info" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Packaging  Details </div>
    <div class="panel-body">
		<form class="form-verticle" action="Savepacking" method="post" >
<input  type="hidden" class="form-control" value=<%= n%> name="case_id" id="case_id" placeholder="Case ID"  style="width:501px;">
<input type="hidden" class="form-control" value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;">
<input type="hidden" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;">
<input type="hidden" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name" style="width:501px;">

<%-- <div class="row">
  <label class="col-md-3 control-label">Case ID</label>  
  <div class="col-md-6 inputGroupContainer">
  <div class="input-group">	
  <label><input  type="text" class="form-control" value=<%= n%> name="case_id" id="case_id" placeholder="Case ID"  style="width:501px;"></label>
    </div>
  </div>

</div>
<div class="row">
  <label class="col-md-3 control-label">Doctor Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  <label><input type="text" class="form-control" value=<%= cdoc%> name="doctor_name" id="doctor_name" placeholder="Doctor Name"  style="width:501px;"></label>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Patient Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" value=<%= patient_Name%> name="patient_name" id="patient_name" placeholder="Patient Name" style="width:501px;"></label>
        </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">CRM Name</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text" class="form-control" value=<%= crm%> name="crm" id="crm" placeholder="CRM Name" style="width:501px;"></label>
    </div>
  </div>
</div> --%>

<div class="row">
  <label class="col-md-3 control-label">Ultra Sonic</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="ultra_sonic" id="usyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="ultra_sonic" id="usno" value="No">No</label>
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Air</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="air" id="airyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
  
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="air" id="airno" value="No">No</label>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Pouch Seal</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  <label><input type="radio" name="pouch_seal" id="psyes" checked value="Yes">Yes</label>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  <label><input type="radio" name="pouch_seal" id="psno" value="No">No</label>
</div>
    </div>
  </div>
</div>


<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
           		 		<% List<String> PackingAPR=(ArrayList<String>)session.getAttribute("PackingAPR");
				   	    for(String pack:PackingAPR) {%>
				   	    	<option value="<%=pack%>"><%=pack%></option>
				   	    <%}%> 
					  
				</select>
  </label>

    </div>
  </div>

</div>

  
<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-8 inputGroupContainer">
  <div class="input-group">
  		<label>
  		<textarea class="form-control"  name="remark" id ="remark" placeholder="Remarks"  maxlength="250" rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
</div>
   <div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div> 
    
<div class="row">
<label class="col-md-3"></label>  
	&ensp;&nbsp;<input type="checkbox" name="confirm_status" id="confirm_status" value="yes" required>&nbsp;By continuing, you agree to the above information is correct.

</div>
<br>

 <div class="col-md-8">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 
</form>
</div>
</div>   
</div>

<% } %>
<%   

if(userRight.contains("DPH")  && currentStage.contains("PCK") && !currentStage.contains("PCKCOR")){
	// && currentStage.contains("PCK") && !currentStage.contains("PCKCOR")
    int i=0;
	  for(MultiFrmVo disp:list7){	
	  	i++;
	%>
    
<%--             <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading">Dispatched Scan <%=i %></div>
    <div class="panel-body">
        <div class="row">
    <label class="col-md-2 control-label">No of Aligners </label>  
  <div class="col-lg-4 ">
  
<input type="text" disabled class="form-control form-control-lg" name="noofaligner" id="noofaligner"  value="<%=disp.getNo_of_aligners()%>">
  </div>
  
    <label class="col-md-2 control-label">Delivery Note No. </label>  
  <div class="col-lg-4 ">

	<input type="text"  disabled class="form-control form-control-lg" name="delivery_nn" id="delivery_nn" value="<%=disp.getDelivery_nn()%>">
			
  </div>
</div>
<br>
    <div class="row">
    <label class="col-md-2 control-label">Tracking ID</label>  
  <div class="col-lg-4 ">
  
<input type="text" disabled class="form-control form-control-lg" name="tracking_id" id="tracking_id"  value="<%=disp.getTracking_id()%>">
  </div>
  
    <label class="col-md-2 control-label">Mode of Dispatch </label>  
  <div class="col-lg-4 ">

	<input type="text"  disabled class="form-control form-control-lg" name="modeofdispatch" id="modeofdispatch" value="<%=disp.getMode_of_dispatch()%>">
			
  </div>
</div>
    </div>
    </div>
    </div> --%>
    <%}%>
<%--      
         <div class="container" style="width:98%;">
  <div class="panel panel-info" >
    <div class="panel-heading">Dispatched Scan </div>
    <div class="panel-body">
    		<form class="form-verticle" action="DispatchedScan?query=dispatch" method="post">
			<input  type="hidden" class="" value=<%= n%> name="case_id" id="caseId">
			<input type="hidden" class="" value=<%= cdoc%> name="doctor_name" id="doctor_name">
			<input type="hidden" class=""  value=<%= patient_Name%> name="patient_name" id="patient_name">
			<input type="hidden" class="" value=<%= crm%> name="crm" id="crm">
    
        <div class="row">
    <label class="col-md-2 control-label">No of Aligners </label>  
  <div class="col-lg-4 ">
  
<input type="text"  required class="form-control form-control-lg" name="noofaligner" id="noofaligner"  value="">
  </div>
  
    <label class="col-md-2 control-label">Delivery Note No. </label>  
  <div class="col-lg-4 ">

	<input type="text"   required class="form-control form-control-lg" name="delivery_nn" id="delivery_nn" value="">
			
  </div>
</div>
<br>
    <div class="row">
    <label class="col-md-2 control-label">Tracking ID</label>  
  <div class="col-lg-4 ">
  
<input type="text"  required class="form-control form-control-lg" name="tracking_id" id="tracking_id"  value="">
  </div>
  
    <label class="col-md-2 control-label">Mode of Dispatch </label>  
  <div class="col-lg-4 ">

<select class="form-control form-control-lg" name="modeofdispatch" id="modeofdispatch" required>
				   	    	<option value="Byhand">By hand </option>
				   	    	<option value="Courier"> Courier</option>
				   	    	<option value="V-fast"> V-fast</option>
					  	</select>			
  </div>
</div>
<br>
<div class="row">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div>
</form>
    </div>
    </div>
    </div> --%>
    
    <!-- lab/pck div start /////// -->

    
    
       <%if(list8.size()!=0){ %>
       

    
    <%
    for(MultiFrmVo mult1:list8){	
	  String Lower_att=mult1.getLower_att();
	  String upper_att=mult1.getUpper_att();
	  String making=mult1.getMaking();
	  String waxing=mult1.getWaxing();
	  String thermoform=mult1.getThermoform();
	  String name_cat=mult1.getName_cat();
	  String hand_tooling=mult1.getHand_tooling();
	  %>
<div class="container" style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading"> Dispatch Lab  Details </div>
    <div class="panel-body">
  <fieldset disabled>
<div class="row">
<label class="col-md-3 control-label">No of Upper Aligner</label>  
<div class="col-md-3 ">
<div class="input-group">	
<label><input type="text" class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From"   value="<%=mult1.getUpper_aligner_from() %>" ></label>
</div>
</div>
<div class="col-md-3 ">
<div class="input-group">
<label><input type="text" class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=mult1.getUpper_aligner_to() %>" ></label>
</div>
</div>

   <%if(upper_att!=null){  %>
		Att &nbsp;<input type="checkbox" checked name="lower_att" id="lower_att"  title="Upper Attachment" value="1" style="pointer-events: none;">
		<%}else{ %>
		  		Att &nbsp;<input type="checkbox" name="lower_att" id="lower_att"  title="Upper Attachment" style="pointer-events: none;">
		
		<%}%>
</div>



<div class="row">
<label class="col-md-3 control-label">No of Lower Aligner</label>  
<div class="col-md-3 ">
<div class="input-group">	
<label><input type="text" class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=mult1.getLower_aligner_from() %>"></label>
</div>
</div>
<div class="col-md-3 ">
<div class="input-group">
<label><input  type="text" class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=mult1.getLower_aligner_to()%>"></label>
</div>
</div>


 <div class="col-md-1">
 <% if(Lower_att!=null) { %>
		Att &nbsp;<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" checked value="1"  style="pointer-events: none;">
		<%}else{ %>
		  		Att &nbsp;<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" style="pointer-events: none;">
		<%}%>
</div>
</div>
<% } %>
</fieldset>
    </div>
    </div>
    </div>
    <% } %>
    
   <%if(list9.size()!=0){ 
	   
	   
	    for(MultiFrmVo mult9:list9){	
		 String ultra_sonic=mult9.getUltra_sonic();
		 String air=mult9.getAir();
		 String pouch_seal=mult9.getPouch_seal();
	    
   %>
    <!-- Packaging data start//////////// -->
    <fieldset disabled>
    <div class="container" style="width:98%;" >
  <div class="panel panel-info" >
    <div class="panel-heading"> Dispatch Packaging Details</div>
    <div class="panel-body">
		<div class="row">
  <label class="col-md-3 control-label">Ultra Sonic</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		
  		<% if(ultra_sonic.equals("Yes")){%>
  <label><input type="radio" name="ultra_sonic" id="usyes" checked value="Yes" checked>Yes</label>
  <%}else{ %>
    <label><input type="radio" name="ultra_sonic" id="usyes" checked value="Yes" >Yes</label>
   <%}%>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
  	<% if(ultra_sonic.equals("No")){%>
  <label><input type="radio" name="ultra_sonic" id="usno" value="No" checked>No</label>
    <%}else{ %>
      <label><input type="radio" name="ultra_sonic" id="usno" value="No">No</label>
     <%}%>
    
</div>
    </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Air</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		<% if(air.equals("Yes")){%>
  <label><input type="radio" name="air" id="airyes" checked value="Yes" checked >Yes</label>
   <%}else{ %>
     <label><input type="radio" name="air" id="airyes" checked value="Yes">Yes</label>
   
    <%}%>
</div>
    </div>
  </div>
  
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
   <% if(air.equals("No")){%>
  		<label><input type="radio" name="air" id="airno" value="No" checked >No</label>
 <%}else{ %>
   		 <label><input type="radio" name="air" id="airno" value="No" >No</label>
  <%}%>
</div>
    </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Pouch Seal</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  		<div class="radio">
  		 <% if(pouch_seal.equals("Yes")){%>
 				 <label><input type="radio" name="pouch_seal" id="psyes" checked value="Yes" >Yes</label>
   <%}else{ %>
    	 <label><input type="radio" name="pouch_seal" id="psyes"  value="Yes" >Yes</label>
    <%}%>
</div>
    </div>
  </div>
    <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
   <div class="radio">
     		 <% if(pouch_seal.equals("No")){%>
  		<label><input type="radio" name="pouch_seal" id="psno" value="No" checked ">No</label>
   <%}else{ %>
     <label><input type="radio" name="pouch_seal" id="psno" value="No">No</label>
    <%}%> 
</div>
    </div>
  </div>
</div>
		
	</div>
	</div>
	</div>
	</fieldset>
	<% } } %>
    <!-- Packaging data end///////////// -->
  
    
    
        <div class="container" style="width:98%;">
  <div class="panel panel-info" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Dispatched Scan Details</div>
    <div class="panel-body">
		<form class="form-verticle" action="DispatchedScan" method="post"  onsubmit="return dphvalidation()">
			<input  type="hidden" class="" value=<%= n%> name="case_id" id="caseId">
			<input type="hidden" class="" value=<%= cdoc%> name="doctor_name" id="doctor_name">
			<input type="hidden" class=""  value=<%= patient_Name%> name="patient_name" id="patient_name">
			<input type="hidden" class="" value=<%= crm%> name="crm" id="crm">
<!-- ///////////// -->
      <%if(list8.size()!=0){ %>
    
    <%
    for(MultiFrmVo mult1:list8){	
	  String Lower_att=mult1.getLower_att();
	  String upper_att=mult1.getUpper_att();
	  String making=mult1.getMaking();
	  String waxing=mult1.getWaxing();
	  String thermoform=mult1.getThermoform();
	  String name_cat=mult1.getName_cat();
	  String hand_tooling=mult1.getHand_tooling();
	  %>


<div class="row">
<label class="col-md-3 control-label">No of Upper Aligner</label>  
<div class="col-md-3 inputGroupContainer">
<div class="input-group">	
<label><input type="text"  class="form-control" id="upper_aligner_from"	name="upper_aligner_from"  placeholder="From"  value="<%=mult1.getUpper_aligner_from() %>" readonly></label>
</div>
</div>
<div class="col-md-3 inputGroupContainer">
<div class="input-group">
<label><input type="text"   class="form-control" id="upper_aligner_to"	name="upper_aligner_to" value="<%=mult1.getUpper_aligner_to() %>" readonly></label>
</div>
</div>


<div class="col-md-1">
		<label>Att </label> 
</div>
 <div class="col-md-1">
   <%if(upper_att!=null){  %>
		<input type="checkbox" checked name="upper_att" id="lower_att"  title="Upper Attachment" value="1" style="pointer-events: none;">
		<%}else{ %>
		  		<input type="checkbox" name="upper_att" id="lower_att"  title="Upper Attachment" style="pointer-events: none;">
		
		<%}%>
</div>

</div>

<div class="row">
<label class="col-md-3 control-label">No of Lower Aligner</label>  
<div class="col-md-3 ">
<div class="input-group">	
<label><input type="text"   class="form-control" id="lower_aligner_from" name="lower_aligner_from" value="<%=mult1.getLower_aligner_from() %>"  readonly></label>
</div>
</div>
<div class="col-md-3 ">
<div class="input-group">
<label><input  type="text"   class="form-control" id="lower_aligner_to" name="lower_aligner_to" value="<%=mult1.getLower_aligner_to()%>" readonly></label>
</div>
</div>

<div class="col-md-1">
		<label>Att </label> 
</div>

 <div class="col-md-1">
 <% if(Lower_att!=null) { %>
		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" checked value="1" style="pointer-events: none;">
		<%}else{ %>
		  		<input type="checkbox" name="lower_att" id="lower_att"  title="Lower Attachment" style="pointer-events: none;">
		<%}%>
</div>

</div>
</fieldset>

<% } %>
    
    <% } %>

<!-- ////////////// -->

<!-- <div class="row">
  <label class="col-md-3 control-label">Receipt date</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="date" class="form-control" name="Receiptdate" id ="Receiptdate" style="width:501px;"></label>
        </div>
  </div>
</div> -->

	<div class="container">
	<h2></h2>
	<div class="panel panel-default">
		<div class="panel-heading"><i class="fa fa-address-card-o" style="font-size:20px;"></i>
		  Delivery Address Details</div>
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
			      <th scope="col" title="Batch Address">BA</th>			      
    			</tr>
						</thead>
						<tbody>
		
		<%
		for(AddresshandlerVO add : addresslist){
			
			if(add.getDefault_betch()==null || add.getDefault_betch().equals("")){%>
		
			<tr>
							<td colspan="7" align="center" >
						<center>
							  <div class="alert alert-danger" style="width:98%;margin-top:15px;" >
						         <div class="row" style="margin-top:-10px;margin-bottom:-20px;">
						          <i class="fa fa-warning" style="font-size:15px"></i>
						             <b> <blink>No Batch Address found!</blink></b>
						             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">�</button>
						        </div>
						    </div>
						    </center>
							</td>
							</tr>
			<%}else{
				if(add.getDefault_betch().equals("1")){
			
		
		%>
		<tr>
								<td valign="middle">
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Home  </label>
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<textarea class="form-control" name="address1"   readonly id="address1" rows="1" placeholder="Enter Address"  title="<%=add.getAddress1() %>"> <%=add.getAddress1() %></textarea>
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="pincode1" id="pincode1" aria-describedby="pincode1"  minlength="6" maxlength="6" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode" value="<%=add.getPincode1()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="phone1" id="phone1" aria-describedby="phone1" minlength="10" maxlength="10" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone1()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">							 
								  <select class="form-control"  readonly aria-label="Default select example" name="city1" id="city1">
														<option selected  value="<%=add.getCity1()%>"><%=add.getCity1()%></option>
												</select>
												</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location1" id="location1" aria-describedby="location1" maxlength="100" placeholder="Enter Location"  value="<%=add.getLocation1()%>"> </div>
								</td>
								
								
								
								<td valign="middle">
									<div class="form-check text-center">
									<%if(add.getDefault_betch().equals("1")){ %>
									
									 <input class="form-check-input" type="checkbox"  onclick="return false;" checked id="batch1"  name="batch1" value="1"  style="width:36px;height:36px;">
										<%}else{ %>
												<input class="form-check-input" type="checkbox" id="batch1"  onclick="return false;"  name="batch1" value="1"  style="width:36px;height:36px;">
										<%} %>
										
									</div>
								</td>
							</tr>
							<%}
							
								if(add.getDefault_betch().equals("2")){ %>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Clinic  </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address2"   readonly id="address2" rows="1" placeholder="Enter Address"  title="<%=add.getAddress2() %>"> <%=add.getAddress2() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="pincode2" id="pincode2" aria-describedby="pincode2"   minlength="6" maxlength="6"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode"  value="<%=add.getPincode2()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone2"  readonly id="phone2" aria-describedby="phone2"  minlength="10" maxlength="10" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone"  value="<%=add.getPhone2()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										  <select class="form-control"  readonly form-control="Default select example" name="city2" id="city2">
													  
													   
												   	    <option selected value="<%=add.getCity2() %>"><%=add.getCity2() %></option>
												   	   
												</select>
										 </div>
								 
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location2" id="location2" aria-describedby="location2"  maxlength="100"  placeholder="Enter Location" value="<%=add.getLocation2()%>"> </div>
								</td>
						
								<td valign="middle">
									<div class="form-check text-center">
									<%if(add.getDefault_betch().equals("2")) {%>
										<input class="form-check-input" type="checkbox"  onclick="return false;" checked id="batch2"  name="batch2" value="2"  style="width:36px;height:36px;">
										<%}else{ %>
										<input class="form-check-input" type="checkbox"  onclick="return false;" id="batch2"  name="batch2" value="2"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>							
								</tr>
								<%}
							
								if(add.getDefault_betch().equals("3")){ %>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other1 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address3"   readonly id="address3"  rows="1" placeholder="Enter Address"  title="<%=add.getAddress3() %>"><%=add.getAddress3() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode3"  readonly id="pincode3" aria-describedby="pincode3"   minlength="6" maxlength="6" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"placeholder="Enter Pincode"  value="<%=add.getPincode3()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone3" id="phone3"  readonly aria-describedby="phone3"  minlength="10" maxlength="10" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone"  value="<%=add.getPhone3()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										 <select class="form-control" aria-label="Default select example"  readonly name="city3" id="city3">
													  
												   	    	<option selected value="<%=add.getCity3() %>"><%=add.getCity3() %></option>
												</select>
										 </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location3" id="location3"  readonly aria-describedby="location3"  maxlength="100" placeholder="Enter Location" value="<%=add.getLocation3()%>"> </div>
								</td>
								
								
							
								<td valign="middle">
									<div class="form-check text-center">
									<%
								if(add.getDefault_betch().equals("3")){ %>
										  <input class="form-check-input" type="checkbox"   onclick="return false;" checked id="batch3" name="batch3" onclick="BatchSelectOne(this.id);" value="3" style="width:36px;height:36px;">
										<%}else{ %>
										<input class="form-check-input" type="checkbox" id="batch3" name="batch3"  onclick="return false;"  value="3" style="width:36px;height:36px;">
										<%} %>
									</div>
								</td>
							</tr>
							<%}
							
								if(add.getDefault_betch().equals("4")){ %>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Other2 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address4"  id="address4"  rows="1"  readonly placeholder="Enter Address"  title="<%=add.getAddress4() %>"><%=add.getAddress4() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode4" id="pincode4"  readonly aria-describedby="pincode4" minlength="6" maxlength="8"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"  placeholder="Enter Pincode"  value="<%=add.getPincode4()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone4" id="phone4"  readonly aria-describedby="phone4"  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone4()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
									              	 <select class="form-control"  readonly aria-label="Default select example" name="city4" id="city4">
												   	    	<option selected value="<%=add.getCity4()%>"><%=add.getCity4()%></option>
												</select>
									              	</div>
						
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location4" id="location4" aria-describedby="location4"  maxlength="100" placeholder="Enter Location" value="<%=add.getLocation4() %>"> </div>
								</td>
							
								<td valign="middle">
									<div class="form-check text-center">
								<%if(add.getDefault_betch().equals("4")){ %>
										 <input class="form-check-input" type="checkbox"   onclick="return false;" checked id="batch4" name="batch4"  value="4"  style="width:36px;height:36px;">
										<%}else{ %>
										<input class="form-check-input" type="checkbox" id="batch4" name="batch4"  onclick="return false;"  value="4"  style="width:36px;height:36px;">
																			
											<%}%>
																			
										
									</div>
								</td>
							</tr>
							<%}
							
								if(add.getDefault_betch().equals("5")){ %>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other3 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address5"  id="address5" rows="1" placeholder="Enter Address"  readonly  title="<%=add.getAddress5() %>"><%=add.getAddress5() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode5" id="pincode5" aria-describedby="pincode5"  readonly minlength="6" maxlength="8"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode"  value="<%=add.getPincode5()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  name="phone5" id="phone5" aria-describedby="phone5"  readonly  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone5()%>"> </div>
								</td>
								<td valign="middle">
								
										<select class="form-control" aria-label="Default select example"  readonly name="city5" id="city5">
				   	    				<option  value="<%=add.getCity5()%>"><%=add.getCity5()%></option>
										</select>
				
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location5" id="location5"  readonly aria-describedby="location5"  maxlength="100" placeholder="Enter Location" value="<%=add.getCity5()%>"> </div>
								</td>
								
								<td valign="middle">
									<div class="form-check text-center">
										<%if(add.getDefault_betch().equals("5")){ %>
										<input class="form-check-input" type="checkbox" id="batch5" checked name="batch5"  onclick="return false;"  value="5"  style="width:36px;height:36px;">
										<%}else{ %>
										<input class="form-check-input" type="checkbox" id="batch5"  name="batch5"   onclick="return false;"  value="5"  style="width:36px;height:36px;">
										<%}%>
									</div>
								</td>
							
							</tr>
													
							<%}}}%>
							</tbody>
					</table>
			</div>
		</div>
	</div>
</div>

<div class="row">
<label class="col-md-3 control-label">Tracking ID</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label><input type="text"  class="form-control" name="tracking_id" id ="tracking_id"  placeholder="Tracking ID" style="width:501px;"></label>
        </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Delivery Note No.</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
 <label><input type="text" required class="form-control" name="delivery_nn" id ="delivery_nn"  placeholder="Delivery note no" style="width:501px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" minlength="1" maxlength="10"></label>
        </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Mode of Dispatch</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label>
  	  <select required class="custom-select" name="modeofdispatch" id="modeofdispatch" style="width:501px;height: 34px;" >
				   	    	<option value="Byhand">By hand </option>
				   	    	<option selected value="Courier"> Courier</option>
				   	    	<option value="V-fast"> WeFast</option>
				   	    	<option value="DTDC"> DTDC</option>
					  	</select>
  </label>
        </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Decision</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">
  	
  <label>
  <select class="custom-select" name="decesion" id="decesion" style="width:501px;height: 34px;">
           		 		<% List<String> Dispatch=(ArrayList<String>)session.getAttribute("DispatchedDecesion");
				   	    for(String patch:Dispatch) {%>
				   	    	<option value="<%=patch%>"><%=patch%></option>
				   	    <%}%> 
					  	</select>
  </label>

    </div>
  </div>

</div>
<div class="row">
  <label class="col-md-3 control-label">Remarks</label>  
  <div class="col-md-9 inputGroupContainer">
  <div class="">
  		<label>
  		<textarea class="form-control"  name="remark" id ="remarks" placeholder="Remarks"  rows="4" cols="58"></textarea>
  		</label>
    </div>
  </div>
    
</div>
<div class="row">
    <label for="special_remarks" class="col-md-3 control-label">Special Remarks</label>
    <div class="col-md-9 inputGroupContainer">
        <div class="input-group" style="padding-left:10px; padding-right:10px;">
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="62" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
        </div>
    </div>
</div>
<div class="row">
<label class="col-md-2"></label>  
	&ensp;&nbsp;<input type="checkbox" name="confirm_status" id="confirm_status" value="yes" required>&nbsp;By continuing, you agree to the above information is correct.

</div>
<br>

 <div class="row">
	<div class="text-center">
		<button type="submit" value="Save" class="btn btn-primary">Submit</button>
	</div>
</div> 

</form>
</div>
</div>   
</div>
<% } %>
   


  </div>
</div>
    </div>
            <!-- /page content -->
        </div>
    </div>

   <script type="text/javascript">
    function SaveCADUpload(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remarks').value;
        
        if(stage=='PLNCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
		 	   return false;
	    	 }
    }

    function labvalidation(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remarks').value;
        
        if(stage=='3DPCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 }
    }
    function MPTvalidation(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remark').value;
        
        if(stage=='PRECOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remark").style.borderColor = "#E34234";			
			   return false;
	    	 }
    }
    function fqcvalidation(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remarks').value;
        
        if(stage=='LABCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 }
        if(stage=='3DPCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 }
    }
    
    function dphvalidation(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remarks').value;
        var modeofdispatch=document.getElementById('modeofdispatch').value;
        var tracking_id=document.getElementById('tracking_id').value;
       

        if(stage=='PCKCOR' && remarks==''){
			   alert("Reason required");
			   document.getElementById("remarks").style.borderColor = "#E34234";			
			   return false;
	    	 }

	    if(modeofdispatch=="Byhand" && remarks==""){
           	alert("Remarks is Required!") 
			document.getElementById("remarks").style.borderColor = "#E34234";			
           	return false;
           }
	    else if(modeofdispatch=="V-fast" && remarks==""){
           	alert("Remarks is Required!") 
           	document.getElementById("remarks").style.borderColor = "#E34234";			
           //	document.getElementById('remarks').focus();
           	return false;
           }
	    if(modeofdispatch=="Courier" && tracking_id==""){
           	alert("Tracking ID  is Required!") 
           	document.getElementById("tracking_id").style.borderColor = "#E34234";			
           	//document.getElementById('tracking_id').focus();
           	return false;
           }
	    
    }
    
	</script>
	
	



</body>
</html>
