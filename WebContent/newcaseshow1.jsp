
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
 

<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/Images/favicon.ico">
    
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
  <title>:: WF Edit Case Details ::</title>
    <!-- Bootstrap core CSS -->
    <link href="StyleSheet/bootstrap.min1.css" rel="stylesheet">
 <link href="StyleSheet/css/font-awesome.min.css" rel="stylesheet">
         <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">
    
    	<link rel="stylesheet" href="CSS1/all.css">
        <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <!-- To take font-awesome social media icons. -->
	<link rel="stylesheet" href="StyleSheet/all.css" >
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>  
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/JavaScript/general.js"></script>
     
<script src="JavaScript/bootstrap.js"></script>
 
 <script src="JavaScript/custom.js"></script>
 <script type="text/javascript" class="init">
	
	</script> 
	


 <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>
<style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>
</head>
<body>

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
HttpSession s=request.getSession();
String case_id = (String) s.getAttribute("case_id");

String newcase = request.getParameter("page");
String clinic_name = (String) s.getAttribute("cn");
String ccaddress = (String) s.getAttribute("add");
String phone = (String) s.getAttribute("pno");
String bclinic = (String) s.getAttribute("bcn");
String badd = (String) s.getAttribute("badd");
String case_type = (String) s.getAttribute("case_type");  
String scan = (String) s.getAttribute("scan"); 
String location = (String) s.getAttribute("location"); 
String city = (String) s.getAttribute("city"); 
String r_Doctor = (String) s.getAttribute("r_Doctor"); 
String crm = (String) s.getAttribute("crm"); 



String photograph = (String) s.getAttribute("p_graph");  
String starter_kit = (String) s.getAttribute("starter_kit"); 
String type_request = (String) s.getAttribute("type_request"); 
String s_shown = (String) s.getAttribute("s_shown"); 

String ppf_fill = (String) s.getAttribute("ppf_fill"); 
String t_account = (String) s.getAttribute("t_account"); 
String corporate_account = (String) s.getAttribute("corporate_account"); 
String kol = (String) s.getAttribute("kol"); 

String c_pkg = (String) s.getAttribute("c_pkg"); 
String pkg_name = (String) s.getAttribute("pkg_name"); 
String dispatch_crpt = (String) s.getAttribute("dispatch_crpt"); 
String dispatch_address = (String) s.getAttribute("dispatch_address");
String bill_address = (String) s.getAttribute("bill_address"); 
String c_doctor = (String) s.getAttribute("c_doctor"); 
String case_stage = (String) s.getAttribute("case_stage");
 
String delivery_note_no = (String) s.getAttribute("delivery_note_no"); 
String bgst_no = (String) s.getAttribute("bgst_no"); 
String category = (String) s.getAttribute("category");  
String upper_aligner = (String) s.getAttribute("upper_aligner");  
String lower_aligner = (String) s.getAttribute("lower_aligner");  
String others = (String) s.getAttribute("others"); 

String Patient_Name = (String) s.getAttribute("Patient_Name"); 
String priority = (String) s.getAttribute("priority");
String remarks = (String) s.getAttribute("remarks");
String total_amount = (String) s.getAttribute("total_amount");
String payment_processing = (String) s.getAttribute("payment_processing");
String payment_mode = (String) s.getAttribute("payment_mode");

String address1 = (String) s.getAttribute("address1");
String address2 = (String) s.getAttribute("address2");
String address3 = (String) s.getAttribute("address3");
String address4 = (String) s.getAttribute("address4");
String address5 = (String) s.getAttribute("address5");

String pincode1 = (String) s.getAttribute("pincode1");
String pincode2 = (String) s.getAttribute("pincode2");
String pincode3 = (String) s.getAttribute("pincode3");
String pincode4 = (String) s.getAttribute("pincode4");
String pincode5 = (String) s.getAttribute("pincode5");

String city1 = (String) s.getAttribute("city1");
String city2 = (String) s.getAttribute("city2");
String city3 = (String) s.getAttribute("city3");
String city4 = (String) s.getAttribute("city4");
String city5 = (String) s.getAttribute("city5");

String phone1 = (String) s.getAttribute("phone1");
String phone2 = (String) s.getAttribute("phone2");
String phone3 = (String) s.getAttribute("phone3");
String phone4 = (String) s.getAttribute("phone4");
String phone5 = (String) s.getAttribute("phone5");

String location1 = (String) s.getAttribute("location1");
String location2 = (String) s.getAttribute("location2");
String location3 = (String) s.getAttribute("location3");
String location4 = (String) s.getAttribute("location4");
String location5 = (String) s.getAttribute("location5");

String default_address = (String) s.getAttribute("default_address");
String default_starterkit = (String) s.getAttribute("default_starterkit");

List<String> Crmlist1=(ArrayList<String>)session.getAttribute("CRMLlist");
List<String> CityList1=(ArrayList<String>)session.getAttribute("citylist");


if(address1==null){
	address1="";
}
else{
	address1 = (String) s.getAttribute("address1"); 
}
if(address2==null){
	address2="";
}
else{
	address2 = (String) s.getAttribute("address2"); 
}
if(address3==null){
	address3="";
}
else{
	address3 = (String) s.getAttribute("address3"); 
}
if(address4==null){
	address4="";
}
else{
	address4 = (String) s.getAttribute("address4"); 
}
if(address5==null){
	address5="";
}
else{
	address5 = (String) s.getAttribute("address5"); 
}
if(pincode1==null){
	pincode1="";
}
else{
	pincode1 = (String) s.getAttribute("pincode1");
}
if(pincode2==null){
	pincode2="";
}
else{
	pincode2 = (String) s.getAttribute("pincode2");
}
if(pincode3==null){
	pincode3="";
}
else{
	pincode3 = (String) s.getAttribute("pincode3");
}

if(pincode4==null){
	pincode4="";
}
else{
	pincode4 = (String) s.getAttribute("pincode4");
}

if(pincode5==null){
	pincode5="";
}
else{
	pincode5 = (String) s.getAttribute("pincode5");
}

if(city1==null){
	city1="";
}
else{
	city1 = (String) s.getAttribute("city1");
}
if(city2==null){
	city2="";
}
else{
	city2 = (String) s.getAttribute("city2");
}
if(city3==null){
	city3="";
}
else{
	city3 = (String) s.getAttribute("city3");
}
if(city4==null){
	city4="";
}
else{
	city4 = (String) s.getAttribute("city4");
}
if(city5==null){
	city5="";
}
else{
	city5 = (String) s.getAttribute("city5");
}
if(phone1==null){
	phone1="";
}
else{
phone1 = (String) s.getAttribute("phone1");
}
if(phone2==null){
	phone2="";
}
else{
phone2 = (String) s.getAttribute("phone2");
}
if(phone3==null){
	phone3="";
}
else{
phone3 = (String) s.getAttribute("phone3");
}
if(phone4==null){
	phone4="";
}
else{
phone4= (String) s.getAttribute("phone4");
}
if(phone5==null){
	phone5="";
}
else{
phone5 = (String) s.getAttribute("phone5");
}
if(location1==null){
	location1="";
}
else{
location1 = (String) s.getAttribute("location1");
}
if(location2==null){
	location2="";
}
else{
location2 = (String) s.getAttribute("location2");
}
if(location3==null){
	location3="";
}
else{
location3 = (String) s.getAttribute("location3");
}
if(location4==null){
	location4="";
}
else{
location4 = (String) s.getAttribute("location4");
}
if(location5==null){
	location5="";
}
else{
location5 = (String) s.getAttribute("location5");
}
if(crm==null){

	crm="";
}
else{
	crm = (String) s.getAttribute("crm"); 
}


if(payment_mode==null){

	payment_mode="";
}
else{
	payment_mode = (String) s.getAttribute("payment_mode");
}

