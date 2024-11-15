
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
    
<%--     <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js"></script>
       <!-- font awesome link -->
 <script src="${pageContext.request.contextPath}/JavaScript/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/JavaScript/5b8969f8ab.js"></script> --%>
  
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
</head>

<body class="nav-md">

<%
HttpSession s=request.getSession();

String n=request.getParameter("caseId");
String crm=request.getParameter("crm");
String patient_Name=request.getParameter("patient_Name");
String cdoc=request.getParameter("cdoc");
String  currentStage=request.getParameter("stage");
 List<String> userRight =LoginDAO.getRight((String)session.getAttribute("userid"));
 List<AddresshandlerVO> addresslist=(List) request.getAttribute("addresshandler2"); 

 
 %>
	    <%List<MultiFrmVo> list7=(List)request.getAttribute("dispatch");%>
        
  
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
 System.out.println("special remark");

    s = request.getSession();
    String case_id=request.getParameter("caseId");

    con = null;
    PreparedStatement pstmt = null;
    rs = null;

    String special_remark = ""; // Initialize to empty string
    boolean isRemarkNull = true;

    try {
        LoginDAO loginDAO = new LoginDAO();
        con = LoginDAO.getConnectionDetails();

        if (case_id != null && !case_id.trim().isEmpty()) {
            String query = "SELECT special_remarks FROM wisealign_workflow.cc_crm WHERE case_id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, case_id);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                special_remark = rs.getString("special_remarks");
                isRemarkNull = (special_remark == null || special_remark.trim().isEmpty());
            }
            System.out.println("special remark" + special_remark);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%> 
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
												<form  action="http://192.168.0.64:8080/Registeration/logincheckdoctor" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
													<label ><button class="btn btn-info" onclick="editipr()">Edit IPR</button>  </label>
												<div id="editipr" style="display:none;">
												<form  action="http://192.168.0.64:8080/Registeration/editservlet" method="post">			
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
							
											<label><a class="btn btn-info" href="http://192.168.0.64:8080/Registeration/Loginfetchedit?cid=<%=n%>" target="blank">Generate Sticker</a>  </label><span></span>
<!-- 											<label><a class="btn btn-info" href="http://192.168.0.64:8080/Registeration/fetchcreate.jsp">Create IPR</a>  </label><span></span>
 -->											
											<label ><button class="btn btn-info" onclick="editipr()">Edit IPR</button>  </label>
												<div id="editipr" style="display:none;">
												<form  action="http://192.168.0.64:8080/Registeration/editservlet" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
								 			<label ><button class="btn btn-info" onclick="viewipr()" >View IPR</button>  </label>
											<div id="viewipr" style="display:none;">
												<form  action="http://192.168.0.64:8080/Registeration/LoginCheck" method="post">			
														<input type="text" name="cid" required
														  pattern="[0-9]{10,10}" placeholder="Enter Case ID" class="inputStyle" value="<%= n%>">
														  <input type="text" name="pln" required
														   placeholder="Enter Plan Number" class="inputStyle">
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
												<label ><button class="btn btn-info" onclick="viewdigiplan()">View Digiplan</button>  </label>
												<div id="viewdigiplan" style="display:none;">
												<form  action="http://192.168.0.64:8080/Registeration/logincheckdoctor" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<input type="text" name="pln" required placeholder="Enter Plan Number" >
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
												<label ><button class="btn btn-info" onclick="generatetemp()">Generate Template</button>  </label>
												<div id="generatetemp" style="display:none;">
												<form  action="http://192.168.0.64:8080/Registeration/Loginfetchtemplate" method="post">			
														<input type="text" name="cid" required pattern="[0-9]{10,10}" placeholder="Enter Case ID" value="<%= n%>">
												  		<button class="btn btn-info" type="submit" >Go </button><br>
												</form>
											</div>
											
										
											
								   </div>
								   </div>
								   
								   </fieldset>
							<%} %>

  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Starter Kit Dispatch</strong> </div>

<br>
<%   

