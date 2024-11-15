
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
	<form action="SaveMaindetails" method="post">
		<div class="container">
			<div class="row" style=" height:40px; ">
				<div class="col-lg-2" ></div>
				<div class="col-lg-8 header-styles" style=" Background-color:#f58220; text-align:center; padding-top:10px;">
					<h3>Case Details</h3>
				</div>
				<div class="col-lg-2" ></div>
			</div>
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					CASE ID:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="cid" id="cid"  pattern="[0-9]{10,10}"  required placeholder="Enter Case Id" style="outline:none; height:30px; width:100%; padding-left:10px" maxlength="20">
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					PATIENT NAME:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="pn" id="pn" required placeholder="Enter Patient Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-2" >
					DOCTOR NAME:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="dn" id="dn" required placeholder="Enter Doctor Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					CLINIC NAME:
				</div>
				<div class="col-lg-1" style="padding-top:4px;">
				<button type="button" id="AddNew3" style="outline:none;border:none;"><i class="fas fa-plus" style="color:green"></i></button>
				</div>
				<div class="col-lg-6" id="ClinicNameDiv" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="cni1" id="cni1"  placeholder="Enter Clinic Name" style="outline:none; height:60px; width:100%; padding-left:10px; padding-top:0px !important; word-wrap: break-word" >
				</div>
				<div class="col-lg-2" ></div>
			</div>
			
			<div class="row" style="margin-top:20px;">
				<div class="col-lg-2" ></div>
				<div class="col-lg-1" >
					ADDRESS:
					
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
					PHONE NUMBER:
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
				<div class="col-lg-2" >
					CRM NAME:
				</div>
				<div class="col-lg-6" style="padding-left:10px; padding-right:10px;">
					<input type="text" name="crm" id="crm" placeholder="Enter CRM Name" style="outline:none; height:30px; width:100%; padding-left:10px" >
				</div>
				<div class="col-lg-2" ></div>
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
			
			<div class="row" style="margin-top:20px;margin-bottom:50px;">
				<div class="col-lg-4" ></div>
				<div class="col-lg-3" >
				<button type="submit" value="Save" class="btn btn-secondary" >Submit</button>
				</div>
				<div class="col-lg-3" >
				<button type="button" class="btn btn-secondary" id="savetodraft">Save to Draft</button>
				</div>
				<div class="col-lg-2"></div>
			</div>
			
		</div>
	</form>
	

 <!-- font awesome link -->
 <script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
 
        <script src="https://kit.fontawesome.com/5b8969f8ab.js"></script>
        <script src="script/script.js"></script>
        
        
        
<script>





$("#savetodraft").click(function(){

	 var cid = $("#cid").val();
	 
	 if(cid=="")
		 {
		 	alert("Please Enter CaseId");
		 	return false;
		 }
	 
	 else{
	 var pn = $("#pn").val();
	 var dn = $("#dn").val();
	 
	 var i=2
	 
	 //var cni1=$("#cni1").val();
	 var cni1=$("#cni1").val();
	 
	 var addr1 = $("#addr1").val();
	 var pno1 = $("#pno1").val();
	 var crm = $("#crm").val();
	 var dno = $("#dno").val();
	 var bcn1 = $("#bcn1").val();
	 var badd1 = $("#badd1").val();
	 var bgn = $("#bgn").val();
	 var cat = $("#cat").val();
	 var ua = $("#ua").val();
	 var la = $("#la").val();
	 var oth = $("#oth").val();
	 
	 //alert("cid "+cid+" || "+pn+" || "+dn+" || "+cni1+" || "+addr1+" || "+pno1+" || "+crm+" || "+dno+" || "+bcn1+" || "+badd1+" || "+bgn+" || "+cat+" || "+ua+" || "+la+" || "+oth)
	 
	 
	$.ajax({
	
	    type : 'POST',
		data : {cid:cid,pn:pn,dn:dn,cni1:cni1,addr1:addr1,pno1:pno1,crm:crm,dno:dno,bcn1:bcn1,badd1:badd1,bgn:bgn,cat:cat,ua:ua,la:la,oth:oth},
		url : 'SaveDraft',
		success : function(responseText) {
		var x=responseText;
		alert(x);
		location='Dashboard.jsp';
			
		}
	 
	});
	 }
});
</script>


  </div>
  </div>

</div>

   <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog"> 

    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <table style="width:100%">
        <tr>
        <td width="30%"></td>
        <td width="40%" align="center" style="font-weight:bold; font-size:16px;">Workflow</td>
         <td width="30%" align="right"> <button  id="popupclose" type="button" class="close" data-dismiss="modal">&times;</button></td>
          </tr>
        </table>  
        </div>
        <div class="modal-body">
        <div class="embed-responsive embed-responsive-4by3">
  <!--  <iframe class="embed-responsive-item" src="${pageContext.request.contextPath}/Images/Features Walk Through_x264.mp4" frameborder="0" allowfullscreen></iframe>-->
         <video id="watchdemoVid" width="480" height="360" controls>
   
   </video>
        </div>
        </div>
       
      </div>
      
    </div>
  </div>
               

		
            </div>
            <!-- /page content -->

        </div>

    </div>




</body>

</html>