if(payment_processing==null){

	payment_processing="";
}
else{
	payment_processing = (String) s.getAttribute("payment_processing");
}
if(total_amount==null){

	total_amount="";
}
else{
	total_amount = (String) s.getAttribute("total_amount");
}
if(bill_address==null){

	bill_address="";
}
else{
	bill_address = (String) s.getAttribute("bill_address"); 
}
if(dispatch_address==null){

	dispatch_address="";
}
else{
	dispatch_address = (String) s.getAttribute("dispatch_address");
}
String remark="";
if(remarks==null){

	 remarks="";
}
else{
	remarks = (String) s.getAttribute("remarks");
}
if(scan==null){

	scan="";
}
if(location==null){

	location="";
}
else{
	location = (String) s.getAttribute("location"); 
}
if(city==null){

	city="";
}
else
{
	city = (String) s.getAttribute("city"); 
	}
if(r_Doctor==null){

	r_Doctor="";
}
else
{
	r_Doctor = (String) s.getAttribute("r_Doctor"); 
	}
if(c_doctor==null){

	c_doctor="";
}
else{
	c_doctor = (String) s.getAttribute("c_doctor"); 
}
if(Patient_Name==null){

	Patient_Name="";
}
else{
	Patient_Name = (String) s.getAttribute("Patient_Name"); 
}
if(clinic_name==null){

	clinic_name="";
}
else{
	 clinic_name = (String) s.getAttribute("cn");
}
if(s_shown==null){

	s_shown="";
}
else{
	s_shown = (String) s.getAttribute("s_shown"); 
}
if(starter_kit==null){

	starter_kit="";
}
else{
	starter_kit = (String) s.getAttribute("starter_kit"); 
}
if(ppf_fill==null){

	ppf_fill="";
}
else{
	ppf_fill = (String) s.getAttribute("ppf_fill"); 
}
if(photograph==null){

	photograph="";
}
else{
	photograph = (String) s.getAttribute("p_graph");
}

String delimiters = "\\#";
String[] address={""};
String[] phoneNumbers={""};
String[] clinicNames={""};
String[] buyerClinicNames={""};
String[] buyerAddress={""};
if(ccaddress!=null){
	 address = ccaddress.split(delimiters); //if ccaddress is empty will still return one entry i.e ""
}
if(phone!=null){
	 phoneNumbers=phone.split(delimiters);
}
if(clinic_name!=null){
	clinicNames=clinic_name.split(delimiters);
}
if(bclinic!=null){
	buyerClinicNames=bclinic.split(delimiters);
}
if(badd!=null){
	buyerAddress=badd.split(delimiters);
}
%>
				<% 
				     Connection cono = null;
					 PreparedStatement pstmt0 = null;
				     ResultSet rs0=null;
				     String type_request1="";
				    // String city1="";
				     String crm1="";
				     String t_account1="";
				     String corporate_account1="";
				     String kol1="";
				     String c_pkg1="";
				     String dispatch_crpt1="";
				     String priority1="";
				     String payment_mode1="";
				     try {
							LoginDAO loginDAO = new LoginDAO();
							con = LoginDAO.getConnectionDetails();
							
							pstmt0 = con.prepareStatement("select * from cc_crm  where case_id=?");
							pstmt0.setString(1, case_id);
							rs0 = pstmt0.executeQuery();
							if(rs0.next()){
								type_request1=rs0.getString("type_request");
							//	city1=rs0.getString("city");
								/* city2=rs0.getString("city2");
								city3=rs0.getString("citY3");
								city4=rs0.getString("city4");
								city5=rs0.getString("city5");
								crm1=rs0.getString("crm_name"); */
								t_account1=rs0.getString("t_account");
								corporate_account1=rs0.getString("corporate_account");
								kol1=rs0.getString("kol");
								c_pkg1=rs0.getString("c_pkg");
								dispatch_crpt1=rs0.getString("dispatch_crpt");
								priority1=rs0.getString("priority");
								payment_mode1=rs0.getString("payment_mode");
								String case_stage1=rs0.getString("case_stage");
							}
				    

				     } catch (Exception e) {
				    						e.printStackTrace();
				    						} finally {
				    						if (rs != null) {try {rs.close();rs = null;} catch (SQLException ex) {ex.printStackTrace();}}
				    						if (ps != null) {try {ps.close();ps = null;} catch (SQLException ex) {ex.printStackTrace();}}
				    						if (con != null) {try {con.close();con = null;} catch (SQLException ex) {ex.printStackTrace();}}
				    						}
				    			
				     
					    int len1= address.length;
						 int count1;

					%>
<div class="row">
<div class="col-sm-3">
									<label">Case Id : </label><span> <%= case_id%></span>
								</div>
								<div class="col-sm-3">
									<label> Patient Name : </label> <span><%= Patient_Name%></span>
								</div>
								<div class="col-sm-3">
									<label>Registered Doctor :  </label><span><%= r_Doctor%></span>
								</div>
								<div class="col-sm-3">
									<label> CRM : </label> <span><%= crm%> </span>

								</div>	
								
								</div>
								<div class="row">
											<div class="col-sm-3">
									<label ><a class="btn btn-success" href="Approval?caseId=<%= case_id%>&NxtStage=null&crm=<%= crm%>&cdoc=<%= r_Doctor%>&patient_Name=<%= Patient_Name%> ">Fetch Data </a>  </label>
								</div>
								<div class="col-sm-3">
									<label ><a class="btn btn-success" href="DragDropImages?caseId=<%= case_id%>&doctorname=<%= r_Doctor%>&patient_Name=<%= Patient_Name%>&clinicname=<%= clinic_name%>">Add Photo</a>  </label>
								</div>
								<div class="col-sm-3">
									<label ><a class="btn btn-success" href="DispImageGrid?caseId=<%= case_id%>">View Photo</a>  </label>
								</div>
								
								</div>
  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Edit Case Details</strong> </div>
    <div class="table-responsive">
		<div style="display: none;">
		<input type="text" id="LinkType" name="LinkType"/>
		<input type="text" id="hiddenTopQueryNo" name="hiddenTopQueryNo"/>
		<input type="text" id="hiddenLastQueryNo" name="hiddenLastQueryNo"/>
		<input type="text" id="hiddenInvId" name="hiddenInvId"/>
		</div>
		
		
		
 
 
 
 

<div class="col-lg-12">
      <div class="table-responsive">


<body class="nav-md" >
<% List<String> getRight=(ArrayList<String>)session.getAttribute("getRight");%>

	<form action="EditCaseDetails" method="post" onsubmit="return validate_form();">

		<div class="container" style=" overflow: hidden;">
			<div class="row" style=" height:40px;margin-top:30px; ">
			
				<div class="col-lg-12 header-styles" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>CC Details</h3>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:30px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Case ID" class="form-label">Case ID</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="case_id" id="Case_Id" required placeholder="Case ID"  class="form-control"  minlength="10" maxlength="10" value="<%=case_id%>"  autofocus oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
	
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for=" Scan/Impression" class="form-label">Scan/Impression </label>
				</div>
				<div class="col-lg-3" >
				<div class="form-check">
			<% if(scan.equalsIgnoreCase("Scan")){ %>
				<input type="radio" class="form-check-input" name="scan"  value="Scan"  id="Scan"  checked> Scan
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="scan" id="Impression"  value="Impression" > Impression
			<%}else if(scan.equalsIgnoreCase("Impression")){  %>
			<input type="radio" class="form-check-input" name="scan"  value="Scan"  id="Scan"  > Scan
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="scan" id="Impression"  value="Impression" checked> Impression
			<%}else{ %>
				
				<input type="radio" class="form-check-input" name="scan"  value="Scan"  id="Scan"  checked> Scan
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="scan" id="Impression"  value="Impression" > Impression
				<%} %>
				</div>
				</div>
				<div class="col-lg-4" ></div>
			    </div>
			  
			   	<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					 <label for=" Clinic" class="form-label"> Clinic Name</label>
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew3" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="ClinicNameDiv" style="padding-left:10px; padding-right:10px;">
					
						<%
					for(int i=0;i<clinicNames.length;i++){
						int count=i+1;
						String name="cni"+count;
						
				%>
				
				
					<input type="text"  class="form-control" name="cni<%=i%>" id="cni<%=i%>"  placeholder="Enter Clinic Name" value="<%=clinicNames[i]%>">
			
			<br>	<%} %>
				</div>
				<div class="col-lg-2" ></div>
			</div>
						<div class="container">
	<h2></h2>
	<div class="panel panel-default">
		<div class="panel-heading"><i class="fa fa-address-card-o" style="font-size:20px;"></i>
		 Address Details</div>
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
			      <th scope="col" title="Starter kit Address">SKA</th>			      
			      <th scope="col" title="Batch Address"> BA</th>			      
    			</tr>
						</thead>
						<tbody>
		
							<tr>
								<td valign="middle">
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Home</label>
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
									<%
									
							
										if(!address1.equals("") || address1!=null){%>
												<textarea class="form-control tooltiptext" name="address1"  id="address1" rows="1" placeholder="Enter Address" data-toggle="tooltip" data-placement="top" title="<%=address1%>" > <%=address1%></textarea>
										<%}else{
									
											if(len1==0){
											for(count1=0;count1<=0;count1++){		
							
										if(count1==0){

										%>
											<textarea class="form-control" name="address1"  id="address1" rows="1" placeholder="Enter Address" data-toggle="tooltip" data-placement="top" title="<%=address[count1]%>"><%=address[count1]%> </textarea>
										<% }else{ %>
											<textarea class="form-control" name="address1"  id="address1" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" > </textarea>

									<% } } }%>
											<textarea class="form-control" name="address1"  id="address1" rows="1" placeholder="Enter Address" data-toggle="tooltip" data-placement="top" > </textarea>
									<%}%>
									
									
									</div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="pincode1" id="pincode1" aria-describedby="pincode1"  minlength="6" maxlength="8"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" placeholder="Enter Pincode" value="<%=pincode1%>"></div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control" name="phone1" id="phone1" aria-describedby="phone1" placeholder="Enter Phone"  minlength="10" maxlength="10" oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%=phone1%>">  </div>
								</td>
								<td valign="middle">
									<div class="form-group">