if(userRight.contains("DPH")){%>


        <div class="container" style="width:98%;">
  <div class="panel panel-info" style="border-color: #3a5e7c;">
    <div class="panel-heading" style="background-color: #3a5e7c;color: #fff;">Add Starter Kit Dispatch Scan Details</div>
    <div class="panel-body">
		<form class="form-verticle" action="DispatchedScan?query=strdispatch" method="post"  onsubmit="return validation()">
			<input  type="hidden" class="" value=<%= n%> name="case_id" id="caseId">
			<input type="hidden" class="" value=<%= cdoc%> name="doctor_name" id="doctor_name">
			<input type="hidden" class=""  value=<%= patient_Name%> name="patient_name" id="patient_name">
			<input type="hidden" class="" value=<%= crm%> name="crm" id="crm">

<%-- <div class="row">
  <label class="col-md-3 control-label">Delivery Address</label>  
  <div class="col-md-9 inputGroupContainer

    		<div class="col-lg-8"  style="padding-left:3px; padding-right:10px;margin-top:-14px">
	

					<%if(defaultadd.equals("1")){ %>
							<input type="checkbox"   checked class="form-check-input check big-checkbox" name="default_address" value="1"  onclick="return false;">Default Home Address <br>
							<br><textarea  readonly  name="address1"  class="form-control" id="address1" placeholder="Address1"  rows="4" cols="58"><%=address1%></textarea>
				
					<%} else if(defaultadd.equals("2")){%>
												<input type="checkbox"   checked class="form-check-input check big-checkbox" name="default_address" value="2"  onclick="return false;">Default Clinic Address <br>
 							<br><textarea  readonly  class="form-control" name="address2" id="address2" placeholder="Address2"  rows="4" cols="58"><%=address2%></textarea>
					<%}	else if(defaultadd.equals("3")){ %>
							<br><input type="checkbox"    checked class="form-check-input check big-checkbox" name="default_address" value="3"   onclick="return false;">Other
							<br><textarea  readonly class="form-control" name="address3" id="address3" placeholder="Address3"  rows="4" cols="58"><%=address3%></textarea>
					<%} else if(defaultadd.equals("4")){ %>
							<br><input type="checkbox"   checked  class="form-check-input check big-checkbox" name="default_address" value="4"  onclick="return false;">Default
							<br><textarea readonly class="form-control" name="address4" id="address4" placeholder="Address4"  rows="4" cols="58"><%=address4%></textarea>
					<%} else if(defaultadd.equals("5")){ %>
							<br><input type="checkbox"   checked class="form-check-input check " name="default_address" value="5"   onclick="return false;">Default
							<br><textarea readonly name="address5" id="address5" placeholder="Address5"  class="form-control" rows="4" cols="58"><%=address5%></textarea>
					<%} else{%><br>
						<div class="alert alert-success"><strong>No Default address specified!</strong>Please Request to Workflow check User.</div>
						
				<% }%>
											
					</div>
  </div>
    
</div> --%>

	<div class="container">
	<h2></h2>
	<div class="panel panel-default">
		<div class="panel-heading"><i class="fa fa-address-card-o" style="font-size:20px;"></i>
		 Starter kit Delivery Address Details</div>
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
    			</tr>
						</thead>
						<tbody>
		
		<%
		for(AddresshandlerVO add : addresslist){%>		
		
		
		
	<%if(add.getDefault_starterkit()==null || add.getDefault_starterkit()==""){%>
							<tr>
							<td colspan="7" align="center" >
							
						<center>
							  <div class="alert alert-danger" style="width:98%;margin-top:15px;" >
						         <div class="row" style="margin-top:-10px;margin-bottom:-20px;">
						          <i class="fa fa-warning" style="font-size:15px"></i>
						             <b> <blink>No Starter KIt Address found!</blink></b>
						             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						        </div>
						    </div>
						    </center>
							</td>
							</tr>
							<%}else{
		
		if(add.getDefault_starterkit().equals("1")){
		
		%>
		<tr>
								<td valign="middle">
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Home</label>
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<textarea class="form-control" name="address1"  readonly id="address1" rows="1" placeholder="Enter Address"> <%=add.getAddress1() %></textarea>
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="pincode1" id="pincode1" aria-describedby="pincode1"  minlength="6" maxlength="8" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode" value="<%=add.getPincode1()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control" readonly name="phone1" id="phone1" aria-describedby="phone1" minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone1()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">							 
								  <select class="form-control" aria-label="Default select example" readonly name="city1" id="city1">
														<option selected  value="<%=add.getCity1()%>"><%=add.getCity1()%></option>
												</select>
												</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location1" readonly id="location1" aria-describedby="location1" maxlength="100" placeholder="Enter Location"  value="<%=add.getLocation1()%>"> </div>
								</td>
								
								<td valign="middle">
									<div class="form-check text-center">
									<%if(add.getDefault_starterkit().equals("1")) {%>
 								  <input class="form-check-input starterkit"  onclick="return false;" type="checkbox"  checked id="starterkit1" name="starterkit1"   value="1"  style="width:36px;height:36px;">
									<%}else{ %>
									 	<input class="form-check-input starterkit"  onclick="return false;" type="checkbox"   id="starterkit1" name="starterkit1"   value="1"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
							</tr>
							<%}if(add.getDefault_starterkit().equals("2")){ %>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Clinic  </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address2"  readonly id="address2" rows="1" placeholder="Enter Address"> <%=add.getAddress2() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" readonly name="pincode2" id="pincode2" aria-describedby="pincode2"   minlength="6" maxlength="8"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode"  value="<%=add.getPincode2()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" readonly name="phone2" id="phone2" aria-describedby="phone2"  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone"  value="<%=add.getPhone2()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										  <select class="form-control" readonly form-control="Default select example" name="city2" id="city2">
													  
													   
												   	    <option selected value="<%=add.getCity2() %>"><%=add.getCity2() %></option>
												   	   
												</select>
										 </div>
								 
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control" readonly name="location2" id="location2" aria-describedby="location2"  maxlength="100"  placeholder="Enter Location" value="<%=add.getLocation2()%>"> </div>
								</td>
						
								<td valign="middle">
									<div class="form-check text-center">
									<%if(add.getDefault_starterkit().equals("2")) {%>
										 <input class="form-check-input starterkit"  onclick="return false;" type="checkbox"  checked id="starterkit2"  name="starterkit2"   value="2"  style="width:36px;height:36px;">
									<%}else{ %>
										 <input class="form-check-input starterkit"  onclick="return false;" type="checkbox" id="starterkit2"  name="starterkit2"   value="2"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>						
								</tr>
								<%}
							
								if(add.getDefault_starterkit().equals("3")){ %>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other1 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address3"  readonly id="address3"  rows="1" placeholder="Enter Address"><%=add.getAddress3() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="pincode3" id="pincode3" aria-describedby="pincode3"   minlength="6" maxlength="8" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"placeholder="Enter Pincode"  value="<%=add.getPincode3()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="phone3" id="phone3" aria-describedby="phone3"  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone"  value="<%=add.getPhone3()%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										 <select class="form-control"  readonly aria-label="Default select example" name="city3" id="city3">
													  
												   	    	<option selected value="<%=add.getCity3() %>"><%=add.getCity3() %></option>
												</select>
										 </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location3" id="location3" aria-describedby="location3"  maxlength="100" placeholder="Enter Location" value="<%=add.getLocation3()%>"> </div>
								</td>
							
								<td valign="middle">
									<div class="form-check text-center">
									<%							
								if(add.getDefault_starterkit().equals("3")){ %>
									 <input class="form-check-input starterkit"  onclick="return false;" type="checkbox"  checked id="starterkit3" name="starterkit3"  value="3" style="width:36px;height:36px;">
									<%}else{ %>
										<input class="form-check-input starterkit"  onclick="return false;" type="checkbox"  id="starterkit3" name="starterkit3"  value="3" style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
							</tr>
							<%}
							
								if(add.getDefault_starterkit().equals("4")){ %>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Other2 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address4"   readonly id="address4"  rows="1" placeholder="Enter Address"><%=add.getAddress4() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="pincode4" id="pincode4" aria-describedby="pincode4" minlength="6" maxlength="8"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"  placeholder="Enter Pincode"  value="<%=add.getPincode4()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="phone4" id="phone4" aria-describedby="phone4"  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone4()%>"> </div>
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
									<%if(add.getDefault_starterkit().equals("4")){ %>
									 <input class="form-check-input starterkit" type="checkbox"   onclick="return false;" checked id="starterkit4"  name="starterkit4"   value="4"  style="width:36px;height:36px;">
									<%}else{ %>
										<input class="form-check-input starterkit"  onclick="return false;" type="checkbox" id="starterkit4"  name="starterkit4"   value="4"  style="width:36px;height:36px;">
									<%}%>
									
									</div>
								</td>
							</tr>
							<%}
							
								if(add.getDefault_starterkit().equals("5")){ %>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other3 </label>
									</div>
								</td>
								<td>
									<div class="form-group">
										<textarea class="form-control" name="address5"   readonly id="address5" rows="1" placeholder="Enter Address"><%=add.getAddress5() %></textarea>
									</div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  readonly name="pincode5" id="pincode5" aria-describedby="pincode5" minlength="6" maxlength="8"  onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode"  value="<%=add.getPincode5()%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="phone5" id="phone5" aria-describedby="phone5"  minlength="10" maxlength="14" onkeyup="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Phone" value="<%=add.getPhone5()%>"> </div>
								</td>
								<td valign="middle">
								
										<select class="form-control"  readonly aria-label="Default select example" name="city5" id="city5">
				   	    				<option  value="<%=add.getCity5()%>"><%=add.getCity5()%></option>
										</select>
				
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"   readonly name="location5" id="location5" aria-describedby="location5"  maxlength="100" placeholder="Enter Location" value="<%=add.getCity5()%>"> </div>
								</td>
								
																<td valign="middle">
									<div class="form-check text-center">
									<%if(add.getDefault_starterkit().equals("5")){ %>
									 <input class="form-check-input starterkit"   onclick="return false;" checked type="checkbox" id="starterkit5" name="starterkit5"    value="5"  style="width:36px;height:36px;">
									<%}else{ %>
										<input class="form-check-input starterkit"  onclick="return false;"  type="checkbox" id="starterkit5" name="starterkit5"    value="5"  style="width:36px;height:36px;">
									
									<%} %>
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
  <label><input type="text"  class="form-control" name="tracking_id" id ="tracking_id"  placeholder="Tracking ID" style="width:495px;"></label>
        </div>
  </div>
</div>
<div class="row">
  <label class="col-md-3 control-label">Delivery Note No.</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
 <label><input type="text"  class="form-control" name="delivery_nn" id ="delivery_nn"  placeholder="Delivery note no" style="width:495px;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');" minlength="1" maxlength="10"></label>
        </div>
  </div>
</div>

<div class="row">
  <label class="col-md-3 control-label">Mode of Dispatch</label>  
  <div class="col-md-1 inputGroupContainer">
  <div class="input-group">	
  <label>
  	  <select required class="custom-select" name="modeofdispatch" id="modeofdispatch" style="width:495px;height: 34px;" >
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
  <select class="custom-select" name="decesion" id="decesion" style="width:495px;height: 34px;" required>
           		 		
                <option value="DPHSTRKIT">Starter Kit Sent</option>
                <option value="PCKSTRKITCOR">Packing Correction</option>
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
            <textarea id="special_remarks" name="special_remarks" rows="4" cols="60" style="border: 2px solid red;" class="form-control" maxlength="250" readonly "><%= special_remark %></textarea>
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
   


  </div>
</div>
    </div>
            <!-- /page content -->
        </div>
    </div>

   <script type="text/javascript">
   
   function isNumberKey(evt){
	    var charCode = (evt.which) ? evt.which : evt.keyCode
	    return !(charCode > 31 && (charCode < 48 || charCode > 57));
	}
   
    function validation(){
    	var stage = document.getElementById('decesion').value;
        var remarks = document.getElementById('remarks').value;
        var modeofdispatch=document.getElementById('modeofdispatch').value;
        var tracking_id=document.getElementById('tracking_id').value;
		var delivery_nn=document.getElementById('delivery_nn').value;
        if(stage=='PCKSTRKITCOR' && remarks==""){
         	 alert("Remarks is Required!")
         	 document.getElementById('remarks').focus();
              return false;
         }
        
        else  if(stage=='DPHSTRKIT'){
        
        	if(delivery_nn==""){
        		alert("Delivery note no Required!") 
               	document.getElementById('delivery_nn').focus();
               	return false;
        	}
        
	    if(modeofdispatch=="Byhand" && remarks==""){
           	alert("Remarks is Required!") 
           	document.getElementById('remarks').focus();
           	return false;
           }
	    else if(modeofdispatch=="V-fast" && remarks==""){
           	alert("Remarks is Required!") 
           	document.getElementById('remarks').focus();
           	return false;
           }
	    if(modeofdispatch=="Courier" && tracking_id==""){
           	alert("Tracking ID  is Required!") 
           	document.getElementById('tracking_id').focus();
           	return false;
           } 
        }
    }    

	</script>

</body>
</html>
