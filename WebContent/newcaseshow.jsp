
<!DOCTYPE html>

<%@page import="com.vo.PendingVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="Images/logo.png">
     
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
    <title>WorkFlow</title>
    
    <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/StyleSheet/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/StyleSheet/animate.min.css" rel="stylesheet">

    
    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/StyleSheet/custom1.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/JavaScript/jquery.min.js"></script>    
	<script src="${pageContext.request.contextPath}/JavaScript/custom.js"></script>
 	<script src="${pageContext.request.contextPath}/JavaScript/Chart.js"></script>
 <script src="${pageContext.request.contextPath}/JavaScript/bootstrap.js"></script>
  <script type="text/javascript"  src="${pageContext.request.contextPath}/JavaScript/jquery-1.10.1.js">

 <script type="text/javascript">
 
function callModal(){
		$('#myModal').modal({
			backdrop: 'static',
			keyboard: false

		}); 
};
</script>
<style>
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
backdrop: 'static'
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;

}
/* The Close Button */
.close {
 	color: #000;
    float: right;
    font-size: 14px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    text-decoration: none;
    cursor: pointer;
}
</style>
 <script>
 
 <%-- var pieData = [
				{
					value:0,
					color:"#4285F4",
					highlight: "#8ab4f8",
					label: "Cash Flow"
				},
				{
					value: 0,
					color: "#FBBC05",
					highlight: "#fcd050",
					label: "In Process"
				},
				{
					value: 0,
					color: "#34A853",
					highlight: "#5ccd7a",
					label: "Paid"
				},
				{
					value: 0,
					color: "#EA4335",
					highlight: "#f1837a",
					label: "Rejected"
				}
			];
 pieData[0].value=<%=strcashflow%>;
 pieData[1].value=<%=strinprocess%>;
 pieData[2].value=<%=strpaid%>;
 pieData[3].value=<%=strreject%>; --%>
	
			
		
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
var url_string = window.location;
var url = new URL(url_string);
var tvid = url.searchParams.get("id");
var url="http://107.167.80.130:8080/MobileApp/rest/getAllScanningDoneFormRecordById?id="+tvid;
    $.get(url, function(data, status){
var userData = data;
var newData1 = userData.user_name;
document.getElementById('incase').value=userData.id;
document.getElementById('cni1').value=userData.clinic_name;
document.getElementById('addr1').value=userData.location;
document.getElementById('pno1').value=userData.contact_no;
document.getElementById('Location').value=userData.location;
document.getElementById('PATIENT').value=userData.patient_name;


//document.getElementById('city').value=userData.location;
document.getElementById('RDoctor').value=userData.doctor_name;
document.getElementById('CDoctor').value=userData.doctor_name;

document.getElementById('Scan').value=userData.user_name;
document.getElementById('Yes').value=userData.photograph_available;
//document.getElementById('No').value=userData.photograph_available;
document.getElementById('Scan').value=userData.user_name;
document.getElementById('Shown').value=userData.simulation_show;
document.getElementById('PPF').value=userData.prescriptio_form_filed;



    });
  
});
</script>

</head>
<body class="nav-md">


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


  <div class="panel panel-primary">
    <div class="panel-heading"><strong>Create New</strong> </div>

<br>
  <div class="panel">
    
    
<!--  body to be here-->


<!--  -->
	<form action="CreateCCSave" method="post">
		<div class="container">
			<div class="row" style=" height:40px; ">
				<div class="col-lg-2" ></div>
				<div class="col-lg-8 header-styles" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>CC Details</h3>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				<label for="Case ID" class="form-label">Case ID</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="incase" id="incase" required placeholder="Case ID" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<input type="hidden" id="existing_flag" name="existing_flag">
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					<label for="Existing/New" class="form-label">Existing/New</label>
				</div>