<!-- 										<input type="text" class="form-control"  name="city1" id="city1" aria-describedby="city1" placeholder="Enter City"> 
 -->							 
								  <select class="form-control" aria-label="Default select example" name="city1" id="city1">
								 <option value="">Select City</option>
								
									<% for(String corpAcnt:CityList1) {
												   	   if(!city1.equals("") && city1.equals(corpAcnt)){
												   		   
												   	   %>
												   	   		<option selected value="<%=city1 %>"><%=city1 %></option>
												   	   <%}else{ %>
												   	   												   	  
												   	   
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%} }%>
												</select>
												</div>
								 				</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location1" id="location1" aria-describedby="location1" placeholder="Enter Location"  maxlength="100" value="<%=location1%>"> </div>
								</td>
								
								
										<td valign="middle">
									<div class="form-check text-center">
									<%
									if(default_starterkit==null || default_starterkit.equals("") ){ %>
								 	<input class="form-check-input strb_default" type="checkbox"  id="starterkit1" name="starterkit1"   value="1"  style="width:36px;height:36px;">								
									<%}else if(default_starterkit.equals("1")){%>
 								  <input class="form-check-input strb_default" checked type="checkbox"  id="starterkit1" name="starterkit1"   value="1"  style="width:36px;height:36px;">
								<%}else{ %>
								 	<input class="form-check-input strb_default" type="checkbox"  id="starterkit1" name="starterkit1"   value="1"  style="width:36px;height:36px;">								
									<%} %>
									</div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