<!-- 					<input type="text" name="Existing" id="Existing"    required placeholder="Enter Case Id" style="outline:none; height:30px; width:100%; padding-left:10px" maxlength="20">
 -->						
				 	<div class="col-lg-2" ><input type="radio" class="form-check-input" name="Existing" onClick="neeraj()" id="Existing" value="Existing"> Existing
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Existing" checked="checked"  id="New" value="New"> New</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
				
				

				<div class="col-lg-4" ></div>
			</div>
			
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					
					<label for=" Scan/Impression" class="form-label">Scan/Impression </label>
					
				</div>
				<div class="col-lg-2" >
				<div class="form-check">
				<input type="radio" class="form-check-input" name="Impression"  id="Scan" checked="checked" value="Scan"> Scan
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" class="form-check-input" name="Impression"  id="Impression" value="Impression"> Impression
				</div>
				</div>
				<div class="col-lg-4" ></div>
			    </div>
			    		<!--    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
			    
			    <label for=" Clinic" class="form-label"> Clinic Name</label>
			    
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Clinic" id="Clinic" placeholder="Enter Clinic Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			   </div> -->
			   	<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					 <label for=" Clinic" class="form-label"> Clinic Name</label>
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew3" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="ClinicNameDiv" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="cni1" id="cni1"  placeholder="Enter Clinic Name" style="outline:none; height:60px; width:100%; padding-left:10px; padding-top:0px !important; word-wrap: break-word" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<!--     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					PHONE NUMBER:
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				</div>
				<div id="PhoneNumberDiv" class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="pno1" id="pno1" placeholder="Enter Phone number" style="outline:none; height:30px; width:100%; padding-left:10px" >
					
				</div>
				<div class="col-lg-2" ></div>
			</div> -->
				<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					
					<label for=" ADDRESS" class="form-label"> ADDRESS</label>
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew1" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="AddressDiv" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="addr1"  id="addr1" placeholder="Enter Address" style="outline:none; height:60px; width:100%; padding-left:10px; padding-top:0px !important; word-wrap: break-word" >
					
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					<label for=" ADDRESS" class="form-label"> PHONE NUMBER</label>		
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew2" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div id="PhoneNumberDiv" class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="pno1" id="pno1" placeholder="Enter Phone number" style="outline:none; height:30px; width:100%; padding-left:10px" >
					
				</div>
				<div class="col-lg-2" ></div>
			</div>
			  <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for=" Location" class="form-label"> Location</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" id="Location" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Location" id="Location"  placeholder="Enter your Location" style="outline:none; height:30px; width:100%; padding-left:10px; padding-top:0px !important; word-wrap: break-word" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
	            <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for=" City" class="form-label">City </label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;  width:150px;">
				 	<select class="form-select" name="city"  value="0" select city id="city" style="outline:none; height:30px; width:525px; padding-left:10px">
					  <option value="Delhi">Delhi</option>
					  <option value="Noida">Noida</option>
					  <option value="NewDelhi">NewDelhi</option>
				</select>	
			  </div>
			  
			  
			  <div class="col-lg-2" ></div>
			  
		      </div>		
		        <div class="col-lg-2" ></div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for=" Registered Doctor" class="form-label">Registered Doctor </label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div id="RegisteredDoctor" class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="RDoctor" id="RDoctor" placeholder="Enter Registered Doctor" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					
					<label for=" PATIENT NAME" class="form-label">PATIENT NAME</label>
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="PATIENT" id="PATIENT" required placeholder="Enter Patient Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="CRM  " class="form-label">CRM  </label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="crm" id="crm" placeholder="Enter CRM Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			  </div>
	
			   
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Clinic Doctor " class="form-label">Clinic Doctor </label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="CDoctor" id="CDoctor" placeholder="Enter Clinic Doctor" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			   </div>
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Photograph available " class="form-label"> Photograph available</label>
				
				</div>
				<div class="col-lg-2" ><input type="radio" class="form-check-input" name="Photograph"   checked="checked"  id="Yes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="Photograph"  id="NO" value="No"> NO</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
				
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Starter Kit required" class="form-label">Starter Kit required </label>
				
				</div>
				<div class="col-lg-2" ><input type="radio" class="form-check-input" name="SKit"   checked="checked"  id="kYes" value="Yes"> YES
				 	&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="SKit"  id="kNO" value="No"> NO</div>
				<div class="col-lg-2" style="padding-left:10px; padding-right:10px;"> </div>
					<div class="col-lg-2" ></div>
			    </div>
			   <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for="Type of Request" class="form-label">Type of Request</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="TRequest" id="TRequest" placeholder="Enter Type of Request" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			   </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
			
				<label for="Simulation Shown" class="form-label">Simulation Shown</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Shown" id="Shown" placeholder="Enter Simulation Shown" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" PPF Filled" class="form-label"> PPF Filled</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="PPF" id="PPF"  placeholder="Enter PPF Filled" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			   </div>
			    <div class="row" style=" height:50px; margin-top:40px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-8" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
				<h3>CRM</h3>
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Type of Account</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;  width:150px;">
				 	<select class="form-select" name="TAccount" id="TAccount" style="outline:none; height:30px; width:530px; padding-left:10px">
					  <option value="Corporate">Corporate</option>
					  <option value="KOL">KOL</option>
					  <option value="Retail">Retail</option>
				</select>	
			  </div>
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
			   	<select class="form-select" name="CAccount" id="CAccount" style="outline:none; height:30px; width:530px; padding-left:10px">
					  <option value="Saving">Saving</option>
					  <option value="Current">Current</option>
				</select>	
			  </div>
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
			   	<select class="form-select" name="KOL" id="KOL" style="outline:none; height:30px; width:530px; padding-left:10px">
					  <option value="Saving">Saving</option>
					  <option value="Current">Current</option>
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
				<input type="text" name="Cpkg" id="Cpkg" placeholder="Enter Case Package" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Package names" class="form-label"> Package names</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Pname" id="Pname" placeholder="Enter Package names" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch rules w.r.t. corporate" class="form-label"> Dispatch rules w.r.t. corporate</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="Dispatchcr" id="Dispatchcr" placeholder="Enter Dispatch rules " style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
				
				<label for=" Dispatch Address" class="form-label"> Dispatch Address</label>
				
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="DispatchAdr" id="DispatchAdr" placeholder="Enter Dispatch address" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			    </div>
			    <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
		         
		         <label for="Bill To address" class="form-label"> Bill To address</label>
		         
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
				<input type="text" name="BillAdr" id="BillAdr" placeholder="Enter Bill To address" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			     </div> 
			     <div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
				
				<label for="Type of Account " class="form-label"> Priority</label>
				
				</div>
				<div class="col-lg-1" style="padding-top:4px;"></div>
				<div class="col-lg-6" style="padding-left:10px;  width:150px;">
				 	<select class="form-select" name="Priority" id="Priority" style="outline:none; height:30px; width:530px; padding-left:10px">
					  <option value="1">1st</option>
					  <option value="2">2nd</option>
					  <option value="3">3rd</option>
				</select>	
			  </div>
			
				<div class="row" style=" height:50px; margin-top:40px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-8" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>Delivery Note Details:</h3>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					DELIVERY NOTE NO:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="dno"  id="dno"  placeholder="Enter Delivery note No." style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					BUYER'S CLINIC NAME:
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew4" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="buyerClinicNameDiv" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="bcn1" id="bcn1" placeholder="Enter buyer's Clinic Name" style="outline:none; height:60px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					BUYER'S ADDRESS:
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew5" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="buyerAddressDiv" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="badd1" id="badd1" placeholder="Enter buyer's Address" style="outline:none; height:60px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					BUYER GST NO:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="bgn" id="bgn" placeholder="Enter buyer GST No." style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					CATEGORY:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="cat" id="cat" placeholder="Enter Category" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					UPPER ALIGNER:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="ua" id="ua" placeholder="Enter upper Aligner" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					LOWER ALIGNER:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="la" id="la" placeholder="Enter lower Aligner" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					OTHERS:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="oth" id="oth" placeholder="Enter others" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			
			</div>
	
			 	</div>
			   <div class="row" style="margin-top:20px;margin-bottom:50px;">
				<div class="text-center">
				<button type="submit" value="Save"  class="btn btn-success" >Submit</button>
				</div>
		       </div>
				    
	</form>
 <!-- font awesome link -->
 
   <script>      
		           
   /*function validate()
       {
 var New=document.getElementById("New").value;
var Existing=document.getElementById("Existing").value;
 var Case= document.getElementById("incase").value;
 var Impression=document.getElementById("Impression").value;
var Scan=document.getElementById("Scan").value;
if(Case==""){
	alert(" Please enter case id");
	return false;
	
}
/*else if(!Existing.checked==true &&! New.checked==true ) {
    alert("You must select ExistingId or NewId");
    return false;
} 
else if(!Scan.checked==true || !Impression.checked==true ) {
    alert("You must select Impression or Scan ");
    return false;
} 

else{
	$.ajax({
		
	    type : 'POST',
		data : {Existing:Existing,Case:Case},
		url : 'CreateCCSave',
		success : function(responseText) {
		var x=responseText;
		alert(x);
		location='Dashboard.jsp';
			
		}
	 
	});   

}
}*/
	       
	</script>	       
	       
  <input type="hidden" id="userid" value="<%= request.getSession().getAttribute("userid") %>" />
  
 <script>

function neeraj(){
	var n1=document.getElementById("incase").value;
	var username=document.getElementById("userid").value;
	var result="http://localhost:8080/Workflow/newcaseshow1.jsp?caseId="+n1+"&logusername="+username;
	window.location.href = result;

}

</script>
 <script
  src="JavaScript/jquery-1.10.1.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
 
        <script src="JavaScript/5b8969f8ab.js"></script>
        <script src="script/script.js"></script>
        
      

  </div>
  </div>

</div>

       

		
    </div>
            <!-- /page content -->

        </div>
    </div>
</body>

</html>