<!-- 										<button type="button" class="btn btn-success" id="starterkit1" name="starterkit1" value="1">Batch</button>
 -->										<%if(default_address==null || default_address.equals("") ){ %>
	 									 <input class="form-check-input strb_default" type="checkbox" id="batch1" name="batch1" value="1"  style="width:36px;height:36px;">
	
									<%}else if(default_address.equals("1")){
									%>
 									 <input class="form-check-input strb_default" checked type="checkbox" id="batch1" name="batch1" value="1"  style="width:36px;height:36px;">
									<%}else{ %>
 									 <input class="form-check-input strb_default" type="checkbox" id="batch1" name="batch1" value="1"  style="width:36px;height:36px;">
									<%} %>
										
									</div>
								</td>
					
							</tr>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Clinic</label>
									</div>
								</td>
							 <td>
									<div class="form-group">
									<%							
										if(!address2.equals("") || address2!=null){%>
										
										<textarea class="form-control" name="address2"  id="address2" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address2%>" ><%= address2%></textarea>
										
										<%}else{
									
											if(len1==1){
									for(count1=1;count1<=1;count1++){		
							
										if(count1==1){

										%>
											<textarea class="form-control" name="address2"  id="address2" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address[count1]%>" ><%=address[count1]%></textarea>
										<% }else{ %>
										<textarea class="form-control" name="address2"  id="address2" rows="1" placeholder="Enter Address"></textarea>

									<% } } }%>
										<textarea class="form-control" name="address2"  id="address2" rows="1" placeholder="Enter Address"></textarea>
											<%}%>							
									</div>
								</td> 
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode2" id="pincode2" aria-describedby="pincode2" placeholder="Enter Pincode" minlength="6" maxlength="8"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= pincode2%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone2" id="phone2" aria-describedby="phone2" placeholder="Enter Phone"  minlength="10" maxlength="10" oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= phone2%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<!-- <input type="text" class="form-control"  name="city2" id="city2" aria-describedby="city2" placeholder="Enter City">
										 -->
										  <select class="form-control"  name="city2" id="city2">
										   <option value="">Select City</option>
													 <% for(String corpAcnt:CityList1) {
												   	   if(!city2.equals("") && city2.equals(corpAcnt)){
												   		   
												   	   %>
												   	   		<option selected value="<%=city2%>"><%=city2 %></option>
												   	   <%}else{ %>												   	  
												   	   
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%} }%>
												</select>
										 </div>
								 
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location2" id="location2" aria-describedby="location2" placeholder="Enter Location"  maxlength="100"  value="<%= location2%>"> </div>
								</td>
								
								
									<td valign="middle">
									<div class="form-check text-center">
											<%if(default_starterkit==null || default_starterkit.equals("") ){ %>
									 <input class="form-check-input strb_default" type="checkbox" id="starterkit2"  name="starterkit2"  value="2"  style="width:36px;height:36px;">
									
									<%}else if(default_starterkit.equals("2")){%>
									 <input class="form-check-input strb_default" checked type="checkbox" id="starterkit2"  name="starterkit2"  value="2"  style="width:36px;height:36px;">
									<%}else{ %>
									 <input class="form-check-input strb_default" type="checkbox" id="starterkit2"  name="starterkit2"  value="2"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
									<%if(default_address==null || default_address.equals("") ){ %>
										<input class="form-check-input strb_default" type="checkbox" id="batch2" name="batch2" value="2"  style="width:36px;height:36px;">
										<% }else if(default_address.equals("2")){%>								
										<input class="form-check-input strb_default" checked type="checkbox" id="batch2" name="batch2" value="2"  style="width:36px;height:36px;">
										<%}else{ %>
										<input class="form-check-input strb_default" type="checkbox" id="batch2" name="batch2" value="2"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>	
								
								</tr>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other1 </label>
									</div>
								</td>
								 <td>
								<%	if(!address3.equals("") || address3!=null){%>
										
										<textarea class="form-control" name="address3"  id="address3"  rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address3%>"><%= address3%></textarea>
										
										<%}else{
									
											if(len1==2){
									for(count1=2;count1<=2;count1++){		
							
										if(count1==2){

										%>
											<textarea class="form-control" name="address3"  id="address3" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address[count1]%>" ><%=address[count1]%></textarea>
										<% }else{ %>
											<textarea class="form-control" name="address3"  id="address3" rows="1" placeholder="Enter Address"> </textarea>

									<% } } }%>
										<textarea class="form-control" name="address3"  id="address3" rows="1" placeholder="Enter Address"> </textarea>
									<%}%>
									</td>
								
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode3" id="pincode3" aria-describedby="pincode3" placeholder="Enter Pincode" minlength="6" maxlength="8"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= pincode3%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone3" id="phone3" aria-describedby="phone3" placeholder="Enter Phone"  minlength="10" maxlength="10" oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"  value="<%= phone3%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
										<!-- <input type="text" class="form-control"  name="city3" id="city3" aria-describedby="city3" placeholder="Enter City"> -->
										 <select class="form-control" aria-label="Default select example" name="city3" id="city3">
													<option value="">Select City</option>
													<% for(String corpAcnt:CityList1) {
												   	   if(!city3.equals("") && city3.equals(corpAcnt)){
												   		   
												   	   %>
												   	   		<option selected value="<%=city3 %>"><%=city3%></option>
												   	   <%}else{ %>
												   	   												   	   
												   	   
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%} }%>
												</select>
										 </div>
								</td>
								<td valign="middle">
									<div class="form-group">
									
										<input type="text" class="form-control"  name="location3" id="location3" aria-describedby="location3" placeholder="Enter Location"  maxlength="100" value="<%= location3%>"> </div>
								
								</td>
						
								
								<td valign="middle">
									<div class="form-check text-center">
										<%if(default_starterkit==null || default_starterkit.equals("") ){ %>
											<input class="form-check-input strb_default" type="checkbox"  id="starterkit3" name="starterkit3" value="3" style="width:36px;height:36px;">
										<%}else if(default_starterkit.equals("3")){%>
									 		<input class="form-check-input strb_default" checked type="checkbox"  id="starterkit3" name="starterkit3" value="3" style="width:36px;height:36px;">
										<%}else{ %>
									 <input class="form-check-input strb_default" type="checkbox"  id="starterkit3" name="starterkit3" value="3" style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
									<%if(default_address==null || default_address.equals("") ){ %>
									<input class="form-check-input strb_default" type="checkbox" id="batch3" name="batch3" value="3" style="width:36px;height:36px;">
									<%}else if(default_address.equals("3")){%>
										  <input class="form-check-input strb_default" checked type="checkbox" id="batch3" name="batch3" value="3" style="width:36px;height:36px;">
									<%}else{ %>
									<input class="form-check-input strb_default" type="checkbox" id="batch3" name="batch3" value="3" style="width:36px;height:36px;">
										<%} %>
									</div>
								</td>
				
							</tr>
							<tr>
								<td>
									<div class="form-check">
										<label class="form-check-label" for="flexCheckDefault"> Other2 </label>
									</div>
								</td>
									
								<td>
								<%
								
										if(!address4.equals("") || address4!=null){ %>
										
										<textarea class="form-control" name="address4"  id="address4"  rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address4%>" ><%= address4%></textarea>
										
										<%}else{
											if(len1==3){
																					
										for(count1=3;count1<=3;count1++){		
							
										if(count1==3){
										%>
											<textarea class="form-control" name="address4"  id="address4" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address[count1]%>" ><%=address[count1]%></textarea>
										<% }else{ %>
										<textarea class="form-control" name="address4"  id="address4"  rows="1" placeholder="Enter Address"></textarea>

									<% } 
										}%>
										
									<%}%>
											<textarea class="form-control" name="address4"  id="address4"  rows="1" placeholder="Enter Address"></textarea>
									<%}%>
									</td>
									
									
									<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode4" id="pincode4" aria-describedby="pincode4" placeholder="Enter Pincode" minlength="6" maxlength="8"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')"  value="<%= pincode4%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="phone4" id="phone4" aria-describedby="phone4" placeholder="Enter Phone"   minlength="10" maxlength="10" oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= phone4%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-group">
									              	<!-- <input type="text" class="form-control"  name="city4" id="city4" aria-describedby="city4" placeholder="Enter City"> --> 
									              	 <select class="form-control" aria-label="Default select example" name="city4" id="city4">
													<option  value="">Select City</option>
													  <% for(String corpAcnt:CityList1) {
												   	   if(!city4.equals("") && city4.equals(corpAcnt)){
												   		   
												   	   %>
												   	   		<option selected value="<%=city4 %>"><%=city4 %></option>
												   	   <%}else{ %>
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%} }%>
												   	    
																			</select>
									              	</div>
						
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location4" id="location4" aria-describedby="location4" placeholder="Enter Location"  maxlength="100"  value="<%= location4%>"> </div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
										<%if(default_starterkit==null || default_starterkit.equals("") ){ %>
											<input class="form-check-input strb_default" type="checkbox" id="starterkit4"  name="starterkit4"    value="4"  style="width:36px;height:36px;">
										
										<%}else if(default_starterkit.equals("4")){%>
									
									 <input class="form-check-input strb_default" checked type="checkbox" id="starterkit4"  name="starterkit4"    value="4"  style="width:36px;height:36px;">
									<%}else{ %>
									
										<input class="form-check-input strb_default" type="checkbox" id="starterkit4"  name="starterkit4"    value="4"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
									<%if(default_address==null || default_address.equals("") ){ %>
										 <input class="form-check-input strb_default" type="checkbox" id="batch4" name="batch4"  value="4"  style="width:36px;height:36px;">
									
										<%}else if(default_address.equals("4")){%>
										 <input class="form-check-input strb_default"  checked type="checkbox" id="batch4" name="batch4"  value="4"  style="width:36px;height:36px;">
										<%}else{ %>
										 <input class="form-check-input strb_default" type="checkbox" id="batch4" name="batch4"  value="4"  style="width:36px;height:36px;">
									<%}%>
										
									</div>
								</td>
					
				
								
							</tr>
							<tr>
								<td>
									<div class="form-check">
									
										<label class="form-check-label" for="flexCheckDefault"> Other3 </label>
									</div>
								</td>
								<td>
								<%
									
							
										if(!address5.equals("") || address5!=null){ %>
										
										<textarea class="form-control" name="address5"  id="address5" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address5%>" ><%= address5%></textarea>
										
										<%}else{
											if(len1==4){
									
									for(count1=4;count1<=4;count1++){		
							
										if(count1==4){

										%>
											<textarea class="form-control" name="address5"  id="address5" rows="1" placeholder="Enter Address"  data-toggle="tooltip" data-placement="top" title="<%=address[count1]%>" ><%=address[count1]%></textarea>
										<% }else{ %>
										<textarea class="form-control" name="address5"  id="address5" rows="1" placeholder="Enter Address"></textarea>

									<% } } }%>
										
										<textarea class="form-control" name="address5"  id="address5" rows="1" placeholder="Enter Address"></textarea>
									<%}%>
									
								</td>
 								<td>
									<div class="form-group">
										<input type="text" class="form-control" name="pincode5" id="pincode5" aria-describedby="pincode5" placeholder="Enter Pincode" minlength="6" maxlength="8"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= pincode5%>"> </div>
								</td>
								<td>
									<div class="form-group">
										<input type="text" class="form-control"  name="phone5" id="phone5" aria-describedby="phone5" placeholder="Enter Phone"  minlength="10" maxlength="10" oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" value="<%= phone5%>"> </div>
								</td>
								<td valign="middle">
								
										<!-- <input type="text" class="form-control"  name="city5" id="city5" aria-describedby="city5" placeholder="Enter City">  -->
										<select class="form-control" aria-label="Default select example" name="city5" id="city5">
					 						 <option value="">Select City</option>
					 						 <% for(String corpAcnt:CityList1) {
												   	   if(!city5.equals("") && city5.equals(corpAcnt)){
												   		   
												   	   %>
												   	   		<option selected value="<%=city5 %>"><%=city5 %></option>
												   	   <%}else{ %>
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%} }%>
				</select>
				
								</td>
								<td valign="middle">
									<div class="form-group">
										<input type="text" class="form-control"  name="location5" id="location5" aria-describedby="location5" placeholder="Enter Location"  maxlength="100" value="<%= location5%>"> </div>
								</td>
								
									<td valign="middle">
									<div class="form-check text-center">
										<%if(default_starterkit==null || default_starterkit.equals("") ){ %>
										<input class="form-check-input strb_default"  type="checkbox" id="starterkit5" name="starterkit5" value="5"  style="width:36px;height:36px;">
									<%}else if(default_starterkit.equals("5")){%>
									 <input class="form-check-input strb_default"  checked type="checkbox" id="starterkit5" name="starterkit5" value="5"  style="width:36px;height:36px;"  >
									<%} else{%>
									 <input class="form-check-input strb_default"  type="checkbox" id="starterkit5" name="starterkit5" value="5"  style="width:36px;height:36px;" >
									<%} %>
									</div>
								</td>
								<td valign="middle">
									<div class="form-check text-center">
									<%if(default_address==null || default_address.equals("") ){ %>
										<input class="form-check-input strb_default" type="checkbox" id="batch5"  name="batch5"  value="5"  style="width:36px;height:36px;">									
									<%}else if(default_address.equals("5")){%>
										<input class="form-check-input strb_default" checked type="checkbox" id="batch5"  name="batch5"  value="5"  style="width:36px;height:36px;">
									<%} else{%>
										<input class="form-check-input strb_default" type="checkbox" id="batch5"  name="batch5"  value="5"  style="width:36px;height:36px;">
									<%} %>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				    <span id="addError" style="padding-bottom: 1px;padding-top: 1px;margin-bottom: -6px;margin-top: -8px;"></span>
					
			</div>
		</div>
	</div>
</div>
			
			
						    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for=" Registered Doctor" class="form-label">Starter Doctor </label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div id="RegisteredDoctor" class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="r_Doctor" id="r_Doctor" placeholder="Enter Starter Doctor" value="<%=r_Doctor %>"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			      <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Clinic Doctor " class="form-label"> Doctor Name </label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="c_doctor"  id="c_doctor" placeholder="Enter Doctor Name" value="<%=c_doctor%>"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			   </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					
					<label for=" PATIENT NAME" class="form-label">Patient Name</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" required name="Patient_Name" id="Patient_Name"  placeholder="Enter Patient Name" value="<%=Patient_Name %>"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			</div>
		
		
		<% if(getRight.contains("INI")  || getRight.contains("WFC") || getRight.contains("CADBS")){	%> 
		 <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2">
				
				<label for="CRM  " class="form-label">CRM </label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<select  name="crm" id="crm"  class="form-control" >

				   						   	    
					 <%
					 
					 List<String> Crmlist=(ArrayList<String>)session.getAttribute("CRMLlist");
					 
				   	    for(String corpAcnt:Crmlist) { 
				   	    	if(!crm.equals("") && crm.equals(corpAcnt)){
				   	    %>
				   	    <option selected value="<%=crm %>"><%=crm %></option>
				   	    <%} else{ %>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    
				   	    <%}}%>
				   	    
				</select>
				
				</div>
				<div class="col-lg-2" ></div>
			  </div>
			  <!-- ////////////////////// wfc new-->
				<% if( getRight.contains("WFC")){ %>
			
							    <div class="row" style="margin-top:30px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Type of Account</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;">
				 	<select  name="t_account" id="t_account"  class="form-control" >
					  <% List<String> toplist=(ArrayList<String>)session.getAttribute("typeofaccountlist");
				   	    for(String corpAcnt:toplist) {  if(corpAcnt.equals(t_account1)){%>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%> 
				</select>	
			  </div>
			 	
				<div class="col-lg-2" ></div>
			   </div>
					
					   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
			   
			   <label for=" Corporate Account" class="form-label">Corporate Account </label>
			   
			   </div>
			   <div class="col-lg-1" style="padding-top:4px;"></div>
			  <div class="col-lg-6" id="CorporateAccount" style="padding-left:10px; padding-right:10px;">
			   	<select  name="corporate_account" id="corporate_account"  class="form-control" >
				
					  <% List<String> list=(ArrayList<String>)session.getAttribute("customerlist");
				   	    for(String corpAcnt:list) { if(corpAcnt.equals(corporate_account1)){ %>
				   	    	<option selected  value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option   value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	  <%}}%> 
				</select>	
			  </div>
			  
			  <div class="col-lg-2" ></div>
			  </div> 
			     <div class="row" style="margin-top:20px;">
			   <div class="col-lg-2" ></div>
			    <div class="col-lg-1" >
				
				<label for=" KOL" class="form-label"> KOL</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
			  <div class="col-lg-6"  style="padding-left:10px; padding-right:10px;">
			  
			   	<select  name="kol" id="KOL"  class="form-control" >
			   	 <option >Select KOL</option>
					  <% List<String> kollist=(ArrayList<String>)session.getAttribute("kollist");%>
				   	   <% if(kol==null || kol==null){%>				   		
				   	<%	for(String corpAcnt:kollist) {%>
						   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
						   	    <%}    
				   	   }else{for(String corpAcnt:kollist) {
												   	   if(kol.equals(corpAcnt)){%>
												   	   		<option selected value="<%=kol %>"><%=kol %></option>
												   	   <%}else{ %>
												   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
												   	    <%}}}%>  	    
				</select>	
			  </div>
			
				<div class="col-lg-2" ></div>
			    </div>
			        <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Case Package" class="form-label"> Case Package</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<select  name="c_pkg" id="c_pkg"  class="form-control" >
					  <% List<String> packagelist=(ArrayList<String>)session.getAttribute("packagelist");
				   	    for(String corpAcnt:packagelist) {  if(corpAcnt.equals(c_pkg1)){ %>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    		<%}else{%>
				   	    		<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			        <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch rules w.r.t. corporate" class="form-label"> Dispatch rules w.r.t. corporate</label>
				
				</div>
				<div class="col-lg-6" >
				<%-- //<input type="text" name="dispatch_crpt" id="dispatch_crpt" placeholder="Enter Dispatch rules "  value="<%=dispatch_crpt %>"  class="form-control"  >
			 --%>	<select  name="dispatch_crpt" id="dispatch_crpt"  class="form-control" >
					  <% List<String> Dispatch_ruleslist=(ArrayList<String>)session.getAttribute("Dispatch_ruleslist");
				   	    for(String corpAcnt:Dispatch_ruleslist) { 
				   	    	if(corpAcnt.equals(dispatch_crpt1)){%>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			    </div>
	<%-- 		     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch Address" class="form-label"> Dispatch Address</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="dispatch_address" id="dispatch_address" placeholder="Enter Dispatch address"  value="<%=dispatch_address %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div> 
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         
		         <label for="Bill To address" class="form-label"> Bill To address</label>
		         
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="bill_address" id="bill_address" placeholder="Enter Bill To address"  value="<%=bill_address %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			     </div> --%>
			     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Priority</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;">
				 	<select  name="priority" id="priority"  class="form-control" >
					  <% List<String> pritoty=(ArrayList<String>)session.getAttribute("prioritylist");
				   	   if(priority1==null){
				   		
				   	   }
					  
					  for(String corpAcnt:pritoty) { 
						  
				   	    	if(corpAcnt.equals(priority1)){%>
				 	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	     <%} else{%>
				   	    
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%>
				</select>	
			  </div>
			  </div>
			 <!--  //////////// -->
		     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Total Amount" class="form-label"> Total Amount</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="total_amount" id="total_amount" placeholder="Enter Total Amount"  value="<%=total_amount %>"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			     </div> 
			       <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Payment Processing" class="form-label"> Payment Processing</label>
				</div>
				<div class="col-lg-6">
				<input type="text" name="payment_processing" id="payment_processing" placeholder="Enter Payment Processing" value="<%=payment_processing %>"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			     </div> 
			        <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Mode of Payment" class="form-label"> Mode of Payment</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<select  class="form-control" name="payment_mode" id="payment_mode">
					 
					 	<% 
					 	
					 	if(payment_mode.equals("cash")){ %>
					 	 <option selected value="cash"> Cash</option>
					  	 <option value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option>
					  	  <option  value="other">Other</option> 
					  	 
					  	  <%}else if(payment_mode.equals("ccard")){ %>
					  	<option  value="cash"> Cash</option>
					  	 <option  value="dcard">Debit Card</option>
					  	 <option value="ccard" selected>Credit Card</option> 
					  	 <option  value="other">Other</option> 
					  	 
					  	<%}else if(payment_mode.equals("dcard")){ %>
					  	<option  value="cash"> Cash</option>
					  	 <option selected value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option> 
					  	 <option  value="other">Other</option> 
					  	 
					  	 
					  	 <%}else if(payment_mode.equals("other")){ %>
					  	<option  value="cash"> Cash</option>
					  	 <option  value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option> 
					  	 <option  selected value="other">Other</option> 
				
					  	 <%}else{%>
					  	 <option selected value="0">------------------------------Select Mode of Payment----------------------------------</option>
					 	<option  value="cash"> Cash</option>
					  	 <option  value="dcard">Debit Card</option>
					  	 <option   value="ccard">Credit Card</option> 
					  	 <option  value="other">Other</option>  
						 <%}%> 
						</select>
				</div>
				<div class="col-lg-2" ></div>
			     </div>
				<%} %>
			  
			  
			 <!--  ///////////////////// end wfc -->
			  
			       <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Type of Request" class="form-label">Type of Request</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
			 	<select  class="form-control" name="TRequest" id="TRequest"  class="form-control" required >
					   <option value='0'>--------------------------- Select Type of Request -----------------------------</option>
					  <% List<String> Crmlist12=(ArrayList<String>)session.getAttribute("TRequestlist");
				   	    for(String corpAcnt:Crmlist12) {  
				   	    	if(corpAcnt.equals(type_request1)){%>
				   	     <option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	     <%}else{%>
				   	    	  <option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%>
				</select>
			 
			 </div>
				<div class="col-lg-2" ></div>
			   </div>
			  
  				<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Photograph available " class="form-label"> Photograph available</label>
				
				</div>
				<div class="col-lg-2" >
				<% if(photograph.equalsIgnoreCase("Yes")){%>
						<input type="radio" class="form-check-input" name="Photograph"   checked="checked"  id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Photograph"  id="NO" value="No"> NO
				<%}else if(photograph.equalsIgnoreCase("No")){ %>	 		
				 		<input type="radio" class="form-check-input" name="Photograph"     id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" checked="checked" name="Photograph"  id="NO" value="No"> NO
				<%}else{  %>
				 		<input type="radio" class="form-check-input" name="Photograph"   checked="checked"  id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Photograph"  id="NO" value="No"> NO
				 <%}%>	
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
				
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Starter Kit required" class="form-label">Starter Kit required</label>
				
				</div>
				<div class="col-lg-2" >
				<% if(starter_kit.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="SKit"   checked="checked"  id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="SKit"  id="kNO" value="No"> NO
				 	<%}else if(starter_kit.equalsIgnoreCase("No")){ %>
				 	
				 	<input type="radio" class="form-check-input" name="SKit"    id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input"  checked="checked" name="SKit"  id="kNO" value="No"> NO
				 	<%}else{  %>
				 	
				 	<input type="radio" class="form-check-input" name="SKit"   checked="checked"  id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="SKit"  id="kNO" value="No"> NO
				 	<%}%>
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>

			
			    
			       <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Simulation Shown" class="form-label">Simulation Shown</label>			
				</div>
				<div class="col-lg-2" >
				<% if(s_shown.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="Shown"   checked="checked"  id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown"  id="Shown" value="No"> NO
				 	 	<%}else if(s_shown.equalsIgnoreCase("No")){ %>
				 	 	<input type="radio" class="form-check-input" name="Shown" id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown" checked="checked"  id="Shown" value="No"> NO
				 	<%}else{  %>
				 	<input type="radio" class="form-check-input" name="Shown" checked="checked" id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown"   id="Shown" value="No"> NO
				 	<%}%>
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Starter Kit required" class="form-label">PPF Filled</label>
				</div>
				<div class="col-lg-2" >
				<% if(ppf_fill.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="PPF"   checked="checked"  id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF"  id="PPF" value="No"> NO
				 		<%}else if(ppf_fill.equalsIgnoreCase("No")){ %>
				 		<input type="radio" class="form-check-input" name="PPF"     id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF" checked="checked"  id="PPF" value="No"> NO
				 		<%}else{ %>
				 		<input type="radio" class="form-check-input" name="PPF"  checked="checked"   id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF"   id="PPF" value="No"> NO
				 		<% }%>
				 		</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>
			<% } %>

			
 			<% if(getRight.contains("PRE")  ){	%> 
 			
			   <%--  <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2">
				
				<label for="CRM  " class="form-label">CRM </label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<select  name="crm" id="crm"  class="form-control" >
					   <option  value="0">------------------------------------------ Select CRM -----------------------------------------------------</option>
					  <% List<String> Crmlist1=(ArrayList<String>)session.getAttribute("CRMLlist");
				   	    for(String corpAcnt:Crmlist1) { if(corpAcnt.equals(crm1)){%>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			  </div>
			  
  				<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Photograph available " class="form-label"> Photograph available</label>
				
				</div>
				<div class="col-lg-2" >
				<% if(photograph.equalsIgnoreCase("Yes")){%>
						<input type="radio" class="form-check-input" name="Photograph"   checked="checked"  id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Photograph"  id="NO" value="No"> NO
				<%}else if(photograph.equalsIgnoreCase("No")){ %>	 		
				 		<input type="radio" class="form-check-input" name="Photograph"     id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" checked="checked" name="Photograph"  id="NO" value="No"> NO
				<%}else{  %>
				 		<input type="radio" class="form-check-input" name="Photograph"   checked="checked"  id="Yes" value="Yes"> YES
				 		&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Photograph"  id="NO" value="No"> NO
				 <%}%>	
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
				
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Starter Kit required" class="form-label">Starter Kit required dd</label>
				
				</div>
				<div class="col-lg-2" >
				<% if(starter_kit.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="SKit"   checked="checked"  id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="SKit"  id="kNO" value="No"> NO
				 	<%}else if(starter_kit.equalsIgnoreCase("No")){ %>
				 	
				 	<input type="radio" class="form-check-input" name="SKit"    id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input"  checked="checked" name="SKit"  id="kNO" value="No"> NO
				 	<%}else{  %>
				 	
				 	<input type="radio" class="form-check-input" name="SKit"   checked="checked"  id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="SKit"  id="kNO" value="No"> NO
				 	<%}%>
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>

			     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Type of Request" class="form-label">Type of Request</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
			 	<select  name="TRequest" id="TRequest"  class="form-control" >
					   <option  value="0">------------------------------------------ Select Type of Request -----------------------------------------------------</option>
					  <% List<String> Crmlist12=(ArrayList<String>)session.getAttribute("TRequestlist");
				   	    for(String corpAcnt:Crmlist12) {  
				   	    	if(corpAcnt.equals(type_request1)){%>
				   	     <option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	     <%}else{%>
				   	    	  <option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%>
				</select>
			 
			 </div>
				<div class="col-lg-2" ></div>
			   </div>
			    
			       <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Simulation Shown" class="form-label">Simulation Shown</label>			
				</div>
				<div class="col-lg-2" >
				<% if(s_shown.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="Shown"   checked="checked"  id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown"  id="Shown" value="No"> NO
				 	 	<%}else if(s_shown.equalsIgnoreCase("No")){ %>
				 	 	<input type="radio" class="form-check-input" name="Shown" id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown" checked="checked"  id="Shown" value="No"> NO
				 	<%}else{  %>
				 	<input type="radio" class="form-check-input" name="Shown" checked="checked" id="Shown" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Shown"   id="Shown" value="No"> NO
				 	<%}%>
				 	</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Starter Kit required" class="form-label">PPF Filled</label>
				</div>
				<div class="col-lg-2" >
				<% if(ppf_fill.equalsIgnoreCase("Yes")){%>
				<input type="radio" class="form-check-input" name="PPF"   checked="checked"  id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF"  id="PPF" value="No"> NO
				 		<%}else if(ppf_fill.equalsIgnoreCase("No")){ %>
				 		<input type="radio" class="form-check-input" name="PPF"     id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF" checked="checked"  id="PPF" value="No"> NO
				 		<%}else{ %>
				 		<input type="radio" class="form-check-input" name="PPF"  checked="checked"   id="PPF" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="PPF"   id="PPF" value="No"> NO
				 		<% }%>
				 		</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>

			   
			     
			   
			    
			    
			   
			  <div class="row" style=" height:40px;margin-top:30px; ">
			
				<div class="col-lg-12 header-styles" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>CRM</h3>
				</div>
				<div class="col-lg-2"></div>
			</div> 
			  <!--   <div class="row" style=" height:50px; margin-top:40px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-8" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
				<h3>CRM</h3>
				</div>
				<div class="col-lg-2" ></div>
			    </div> -->
			    

			    <div class="row" style="margin-top:30px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Type of Account</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;  width:150px;">
				 	<select  name="t_account" id="t_account" style="outline:none; height:30px; width:508px; padding-left:10px">
					  <% List<String> toplist=(ArrayList<String>)session.getAttribute("typeofaccountlist");
				   	    for(String corpAcnt:toplist) {  if(corpAcnt.equals(t_account1)){%>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%> 
				</select>	
			  </div>
			 	
				<div class="col-lg-2" ></div>
			   </div>
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
			   
			   <label for=" Corporate Account" class="form-label">Corporate Account </label>
			   
			   </div>
			   <div class="col-lg-1" style="padding-top:4px;"></div>
			  <div class="col-lg-6" id="CorporateAccount" style="padding-left:10px; padding-right:10px;">
			   	<select  name="corporate_account" id="corporate_account" style="outline:none; height:30px; width:508px; padding-left:10px">
				
					  <% List<String> list=(ArrayList<String>)session.getAttribute("customerlist");
				   	    for(String corpAcnt:list) { if(corpAcnt.equals(corporate_account1)){ %>
				   	    	<option selected  value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option   value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	  <%}}%> 
				</select>	
			  </div>
			  
			  <div class="col-lg-2" ></div>
			  </div> 
			  
			   <div class="row" style="margin-top:20px;">
			   <div class="col-lg-2" ></div>
			    <div class="col-lg-1" >
				
				<label for=" KOL" class="form-label"> KOL</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
			  <div class="col-lg-6"  style="padding-left:10px; padding-right:10px;">
			   	<select  name="kol" id="KOL" style="outline:none; height:30px; width:508px; padding-left:10px">
					  <% List<String> kollist=(ArrayList<String>)session.getAttribute("kollist");
				   	    for(String corpAcnt:kollist) { if(corpAcnt.equals(kol1)){ %>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%> 
				</select>	
			  </div>
			
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Case Package" class="form-label"> Case Package</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<select  name="c_pkg" id="c_pkg" style="outline:none; height:30px; width:508px; padding-left:10px">
					  <% List<String> packagelist=(ArrayList<String>)session.getAttribute("packagelist");
				   	    for(String corpAcnt:packagelist) {  if(corpAcnt.equals(c_pkg1)){ %>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    		<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    <%}}%>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <!--  <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Package names" class="form-label"> Package names</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Pname" id="Pname" placeholder="Enter Package names"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			    </div> -->
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch rules w.r.t. corporate" class="form-label"> Dispatch rules w.r.t. corporate</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<%-- <input type="text" name="dispatch_crpt" id="dispatch_crpt" placeholder="Enter Dispatch rules "  value="<%=dispatch_crpt %>"  class="form-control"  > --%>
			<%-- 	<select  name="dispatch_crpt" id="dispatch_crpt" style="outline:none; height:30px; width:508px; padding-left:10px">
					  <% List<String> Dispatch_ruleslist=(ArrayList<String>)session.getAttribute("Dispatch_ruleslist");
				   	    for(String corpAcnt:Dispatch_ruleslist) { if(corpAcnt.equals(dispatch_crpt1)){%>
				   	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	<%}else{%>
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    <%}}%>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			    </div> --%>
<%-- 			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch Address" class="form-label"> Dispatch Address</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="dispatch_address" id="dispatch_address" placeholder="Enter Dispatch address"  value="<%=dispatch_address %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         
		         <label for="Bill To address" class="form-label"> Bill To address</label>
		         
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="bill_address" id="bill_address" placeholder="Enter Bill To address"  value="<%=bill_address %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			     </div>  --%>
		<%-- 	     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Priority</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;  width:150px;">
				 	<select  name="priority" id="priority" style="outline:none; height:30px; width:508px; padding-left:10px">
					  <% List<String> pritoty=(ArrayList<String>)session.getAttribute("prioritylist");
				   	   if(priority1==null){
				   		 
				   	   }
					  
					  for(String corpAcnt:pritoty) { 
				   	    	if(corpAcnt.equals(priority1)){%>
				 	    	<option selected value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	     <%} else{%>
				   	    
				   	    
				   	    	<option value="<%=corpAcnt %>"><%=corpAcnt %></option>
				   	    	
				   	    	
				   	    <%}}%>
				</select>	
			  </div>
			  </div> --%>
			 <!--  //////////// -->
			<%--     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Total Amount" class="form-label"> Total Amount</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="total_amount" id="total_amount" placeholder="Enter Total Amount"  value="<%=total_amount %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			     </div> 
			       <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Payment Processing" class="form-label"> Payment Processing</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="payment_processing" id="payment_processing" placeholder="Enter Payment Processing" value="<%=payment_processing %>" style="outline:none; height:30px; width:98%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			     </div> --%> 
			 <%--      <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         <label for="Mode of Payment" class="form-label"> Mode of Payment</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<select class="custom-select" name="payment_mode" id="payment_mode" style="width:508px; height:30px;">
           		 		 <option value="0" null="">--------------------------------------------Select Mode of Payment-------------------------------------</option>
					 	<% if(payment_mode.equals("cash")){ %>
					 	 <option selected value="cash"> Cash</option>
					  	 <option value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option>
					  	  <option  value="other">Other</option> 
					  	  
					  	<%}else if(payment_mode.equals("dcard")){ %>
					  	<option  value="cash"> Cash</option>
					  	 <option selected value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option> 
					  	 <option  value="other">Other</option> 
					  	 
					  	 
					  	 <%}else if(payment_mode.equals("other")){ %>
					  	<option  value="cash"> Cash</option>
					  	 <option selected value="dcard">Debit Card</option>
					  	 <option value="ccard">Credit Card</option> 
					  	 <option  selected value="other">Other</option> 
					  	 
					  	 
					  	 <%}else if(payment_mode==null || payment_mode.equals("")){ %>
					  	 <option  value="cash"> Cash</option>
					  	 <option  value="dcard">Debit Card</option>
					  	 <option selected value="ccard">Credit Card</option> 
					  	 <option  value="other">Other</option> 
					  	 
					  	 <%} %>
					  	 <!--  <option  value="cash"> Cash</option>
					  	 <option  value="dcard">Debit Card</option>
					  	 <option  value="ccard">Credit Card</option> 
					  	 <option  value="other">Other</option>  -->
						</select>
						</select>
				</div>
				<div class="col-lg-2" ></div>
			     </div> --%> 
			   
			  
		   <%} %>  
			    <%  if(getRight.contains("WFC")){ %> 
		
				<div class="row" style=" height:50px; margin-top:40px;">
				<div class="col-lg-12" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>Delivery Note Details:</h3>
				</div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="remarks" class="form-label">DELIVERY NOTE NO</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="delivery_note_no"  id="delivery_note_no"  placeholder="Enter Delivery note No."  value="<%=delivery_note_no %>"  class="form-control"  oninput="if (/\D/g.test(this.value)) this.value = this.value.replace(/\D/g,'')" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
				
			
			
				<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					<label for="remarks" class="form-label">BUYER'S CLINIC NAME</label>
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew4" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div id="buyerClinicNameDiv" class="col-lg-6"  style="padding-left:10px; padding-right:10px;">
					<%
					for(int i=0;i<buyerClinicNames.length;i++){
						int count=i+1;
						String name="bcn"+count;
						
				%>
				
					<input type="text" name="bcn<%=i%>" id="bcn<%=i%>" placeholder="Enter buyer's Clinic Name" value="<%=buyerClinicNames[i]%>"style="outline:none; height:60px; width:100%; padding-left:10px;text-transform:uppercase;" >
				<%} %>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					<label for="remarks" class="form-label">BUYER'S ADDRESS</label>
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew5" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div id="buyerAddressDiv" class="col-lg-6"  style="padding-left:10px; padding-right:10px;">
						<%
					for(int i=0;i<buyerAddress.length;i++){
						int count=i+1;
						String name="badd"+count;
						
				%>
				<input type="text" name="badd<%=i%>" id="badd<%=i%>" placeholder="Enter buyer's Address" value="<%=buyerAddress[i]%>" style="outline:none; height:60px; width:100%; padding-left:10px;text-transform:uppercase;" >
				<%} %>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">BUYER GST NO</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="bgst_no" id="bgn" placeholder="Enter buyer GST No." value="<%=bgst_no%>"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">CATEGORY</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="category" id="cat" placeholder="Enter Category" value="<%=category%>"  class="form-control"  >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">UPPER ALIGNER</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" class="form-control" name="upper_aligner" id="ua" placeholder="Enter upper Aligner" value="<%=upper_aligner%>">
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">LOWER ALIGNER</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" class="form-control" name="lower_aligner" id="la" placeholder="Enter lower Aligner" value="<%=lower_aligner%>" >
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">OTHERS</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" class="form-control" name="others" id="oth" placeholder="Enter others" value="<%=others%>"  >
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
  	<%} %>  

		       	<%
			if(newcase!=null){
			%>
			
			
				 <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<!-- REMARK/COMMENT: -->
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
			<%-- 		<input type="text" name="remark" id="remark" placeholder="Enter remark" style="outline:none; height:30px; width:99%; padding-left:10px" value="<%=remark %>">
			 --%>	</div>
				<div class="col-lg-2" ></div>
			
			</div>
			
		
			<%
			}
			%>
				<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="remarks" class="form-label">Remarks</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" class="form-control" name="remark" id="remark" placeholder="Enter remark" value="<%=remarks%>"  >
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="remarks" class="form-label">DECISION</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
			<select class="form-control"  name="stage"  id="stage">
           		<% 
				 if(getRight.contains("WFC")){	%>
           		 		<option value="Y">Work-In-Progress</option>
					  <option value="WFC">WFC Approve</option>
					 
					  <option value="INICOR">Corrections Required</option>				
					 <!--  <option value="PRE">PRE Approve</option>
					    <!-- <option value="WFCCOR">Corrections Required For WFC</option> -->
					      <option value="CADBS">SEND TO PLANING</option>
					        <option value="STG">SEND TO HOLLOW TAG</option>
					        <option value="QA">SEND TO STAGGING</option>
					         <option value="MPT">SEND TO 3D PRINTING</option>
					            <option value="3DP">SEND TO 3D LAB</option>
					  			<option value="REJ">Reject</option>
					  
					  
					  
					<% }else  if(getRight.contains("PRE")){ %>  
					<!-- <option value="Y">Work-In-Progress</option> -->
					  <option value="PRE">PRE Approve</option>
					    <option value="WFCCOR">Corrections Required For WFC</option>
					      <!-- <option value="CADBS">SEND TO PLANING</option>
					        <option value="STG">SEND TO HOLLOW TAG</option>
					        <option value="QA">SEND TO STAGGING</option>
					          <option value="MTP">SEND TO 3D PRINTING</option>
					            <option value="3DP">SEND TO 3D LAB</option>
					  <option value="REJ">Reject</option> -->
					
					  <%} else  if(getRight.contains("INI")){%>
					   
					
					  <option value="INI">INI Approve</option>
					 
					  <%} else  if(getRight.contains("CADBS")){%>
					   <option value="Y">Work-In-Progress</option>
					   <option value="PRECOR">Prerequisite Correction</option>
					  <option value="CADBS">CADBS Approve</option>
					   <%} %>
				</select>
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
			
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
			<button type="submit" value="Save" class="btn btn-success"
						><span>Proceed </span><i class="fas fa-arrow-circle-right"></i>
					</button></div>
				<br>
				<br>
				<br>
				<br>
				
			</div>

		
			 </div> 		   
	</form>	       
      <script>
/*   $(document).ready(function(){
    $('input:checkbox').click(function() {
        $('input:checkbox').not(this).prop('checked', false);
    });
});
  function validate_form()
  {
  valid = true;

  if($('input[type=checkbox]:checked').length == 0)
  {
      alert ( "Please select at least one Address checkbox" );
      valid = false;
  }

  return valid;
  }
   */

   function checkcid(){
   	var n1=document.getElementById("incase").value;
   	var username=document.getElementById("userid").value;
   	var result="NewCasesshow1?caseId="+n1;
   	window.location.href = result;

   }

   $('#starterkit1').on('change', function(){
	    $('#starterkit2').prop('checked',false);
	    $('#starterkit3').prop('checked',false);
	    $('#starterkit4').prop('checked',false);
	    $('#starterkit5').prop('checked',false);
	 });


   $('#starterkit2').on('change', function(){
	    $('#starterkit1').prop('checked',false);
	    $('#starterkit3').prop('checked',false);
	    $('#starterkit4').prop('checked',false);
	    $('#starterkit5').prop('checked',false);	
   });
   
   $('#starterkit3').on('change', function(){
	    $('#starterkit1').prop('checked',false);
	    $('#starterkit2').prop('checked',false);
	    $('#starterkit4').prop('checked',false);
	    $('#starterkit5').prop('checked',false);
   });
   
   $('#starterkit4').on('change', function(){
	    $('#starterkit1').prop('checked',false);
	    $('#starterkit2').prop('checked',false);
	    $('#starterkit3').prop('checked',false);
	    $('#starterkit5').prop('checked',false);
   });
   $('#starterkit5').on('change', function(){
	    $('#starterkit1').prop('checked',false);
	    $('#starterkit2').prop('checked',false);
	    $('#starterkit3').prop('checked',false);
	    $('#starterkit4').prop('checked',false);
   });

   $('#batch1').on('change', function(){
	    $('#batch2').prop('checked',false);
	    $('#batch3').prop('checked',false);
	    $('#batch4').prop('checked',false);
	    $('#batch5').prop('checked',false);

   });
   $('#batch2').on('change', function(){
	    $('#batch1').prop('checked',false);
	    $('#batch3').prop('checked',false);
	    $('#batch4').prop('checked',false);
	    $('#batch5').prop('checked',false);

   });
   $('#batch3').on('change', function(){
	    $('#batch1').prop('checked',false);
	    $('#batch2').prop('checked',false);
	    $('#batch4').prop('checked',false);
	    $('#batch5').prop('checked',false);

   });
   $('#batch4').on('change', function(){
	    $('#batch1').prop('checked',false);
	    $('#batch2').prop('checked',false);
	    $('#batch3').prop('checked',false);
	    $('#batch5').prop('checked',false);

   });
   $('#batch5').on('change', function(){
	    $('#batch1').prop('checked',false);
	    $('#batch2').prop('checked',false);
	    $('#batch3').prop('checked',false);
	    $('#batch4').prop('checked',false);

   	});

   function validate_form()
   {
	   
	   	var stage=document.getElementById("stage").value;
	   	var remark=document.getElementById("remark").value;
	   	
	    if( stage=='REJ' || stage=='WFCCOR' || stage=='PRECOR' || stage=='INICOR' || stage=='Y'){
			   if(remark==''){
			   alert("Reason required");
			   //document.getElementById("remark").focus()
			    document.getElementById("remark").style.borderColor = "#E34234";
				return false;
		   }
		   }	
	   	   valid = true;
		   if($('input[type=checkbox]:checked').length == 0)
		   {
			   var errName = $("#addError"); 
			   errName.html(" Please check either starter kit or batch check box!");
			   errName.addClass('error-msg alert alert-danger col-lg-12 text-center');
			   valid = false;   
		   }
		   return valid;	   
   } 
</script>
	 <script src="JavaScript/5b8969f8ab.js"></script>
     <script src="script/script.js"></script>


  		<br><br>
		
  </div>
  </div> 

</body>

</html>
